//+------------------------------------------------------------------+
//||   ||||||||||                 Ct_End.mqh                   ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+
#define CloseTypeALL                000
#define CloseTypeMarketAll          100
#define CloseTypeBuyMarket          110
#define CloseTypeSellMarket         120
#define DeleteTypePending_BuyStop   210
#define DeleteTypePending_BuyLimit  211
#define DeleteTypePending_SellStop  220
#define DeleteTypePending_SellLimit 221
#define DeleteTypePendingAll        200
#define DeleteTypePendingAllBuy     212
#define DeleteTypePendingAllSell    222
class Ct_End
{
private:

public:
          void           Ct_End();
          void           ~Ct_End() {};
          bool           Update(bool IsRun);
          bool           UPDATED;
          int            ErrorTerminate;
          void           Strateges_EXIT_Signal_Trade_Terminate();
          //=====================================================================================================
          _ORDER_        OrderEnding;
          //=====================================================================================================
          int            Terminate( int Type, bool IsTicketEnd = false );
          bool           TerminateAll();
          bool           OrderEnd(int TypeOrder, bool ModeAll = false, bool ModeTicket = false, int TicketCom = -1);
          bool           OrderENDAllX(int TypeOrder, bool ModeTicket = false, int TicketCom = -1, bool result = false); //OP_BUY
          bool           OrderEndPendings(int TypeOrder);
          //=====================================================================================================
          bool           OrderEnd_ALL(bool IsAny, int OP_Type);
          //=====================================================================================================
          void           CheckForClose();
          void           CheckForClose2();
          bool           CheackResult(int TypeOrder, bool resultEnd);//
          //=====================================================================================================
          int            d_LastError;///
          int            SONargTicket, SONCloseTicket;
          double         SONargStopLoss, SONargTakeProfit;
          double         SONClosePrice;
          int            argcallTicket;
          double         argcallStopLoss, argcallTakeProfit;
          //=====================================================================================================solo program

