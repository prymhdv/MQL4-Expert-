//+------------------------------------------------------------------+
//|                                                  Ct_Positions.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BaseWall.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\.CoverOT.mqh>
//+------------------------------------------------------------------+
//|             Class Ct_Positions::BEGIN                             |Ct_Positions based trades
//+------------------------------------------------------------------+
/*
 *
 *
 *
 *
 *
 */
// a particular way in which someone or something is placed or arranged.
// put or arrange (someone or something) in a particular place or way.
// a place where someone or something is located or has been put.
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_Positions
{
//=======================================================================
private:
          //Ct_Positions            Size;
          //C_OrderSTART           Start;            //
          //C_OrderEND             END;              //
          //C_MODIFY               Modify;               //>>>!!! if exist other same name enum struct or class or type its unknowen fore others
          //C_ORDER                ct_Order;         //
//=======================================================================
public:
          void                  Ct_Positions();
          void                  ~Ct_Positions() {};
          bool                  Update();
//=======================================================================
//======================================================================= // Used in more than one function.
          double                p_StopLoss;
//=======================================================================Symbols Data// -1 because it is checked in the initialization function.TickSize = -1

//=======================================================================
          double                AccSize;
//=======================================================================
          double                G_balance;// = 0;                                   // Balance for this EA
          //double              ct_Market_Symbol.MqlMarketSymbol.Market_LOTSIZE = 0;                                // ct_Market_Symbol.MqlMarketSymbol.Market_LOTSIZE
          double                Highest;// = 0;                                     // ct_Market_Symbol.MqlMarketSymbol.Market_LOTSIZE indicator value
          double                Lowest;// = 0;                                      // Lowest indicator value


          double                Avg_tickspermin;// = 0;                             // Used for simulation of latency during backtests
//=======================================================================Orders Data
//=======================================================================
//=======================================================================
          //=======================================================================
          string                FreeMarginProssecing(int x);
          string                FreeMarginProssecing();
          //=======================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Positions::Ct_Positions()
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Positions Error",  __LINE__, __FUNCTION__); //
//=======================================================================
          RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Size Error",  __LINE__, __FUNCTION__); //
//=======================================================================
          //=======================================================================
          //=======================================================================
          //=======================================================================
//=======================================================================
          G_balance = 0;                               // Balance for this EA
          //Array_spread[30];                            // Store spreads for the last 30 tics
          //double ct_Market_Symbol.MqlMarketSymbol.Market_LOTSIZE = 0;                               // ct_Market_Symbol.MqlMarketSymbol.Market_LOTSIZE
          Highest = 0;                                // ct_Market_Symbol.MqlMarketSymbol.Market_LOTSIZE indicator value
          Lowest = 0;                                             // Lowest indicator value
          Avg_tickspermin = 0;                // Used for simulation of latency during backtests
//=======================================================================
//=======================================================================
//=======================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Positions::Update()
{
//=======================================================================
          ct_Drive.TDD.ct_SCMETime.Update();//
          ct_Drive.TDD.ct_SetPrices.Update();     ///ct_Drive.Update(); ct_Bank.Update();
          ct_Drive.TDD.ct_Size.Update(Lot_Fixed_Inp);
          return true;//
//=======================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Ct_Positions::FreeMarginProssecing(int x)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ACCOUNTS Error",  __LINE__, __FUNCTION__);//|
          //=========================================================|
          string result, aa, bb, cc, dd, ee = "";
          switch(x)   /// value of x
          {         case 1 :   //x1 ==true
                    {         if(AccountFreeMargin() < (1000 *  ct_Drive.TDD.st_Size.Curr_Lots))
                              {         Print(" Low Account Free Margin: " + StringFormat(" AccountFreeMargin : =%G ", AccountFreeMargin()));
                                        aa = StringFormat("AccountFreeMargin: %G ", AccountFreeMargin()); } //
                    }
                    result = aa;
                    break;
                    case 2 :
                    {         if(AccountFreeMargin() < (1000 *  ct_Drive.TDD.st_Size.Curr_Lots))
                              {         Print(" Low Account Free Margin: " + StringFormat(" AccountFreeMargin : =%G ", AccountFreeMargin()));
                                        bb = StringFormat("AccountFreeMargin: %G ", AccountFreeMargin()); }/////b is defined literall.. carfull
                    }
                    result = bb;
                    break;
                    case 3 :
                    {         if(AccountFreeMargin() < (1000 *  ct_Drive.TDD.st_Size.Curr_Lots))
                              {         Print(" Low Account Free Margin: " + StringFormat(" AccountFreeMargin : =%G ", AccountFreeMargin()));
                                        cc = StringFormat("AccountFreeMargin: %G ", AccountFreeMargin()); }//
                    }
                    result = cc;
                    break;
                    case 4:
                    {         if(AccountFreeMargin() < (1000 *  ct_Drive.TDD.st_Size.Curr_Lots))
                              {         Print(" Low Account Free Margin: " + StringFormat(" AccountFreeMargin : =%G ", AccountFreeMargin()));
                                        dd = StringFormat("AccountFreeMargin: %G ", AccountFreeMargin()); }//
                    }
                    result = dd;
                    break;
                    case 5:
                    {         if(AccountFreeMargin() < (1000 *  ct_Drive.TDD.st_Size.Curr_Lots))
                              {         Print(" Low Account Free Margin: " + StringFormat(" AccountFreeMargin : =%G ", AccountFreeMargin()));
                                        ee = StringFormat("AccountFreeMargin: %G ", AccountFreeMargin()); }//
                    }
                    result = ee;
                    break;//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ACCOUNTS Error",  __LINE__, __FUNCTION__);//|
          //=========================================================|
          return(result);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Ct_Positions::FreeMarginProssecing()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ACCOUNTS Error",  __LINE__, __FUNCTION__);//|
          //=========================================================|
          string a, s, novoid;
          a += s ;
//Alert("s");
//thenreturn   pass untill here...
          return(novoid);/////// return(string)
          Print("s");//thenreturn not pass here...
//////////////////a += return(s);//////////invaliade
          s += StringFormat("--%s--", FreeMarginProssecing(1));   ///overloads mean parameters  got value from string AccountControler(int x)
          s += StringFormat("_%G_", OrderCommission());
          Print("s");
//thenreturn not pass here...
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ACCOUNTS Error",  __LINE__, __FUNCTION__);//|
          //=========================================================|
          return(s); //
}

//+------------------------------------------------------------------+
//|             Class Ct_Positions::BEGIN                             |
//+------------------------------------------------------------------+
