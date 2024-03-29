//+------------------------------------------------------------------+
//||   ||||||||||                 eFlowPanel.mqh                    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ce_FlowPanel: public Sg_OnChartEvent_base
{
public:
          Sg_OnChartEvent       EventsData;     ////---Events.Main(this); Event_TradePanel.Main(Event_TradePanel); //---who work with Objparam methods.

          void                  OnChartEvents();//Sg_OnChartEvent &event //--Used solo Data
          void                  Event_OBJECT_CLICK();
          void                  Event_KeyDown()        {return;};;
          void                  Event_MOUSE_MOVE();// {return;};
          //--Events
          //void           OnChartEvents(string FuncCom, const int id, const long &lparam, const double &dparam, const string &sparam, int LineCOM = 0, string FuncCome = "None");
          //void           MOUSE_MOVE(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None");
          //void           OBJECT_CLICK(string FuncCom, const string & sparam);
          void                  gToolsBox_Pad_SubOnClick();//
          void                  FlowPanel_OBJECT_CLICK();
          void                  FlowPanel_All_OBJECT_CLICK();
          ///
          Sg_Position2D   RightUP, RightDown, LetfUp, LetfDown;
          //
}; //--Ce_FlowPanel FlowPanel_Event;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+OnChartEventPadFlow
void Ce_FlowPanel::Event_OBJECT_CLICK()
{         //-------------------------------------------------------------------------------------------------
          string Clicked = Event.sparam;
//Alert(sparam, "   (", LBL_.GAC.Name(), ")<<LBL_.GAC.Name()<<Run: FlowPanel.IsMove", FlowPanel.IsMove, "   ", __LINE__, "   ", __FUNCSIG__);
//Alert(sparam, "   (",gFlow_Pad.LBL_C2.GAC.Name(), ")<<gFlow_Pad.LBL_C2.GAC.Name()<<Run: FlowPanel.IsMove", FlowPanel.IsMove, "   ", __LINE__, "   ", __FUNCSIG__);
          FlowPanel_OBJECT_CLICK();
          FlowPanel_All_OBJECT_CLICK();
          Event_ElliotWavePanel.Event_OBJECT_CLICK(); //
          Candels_Box.OBJECT_CLICK();
          GoldVIP.OBJECT_CLICK(); //
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ce_FlowPanel::OnChartEvents()
{         //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          switch(Event.id)
          {         case CHARTEVENT_CHART_CHANGE:
                    {         ///IS_EventIdCrosshair = false;
                              //Keyboard.ScanPreesKeys(CHARTEVENT_CHART_CHANGE);///must GetKeyState_VK_LBUTTON ==false
                    } break; ////
                    case CHARTEVENT_OBJECT_DRAG:
                    {         ///Keyboard.ScanPreesKeys(CHARTEVENT_OBJECT_DRAG);///must GetKeyState_VK_LBUTTON ==false
                    } break; ////
                    case CHARTEVENT_CUSTOM:
                    {         //if(EventIdCrosshair != 9000)EventIdCrosshair--;
                    }
//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ce_FlowPanel::Event_MOUSE_MOVE()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(KeyCHARTEVENT_MOUSE_MOVE) //---
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT
                    ////>>>RightMiddel Pannel130+C_STATICSUN::GoldVIPMoveX, -170+C_STATICSUN::GoldVIPMoveY
                    if(FlowPanel.IsMove)
                    {         Sg_Position2D_Def.x = (int)Event.lparam - 40;  Sg_Position2D_Def.y = (int)Event.dparam - 400 ;
                              FlowPanel.CALL(MODE_MOVE, true, Sg_Position2D_Def); Sg_Position2D_Def.reset(); } //---Prevent calling
                    if(gFlow_Pad.IsMove_AutoCharter)
                    {         Sg_Position2D_Def.x = (int)Event.lparam - 40;  Sg_Position2D_Def.y = (int)Event.dparam - 400 ;
                              FlowPanel.KeyPad_AutoCharter(MODE_MOVE, true, false, Sg_Position2D_Def); Sg_Position2D_Def.reset();  } //
                    //=========================================================================================================
                    ///OnMouseMoving states
                    if(true && gFlow_Pad.BTN_Crosshair.GAC.State() && Mouse.KeyBotton_PressMiddleClick)
                    {         ///
                              static bool IgnoreClickLeft = false;
                              if(IgnoreClickLeft)IgnoreClickLeft = false;
                              else IgnoreClickLeft = true;
                              ///<<<<<<<Keyboard.ScanPreesKeys(CHARTEVENT_MOUSE_MOVE);///>>ONevery pixel move it runn.
                              /////////////////////////////////////////////////////////?? >>.must happen crossline enddd.
                              //Alert(Mouse.KeyBotton_PressMiddleClicK, "=<<KeyBotton_PressMiddleClicK==||||", Mouse.KeyBotton_PressLeftClicK_Count, "=<<Mouse.KeyBotton_PressLeftClicK_Count");
                              //Alert( Mouse.KeyBotton_PressLeftClicK_Count, ":<<Mouse.KeyBotton_PressLeftClicK_Count");
                              if( Mouse.KeyBotton_PressLeftClick_Count == 2) //IgnoreClickLeft == false && Keyboard.GetKeyState_VK_LBUTTON == false &&
                              {         //OFFKEY
                                        {         gFlow_Pad.BTN_Crosshair.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gFlow_Pad.BTN_Crosshair.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gFlow_Pad.BTN_Crosshair.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gFlow_Pad.BTN_Crosshair.GAC.State(false);//
                                                  //Alert(Mouse.KeyBotton_PressMiddleClicK);//
                                        }
                                        ///
                                        ///IS_EventIdCrosshair =
                                        Mouse.KeyBotton_PressMiddleClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0;
                                        ///
                                        ///
                                        ///
                              } //
                              ///
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_TrendLine.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //if(false && Mouse.KeyBotton_PressLeftClick_Count == 2)
                              //{         Alert(Mouse.KeyBotton_PressLeftClick, "-Mouse.KeyBotton_PressLeftClicK");
                              //          Mouse.KeyBotton_PressLeftClick = false;
                              //          Mouse.KeyBotton_PressLeftClick_Count = 0;//
                              //} //
                              //
                              //if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              //if(false && Mouse.KeyBotton_PressLeftClick_Count == 2)
                              //{         //OFFKEY
                              //          {        gToolsBox_Pad.BTN_TrendLine.GAC.Color(BtnColors_FlowPanelB.DescColor );
                              //                   gToolsBox_Pad.BTN_TrendLine.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              //                   gToolsBox_Pad.BTN_TrendLine.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                              //                   gToolsBox_Pad.BTN_TrendLine.GAC.State(false); //
                              //                    //Alert(Mouse.KeyBotton_PressLeftClicK);//
                              //          }//
                              //          Mouse.KeyBotton_PressLeftClick = false;
                              //          Mouse.KeyBotton_PressLeftClick_Count = 0;
                              //          ///
                              //          ///
                              //} //
                              //else if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              //{         //OFFKEY
                              //          {        gToolsBox_Pad.BTN_TrendLine.GAC.Color(BtnColors_FlowPanelB.DescColor );
                              //                   gToolsBox_Pad.BTN_TrendLine.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              //                   gToolsBox_Pad.BTN_TrendLine.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                              //                   gToolsBox_Pad.BTN_TrendLine.GAC.State(false); //
                              //                    //Alert(Mouse.KeyBotton_PressLeftClicK);//
                              //          }//
                              //          Mouse.KeyBotton_PressLeftClick = false;
                              //          Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              //}
                              ///
                              ////Manual Clicking///
                              //if(false && Mouse.KeyBotton_PressLeftClick_Count == 2)          //
                              //{         Mouse.PressLeftClick();;
                              //          //
                              //} //
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_TrendLine.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_TrendLine.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_TrendLine.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_TrendLine.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_HorizontalLine.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_HorizontalLine.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_HorizontalLine.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_HorizontalLine.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_HorizontalLine.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_VerticalLine.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_VerticalLine.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_VerticalLine.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_VerticalLine.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_VerticalLine.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    ///
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_TrendLineByAngel.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_TrendLineByAngel.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_TrendLineByAngel.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_TrendLineByAngel.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_TrendLineByAngel.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_ChannelsFibonachi.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_ChannelsFibonachi.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_ChannelsFibonachi.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_ChannelsFibonachi.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_ChannelsFibonachi.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    } //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_ChannelsLinerRegression.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_ChannelsLinerRegression.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_ChannelsLinerRegression.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_ChannelsLinerRegression.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_ChannelsLinerRegression.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    } //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_ChannelsEquidistant.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_ChannelsEquidistant.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_ChannelsEquidistant.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_ChannelsEquidistant.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_ChannelsEquidistant.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_ChannelsStandardDeviation.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_ChannelsStandardDeviation.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_ChannelsStandardDeviation.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_ChannelsStandardDeviation.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_ChannelsStandardDeviation.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_GannLine.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_GannLine.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_GannLine.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_GannLine.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_GannLine.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    } //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_GannFan.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_GannFan.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_GannFan.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_GannFan.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_GannFan.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    } //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_GannGrid.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_GannGrid.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_GannGrid.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_GannGrid.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_GannGrid.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_FibonacciRetracement.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_FibonacciRetracement.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_FibonacciRetracement.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_FibonacciRetracement.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_FibonacciRetracement.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_FibonacciTimeZone.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_FibonacciTimeZone.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_FibonacciTimeZone.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_FibonacciTimeZone.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_FibonacciTimeZone.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_FibonacciFan.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_FibonacciFan.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_FibonacciFan.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_FibonacciFan.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_FibonacciFan.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_FibonacciArcs.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_FibonacciArcs.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_FibonacciArcs.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_FibonacciArcs.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_FibonacciArcs.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_FibonacciExpansion.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_FibonacciExpansion.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_FibonacciExpansion.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_FibonacciExpansion.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_FibonacciExpansion.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_ShapeRectangle.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_ShapeRectangle.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_ShapeRectangle.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_ShapeRectangle.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_ShapeRectangle.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_ShapeTriangle.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 4)///big fuccc////is soulution////// 4time clicking
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_ShapeTriangle.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_ShapeTriangle.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_ShapeTriangle.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_ShapeTriangle.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_TimeFrames_1Minute.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_TimeFrames_1Minute.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_1Minute.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_TimeFrames_1Minute.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_1Minute.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_TimeFrames_5Minute.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_TimeFrames_5Minute.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_5Minute.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_TimeFrames_5Minute.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_5Minute.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_TimeFrames_15Minute.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_TimeFrames_15Minute.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_15Minute.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_TimeFrames_15Minute.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_15Minute.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_TimeFrames_30Minute.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_TimeFrames_30Minute.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_30Minute.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_TimeFrames_30Minute.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_30Minute.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_TimeFrames_1Hour.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_TimeFrames_1Hour.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_1Hour.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_TimeFrames_1Hour.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_1Hour.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_TimeFrames_4Hours.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_TimeFrames_4Hours.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_4Hours.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_TimeFrames_4Hours.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_4Hours.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_TimeFrames_Daily.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_TimeFrames_Daily.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_Daily.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_TimeFrames_Daily.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_Daily.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_TimeFrames_Weekly.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_TimeFrames_Weekly.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_Weekly.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_TimeFrames_Weekly.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_Weekly.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_TimeFrames_Monthly.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 2)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_TimeFrames_Monthly.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_Monthly.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_TimeFrames_Monthly.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_TimeFrames_Monthly.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //===================================================
                    }
                    //=========================================================================================================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    //=========================================================================================================
                    if(true && gToolsBox_Pad.BTN_ToolsBoxKeyClear.GAC.State() && Mouse.KeyBotton_PressLeftClick)
                    {         ///
                              //=========================================================================================================
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
                              //===================================================
                              if(Mouse.KeyDown(VK_LBUTTON)) {Mouse.KeyBotton_PressLeftClick_Count++;}
                              if(!Mouse.KeyDown(VK_LBUTTON) && Mouse.KeyBotton_PressLeftClick_Count > 0)///big fuccc////is soulution///
                              {         //OFFKEY
                                        {         gToolsBox_Pad.BTN_ToolsBoxKeyClear.GAC.Color(BtnColors_FlowPanelB.DescColor );
                                                  gToolsBox_Pad.BTN_ToolsBoxKeyClear.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                                                  gToolsBox_Pad.BTN_ToolsBoxKeyClear.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                                                  gToolsBox_Pad.BTN_ToolsBoxKeyClear.GAC.State(false); //
                                                  //Alert(Mouse.KeyBotton_PressLeftClicK);//
                                        }//
                                        Mouse.KeyBotton_PressLeftClick = false;
                                        Mouse.KeyBotton_PressLeftClick_Count = 0; //
                              }
                              //=========================================================================================================
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
                              //===================================================
                    }
                    //=========================================================================================================
                    //controlling key presiing leftbouttom mouse//
                    //>>not working ///Keyboard.ScanPreesKeys(CHARTEVENT_CLICK);///>>ONevery Clicking   it runn.///>>>Coolll//Third Mission on clicking keys
                    //=========================================================================================================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
          }//
          return; //
} //
void Ce_FlowPanel::gToolsBox_Pad_SubOnClick()
{         string Clicked = Event.sparam;
          if (gToolsBox_Pad.BTN_TrendLine.GAC.State() && gToolsBox_Pad.BTN_TrendLine.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;;///beacause is int dragiigg mode need.and work weell//you are cool boy//???>>POURYA
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_TrendLine.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_TrendLine.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_TrendLine.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_L_T();
                              //============================
                              // Mouse.PressMiddleClicK();//>>gone ok
                              //======================================================================
                              //Mouse.KeyBotton_PressLeftClicK =  true;///instade of  //Keyboard.PressCtrl_F();  //
                              ///=====================-
                              //IS_EventIdTrendline = EventChartCustom(ChartID(), EventIdTrendline, lparam, dparam, sparam);// ///[in] ID of the user events. This identifier is automatically added to the value CHARTEVENT_CUSTOM and converted to the integer type
                              //IS_EventIdTrendline = Mouse.KeyBotton_PressLeftClicK;
                              ///Mouse.PressLeftClicK();
                              ///Mouse.PressRightClicK();
                              //Keyboard.ScanPreesKeys(CHARTEVENT_OBJECT_CLICK);
                              ///=====================-
                              //=======================
                              //>> Keyboard.ScanPreesKeys(CHARTEVENT_CLICK);//
                              //>>work >>//Keyboard.ScanPreesKeys(CHARTEVENT_OBJECT_CLICK);
                              //
                    }
                    //
                    //
          }///
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_HorizontalLine.GAC.State() && gToolsBox_Pad.BTN_HorizontalLine.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_HorizontalLine.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_HorizontalLine.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_HorizontalLine.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_L_H();
                              //============================
                    }
                    //
                    //
          }///
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_VerticalLine.GAC.State() && gToolsBox_Pad.BTN_VerticalLine.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_VerticalLine.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_VerticalLine.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_VerticalLine.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_L_V();
                              //============================
                    }
                    //
                    //
          }///
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_TrendLineByAngel.GAC.State() && gToolsBox_Pad.BTN_TrendLineByAngel.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_TrendLineByAngel.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_TrendLineByAngel.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_TrendLineByAngel.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_L_A();
                              //============================
                    }
                    //
                    //
          }///
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_ChannelsFibonachi.GAC.State() && gToolsBox_Pad.BTN_ChannelsFibonachi.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_ChannelsFibonachi.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_ChannelsFibonachi.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_ChannelsFibonachi.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_C_F();
                              //============================
                    }
                    //
                    //
          }///
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_ChannelsLinerRegression.GAC.State() && gToolsBox_Pad.BTN_ChannelsLinerRegression.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_ChannelsLinerRegression.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_ChannelsLinerRegression.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_ChannelsLinerRegression.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_C_R();
                              //============================
                    }
                    //
                    //
          }///
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_ChannelsEquidistant.GAC.State() && gToolsBox_Pad.BTN_ChannelsEquidistant.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_ChannelsEquidistant.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_ChannelsEquidistant.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_ChannelsEquidistant.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_C_E();
                              //============================
                    }
                    //
                    //
          }///
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_ChannelsStandardDeviation.GAC.State() && gToolsBox_Pad.BTN_ChannelsStandardDeviation.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_ChannelsStandardDeviation.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_ChannelsStandardDeviation.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_ChannelsStandardDeviation.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_C_S();
                              //============================
                    }
                    //
                    //
          }///
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_GannLine.GAC.State() && gToolsBox_Pad.BTN_GannLine.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_GannLine.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_GannLine.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_GannLine.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_G_L();
                              //============================
                    }
                    //
                    //
          }///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_GannFan.GAC.State() && gToolsBox_Pad.BTN_GannFan.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_GannFan.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_GannFan.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_GannFan.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_G_F();
                              //============================
                    }
                    //
                    //
          }
