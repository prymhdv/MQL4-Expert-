//+------------------------------------------------------------------+
//||   ||||||||||                 Ct_StopLoss.mqh                    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\Ct_Market_Symbol.mqh>
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTC\.CoverOTC.mqh>
//======================================
#define OPENPRICE              0
#define CLOSEPRICE             1
//------------------------------
#define CLOSEALL             0
#define CLOSELAST            1
#define CLOSEPROFIT          2
#define CLOSELOSS            3
#define CLOSEPARTIAL         4

//------------------------------
//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
class Ct_StopLoss
{
private:

public:
          void           Ct_StopLoss();
          void           ~Ct_StopLoss() {};
          bool           Update(int Sl_Fixed_Pip);//  if(true)//Calcing TPSLPP
          //---------------
          int            Curr_Pip,       Fixed_Pip,        INP_Pip,  Curr_RiskedStopLossPip, RiskedStopLossPoints, SL_CPR; //StopLoss_CurrPointsRisked
          double         Curr_RiskedStopLossPrice;
          double         StopLossAmount(double StopLossCom);
          void           UpdateAdditionalFixedSL(int i);
          //
          double         SLAmount;
          string         WarningSL;    //= "";

          bool           SetSL(int Type, int op_tkt, double StopLossCom);
          double         SetSLPipsByPercent_lots(string symbol, double percent, double lots);   //AccountPercentStopPips
          double         SetSLPointsByPercent_lots(string symbol, double percent, double lots); //AccountPercentStopPoints//export

