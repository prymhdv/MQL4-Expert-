//+------------------------------------------------------------------+
//||   ||||||||||              C_TICK.mqh                     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>
#include <ChartObjects\ChartObjectsChannels.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
#property copyright "A pourya 2021"
#property link      "@prymhdv@gmail.com"
#property version   "1.00"
#property strict
//The NewTick event is generated for Expert Advisors only when a new tick for a symbol is received,
//to the chart of which the Expert Advisor is attached.

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\OntickUtiliti.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\CPossition_Temp_Signal.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Scaler\NN_Neurons_Scaler_Run.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Vector\NN_Neurons_Vector_Run.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
input double    inp_RiskMoneyPersent_f1 = 0.02;
input int       inp_RiskMoney_Mul_SLMul = 20;
input double    inp_SlMul               = 0.1;
input double    inp_RR_f5               = 1.5;
//--------------------------------------
input double    inp_FixedLot            = 0.01;
input int       inp_FixedSLPip          = 500;
//--------------------------------------12,26
input int       inp_RSI_Pdelta  = 4;
input int       inp_RSI_Pf      = 4;
input int       inp_RSI_Ps      = 7;
input int       inp_STC_P       = 3;
input int       inp_MACD_Pf       = 12;
input int       inp_MACD_Ps       = 26;
input int       inp_MACD_Pss      = 9;
input int       inp_MA_Pf         = 14;
input int       inp_MA_Ps         = 20;
////--------------------------------------
//input double    inp_RiskMoneyPersent_f1   = 0.02;
//input double    inp_SlMul       = 1.8;
//input double    inp_RR_f5          = 2.9;
//input double    inp_FixedLot    = 0.41;
//input int       inp_FixedSLPip  = 510;
//input int       inp_RSI_Pdelta  = 4;          // 14;
//input int       inp_RSI_Pf      = 5;          // 4;
//input int       inp_RSI_Ps      = 17;         // 7;
//input int       inp_STC_P       = 2;          // 5;
//input int       inp_MACD_Pf     = 12;         // 12;
//input int       inp_MACD_Ps     = 26;         // 26;
//input int       inp_MACD_Pss    = 9;          // 9;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum E_TakeProfitePrice_Type    { e_TakeProfitePrice_Type_Void, e_TakeProfitePrice_Type_Fixed, e_TakeProfitePrice_Type_BySLpip };
enum E_StopLossPrice_Type       { e_StopLossPrice_Type_Void, e_StopLossPrice_Type_Fixed, e_StopLossPrice_Type_BySLpip };
enum E_SLpip_Type               { e_SLpip_Type_Void, e_SLpip_Type_Fixed, e_SLpip_Type_SarCloseDiff };
enum E_VLot_Type                { e_VLot_Type_Void, e_VLot_Type_Fixed, e_VLot_Type_Risk_SLPip, e_VLot_Type_Risk_Margine };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CNewOrder_Configing
{
public:
          void       CNewOrder_Configing() {};
          void       CNewOrder_Configing(string sy, double mrp, int fslpip, double flv, double frr) {m_symbol = sy; f_MaxRiskPercent = mrp; f_SLPip = fslpip; f_LotVolum = flv; f_RR = frr;};
          void      ~CNewOrder_Configing() {};
          bool       IsDetectTradeSignal;
          //---------------
          //OrderSend(_Symbol, CMD, VolumeLot, Ask, 10, SLPrice, TpPrice, "", MAGICMA_1, 0, Blue);
          string        m_symbol;
          int           m_cmd;
          double        m_volumelot;
          double        m_startprice;
          int           m_slippage;
          double        m_stoplossprice;
          double        m_takeprofiteprice;
          string        m_comment;
          int           m_magic;
          datetime      m_experition;
          color         m_color;

          void       SetSymbol(string s)                             {m_symbol = s;};

          void       SetCMD(bool Isreverse, bool IsBuy, bool IsSell) {IsDetectTradeSignal = 1; m_cmd = -1;  if(IsBuy && !Isreverse) {m_cmd = OP_BUY; return; }; if(IsSell && !Isreverse) {m_cmd = OP_SELL; return;} if(IsBuy && Isreverse) {m_cmd = OP_SELL; return; }; if(IsSell && Isreverse) {m_cmd = OP_BUY; return;} IsDetectTradeSignal = 0;};

          void        SetSLPip(E_SLpip_Type SLpip_Type)
          {         //
                    ENUM_TIMEFRAMES tf = PERIOD_M1;
                    if(SLpip_Type == e_SLpip_Type_Void)         { Print("VLot_Type == e_VLot_Type_Void"); return;}
                    if(SLpip_Type == e_SLpip_Type_Fixed)        { l_SLPip = f_SLPip; return;}
                    if(SLpip_Type == e_SLpip_Type_SarCloseDiff) { l_SLPip = (int)(MathAbs(iSAR(m_symbol, tf, 0.02, 0.2, 0) - iClose(m_symbol, tf, 0)) * 100); return;}
                    //-------------------------------------------------------------------------------CalcSLPip(1, MaximumRisk * 100, 0.04, 200)
                    int SLpipsSAR = (int)(MathAbs(iSAR(m_symbol, tf, 0.02, 0.2, 0) - iClose(m_symbol, tf, 0)) * 100);
                    int SLpipsMA = (int)(MathAbs(iMA(m_symbol, tf, 50, 0, MODE_EMA, PRICE_CLOSE, 0) - Ask) * 100);
                    int SLpipsband = _Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_CLOSE, MODE_MAIN, 1) ?
                                     (int)(MathAbs(iBands(m_symbol, tf, 20, 2, 0, PRICE_LOW, MODE_LOWER, 0) - Ask) * 100) :
                                     (int)(MathAbs(iBands(m_symbol, tf, 20, 2, 0, PRICE_HIGH, MODE_UPPER, 0) - Ask) * 100);
                    double ATR = _ATR.IsATR_DeltaFactor(m_symbol, tf, 14, 200, 0);
                    int SLpipsPercent = (int)(Ask * 0.22);
                    //SLpips = (int)(MathAbs((SLpipsSAR + SLpipsMA + SLpipsband + SLpipsPercent) * SLPipMul * ATR) * MaxRiskPercent * 10);
                    //Print("SLpips: ", SLpips);
                    //-------------------------------------------------------------------------------
                    //Print(" AccountLeverage() : ", AccountLeverage() );
                    //Print(" AccountFreeMargin() : ", AccountFreeMargin() );
                    //Print(" AccountEquity()     : ", AccountEquity() );
                    //Print(" MaxRiskPercent     : ", f_MaxRiskPercent );
                    //-------------------------------------------------------------------------------
                    int    BarCount = 50;
                    int    BarHighestShift  = iHighest(m_symbol, tf, MODE_HIGH, BarCount, 0);
                    double BarHighestPrice  = iHigh(m_symbol, tf, BarHighestShift);
                    int    BarLowestShift   = iLowest(m_symbol, tf, MODE_LOW, BarCount, 0);
                    double BarLowestPrice   = iLow(m_symbol, tf, BarLowestShift);
                    bool   IsBulish         = BarLowestShift > BarHighestShift;
                    int    PipsHalfRange    = (int)((MathAbs(BarHighestPrice - BarLowestPrice) / 2) * 100);
                    //-------
                    if(0)
                    {         ObjectDelete(0, "TL.Level-High" ); //
                              if(!ObjectCreate(0, "TL.Level-High", OBJ_HLINE, 0, 0, BarHighestPrice)) { Print("TL.Level-High: not created ", ErrorDescription(_LastError));} //
                              ObjectSetInteger(0, "TL.Level-High", OBJPROP_RAY_RIGHT, 0); ObjectSetInteger(0, "TL.Level-High", OBJPROP_WIDTH, 3); ObjectSetInteger(0, "TL.Level-High", OBJPROP_COLOR, clrRed); //
                              ObjectDelete(0, "TL.Level-Low" ); //
                              if(!ObjectCreate(0, "TL.Level-Low", OBJ_HLINE, 0, 0, BarLowestPrice)) { Print("TL.Level-Low: not created ", ErrorDescription(_LastError));} //
                              ObjectSetInteger(0, "TL.Level-Low", OBJPROP_RAY_RIGHT, 0); ObjectSetInteger(0, "TL.Level-Low", OBJPROP_WIDTH, 3); ObjectSetInteger(0, "TL.Level-Low", OBJPROP_COLOR, clrRed); //
                    }
                    //-------------------------------------------------------------------------------
                    double CurrMoneyToTrade = AccountEquity() * f_MaxRiskPercent;
                    double CurrLevrageUniteMoneyToTrade = CurrMoneyToTrade / AccountLeverage();
                    int PipDistanceByBandRangeHalf = (int)MathAbs(iBands(m_symbol, tf, 20, 2, 0, PRICE_LOW, MODE_LOWER, 0) - iBands(m_symbol, tf, 20, 2, 0, PRICE_HIGH, MODE_UPPER, 0) / 2);
                    int PipDistanceApplayATR = (int)(PipDistanceByBandRangeHalf * iATR(m_symbol, tf, 14, 0));
                    int PipDistanceApplayLeverage = (int)(PipDistanceApplayATR + (AccountEquity() / AccountLeverage()) * 10);
                    //
                    l_SLPip = PipsHalfRange;
                    return;//
          }

          void SetVolumeLot(E_VLot_Type VLot_Type)
          {         //-------------------------------------------------------
                    if(VLot_Type == e_VLot_Type_Void)           { Print("VLot_Type == e_VLot_Type_Void"); return;}
                    if(VLot_Type == e_VLot_Type_Fixed)          { m_volumelot = f_LotVolum  ; l_SLPip = f_SLPip  ; return;}
                    if(VLot_Type == e_VLot_Type_Risk_SLPip)     { m_volumelot = Ticker.Possition_Temp_Signal.LotsOptimized_BySLPip(l_SLPip, f_MaxRiskPercent ); return;}
                    if(VLot_Type == e_VLot_Type_Risk_Margine)   { m_volumelot = Ticker.Possition_Temp_Signal.LotsOptimized_ByMargine(f_MaxRiskPercent); return; }
                    //
          };
          void       SetStartPrice(double sp)                                                                 {m_startprice           = sp; if(m_cmd == OP_BUY) {m_startprice = Ask;} if(m_cmd == OP_SELL) {m_startprice = Bid;}};

          void       SetSlipPage(int s = 10)                                                                  {m_slippage             = s;};

          void SetStopLossPrice(E_StopLossPrice_Type StopLossPrice_Type, double slPriceFixed)
          {         if(StopLossPrice_Type == e_StopLossPrice_Type_Fixed)
                    {         if(slPriceFixed > 0)      {m_stoplossprice = slPriceFixed; return;}
                              else                      { Print("slPriceFixed > 0 :", slPriceFixed > 0); return;}//
                    }
                    if(StopLossPrice_Type == e_StopLossPrice_Type_BySLpip)
                    {         if(m_cmd == OP_BUY) {m_stoplossprice    =  Ask - l_SLPip * Point(); }
                              if(m_cmd == OP_SELL) {m_stoplossprice    = Bid + l_SLPip * Point(); } //
                              return;//
                    }
                    //
          };

          void SetTakeProfitePrice(E_TakeProfitePrice_Type TakeProfitePrice_Type, double tpPriceFixed)
          {         if(TakeProfitePrice_Type == e_TakeProfitePrice_Type_Fixed)
                    {         if(tpPriceFixed > 0)      { m_takeprofiteprice = tpPriceFixed; return;}
                              else                     { Print("tpPriceFixed > 0 :", tpPriceFixed > 0); return;}//
                              //
                    }
                    if(TakeProfitePrice_Type == e_TakeProfitePrice_Type_BySLpip)
                    {         if(m_cmd == OP_BUY) {m_takeprofiteprice =  Ask + l_SLPip * f_RR * Point(); }
                              if(m_cmd == OP_SELL) {m_takeprofiteprice = Bid - l_SLPip * f_RR * Point(); }//
                              return;//
                    } //
          };

          void       SetComment(string c)                                                                     {m_comment              = c;};
          void       SetMagic(int m)                                                                          {m_magic                = m;};
          void       SetExperition(datetime d)                                                                {m_experition           = d;};
          void       SetColor(color c)                                                                        {m_color                = c;};
          //-------------------------------------------------
          void       CallOpenTrade()
          {         if(!IsDetectTradeSignal)return;//
                    //Print("OrderSend Error ", GetLastError(), "  m_cmd:", EnumToString((ENUM_ORDER_TYPE)m_cmd), " m_volumelot: ", DoubleToString(m_volumelot, 2), " m_startprice: ", (string)m_startprice, " m_stoplossprice: ", (string)m_stoplossprice, " m_takeprofiteprice: ", (string)m_takeprofiteprice );
                    bool IsSend = OrderSend(m_symbol, m_cmd, m_volumelot, m_startprice, m_slippage, m_stoplossprice, m_takeprofiteprice, m_comment, m_magic, m_experition, m_color);
                    if(!IsSend) Print("OrderSend Error ", GetLastError(), "  m_cmd:", EnumToString((ENUM_ORDER_TYPE)m_cmd), " m_startprice: ", (string)m_startprice, " m_stoplossprice: ", (string)m_stoplossprice, " m_takeprofiteprice: ", (string)m_takeprofiteprice );
                    //
          };
          //-------------------------------------------------
