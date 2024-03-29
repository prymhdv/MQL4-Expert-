//+------------------------------------------------------------------+
//|                                                       Ct_Bank.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+ ///////Money Manager////////
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\.CoverOT.mqh>
//---------------------------------------------------------------------
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\Ct_Positions.mqh>                 //--ct_Positions.Update(); 
//+------------------------------------------------------------------+
//|             Class Ct_Bank::     BEGIN                             | ///////Money Manager////////          ///////Money Manager////////
//+------------------------------------------------------------------+
//To me all these hidden traps that can destroy your trading account are unacceptable.
//Forcing traders to use volume in order to enter a new trade is a dangerous way to manage risk as it is hidden.
//It is also not the way traders actually trade .. we don't care about volume as all trades are based on risk amount as percentage of account equity.

enum ENUM_MMType
{         MM_Fixed,
          MM_Auto,
          MM_Manual, //
};
struct St_BANK_Pad_data
{

          bool          IsMM_Panel;
          //----------------------------------------------------------
          bool          Set_PP_Ok;//
          bool          Set_TP_Ok;//
          bool          Set_SL_Ok;//
          //
          bool          Set_TS_Ok;//
          bool          Set_MP_Ok;//
          //
          bool          Set_Lots_Ok;//
          bool          Set_RiskAmount_Ok;//
          bool          Set_EquityAmount_Ok;//
          bool          Set_RiskPercent_Ok;//



}; 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_Bank
{         //Get Data for Cheak,Calc,Set PriceLevels & Manage Money Perfection and additional Dependeds//
private:  string        NameSelf;
          double        ScoreSelf;
          double        CountSelf;
//===============================================================
public: Ct_Positions             ct_Positions;
        St_BANK_Pad_data         BANK_Pad_DATA;
//===============================================================
public:
          void          ~Ct_Bank() {};
//Ct_Bank::Ct_Bank()///exchanged??>>>
          void          Ct_Bank(): CountSelf(-5.3), ScoreSelf(5)
          {         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Bank Error",  __LINE__, __FUNCTION__); //
                    UpdateSecound = 5; Update(); UseLeverage = false; CFDLot = false; MMTypeX = MM_Fixed; //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Bank Error",  __LINE__, __FUNCTION__);//
                    return;//
          }
          string        m_string;
          void          Ct_Bank( const double u, string str = NULL, const double i = 0.1): m_string(str) { }//////errorr All are defaulted//'Ct_Bank' - ambiguous call to overloaded function with the same parameters  Capitan.mqh         131       71
          ushort operator[] (int x) { return(StringGetCharacter(m_string, x)); }
//------------------------------------------------------------------------------
          void          Ct_Bank(const string r): NameSelf(r), ScoreSelf(0.0) {  }                  ///by one basic variables build
          void          Ct_Bank(const double r, const double i): CountSelf(r), ScoreSelf(i) {  }    ///by basic variables build
          void          Ct_Bank(const Ct_Bank &o): NameSelf(o.NameSelf), ScoreSelf(o.ScoreSelf) { }             ///by oject build
//===============================================================
          bool          Update();//Refresh()
          bool          UPDATED;
          int           UpdateSecound;//
          bool          UseLeverage, CFDLot;
//===============================================================
          bool          IsForex() {         return true;};
          int           CheckOpenTrades(int BS, int MN);//CheckOpenTrades

          double        Min_LossTicket;    //= -10.0;
          double        Max_LossTicket;    //= -10.0;
          double        Min_ProfitTicket;  //= -10.0;
          double        Max_ProfitTicket;  //= -10.0;
          //--------------------------------------------------
          bool          Min_LossTicketOk;
          bool          Max_LossTicketOk;
          bool          Min_ProfitTicketOk;
          bool          Max_ProfitTicketOk;
          //--------------------------------------------------
          double        Min_LossInp;
          double        Min_ProfitInp;
          double        Min_Profit ;//= 10.0;
          double        Min_Loss ;//= -10.0;
          bool          Is_Profited();
          bool          Is_Lossed();
          void          CalculateOpenVolume(double &volume_buy, double &volume_sell);//
          double        DailyProfits();
          double        DailyPoints();
          double        DailyReturn();
//===============================================================Robo Data
          int           MagicNumber_Inp ;
          int           MagicNumber ;
          bool          MagicNumberOk;
          bool          Is_MagicNumber();
//===============================================================Money Data

//===============================================================Ending Trade Data
          bool          Is_MoneyManagerPad;//
//===============================================================
          ENUM_MMType   MMTypeX;    //  MM_Fixed,  MM_Auto,   MM_Manual, //



//================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Bank::Update()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Bank Error",  __LINE__, __FUNCTION__);//
          //Alert("+====================================================+" + __FUNCTION__); //
          UPDATED = false;
          if(PulseThere.ExecuteONPulse(true, UpdateSecound))
          {         /*Alert("+====================================================+" + __FUNCTION__ + (string)__LINE__); */} //error must be by id.
//=======================================================================Setting
          MagicNumber_Inp                  = 54321;
          MagicNumber                     = MagicNumber_Inp;//
          {         Min_ProfitInp                   = 10.0; //by currency. or pip.
                    Min_Profit                      = Min_ProfitInp;
                    Min_LossInp                     = 10.0; //by currency. or pip.
                    Min_Loss                        = Min_LossInp;
                    if(ct_Drive.TDD.ct_Ticket._Active.Is_TICKET) {Is_Profited(); Is_Lossed();} //
                    Min_LossTicket   = -10.0;
                    Max_LossTicket   = -20.0;
                    Min_ProfitTicket = +10.0;
                    Max_ProfitTicket = +20.0;
                    //--------------------------------------------------
          }
          ct_Positions.Update();
          this.UPDATED = true;
//=======================================================================checking &
          if(this.UPDATED ) return UPDATED = true; //
          else {Alert("Status Trade Bank App Levels Enviroments.UPDATED: ", UPDATED);}
          return UPDATED = false ; //
//=======================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Bank::Is_Profited()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          if(OrderProfit() > Min_Profit)return true ; //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Bank::Is_Lossed()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          if(OrderProfit() < Min_Loss)return true ; //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Bank::Is_MagicNumber()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          if(OrderMagicNumber() == MagicNumber)return true ; //
          return false;//
}
//+------------------------------------------------------------------+
// Calculate volume of open positions and/or pending orders.
// Counts volumes separately for buy and sell trades and writes them into parameterss.
//+------------------------------------------------------------------+
void  Ct_Bank::CalculateOpenVolume(double &volume_buy, double &volume_sell)
{         int total = OrdersTotal();
          for (int i = 0; i < total; i++)
          {         // Select an order.
                    if (!OrderSelect(i, SELECT_BY_POS)) continue;
                    // Skip orders with a different trading instrument.
                    if (OrderSymbol() != _Symbol) continue;
                    // If magic number is given via PSC panel and order's magic number is different - skip.
                    if ((MagicNumber != 0) && (OrderMagicNumber() != MagicNumber)) continue;
                    if (PositionData.SubtractPositions)
                    {         // Buy orders
                              if (OrderType() == ORDER_TYPE_BUY) volume_buy += OrderLots();
                              // Sell orders
                              else if (OrderType() == ORDER_TYPE_SELL) volume_sell += OrderLots(); }
                    if (PositionData.SubtractPendingOrders)
                    {         // Buy orders
                              if ((OrderType() == ORDER_TYPE_BUY_LIMIT) || (OrderType() == ORDER_TYPE_BUY_STOP)) volume_buy += OrderLots();
                              // Sell orders
                              else if ((OrderType() == ORDER_TYPE_SELL_LIMIT) || (OrderType() == ORDER_TYPE_SELL_STOP)) volume_sell += OrderLots(); //
                    } //
          } //
}
//+------------------------------------------------------------------+
//+ Check Open Trades |
//+------------------------------------------------------------------+
int Ct_Bank::CheckOpenTrades(int BS, int MN)//Check Open Trades
{         int Buys = 0, Sells = 0;
          for(int cnt_CheckOpenTrades = 0; cnt_CheckOpenTrades < OrdersTotal(); cnt_CheckOpenTrades++)
          {         bool Selected = OrderSelect(cnt_CheckOpenTrades, SELECT_BY_POS, MODE_TRADES);
                    if(OrderSymbol() == Symbol() && OrderMagicNumber() == MN && OrderType() == OP_BUY) Buys++;
                    if(OrderSymbol() == Symbol() && OrderMagicNumber() == MN && OrderType() == OP_SELL) Sells++; //
          }
          if(BS == 1) return(Buys);
          if(BS == 2) return(Sells); //
          return 0; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| DailyProfits                                                     |
//+------------------------------------------------------------------+
double Ct_Bank::DailyProfits()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//--
          double profit = 0;
//--
          for(int i = OrdersHistoryTotal() - 1; i >= 0; i--)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                    {         if(OrderSymbol() == _Symbol && OrderMagicNumber() ==  ct_Drive.TDD.ct_Bank.MagicNumber)
                              {         if(OrderType() <= OP_SELL) //MarketOrdersOnly
                                        {         if(TimeToStr(TimeCurrent(), TIME_DATE) == TimeToString(OrderCloseTime(), TIME_DATE))
                                                            profit += OrderProfit() + OrderCommission() + OrderSwap(); } } } }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return(profit);