///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_GannGrid.GAC.State() && gToolsBox_Pad.BTN_GannGrid.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_GannGrid.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_GannGrid.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_GannGrid.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_G_G();
                              //============================
                    }
                    //
                    //
          }///
///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_FibonacciRetracement.GAC.State() && gToolsBox_Pad.BTN_FibonacciRetracement.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_FibonacciRetracement.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_FibonacciRetracement.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_FibonacciRetracement.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_F_R();
                              //============================
                    }
                    //
                    //
          }///
///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_FibonacciTimeZone.GAC.State() && gToolsBox_Pad.BTN_FibonacciTimeZone.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_FibonacciTimeZone.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_FibonacciTimeZone.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_FibonacciTimeZone.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_F_T();
                              //============================
                    }
                    //
                    //
          }///
///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_FibonacciFan.GAC.State() && gToolsBox_Pad.BTN_FibonacciFan.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_FibonacciFan.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_FibonacciFan.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_FibonacciFan.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_F_F();
                              //============================
                    }
                    //
                    //
          }///
///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_FibonacciArcs.GAC.State() && gToolsBox_Pad.BTN_FibonacciArcs.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_FibonacciArcs.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_FibonacciArcs.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_FibonacciArcs.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_F_A();
                              //============================
                    }
                    //
                    //
          }///
///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_FibonacciExpansion.GAC.State() && gToolsBox_Pad.BTN_FibonacciExpansion.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_FibonacciExpansion.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_FibonacciExpansion.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_FibonacciExpansion.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_F_E();
                              //============================
                    }
                    //
                    //
          }///
///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_ShapeRectangle.GAC.State() && gToolsBox_Pad.BTN_ShapeRectangle.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_ShapeRectangle.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_ShapeRectangle.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_ShapeRectangle.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_S_R();
                              //============================
                    }
                    //
                    //
          }///
///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_ShapeTriangle.GAC.State() && gToolsBox_Pad.BTN_ShapeTriangle.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_ShapeTriangle.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_ShapeTriangle.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_ShapeTriangle.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_S_T();
                              //============================
                    }
                    //
                    //
          }///
///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_ShapeEllipse.GAC.State() && gToolsBox_Pad.BTN_ShapeEllipse.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_ShapeEllipse.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_ShapeEllipse.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_ShapeEllipse.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_I_S_E();
                              //============================
                    }
                    //
                    //
          }///