public:   int          l_SLPip, l_TPPip;
          double       f_MaxRiskPercent;
          int          f_SLPip;
          double       f_LotVolum;
          double       f_RR;




};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CNewOrderClose
{
public:
          CNewOrderClose(void) {};
          ~CNewOrderClose(void) {};
          //-------------------------------------------------
          int           m_Ticket;
          double        m_volumelot;
          double        m_closeprice;
          int           m_slippage;
          color         m_color;

          void       SetTicket()                      {m_Ticket               = OrderTicket();};
          void       SetVolumeLot()                   {m_volumelot            = OrderLots();};
          void       SetClosePrice()                  {m_closeprice           = Bid;};
          void       SetSlipPage(int s = 10)          {m_slippage             = s;};
          void       SetColor(color c)                {m_color                = c;};
          //-------------------------------------------------
          void       CallCloseTrade()
          {         if(!OrderClose(m_Ticket, m_volumelot, m_closeprice, m_slippage, m_color))   Print("OrderClose error ", GetLastError());   };
          //-------------------------------------------------

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_TICK
{         //====================================================================
private:


          int    MovingPeriod   ;//= 12;
          int    MovingShift    ;//= 6;//
          //-----------------------------
          double     OpenPrice;
          double     OpenStopLoss;
          double     OpenTakeProfit;
          //-----------------------------
          bool       IsTrailing1, IsTrailing2, IsTrailing3;
          bool       IsOnTick;

          //-----------------------------
          ENUM_TIMEFRAMES  fSelected_Current;// = 0;

          //-----------------------------

public:
          enum ETradeRisk
          {         eVoid_TradeRisk, eVoid_TradeRisk_High2, eVoid_TradeRisk_High1, eVoid_TradeRisk_Medium, eVoid_TradeRisk_Low1, eVoid_TradeRisk_Low2 };

          ETradeRisk eTradeRisk;
          //-----------------------------
          char       ModeStrategieChange;
          //-----------------------------
          //
public:
          void       C_TICK()
          {         MovingPeriod        = 12;
                    MovingShift         = 6;//
                    IsTrailing1         = 0;//
                    IsTrailing2         = 0;//
                    IsTrailing3         = 0;//
                    IsOnTick            = 1;
                    fSelected_Current   = PERIOD_M4;
                    //
          };
          void      ~C_TICK() {};
          void       Run();
          void       InitTrade();
          CNewOrder_Configing NewOrder_Config;
          //
          Cgs_DevObjectPack             Object_Pack;
          void       DrawStructures(bool b);
          bool       IsStructuresBuy, IsStructuresSell;
          //0000000000
          char       IsMACDBuyp1Selln1;// = Sti_MACDm5.MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx].IsMACDBuyp1Selln1;
          double     _MACDamountSLPrice;// = Sti_MACDm5.MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx]._MACDamountSLPrice;
          double     _MACDamountTPPrice;// = Sti_MACDm5.MACD_Cross_Signal.MACD_RR[MACD_Cross_Signal.Idx]._MACDamountTPPrice; //
          char       IsZZBuyp1Selln1Void0;
          //
          void       DraweHLTF(ENUM_TIMEFRAMES tf, int s);
          void       DraweHL(ENUM_TIMEFRAMES ft = PERIOD_M5);
          void       DrawZigzag(string Pfname, ENUM_TIMEFRAMES tfzz = PERIOD_M5);
          //----------
          void       UpdateEveryTick()
          {         //  _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(PERIOD_M1)
          }
          //----------------
          C_TD2                                 MTSTD;
          NN_Neurons_Vector_Run              *MTSNNV_Ontick;
          //
          void       StrategieChanger(bool b);
          //
          int           CalculateCurrentOrders(string symbol);
          void          CheckForOpen(ENUM_TIMEFRAMES &frame );
          void          CheckForClose(bool b);
          void          CheckForModify(bool b, int profite = 10);
          //
          CPossition_Temp_Signal Possition_Temp_Signal;

          int        SendOrder(int CMD, char VolumeLotFactor, int SLPip, int TpPip, ENUM_TIMEFRAMES f ) //OP_BUY//NormalizeDouble(Possition_Temp_Signal.LotsOptimized() / 4, 2)
          {         double VolumeLot = 0;
                    //if(VolumeLotFactor == -2) {VolumeLot = NormalizeDouble(Possition_Temp_Signal.LotsOptimized_BySLPip(SLPip, 0.02 ) * 4, _Digits); } //Possition_Temp_Signal.SLTpPipOptimized(VolumeLot,SLPip, TpPip);}
                    //if(VolumeLotFactor == -1) {VolumeLot = NormalizeDouble(Possition_Temp_Signal.LotsOptimized_BySLPip(SLPip, 0.02 ) * 2, _Digits); } //Possition_Temp_Signal.SLTpPipOptimized(VolumeLot,SLPip, TpPip);}
                    //if(VolumeLotFactor == 0)  {VolumeLot = NormalizeDouble(Possition_Temp_Signal.LotsOptimized_BySLPip(SLPip, 0.02 ) * 1, _Digits); } //Possition_Temp_Signal.SLTpPipOptimized(VolumeLot,SLPip, TpPip);}
                    //if(VolumeLotFactor == +1) {VolumeLot = NormalizeDouble(Possition_Temp_Signal.LotsOptimized_BySLPip(SLPip, 0.02 ) / 2, _Digits); } //Possition_Temp_Signal.SLTpPipOptimized(VolumeLot,SLPip, TpPip);}
                    //if(VolumeLotFactor == +2) {VolumeLot = NormalizeDouble(Possition_Temp_Signal.LotsOptimized_BySLPip(SLPip, 0.02 ) / 4, _Digits); } //Possition_Temp_Signal.SLTpPipOptimized(VolumeLot,SLPip, TpPip);}
                    //-------------------------------------------------------------------------------------------------------------------------------------------
                    double SLPrice = 0; // NormalizeDouble(Bid + SLPip * Point(), _Digits);
                    double TpPrice = 0; // NormalizeDouble(Bid - TpPip * Point(), _Digits);
                    TpPip = (int)(SLPip * 3.50);  // 7 *10 = 70%   =>
                    SLPip = (int)(SLPip * 1.00);  // 2 *10 = 20%   =>  +50% net Chance
                    if(CMD == OP_BUY)  {SLPrice = NormalizeDouble(Ask - SLPip * Point(), _Digits); TpPrice = NormalizeDouble(Ask + TpPip * Point(), _Digits);}
                    if(CMD == OP_SELL) {SLPrice = NormalizeDouble(Bid + SLPip * Point(), _Digits); TpPrice = NormalizeDouble(Bid - TpPip * Point(), _Digits);}
                    //-------------------------------------------------------------------------------------------------------------------------------------------.
                    if(0)
                    {         if(CMD == OP_BUY)  {SLPrice = iSAR(_Symbol, f, 0.02, 0.2, 0) - 200 * Point(); TpPrice = Ask + MathAbs(SLPrice - Ask) * 1.5 ;}
                              if(CMD == OP_SELL) {SLPrice = iSAR(_Symbol, f, 0.02, 0.2, 0) + 200 * Point(); TpPrice = Bid - MathAbs(SLPrice - Bid) * 1.5 ;} //
                    }
                    //-------------------------------------------------------------------------------------------------------------------------------------------.
                    if(CMD == OP_BUY)   return OrderSend(_Symbol, CMD, VolumeLot, Ask, 10, SLPrice, TpPrice, "", MAGICMA_1, 0, Blue); //
                    if(CMD == OP_SELL)  return OrderSend(_Symbol, CMD, VolumeLot, Bid, 10, SLPrice, TpPrice, "", MAGICMA_1, 0, Red); //
                    return -1;//
          }
          void       UpdateSLBySAR(bool b);

          //-------------------------------------------------------------

          //====================================================================
};

//+------------------------------------------------------------------+Ticker.Possition_Temp_Signal       Ticker.IsStructuresBuy, IsStructuresSell
//|                                                                  |Ticker.Data.UpdateVaribles         Ticker.IsStrategieChange
//+------------------------------------------------------------------+Ticker.SLPipTest,Ticker.TPPipTest
void C_TICK::Run()
{         //----------------------------------------------------------------
          //----------------------------------------------------------------
          //----------------------------------------------------------------
          if(0)///NN
          {         Sleep(100);
                    MTSNNV_Ontick = new NN_Neurons_Vector_Run(0.15, 0.5, 100);
                    MTSNNV_Ontick._MainRun_();//
                    delete MTSNNV_Ontick;
                    //
          }
          ///-- DisplaySpeedInfo
          TradePanel.OnTicks(TradePanel.Is_Running);  // TextSetFont (  "Arial", 222, FW_BOLD, 0);//
          //ChartController::ChartMeterX();//ChartMeterByTimerController
          //TimerController::UpdateLabelsValues()///
          if(IsTesting())
          {         MathSrand(GetTickCount());
                    eTradeRisk = eVoid_TradeRisk;
                    Possition_Temp_Signal.TotalProfitCurrent =  AccountBalance() - Possition_Temp_Signal.InitialBALANCE ;
                    if(Possition_Temp_Signal.TotalProfitCurrent > Possition_Temp_Signal.MaximumProfit) {Possition_Temp_Signal.MaximumProfit = Possition_Temp_Signal.TotalProfitCurrent;}
                    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                    // Account Balance is Lower than Initial Balance Half
                    static bool IsPrinted = false;
                    if(Possition_Temp_Signal.InitialBALANCE / 2 >= AccountBalance() && !IsPrinted) { IsPrinted = 1; Print("failed strategie, Account Balance is Lower than Initial Balance Half!"); return;} //
                    if(IsPrinted) {return;}
                    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                    // Save strategie Half of maximum Profite
                    static bool IsPrinted2 = false;
                    if(Possition_Temp_Signal.MaximumProfit > Possition_Temp_Signal.InitialBALANCE * 2 && Possition_Temp_Signal.MaximumProfit / 2 >= Possition_Temp_Signal.TotalProfitCurrent + 1 && !IsPrinted2 )
                    {         IsPrinted2 = 1;
                              Print("Save strategie Half of maximum Profite :", DoubleToString(Possition_Temp_Signal.MaximumProfit / 2, 2), "  TotalProfit-Current:", DoubleToString(Possition_Temp_Signal.TotalProfitCurrent, 2)); return;//
                    } //
                    if(IsPrinted2) {return;}
                    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                    if(0)
                    {         Detect_NewBar.Update();
                              if(Detect_NewBar._M1.CBT__2Seccound.Is_NewBar) {Timer.Update(true);}
                              //ct_Drive.Update(); //
                    }
                    //--- go trading only for first tiks of new bar//not ticking every one ticks--more speedy.
                    //----------------------------------------------
                    if(Volume[0] > 1) return;
                    //
                    DrawStructures(1);///lagger
                    //----------------------------------------------
                    //strategies change?
                    StrategieChanger(0);
                    //----------------------------------------------
                    if(0)//TREE DECITION
                    {         ct_Drive.TDD.ct_Signals.TICC.Final_TREE_BUY_Condition_Signal = ct_Drive.TDD.ct_Signals.TICC.Final_TREE_SELL_Condition_Signal = 0;
                              //ct_Drive.TDD.ct_Conductor.DC_data.Indicators.Update();
                              if( MTSTD.MainProgress(true) < -1) {Print("___TREE__NOT__RUN__SUCCESSFULY__", __FUNCTION__);};//
                    } //  //MTSTD.MainProgress(true); run on timer fast not here
                    //----------------------------------------------
                    if(0)///NN
                    {         MTSNNV_Ontick = new NN_Neurons_Vector_Run(0.15, 0.5, 100);
                              MTSNNV_Ontick._MainRun_();//
                    }
                    //----------------------------------------------
                    //--- check for history and trading
                    if(Bars < 100 || IsTradeAllowed() == false) return;
                    //if(TimeHour(TimeCurrent()) == 16) { return; }
                    //-------------------------------------------------
                    if(1)
                    {         if(CalculateCurrentOrders(_Symbol) == 0)
                              {         InitTrade();//
                              }
                              //
                    }
                    //-------------------------------------------------
                    //--- calculate open orders by current symbol
                    if(0)
                    {         if(CalculateCurrentOrders(_Symbol) == 0) CheckForOpen(fSelected_Current); //RR =5:3 //--tp300pip is ideal           //RR =1:1  550:550 //RR =1:1.5  825:550
                              //{rr =1:2.3(16 day 114t 58dd)(1500, 600) }
                              //{16 day rr =1:1.5(120t 43dd(100->-23)(900, 600) }
                              //{16 day rr =1:1(xt xdd(100->-x)(600, 600) }
                              else                                      CheckForClose(1);//
                    }
                    //
                    if(0)// MODIFICATION
                    {         CheckForModify(IsTrailing1, 100);
                              ct_Drive.TDD.ct_Modify.Update(IsTrailing2, IsOnTick);
                              UpdateSLBySAR(IsTrailing3);//
                    }
                    //---
                    int slpip = 1;
                    //Print(EnumToString(fSelected_Current), " lot: ", Possition_Temp_Signal.LotsOptimized(slpip), "    High2Risk_Buy:  ", Possition_Temp_Signal.TradeInfo.C_High2Risk_Buy, "   HighRisk_Buy:  ", Possition_Temp_Signal.TradeInfo.C_HighRisk_Buy,  "   MediumRisk_Buy:  ", Possition_Temp_Signal.TradeInfo.C_MediumRisk_Buy,  "   LowRisk_Buy:  ", Possition_Temp_Signal.TradeInfo.C_LowRisk_Buy,  "   Low2Risk_Buy:  ", Possition_Temp_Signal.TradeInfo.C_Low2Risk_Buy, "    Data.PowerMACD_STATE:", Possition_Temp_Signal.Data.PowerMACD_STATE );
                    //Print(EnumToString(fSelected_Current), " lot: ", Possition_Temp_Signal.LotsOptimized(slpip), "    High2Risk_Sell:", Possition_Temp_Signal.TradeInfo.C_High2Risk_Sell, "   HighRisk_Sell:", Possition_Temp_Signal.TradeInfo.C_HighRisk_Sell, "   MediumRisk_Sell:", Possition_Temp_Signal.TradeInfo.C_MediumRisk_Sell, "   LowRisk_Sell:", Possition_Temp_Signal.TradeInfo.C_LowRisk_Sell, "   Low2Risk_Sell:", Possition_Temp_Signal.TradeInfo.C_Low2Risk_Sell );
                    //
          }
//else
//{         //----------------------------------------------
//          if(0)
//          {         Detect_NewBar.Update();
//                    if(Detect_NewBar._M1.CBT__2Seccound.Is_NewBar) {Timer.Update(true);}
//                    //ct_Drive.Update(); //
//          }
//          //----------------------------------------------
//          //--- check for history and trading
//          if(Bars < 100 || IsTradeAllowed() == false) return;
//          //cheack conditions
//          {         Data.UpdateVaribles(0.1);//
//          }
//          //--- calculate open orders by current symbol
//          if(CalculateCurrentOrders(_Symbol) == 0) CheckForOpen(PipTP, PipSL); //RR =5:3 //--tp300pip is ideal
//          //{rr =1:2.3(16 day 114t 58dd)(1500, 600) }
//          //{16 day rr =1:1.5(120t 43dd(100->-23)(900, 600) }
//          //{16 day rr =1:1(xt xdd(100->-x)(600, 600) }
//          else                                      CheckForClose();
//          CheckForModify();
//          //ct_Drive.TDD.ct_Modify.Update(true);
//          //---
//          //
//}
          return;//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  C_TICK::InitTrade()
{
          {         //new age   ---IsSLKiller?
                    // #1 Define Sell or Buy
                    // #2 Define VolumeLot by Risk ans StopLos Pips Or Margine
                    // #3 Define StartPrice by CMD Type
                    // #4 Define SlipPage
                    // #4 Define StopLossPrice By Stoploss Pips Count Or iMA/SAR price level
                    // #5 Define TakeProfitePrice By Stoploss Pips Count Multipy Or iMA/SAR price level
                    // #6 Define Comment By Strategies
                    // #7 Define Magic By Modeler
                    // #8 Define Experition By Strategy
                    // #9 Define Color By CMD
                    /*
                                    _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,f, 5, MODE_EMA, 0, f, 8, MODE_EMA, 0)
                                    _MACD.IsBulish_Forwarding(tf, GetFrame(tf, 1), 0)
                                    _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(tf) == +1
                                    _MACD.IsMacd_Posetiver_Delta(tf, -1, 0)
                                    _MACD.IsMacd_Bulishff(_Symbol,f,f,12,26,9,PRICE_WEIGHTED, 0)
                                    _SAR.Sar_Direction_MA_(PERIOD_M1, 0.01, 0.2, 0, 5) == +1
                                    _MFI.IsMFI_BulishPS(PERIOD_M1, 8, 0, 1)
                                    _Force.IsForce_BulishDelta(tf, 14, 0, 0 )
                                    _Force.IsForce_Bulish(tf, 14, 14, 0, 1)


                                    _Stochastic.Stoch_Bulish(_Symbol,PERIOD_M1, 1, 8) == 1
                                    _RSI.Is_RSI_BulishPeriodsShift(PERIOD_M1, 4, 7, PRICE_CLOSE, 0, 0)
                                    _Stochastic.Stoch_Bulish(_Symbol,PERIOD_M1, 1, 8)
                                    _SAR.Sar_Direction_MA_(PERIOD_M1, 0.01, 0.2, 0, 5) == +1
                                   !_Stochastic.Stoch_BulishDelta(PERIOD_M1, 40, 5)
                                   !_RSI.Is_RSI_BulishDelta(PERIOD_M1, 14, 30, 0 )
                                    _RSI.Is_RSI_BulishPeriodsShift(PERIOD_M1, 4, 7, PRICE_CLOSE, 0, 0)
                    */
                    /*
                                  _MACD.IsBearish_ForWarding(tf, GetFrame(tf, 1), 0)
                                  _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(PERIOD_M1) == -1
                                  _MACD.IsMacd_Posetiver_Delta(tf, -1, 0)
                                  _MACD.IsMacd_Bulishff(_Symbol,f,f,12,26,9,PRICE_WEIGHTED, 0)
                                  _SAR.Sar_Direction_MA_(PERIOD_M1, 0.01, 0.2, 0, 5) == -1
                                  _SAR.IsSar_BulishDiff(tf, 0.01, 0.2, 0, 2)
                                  _MFI.IsMFI_BulishPS(PERIOD_M1, 8, 0, 1)


                                 !_Stochastic.Stoch_Bulish(_Symbol,PERIOD_M1, 1, 8) == 1
                                 !_RSI.Is_RSI_BulishPeriodsShift(PERIOD_M1, 4, 7, PRICE_CLOSE, 0, 0))
                                 !_Stochastic.Stoch_Bulish(_Symbol,PERIOD_M1, 1, 8)
                                  _SAR.Sar_Direction_MA_(PERIOD_M1, 0.01, 0.2, 0, 5) == -1
                                  _Stochastic.Stoch_BulishDelta(PERIOD_M1, 60, 5)
                                  _RSI.Is_RSI_BulishDelta(PERIOD_M1, 14, 80, 0 )
                                 !_RSI.Is_RSI_BulishPeriodsShift(PERIOD_M1, 4, 7, PRICE_CLOSE, 0, 0))
                    */
                    //======================================================
                    ENUM_TIMEFRAMES tf = PERIOD_M1;
                    bool IsBuy =  0
                                  && _WPR.Is_WPR_BulishDelta(tf, 200, -25)
                                  //-----------------------------------------------------------------------------------------------------------------
                                  //&& !_RSI.Is_RSI_BulishDelta(tf, inp_RSI_Pdelta, 20, 0 ) //&& !_RSI.Is_RSI_BulishDelta(tf, inp_RSI_Pdelta, 90, 0 )
                                  //&& _RSI.Is_RSI_BulishPeriodsShift(tf, inp_RSI_Pf, inp_RSI_Ps, PRICE_CLOSE, 0, 0)
                                  //-----------------------------------------------------------------------------------------------------------------
                                  && !_Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_LOW, MODE_LOWER, 0)
                                  //&& _Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_CLOSE, MODE_MAIN, 0)
                                  //-----------------------------------------------------------------------------------------------------------------
                                  && _Stochastic.Stoch_Bulish(_Symbol, tf, 0, inp_STC_P)
                                  //&& _Stochastic.Stoch_BulishDelta(tf, 50, 5,0)//&& !_Stochastic.Stoch_BulishDelta(tf, 50, 5,1)
                                  //-----------------------------------------------------------------------------------------------------------------
                                  && _MACD.IsMacd_Bulishff(_Symbol, tf, tf, inp_MACD_Pf, inp_MACD_Ps, inp_MACD_Pss, PRICE_CLOSE, 0)
                                  && _MACD.IsBulish_Forwarding(tf, GetFrame(tf, 1), 0)
                                  //&& _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(tf) == +1
                                  //-----------------------------------------------------------------------------------------------------------------
                                  //&&  !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,tf, inp_MA_Pf, MODE_EMA, 0, tf, inp_MA_Ps, MODE_EMA, 0)
                                  //-----------------------------------------------------------------------------------------------------------------
                                  &&  _Force.IsForce_Bulish(tf, 14, 14, 0, 10)
                                  //&& _Force.IsForce_Bulish(tf, 14, 14, 0, 1)
                                  //-----------------------------------------------------------------------------------------------------------------
                                  //BuySignalDetection
                                  ;
                    bool IsSell = 0
                                  && !_WPR.Is_WPR_BulishDelta(tf, 200, -75)
                                  //-----------------------------------------------------------------------------------------------------------------
                                  //&& _RSI.Is_RSI_BulishDelta(tf, inp_RSI_Pdelta, 70, 0 ) //&&  _RSI.Is_RSI_BulishDelta(tf, inp_RSI_Pdelta, 10, 0 )
                                  //&&  !_RSI.Is_RSI_BulishPeriodsShift(tf, inp_RSI_Pf, inp_RSI_Ps, PRICE_CLOSE, 0, 0)
                                  //-----------------------------------------------------------------------------------------------------------------
                                  && _Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_HIGH, MODE_UPPER, 0)
                                  //&& !_Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_CLOSE, MODE_MAIN, 0)
                                  //-----------------------------------------------------------------------------------------------------------------
                                  && ! _Stochastic.Stoch_Bulish(_Symbol, tf, 0, inp_STC_P)
                                  //&& !_Stochastic.Stoch_BulishDelta(tf, 50, 5,0) //&&  _Stochastic.Stoch_BulishDelta(tf, 50, 5,1)
                                  //-----------------------------------------------------------------------------------------------------------------
                                  && !_MACD.IsMacd_Bulishff(_Symbol, tf, tf, inp_MACD_Pf, inp_MACD_Ps, inp_MACD_Pss, PRICE_CLOSE, 0)
                                  && _MACD.IsBearish_ForWarding(tf, GetFrame(tf, 1), 0)
                                  //&& _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(tf) == -1
                                  //-----------------------------------------------------------------------------------------------------------------
                                  //&&   _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,tf, inp_MA_Pf, MODE_EMA, 0, tf, inp_MA_Ps, MODE_EMA, 0)
                                  //-----------------------------------------------------------------------------------------------------------------
                                  &&  !_Force.IsForce_Bulish(tf, 14, 14, 0, 10)
                                  //&& !_Force.IsForce_Bulish(tf, 14, 14, 0, 1)
                                  //-----------------------------------------------------------------------------------------------------------------
                                  ;
                    bool IsBuy2 =  0
                                   && _WPR.Is_WPR_BulishDelta(tf, 200, -55)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& !_RSI.Is_RSI_BulishDelta(tf, inp_RSI_Pdelta, 20, 0 ) //&& !_RSI.Is_RSI_BulishDelta(tf, inp_RSI_Pdelta, 90, 0 )
                                   //&& _RSI.Is_RSI_BulishPeriodsShift(tf, inp_RSI_Pf, inp_RSI_Ps, PRICE_CLOSE, 0, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   && !_Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_LOW, MODE_LOWER, 0)
                                   //&& _Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_CLOSE, MODE_MAIN, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   && !_Stochastic.Stoch_Bulish(_Symbol, tf, 0, inp_STC_P)
                                   //&& _Stochastic.Stoch_BulishDelta(tf, 50, 5,0)//&& !_Stochastic.Stoch_BulishDelta(tf, 50, 5,1)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   && _MACD.IsMacd_Bulishff(_Symbol, tf, tf, inp_MACD_Pf, inp_MACD_Ps, inp_MACD_Pss, PRICE_CLOSE, 0)
                                   && _MACD.IsBearish_ForWarding_Correction(tf, GetFrame(tf, 1), 0)
                                   //&& _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(tf) == +1
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&&  !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,tf, inp_MA_Pf, MODE_EMA, 0, tf, inp_MA_Ps, MODE_EMA, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   &&  !_Force.IsForce_Bulish(tf, 14, 14, 0, 10)
                                   //&& _Force.IsForce_Bulish(tf, 14, 14, 0, 1)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //BuySignalDetection
                                   ;
                    bool IsSell2 = 0
                                   && !_WPR.Is_WPR_BulishDelta(tf, 200, -55)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& _RSI.Is_RSI_BulishDelta(tf, inp_RSI_Pdelta, 70, 0 ) //&&  _RSI.Is_RSI_BulishDelta(tf, inp_RSI_Pdelta, 10, 0 )
                                   //&&  !_RSI.Is_RSI_BulishPeriodsShift(tf, inp_RSI_Pf, inp_RSI_Ps, PRICE_CLOSE, 0, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   && _Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_HIGH, MODE_UPPER, 0)
                                   //&& !_Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_CLOSE, MODE_MAIN, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   &&   _Stochastic.Stoch_Bulish(_Symbol, tf, 0, inp_STC_P)
                                   //&& !_Stochastic.Stoch_BulishDelta(tf, 50, 5,0) //&&  _Stochastic.Stoch_BulishDelta(tf, 50, 5,1)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   && !_MACD.IsMacd_Bulishff(_Symbol, tf, tf, inp_MACD_Pf, inp_MACD_Ps, inp_MACD_Pss, PRICE_CLOSE, 0)
                                   && _MACD.IsBulish_Forwarding_Correction(tf, GetFrame(tf, 1), 0)
                                   //&& _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(tf) == -1
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&&   _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,tf, inp_MA_Pf, MODE_EMA, 0, tf, inp_MA_Ps, MODE_EMA, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   &&   _Force.IsForce_Bulish(tf, 14, 14, 0, 10)
                                   //&& !_Force.IsForce_Bulish(tf, 14, 14, 0, 1)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   ;
                    bool IsBuy3 =  1
                                   &&
                                   (
                                             1
                                             //&& Object_Pack.Channels.ChannelsZigZag._M5.Is_Bulish_All_Middle
                                             //&& !Object_Pack.Channels.ChannelsZigZag._M5.Place_Ninth == E_Place_Ninth_Lower_Upper
                                             //&& !Object_Pack.Channels.ChannelsZigZag._M5.Place_Ninth == E_Place_Ninth_Lower_Middle
                                   )
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& !_WPR.Is_WPR_BulishDelta(tf, 200, -55)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& !_RSI.Is_RSI_BulishDelta(tf, inp_RSI_Pdelta, 20, 0 ) //&& !_RSI.Is_RSI_BulishDelta(tf, inp_RSI_Pdelta, 90, 0 )
                                   //&& _RSI.Is_RSI_BulishPeriodsShift(tf, inp_RSI_Pf, inp_RSI_Ps, PRICE_CLOSE, 0, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& !_Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_LOW, MODE_LOWER, 0)
                                   //&& !_Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_CLOSE, MODE_MAIN, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&&  _Stochastic.Stoch_Bulish(_Symbol, tf, 0, inp_STC_P)
                                   //&& _Stochastic.Stoch_BulishDelta(tf, 50, 5,0)//&& !_Stochastic.Stoch_BulishDelta(tf, 50, 5,1)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&&  _MACD.IsMacd_Bulishff(_Symbol, tf, tf, inp_MACD_Pf, inp_MACD_Ps, inp_MACD_Pss, PRICE_CLOSE, 0)
                                   //&& _MACD.IsBearish_ForWarding_Correction(tf, GetFrame(tf, 1), 0)
                                   //&& _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(tf) == +1
                                   //-----------------------------------------------------------------------------------------------------------------
                                   &&   _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, inp_MA_Pf, MODE_EMA, 0, tf, inp_MA_Ps, MODE_EMA, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&&  !_Force.IsForce_Bulish(tf, 14, 14, 0, 10)
                                   //&& _Force.IsForce_Bulish(tf, 14, 14, 0, 1)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& _ATR.IsATR_BulishDelta(tf, 14, 0, 1.0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //BuySignalDetection
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& !_Stochastic.Stoch_Bulish("_DXY", tf, 0, inp_STC_P)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& !_MACD.IsMacd_Bulishff("_DXY", PERIOD_M15, PERIOD_M15, inp_MACD_Pf, inp_MACD_Ps, inp_MACD_Pss, PRICE_CLOSE, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   && !_MovingAvrages.IsMA_bulishPeriodsFrames("_DXY", tf, 14, MODE_EMA, 0, tf, 20, MODE_EMA, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   ;
                    bool IsSell3 = 1
                                   &&
                                   (
                                             1
                                             //&& !Object_Pack.Channels.ChannelsZigZag._M5.Is_Bulish_All_Middle
                                             //&& ! Object_Pack.Channels.ChannelsZigZag._M5.Place_Ninth == E_Place_Ninth_Upper_Lower
                                             //&& ! Object_Pack.Channels.ChannelsZigZag._M5.Place_Ninth == E_Place_Ninth_Upper_Middle
                                   )
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& _WPR.Is_WPR_BulishDelta(tf, 200, -55)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& _RSI.Is_RSI_BulishDelta(tf, inp_RSI_Pdelta, 70, 0 ) //&&  _RSI.Is_RSI_BulishDelta(tf, inp_RSI_Pdelta, 10, 0 )
                                   //&&  !_RSI.Is_RSI_BulishPeriodsShift(tf, inp_RSI_Pf, inp_RSI_Ps, PRICE_CLOSE, 0, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& _Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_HIGH, MODE_UPPER, 0)
                                   //&&  _Bollingrad_band.IsBollingrad_BulishPrice(Ask, tf,  20, 2, PRICE_CLOSE, MODE_MAIN, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&&   !_Stochastic.Stoch_Bulish(_Symbol, tf, 0, inp_STC_P)
                                   //&& !_Stochastic.Stoch_BulishDelta(tf, 50, 5,0) //&&  _Stochastic.Stoch_BulishDelta(tf, 50, 5,1)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& !_MACD.IsMacd_Bulishff(_Symbol, tf, tf, inp_MACD_Pf, inp_MACD_Ps, inp_MACD_Pss, PRICE_CLOSE, 0)
                                   //&& _MACD.IsBulish_Forwarding_Correction(tf, GetFrame(tf, 1), 0)
                                   //&& _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(tf) == -1
                                   //-----------------------------------------------------------------------------------------------------------------
                                   &&   !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, inp_MA_Pf, MODE_EMA, 0, tf, inp_MA_Ps, MODE_EMA, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&&   _Force.IsForce_Bulish(tf, 14, 14, 0, 10)
                                   //&& !_Force.IsForce_Bulish(tf, 14, 14, 0, 1)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& _ATR.IsATR_BulishDelta(tf, 14, 0, 1.0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& _Stochastic.Stoch_Bulish("_DXY", tf, 0, inp_STC_P)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //&& _MACD.IsMacd_Bulishff("_DXY", PERIOD_M15, PERIOD_M15, inp_MACD_Pf, inp_MACD_Ps, inp_MACD_Pss, PRICE_CLOSE, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   && _MovingAvrages.IsMA_bulishPeriodsFrames("_DXY", tf, 14, MODE_EMA, 0, tf, 20, MODE_EMA, 0)
                                   //-----------------------------------------------------------------------------------------------------------------
                                   //-----------------------------------------------------------------------------------------------------------------
                                   ;
                    //-----------------------------------------------------------------------------------------------------------------------
                    bool IsBuy4 =  1
                                   &&  _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, 50, MODE_SMA, 0, tf, 60, MODE_SMA, 1)
                                   &&  _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, 30, MODE_SMA, 0, tf, 44, MODE_SMA, 1)
                                   &&  _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, 14, MODE_SMA, 0, tf, 20, MODE_SMA, 1)
                                   &&  _MovingAvrages.IsMA_BulishMAPrice(tf, 20, MODE_SMA, 1, iLow(_Symbol, tf, 1))
                                   //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, 14, MODE_SMA, 0, tf, 20, MODE_SMA, 0)
                                   //&& _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, 20, MODE_SMA, 0, tf, 88, MODE_SMA, 0)
                                   //&& _CCI.Is_CCI_INDelta(_Symbol, tf, 14, 0, 110, 140)
                                   //&& _CCI.Is_CCI_BulishPeriodsShift(_Symbol, tf, 2, 10, PRICE_CLOSE, 0, 0)
                                   //&&   _Stochastic.Stoch_Bulish(_Symbol, tf, 0, inp_STC_P)
                                   &&  _MACD.IsMacd_Bulishff(_Symbol, tf, tf, 12, 26, 9, PRICE_CLOSE, 1)
                                   ;
                    bool IsSell4 = 1
                                   &&  !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, 50, MODE_SMA, 0, tf, 60, MODE_SMA, 1)
                                   &&  !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, 30, MODE_SMA, 0, tf, 44, MODE_SMA, 1)
                                   &&  !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, 14, MODE_SMA, 0, tf, 20, MODE_SMA, 1)
                                   &&   !_MovingAvrages.IsMA_BulishMAPrice(tf, 20, MODE_SMA, 1, iHigh(_Symbol, tf, 1))
                                   //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, 14, MODE_SMA, 0, tf, 20, MODE_SMA, 0)
                                   //&& !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, 20, MODE_SMA, 0, tf, 88, MODE_SMA, 0)
                                   //&& _CCI.Is_CCI_INDelta(_Symbol, tf, 14, 0, -110, -140)
                                   //&& !_CCI.Is_CCI_BulishPeriodsShift(_Symbol, tf, 2, 10, PRICE_CLOSE, 0, 0)
                                   //&&   !_Stochastic.Stoch_Bulish(_Symbol, tf, 0, inp_STC_P)
                                   &&  !_MACD.IsMacd_Bulishff(_Symbol, tf, tf, 12, 26, 9, PRICE_CLOSE, 1)
                                   ;
                    //-----------------------------------------------------------------------------------------------------------------------
                    bool IsBuy5 =  1
                                   //&& _WPR.Is_WPR_BulishPeriods(tf, 14, 200)
                                   &&   _WPR.Is_WPR_BulishPeriods(tf, 200, 1600)
                                   &&   _WPR.Is_WPR_BulishPeriods(tf, 14, 200)
                                   &&   _WPR.Is_WPR_BulishPeriods(tf, 7, 14)
                                   //&&  !_WPR.Is_WPR_BulishPeriods(tf, 14, -70)
                                   //&&  !_MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, 14, MODE_SMA, 0, tf, 20, MODE_SMA, 1)
                                   ;
                    bool IsSell5 = 0
                                   //&& _WPR.Is_WPR_BulishPeriods(tf, 14, 200)
                                   &&   !_WPR.Is_WPR_BulishPeriods(tf, 200, 1600)
                                   &&   !_WPR.Is_WPR_BulishPeriods(tf, 14, 200)
                                   &&   !_WPR.Is_WPR_BulishPeriods(tf, 7, 14)
                                   //&&   _WPR.Is_WPR_BulishPeriods(tf, 14, -20)
                                   //&&   _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol, tf, 14, MODE_SMA, 0, tf, 20, MODE_SMA, 1)
                                   ;
                    //-----------------------------------------------------------------------------------------------------------------------
                    //======================================================
                    //------------------------------
                    NewOrder_Config = CNewOrder_Configing(_Symbol, inp_RiskMoneyPersent_f1, inp_FixedSLPip, inp_FixedLot, inp_RR_f5);
                    NewOrder_Config.SetSymbol(_Symbol);
                    //NewOrder_Config.SetCMD( 0, IsBuy || IsBuy2 || IsBuy3, IsSell || IsSell2 || IsSell3 );
                    //
                    //if(IsZZBuyp1Selln1Void0 == 0  || (!IsBuy4 && !IsSell4) ) {Print("not Start Order Placing.."); return;}
                    NewOrder_Config.SetCMD( 0, IsBuy5, IsSell5 );//IsZZBuyp1Selln1Void0 == 1 ||IsZZBuyp1Selln1Void0 == -1 ||
                    //------------------------------* inp_RiskMoneyPersent_f1 * inp_RiskMoney_Mul_SLMul
                    //NewOrder_Config.SetSLPip((int)((MathAbs(_MACDamountSLPrice - _MACDamountTPPrice) / 2) * 100));
                    NewOrder_Config.SetSLPip(e_SLpip_Type_Fixed);
                    NewOrder_Config.SetVolumeLot(e_VLot_Type_Risk_SLPip);  //9000:7 Winrate //4500:35 Winrate //2250:30 Winrate //1100:25 Winrate
                    //------------------------------
                    NewOrder_Config.SetStartPrice(0);
                    //------------------------------
                    NewOrder_Config.SetSlipPage(5);           //5:25 Winrate not efected
                    //------------------------------
                    NewOrder_Config.SetStopLossPrice(e_StopLossPrice_Type_BySLpip, 0); //_MACDamountSLPrice
                    //------------------------------
                    NewOrder_Config.SetTakeProfitePrice(e_TakeProfitePrice_Type_BySLpip, 0); //_MACDamountTPPrice //18:4 Winrate //9:8 Winrate //4:16 Winrate//2:23 Winrate
                    //------------------------------
                    NewOrder_Config.SetComment("XX.XY");
                    NewOrder_Config.SetMagic(MAGICMA_1);
                    NewOrder_Config.SetExperition(0);
                    NewOrder_Config.SetColor(0);
                    //--- ----------------------------------------------
                    NewOrder_Config.CallOpenTrade();//
          }//
          if(0)
          {         //OrderClose(OrderTicket(), OrderLots(), Bid, 10, White)
                    CNewOrderClose  NewOrderClose;
                    NewOrderClose.SetTicket();
                    NewOrderClose.SetVolumeLot();
                    NewOrderClose.SetClosePrice();
                    NewOrderClose.SetSlipPage(5);
                    NewOrderClose.SetColor(clrWhite);
                    //-------------------------------------------------
                    NewOrderClose.CallCloseTrade();//
          } //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TICK::UpdateSLBySAR(bool b)
{         if(!b)  { return; }
          if(1)
          {         for(int i = 0; i < OrdersTotal(); i++)
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false) break;
                              if(OrderMagicNumber() != MAGICMA_1 || OrderSymbol() != _Symbol) continue;
                              //-------------------------------------------------------------------------------
                              double TpPrice = OrderTakeProfit();
                              double SLPrice = OrderStopLoss();
                              if(1)
                              {         if(OrderType() == OP_BUY)  {SLPrice = iSAR(_Symbol, fSelected_Current, 0.02, 0.2, 0) - 200 * Point();}// TpPrice = Ask + MathAbs(SLPrice - Ask) * 1.5 ;}
                                        if(OrderType() == OP_SELL) {SLPrice = iSAR(_Symbol, fSelected_Current, 0.02, 0.2, 0) + 200 * Point();}// TpPrice = Bid - MathAbs(SLPrice - Bid) * 1.5 ;} //
                              }
                              //-------------------------------------------------------------------------------
                              //--- check order type
                              if(OrderType() == OP_BUY)
                              {         //if(OrderProfit() > (profite * Possition_Temp_Signal.Data.Factor))
                                        {         if(!OrderModify(OrderTicket(), OrderOpenPrice(), SLPrice, TpPrice, 0, clrYellowGreen))
                                                  {         //Print("OrderModify error ", GetLastError());//
                                                  } //
                                        }
                                        break;//
                              }
                              if(OrderType() == OP_SELL)
                              {         //if(OrderProfit() > (profite * Possition_Temp_Signal.Data.Factor))
                                        {         if(!OrderModify(OrderTicket(), OrderOpenPrice(), SLPrice, TpPrice, 0, clrBlueViolet))
                                                  {         //Print("OrderModify error ", GetLastError());//
                                                  }//
                                        }
                                        break;//
                              } //
                    }//
          }//
}
//+------------------------------------------------------------------+
//| Check for open order conditions                                  |
//+------------------------------------------------------------------+
void C_TICK::CheckForOpen(ENUM_TIMEFRAMES &frame )
{         //
//if(false)
//{         double ma;
//          int    res;
//          //--- go trading only for first tiks of new bar
//          if(Volume[0] > 1) return;
//          //--- get Moving Average
//          ma = iMA(NULL, 0, MovingPeriod, MovingShift, MODE_SMA, PRICE_CLOSE, 0);
//          //--- sell conditions
//          if(Open[1] > ma && Close[1] < ma)
//          {         res = OrderSend(_Symbol, OP_SELL, LotsOptimized(), Bid, 3, 0, 0, "", MAGICMA_1, 0, Red);
//                    return; }
//          //--- buy conditions
//          if(Open[1] < ma && Close[1] > ma)
//          {         res = OrderSend(_Symbol, OP_BUY, LotsOptimized(), Ask, 3, 0, 0, "", MAGICMA_1, 0, Blue);
//                    return; //
//          }
//          //---
//} //
//-----------------------------------------------------------------------
//Print(MathRand() % 2);
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          int PipSL = 366 + 0; int PipTP = 977;       //RR =1:4 2200:550 not good /1.5 ==>1,466:366  not good    ==> 977:366. 1:2.66       -----------    int PipSL = 366; int PipTP = 977;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          if(1)
          {         //cheack conditions
                    Possition_Temp_Signal.Data.UpdateVaribles(0.1);
                    //
                    if(Possition_Temp_Signal.Data.PipSl > PipSL)PipSL = Possition_Temp_Signal.Data.PipSl;
                    PipTP = Possition_Temp_Signal.Data.PipTPx; //
          }
          if(1)
          {         //-------------------------------------------------------------
                    {         double SLPrice = 0;//Bid + PipSL * Point();
                              double TpPrice = 0;// Bid - PipTP * Point();
                              double SLTP_RANGE = 0; //
                              ENUM_TIMEFRAMES  fSelected = PERIOD_M2;
                              if(Possition_Temp_Signal.CheackSignal_Entry(fSelected, PipSL, PipTP) == eLow2_Risk_Signal_Sell ) /*&&  (bool)(MathRand() % 2)--make uncertinity && NormalizeDouble(Possition_Temp_Signal.LotsOptimized() / 4, 2) >= 0.01*/
                              {         //------------------------------------------------------------------------------------
                                        bool res = SendOrder(OP_SELL, -2, PipSL, PipTP, frame = fSelected );
                                        if(res)
                                        {         OpenPrice       = Bid;
                                                  OpenStopLoss    = SLPrice;
                                                  OpenTakeProfit  = TpPrice;//
                                                  //if(NormalizeDouble(Possition_Temp_Signal.LotsOptimized() / 4, 2) >= 0.01) {Possition_Temp_Signal.TradeInfo.C_Low2Risk_Sell++; eTradeRisk = eVoid_TradeRisk_Low2;}; //
                                        }
                                        return; //
                              }
                              //--- buy conditions
                              else if(Possition_Temp_Signal.CheackSignal_Entry(fSelected, PipSL, PipTP) == eLow2_Risk_Signal_Buy /*&&  (bool)(MathRand() % 2)--make uncertinity*/ )
                              {         //------------------------------------------------------------------------------------
                                        bool res = SendOrder(OP_BUY, -2, PipSL, PipTP, frame = fSelected);
                                        if(res)
                                        {         OpenPrice       = Ask;
                                                  OpenStopLoss    = SLPrice;
                                                  OpenTakeProfit  = TpPrice;//
                                                  //if(NormalizeDouble(Possition_Temp_Signal.LotsOptimized() / 4, 2) >= 0.01) {Possition_Temp_Signal.TradeInfo.C_Low2Risk_Buy++; eTradeRisk = eVoid_TradeRisk_Low2;}; //
                                        }
                                        return; //
                              }//
                              else if(Possition_Temp_Signal.CheackSignal_Entry(fSelected, PipSL, PipTP) == eLow_Risk_Signal_Sell /*&&  (bool)(MathRand() % 2)--make uncertinity*/ )
                              {         //------------------------------------------------------------------------------------
                                        bool res = SendOrder(OP_SELL, -1, PipSL, PipTP, frame = fSelected);
                                        if(res)
                                        {         OpenPrice       = Bid;
                                                  OpenStopLoss    = SLPrice;
                                                  OpenTakeProfit  = TpPrice;//
                                                  //if(NormalizeDouble(Possition_Temp_Signal.LotsOptimized() / 2, 2) >= 0.01) {Possition_Temp_Signal.TradeInfo.C_LowRisk_Sell++; eTradeRisk = eVoid_TradeRisk_Low1;}; //
                                        }
                                        return; //
                              }
                              //--- buy conditions
                              else if(Possition_Temp_Signal.CheackSignal_Entry(fSelected, PipSL, PipTP) == eLow_Risk_Signal_Buy /*&&  (bool)(MathRand() % 2)--make uncertinity*/ )
                              {         //------------------------------------------------------------------------------------
                                        bool res = SendOrder(OP_BUY, -1, PipSL, PipTP, frame = fSelected);
                                        if(res)
                                        {         OpenPrice       = Ask;
                                                  OpenStopLoss    = SLPrice;
                                                  OpenTakeProfit  = TpPrice;//
                                                  //if(NormalizeDouble(Possition_Temp_Signal.LotsOptimized() / 2, 2) >= 0.01) {Possition_Temp_Signal.TradeInfo.C_LowRisk_Buy++; eTradeRisk = eVoid_TradeRisk_Low1;}; //
                                        }
                                        return; //
                              }//
                              else if(Possition_Temp_Signal.CheackSignal_Entry(fSelected, PipSL, PipTP)  == eMedium_Risk_Signal_Sell /*&&  (bool)(MathRand() % 2)--make uncertinity*/ )
                              {         //------------------------------------------------------------------------------------
                                        bool res = SendOrder(OP_SELL, 0, PipSL, PipTP, frame = fSelected);
                                        if(res)
                                        {         OpenPrice       = Bid;
                                                  OpenStopLoss    = SLPrice;
                                                  OpenTakeProfit  = TpPrice;//
                                                  //if(NormalizeDouble(Possition_Temp_Signal.LotsOptimized() / 1, 2) >= 0.01) {Possition_Temp_Signal.TradeInfo.C_MediumRisk_Sell++; eTradeRisk = eVoid_TradeRisk_Medium;}; //
                                        }
                                        return; //
                              }
                              //--- buy conditions
                              else if(Possition_Temp_Signal.CheackSignal_Entry(fSelected, PipSL, PipTP) == eMedium_Risk_Signal_Buy /*&&  (bool)(MathRand() % 2)--make uncertinity*/ )
                              {         //------------------------------------------------------------------------------------
                                        bool res = SendOrder(OP_BUY, 0, PipSL, PipTP, frame = fSelected);
                                        if(res)
                                        {         OpenPrice       = Ask;
                                                  OpenStopLoss    = SLPrice;
                                                  OpenTakeProfit  = TpPrice;//
                                                  //if(NormalizeDouble(Possition_Temp_Signal.LotsOptimized() / 1, 2) >= 0.01) {Possition_Temp_Signal.TradeInfo.C_MediumRisk_Buy++; eTradeRisk = eVoid_TradeRisk_Medium;}; //
                                        }
                                        return; //
                              }//
                              else if(Possition_Temp_Signal.CheackSignal_Entry(fSelected, PipSL, PipTP)  == eHigh_Risk_Signal_Sell /*&&  (bool)(MathRand() % 2)--make uncertinity*/ )
                              {         //------------------------------------------------------------------------------------
                                        bool res = SendOrder(OP_SELL, +1, PipSL, PipTP, frame = fSelected);
                                        if(res)
                                        {         OpenPrice       = Bid;
                                                  OpenStopLoss    = SLPrice;
                                                  OpenTakeProfit  = TpPrice;//
                                                  //if(NormalizeDouble(Possition_Temp_Signal.LotsOptimized() * 2, 2) >= 0.01) {Possition_Temp_Signal.TradeInfo.C_HighRisk_Sell++; eTradeRisk = eVoid_TradeRisk_High1;}; //
                                        }
                                        return; //
                              }
                              //--- buy conditions
                              else if(Possition_Temp_Signal.CheackSignal_Entry(fSelected, PipSL, PipTP) == eHigh_Risk_Signal_Buy /*&&  (bool)(MathRand() % 2)--make uncertinity*/ )
                              {         //------------------------------------------------------------------------------------
                                        bool res = SendOrder(OP_BUY, +1, PipSL, PipTP, frame = fSelected);
                                        if(res)
                                        {         OpenPrice       = Ask;
                                                  OpenStopLoss    = SLPrice;
                                                  OpenTakeProfit  = TpPrice;//
                                                  //if(NormalizeDouble(Possition_Temp_Signal.LotsOptimized() * 2, 2) >= 0.01) {Possition_Temp_Signal.TradeInfo.C_HighRisk_Buy++; eTradeRisk = eVoid_TradeRisk_High1;}; //
                                        }
                                        return; //
                              }//
                              else if(Possition_Temp_Signal.CheackSignal_Entry(fSelected, PipSL, PipTP)  == eHigh2_Risk_Signal_Sell /*&&  (bool)(MathRand() % 2)--make uncertinity*/)
                              {         //------------------------------------------------------------------------------------
                                        bool res = SendOrder(OP_SELL, +2, PipSL, PipTP, frame = fSelected);
                                        if(res)
                                        {         OpenPrice       = Bid;
                                                  OpenStopLoss    = SLPrice;
                                                  OpenTakeProfit  = TpPrice;//
                                                  //if(NormalizeDouble(Possition_Temp_Signal.LotsOptimized() * 4, 2) >= 0.01) {Possition_Temp_Signal.TradeInfo.C_High2Risk_Sell++; eTradeRisk = eVoid_TradeRisk_High2;}; //
                                        }
                                        return; //
                              }
                              //--- buy conditions
                              else if(Possition_Temp_Signal.CheackSignal_Entry(fSelected, PipSL, PipTP) == eHigh2_Risk_Signal_Buy /*&&  (bool)(MathRand() % 2)--make uncertinity*/ )
                              {         //------------------------------------------------------------------------------------
                                        bool res = SendOrder(OP_BUY, +2, PipSL, PipTP, frame = fSelected);
                                        if(res)
                                        {         OpenPrice       = Ask;
                                                  OpenStopLoss    = SLPrice;
                                                  OpenTakeProfit  = TpPrice;//
                                                  //if(NormalizeDouble(Possition_Temp_Signal.LotsOptimized() * 4, 2) >= 0.01) {Possition_Temp_Signal.TradeInfo.C_High2Risk_Buy++; eTradeRisk = eVoid_TradeRisk_High2;}; //
                                        }
                                        return; //
                              }//
                    }//
          }//
//-----------------------------------------------------------------------
}
//+------------------------------------------------------------------+&& OrderProfit() > 1
//| Check for close order conditions                                 |
//+------------------------------------------------------------------+
void C_TICK::CheckForClose(bool b)
{         //
          if(!b) { return; }
          if(0)
          {         ENUM_TIMEFRAMES  fSelected = 0;
                    for(int i = 0; i < OrdersTotal(); i++)
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false) break;
                              if(OrderMagicNumber() != MAGICMA_1 || OrderSymbol() != _Symbol) continue;
                              //--- check order type
                              if(OrderType() == OP_BUY)
                              {         //if(Possition_Temp_Signal.CheackSignal_Exit() == eHigh_Risk_Signal)
                                        int slpip = 0; int tppip = 0;
                                        if(ct_Drive.TDD.ct_Signals.TICC.Final_TREE_BUY_Condition_Signal)
                                        {         if(!OrderClose(OrderTicket(), OrderLots(), Bid, 10, White))   Print("OrderClose error ", GetLastError());//
                                        }
                                        break;//
                              }
                              if(OrderType() == OP_SELL)
                              {         //if(Possition_Temp_Signal.CheackSignal_Exit() == eHigh_Risk_Signal)
                                        int slpip = 0; int tppip = 0;
                                        if(ct_Drive.TDD.ct_Signals.TICC.Final_TREE_SELL_Condition_Signal)
                                        {         if(!OrderClose(OrderTicket(), OrderLots(), Ask, 10, White))    Print("OrderClose error ", GetLastError());//
                                        }
                                        break;//
                              } //
                    }//
          }
          if(0)
          {         ENUM_TIMEFRAMES  fSelected = 0;
                    for(int i = 0; i < OrdersTotal(); i++)
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false) break;
                              if(OrderMagicNumber() != MAGICMA_1 || OrderSymbol() != _Symbol) continue;
                              //--- check order type
                              if(OrderType() == OP_BUY)
                              {         //if(Possition_Temp_Signal.CheackSignal_Exit() == eHigh_Risk_Signal)
                                        int slpip = 0; int tppip = 0;
                                        if( !_MACD.IsMacd_Bulishff(_Symbol, PERIOD_M1, PERIOD_M1, 12, 26, 9, PRICE_WEIGHTED, 0) && OrderProfit() > 5)
                                        {         if(!OrderClose(OrderTicket(), OrderLots(), Bid, 10, White))   Print("OrderClose error ", GetLastError());//
                                        }
                                        break;//
                              }
                              if(OrderType() == OP_SELL)
                              {         //if(Possition_Temp_Signal.CheackSignal_Exit() == eHigh_Risk_Signal)
                                        int slpip = 0; int tppip = 0;
                                        if( _MACD.IsMacd_Bulishff(_Symbol, PERIOD_M1, PERIOD_M1, 12, 26, 9, PRICE_WEIGHTED, 0) && OrderProfit() > 5)
                                        {         if(!OrderClose(OrderTicket(), OrderLots(), Ask, 10, White))    Print("OrderClose error ", GetLastError());//
                                        }
                                        break;//
                              } //
                    }//
          }
          if(0)
          {         ENUM_TIMEFRAMES  fSelected = 0;
                    for(int i = 0; i < OrdersTotal(); i++)
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false) break;
                              if(OrderMagicNumber() != MAGICMA_1 || OrderSymbol() != _Symbol) continue;
                              //--- check order type
                              if(OrderType() == OP_BUY)
                              {         //if(Possition_Temp_Signal.CheackSignal_Exit() == eHigh_Risk_Signal)
                                        int slpip = 0; int tppip = 0;
                                        if( _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(PERIOD_M1) == -1 )
                                        {         if(!OrderClose(OrderTicket(), OrderLots(), Bid, 10, White))   Print("OrderClose error ", GetLastError());//
                                        }
                                        break;//
                              }
                              if(OrderType() == OP_SELL)
                              {         //if(Possition_Temp_Signal.CheackSignal_Exit() == eHigh_Risk_Signal)
                                        int slpip = 0; int tppip = 0;
                                        if( _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1(PERIOD_M1) == +1 )
                                        {         if(!OrderClose(OrderTicket(), OrderLots(), Ask, 10, White))    Print("OrderClose error ", GetLastError());//
                                        }
                                        break;//
                              } //
                    }//
          }
          if(0)
          {         ENUM_TIMEFRAMES  fSelected = 0;
                    for(int i = 0; i < OrdersTotal(); i++)
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false) break;
                              if(OrderMagicNumber() != MAGICMA_1 || OrderSymbol() != _Symbol) continue;
                              //--- check order type
                              if(OrderType() == OP_BUY)
                              {         //if(Possition_Temp_Signal.CheackSignal_Exit() == eHigh_Risk_Signal)
                                        int slpip = 0; int tppip = 0;
                                        if( _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1Cross(PERIOD_M1, 200) == -1 )
                                        {         if(!OrderClose(OrderTicket(), OrderLots(), Bid, 10, White))   Print("OrderClose error ", GetLastError());//
                                        }
                                        break;//
                              }
                              if(OrderType() == OP_SELL)
                              {         //if(Possition_Temp_Signal.CheackSignal_Exit() == eHigh_Risk_Signal)
                                        int slpip = 0; int tppip = 0;
                                        if( _MACD.IsMacd100EMa_200SMa_12_26_9_Buyp1Selln1Cross(PERIOD_M1, 200) == +1 )
                                        {         if(!OrderClose(OrderTicket(), OrderLots(), Ask, 10, White))    Print("OrderClose error ", GetLastError());//
                                        }
                                        break;//
                              } //
                    }//
          }
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TICK::CheckForModify(bool b, int profite = 10)
{         //
          if(!b)  { return; }
          if(1)
          {         for(int i = 0; i < OrdersTotal(); i++)
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false) break;
                              if(OrderMagicNumber() != MAGICMA_1 || OrderSymbol() != _Symbol) continue;
                              //-------------------------------------------------------------------------------
                              double iMASL      = 0;
                              double PriceSL    = 0; // = iMASL; //OpenPrice
                              double iMATP      = 0; // = iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 1) + 500 * Point();
                              double PriceTP    = 0; // = iMATP; //OpenTakeProfit
                              if(OrderType() == OP_BUY)
                              {         iMATP = iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 1) + 500 * Point();
                                        iMASL = iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 1);
                                        PriceSL = OpenPrice;            //iMASL; //
                                        PriceTP = OpenTakeProfit ;      //iMATP; //
                              }
                              if(OrderType() == OP_SELL)
                              {         iMATP   = iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 1) - 500 * Point();
                                        iMASL   = iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 1);
                                        PriceSL = OpenPrice;            //iMASL; //OpenPrice
                                        PriceTP = OpenTakeProfit;       //iMATP; //OpenTakeProfit
                              }
                              //-------------------------------------------------------------------------------
                              //--- check order type
                              if(OrderType() == OP_BUY)
                              {         if(OrderProfit() > (profite * Possition_Temp_Signal.Data.Factor))
                                        {         if(!OrderModify(OrderTicket(), OpenPrice, PriceSL, PriceTP, 0, Yellow)) //Print("OrderModify error ", GetLastError());//
                                                  {} //
                                        }
                                        break;//
                              }
                              if(OrderType() == OP_SELL)
                              {         if(OrderProfit() > (profite * Possition_Temp_Signal.Data.Factor))
                                        {         if(!OrderModify(OrderTicket(), OpenPrice, PriceSL, PriceTP, 0, Yellow)) //Print("OrderModify error ", GetLastError());//
                                                  {}//
                                        }
                                        break;//
                              } //
                    }//
          }