//--
}
//+------------------------------------------------------------------+
//| DailyPoints                                                      |
//+------------------------------------------------------------------+
double Ct_Bank::DailyPoints()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//--
          double sellpts = 0;
          double buypts = 0;
//--
          for(int i = OrdersHistoryTotal() - 1; i >= 0; i--)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY))
                    {         if(OrderSymbol() == _Symbol && OrderMagicNumber() ==  ct_Drive.TDD.ct_Bank.MagicNumber)
                              {         if(OrderType() <= OP_SELL) //MarketOrdersOnly
                                        {         if(TimeToStr(TimeCurrent(), TIME_DATE) == TimeToString(OrderCloseTime(), TIME_DATE))
                                                  {         if(OrderType() == OP_SELL)
                                                                      sellpts += (OrderOpenPrice() - OrderClosePrice()) / _Point;
                                                            if(OrderType() == OP_BUY)
                                                                      buypts += (OrderClosePrice() - OrderOpenPrice()) / _Point; } } } } }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return(sellpts + buypts);
//--
}
//+------------------------------------------------------------------+
//| DailyReturn                                                      |
//+------------------------------------------------------------------+
double Ct_Bank::DailyReturn()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//--
          double percent = 0;
          double startbal = 0;
//-- GetStartBalance
          startbal = (DailyProfits() > 0) ? AccountBalance() - DailyProfits() : AccountBalance() + MathAbs(DailyProfits());
//-- CalcReturn (ROI)
          if(startbal != 0) //AvoidZeroDivide
                    percent = DailyProfits() * 100 / startbal;
//--
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return(percent); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|             Class Ct_Bank::     BEGIN                             |
//+------------------------------------------------------------------+
