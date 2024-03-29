//+------------------------------------------------------------------+
//|                        A_TIMER.mqh                               |
//+------------------------------------------------------------------+
//||   ||||||||||               A_TIMER.mqh                         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Interface_Control.mqh>

//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "Oprymhdv@Gmail.com"
#property version   "1.00"
#property strict
//#include <0srcCapitan\QuartsExperts\TOOLS.mqh>
//#include <0srcCapitan\QuartsExperts\Chart.mqh>
///////////////////////////////////////////////////////////////////////on
//#include <0srcCapitan\QuartsExperts\Chart_TOOLS.mqh>
//#include <0srcCapitan\QuartsExperts\EventControler.mqh>
//#include <0srcCapitan\QuartsExperts\MyRoboTrader.mqh>
//#include <0srcCapitan\QuartsExperts\ct_Drive.TDD.ct_Conductor.mqh>
//#include <0srcCapitan\QuartsExperts\C_STATICSUN.mqh>

//+------------------------------------------------------------------+
//|             Class C_TIMER     BEGIN                              |
//+------------------------------------------------------------------+
class C_TIMER
{
private:
          int            ObjNumber;
          bool           newBar ;

public:
          bool           IS_TimerEnabled;//
          //int          TimerInterval ;//must declare before call class members// sent to C_CHART CLASS
          //==========================================================
          void           C_TIMER(); //--- input parameters
          void           ~C_TIMER();
          void           Update(bool IsAllow);
          bool           UPDATED;
          bool           IsUpdateCount;

          bool           Manage();
          bool           MANAGED;
          void           CheackKeys(bool KeyRun = false);// C_STATICSUN &InformStaticX); // EventTimer( ); //
          //--------------------------------------------------------------------
          void           Enviroments_App_Local_Set_A(bool IsUpdate);
          void           Enviroments_App_System_Set_B();
          void           Enviroments_App_Server_Broker_Set_C();
          void           Enviroments_App_Local_Trade_Set_D();
          void           Enviroments_App_Local_Panels_Set_E();
          void           Enviroments_App_Local_Utilities_Set_F();
          //==========================================================
          bool           IsCrossTimeServer(int f_hour, int f_minute, int f_second = 0);         // godzina//hour///is//// minuta// sekunda
          bool           IsJustCrossedTimeServer(int f_hour, int f_minute, int f_second = 0); // godzina///was//checks if a certain point in today's time has been exceeded on the trading server once.
          bool           IsNowWithinTimeGMT(int f_startHour, int f_startMinute, int f_startSecond, int f_stopHour, int f_stopMinute, int f_stopSecond);
          bool           IsNowWithinTimeServer (int f_startHour, int f_startMinute, int f_startSecond, int f_stopHour, int f_stopMinute, int f_stopSecond);

          //=============================================

