//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\.CoverOT.mqh>
//+------------------------------------------------------------------+
//|                                                       Ct_Size.mqh|
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//|             Class C_CHART::BEGIN                                 |2721 line class  C_CHART start
//+------------------------------------------------------------------+
/* Do not use tickvalue by itself.
 * You place the stop where it needs to be - where the reason for the trade is no longer valid. E.g. trading a support bounce the stop goes below the support.
 * Account Balance * percent = RISK = (OrderOpenPrice - OrderStopLoss)*DIR * OrderLots * DeltaPerlot (Note OOP-OSL includes the SPREAD)
 * Do NOT use TickValue by itself - DeltaPerlot
 * You must normalize lots properly and check against min and max.
 * You must also check FreeMargin to avoid stop out
 * ================================
 * 1)Using Points
 * [Lots from Points] = ([1 % Risk in Account Currency GBP] * [GBP to Quote Rate]) / [StopSize in Points] / [Point] / [LotSize]
 * where [StopSize in Points] = [StopSize 2ATR(15)] / [Point]
 * //================================
 * 2)Using Tick Size / Tick Value
 * Lots from Ticks = [1 % Risk in Account Currency GBP] / ([StopSize in Ticks] * [Tick Value GBP])
 * where [StopSize in Ticks] = [StopSize 2ATR(15)] / [TickSize]
 * [Tick Value GBP] is per LOT
 //==================================
 */
//--- money management types
enum MM
{         MM_FIXED_LOT,
          MM_RISK_PERCENT,
          MM_FIXED_RATIO,
          MM_FIXED_RISK,
          MM_FIXED_RISK_PER_POINT, //
};
struct Pair// required symbol information
{         string Name;// currency pair
          double SwapBuy;// buy swap
          double SwapSell;// sell swap
          double TickValue;// profit from 1 movement tick of a 1-lot position
          double TickSize;// tick size in the price
          double PointX;// point size in the price
          double ContractSize;// contract size in the base deposit currency
          double Margin;// margin for opening 1 lot
};
enum GetRiskedType
{         GetRiskedSize,
          GetRiskedCashAmount,
          GetRiskedStopLossCount,
          GetRiskedPipAmount,//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_Size
{
///StopLossUnit   = pip=0.0001
///TakeProfitUnit = pip=0.0001
///LotsUnit       = lot=10,000$ box
          /*
          //===============================================
          The most common types of money management are
          //===============================================
          fixed lot,                                       Most trading robots you will encounter mainly use fixed lotsizing. This is the simplest method.
          MM_FIXED_LOT:               volume =  0.01 ; break;
          //===============================================
          risk percentage,                                 Risk percentage is a method where the volume of the next position is calculated based on a
                                                           percentage of the account balance along with the stop loss in points.
                                                           For example, if a trader has $10000 in his account and decided to risk only 5% per trade, you would
                                                           only lose a maximum of $500 per trade if his order hits stop loss.
                                                           using this method, one has to multiply the balance with the account percentage and divide the result
                                                           by the stop loss in points and then divide by the tick value of the instrument.
                                                           This is good for strategies were the initial stop loss for each order can change over time.
                                                           Take note of how the tick value for the instrument was retrieved using the MarketInfo() function
          MM_RISK_PERCENT: if(sl > 0) volume = ((balance * risk_mm1) / sl) / tick_value; break;
          //===============================================
          fixed ratio,                                     This method is solely based on the size of the account balance.
                                                           It does not consider using the stop loss in its calculations, which makes it good for strategies that
                                                           have a fixed stop loss level per trade.
                                                           ratio = lots_mm2 / per_mm2   //(1/1000)

          MM_FIXED_RATIO:             volume =   balance * lots_mm2 / per_mm2; break;
          //===============================================
          fixed risk a                                     In fixed risk money management,
                                                           the losses that can be sustained while hitting an order's stop loss remains constant,
                                                           regardless of the value of the stop loss.
                                                           This means that if the stop loss of the order keeps changing you will always have a fixed risk and the orders
                                                           will often vary in terms of trade size. The fixed risk amount is expressed in the deposit currency.
                                                           risk_mm3 =50$ always


          MM_FIXED_RISK: if(sl > 0)   volume = (risk_mm3 / tick_value) / sl; break;
          //===============================================
          fixed risk per point.                            Fixed risk per point is similar to the fixed risk money management method.
                                                           However, unlike the latter, this money management method maintains a fixed risk per point movement.
                                                           So here, we are directly setting what change in profit or loss we want per point change in the chart price.
                                                           Note that in this example, the calculated lot size is very large
          MM_FIXED_RISK_PER_POINT:    volume = risk_mm4 / tick_value; break; ///
          //===============================================
          These are all the methods that we will implement on our money management function.
          //===============================================
          //===============================================
          //===============================================
          */
//=======================================================================//Ct_Size Manager
protected:
          int           UpdateSecound;//

          bool          KeyRun;//

          double        CalcRiskAmount__FixedLots_SLpoints(string  currSymbol, double  RiskLots, double  RiskPoints);
          double        CalcRiskPoints__FixedLots_RiskAmount(string currSymbol, double  RiskLots, double  RiskAmount);
          double        CalcRiskLots__FixedRiskPoints_RiskAmount(string currSymbol, double  RiskPoints, double  RiskAmount);
          double        CalcRiskLots__FixedRiskPoints_RiskAmount2(string currSymbol, double  RiskPoints, double  RiskAmount);
          double        LotsBasedOnSL(double entry, double SL, double maxRiskDollars);
          double        CalcRiskLots__PipAmount(int SLDictanceCount, double maxRiskDollarsAmount);
          double        LotsBasedMargine();
          bool          GetLot()  ;
          double        GetCorrectLot(string f_symbol, double f_value);  // financial instrument // volume value
//=======================================================================
public:
          double        Calculate_LotSize();
//=======================================================================
public:
          void          Ct_Size();
          void          ~Ct_Size() {};
          bool          Update(double f_Lot_Fixed_Inp);
          //double      RLotSize_RAmount_RSLCount( double RiskAmount, double RiskStopLossCount);
          double        RLotSize_RAmount_RSLCount(GetRiskedType Type, double RiskAmount, double RiskStopLossCount, double RiskSize = 0, double RiskPipAmount = 0);
          double        SetPutLotsOK(string FuncCom, bool VerifyJust = false, double LotsCom = 0, bool _VerifyPutLots = true,  bool CalcPutLots = true);
          bool          VerifyPutLots(double LotsCom);
          //-----------------------------------------------------------------------------------------------------------------------------------------------------
          double        XCalcLotSize(bool argDynamicLotSize, double argEquityPercent, double argStopLoss, double argFixedLotSize, double argRiskAmount = 0);
          double        SetPutLots(string FuncCom, bool VerifyJust = false, double LotsCom = 0, bool VerifyPutLots = true,  bool CalcPutLots = true);
          double        XVerifyLotSize(double argLotSize);
          int           PointsToPip(int Points_);
          double        mm(MM method, string SymbolCom, double lots, int sl, double risk_mm1, double lots_mm2, double per_mm2, double risk_mm3, double risk_mm4);
          bool          Lot(double Lots = 0, double Lots_New = 0, int Percent = 0);
//=======================================================================
          MM            money_management;//--- money management params
          double        mm1_risk;
          double        mm2_lots;
          double        mm2_per;
          double        mm3_risk;
          double        mm4_risk;
          //-------------------------------------------------------------------------------------------------
          double        BrokerizePositionSize(double position_size);//verify lots//ct_Drive.TDD.st_Size.Curr_Lots==PositionSize//
          double        GetLotSizeByRisk_SL(double Risk, double SL);
          double        LotsFromPoints(double stoploss_in_quote_currency, double Risk_percent);
          double        LotsFromTicks(double stoploss_in_quote_currency, double Risk_percent);
          double        LotsFromPrice(double stoploss_in_quote_currency, double Risk_percent);
          bool          CalculateUnadjustedPositionSize;// false
          //-------------------------------------------------------------------------------------------------
          double        AdvancedMMHistory();
          double        LotsOptimized();
//=======================================================================
          int           LastClosedBarIndex(string f_symbol = "", int f_cmd = -1, int f_magic = -1, ENUM_TIMEFRAMES f_tf = PERIOD_CURRENT);
          double        LastClosedLot(string f_symbol = "", int f_cmd = -1, int    f_magic = -1);
          double        LastClosedPriceClose(string f_symbol = "", int f_cmd = -1, int f_magic = -1);
          double        LastClosedPriceOpen(string f_symbol = "", int f_cmd = -1, int f_magic = -1);
          double        LastClosedProfit(string f_symbol = "", int f_cmd = -1, int    f_magic = -1);
          int           LastClosedTicket(string f_symbol = "", int f_cmd = -1, int f_magic = -1);
          datetime      LastClosedTimeClose(string f_symbol = "", int f_cmd = -1, int f_magic = -1);
          int           LastClosedType(string f_symbol = "", int f_magic = -1); // identyfikator
          int           LastOpenedBarIndex(string f_symbol = "", int f_cmd = -1, int f_magic = -1, ENUM_TIMEFRAMES f_tf = PERIOD_CURRENT);
          double        LastOpenedLot(string f_symbol = "", int f_cmd = -1, int f_magic = -1);
          double        LastOpenedPriceOpen(string f_symbol = "", int f_cmd = -1, int f_magic = -1);
          double        LastOpenedProfit(string f_symbol = "", int f_cmd = -1, int f_magic = -1);
          int           LastOpenedTicket(string f_symbol = "", int f_cmd = -1, int f_magic = -1);
          datetime      LastOpenedTimeOpen( string f_symbol = "", int f_cmd = -1, int f_magic = -1);
          int           LastOpenedType(string f_symbol = "", int f_magic = -1);
          int           TicketByLot(string f_symbol = "", int f_cmd = -1, int f_magic = -1, double f_lotMin = 0, double f_lotMax = 0); // górna granica wolumenu
          int           TicketMaxLoss(string f_symbol = "", int f_cmd = -1, int f_magic = -1);
          int           TicketMaxProfit(string f_symbol = "", int f_cmd = -1, int f_magic = -1);
          bool          IsPositionOpenedCurrentBar ( ENUM_TIMEFRAMES f_timeFrame = PERIOD_CURRENT, string f_symbol = "", int f_cmd = - 1, int f_magic = - 1 );                  // identifier
//=======================================================================///validate put lot
          double        GetSumLotOpenedPositions(string f_symbol = "", int f_cmd = -1, int f_magic = -1);
          int           GetSumPipsOpenedPositions ( string f_symbol = "", int f_cmd = - 1, int f_magic = - 1 );
          double        GetSumProfitOpenedPositions ( string f_symbol = "", int f_cmd = - 1, int f_magic = - 1 );
          double        DifferencePositionOpenPriceFromLiveMarketPrice(int f_ticket); // ticket
//=======================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Size::Ct_Size()
{         UpdateSecound = 0; KeyRun = false;   ;                                  // Broker LotStep//
//
}
//+------------------------------------------------+
//|                                                |
//|              Calculation Functions             |
//|                                                |
//+------------------------------------------------+
//==================================================================================================================

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Calculate optimal lot size                                       |
//+------------------------------------------------------------------+
double Ct_Size::LotsOptimized()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//================================================================== Inputs
          double Lots          = 0.1;
          double MaximumRisk   = 0.02;
          double DecreaseFactor = 3;
          int    MovingPeriod  = 12;
          int    MovingShift   = 6;
//==================================================================//--- select lot size
          double lot = Lots;
          int    orders = HistoryTotal();   // history orders total
          int    losses = 0;                // number of losses orders without a break
//================================================================== select lot size
          lot = NormalizeDouble(AccountFreeMargin() * MaximumRisk / 1000.0, 1);
//================================================================== calcuulate number of losses orders without a break
          if(DecreaseFactor > 0)
          {         for(int i = orders - 1; i >= 0; i--)
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY) == false)
                              {         Print("Error in history!"); break; }
                              if(OrderSymbol() != Symbol() || OrderType() > OP_SELL)continue;
                              //---
                              if(OrderProfit() > 0) break;
                              if(OrderProfit() < 0) losses++;//
                    }
                    double lotCalc = lot - lot * losses / DecreaseFactor;
                    if(losses > 1)lot = NormalizeDouble(lotCalc, 1); //
          }