///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_TimeFrames_1Minute.GAC.State() && gToolsBox_Pad.BTN_TimeFrames_1Minute.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_TimeFrames_1Minute.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_1Minute.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_1Minute.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_C_T_ENTER_1();
                              //============================
                    }
                    //
                    //
          }/// ///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_TimeFrames_5Minute.GAC.State() && gToolsBox_Pad.BTN_TimeFrames_5Minute.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_TimeFrames_5Minute.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_5Minute.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_5Minute.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_C_T_ENTER_5();
                              //============================
                    }
                    //
                    //
          }/// ///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_TimeFrames_15Minute.GAC.State() && gToolsBox_Pad.BTN_TimeFrames_15Minute.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_TimeFrames_15Minute.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_15Minute.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_15Minute.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_C_T_ENTER_Down_Down_ENTER();
                              //============================
                    }
                    //
                    //
          }/// ///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_TimeFrames_30Minute.GAC.State() && gToolsBox_Pad.BTN_TimeFrames_30Minute.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_TimeFrames_30Minute.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_30Minute.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_30Minute.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_C_T_ENTER_3();
                              //============================
                    }
                    //
                    //
          }/// ///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_TimeFrames_1Hour.GAC.State() && gToolsBox_Pad.BTN_TimeFrames_1Hour.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_TimeFrames_1Hour.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_1Hour.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_1Hour.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_C_T_ENTER_H();
                              //============================
                    }
                    //
                    //
          }/// ///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_TimeFrames_4Hours.GAC.State() && gToolsBox_Pad.BTN_TimeFrames_4Hours.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_TimeFrames_4Hours.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_4Hours.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_4Hours.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_C_T_ENTER_4();
                              //============================
                    }
                    //
                    //
          }/// ///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_TimeFrames_Daily.GAC.State() && gToolsBox_Pad.BTN_TimeFrames_Daily.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_TimeFrames_Daily.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_Daily.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_Daily.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_C_T_ENTER_D();
                              //============================
                    }
                    //
                    //
          }/// ///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_TimeFrames_Weekly.GAC.State() && gToolsBox_Pad.BTN_TimeFrames_Weekly.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_TimeFrames_Weekly.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_Weekly.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_Weekly.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_C_T_ENTER_W();
                              //============================
                    }
                    //
                    //
          }///