          //
}; ///Timer ; //TimerH.TimerXRun()
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TIMER::C_TIMER() //--- input parameters
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-Timer Error",  __LINE__, __FUNCTION__); //|
          ObjNumber++;
          newBar = false;
          Update(false);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Timer Error",  __LINE__, __FUNCTION__); //|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TIMER::~C_TIMER()
{         EventKillTimer();
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-Timer Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TIMER::Update(bool IsAllow)
{         //________________________________________________________Xerorr.SuperviserX(_LastError, "-Timer Error",  __LINE__, __FUNCTION__); //
          //if(!Initer.IsBasic_Done) {return;}
          //if(!Detect_NewBar._M1.CBT__Seccound.Is_NewBar)return;
          //DataGlobal.SetVaribles(0.1);
          MathSrand(GetTickCount());
          //return;//
          if(IsAllow)//Must obey this
          {         UPDATED = false;
                    //Alert("Update C_TIMER Start", __LINE__);
                    //Alert("+====================================================+" + __FUNCTION__); //
                    PulseHourly.Is_Pulse = PulseHourly.ExecuteONPulse(true, 60 * 60) ? true : false; //sample Update By Peridoic Set loop or dont run update by returning every Peridoic Set
                    //==========================================================
                    //  Enviroments Apps Athurication            <<<<<<<<<<<<<<<<<<<<|
                    //==========================================================
                    //--if(!Login.Timer())return;  //  on init and ontimer need off
                    //==========================================================*B Control Candels series ^ Indicators series ^ Bank Profits,App Status
                    //  Enviroments Apps Status            <<<<<<<<<<<<<<<<<<<<|
                    //==========================================================
                    //
                    //
                    {         Enviroments_App_Local_Set_A(UPDATED);      //--Status
                              if(IsUpdateCount)
                              {         bool booler = true;
                                        while(booler)
                                        {         if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar)Enviroments_App_System_Set_B();            //--Status
                                                  if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar)Enviroments_App_Server_Broker_Set_C();     //--Status ---StackOverflow start  not !!!!! change name
                                                  if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar)Enviroments_App_Local_Trade_Set_D();       //--Status
                                                  if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar)Enviroments_App_Local_Panels_Set_E();      //--Status
                                                  if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar)Enviroments_App_Local_Utilities_Set_F();   //--Status
                                                  booler = false;//
                                        }//
                              }//
                    }
                    //--AFTWEHPPNING CHOSEE BLOC KNOW WHITCH IS BLOCK ID
                    //
                    if(0)
                    {         //-------------------
                              /* SQL MODULES RUN */
                              //-------------------
                              //MySql_Dev.MainProgress(0); //--version call
                              MySql_Dev.MainProgress(1, "");                                                                                            Sleep(5000); // init conntact
                              MySql_Dev.MainProgress(-2, "", "Books");     /*worked*/                                                                   Sleep(5000);
                              MySql_Dev.MainProgress(2, "", "Books", "(id int, code varchar(50), start_date datetime)"); /*worked*/                     Sleep(5000);
                              MySql_Dev.MainProgress(5, "INSERT INTO `Books` (id, code, start_date) VALUES (1,\'EURUSD.f\',\'2023.04.14 00:00:01\');");   Sleep(5000);
                              MySql_Dev.MainProgress(-2, "", "Books");                                                                                    Sleep(5000);
                              //------------------------------------------------------------------------
                              MySql_Dev.MainProgress(-2, "", "Client");     /*worked*/                                                                   Sleep(5000);
                              MySql_Dev.MainProgress(2, "", "Client", "(id int, code varchar(50),name varchar(50), start_date datetime)"); /*worked*/                     Sleep(5000);
                              MySql_Dev.MainProgress(5, "INSERT INTO `Client` (id, code, name, start_date) VALUES (1,\'EURUSD.f\',\'Pourya\',\'2023.04.14 00:00:01\');");   Sleep(5000);
                              MySql_Dev.MainProgress(-2, "", "Client");
                              //------------------------------------------------------------------------
                              //MySql_Dev.MainProgress(11,"");
                              MySql_Dev.MainProgress(-1, ""); //--disconncet
                              //
                              //SQL.Main();
                              //SQLLite.Main();//
                    }
                    if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar)MapTradeSence_Test_Structures();
                    //
                    //==========================================================
                    // Status Trade App Cheack START Working Local Enviroments |
                    //==========================================================
                    UPDATED = (WinUser.UPDATED          &&
                               this.MANAGED             &&
                               C_STATICSUN::UPDATED     &&
                               Dev_Checkup_Mql.UPDATED  &&
                               Dev_Checkup_Terminal.UPDATED
                               /*&& Window.UPDATED*/    &&
                               ct_Drive.GETDATA            &&
                               //ct_Drive.TDD.ct_Conductor.UPDATED   && //--- update by detect new bar
                               //TechnicalO.UPDATED       && //--- update by detect new bar
                               Dev_Chart_Window.UPDATED &&
                               Zigo.UPDATED             &&
                               Complex.UPDATED          &&
                               TradePanel.UPDATED       &&
                               RightMenu.UPDATEDExtern  &&
                               PivotLines.UPDATED       &&
                               Utilities.UPDATED
                               //ViewComments.UPDATED      //--- update by detect new bar
                              );
                    //========================================================================
                    // Trade App Cheack END Working Local Enviroments  NEURALNETWORKS        |
                    //========================================================================
                    {         if(0) ///NNVector
                              {         Print("--------------C_TIMER::Update()---MATRIX CALC----------------");
                                        Sleep(1);//ObjectsDeleteAll();
                                        NN_Neurons_Vector_Run *MTSNNV_Ontick = new NN_Neurons_Vector_Run(0.30, 0.5, 100);
                                        MTSNNV_Ontick._MainRun_();//
                                        delete MTSNNV_Ontick;
                                        //ObjectsDeleteAll();
                                        return;//
                                        //
                              }//
                              if(0) ///NNVector
                              {         Print("--------------C_TIMER::Update()-------------------");
                                        Sleep(1);//ObjectsDeleteAll();
                                        NN_Neurons_Vector_Run *MTSNNV_Ontick = new NN_Neurons_Vector_Run(0.30, 0.5, 100);
                                        MTSNNV_Ontick._MainRun_();//
                                        delete MTSNNV_Ontick;
                                        //ObjectsDeleteAll();
                                        return;//
                                        //
                              }//
                              if(0)///NNMatrix
                              {         Print("--------------C_TIMER::Update()-------------------");
                                        Sleep(0);//ObjectsDeleteAll();
                                        VectorZ<uint> topo; topo.add(1); topo.add(2); topo.add(2);
                                        NN_VectorsArray_Matrix_Run *MTSNNM_Ontick = new NN_VectorsArray_Matrix_Run(topo, 0.30, 0.5, 100);
                                        MTSNNM_Ontick._MainRun_();//
                                        delete MTSNNM_Ontick;
                                        //ObjectsDeleteAll();
                                        return;//
                                        //
                              }//
                              if(0)///NNMatrix
                              {         Print("--------------C_TIMER::Update()---MATRIX CALC Mine----------------");
                                        Sleep(0);//ObjectsDeleteAll();
                                        NN_VectorsArray_Matrix777_Run *MTSNNM_Ontick = new NN_VectorsArray_Matrix777_Run();
                                        MTSNNM_Ontick.__MainRun__();//
                                        delete MTSNNM_Ontick;
                                        //ObjectsDeleteAll();
                                        return;//
                                        //
                              }//
                              if(0)///NNNMatrix
                              {         Print("--------------C_TIMER::Update()-------------------");
                                        //Sleep(0); //ObjectsDeleteAll();
                                        NN_Neurons_Matrix_Run769_VectorNet *MTSNNM_Ontick = new NN_Neurons_Matrix_Run769_VectorNet(1.0, 0.75, 1.5, 6); // 0.15, 0.5, 100
                                        MTSNNM_Ontick._MainRun_();//
                                        delete MTSNNM_Ontick;
                                        //ObjectsDeleteAll();
                                        return;//
                                        //
                              }//
                              if(0)///NNNMatrix
                              {         Print("--------------C_TIMER::Update()--_YX_------more issue matrix complex-----------");
                                        //return;//__No Memory leak___________
                                        Sleep(2000); //ObjectsDeleteAll();
                                        //ObjectsDeleteAll();
                                        NN_Neurons_Matrix_YX_Run<double> MTSNNM_Ontick;
                                        MTSNNM_Ontick.__MainRun__();//
                                        return;//
                                        //
                              }//
                              if(0)///NNNMatrix_Sampler>>fail
                              {         Print("--------------C_TIMER::Update()--_YX_------more issue matrix complex-----------");
                                        //return;//__No Memory leak___________
                                        Sleep(2000); //ObjectsDeleteAll();
                                        //ObjectsDeleteAll();
                                        NN_Neurons_Matrix_YX_Sampler_Run<double> MTSNNM_Ontick;
                                        MTSNNM_Ontick.__MainRun__();//
                                        return;//
                                        //
                              }//
                              if(0)///NNNMatrix
                              {         Print("--------------C_TIMER::Update()-------------------");
                                        //Sleep(0); //ObjectsDeleteAll();
                                        NN_Neurons_Matrix_Run456 *MTSNNM_Ontick = new NN_Neurons_Matrix_Run456(1.0, 0.75, 1.5, 6); // 0.15, 0.5, 100
                                        MTSNNM_Ontick._MainRun_();//
                                        delete MTSNNM_Ontick;
                                        //ObjectsDeleteAll();
                                        return;//
                                        //
                              }//
                              if(0)///NNMatrix
                              {         Print("--------------C_TIMER::Update()-------------------");
                                        //Sleep(0); //ObjectsDeleteAll();
                                        NN__VectorsArray_Matrix__Run111 *NNMatrix = new NN__VectorsArray_Matrix__Run111();// 0.15, 0.5, 100
                                        NNMatrix.__MainRun__();//
                                        delete NNMatrix;
                                        //ObjectsDeleteAll();
                                        return;//
                                        //
                              }//
                    }
                    //========================================================================
                    // Trade App Cheack END Working Local Enviroments  NEURALNETWORKS        |
                    //========================================================================
                    //________________________________________________________Xerorr.SuperviserX(_LastError, "-Timer Error",  __LINE__, __FUNCTION__);
                    //UPDATED ? ________________________________________________________Xerorr.Alerter(true) : ________________________________________________________Xerorr.Alerter(__FUNCTION__ + "  Main false", __LINE__, __FUNCTION__); //
          } //
          return ; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TIMER::CheackKeys(bool KeyRun = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Timer Error",  __LINE__, __FUNCTION__); //|
          if(KeyRun)
          {         //static int counterOnTimer;// Alert("OnTimer() worked" + (string)counterOnTimer++);
                    if(!ct_Inform.CommentOxKeyRun && gFlow_Pad.IsLBL_D2)
                    {         Comment("GONE OnTimerUpdate()>>>", ct_Inform.CommentOx(true)); } //for static only >>MyRoboTrader::CommentOx()
          }
          if(false)///??>>> test lot
          {         //====================================================
                    bool KeyD = ChartSetInteger(ChartID(), CHART_EVENT_OBJECT_CREATE, true);  // -- - enable object create events
                    KeyD = ChartSetInteger(ChartID(), CHART_EVENT_OBJECT_DELETE, true); //-- - enable object delete events
                    bool IS_Created_NewOBJ = ChartGetInteger(ChartID(), CHART_EVENT_OBJECT_CREATE, 0);
                    //ObjectGetString(0,Name,OBJPROP_NAME)
                    //IS_Created_NewOBJ ?  ________________________________________________________Xerorr.Alerter(+"CHART_EVENT_OBJECT_CREATE" + "//--height: " + (string)heightPixelChart + "//--width: " + (string)widthPixelChart) : false; //
                    //
          }//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_TIMER::Manage()
{         MANAGED = false;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          if(0) {C_STATICSUN::ObjectsTotalStatic = "--ObjectsTotal:" + (string)ObjectsTotal();  } //
          datetime      TimeDifference__Now_and_LocalWithOffset ;
//-------------------------------------------------
          if(ct_Series_Base.IsRefreshRate)   { TimeDifference__Now_and_LocalWithOffset = Time[0] + Period() * 60 -  DevTime.localtime -  DevTime.timeOffset;}
          else                          { TimeDifference__Now_and_LocalWithOffset = Time[0];} // Use RefreshRates to get the current time from TimeCurrent// Otherwise you'll just get the last known time
          string        TIME0_SECONDS   = TimeToStr(TimeDifference__Now_and_LocalWithOffset, TIME_SECONDS );
          DevTime.localtime             = TimeLocal() + (TimeGMTOffset() + (60 * 60));//
//=========================================================| //-- GetSetUserInputs
          static bool Is_CheackKeys = 1;
          if(Is_CheackKeys)
          {         //=========================================================|//--- normalize difference between open and close prices for a day range//// Found object it exists
                    //=========================================================|
                    CheackKeys(1);///?>>>>>>>>>>>Updating key & color & ...///importants
                    //=========================================================|
                    //=========================================================|
                    {         int            corner;
                              FontSelect     selectedFont;
                              int            textSize;
                              bool           bold;
                              color          fntcolor;
                              corner            = 1;
                              selectedFont      = 2;
                              textSize          = 25;
                              bold              = true;
                              fntcolor          = clrYellow;
                              //=============================================
                              //long         thisChart;
                              int            iFontType;
                              string         sBoldType;
                              string         sFontType;
                              if(bold)          {sBoldType = " Bold"; }
                              else if(!bold)    {sBoldType = ""; }
                              iFontType = selectedFont;
                              switch(iFontType)
                              {         case 0: sFontType = "Arial"             + sBoldType; break;
                                        case 1: sFontType = "Times New Roman"   + sBoldType; break;
                                        case 2: sFontType = "Courier"           + sBoldType; break; //
                              }
                              datetime srvtime, tmpOffset;
                              srvtime           = TimeCurrent();
                              DevTime.localtime = TimeLocal() + TimeGMTOffset();// Modified
                              //-----------------------------------------------------------
                              if(TimeHour(srvtime) > TimeHour( DevTime.localtime))
                              {         // Server Time is still ahead of us
                                        int newOffset = TimeHour(srvtime) - TimeHour( DevTime.localtime);
                                        DevTime.ServerLocalOffset = (newOffset * 60 * 60); //
                              }
                              else if(TimeHour(srvtime) < TimeHour( DevTime.localtime))
                              {         // Server Time is Behind us
                                        int newOffset = TimeHour( DevTime.localtime) - TimeHour(srvtime);
                                        DevTime.ServerLocalOffset = (newOffset * 60 * 60); //
                              }
                              else
                              {         // No modification required
                                        DevTime.ServerLocalOffset = srvtime;//
                              }
                              //-----------------------------------------------------------
                              DevTime.localtime = TimeLocal() - DevTime.ServerLocalOffset;
                              tmpOffset = TimeSeconds(srvtime) - TimeSeconds( DevTime.localtime);
                              if(tmpOffset < 30 && tmpOffset >= 0)
                              {         DevTime.timeOffset = TimeSeconds(srvtime) - TimeSeconds( DevTime.localtime); }//
                    }
                    //=========================================================|
                    //=========================================================|
          }
//==========================================================
// SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
//==========================================================
//
          MANAGED = true;
//
//==========================================================
// SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
//==========================================================
          if(!this.MANAGED)             {Alert("this.MANAGED: ", this.MANAGED);}
          return MANAGED; //
}//
//+------------------------------------------------------------------+
//|                                                                  |1) Check if 10:05:05 is exceeded on the trading server:
//+------------------------------------------------------------------+IsCrossTimeServer(10,5,5);
bool C_TIMER::IsCrossTimeServer(int f_hour, int f_minute, int f_second = 0)
{         if(TimeCurrent() % 86400 < 3600 * f_hour + 60 * f_minute + f_second)return false; else return true; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+1) Check if 13:05:07 was exceeded once on the trading server:
bool C_TIMER::IsJustCrossedTimeServer(int f_hour, int f_minute, int f_second = 0)
{         static datetime f_lastTime = TimeCurrent();
          datetime f_time = 3600 * f_hour + 60 * f_minute + f_second;
          bool f_result = false;//---
          if(f_lastTime % 86400 <= f_time && f_time < TimeCurrent() % 86400)f_result = true;
          f_lastTime = TimeCurrent(); return f_result; //
}
//+------------------------------------------------------------------+1) Check that the current time is between 7:00:00 and 22:05:00 GMT of today:
//|                                                                  |IsNowWithinTimeGMT ( 7 , 0 , 0 , 22 , 5 , 0 );
//|                                                                  |2) Check that the current time is between 20:15:22 GMT today and 20:00:33 GMT tomorrow:
//+------------------------------------------------------------------+IsNowWithinTimeGMT ( 20 , 15 , 22 , 20 , 0 , 33 );
//The bool IsNowWithinTimeGMT () function checks if the current time is within the specified GMT time limits. It has the following arguments:
bool C_TIMER::IsNowWithinTimeGMT(int f_startHour,  int f_startMinute, int f_startSecond, int f_stopHour,   int f_stopMinute, int f_stopSecond)
{         int f_startTime = 3600 * f_startHour + 60 * f_startMinute + f_startSecond;
          int f_stopTime = 3600 * f_stopHour + 60 * f_stopMinute + f_stopSecond;//---
          datetime f_timeCurrent = TimeGMT() % 86400;
          if(f_stopTime < f_startTime) {         if(f_timeCurrent >= f_startTime || f_timeCurrent < f_stopTime)return true; }
          else                         {         if(f_timeCurrent >= f_startTime && f_timeCurrent < f_stopTime)return true; }//---
          return false; //
}
//+------------------------------------------------------------------+IsNowWithinTimeServer ( 7 , 0 , 0 , 22 , 5 , 0 );1) Check if the current time is between 7:00:00 and 22:05:00 of today's server time:
//|                                                                  |IsNowWithinTimeServer ( 20 , 15 , 22 , 20 , 0 , 33 );2) Check if the current time is between 20:15:22 today and 20:00:33 tomorrow server time:
//+------------------------------------------------------------------+
bool C_TIMER::IsNowWithinTimeServer( int f_startHour, int f_startMinute, int f_startSecond, int f_stopHour,   int f_stopMinute,  int f_stopSecond)
{         int f_startTime = 3600 * f_startHour + 60 * f_startMinute + f_startSecond;
          int f_stopTime = 3600 * f_stopHour + 60 * f_stopMinute + f_stopSecond;// ---
          datetime f_timeCurrent = TimeCurrent () % 86400 ;
          if (f_stopTime < f_startTime) {         if (f_timeCurrent >= f_startTime || f_timeCurrent < f_stopTime)return  true ; }
          else                          {         if (f_timeCurrent >= f_startTime && f_timeCurrent < f_stopTime)return  true ; } // ---
          return  false ; //
}
//+------------------------------------------------------------------+
//|             Class TimerX     BEGIN-END                           |
//+------------------------------------------------------------------+
void C_TIMER::Enviroments_App_Local_Set_A(bool IsUpdate)
{         //==========================================================*B Control Candels series ^ Indicators series ^ Bank Profits,App Status
// Status A Local App Enviroments<<<<<<<<<<<<<<<<<<<<<<<<<<|
//==========================================================
//Alert("Stack error " + __FUNCTION__);
//---------------------------------------------------------
          if(!IsUpdate)
          {         WinUser.Update();
                    Manage();
                    C_STATICSUN::Update(); //
                    //-----------------------------------------------------------------------------------------------------------------------------------
                    Detect_NewBar.Update(); //---the moment updated stiil not change value of detect bar...!!
                    if(Detect_NewBar._M1.CBT__Seccound.Is_NewBar) {IsUpdateCount = true; /*Alert(" active signaler"); worked at last*/}//---run before detect func is eroored
                    //-----------------------------------------------------------------------------------------------------------------------------------
                    if(!WinUser.UPDATED  && !this.MANAGED && !C_STATICSUN::UPDATED)  { Alert(__FUNCTION__ + "  A Layer Status Not Updated", __LINE__);} //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TIMER::Enviroments_App_System_Set_B()
{         //==========================================================
// Status B Sysytem App Enviroments<<<<<<<<<<<<<<<<<<<<<<<<|
//==========================================================
//Alert("Stack error " + __FUNCTION__);
//---------------------------------------------------------
//---
          {         /* */Dev_Checkup_Mql.Update();
                    Dev_Checkup_Terminal.Update();
                    /*      */Dev_Common.Update();
                    /*Window.Update();*/
                    Dev_Calender.Update(ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_TIME);//
                    if(!Dev_Checkup_Mql.UPDATED    &&      !Dev_Checkup_Terminal.UPDATED      &&      !Dev_Common.UPDATED       /*&& Window.UPDATED*/)  { Alert(__FUNCTION__ + "  B Layer Status Not Updated", __LINE__);}//
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TIMER::Enviroments_App_Server_Broker_Set_C()
{         //==========================================================
// Status C Broker Server Enviroments<<<<<<<<<<<<<<<<<<<<<<|
//==========================================================
//Alert("Start-Stack error " + __FUNCTION__);
//---------------------------------------------------------
          if(Detect_NewBar._CURRENT.CBT.Is_NewBar || true)  //--- true allways run
          {         /*****/TechnicalO.Update();//
                    if(!TechnicalO.UPDATED  )  { Alert(__FUNCTION__ + "  B Layer Status Not Updated", __LINE__);}//
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TIMER::Enviroments_App_Local_Trade_Set_D()
{         //==========================================================
// Status E Trade App Local Enviroments<<<<<<<<<<<<<<<<<<<<|
//==========================================================
//Alert("Stack error " + __FUNCTION__);
//---------------------------------------------------------
          {         //------------------------------- Trade Object Command collected from GUIs (Controller)(Client)(Server-Client)
                    ct_Drive.Update(); //
                    //--Alert("st_Size.PutLots: ",st_Size.PutLots);
                    if(!ct_Drive.UPDATED)       {Alert(__FUNCTION__ + "  ct_Drive.UPDATED: ",       ct_Drive.UPDATED);}  //
                    if( Detect_NewBar._M1.CBT__Seccound.Is_NewBar && !Size_Pad.UPDATED && !Modify_Pad.UPDATED && !End_Pad.UPDATED && !Start_Pad.UPDATED && !ct_Drive.UPDATED)
                    {         Alert(__FUNCTION__ + "  D Layer Status Not Updated ", __LINE__);} //
          }
          return;//
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TIMER::Enviroments_App_Local_Panels_Set_E() //--all pannel inputs come from on chart not timer
{         //==========================================================
// Status D Panels Local Enviroments <<<<<<<<<<<<<<<<<<<<<<<<|
//==========================================================
//Alert("Stack error " + __FUNCTION__);
//---------------------------------------------------------
          {         Dev_Chart_Window.Update();
                    /*      */Zigo.Update(); /*ZIGZAGX.Update();*/
                    /**/PivotLines.Update();
                    /*   */Complex.Update();
                    /**/TradePanel.Update(TradePanel.Is_Running);
                    /* */RightMenu.UpdateExtern(); //// RSI(false);
                    FlowPanel.Update();
                    //this.UPDATED = true;
                    if( !Dev_Chart_Window.UPDATED && !Zigo.UPDATED && !Complex.UPDATED && !TradePanel.UPDATED && !RightMenu.UPDATEDExtern && !PivotLines.UPDATED)
                    {         Alert(__FUNCTION__ + "  E Layer Status Not Updated ", __LINE__);}
                    //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TIMER::Enviroments_App_Local_Utilities_Set_F()
{         //==========================================================
// Status F Utilities App Enviroments(view)<<<<<<<<<<<<<<<<|
//==========================================================
//Alert("Stack error " + __FUNCTION__);
//---------------------------------------------------------
          {         //---
                    /*    */ExtDialog.OnTimerX();
                    /*    */Utilities.Update();
                    /*    */ViewComments.Update(); //  //--- update by detect new bar
                    //Alert("void C_TIMER::Update(bool IsAllow) ", __LINE__);//
          }
          if(false)
          {         if(!Utilities.UPDATED)                  {Alert(__FUNCTION__ + "  Utilities.UPDATED: ",    Utilities.UPDATED);}
                    //----if(!ViewComments.UPDATED)         {Alert(__FUNCTION__ + "  ViewComments.UPDATED: ", ViewComments.UPDATED);}//  //--- update by detect new bar
          } //
//
          if(false)
          {         Dev_Object_Pack.Bitmaps.Label.Create_GDS(MODE_CREATE, true, "bitmap.label.Test");
                    Dev_Object_Pack.Bitmaps.Bar.Create_GDS(MODE_CREATE,   true, "bitmap.bar.Test");//
          }//
}
//+------------------------------------------------------------------+
//|                        A_TIMER.mqh                               |
//+------------------------------------------------------------------+
//||   ||||||||||               A_TIMER.mqh                         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