          //---------------

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_StopLoss::Ct_StopLoss()
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_StopLoss Error",  __LINE__, __FUNCTION__); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_StopLoss::SetSL(int Type, int op_tkt, double StopLossCom)
{
//================================================
          if(Type == OP_BUY)
          {         if( StopLossCom > 0 && StopLossCom >=   ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_STOPLEVEL)
                    {         if(OrderSelect(op_tkt, SELECT_BY_TICKET, MODE_TRADES))
                              {         if(!OrderModify(OrderTicket(), OrderOpenPrice(), OrderOpenPrice() - StopLossCom * _Point, OrderTakeProfit(), 0, std_Global.COLOR_SELL))
                                        {         //-- Error
                                                  Print("Error in OrderModify. Error code=", _LastError);
                                                  Sound.PlaySoundS(Sound.ErrorSound );
                                                  Sleep(________________________________________________________Xerorr.ErrorInterval); }
                                        else
                                        {         //-- Succeeded
                                                  //Print("ct_Order modified successfully");
                                        } //
                              } //
                    }//
          }//
          if(Type == OP_SELL )
          {         if(StopLossCom > 0 && StopLossCom >= ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_STOPLEVEL)
                    {         if(OrderSelect(op_tkt, SELECT_BY_TICKET, MODE_TRADES))
                              {         if(!OrderModify(OrderTicket(), OrderOpenPrice(), OrderOpenPrice() + StopLossCom * _Point, OrderTakeProfit(), 0, std_Global.COLOR_SELL))
                                        {         //-- Error
                                                  Print("Error in OrderModify. Error code=", _LastError);
                                                  Sound.PlaySoundS(Sound.ErrorSound );
                                                  Sleep(________________________________________________________Xerorr.ErrorInterval);//
                                        }
                                        else
                                        {         //-- Succeeded
                                                  //Print("ct_Order modified successfully");
                                        }//
                              } //
                    } //
          }
//================================================
          return true;//
//================================================
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_StopLoss::StopLossAmount(double StopLossCom)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          if(false) // Check and adjust for TickSize granularity.
          {         //  if (TickSize > 0)
                    // {         sets.StopLossLevel = NormalizeDouble(MathRound(sets.StopLossLevel / TickSize) * TickSize, _Digits);
                    //            ObjectSetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, sets.StopLossLevel); }
                    // sets.StopLoss = (int)MathRound(MathAbs(sets.StopLossLevel - sets.EntryLevel) / _Point);//
          }
          return ( SLAmount = StopLossCom * Point); //
}
//+------------------------------------------------------------------+
/// The Account Percent Stop limits the loss to a
/// predefined percent of the account balance.
/// Returns the number of pips for the StopLoss.
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|Limits the order loss to a predefined percent of the account balance.
//|MarketInfo(Symbol(),MODE_TICKVALUE) will reflect the leverage currently in use.
//|and is the value of one tick (per MODE_LOTSIZE) of the counter currency (per MODE_TICKSIZE) in the account deposit currency
//|It's the method the broker uses to 'translate' your profit on trading any pair into the account currency, its like an 'exchange rate'.
//|MODE_TICKVALUE is calculated using Bid values. If calculated using Ask, it will have minor discrepancy compared to calling MODE_TICKVALUE - Spread.
//|This is because we buy from market at bid, sell back to market at ask i.e. always pay spread
//|This is because we sell to market at ask, buy back from market at bid i.e. always pay spread
//|Point is the smallest possible price movement. MODE_TICKSIZE can be greater than Point.
//|MarketInfo(pair, MODE_TICKVALUE) / MarketInfo(pair, MODE_TICKSIZE)
//+------------------------------------------------------------------+
double Ct_StopLoss::SetSLPipsByPercent_lots(string symbol, double percent, double lots)//AccountPercentStopPips
{         double balance  = AccountBalance();
          double exchrate = ct_Drive.TDD.ct_Account.AccountExchangeRate(symbol);
          double lotsize  = MarketInfo(symbol, MODE_LOTSIZE);
          double point    = MarketInfo(symbol, MODE_POINT);
          double spread   = MarketInfo(symbol, MODE_SPREAD);
          double stopLossPips = percent * balance * exchrate / (lots * lotsize * point) - spread;
          return (stopLossPips);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ct_StopLoss::SetSLPointsByPercent_lots(string symbol, double percent, double lots) //AccountPercentStopPoints//export
{         double AccountRisk = (percent / 100) * AccountBalance();
          double lotsize = MarketInfo(symbol, MODE_LOTSIZE);
          double point = MarketInfo(Symbol(), MODE_POINT);
          double exchrate = 1 / (MarketInfo(symbol, MODE_TICKVALUE));
          if(Digits == 3)
                    point = point / 100;
          double stopLossPoints = NormalizeDouble(((AccountRisk * exchrate) / (lots * lotsize * point)), 0);
//Minimal permissible StopLoss value in points.
          if(stopLossPoints < MarketInfo(Symbol(), MODE_STOPLEVEL) || stopLossPoints <= MarketInfo(Symbol(), MODE_SPREAD) || stopLossPoints <= 0)
                    stopLossPoints = -1;
          return (stopLossPoints);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_StopLoss::Update(int Sl_Fixed_Pip)//  if(true)//Calcing TPSLPP
{         Fixed_Pip = Sl_Fixed_Pip;//200; //Pipet
          if(true)//ManualModeGet
          {         if(ObjectFind(0, "S_EDIT " + "Set SL..") >= 0)
                    {         if(Utilities.StringLieraled("S_EDIT " + "Set SL.." )) { ObjectSetString(0, "S_EDIT " + "Set SL..", OBJPROP_TEXT, "Set SL.."); }
                              if(ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_SL_Ok)                          { INP_Pip = (int)Utilities.DescToDouble("S_EDIT " + "Set SL.."); } //
                              //--Alert("S_EDIT " + "Set SL..: ", Utilities.DescToDouble("S_EDIT " + "Set SL..")); //
                    }//
          }
          else if(!ct_Drive.TDD.ct_Bank.Is_MoneyManagerPad)//AutoModeGet
          {         INP_Pip       = (int)MathRound(MathAbs(Ask - Bid) + Bid * 0.01) ;  }
          //---------------------------------------------------Assignment
          Curr_Pip                         = INP_Pip;              //Alert(" Fixed_Pip: ", Fixed_Pip, " INP_Pip: ", INP_Pip, " ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_SL_Ok:", ct_Drive.TDD.ct_Bank.BANK_Pad_DATA.Set_SL_Ok, "--Line:", __LINE__);
          
          //---------------------------------------------------checking & verifying
          if (Curr_Pip < 200)           {Curr_Pip    = Fixed_Pip;}
          //---------------------------------------------------GetAmount TPSLPP
          StopLossAmount(Curr_Pip);
          RiskedStopLossPoints = Curr_Pip;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return true;//
}
//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