//================================================================== return lot size
          if(lot < 0.1) lot = 0.1;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return(lot); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Size::Update(double f_Lot_Fixed_Inp)//checking & Setting Lots
{         //Alert("+====================================================+" + __FUNCTION__); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          ct_Drive.TDD.ct_RiskReward.GetRisk();
          if(!ct_Drive.TDD.st_Size.IsManualPutLots || ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskAmount_Ok)
          {         ct_Drive.TDD.st_Size.FixedPutLots                    = f_Lot_Fixed_Inp; //Alert("!KeyManualPutLots || bank_Pad.Set_RiskAmount_Ok",__FUNCSIG__); //
                    ct_Drive.TDD.st_Size.Curr_Lots                       = SetPutLotsOK(__FUNCSIG__); //
          } //
          else if(ct_Drive.TDD.st_Size. IsManualPutLots)
          {         if(ObjectFind(0, "S_EDIT " + "Set Lots..") >= 0)
                    {         if(Utilities.StringLieraled("S_EDIT " + "Set Lots.." )) { ObjectSetString(0, "S_EDIT " + "Set Lots..", OBJPROP_TEXT, "Set Lots.."); }
                              if(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_Lots_Ok) {ct_Drive.TDD.st_Size.INP = Utilities.DescToDouble("S_EDIT " + "Set Lots..");           /* Alert("ct_Drive.TDD.st_Size.INP: ", ct_Drive.TDD.st_Size.INP);*/  } }
                    ct_Drive.TDD.st_Size.Curr_Lots                         = SetPutLotsOK(__FUNCSIG__, true, ct_Drive.TDD.st_Size.INP);                                 //Alert("Set Lots.Edite ct_Drive.TDD.st_Size.INP: ", ct_Drive.TDD.st_Size.INP); //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return true;//
} //

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::SetPutLotsOK(string FuncCom, bool VerifyJust = false, double LotsCom = 0, bool _VerifyPutLots = true,  bool CalcPutLots = true)
{         if(!PulseOne.ExecuteONPulse(true, UpdateSecound)) return(ct_Drive.TDD.st_Size.Curr_Lots);
          double PutLotsCalced = 0;   if(VerifyJust) { if(VerifyPutLots(LotsCom))return ct_Drive.TDD.st_Size.Curr_Lots ;}
          if(!VerifyJust)
          {         if( ct_Drive.TDD.st_Size.IsDynamicPutLots  &&  (ct_Drive.TDD.ct_StopLoss.RiskedStopLossPoints > 0) )
                    {         if(CalcPutLots)
                              {         //==============================================================
                                        if(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskAmount_Ok && (ct_Drive.TDD.ct_RiskReward.Inp_RiskedCashAmount > -1))
                                        {         ct_Drive.TDD.ct_RiskReward.RiskedCashAmount = ct_Drive.TDD.ct_RiskReward.Inp_RiskedCashAmount; /* Alert("Directly by inp 1RR_.RiskedCashAmount: ", ct_Drive.TDD.ct_RiskReward.RiskedCashAmount);*/
                                                  ///
                                        }
                                        else
                                        {         if(ct_Drive.TDD.ct_RiskReward.RiskCashPercent > 0)ct_Drive.TDD.ct_RiskReward.RiskCashPercentDecimal = ct_Drive.TDD.ct_RiskReward.RiskCashPercent / 100;
                                                  ct_Drive.TDD.ct_RiskReward.RiskedCashAmount = ct_Drive.TDD.ct_Account.Account_Data.EquityAmount * ct_Drive.TDD.ct_RiskReward.RiskCashPercentDecimal ; //Alert("UnDirectly by Formul 2RR_.RiskedCashAmount: ", ct_Drive.TDD.ct_RiskReward.RiskedCashAmount);
                                                  //
                                        }
                                        //==============================================================
                                        if(ct_Drive.TDD.ct_RiskReward.HaveRiskMoney())
                                        {         ct_Drive.TDD.ct_RiskReward.RiskedSizeLot = PutLotsCalced =  RLotSize_RAmount_RSLCount( GetRiskedSize, ct_Drive.TDD.ct_RiskReward.RiskedCashAmount, ct_Drive.TDD.ct_StopLoss.RiskedStopLossPoints);
                                                  //Alert("ct_Drive.TDD.ct_RiskReward.RiskedCashAmount: ", ct_Drive.TDD.ct_RiskReward.RiskedCashAmount, " ct_Drive.TDD.ct_StopLoss.RiskedStopLossPoints: ", ct_Drive.TDD.ct_StopLoss.RiskedStopLossPoints, " PutLotsCalced: ", PutLotsCalced);//
                                        }
                                        if(ct_Drive.TDD.ct_RiskReward.HaveRiskSize())
                                        {         //
                                                  ct_Drive.TDD.ct_RiskReward.RiskedSizeDollar = ct_Drive.TDD.ct_RiskReward.RiskedSizeLot * 100000; ///
                                                  ct_Drive.TDD.ct_RiskReward.RiskedCashAmount = RLotSize_RAmount_RSLCount( GetRiskedCashAmount, ct_Drive.TDD.ct_RiskReward.RiskedCashAmount, ct_Drive.TDD.ct_StopLoss.RiskedStopLossPoints, PutLotsCalced); //
                                                  //Alert("ct_Drive.TDD.ct_RiskReward.RiskedCashAmount: ", ct_Drive.TDD.ct_RiskReward.RiskedCashAmount, " ct_Drive.TDD.ct_RiskReward.RiskedSizeDollar: ", ct_Drive.TDD.ct_RiskReward.RiskedSizeDollar); //
                                        }
                                        //==============================================================
                              }
                              if(VerifyPutLots(PutLotsCalced))return ct_Drive.TDD.st_Size.Curr_Lots;//
                    } //
                    else { if(VerifyPutLots(ct_Drive.TDD.st_Size.FixedPutLots))return ct_Drive.TDD.st_Size.Curr_Lots; }  //////Alert("ct_Drive.TDD.st_Size.FixedPutLots: ", ct_Drive.TDD.st_Size.FixedPutLots); //
          }///
          return CalcPutLots;//
}//
//+------------------------------------------------------------------+//SetPutLots_O???>>>Free get verifiyedcalcLotsize
//|                                                                  |_2_
//+------------------------------------------------------------------+
double Ct_Size::SetPutLots(string FuncCom, bool VerifyJust = false, double LotsCom = 0, bool _VerifyPutLots = true,  bool CalcPutLots = true) //stop trading,,expert  (double x = 0)  manuell.
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          //Alert("+====================================================+" + __FUNCTION__ + (string)__LINE__); //
          if(!PulseOne.ExecuteONPulse(true, UpdateSecound)) return(ct_Drive.TDD.st_Size.Curr_Lots);
          //Alert("+====================================================+" + __FUNCTION__ + (string)__LINE__); //
          //Print("+====================================================+" + __FUNCTION__ + (string)__LINE__); //
          //=======================================================================
          double PutLotsCalced = 0;
          //=======================================================================
          //bool MiniLot  = LotStep == 0.1; //
          //bool MicroLot = LotStep == 0.01; //
          //bool NanoLot  = LotStep == 0.001; //
          //--------------------------------------------------------------
          //# Calculating Lot Sizing or Stop Loss based on Risk
          //#1 Value of a signale point movment in a given symbol
          //#2 Value of potential loss for a given trade
          //#3 How Many points can be Risked in stop loss
          //#4 How many lots can be traded
          //--------------------------------------------------------------
          /*
          TickSize: 0.001 TickValue: 0.1   argDynamicLotSize: true argEquityPercent: 20.0 argStopLoss: 200.0 argFixedLotSize: 0.01 RiskAmount: 500.0 argStopLoss: 200.0 LotSizeIN: 25.0 xauusd
          TickSize: 1e-05 TickValue: 10.0 argDynamicLotSize: true argEquityPercent: 20.0 argStopLoss: 200.0 argFixedLotSize: 0.01 RiskAmount: 500.0 argStopLoss: 200.0 LotSizeIN: 0.25 eru/usd f
          TickSize: 0.0001 TickValue: 10.0 argDynamicLotSize: true argEquityPercent: 20.0 argStopLoss: 200.0 argFixedLotSize: 0.01 RiskAmount: 500.0 argStopLoss: 200.0 LotSizeIN: 0.25 eru/usd
          TickSize: 0.001 TickValue: 8.7394 argDynamicLotSize: true argEquityPercent: 20.0 argStopLoss: 200.0 argFixedLotSize: 0.01 RiskAmount: 500.0 argStopLoss: 200.0 LotSizeIN: 0.28606 usd/jpy f
          TickSize: 0.01 TickValue: 0.01 argDynamicLotSize: true argEquityPercent: 20.0 argStopLoss: 200.0 argFixedLotSize: 0.01 RiskAmount: 500.0 argStopLoss: 200.0 LotSizeIN: 250.0 btc
          TickSize: 1e-05 TickValue: 8.0681  argDynamicLotSize: true argEquityPercent: 20.0 argStopLoss: 200.0 argFixedLotSize: 0.01 RiskAmount: 500.0 argStopLoss: 200.0 LotSizeIN: 0.30986 usd/cad f
          TickSize: 0.0001 TickValue: 5.0 argDynamicLotSize: true argEquityPercent: 20.0 argStopLoss: 200.0 argFixedLotSize: 0.01 RiskAmount: 500.0 argStopLoss: 200.0 LotSizeIN: 0.5 xagusd.f
          TickSize: 0.0001 TickValue: 0.1393  argDynamicLotSize: true argEquityPercent: 20.0 argStopLoss: 200.0 argFixedLotSize: 0.01 RiskAmount: 500.0 argStopLoss: 200.0 LotSizeIN: 17.946125  eur/rur
          TickSize: 1e-05 TickValue: 10.0 argDynamicLotSize: true argEquityPercent: 20.0 argStopLoss: 200.0 argFixedLotSize: 0.01 RiskAmount: 500.0 argStopLoss: 200.0 LotSizeIN: 0.25  btc/usd

          */
          //==============================================================
          string SymbolDesc = ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_DESCRIPTION;//SymbolInfoString(Symbol(), SYMBOL_DESCRIPTION); //
          if(false)
          {         ct_Drive.TDD.ct_Market_Symbol.PointValueByTickSize("EURJPY.F", __FUNCSIG__); //must existed in market watch
                    ct_Drive.TDD.ct_Market_Symbol.PointValueByTickSize("EURGBP.F", __FUNCSIG__); //
                    ct_Drive.TDD.ct_Market_Symbol.PointValueByTickSize("AUDUSD.F", __FUNCSIG__); //
                    ct_Drive.TDD.ct_Market_Symbol.PointValueByTickSize("ct_XAUUSD.F", __FUNCSIG__); //
          }
          //====================================
          if(false)
          {         string  currSymbol                = Symbol();
                    double  PointValueByTickSize      = ct_Drive.TDD.ct_Market_Symbol.PointValueByTickSize(Symbol());
                    double  RiskPoints                = 100;
                    double  RiskLots                  = 1.55;
                    double  RiskAmount                = PointValueByTickSize * RiskLots * RiskPoints; //
                    RiskAmount = CalcRiskAmount__FixedLots_SLpoints(currSymbol, RiskLots, RiskPoints);
                    RiskPoints = CalcRiskPoints__FixedLots_RiskAmount(currSymbol, RiskLots, RiskAmount);
                    RiskLots   = CalcRiskLots__FixedRiskPoints_RiskAmount(currSymbol, RiskPoints, RiskAmount);
                    RiskLots   = CalcRiskLots__FixedRiskPoints_RiskAmount2(currSymbol, RiskPoints, RiskAmount); //
          } //
          //Comment("TICKVALUE = " + MarketInfo(Symbol(), MODE_TICKVALUE) + ", 1 / Bid = " + (1 / Bid));
          //I found a formula: profit = Lots x MarketInfo(Symbol(), MODE_TICKVALUE) x TP
          //Tick value is the value of one tick of the quote currency (accessible via MODE_TICKSIZE), in the account deposit currency.
          //It's the method the broker uses to 'translate' your profit on trading any pair into the currency in your own account, so it is sort of like an 'exchange rate'.
          int    SLPoints                        = -1; //
          int    RiskedStopLossPointsCount  = -1; //
          int    RiskedStopLossPipsCount     = PointsToPip(RiskedStopLossPointsCount);
          double TickValue                       = -1;//ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKVALUE;//profit per pip for currencys
          double ProfitPerPip                    = -1;//TickValue;//
          double ProfitPerPoint                  = -1;//TickValue;//
          double ProfitPerOnPip                  = -1;//(ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / StopLossPoints);//<<ProfitPerPip>>200/100>>2$ per one pip<<
          double ProfitPerOnPoint                = -1;//(ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / StopLossPoints);//<<ProfitPerPip>>200/100>>2$ per one pip<<
          double ProfitPerOnTick                 = -1;//(ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / TickValue);//<<P1rofitPerPip>>200/100>>2$ per one pip<<
          double TickSize_                       = -1;//ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE;
          double ProfitPerOnTickSizeCom          = -1;//ProfitPerOnTick * TickSize_; //
          //=====================================================================
          double PipStandardValueAmountInOneLot  = -1;//for USD base currency
          double PipMiniValueAmountInOneLot      = -1;//for USD base currency
          double PipMicroValueAmountInOneLot     = -1;//for USD base currency
          //=====================================================================
          double LossAmountPerOneLot        = -1;
          //==================================================u
          double RiskedPointsPartCashAmount = -1;//= ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / SLPoints;//Every Point Own CashAmount//Risk per pip
          double RiskedTickPartCashAmount   = -1;//= ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / TickValue;//Every Tick Own CashAmount// Risk per Tick
          double each_Tick_Change_Points         = -1;//= SLPoints / TickValue ;
          double each_point_Tick_move            = -1;//= SLPoints * TickValue ;
          double RiskedLot                       = -1;//= RiskedPointsPartCashAmount / 10; // 10 for standard based account// mini 1//micro 0.1//nano 0.01///
          //==============================================================
          if(VerifyJust)VerifyPutLots(LotsCom);
          if(!VerifyJust)
          {         //Alert(ct_Drive.TDD.st_Size.IsDynamicPutLots, (ct_Drive.TDD.ct_StopLoss.RiskedStopLossPoints > 0), "  ", __FUNCSIG__); //
                    if( ct_Drive.TDD.st_Size.IsDynamicPutLots  &&  ct_Drive.TDD.ct_StopLoss.RiskedStopLossPoints > 0)
                    {         //Alert(ct_Drive.TDD.st_Size.IsDynamicPutLots, (ct_Drive.TDD.ct_StopLoss.RiskedStopLossPoints > 0), "  ", __FUNCSIG__); //
                              if(CalcPutLots)//(Equity%==Risk%)
                              {         //==============================================================
                                        if(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_RiskAmount_Ok && (ct_Drive.TDD.ct_RiskReward.Inp_RiskedCashAmount > -1))
                                        {         ct_Drive.TDD.ct_RiskReward.RiskedCashAmount = ct_Drive.TDD.ct_RiskReward.Inp_RiskedCashAmount; /* Alert("Directly by inp 1RR_.RiskedCashAmount: ", ct_Drive.TDD.ct_RiskReward.RiskedCashAmount);*/
                                                  ///
                                        }
                                        else
                                        {         ct_Drive.TDD.ct_RiskReward.RiskedCashAmount = ct_Drive.TDD.ct_Account.Account_Data.EquityAmount * ct_Drive.TDD.ct_RiskReward.RiskCashPercent / 100; //Alert("UnDirectly by Formul 2RR_.RiskedCashAmount: ", ct_Drive.TDD.ct_RiskReward.RiskedCashAmount);
                                                  //
                                        }
                                        /*//==============================================================================================================================================================================================================================
                                        //   Equalation Formula >> RiskedCashAmount = LotUnit * DitanceUnit
                                        //   Const 10/100,000 = 0.0001   >>  Mean every pip Value ==10$ by USD Base curancy
                                        //   Const OnelotCashAmount      = 100,000$  OneLotUnitCashAmount        = 100,000$
                                        //   DitanceUnitCount            = 200Pip
                                        //   OneCashAmountForaPip        = 100,000$
                                        //   RiskedCashAmount            = 500$
                                        //   DitanceUnitCashAmount       = OneLotUnitCashAmount/DitanceUnitCount  >>100,000/200 == 500 DitanceUnitValue  >>
                                        //   DitanceUnitRiskedCashAmount = XLotUnitRiskedCashAmount/DitanceUnitCount  >>500/200 == 2.5 DitanceUnitValue  >>
                                        //   2.5/500 = 0.005L
                                        //>> 100,000*0.005 = 500$ >>>currect
                                        //   UsedLot = ((RiskedCashAmount / DitanceUnit)/(OneLotUnitCashAmount / DitanceUnit))
                                        //   OneLotUnitCashAmount= (RiskedCashAmount/UsedLot)
                                        //>> 2.5/100,000 = 0.000025 >> Every Pip From OneLotUnit
                                        //>> 500/100,000 = 0.0050>> 50 Pip  >>0.005 Lot
                                        //--->> 200*10 =2000>>   500/2000= 0.25 Lot   >>>>>>>>> UsedLot == (RiskedMoney /(PipValue * StopLossPipDistanceCount))
                                        //==============================================================================================================================================================================================================================
                                        //                      >> LotUnit          = RiskedCashAmount / DitanceUnit    //>>> How Far Distance the used lot is Lower
                                                                                                                        //>>> How much CashAmount Grater the used lot is Grater
                                                                >> DitanceUnit      = RiskedCashAmount / LotUnit        //>>> How much CashAmount Grater the used DitanceUnit is Grater
                                                                                                                        //>>> How much LotUnit    Grater the used DitanceUnit is Lower
                                                                                                                        //============================================================
                                                                                                                        //>>> 500$/1p  == 500.0 lot >> 500*100,000 = 50,000,000$
                                                                                                                        //>>> 500$/500p == 1.0   lot >> 1*100,000   = 100,000$
                                                                                                                        //============================================================
                                                                                                                        if Lot not grater than 0.05 >>> how much need?
                                                                                                                        500L/1p=500$
                                                                                                                        1L/500p=500$
                                                                                                                        500L/500p = 1$
                                        ///==============================================================================================================================================================================================================================
                                        Lots = AccountBalance() * Risk / StopLoss / (MarketInfo(Symbol(), MODE_TICKVALUE);
                                        Lots = NormalizeDouble(MathFloor(Lots * 100) / 100, 2);

                                        *///==============================================================================================================================================================================================================================
                                        PipStandardValueAmountInOneLot  = 10;//for USD base currency
                                        PipMiniValueAmountInOneLot      = 1;//for USD base currency
                                        PipMicroValueAmountInOneLot     = 0.1;//for USD base currency
                                        if(PipStandardValueAmountInOneLot > 0)
                                        {         //
                                                  LossAmountPerOneLot = PipStandardValueAmountInOneLot * RiskedStopLossPipsCount;////10$*50=500
                                                  ///AllMoney need to have for one Lots// if you have 20$ then ratio calcing>
                                                  //my Risked money how much of one lot money?
                                                  //One lot nedd 100$ by stoplossPipCount>>       100>>>>
                                                  //my Risked money 50$ from Riskratio in trade>>>  50$>>
                                                  //>>>How much is diffrence from one Lot? <<<  0.50>>>> then we can use half lots to trade.
                                                  //
                                                  //
                                        }
                                        //==============================================================
                                        if(ct_Drive.TDD.ct_RiskReward.HaveRiskMoney())//Have any RiskMoney /
                                        {         //
                                                  double  RiskPipStepAmount = ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / RiskedStopLossPointsCount; //>>>RiskStepsAmount Diffrence from LotStep(PipAmount)
                                                  PutLotsCalced = RiskedLot = ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / RiskedStopLossPointsCount;  //50/50 =1 lot or every point caused 1 dolar for u  by one lot order put/
                                                  PutLotsCalced = RiskedLot = ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / LossAmountPerOneLot; //    // 50/500=0.1 lot
                                                  //
                                                  PutLotsCalced = RiskedLot = XVerifyLotSize(XCalcLotSize(ct_Drive.TDD.st_Size.IsDynamicPutLots, ct_Drive.TDD.ct_RiskReward.RiskCashPercent, ct_Drive.TDD.ct_StopLoss.RiskedStopLossPoints, ct_Drive.TDD.st_Size.FixedPutLots, ct_Drive.TDD.ct_RiskReward.RiskedCashAmount));
                                                  //
                                        }
                                        //==============================================================
                                        if(false)//====================================ct_Drive.TDD.ct_StopLoss.RiskedStopLossPoints
                                        {         SLPoints                       = 100; //
                                                  RiskedStopLossPointsCount = 100; //
                                                  TickValue                      = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKVALUE;//profit per pip for currencys
                                                  ProfitPerPip                   = TickValue;//
                                                  ProfitPerPoint                 = -1;//TickValue;//
                                                  //===============================================================================================================================
                                                  ProfitPerOnPoint               = (ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / RiskedStopLossPointsCount);//<<ProfitPerPoint>>200/100>>2$ per one pip<<
                                                  ProfitPerOnPip                 = (ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / RiskedStopLossPipsCount);//<<ProfitPerPip>>200/100>>2$ per one pip<<
                                                  //===============================================================================================================================
                                                  ProfitPerOnTick                = (ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / TickValue);//<<P1rofitPerPip>>200/100>>2$ per one pip<<
                                                  TickSize_                      = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE;
                                                  ProfitPerOnTickSizeCom         = ProfitPerOnTick * TickSize_; //
                                                  //Orchard Forex>>  insome formula the SLPoints  TickValue how can explain these diffrence
                                                  //-------------------------------------------------------RiskedStopLossPoints
                                                  RiskedPointsPartCashAmount = ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / SLPoints;//Every Point Own CashAmount//Risk per pip
                                                  RiskedTickPartCashAmount = ct_Drive.TDD.ct_RiskReward.RiskedCashAmount / TickValue;//Every Tick Own CashAmount// Risk per Tick
                                                  each_Tick_Change_Points = SLPoints / TickValue ;
                                                  each_point_Tick_move = SLPoints * TickValue ;
                                                  //-------------------------------------------------------
                                                  RiskedLot = RiskedPointsPartCashAmount / 10; // 10 for standard based account// mini 1//micro 0.1//nano 0.01///
                                                  //-------------------------------------------------------
                                                  ; Alert("_SymbolDesc: ", SymbolDesc, "_TickValue: ", TickValue, "_TickSize_: ", TickSize_, "_SLPoints: ", SLPoints,
                                                          "_RiskedPointsPartCashAmount: ", RiskedPointsPartCashAmount,
                                                          "_RiskedTickPartCashAmount: ", RiskedTickPartCashAmount,
                                                          "_each_Tick_Change_Points: ", each_Tick_Change_Points,
                                                          "_each_point_Tick_move: ", each_point_Tick_move,
                                                          "_RiskedLot: ", RiskedLot); //
                                                  //---------------------------------------------------------------------------------------------
                                                  double RiskAmount_ = 1, RiskStopLossCount_ = 1;
                                                  double RiskPipStepAmount_ = RiskAmount_ / RiskStopLossCount_;
                                                  if(TickValue == 0)
                                                  {         //========================================================
                                                            TickValue += 0.0000000001;
                                                            if(false && ct_Drive.TDD.ct_Market_Symbol.Is_Fractional)                     {TickValue *= 10;}
                                                            if(false && (Point == 0.001 || Point == 0.00001))   {TickValue *= 10;} //fractional brocker 3 or 5 digit//pipet*10 = pip//
                                                            if(Digits == 3 || Digits == 5)                      {TickValue *= 10;}
                                                            //========================================================
                                                            Alert("_TickValue == 0__RR_.RiskedCashAmount: ", ct_Drive.TDD.ct_RiskReward.RiskedCashAmount, "___RiskedStopLossPointsCount: ", RiskedStopLossPointsCount, "___TickValue: ", TickValue, "__Point: ", Point); //
                                                            {         //
                                                                      PutLotsCalced = (ProfitPerOnTick) / TickValue; //
                                                                      //   LotSize = (RiskAmount / argStopLoss) / TickValue; }
                                                                      //   LotSize = (RiskPipStepAmount_) / TickValue; }
                                                            }         //
                                                  }
                                                  else
                                                  {         //========================================================
                                                            if(false && ct_Drive.TDD.ct_Market_Symbol.Is_Fractional)                     {TickValue *= 10;}
                                                            if(false && (Point == 0.001 || Point == 0.00001))   {TickValue *= 10;} //fractional brocker 3 or 5 digit//pipet*10 = pip//
                                                            if(Digits == 3 || Digits == 5)                      {TickValue *= 10;}
                                                            //========================================================
                                                            Alert("_TickValue != 0__RR_.RiskedCashAmount: ", ct_Drive.TDD.ct_RiskReward.RiskedCashAmount, "___RiskedStopLossPointsCount: ", RiskedStopLossPointsCount, "___TickValue: ", TickValue, "__Point: ", Point); //
                                                            {         //
                                                                      PutLotsCalced = (ProfitPerOnTick) / TickValue; //
                                                                      //   LotSize = (RiskAmount / argStopLoss) / TickValue; }
                                                            }         //
                                                  } //
                                                  Alert("___RR_.RiskedCashAmount: ", ct_Drive.TDD.ct_RiskReward.RiskedCashAmount, "___StopLossRP: ", ct_Drive.TDD.ct_StopLoss.RiskedStopLossPoints, "___TickValue: ", TickValue, "__Point: ", Point, "__CalcPutLots: ", PutLotsCalced); ////
                                        }//
                              }//=============================================================================================================================================
                              VerifyPutLots(PutLotsCalced); //
                    }
                    else {if(!VerifyJust) return (ct_Drive.TDD.st_Size.Curr_Lots = SetPutLots(__FUNCSIG__, true, ct_Drive.TDD.st_Size.FixedPutLots));} ////Alert("ct_Drive.TDD.st_Size.FixedPutLots: ", ct_Drive.TDD.st_Size.FixedPutLots); //
          }///
          //=========================================================================================================================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
//=======================================================================
          return(ct_Drive.TDD.st_Size.Curr_Lots);// global editing   //return for frist runing step
//=======================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Size::VerifyPutLots(double LotsCom)
{         //=============================================================================================================================================
          double PutLotsVerifed = 0;
          if(LotsCom == EMPTY_VALUE) {LotsCom = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT;    Alert("LotsCom == EMPTY_VALUE LotsCom: ", LotsCom ); } //
          PutLotsVerifed = LotsCom;
          if((LotsCom < ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT ) || (LotsCom > ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT)) //out of range
          {         if(LotsCom < ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT) {PutLotsVerifed = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT; }
                    if(LotsCom > ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT) {PutLotsVerifed = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT; }   //// 0.01//0.01
          }//
          (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP == 0.1) ? (PutLotsVerifed = NormalizeDouble( PutLotsVerifed, 1)) : (PutLotsVerifed = NormalizeDouble( PutLotsVerifed, 2)); //normalizeds two accuracy
//Alert("LotsCom: ", LotsCom, "__PutLotsVerifed: ", PutLotsVerifed, "__Symbol_MinLot: ", ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT, "__Market_.MaxLot: ", ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT); //
          ct_Drive.TDD.ct_RiskReward.RiskedSizeLot = ct_Drive.TDD.st_Size.Curr_Lots = PutLotsVerifed ; //Alert("VerifyPutLots: ", PutLotsVerifed); //
          if(ct_Drive.TDD.ct_RiskReward.HaveRiskSize())
          {         //
                    ct_Drive.TDD.ct_RiskReward.RiskedSizeDollar = ct_Drive.TDD.ct_RiskReward.RiskedSizeLot * 100000; ///
                    ct_Drive.TDD.ct_RiskReward.RiskedCashAmount = RLotSize_RAmount_RSLCount( GetRiskedCashAmount, ct_Drive.TDD.ct_RiskReward.RiskedCashAmount, ct_Drive.TDD.ct_StopLoss.RiskedStopLossPoints, ct_Drive.TDD.ct_RiskReward.RiskedSizeLot); //
                    //Alert("ct_Drive.TDD.ct_RiskReward.RiskedCashAmount: ", ct_Drive.TDD.ct_RiskReward.RiskedCashAmount, " ct_Drive.TDD.ct_RiskReward.RiskedSizeDollar: ", ct_Drive.TDD.ct_RiskReward.RiskedSizeDollar); //
          }
          //=============================================================================================================================================
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::RLotSize_RAmount_RSLCount(GetRiskedType Type, double RiskAmount, double RiskStopLossCount, double RiskSize = 0, double RiskPipAmount = 0)
{         //===================================================================
          double LotSizeIN, TickValue, TickSize;
          TickValue = ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_TRADE_TICK_SIZE;
          TickSize  = ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_TRADE_TICK_SIZE;
          //===========================================================================CURRENCY_MARGIN
          LotSizeIN = 0.0001;
          //===========================================================================
          double PipAmount = TickValue + 0.0000001;///avoid zero diving///
          if(Point == 0.001 || Point == 0.00001) PipAmount = TickValue * 10;//Worked For Curancy Exchange
          if(ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_BASE == "USD")     PipAmount = 10;
          if(ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_PROFIT == "USD")   PipAmount = 10;
          //===========================================================================
          //>>>Formulator>> LotSizeIN = (RiskAmount / RiskStopLossCount) / PipAmount;
          //===========================================================================
          if(Type == GetRiskedSize ) //>>>>>>>>>>>>UnderStanding>>>RiskPipStepAmount/PipAmountBaseCurrancyForDepositCurrency >>
          {         if( RiskStopLossCount > 0)
                    {         double RiskPipStepAmount = RiskAmount / RiskStopLossCount;  //>>>RiskStepsAmount Diffrence from LotStep(PipAmount)
                              double OneLotAmount      = RiskStopLossCount * PipAmount; //>>>Classic amount Diffrence
                              //==========================================================================================
                              if( ct_Drive.TDD.ct_Bank.CFDLot && ct_Drive.TDD.ct_Market_Symbol.SymbolTypeDesc() == "CFD") OneLotAmount = Close[0];
                              //==========================================================================================
                              LotSizeIN = (RiskPipStepAmount) / PipAmount; ////>>>Steps Diffrence
                              LotSizeIN = (RiskAmount) / OneLotAmount; // //>>>Classic amount Diffrence
                              //==========================================================================================
                              if( ct_Drive.TDD.ct_Bank.UseLeverage && ct_Drive.TDD.ct_Market_Symbol.SymbolTypeDesc() == "CFD") LotSizeIN = LotSizeIN * AccountLeverage() / 100 ;///maximum use lot by leverage.
                              //==========================================================================================
                              if(false)if(((RiskPipStepAmount) / PipAmount) == ((RiskAmount) / OneLotAmount) ) Alert("You are cool Hello World");//
                              //LotSizeIN = (RiskAmount / RiskStopLossCount_) / PipAmount = (RiskAmount) / (RiskStopLossCount_ * PipAmount) //
                              //----------------------------------------------
                              if(false)          ///unknowen PipAmount  jus stopLose used with PipAmount
                              {         OneLotAmount = 100000;
                                        double Known_PipAmount;
                                        Known_PipAmount = OneLotAmount / RiskStopLossCount;//100,000/200=500$Per OneRiskStopLoss
                                        double LotSizeIN_Known_PipAmoun = PipAmount / Known_PipAmount ; //
                              }
                              if(VerifyPutLots(LotSizeIN)) return ct_Drive.TDD.st_Size.Curr_Lots;
                              //
                    }//
          } //
          if(Type == GetRiskedCashAmount )
          {         ////LotSizeIN = (RiskAmount / RiskStopLossCount) / PipAmount;
                    if(RiskSize > 0)  ///Need just if have any oisition size to cals
                    {         if(RiskSize > 0)                                                             {RiskAmount = RiskSize * RiskStopLossCount * PipAmount; }         //>>0.25*200*10=500 >>OK
                              if(ct_Drive.TDD.ct_Account._Mql_.Equity > 0 || ct_Drive.TDD.ct_Account._Mql_.Balance > 0 || ct_Drive.TDD.ct_Account._Mql_.Credit > 0  )     {ct_Drive.TDD.ct_RiskReward.RiskCashPercentDecimal = RiskAmount / ct_Drive.TDD.ct_Account._Mql_.Equity;       ct_Drive.TDD.ct_RiskReward.RiskCashPercent = ct_Drive.TDD.ct_RiskReward.RiskCashPercentDecimal * 100;} ///Equityamount for seted amount ///  if connected have Equity
                              else if(ct_Drive.TDD.ct_Account.Account_Data.EquityAmount > 0)                                           {ct_Drive.TDD.ct_RiskReward.RiskCashPercentDecimal = RiskAmount / ct_Drive.TDD.ct_Account.Account_Data.EquityAmount; ct_Drive.TDD.ct_RiskReward.RiskCashPercent = ct_Drive.TDD.ct_RiskReward.RiskCashPercentDecimal * 100;}//not connected
                              //Alert(" RiskAmount:", RiskAmount, " RiskSize:", RiskSize, " RiskStopLossCount:", RiskStopLossCount, " PipAmount:", PipAmount);
                              //
                              return( RiskAmount); //
                    } //
          } //
          if(Type == GetRiskedStopLossCount )
          {         //
                    //
          } //
          if(Type == GetRiskedPipAmount )
          {         //
                    //
          } //
//===================================================================
          return(LotSizeIN); //
}
//+------------------------------------------------------------------+
//|                        Calc Lot Size                             |1 Good For eur/usd
//+------------------------------------------------------------------+
double Ct_Size::XCalcLotSize(bool argDynamicLotSize, double argEquityPercent, double argStopLoss, double argFixedLotSize, double argRiskAmount = 0)
{         /************************************************
          **  500/200/0.01  = 250
          ** (500/200)/0.01 = 250  <<<<<<
          **  500/(200/0.01)= 0.025
          ** (500/200)*0.01 = 0.025  <<<<<<
          **  500/(200*0.01)= 250
          *************************************************/
          string SymbolBASE     = SymbolInfoString(Symbol(), SYMBOL_CURRENCY_BASE);
          string SymbolPROFIT   = SymbolInfoString(Symbol(), SYMBOL_CURRENCY_PROFIT);
          string SymbolDESC     = SymbolInfoString(Symbol(), SYMBOL_DESCRIPTION);
          /**************************************************
          GLDUSD   TickValue = 1          TickSize 0.00001 Point 0.00001 >>>CFD
          ct_XAUUSD.F TickValue = 0.1        TickSize 0.001   Point 0.01    >>>CFD
          XAGUSD.F TickValue = 0.50       TickSize 0.0001  Point 0.001   >>>CFD
          BTC      TickValue = 0.01       TickSize 0.01    Point 0.01    >>>Crypto
          BTCUSD   TickValue = 1          TickSize 0.00001 Point 0.00001 >>>Crypto
          EURUSD.F TickValue = 1          TickSize 0.00001 Point 0.00001 >>>Forex
          EURUSD   TickValue = 10         TickSize 0.0001  Point 0.0001  >>>Forex
          EURAUD.F TickValue = 0.74       TickSize 0.00001 Point 0.00001 >>>Forex
          EURGBP   TickValue = 13.73      TickSize 0.0001  Point 0.0001  >>>Forex
          EURJPY.F TickValue = 0.87       TickSize 0.001   Point 0.001   >>>Forex
          EURNZD.F TickValue = 0.70       TickSize 0.00001 Point 0.00001 >>>Forex
          CADCHF.F TickValue = 1.08       TickSize 0.00001 Point 0.00001 >>>Forex
          USDDKK.F TickValue = 0.15       TickSize 0.00001 Point 0.00001 >>>Forex
          ETHUSD.F TickValue = 1          TickSize 0.00001 Point 0.00001 >>>Forex
          GBPUSD   TickValue = 10         TickSize 0.0001  Point 0.0001  >>>Forex
          AUDUSD.F TickValue = 1          TickSize 0.00001 Point 0.00001 >>>Forex
          AUDCAD.F TickValue = 0.80       TickSize 0.00001 Point 0.00001 >>>Forex
          *************************************************
          *************************************************/
          double LotSizeIN, RiskAmount, TickValue, TickSize;
          if(argDynamicLotSize && argStopLoss > 0)
          {         RiskAmount = AccountEquity() * (argEquityPercent / 100);
                    TickValue = MarketInfo(Symbol(), MODE_TICKVALUE); TickSize = MarketInfo(Symbol(), MODE_TICKSIZE);//Tick value in the deposit currency
                    //===================================================================
                    double PipAmount = TickValue + 0.0000001;///avoid zero diving///
                    if(Point == 0.001 || Point == 0.00001) PipAmount = TickValue * 10;//Worked For Curancy Exchange
                    if(SymbolBASE == "USD")     PipAmount = 10;
                    if(SymbolPROFIT == "USD")   PipAmount = 10;
                    //===================================================================
                    double maxRiskDollars = 500; RiskAmount = maxRiskDollars = argRiskAmount; //<<test
                    LotSizeIN = (RiskAmount / argStopLoss) / PipAmount;
                    if(true)//>>>>>>>>>>>>UnderStanding>>>RiskPipStepAmount/PipAmountBaseCurrancyForDepositCurrency >>
                    {         double RiskAmount_       = RiskAmount; double RiskStopLossCount_ = argStopLoss;
                              double RiskPipStepAmount = RiskAmount_ / RiskStopLossCount_;  //>>>RiskStepsAmount Diffrence from LotStep(PipAmount)
                              double OneLotAmount      = RiskStopLossCount_ * PipAmount; //>>>Classic amount Diffrence
                              //==========================================================================================
                              if( ct_Drive.TDD.ct_Bank.CFDLot && ct_Drive.TDD.ct_Market_Symbol.SymbolTypeDesc() == "CFD") OneLotAmount = Close[0];
                              //==========================================================================================
                              LotSizeIN = (RiskPipStepAmount) / PipAmount; ////>>>Steps Diffrence
                              LotSizeIN = (RiskAmount_) / OneLotAmount; // //>>>Classic amount Diffrence
                              //==========================================================================================
                              if( ct_Drive.TDD.ct_Bank.UseLeverage && ct_Drive.TDD.ct_Market_Symbol.SymbolTypeDesc() == "CFD") LotSizeIN = LotSizeIN * AccountLeverage() / 100 ;///maximum use lot by leverage.
                              //==========================================================================================
                              if(false)if(((RiskPipStepAmount) / PipAmount) == ((RiskAmount_) / OneLotAmount) ) Alert("You are cool Hello World");//
                              //LotSizeIN = (RiskAmount_ / RiskStopLossCount_) / PipAmount = (RiskAmount_) / (RiskStopLossCount_ * PipAmount) //
                              //----------------------------------------------
                              if(false)          ///unknowen PipAmount  jus stopLose used with PipAmount
                              {         OneLotAmount = 100000;
                                        double Known_PipAmount;
                                        Known_PipAmount = OneLotAmount / RiskStopLossCount_;//100,000/200=500$Per OneRiskStopLoss
                                        double LotSizeIN_Known_PipAmoun = PipAmount / Known_PipAmount ; //
                              }
                              //
                    } //
          }
          else LotSizeIN = argFixedLotSize; return(LotSizeIN); //
}
//+------------------------------------------------------------------+\\\auto correction
//|                       Verify Lot Size                            |2///need to check geted values>>>MODE_MINLOT
//+------------------------------------------------------------------+
double Ct_Size::XVerifyLotSize(double argLotSize)
{         if(argLotSize < ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT)      {         argLotSize = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT; }
          else if(argLotSize > ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT) {         argLotSize = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT; }
          if(ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP == 0.1) {argLotSize = NormalizeDouble(argLotSize, 1); }
          else                      {argLotSize = NormalizeDouble(argLotSize, 2); }
          return(argLotSize); //
}
//+------------------------------------------------------------------+
//|                                                                  |LotsBasedOnSL(1800, 200, 500);
//+------------------------------------------------------------------+
double  Ct_Size::LotsBasedOnSL(double entry, double SL, double maxRiskDollars)
{
//===============================================================================================
          double stopDist, stopPips, slDollars, lotSize, _TICKVALUE, _point, _PipValue;
          stopDist      = MathAbs(entry - SL);                                  //>>> 1600
          stopPips      = stopDist / Point;                                     //>>> 160,000
//===============================================================================================
          _TICKVALUE    = MarketInfo(Symbol(), MODE_TICKVALUE);
          _point = _Point; if((_Digits == 3) || (_Digits == 5)) {         _point *= 10; }// Broker digits
          _PipValue     = (((SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_VALUE)) * _point) / (SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_SIZE)));
          slDollars     = stopPips * _TICKVALUE;///<<<<<<<<<< use Multipy       //>>> 16,000
//===============================================================================================
          lotSize       = NormalizeDouble(maxRiskDollars / slDollars, 2);       //>>> 0.03            dollar to dollar>>>>
          //Alert(" _PipValue: ", _PipValue, " _TICKVALUE: ", _TICKVALUE, " Point: ", Point, " stop pips: ", stopPips, " dollars: ", slDollars, " lots: ", lotSize, " lots2: ", lotSize2);
//===============================================================================================
          return (lotSize);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::CalcRiskLots__PipAmount(int SLDictanceCount, double maxRiskDollarsAmount)///confirmed by baby pips calculator////https://howtotradeblog.com/lot-size-calculator/
{         double PositionSize           = 0;
          double TickValue              = MarketInfo(Symbol(), MODE_TICKVALUE); //
          double PipAmount              = TickValue * 10;///10$
          double PipAmountPerOneLot     = TickValue * 10;
          bool BaseCurrency_            = true; /// "XXX/USD""
          if(BaseCurrency_)PipAmount = 10;///>>>must defined by base currency to calc ok.
          //=====================================================
          double OneLotTradeAmount      =  SLDictanceCount * PipAmount;
          PositionSize                  = maxRiskDollarsAmount / OneLotTradeAmount;
          PositionSize                  = XVerifyLotSize(PositionSize);
          return PositionSize;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double  Ct_Size::LotsBasedMargine()
{         int Pips = 165; // Stop loss distance from open order
          double _Risk = 0.02; // Free margin fraction you want to risk for the trade
          bool useAccountBalance = true; // Check to read the actual free margin of your balance, uncheck to specify it
          int AccountBalance = 2000; // Specify here a simulated balance value
          double point;
          ///======================================
          // Broker digits
          point = _Point;
          if((_Digits == 3) || (_Digits == 5)) {         point *= 10; }
          ///======================================
          string CommentString = "";
          string DepositCurrency = AccountInfoString(ACCOUNT_CURRENCY);
          double freeMargin = 0;
          if(useAccountBalance) {         freeMargin = AccountInfoDouble(ACCOUNT_FREEMARGIN); }
          else                  {         freeMargin = AccountBalance; }
          ///======================================
          //double PipValue = ((((SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_VALUE))*point)/(SymbolInfoDouble(Symbol(),SYMBOL_TRADE_TICK_SIZE))) * LotSize);
          double PipValue = (((SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_VALUE)) * point) / (SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_SIZE)));
          double lots = _Risk * freeMargin / (PipValue * Pips);
          // Truncate lot quantity to 2 decimal digits without rounding it
          lots = floor(lots * 100) / 100;
          ///======================================
          //CommentString += "\n" + "Your free margin: " + DepositCurrency + " " + DoubleToString(freeMargin, 2) + "\n";
          //CommentString += "Risk selected: " + DoubleToString(Risk * 100, 0) + "%\n";
          //CommentString += "Risk selected: " + DepositCurrency + " " + DoubleToString(Risk * freeMargin, 2) + "\n";
          //CommentString += "-----------------------------------------------------------------\n";
          //CommentString += "Value of one pip trading 1 lot of " + Symbol() + ": " + DepositCurrency + " " + DoubleToString(PipValue, 3) + "\n";
          //CommentString += "Max lots of " + Symbol() + " to trade while risking " + (string)Pips + " pips: " + DoubleToString(lots, 2) + "\n";
          //CommentString += "-----------------------------------------------------------------\n";
          //Comment(CommentString);
          ///======================================
          return lots ;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  Ct_Size::GetLot()
{         string Symb           = Symbol();
          double One_Lot        = MarketInfo(Symb, MODE_MARGINREQUIRED);
          double Min_Lot        = MarketInfo(Symb, MODE_MINLOT);
          double Step           = MarketInfo(Symb, MODE_LOTSTEP);
          double Free           = AccountFreeMargin();
          double _Lots          = 0.01;
          double Lots_New;
          double Percent  = 10;
//--------------------------------------------------------------- 3 --
          if (_Lots > 0)
          {         double Money = _Lots * One_Lot;
                    if(Money <= AccountFreeMargin())    Lots_New = _Lots;
                    else                                Lots_New = MathFloor(Free / One_Lot / Step) * Step; //
          }
//--------------------------------------------------------------- 4 --
          else
          {         if (Percent > 100)  Percent = 100;
                    if (Percent == 0)   Lots_New = Min_Lot;
                    else                Lots_New = MathFloor(Free * Percent / 100 / One_Lot / Step) * Step;  //
          }
//--------------------------------------------------------------- 5 --
          if (Lots_New < Min_Lot)                       Lots_New = Min_Lot;
          if (Lots_New * One_Lot > AccountFreeMargin()) {    /*     // ct_Inform(11, 0, Min_Lot); return(false); */ }
          return(true); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::LotsFromPoints(double stoploss_in_quote_currency, double Risk_percent)
{         //Risk (percent of account equity in quote currency)
          double Risk_in_account_currency       = AccountEquity() * Risk_percent / 100;
          double Risk_in_quote_currency         = ct_Drive.TDD.ct_Account.AccountCurrencyToQuoteCurrency(Risk_in_account_currency);
          double stoploss_points                = stoploss_in_quote_currency / _Point;     //Stoploss (points in quote currency)
          double point_Risk_in_quote_currency   = Risk_in_quote_currency / stoploss_points;  //PointValueByTickSize in quote currency
          double notional_trade_size            = point_Risk_in_quote_currency / _Point;      //Notional Trade Size (barrels, bushels, stockprice, etc.)
          double lots                           = notional_trade_size / MarketInfo(_Symbol, MODE_LOTSIZE);      // *** Lots Required ***
          return lots;//
}
//Method 2 - Ticks
double Ct_Size::LotsFromTicks(double stoploss_in_quote_currency, double Risk_percent)
{         double Risk_in_account_currency       = AccountEquity() * Risk_percent / 100; //Risk (percent of account equity in quote currency)
          double Risk_in_quote_currency         = ct_Drive.TDD.ct_Account.AccountCurrencyToQuoteCurrency(Risk_in_account_currency);
          double stoploss_ticks                 = stoploss_in_quote_currency / MarketInfo(_Symbol, MODE_TICKSIZE);  //Stoploss (points in quote currency)
          //TickValue per LOT is stated in Account Currency for Forex and in Quote Currency for everything else!
          double tickvalue_per_lot_in_account_currency  = MarketInfo(_Symbol, MODE_TICKVALUE) * ( ct_Drive.TDD.ct_Bank.IsForex() ? 1 : ct_Drive.TDD.ct_Account.QuoteCurrencyToAccountCurrency(1));
          double Risk_in_account_currency_per_lot       = stoploss_ticks * tickvalue_per_lot_in_account_currency;
          // *** Lots Required ***
          double lots                                   = Risk_in_account_currency / Risk_in_account_currency_per_lot;
          return lots;//
}
//Method 3 - Price
double Ct_Size::LotsFromPrice(double stoploss_in_quote_currency, double Risk_percent)
{         //Risk (percent of account equity in quote currency)
          double Risk_in_account_currency               = AccountEquity() * Risk_percent / 100;
          double Risk_in_quote_currency                 = ct_Drive.TDD.ct_Account.AccountCurrencyToQuoteCurrency(Risk_in_account_currency);
          //Notional Trade Size (barrels, bushels, stockprice, etc.)
          double notional_trade_size                    = Risk_in_quote_currency / stoploss_in_quote_currency;
          // *** Lots Required ***
          double lots                                   = notional_trade_size / MarketInfo(_Symbol, MODE_LOTSIZE);
          return lots;//
}
//******************************************************************************************************************************************************
//Note: 3 methods provided above and none are reliable with CFDs due to broker data issues (i.e. incorrect Point,ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, TickValue, and/or LotSize).
//******************************************************************************************************************************************************/
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Make sure position size complies with broker's limits.           |
//+------------------------------------------------------------------+
double Ct_Size::BrokerizePositionSize(double position_size)//verify lots
{         //int MinLot = 0; int ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT = 0 ; int  LotStep = 0; // //
          if(ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT < 0.001)Alert("ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT NotSet", __FUNCSIG__); //
          if (CalculateUnadjustedPositionSize) return(position_size); // Do not adjust if the input parameter says so.
          if (position_size < ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT)           { return(0); }// Not taking this trade, so PS = 0.
          else if (position_size > ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT)      { return(ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT); }
          double steps = 0;
          if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP != 0) steps = position_size / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP;
          if (MathAbs(MathRound(steps) - steps) < 0.00000001) steps = MathRound(steps);
          if (MathFloor(steps) < steps) return(MathFloor(steps) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP);
          return(position_size); //
}
//+------------------------------------------------------------------+
//| LotSize |
//+------------------------------------------------------------------+
double Ct_Size::GetLotSizeByRisk_SL(double _Risk, double SL)
{         double _StopLoss                      = SL / Point / 10;   ////(why)   for convert infracted Point given to real point/// (50/0.0001/10==5/0.00001)(500,000/10)(50,000)
          double _RiskeAmount                   = (_Risk / 100) * AccountBalance();
          double _Size                          = _RiskeAmount / 10 / _StopLoss;//>>>Size=40/100*500/10/50;
          if(_Size < ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT)            _Size = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT;
          if(_Size > ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT)            _Size = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT;
          return(NormalizeDouble(_Size, 2)); ////(10/(500/10))0.2
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::AdvancedMMHistory()
{
//============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_BANK Error", __LINE__, __FUNCTION__); //
//============================//============================
          int           i;
          double        AdvancedMM_Lots = 0;
          bool          profit1 = false;
          int           SystemHistoryOrders = 0;
          bool          profit2 = false;
          int           LO = 0;
//===============================================================================================
          for( i = 0; i < OrdersHistoryTotal(); i++)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                              if (OrderMagicNumber() ==  ct_Drive.TDD.ct_Bank.MagicNumber) SystemHistoryOrders++; //
          }
          if(SystemHistoryOrders < 2) return(AdvancedMM_Lots);
//===============================================================================================
          for( i = OrdersHistoryTotal() - 1; i >= 0; i--)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                              if (OrderMagicNumber() ==  ct_Drive.TDD.ct_Bank.MagicNumber)
                              {         if(OrderProfit() >= 0 && profit1) return(AdvancedMM_Lots);
                                        if( LO == 0)
                                        {         if(OrderProfit() >= 0) profit1 = true;
                                                  if(OrderProfit() < 0)  return(OrderLots());
                                                  LO = 1; //
                                        }
                                        if(OrderProfit() >= 0 && profit2) return(AdvancedMM_Lots);
                                        if(OrderProfit() >= 0) profit2 = true;
                                        if(OrderProfit() < 0 )
                                        {         profit1 = false;
                                                  profit2 = false;
                                                  AdvancedMM_Lots += OrderLots();//
                                        } //
                              } //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_BANK Error", __LINE__, __FUNCTION__); //
          return(AdvancedMM_Lots); //
//==========================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::Calculate_LotSize()// Calculate LotSize based on Equity, Risk (in %) and StopLoss in points
{         string textstring;
          double availablemoney;
          //==================
          double       _StopLossPipet           = 60;   // StopLoss from as many points. Default 60 (= 6 pips)
          double       _TakeProfit              = 100;  // TakeProfit from as many points. Default 100 (= 10 pip)
          double       _AddPriceGap             = 0;    // Additional price gap in points added to SL and TP in order to avoid Error 130
          //===============
          int lotdigit = 0;
          if ( ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP ==  1)   lotdigit = 0;
          if ( ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP == 0.1)  lotdigit = 1;
          if ( ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP == 0.01) lotdigit = 2;
          //================================================================ ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT
          availablemoney = AccountEquity();// Get available money as Equity
          double maxLot = MathMin ( MathFloor ( availablemoney * 0.98 / MarginForOneLot / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP ) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP, ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT );   // Maximum allowed Lot by the broker according to Equity. And we don't use 100% but 98%
          double minlot = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT;// Minimum allowed Lot by the broker
          //================================================================
          double lotsize = MathMin(MathFloor ( Risk / 102 * availablemoney / ( _StopLossPipet + _AddPriceGap ) / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP ) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP, ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT ); // Lot according to Risk. Don't use 100% but 98% (= 102) to avoid
          lotsize = lotsize * ct_Drive.TDD.ct_Market_Symbol.sub_multiplicator();
          lotsize = NormalizeDouble ( lotsize, lotdigit );
          textstring = ""; // Empty textstring
          //================================================================Cheacking value<<
          if ( MoneyManagement == FALSE )               // Use manual fix LotSize, but if necessary adjust to within limits
          {         lotsize = ManualLotsize;            // Set LotSize to manual LotSize
                    if ( ManualLotsize > ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT )       // Check if ManualLotsize is greater than allowed LotSize
                    {         lotsize = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT;
                              textstring = "Note: Manual LotSize is too high. It has been recalculated to maximum allowed " + DoubleToStr ( ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT, 2 );
                              Print ( textstring );
                              Comment ( textstring );
                              ManualLotsize = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT; //
                    }
                    else if ( ManualLotsize < minlot )lotsize = minlot; //
          }
          //================================================================
          return ( lotsize );///
          //-----------------
          if(false)
          {         /*  //double calculateLotSize()
                              string textstring;
                              double availablemoney;
                              double lotsize;
                              double maxlot;
                              double minlot;
                              int lotdigit = 0;
                              if (LotStep == 1)lotdigit = 0;
                              if (LotStep == 0.1)lotdigit = 1;
                              if (LotStep == 0.01)lotdigit = 2;
                              availablemoney = AccountEquity();  // Get available money as Equity
                              maxlot = MathMin(MathFloor(availablemoney * 0.98 / MarginForOneLot / LotStep) * LotStep, MaxLots);    // Maximum allowed Lot by the broker according to Equity. And we don't use 100% but 98%
                              minlot = MinLots;  // Minimum allowed Lot by the broker
                              // Lot according to Risk. Don't use 100% but 98% (= 102) to avoid
                              lotsize = MathMin(MathFloor(Risk / 102 * availablemoney / (StopLoss + AddPriceGap) / LotStep) * LotStep, MaxLots);
                              lotsize = lotsize * multiplicator();
                              lotsize = NormalizeDouble(lotsize, lotdigit);
                              textstring = "";  // Empty textstring
                              if (MoneyManagement == false)   // Use manual fix LotSize, but if necessary adjust to within limits
                              {         lotsize = ManualLotsize; // Set LotSize to manual LotSize
                                        if (ManualLotsize > maxlot)  // Check if ManualLotsize is greater than allowed LotSize
                                        {         lotsize = maxlot;
                                                  textstring = "Note: Manual LotSize is too high. It has been recalculated to maximum allowed " + DoubleToStr(maxlot, 2);
                                                  Print(textstring);
                                                  Comment(textstring);
                                                  ManualLotsize = maxlot;//
                                        }
                                        else if (ManualLotsize < minlot)
                                                  lotsize = minlot; //
                              }
                              return (lotsize);///*/
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::CalcRiskAmount__FixedLots_SLpoints(string  currSymbol, double  RiskLots, double  RiskPoints)
{         //====================================// situation 1, fixed lots and stop loss points,how much is at Risk
          double PointValueByTickSize    = ct_Drive.TDD.ct_Market_Symbol.PointValueByTickSize(currSymbol);
          double RiskAmount              = PointValueByTickSize * RiskLots * RiskPoints; //
          return RiskAmount;
          //PrintFormat("Risk amount for %s trading %f lots with Risk of %f points is %f", currSymbol, RiskLots, RiskPoints, RiskAmount); //.
          //====================================//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::CalcRiskPoints__FixedLots_RiskAmount(string currSymbol, double  RiskLots, double  RiskAmount)
{         //====================================// situation 2, fixed lots and Risk amount,how many points to set stop loss
          double PointValueByTickSize    = ct_Drive.TDD.ct_Market_Symbol.PointValueByTickSize(currSymbol);//
          double RiskPoints              = RiskAmount / ( RiskLots * PointValueByTickSize); //
          return RiskPoints;
          //PrintFormat("Risk points for %s trading %f lots placing %f at Risk is %f", currSymbol, RiskLots, RiskAmount, RiskPoints); //
          //====================================//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::CalcRiskLots__FixedRiskPoints_RiskAmount(string currSymbol, double  RiskPoints, double  RiskAmount)
{         //====================================// situation 3, fixed Risk amount and stop loss points,how many lots to trade
          double PointValueByTickSize     = ct_Drive.TDD.ct_Market_Symbol.PointValueByTickSize(currSymbol);
          double LossPerOneLotAmount      = PointValueByTickSize * RiskPoints ;
          double RiskLots                 = RiskAmount / LossPerOneLotAmount; // Percent from one Lot Value
          return RiskLots;
          //PrintFormat("Risk lots for %s value %f and stop loss at %f points is %f", currSymbol, RiskAmount, RiskPoints, RiskLots); //
          //====================================//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::CalcRiskLots__FixedRiskPoints_RiskAmount2(string currSymbol, double  RiskPoints, double  RiskAmount)
{         //====================================// situation 4, fixed Risk amount and stop loss points,how many lots to trade by deviding//
          double PointValueByTickSize    = ct_Drive.TDD.ct_Market_Symbol.PointValueByTickSize(currSymbol);
          double LossPerOneLotAmount     = 0;
          double RiskLots                = RiskAmount / (RiskPoints / PointValueByTickSize ); //Only if ticksize=1 point
          return RiskLots;
          // PrintFormat("Risk lots for %s value %f and stop loss at %f points is %f", currSymbol, RiskAmount, RiskPoints, RiskLots); //
          //====================================//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Size::LastClosedBarIndex(string          f_symbol = "",       // instrument finansowy
                                int             f_cmd = -1,          // typ pozycji
                                int             f_magic = -1,        // identyfikator
                                ENUM_TIMEFRAMES f_tf = PERIOD_CURRENT) // przedział czasowy
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT ||
                              f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)
                    return -1;
//---
          datetime f_timeClose = 0;
          for(int i = OrdersHistoryTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd   == OrderType()        || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderCloseTime() > f_timeClose)
                                                  f_timeClose = OrderCloseTime();
//---
          if(f_timeClose == 0)
                    return -1;
          else
                    return iBarShift(f_symbol, f_tf, f_timeClose, true); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::LastClosedLot(string f_symbol = "", // instrument finansowy
                              int    f_cmd = -1,  // typ pozycji
                              int    f_magic = -1) // identyfikator
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT || f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)return 0;
//---
          datetime f_timeClose = 0;
          double   f_lot = 0;
          for(int i = OrdersHistoryTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd   == OrderType()        || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderCloseTime() > f_timeClose)
                                        {         f_timeClose = OrderCloseTime();
                                                  f_lot = OrderLots(); }
          return f_lot; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::LastClosedPriceClose(string f_symbol = "", // instrument finansowy
                                     int    f_cmd = -1,  // typ pozycji
                                     int    f_magic = -1) // identyfikator
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT ||
                              f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)
                    return DBL_MAX;
//---
          datetime f_timeClose = 0;
          double   f_priceClose = DBL_MAX;
          for(int i = OrdersHistoryTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd   == OrderType()        || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderCloseTime() > f_timeClose)
                                        {         f_timeClose = OrderCloseTime();
                                                  f_priceClose = OrderClosePrice(); }
          return f_priceClose; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::LastClosedPriceOpen(string f_symbol = "", // instrument finansowy
                                    int    f_cmd = -1,  // typ pozycji
                                    int    f_magic = -1) // identyfikator
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT ||
                              f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)
                    return DBL_MAX;
//---
          datetime f_timeClose = 0;
          double   f_priceOpen = DBL_MAX;
          for(int i = OrdersHistoryTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd   == OrderType()        || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderCloseTime() > f_timeClose)
                                        {         f_timeClose = OrderCloseTime();
                                                  f_priceOpen = OrderOpenPrice(); }
          return f_priceOpen; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::LastClosedProfit(string f_symbol = "", // instrument finansowy
                                 int    f_cmd = -1,  // typ pozycji
                                 int    f_magic = -1) // identyfikator
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT ||
                              f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)
                    return DBL_MAX;
//---
          datetime f_timeClose = 0;
          double   f_profit = DBL_MAX;
          for(int i = OrdersHistoryTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd   == OrderType()        || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderCloseTime() > f_timeClose)
                                        {         f_timeClose = OrderCloseTime();
                                                  f_profit = OrderProfit(); }
          return f_profit;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Size::LastClosedTicket(string f_symbol = "", // instrument finansowy
                              int    f_cmd = -1,  // typ pozycji
                              int    f_magic = -1) // identyfikator
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT ||
                              f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)
                    return -1;
//---
          datetime f_timeTemp = 0;
          int      f_ticket = -1;
          for(int i = OrdersHistoryTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd   == OrderType()        || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderCloseTime() > f_timeTemp)
                                        {         f_timeTemp = OrderCloseTime();
                                                  f_ticket = OrderTicket(); }
          return f_ticket; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime Ct_Size::LastClosedTimeClose(string f_symbol = "", // instrument finansowy
                                      int    f_cmd = -1,  // typ pozycji
                                      int    f_magic = -1) // identyfikator
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT ||
                              f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)
                    return 0;
