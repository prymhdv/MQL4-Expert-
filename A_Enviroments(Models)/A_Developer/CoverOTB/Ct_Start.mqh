//+------------------------------------------------------------------+
//||   ||||||||||       St_CondicatorData_Indicators_MA.mqh         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTC\.CoverOTC.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\oTexts.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\Ct_Market_Symbol.mqh>;
//input int Max_Candel_Wating_After_Win = 5;//--its constant
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_OStart_Comments
{         void St_Comments();
          string        SellMarket, SellLimit, SellStop;
          string        BuyMarket,  BuyLimit,  BuyStop;
          //-------------------------------------------------
          string setComment(string &TradeComment, string CommentText)
          {         TradeComment = CommentText;
                    return (TradeComment);//
          }

          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_OStart_Comments::St_Comments()
{         //
          SellMarket    = "SM";         //"Sell-Market";
          SellLimit     = "SL";         //"Sell-Limit";
          SellStop      = "SS";         //"Sell-Stop";
          BuyMarket     = "BM";         //"Buy-Market";
          BuyLimit      = "BL";         //"Buy-Limit";
          BuyStop       = "BS";         //"Buy-Stop";
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_OStart_ArrowColor
{         color Buy_Market, Buy_Limit, Buy_Stop, Sell_Market, Sell_Limit,   Sell_Stop;
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_OStart_OrderPut_OP
{         int        PutTicketNumGet;//      = -1;   //
          string     PutSymbol;//            = NULL; //
          int        PutType;//              = -1;   //
          double     PutPriceBuyLimit;//     = 0;    //
          double     PutLots;//              = -1;   //
          double     PutPrice;//             = -1;   //
          int        PutSlippage;//          = -1;   // ct_Drive.TDD.ct_Market_Symbol.Slippage
          double     PutSL;//                = -1;   // ct_Drive.TDD.ct_SetPrices.BuyMarketSL,
          double     PutTP;//                = -1;   // ct_Drive.TDD.ct_SetPrices.BuyMarketTP,
          string     PutComment;//           = NULL; // CommentBuyMarket,
          int        PutMagicNumber;//       = -1;   //  ct_Drive.TDD.ct_Bank.MagicNumber,
          datetime   PutExpiration;//        = -1;   // ct_Drive.TDD.ct_SCMETime.Expiration,
          color      PutArrow;//             = -1;   // ArrowColor_
          string     PutErrLog;//            = NULL; //
          string     PutResultDesc;//        = NULL; //
          //----
          double     PutDiff_Open_SL;
          double     PutDiff_Open_TP;

          //----
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_OStart_Allow
{         bool          Is_BuyMarket;
          bool          Is_SellMarket;
          bool          Is_BuyLimit;
          bool          Is_BuyStop;
          bool          Is_SellLimit;
          bool          Is_SellStop; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct St_OStart_Tickets
{         void St_OStart_Tickets::St_OStart_Tickets();
          bool          SetArrayTicketNum(bool result = false, bool res = false);
          int            Num_All[];//
          int            Num_BuyMarket[];//
          int            Num_SellMarket[];//
          int            Num_BuyStop[];//
          int            Num_BuyLimit[];//
          int            Num_SellStop[];//
          int            Num_SellLimit[];//
          //-----------------------------------------------
          int            Num_All_Size         ;//= _Tickets.Num_All[];//
          int            Num_BuyMarket_Size   ;//= _Tickets.Num_BuyMarket[]; //
          int            Num_SellMarket_Size  ;//= _Tickets.Num_SellMarket[]; //
          int            Num_BuyStop_Size     ;//= _Tickets.Num_BuyStop[]; //
          int            Num_BuyLimit_Size    ;//= _Tickets.Num_BuyLimit[]; //
          int            Num_SellStop_Size    ;//= _Tickets.Num_SellStop[]; //
          int            Num_SellLimit_Size   ;//= _Tickets.Num_SellLimit[]; //
          //------------------------------------------------
          int            Num_All_Index ;//= 0; //
          int            Num_BuyMarket_Index;//
          int            Num_SellMarket_Index;//
          int            Num_BuyStop_Index;//
          int            Num_BuyLimit_Index;//
          int            Num_SellStop_Index;//
          int            Num_SellLimit_Index;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_OStart_Tickets::St_OStart_Tickets()
{         SetArrayTicketNum();
          Num_All_Index         = 0; //
          Num_BuyMarket_Index   = 0; //
          Num_SellMarket_Index  = 0; //
          Num_BuyStop_Index     = 0; //
          Num_BuyLimit_Index    = 0; //
          Num_SellStop_Index    = 0; //
          Num_SellLimit_Index   = 0; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_OStart_Tickets::SetArrayTicketNum(bool result = false, bool res = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    //---forc to resize array
                    res = true;//ArrayIsDynamic(_Tickets.Num_All);
                    while(res)  { res = ArrayResize( Num_All, 60)        == -1;} res = true;//in block//Alert((string)res, "_Tickets.Num_All_Size: ", ArraySize(_Tickets.Num_All));
                    while(res)  { res = ArrayResize( Num_BuyMarket, 10)  == -1;} res = true;
                    while(res)  { res = ArrayResize( Num_SellMarket, 10) == -1;} res = true;
                    while(res)  { res = ArrayResize( Num_BuyStop, 10)    == -1;} res = true;
                    while(res)  { res = ArrayResize( Num_BuyLimit, 10)   == -1;} res = true;
                    while(res)  { res = ArrayResize( Num_SellStop, 10)   == -1;} res = true;
                    while(res)  { res = ArrayResize( Num_SellLimit, 10)  == -1;} res = true;
                    //--------------------------------------------------------------------------------
                    ///*while(!res)*/ { res = ArrayResize(_Tickets.Num_All, 60)        == -1;} res = true;
                    ///*while(!res)*/ { res = ArrayResize(_Tickets.Num_BuyMarket, 10)  == -1;} res = true;
                    ///*while(!res)*/ { res = ArrayResize(_Tickets.Num_SellMarket, 10) == -1;} res = true;
                    ///*while(!res)*/ { res = ArrayResize(_Tickets.Num_BuyStop, 10)    == -1;} res = true;
                    ///*while(!res)*/ { res = ArrayResize(_Tickets.Num_BuyLimit, 10)   == -1;} res = true;
                    ///*while(!res)*/ { res = ArrayResize(_Tickets.Num_SellStop, 10)   == -1;} res = true;
                    ///*while(!res)*/ { res = ArrayResize(_Tickets.Num_SellLimit, 10)  == -1;} res = true;
                    //----------------------------------------------------------------------
                    Num_All_Size         = ArraySize( Num_All);
                    Num_BuyMarket_Size   = ArraySize( Num_BuyMarket);
                    Num_SellMarket_Size  = ArraySize( Num_SellMarket);
                    Num_BuyStop_Size     = ArraySize( Num_BuyStop);
                    Num_BuyLimit_Size    = ArraySize( Num_BuyLimit);
                    Num_SellStop_Size    = ArraySize( Num_SellStop);
                    Num_SellLimit_Size   = ArraySize( Num_SellLimit);
                    //
          }
          if(false)
          {         while(result) {Sleep(20); res = (-1 != ArrayResize( Num_All, 60));         Num_All_Size         = ArraySize( Num_All); Alert("_Tickets.Num_All_Size: ",  Num_All_Size); result = res;}; ////60 element//end 59
                    while(result) {Sleep(20); res = (-1 != ArrayResize( Num_BuyMarket, 10));   Num_BuyMarket_Size   = ArraySize( Num_BuyMarket);  result = res;}; ////60 element//end 59
                    while(result) {Sleep(20); res = (-1 != ArrayResize( Num_SellMarket, 10));  Num_SellMarket_Size  = ArraySize( Num_SellMarket); result = res;}; ////60 element//end 59
                    while(result) {Sleep(20); res = (-1 != ArrayResize( Num_BuyStop, 10));     Num_BuyStop_Size     = ArraySize( Num_BuyStop);    result = res;}; ////60 element//end 59
                    while(result) {Sleep(20); res = (-1 != ArrayResize( Num_BuyLimit, 10));    Num_BuyLimit_Size    = ArraySize( Num_BuyLimit);   result = res;}; ////60 element//end 59
                    while(result) {Sleep(20); res = (-1 != ArrayResize( Num_SellStop, 10));    Num_SellStop_Size    = ArraySize( Num_SellStop);   result = res;}; ////60 element//end 59
                    while(result) {Sleep(20); res = (-1 != ArrayResize( Num_SellLimit, 10));   Num_SellLimit_Size   = ArraySize( Num_SellLimit);  result = res;}; ////60 element//end 59
          }
          if(false)
          {         Alert("_Tickets.Num_All_Size: ",  Num_All_Size ); //
                    Alert("_Tickets.Num_BuyMarket_Size: ",  Num_BuyMarket_Size, ">>_Tickets.Num_SellMarket_Size: ", Num_SellMarket_Size, ">>_Tickets.Num_BuyStop_Size: ",  Num_BuyStop_Size); //
                    Alert("_Tickets.Num_BuyLimit_Size: ",   Num_BuyLimit_Size, ">>_Tickets.Num_SellStop_Size: ",    Num_SellStop_Size, ">>_Tickets.Num_SellLimit_Size: ",  Num_SellLimit_Size); //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum E_Trade_Mode
{         E_Wating,
          E_Selling,
          E_Buying,
          E_Watching
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_Start
{         /*
                Send ct_Order To Brocker
          */
private:
public:
          void           Ct_Start();
          void          ~Ct_Start() {};
          bool           Update(bool b);// {return true;};
          bool           UPDATED;
          bool           Is_Basic_Waited_5_Bar;
          int            Counter_Waite_5_Bar;  //ct_Drive.TDD.ct_Start.Counter_Waite_5_Bar
          //*******************************************
          //graphical object
          Cgs_DevObjectPack          Object_Pack;

          bool          AutoPut_Com_Signal( bool _IsOrdersPut);

          int           _Put_Buy(int limit);
          int           _Put_Sell(int limit);

          bool          OrderPut(int PutMode );
          bool          OrderPut2(int PutMode);

          bool          Send_Order_BM( int limit );
          bool          Send_Order_BS( int limit );
          bool          Send_Order_BL( int limit );
          bool          Send_Order_SM( int limit );
          bool          Send_Order_SS( int limit );
          bool          Send_Order_SL( int limit );
          //************************************************************************
          St_OStart_OrderPut_OP _OrderPut_OP, _OrderPut_OP_CURRENT;
          St_OStart_Comments    _Comments;      //---seted in ticket manager function
          St_OStart_ArrowColor  _ArrowClr;
          St_OStart_Allow       _Allow;
          St_OStart_Tickets     _Tickets;
          _ORDER_               _OrderPutting;///----for orders type by order struct data
          //--------------------------------------------------------------------------------
          bool                  Panel_Put_Order();
          _ORDER_               Panel_OrderPutting;///----for orders type by order struct data
          //-------------------------------------
          bool                  Put_OrderStart_Markets();
          Cg_Texts              C_OSTART_Shows;
          //****************************EXTENTION
          void                  Symple();
          void                  OnTickX();//
          void                  Sender(const int Type, bool Is_OK);
          void                  sellStop(double high, double low, double open, double close, string currentPair, double prevHigh, double prevLow, double prevOpen, double prevClose);
          void                  buyStop(double high, double low, double open, double close, string currentPair, double prevHigh, double prevLow, double prevOpen, double prevClose);
          //------------------------------------------------------
          int                   Max_Candel_Wating_After_Win;
          bool                  Is_Candel_Wating_After_Win;  /*is key active presed are the same */
          /*
                End Send ct_Order To Brocker
          */


          //----------------------------------------------------------
          void                  OnEvent_OnClick()
          {         //
          }
          //----------------------------------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_Start::Ct_Start()
{         Max_Candel_Wating_After_Win = 5;    }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Start::Update(bool b)
{         if(!b) {return UPDATED = true;}
          UPDATED = false;
          //--- ct_Order puting by update
          AutoPut_Com_Signal( TRADER_Panel_DATA.IsAuto_OrdersPut) ; //Alert("Watch","-Line:",__LINE__);
          //--- ct_Order puting by update Pannels key
          Panel_Put_Order();
          //---errorr---OrderPutting = NULL; // 'NULL' - parameter passed as reference, variable expected       tStart.mqh          122       18
          this.UPDATED = true;//
          if(!this.UPDATED)    {Alert("ct_Start..UPDATED: ", this.UPDATED);}
          return UPDATED;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+C_STATICSUN::KeyPressed_PutOrders
bool Ct_Start::AutoPut_Com_Signal( bool _IsOrdersPut)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          //--[Control Trade]-[stop 5 candel after profited]---------------------
          if(1)
          {         if(!ct_Drive.TDD.ct_Ticket._Active.Is_Ticket())
                    {         //
                              bool IsBasic_Selected  = OrderSelect(OrdersHistoryTotal() - 1, SELECT_BY_POS, MODE_HISTORY);
                              ct_Drive.TDD.ct_Ticket.getLastTicket();  //cheack last tick
                              bool IsBasic_Win_Order = ct_Drive.TDD.ct_Ticket._Order_Last.Profit > 0;  //--- Alert("Last order id:", ct_Drive.TDD.ct_Ticket._Order_Last.Ticket );
                              //if(IsBasic_Win_Order)
                              //{         if(Detect_NewBar._M1.CBT.Is_NewBar) Counter_Waite_5_Bar++;                         // incrise
                              //          Is_Basic_Waited_5_Bar = (Counter_Waite_5_Bar > Max_Candel_Wating_After_Win);       //cheack
                              //          if(Counter_Waite_5_Bar > Max_Candel_Wating_After_Win) { Counter_Waite_5_Bar = 0; } // reet
                              //}
                              //else { Is_Basic_Waited_5_Bar = true; }//
                              //if(!Is_Basic_Waited_5_Bar)                                  {                              ct_Drive.Etf_Trade_Mode = Et_Update_Order_Wating; } //
                              if(IsBasic_Win_Order)
                              {         if(OrderCloseTime() < TimeCurrent() - PeriodSeconds() * 6)  {Is_Basic_Waited_5_Bar = true; ct_Drive.Etf_Trade_Mode = Et_Update_Order_Wating_No;} //
                                        else                                                        {Is_Basic_Waited_5_Bar = false; ct_Drive.Etf_Trade_Mode = Et_Update_Order_Wating;}//
                              } //&& Is_Basic_Waited_5_Bar
                              else
                              {         Is_Basic_Waited_5_Bar = true;//
                              } //
                    } //
          }
          //------------------------
          if(!_IsOrdersPut) return false; bool result = false;
          //-----[Put Orders]-----------
          if( _IsOrdersPut && ct_Drive.TDD.ct_Market_Symbol.Is_Running)
          {         //--- Cat.s("---ct_Order puting---" + (string)_IsOrdersPut + "  Signal_Value: " + (string)Signal_Value + "  ct_Drive.TDD.ct_Market_Symbol.Running: " + (string)ct_Drive.TDD.ct_Market_Symbol.Is_Running);
                    Print("ct_Drive.TDD.ct_Ticket.Counter._TotalAll: ", ct_Drive.TDD.ct_Ticket.Counter._TotalAll, "   signal:", EnumToString(ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Enum));
                    bool Is_Allow = ct_Drive.TDD.ct_Ticket.Counter._TotalAll < 1 && Is_Basic_Waited_5_Bar ;  //cheack
                    if(!Is_Allow) return false;
                    //
                    switch (ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Enum)// ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Enum==ES_BUY
                    {         ///>>>>>>>>>>>>>>>>>>>>>>>>>>> //when one object has more data in self.. bether to get the obj to access data..      ///KeyX = (2 || 3 || 4);//
                              case ES_BUY:              { result = _Put_Buy(1);  ct_Drive.Etf_Trade_Mode = Et_Update_Order_Buying; } break; //
                              case ES_SELL:             { result = _Put_Sell(1); ct_Drive.Etf_Trade_Mode = Et_Update_Order_Selling;} break; //
                              case ES_VOID:             {                        ct_Drive.Etf_Trade_Mode = Et_Update_Order_Void; } break; //
                    } //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          return _OrderPutting.Is_OrdersDone = result;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
////////ORDER FOLLOW Control
#define Sw_CloseALL     0
#define Sw_BuyMarket    2
#define Sw_SellMarket   22
#define Sw_BuyStop      3
#define Sw_SellStop     33
#define Sw_BuyLimit     4
#define Sw_SellLimit    44
///////////////////////////////////
int Ct_Start::_Put_Buy(int limit)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          int  result = 999;
          if(!C_STATICSUN::KeySuperviser && ct_Drive.TDD.ct_Market_Symbol.Is_Running)
          {         switch (0)                          /// int BuyControler();
                    {         case Sw_CloseALL:
                              {         if((ct_Drive.TDD.ct_Ticket.Counter._SellTotal > 4 ) || C_STATICSUN::SuperKeyClose) ///existing<<<<issuuuu
                                        {         //===============================
                                                  ct_Drive.TDD.ct_End.OrderEnd(OP_SELL);  ct_Drive.TDD.ct_End.OrderEndPendings(OP_SELL); result = Sw_CloseALL;//self ticket decreser
                                                  //===============================
                                                  break;//
                                        } //
                              } //break;continue;  no use breake
                              case Sw_BuyMarket: { Send_Order_BM( limit ); }   break;
                              ///---case Sw_BuyStop:   { Send_Order_BS( limit ); } // break;
                              ///---case Sw_BuyLimit:  { Send_Order_BL( limit ); } break; //
                              default:           { Alert( "-Line:", __LINE__, "_Put_Buy default");} ///find isuuse hard no breake run down//
                    } //
          }
          //----Formulator
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          return result; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_Start::_Put_Sell(int limit)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          int  result = 999;
          if(!C_STATICSUN::KeySuperviser && ct_Drive.TDD.ct_Market_Symbol.Is_Running)
          {         switch (0)   /// int      SellControler();
                    {         case Sw_CloseALL:
                              {         if((ct_Drive.TDD.ct_Ticket.Counter._BuyTotal > 4) || C_STATICSUN::SuperKeyClose) ///existing
                                        {         //===============================
                                                  ct_Drive.TDD.ct_End.OrderEnd(OP_BUY );   ct_Drive.TDD.ct_End.OrderEndPendings(OP_BUY );; //self controled ticket
                                                  //===============================
                                                  result = Sw_CloseALL;//
                                                  break;//
                                        } //
                              } //break; //
                              case Sw_SellMarket:  { Send_Order_SM( limit ); } break;
                              //---case Sw_SellStop:    { Send_Order_SS( limit ); } // break;
                              //---case Sw_SellLimit:   { Send_Order_SL( limit ); } break;
                              default:             { Alert( "-Line:", __LINE__, "ConditionSell default"); } ///find isuuse hard no breake run down//
                    }//
          }
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          return result; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Start::Send_Order_BM( int limit )
{         if(ct_Drive.TDD.ct_Ticket.Counter._BuyMarket < limit)
          {         //===============================
                    _OrderPut_OP.PutSymbol         = StSymbol.Current;
                    _OrderPut_OP.PutType           = OP_BUY;
                    _OrderPut_OP.PutLots           = ct_Drive.TDD.st_Size.Curr_Lots;
                    _OrderPut_OP.PutPrice          = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyMarket.Open;// = MarketInfo(Symbol(),MODE_BID);//Bid; // = Ask;
                    _OrderPut_OP.PutSlippage       = ct_Drive.TDD.ct_Market_Symbol.Slippage;//
                    _OrderPut_OP.PutSL             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyMarket.SL;//
                    _OrderPut_OP.PutTP             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyMarket.TP;//
                    _OrderPut_OP.PutComment        = _Comments.setComment(_Comments.BuyMarket, "BM"); //_Comments.BuyMarket;//
                    _OrderPut_OP.PutMagicNumber    =  ct_Drive.TDD.ct_Bank.MagicNumber;//
                    _OrderPut_OP.PutExpiration     = ct_Drive.TDD.ct_SCMETime.Expiration.BuyMarket;//
                    _OrderPut_OP.PutArrow          = _ArrowClr.Buy_Market = clrGreen; //
                    //
                    return _OrderPutting.Is_MarketsBuyDone = OrderPut(0);
                    //===============================
                    //---off---Print(__FUNCSIG__, ">>__IT is Gone__vUp: " + (string)ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.IsCross_Up_MA200_MA500 + " _ " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.Value_NULL_PeriodSlow1X_0_MODE_EMA_PRICE_CLOSE_0, 2) + " _ " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0, 2)); //
                    //---off---if(Panel_OrderPutting.IsMarketsBuyDone) { result = Sw_BuyMarket;   break;}
                    //---off---else return 0; //
          } //
          return false;//
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Start::Send_Order_BS( int limit )
{         if(ct_Drive.TDD.ct_Ticket.Counter._BuyStop  < limit)
          {         //Alert("BuyStop","-Line:",__LINE__);
                    //===============================
                    _OrderPut_OP.PutSymbol         = StSymbol.Current;
                    _OrderPut_OP.PutType           = OP_BUYSTOP;
                    _OrderPut_OP.PutLots           = ct_Drive.TDD.st_Size.Curr_Lots;
                    _OrderPut_OP.PutPrice          = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyStop.Open;// = MarketInfo(Symbol(),MODE_ASK);//Ask; // = Bid;
                    _OrderPut_OP.PutSlippage       = ct_Drive.TDD.ct_Market_Symbol.Slippage;//
                    _OrderPut_OP.PutSL             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyStop.SL;// = Bid + 200 * Point; //
                    _OrderPut_OP.PutTP             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyStop.TP;// = Bid - 200 * Point; //
                    _OrderPut_OP.PutComment        = _Comments.setComment(_Comments.BuyStop, "BS"); //_Comments.BuyStop;//
                    _OrderPut_OP.PutMagicNumber    =  ct_Drive.TDD.ct_Bank.MagicNumber;//
                    _OrderPut_OP.PutExpiration     = ct_Drive.TDD.ct_SCMETime.Expiration.BuyStop;//
                    _OrderPut_OP.PutArrow          = _ArrowClr.Sell_Market = clrDarkGreen; //
                    //
                    return _OrderPutting.Is_PendingsBuyStopDone = OrderPut( 0);
                    //===============================
                    //---off---if(Panel_OrderPutting.IsPendingsBuyStopDone) {         result = Sw_BuyStop;   break;}
                    //---off---else return 0; //
          } //
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Start::Send_Order_BL( int limit )
{         if(ct_Drive.TDD.ct_Ticket.Counter._BuyLimit < limit)
          {         //===============================
                    bool KeyFree = true;
                    _OrderPut_OP.PutSymbol         = StSymbol.Current;
                    _OrderPut_OP.PutType           = OP_BUYLIMIT;
                    _OrderPut_OP.PutLots           = ct_Drive.TDD.st_Size.Curr_Lots;
                    _OrderPut_OP.PutPrice          = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyLimit.Open;// = Bid;
                    _OrderPut_OP.PutSlippage       = ct_Drive.TDD.ct_Market_Symbol.Slippage;//
                    _OrderPut_OP.PutSL             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyLimit.SL;;// = Bid + 200 * Point; //
                    _OrderPut_OP.PutTP             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyLimit.TP;;// = Bid - 200 * Point; //
                    _OrderPut_OP.PutComment        = _Comments.setComment(_Comments.BuyLimit, "BL"); //_Comments.BuyLimit;//
                    _OrderPut_OP.PutMagicNumber    =  ct_Drive.TDD.ct_Bank.MagicNumber;//
                    _OrderPut_OP.PutExpiration     = ct_Drive.TDD.ct_SCMETime.Expiration.BuyLimit;//
                    _OrderPut_OP.PutArrow          = _ArrowClr.Sell_Market = clrGreenYellow; //
                    //
                    return _OrderPutting.Is_PendingsBuyLimitDone = OrderPut( 0);
                    //===============================
                    //---off---if(Panel_OrderPutting.IsPendingsBuyLimitDone){         result = Sw_BuyLimit;   break;}
                    //---off---else return 0; //
          } //
          return false;//
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Start::Send_Order_SM( int limit )
{         if(ct_Drive.TDD.ct_Ticket.Counter._SellMarket < limit)//+ TimeToString(TimeCurrent()
          {         //Alert("SellMarket","-Line:",__LINE__);
                    //===============================
                    _OrderPut_OP.PutSymbol         = StSymbol.Current;
                    _OrderPut_OP.PutType           = OP_SELL;
                    _OrderPut_OP.PutLots           = ct_Drive.TDD.st_Size.Curr_Lots;
                    _OrderPut_OP.PutPrice          = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellMarket.Open;// = Bid;
                    _OrderPut_OP.PutSlippage       = ct_Drive.TDD.ct_Market_Symbol.Slippage;//
                    _OrderPut_OP.PutSL             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellMarket.SL;// = Bid + 200 * Point; //
                    _OrderPut_OP.PutTP             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellMarket.TP;// = Bid - 200 * Point; //
                    _OrderPut_OP.PutComment        = _Comments.setComment(_Comments.SellMarket, "SM"); //
                    _OrderPut_OP.PutMagicNumber    =  ct_Drive.TDD.ct_Bank.MagicNumber;//
                    _OrderPut_OP.PutExpiration     = ct_Drive.TDD.ct_SCMETime.Expiration.SellMarket;//
                    _OrderPut_OP.PutArrow          = _ArrowClr.Sell_Market = clrRed; //
                    //
                    return _OrderPutting.Is_MarketsSellDone =  OrderPut( 0);
                    //===============================
                    //---off---Print(__FUNCSIG__, ">>__IT is Gone__vDown __SELL DOWN_ _: " + (string)!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.IsCross_Up_MA200_MA500 + " _ " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.Value_NULL_PeriodSlow1X_0_MODE_EMA_PRICE_CLOSE_0, 2) + " _ " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA.Value_NULL_PeriodFast1X_0_MODE_EMA_PRICE_CLOSE_0, 2)); //
                    //---off---if(Panel_OrderPutting.IsMarketsSellDone) {         result = Sw_SellMarket;   break;}
                    //---off---else return 0; //
          } //
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Start::Send_Order_SS( int limit )
{         if(ct_Drive.TDD.ct_Ticket.Counter._SellStop < limit)
          {         //===============================
                    _OrderPut_OP.PutSymbol         = StSymbol.Current;
                    _OrderPut_OP.PutType           = OP_SELLSTOP;
                    _OrderPut_OP.PutLots           = ct_Drive.TDD.st_Size.Curr_Lots;
                    _OrderPut_OP.PutPrice          = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellStop.Open;// = Bid;
                    _OrderPut_OP.PutSlippage       = ct_Drive.TDD.ct_Market_Symbol.Slippage;//
                    _OrderPut_OP.PutSL             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellStop.SL;// = Bid + 200 * Point; //
                    _OrderPut_OP.PutTP             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellStop.TP;// = Bid - 200 * Point; //
                    _OrderPut_OP.PutComment        = _Comments.setComment(_Comments.SellStop, "SS"); // _Comments.SellStop;//
                    _OrderPut_OP.PutMagicNumber    =  ct_Drive.TDD.ct_Bank.MagicNumber;//
                    _OrderPut_OP.PutExpiration     = ct_Drive.TDD.ct_SCMETime.Expiration.SellStop;//
                    _OrderPut_OP.PutArrow          = _ArrowClr.Sell_Market = clrDarkRed; //
                    //
                    return _OrderPutting.Is_PendingsSellStopDone = OrderPut( 0);
                    //===============================
                    //---off---if(Panel_OrderPutting.IsPendingsSellStopDone){         result = Sw_SellStop;   break;}
                    //---off---else return 0; //
          } //
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Start::Send_Order_SL( int limit )
{         if(ct_Drive.TDD.ct_Ticket.Counter._SellLimit < limit)
          {         //===============================
                    _OrderPut_OP.PutSymbol         = StSymbol.Current;
                    _OrderPut_OP.PutType           = OP_SELLLIMIT;
                    _OrderPut_OP.PutLots           = ct_Drive.TDD.st_Size.Curr_Lots;
                    _OrderPut_OP.PutPrice          = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellLimit.Open;// = Bid;
                    _OrderPut_OP.PutSlippage       = ct_Drive.TDD.ct_Market_Symbol.Slippage;//
                    _OrderPut_OP.PutSL             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellLimit.SL;// = Bid + 200 * Point; //
                    _OrderPut_OP.PutTP             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellLimit.TP;// = Bid - 200 * Point; //
                    _OrderPut_OP.PutComment        = _Comments.setComment(_Comments.SellLimit, "SL"); //_Comments.SellLimit;//
                    _OrderPut_OP.PutMagicNumber    =  ct_Drive.TDD.ct_Bank.MagicNumber;//
                    _OrderPut_OP.PutExpiration     = ct_Drive.TDD.ct_SCMETime.Expiration.SellLimit;//
                    _OrderPut_OP.PutArrow          = _ArrowClr.Sell_Market = clrOrangeRed; //
                    //
                    return _OrderPutting.Is_PendingsSellLimitDone = OrderPut(0);
                    //===============================
                    //---off---if(Panel_OrderPutting.IsPendingsSellLimitDone){         result = Sw_SellLimit;   break;}
                    //---off--- else return 0; //
          } //
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |  Open Buy ct_Order  //     Open Sell ct_Order  // Open Sell Limit ct_Order    // Open Sell Stop ct_Order //  Open Buy Limit ct_Order  //Open Buy Stop ct_Order
//+------------------------------------------------------------------+
bool Ct_Start::OrderPut( int PutMode )
{         bool result = false;
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Start Error", __LINE__, __FUNCTION__); //
          //============================//============================_Tickets.Num_ == -1
          //Alert("Run: ", "_Line: ", __LINE__, __FUNCSIG__, "__", (string)TypeOrder, "__", (string)PutMode);
          int tradeSendError = 0;
          //=============================================================================================================
          int      PutTicketNumGet      = -1;   //
          string   PutSymbol            = NULL; //
          int      PutType              = -1;   //
          double   PutPriceBuyLimit     = 0;    //
          double   PutLots              = -1;   //
          double   PutPrice             = -1;   //
          int      PutSlippage          = -1;   // ct_Drive.TDD.ct_Market_Symbol.Slippage
          double   PutSL                = -1;   // ct_Drive.TDD.ct_SetPrices.BuyMarketSL,
          double   PutTP                = -1;   // ct_Drive.TDD.ct_SetPrices.BuyMarketTP,
          string   PutComment           = NULL; // CommentBuyMarket,
          int      PutMagicNumber       = -1;   //  ct_Drive.TDD.ct_Bank.MagicNumber,
          datetime PutExpiration        = -1;   // ct_Drive.TDD.ct_SCMETime.Expiration,
          color    PutArrow             = -1;   // ArrowColor_
          string   PutErrLog            = NULL; //
          string   PutResultDesc        = NULL; //
          //ct_Series.RefreshRate() ;
          //set by type
          //===========================================================================================================================================
          //===========================================================================================================================================
          _OrderPut_OP_CURRENT.PutSymbol        = PutSymbol         =  _OrderPut_OP.PutSymbol;
          _OrderPut_OP_CURRENT.PutType          = PutType           =  _OrderPut_OP.PutType;
          _OrderPut_OP_CURRENT.PutLots          = PutLots           =  _OrderPut_OP.PutLots;
          _OrderPut_OP_CURRENT.PutPrice         = PutPrice          =  _OrderPut_OP.PutPrice;
          _OrderPut_OP_CURRENT.PutSlippage      = PutSlippage       =  _OrderPut_OP.PutSlippage;
          _OrderPut_OP_CURRENT.PutSL            = PutSL             =  _OrderPut_OP.PutSL;
          _OrderPut_OP_CURRENT.PutTP            = PutTP             =  _OrderPut_OP.PutTP;
          _OrderPut_OP_CURRENT.PutComment       = PutComment        =  _OrderPut_OP.PutComment + "_" + ct_Drive.TDD.ct_Signals.DATAS.MethodTechTradeComment + "_"; /*+ ct_Drive.TDD.ct_Conductor.TI_Curr.Desc_Signal_Estimate_Out_SAW;*/
          if(ct_Drive.TDD.ct_Signals.Extern_Signals.MTSA.IsActive_MapTradeSence)
                    _OrderPut_OP_CURRENT.PutComment = PutComment = ct_Drive.TDD.ct_Signals.DATAS.MethodTechTradeComment + "_" + ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_SAW;
          _OrderPut_OP_CURRENT.PutMagicNumber   = PutMagicNumber    =  _OrderPut_OP.PutMagicNumber;
          _OrderPut_OP_CURRENT.PutExpiration    = PutExpiration     =  _OrderPut_OP.PutExpiration;
          _OrderPut_OP_CURRENT.PutArrow         = PutArrow          =  _OrderPut_OP.PutArrow;
          //===========================================================================================================================================
          {         _OrderPut_OP_CURRENT.PutDiff_Open_SL = _OrderPut_OP.PutDiff_Open_SL = (_OrderPut_OP.PutType == OP_SELL) ? _OrderPut_OP.PutSL - _OrderPut_OP.PutPrice   :  _OrderPut_OP.PutPrice - _OrderPut_OP.PutSL   ;
                    _OrderPut_OP_CURRENT.PutDiff_Open_TP = _OrderPut_OP.PutDiff_Open_TP = (_OrderPut_OP.PutType == OP_SELL) ? _OrderPut_OP.PutPrice - _OrderPut_OP.PutTP   :  _OrderPut_OP.PutTP - _OrderPut_OP.PutPrice ; //
                    //
          }//
          //===========================================================================================================================================
          // Formulator
          {         int   Num_BUY       = -1; //
                    int   Num_SELL      = -1; //
                    int   Num_BUYLIMIT  = -1; //
                    int   Num_SELLLIMIT = -1; //
                    int   Num_BUYSTOP   = -1; //
                    int   Num_SELLSTOP  = -1; //
                    //=============================================================================================================
                    switch(PutMode)
                    {         case 0:
                              {         while(!result)// if(true)//
                                        {         //Alert("Run: ", "_Line: ", __LINE__, __FUNCSIG__, "__", (string)TypeOrder, "__", (string)PutMode);
                                                  if(IsTradeContextBusy())
                                                  {         Alert(result, ",IsTradeContextBusy befor,,", "-Line:", __LINE__, __FUNCTION__);  Sleep(10);
                                                            return result = false;//cant put order//
                                                  } // Place Buy ct_Order
                                                  else
                                                  {         //=========================================================================================Defined Values
                                                            //+------------------------------------------------------------------+
                                                            //|    Is_Allow_                                                        |
                                                            //+------------------------------------------------------------------+
                                                            if(false)
                                                            {         //---off---if(PutType == OP_BUY)        if(_Tickets.Num_BuyMarket_Index  < _Tickets.Num_BuyMarket_Size  && _Tickets.Num_All_Index < _Tickets.Num_All_Size) _Allow.Is_BuyMarket  = true;
                                                                      //---off---if(PutType == OP_SELL)       if(_Tickets.Num_SellMarket_Index < _Tickets.Num_SellMarket_Size && _Tickets.Num_All_Index < _Tickets.Num_All_Size) _Allow.Is_SellMarket = true; //
                                                                      //----
                                                                      //---off---if(PutType == OP_BUYLIMIT)   if(_Tickets.Num_BuyLimit_Index   < _Tickets.Num_BuyLimit_Size   && _Tickets.Num_All_Index < _Tickets.Num_All_Size) _Allow.Is_BuyLimit   = true; //
                                                                      //---off---if(PutType == OP_BUYSTOP)    if(_Tickets.Num_BuyStop_Index    < _Tickets.Num_BuyStop_Size    && _Tickets.Num_All_Index < _Tickets.Num_All_Size) _Allow.Is_BuyStop    = true; //
                                                                      //---off---if(PutType == OP_SELLLIMIT)  if(_Tickets.Num_SellLimit_Index  < _Tickets.Num_SellLimit_Size  && _Tickets.Num_All_Index < _Tickets.Num_All_Size) _Allow.Is_SellLimit  = true; //
                                                                      //---off---if(PutType == OP_SELLSTOP)   if(_Tickets.Num_SellStop_Index   < _Tickets.Num_SellStop_Size   && _Tickets.Num_All_Index < _Tickets.Num_All_Size) _Allow.Is_SellStop   = true; //
                                                            }
                                                            //+------------------------------------------------------------------+
                                                            //|     OrderSend                                                    |
                                                            //+------------------------------------------------------------------+
                                                            //---off---if(_Allow.Is_BuyMarket || _Allow.Is_SellMarket || _Allow.Is_BuyLimit || _Allow.Is_BuyStop || _Allow.Is_SellLimit || _Allow.Is_SellStop)
                                                            {         //PutPrice
                                                                      double PutPrices = 0;
                                                                      if(PutType == OP_BUY)             PutPrices       = MarketInfo(Symbol(), MODE_ASK);
                                                                      if(PutType == OP_SELL)            PutPrices       = MarketInfo(Symbol(), MODE_BID);
                                                                      if(PutType == OP_BUYLIMIT)        PutPrices       = PutPrice;
                                                                      if(PutType == OP_BUYSTOP)         PutPrices       = PutPrice;
                                                                      if(PutType == OP_SELLLIMIT)       PutPrices       = PutPrice;
                                                                      if(PutType == OP_SELLSTOP)        PutPrices       = PutPrice;
                                                                      ResetLastError();
                                                                      PutTicketNumGet = OrderSend(PutSymbol, PutType, PutLots,
                                                                                                  NormalizeDouble(PutPrice, (int)MarketInfo(Symbol(),    MODE_DIGITS)),
                                                                                                  PutSlippage,
                                                                                                  NormalizeDouble(PutSL,  (int)MarketInfo(Symbol(),  MODE_DIGITS)),
                                                                                                  NormalizeDouble(PutTP,  (int)MarketInfo(Symbol(), MODE_DIGITS)),
                                                                                                  PutComment, PutMagicNumber, PutExpiration, PutArrow);
                                                                      tradeSendError = GetLastError();
                                                                      //--for collect in object  std_Global.ObjTicket
                                                                      //---off--- if(PutTicketNumGet != -1)TicketObjOut.Ticket_To_TicketObj_Single(PutTicketNumGet, TicketObjOut); //
                                                            }//
                                                            bool Is_Order_Registered = PutTicketNumGet != -1;
                                                            //+------------------------------------------------------------------+
                                                            //|   std_Labels                                                     |
                                                            //+------------------------------------------------------------------+
                                                            {         //Alert( "-Line:",__LINE__, "-BuyMarket_Put>>---BuyMarketPrice-", BuyMarketPrice, "---BuyMarketSL-", BuyMarketSL, "--BuyMarketTP-", BuyMarketTP);
                                                                      if(PutType == OP_BUY)         std_Labels._Desc_BuyMarket  = StringFormat( "-BMRun>>--BMPrice:%.2f --BMSL:%.2f --BMTP:%.2f", PutPrice, PutSL, PutTP);
                                                                      if(PutType == OP_SELL)        std_Labels._Desc_SellMarket = StringFormat( "-SMRun>>--SMPrice:%.2f --SMSL:%.2f --SMTP:%.2f", PutPrice, PutSL, PutTP);
                                                                      //---
                                                                      if(PutType == OP_BUYLIMIT)    std_Labels._Desc_BuyLimit   = StringFormat( "-BLRun>>--BLPrice:%.2f --BLSL:%.2f --BLTP:%.2f", PutPrice, PutSL, PutTP);
                                                                      if(PutType == OP_BUYSTOP)     std_Labels._Desc_BuyStop    = StringFormat( "-BSRun>>--BSPrice:%.2f --BSSL:%.2f --BSTP:%.2f", PutPrice, PutSL, PutTP);
                                                                      if(PutType == OP_SELLLIMIT)   std_Labels._Desc_SellLimit  = StringFormat( "-SLRun>>--SLPrice:%.2f --SLSL:%.2f --SLTP:%.2f", PutPrice, PutSL, PutTP);
                                                                      if(PutType == OP_SELLSTOP)    std_Labels._Desc_SellStop   = StringFormat( "-SSRun>>--SSPrice:%.2f --SSSL:%.2f --SSTP:%.2f", PutPrice, PutSL, PutTP);//
                                                            }
                                                            //+------------------------------------------------------------------+
                                                            //|    PutResultDesc                                                 |
                                                            //+------------------------------------------------------------------+
                                                            {         if(PutType == OP_SELL)       {PutResultDesc = "E:" + string(tradeSendError) + " -Putting SellMarket faile, " + "Bid: " + DoubleToString(Bid, 2) + " Ask: " + DoubleToString(Ask, 2);  PutErrLog = StringConcatenate("(Put-Price: ", DoubleToString(PutPrice, 2), " )_(Put-SL: ", PutSL, " )_(Put-TP: ", PutTP, ") ", PutResultDesc); };
                                                                      if(PutType == OP_BUY)        {PutResultDesc = "E:" + string(tradeSendError) + " -Putting BuyMarket faile, "  + "Bid: " + DoubleToString(Bid, 2) + " Ask: " + DoubleToString(Ask, 2);  PutErrLog = StringConcatenate("(Put-Price: ", DoubleToString(PutPrice, 2), " )_(Put-SL: ", PutSL, " )_(Put-TP: ", PutTP, ") ", PutResultDesc); };
                                                                      //---
                                                                      if(PutType == OP_SELLSTOP)   {PutResultDesc = "E:" + string(tradeSendError) + " -Putting SellStop faile, "   + "Bid: " + DoubleToString(Bid, 2) + " Ask: " + DoubleToString(Ask, 2);  PutErrLog = StringConcatenate("(Put-Price: ", DoubleToString(PutPrice, 2), " )_(Put-SL: ", PutSL, " )_(Put-TP: ", PutTP, ") ", PutResultDesc); };
                                                                      if(PutType == OP_BUYSTOP)    {PutResultDesc = "E:" + string(tradeSendError) + " -Putting BuyStop faile, "    + "Bid: " + DoubleToString(Bid, 2) + " Ask: " + DoubleToString(Ask, 2);  PutErrLog = StringConcatenate("(Put-Price: ", DoubleToString(PutPrice, 2), " )_(Put-SL: ", PutSL, " )_(Put-TP: ", PutTP, ") ", PutResultDesc); };
                                                                      if(PutType == OP_SELLLIMIT)  {PutResultDesc = "E:" + string(tradeSendError) + " -Putting SellLimit faile, "  + "Bid: " + DoubleToString(Bid, 2) + " Ask: " + DoubleToString(Ask, 2);  PutErrLog = StringConcatenate("(Put-Price: ", DoubleToString(PutPrice, 2), " )_(Put-SL: ", PutSL, " )_(Put-TP: ", PutTP, ") ", PutResultDesc); };
                                                                      if(PutType == OP_BUYLIMIT)   {PutResultDesc = "E:" + string(tradeSendError) + " -Putting BuyLimit faile, "   + "Bid: " + DoubleToString(Bid, 2) + " Ask: " + DoubleToString(Ask, 2);  PutErrLog = StringConcatenate("(Put-Price: ", DoubleToString(PutPrice, 2), " )_(Put-SL: ", PutSL, " )_(Put-TP: ", PutTP, ") ", PutResultDesc); }; //
                                                            }
                                                            //+------------------------------------------------------------------+
                                                            //|     Is_Allow_ reset                                                 |
                                                            //+------------------------------------------------------------------+
                                                            //---off---_Allow.Is_BuyMarket =  _Allow.Is_SellMarket = _Allow.Is_BuyLimit =   _Allow.Is_BuyStop = _Allow.Is_SellLimit =  _Allow.Is_SellStop = false;
                                                            ///////>>>??>>>OrderClose(!!!)////Ordermodify(!!);/////+(string)TicketTotalSell )
                                                            //+------------------------------------------------------------------+
                                                            //|    Seting TicketCount                                            |
                                                            //+------------------------------------------------------------------+
                                                            if(Is_Order_Registered)
                                                            {         //Alert(ArraySize(_Tickets.Num_All), "__", (string)_Tickets.Num_All_Index, "__", (string)PutTicketNumGet); //
                                                                      //---off---_Tickets.Num_All[_Tickets.Num_All_Index++] = PutTicketNumGet;
                                                                      //---
                                                                      //---off---if(PutType == OP_BUY)        _Tickets.Num_BuyMarket[_Tickets.Num_BuyMarket_Index++]   = PutTicketNumGet;
                                                                      //---off---if(PutType == OP_SELL)       _Tickets.Num_SellMarket[_Tickets.Num_SellMarket_Index++] = PutTicketNumGet;
                                                                      //---
                                                                      //---off---if(PutType == OP_BUYLIMIT)   _Tickets.Num_BuyLimit[_Tickets.Num_BuyLimit_Index++]     = PutTicketNumGet;
                                                                      //---off---if(PutType == OP_BUYSTOP)    _Tickets.Num_BuyStop[_Tickets.Num_BuyStop_Index++]       = PutTicketNumGet;
                                                                      //---off---if(PutType == OP_SELLLIMIT)  _Tickets.Num_SellLimit[_Tickets.Num_SellLimit_Index++]   = PutTicketNumGet;
                                                                      //---off---if(PutType == OP_SELLSTOP)   _Tickets.Num_SellStop[_Tickets.Num_SellStop_Index++]     = PutTicketNumGet; //
                                                            }
                                                            //+------------------------------------------------------------------+
                                                            //|                                                                  |
                                                            //+------------------------------------------------------------------+
                                                            if(Is_Order_Registered) { StringReplace(PutErrLog, "faile", "succeed"); Print(PutErrLog);} //can back again this loop by Counter--
                                                            //=========================================================================================
                                                            {         //---
                                                                      //----OrderModify(_Tickets.Num_,BuyMarketPrice,BuyMarketSL,BuyMarketTP,Day(),clrNONE);OrderComment("ccc");
                                                            }
                                                            //+------------------------------------------------------------------+
                                                            //|                                                                  |
                                                            //+------------------------------------------------------------------+
                                                            //**** Show Start level by rectangel.
                                                            ////--- nonGeneric RAngl_X ---///
                                                            if(Is_Order_Registered)
                                                            {         ObjectDelete("Rectangle " + "0");
                                                                      Dev_Object_Pack.Shapes.Rectangle.GDS.Set_Action_2(MODE_CREATE, true);
                                                                      Dev_Object_Pack.Shapes.Rectangle.GDS.Set_Desc_1("Rectangle " + "0");
                                                                      Dev_Object_Pack.Shapes.Rectangle.GDS.Set_Cordinate_4( Time[0], Ask, Time[10], Ask + ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_14_1 / 4 );//* _Point
                                                                      Dev_Object_Pack.Shapes.Rectangle.GDS.Set_Style_Width_Fill_Color(STYLE_SOLID, 2, true, clrYellow);
                                                                      Dev_Object_Pack.Shapes.Rectangle.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "Rectangle " + "0");
                                                                      Dev_Object_Pack.Shapes.Rectangle.GDS.Set_Chart_6();
                                                                      Dev_Object_Pack.Shapes.Rectangle.Action(Dev_Object_Pack.Shapes.Rectangle);//
                                                                      //---  RAngl_Candel.Create(UseRectangleName, Description[index], XCordinate, YCordinate, X2Cordinate, Y2Cordinate, Fill, Background, ShapeColor, style, Width);
                                                                      //-----------------------------------------------
                                                                      //---   C_OSTART_Shows.Description.Draw_GDS_Text(MODE_CREATE, true, "(WinRate): (" + (string)ct_Drive.TDD.ct_Conductor.TI_Curr.WinRate + ")   ", "(WinRate): (" + (string)ct_Drive.TDD.ct_Conductor.TI_Curr.WinRate + ")   ", Time[5], Bid, clrYellow, "Arial Bold", 10, ANCHOR_RIGHT, False); //
                                                                      //-----------------------------------------------MAIN CRITER LINE TRENDER
                                                                      ObjectDelete("MAIN_CRITER_LINEB_TRENDER");
                                                                      ObjectDelete("MAIN_CRITER_LINEB_TRENDER2-low");
                                                                      ObjectDelete("MAIN_CRITER_LINEB_TRENDER3-high");
                                                                      ObjectDelete("MAIN_CRITER_LINEA_TRENDER2-low2");
                                                                      ObjectDelete("MAIN_CRITER_LINEA_TRENDER3-high2");
                                                                      //
                                                                      ObjectDelete("MAIN_CRITER_LINEB_TRENDER");
                                                                      color   c1 = 0;         c1 = (PutType == OP_SELL) ? clrRed : clrGreen;
                                                                      double PriceBaseA = 0;      PriceBaseA  = (PutType == OP_SELL) ? Close[0] + 5 : Close[0] - 5;
                                                                      double PriceBaseA2 = 0;     PriceBaseA2 = (PutType == OP_SELL) ? Close[0] - 5 : Close[0] + 5;
                                                                      Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, true, "MAIN_CRITER_LINEB_TRENDER", "", Time[0] - PeriodSeconds() * 30, PriceBaseA, Time[0] + PeriodSeconds() * 30, PriceBaseA2, c1, 1, false, STYLE_DASHDOT, false);
                                                                      //-----------------------------------------------
                                                                      //-----------------------------------------------MAIN CRITER LINE TRENDER2 low
                                                                      ObjectDelete("MAIN_CRITER_LINEB_TRENDER2-low");
                                                                      color   c2 = 0;         c2 = (PutType == OP_SELL) ? clrRed : clrGreen;
                                                                      double PriceBaseB = 0;      PriceBaseB  = (PutType == OP_SELL) ? Close[0] + 5 - 3 : Close[0] - 5 - 3;
                                                                      double PriceBaseB2 = 0;     PriceBaseB2 = (PutType == OP_SELL) ? Close[0] - 5 - 3 : Close[0] + 5 - 3;
                                                                      Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, true, "MAIN_CRITER_LINEB_TRENDER2-low", "", Time[0] - PeriodSeconds() * 30, PriceBaseB, Time[0] + PeriodSeconds() * 30, PriceBaseB2, c2, 1, false, STYLE_DASHDOT, false);
                                                                      //-----------------------------------------------
                                                                      //-----------------------------------------------MAIN CRITER LINE TRENDER3 high
                                                                      ObjectDelete("MAIN_CRITER_LINEB_TRENDER3-high");
                                                                      color   c3 = 0;         c3 = (PutType == OP_SELL) ? clrRed : clrGreen;
                                                                      double PriceBaseC = 0;      PriceBaseC  = (PutType == OP_SELL) ? Close[0] + 5 + 3 : Close[0] - 5 + 3;
                                                                      double PriceBaseC2 = 0;     PriceBaseC2 = (PutType == OP_SELL) ? Close[0] - 5 + 3 : Close[0] + 5 + 3;
                                                                      Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, true, "MAIN_CRITER_LINEB_TRENDER3-high", "", Time[0] - PeriodSeconds() * 30, PriceBaseC, Time[0] + PeriodSeconds() * 30, PriceBaseC2, c3, 1, false, STYLE_DASHDOT, false);
                                                                      //-----------------------------------------------
                                                                      //-----------------------------------------------MAIN CRITER LINE TRENDER2 low
                                                                      ObjectDelete("MAIN_CRITER_LINEA_TRENDER2-low2");
                                                                      color   c2A = 0;         c2A = (PutType == OP_SELL) ? clrOrangeRed : clrYellowGreen;
                                                                      double PriceBaseBA = 0;      PriceBaseBA  = (PutType == OP_SELL) ? Close[0] + 5 - 3 - 3 : Close[0] - 5 - 3 - 3;
                                                                      double PriceBaseB2A = 0;     PriceBaseB2A = (PutType == OP_SELL) ? Close[0] - 5 - 3 - 3 : Close[0] + 5 - 3 - 3;
                                                                      Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, true, "MAIN_CRITER_LINEA_TRENDER2-low2", "", Time[0] - PeriodSeconds() * 30, PriceBaseBA, Time[0] + PeriodSeconds() * 30, PriceBaseB2A, c2A, 1, false, STYLE_DASHDOT, false);
                                                                      //-----------------------------------------------
                                                                      //-----------------------------------------------MAIN CRITER LINE TRENDER3 high
                                                                      ObjectDelete("MAIN_CRITER_LINEA_TRENDER3-high2");
                                                                      color   c3A = 0;         c3A = (PutType == OP_SELL) ? clrOrangeRed : clrYellowGreen;
                                                                      double PriceBaseCA = 0;      PriceBaseCA  = (PutType == OP_SELL) ? Close[0] + 5 + 3 + 3 : Close[0] - 5 + 3 + 3;
                                                                      double PriceBaseC2A = 0;     PriceBaseC2A = (PutType == OP_SELL) ? Close[0] - 5 + 3 + 3 : Close[0] + 5 + 3 + 3;
                                                                      Object_Pack.Lines.Trend.Draw_GDS_Lines(MODE_CREATE, true, "MAIN_CRITER_LINEA_TRENDER3-high2", "", Time[0] - PeriodSeconds() * 30, PriceBaseCA, Time[0] + PeriodSeconds() * 30, PriceBaseC2A, c3A, 1, false, STYLE_DASHDOT, false);
                                                                      //-----------------------------------------------
                                                                      //-----------------------------------------------
                                                            }
                                                            //+------------------------------------------------------------------+
                                                            //|                                                                  |
                                                            //+------------------------------------------------------------------+
                                                            //---control ct_Ticket count
                                                            {         if(PutType == OP_BUY)
                                                                      {         if(PutTicketNumGet > 0)         {       ct_Drive.TDD.ct_Ticket.Counter._BuyMarket++;                             return result = true; }
                                                                                else                            {       Panel_OrderPutting.Is_MarketsBuyDone = false;          Print(PutErrLog); return result = false;}         //
                                                                      }
                                                                      if(PutType == OP_SELL)
                                                                      {         if(PutTicketNumGet > 0)         {       ct_Drive.TDD.ct_Ticket.Counter._SellMarket++;                            return result = true;}
                                                                                else                            {       Panel_OrderPutting.Is_MarketsSellDone  = false;        Print(PutErrLog); return result = false;}         //
                                                                      }
                                                                      if(PutType == OP_BUYLIMIT)
                                                                      {         if(PutTicketNumGet  > 0)        {       ct_Drive.TDD.ct_Ticket.Counter._BuyLimit++;                              return result = true;}
                                                                                else                            {       Panel_OrderPutting.Is_PendingsBuyLimitDone = false;    Print(PutErrLog); return result = false;}         //
                                                                      }
                                                                      if(PutType == OP_BUYSTOP)
                                                                      {         if( PutTicketNumGet  > 0)       {       ct_Drive.TDD.ct_Ticket.Counter._BuyStop++;                               return result = true;}
                                                                                else                            {       Panel_OrderPutting.Is_PendingsBuyStopDone = false;     Print(PutErrLog); return result = false;}         //
                                                                      }
                                                                      if(PutType == OP_SELLLIMIT)
                                                                      {         if(PutTicketNumGet > 0)         {       ct_Drive.TDD.ct_Ticket.Counter._SellLimit++;                             return result = true;}
                                                                                else                            {       Panel_OrderPutting.Is_PendingsSellLimit = false;       Print(PutErrLog); return result = false;}         //
                                                                      }
                                                                      if(PutType == OP_SELLSTOP)
                                                                      {         if(PutTicketNumGet > 0)         {       ct_Drive.TDD.ct_Ticket.Counter._SellStop++;                              return result = true;}
                                                                                else                            {       Panel_OrderPutting.Is_PendingsSellStop = False;        Print(PutErrLog); return result = false;}         //
                                                                      }
                                                                      //--------------------------------------------------------------------------------------------------------------------------
                                                            }
                                                            //=========================================================================================
                                                  }// //OrderModify(_Tickets.Num_,BuyMarketPrice,BuyMarketSL,BuyMarketTP,Day(),clrNONE);OrderComment("ccc");
                                        }////
                              } break; //
                              case 1: {} break; //
                              case 2: {} break; //
                              case 3: {} break; //
                              default: {} break; //
                    }//
                    return result ;//
          }
          return false;//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Start::OrderPut2( int PutMode)
{         bool result = false;
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Ct_Start Error", __LINE__, __FUNCTION__); //
          //============================//============================_Tickets.Num_ == -1
          //Alert("Run: ", "_Line: ", __LINE__, __FUNCSIG__, "__", (string)TypeOrder, "__", (string)PutMode);
          //=============================================================================================================
          int      PutTicketNumGet      = -1;   //
          string   PutSymbol            = NULL; //
          int      PutType              = -1;   //
          double   PutPriceBuyLimit     = 0;    //
          double   PutLots              = -1;   //
          double   PutPrice             = -1;   //
          int      PutSlippage          = -1;   // ct_Drive.TDD.ct_Market_Symbol.Slippage
          double   PutSL                = -1;   // ct_Drive.TDD.ct_SetPrices.BuyMarketSL,
          double   PutTP                = -1;   // ct_Drive.TDD.ct_SetPrices.BuyMarketTP,
          string   PutComment           = NULL; // CommentBuyMarket,
          int      PutMagicNumber       = -1;   //  ct_Drive.TDD.ct_Bank.MagicNumber,
          datetime PutExpiration        = -1;   // ct_Drive.TDD.ct_SCMETime.Expiration,
          color    PutArrow             = -1;   // ArrowColor_
          string   PutErrLog            = NULL; //
          string   PutResultDesc        = NULL; //
          //ct_Series.RefreshRate() ;
          //=============================================================================================================//set by type
          PutSymbol         = _OrderPut_OP.PutSymbol;
          PutType           = _OrderPut_OP.PutType;
          PutLots           = _OrderPut_OP.PutLots;
          PutPrice          = _OrderPut_OP.PutPrice;
          PutSlippage       = _OrderPut_OP.PutSlippage;
          PutSL             = _OrderPut_OP.PutSL;
          PutTP             = _OrderPut_OP.PutTP;
          PutComment        = _OrderPut_OP.PutComment;
          PutMagicNumber    = _OrderPut_OP.PutMagicNumber;
          PutExpiration     = _OrderPut_OP.PutExpiration;
          PutArrow          = _OrderPut_OP.PutArrow;
          //
          //---Formulator
          {         int   Num_BUY       = -1; //
                    int   Num_SELL      = -1; //
                    int   Num_BUYLIMIT  = -1; //
                    int   Num_SELLLIMIT = -1; //
                    int   Num_BUYSTOP   = -1; //
                    int   Num_SELLSTOP  = -1; //
                    //=============================================================================================================
                    switch(PutMode)
                    {         case 0:
                              {         while(!result)// if(true)//
                                        {         //Alert("Run: ", "_Line: ", __LINE__, __FUNCSIG__, "__", (string)TypeOrder, "__", (string)PutMode);
                                                  if(IsTradeContextBusy())
                                                  {         Alert(result, ",befor,,", "-Line:", __LINE__, __FUNCTION__);  Sleep(10);
                                                            return result = false;//cant put order//
                                                            Alert(result, ",after,",  "-Line:", __LINE__, __FUNCTION__); //
                                                  } // Place Buy ct_Order
                                                  else
                                                  {         //=========================================================================================Defined Values
                                                            //+------------------------------------------------------------------+
                                                            //|   std_Labels                                                     |
                                                            //+------------------------------------------------------------------+
                                                            {         //Alert( "-Line:",__LINE__, "-BuyMarket_Put>>---BuyMarketPrice-", BuyMarketPrice, "---BuyMarketSL-", BuyMarketSL, "--BuyMarketTP-", BuyMarketTP);
                                                                      if(PutType == OP_BUY)         std_Labels._Desc_BuyMarket  = StringFormat( "-BMRun>>--BMPrice:%.2f --BMSL:%.2f --BMTP:%.2f", PutPrice, PutSL, PutTP);
                                                                      if(PutType == OP_SELL)        std_Labels._Desc_SellMarket = StringFormat( "-SMRun>>--SMPrice:%.2f --SMSL:%.2f --SMTP:%.2f", PutPrice, PutSL, PutTP);
                                                                      //---
                                                                      if(PutType == OP_BUYLIMIT)    std_Labels._Desc_BuyLimit   = StringFormat( "-BLRun>>--BLPrice:%.2f --BLSL:%.2f --BLTP:%.2f", PutPrice, PutSL, PutTP);
                                                                      if(PutType == OP_BUYSTOP)     std_Labels._Desc_BuyStop    = StringFormat( "-BSRun>>--BSPrice:%.2f --BSSL:%.2f --BSTP:%.2f", PutPrice, PutSL, PutTP);
                                                                      if(PutType == OP_SELLLIMIT)   std_Labels._Desc_SellLimit  = StringFormat( "-SLRun>>--SLPrice:%.2f --SLSL:%.2f --SLTP:%.2f", PutPrice, PutSL, PutTP);
                                                                      if(PutType == OP_SELLSTOP)    std_Labels._Desc_SellStop   = StringFormat( "-SSRun>>--SSPrice:%.2f --SSSL:%.2f --SSTP:%.2f", PutPrice, PutSL, PutTP);//
                                                            }
                                                            //+------------------------------------------------------------------+
                                                            //|    PutResultDesc                                                 |
                                                            //+------------------------------------------------------------------+
                                                            {         if(PutType == OP_SELL)       {PutResultDesc = "-Putting SellMarket faile:"; PutErrLog = StringConcatenate("(PutPrice: ", PutPrice, ")_(PutSL: ", PutSL, ")_(PutTP: ", PutTP, ") ", PutResultDesc); };
                                                                      if(PutType == OP_BUY)        {PutResultDesc = "-Putting BuyMarket faile:";  PutErrLog = StringConcatenate("(PutPrice: ", PutPrice, ")_(PutSL: ", PutSL, ")_(PutTP: ", PutTP, ") ", PutResultDesc); };
                                                                      //---
                                                                      if(PutType == OP_SELLSTOP)   {PutResultDesc = "-Putting SellStop faile:";   PutErrLog = StringConcatenate("(PutPrice: ", PutPrice, ")_(PutSL: ", PutSL, ")_(PutTP: ", PutTP, ") ", PutResultDesc); };
                                                                      if(PutType == OP_BUYSTOP)    {PutResultDesc = "-Putting BuyStop faile:";    PutErrLog = StringConcatenate("(PutPrice: ", PutPrice, ")_(PutSL: ", PutSL, ")_(PutTP: ", PutTP, ") ", PutResultDesc); };
                                                                      if(PutType == OP_SELLLIMIT)  {PutResultDesc = "-Putting SellLimit faile:";  PutErrLog = StringConcatenate("(PutPrice: ", PutPrice, ")_(PutSL: ", PutSL, ")_(PutTP: ", PutTP, ") ", PutResultDesc); };
                                                                      if(PutType == OP_BUYLIMIT)   {PutResultDesc = "-Putting BuyLimit faile:";   PutErrLog = StringConcatenate("(PutPrice: ", PutPrice, ")_(PutSL: ", PutSL, ")_(PutTP: ", PutTP, ") ", PutResultDesc); };//
                                                            }
                                                            //+------------------------------------------------------------------+
                                                            //|    Is_Allow_                                                        |
                                                            //+------------------------------------------------------------------+
                                                            {         if(PutType == OP_BUY)        if(_Tickets.Num_BuyMarket_Index  < _Tickets.Num_BuyMarket_Size  && _Tickets.Num_All_Index < _Tickets.Num_All_Size) _Allow.Is_BuyMarket  = true;
                                                                      if(PutType == OP_SELL)       if(_Tickets.Num_SellMarket_Index < _Tickets.Num_SellMarket_Size && _Tickets.Num_All_Index < _Tickets.Num_All_Size) _Allow.Is_SellMarket = true; //
                                                                      //----
                                                                      if(PutType == OP_BUYLIMIT)   if(_Tickets.Num_BuyLimit_Index   < _Tickets.Num_BuyLimit_Size   && _Tickets.Num_All_Index < _Tickets.Num_All_Size) _Allow.Is_BuyLimit   = true; //
                                                                      if(PutType == OP_BUYSTOP)    if(_Tickets.Num_BuyStop_Index    < _Tickets.Num_BuyStop_Size    && _Tickets.Num_All_Index < _Tickets.Num_All_Size) _Allow.Is_BuyStop    = true; //
                                                                      if(PutType == OP_SELLLIMIT)  if(_Tickets.Num_SellLimit_Index  < _Tickets.Num_SellLimit_Size  && _Tickets.Num_All_Index < _Tickets.Num_All_Size) _Allow.Is_SellLimit  = true; //
                                                                      if(PutType == OP_SELLSTOP)   if(_Tickets.Num_SellStop_Index   < _Tickets.Num_SellStop_Size   && _Tickets.Num_All_Index < _Tickets.Num_All_Size) _Allow.Is_SellStop   = true; //
                                                            }
                                                            //+------------------------------------------------------------------+
                                                            //|     OrderSend                                                    |
                                                            //+------------------------------------------------------------------+
                                                            if(_Allow.Is_BuyMarket || _Allow.Is_SellMarket || _Allow.Is_BuyLimit || _Allow.Is_BuyStop || _Allow.Is_SellLimit || _Allow.Is_SellStop)
                                                            {         PutTicketNumGet = OrderSend(PutSymbol, PutType, PutLots, PutPrice, PutSlippage, PutSL, PutTP, PutComment, PutMagicNumber, PutExpiration, PutArrow); } //
                                                            //+------------------------------------------------------------------+
                                                            //|     Is_Allow_ reset                                                 |
                                                            //+------------------------------------------------------------------+
                                                            _Allow.Is_BuyMarket =  _Allow.Is_SellMarket = _Allow.Is_BuyLimit =   _Allow.Is_BuyStop = _Allow.Is_SellLimit =  _Allow.Is_SellStop = false;
                                                            ///////>>>??>>>OrderClose(!!!)////Ordermodify(!!);/////+(string)TicketTotalSell )
                                                            //+------------------------------------------------------------------+
                                                            //|    Seting TicketCount                                            |
                                                            //+------------------------------------------------------------------+
                                                            if(PutTicketNumGet != -1)
                                                            {         //Alert(ArraySize(_Tickets.Num_All), "__", (string)_Tickets.Num_All_Index, "__", (string)PutTicketNumGet); //
                                                                      _Tickets.Num_All[_Tickets.Num_All_Index++] = PutTicketNumGet;
                                                                      //---
                                                                      if(PutType == OP_BUY)        _Tickets.Num_BuyMarket[_Tickets.Num_BuyMarket_Index++]   = PutTicketNumGet;
                                                                      if(PutType == OP_SELL)       _Tickets.Num_SellMarket[_Tickets.Num_SellMarket_Index++] = PutTicketNumGet;
                                                                      //---
                                                                      if(PutType == OP_BUYLIMIT)   _Tickets.Num_BuyLimit[_Tickets.Num_BuyLimit_Index++]     = PutTicketNumGet;
                                                                      if(PutType == OP_BUYSTOP)    _Tickets.Num_BuyStop[_Tickets.Num_BuyStop_Index++]       = PutTicketNumGet;
                                                                      if(PutType == OP_SELLLIMIT)  _Tickets.Num_SellLimit[_Tickets.Num_SellLimit_Index++]   = PutTicketNumGet;
                                                                      if(PutType == OP_SELLSTOP)   _Tickets.Num_SellStop[_Tickets.Num_SellStop_Index++]     = PutTicketNumGet; //
                                                            }
                                                            //+------------------------------------------------------------------+
                                                            //|                                                                  |
                                                            //+------------------------------------------------------------------+
                                                            if(PutTicketNumGet != -1) { StringReplace(PutErrLog, "faile", "succeed"); Print(PutErrLog);} //can back again this loop by Counter--
                                                            //=========================================================================================
                                                            {         //---
                                                                      //----OrderModify(_Tickets.Num_,BuyMarketPrice,BuyMarketSL,BuyMarketTP,Day(),clrNONE);OrderComment("ccc");
                                                            }
                                                            //+------------------------------------------------------------------+
                                                            //|                                                                  |
                                                            //+------------------------------------------------------------------+
                                                            {         if(PutType == OP_BUY)
                                                                      {         if(PutTicketNumGet > 0)         {       ct_Drive.TDD.ct_Ticket.Counter._BuyMarket++;                                            return result = true; }
                                                                                else                            {       Panel_OrderPutting.Is_MarketsBuyDone = false;          Print(PutErrLog);       return result = false;}         //
                                                                      }
                                                                      if(PutType == OP_SELL)
                                                                      {         if(PutTicketNumGet > 0)         {       ct_Drive.TDD.ct_Ticket.Counter._SellMarket++;                                           return result = true;}
                                                                                else                            {       Panel_OrderPutting.Is_MarketsSellDone  = false;        Print(PutErrLog);       return result = false;}         //
                                                                      }
                                                                      if(PutType == OP_BUYLIMIT)
                                                                      {         if(PutTicketNumGet  > 0)        {       ct_Drive.TDD.ct_Ticket.Counter._BuyLimit++;                                             return result = true;}
                                                                                else                            {       Panel_OrderPutting.Is_PendingsBuyLimitDone = false;    Print(PutErrLog);       return result = false;}         //
                                                                      }
                                                                      if(PutType == OP_BUYSTOP)
                                                                      {         if( PutTicketNumGet  > 0)       {       ct_Drive.TDD.ct_Ticket.Counter._BuyStop++;                                              return result = true;}
                                                                                else                            {       Panel_OrderPutting.Is_PendingsBuyStopDone = false;     Print(PutErrLog);       return result = false;}         //
                                                                      }
                                                                      if(PutType == OP_SELLLIMIT)
                                                                      {         if(PutTicketNumGet > 0)         {       ct_Drive.TDD.ct_Ticket.Counter._SellLimit++;                                            return result = true;}
                                                                                else                            {       Panel_OrderPutting.Is_PendingsSellLimit = false;       Print(PutErrLog);       return result = false;}         //
                                                                      }
                                                                      if(PutType == OP_SELLSTOP)
                                                                      {         if(PutTicketNumGet > 0)         {       ct_Drive.TDD.ct_Ticket.Counter._SellStop++;                                             return result = true;}
                                                                                else                            {       Panel_OrderPutting.Is_PendingsSellStop = False;        Print(PutErrLog);       return result = false;}         //
                                                                      }
                                                                      //--------------------------------------------------------------------------------------------------------------------------
                                                            }
                                                            //=========================================================================================
                                                  }// //OrderModify(_Tickets.Num_,BuyMarketPrice,BuyMarketSL,BuyMarketTP,Day(),clrNONE);OrderComment("ccc");
                                        }////
                              } break; //
                              case 1: {} break; //
                              case 2: {} break; //
                              case 3: {} break; //
                              default: {} break; //
                    }//
                    return result ;//
          }
          //=============================================================================================================
          //=============================================================================================================
          return false;//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//Create Buy Stop Orders
void Ct_Start::buyStop(double high, double low, double open, double close, string currentPair, double prevHigh, double prevLow, double prevOpen, double prevClose)
{         int    digits = (int)SymbolInfoInteger(currentPair, SYMBOL_DIGITS);
          string symbol = currentPair;  // specify the symbol, at which the order is placed
          double point = SymbolInfoDouble(symbol, SYMBOL_POINT);      // point
          double ask = SymbolInfoDouble(symbol, SYMBOL_ASK);          // current buy price
          datetime expiration = 0; //TimeTradeServer()+PeriodSeconds(PERIOD_H4);
          double volume = 0.01;
          double price = high;     //price for when order will be placed
          double orderprice = NormalizeDouble(price + (5 * point), digits); //place order 5 pips above 3rd candle
          double altorderprice = NormalizeDouble(price + (10 * point), digits);
          int SL_pips = 0;
          int TP_pips = 0;
          //Define Formula for run//----------================
          //Enter non normalized value in price
          double TPFormulaA = price + (2 * (price - prevLow)) - (15 * point); //Take profit 2x entry candle
          double SLFormulaA = 0;                                          //No stop loss
          //--
          double TPFormulaB = price + (2 * (price - prevLow)) - (15 * point); //Take profit 2x entry candle
          double SLFormulaB = price - (SL_pips * point);                   //Static stop loss
          //--
          double TPFormulaC = price + ((2 * (price - prevLow)) * point) - (15 * point); //Take profit always 2x
          double SLFormulaC = price - ((price - prevLow) * point + (5 * point));   //stop loss always below candle, 5 additional pips
          //--
          double TPFormulaD = price + (2 * ((price - prevLow)) * point) - (15 * point); //Take profit variable to 2x stops
          double SLFormulaD = price - ((price - prevLow) * point + (5 * point));   //stop loss always below candle, 5 additional pips
          //--
          double TPFormulaPips = price + (TP_pips * point); //Formula for take profit in pips
          double SLFormulaPips = price - (SL_pips * point); //Formula for stops in pips
          //--------------------------------==================     double SL=SLFormulaA;
          double TP = NormalizeDouble(TPFormulaA, digits);
          double SL = NormalizeDouble(SLFormulaA, digits);
          string comment = StringFormat("Buy Stop %s %G lots at %s, SL=%s TP=%s",
                                        symbol, volume,
                                        DoubleToString(price, digits),
                                        DoubleToString(SL, digits),
                                        DoubleToString(TP, digits));
          //--- everything is ready, sending a Buy Stop pending order to the server
          if(!trade_BuyStop(volume, orderprice, symbol, SL, TP, ORDER_TIME_GTC, expiration, comment))////(.) >>(_)
          {         //--- failure message
                    Print("buy method failed. Return code=", trade_ResultRetcode(), " (", trade_ResultRetcodeDescription(), ")"); //Error message
                    //--- retry=
                    if (!trade_BuyStop(volume, altorderprice, symbol, SL, TP, ORDER_TIME_GTC, expiration, comment))
                    {         Print("sell method retry failed. Return code=", trade_ResultRetcode(), " (", trade_ResultRetcodeDescription(), ")"); //Error message
                    }
                    else
                    {         Print("buy method executed successfully. Return code=", trade_ResultRetcode(), " (", trade_ResultRetcodeDescription(), ")"); //Error message
                    } }
          else
          {         Print("buy method executed successfully. Return code=", trade_ResultRetcode(), " (", trade_ResultRetcodeDescription(), ")"); //Error Message
          }
          return; }
//Create Sell Stop Orders
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_Start::sellStop(double high, double low, double open, double close, string currentPair, double prevHigh, double prevLow, double prevOpen, double prevClose)
{         double volume = 0.01;
          string symbol = currentPair;  // specify the symbol, at which the order is placed
          int    digits = (int)SymbolInfoInteger(currentPair, SYMBOL_DIGITS); // number of decimal places
          double point = SymbolInfoDouble(symbol, SYMBOL_POINT);      // point
          double ask = SymbolInfoDouble(symbol, SYMBOL_ASK);
          datetime expiration = TimeTradeServer() + PeriodSeconds(PERIOD_H4);
          double price = low;                    //candle to use for entry
          double altorderprice = NormalizeDouble(price - (5 * point), digits);               //retry same trade 5 pips lower
          double orderprice = NormalizeDouble(price - (10 * point), digits);
          int SL_pips = 0;
          int TP_pips = 0;
          //Define Formula for run//----------================
          //Define Formula for run//----------================
          double TPFormulaA = price - ((2 * (prevHigh - price)) - (15 * point)); //Take profit 2x entry candle
          double SLFormulaA = 0;                                          //No stop loss
          //--
          double TPFormulaB = price - (2 * (prevHigh - price)) - (15 * point); //Take profit 2x entry candle
          double SLFormulaB = price + (SL_pips * point);                   //Static stop loss
          //--
          double TPFormulaC = price - ((2 * (prevHigh - price)) * point) - (15 * point); //Take profit always 2x
          double SLFormulaC = price + ((prevHigh - price) * point + (5 * point));   //stop loss always below candle, 5 additional pips
          //--
          double TPFormulaD = price - (2 * ((prevHigh - price)) * point) - (15 * point); //Take profit variable to 2x stops
          double SLFormulaD = price + ((prevHigh - price) * point + (5 * point));   //stop loss always below candle, 5 additional pips
          //--
          double TPFormulaPips = price - (TP_pips * point); //Formula for take profit in pips
          double SLFormulaPips = price + (SL_pips * point); //Formula for stops in pips
          //--------------------------------==================     double SL=SLFormulaA;
          double TP = NormalizeDouble(TPFormulaA, digits);
          double SL = NormalizeDouble(SLFormulaA, digits);
          string comment = StringFormat("Buy Stop %s %G lots at %s, SL=%s TP=%s",
                                        symbol, volume,
                                        DoubleToString(price, digits),
                                        DoubleToString(SL, digits),
                                        DoubleToString(TP, digits));
          //--- everything is ready, sending a Buy Stop pending order to the server
          if(!trade_SellStop(volume, orderprice, symbol, SL, TP, ORDER_TIME_GTC, expiration, comment))
          {         //--- failure message
                    Print("sell stop method failed. Return code=", trade_ResultRetcode(), ". Code description: ", trade_ResultRetcodeDescription()); //Error message
                    //--- retry
                    if (!trade_SellStop(volume, altorderprice, symbol, SL, TP, ORDER_TIME_GTC, expiration, comment))
                    {         Print("sell method failed. Return code=", trade_ResultRetcode(), " (", trade_ResultRetcodeDescription(), ")"); //Error message
                    }
                    else
                    {         Print("sell method executed successfully. Return code=", trade_ResultRetcode(), " (", trade_ResultRetcodeDescription(), ")"); //Error message
                    } }
          else
          {         Print("sell method executed successfully. Return code=", trade_ResultRetcode(), " (", trade_ResultRetcodeDescription(), ")"); //Error message
          }
          return; }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+
//#include<Trade\std_Global.mqh>
//--- object for performing trade operations
bool  tradeX;//////////////CTrade  trade;/<<<for not erroroinf
bool ORDER_TIME_GTC;
bool trade_BuyStop(double volume, double orderprice, string symbol, double SL, double TP, int ORDER_TIME_GTC_V, datetime expiration, string comment) {return false;};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool trade_SellStop(double volume, double orderprice, string symbol, double SL, double TP, int ORDER_TIME_GTC_V, datetime expiration, string comment) {return false;};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string trade_ResultRetcode() {return"00";};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string trade_ResultRetcodeDescription() {return"00";};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime TimeTradeServer() {return 0;};
//--- Set Variables
double   dblChanged, dblLast; //When Candle Changes
static bool firstRun = true; //first run
string myPairs[6] = {"USDCAD", "EURUSD", "USDJPY", "EURJPY", "GBPUSD", "USDCHF" }; //Set pairs
double firstCandle[4] = { }; //set up each candle
double secondCandle[4] = { }; //testing candle
double thirdCandle[4] = { }; //candle before entry
//First Run
void OnStartX()
{         firstRun = false;
          printf("Hello World First Run Ok"); }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_Start::OnTickX()
{         //detect new bar
          static datetime prevTime = 0;
          datetime lastTime[1];
          if (CopyTime(_Symbol, _Period, 0, 1, lastTime) == 1 && prevTime != lastTime[0])
          {         prevTime = lastTime[0];
                    printf("new bar");
                    //End bar check
                    //Horizontal line
                    long cid = ChartID();
                    ObjectDelete(cid, "test");
                    ResetLastError();
                    double line = iClose(Symbol(), PERIOD_H1, 0);
                    if(!ObjectCreate(cid, "test", OBJ_HLINE, 0, 0, line) || GetLastError() != 0)
                              Print("Error creating object: ", GetLastError());
                    else
                              ChartRedraw(cid);
                    //------------------------
                    //Create for loop to hold array data
                    for(int i = 0; i < ArraySize(myPairs); i++)
                    {         firstCandle[0] = iHigh(myPairs[i], PERIOD_H1, 0);
                              firstCandle[1] = iLow(myPairs[i], PERIOD_H1, 0); //Only update on candle close for performance reasons
                              firstCandle[2] =  iOpen(myPairs[i], PERIOD_H1, 0);
                              firstCandle[3] = iClose(myPairs[i], PERIOD_H1, 0);
                              secondCandle[0] = iHigh(myPairs[i], PERIOD_H1, 1);
                              secondCandle[1] = iLow(myPairs[i], PERIOD_H1, 1);
                              secondCandle[2] = iOpen(myPairs[i], PERIOD_H1, 1);
                              secondCandle[3] = iClose(myPairs[i], PERIOD_H1, 1);
                              thirdCandle[0] =  iHigh(myPairs[i], PERIOD_H1, 2);
                              thirdCandle[1] =  iLow(myPairs[i], PERIOD_H1, 2);
                              thirdCandle[2] =  iOpen(myPairs[i], PERIOD_H1, 2);
                              thirdCandle[3] =  iClose(myPairs[i], PERIOD_H1, 2);
                              printf("Testing this candle close " + (string)firstCandle[3] + " vs previous candle High" + (string)secondCandle[3] + " and " + (string)secondCandle[0]);
                              //call price check to compare
                              if (secondCandle[3] > thirdCandle[0])
                              {         //printf(myPairs[i]+ " : "+"Previous High: "+DoubleToString(thirdCandle[0])+" New Close Higher Price: " +DoubleToString(secondCandle[3])); //implicit converted
                                        buyStop(secondCandle[0], secondCandle[1], secondCandle[2], secondCandle[3], myPairs[i], thirdCandle[0], thirdCandle[1], thirdCandle[2], thirdCandle[3]); //buy
                              }
                              else if (secondCandle[3] < thirdCandle[1])
                              {         //  printf(myPairs[i] + " : "+"Previous low: " +DoubleToString(thirdCandle[1])+ " Close lower Price: " +  DoubleToString(secondCandle[3]));   //implicit converted
                                        sellStop(secondCandle[0], secondCandle[1], secondCandle[2], secondCandle[3], myPairs[i], thirdCandle[0], thirdCandle[1], thirdCandle[2], thirdCandle[3]); //sell
                              }
                              else
                              {         //no signal
                              } } } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Start::Panel_Put_Order()
{         /*
          Put ct_Order By Pannel Clicks
          */
          //cheack forward Passage//
          bool IsAnyActive = Panel_OrderPutting.Is_MarketsBuy || Panel_OrderPutting.Is_PendingsBuyLimit || Panel_OrderPutting.Is_PendingsBuyStop || Panel_OrderPutting.Is_MarketsSell || Panel_OrderPutting.Is_PendingsSellLimit || Panel_OrderPutting.Is_PendingsSellStop;
          if(!IsAnyActive) return false;
          ///
          St_Ticket_Counter _Count_;
          _Count_._AllTotalMax = 3;
          _Count_._AllTotalMin = 1;
          _Count_._TotalAll = ct_Drive.TDD.ct_Ticket.Counter._TotalAll;
          //---breake the ordering
          if(_Count_._AllTotalMax <= _Count_._TotalAll)return false;
          //---
          {         //
                    if(Panel_OrderPutting.Is_Orders)             {return false;};
                    if(Panel_OrderPutting.Is_OrdersBuy)          {return false;};
                    if(Panel_OrderPutting.Is_OrdersSell)         {return false;};
                    //
                    if(Panel_OrderPutting.Is_Markets)            {return Put_OrderStart_Markets(); /**/};
                    if(Panel_OrderPutting.Is_MarketsBuy)
                    {         _OrderPut_OP.PutSymbol         = StSymbol.Current;
                              _OrderPut_OP.PutType           = OP_BUY;
                              _OrderPut_OP.PutLots           = ct_Drive.TDD.st_Size.Curr_Lots;
                              _OrderPut_OP.PutPrice          = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyMarket.Open;// = Ask;
                              _OrderPut_OP.PutSlippage       = ct_Drive.TDD.ct_Market_Symbol.Slippage;//
                              _OrderPut_OP.PutSL             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyMarket.SL;///
                              _OrderPut_OP.PutTP             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyMarket.TP;///
                              _OrderPut_OP.PutComment        = _Comments.setComment(_Comments.BuyMarket, "BM" ); //_Comments.BuyMarket;//
                              _OrderPut_OP.PutMagicNumber    =  ct_Drive.TDD.ct_Bank.MagicNumber;//
                              _OrderPut_OP.PutExpiration     = ct_Drive.TDD.ct_SCMETime.Expiration.BuyMarket;//
                              _OrderPut_OP.PutArrow          = _ArrowClr.Buy_Market = clrGreen; //
                              //
                              return Panel_OrderPutting.Is_MarketsBuyDone  =  OrderPut(0);
                              //
                    };
                    if(Panel_OrderPutting.Is_MarketsSell)
                    {         _OrderPut_OP.PutSymbol         = StSymbol.Current;
                              _OrderPut_OP.PutType           = OP_SELL;
                              _OrderPut_OP.PutLots           = ct_Drive.TDD.st_Size.Curr_Lots;
                              _OrderPut_OP.PutPrice          = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellMarket.Open;// = Bid;
                              _OrderPut_OP.PutSlippage       = ct_Drive.TDD.ct_Market_Symbol.Slippage;//
                              _OrderPut_OP.PutSL             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellMarket.SL;// = Bid + 200 * Point; //
                              _OrderPut_OP.PutTP             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellMarket.TP;// = Bid - 200 * Point; //
                              _OrderPut_OP.PutComment        = _Comments.setComment(_Comments.SellMarket, "SM"); //_Comments.SellMarket;//
                              _OrderPut_OP.PutMagicNumber    =  ct_Drive.TDD.ct_Bank.MagicNumber;//
                              _OrderPut_OP.PutExpiration     = ct_Drive.TDD.ct_SCMETime.Expiration.SellMarket;//
                              _OrderPut_OP.PutArrow          = _ArrowClr.Sell_Market = clrRed; //
                              //
                              return Panel_OrderPutting.Is_MarketsSellDone =  OrderPut( 0);
                              //
                    };
                    //
                    if(Panel_OrderPutting.Is_Pendings)           {return false;};
                    if(Panel_OrderPutting.Is_PendingsBuy)        {return false;};
                    if(Panel_OrderPutting.Is_PendingsBuyLimit)   {return false;};
                    if(Panel_OrderPutting.Is_PendingsBuyStop)    {return false;};
                    //
                    if(Panel_OrderPutting.Is_PendingsSell)       {return false;};
                    if(Panel_OrderPutting.Is_PendingsSellLimit)  {return false;};
                    if(Panel_OrderPutting.Is_PendingsSellStop)   {return false;};//
          }
          //---reset keyes
          Panel_OrderPutting.Is_MarketsBuy = Panel_OrderPutting.Is_PendingsBuyLimit = Panel_OrderPutting.Is_PendingsBuyStop = Panel_OrderPutting.Is_MarketsSell =
                              Panel_OrderPutting.Is_PendingsSellLimit = Panel_OrderPutting.Is_PendingsSellStop = false;
          //
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_Start::Put_OrderStart_Markets()
{         //_OrderPut_OP.PutSymbol         = StSymbol.Current;
          {         _OrderPut_OP.PutType           = OP_SELL;
                    _OrderPut_OP.PutLots           = ct_Drive.TDD.st_Size.Curr_Lots;
                    _OrderPut_OP.PutPrice          = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellMarket.Open;// = Bid;
                    _OrderPut_OP.PutSlippage       = ct_Drive.TDD.ct_Market_Symbol.Slippage;//
                    _OrderPut_OP.PutSL             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellMarket.SL;// = Bid + 200 * Point; //
                    _OrderPut_OP.PutTP             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.SellMarket.TP;// = Bid - 200 * Point; //
                    _OrderPut_OP.PutComment        = _Comments.setComment(_Comments.SellMarket, "SM"); //_Comments.SellMarket;//
                    _OrderPut_OP.PutMagicNumber    =  ct_Drive.TDD.ct_Bank.MagicNumber;//
                    _OrderPut_OP.PutExpiration     = ct_Drive.TDD.ct_SCMETime.Expiration.SellMarket;//
                    _OrderPut_OP.PutArrow          = _ArrowClr.Sell_Market = clrRed; //
                    //
                    Panel_OrderPutting.Is_MarketsSellDone =  OrderPut( 0);//
          }
          //
          {         _OrderPut_OP.PutSymbol         = StSymbol.Current;
                    _OrderPut_OP.PutType           = OP_BUY;
                    _OrderPut_OP.PutLots           = ct_Drive.TDD.st_Size.Curr_Lots;
                    _OrderPut_OP.PutPrice          = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyMarket.Open;// = Ask;
                    _OrderPut_OP.PutSlippage       = ct_Drive.TDD.ct_Market_Symbol.Slippage;//
                    _OrderPut_OP.PutSL             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyMarket.SL;//
                    _OrderPut_OP.PutTP             = ct_Drive.TDD.ct_SetPrices.Price_CalcX.BuyMarket.TP;//
                    _OrderPut_OP.PutComment        = _Comments.setComment(_Comments.BuyMarket, "BM"); //_Comments.BuyMarket;//
                    _OrderPut_OP.PutMagicNumber    =  ct_Drive.TDD.ct_Bank.MagicNumber;//
                    _OrderPut_OP.PutExpiration     = ct_Drive.TDD.ct_SCMETime.Expiration.BuyMarket;//
                    _OrderPut_OP.PutArrow          = _ArrowClr.Buy_Market = clrGreen; //
                    //
                    Panel_OrderPutting.Is_MarketsBuyDone  =  OrderPut( 0);//
          }
          //----cheak
          if(Panel_OrderPutting.Is_MarketsSellDone && Panel_OrderPutting.Is_MarketsBuyDone) return true;
          //
          return false;//
}
//+------------------------------------------------------------------+
//| OrderSend                                                        |
//+------------------------------------------------------------------+
void Ct_Start::Sender(const int Type, bool Is_OK)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
          //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
          //---on progressing not complited
          //=========================================================|
          int op_tkt = 0;
          uint tick = 0;
          uint ex_time = 0;
          //===================================
          double rq_price = 0;
          double slippage = 0;
          //================================================
          //--- reset the error value
          if(Capitan_ResetLastErrorX)ResetLastError();
          //================================================
          if(Is_OK)
          {         if( IsTradeAllowed() && !IsTradeContextBusy() && IsConnected())//-- CheckOrdSendRequirements
                    {         //-- SellOrders
                              if(Type == OP_SELL)
                              {         //-- EnoughMargin
                                        if(ct_Drive.TDD.ct_Account.Account_Data.Margin.IsRemainsSell)
                                        {         //-- CorrectPutLots (Rounded by GetSetInputs)
                                                  if(ct_Drive.TDD.st_Size.IsPutLotsValid)
                                                  {         tick = GetTickCount(); //GetTime//The GetTickCount() function returns the number of milliseconds that elapsed since the system start.
                                                            rq_price = MarketInfo(_Symbol, MODE_BID); //GetPrice
                                                            op_tkt = OrderSend(_Symbol, OP_SELL, ct_Drive.TDD.st_Size.Curr_Lots, rq_price, ct_Drive.TDD.ct_Market_Symbol.Slippage, 0, 0, ExpertName, 0, 0, std_Global.COLOR_SELL); //SendOrder
                                                  }
                                                  else
                                                  {         //-- Error
                                                            Print("OrderSend failed with error #131 [Invalid trade volume]");
                                                            Sound.PlaySoundS(Sound.ErrorSound);
                                                            //--
                                                            Sleep(________________________________________________________Xerorr.ErrorInterval);
                                                            return; //
                                                  }
                                                  //----------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                  if(op_tkt < 0)
                                                  {         //-- Error
                                                            Print("OrderSend failed with error #", _LastError);
                                                            Sound.PlaySoundS(Sound.ErrorSound );
                                                            //--
                                                            Sleep(________________________________________________________Xerorr.ErrorInterval);
                                                            return;//
                                                  }
                                                  else//seting TP SL
                                                  {         //-- Succeeded
                                                            ex_time = GetTickCount() - tick; //CalcExeTime
                                                            slippage = (ct_Drive.TDD.ct_Order.GetPriceByTicket(OPENPRICE, op_tkt) - rq_price) / _Point; //CalcSlippage
                                                            Print("OrderSend placed successfully (Open Sell) " + "#" + IntegerToString(op_tkt) + " | Execuction Time: " + IntegerToString(ex_time) + "ms" + " | Slippage: " + DoubleToString(slippage, 0) + "p");
                                                            Sound.PlaySoundS("sell.wav");
                                                            //-- SL
                                                            //-- TP
                                                            ct_Drive.TDD.ct_StopLoss.SetSL(OP_SELL, op_tkt, ct_Drive.TDD.ct_StopLoss.Curr_Pip);
                                                            ct_Drive.TDD.ct_TakeProfit.SetTP(OP_SELL, op_tkt, ct_Drive.TDD.ct_TakeProfit.Curr_Pip); //
                                                  }
                                                  //--
                                        }
                                        else
                                        {         //-- NotEnoughMoney
                                                  Print(" '", AccountNumber(), "' :", " order #0 sell ", DoubleToString(ct_Drive.TDD.st_Size.Curr_Lots, 2), " ", _Symbol, " [Not enough money]");
                                                  Sound.PlaySoundS(Sound.ErrorSound );//
                                        }
                                        //--
                              }
                              //-- BuyOrders
                              if(Type == OP_BUY)
                              {         //-- EnoughMargin
                                        if(ct_Drive.TDD.ct_Account.Account_Data.Margin.IsRemainsBuy)
                                        {         //-- CorrectPutLots (Rounded by GetSetInputs)
                                                  if(ct_Drive.TDD.st_Size.IsPutLotsValid)
                                                  {         tick = GetTickCount(); //GetTime
                                                            rq_price = MarketInfo(_Symbol, MODE_ASK); //GetPrice
                                                            op_tkt = OrderSend(_Symbol, OP_BUY, ct_Drive.TDD.st_Size.Curr_Lots, rq_price, ct_Drive.TDD.ct_Market_Symbol.Slippage, 0, 0, ExpertName, 0, 0, std_Global.COLOR_BUY); //SendOrder
                                                  }
                                                  else
                                                  {         //-- Error
                                                            Print("OrderSend failed with error #131 [Invalid trade volume]");
                                                            Sound.PlaySoundS(Sound.ErrorSound );
                                                            //--
                                                            Sleep(________________________________________________________Xerorr.ErrorInterval);
                                                            return;//
                                                  }
                                                  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                  if(op_tkt < 0)
                                                  {         //-- Error
                                                            Print("OrderSend failed with error #", _LastError);
                                                            Sound.PlaySoundS(Sound.ErrorSound );
                                                            //--
                                                            Sleep(________________________________________________________Xerorr.ErrorInterval);
                                                            return; //
                                                  }
                                                  else//seting TP SL
                                                  {         //-- Succeeded
                                                            ex_time = GetTickCount() - tick; //CalcExeTime
                                                            slippage = (rq_price - ct_Drive.TDD.ct_Order.GetPriceByTicket(OPENPRICE, op_tkt)) / _Point; //CalcSlippage
                                                            Print("OrderSend placed successfully (Open Buy) " + "#" + IntegerToString(op_tkt) + " | Execuction Time: " + IntegerToString(ex_time) + "ms" + " | Slippage: " + DoubleToString(slippage, 0) + "p");
                                                            Sound.PlaySoundS("buy.wav");
                                                            ct_Drive.TDD.ct_StopLoss.SetSL(OP_BUY, op_tkt, ct_Drive.TDD.ct_StopLoss.Curr_Pip);
                                                            ct_Drive.TDD.ct_TakeProfit.SetTP(OP_BUY, op_tkt, ct_Drive.TDD.ct_TakeProfit.Curr_Pip); //
                                                            //
                                                  }//
                                                  //--
                                        }
                                        else
                                        {         //-- NotEnoughMoney
                                                  Print(" '", AccountNumber(), "' :", " order #0 buy ", DoubleToString(ct_Drive.TDD.st_Size.Curr_Lots, 2), " ", _Symbol, " [Not enough money]");
                                                  Sound.PlaySoundS(Sound.ErrorSound ); //
                                        }//
                                        //--
                              } //
                    }//
                    else
                    {         //-- RequirementsNotFulfilled
                              if(!IsConnected())
                                        Print("No Internet connection found! Please check your network connection and try again.");
                              if(IsTradeContextBusy())
                                        Print("Trade context is busy, Please wait.");
                              if(!IsTradeAllowed())
                                        Print("Check if automated trading is allowed in the terminal / program settings and try again.");
                              //--
                              Sound.PlaySoundS(Sound.ErrorSound );
                              //--
                              Sleep(________________________________________________________Xerorr.ErrorInterval);
                              return;
                              //--
                    }//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_Start::Symple()
{         int ticket;
          while(true)
          {         ticket = OrderSend(Symbol(), OP_BUY, 1.0, Ask, 3, 0, 0, "expert comment", 255, 0, CLR_NONE);
                    if(ticket <= 0)
                    {         int error = GetLastError();
                              //---- not enough money
                              if(error == 134) break;   //---- 10 seconds wait
                              Sleep(10000);   //---- refresh price data
                              break; }
                    else
                    {         if(OrderSelect(ticket, SELECT_BY_TICKET))
                                        OrderPrint();
                              break; }//
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
