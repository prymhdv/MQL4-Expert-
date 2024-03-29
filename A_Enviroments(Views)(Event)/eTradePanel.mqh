//+------------------------------------------------------------------+
//||   ||||||||||                 eTradePanel.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ce_TradePanel: public Sg_OnChartEvent_base
{
public:
          Sg_OnChartEvent       EventsData;     ////---Events.Main(this); Event_TradePanel.Main(Event_TradePanel); //---who work with Objparam methods..

          void                  OnChartEvents(Sg_OnChartEvent &event);
          void                  Event_OBJECT_CLICK();
          void                  Event_KeyDown( int LineCOM = 0, string FuncCome = "None") {return;};;
          void                  Event_MOUSE_MOVE(string FuncCom, int LineCOM = 0, string FuncCome = "None") {return;};
          //--- TradePanel.OBJECT_CLICK(Debuging.FUNCSIG_com, Event.sparam); //
          //--- TradePanel.Event_KeyDown( Debuging.Line_com, Debuging.FUNCTION_com); //
          //--- TradePanel.MOUSE_MOVE(Debuging.FUNCSIG_com, id, lparam, dparam, sparam, Debuging.Line_com, Debuging.FUNCTION_com ); //
};// Ce_TradePanel TradePanel_Event;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void Ce_TradePanel::OnChartEvents(Sg_OnChartEvent &event)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(event.id == CHARTEVENT_OBJECT_CLICK) {}
          if(event.id == CHARTEVENT_KEYDOWN) {}
          if(event.id == CHARTEVENT_MOUSE_MOVE) {}
          if(event.id == CHARTEVENT_CLICK) {};
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+/*Alert(";;;");*/
void  Ce_TradePanel::Event_OBJECT_CLICK()
{         string Clicked = Event.sparam;
          {         //-----
                    if( Event.sparam ==  "RLBLBorderExpert")
                    {         static bool X = false; X = X ? false : true; TradePanel.GetTradePanel(MODE_CREATE, X); }
                    if( Event.sparam ==  "RLBLBorderExpert-ONOFF")
                    {         static bool X = true; X = X ? false : true; RightMenu._Show(MODE_CREATE, X); }
                    ///================================================
                    if( Clicked == gTradePannelObj.LBL_TF_M1.GAC.Name())
                    {         // if(MessageBox("Do you really want to remove the EA?", TradePanel.MB_CAPTION, MB_ICONQUESTION | MB_YESNO) == IDYES)
                              Sleep(100); ChartClose(0); ChartOpen( Symbol(), PERIOD_M1); ChartApplyTemplate(0, "Expert1.tpl"); }
                    if( Clicked == gTradePannelObj.LBL_TF_M5.GAC.Name())
                    {         // if(MessageBox("Do you really want to remove the EA?", TradePanel.MB_CAPTION, MB_ICONQUESTION | MB_YESNO) == IDYES)
                              Sleep(100); ChartClose(0); ChartOpen( Symbol(), PERIOD_M5); ChartApplyTemplate(0, "Expert1.tpl"); }
                    if( Clicked == gTradePannelObj.LBL_TF_M15.GAC.Name())
                    {         // if(MessageBox("Do you really want to remove the EA?", TradePanel.MB_CAPTION, MB_ICONQUESTION | MB_YESNO) == IDYES)
                              Sleep(100); ChartClose(0); ChartOpen( Symbol(), PERIOD_M15); ChartApplyTemplate(0, "Expert1.tpl"); }
                    if( Clicked == gTradePannelObj.LBL_TF_M30.GAC.Name())
                    {         // if(MessageBox("Do you really want to remove the EA?", TradePanel.MB_CAPTION, MB_ICONQUESTION | MB_YESNO) == IDYES)
                              Sleep(100); ChartClose(0); ChartOpen( Symbol(), PERIOD_M30); ChartApplyTemplate(0, "Expert1.tpl"); }
                    if( Clicked == gTradePannelObj.LBL_TF_H1.GAC.Name())
                    {         // if(MessageBox("Do you really want to remove the EA?", TradePanel.MB_CAPTION, MB_ICONQUESTION | MB_YESNO) == IDYES)
                              Sleep(100); ChartClose(0); ChartOpen( Symbol(), PERIOD_H1); ChartApplyTemplate(0, "Expert1.tpl"); }
                    if( Clicked == gTradePannelObj.LBL_TF_H4.GAC.Name())
                    {         // if(MessageBox("Do you really want to remove the EA?", TradePanel.MB_CAPTION, MB_ICONQUESTION | MB_YESNO) == IDYES)
                              Sleep(100); ChartClose(0); ChartOpen( Symbol(), PERIOD_H4); ChartApplyTemplate(0, "Expert1.tpl"); }
                    if( Clicked == gTradePannelObj.LBL_TTF_W1.GAC.Name())
                    {         // if(MessageBox("Do you really want to remove the EA?", TradePanel.MB_CAPTION, MB_ICONQUESTION | MB_YESNO) == IDYES)
                              Sleep(100); ChartClose(0); ChartOpen( Symbol(), PERIOD_W1); ChartApplyTemplate(0, "Expert1.tpl"); }
                    if( Clicked == gTradePannelObj.LBL_TF_MN.GAC.Name())
                    {         // if(MessageBox("Do you really want to remove the EA?", TradePanel.MB_CAPTION, MB_ICONQUESTION | MB_YESNO) == IDYES)
                              Sleep(100); ChartClose(0); ChartOpen( Symbol(), PERIOD_MN1); ChartApplyTemplate(0, "Expert1.tpl"); }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    /////////////////////=====
                    //-- RemoveExpert
                    if( Clicked == gTradePannelObj.LBL_Exit.GAC.Name())
                    {         // if(MessageBox("Do you really want to remove the EA?", TradePanel.MB_CAPTION, MB_ICONQUESTION | MB_YESNO) == IDYES)
                              Sleep(2000); ExpertRemove();//Exit
                    }
                    if( Clicked == gTradePannelObj.LBL_Candels.GAC.Name())
                    {         static bool switchX = 0;
                              if(switchX) { Dev_Chart_Window.Set_ChartCandels_BullBear_RandomColor(1); switchX = 0;}
                              else {Dev_Chart_Window.Set_ChartCandels_BullBear_RandomColor(3); switchX = 1 ;} //
                    }//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == "#0PanelV" ) //GAC.Name() == "KeyChartTools" &&
                    {         //
                              //
                              //
                    } //
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_ShowComment.GAC.Name() && gTradePannelObj.BTN_ShowComment.GAC.State()  ) ///>>>><<<<<defused////
                    {         gTradePannelObj.BTN_ShowComment.GAC.Color( BtnColors_TradePanel.DescColorPress);
                              gTradePannelObj.BTN_ShowComment.GAC.BackColor( BtnColors_TradePanel.BackColorPress);
                              gTradePannelObj.BTN_ShowComment.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress);
                              ////---Generic BTN_CommentPannel---//
                              {         gTradePannelObj.BTN_CommentPannel.GDS.Set_Action_2(MODE_CREATE, true /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                                        gTradePannelObj.BTN_CommentPannel.GDS.Set_Desc_4("BTN_CommentPannel", "BTN_CommentPannel", "Arial", 10);
                                        gTradePannelObj.BTN_CommentPannel.GDS.Set_Self_1(ButtonDEF_state);
                                        gTradePannelObj.BTN_CommentPannel.GDS.Set_Location_5(0, 0, 300, 10000, CORNER_LEFT_UPPER);
                                        gTradePannelObj.BTN_CommentPannel.GDS.Set_Color_3(C'36, 52, 69', clrGray, clrWhite);
                                        gTradePannelObj.BTN_CommentPannel.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "BTN_CommentPannel");
                                        gTradePannelObj.BTN_CommentPannel.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
                                        gTradePannelObj.BTN_CommentPannel.Action(gTradePannelObj.BTN_CommentPannel);//
                                        //0// gTradePannelObj.BTN_CommentPannel.Create(true, false, __FUNCSIG__, "BTN_CommentPannel", "BTN_CommentPannel",
                                        //0// 0, 0, 300, 10000, CORNER_LEFT_UPPER, ANCHOR_CENTER, false, C'36, 52, 69', clrGray ); //
                              }//
                    } //
                    else if( Clicked == gTradePannelObj.BTN_ShowComment.GAC.Name() && !gTradePannelObj.BTN_ShowComment.GAC.State())
                    {         gTradePannelObj.BTN_CommentPannel.GAC.Delete();
                              gTradePannelObj.BTN_ShowComment.GAC.Color( BtnColors_TradePanel.DescColor );
                              gTradePannelObj.BTN_ShowComment.GAC.BackColor( BtnColors_TradePanel.BackColor);
                              gTradePannelObj.BTN_ShowComment.GAC.BorderColor( BtnColors_TradePanel.BorderColor); } //gTradePannelObj.BTN_CommentPannel.GAC.Detach();
                    /////
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //lableShift // LableMaximize
                    //============================LableShift
                    if ( Clicked == gTradePannelObj.LBL_Shift.GAC.Name())
                    {         gTradePannelObj.LBL_Shift.GAC.Color( BtnColors_TradePanel.DescColorPress = clrBlack );
                              Sleep(10); Keyboard.Press_END();
                              gTradePannelObj.LBL_Shift.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite ); //
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if ( Clicked == gTradePannelObj.LBL_Indiators.GAC.Name())
                    {         gTradePannelObj.LBL_Indiators.GAC.Color( BtnColors_TradePanel.DescColorPress = clrBlack );
                              Sleep(10); Keyboard.Press_Ctrl_I();
                              string lpClassName = "", lpWindowName = "Indicator on " + _Symbol + "," + "H1";
                              //  int FindWindowAXarry = FindWindowA(char &lpClassName[], char &lpWindowName[]);
                              int FindWindowWX = FindWindowW( lpClassName, lpWindowName);
                              if(FindWindowWX < 0)
                                        Alert("there is no indicator in char");
                              gTradePannelObj.LBL_Indiators.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite ); //
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if ( Clicked == gTradePannelObj.LBL_Navigator.GAC.Name())
                    {         gTradePannelObj.LBL_Navigator.GAC.Color( BtnColors_TradePanel.DescColorPress = clrBlack );
                              Sleep(10); Keyboard.Press_Ctrl_N();
                              gTradePannelObj.LBL_Navigator.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite ); //
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if ( Clicked == gTradePannelObj.LBL_AutoTrading.GAC.Name())
                    {         Keyboard.Press_Ctrl_E(); }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //===========================================================================================================================================
                    // LableZoomIn, LableZoomOut, LableGrid, LableThem,;
                    //===========================================================================================================================================
                    if ( Clicked == gTradePannelObj.LBL_ZoomIn.GAC.Name())
                    {         gTradePannelObj.LBL_ZoomIn.GAC.Color( BtnColors_TradePanel.DescColorPress = clrBlack );
                              Sleep(10); Keyboard.Press_ADD();
                              gTradePannelObj.LBL_ZoomIn.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite ); //
                              //
                    } //
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if ( Clicked == gTradePannelObj.LBL_ZoomOut.GAC.Name())
                    {         gTradePannelObj.LBL_ZoomOut.GAC.Color( BtnColors_TradePanel.DescColorPress = clrBlack );
                              Sleep(10); Keyboard.Press_SUBTRACT();
                              gTradePannelObj.LBL_ZoomOut.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite ); //
                    } //
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if ( Clicked == gTradePannelObj.LBL_PeriodSeptor.GAC.Name())
                    {         static bool KeyC = true;
                              if(KeyC)
                              {         gTradePannelObj.LBL_PeriodSeptor.GAC.Color( BtnColors_TradePanel.DescColorPress = clrBlack );
                                        Sleep(10); Keyboard.Press_Ctrl_Y(); KeyC = false; }
                              else {gTradePannelObj.LBL_PeriodSeptor.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite ); Sleep(10); Keyboard.Press_Ctrl_Y(); KeyC = true;} //
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if ( Clicked == gTradePannelObj.LBL_Grid.GAC.Name())
                    {         static bool KeyC = true;
                              if(KeyC)
                              {         gTradePannelObj.LBL_Grid.GAC.Color( BtnColors_TradePanel.DescColorPress = clrBlack );
                                        Keyboard.Press_Ctrl_G(); KeyC = false; //
                              }
                              else {gTradePannelObj.LBL_Grid.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite ); Keyboard.Press_Ctrl_G(); KeyC = true;} //
                              /// if(ChartShowGridSet_(1, ChartID()))Alert(22222222222222222); //issuuu tru bot not set
                    } //
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if ( Clicked == gTradePannelObj.LBL_Them.GAC.Name())
                    {         gTradePannelObj.LBL_Them.GAC.Color( BtnColors_TradePanel.DescColorPress = clrBlack );
                              Sleep(2);
                              static int i = 1; //---Remember last
                              switch (i)
                              {         case 0:  Dev_Chart_Window.Set_Theme(0, 0, 0); i++; break;
                                        case 1:  Dev_Chart_Window.Set_Theme(0, 0, 1); i++; break;
                                        case 2:  Dev_Chart_Window.Set_Theme(0, 0, 2); i = 0; break; }
                              gTradePannelObj.LBL_Them.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite ); //
                    } //
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if ( Clicked == gTradePannelObj.LBL_Volume.GAC.Name())
                    {         static bool KeyC = true;
                              if(KeyC)
                              {         gTradePannelObj.LBL_Volume.GAC.Color( BtnColors_TradePanel.DescColorPress = clrBlack );
                                        Keyboard.Press_Ctrl_L(); KeyC = false; }
                              else {gTradePannelObj.LBL_Volume.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite ); Keyboard.Press_Ctrl_L(); KeyC = true;} //
                    } //
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if ( Clicked == gTradePannelObj.LBL_Triangel.GAC.Name())
                    {         static bool KeyC = false;
                              if(KeyC)
                              {         gTradePannelObj.LBL_Triangel.GAC.Color( BtnColors_TradePanel.DescColorPress = clrBlue );
                                        //Sleep(10); Keyboard.PressCtrl_N();
                                        //Tools.UseTriangleCreate()
                                        if(ObjectFind(0, Dev_Object_Pack.Shapes.Triangle.GAC.Name()) >= 0)
                                                  Dev_Object_Pack.Shapes.Triangle.GAC.Delete(); KeyC = false; }
                              else
                              {         Dev_Object_Pack.Shapes.Triangle.Create();
                                        gTradePannelObj.LBL_Triangel.GAC.Color( BtnColors_TradePanel.DescColor = clrRed ); KeyC = true; } //
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_Ema.GAC.Name() && gTradePannelObj.BTN_Ema.GAC.State()) //GAC.Name() == " " &&
                    {         gTradePannelObj.BTN_Ema.GAC.Color( BtnColors_TradePanel.DescColorPress = clrWhite );
                              gTradePannelObj.BTN_Ema.GAC.BackColor( BtnColors_TradePanel.BackColorPress = clrChocolate );
                              gTradePannelObj.BTN_Ema.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress = clrChocolate ); //
                              //Sleep(10);  TechnicalO.TechnicalXRun(true, 200); //
                    } //
                    else if( Clicked == gTradePannelObj.BTN_Ema.GAC.Name() && !gTradePannelObj.BTN_Ema.GAC.State())
                    {         gTradePannelObj.BTN_Ema.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite );
                              gTradePannelObj.BTN_Ema.GAC.BackColor( BtnColors_TradePanel.BackColor = clrDarkSlateGray  );
                              gTradePannelObj.BTN_Ema.GAC.BorderColor( BtnColors_TradePanel.BorderColor = clrDarkSlateGray );
                              //Sleep(10);   TechnicalO.TechnicalXRun(false, 200);  //
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_Ema20Band.GAC.Name() && gTradePannelObj.BTN_Ema20Band.GAC.State()) //GAC.Name() == " " &&
                    {         gTradePannelObj.BTN_Ema20Band.GAC.Color( BtnColors_TradePanel.DescColorPress = clrWhite );
                              gTradePannelObj.BTN_Ema20Band.GAC.BackColor( BtnColors_TradePanel.BackColorPress = clrChocolate );
                              gTradePannelObj.BTN_Ema20Band.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress = clrChocolate ); //
                              RightMenu.SubEMA.Key.IsPadPress_20Band = true;
                              //Sleep(10);  TechnicalO.TechnicalXRun(true, 200); //
                    } //
                    else if( Clicked == gTradePannelObj.BTN_Ema20Band.GAC.Name() && !gTradePannelObj.BTN_Ema20Band.GAC.State())
                    {         gTradePannelObj.BTN_Ema20Band.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite );
                              gTradePannelObj.BTN_Ema20Band.GAC.BackColor( BtnColors_TradePanel.BackColor = clrDarkSlateGray  );
                              gTradePannelObj.BTN_Ema20Band.GAC.BorderColor( BtnColors_TradePanel.BorderColor = clrDarkSlateGray );
                              RightMenu.SubEMA.Key.IsPadPress_20Band = true;
                              //Sleep(10);   TechnicalO.TechnicalXRun(false, 200);  //
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_Ema5Micro.GAC.Name() && gTradePannelObj.BTN_Ema5Micro.GAC.State()) //GAC.Name() == " " &&
                    {         gTradePannelObj.BTN_Ema5Micro.GAC.Color( BtnColors_TradePanel.DescColorPress = clrWhite );
                              gTradePannelObj.BTN_Ema5Micro.GAC.BackColor( BtnColors_TradePanel.BackColorPress = clrChocolate );
                              gTradePannelObj.BTN_Ema5Micro.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress = clrChocolate ); //
                              RightMenu.SubEMA.Key.IsPadPress_5Micro = true;
                              Sleep(10);
                              //TechnicalO.Technical_MACreator(true, "Ema5Micro", 200, MODE_EMA, PRICE_CLOSE, 5, 0 * Point, STYLE_SOLID, 2, clrYellow, 0);    //
                              //TechnicalO.Technical_MACreator(true, "Sma5Micro", 200, MODE_SMA, PRICE_CLOSE, 5, 0 * Point, STYLE_SOLID, 2, clrDodgerBlue, 0);    //
                              //
                    }  //
                    //
                    else if( Clicked == gTradePannelObj.BTN_Ema5Micro.GAC.Name() && !gTradePannelObj.BTN_Ema5Micro.GAC.State())
                    {         gTradePannelObj.BTN_Ema5Micro.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite );
                              gTradePannelObj.BTN_Ema5Micro.GAC.BackColor( BtnColors_TradePanel.BackColor = clrDarkSlateGray  );
                              gTradePannelObj.BTN_Ema5Micro.GAC.BorderColor( BtnColors_TradePanel.BorderColor = clrDarkSlateGray );
                              RightMenu.SubEMA.Key.IsPadPress_5Micro = false;
                              Sleep(10);
                              //TechnicalO.Technical_MACreator(false, "Ema5Micro", 200, MODE_EMA, PRICE_CLOSE, 5, 0 * Point, STYLE_SOLID, 2, clrYellow, 0);    //
                              //TechnicalO.Technical_MACreator(false, "Sma5Micro", 200, MODE_SMA, PRICE_CLOSE, 5, 0 * Point, STYLE_SOLID, 2, clrDodgerBlue, 0);    //
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_Ema20.GAC.Name() && gTradePannelObj.BTN_Ema20.GAC.State()) //GAC.Name() == " " &&
                    {         gTradePannelObj.BTN_Ema20.GAC.Color( BtnColors_TradePanel.DescColorPress = clrWhite );
                              gTradePannelObj.BTN_Ema20.GAC.BackColor( BtnColors_TradePanel.BackColorPress = clrChocolate );
                              gTradePannelObj.BTN_Ema20.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress = clrChocolate ); //
                              RightMenu.SubEMA.Key.IsPadPress_20EMA = true;
                              // Sleep(10);  TechnicalO.Technical_MACreator(true, "Ema20", 200, MODE_EMA, PRICE_CLOSE, 20, 0 * Point, STYLE_SOLID, 2, clrYellow, 0);//
                    }  //
                    else if( Clicked == gTradePannelObj.BTN_Ema20.GAC.Name() && !gTradePannelObj.BTN_Ema20.GAC.State())
                    {         gTradePannelObj.BTN_Ema20.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite );
                              gTradePannelObj.BTN_Ema20.GAC.BackColor( BtnColors_TradePanel.BackColor = clrDarkSlateGray  );
                              gTradePannelObj.BTN_Ema20.GAC.BorderColor( BtnColors_TradePanel.BorderColor = clrDarkSlateGray );
                              RightMenu.SubEMA.Key.IsPadPress_20EMA = false;
                              //Sleep(10);  TechnicalO.Technical_MACreator(false, "Ema20", 200, MODE_EMA, PRICE_CLOSE, 20, 0 * Point, STYLE_SOLID, 2, clrYellow, 0);    //
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_Ema30.GAC.Name() && gTradePannelObj.BTN_Ema30.GAC.State()) //GAC.Name() == " " &&
                    {         gTradePannelObj.BTN_Ema30.GAC.Color( BtnColors_TradePanel.DescColorPress = clrWhite );
                              gTradePannelObj.BTN_Ema30.GAC.BackColor( BtnColors_TradePanel.BackColorPress = clrChocolate );
                              gTradePannelObj.BTN_Ema30.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress = clrChocolate ); //
                              RightMenu.SubEMA.Key.IsPadPress_30EMA = true;
                              //Sleep(10);  TechnicalO.Technical_MACreator(true, "Ema30", 200, MODE_EMA, PRICE_CLOSE, 30, 0 * Point, STYLE_SOLID, 2, clrBlue, 0); //
                    }  //
                    else if( Clicked == gTradePannelObj.BTN_Ema30.GAC.Name() && !gTradePannelObj.BTN_Ema30.GAC.State())
                    {         gTradePannelObj.BTN_Ema30.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite );
                              gTradePannelObj.BTN_Ema30.GAC.BackColor( BtnColors_TradePanel.BackColor = clrDarkSlateGray  );
                              gTradePannelObj.BTN_Ema30.GAC.BorderColor( BtnColors_TradePanel.BorderColor = clrDarkSlateGray );
                              RightMenu.SubEMA.Key.IsPadPress_30EMA = false;
                              //Sleep(10);  TechnicalO.Technical_MACreator(false, "Ema30", 200, MODE_EMA, PRICE_CLOSE, 30, 0 * Point, STYLE_SOLID, 2, clrBlue, 0);    //
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_Ema200.GAC.Name() && gTradePannelObj.BTN_Ema200.GAC.State()) //GAC.Name() == " " &&
                    {         gTradePannelObj.BTN_Ema200.GAC.Color( BtnColors_TradePanel.DescColorPress = clrWhite );
                              gTradePannelObj.BTN_Ema200.GAC.BackColor( BtnColors_TradePanel.BackColorPress = clrChocolate );
                              gTradePannelObj.BTN_Ema200.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress = clrChocolate ); //
                              RightMenu.SubEMA.Key.IsPadPress_200EMA = true;
                              //Sleep(10);  TechnicalO.Technical_MACreator(true, "Ema200", 200, MODE_EMA, PRICE_CLOSE, 200, 0 * Point, STYLE_SOLID, 2, clrRed, 0); //
                    }  //
                    else if( Clicked == gTradePannelObj.BTN_Ema200.GAC.Name() && !gTradePannelObj.BTN_Ema200.GAC.State())
                    {         gTradePannelObj.BTN_Ema200.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite );
                              gTradePannelObj.BTN_Ema200.GAC.BackColor( BtnColors_TradePanel.BackColor = clrDarkSlateGray  );
                              gTradePannelObj.BTN_Ema200.GAC.BorderColor( BtnColors_TradePanel.BorderColor = clrDarkSlateGray );
                              RightMenu.SubEMA.Key.IsPadPress_200EMA = false;
                              //Sleep(10);  TechnicalO.Technical_MACreator(false, "Ema200", 200, MODE_EMA, PRICE_CLOSE, 200, 0 * Point, STYLE_SOLID, 2, clrRed, 0);  //
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_Ema500.GAC.Name() && gTradePannelObj.BTN_Ema500.GAC.State()) //GAC.Name() == " " &&
                    {         gTradePannelObj.BTN_Ema500.GAC.Color( BtnColors_TradePanel.DescColorPress = clrWhite );
                              gTradePannelObj.BTN_Ema500.GAC.BackColor( BtnColors_TradePanel.BackColorPress = clrChocolate );
                              gTradePannelObj.BTN_Ema500.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress = clrChocolate ); //
                              RightMenu.SubEMA.Key.IsPadPress_500EMA = true;
                              Sleep(10);
                              //TechnicalO.TechnicalOMACreator(true); //
                    } //
                    else if( Clicked == gTradePannelObj.BTN_Ema500.GAC.Name() && !gTradePannelObj.BTN_Ema500.GAC.State())
                    {         gTradePannelObj.BTN_Ema500.GAC.Color( BtnColors_TradePanel.DescColor = clrWhite );
                              gTradePannelObj.BTN_Ema500.GAC.BackColor( BtnColors_TradePanel.BackColor = clrDarkSlateGray  );
                              gTradePannelObj.BTN_Ema500.GAC.BorderColor( BtnColors_TradePanel.BorderColor = clrDarkSlateGray );
                              RightMenu.SubEMA.Key.IsPadPress_500EMA = false;
                              Sleep(10);
                              //TechnicalO.TechnicalOMACreator(false); //
                              //
                    } //
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if ( Clicked == gTradePannelObj.BTN_CommentPannel.GAC.Name() && gTradePannelObj.BTN_CommentPannel.GAC.State()) //GAC.Name() == "BTN_CommentPannel" &&
                    {         gTradePannelObj.BTN_CommentPannel.GAC.Color( BtnColors_TradePanel.DescColorPress);
                              gTradePannelObj.BTN_CommentPannel.GAC.BackColor( clrBlack );
                              gTradePannelObj.BTN_CommentPannel.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress );  //
                    }
                    else if( Clicked == gTradePannelObj.BTN_CommentPannel.GAC.Name() && !gTradePannelObj.BTN_CommentPannel.GAC.State())
                    {         gTradePannelObj.BTN_CommentPannel.GAC.Color( BtnColors_TradePanel.DescColor );
                              gTradePannelObj.BTN_CommentPannel.GAC.BackColor(  Utilities.RandomColor() );
                              gTradePannelObj.BTN_CommentPannel.GAC.BorderColor( BtnColors_TradePanel.BorderColor ); //
                    }   //
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_Close.GAC.Name()) gTradePannelObj.BTN_Close.GAC.State(false);// Is_Create
                    //{         gTradePannelObj.BTN_Close.GAC.Color( BtnColors_TradePanel.DescColorPress);
                    //          gTradePannelObj.BTN_Close.GAC.BackColor( BtnColors_TradePanel.BackColorPress);
                    //          gTradePannelObj.BTN_Close.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress ); ///
                    //          gTradePannelObj.BTN_Close.GAC.State(false);
                    //          gTradePannelObj.BTN_Close.GAC.Color( BtnColors_TradePanel.DescColor   );
                    //          gTradePannelObj.BTN_Close.GAC.BackColor( BtnColors_TradePanel.BackColor  );
                    //          gTradePannelObj.BTN_Close.GAC.BorderColor( BtnColors_TradePanel.BorderColor ); //
                    //}///
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_Buy.GAC.Name()) gTradePannelObj.BTN_Buy.GAC.State(false);// Is_Create
                    //          if(gTradePannelObj.BTN_Buy.GAC.State())
                    //          {         Sleep(20); //ChartItemX(FiboArcX);
                    //                    gTradePannelObj.BTN_Buy.GAC.Color( BtnColors_TradePanel.DescColorPress);
                    //                    gTradePannelObj.BTN_Buy.GAC.BackColor( BtnColors_TradePanel.BackColorPress);
                    //                    gTradePannelObj.BTN_Buy.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress ); ///
                    //          } //even zeroo mean default
                    //          else    if( !gTradePannelObj.BTN_Buy.GAC.State())
                    //          {         //Tools.UseFiboChannel.Delete();
                    //                    gTradePannelObj.BTN_Buy.GAC.Color( BtnColors_TradePanel.DescColor   );
                    //                    gTradePannelObj.BTN_Buy.GAC.BackColor( BtnColors_TradePanel.BackColor  );
                    //                    gTradePannelObj.BTN_Buy.GAC.BorderColor( BtnColors_TradePanel.BorderColor ); //
                    //          }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_Sell.GAC.Name()) gTradePannelObj.BTN_Sell.GAC.State(false);// Is_Create
                    //          if(gTradePannelObj.BTN_Sell.GAC.State())
                    //          {         Sleep(10); //ChartItemX(FiboArcX);
                    //                    gTradePannelObj.BTN_Sell.GAC.Color( BtnColors_TradePanel.DescColorPress);
                    //                    gTradePannelObj.BTN_Sell.GAC.BackColor( BtnColors_TradePanel.BackColorPress);
                    //                    gTradePannelObj.BTN_Sell.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress ); ///
                    //                    Sleep(10);
                    //                    gTradePannelObj.BTN_Sell.GAC.State(false);
                    //                    gTradePannelObj.BTN_Sell.GAC.Color( BtnColors_TradePanel.DescColor   );
                    //                    gTradePannelObj.BTN_Sell.GAC.BackColor( BtnColors_TradePanel.BackColor  );
                    //                    gTradePannelObj.BTN_Sell.GAC.BorderColor( BtnColors_TradePanel.BorderColor );//
                    //          } //even zeroo mean default
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_ConditionWatch.GAC.Name()) // Is_Create
                    {         if(gTradePannelObj.BTN_ConditionWatch.GAC.State())
                              {         //ChartItemX(FiboArcX);
                                        gTradePannelObj.BTN_ConditionWatch.GAC.Color( BtnColors_TradePanel.DescColorPress);
                                        gTradePannelObj.BTN_ConditionWatch.GAC.BackColor( BtnColors_TradePanel.BackColorPress);
                                        gTradePannelObj.BTN_ConditionWatch.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress ); ///
                                        TRADER_Panel_DATA.IsConditionWatch = True; } //even zeroo mean default
                              if(!gTradePannelObj.BTN_ConditionWatch.GAC.State())
                              {         //gTradePannelObj.BTN_Trial.GAC.State(false);
                                        gTradePannelObj.BTN_ConditionWatch.GAC.Color( BtnColors_TradePanel.DescColor   );
                                        gTradePannelObj.BTN_ConditionWatch.GAC.BackColor( BtnColors_TradePanel.BackColor  );
                                        gTradePannelObj.BTN_ConditionWatch.GAC.BorderColor( BtnColors_TradePanel.BorderColor );
                                        TRADER_Panel_DATA.IsConditionWatch = false; //
                              }//
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_TicketManage.GAC.Name()) // Is_Create
                    {         if(gTradePannelObj.BTN_TicketManage.GAC.State())
                              {         Sleep(10); //ChartItemX(FiboArcX);
                                        gTradePannelObj.BTN_TicketManage.GAC.Color( BtnColors_TradePanel.DescColorPress);
                                        gTradePannelObj.BTN_TicketManage.GAC.BackColor( BtnColors_TradePanel.BackColorPress);
                                        gTradePannelObj.BTN_TicketManage.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress ); ///
                                        Sleep(10); TRADER_Panel_DATA.IsTicketManage = True; } //even zeroo mean default
                              if(!gTradePannelObj.BTN_TicketManage.GAC.State())
                              {         //gTradePannelObj.BTN_Trial.GAC.State(false);
                                        gTradePannelObj.BTN_TicketManage.GAC.Color( BtnColors_TradePanel.DescColor   );
                                        gTradePannelObj.BTN_TicketManage.GAC.BackColor( BtnColors_TradePanel.BackColor  );
                                        gTradePannelObj.BTN_TicketManage.GAC.BorderColor( BtnColors_TradePanel.BorderColor );
                                        Sleep(10); TRADER_Panel_DATA.IsTicketManage = false;  } //
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_Trial.GAC.Name()) // Is_Create
                    {         if(gTradePannelObj.BTN_Trial.GAC.State())
                              {         Sleep(10); //ChartItemX(FiboArcX);
                                        gTradePannelObj.BTN_Trial.GAC.Color( BtnColors_TradePanel.DescColorPress);
                                        gTradePannelObj.BTN_Trial.GAC.BackColor( BtnColors_TradePanel.BackColorPress);
                                        gTradePannelObj.BTN_Trial.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress ); ///
                                        Sleep(10); TRADER_Panel_DATA.IsAuto_OrdersModifications = True; RightMenu.SubController.TrialPanel(MODE_CREATE, True); } //even zeroo mean default
                              if(!gTradePannelObj.BTN_Trial.GAC.State())
                              {         //gTradePannelObj.BTN_Trial.GAC.State(false);
                                        gTradePannelObj.BTN_Trial.GAC.Color( BtnColors_TradePanel.DescColor   );
                                        gTradePannelObj.BTN_Trial.GAC.BackColor( BtnColors_TradePanel.BackColor  );
                                        gTradePannelObj.BTN_Trial.GAC.BorderColor( BtnColors_TradePanel.BorderColor );
                                        Sleep(10); TRADER_Panel_DATA.IsAuto_OrdersModifications = false; RightMenu.SubController.TrialPanel(MODE_CREATE, false); //
                              }//
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_PutOrders.GAC.Name()) // Is_Create
                    {         if(gTradePannelObj.BTN_PutOrders.GAC.State())
                              {         Sleep(10); //ChartItemX(FiboArcX);
                                        gTradePannelObj.BTN_PutOrders.GAC.Color( BtnColors_TradePanel.DescColorPress);
                                        gTradePannelObj.BTN_PutOrders.GAC.BackColor( BtnColors_TradePanel.BackColorPress);
                                        gTradePannelObj.BTN_PutOrders.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress ); ///
                                        Sleep(10); TRADER_Panel_DATA.IsAuto_OrdersPut = True; } //even zeroo mean default
                              if(!gTradePannelObj.BTN_PutOrders.GAC.State())
                              {         //gTradePannelObj.BTN_PutOrders.GAC.State(false);
                                        gTradePannelObj.BTN_PutOrders.GAC.Color( BtnColors_TradePanel.DescColor);
                                        gTradePannelObj.BTN_PutOrders.GAC.BackColor( BtnColors_TradePanel.BackColor);
                                        gTradePannelObj.BTN_PutOrders.GAC.BorderColor( BtnColors_TradePanel.BorderColor);
                                        Sleep(10); TRADER_Panel_DATA.IsAuto_OrdersPut = false; //
                              }//
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    if( Clicked == gTradePannelObj.BTN_CloseAll.GAC.Name()) // Is_Create
                    {         if(gTradePannelObj.BTN_CloseAll.GAC.State())
                              {         Sleep(10); //ChartItemX(FiboArcX);
                                        gTradePannelObj.BTN_CloseAll.GAC.Color( BtnColors_TradePanel.DescColorPress);
                                        gTradePannelObj.BTN_CloseAll.GAC.BackColor( BtnColors_TradePanel.BackColorPress);
                                        gTradePannelObj.BTN_CloseAll.GAC.BorderColor( BtnColors_TradePanel.BorderColorPress ); ///
                                        Sleep(10); TRADER_Panel_DATA.IsAuto_EndAll = True; } //even zeroo mean default
                              if(!gTradePannelObj.BTN_CloseAll.GAC.State())
                              {         //gTradePannelObj.BTN_CloseAll.GAC.State(false);
                                        gTradePannelObj.BTN_CloseAll.GAC.Color( BtnColors_TradePanel.DescColor);
                                        gTradePannelObj.BTN_CloseAll.GAC.BackColor( BtnColors_TradePanel.BackColor);
                                        gTradePannelObj.BTN_CloseAll.GAC.BorderColor( BtnColors_TradePanel.BorderColor);
                                        Sleep(10); TRADER_Panel_DATA.IsAuto_EndAll = false;  //
                              }//
                    }
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
                    //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
                    //=========================================================================== DecPutLots
                    //''''''''''''''''''''''''''''''''''''''''''''''
                    //-- DisplayLastKnownPing
                    //Alert(sparam,"-Line:",__LINE__);
                    if( Clicked == OBJPREFIX + "CONNECTION") { Complex.LBL_ping_reflesh(); }
                    //================================================================ SwitchTheme
                    if( Clicked == OBJPREFIX + "LBL_Theme") { if(TradePanel.SelectedTheme == LIGHT)TradePanel.Set_PanleTheme(DARK); else TradePanel.Set_PanleTheme(LIGHT); }
                    //================================================================ StartPainting
                    if( Clicked == OBJPREFIX + "LBL_Paint") { ChartUtillities.ChartPainting.EnablePainting(); } //
                    //================================================================ SoundManagement
                    if( Clicked == OBJPREFIX + "LBL_Sound" || Clicked == OBJPREFIX + "LableSoundIO")//SOUND///SOUNDIO
                    {         //-- EnableSound
                              if(!Sound.IS_SoundEnabled)
                              {         Sound.IS_SoundEnabled = true;
                                        if(ObjectFind(0, OBJPREFIX + "LBL_SoundIO") >= 0)
                                                  ObjectSetInteger(0, OBJPREFIX + "SOUNDIO", OBJPROP_COLOR, C'59,41,40'); //Set_Object
                                        PlaySound("sound.wav"); }
                              //-- DisableSound
                              else
                              {         Sound.IS_SoundEnabled = false;
                                        if(ObjectFind(0, OBJPREFIX + "SOUNDIO") >= 0)
                                                  ObjectSetInteger(0, OBJPREFIX + "SOUNDIO", OBJPROP_COLOR, clrNONE); //Set_Object
                              } //
                    }
                    //================================================================= TickSoundsManagement
                    if( Clicked == OBJPREFIX + "LBL_Play")///PLAY
                    {         //-- EnableTickSounds
                              if(!TradePanel.PlayTicks)
                              {         TradePanel.PlayTicks = true;
                                        //-- Set_Objects
                                        if(ObjectFind(0, OBJPREFIX + "LBL_Play") >= 0)
                                        {         ObjectSetString(0, OBJPREFIX + "LBL_Play", OBJPROP_TEXT, ";");
                                                  ObjectSetInteger(0, OBJPREFIX + "LBL_Play", OBJPROP_FONTSIZE, 14);//
                                        }//
                              }
                              //-- DisableTickSounds
                              else
                              {         TradePanel.PlayTicks = false;
                                        //-- Set_Objects
                                        if(ObjectFind(0, OBJPREFIX + "LBL_Play") >= 0)
                                        {         ObjectSetString(0, OBJPREFIX + "LBL_Play", OBJPROP_TEXT, "4");
                                                  ObjectSetInteger(0, OBJPREFIX + "LBL_Play", OBJPROP_FONTSIZE, 15); //
                                        }//
                              } //
                    }
                    //================================================================== Set_Bull/BearColors
                    if( Clicked == OBJPREFIX + "LBL_Candels¦")//CANDLES¦
                    {         color clrBullish = Utilities.RandomColor(true);
                              color clrBearish = Utilities.RandomColor(true);
                              //-- Set_Chart
                              ChartSetInteger(0, CHART_COLOR_CANDLE_BULL, clrBullish);
                              ChartSetInteger(0, CHART_COLOR_CHART_UP, clrBullish);
                              ChartSetInteger(0, CHART_COLOR_CANDLE_BEAR, clrBearish);
                              ChartSetInteger(0, CHART_COLOR_CHART_DOWN, clrBearish);
                              ChartSetInteger(0, CHART_COLOR_CHART_LINE, Utilities.RandomColor(true)); //
                    }
                    //================================================================== RemoveExpert
                    if( Clicked == OBJPREFIX + "LBL_Exit")///EXIT
                    {         if(MessageBox("Do you really want to remove the EA?", TradePanel.MB_CAPTION, MB_ICONQUESTION | MB_YESNO) == IDYES)ExpertRemove();}
                    //-- Set_ClosingMode
                    if( Clicked == OBJPREFIX + "LabelClose¹²³")
                    {         TradePanel.CloseMode++;
                              if(TradePanel.CloseMode >= ArraySize(TradePanel.CloseArr))  TradePanel.CloseMode = 0;//Reset
                              if(ObjectFind(0, OBJPREFIX + "LabelClose¹²³") >= 0)///CLOSE¹²³
                              {         ObjectSetString(0, OBJPREFIX + "LabelClose¹²³", OBJPROP_TEXT, 0, TradePanel.CloseArr[TradePanel.CloseMode]); }//Set_Object
                              Sound.PlaySoundS("switch.wav"); //
                    }
                    //================================================================== DecPutLots
                    {         if( Clicked == OBJPREFIX + "LBL_PutLotsDown<")//LOTSIZE<//LOTSIZE<>/////////
                                        if(ObjectFind(0, OBJPREFIX + "S_EDIT " + "EDT_PutLots") >= 0 && !ct_Drive.TDD.st_Size.IsDynamicPutLots)
                                                  ObjectSetString(0, OBJPREFIX + "S_EDIT " + "EDT_PutLots", OBJPROP_TEXT, 0, DoubleToString(ct_Drive.TDD.st_Size.Curr_Lots -= ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT, 2)); //Set_Object///Curr_MinLot////LotStep
                              //-- IncPutLots
                              if( Clicked == OBJPREFIX + "LBL_PutLotsUp")//LOTSIZE>//LOTSIZE<>/////////
                                        if(ObjectFind(0, OBJPREFIX + "S_EDIT " + "EDT_PutLots") >= 0 && !ct_Drive.TDD.st_Size.IsDynamicPutLots)
                                                  ObjectSetString(0, OBJPREFIX + "S_EDIT " + "EDT_PutLots", OBJPROP_TEXT, 0, DoubleToString(ct_Drive.TDD.st_Size.Curr_Lots += ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT, 2)); //Set_Object
                    }//
                    //================================================================== SellClick
                    if( Clicked == OBJPREFIX + "LabelSell")////SELL
                    {         ct_Drive.TDD.ct_Start.Panel_OrderPutting.Is_MarketsSell = true; //-- SendSellOrder
                              Sleep(100);  //-- ResetButton
                              if(ObjectFind(0, OBJPREFIX + "LabelSell") >= 0)ObjectSetInteger(0, OBJPREFIX + "LabelSell", OBJPROP_STATE, false); //Set_Object
                    }
                    //==================================================================== CloseClick
                    if( Clicked == OBJPREFIX + "LabelClose")///CLOSE
                    {         Sleep(100);  //-- ResetButton
                              if(ObjectFind(0, OBJPREFIX + "LabelClose") >= 0)ObjectSetInteger(0, OBJPREFIX + "LabelClose", OBJPROP_STATE, false); //Set_Object
                    }
                    if( Clicked == OBJPREFIX + "LabelBuy")//////BUY    //-- BuyClick
                    {         ct_Drive.TDD.ct_Start.Panel_OrderPutting.Is_MarketsBuy = true; Sleep(100);   //-- ResetButton
                              if(ObjectFind(0, OBJPREFIX + "LabelBuy") >= 0)ObjectSetInteger(0, OBJPREFIX + "LabelBuy", OBJPROP_STATE, false); //Set_Object
                    }
                    //===================================================================== ResetCoordinates
                    if( Clicked == OBJPREFIX + "KeyReset")//RESET/KeyMove
                    {         //Move2(0, OBJPREFIX + "BCKGRND[]", CLIENT_BG_X, CLIENT_BG_Y);
                              if(ObjectFind(0, OBJPREFIX + "KeyReset") >= 0)     ObjectSetInteger(0, OBJPREFIX + "KeyReset", OBJPROP_STATE, false); //Set_Object
                              if(ObjectFind(0,  OBJPREFIX + "KeyMove") >= 0)  if(ObjectGetInteger(0, OBJPREFIX + "KeyMove", OBJPROP_STATE)) ObjectSetInteger(0, OBJPREFIX + "KeyMove", OBJPROP_STATE, false); /*Set_Object*/
                              //============================//============================
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //
                              //============================//============================
                              //-- MoveObjects
                              TradePanel.GetSet_Coordinates();
                              TradePanel.ObjectsMoveAll(); //
                    }
                    //=====================================================================
                    //==------------------------------------------------------------------------------------------
                    return; //
                    //
          } //
}//
//+------------------------------------------------------------------+
//||   ||||||||||                 eTradePanel.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