//---
          datetime f_timeClose = 0;
          for(int i = OrdersHistoryTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd   == OrderType()        || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderCloseTime() > f_timeClose)
                                                  f_timeClose = OrderCloseTime();
          return f_timeClose; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Size::LastClosedType(string f_symbol = "", // instrument finansowy
                            int    f_magic = -1) // identyfikator
{
//---
          datetime f_timeClose = 0;
          int      f_type = -1;
          for(int i = OrdersHistoryTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderCloseTime() > f_timeClose)
                                        {         f_timeClose = OrderCloseTime();
                                                  f_type = OrderType(); }
          return f_type; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Size::LastOpenedBarIndex(string          f_symbol = "",       // instrument finansowy
                                int             f_cmd = -1,          // typ pozycji
                                int             f_magic = -1,        // identyfikator
                                ENUM_TIMEFRAMES f_tf = PERIOD_CURRENT) // przedział czasowy
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT || f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)
                    return -1;
//---
          datetime f_timeOpen = 0;
          for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                              if((f_symbol == OrderSymbol() || f_symbol == "") && (f_cmd   == OrderType() || f_cmd == -1) && (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderOpenTime() > f_timeOpen)f_timeOpen = OrderOpenTime();
//---
          if(f_timeOpen == 0)
                    return -1;
          else
                    return iBarShift(f_symbol, f_tf, f_timeOpen, true);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::LastOpenedLot(string f_symbol = "", // instrument finansowy
                              int    f_cmd = -1,  // typ pozycji
                              int    f_magic = -1) // identyfikator
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT ||
                              f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)
                    return 0;