/// ///                     //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gToolsBox_Pad.BTN_TimeFrames_Monthly.GAC.State() && gToolsBox_Pad.BTN_TimeFrames_Monthly.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 1;///beacause is int dragiigg mode need.and work weell
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gToolsBox_Pad.BTN_TimeFrames_Monthly.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_Monthly.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gToolsBox_Pad.BTN_TimeFrames_Monthly.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              Mouse.KeyBotton_PressLeftClick = Keyboard.Press_Alt_C_T_ENTER_M();
                              //============================
                    }
                    //
                    //
          }///
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ce_FlowPanel::FlowPanel_OBJECT_CLICK()
{         string Clicked = Event.sparam;
///Alert(gFlow_Pad.LBL_Exit.GAC.Name(), ")--Run: (", sparam, ")", __LINE__, __FUNCTION__);///drived canceed.
          if(gFlow_Pad.LBL_Exit.GAC.Name() == Clicked || gFlow_Pad.LBL_DL2.GAC.Name() == Clicked) //"gFlow_Pad.LBL_Exit" == Clicked ||
          {         ///
                    //-------------------------------------------------------------------------
                    // Alert("Run: ", sparam, __LINE__, __FUNCTION__); ///(--Run:gFlow_Pad.LBL_Exit801C_FLOWPANEL::OBJECT_CLICK)//name is NULL
                    FlowPanel.CALL(MODE_CREATE, false, Sg_Position2D_Def);
                    Candels_Box.__Call(MODE_CREATE, false, Sg_Position2D_Def);
                    Elliott_PAD.__CALL(MODE_CREATE, false, Sg_Position2D_Def);
                    FlowPanel.FlowPanelToolsBox(false, false, Sg_Position2D_Def); //
                    //-------------------------------------------------------------------------
                    gFlow_Pad.BTN_Mover.GAC.Color(BtnColors_FlowPanel.DescColorPress = clrWhite);
                    gFlow_Pad.BTN_Mover.GAC.BackColor(BtnColors_FlowPanel.BackColorPress = clrRed);
                    gFlow_Pad.BTN_Mover.GAC.BorderColor(BtnColors_FlowPanel.BorderColorPress = clrGray);
                    gFlow_Pad.BTN_Mover.GAC.State(false);//
                    //-------------------------------------------------------------------------
                    //Alert("Run: gFlow_Pad.LBL_Exit.", __LINE__, __FUNCTION__);
                    //
          } //
          if("Logo-Active_Flow" == Clicked)     { static bool IsSwitch = true;  IsSwitch = IsSwitch ? false : true;   FlowPanel.CALL(MODE_CREATE, IsSwitch, RightUP); }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if("gFlow_Pad.LBL_ShowOrdHistory" == Clicked || "gFlow_Pad.LBL_L2_R" == Clicked)
          {         ///
                    static bool KeySwitcher = true;
                    if(KeySwitcher)
                    {         ObjectSetInteger(0, "gFlow_Pad.LBL_ShowOrdHistory", OBJPROP_COLOR, clrWhite);
                              ObjectSetInteger(0, "gFlow_Pad.LBL_L2_R", OBJPROP_COLOR, clrDarkCyan); //
                              ObjectSetInteger(0, "gFlow_Pad.LBL_L_R", OBJPROP_COLOR, clrLavender); //
                              //gFlow_Pad.LBL_L_R.Create(true, "gFlow_Pad.LBL_L_R", "n",                                (int)(408.2) + FixPadFlowX + independX,      (int)(201.6) + FixPadFlowY + independY,                                                                                                                CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 13, "Webdings");
                              //gFlow_Pad.LBL_L2_R.Create(true, "gFlow_Pad.LBL_L2_R", "n",                              (int)(408.2) + FixPadFlowX + independX,      (int)(200) + FixPadFlowY + independY,                                                                                                                CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 10, "Webdings");
                              ShowOrdHistory = true;
                              KeySwitcher = false; //
                    }
                    else if(!KeySwitcher)
                    {         ObjectSetInteger(0, "gFlow_Pad.LBL_ShowOrdHistory", OBJPROP_COLOR, clrDarkCyan);
                              ObjectSetInteger(0, "gFlow_Pad.LBL_L2_R", OBJPROP_COLOR, clrLavender); //
                              ObjectSetInteger(0, "gFlow_Pad.LBL_L_R", OBJPROP_COLOR, clrDarkCyan); //
                              ShowOrdHistory = false; //
                              KeySwitcher = true; //
                    }
                    //
          } //
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if("gFlow_Pad.LBL_ResetPadPos" == Clicked || "gFlow_Pad.LBL_L_D" == Clicked) {FlowPanel.ResetPadPos();} //
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//gFlow_Pad.BTN_MaximizeChart
          if (    gTradePannelObj.LBL_Maximize.GAC.Name() == Clicked || (gFlow_Pad.BTN_MaximizeChart.GAC.Name() == Clicked))
          {         static bool KeyC = true;
                    if(KeyC)//maximixe
                    {         gTradePannelObj.LBL_Maximize.GAC.Color(BtnColors_FlowPanel.DescColorPress = clrBlue);
                              Sleep(10); Keyboard.Press_F11(); KeyC = false;
                              //================
                              gFlow_Pad.BTN_MaximizeChart.GAC.Color(BtnColors_FlowPanelB.DescColor  );// Alert("BtnColors_FlowPanelB.DescColor:", BtnColors_FlowPanelB.DescColor); //
                              gFlow_Pad.BTN_MaximizeChart.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              gFlow_Pad.BTN_MaximizeChart.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor  );//
                              gFlow_Pad.BTN_MaximizeChart.GAC.State(false);//
                              //
                              //
                    }
                    else//demaximize
                    {         gTradePannelObj.LBL_Maximize.GAC.Color(BtnColors_FlowPanelB.DescColor = clrWhite ); Sleep(10);
                              Keyboard.Press_F11(); KeyC = true;
                              //================
                              gFlow_Pad.BTN_MaximizeChart.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );// Alert("BtnColors_FlowPanelB.DescColorPress:", BtnColors_FlowPanelB.DescColorPress); //
                              gFlow_Pad.BTN_MaximizeChart.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_MaximizeChart.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //gFlow_Pad.BTN_MaximizeChart.GAC.State(true);//
                              //
                    } //
                    FlowPanel.ResetPadPos(); //
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if(gFlow_Pad.LBL_C2.GAC.Name() == Clicked)
          {         //
                    if(FlowPanel.IsMove)
                    {         FlowPanel.IsMove = false;
                              gFlow_Pad.LBL_C2.GAC.Color(clrYellowGreen);
                              gFlow_Pad.LBL_C.GAC.Color(clrDarkRed); //
                              //
                              gCandelBox_Pad.BTN_CandelBox.GAC.State() ? Candels_Box.__Call(MODE_CREATE, true, Sg_Position2D_Def) : Candels_Box.__Call(MODE_CREATE, false, Sg_Position2D_Def);
                              ///(gCandelBox_Pad.BTN_CandelBoxFill.GAC.State()==false)
                              //
                    }
                    else
                    {         FlowPanel.IsMove = true ;
                              gFlow_Pad.LBL_C2.GAC.Color(clrBisque);
                              gFlow_Pad.LBL_C.GAC.Color(clrOrange); //
                              //
                              Candels_Box.__Call(MODE_CREATE, false, Sg_Position2D_Def);
                              //
                    }
                    //
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if(gFlow_Pad.LBL_D2.GAC.Name() == Clicked)
          {         static bool IsSwitch = true;     IsSwitch = !gFlow_Pad.IsLBL_D2 ? true : false;  ///--- Smarterr// static global
                    //=========================================================================================
                    {         ////--- gTradePannelObj.BTN_CommentPannel  ---//
                              {         gTradePannelObj.BTN_CommentPannel.GDS.Set_Action_2(MODE_CREATE, IsSwitch /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                                        gTradePannelObj.BTN_CommentPannel.GDS.Set_Desc_4("gTradePannelObj.BTN_CommentPannel", " "/*"CommentPannel"*/, "Arial", 7);
                                        gTradePannelObj.BTN_CommentPannel.GDS.Set_Self_1(ButtonDEF_state);
                                        gTradePannelObj.BTN_CommentPannel.GDS.Set_Location_5(0, 0, (int)(ChartData_ChartFrame.WidthPixel * 0.25), (int)ChartData_ChartFrame.HeightPixel, CORNER_LEFT_UPPER);
                                        gTradePannelObj.BTN_CommentPannel.GDS.Set_Color_3(C'36, 52, 69', clrGray, clrGray);
                                        gTradePannelObj.BTN_CommentPannel.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gTradePannelObj.BTN_CommentPannel");
                                        gTradePannelObj.BTN_CommentPannel.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
                                        gTradePannelObj.BTN_CommentPannel.Action(gTradePannelObj.BTN_CommentPannel);//
                                        //0// gTradePannelObj.BTN_CommentPannel.Create( IsSwitch, false, __FUNCSIG__, "CommentPannel", " ",
                                        //0// 0, 0, (int)(ChartData_ChartFrame.WidthPixel * 0.25), (int)ChartData_ChartFrame.HeightPixel, CORNER_LEFT_UPPER, ANCHOR_CENTER, false, C'36, 52, 69', clrGray ); //
                              }
                              ////--- LBL_X ---//
                              {         LabelX.GDS.Set_Action_2(MODE_CREATE, IsSwitch);
                                        LabelX.GDS.Set_Desc_4("WM3_CommentPannelPointClear-Back", "Õ", "Webdings", 38);
                                        LabelX.GDS.Set_Color_1(clrWhite);
                                        LabelX.GDS.Set_Location_5((int)(ChartData_ChartFrame.WidthPixel * 0.238), 20, LabelDEF_ANGLE, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                                        LabelX.GDS.Set_Common_6(false, 500, false, false, false, LabelDEF_tooltip + "WM3_CommentPannelPointClear-Back");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0//LBL_.Create(IsSwitch, false, "WM3_CommentPannelPointClear-Back", "Õ",
                                        //0//(int)(ChartData_ChartFrame.WidthPixel * 0.238), 20, CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrWhite, 0, 38, "Webdings", 30);
                              }
                              ////--- LBL_X ---//
                              {         LabelX.GDS.Set_Action_2(MODE_CREATE, IsSwitch);
                                        LabelX.GDS.Set_Desc_4("WM3_CommentPannelPointClear-Back2", "n", "Webdings", 10);
                                        LabelX.GDS.Set_Color_1(clrWhite);
                                        LabelX.GDS.Set_Location_5((int)(ChartData_ChartFrame.WidthPixel * 0.238), 20 - 6, LabelDEF_ANGLE, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                                        LabelX.GDS.Set_Common_6(false, 500, false, false, false, LabelDEF_tooltip + "WM3_CommentPannelPointClear-Back");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0// LBL_.Create(IsSwitch, false, "WM3_CommentPannelPointClear-Back2", "n",
                                        //0//(int)(ChartData_ChartFrame.WidthPixel * 0.238), 20 - 6, CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrWhite, 0, 10, "Webdings", 30);
                              }
                              ////--- LBL_X ---//
                              {         LabelX.GDS.Set_Action_2(MODE_CREATE, IsSwitch);
                                        LabelX.GDS.Set_Desc_4("WM3_CommentPannelPointClear", "û", "Wingdings", 14);
                                        LabelX.GDS.Set_Color_1(clrRed);
                                        LabelX.GDS.Set_Location_5((int)(ChartData_ChartFrame.WidthPixel * 0.238), 20 - 5, LabelDEF_ANGLE, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                                        LabelX.GDS.Set_Common_6(false, 500, false, false, false, LabelDEF_tooltip + "WM3_CommentPannelPointClear-Back");
                                        LabelX.GDS.Set_Chart_6();
                                        LabelX.Action(LabelX);//
                                        //0//LBL_.Create(IsSwitch, false, "WM3_CommentPannelPointClear", "û",
                                        //0//(int)(ChartData_ChartFrame.WidthPixel * 0.238), 20 - 5, CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrRed, 0, 14, "Wingdings", 30); //
                              } //
                    }
                    if (IsSwitch)    {gFlow_Pad.LBL_D2.GAC.Color(clrYellow);   gFlow_Pad.IsLBL_D2 = gFlow_Pad.IsBTN_CommentPannel = true;                IsSwitch = 0;}
                    else             {gFlow_Pad.LBL_D2.GAC.Color(clrLavender); gFlow_Pad.IsLBL_D2 = gFlow_Pad.IsBTN_CommentPannel = false; Comment("");  IsSwitch = 1;} //for Quick//  Comment(ct_Drive.TDD.ct_Conductor.TI_Curr.Comment_Desc);
                    ///
          } //
///---
///---
          if("WM3_CommentPannelPointClear" == Clicked || "WM3_CommentPannelPointClear-Back" == Clicked)
          {         gFlow_Pad.LBL_D2.GAC.Color(clrLavender);
                    gTradePannelObj.BTN_CommentPannel.GAC.Delete();
                    LabelX.Delete("WM3_CommentPannelPointClear-Back");
                    LabelX.Delete("WM3_CommentPannelPointClear-Back2");
                    LabelX.Delete("WM3_CommentPannelPointClear");
                    gFlow_Pad.IsLBL_D2 = false; //
                    Comment("");//for Quick
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if(gFlow_Pad.LBL_U2.GAC.Name() == Clicked)
          {         static bool IsSwitch = 1;
                    if (IsSwitch || gFlow_Pad.IsLBL_U2)
                    {         gFlow_Pad.IsLBL_U2 = IsSwitch = 0;
                              gFlow_Pad.LBL_U2.GAC.Color(clrYellow);
                              FlowPanel.KeyPad_AutoCharter(MODE_CREATE, true, 0, Sg_Position2D_Def); //
                    }
                    else
                    {         gFlow_Pad.IsLBL_U2 = IsSwitch = 1;
                              gFlow_Pad.LBL_U2.GAC.Color(clrLavender);
                              FlowPanel.KeyPad_AutoCharter(MODE_CREATE, false, 1, Sg_Position2D_Def);
                              Sleep(10);
                              //
                    }
                    ///
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//
          if (gFlow_Pad.LBL_R2.GAC.Name() == Clicked || gFlow_Pad.LBL_Zigzag.GAC.Name() == Clicked  ) ///two of them
          {         static bool KeyC = false; bool ComArray[];
                    if(!KeyC)
                    {         gFlow_Pad.LBL_Zigzag.GAC.Color(BtnColors_FlowPanel.DescColorPress = clrBlue );
                              gFlow_Pad.LBL_R2.GAC.Color(BtnColors_FlowPanel.DescColorPress = clrYellow );
                              Zigo.KeyOutZigoRun = Zigo.ZigoRun(ComArray, true); KeyC = true; //
                              gFlow_Pad.LBL_R2.GAC.Color(BtnColors_FlowPanel.DescColorPress = clrYellowGreen ); //
                    }
                    else
                    {         gFlow_Pad.LBL_R2.GAC.Color(BtnColors_FlowPanel.DescColorPress = clrYellow );
                              Zigo.KeyOutZigoRun = Zigo.ZigoRun(ComArray, false);
                              gFlow_Pad.LBL_Zigzag.GAC.Color(BtnColors_FlowPanelB.DescColor = clrRed );
                              gFlow_Pad.LBL_R2.GAC.Color(BtnColors_FlowPanel.DescColorPress = clrLavender );
                              KeyC = false; ///
                    } //
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if(gFlow_Pad.LBL_R2.GAC.Name() == Clicked)
          {         static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 0;
                              gFlow_Pad.LBL_R2.GAC.Color(clrYellow); }
                    else
                    {         IsSwitch = 1;
                              gFlow_Pad.LBL_R2.GAC.Color(clrLavender);
                              Sleep(10);
                              //
                    }
                    ///
          }//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ce_FlowPanel::FlowPanel_All_OBJECT_CLICK()
{         string Clicked = Event.sparam;
          if(  gFlow_Pad.BTN_Mover.GAC.Name() == Clicked )
          {         //
                    if(gFlow_Pad.BTN_Mover.GAC.State())
                    {         /////////////
                              Sleep(10); //
                              if(gFlow_Pad.IsLBL_)
                              {         FlowPanel.CALL(MODE_CREATE, false, Sg_Position2D_Def);
                                        Candels_Box.__Call(MODE_CREATE, false, Sg_Position2D_Def);
                                        gFlow_Pad.BTN_Mover.GAC.Color(BtnColors_FlowPanel.DescColorPress = clrWhite);
                                        gFlow_Pad.BTN_Mover.GAC.BackColor(BtnColors_FlowPanel.BackColorPress = clrRed);
                                        gFlow_Pad.BTN_Mover.GAC.BorderColor(BtnColors_FlowPanel.BorderColorPress = clrGray);
                                        gFlow_Pad.BTN_Mover.GAC.State(false);//
                              }
                              else
                              {         FlowPanel.CALL(MODE_CREATE, true, Sg_Position2D_Def);
                                        //gFlow_Pad.BTN_Mover.GAC.State(true); //
                                        gFlow_Pad.BTN_Mover.GAC.Color(BtnColors_FlowPanel.DescColorPress = clrWhite);
                                        gFlow_Pad.BTN_Mover.GAC.BackColor(BtnColors_FlowPanel.BackColorPress = clrDarkCyan);
                                        gFlow_Pad.BTN_Mover.GAC.BorderColor(BtnColors_FlowPanel.BorderColorPress = clrGray);//
                              }
                              //
                    } //
                    else if(!gFlow_Pad.BTN_Mover.GAC.State())
                    {         //
                              gFlow_Pad.BTN_Mover.GAC.Color(BtnColors_FlowPanel.DescColorPress = clrWhite);
                              gFlow_Pad.BTN_Mover.GAC.BackColor(BtnColors_FlowPanel.BackColorPress = clrRed);
                              gFlow_Pad.BTN_Mover.GAC.BorderColor(BtnColors_FlowPanel.BorderColorPress = clrGray);
                              /////////
                              Sleep(10); FlowPanel.CALL(MODE_CREATE, false, Sg_Position2D_Def);
                              Candels_Box.__Call(MODE_CREATE, false, Sg_Position2D_Def);
                              //gFlow_Pad.BTN_Mover.GAC.State(false);
                              //
                    } //
          }
          {         //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    if (gToolsBox_Pad.BTN_ToolsBox.GAC.State() && gToolsBox_Pad.BTN_ToolsBox.GAC.Name() == Clicked )
                    {         Mouse.KeyBotton_PressLeftClick_Count = 0;
                              static bool IsSwitch = 1;
                              if (IsSwitch)
                              {         IsSwitch = 1;
                                        //----------------------------------------------------------------------
                                        ToolsCall.KeyToolsBox = FlowPanel.FlowPanelToolsBox(false, true, Sg_Position2D_Def);
                                        ToolsCall.ToolsBoxSafe_Time = TimeGMT();
                                        //----------------------------------------------------------------------
                                        gToolsBox_Pad.BTN_ToolsBox.GAC.Color(BtnColors_FlowPanelB.DescColorPress);
                                        gToolsBox_Pad.BTN_ToolsBox.GAC.BackColor(clrOrange);
                                        gToolsBox_Pad.BTN_ToolsBox.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );//BtnColors_FlowPanelB.BorderColorPress//dependet to tome display///
                                        Sleep(1000);
                                        gToolsBox_Pad.BTN_ToolsBox.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                                        //----------------------------------------------------------------------
                              }
                              //
                              //
                    }///
                    else if(!gToolsBox_Pad.BTN_ToolsBox.GAC.State() && gToolsBox_Pad.BTN_ToolsBox.GAC.Name() == Clicked)
                    {         gToolsBox_Pad.BTN_ToolsBox.GAC.Color(BtnColors_FlowPanelB.DescColor);
                              gToolsBox_Pad.BTN_ToolsBox.GAC.BackColor(BtnColors_FlowPanelB.BackColor);
                              gToolsBox_Pad.BTN_ToolsBox.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor);
                              ToolsCall.KeyToolsBox = FlowPanel.FlowPanelToolsBox(false, false, Sg_Position2D_Def); //
                              //
                    }
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    if (gToolsBox_Pad.BTN_ToolsBoxKeyClear.GAC.State() && gToolsBox_Pad.BTN_ToolsBoxKeyClear.GAC.Name() == Clicked )
                    {         Mouse.KeyBotton_PressLeftClick_Count = 1;
                              static bool IsSwitch = 1;
                              if (IsSwitch)
                              {         IsSwitch = 1;
                                        gToolsBox_Pad.BTN_ToolsBoxKeyClear.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                                        gToolsBox_Pad.BTN_ToolsBoxKeyClear.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                                        gToolsBox_Pad.BTN_ToolsBoxKeyClear.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                                        //======================================================================
                                        Mouse.KeyBotton_PressLeftClick = ToolsCall.KeyToolsBoxClear = true;
                                        ///======================
                                        //=======================
                              }
                              //
                              //
                    }///
          }//
          if( Clicked == "gFlow_Pad.BTN_FiboExpTrade")
          {         if(gFlow_Pad.BTN_FiboExpTrade.GAC.State())
                    {         gFlow_Pad.BTN_FiboExpTrade.GAC.Color( clrWhite);//BtnColors_FlowPanel.DescColorPress =
                              gFlow_Pad.BTN_FiboExpTrade.GAC.BackColor( clrRed );//BtnColors_FlowPanel.BackColorPress =
                              gFlow_Pad.BTN_FiboExpTrade.GAC.BorderColor( clrDarkSlateGray ); //BtnColors_FlowPanel.BorderColorPress =
                              //---Alert("--------gFlow_Pad.BTN_FiboExpTrade-----true--------");
                              //
                              TechnicalO.GoldVIP.Desc_Calc.XTrading_Set__calc( MODE_CREATE, true, true, PERIOD_CURRENT); //
                    }
                    else
                    {         gFlow_Pad.BTN_FiboExpTrade.GAC.Color( clrWhite);//BtnColors_FlowPanel.DescColorPress =
                              gFlow_Pad.BTN_FiboExpTrade.GAC.BackColor( clrDarkSlateGray );//BtnColors_FlowPanel.BackColorPress =
                              gFlow_Pad.BTN_FiboExpTrade.GAC.BorderColor( clrDarkSlateGray ); //BtnColors_FlowPanel.BorderColorPress =
                              //---Alert("--------gFlow_Pad.BTN_FiboExpTrade-----false--------");
                              //
                              TechnicalO.GoldVIP.Desc_Calc.XTrading_Set__calc( MODE_CREATE, false,  false, PERIOD_CURRENT); //
                    }
                    //
                    //clrDarkSlateGray, clrDarkSlateGray, clrWhite
          }
//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          bool KeyCalcJustFiboExpansion = false;
          bool Is_CreateFiboExpansion   = false;
          if(gAutoCharter_Pad.BTN_FiboExpansionX.GAC.State() && gAutoCharter_Pad.BTN_FiboExpansionX.GAC.Name() == Clicked  ) //GAC.Name() == " " &&
          {         //
                    gAutoCharter_Pad.BTN_FiboExpansionX.GAC.Color( clrRed);//BtnColors_FlowPanel.DescColorPress =
                    gAutoCharter_Pad.BTN_FiboExpansionX.GAC.BackColor( clrWhite );//BtnColors_FlowPanel.BackColorPress =
                    gAutoCharter_Pad.BTN_FiboExpansionX.GAC.BorderColor( clrWhite ); //BtnColors_FlowPanel.BorderColorPress =
                    Sleep(10);
                    TechnicalO.GoldVIP.Desc_Calc.XTrading_Set__calc(MODE_CREATE, Is_CreateFiboExpansion = true, KeyCalcJustFiboExpansion = false, PERIOD_CURRENT); //
          } //
          else if(!gAutoCharter_Pad.BTN_FiboExpansionX.GAC.State() && gAutoCharter_Pad.BTN_FiboExpansionX.GAC.Name() == Clicked  )
          {         gAutoCharter_Pad.BTN_FiboExpansionX.GAC.Color(  clrWhite );//BtnColors_FlowPanelB.DescColor =
                    gAutoCharter_Pad.BTN_FiboExpansionX.GAC.BackColor(clrDarkSlateGray  );//BackColor =
                    gAutoCharter_Pad.BTN_FiboExpansionX.GAC.BorderColor( clrDarkSlateGray );//BorderColor =
                    Sleep(10);//
                    TechnicalO.GoldVIP.Desc_Calc.XTrading_Set__calc( MODE_CREATE, Is_CreateFiboExpansion = false, KeyCalcJustFiboExpansion = true, PERIOD_CURRENT); //
                    //
                    //
                    //
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//gFlow_Pad.BTN_AddChart
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//gFlow_Pad.BTN_AddChart
          if (Clicked == gFlow_Pad.BTN_AddChart.GDS.NAME_A_01) //gFlow_Pad.BTN_AddChart.GAC.Name() == Clicked
          {         gFlow_Pad.BTN_AddChart.GAC.State(false);//
                    int tryCount = 0;
                    long ChartID_Save_Current   = ChartID();
                    //static const int  SaveWindowHandle       = WindowHandle(Symbol(), PERIOD_CURRENT);//>>>ERR_NOT_INITIALIZED_STRING//symbol//not NULL//
                    //---
                    while(tryCount < 11 )
                    {         long ChartID_Opened     = ChartOpen(NULL, PERIOD_CURRENT);///for all time frames nedd loop too run
                              Dev_Chart_Window.Set_Theme(ChartID_Save_Current, ChartID_Opened);
                              Dev_Chart_Window.FrameSetting(ChartID_Save_Current, ChartID_Opened, Three);
                              WindowRedraw();               //Redraws the current chart forcedly. It is normally used after the objects properties have been changed.
                              Sleep(10);
                              //ChartSetInteger(SaveWindowHandle, CHART_BRING_TO_TOP, 0, true);
                              ///
                              tryCount++;  //
                              //if(!ChartSetInteger(ChartID_Save_Current, CHART_BRING_TO_TOP, 0, false)) { Alert(ChartID_Save_Current, "  ----false----   ", 0);};
                              //if(tryCount == 10)break;//
                    } //
          } //
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if(gFlow_Pad.BTN_Pivot.GAC.Name() == Clicked )
          {         PivotLines.Is_Pivot = PivotLines.Is_Pivot ? false : true; //
                    if (gFlow_Pad.BTN_Pivot.GAC.State()) //
                    {         //
                              gFlow_Pad.BTN_Pivot.GAC.Color(BtnColors_FlowPanelB.DescColorPress );
                              gFlow_Pad.BTN_Pivot.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_Pivot.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress );//
                              //
                    } //
                    else
                    {         gFlow_Pad.BTN_Pivot.GAC.Color(BtnColors_FlowPanelB.DescColor );
                              gFlow_Pad.BTN_Pivot.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              gFlow_Pad.BTN_Pivot.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                              //
                    }//
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gFlow_Pad.BTN_Bar.GAC.State()   && gFlow_Pad.BTN_Bar.GAC.Name() == Clicked ) //
          {         gFlow_Pad.BTN_Bar.GAC.Color(BtnColors_FlowPanelB.DescColorPress );
                    gFlow_Pad.BTN_Bar.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                    gFlow_Pad.BTN_Bar.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress );
                    //TOOLS.UseCChart.ShiftSize(50)  //
                    Sleep(10); Keyboard.Press_Alt_1();
                    gFlow_Pad.BTN_Candel.GAC.State(false) ;
                    gFlow_Pad.BTN_Candel.GAC.Color(BtnColors_FlowPanelB.DescColor );
                    gFlow_Pad.BTN_Candel.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                    gFlow_Pad.BTN_Candel.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                    gFlow_Pad.BTN_Line.GAC.State(false);
                    gFlow_Pad.BTN_Line.GAC.Color(BtnColors_FlowPanelB.DescColor );
                    gFlow_Pad.BTN_Line.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                    gFlow_Pad.BTN_Line.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                    // if(!TOOLS.UseCChart.Shift(true))    Alert(sparam);
          } //
          else if(!gFlow_Pad.BTN_Bar.GAC.State()  && gFlow_Pad.BTN_Bar.GAC.Name() == Clicked  )
          {         gFlow_Pad.BTN_Bar.GAC.Color(BtnColors_FlowPanelB.DescColor );
                    gFlow_Pad.BTN_Bar.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                    gFlow_Pad.BTN_Bar.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                    //Sleep(10); Keyboard.PressAlt_1();
                    //TOOLS.UseCChart.Shift(false); //
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gFlow_Pad.BTN_Candel.GAC.State()   && gFlow_Pad.BTN_Candel.GAC.Name() == Clicked )
          {         gFlow_Pad.BTN_Candel.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                    gFlow_Pad.BTN_Candel.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                    gFlow_Pad.BTN_Candel.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                    //TOOLS.UseCChart.ShiftSize(50)  //
                    Sleep(10); Keyboard.Press_Alt_2();
                    gFlow_Pad.BTN_Line.GAC.State(false);
                    gFlow_Pad.BTN_Line.GAC.Color(BtnColors_FlowPanelB.DescColor );
                    gFlow_Pad.BTN_Line.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                    gFlow_Pad.BTN_Line.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                    gFlow_Pad.BTN_Bar.GAC.State(false);
                    gFlow_Pad.BTN_Bar.GAC.Color(BtnColors_FlowPanelB.DescColor );
                    gFlow_Pad.BTN_Bar.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                    gFlow_Pad.BTN_Bar.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                    //gFlow_Pad.BTN_Candel.GAC.State(false) ; sparam =gFlow_Pad.BTN_Candel.GAC.Name();
                    // if(!TOOLS.UseCChart.Shift(true))    Alert(sparam);
          } //
          else if(!gFlow_Pad.BTN_Candel.GAC.State()  && gFlow_Pad.BTN_Candel.GAC.Name() == Clicked  )
          {         gFlow_Pad.BTN_Candel.GAC.Color(BtnColors_FlowPanelB.DescColor );
                    gFlow_Pad.BTN_Candel.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                    gFlow_Pad.BTN_Candel.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                    ///Sleep(10); Keyboard.PressAlt_2();
                    //TOOLS.UseCChart.Shift(false); //
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gFlow_Pad.BTN_Line.GAC.State()   && gFlow_Pad.BTN_Line.GAC.Name() == Clicked )
          {         gFlow_Pad.BTN_Line.GAC.Color(BtnColors_FlowPanelB.DescColorPress );
                    gFlow_Pad.BTN_Line.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                    gFlow_Pad.BTN_Line.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                    //TOOLS.UseCChart.ShiftSize(50)  //
                    Sleep(10); Keyboard.Press_Alt_3();
                    //gFlow_Pad.BTN_Line.GAC.State(false);
                    gFlow_Pad.BTN_Bar.GAC.State(false);
                    gFlow_Pad.BTN_Bar.GAC.Color(BtnColors_FlowPanelB.DescColor );
                    gFlow_Pad.BTN_Bar.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                    gFlow_Pad.BTN_Bar.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                    gFlow_Pad.BTN_Candel.GAC.State(false) ;
                    gFlow_Pad.BTN_Candel.GAC.Color(BtnColors_FlowPanelB.DescColor );
                    gFlow_Pad.BTN_Candel.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                    gFlow_Pad.BTN_Candel.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                    // if(!TOOLS.UseCChart.Shift(true))    Alert(sparam);
          } //
          else if(!gFlow_Pad.BTN_Line.GAC.State()   && gFlow_Pad.BTN_Line.GAC.Name() == Clicked  )
          {         gFlow_Pad.BTN_Line.GAC.Color(BtnColors_FlowPanelB.DescColor );
                    gFlow_Pad.BTN_Line.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                    gFlow_Pad.BTN_Line.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                    //Sleep(10); Keyboard.PressAlt_3();
                    //TOOLS.UseCChart.Shift(false); //
          } //
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if(gFlow_Pad.BTN_PaternBox.GAC.Name() == Clicked)
          {         if (gFlow_Pad.BTN_PaternBox.GAC.State() )
                    {         int IndexSize = 1;///incresed before come to use
                              for(int i = 1; i < 2; i++)TechnicalO.TradePivotsDivergence.PivotsDivergence(MODE_CREATE, true, IndexSize = 100 * i, IntegerToString(i)); //
                              //
                              //
                              gFlow_Pad.BTN_PaternBox.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gFlow_Pad.BTN_PaternBox.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_PaternBox.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //
                              //
                    } ///
                    else
                    {         int IndexSize = 1;///incresed before come to use
                              for(int i = 1; i < 2; i++)TechnicalO.TradePivotsDivergence.PivotsDivergence(MODE_CREATE, false, IndexSize = 100 * i, IntegerToString(i)); //
                              //
                              //
                              gFlow_Pad.BTN_PaternBox.GAC.Color(BtnColors_FlowPanelB.DescColor );
                              gFlow_Pad.BTN_PaternBox.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              gFlow_Pad.BTN_PaternBox.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor );
                              //
                              //
                    } ///
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//Alert(gFlow_Pad.BTN_Crosshair.GDS.NAME_A_01 == gFlow_Pad.BTN_Crosshair.GAC.Name());
//Alert(gFlow_Pad.BTN_Crosshair.GDS.NAME_A_01,"  --   ", gFlow_Pad.BTN_Crosshair.GAC.Name());
//-----------------------------------------------------------------------------------------
          if (gFlow_Pad.BTN_Crosshair.GAC.State() && gFlow_Pad.BTN_Crosshair.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 0;
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gFlow_Pad.BTN_Crosshair.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gFlow_Pad.BTN_Crosshair.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_Crosshair.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              ///=====================-
                              Mouse.KeyBotton_PressMiddleClick =  Mouse.PressMiddleClick();///instade of  //Keyboard.PressCtrl_F();  //
                              ///=====================-
                              // IS_EventIdCrosshair = EventChartCustom(ChartID(), EventIdCrosshair, lparam, dparam, sparam);// ///[in] ID of the user events. This identifier is automatically added to the value CHARTEVENT_CUSTOM and converted to the integer type
                              //IS_EventIdCrosshair = Mouse.KeyBotton_PressMiddleClicK;
                              ///Mouse.PressLeftClicK();
                              ///Mouse.PressRightClicK();
                              //Keyboard.ScanPreesKeys(CHARTEVENT_OBJECT_CLICK);
                              ///=====================-
                    }
                    //
                    //
          }///,BTN_CHSD
          if (gFlow_Pad.BTN_RRBoxs.GAC.Name() == Clicked )
          {         static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 0;
                              gFlow_Pad.BTN_RRBoxs.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gFlow_Pad.BTN_RRBoxs.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_RRBoxs.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              ct_Drive.TDD.ct_Configs.IsShow_RRBoxs_Shapes = 1;
                              ///=====================-
                    }
                    else
                    {         IsSwitch = 1;
                              gFlow_Pad.BTN_RRBoxs.GAC.Color(BtnColors_FlowPanelB.DescColor  );
                              gFlow_Pad.BTN_RRBoxs.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              gFlow_Pad.BTN_RRBoxs.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor  );
                              ct_Drive.TDD.ct_Configs.IsShow_RRBoxs_Shapes = 0;
                              ///=====================-
                    } //
                    //
                    //
          }//
          if (gFlow_Pad.BTN_CHSD.GAC.Name() == Clicked )
          {         static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 0;
                              gFlow_Pad.BTN_CHSD.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gFlow_Pad.BTN_CHSD.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_CHSD.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              ct_Drive.TDD.ct_Configs.IsShow_CHSD_Shapes = 1;
                              ///=====================-
                    }
                    else
                    {         IsSwitch = 1;
                              gFlow_Pad.BTN_CHSD.GAC.Color(BtnColors_FlowPanelB.DescColor  );
                              gFlow_Pad.BTN_CHSD.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              gFlow_Pad.BTN_CHSD.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor  );
                              ct_Drive.TDD.ct_Configs.IsShow_CHSD_Shapes = 0;
                              ///=====================-
                    } //
                    //
                    //
          }//
          if (gFlow_Pad.BTN_OrderBook.GAC.Name() == Clicked )
          {         static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 0;
                              gFlow_Pad.BTN_OrderBook.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gFlow_Pad.BTN_OrderBook.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_OrderBook.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              ct_Drive.TDD.ct_Configs.IsShow_Book_Shapes = 1;
                              ///=====================-
                    }
                    else
                    {         IsSwitch = 1;
                              gFlow_Pad.BTN_OrderBook.GAC.Color(BtnColors_FlowPanelB.DescColor  );
                              gFlow_Pad.BTN_OrderBook.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              gFlow_Pad.BTN_OrderBook.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor  );
                              ct_Drive.TDD.ct_Configs.IsShow_Book_Shapes = 0;
                              ///=====================-
                    } //
                    //
                    //
          }///
          if (gFlow_Pad.BTN_MACDsignals.GAC.Name() == Clicked )
          {         static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 0;
                              gFlow_Pad.BTN_MACDsignals.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gFlow_Pad.BTN_MACDsignals.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_MACDsignals.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              ct_Drive.TDD.ct_Configs.IsShow_MACD_Shapes = 1;
                              //=======================================================================
                              ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid.Update();
                              //ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid.Update();
                              //=======================================================================
                    }
                    else
                    {         IsSwitch = 1;
                              gFlow_Pad.BTN_MACDsignals.GAC.Color(BtnColors_FlowPanelB.DescColor  );
                              gFlow_Pad.BTN_MACDsignals.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              gFlow_Pad.BTN_MACDsignals.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor  );
                              ct_Drive.TDD.ct_Configs.IsShow_MACD_Shapes = 0;
                              ObjectsDeleteAll(0, "MNMacd");
                              ObjectsDeleteAll(0, "W1Macd");
                              ObjectsDeleteAll(0, "D1Macd");
                              ObjectsDeleteAll(0, "H4Macd");
                              ObjectsDeleteAll(0, "H1Macd");
                              ObjectsDeleteAll(0, "M30Macd");
                              ObjectsDeleteAll(0, "M15Macd");
                              ObjectsDeleteAll(0, "M5Macd");
                              ObjectsDeleteAll(0, "M1Macd");
                              //=======================================================================
                              //=======================================================================
                    } //
                    //
                    //
          }///
          if (gFlow_Pad.BTN_Pivotssignals.GAC.Name() == Clicked )
          {         static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 0;
                              gFlow_Pad.BTN_Pivotssignals.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gFlow_Pad.BTN_Pivotssignals.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_Pivotssignals.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              ct_Drive.TDD.ct_Configs.IsShow_Pivots_Shapes = 1;
                              ///=====================-
                    }
                    else
                    {         IsSwitch = 1;
                              gFlow_Pad.BTN_Pivotssignals.GAC.Color(BtnColors_FlowPanelB.DescColor  );
                              gFlow_Pad.BTN_Pivotssignals.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              gFlow_Pad.BTN_Pivotssignals.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor  );
                              ct_Drive.TDD.ct_Configs.IsShow_Pivots_Shapes = 0;
                              ///=====================-
                    } //
                    //
                    //
          }///
          if (gFlow_Pad.BTN_ChannelSignal.GAC.Name() == Clicked )
          {         static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 0;
                              gFlow_Pad.BTN_ChannelSignal.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gFlow_Pad.BTN_ChannelSignal.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_ChannelSignal.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              ct_Drive.TDD.ct_Configs.IsShow_Channel_Shapes = 1;
                              ct_Drive.TDD.ct_Conductor.DC_data.Indicators._CZZ_Periods.Update_CZZ();
                              int zzg = 0; int zzmul = 3;
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Draw_GDS(      MODE_CREATE, true, 0, true, zzmul, zzg); //--creating
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._MN.Draw_GDS(           MODE_CREATE, true, 6, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._W1.Draw_GDS(           MODE_CREATE, true, 6, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._D1.Draw_GDS(           MODE_CREATE, true, 5, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._H4.Draw_GDS(           MODE_CREATE, true, 5, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._H1.Draw_GDS(           MODE_CREATE, true, 4, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M30.Draw_GDS(          MODE_CREATE, true, 4, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M15.Draw_GDS(          MODE_CREATE, true, 3, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M5.Draw_GDS(           MODE_CREATE, true, 3, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M1.Draw_GDS(           MODE_CREATE, true, 2, FALSE, zzmul, zzg);
                              ///=====================-
                    }
                    else
                    {         IsSwitch = 1;
                              gFlow_Pad.BTN_ChannelSignal.GAC.Color(BtnColors_FlowPanelB.DescColor  );
                              gFlow_Pad.BTN_ChannelSignal.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              gFlow_Pad.BTN_ChannelSignal.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor  );
                              ct_Drive.TDD.ct_Configs.IsShow_Channel_Shapes = 0;
                              ct_Drive.TDD.ct_Conductor.DC_data.Indicators._CZZ_Periods.Update_CZZ();
                              int zzg = 0; int zzmul = 3;
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Draw_GDS(      MODE_CREATE, true, 0, true, zzmul, zzg); //--creating
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._MN.Draw_GDS(           MODE_CREATE, true, 6, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._W1.Draw_GDS(           MODE_CREATE, true, 6, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._D1.Draw_GDS(           MODE_CREATE, true, 5, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._H4.Draw_GDS(           MODE_CREATE, true, 5, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._H1.Draw_GDS(           MODE_CREATE, true, 4, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M30.Draw_GDS(          MODE_CREATE, true, 4, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M15.Draw_GDS(          MODE_CREATE, true, 3, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M5.Draw_GDS(           MODE_CREATE, true, 3, FALSE, zzmul, zzg);
                              ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M1.Draw_GDS(           MODE_CREATE, true, 2, FALSE, zzmul, zzg);
                              ///=====================-
                    } //
                    //
                    //
          }
          if (gFlow_Pad.BTN_EventsSignal.GAC.Name() == Clicked )
          {         static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 0;
                              gFlow_Pad.BTN_EventsSignal.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gFlow_Pad.BTN_EventsSignal.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_EventsSignal.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              ct_Drive.TDD.ct_Configs.IsShow_Events_Shapes = 1;
                              ///=====================-
                              OrderBookZ.Update();////
                              ///=====================-
                    }
                    else
                    {         IsSwitch = 1;
                              gFlow_Pad.BTN_EventsSignal.GAC.Color(BtnColors_FlowPanelB.DescColor  );
                              gFlow_Pad.BTN_EventsSignal.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              gFlow_Pad.BTN_EventsSignal.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor  );
                              ct_Drive.TDD.ct_Configs.IsShow_Events_Shapes = 0;
                              ///=====================-
                              OrderBookZ.Update();////
                              ///=====================-
                    } //
                    //
                    //
          }
          if (gFlow_Pad.BTN_AllShapes.GAC.Name() == Clicked )
          {         static bool IsSwitch = 1;
                    if (IsSwitch)//existing
                    {         IsSwitch = 0;
                              gFlow_Pad.BTN_AllShapes.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gFlow_Pad.BTN_AllShapes.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_AllShapes.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              ct_Drive.TDD.ct_Configs.IsShow_Events_Shapes     = 1;
                              ct_Drive.TDD.ct_Configs.IsShow_Channel_Shapes    = 1;
                              ct_Drive.TDD.ct_Configs.IsShow_Pivots_Shapes     = 1;
                              ct_Drive.TDD.ct_Configs.IsShow_MACD_Shapes       = 1;
                              ct_Drive.TDD.ct_Configs.IsShow_Book_Shapes       = 1;
                              ct_Drive.TDD.ct_Configs.IsShow_CHSD_Shapes       = 1;
                              ct_Drive.TDD.ct_Configs.IsShow_RRBoxs_Shapes     = 1;
                              //=======================================================================
                              ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid.Update();
                              //=======================================================================
                    }
                    else
                    {         IsSwitch = 1;
                              gFlow_Pad.BTN_AllShapes.GAC.Color(BtnColors_FlowPanelB.DescColor  );
                              gFlow_Pad.BTN_AllShapes.GAC.BackColor(BtnColors_FlowPanelB.BackColor  );
                              gFlow_Pad.BTN_AllShapes.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor  );
                              ct_Drive.TDD.ct_Configs.IsShow_Events_Shapes     = 0;
                              ct_Drive.TDD.ct_Configs.IsShow_Channel_Shapes    = 0;
                              ct_Drive.TDD.ct_Configs.IsShow_Pivots_Shapes     = 0;//mean not shown
                              ct_Drive.TDD.ct_Configs.IsShow_MACD_Shapes       = 0;
                              ObjectsDeleteAll(0, "MNMacd");
                              ObjectsDeleteAll(0, "W1Macd");
                              ObjectsDeleteAll(0, "D1Macd");
                              ObjectsDeleteAll(0, "H4Macd");
                              ObjectsDeleteAll(0, "H1Macd");
                              ObjectsDeleteAll(0, "M30Macd");
                              ObjectsDeleteAll(0, "M15Macd");
                              ObjectsDeleteAll(0, "M5Macd");
                              ObjectsDeleteAll(0, "M1Macd");
                              ct_Drive.TDD.ct_Configs.IsShow_Book_Shapes       = 0;
                              ct_Drive.TDD.ct_Configs.IsShow_CHSD_Shapes       = 0;
                              ct_Drive.TDD.ct_Configs.IsShow_RRBoxs_Shapes     = 0;
                              //=======================================================================
                    } //
                    //
          }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if (gFlow_Pad.BTN_CloseChart.GAC.State() && gFlow_Pad.BTN_CloseChart.GAC.Name() == Clicked )
          {         Mouse.KeyBotton_PressLeftClick_Count = 0;
                    static bool IsSwitch = 1;
                    if (IsSwitch)
                    {         IsSwitch = 1;
                              gFlow_Pad.BTN_CloseChart.GAC.Color(BtnColors_FlowPanelB.DescColorPress  );
                              gFlow_Pad.BTN_CloseChart.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress  );
                              gFlow_Pad.BTN_CloseChart.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress  );
                              //======================================================================
                              static bool ChartClosedTime  = Keyboard.Press_Ctrl_W();
                              ///=====================-
                              //=======================
                              //--Alert(gFlow_Pad.BTN_CloseChart.GAC.Name());//
                    }
                    //
                    //
          }///
          gToolsBox_Pad_SubOnClick();
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII////Window.MT4_WMCMD(MT4_WMCMD_IND_CZig_34329, 0);
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII// //Window.MT4_WMCMD(34398, 1);
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if(gFlow_Pad.BTN_Fractals.GAC.Name()     == Clicked || gFlow_Pad.LBL_Fractals.GAC.Name()     == Clicked) {Keyboard.Press_Alt_F();             gFlow_Pad.BTN_Fractals.GAC.State(false);}
          if(gFlow_Pad.BTN_Zigzag.GAC.Name()       == Clicked )                                                    {                                    gFlow_Pad.BTN_Zigzag.GAC.State(false); }
          if(gFlow_Pad.BTN_MovingAvrege.GAC.Name() == Clicked || gFlow_Pad.LBL_MovingAvrege.GAC.Name() == Clicked) {Keyboard.Press_Alt_M();             gFlow_Pad.BTN_MovingAvrege.GAC.State(false);}
          if(gFlow_Pad.BTN_Stochastic.GAC.Name()   == Clicked || gFlow_Pad.LBL_Stochastic.GAC.Name()   == Clicked) {Keyboard.Press_Alt_S();             gFlow_Pad.BTN_Stochastic.GAC.State(false);}
          if(gFlow_Pad.BTN_MACD.GAC.Name()         == Clicked                                                    ) {Keyboard.Press_Alt_I_I_O_M_Enter(); gFlow_Pad.BTN_MACD.GAC.State(false);}
          if(gFlow_Pad.BTN_MFI.GAC.Name()          == Clicked                                                    ) {Keyboard.Press_Alt_I_I_V_M();       gFlow_Pad.BTN_MFI.GAC.State(false);}
          if(gFlow_Pad.BTN_OBV.GAC.Name()          == Clicked                                                    ) {Keyboard.Press_Alt_I_I_V_O();       gFlow_Pad.BTN_OBV.GAC.State(false);}
          if(gFlow_Pad.BTN_WiliamR.GAC.Name()      == Clicked || gFlow_Pad.LBL_WiliamR.GAC.Name()      == Clicked) {Keyboard.Press_Alt_R();             gFlow_Pad.BTN_WiliamR.GAC.State(false);}
          if(gFlow_Pad.BTN_TrendZ.GAC.Name()       == Clicked )                                                    {static bool Is_Run = false;  Is_Run = Is_Run ? false : true;  Dev_Object_Pack.Lines.Trend.TrendZer(Is_Run);; BTN_.gColorButton(gFlow_Pad.BTN_TrendZ, false, clrRed, clrWhite);}
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          if(Clicked == gAutoCharter_Pad.BTN_StdDevChannelX.GAC.Name())   {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_StdDevChannel);  BTN_.gColorButton(gAutoCharter_Pad.BTN_StdDevChannelX); }
          if(Clicked == gAutoCharter_Pad.BTN_ChannelX.GAC.Name())         {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_Channel);        BTN_.gColorButton(gAutoCharter_Pad.BTN_ChannelX); }
          if(Clicked == gAutoCharter_Pad.BTN_HLineX.GAC.Name())           {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_HLine);          BTN_.gColorButton(gAutoCharter_Pad.BTN_HLineX); }
          if(Clicked == gAutoCharter_Pad.BTN_VLineX.GAC.Name())           {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_VLine);          BTN_.gColorButton(gAutoCharter_Pad.BTN_VLineX); }
          if(Clicked == gAutoCharter_Pad.BTN_TrendX.GAC.Name())           {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_Trend);          BTN_.gColorButton(gAutoCharter_Pad.BTN_TrendX); }
          if(Clicked == gAutoCharter_Pad.BTN_TrendAngleX.GAC.Name())      {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_TrendAngle);     BTN_.gColorButton(gAutoCharter_Pad.BTN_TrendAngleX); }
          if(Clicked == gAutoCharter_Pad.BTN_TextX.GAC.Name())            {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_Text);           BTN_.gColorButton(gAutoCharter_Pad.BTN_TextX); }
          if(Clicked == gAutoCharter_Pad.BTN_CycleX.GAC.Name())           {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_Cycle);          BTN_.gColorButton(gAutoCharter_Pad.BTN_CycleX); }
          if(Clicked == gAutoCharter_Pad.BTN_EditX.GAC.Name())            {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_Edit);           BTN_.gColorButton(gAutoCharter_Pad.BTN_EditX); }
          if(Clicked == gAutoCharter_Pad.BTN_PitchforkX.GAC.Name())       {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_Pitchfork);      BTN_.gColorButton(gAutoCharter_Pad.BTN_PitchforkX); }
          if(Clicked == gAutoCharter_Pad.BTN_RegressionX.GAC.Name())      {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_Regression);     BTN_.gColorButton(gAutoCharter_Pad.BTN_RegressionX); }
          if(Clicked == gAutoCharter_Pad.BTN_RectLabelX.GAC.Name())       {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_RectLabel);      BTN_.gColorButton(gAutoCharter_Pad.BTN_RectLabelX); }
          if(Clicked == gAutoCharter_Pad.BTN_FiboX.GAC.Name())            {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_Fibo);           BTN_.gColorButton(gAutoCharter_Pad.BTN_FiboX); }
          if(Clicked == gAutoCharter_Pad.BTN_FiboTimesX.GAC.Name())       {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_FiboTimes);      BTN_.gColorButton(gAutoCharter_Pad.BTN_FiboTimesX); }
          if(Clicked == gAutoCharter_Pad.BTN_FiboFanX.GAC.Name())         {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_FiboFan);        BTN_.gColorButton(gAutoCharter_Pad.BTN_FiboFanX); }
          if(Clicked == gAutoCharter_Pad.BTN_FiboExpansionX.GAC.Name())   {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_FiboExpansion);  BTN_.gColorButton(gAutoCharter_Pad.BTN_FiboExpansionX); }
          if(Clicked == gAutoCharter_Pad.BTN_FiboChannelX.GAC.Name())     {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_FiboChannel);    BTN_.gColorButton(gAutoCharter_Pad.BTN_FiboChannelX); }
          if(Clicked == gAutoCharter_Pad.BTN_FiboArcX.GAC.Name())         {static bool Is_Run = false;  Is_Run = Is_Run ? false : true; AutoCharter.Draw(Is_Run, false, eAutoCharter_FiboArc);        BTN_.gColorButton(gAutoCharter_Pad.BTN_FiboArcX); }
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
          {         if(gAutoCharter_Pad.BTN_AutoCharter.GAC.State() && gAutoCharter_Pad.BTN_AutoCharter.GAC.Name() == Clicked  ) //<<<<<defused////
                    {         gAutoCharter_Pad.BTN_AutoCharter.GAC.Color(BtnColors_FlowPanel.DescColorPress );
                              gAutoCharter_Pad.BTN_AutoCharter.GAC.BackColor(BtnColors_FlowPanel.BackColorPress );
                              gAutoCharter_Pad.BTN_AutoCharter.GAC.BorderColor(BtnColors_FlowPanel.BorderColorPress );
                              FlowPanel.KeyPad_AutoCharter(1, 0, 0, Sg_Position2D_Def); // FlowPanel.KeyPad_AutoCharter(1,0,0);
                    } //
                    else if(!gAutoCharter_Pad.BTN_AutoCharter.GAC.State() && gAutoCharter_Pad.BTN_AutoCharter.GAC.Name() == Clicked  )
                    {         gAutoCharter_Pad.BTN_AutoCharter.GAC.Color(BtnColors_FlowPanel.DescColor);
                              gAutoCharter_Pad.BTN_AutoCharter.GAC.BackColor(BtnColors_FlowPanel.BackColor);
                              gAutoCharter_Pad.BTN_AutoCharter.GAC.BorderColor(BtnColors_FlowPanel.BorderColor);//
                              FlowPanel.KeyPad_AutoCharter(0, 0, 1, Sg_Position2D_Def);
                              //
                    }
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    if(Clicked == gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove.GAC.Name() )
                    {         gFlow_Pad.IsMove_AutoCharter = gFlow_Pad.IsMove_AutoCharter ? false : true;
                              if( gFlow_Pad.IsMove_AutoCharter ) { gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove.GAC.Color(clrRed); } //
                              else                               { gAutoCharter_Pad.LBL_Pad_AutoCharter_PointMove.GAC.Color(clrWhite);} //
                    }
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    if(Clicked == gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear.GAC.Name())
                    {         //
                              gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear.GAC.Color(clrRed);
                              FlowPanel.KeyPad_AutoCharter(MODE_CREATE, false, true, Sg_Position2D_Def); //delete//not clear//not move
                              FlowPanel.KeyPad_AutoCharter(MODE_CREATE, true, false, Sg_Position2D_Def); //delete//not clear//not move
                              ///=========================================================
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_StdDevChannelX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_ChannelX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_HLineX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_VLineX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_TrendX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_TrendAngleX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_TextX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_CycleX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_EditX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_PitchforkX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_RegressionX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_RectLabelX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_FiboX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_FiboTimesX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_FiboFanX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_FiboExpansionX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_FiboChannelX, true);
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_FiboArcX, true);
                              ////////======================================================
                              gAutoCharter_Pad.LBL_Pad_AutoCharter_PointClear.GAC.Color(clrWhite);
                              //
                    }
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    if(Clicked == gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit.GAC.Name())
                    {         //
                              gAutoCharter_Pad.LBL_Pad_AutoCharter_PoinExit.GAC.Color(clrRed);
                              FlowPanel.KeyPad_AutoCharter(0, 0, 1, Sg_Position2D_Def); ////////stille off from main panel///(clear & delete)//
                              //FlowPanel.KeyPad_AutoCharter(1, 0, 1); ////////stille off from main panel
                              gFlow_Pad.IsLBL_ = false;
                              gFlow_Pad.LBL_U2.GAC.Color(clrLavender);
                              gFlow_Pad.IsLBL_U2 = true;///issu swiching methods
                              ////
                              BTN_.gColorButton(gAutoCharter_Pad.BTN_AutoCharter, true);//
                    } //
          }//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//-Long_chart_Max + (290 + 100) + Long_chart_Max - 300;
//IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          {         ////ChartData_ChartFrame.WidthPixel;// CORNER_LEFT_UPPER
                    //int Long_chart_Max   = Dev_Chart_Window._Mql_.PropertyData.CHART_WIDTH_IN_PIXELS_int;   //---1700                          (int)(429)       + FixPadFlowX(0)     + independX
                    //int hight_chart_Max  = Dev_Chart_Window._Mql_.PropertyData.CHART_HEIGHT_IN_PIXELS_int;  //---800     moveX + -120 +      , (int)(201.6) - 1 + FixPadFlowY(-120)  + independY
                    Dev_Chart_Window._Mql_.Update();
                    int Long_chart_Max   = Dev_Chart_Window._Mql_.PropertyData.CHART_WIDTH_IN_PIXELS_int; //==900
                    int hight_chart_Max  = Dev_Chart_Window._Mql_.PropertyData.CHART_HEIGHT_IN_PIXELS_int ;
                    //---
                    RightUP.x   = -Long_chart_Max / 2 - 300 + Long_chart_Max - 360;                             RightUP.y   =  20; //hight_chart_Max / 25; //--700
                    RightDown.x = -Long_chart_Max / 2 - 300 + Long_chart_Max - 360;                             RightDown.y =  hight_chart_Max - 220; //--700
                    //--
                    LetfUp.x    = -Long_chart_Max / 2 - 100 ;                                                   LetfUp.y    =  20; //hight_chart_Max / 25 ; //--700
                    LetfDown.x  = -Long_chart_Max / 2 - 350;                                                    LetfDown.y  =  hight_chart_Max - 220; //--- panel high
                    //----
                    //Cat.s("Long_chart: " + (string)Long_chart_Max + "     Long_chart: " + (string)hight_chart_Max);
                    //---
                    if(Clicked == gFlow_Pad.BTN_RightUp_OfChart.GAC.Name())       {   FlowPanel.CALL(MODE_CREATE, false, Sg_Position2D_Def);  FlowPanel.CALL(MODE_CREATE, true, RightUP);}
                    if(Clicked == gFlow_Pad.BTN_RightDown_OfChart.GAC.Name())     {   FlowPanel.CALL(MODE_CREATE, false, Sg_Position2D_Def);  FlowPanel.CALL(MODE_CREATE, true, RightDown);}
                    if(Clicked == gFlow_Pad.BTN_LeftUp_OfChart.GAC.Name())        {   FlowPanel.CALL(MODE_CREATE, false, Sg_Position2D_Def);  FlowPanel.CALL(MODE_CREATE, true, LetfUp);}
                    if(Clicked == gFlow_Pad.BTN_LeftDown_OfChart.GAC.Name())      {   FlowPanel.CALL(MODE_CREATE, false, Sg_Position2D_Def);  FlowPanel.CALL(MODE_CREATE, true, LetfDown);} //
          }
          return; //
}//
//+------------------------------------------------------------------+
//||   ||||||||||                 eFlowPanel.mqh                    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