//---
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Calculate open positions                                         |
//+------------------------------------------------------------------+
int C_TICK::CalculateCurrentOrders(string symbol)
{         int buys = 0, sells = 0;
//---
          for(int i = 0; i < OrdersTotal(); i++)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false) break;
                    if(OrderSymbol() == _Symbol && OrderMagicNumber() == MAGICMA_1)
                    {         if(OrderType() == OP_BUY)  buys++;
                              if(OrderType() == OP_SELL) sells++;//
                    } //
          }
//--- return orders volume
          if(buys > 0) return(buys);
          else         return(-sells);//
//return 0;//
}
//+------------------------------------------------------------------+
void C_TICK::DrawStructures(bool b)
{         if(!b) {return;}
          //ObjectsDeleteAll();
          //--------
          if(0)_TrendLineAuto.Update();//fail
          if(0)_TrendLine.Update(10, 100, PERIOD_M15, 1);
          if(0)_TrendLine.Update(10, 100, PERIOD_M1, 1);
          //if(1)DraweHL(PERIOD_H1) ;//
          if(0)DraweHLTF(PERIOD_D1, 1);
          if(0)_STD_Channel.Update("STD_Channel_M5__", PERIOD_M5, 0, 100, 1.61);
          //
          if(1)DrawZigzag("Zigzag_M30__", PERIOD_M30);
          if(0)
          {         //Object_Pack.Channels.ChannelsZigZag._M30.Draw_GDS( MODE_CREATE, false, 3, FALSE, 1,1); //
                    Object_Pack.Channels.ChannelsZigZag._M30.Draw_GDS( MODE_CREATE, true, 3, FALSE, 1, 1); //
                    //Print(EnumToString(Object_Pack.Channels.ChannelsZigZag._M5.Place_Ninth));//
          }
          if(0)
          {         IsZZBuyp1Selln1Void0 = 0;
                    if(Object_Pack.Channels.ChannelsZigZag._M30.Is_Place_Ninth__E_Lower_Lower &&  _MACD.IsMacd_Bulishff(_Symbol, PERIOD_M1, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, 0))
                    {         IsZZBuyp1Selln1Void0 = +1;//
                    }//
                    if(Object_Pack.Channels.ChannelsZigZag._M30.Is_Place_Ninth__E_Upper_Upper && !_MACD.IsMacd_Bulishff(_Symbol, PERIOD_M1, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, 0))
                    {         IsZZBuyp1Selln1Void0 = -1;//
                    }//
          }
          if(0)
          {         //---Sti_MACDm1.idxCross_SignalRR
                    Sti_MACD Sti_MACDm15("MacdM5",PERIOD_M5,  1, 2, 5);
                    Sti_MACD Sti_MACDm1("MacdM1",PERIOD_M1,  1, 2, 5);
                    IsMACDBuyp1Selln1 = Sti_MACDm15.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1;
                    _MACDamountSLPrice = Sti_MACDm15.MACD_Cross_Signal.MACD_RR[0].amountSLPrice;
                    _MACDamountTPPrice = Sti_MACDm15.MACD_Cross_Signal.MACD_RR[0].amountTPPrice; //
                    //----------------------------------------------------------------------
                    //Print("IsMACDBuyp1Selln1:", IsMACDBuyp1Selln1);
                    if(0)
                    {         if(Sti_MACDm1.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1 == +1
                                                  && _Stochastic.Stoch_Bulish(_Symbol, PERIOD_M1, 0, 5)
                                                  && _RSI.Is_RSI_BulishPeriodsShift(_Symbol, PERIOD_M15, 4, 7, PRICE_CLOSE, 0, 0)
                                                  && !_MovingAvrages.IsMA_bulishPeriodsFrames("_DXY", PERIOD_M15, 14, MODE_EMA, 0, PERIOD_M15, 20, MODE_EMA, 0)
                                )
                              {         IsMACDBuyp1Selln1 = +1;
                                        if(0)
                                        {         if(Sti_MACDm1.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1 == +1 && _Stochastic.Stoch_Bulish(_Symbol, PERIOD_M1, 0, 5))
                                                  {         IsMACDBuyp1Selln1 = +1; } //
                                                  if(Sti_MACDm1.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1 == 0 && _Stochastic.Stoch_Bulish(_Symbol, PERIOD_M1, 0, 5))
                                                  {         IsMACDBuyp1Selln1 = +1; } //
                                                  if(Sti_MACDm1.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1 == -1) //
                                                  {         IsMACDBuyp1Selln1 = 0;} //
                                        }//
                              }
                              if(Sti_MACDm1.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1 == 0)
                              {         IsMACDBuyp1Selln1 = 0;
                                        if(0)
                                        {         if(Sti_MACDm1.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1 == +1 && _Stochastic.Stoch_Bulish(_Symbol, PERIOD_M1, 0, 5))
                                                  {         IsMACDBuyp1Selln1 = +1; } //
                                                  if(Sti_MACDm1.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1 == 0 && _Stochastic.Stoch_Bulish(_Symbol, PERIOD_M1, 0, 5))
                                                  {         IsMACDBuyp1Selln1 = +1; } //
                                                  if(Sti_MACDm1.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1 == -1 && !_Stochastic.Stoch_Bulish(_Symbol, PERIOD_M1, 0, 5)) //
                                                  {         IsMACDBuyp1Selln1 = -1;} //
                                        }//
                              }
                              if(Sti_MACDm1.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1 == -1
                                                  && !_Stochastic.Stoch_Bulish(_Symbol, PERIOD_M1, 0, 5)
                                                  && !_RSI.Is_RSI_BulishPeriodsShift(_Symbol, PERIOD_M15, 4, 7, PRICE_CLOSE, 0, 0)
                                                  &&  _MovingAvrages.IsMA_bulishPeriodsFrames("_DXY", PERIOD_M15, 14, MODE_EMA, 0, PERIOD_M15, 20, MODE_EMA, 0)
                                )
                              {         IsMACDBuyp1Selln1 = -1;
                                        if(0)
                                        {         if(Sti_MACDm1.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1 == +1 && _Stochastic.Stoch_Bulish(_Symbol, PERIOD_M1, 0, 5))
                                                  {         IsMACDBuyp1Selln1 = 0; } //
                                                  if(Sti_MACDm1.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1 == 0 && !_Stochastic.Stoch_Bulish(_Symbol, PERIOD_M1, 0, 5))
                                                  {         IsMACDBuyp1Selln1 = -1; } //
                                                  if(Sti_MACDm1.MACD_Cross_Signal.MACD_RR[0].IsBuyp1Selln1 == -1 && !_Stochastic.Stoch_Bulish(_Symbol, PERIOD_M1, 0, 5)) //
                                                  {         IsMACDBuyp1Selln1 = -1;} //
                                        }//
                              }//
                    }//
          }
//--------
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  C_TICK::StrategieChanger(bool b)
{         if(!b)return;//
          if(1 && (ModeStrategieChange == 1 || ModeStrategieChange == 2))
          {         double   OrderProfiteArray[]; ArrayResize(OrderProfiteArray, 5000);
                    datetime OrderTimeArray[];    ArrayResize(OrderTimeArray, 5000);
                    for(int i = 0; i < 4; i++)//OrdersHistoryTotal()
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY) == false) break;
                              if(OrderMagicNumber() != MAGICMA_1 || OrderSymbol() != _Symbol) continue;
                              //----------------------
                              OrderProfiteArray[i] = OrderProfit();
                              OrderTimeArray[i]    = OrderCloseTime();
                              //----------------------
                              //----------------------
                    }
                    double ProfiteSum = 0;
                    for(int i = 0; i < ArraySize(OrderProfiteArray); i++)
                    {         ProfiteSum += OrderProfiteArray[i]; }
                    ModeStrategieChange = (ProfiteSum > 0) ? ModeStrategieChange : 0; //
          }
          if(1 && (ModeStrategieChange == 0 || ModeStrategieChange == 1))      //strategies change?
          {         double   OrderProfiteArray[]; ArrayResize(OrderProfiteArray, 5000);
                    datetime OrderTimeArray[];    ArrayResize(OrderTimeArray, 5000);
                    for(int i = 0; i < 4; i++)//OrdersHistoryTotal()
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY) == false) break;
                              if(OrderMagicNumber() != MAGICMA_1 || OrderSymbol() != _Symbol) continue;
                              //----------------------
                              OrderProfiteArray[i] = OrderProfit();
                              OrderTimeArray[i]    = OrderCloseTime();
                              //----------------------
                              //----------------------
                    }
                    double ProfiteSum = 0;
                    for(int i = 0; i < ArraySize(OrderProfiteArray); i++)
                    {         ProfiteSum += OrderProfiteArray[i]; }
                    ModeStrategieChange = (ProfiteSum < 0) ? 2 : 0; //
          }
          if(1 && (ModeStrategieChange == 0 || ModeStrategieChange == 2))      //strategies change?
          {         double   OrderProfiteArray[]; ArrayResize(OrderProfiteArray, 5000);
                    datetime OrderTimeArray[];    ArrayResize(OrderTimeArray, 5000);
                    for(int i = 0; i < 4; i++)//OrdersHistoryTotal()
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY) == false) break;
                              if(OrderMagicNumber() != MAGICMA_1 || OrderSymbol() != _Symbol) continue;
                              //----------------------
                              OrderProfiteArray[i] = OrderProfit();
                              OrderTimeArray[i]    = OrderCloseTime();
                              //----------------------
                              //----------------------
                    }
                    double ProfiteSum = 0;
                    for(int i = 0; i < ArraySize(OrderProfiteArray); i++)
                    {         ProfiteSum += OrderProfiteArray[i]; }
                    ModeStrategieChange = (ProfiteSum < 0) ? 1 : 0; //
          }//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TICK::DrawZigzag(string Pfname, ENUM_TIMEFRAMES tfzz = PERIOD_M5)
{         ObjectsDeleteAll(0, Pfname);
          //ENUM_TIMEFRAMES tfzz = PERIOD_M5;
          int zigzagShift[5] = {0, 0, 0, 0, 0 }; int zigzagIDX = 0;
          double zigzagValue[5] = {0.0, 0.0, 0.0, 0.0, 0.0 };
          int Depth = 12; int Deviation = 5; int BackStep = 3; int mul = 1;
          for(int i = 0; i < 200; i++)
          {         double val = iCustom(_Symbol, tfzz, "ZigZag.ex4", Depth * mul, Deviation * mul, BackStep * mul, 0, i);
                    //Print("val:", val, " i:", i);
                    if(val <= 0.0 || val == EMPTY_VALUE || val > 1000000.0)continue;
                    else if(val != 0)
                    {         zigzagShift[zigzagIDX] = i; //
                              zigzagValue[zigzagIDX] = val; //
                              //Print("val:", val, " i:", i);
                              zigzagIDX++;
                              if(zigzagIDX == 1)continue;
                              if(zigzagIDX > 4) { zigzagIDX = 0; break; } //
                    } //
          }
//
//Print("zigzagShift[3]:", zigzagShift[3], " zigzagValue[3]:", zigzagValue[3]);
          int zzg = 1; //zigzagGaps
          ObjectDelete(0, Pfname + "TL.200ZZ-3.2" ); //
          if(!ObjectCreate(0, Pfname + "TL.200ZZ-3.2", OBJ_TREND, 0, iTime(_Symbol, tfzz, zigzagShift[1 + zzg]), zigzagValue[1 + zzg], iTime(_Symbol, tfzz, zigzagShift[0 + zzg]), zigzagValue[0 + zzg])) { Print(Pfname + "TL.200ZZ-3.2: not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, Pfname + "TL.200ZZ-3.2", OBJPROP_RAY_RIGHT, 0); //
          ObjectSetInteger(0, Pfname + "TL.200ZZ-3.2", OBJPROP_WIDTH, 3); //
          ObjectSetInteger(0, Pfname + "TL.200ZZ-3.2", OBJPROP_COLOR, clrYellow); //
//
          ObjectDelete(0, Pfname + "TL.200ZZ-2.1" ); //
          if(!ObjectCreate(0, Pfname + "TL.200ZZ-2.1", OBJ_TREND, 0, iTime(_Symbol, tfzz, zigzagShift[2 + zzg]), zigzagValue[2 + zzg], iTime(_Symbol, tfzz, zigzagShift[1 + zzg]), zigzagValue[1 + zzg])) { Print(Pfname + "TL.200ZZ-2.1: not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, Pfname + "TL.200ZZ-2.1", OBJPROP_RAY_RIGHT, 0); //
          ObjectSetInteger(0, Pfname + "TL.200ZZ-2.1", OBJPROP_WIDTH, 3); //
          ObjectSetInteger(0, Pfname + "TL.200ZZ-2.1", OBJPROP_COLOR, clrYellow); //
//
          ObjectDelete(0, Pfname + "TL.200ZZ-1.0" ); //
          if(!ObjectCreate(0, Pfname + "TL.200ZZ-1.0", OBJ_TREND, 0, iTime(_Symbol, tfzz, zigzagShift[3 + zzg]), zigzagValue[3 + zzg], iTime(_Symbol, tfzz, zigzagShift[2 + zzg]), zigzagValue[2 + zzg])) { Print(Pfname + "TL.200ZZ-1.0: not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, Pfname + "TL.200ZZ-1.0", OBJPROP_RAY_RIGHT, 0); //
          ObjectSetInteger(0, Pfname + "TL.200ZZ-1.0", OBJPROP_WIDTH, 3); //
          ObjectSetInteger(0, Pfname + "TL.200ZZ-1.0", OBJPROP_COLOR, clrYellow); //
//
//TL.Upper
          {         datetime t1 =  zigzagValue[3 + zzg] > zigzagValue[2 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[3 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[2 + zzg]);
                    datetime t2 = zigzagValue[1 + zzg] > zigzagValue[0 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[1 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[0 + zzg]);
                    ObjectDelete(0, Pfname + "TL.200ZZ-Upper" ); //
                    if(!ObjectCreate(0, Pfname + "TL.200ZZ-Upper", OBJ_TREND, 0, t1, MAX(zigzagValue[3 + zzg], zigzagValue[2 + zzg]), t2, MAX(zigzagValue[1 + zzg], zigzagValue[0 + zzg]))) { Print(Pfname + "TL.200ZZ-Upper: not created ", ErrorDescription(_LastError));} //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-Upper", OBJPROP_RAY_RIGHT, 1); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-Upper", OBJPROP_WIDTH, 3); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-Upper", OBJPROP_COLOR, clrTan); //
          }
//TL.Lower
          {         datetime t1 =  zigzagValue[3 + zzg] < zigzagValue[2 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[3 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[2 + zzg]);
                    datetime t2 = zigzagValue[1 + zzg] < zigzagValue[0 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[1 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[0 + zzg]);
                    ObjectDelete(0, Pfname + "TL.200ZZ-Lower" ); //
                    if(!ObjectCreate(0, Pfname + "TL.200ZZ-Lower", OBJ_TREND, 0, t1, MIN(zigzagValue[3 + zzg], zigzagValue[2 + zzg]), t2, MIN(zigzagValue[1 + zzg], zigzagValue[0 + zzg]))) { Print(Pfname + "TL.200ZZ-Lower: not created ", ErrorDescription(_LastError));} //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-Lower", OBJPROP_RAY_RIGHT, 1); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-Lower", OBJPROP_WIDTH, 3); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-Lower", OBJPROP_COLOR, clrTan); //
          }
////TL.UpperRes
          {         datetime t1 =  zigzagValue[3 + zzg] > zigzagValue[2 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[3 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[2 + zzg]);
                    datetime t2 = zigzagValue[1 + zzg] > zigzagValue[0 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[1 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[0 + zzg]);
                    datetime t3 = iTime(_Symbol, tfzz, zigzagShift[3 + zzg]);
                    ObjectDelete(0, Pfname + "TL.200ZZ-UpperRes" ); //
                    if(!ObjectCreate(0, Pfname + "TL.200ZZ-UpperRes", OBJ_TREND, 0, t3, MAX(MAX(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MAX(zigzagValue[3 + zzg], zigzagValue[2 + zzg])), t3 + PeriodSeconds(tfzz) * 200, MAX(MAX(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MAX(zigzagValue[3 + zzg], zigzagValue[2 + zzg])) )) { Print(Pfname + "TL.200ZZ-UpperRes: not created ", ErrorDescription(_LastError));} //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-UpperRes", OBJPROP_RAY_RIGHT, 0); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-UpperRes", OBJPROP_WIDTH, 5); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-UpperRes", OBJPROP_COLOR, clrOrangeRed); //
          }
////TL.LowerSup
          {         datetime t1 =  zigzagValue[3 + zzg] > zigzagValue[2 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[3 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[2 + zzg]);
                    datetime t2 = zigzagValue[1 + zzg] > zigzagValue[0 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[1 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[0 + zzg]);
                    datetime t3 = iTime(_Symbol, tfzz, zigzagShift[3 + zzg]);
                    ObjectDelete(0, Pfname + "TL.200ZZ-LowerSup" ); //
                    if(!ObjectCreate(0, Pfname + "TL.200ZZ-LowerSup", OBJ_TREND, 0, t3, MIN(MIN(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MIN(zigzagValue[3 + zzg], zigzagValue[2 + zzg])), t3 + PeriodSeconds(tfzz) * 200, MIN(MIN(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MIN(zigzagValue[3 + zzg], zigzagValue[2 + zzg])) )) { Print(Pfname + "TL.200ZZ-LowerSup: not created ", ErrorDescription(_LastError));} //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-LowerSup", OBJPROP_RAY_RIGHT, 0); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-LowerSup", OBJPROP_WIDTH, 5); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-LowerSup", OBJPROP_COLOR, clrYellowGreen); //
          }
          double SUPRESRange = MathAbs(MIN(MIN(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MIN(zigzagValue[3 + zzg], zigzagValue[2 + zzg])) - MAX(MAX(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MAX(zigzagValue[3 + zzg], zigzagValue[2 + zzg])));
          {         datetime t1 =  zigzagValue[3 + zzg] > zigzagValue[2 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[3 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[2 + zzg]);
                    datetime t2 = zigzagValue[1 + zzg] > zigzagValue[0 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[1 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[0 + zzg]);
                    datetime t3 = iTime(_Symbol, tfzz, zigzagShift[3 + zzg]);
                    ObjectDelete(0, Pfname + "TL.200ZZ-UpperRes2" ); //
                    if(!ObjectCreate(0, Pfname + "TL.200ZZ-UpperRes2", OBJ_TREND, 0, t3, MAX(MAX(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MAX(zigzagValue[3 + zzg], zigzagValue[2 + zzg])) + SUPRESRange, t3 + PeriodSeconds(tfzz) * 200, MAX(MAX(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MAX(zigzagValue[3 + zzg], zigzagValue[2 + zzg])) + SUPRESRange )) { Print(Pfname + "TL.200ZZ-UpperRes2: not created ", ErrorDescription(_LastError));} //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-UpperRes2", OBJPROP_RAY_RIGHT, 0); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-UpperRes2", OBJPROP_WIDTH, 5); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-UpperRes2", OBJPROP_COLOR, clrOrangeRed); //
          }
          {         datetime t1 =  zigzagValue[3 + zzg] > zigzagValue[2 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[3 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[2 + zzg]);
                    datetime t2 = zigzagValue[1 + zzg] > zigzagValue[0 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[1 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[0 + zzg]);
                    datetime t3 = iTime(_Symbol, tfzz, zigzagShift[3 + zzg]);
                    ObjectDelete(0, Pfname + "TL.200ZZ-LowerSup2" ); //
                    if(!ObjectCreate(0, Pfname + "TL.200ZZ-LowerSup2", OBJ_TREND, 0, t3, MIN(MIN(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MIN(zigzagValue[3 + zzg], zigzagValue[2 + zzg])) - SUPRESRange, t3 + PeriodSeconds(tfzz) * 200, MIN(MIN(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MIN(zigzagValue[3 + zzg], zigzagValue[2 + zzg])) - SUPRESRange )) { Print(Pfname + "TL.200ZZ-LowerSup2: not created ", ErrorDescription(_LastError));} //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-LowerSup2", OBJPROP_RAY_RIGHT, 0); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-LowerSup2", OBJPROP_WIDTH, 5); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-LowerSup2", OBJPROP_COLOR, clrYellowGreen); //
          }
          {         datetime t1 =  zigzagValue[3 + zzg] > zigzagValue[2 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[3 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[2 + zzg]);
                    datetime t2 = zigzagValue[1 + zzg] > zigzagValue[0 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[1 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[0 + zzg]);
                    datetime t3 = iTime(_Symbol, tfzz, zigzagShift[3 + zzg]);
                    ObjectDelete(0, Pfname + "TL.200ZZ-UpperRes3" ); //
                    if(!ObjectCreate(0, Pfname + "TL.200ZZ-UpperRes3", OBJ_TREND, 0, t3, MAX(MAX(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MAX(zigzagValue[3 + zzg], zigzagValue[2 + zzg])) + SUPRESRange * 2, t3 + PeriodSeconds(tfzz) * 200, MAX(MAX(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MAX(zigzagValue[3 + zzg], zigzagValue[2 + zzg])) + SUPRESRange * 2 )) { Print(Pfname + "TL.200ZZ-UpperRes3: not created ", ErrorDescription(_LastError));} //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-UpperRes3", OBJPROP_RAY_RIGHT, 0); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-UpperRes3", OBJPROP_WIDTH, 5); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-UpperRes3", OBJPROP_COLOR, clrOrangeRed); //
          }
          {         datetime t1 =  zigzagValue[3 + zzg] > zigzagValue[2 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[3 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[2 + zzg]);
                    datetime t2 = zigzagValue[1 + zzg] > zigzagValue[0 + zzg] ?  iTime(_Symbol, tfzz, zigzagShift[1 + zzg]) : iTime(_Symbol, tfzz, zigzagShift[0 + zzg]);
                    datetime t3 = iTime(_Symbol, tfzz, zigzagShift[3 + zzg]);
                    ObjectDelete(0, Pfname + "TL.200ZZ-LowerSup3" ); //
                    if(!ObjectCreate(0, Pfname + "TL.200ZZ-LowerSup3", OBJ_TREND, 0, t3, MIN(MIN(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MIN(zigzagValue[3 + zzg], zigzagValue[2 + zzg])) - SUPRESRange * 2, t3 + PeriodSeconds(tfzz) * 200, MIN(MIN(zigzagValue[1 + zzg], zigzagValue[0 + zzg]), MIN(zigzagValue[3 + zzg], zigzagValue[2 + zzg])) - SUPRESRange * 2 )) { Print(Pfname + "TL.200ZZ-LowerSup3: not created ", ErrorDescription(_LastError));} //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-LowerSup3", OBJPROP_RAY_RIGHT, 0); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-LowerSup3", OBJPROP_WIDTH, 5); //
                    ObjectSetInteger(0, Pfname + "TL.200ZZ-LowerSup3", OBJPROP_COLOR, clrYellowGreen); //
          }
//set signals
          IsStructuresBuy  = Ask > zigzagValue[3] && Ask > zigzagValue[2] && _RSI.Is_RSI_BulishPeriodsShift(_Symbol, PERIOD_M5, 7, 14, PRICE_CLOSE, 0, 0) && !_RSI.Is_RSI_BulishPeriodsShift(_Symbol, PERIOD_M5, 7, 14, PRICE_CLOSE, 1, 1) ;
          IsStructuresSell = Ask < zigzagValue[3] && Ask < zigzagValue[2] && !_RSI.Is_RSI_BulishPeriodsShift(_Symbol, PERIOD_M5, 7, 14, PRICE_CLOSE, 0, 0) && _RSI.Is_RSI_BulishPeriodsShift(_Symbol, PERIOD_M5, 7, 14, PRICE_CLOSE, 1, 1) ; ///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TICK::DraweHLTF(ENUM_TIMEFRAMES tf, int s)
{         ObjectDelete(0, "TL." + EnumToString(tf) + "-VertS-1" ); //
          if(!ObjectCreate(0, "TL." + EnumToString(tf) + "-VertS-1", OBJ_TREND, 0, iTime(_Symbol, tf, s + -1), iHigh(_Symbol, tf, s + -1), iTime(_Symbol, tf, s + -1), iLow(_Symbol, tf, s + -1))) { Print("TL." + EnumToString(tf) + "-VertS-1" + ": not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-VertS-1", OBJPROP_RAY_RIGHT, 0); //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-VertS-1", OBJPROP_WIDTH, 2); //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-VertS-1", OBJPROP_COLOR, clrFuchsia); //
//
          ObjectDelete(0, "TL." + EnumToString(tf) + "-VertS+1" ); //
          if(!ObjectCreate(0, "TL." + EnumToString(tf) + "-VertS+1", OBJ_TREND, 0, iTime(_Symbol, tf, s + 1), iHigh(_Symbol, tf, s + 1), iTime(_Symbol, tf, s + 1), iLow(_Symbol, tf, s + 1))) { Print("TL." + EnumToString(tf) + "-VertS+1" + ": not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-VertS+1", OBJPROP_RAY_RIGHT, 0); //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-VertS+1", OBJPROP_WIDTH, 2); //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-VertS+1", OBJPROP_COLOR, clrFuchsia); //
//
          ObjectDelete(0, "TL." + EnumToString(tf) + "-VertS" ); //
          if(!ObjectCreate(0, "TL." + EnumToString(tf) + "-VertS", OBJ_TREND, 0, iTime(_Symbol, tf, s + 0), iHigh(_Symbol, tf, s + 0), iTime(_Symbol, tf, s + 0), iLow(_Symbol, tf, s + 0))) { Print("TL." + EnumToString(tf) + "-VertS" + ": not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-VertS", OBJPROP_RAY_RIGHT, 0); //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-VertS", OBJPROP_WIDTH, 2); //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-VertS", OBJPROP_COLOR, clrFuchsia); //
//
          ObjectDelete(0, "TL." + EnumToString(tf) + "-High" ); //
          if(!ObjectCreate(0, "TL." + EnumToString(tf) + "-High", OBJ_TREND, 0, iTime(_Symbol, tf, s), iHigh(_Symbol, tf, s), iTime(_Symbol, tf, s) + PeriodSeconds(tf) * 1, iHigh(_Symbol, tf, s))) { Print("TL." + EnumToString(tf) + "-High" + ": not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-High", OBJPROP_RAY_RIGHT, 1); //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-High", OBJPROP_WIDTH, 5); //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-High", OBJPROP_COLOR, clrYellowGreen); //
//
          ObjectDelete(0, "TL." + EnumToString(tf) + "-Low" ); //
          if(!ObjectCreate(0, "TL." + EnumToString(tf) + "-Low", OBJ_TREND, 0, iTime(_Symbol, tf, s), iLow(_Symbol, tf, s), iTime(_Symbol, tf, s) + PeriodSeconds(tf) * 1, iLow(_Symbol, tf, s)))   { Print("TL." + EnumToString(tf) + "-Low" + ": not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-Low", OBJPROP_RAY_RIGHT, 1); //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-Low", OBJPROP_WIDTH, 5); //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-Low", OBJPROP_COLOR, clrYellowGreen); //
//
          double mid = (iHigh(_Symbol, tf, s) + iLow(_Symbol, tf, s) ) / 2;
          ObjectDelete(0, "TL." + EnumToString(tf) + "-Mid" ); //
          if(!ObjectCreate(0, "TL." + EnumToString(tf) + "-Mid", OBJ_TREND, 0, iTime(_Symbol, tf, s), mid, iTime(_Symbol, tf, s) + PeriodSeconds(tf) * 1, mid))   { Print("TL." + EnumToString(tf) + "-Mid" + ": not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-Mid", OBJPROP_RAY_RIGHT, 1); //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-Mid", OBJPROP_WIDTH, 2); //
          ObjectSetInteger(0, "TL." + EnumToString(tf) + "-Mid", OBJPROP_COLOR, clrYellow); //
//
          {         int DiffBar = Bars(_Symbol, PERIOD_M1, iTime(_Symbol, tf, 0), iTime(_Symbol, PERIOD_M1, 0));
                    int H1 = iHighest(_Symbol, PERIOD_M1, MODE_HIGH, GetFrameNum(tf),  DiffBar);
                    int L1 = iLowest(_Symbol, PERIOD_M1, MODE_LOW, GetFrameNum(tf), DiffBar) ;
                    bool IsBulish = L1 > H1;
                    double        P1      = IsBulish ? iLow(_Symbol, PERIOD_M1, L1) : iHigh(_Symbol, PERIOD_M1, H1);
                    datetime      T1      = IsBulish ? iTime(_Symbol, PERIOD_M1, L1) : iTime(_Symbol, PERIOD_M1, H1);
                    double        P2      = IsBulish ? iHigh(_Symbol, PERIOD_M1, H1) : iLow(_Symbol, PERIOD_M1, L1);
                    datetime      T2      = IsBulish ? iTime(_Symbol, PERIOD_M1, H1) : iTime(_Symbol, PERIOD_M1, L1);
                    ObjectDelete(0, "TL." + EnumToString(tf) + "-Trend" ); //
                    if(!ObjectCreate(0, "TL." + EnumToString(tf) + "-Trend", OBJ_TREND, 0, T1, P1, T2, P2))   { Print("TL." + EnumToString(tf) + "-Trend" + ": not created ", ErrorDescription(_LastError));} //
                    ObjectSetInteger(0, "TL." + EnumToString(tf) + "-Trend", OBJPROP_RAY_RIGHT, 0); //
                    ObjectSetInteger(0, "TL." + EnumToString(tf) + "-Trend", OBJPROP_WIDTH, 2); //
                    ObjectSetInteger(0, "TL." + EnumToString(tf) + "-Trend", OBJPROP_COLOR, clrViolet); //
          }
//
          {         int DiffBar = Bars(_Symbol, PERIOD_M1, iTime(_Symbol, tf, 0), iTime(_Symbol, PERIOD_M1, 0));
                    int H1 = iHighest(_Symbol, PERIOD_M1, MODE_HIGH, DiffBar,  0);
                    int L1 = iLowest(_Symbol, PERIOD_M1, MODE_LOW, DiffBar, 0) ;
                    bool IsBulish = L1 > H1;
                    double        P1      = IsBulish ? iLow(_Symbol, PERIOD_M1, L1) : iHigh(_Symbol, PERIOD_M1, H1);
                    datetime      T1      = IsBulish ? iTime(_Symbol, PERIOD_M1, L1) : iTime(_Symbol, PERIOD_M1, H1);
                    double        P2      = IsBulish ? iHigh(_Symbol, PERIOD_M1, H1) : iLow(_Symbol, PERIOD_M1, L1);
                    datetime      T2      = IsBulish ? iTime(_Symbol, PERIOD_M1, H1) : iTime(_Symbol, PERIOD_M1, L1);
                    ObjectDelete(0, "TL." + EnumToString(tf) + "-TrendS0" ); //
                    if(!ObjectCreate(0, "TL." + EnumToString(tf) + "-TrendS0", OBJ_TREND, 0, T1, P1, T2, P2))   { Print("TL." + EnumToString(tf) + "-TrendS0" + ": not created ", ErrorDescription(_LastError));} //
                    ObjectSetInteger(0, "TL." + EnumToString(tf) + "-TrendS0", OBJPROP_RAY_RIGHT, 0); //
                    ObjectSetInteger(0, "TL." + EnumToString(tf) + "-TrendS0", OBJPROP_WIDTH, 2); //
                    ObjectSetInteger(0, "TL." + EnumToString(tf) + "-TrendS0", OBJPROP_COLOR, clrViolet); //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TICK::DraweHL(ENUM_TIMEFRAMES ft = PERIOD_M5)
{         //ENUM_TIMEFRAMES ft = PERIOD_M5;
          int barf = 50; int bare = 200;
          bool Is200HLBulish = iClose(_Symbol, ft, barf) > iClose(_Symbol, ft, bare);
          ObjectDelete(0, "TL.200HL" + EnumToString(ft) ); //
          if(!ObjectCreate(0, "TL.200HL" + EnumToString(ft), OBJ_TREND, 0, iTime(_Symbol, ft, bare), Is200HLBulish ? iLow(_Symbol, ft, bare) : iHigh(_Symbol, ft, bare), iTime(_Symbol, ft, barf), Is200HLBulish ? iHigh(_Symbol, ft, barf) : iLow(_Symbol, ft, barf))) { Print("TL.200HL: not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, "TL.200HL" + EnumToString(ft), OBJPROP_RAY_RIGHT, 0); //
          ObjectSetInteger(0, "TL.200HL" + EnumToString(ft), OBJPROP_WIDTH, 3); //
          ObjectSetInteger(0, "TL.200HL" + EnumToString(ft), OBJPROP_COLOR, clrRed); //
//
          int LowestBari = iLowest(_Symbol, ft, MODE_LOW, bare - barf, barf); int HighestBari = iHighest(_Symbol, ft, MODE_HIGH, bare - barf, barf);
          double LowestBarP = iLow(_Symbol, ft, LowestBari); double HighestBarP = iHigh(_Symbol, ft, HighestBari);
          ObjectDelete(0, "TL.200HLevel" + EnumToString(ft) ); //
          if(!ObjectCreate(0, "TL.200HLevel" + EnumToString(ft), OBJ_TREND, 0, iTime(_Symbol, ft, bare), HighestBarP, iTime(_Symbol, ft, barf), HighestBarP)) { Print("TL.200HLevel" + EnumToString(ft) + ": not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, "TL.200HLevel" + EnumToString(ft), OBJPROP_RAY_RIGHT, 1); //
          ObjectSetInteger(0, "TL.200HLevel" + EnumToString(ft), OBJPROP_WIDTH, 3); //
          ObjectSetInteger(0, "TL.200HLevel" + EnumToString(ft), OBJPROP_COLOR, clrRed); //
//
          ObjectDelete(0, "TL.200LLevel" + EnumToString(ft) ); //
          if(!ObjectCreate(0, "TL.200LLevel" + EnumToString(ft), OBJ_TREND, 0, iTime(_Symbol, ft, bare), LowestBarP, iTime(_Symbol, ft, barf), LowestBarP)) { Print("TL.200HLevel" + EnumToString(ft) + ": not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, "TL.200LLevel" + EnumToString(ft), OBJPROP_RAY_RIGHT, 1); //
          ObjectSetInteger(0, "TL.200LLevel" + EnumToString(ft), OBJPROP_WIDTH, 3); //
          ObjectSetInteger(0, "TL.200LLevel" + EnumToString(ft), OBJPROP_COLOR, clrRed); //
//
          ObjectDelete(0, "TL.200HLLevelMiddle" + EnumToString(ft) ); //
          if(!ObjectCreate(0, "TL.200HLLevelMiddle" + EnumToString(ft), OBJ_TREND, 0, iTime(_Symbol, ft, bare), (LowestBarP + HighestBarP) / 2, iTime(_Symbol, ft, barf), (LowestBarP + HighestBarP) / 2)) { Print("TL.200HLLevelMiddle: not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, "TL.200HLLevelMiddle" + EnumToString(ft), OBJPROP_RAY_RIGHT, 1); //
          ObjectSetInteger(0, "TL.200HLLevelMiddle" + EnumToString(ft), OBJPROP_WIDTH, 3); //
          ObjectSetInteger(0, "TL.200HLLevelMiddle" + EnumToString(ft), OBJPROP_COLOR, clrRed); //
//
//
          double chanHLRange = MathAbs(HighestBarP - (LowestBarP + HighestBarP) / 2);
          ObjectDelete(0, "TL.200HLevelx2" + EnumToString(ft) ); //
          if(!ObjectCreate(0, "TL.200HLevelx2" + EnumToString(ft), OBJ_TREND, 0, iTime(_Symbol, ft, bare),  HighestBarP + chanHLRange, iTime(_Symbol, ft, barf), HighestBarP + chanHLRange)) { Print("TL.200HLevelx2" + EnumToString(ft) + ": not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, "TL.200HLevelx2" + EnumToString(ft), OBJPROP_RAY_RIGHT, 1); //
          ObjectSetInteger(0, "TL.200HLevelx2" + EnumToString(ft), OBJPROP_WIDTH, 3); //
          ObjectSetInteger(0, "TL.200HLevelx2" + EnumToString(ft), OBJPROP_COLOR, clrRed); //
//
          ObjectDelete(0, "TL.200LLevelx2" + EnumToString(ft) ); //
          if(!ObjectCreate(0, "TL.200LLevelx2" + EnumToString(ft), OBJ_TREND, 0, iTime(_Symbol, ft, bare), LowestBarP - chanHLRange, iTime(_Symbol, ft, barf), LowestBarP - chanHLRange)) { Print("TL.200LLevelx2" + EnumToString(ft) + ": not created ", ErrorDescription(_LastError));} //
          ObjectSetInteger(0, "TL.200LLevelx2" + EnumToString(ft), OBJPROP_RAY_RIGHT, 1); //
          ObjectSetInteger(0, "TL.200LLevelx2" + EnumToString(ft), OBJPROP_WIDTH, 3); //
          ObjectSetInteger(0, "TL.200LLevelx2" + EnumToString(ft), OBJPROP_COLOR, clrRed); //
          bool Is20BarUpperTL_200HL = iClose(_Symbol, ft, 20) > ObjectGetValueByShift("TL.200HL" + EnumToString(ft), 20);
          bool IsPriceUnderTL200HLevelx2 = Ask < ObjectGetValueByShift("TL.200HLevel" + EnumToString(ft), 0);
          bool IsPriceAboveTL200LLevelx2 = Ask > ObjectGetValueByShift("TL.200LLevel" + EnumToString(ft), 0); //
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
/*
----/{4month 13 day rr =1:3(13t 8a.d.d(100->+10)(900, 300)pf:2.12 }
isBuySignal  = //
                              true
                              && isBulish_500HL
                              && BarPoint3Price < Close[0]
                              //&& HigherTrendPrice_0 < Close[0]
                              //&& LowerTrendPrice_0 < Close[0]
                              //---------------------------------------------------------------------
                              && iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0)
                              && iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0)
                              && iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0)
                              //--------------------------------------------------------------------
                              //&& IsMacdBuy_Bulish_M5   && StochBuySolo_M5
                              //&& iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > 0
                              //&& iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2)
                              //&&iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1) > 0 && iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 2) < 0//change phase//fall
                              //&&
                              //&& iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1) < iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 1)
                              //&& iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2) > iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 2)
                              //&& iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 3) > iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 3)
                              //&& iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2) < -0.6
                              //&&
                              //----------------------------------------
                              //&& iStdDev(_Symbol, PERIOD_M1, 20, 0, MODE_SMA, PRICE_CLOSE, 0) > 0.6
                              //&& iBullsPowerMACD_STATE(_Symbol, PERIOD_M1, 13, PRICE_CLOSE, 0) > 0
                              //&& iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 1) > iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 2)
                              //iAO(_Symbol, PERIOD_M5, 0) > iAO(_Symbol, PERIOD_M5, 1) && iAO(_Symbol, PERIOD_M5, 1) < iAO(_Symbol, PERIOD_M5, 2)//fall
                              //&& StochBuy_25_5_3
                              //---------------------------------------
                              && iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 0) > iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 0)
                              && iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 1) < iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 1)
                              && iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 2) < iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 2)
                              //---------------------------------------
                              ;;
                    isSellSignal = //
                              true
                              && !isBulish_500HL
                              && BarPoint3Price > Close[0]
                              //&& HigherTrendPrice_0 > Close[0]
                              //&& LowerTrendPrice_0 > Close[0]
                              //-----------------------------------------------------------------
                              && iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < iMACD(_Symbol, PERIOD_M15, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0)
                              && iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0)
                              && iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 0)
                              //-----------------------------------------------------------------------
                              //&& IsMacdSell_Bearish_M5 && StochSellSolo_M5
                              //&& iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < 0
                              //&& iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2)
                              //&& iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1) < 0 && iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2) > 0 //change phase //fall
                              //&&
                              //&& iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1) > iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 1)
                              //&& iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2) < iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 2)
                              //&& iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 3) < iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 3)
                              //&& iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2) < -0.6
                              //&&
                              //--------------------------------------------------------------------------------
                              //&& iStdDev(_Symbol, PERIOD_M1, 20, 0, MODE_SMA, PRICE_CLOSE, 0) > 0.6
                              //&& iBearsPowerMACD_STATE(_Symbol, PERIOD_M1, 13, PRICE_CLOSE, 0) > 0
                              //&& iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 1) < iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 2)
                              //iAO(_Symbol, PERIOD_M5, 0) < iAO(_Symbol, PERIOD_M5, 1) && iAO(_Symbol, PERIOD_M5, 1) > iAO(_Symbol, PERIOD_M5, 2)//fall
                              //&& StochSell_25_5_3
                              //-------------------------------------------------------------------------------
                              && iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 0) < iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 0)
                              && iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 1) > iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 1)
                              && iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 2) > iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 2)
                              //-------------------------------------------------------------------------------
                              ;;
                    {           macd cross points dd12
                              iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1) < iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 1)
                              && iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2) > iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 2)
                              && iMACD(_Symbol, PERIOD_M5, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2) < -0.6

                              iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 1) > iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 2)
                              && iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2) < iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_SIGNAL, 3)
                              && iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 2) < -0.6

}
*/
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
/*

//  Test_Deviation_Channel.mq4
                    int shiftmean = MathAbs(times1 - times2) / 2;
                    ObjectDelete("DEVx1");
                    //ObjectCreate("DEVx1", OBJ_STDDEVCHANNEL, 0, Time[times1], 0, Time[times2], 0);
                    ObjectSetDouble(0, "DEVx1", OBJPROP_DEVIATION, 1);//Devi + 2
                    ObjectSet("DEVx1", OBJPROP_COLOR, Yellow);
                    ObjectSet("STDx", OBJPROP_WIDTH, 3);
                    //
                    //Print("----------DEVx1 : ", ObjectGetDouble(0, "DEVx1", OBJPROP_PRICE, 1));
                    //-------------------------------------------------------------------------------+
double Arr[];
                    int n = MathAbs(times1 - times2) - 0;
                    ArrayResize(Arr, n);
                    //---------
                    for(int i = 0; i < n; i++)  { Arr[i] =  (High[i] + Low[i]) / 2; } //+ High[i] + Low[i] + Open[i]//Close[i]//iMA(_Symbol, PERIOD_M1, n, 0, MODE_SMA, PRICE_CLOSE, i)
                    //-------
                    double standardDeviation_Length_A = NormalizeDouble(GetStdDev(Arr, ArraySize(Arr)), 2);
                    //------------------------------------------------
                    double ArrB[];
                    int nB = MathAbs(times1 - times2) / 2;
                    ArrayResize(ArrB, nB);
                    //------
                    for(int i = 0; i < nB; i++)  { ArrB[i] =  (High[i] + Low[i]) / 2; } //+ High[i] + Low[i] + Open[i]//Close[i]//iMA(_Symbol, PERIOD_M1, n, 0, MODE_SMA, PRICE_CLOSE, i)
                    //-------
                    double standardDeviation_Length_B = NormalizeDouble(GetStdDev(ArrB, ArraySize(ArrB)), 2);
                    //------------------------------------------------
                    bool isBulish_500HL = Close[times1] < Close[times2];
                    standardDeviation_Length_A = isBulish_500HL ? -standardDeviation_Length_A : +standardDeviation_Length_A;
                    double          deviation1       = iStdDev(_Symbol, PERIOD_M1, n, n, MODE_SMA, PRICE_CLOSE, 0);//iBarShift(_Symbol, 0, Time[shiftmean])
                    //standardDeviation_Length_A = deviation1; //
                    Print("standardDeviation_Length_A: ", standardDeviation_Length_A, "  deviation1:", deviation1);
                    //ObjectDelete("STDxB");
                    //ObjectCreate("STDxB", OBJ_TREND, 0, Time[times1], meanB, Time[times2], meanB );
                    //ObjectSet("STDxB", OBJPROP_WIDTH, 1);
                    //ObjectSet("STDxB", OBJPROP_COLOR, clrCadetBlue );
                    //ObjectSet("STDxB", OBJPROP_RAY_RIGHT, false);
                    //---
                    {         //
                              //double Aslope = mean / Time[(n / 2)]; ///y = ax
                              ////Print("Aslope: ", Aslope);
                              ////---find b
                              //double b = -(mean / (Aslope * Time[(n / 2)]));
                              ////Print("b: ", b);
                              ////---find price1
                              //double priceTwo = Aslope * Time[times2] + b;
                              ////Print("priceOne: ", priceTwo);
                              /////----------------------------------------------------- Ym = (Ya+Yb)/2     Xm = (Xa+Xb)/2 .--->>>
                              /////----------------------------------------------------- Ya-Yb = M(Xa-Xb) .--->>>
                              //double priceOne = Aslope * Time[times1] + b;
                              ////Print("priceOne: ", priceOne);
                              ////---//--zaviye? //MathTan(10.0);
                              //------------------------------------------------
                              //double PriceSS= mean*2;
                              //double PriceSS
                              double dev1 = iStdDev(_Symbol, PERIOD_M1, n, 0, MODE_SMA, PRICE_CLOSE, times1 ) ;
                              double dev2 = iStdDev(_Symbol, PERIOD_M1, n, 400, MODE_SMA, PRICE_CLOSE, times2 ) ;
                              //double As = mean + iStdDev(_Symbol, Period(), 54, 0, MODE_SMA, PRICE_CLOSE, 0);
                              //double Bs = mean - iStdDev(_Symbol, Period(), 54, 0, MODE_SMA, PRICE_CLOSE, 0);
                              //------------------------------------------------
                              //double PricePoint1 = mean + standardDeviation_Length_A ;
                              //double PricePoint2 = mean - standardDeviation_Length_A ;
                              //PricePoint1 = mean + standardDeviation_Length_A;
                              //PricePoint2 = mean - standardDeviation_Length_A;
                              //ObjectDelete("STDxX");
                              //ObjectCreate("STDxX", OBJ_TREND, 0, Time[times1], PricePoint1, Time[times2], PricePoint2  ); //base line
                              //ObjectSet("STDxX", OBJPROP_WIDTH, 2);
                              //ObjectSet("STDxX", OBJPROP_COLOR, clrYellowGreen );
                              //ObjectSet("STDxX", OBJPROP_RAY_RIGHT, false);
                              //----
                              //ObjectDelete("STDxC");
                              //ObjectCreate("STDxC", OBJ_TREND, 0, Time[n / 2], mean, Time[nB / 2], meanB );
                              //ObjectSet("STDxC", OBJPROP_WIDTH, 1);
                              //ObjectSet("STDxC", OBJPROP_COLOR, clrCadetBlue );
                              //ObjectSet("STDxC", OBJPROP_RAY_RIGHT, false);
                    }
                    //
                    ObjectDelete("STDxHBound");
                    //ObjectCreate("STDxHBound", OBJ_TREND, 0, Time[times1], mean + standardDeviation_Length_A + standardDeviation_Length_A, Time[times2], mean - standardDeviation_Length_A + standardDeviation_Length_A );
                    ObjectSet("STDxHBound", OBJPROP_WIDTH, 1);
                    ObjectSet("STDxHBound", OBJPROP_COLOR, clrCadetBlue );
                    ObjectSet("STDxHBound", OBJPROP_RAY_RIGHT, false);
                    ObjectDelete("STDxLBound");
                    //ObjectCreate("STDxLBound", OBJ_TREND, 0, Time[times1], mean + standardDeviation_Length_A - standardDeviation_Length_A, Time[times2], mean - standardDeviation_Length_A - standardDeviation_Length_A );
                    ObjectSet("STDxLBound", OBJPROP_WIDTH, 1);
                    ObjectSet("STDxLBound", OBJPROP_COLOR, clrCadetBlue );
                    ObjectSet("STDxLBound", OBJPROP_RAY_RIGHT, false);
                    //
                    ObjectDelete("STDxHBound1");
                    //ObjectCreate("STDxHBound1", OBJ_TREND, 0, Time[times1], mean + standardDeviation_Length_A + standardDeviation_Length_A * 1.61, Time[times2], mean - standardDeviation_Length_A + standardDeviation_Length_A * 1.61 );
                    ObjectSet("STDxHBound1", OBJPROP_WIDTH, 1);
                    ObjectSet("STDxHBound1", OBJPROP_COLOR, clrCadetBlue );
                    ObjectSet("STDxHBound1", OBJPROP_RAY_RIGHT, false);
                    ObjectDelete("STDxLBound1");
                    //ObjectCreate("STDxLBound1", OBJ_TREND, 0, Time[times1], mean + standardDeviation_Length_A - standardDeviation_Length_A * 1.61, Time[times2], mean - standardDeviation_Length_A - standardDeviation_Length_A * 1.61 );
                    ObjectSet("STDxLBound1", OBJPROP_WIDTH, 1);
                    ObjectSet("STDxLBound1", OBJPROP_COLOR, clrCadetBlue );
                    ObjectSet("STDxLBound1", OBJPROP_RAY_RIGHT, false);
                    //
                    ObjectDelete("STDxHBound2");
                    //ObjectCreate("STDxHBound2", OBJ_TREND, 0, Time[times1], mean + standardDeviation_Length_A + standardDeviation_Length_A * 2.61, Time[times2], mean - standardDeviation_Length_A + standardDeviation_Length_A * 2.61 );
                    ObjectSet("STDxHBound2", OBJPROP_WIDTH, 1);
                    ObjectSet("STDxHBound2", OBJPROP_COLOR, clrCadetBlue );
                    ObjectSet("STDxHBound2", OBJPROP_RAY_RIGHT, false);
                    ObjectDelete("STDxLBound2");
                    //ObjectCreate("STDxLBound2", OBJ_TREND, 0, Time[times1], mean + standardDeviation_Length_A - standardDeviation_Length_A * 2.61, Time[times2], mean - standardDeviation_Length_A - standardDeviation_Length_A * 2.61 );
                    ObjectSet("STDxLBound2", OBJPROP_WIDTH, 1);
                    ObjectSet("STDxLBound2", OBJPROP_COLOR, clrCadetBlue );
                    ObjectSet("STDxLBound2", OBJPROP_RAY_RIGHT, false);
                    //-------------------------------------------------------------------------------
                    if(1)
                    {         ObjectDelete("STDxlevel");
                              //ObjectCreate("STDxlevel", OBJ_TREND, 0, Time[times1], mean, Time[times2], mean );
                              ObjectSet("STDxlevel", OBJPROP_WIDTH, 2);
                              ObjectSet("STDxlevel", OBJPROP_COLOR, clrPaleGreen );
                              ObjectSet("STDxlevel", OBJPROP_RAY_RIGHT, false);
                              ObjectDelete("STDxlevelHBound");
                              //ObjectCreate("STDxlevelHBound", OBJ_TREND, 0, Time[times1], mean + standardDeviation_Length_A, Time[times2], mean  + standardDeviation_Length_A );
                              ObjectSet("STDxlevelHBound", OBJPROP_WIDTH, 2);
                              ObjectSet("STDxlevelHBound", OBJPROP_COLOR, clrDarkGoldenrod );
                              ObjectSet("STDxlevelHBound", OBJPROP_RAY_RIGHT, false);
                              ObjectDelete("STDxlevelLBound");
                              //ObjectCreate("STDxlevelLBound", OBJ_TREND, 0, Time[times1], mean - standardDeviation_Length_A, Time[times2], mean - standardDeviation_Length_A );
                              ObjectSet("STDxlevelLBound", OBJPROP_WIDTH, 2);
                              ObjectSet("STDxlevelLBound", OBJPROP_COLOR, clrDarkGoldenrod );
                              ObjectSet("STDxlevelLBound", OBJPROP_RAY_RIGHT, false);
                              //
                              ObjectDelete("STDxlevelHBound2");
                              //ObjectCreate("STDxlevelHBound2", OBJ_TREND, 0, Time[times1], mean + standardDeviation_Length_A * 2, Time[times2], mean  + standardDeviation_Length_A * 2 );
                              ObjectSet("STDxlevelHBound2", OBJPROP_WIDTH, 2);
                              ObjectSet("STDxlevelHBound2", OBJPROP_COLOR, clrDarkGoldenrod );
                              ObjectSet("STDxlevelHBound2", OBJPROP_RAY_RIGHT, false);
                              ObjectDelete("STDxlevelLBound2");
                              //ObjectCreate("STDxlevelLBound2", OBJ_TREND, 0, Time[times1], mean - standardDeviation_Length_A * 2, Time[times2], mean - standardDeviation_Length_A * 2 );
                              ObjectSet("STDxlevelLBound2", OBJPROP_WIDTH, 2);
                              ObjectSet("STDxlevelLBound2", OBJPROP_COLOR, clrDarkGoldenrod );
                              ObjectSet("STDxlevelLBound2", OBJPROP_RAY_RIGHT, false);
                              //
                    }
                    //-------------------------------------------------------------------------------
                    //while(!IsStopped())
                    //
                    {         //Print(" DEVx1 , OBJPROP_TIME1:  ", ObjectGet("DEVx1", OBJPROP_TIME1)); //
                              //          Print(" DEVx1 , OBJPROP_TIME2:  ", ObjectGet("DEVx1", OBJPROP_TIME2)); //
                              int             period          = iBarShift(_Symbol, 0, Time[times1]) - iBarShift(_Symbol, 0, Time[times2]);
                              //period                          = MathAbs(times1 - times2); ;//iBarShift(_Symbol, 0, Time[times1]) - iBarShift(_Symbol, 0, Time[times2]);
                              double          deviation       = iStdDev(_Symbol, PERIOD_M1, period, 0, MODE_SMA, PRICE_CLOSE, iBarShift(_Symbol, 0, (datetime)ObjectGet("DEVx1", OBJPROP_TIME2)));
                              deviation                       = iStdDev(_Symbol, PERIOD_M1, period, 0, MODE_SMA, PRICE_CLOSE, iBarShift(_Symbol, 0, Time[times2]) ); //iBarShift(_Symbol, 0, Time[times2])
                              ObjectDelete("UL11");
                              //ObjectCreate("UL11", OBJ_TREND, 0,
                              // Time[times1],//(datetime)ObjectGet("DEVx1", OBJPROP_TIME1)
                              // ObjectGetValueByShift("DEVx1", times1) + deviation, //Close[times1] + deviation//ObjectGet("DEVx1", OBJPROP_PRICE1) + deviation
                              // Time[times2],//iBarShift(_Symbol, 0, (datetime)ObjectGet("DEVx1", OBJPROP_TIME2))
                              // ObjectGetValueByShift("DEVx1", times2) + deviation//Close[times2] + deviation //ObjectGet("DEVx1", OBJPROP_PRICE2) + deviation
                              //);
                              ObjectSetInteger(0, "UL11", OBJPROP_RAY_RIGHT, false); //
                              //Print(" DEVx1 , OBJPROP_PRICE1:  ", ObjectGet("DEVx1", OBJPROP_PRICE1)); //
                              //Print(" DEVx1 , OBJPROP_PRICE2:  ", ObjectGet("DEVx1", OBJPROP_PRICE2)); //
                              ////
                              //Print(" DEVx1 , OBJPROP_PRICE1s:  ", ObjectGetDouble(ChartID(), "DEVx1", OBJPROP_PRICE1)); //
                              //Print(" DEVx1 , OBJPROP_PRICE2s:  ", ObjectGetDouble(ChartID(), "DEVx1", OBJPROP_PRICE2)); //
                              //
                              ObjectDelete("LL11");
                              //ObjectCreate("LL11", OBJ_TREND, 0,
                              // Time[times1],// Time[iBarShift(_Symbol, 0, (datetime)ObjectGet("DEVx1", OBJPROP_TIME1))],
                              // ObjectGetValueByShift("DEVx1", times1) - deviation,//Close[times1] - deviation, //ObjectGet("DEVx1", OBJPROP_PRICE1) - deviation
                              // Time[times2],//Time[iBarShift(_Symbol, 0, (datetime)ObjectGet("DEVx1", OBJPROP_TIME2))],
                              // ObjectGetValueByShift("DEVx1", times2) - deviation//Close[times2] - deviation //ObjectGet("DEVx1", OBJPROP_PRICE2) - deviation
                              //);
                              ObjectSetInteger(0, "LL11", OBJPROP_RAY_RIGHT, false); //
                              //-----------------------------------------------------------------------------------------------------------------------------iBarShift(_Symbol, 0, (datetime)ObjectGet("DEVx1", OBJPROP_TIME2))
                              int     HighBar           = iHighest(_Symbol, 0, MODE_HIGH, period, iBarShift(_Symbol, 0, Time[times2]) );
                              double  HighPrice         = High[HighBar];
                              double  UpperDevLinePrice = ObjectGetValueByShift("UL", HighBar);
                              ObjectDelete("DevArrow");
                              //ObjectCreate("DevArrow", OBJ_ARROW, 0, Time[HighBar], UpperDevLinePrice, 0, 0);
                              ObjectSet("DevArrow", OBJPROP_ARROWCODE, 2);
                              //
                              ObjectDelete("HighArrow");
                              //ObjectCreate("HighArrow", OBJ_ARROW, 0, Time[HighBar], HighPrice, 0, 0);
                              ObjectSet("HighArrow", OBJPROP_ARROWCODE, 2);
                              //Comment( "Time 1 = " + ObjectGet("DEV", OBJPROP_TIME1) + "\n" + "Time 2 = " +
                              //         ObjectGet("DEVx1", OBJPROP_TIME2) + "\n" + "Price1 = " + ObjectGet("DEV", OBJPROP_PRICE1) +
                              //         "\n" + "Price2 = " + ObjectGet("DEVx1", OBJPROP_PRICE2) + "\n" + "Highest Price during Channel " + HighPrice +
                              //         "\n" + "Upper Channel Price at Highest Price = " + UpperDevLinePrice + "\n" );
                              //Sleep(32);//
                    }
                    //
                    //if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar)
                    if(0)
                    {         ObjectDelete("DEVo");
                              ObjectCreate("DEVo", OBJ_STDDEVCHANNEL, 0, Time[100], 0, Time[0], 0);
                              ObjectSet("DEVo", OBJPROP_COLOR, Yellow);
                              //while(!IsStopped())
                              {         int             period          = iBarShift(_Symbol, 0, ObjectGet("DEVo", OBJPROP_TIME1)) - iBarShift(_Symbol, 0, ObjectGet("DEVo", OBJPROP_TIME2));
                                        double          deviation       = iStdDev(_Symbol, 0, period, 0, 0, 0, iBarShift(_Symbol, 0, ObjectGet("DEVo", OBJPROP_TIME2)));
                                        ObjectDelete("UL");
                                        ObjectCreate("UL", OBJ_TREND, 0,
                                                     Time[iBarShift(_Symbol, 0, ObjectGet("DEVo", OBJPROP_TIME1))],
                                                     ObjectGet("DEVo", OBJPROP_PRICE1) + deviation,
                                                     Time[iBarShift(_Symbol, 0, ObjectGet("DEVo", OBJPROP_TIME2))],
                                                     ObjectGet("DEVo", OBJPROP_PRICE2) + deviation);
                                        ObjectDelete("LL");
                                        ObjectCreate("LL", OBJ_TREND, 0,
                                                     Time[iBarShift(_Symbol, 0, ObjectGet("DEVo", OBJPROP_TIME1))],
                                                     ObjectGet("DEVo", OBJPROP_PRICE1) - deviation,
                                                     Time[iBarShift(_Symbol, 0, ObjectGet("DEVo", OBJPROP_TIME2))],
                                                     ObjectGet("DEVo", OBJPROP_PRICE2) - deviation);
                                        int     HighBar           = iHighest(_Symbol, 0, MODE_HIGH, period, iBarShift(_Symbol, 0, ObjectGet("DEVo", OBJPROP_TIME2)));
                                        double  HighPrice         = High[HighBar];
                                        double  UpperDevLinePrice = ObjectGetValueByShift("UL", HighBar);
                                        ObjectDelete("DevoArrow");
                                        ObjectCreate("DevoArrow", OBJ_ARROW, 0, Time[HighBar], UpperDevLinePrice, 0, 0);
                                        ObjectSet("DevoArrow", OBJPROP_ARROWCODE, 2);
                                        ObjectDelete("DevoHighArrow");
                                        ObjectCreate("DevoHighArrow", OBJ_ARROW, 0, Time[HighBar], HighPrice, 0, 0);
                                        ObjectSet("DevoHighArrow", OBJPROP_ARROWCODE, 2);
                                        //Comment( "Time 1 = " + ObjectGet("DEVo", OBJPROP_TIME1) + "\n" + "Time 2 = " +
                                        //         ObjectGet("DEVo", OBJPROP_TIME2) + "\n" + "Price1 = " + ObjectGet("DEVo", OBJPROP_PRICE1) +
                                        //         "\n" + "Price2 = " + ObjectGet("DEVo", OBJPROP_PRICE2) + "\n" + "Highest Price during Channel " + HighPrice +
                                        //         "\n" + "Upper Channel Price at Highest Price = " + UpperDevLinePrice + "\n" );
                                        //Sleep(32);//
                              } //
                              //ObjectDelete("DEVo");
                              //
                    }//


*/
//+------------------------------------------------------------------+
//bool        isBulish_500HL;
//double      BarPoint3Price;
//{         int lengh = 500;
//          int         ilow            = iLowest(_Symbol, PERIOD_M5, MODE_LOW, lengh, 0);
//          int         ihigh           = iHighest(_Symbol, PERIOD_M5, MODE_HIGH, lengh, 0);
//          double      Lowest          = iLow(_Symbol, PERIOD_M5, ilow );
//          double      Highest         = iHigh(_Symbol, PERIOD_M5, ihigh);
//          isBulish_500HL        = ilow > ihigh;
//          int         BarPoint3;
//          if(isBulish_500HL)
//          {         //redefine highest
//                    Highest           = iHigh(_Symbol, PERIOD_M5, iHighest(_Symbol, PERIOD_M5, MODE_HIGH, lengh / 2, lengh / 2));
//                    BarPoint3         = iLowest(_Symbol, PERIOD_M5, MODE_LOW, iHighest(_Symbol, PERIOD_M5, MODE_HIGH, lengh / 2, lengh / 2), 0);//
//                    BarPoint3Price    = iLow(_Symbol, PERIOD_M5, BarPoint3); // //
//                    //
//                    //
//                    ObjectDelete(0, "FE.500" ); //
//                    ObjectCreate(0, "FE.500", OBJ_EXPANSION, 0, Time[ilow], Low[ilow], Time[ihigh], High[ihigh], Time[BarPoint3], Low[BarPoint3]); //
//                    ObjectSetInteger(0, "FE.500", OBJPROP_COLOR, clrWhite);
//                    ObjectSetInteger(0, "FE.500", OBJPROP_WIDTH, 1);
//                    //
//                    //
//          }
//          else
//          {         //redefine lowest
//                    Lowest            = iLow(_Symbol, PERIOD_M5, iLowest(_Symbol, PERIOD_M5, MODE_LOW, lengh / 2, lengh / 2));
//                    BarPoint3         = iHighest(_Symbol, PERIOD_M5, MODE_HIGH, iLowest(_Symbol, PERIOD_M5, MODE_LOW, lengh / 2, lengh / 2), 0); //
//                    BarPoint3Price    = iHigh(_Symbol, PERIOD_M5, BarPoint3); //
//                    //
//                    ObjectDelete(0, "FE.500" ); //
//                    ObjectCreate(0, "FE.500", OBJ_EXPANSION, 0, Time[ihigh], High[ihigh], Time[ilow], Low[ilow], Time[BarPoint3], High[BarPoint3]); //
//                    ObjectSetInteger(0, "FE.500", OBJPROP_COLOR, clrWhite);
//                    ObjectSetInteger(0, "FE.500", OBJPROP_WIDTH, 1);
//                    //
//          } //
//}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