          bool           CloseallRun();
          void           DrawLabel(bool KeyCreate, string _Text = "_Text", int _X = 2, int _Y = 100, ENUM_BASE_CORNER _Corner = CORNER_LEFT_LOWER, string _FType = "Lucida Console", int _FSize = 8, color _Col = clrAqua);
          //=====================================================================================================
          void           LogerX(const int arfTicketX = -1, const uint LotSizeCom = 0, const double arfStopLossX = -1, const double arfTakeProfitX = -1, const int arfCloseTicketX = -1, const double arfClosePriceX = -1); //\\incoming info
          bool          Superviser(const string SozText = "Soz", const int Sozline = -1, const string SozFunc = "NoneFunc",
                                   const int argPassTicket =  -1, uint LotSizeCom = 0, const double argPassStopLoss  = -1, const double argPassTakeProfit  = -1,
                                   const int argPassCloseTicket = -1, const double argPassClosePrice  = -1);
          //========================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ct_End::Ct_End()
{         RunCallFunction++;//==============================
          SONargTicket                    = 0 ;
          SONargStopLoss                  = 0 ;
          SONargTakeProfit                = 0 ;
          SONCloseTicket                  = 0 ;
          SONClosePrice                   = 0 ;
          //==============================
          argcallTicket                   = 0 ;
          argcallStopLoss                 = 0 ;
          argcallTakeProfit               = 0 ;
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_End::TerminateAll()
{         //Print(" A terminating order: ", ErrorDescription(GetLastError()));
          int res = 0;
          //------------------------------------------------------------------------
          //by oannel keys
          res = Terminate(CloseTypeALL,                       ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Sell || ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Buy);
          res = Terminate(CloseTypeALL,                       OrderEnding.Is_Orders);
          //
          res = Terminate(CloseTypeMarketAll,                 OrderEnding.Is_Markets);
          res = Terminate(CloseTypeSellMarket,                OrderEnding.Is_MarketsSell);
          res = Terminate(CloseTypeBuyMarket,                 OrderEnding.Is_MarketsBuy);
          //
          res = Terminate(DeleteTypePendingAll,               OrderEnding.Is_Pendings);
          res = Terminate(DeleteTypePending_SellLimit,        OrderEnding.Is_PendingsSellLimit);
          res = Terminate(DeleteTypePending_SellStop,         OrderEnding.Is_PendingsSellStop);
          res = Terminate(DeleteTypePending_BuyLimit,         OrderEnding.Is_PendingsBuyLimit);
          res = Terminate(DeleteTypePending_BuyStop,          OrderEnding.Is_PendingsBuyStop); //
          //--------------------------------------------------------------------------------------
          //with out panel keys
          res = Terminate(CloseTypeALL, true);
          //--------------------------------------------------------------------------------------
          //Print(" Z terminating order: ", ErrorDescription(GetLastError()));
          ObjectDelete("MAIN_CRITER_LINEB_TRENDER");
          ObjectDelete("MAIN_CRITER_LINEB_TRENDER2-low");
          ObjectDelete("MAIN_CRITER_LINEB_TRENDER3-high");
          ObjectDelete("MAIN_CRITER_LINEA_TRENDER2-low2");
          ObjectDelete("MAIN_CRITER_LINEA_TRENDER3-high2");
          return (res != 0); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_End::Update(bool IsRun)
{         if(!IsRun) {return UPDATED = true;}
          UPDATED = false;
          //============================================================================================================= TRADER_Panel_DATA.IsAuto_EndAll
          //>>>if(IsRun) TerminateAll();
          //---SCALP MOST PROFITED    !!!! no need its controled by [input double Max_Profite_Scalp = 4;]
          {         if(ct_Drive.TDD.ct_Ticket._Active.Is_Ticket() && OrderSelect(0, SELECT_BY_POS, MODE_TRADES)  && OrderProfit() > 8)
                    {         //bool close1 = OrderClose(OrderTicket(), OrderLots(), Ask, ct_Drive.TDD.ct_Market_Symbol.Slippage, clrLawnGreen); //
                              //bool close2 = OrderClose(OrderTicket(), OrderLots(), Bid, ct_Drive.TDD.ct_Market_Symbol.Slippage, clrLawnGreen); //
                              OrderEnd_ALL(true, -1);//
                    }//
                    if(ct_Drive.TDD.ct_Ticket._Active.Is_Ticket() && OrderSelect(0, SELECT_BY_POS, MODE_TRADES)  && OrderProfit() < -2)//--why not work?
                    {         //bool close1 = OrderClose(OrderTicket(), OrderLots(), Ask, ct_Drive.TDD.ct_Market_Symbol.Slippage, clrLawnGreen); //
                              //bool close2 = OrderClose(OrderTicket(), OrderLots(), Bid, ct_Drive.TDD.ct_Market_Symbol.Slippage, clrLawnGreen); //
                              OrderEnd_ALL(true, -1);//
                    }//
          }//
          //=============================================================================================================
          Strateges_EXIT_Signal_Trade_Terminate();//
          //=============================================================================================================
          UPDATED = true;
          if(!this.UPDATED)      {Alert(" ct_End.UPDATED: ", this.UPDATED);}
          return UPDATED; ///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_End::Strateges_EXIT_Signal_Trade_Terminate()
{         //if(ct_Drive.TDD.ct_Signals.DATAS.Is_Scalping_Macd_Active)
          //----    DATAS.Is_Active_MACD_Trader = true; //
          //================================================================
          if(ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACD_Trader)
          {         if(ct_Drive.TDD.ct_Ticket._Active.Is_Ticket())
                    {         if(ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACD_Trader)
                              {         //
                                        bool ress = OrderSelect(0, SELECT_BY_POS, MODE_TRADES);//cant set order comment
                                        //ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsBuy  = false;
                                        //ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsSell = false;
                                        //ct_Drive.TDD.ct_Signals.TICC.Final_MACD_VOID_Condition_Signal = false;
                                        //exite at scalp change trend power
                                        {         if(ct_Drive.TDD.ct_Signals.DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 == 2)//2 is sell
                                                  {         if( !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIn && OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && -2.5 > OrderProfit()) //market Bulish from cross
                                                            {         Print("Terminate MACD ADX 01");//
                                                                      if(TerminateAll()) //ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.DIsBull1_Bear0
                                                                      {         //Print("A its prifited Is_Active_MACD_Trader");//
                                                                                ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACD_Trader = false; //--allow set trade signal again
                                                                                ct_Drive.TDD.ct_Signals.DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                                Print("Terminate MACD ADX 01");//
                                                                      } //
                                                            }//
                                                  }//
                                                  if(ct_Drive.TDD.ct_Signals.DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 == 1)//1 is buy
                                                  {         if( !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.IsCrossOkBulishDIp && OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && -2.5 > OrderProfit()) //market bearish from cross
                                                            {         Print("Terminate MACD ADX 02");//
                                                                      if(TerminateAll())//!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ADX.DIsBull1_Bear0
                                                                      {         //Print("A its prifited Is_Active_MACD_Trader");//
                                                                                ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACD_Trader = false; //--allow set trade signal again
                                                                                ct_Drive.TDD.ct_Signals.DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                                Print("Terminate MACD ADX 02");//
                                                                      } //
                                                            }//
                                                  }//
                                        }//
                                        //exite at scalp profited
                                        {         if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && ct_Drive.TDD.ct_Signals.DATAS.ScalpAmount_MACD_Trader < OrderProfit())
                                                  {         //Print(" A its prifited Is_Active_MACD_Trader");//
                                                            Print("Terminate MACD ADX 03 profited");//
                                                            if(TerminateAll())
                                                            {         //Print("A its prifited Is_Active_MACD_Trader");//
                                                                      ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACD_Trader = false; //--allow set trade signal again
                                                                      ct_Drive.TDD.ct_Signals.DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                      Print("Terminate MACD ADX 03 profited");//
                                                            } //
                                                            //
                                                  }//
                                                  //exite at change signal to sell
                                                  if(ct_Drive.TDD.ct_Signals.DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 == 1 && ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartSell)//ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsBuy &&
                                                  {         //Print(" B its prifited Is_Active_MACD_Trader");//
                                                            Print("Terminate MACD ADX 03 chang signal to sell");//
                                                            if(TerminateAll())
                                                            {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACD_Trader = false; //--allow set trade signal again
                                                                      ct_Drive.TDD.ct_Signals.DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                      Print("Terminate MACD ADX 03 chang signal to sell");//
                                                            } //
                                                            //
                                                  } //
                                                  //exite at change signal to buy
                                                  if(ct_Drive.TDD.ct_Signals.DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 == 2 && ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsStartBuy)//ct_Drive.TDD.ct_Signals.TICC.Final_MACD_Trade_Condition_Signal.IsBuy &&
                                                  {         //Print(" C its prifited Is_Active_MACD_Trader");//
                                                            Print("Terminate MACD ADX 03 chang signal to buy");///
                                                            if(TerminateAll())
                                                            {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACD_Trader = false;//--allow set trade signal again
                                                                      ct_Drive.TDD.ct_Signals.DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 = 3;//
                                                                      Print("Terminate MACD ADX 03 chang signal to buy");///
                                                            }//
                                                  } //
                                        }//
                              }//
                              else
                              {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACD_Trader = false;
                                        ct_Drive.TDD.ct_Signals.DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 = 3;//
                              }//
                    }
                    else
                    {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACD_Trader = false;
                              ct_Drive.TDD.ct_Signals.DATAS.Active_MACD_Traer_Mode_Buy1_Sell2_Void3 = 3;//
                    }//
          }
          //
          if(ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACDSolo_Trader)
          {         //================================================================
                    if(ct_Drive.TDD.ct_Ticket._Active.Is_Ticket())
                    {         if(ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader)
                              {         //================================================================
                                        //--------------------------------------------------------------------------------------
                                        if(ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 == 1)//1 is buy
                                        {         if(ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndBuy)
                                                  {         //
                                                            if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && 2 < OrderProfit()) //--end when its not Profited
                                                            {         if(TerminateAll())
                                                                      {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false; //--allow set trade signal again
                                                                                ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                                Print("Terminate MACD Solo IsEndBuy");//
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc = "";//
                                                                      } //
                                                            }//
                                                            ct_Drive.TDD.ct_Modify.Trails.TrailSL.Stops.Curr_Pip_temp = ct_Drive.TDD.ct_Modify.Trails.TrailSL.Stops.Curr_Pip;
                                                            ct_Drive.TDD.ct_Modify.Trails.TrailSL.Stops.Curr_Pip = 50;//
                                                            //
                                                  } //
                                                  if(ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.R2 < Close[0] && OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && ((Ask - Bid) + 20 * Point())  < OrderProfit())
                                                  {         if(TerminateAll())
                                                            {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false; //--allow set trade signal again
                                                                      ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                      Print("Terminate MACD Solo IsEndBuy");//
                                                                      ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc = "";//
                                                            } //
                                                  }//
                                        }
                                        if(ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 == 2)//1 is sell
                                        {         if(ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.IsEndSell)
                                                  {         //
                                                            if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && 2 < OrderProfit()) //--end when its not Profited
                                                            {         if(TerminateAll())
                                                                      {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false; //--allow set trade signal again
                                                                                ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                                Print("Terminate MACD Solo IsEndSell");//
                                                                                ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc = "";//
                                                                      } //
                                                            }//
                                                            ct_Drive.TDD.ct_Modify.Trails.TrailSL.Stops.Curr_Pip_temp = ct_Drive.TDD.ct_Modify.Trails.TrailSL.Stops.Curr_Pip;
                                                            ct_Drive.TDD.ct_Modify.Trails.TrailSL.Stops.Curr_Pip = 50;//
                                                            //
                                                  } //
                                                  if(ct_Drive.TDD.ct_Conductor.DC_data.Pivot_Periods._M5.S2 > Close[0] && OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && ((Ask - Bid) + 20 * Point())  < OrderProfit())
                                                  {         if(TerminateAll())
                                                            {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false; //--allow set trade signal again
                                                                      ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                      Print("Terminate MACD Solo IsEndSell");//
                                                                      ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc = "";//
                                                            } //
                                                  }//
                                        }//
                                        //--------------------------------------------------------------------------------------
                                        {         /*
                                                  if(ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 == 2)//2 is sell
                                                  {         //
                                                            if( ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc == "DirectTrade")
                                                            {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Up_Selling)//gone sell
                                                                      {         //
                                                                      }
                                                                      if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Down_Buying)//gone buy//we are in one minite scalping//
                                                                      {         //
                                                                                Print("Terminate MACD Solo 01 chang signal to Buy");//
                                                                                if(TerminateAll())
                                                                                {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false; //--allow set trade signal again
                                                                                          ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                                          Print("Terminate MACD Solo 01 chang signal to Buy");//
                                                                                } //
                                                                      } //
                                                            } //
                                                            if( ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc == "unDirectTrade")
                                                            {         if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && -2 > OrderProfit())
                                                                      {         if(TerminateAll())
                                                                                {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false; //--allow set trade signal again
                                                                                          ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                                          Print("Terminate MACD Solo 02f chang signal to Sell");//
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc = "";//
                                                                                } //
                                                                      }//
                                                                      else if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && 2 < OrderProfit())
                                                                      {         if(TerminateAll())
                                                                                {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false; //--allow set trade signal again
                                                                                          ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                                          Print("Terminate MACD Solo 02f chang signal to Sell");//
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc = "";//
                                                                                } //
                                                                      }//
                                                            }//
                                                  }//
                                                  if(ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 == 1)//1 is buy
                                                  {         //
                                                            if( ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc == "DirectTrade")
                                                            {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Up_Selling)//gone sell
                                                                      {         //
                                                                                Print("Terminate MACD Solo 02 chang signal to Sell");//
                                                                                if(TerminateAll())
                                                                                {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false; //--allow set trade signal again
                                                                                          ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                                          Print("Terminate MACD Solo 02 chang signal to Sell");//
                                                                                } //
                                                                      }
                                                                      if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.E_MACD_Cross_Signal[0] == Et_MACD_Cross_Signal_Down_Buying)//gone buy
                                                                      {         //
                                                                      } //
                                                            }//
                                                            if( ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc == "unDirectTrade")
                                                            {         if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && -2 > OrderProfit())
                                                                      {         if(TerminateAll())
                                                                                {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false; //--allow set trade signal again
                                                                                          ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                                          Print("Terminate MACD Solo 02d chang signal to Sell");//
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc = "";//
                                                                                } //
                                                                      }//
                                                                      else if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && 2 < OrderProfit())
                                                                      {         if(TerminateAll())
                                                                                {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false; //--allow set trade signal again
                                                                                          ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                                          Print("Terminate MACD Solo 02d chang signal to Sell");//
                                                                                          ct_Drive.TDD.ct_Signals.TICC.Final_MACDSolo_Trade_Condition_Signal.ModeDesc = "";//
                                                                                } //
                                                                      }//
                                                            }
                                                            //
                                                  } //
                                                  */
                                        }//
                                        //================================================================
                              }
                              else
                              {         //================================================================
                                        ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false;
                                        ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3;//
                              }
                              //================================================================
                    }//
                    else
                    {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false;
                              ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3;//
                              //
                    }//
                    //================================================================
          }
          //
          if(ct_Drive.TDD.ct_Signals.DATAS.Is_Active_ArraySence_Trader || ct_Drive.TDD.ct_Signals.DATAS.Is_Active_TreeSence_Trader)
          {
                    {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Lower_m80 && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80)
                              {         if(ct_Drive.TDD.ct_Ticket._Active.Is_Ticket() && OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && OrderProfit() > 1)
                                        {         ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out = "Active"; //
                                                  ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Sell = true; //
                                        }//
                                        else
                                        {         ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out      = "DeActive"; //
                                                  ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Sell = false; //
                                        } //
                              }
                              else
                              {         ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out      = "DeActive"; //
                                        ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Sell = false; //
                              } //
                              //***************************************************************************************************
                              //--WHEN SCALPING //--NEED KEY TO ACTIVATION ON UI
                              if(ct_Drive.TDD.ct_Ticket._Active.Is_Ticket() && OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && OrderProfit() > Max_Profite_Scalp)
                              {         ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out = "Active"; //
                                        ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Sell = true; //
                                        if(TerminateAll()) {ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Sell = false; ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out      = "DeActive";} //
                                        if(ct_Drive.TDD.ct_Signals.DATAS.Is_Active_ArraySence_Trader)ct_Drive.TDD.ct_Signals.DATAS.Is_Active_ArraySence_Trader     = false;
                                        if(ct_Drive.TDD.ct_Signals.DATAS.Is_Active_TreeSence_Trader)ct_Drive.TDD.ct_Signals.DATAS.Is_Active_TreeSence_Trader      = false; //
                              } //
                              else
                              {         ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out = "DeActive"; //
                                        ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Sell = false; //
                              }//
                    }
                    //---exit signal buy
                    {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Grater_m20 && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 )
                              {         if(ct_Drive.TDD.ct_Ticket._Active.Is_Ticket() && OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && OrderProfit() > 1)
                                        {         ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out = "Active"; //
                                                  ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Buy = true; //
                                        }//
                                        else
                                        {         ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Buy = false; //
                                                  ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out = "DeActive"; //
                                        } //
                              }
                              else
                              {         ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Buy = false; //
                                        ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out = "DeActive"; //
                              }
                              //***************************************************************************************************
                              //--WHEN SCALPING //--NEED KEY TO ACTIVATION ON UI
                              if(ct_Drive.TDD.ct_Ticket._Active.Is_Ticket() && OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && OrderProfit() > Max_Profite_Scalp)
                              {         ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out = "Active"; //
                                        ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Buy = true; //
                                        if(TerminateAll())
                                        {         ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Buy = false;
                                                  ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out = "DeActive";  //
                                        } //////----INJECTION
                                        if(ct_Drive.TDD.ct_Signals.DATAS.Is_Active_ArraySence_Trader)ct_Drive.TDD.ct_Signals.DATAS.Is_Active_ArraySence_Trader     = false;
                                        if(ct_Drive.TDD.ct_Signals.DATAS.Is_Active_TreeSence_Trader)ct_Drive.TDD.ct_Signals.DATAS.Is_Active_TreeSence_Trader      = false; //
                              } //
                              else
                              {         ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Is_Exit_Buy = false; //
                                        ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out = "DeActive"; //
                              }//
                    }//
          }
          //================================================================
          if(ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_NNSence_Trader)
          {         //================================================================
                    if(ct_Drive.TDD.ct_Ticket._Active.Is_Ticket())
                    {         if(ct_Drive.TDD.ct_Signals.DATAS.Is_Active_NNSence_Trader)
                              {         //================================================================
                                        if(ct_Drive.TDD.ct_Signals.DATAS.Active_NNSence_Traer_Mode_Buy1_Sell2_Void3 == 2)//2 is sell
                                        {         //
                                                  if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && 2 < OrderProfit())
                                                  {         if(TerminateAll())
                                                            {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_NNSence_Trader = false; //--allow set trade signal again
                                                                      ct_Drive.TDD.ct_Signals.DATAS.Active_NNSence_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                      Print("Terminate NNSence 02d chang signal to Sell");//
                                                                      ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.ModeDesc = ""; //
                                                            }//
                                                  } //
                                        }//
                                        if(ct_Drive.TDD.ct_Signals.DATAS.Active_NNSence_Traer_Mode_Buy1_Sell2_Void3 == 1)//1 is buy
                                        {         //
                                                  if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && 2 < OrderProfit())
                                                  {         if(TerminateAll())
                                                            {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_NNSence_Trader = false; //--allow set trade signal again
                                                                      ct_Drive.TDD.ct_Signals.DATAS.Active_NNSence_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                      Print("Terminate NNSence 02d chang signal to Sell");//
                                                                      ct_Drive.TDD.ct_Signals.TICC.Final_NNSence_Trade_Condition_Signal.ModeDesc = "";//
                                                            }//
                                                  }//
                                        } //
                                        //================================================================
                              }
                              else
                              {         //================================================================
                                        ct_Drive.TDD.ct_Signals.DATAS.Is_Active_NNSence_Trader = false;
                                        ct_Drive.TDD.ct_Signals.DATAS.Active_NNSence_Traer_Mode_Buy1_Sell2_Void3 = 3;//
                              }
                              //================================================================
                    }//
                    else
                    {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_NNSence_Trader = false;
                              ct_Drive.TDD.ct_Signals.DATAS.Active_NNSence_Traer_Mode_Buy1_Sell2_Void3 = 3;//
                              //
                    }//
                    //================================================================
          }
          if(ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_FE_Trader)
          {         if(ct_Drive.TDD.ct_Ticket._Active.Is_Ticket())
                    {         if(ct_Drive.TDD.ct_Signals.DATAS.Is_Active_NNSence_Trader)
                              {         //================================================================
                                        if(ct_Drive.TDD.ct_Signals.DATAS.Active_FE_Traer_Mode_Buy1_Sell2_Void3 == 2)//2 is sell
                                        {         //
                                                  if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && 2 < OrderProfit())
                                                  {         if(TerminateAll())
                                                            {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_FE_Trader = false; //--allow set trade signal again
                                                                      ct_Drive.TDD.ct_Signals.DATAS.Active_FE_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                      Print("Terminate FE 02d chang signal to Sell");//
                                                                      ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.ModeDesc = ""; //
                                                            }//
                                                  } //
                                        }//
                                        if(ct_Drive.TDD.ct_Signals.DATAS.Active_FE_Traer_Mode_Buy1_Sell2_Void3 == 1)//1 is buy
                                        {         //
                                                  if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES) && 2 < OrderProfit())
                                                  {         if(TerminateAll())
                                                            {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_FE_Trader = false; //--allow set trade signal again
                                                                      ct_Drive.TDD.ct_Signals.DATAS.Active_FE_Traer_Mode_Buy1_Sell2_Void3 = 3; //
                                                                      Print("Terminate NNSence 02d chang signal to Sell");//
                                                                      ct_Drive.TDD.ct_Signals.TICC.Final_FE_Trade_Condition_Signal.ModeDesc = "";//
                                                            }//
                                                  }//
                                        } //
                                        //----target achived? 0.61 1.00 1.61 >>>>>>>>
                              }//
                              else
                              {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_FE_Trader = false;
                                        ct_Drive.TDD.ct_Signals.DATAS.Active_FE_Traer_Mode_Buy1_Sell2_Void3 = 3;//
                              }//
                    }//
                    else
                    {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_FE_Trader = false;
                              ct_Drive.TDD.ct_Signals.DATAS.Active_FE_Traer_Mode_Buy1_Sell2_Void3 = 3;//
                              //
                    }//
          }
          //================================================================
          /*
           if(ct_Drive.TDD.ct_Signals.DATAS.Is_Pressed_MACDSolo_Trader)
          {         //================================================================
                    if(ct_Drive.TDD.ct_Ticket._Active.Is_Ticket())
                    {         if(ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader)
                              {         //================================================================
                                        if(ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 == 2)//2 is sell
                                        {         //

                                        }//
                                        if(ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 == 1)//1 is buy
                                        {         //
                                        }//
                                        //================================================================
                              }
                              else
                              {         //================================================================
                                        ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false;
                                        ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3;//
                              }
                              //================================================================
                    }//
                    else
                    {         ct_Drive.TDD.ct_Signals.DATAS.Is_Active_MACDSolo_Trader = false;
                              ct_Drive.TDD.ct_Signals.DATAS.Active_MACDSolo_Traer_Mode_Buy1_Sell2_Void3 = 3;//
                              //
                    }//
                    //================================================================
          }
          */
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_End::OrderEnd_ALL(bool IsAny, int OP_Type)
{         bool result; int PutSlippage = ct_Drive.TDD.ct_Market_Symbol.Slippage; //
          if(IsAny)
          {         for(int i = 0; OrdersTotal() > i; i++) //--LOOP ALL ORDERS
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) &&  ct_Drive.TDD.ct_Bank.Is_MagicNumber()) // Delete ct_Order
                              {         while(IsTradeContextBusy()) {Sleep(10); Print("terminating order ios busy");   }
                                        bool IsTerminate = false;
                                        ResetLastError();
                                        if(OrderType() == OP_SELLLIMIT)     {IsTerminate = OrderDelete(OrderTicket(), Red);}
                                        if(OrderType() == OP_SELLSTOP)      {IsTerminate = OrderDelete(OrderTicket(), Red);}
                                        if(OrderType() == OP_BUYLIMIT)      {IsTerminate = OrderDelete(OrderTicket(), Red);}
                                        if(OrderType() == OP_BUYSTOP)       {IsTerminate = OrderDelete(OrderTicket(), Red);}
                                        if(OrderType() == OP_BUY)           {IsTerminate = OrderClose(OrderTicket(), OrderLots(), Bid, PutSlippage, Red);}
                                        if(OrderType() == OP_SELL)          {IsTerminate = OrderClose(OrderTicket(), OrderLots(), Ask, PutSlippage, Red);}
                                        //
                                        ErrorTerminate = GetLastError();
                                        //Print("terminating order: ", ErrorDescription(GetLastError()));
                                        if(ErrorTerminate != 0 && ErrorTerminate != 4000 ) { Print("terminating order failed: ", ErrorDescription(ErrorTerminate)); }
                                        //
                                        if(IsTerminate)                     {result = true;};
                                        if(!IsTerminate)// Error Handling
                                        {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error-CloseAllSellLimit faile:",  __LINE__, __FUNCTION__);
                                                  string ErrLog = StringConcatenate("terminating order failed ", "Bid: ", Bid, " Ask: ", Ask, " ct_Ticket: ", OrderTicket());
                                                  Print(ErrLog);  //{Alert((string)__LINE__+"CloseAllSellLimitOrders_O:ErrLog","-Line:",__LINE__); Sleep(10000);}
                                                  result = false; //
                                        } //
                                        else {i--;}//
                                        CheackResult(OP_Type, IsTerminate); //
                              }//
                    }//
                    return true;//
          }
          else //--delete OP_Type seted orders
          {         for(int i = 0; OrdersTotal() > i; i++) //--LOOP ALL ORDERS
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) &&  ct_Drive.TDD.ct_Bank.Is_MagicNumber() && OrderType() == OP_Type) // Delete ct_Order
                              {         while(IsTradeContextBusy()) {Sleep(10);}
                                        bool IsTerminate = false;
                                        if(OP_Type == OP_SELLLIMIT)     {IsTerminate = OrderDelete(OrderTicket(), Red);}
                                        if(OP_Type == OP_SELLSTOP)      {IsTerminate = OrderDelete(OrderTicket(), Red);}
                                        if(OP_Type == OP_BUYLIMIT)      {IsTerminate = OrderDelete(OrderTicket(), Red);}
                                        if(OP_Type == OP_BUYSTOP)       {IsTerminate = OrderDelete(OrderTicket(), Red);}
                                        if(OP_Type == OP_BUY)           {IsTerminate = OrderClose(OrderTicket(), OrderLots(), Bid, PutSlippage, Red);}
                                        if(OP_Type == OP_SELL)          {IsTerminate = OrderClose(OrderTicket(), OrderLots(), Ask, PutSlippage, Red);}
                                        if(IsTerminate)                 {result = true;};
                                        if(!IsTerminate)// Error Handling
                                        {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error-CloseAllSellLimit faile:",  __LINE__, __FUNCTION__);
                                                  string ErrLog = StringConcatenate("Bid: ", Bid, " Ask: ", Ask, " ct_Ticket: ", OrderTicket());
                                                  Print(ErrLog);  //{Alert((string)__LINE__+"CloseAllSellLimitOrders_O:ErrLog","-Line:",__LINE__); Sleep(10000);}
                                                  result = false; //
                                        } //
                                        else {i--;}//
                                        CheackResult(OP_Type, IsTerminate); //
                              }//
                    }//
                    return true;//
          }//
          return false;//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_End::OrderENDAllX(int TypeOrder, bool ModeTicket = false, int TicketCom = -1, bool result = false) //OP_BUY
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          //============================//============================
          bool          Is_SetCloseBy   = false;
          bool          Is_SetClose     = false;
          bool          Is_SetDelete    = false;
          int           Slippage        = ct_Drive.TDD.ct_Market_Symbol.Slippage;
          int           OrderCount      = 0;
          string        ErrLog          = "**";
          bool          KeyClosed       = false;
          bool          KeyDeleted      = false;
          bool          KeyClosedBy     = false;
          string        resultDesc      = "**"; //
          //---
          if(!ModeTicket)
          {         for(int Counter = 0; Counter <= OrdersTotal() - 1; Counter++)//cool//
                    {         //================================================================================================
                              Is_SetCloseBy = Is_SetClose =  Is_SetDelete = false;
                              //------------------------------------------------------------------------------------------------
                              bool      Curr_select       = OrderSelect(Counter, SELECT_BY_POS, MODE_TRADES);
                              //---
                              if(!Curr_select) continue;
                              int       Curr_OrderType    = OrderType();
                              //---
                              if(Curr_OrderType != TypeOrder)continue; // not allow other type close
                              //------------------------------------------------------------------------------------------------
                              int       Curr_MagicNumber         = ct_Drive.TDD.ct_Ticket._Info.MagicNumber        = OrderMagicNumber();
                              string    Curr_Symbol              = ct_Drive.TDD.ct_Ticket._Info.Symbol             = OrderSymbol();
                              int       Curr_Ticket              = ct_Drive.TDD.ct_Ticket._Info.ct_Ticket          = OrderTicket();    // ticket number to close
                              double    Curr_ClosePrice          = ct_Drive.TDD.ct_Ticket._Info.ClosePrice         = OrderClosePrice();//just for historyy
                              datetime  Curr_CloseTime           = ct_Drive.TDD.ct_Ticket._Info.CloseTime          = OrderCloseTime();
                              string    Curr_Comment             = ct_Drive.TDD.ct_Ticket._Info.Comment            = OrderComment();
                              double    Curr_Commission          = ct_Drive.TDD.ct_Ticket._Info.Commission         = OrderCommission();
                              double    Curr_lots                = ct_Drive.TDD.ct_Ticket._Info.Lots               = OrderLots();      // volume
                              int       Curr_opposite            = ct_Drive.TDD.ct_Ticket._Info.Opposite           = 0;    // opposite ticket number open Unique number of the opposite order ticket.
                              double    Curr_PriceToClose        = ct_Drive.TDD.ct_Ticket._Info.PriceToClose       = Bid;     // close price
                              int       Curr_Slippage            = ct_Drive.TDD.ct_Ticket._Info.Slippage           = ct_Drive.TDD.ct_Market_Symbol.Slippage;  // Slippage
                              color     Curr_arrow_color         = ct_Drive.TDD.ct_Ticket._Info.ArrowColor         = clrAzure; // color
                              //============================================================================================
                              if(Curr_CloseTime == 0)
                              {         if( Curr_MagicNumber !=  ct_Drive.TDD.ct_Bank.MagicNumber && ((Curr_Symbol == StSymbol.Current) && (Curr_OrderType == TypeOrder))) { OrderCount--; } ; //me
                                        if( Curr_MagicNumber !=  ct_Drive.TDD.ct_Bank.MagicNumber && ((Curr_Symbol != StSymbol.Current) && (Curr_OrderType == TypeOrder))) { OrderCount--; }; //me
                                        if( Curr_MagicNumber ==  ct_Drive.TDD.ct_Bank.MagicNumber && ((Curr_Symbol == StSymbol.Current) && (Curr_OrderType == TypeOrder))) { OrderCount--; };//zobat
                                        if( Curr_MagicNumber ==  ct_Drive.TDD.ct_Bank.MagicNumber && ((Curr_Symbol != StSymbol.Current) && (Curr_OrderType == TypeOrder))) { OrderCount--; }; //zobat
                              };
                              //=============================================
                              if(Curr_OrderType == OP_SELL)       { Curr_PriceToClose = ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_ASK);}
                              if(Curr_OrderType == OP_BUY)        { Curr_PriceToClose = ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_BID);}
                              //---
                              if(Curr_OrderType == OP_SELL)       { Curr_arrow_color = Red;   resultDesc = "-CloseByTicket SellMarket faile:"; ErrLog = StringConcatenate("ct_Ticket: ", Curr_Ticket, " Ask: ", ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_ASK), resultDesc); };
                              if(Curr_OrderType == OP_BUY)        { Curr_arrow_color = Green; resultDesc = "-CloseByTicket BuyMarket faile:";  ErrLog = StringConcatenate("ct_Ticket: ", Curr_Ticket, " Bid: ", ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_BID), resultDesc); };
                              //---
                              if(Curr_OrderType == OP_SELLSTOP)   { Curr_arrow_color = Red;   resultDesc = "-CloseByTicket SellStop faile:";   ErrLog = StringConcatenate("ct_Ticket: ", Curr_Ticket, " Ask: ", ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_ASK), resultDesc); };
                              if(Curr_OrderType == OP_BUYSTOP)    { Curr_arrow_color = Green; resultDesc = "-CloseByTicket BuyStop faile:";    ErrLog = StringConcatenate("ct_Ticket: ", Curr_Ticket, " Bid: ", ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_BID), resultDesc); };
                              if(Curr_OrderType == OP_SELLLIMIT)  { Curr_arrow_color = Red;   resultDesc = "-CloseByTicket SellLimit faile:";  ErrLog = StringConcatenate("ct_Ticket: ", Curr_Ticket, " Ask: ", ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_ASK), resultDesc); };
                              if(Curr_OrderType == OP_BUYLIMIT)   { Curr_arrow_color = Green; resultDesc = "-CloseByTicket BuyLimit faile:";   ErrLog = StringConcatenate("ct_Ticket: ", Curr_Ticket, " Bid: ", ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_BID), resultDesc); };
                              //=============================================
                              if(Curr_OrderType == OP_BUY || OP_SELL )Is_SetClose = true;
                              if(Curr_OrderType == OP_BUYLIMIT || OP_BUYSTOP || OP_SELLLIMIT || OP_SELLSTOP)Is_SetDelete = true;
                              //--------------------------------------------------------------------------------------------# ending order
                              if(Is_SetCloseBy) { KeyClosedBy = OrderCloseBy(Curr_Ticket, Curr_opposite = 0, Curr_arrow_color); }
                              if(Is_SetClose)   { KeyClosed   = OrderClose(Curr_Ticket, Curr_lots, Curr_PriceToClose, Curr_Slippage, Curr_arrow_color); }
                              if(Is_SetDelete)  { KeyDeleted  = OrderDelete(Curr_Ticket, Curr_arrow_color); }
                              //--------------------------------------------------------------------------------------------
                              if(KeyClosed || KeyDeleted) { StringReplace(ErrLog, "faile", "succeed"); Print(ErrLog); continue;}//can back again this loop by Counter--
                              if(!KeyClosed || !KeyDeleted)
                              {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error-" + resultDesc,  __LINE__, __FUNCTION__);
                                        Print(ErrLog);//
                                        result = false;//
                              } //
                              //============================================================================================#>>
                    }//
          }//
          else if(ModeTicket)
          {         //================================================================================================
                    Is_SetCloseBy = Is_SetClose =  Is_SetDelete = false;
                    bool Select = OrderSelect(TicketCom, SELECT_BY_TICKET);//select order by ticket
                    //---
                    int       Curr_OrderType    = OrderType();
                    //------------------------------------------------------------------------------------------------
                    int       Curr_MagicNumber  = OrderMagicNumber();
                    string    Curr_Symbol       = OrderSymbol();
                    int       Curr_Ticket       = OrderTicket();    // ticket number to close
                    double    Curr_ClosePrice   = OrderClosePrice();
                    datetime  Curr_CloseTime    = OrderCloseTime();
                    string    Curr_Comment      = OrderComment();
                    double    Curr_Commission   = OrderCommission();
                    double    Curr_lots         = OrderLots();      // volume
                    int       Curr_opposite     = 0;    // opposite ticket number open Unique number of the opposite order ticket.
                    double    Curr_PriceToClose = Bid; //Ask    // close price
                    int       Curr_Slippage     = ct_Drive.TDD.ct_Market_Symbol.Slippage;  // Slippage
                    color     Curr_arrow_color  = clrAzure; // color
                    //============================================================================================
                    if(Select && Curr_CloseTime == 0)
                    {         while(IsTradeContextBusy()) {Sleep(10);}
                              //=============================================
                              if(Curr_OrderType == OP_SELL)       { Curr_PriceToClose = ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_ASK);}
                              if(Curr_OrderType == OP_BUY)        { Curr_PriceToClose = ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_BID);}
                              //---
                              if(Curr_OrderType == OP_SELL)       { Curr_arrow_color = Red;   resultDesc = "-CloseByTicket SellMarket faile:"; ErrLog = StringConcatenate("ct_Ticket: ", Curr_Ticket, " Ask: ", ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_ASK), resultDesc); };
                              if(Curr_OrderType == OP_BUY)        { Curr_arrow_color = Green; resultDesc = "-CloseByTicket BuyMarket faile:";  ErrLog = StringConcatenate("ct_Ticket: ", Curr_Ticket, " Bid: ", ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_BID), resultDesc); };
                              //---
                              if(Curr_OrderType == OP_SELLSTOP)   { Curr_arrow_color = Red;   resultDesc = "-CloseByTicket SellStop faile:";   ErrLog = StringConcatenate("ct_Ticket: ", Curr_Ticket, " Ask: ", ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_ASK), resultDesc); };
                              if(Curr_OrderType == OP_BUYSTOP)    { Curr_arrow_color = Green; resultDesc = "-CloseByTicket BuyStop faile:";    ErrLog = StringConcatenate("ct_Ticket: ", Curr_Ticket, " Bid: ", ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_BID), resultDesc); };
                              if(Curr_OrderType == OP_SELLLIMIT)  { Curr_arrow_color = Red;   resultDesc = "-CloseByTicket SellLimit faile:";  ErrLog = StringConcatenate("ct_Ticket: ", Curr_Ticket, " Ask: ", ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_ASK), resultDesc); };
                              if(Curr_OrderType == OP_BUYLIMIT)   { Curr_arrow_color = Green; resultDesc = "-CloseByTicket BuyLimit faile:";   ErrLog = StringConcatenate("ct_Ticket: ", Curr_Ticket, " Bid: ", ct_Drive.TDD.ct_Market_Symbol.GetProperties(MODE_BID), resultDesc); };
                              //--------------------------------------------------------------------------------------------# Setting Key
                              if(Curr_OrderType == OP_BUY || OP_SELL )Is_SetClose = true;
                              if(Curr_OrderType == OP_BUYLIMIT || OP_BUYSTOP || OP_SELLLIMIT || OP_SELLSTOP)Is_SetDelete = true;
                              //--------------------------------------------------------------------------------------------# ending order
                              if(Is_SetCloseBy) { KeyClosedBy = OrderCloseBy(Curr_Ticket, Curr_opposite = 0, Curr_arrow_color); }
                              if(Is_SetClose)   { KeyClosed   = OrderClose(Curr_Ticket, Curr_lots, Curr_PriceToClose, Curr_Slippage, Curr_arrow_color); }
                              if(Is_SetDelete)  { KeyDeleted  = OrderDelete(Curr_Ticket, Curr_arrow_color); }
                              //============================================================================================#>>
                              if(KeyClosed || KeyDeleted) { StringReplace(ErrLog, "faile", "succeed"); Print(ErrLog); return true;} //the ticket closed.
                              if(!KeyClosed || !KeyDeleted)
                              {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error-" + resultDesc,  __LINE__, __FUNCTION__);
                                        Print(ErrLog);//
                                        result = false;//
                              } //
                    }
                    return result ;//
          }///
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          //============================//============================
          return result = false; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_End::Terminate(int Type, bool IsTicketEnd = false )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
          int result = -1; //
          if(IsTicketEnd && ct_Drive.TDD.ct_Market_Symbol.Is_Running)
          {         switch (Type)///befor endiing market day time
                    {         case CloseTypeALL:
                              {         OrderEnd(OP_SELL | OP_BUY); //??is work?  OrderEnd(OP_SELL);
                                        OrderENDAllX(OP_SELL | OP_BUY);
                                        OrderEndPendings(OP_BUY | OP_SELL); //??is work?  OrderEnd(OP_SELL); OrderEndPendings(OP_SELL);
                                        result = CloseTypeALL;//
                              } break;
                              case CloseTypeMarketAll:          {OrderEnd(OP_BUY); OrderEnd(OP_SELL);                   result = CloseTypeBuyMarket;} break;
                              case CloseTypeBuyMarket:          {OrderEnd(OP_BUY);                                      result = CloseTypeBuyMarket;} break;
                              case CloseTypeSellMarket:         {OrderEnd(OP_SELL);                                     result = CloseTypeSellMarket;} break;
                              //
                              case DeleteTypePending_BuyStop:   {OrderEnd(OP_BUYSTOP);                                  result = DeleteTypePending_BuyStop;} break;
                              case DeleteTypePending_BuyLimit:  {OrderEnd(OP_BUYLIMIT);                                 result = DeleteTypePending_BuyLimit;} break;
                              case DeleteTypePending_SellStop:  {OrderEnd(OP_SELLSTOP);                                 result = DeleteTypePending_SellStop;} break;
                              case DeleteTypePending_SellLimit: {OrderEnd(OP_SELLLIMIT);                                result = DeleteTypePending_SellLimit;} break;
                              //
                              case DeleteTypePendingAll:        {OrderEndPendings(OP_BUY); OrderEndPendings(OP_SELL);   result = DeleteTypePending_SellLimit;} break;
                              case DeleteTypePendingAllBuy:     {OrderEndPendings(OP_BUY);                              result = DeleteTypePendingAllBuy;} break;
                              case DeleteTypePendingAllSell:    {OrderEndPendings(OP_SELL);                             result = DeleteTypePendingAllSell;} break;
                              //
                              default: {________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error-default",  __LINE__, __FUNCTION__);}; //
                    }; //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
          return result;//
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_End::OrderEnd(int TypeOrder, bool ModeAll = false, bool ModeTicket = false, int TicketCom = -1)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
          if(!ModeTicket)
          {         switch(TypeOrder)
                    {         //------------------------------------------------------------------------------------------------------------------------------
                              case OP_BUY:              OrderEnd_ALL(true, OP_BUY);             break; //
                              case OP_SELL:             OrderEnd_ALL(true, OP_SELL);            break; //
                              case OP_BUYLIMIT:         OrderEnd_ALL(true, OP_BUYLIMIT);        break; //
                              case OP_SELLLIMIT:        OrderEnd_ALL(true, OP_SELLLIMIT);       break; //
                              case OP_BUYSTOP:          OrderEnd_ALL(true, OP_BUYSTOP);         break; //
                              case OP_SELLSTOP:         OrderEnd_ALL(true, OP_BUYSTOP);         break; //
                                        //------------------------------------------------------------------------------------------------------------------------------
                    }//
          }//
//=============================================
          return false;//
//=============================================
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_End::OrderEndPendings(int TypeOrder)
{         switch(TypeOrder)
          {         case OP_BUY: {         if(OrderEnd(OP_BUYLIMIT) && OrderEnd(OP_BUYSTOP) && OrderENDAllX(OP_BUYLIMIT) && OrderENDAllX(OP_BUYSTOP) ) {return true;} }; break; //
                    case OP_SELL: {         if(  OrderEnd(OP_SELLLIMIT) && OrderEnd(OP_SELLSTOP)  && OrderENDAllX(OP_SELLLIMIT) && OrderENDAllX(OP_SELLSTOP)) {return true;} }; break; //
          }
          return false; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  Ct_End::CheackResult(int TypeOrder, bool resultEnd)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          switch (TypeOrder)
          {         case OP_BUY:
                    {         if(resultEnd == true) {Print("TicketTotalBuy Close Successful--- and Tiket number is:", OrderTicket(), " ````,Profite is:  ", OrderProfit(), " ``OrderInfo: "); OrderPrint(); return true; }
                              else                  {________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error-TicketTotalBuy Close failed error code is: ",  __LINE__, __FUNCTION__);  OrderPrint(); return false;  } //
                    } break; //
                    case OP_SELL:
                    {         if(resultEnd == true) {Print("SellTicketClosed Successful: -- and Tiket number is:", OrderTicket(), "``,Profite is:  ", OrderProfit(), " ``OrderInfo: "); OrderPrint(); return true; }
                              else                  { ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error-SellTicketClosed failed error code is: ",  __LINE__, __FUNCTION__);  OrderPrint(); return false;  } //
                    } break; ///
                    case OP_BUYLIMIT:
                    {         if(resultEnd == true) { Print("BuyLimitDeleterX ct_Ticket Delete Successful: ", OrderTicket());  OrderPrint(); return true; }
                              else                  { ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error-BuyLimitDeleterX ct_Ticket Delete failed error code is: ",  __LINE__, __FUNCTION__); OrderPrint(); return false;  } ////
                    } break; ///
                    case OP_SELLLIMIT:
                    {         if(resultEnd == true) { Print("TicketTotalSell Deleted - Tiket Number: ", OrderTicket()); OrderPrint(); return true; }
                              else                  { ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error-TicketTotalSell Deleted failed error code is: ",  __LINE__, __FUNCTION__);  OrderPrint(); return false; } //
                    } break; ///
                    case OP_BUYSTOP:
                    {         if(resultEnd == true) { Print("BuyStopDeleterX ct_Ticket Delete Successful: ", OrderTicket()); OrderPrint(); return true; }
                              else                  {________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error-BuyStopDeleterX ct_Ticket Delete failed error code is: ",  __LINE__, __FUNCTION__); OrderPrint(); return false;  } //
                    } break; ///
                    case OP_SELLSTOP:
                    {         if(resultEnd == true) { Print("SellStopDeleterX ct_Ticket Deleted Successful  - Tiket Number: ", OrderTicket()); OrderPrint(); return true; }
                              else                  {________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error-SellStopDeleterX ct_Ticket Deleted failed error code is: ",  __LINE__, __FUNCTION__);  OrderPrint(); return false; } //
                    } break; ///
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return false;//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_End::CloseallRun()
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Closeall Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          string        Text  ;          //Loading Text
          int           Slippage  ;
          double        DropPoint;
          bool          FocusPair;
          int           _ErrorCheck;
          Text = "Closing All";          //Loading Text
          Slippage = 10;
          string strTmp = Text;
          DropPoint = WindowPriceOnDropped();// retrieve DropPoint
          if(DropPoint == 0)  FocusPair = false;// if dropped on pair window will closeall pendings of that pair, else will closeall
          else FocusPair = true;
          int total = OrdersTotal();// start for to close pendings
          if(total > 0)
          {         for(int i = total - 1; i >= 0; i--)
                    {         DrawLabel(true, strTmp);
                              strTmp += ".";
                              if(StringLen(strTmp) >= StringLen(Text) + 6)strTmp = Text;
                              _ErrorCheck = OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
                              if(_ErrorCheck == -1) {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Error ct_Order Select: ",  __LINE__, __FUNCTION__); break; } // Error Check
                              _ErrorCheck = 0;
                              for(int l = 0; l < 5; l++) //if pair is not equal to dropped pair
                              {         if(FocusPair && Symbol() != OrderSymbol())break;
                                        // delete
                                        if(OrderType() == OP_SELL)      _ErrorCheck = OrderClose(OrderTicket(), OrderLots(), MarketInfo(OrderSymbol(), MODE_ASK), Slippage, clrNONE);
                                        if(OrderType() == OP_BUY)       _ErrorCheck = OrderClose(OrderTicket(), OrderLots(), MarketInfo(OrderSymbol(), MODE_BID), Slippage, clrNONE);
                                        if(OrderType() == OP_BUYLIMIT || OrderType() == OP_BUYSTOP || OrderType() == OP_SELLLIMIT || OrderType() == OP_SELLSTOP)_ErrorCheck = OrderDelete(OrderTicket());
                                        if(_ErrorCheck == -1)    Sleep(100);  // error check
                                        else break; //
                              }
                              if(_ErrorCheck == -1) {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-faild Closeall()",  __LINE__, __FUNCTION__); } //
                    }//
          }
          DrawLabel(false, strTmp);
          PlaySound("coin.wav"); //
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Closeall Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          return true;//
}
//+------------------------------------------------------------------+
void Ct_End::DrawLabel(bool KeyCreate, string _Text = "_Text", int _X = 2, int _Y = 100, ENUM_BASE_CORNER _Corner = CORNER_LEFT_LOWER, string _FType = "Lucida Console", int _FSize = 8, color _Col = clrAqua)
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Closeall Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          string tooltip = "\n"; color colID = _Col; string IDName = "SCRIPT_DROP";
          long chart_id = 0; int sub_window = 0; datetime time1 = 0; double price1 = 0;
          if(ObjectFind(chart_id, IDName) < 0)
          {         if(!ObjectCreate(chart_id, IDName, OBJ_LABEL, sub_window, time1, price1))
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "Closeall Error",  __LINE__, __FUNCTION__); //;
                    if(ObjectFind(chart_id, IDName) >= 0)
                    {         ObjectSetInteger(0, IDName, OBJPROP_CORNER, _Corner);
                              ObjectSetInteger(0, IDName, OBJPROP_ANCHOR, ANCHOR_LEFT_UPPER);
                              ObjectSetInteger(0, IDName, OBJPROP_XDISTANCE, _X);//ObjectSetInteger(0,ID,OBJPROP_XSIZE,CHART_WIDTH_IN_PIXELS-_X);
                              ObjectSetInteger(0, IDName, OBJPROP_YDISTANCE, _Y);////ObjectSetInteger(0,ID,OBJPROP_YSIZE,20);
                              ObjectSetString(0, IDName, OBJPROP_TEXT, _Text);
                              ObjectSetInteger(0, IDName, OBJPROP_COLOR, colID);
                              ObjectSetInteger(0, IDName, OBJPROP_HIDDEN, true);
                              ObjectSetInteger(0, IDName, OBJPROP_STATE, true);
                              ObjectSetString(0, IDName, OBJPROP_FONT, _FType);
                              ObjectSetInteger(0, IDName, OBJPROP_FONTSIZE, _FSize);
                              ObjectSetInteger(0, IDName, OBJPROP_SELECTABLE, false);
                              ObjectSetString(0, IDName, OBJPROP_TOOLTIP, tooltip);
                              ObjectSetInteger(0, IDName, OBJPROP_BACK, false);//
                    }//
          } //
          else if(!KeyCreate) {ObjectDelete(0, IDName);}
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Closeall Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_End::LogerX(const int arfTicketX = -1, const uint LotSizeCom = 0, const double arfStopLossX = -1, const double arfTakeProfitX = -1, const int arfCloseTicketX = -1, const double arfClosePriceX = -1) //\\incoming info
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //
          if(arfTicketX ==  SONargTicket && arfStopLossX == SONargStopLoss  && arfTakeProfitX == SONargTakeProfit)
          {         string ErrLog = StringConcatenate("Bid: ", MarketInfo(OrderSymbol(), MODE_BID), " Ask: ", MarketInfo(OrderSymbol(), MODE_ASK), " ct_Ticket: ", arfTicketX, " Stop: ", arfStopLossX, " Profit: ", arfTakeProfitX);
                    Print(ErrLog);
                    Print("TicketX  AFARIN POURYA");//
          }
          if(arfCloseTicketX == SONCloseTicket && arfClosePriceX == SONClosePrice )
          {         string ErrLog = StringConcatenate("Bid: ", MarketInfo(StSymbol.Current, MODE_BID), " ct_Ticket: ", arfCloseTicketX, " Price: ", arfClosePriceX);
                    Print(ErrLog);
                    Alert(" CloseTicket AFARIN POURYA");// //
          }
          if(ct_Drive.TDD.ct_Start._OrderPutting.Is_MarketsBuyDone != True)
          {         string ErrLog = StringConcatenate("Bid: ", MarketInfo(_Symbol, MODE_BID), " Ask: ", MarketInfo(_Symbol, MODE_BID), " LotSize: ", LotSizeCom);
                    Print(ErrLog);
                    Print("BuyMarket AFARIN POURYA");// //
          }
          if(ct_Drive.TDD.ct_Start._OrderPutting.Is_MarketsSellDone != True)
          {         string ErrLog = StringConcatenate("Bid: ", MarketInfo(_Symbol, MODE_BID), " Ask: ", MarketInfo(_Symbol, MODE_ASK), " LotSize: ", LotSizeCom);
                    Print(ErrLog);
                    Print("SellMarke AFARIN POURYA");// //
          }
          if(ct_Drive.TDD.ct_Start._OrderPutting.Is_PendingsSellStopDone != True)// Error Handling/////////////////the rder seleced and no nedd .OrderOpenPrice()///SellStopPrice-BuyStopPrice-SellLimitPrice-BuyLimitPrice
          {         string ErrLog = StringConcatenate("Bid: ", MarketInfo(_Symbol, MODE_BID), " LotSize: ", LotSizeCom, " SellStopPrice: ", OrderOpenPrice(), " SellSL: ", OrderStopLoss(), " SellTP: ", OrderTakeProfit(), " Expiration: ", OrderExpiration()); ///TimeToStr(UseExpiration)
                    Print(ErrLog); }
          if(ct_Drive.TDD.ct_Start._OrderPutting.Is_PendingsBuyStopDone != True)// Error Handling
          {         string ErrLog = StringConcatenate("Ask: ", MarketInfo(_Symbol, MODE_ASK), " LotSize: ", LotSizeCom, " BuyStopPrice: ", OrderOpenPrice(), " BuySL: ", OrderStopLoss(), " BuyTP: ", OrderTakeProfit(), " Expiration: ", OrderExpiration());
                    Print(ErrLog); }
          if(ct_Drive.TDD.ct_Start._OrderPutting.Is_PendingsSellLimitDone != True)
          {         string ErrLog = StringConcatenate("Ask: ", MarketInfo(_Symbol, MODE_ASK), " LotSize: ", LotSizeCom, " SellLimitPrice: ", OrderOpenPrice(), " SellSL: ", OrderStopLoss(), " SellTP: ", OrderTakeProfit(), " Expiration: ", OrderExpiration());
                    Print(ErrLog); }
          if(ct_Drive.TDD.ct_Start._OrderPutting.Is_PendingsBuyLimitDone != True)
          {         string ErrLog = StringConcatenate("Bid: ", MarketInfo(_Symbol, MODE_BID), " LotSize: ", LotSizeCom, " BuyLimitPrice: ", OrderOpenPrice(), " BuySL: ", OrderStopLoss(), " BuyTP: ", OrderTakeProfit(), " Expiration: ", OrderExpiration());
                    //" Price: ", BuyLimitPrice, " Stop: ", BuySL, " Profit: ", BuyTP, " Expiration: ", TimeToStr(UseExpiration));
                    Print(ErrLog); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Ct_End::Superviser(const string SozText = "Soz", const int Sozline = -1, const string SozFunc = "NoneFunc",
                        const int argPassTicket =  -1, uint LotSizeCom = 0, const double argPassStopLoss  = -1, const double argPassTakeProfit  = -1,
                        const int argPassCloseTicket = -1, const double argPassClosePrice  = -1)
{         //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          //
          bool result = false;
          //PrinterX(SozText, Sozline, SozFunc, ERRORX(_LastError, Sozline, SozFunc), _LastError);
          ________________________________________________________Xerorr.AlerterX(SozText, Sozline, SozFunc, _LastError);
          //
          if("Add Stop/Profit - Error " == SozText)
                    LogerX(  argPassTicket, LotSizeCom, argPassStopLoss,   argPassTakeProfit);  //
          if("Add Stop/Profit - Error " == SozText)
                    LogerX(  argPassTicket, LotSizeCom, argPassStopLoss, argPassTakeProfit, argPassCloseTicket,  argPassClosePrice);      //
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          return result = true;//
}

//+------------------------------------------------------------------+
//| Check for close order conditions                                 |
//+------------------------------------------------------------------+
void Ct_End::CheckForClose()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          double ma;
//--- go trading only for first tiks of new bar
          if(Volume[0] > 1) return;
//--- get Moving Average
          ma = iMA(NULL, 0, 12, 0, MODE_SMA, PRICE_CLOSE, 0);
//---
          for(int i = 0; i < OrdersTotal(); i++)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false) break;
                    if(OrderMagicNumber() !=  ct_Drive.TDD.ct_Bank.MagicNumber || OrderSymbol() != Symbol()) continue;
                    //--- check order type
                    if(OrderType() == OP_BUY)
                    {         if(Open[1] > ma && Close[1] < ma)
                              {         if(!OrderClose(OrderTicket(), OrderLots(), Bid, 3, White))
                                                  Print("OrderClose error ", GetLastError()); }
                              break; }
                    if(OrderType() == OP_SELL)
                    {         if(Open[1] < ma && Close[1] > ma)
                              {         if(!OrderClose(OrderTicket(), OrderLots(), Ask, 3, White))
                                                  Print("OrderClose error ", GetLastError()); }
                              break; } //
          }
//---
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ct_End::CheckForClose2()
{         double ma;
//--- go trading only for first tiks of new bar
          if(Volume[0] > 1)
                    return;
//--- get Moving Average
          ma = iMA(NULL, 0, MovingPeriod__, MovingShift__, MODE_SMA, PRICE_CLOSE, 0);
//---
          for(int i = 0; i < OrdersTotal(); i++)
          {         if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false)
                              break;
                    if(OrderMagicNumber() != MAGICMA || OrderSymbol() != Symbol())
                              continue;
                    //--- check order type
                    if(OrderType() == OP_BUY)
                    {         if(Open[1] > ma && Close[1] < ma)
                              {         if(!OrderClose(OrderTicket(), OrderLots(), Bid, 3, White))
                                                  Print("OrderClose error ", GetLastError()); }
                              break; }
                    if(OrderType() == OP_SELL)
                    {         if(Open[1] < ma && Close[1] > ma)
                              {         if(!OrderClose(OrderTicket(), OrderLots(), Ask, 3, White))
                                                  Print("OrderClose error ", GetLastError()); }
                              break; } }
//---
}
//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
