//+------------------------------------------------------------------+
//||   ||||||||||                 C_EVENT.mqh                       ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_Event.mqh>
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Interface_Control.mqh>
///======================================================
//+------------------------------------------------------------------+
//|             Class C_EVENT     BEGIN                              |
//+------------------------------------------------------------------+
class C_EVENT
{
public:
          void                  C_EVENT();
          void                  ~C_EVENT();
          void                  Run(const int id, const long &lparam, const double &dparam, const string &sparam);
          //================================================================
          Sg_OnChartEvent       EventInfo;
          string                EventFuncCom;/// FuncCom Parameter
          //================================================================
public:
          bool                  KeyClicking();
          string                MouseState(uint state);// MouseState
          ///void               ONchartingPad(string sparam );
          void                  Event_KeyDown(int Line_com = 0, string FuncCome = "None");//
          void                  Custume();
          void                  Event_ByActions();
          //================================================================
};// Event;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_EVENT::C_EVENT()
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_EVENT",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_EVENT",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_EVENT::~C_EVENT()
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_EVENT",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_EVENT::KeyClicking()//const un changeed value
{         //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__);//|
          //========================================================================|
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_EVENT::Custume()
{         long        Xcoordinate       = 0;
          double      Ycoordinate       = 0;
          bool        eventCustom             = EventChartCustom(ChartID(), CHARTEVENT_OBJECT_CLICK, Xcoordinate, Ycoordinate);
          eventCustom == true ? ________________________________________________________Xerorr.Alerter(true) : ________________________________________________________Xerorr.Alerter("false");
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string C_EVENT::MouseState(uint state)// MouseState
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_EVENT",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          string res;
          res += "\nML: "   + (((state & 1) == 1)       ? "DN" : "UP"); // mouse left
          res += "\nMR: "   + (((state & 2) == 2)       ? "DN" : "UP"); // mouse right
          res += "\nMM: "   + (((state & 16) == 16)     ? "DN" : "UP"); // mouse middle
          res += "\nMX: "   + (((state & 32) == 32)     ? "DN" : "UP"); // mouse first X Key
          res += "\nMY: "   + (((state & 64) == 64)     ? "DN" : "UP"); // mouse second X Key
          res += "\nSHIFT: " + (((state & 4) == 4)      ? "DN" : "UP"); // shift Key
          res += "\nCTRL: " + (((state & 8) == 8)       ? "DN" : "UP"); // control Key
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_EVENT",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(res);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_EVENT::Run(const int id, const long &lparam, const double &dparam, const string &sparam)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, Debuging.FUNCTION_com + "-C_EVENT",  __LINE__, __FUNCTION__); //|
          ////========================================================//--packing data
          Event.initParam(id, lparam, dparam, sparam);
          //========================================================
          Debuging.Catch(__DATE__, __DATETIME__, __LINE__, __FILE__, __PATH__, __FUNCTION__, __FUNCSIG__, __MQLBUILD__, __MQL4BUILD__);
          //----------------------------------------------------
          if(false)//ChartRedraw();//WindowRedraw()//|
          {         //Alert("id: ", (string)id, "--lparam: ", (string)lparam, "--dparam: ", (string)dparam, "--sparam: ", sparam); //
                    //Comment(__FUNCTION__, ": id=", id, " lparam=", lparam, " dparam=", dparam, " sparam=", sparam);  //
          }
          //=========================================================
          static bool KeyMovePad        = false;
          ///================================
          ushort EventIdCrosshair       = 9000;
          ushort EventIdTrendline       = 9001;
          bool   IS_EventIdCrosshair    = false;
          bool   IS_EventIdTrendline    = false;
          //========================================
          //FlowPanel.OnChartEvents(__FUNCTION__, id, lparam, dparam, sparam);  //Alert("Run: ",__LINE__,__FUNCTION__);
          //Complex.OnChartEvents(__FUNCTION__, id, lparam, dparam, sparam);
          //TradePanel.OnChartEvents( id, lparam, dparam, sparam);//
          //GoldVIP.OnChartEvents(id, lparam, dparam, sparam);
          //=================================================
          ExtDialog.OnChartEvents(Event);
          //TradePanel.OnChartEvents(event);         //---who need to handle in panel master class of data and methods complexty monolic
          //---------------------------------------
          //Event_TradePanel.OnChartEvents();        //---who need to implant all progress singley by event service provider class
          Event_TradePanel.Main(Event_TradePanel);   //---who work with Objparam methods..
          //---------------------------------------
          Event_FlowPanel.Main(Event_FlowPanel);
          //---------------------------------------
          Event_RightMenu.Main(Event_RightMenu);     //--  RightMenu.OBJECT_CLICK(Debuging.FUNCSIG_com, sparam);     RightMenu.MOUSE_MOVE(Debuging.FUNCSIG_com, id, lparam, dparam, sparam, Debuging.Line_com, Debuging.FUNCTION_com); //
          //---------------------------------------
          Event_Bank.Main(Event_Bank);               //-- bank_Pad.OBJECT_CLICK(Debuging.FUNCSIG_com, sparam);
          //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..
          Event_ByActions();
          ct_Drive.TDD.ct_Start.OnEvent_OnClick();
          //======================================================================================
          ONCHART.GetOnChart();
          //======================================================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, Debuging.FUNCTION_com +  "-C_EVENT",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_EVENT::Event_KeyDown( int Line_com = 0, string FuncCome = "None")
{         switch(int(Event.lparam))
          {         case KEYx_NUMLOCK_LEFT:  Print("The KEY_NUMLOCK_LEFT has been pressed");   break;
                    case KEYx_LEFT:          Print("The KEY_LEFT has been pressed");           break;
                    case KEYx_NUMLOCK_UP:    Print("The KEY_NUMLOCK_UP has been pressed");     break;
                    case KEYx_UP:            Print("The KEY_UP has been pressed");             break;
                    case KEYx_NUMLOCK_RIGHT: Print("The KEY_NUMLOCK_RIGHT has been pressed");  break;
                    case KEYx_RIGHT:         Print("The KEY_RIGHT has been pressed");          break;
                    case KEYx_NUMLOCK_DOWN:  Print("The KEY_NUMLOCK_DOWN has been pressed");   break;
                    case KEYx_DOWN:          Print("The KEY_DOWN has been pressed");           break;
                    case KEYx_NUMLOCK_5:     Print("The KEY_NUMLOCK_5 has been pressed");      break;
                    case KEYx_F11:
                    {         Print("The KEY_11 has been pressed");
                              //
                    } break;//
                    default:                Print("Some not listed Key has been pressed"); //
          } //
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define KEY_NUMPAD_5x      12
#define KEY_LEFT           37
#define KEY_UP             38
#define KEY_RIGHT          39
#define KEY_DOWN           40
#define KEY_NUMLOCK_DOWN   98
#define KEY_NUMLOCK_LEFT  100
#define KEY_NUMLOCK_5     101
#define KEY_NUMLOCK_RIGHT 102
#define KEY_NUMLOCK_UP    104
void C_EVENT::Event_ByActions()
{         switch(Event.id)
          {         case CHARTEVENT_OBJECT_CLICK:
                    {         if(KeyCHARTEVENT_OBJECT_CLICK) //--- the mouse has been clicked on the graphic object
                              {         //----------------------
                                        /* ONOFF-Alert-sParam */
                                        //----------------------
                                        {         static bool Xz = false;
                                                  if( Event.sparam ==  "RLBLBorderExpert-ONOFF-Alert-sParam")
                                                  {         Xz = Xz ? false : true;
                                                            if(Xz) {ObjectSetInteger(0, "RLBLBorderExpert-ONOFF-Alert-sParam", OBJPROP_BGCOLOR, clrGold  );}
                                                            else  {ObjectSetInteger(0, "RLBLBorderExpert-ONOFF-Alert-sParam", OBJPROP_BGCOLOR, clrLightSlateGray );} //
                                                            //
                                                  }
                                                  static bool Xz1 = false;
                                                  if( Event.sparam ==  "RLBLBorderExpert-ONOFF-NN-Signal")
                                                  {         Xz1 = Xz1 ? false : true;
                                                            if(Xz1) {ObjectSetInteger(0, "RLBLBorderExpert-ONOFF-NN-Signal", OBJPROP_BGCOLOR, clrLime  );               ct_Drive.TDD.ct_Signals.Extern_Signals.IsAllowNN = true;   }
                                                            else  {ObjectSetInteger(0, "RLBLBorderExpert-ONOFF-NN-Signal", OBJPROP_BGCOLOR, clrDarkSlateBlue );         ct_Drive.TDD.ct_Signals.Extern_Signals.IsAllowNN = false;  } //
                                                            //
                                                  }
                                                  static bool Xz2 = false;
                                                  if( Event.sparam ==  "RLBLBorderExpert-ONOFF-Tree-Signal")
                                                  {         Xz2 = Xz2 ? false : true;
                                                            if(Xz2) {ObjectSetInteger(0, "RLBLBorderExpert-ONOFF-Tree-Signal", OBJPROP_BGCOLOR, clrLime  );             ct_Drive.TDD.ct_Signals.Extern_Signals.IsAllowTree = true;   }
                                                            else  {ObjectSetInteger(0, "RLBLBorderExpert-ONOFF-Tree-Signal", OBJPROP_BGCOLOR, clrDarkSlateBlue );       ct_Drive.TDD.ct_Signals.Extern_Signals.IsAllowTree = false;  } //
                                                            //
                                                  }
                                                  static bool Xz3 = false;
                                                  if( Event.sparam ==  "RLBLBorderExpert-ONOFF-Array-Signal")
                                                  {         Xz3 = Xz3 ? false : true;
                                                            if(Xz3) {ObjectSetInteger(0, "RLBLBorderExpert-ONOFF-Array-Signal", OBJPROP_BGCOLOR, clrLime  );            ct_Drive.TDD.ct_Signals.Extern_Signals.IsAllowArray = true;   }
                                                            else  {ObjectSetInteger(0, "RLBLBorderExpert-ONOFF-Array-Signal", OBJPROP_BGCOLOR, clrDarkSlateBlue );      ct_Drive.TDD.ct_Signals.Extern_Signals.IsAllowArray = false;  } //
                                                            //
                                                  }
                                                  static bool Xz4 = false;
                                                  if( Event.sparam ==  "RLBLBorderExpert-ONOFF-Trade-Config")
                                                  {         Xz4 = Xz4 ? false : true;
                                                            if(Xz4) {ObjectSetInteger(0, "RLBLBorderExpert-ONOFF-Trade-Config", OBJPROP_BGCOLOR, clrLime  );            ct_Drive.TDD.ct_Configs.IsAllowConfig  = true;   }
                                                            else  {ObjectSetInteger(0, "RLBLBorderExpert-ONOFF-Trade-Config", OBJPROP_BGCOLOR, clrMediumSeaGreen );      ct_Drive.TDD.ct_Configs.IsAllowConfig = false;  } //
                                                            //
                                                  }
                                                  if(Xz)Alert( " sparam: >>>", Event.sparam, "<<<      "  + "      --id:", (string)Event.id, "           --lparam:", (string)Event.lparam, "               --dparam: ", (string)Event.dparam); //
                                        }//
                                        
                                        //==============================================
                                        //for faster responce.. searching..mached name of elements.. can difused accsees too un nedded vblocks...
                                        bool Yes = (-1 != StringFind(Event.sparam, "TradePanel"));//
                                        Keyboard.OBJECT_CLICK(Debuging.FUNCSIG_com, Event.sparam);
                                        Complex.OBJECT_CLICK(Debuging.FUNCSIG_com, Event.sparam);
                                        Clicker.OBJECT_CLICK(Debuging.FUNCSIG_com, Event.sparam); //
                                        ct_Drive.TDD.ct_Configs.OnClick(ct_Drive.TDD.ct_Configs.IsAllowConfig,Event.sparam);
                                        //==============================================
                                        //
                              } //
                    } break; //
                              //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, Debuging.FUNCSIG_com +  "-C_EVENT",  __LINE__, __FUNCTION__); //
                    //---
                    //---
                    //---
                    case CHARTEVENT_CLICK:
                    {         if( !KeyCHARTEVENT_CLICK ) //--- the left mouse button has been pressed on the chart
                              {         // Alert("The coordinates of the mouse click on the chart are: x = ", lparam, "  y = ", dparam); //
                                        Complex.CLICK(Debuging.FUNCSIG_com, Event.id, Event.lparam, Event.dparam, Event.sparam, Debuging.Line_com, Debuging.FUNCTION_com); //
                              }  //==============================================
                              if(Event.id == CHARTEVENT_CLICK)
                              {         datetime time = 0;
                                        double price = 0;
                                        int window = 0;
                                        if (ChartXYToTimePrice(ChartID(), int(Event.lparam), int(Event.dparam), window, time, price))
                                        {         int bar = iBarShift(Symbol(), Period(), time);
                                                  Print ("bar = ", bar, ", high = ", iHigh(Symbol(), Period(), bar), ", low = ", iLow(Symbol(), Period(), bar)); //
                                        }//
                              } //
                    } break; //
                    //---
                    //---
                    //---
                    case CHARTEVENT_KEYDOWN:
                    {         if(false)
                                        switch(int(Event.lparam))
                                        {         case KEY_NUMLOCK_LEFT:  Print("The KEY_NUMLOCK_LEFT has been pressed");   break;
                                                  case KEY_LEFT:          Print("The KEY_LEFT has been pressed");           break;
                                                  case KEY_NUMLOCK_UP:    Print("The KEY_NUMLOCK_UP has been pressed");     break;
                                                  case KEY_UP:            Print("The KEY_UP has been pressed");             break;
                                                  case KEY_NUMLOCK_RIGHT: Print("The KEY_NUMLOCK_RIGHT has been pressed");  break;
                                                  case KEY_RIGHT:         Print("The KEY_RIGHT has been pressed");          break;
                                                  case KEY_NUMLOCK_DOWN:  Print("The KEY_NUMLOCK_DOWN has been pressed");   break;
                                                  case KEY_DOWN:          Print("The KEY_DOWN has been pressed");           break;
                                                  case KEY_NUMPAD_5:      Print("The KEY_NUMPAD_5 has been pressed");       break;
                                                  case KEY_NUMLOCK_5:     Print("The KEY_NUMLOCK_5 has been pressed");      break;
                                                  default:                Print("Some not listed key has been pressed"); //
                                        }
                              if(  KeyCHARTEVENT_KEYDOWN ) //--- the Key has been pressed
                              {         //--this.Event_KeyDown( lparam, dparam, sparam,  Debuging.Line_com, Debuging.FUNCTION_com );
                              }         //==============================================
                    } break; //
                    //---
                    //---
                    //---
                    case CHARTEVENT_OBJECT_CREATE:  //
                    {         if(  !KeyCHARTEVENT_OBJECT_CREATE  ) //--- the object has been created
                              {         Print("The object with name ", Event.sparam, " has been created"); //
                              }         //==============================================
                    } break; //
                    //---
                    //---
                    //---
                    case CHARTEVENT_OBJECT_CHANGE:
                    {         if( !KeyCHARTEVENT_OBJECT_CHANGE  ) //---
                              {         //  C1.clickinger_CUSTOM(  Event.id,  Event.lparam,   Event.dparam,   Event.sparam); //
                              }         //==============================================
                    } break;
                    case CHARTEVENT_OBJECT_DELETE:
                    {         if(  !KeyCHARTEVENT_OBJECT_DELETE  ) //--- the object has been deleted
                              {         Print("The object with name ", Event.sparam, " has been deleted"); //
                              }         //==============================================
                    } break; //
                    //---
                    //---
                    //---
                    case CHARTEVENT_OBJECT_DRAG:
                    {         if(  KeyCHARTEVENT_OBJECT_DRAG  ) //--- the object has been moved or its anchor point coordinates has been changed
                              {         Alert("The anchor point coordinates of the object with name ", Event.sparam, " has been changed"); } //
                    } break; //
                    //---
                    //---
                    //---
                    case CHARTEVENT_OBJECT_ENDEDIT:
                    {         if(  !KeyCHARTEVENT_OBJECT_ENDEDIT  ) //--- the text in the Edit of object has been changed
                              {         Print("The text in the Edit field of the object with name ", Event.sparam, " has been changed"); };//
                              //==============================================
                              Login.Login_Event();
                              //
                    } break; //
                    //---
                    //---
                    //---
                    case CHARTEVENT_CHART_CHANGE:
                    {         if(  !KeyCHARTEVENT_CHART_CHANGE  ) //---
                              {         //  C1.clickinger_CUSTOM(  Event.id,  Event.lparam,   Event.dparam,   Event.sparam); //
                              } //
                              //?Noneed>>________________________________________________________Xerorr.Alerter("Chart Changed", __LINE__, __FUNCTION__);////????>>>>>>chart change scrole or other thing...
                              ChartData_ChartFrame.PixelGet();//not workedd...
                              //==============================================
                    } break;
                              //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_EVENT",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    //---
                    //---
                    //---
                    case CHARTEVENT_CUSTOM:
                    {         if(Event.id > CHARTEVENT_CUSTOM && !KeyCHARTEVENT_CUSTOM  ) //--- Check the event belongs to the user events
                              {         // C1.clickinger_CUSTOM(  Event.id,  Event.lparam,   Event.dparam,   Event.sparam); //
                              } //
                              //  if(ChartGetInteger(ChartID(), CHART_EVENT_MOUSE_MOVE) > 0) // mouse move and mouse click events
                              //           bool EventChartClicking = EventChartCustom(Chart(), CHARTEVENT_MOUSE_MOVE, lparam, dparam, sparam);
                    } break; //
                    //---
                    //---
                    //---
                    case CHARTEVENT_CUSTOM_LAST:
                    {         if(Event.id == CHARTEVENT_CUSTOM_LAST && !KeyCHARTEVENT_CUSTOM_LAST ) //---
                              {         //C1.clickinger_CUSTOM(  Event.id,  Event.lparam,   Event.dparam,   Event.sparam); //
                              }         //==============================================
                    } break; //
                              //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, Debuging.FUNCTION_com +  "-C_EVENT",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    //---
                    //---
                    //---
                    case CHARTEVENT_MOUSE_MOVE:
                    {         if(KeyCHARTEVENT_MOUSE_MOVE) //---
                              {         //controlling key presiing leftbouttom mouse//
                                        Keyboard.ScanPreesKeys(CHARTEVENT_CLICK);///>>ONevery Clicking   it runn....///>>>Coolll//Third Mission on clicking keys
                                        Complex.MOUSE_MOVE(Debuging.FUNCSIG_com, Event.id, Event.lparam, Event.dparam, Event.sparam, Debuging.Line_com, Debuging.FUNCTION_com); //
                                        ToolsCall.MOUSE_MOVE(Debuging.FUNCSIG_com, Event.id, Event.lparam, Event.dparam, Event.sparam, Debuging.Line_com, Debuging.FUNCTION_com);
                                        //==============================================
                              } break; //
                              //============================//============================
                              ________________________________________________________Xerorr.SuperviserX(_LastError, Debuging.FUNCTION_com +  "-C_EVENT",  __LINE__, __FUNCTION__); //
                              //============================//============================
                    }//
                    //---
                    //---
                    //---
                    case CHARTEVENT_MOUSE_WHEEL:
                    {         if(  !KeyCHARTEVENT_MOUSE_WHEEL  ) //---
                              {         //C1.clickinger_CUSTOM(  id,  lparam,   dparam,   sparam); //
                                        Alert( "MOUSE_WHEEL-UsemouseX:" + (string)Mouse.UsemouseX +  "--" + "UsemouseY:" + (string)Mouse.UsemouseY +  "--" + "UsemouseButtons:" + Mouse.UsemouseButtons +  "--"   ); //
                              }         //==============================================
                    } break; //
                    default:  //
                    {         // Alert("defaultCHARTEVENT:->>>>-" + "UsemouseX:" + (string)a1.UsemouseX +  "--" + "UsemouseY:" + (string)a1.UsemouseY +  "--" + "UsemouseButtons:" + a1.UsemouseButtons +  "--"   ); //
                              //==============================================
                    }
                              //======================================================================================================================================
          } //
}//
//+------------------------------------------------------------------+
//|             Class C_EVENT     BEGIN-END                   |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//||   ||||||||||                 C_EVENT.mqh                       ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