//---
          datetime f_timeOpen = 0;
          double   f_lot = 0;
          for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd   == OrderType()        || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderOpenTime() > f_timeOpen)
                                        {         f_timeOpen = OrderOpenTime();
                                                  f_lot = OrderLots(); }
          return f_lot; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::LastOpenedPriceOpen(string f_symbol = "", // instrument finansowy
                                    int    f_cmd = -1,  // typ pozycji
                                    int    f_magic = -1) // identyfikator
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT ||
                              f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)
                    return DBL_MAX;
//---
          datetime f_timeOpen = 0;
          double   f_priceOpen = DBL_MAX;
          for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd   == OrderType()        || f_cmd == -1) &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderOpenTime() > f_timeOpen)
                                        {         f_timeOpen = OrderOpenTime();
                                                  f_priceOpen = OrderOpenPrice(); }
          return f_priceOpen; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::LastOpenedProfit(string f_symbol = "", // instrument finansowy
                                 int    f_cmd = -1,  // typ pozycji
                                 int    f_magic = -1) // identyfikator
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT ||
                              f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)
                    return DBL_MAX;
//---
          datetime f_timeOpen = 0;
          double   f_profit = DBL_MAX;
          for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd   == OrderType()        || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderOpenTime() > f_timeOpen)
                                        {         f_timeOpen = OrderOpenTime();
                                                  f_profit = OrderProfit(); }
          return f_profit; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Size::LastOpenedTicket(string f_symbol = "", // instrument finansowy
                              int    f_cmd = -1,  // typ pozycji
                              int    f_magic = -1) // identyfikator
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT ||
                              f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)
                    return -1;
//---
          datetime f_timeOpen = 0;
          int      f_ticket = -1;
          for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd   == OrderType()        || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderOpenTime() > f_timeOpen)
                                        {         f_timeOpen = OrderOpenTime();
                                                  f_ticket = OrderTicket(); }
          return f_ticket; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime Ct_Size::LastOpenedTimeOpen(string f_symbol = "", // instrument finansowy
                                     int    f_cmd = -1,  // typ pozycji
                                     int    f_magic = -1) // identyfikator
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT || f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)return 0;
//---
          datetime f_timeOpen = 0;
          for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd   == OrderType()        || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderOpenTime() > f_timeOpen)
                                                  f_timeOpen = OrderOpenTime();
          return f_timeOpen; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Size::LastOpenedType(string f_symbol = "", // instrument finansowy
                            int    f_magic = -1) // identyfikator
{
//---
          datetime f_timeOpen = 0;
          int      f_type = -1;
          for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") && (f_magic == OrderMagicNumber() || f_magic == -1))
                                        if(OrderOpenTime() > f_timeOpen)
                                        {         f_timeOpen = OrderOpenTime();
                                                  f_type = OrderType(); }
          return f_type; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+PositionTicketByLot("EURUSD", OP_SELL, 12345, 0.01, 0.05);
int Ct_Size::TicketByLot(string f_symbol = "", // instrument finansowy
                         int    f_cmd = -1,   // typ pozycji
                         int    f_magic = -1, // identyfikator
                         double f_lotMin = 0, // dolna granica wolumenu volume lower limit
                         double f_lotMax = 0) // górna granica wolumenu
{         int f_ticket = -1;
//---
          double f_min = MathMin(NormalizeDouble(f_lotMin, 2),
                                 NormalizeDouble(f_lotMax, 2));
          double f_max = MathMax(NormalizeDouble(f_lotMin, 2),
                                 NormalizeDouble(f_lotMax, 2));
//---
          for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                    {         int f_type = OrderType();
                              if(f_type == OP_BUYLIMIT || f_type == OP_SELLLIMIT || f_type == OP_BUYSTOP  || f_type == OP_SELLSTOP)continue;
                              //---
                              if(
                                        (f_symbol == OrderSymbol()                      || f_symbol == "") &&
                                        (f_cmd == OrderType()                           || f_cmd == -1) &&
                                        (f_magic == OrderMagicNumber()                  || f_magic == -1) &&
                                        ((f_min <= OrderLots() && OrderLots() <= f_max) || (f_lotMin == 0 && f_lotMax == 0)))
                                        return OrderTicket(); }
          return f_ticket; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Size::TicketMaxLoss(string f_symbol = "", // instrument finansowy
                           int    f_cmd = -1,  // typ pozycji
                           int    f_magic = -1) // identyfikator
{         int    f_ticket = -1;
          double f_max = 0;
//---
          for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                    {         int f_type = OrderType();
                              if(f_type == OP_BUYLIMIT || f_type == OP_SELLLIMIT || f_type == OP_BUYSTOP  || f_type == OP_SELLSTOP)
                                        continue;
                              //---
                              if((f_symbol == OrderSymbol()     || f_symbol == "") &&
                                                  (f_cmd == OrderType()          || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                              {         double f_profit = OrderProfit() + OrderCommission() + OrderSwap();
                                        if(f_profit < f_max)
                                        {         f_max = f_profit;
                                                  f_ticket = OrderTicket(); } } }
          return f_ticket; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Size::TicketMaxProfit(string f_symbol = "", // instrument finansowy
                             int    f_cmd = -1,  // typ pozycji
                             int    f_magic = -1) // identyfikator
{         int    f_ticket = -1;
          double f_min = 0;
//---
          for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                    {         int f_type = OrderType();
                              if(f_type == OP_BUYLIMIT || f_type == OP_SELLLIMIT ||
                                                  f_type == OP_BUYSTOP  || f_type == OP_SELLSTOP)
                                        continue;
                              //---
                              if((f_symbol == OrderSymbol()     || f_symbol == "") &&
                                                  (f_cmd == OrderType()          || f_cmd == -1)    &&
                                                  (f_magic == OrderMagicNumber() || f_magic == -1))
                              {         double f_profit = OrderProfit() + OrderCommission() + OrderSwap();
                                        if(f_profit > f_min)
                                        {         f_min = f_profit;
                                                  f_ticket = OrderTicket(); } } }
          return f_ticket; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Size::IsPositionOpenedCurrentBar( ENUM_TIMEFRAMES f_timeFrame = PERIOD_CURRENT,  // time period
                    string           f_symbol = "",                  // financial instrument
                    int              f_cmd = - 1,                     // item type
                    int              f_magic = - 1 )                  // identifier
{         if (f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT || f_cmd == OP_BUYSTOP   || f_cmd == OP_SELLSTOP )return  false ;
// ---
          for ( int i = OrdersHistoryTotal () - 1 ; i >= 0 ; i--)
                    if ( OrderSelect (i, SELECT_BY_POS, MODE_HISTORY ))
                              if ((f_symbol == OrderSymbol () || f_symbol == "" ) && (f_cmd == OrderType () || f_cmd == - 1 ) && (f_magic == OrderMagicNumber () || f_magic == - 1 ))
                                        if (OrderOpenTime () >= iTime (f_symbol, f_timeFrame, 0 ))return  true;
// ---
          for ( int j = OrdersTotal () - 1 ; j >= 0 ; j--)
                    if ( OrderSelect (j, SELECT_BY_POS, MODE_TRADES ))
                              if ((f_symbol == OrderSymbol () || f_symbol == "" ) && (f_cmd == OrderType () || f_cmd == - 1 ) && (f_magic == OrderMagicNumber () || f_magic == - 1 ))
                                        if ( OrderOpenTime () >= iTime (f_symbol, f_timeFrame, 0 ))return  true;
// ---
          return  false ; ///
//1) Check whether a position has been opened on the current D1 candle for EURUSD, for sale and with the identifier 12345 :                                                                          //IsPositionOpenedCurrentBar ( PERIOD_D1 , "EURUSD" , OP_SELL , 12345 );
//2) Check whether a position has been opened on the current M30 candle for EURUSD, of any type and with the identifier 12345:                                                                       //IsPositionOpenedCurrentBar ( PERIOD_M30 , "EURUSD" , - 1 , 12345 );
//3) Check whether a position has been opened on the current candle of this quotation chart, where the MQL4 program was launched, for any financial instrument, for buy and with any identifier:     //IsPositionOpenedCurrentBar ( PERIOD_CURRENT , "" , OP_BUY );
//4) Check whether a position has been opened on the current candle of this quotation chart, where the MQL4 program was launched, for any financial instrument, of any type and with any identifier: //IsPositionOpenedCurrentBar ();
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+///validate put lot
double Ct_Size::GetCorrectLot ( string f_symbol, // financial instrument
                                double f_value)   // volume value
{         if (f_value < MarketInfo (f_symbol, MODE_MINLOT ))return  NormalizeDouble ( MarketInfo (f_symbol, MODE_MINLOT ), 2 );
          if (f_value > MarketInfo (f_symbol, MODE_MAXLOT ))return  NormalizeDouble ( MarketInfo (f_symbol, MODE_MAXLOT ), 2 );
          return  NormalizeDouble (f_value, 2 );
//1) Get the correct volume for EURUSD at 1.234. The function will return 1.23 :                                                                                GetCorrectLot ( "EURUSD", 1.234 );
//2) Get the correct volume for the current financial instrument and value 0.001. In case the minimum allowed volume is 0.01, the function will return 0.01:    GetCorrectLot ( _Symbol, 0.001 );
//3) Get the correct volume for the current financial instrument and the value 2.0149999999. The function will return 2.02 :                                    GetCorrectLot ( _Symbol, 2.0149999999 ); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::GetSumLotOpenedPositions(string f_symbol = "", // instrument finansowy
                    int    f_cmd = -1,  // typ pozycji
                    int    f_magic = -1) // identyfikator
{         if(f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT || f_cmd == OP_BUYSTOP  || f_cmd == OP_SELLSTOP)return 0;
//---
          double f_sumLot = 0;
          for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                              if((f_symbol == OrderSymbol()      || f_symbol == "") &&
                                                  (f_cmd    == OrderType()        || f_cmd    == -1) &&
                                                  (f_magic  == OrderMagicNumber() || f_magic  == -1))
                                        f_sumLot += OrderLots();
          return f_sumLot; //
//======================================================
//1) Find the total lot of open positions for EURUSD, for sale and with the ID 12345 :                                    GetSumLotOpenedPositions("EURUSD", OP_SELL, 12345);
//2) Find the total lot of open positions for EURUSD, of any type with the ID 12345 :                                     GetSumLotOpenedPositions("EURUSD", -1, 12345);
//3) Find the total lot of open positions for EURUSD, of any type and with any identifier :                               GetSumLotOpenedPositions("EURUSD");
//4) Find the total lot of open positions among all financial instruments, of any type and with the identifier 12345:     GetSumLotOpenedPositions("", -1, 12345);
//5) Find a total lot of open positions among all financial instruments, of any type and with any identifier:             GetSumLotOpenedPositions ();
//======================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Size::GetSumPipsOpenedPositions ( string f_symbol = "",  // financial instrument
                    int     f_cmd = -1,      // item type
                    int     f_magic = -1 )   // identifier
{         if (f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT || f_cmd == OP_BUYSTOP   || f_cmd == OP_SELLSTOP )return  INT_MAX ;
// ---
          int   f_sumPips = 0 ;
          bool f_isPositionExist = false ;
          for ( int i = OrdersTotal () - 1 ; i >= 0 ; i--)
                    if ( OrderSelect (i, SELECT_BY_POS, MODE_TRADES ))
                              if ((f_symbol == OrderSymbol () || f_symbol == "" ) && (f_cmd == OrderType () || f_cmd == - 1 ) && (f_magic == OrderMagicNumber () || f_magic == - 1 ))
                              {         f_isPositionExist = true ;
                                        if ( OrderType () == OP_BUY )///of fractional must *10for every pipet
                                                  f_sumPips += int (( MarketInfo ( OrderSymbol (), MODE_BID ) - OrderOpenPrice ()) *
                                                                    MathPow ( 10, MarketInfo ( OrderSymbol (), MODE_DIGITS )));
                                        if ( OrderType () == OP_SELL )
                                                  f_sumPips += int (( OrderOpenPrice () - MarketInfo ( OrderSymbol (), MODE_ASK )) *
                                                                    MathPow ( 10, MarketInfo ( OrderSymbol (), MODE_DIGITS ))); //
                              }
// ---
          if (f_isPositionExist) return f_sumPips;
          else  return  INT_MAX ; // Maximal value, which can be represented by int type//2147483647
          //=============================================
//1) Find the total number of open position points for EURUSD, for sale and with the identifier 12345 :                                 GetSumPipsOpenedPositions ( "EURUSD", OP_SELL, 12345 );
//2) Find the total number of open position points for EURUSD, of any type and with the identifier 12345 :                              GetSumPipsOpenedPositions ( "EURUSD", - 1, 12345 );
//3) Find the total number of open position points for EURUSD, of any type and with any identifier :                                    GetSumPipsOpenedPositions ( "EURUSD" );
//4) Find the total number of points for open positions among all financial instruments, of any type and with the identifier 12345 :    GetSumPipsOpenedPositions ( "", - 1, 12345 );
//5) Find the total number of points for open positions among all financial instruments, of any type and with any identifier :          GetSumPipsOpenedPositions ();
          //=============================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::GetSumProfitOpenedPositions ( string f_symbol = "",  // financial instrument
                    int     f_cmd = -1,      // item type
                    int     f_magic = -1 )   // identifier
{         if (f_cmd == OP_BUYLIMIT || f_cmd == OP_SELLLIMIT || f_cmd == OP_BUYSTOP   || f_cmd == OP_SELLSTOP )return  DBL_MAX ;
// ---
          double f_sumProfit = 0 ;
          bool    f_isPositionExist = false ;
          for ( int i = OrdersTotal () - 1 ; i >= 0 ; i--)
                    if ( OrderSelect (i, SELECT_BY_POS, MODE_TRADES ))
                              if ((f_symbol == OrderSymbol () || f_symbol == "" ) && (f_cmd == OrderType () || f_cmd == - 1 ) && (f_magic == OrderMagicNumber () || f_magic == - 1 ))
                              {         f_sumProfit += OrderProfit (); f_isPositionExist = true ; }
// ---
          if (f_isPositionExist) return f_sumProfit;
          else  return  DBL_MAX ;
          //=============================================
          //If there is no entry, the function returns the value of the constant DBL_MAX , i.e. 1.7976931348623158e + 308.
//1) Find the total profit / loss of open positions for EURUSD, for sale and with the identifier 12345 :                        GetSumProfitOpenedPositions ( "EURUSD", OP_SELL, 12345 );
//2) Find the total profit / loss for open positions for EURUSD, of any type with the identifier 12345 :                        GetSumProfitOpenedPositions ( "EURUSD", - 1, 12345 );
//3) Find the total profit / loss for open positions for EURUSD, of any type and with any identifier :                          GetSumProfitOpenedPositions ( "EURUSD" );
//4) Find the total profit / loss of open positions among all financial instruments, of any type and with the identifier 12345: GetSumProfitOpenedPositions ( "", - 1, 12345 );
//5) Find the total profit / loss of open positions among all financial instruments, of any type and with any identifier:       GetSumProfitOpenedPositions ();
//============================================
}
//+------------------------------------------------------------------+
//|                                                                  |DifferencePositionMarket
//+------------------------------------------------------------------+DifferencePositionOpenPriceFromLiveMarketPrice
double Ct_Size::DifferencePositionOpenPriceFromLiveMarketPrice(int f_ticket) // ticket
{         for(int i = OrdersTotal() - 1; i >= 0; i--)
                    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
                              if(OrderTicket() == f_ticket)
                              {         int f_type = OrderType();
                                        if(f_type == OP_BUYLIMIT || f_type == OP_SELLLIMIT || f_type == OP_BUYSTOP  || f_type == OP_SELLSTOP)return DBL_MAX;
                                        //---
                                        if(f_type == OP_BUY)    return MarketInfo(OrderSymbol(), MODE_BID) - OrderOpenPrice();
                                        if(f_type == OP_SELL)   return MarketInfo(OrderSymbol(), MODE_ASK) - OrderOpenPrice(); //
                              }
          return DBL_MAX; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int  Ct_Size::PointsToPip(int Points_)
{         if(ct_Drive.TDD.ct_Market_Symbol.Is_Fractional && Points_ > 0) { return  (Points_ * 10 );}
          return (Points_ * 1 ); //0.00001->0.0001//0.001->0.01>>>500point>50pip//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_Size::mm(MM method, string SymbolCom, double lots, int sl, double risk_mm1, double lots_mm2, double per_mm2, double risk_mm3, double risk_mm4)
{         double balance = AccountBalance();
          double tick_value = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKVALUE;
          double volume = lots;
          switch(method)
          {         case MM_RISK_PERCENT:               if(sl > 0)      volume = ((balance * risk_mm1) / sl) / tick_value; break;
                    case MM_FIXED_RATIO:                                volume = balance * lots_mm2 / per_mm2; break;
                    case MM_FIXED_RISK:                 if(sl > 0)      volume = (risk_mm3 / tick_value) / sl; break;
                    case MM_FIXED_RISK_PER_POINT:                       volume = risk_mm4 / tick_value; break; //
          }
          double min_lot = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT;
          double max_lot = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT;
          int lot_digits = (int) - MathLog10(ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP);
          volume = NormalizeDouble(volume, lot_digits);
          if(volume < min_lot) volume = min_lot;
          if(volume > max_lot) volume = max_lot;
          return volume; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Size::Lot(double Lots = 0, double Lots_New = 0, int Percent = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          string Symb           = Symbol();                   // Symbol
          double One_Lot        = MarketInfo(Symb, MODE_MARGINREQUIRED); //!-lot cost
          double Min_Lot        = MarketInfo(Symb, MODE_MINLOT); // Min. amount of lots
          double Step           = MarketInfo(Symb, MODE_LOTSTEP); //Step in volume changing
          double Free           = AccountFreeMargin();        // Free margin
//----------------------------------------------------------------------------- 3 --
          if (Lots > 0)                               // Volume is explicitly set.
          {         // .check it
                    double Money = Lots * One_Lot;           // ct_Order cost
                    if(Money <= AccountFreeMargin())    Lots_New = Lots;                                        // Free margin covers it.              // .accept the set one
                    else                                Lots_New = MathFloor(Free / One_Lot / Step) * Step;     // If free margin is not enough.       // Calculate lots
          }
          else                                                                                                  // If volume is not preset
          {         // .take percentage
                    if (Percent > 100)  Percent = 100;                                                          // Preset, but incorrectly .  // . then no more than 100
                    if (Percent == 0)   Lots_New = Min_Lot;                                                     // If 0 is preset .   // .then the min. lot
                    else                Lots_New = MathFloor(Free * Percent / 100 / One_Lot / Step) * Step;     // Desired amount of lots: //Calc
          }
//----------------------------------------------------------------------------- 5 --
          if (Lots_New < Min_Lot)                         Lots_New = Min_Lot;                             // If it is less than allowed.    // . then minimum
          if ((Lots_New * One_Lot) > AccountFreeMargin()) { ct_ERROR.ct_Inform(11, 0, Min_Lot); return(false);} // It isn't enough even.  // .for the min. lot:(       // Message.
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(true);                               // Exit user-defined function
}
//+------------------------------------------------------------------+
//|             Class C_CHART::BEGIN                                 |2721 line class  C_CHART start
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
