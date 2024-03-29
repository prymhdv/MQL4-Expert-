//+------------------------------------------------------------------+
//||   ||||||||||              C_TRADEPANEL.mqh                     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+

//--
#define INDENT_TOP         15
#define INDENT_BOTTOM      30
//--
#define CLIENT_BG_X        5
#define CLIENT_BG_Y        20
//--
#define CLIENT_BG_WIDTH    245
#define CLIENT_BG_HEIGHT   150
//--
#define BUTTON_WIDTH       75
#define BUTTON_HEIGHT      20
//--
#define BUTTON_GAP_X       5
#define BUTTON_GAP_Y       5
//--
#define EDIT_WIDTH         75
#define EDIT_HEIGHT        18
//--
#define EDIT_GAP_X         15
#define EDIT_GAP_Y         15
//--

//--
#define LIGHT              0
#define DARK               1
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

struct Sgo_TRADEPANEL
{         //
          //--- nonGeneric Model Of Global Cover Graphical Object
          //
          ///---LBL for panel acts nonGeneric Model Of Global Cover Graphical Object
          //Cg_TextsRectLabel   C_TRADEPANEL::RLBL_BID, RLBL_ASK,
          //                   RLBL_BorderUP, RLBL_BorderTopUP, RLBL_BorderDW, RLBL_BorderR, RLBL_BorderL, RLBL_BorderBS;
          ///---
          ///---LBL for panel acts nonGeneric Model Of Global Cover Graphical Object
          Cg_GenericChartObj_API_MYs_MQLo_MYi<S_RECTANGLE_LABEL, CChartObjectRectLabel, Cg_TextsRectLabel>
          RLBL_BID,
          RLBL_ASK,
          RLBL_BorderUP,
          RLBL_BorderTopUP,
          RLBL_BorderDW,
          RLBL_BorderR,
          RLBL_BorderL,
          RLBL_BorderBS;
          ////===========================================================================================================================
          ///---LBL for panel acts nonGeneric Model Of Global Cover Graphical Object
          //Cg_TextsLabel       C_TRADEPANEL::LBL_BID,LBL_ASK,LBL_UPTICKS,LBL_DWNTICKS,LBL_UP,LBL_DN,
          //                  LBL_FLOATz,LBL_FLOATa,LBL_FLOATb,LBL_PROFITS,LBL_POINTS,LBL_ROI,LBL_ROIa,LBL_ROI2,
          //                  LBL_Theme,LBL_Paint,LBL_Play,LBL_Sound,LBL_SoundIO,LBL_Speed,LBL_CLOSE,LBL_SPREAD,LBL_SPREADa;
          ///---
          ///---LBL for panel acts nonGeneric Model Of Global Cover Graphical Object
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_LABEL, CChartObjectLabel, Cg_TextsLabel>
          LBL_BID,
          LBL_ASK,
          LBL_UPTICKS,
          LBL_DWNTICKS,
          LBL_UP,
          LBL_DN,
          LBL_FLOATz,
          LBL_FLOATa,
          LBL_FLOATb,
          LBL_PROFITS,
          LBL_POINTS,
          LBL_ROI,
          LBL_ROIa,
          LBL_ROI2,
          LBL_Theme,
          LBL_Paint,
          LBL_Play,
          LBL_Sound,
          LBL_SoundIO,
          LBL_Speed,
          LBL_CLOSE,
          LBL_SPREAD,
          LBL_SPREADa;
          ////===========================================================================================================================
          ///---BTN for panel acts nonGeneric Model Of Global Cover Graphical Object
          //Cg_TextsButton      C_TRADEPANEL::BTN_Ema,BTN_Ema20Band,BTN_Ema5Micro,BTN_Ema20,BTN_Ema30,BTN_Ema200,BTN_Ema500,BTN_RESET,BTN_Sell,BTN_Buy,BTN_Close;
          //Cg_TextsButton      C_TRADEPANEL::BTN_TicketManage,BTN_ConditionWatch,BTN_Trial,BTN_PutOrders,BTN_CloseAll;
          ///---
          ///---BTN for panel acts  Generic Model Of Global Cover Graphical Object
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON, CChartObjectButton, Cg_TextsButton>
          BTN_Ema,
          BTN_Ema20Band,
          BTN_Ema5Micro,
          BTN_Ema20,
          BTN_Ema30,
          BTN_Ema200,
          BTN_Ema500,
          BTN_RESET,
          BTN_Sell,
          BTN_Buy,
          BTN_Close;;
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON, CChartObjectButton, Cg_TextsButton>
          BTN_TicketManage,
          BTN_ConditionWatch,
          BTN_Trial,
          BTN_PutOrders,
          BTN_CloseAll;
          ////===========================================================================================================================
          ///---LBL for panel acts nonGeneric Model Of Global Cover Graphical Object
          //Cg_TextsLabel       C_TRADEPANEL::LBL_Exit,LBL_Candels,LBL_Timer,LBL_Caption,LBL_Connection,LBL_ConnectionPing,
          //                  LBL_TF_M1,LBL_TF_M5,LBL_TF_M15,LBL_TF_M30,LBL_TF_H1,LBL_TF_H4, LabelTF_W1,LBL_TF_MN,
          //                  LBL_Symbol,LBL_Symbola,LBL_Symbolb,
          //                  LBL_ManualSLa,LBL_SL,LBL_PutLotsUp,LBL_ManualLot,LBL_PutLotsDown,LBL_TPa,LBL_ManualTP,
          //                  LBL_ZoomIn,LBL_ZoomOut,LBL_Grid,LBL_Them,LBL_Shift,LBL_Volume,LBL_Maximize,
          //                  LBL_Test,
          //                  LBL_AutoTrading,LBL_Navigator,LBL_Indiators,LBL_PeriodSeptor,LBL_WorldLogo,LBL_WorldLogoSydney,LBL_WorldLogoTokyo,
          //                  LBL_WorldLogoLondon,LBL_WorldLogoNewyork,LBL_GMT,LBL_Triangel;
          ///---
          ///---LBL for panel acts nonGeneric Model Of Global Cover Graphical Object
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_LABEL, CChartObjectLabel, Cg_TextsLabel>
          LBL_Exit,
          LBL_Candels,
          LBL_Timer,
          LBL_Caption,
          LBL_Connection,
          LBL_ConnectionPing,
          LBL_TF_M1,
          LBL_TF_M5,
          LBL_TF_M15,
          LBL_TF_M30,
          LBL_TF_H1,
          LBL_TF_H4,
          LBL_TTF_W1,
          LBL_TF_MN,
          LBL_Symbol,
          LBL_Symbola,
          LBL_Symbolb,
          LBL_ManualSLa,
          LBL_SL,
          LBL_PutLotsUp,
          LBL_ManualLot,
          LBL_PutLotsDown,
          LBL_TPa,
          LBL_ManualTP,
          LBL_ZoomIn,
          LBL_ZoomOut,
          LBL_Grid,
          LBL_Them,
          LBL_Shift,
          LBL_Volume,
          LBL_Maximize,
          LBL_Test,
          LBL_AutoTrading,
          LBL_Navigator,
          LBL_Indiators,
          LBL_PeriodSeptor,
          LBL_WorldLogo,
          LBL_WorldLogoSydney,
          LBL_WorldLogoTokyo,
          LBL_WorldLogoLondon,
          LBL_WorldLogoNewyork,
          LBL_GMT,
          LBL_Triangel;
          ////===========================================================================================================================
          ///---BTN,EDT for panel acts nonGeneric Model Of Global Cover Graphical Object
          //Cg_TextsEdit        C_TRADEPANEL::EDT_Symbol, EDT_SL, EDT_TP, EDT_PutLots;
          //Cg_TextsButton      C_TRADEPANEL::BTN_ShowComment,BTN_CommentPannel;
          ///---
          ///---BTN,EDT for panel acts nonGeneric Model Of Global Cover Graphical Object
          Cg_GenericChartObj_API_MYs_MQLo_MYi<S_EDIT, CChartObjectEdit, Cg_TextsEdit>
          EDT_Symbol,
          EDT_SL,
          EDT_TP,
          EDT_PutLots;
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON, CChartObjectButton, Cg_TextsButton>
          BTN_ShowComment,
          BTN_CommentPannel;
          //===========================================================================================================================
          //===========================================================================================================================



}; Sgo_TRADEPANEL  gTradePannelObj;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_TRADEPANEL// :public C_COMPLEXTOOLS///Bingoo///with out caling object of father class can use its item are stiil alive
{
private:
          //=================================================================================================================================================
public:
          void                  C_TRADEPANEL();
          void                  ~C_TRADEPANEL();//
          bool                  Update(bool Is_Create = false, int LineCOM = 0, string FuncCome = "None");//in FUNCTION members must static
          bool                  UPDATED;
          //=================================================================================================================================================
          //--------------------Actions/--------------------//
          bool                  Is_Running;//
          bool                  GlobalVar(bool Set_ = false);
          void                  GetTradePanel(int WhichMode, bool IsKey);
          int                   initer();
          void                  OnTesters();
          void                  OnTicks(bool KeyRun = false);
          //===========================================================================================================================
          color                 DescColorPressB;// = clrWhite;
          color                 BackColorPressB;// = clrDarkCyan;
          color                 BorderColorPressB;// = clrDarkCyan;
          color                 DescColorB;// = clrDarkCyan;
          color                 BackColorB;// = clrLavender;
          color                 BorderColorB;// = clrLavender;
          //================================================================
          bool                  KeyGlobalCheckSound       ;//= GlobalVariableCheck(ExpertName + " - Sound");//
          double                GetGlobalVarSound         ;//= GlobalVariableGet(ExpertName + " - Sound");//
          int                   GetGlobalVarSelectedTheme ;//= (int)GlobalVariableGet(ExpertName + " - Theme");
          double                GetGlobalVarPutLots       ;//= GlobalVariableGet(ExpertName + " - PutLots");
          int                   GetGlobalVarStopLoss      ;//= GlobalVariableGet(ExpertName + " - StopLoss");
          int                   GetGlobalVarTakeProfit    ;//= GlobalVariableGet(ExpertName + " - TakeProfit");
          int                   GetGlobalVarCloseMode     ;//= (int)GlobalVariableGet(ExpertName + " - Close");//
          //================================================================
          color                 COLOR_BG  ;
          color                 COLOR_FONT ;///static///static//<<<Must initing fristcoming in cass
          color                 COLOR_FONT2  ;
          color                 COLOR_MOVE  ;
          color                 COLOR_GREEN ;
          color                 COLOR_RED  ;
          color                 COLOR_HEDGE   ;
          color                 COLOR_BID_REC ;
          color                 COLOR_ASK_REC ;
          color                 COLOR_BORDER;
          //---
          color                 COLOR_SELL ;
          color                 COLOR_BUY ;
          color                 COLOR_CLOSE ;

          //---------------------------------------
          int                   ErrorInterval ;
          string                MB_CAPTION ;
          string                CloseArr[5] ;
          int                   x1, x2 ;
          int                   y1, y2 ;
          int                   button_y  ;
          int                   inputs_y ;
          int                   label_y ;
          //-------------------------
          int                   CloseMode ;
          int                   LastReason ;
          int                   SelectedTheme;//
          bool                  PlayTicks ;
          //----------------

          void                  ObjectsCreateAll(bool Is_Create = false, bool Is_Move = false);
          void                  ObjectsMoveAll(bool Is_Create = false, bool Is_Move = false);
          void                  ObjectsCheckAll();

          ///----------------------------------------------------------------------------------------------------------------------------------------------
          void                  Set_PanleTheme(const int Type);
          void                  GetSet_Inputs(bool KeyRun);
          void                  SymbolInfo(bool KeyRun);
          void                  AccAndTradeInfo(bool KeyRun);
          void                  Set_ValuesPing();
          void                  GetSet_Coordinates();
          bool                  Set_Colors(const int Type);
          //static void         Set_RunColors2(string nameCOM = "none");
          //==========================================================================
          ///>>>  void          ChartMeterByTimerController();///TimerController::UpdateLabelsValues();
          void                  Deiniting(bool KeyRun = false); //
          //===================================
          void                  TimerUpdateKey() {}; /////NOt recomend to update... its updateby clicking..
          //===================================
          void                  SpeedMeter(bool IsRun = false, bool IsPlayTicks = false, string nameCom = "@");
          double                UpTicks;
          double                DwnTicks;
          int                   fr_x;
          int                   MaxSpeedBars;
          void                  SpeedBars(int WhichMode, bool IsKey, string NameCom = "@", int MaxSpeedBarsCom = 10, int MoveX = 0, int MoveY = 0, int SPEEDBAR_GAPCOM = 0, int LineCOM = 0, string FuncCome = "None");
          double                AvgPrice ;
          double                GetAvgPrice() {return AvgPrice = (MarketInfo(_Symbol, MODE_ASK) + MarketInfo(_Symbol, MODE_BID)) / 2;}
          //---------------------------------------------------------------
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TRADEPANEL::C_TRADEPANEL()
{         RunCallFunction++;
          ///==================
          DescColorPressB = clrWhite;
          BackColorPressB = clrDarkCyan;
          BorderColorPressB = clrDarkCyan;
          DescColorB = clrDarkCyan;
          BackColorB = clrLavender;
          BorderColorB = clrLavender;
          //===================
          KeyGlobalCheckSound       = false;// GlobalVariableCheck(ExpertName + " - Sound");//
          GetGlobalVarSound         = -1;// GlobalVariableGet(ExpertName + " - Sound");//
          GetGlobalVarSelectedTheme = -1;// (int)GlobalVariableGet(ExpertName + " - Theme");
          GetGlobalVarPutLots       = -1;// GlobalVariableGet(ExpertName + " - PutLots");
          GetGlobalVarStopLoss      = -1;// GlobalVariableGet(ExpertName + " - StopLoss");
          GetGlobalVarTakeProfit    = -1;// GlobalVariableGet(ExpertName + " - TakeProfit");
          GetGlobalVarCloseMode     = -1;// (int)GlobalVariableGet(ExpertName + " - Close");//
          //====================
          COLOR_SELL = C'225,68,29';
          COLOR_BUY  = C'3,95,172';
          //
          COLOR_BG = 0;
          COLOR_FONT = 0; ///static//<<<Must initing fristcoming in cass
          COLOR_FONT2 = 0; ///<<<<<Not static cant define valuse,,,,Not Const.
          COLOR_MOVE = 0;
          COLOR_GREEN = 0;
          COLOR_RED = 0;
          COLOR_HEDGE = 0;
          COLOR_BID_REC = 0;
          COLOR_ASK_REC = 0;
          COLOR_BORDER = 0;
          CloseMode = 0;
          LastReason = 0;
          SelectedTheme = 0;
          PlayTicks = false;
          //====================
          CloseMode = 0;
          //====================
          initer();//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TRADEPANEL::~C_TRADEPANEL()
{         //Alert("C_TRADEPANEL::~C_TRADEPANEL()");//no run class destruct in change char time frame
          Deiniting(true);
          //
}
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int C_TRADEPANEL::initer()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          //Symbol
          GlobalVar(false);//
          //================================================================================//--- CreateTimer         !IsTesting() &&
          //================================================================================//-- EnableEventMouseMove
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          if( !ChartData_ChartInfo.IsTrackingMouse)Dev_Chart_Window.Set_ChartEvent_MouseMove(true);///tracking mouse
          //================================================================================//-- CheckConnection////--//Server
          if(false && !Dev_Checkup_Terminal._Mql_.CONNECTED) {MessageBox("Warning: No Internet connection found!\nPlease check your network connection.", MB_CAPTION + " | " + "#" + IntegerToString(ERR_NO_CONNECTION), MB_OK | MB_ICONWARNING); }
          //================================================================================//-- CheckTradingIsAllowed
          if(false && !Dev_Checkup_Terminal._Mql_.TRADE_ALLOWED) {MessageBox("Warning: Check if automated trading is allowed in the terminal settings!", MB_CAPTION + " | " + "#" + IntegerToString(ERR_TRADE_NOT_ALLOWED), MB_OK | MB_ICONWARNING); }
          else {if(false && !Dev_Checkup_Mql._Mql_.TRADE_ALLOWED) {MessageBox("Warning: Automated trading is forbidden in the program settings for " + __FILE__, MB_CAPTION + " | " + "#" + IntegerToString(ERR_TRADE_NOT_ALLOWED), MB_OK | MB_ICONWARNING); } }
          if(false && !ct_Drive.TDD.ct_Account._Mql_.ACCOUNT_TRADE_EXPERT_int) {MessageBox("Warning: Automated trading is forbidden for the account " + IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN)) + " at the trade server side.", MB_CAPTION + " | " + "#" + IntegerToString(ERR_TRADE_EXPERT_DISABLED_BY_SERVER), MB_OK | MB_ICONWARNING); }
          if(false && !ct_Drive.TDD.ct_Account._Mql_.ACCOUNT_TRADE_ALLOWED_int) //Investor
          {         MessageBox("Warning: Trading is forbidden for the account " + IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN)) + "." +
                               "\n\nPerhaps an investor password has been used to connect to the trading account." +
                               "\n\nCheck the terminal journal for the following entry:" +
                               "\n\'" + IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN)) + "\': trading has been disabled - investor mode.", MB_CAPTION + " | " + "#" + IntegerToString(ERR_TRADE_DISABLED), MB_OK | MB_ICONWARNING); }
          if(false && ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_TRADE_MODE == SYMBOL_TRADE_MODE_DISABLED) {         MessageBox("Warning: Trading is disabled for the symbol " + _Symbol + " at the trade server side.", MB_CAPTION + " | " + "#" + IntegerToString(ERR_TRADE_DISABLED), MB_OK | MB_ICONWARNING); }
          //================================================================================// StrategyTester
          if(Dev_Checkup_Mql._Mql_.TESTER)Print("Some functions are not available in the strategy tester.");
          //================================================================================// CheckSound.IS_SoundEnabled
          if(!KeyGlobalCheckSound)Sound.IS_SoundEnabled = true;
          else Sound.IS_SoundEnabled = GetGlobalVarSound;
          //================================================================================// CheckColors
          SelectedTheme = GetGlobalVarSelectedTheme;
          (SelectedTheme == LIGHT) ? Set_Colors(LIGHT) : Set_Colors(DARK);
          //================================================================================// GetStoredInputs
          ct_Drive.TDD.st_Size.INP               = GetGlobalVarPutLots;
          ct_Drive.TDD.ct_StopLoss.INP_Pip       = GetGlobalVarStopLoss;
          ct_Drive.TDD.ct_TakeProfit.INP_Pip     = GetGlobalVarTakeProfit;
          //================================================================================// GetClosingMode
          if(!IsTesting())CloseMode       = GetGlobalVarCloseMode;
          //================================================================================// GetAvgPrice
          if(IsConnected()) AvgPrice = (MarketInfo(_Symbol, MODE_ASK) + MarketInfo(_Symbol, MODE_BID)) / 2;
          //================================================================================////-- Set_XYAxis
          //GetSet_Coordinates();
          //================================================================================////-- CreateObjects
          //ObjectsCreateAll();
          //================================================================================////-- ChartChanged
          if(LastReason == REASON_CHARTCHANGE)Sound.PlaySoundS("switch.wav");
          //================================================================================////--- Succeeded
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          return(2); //INIT_SUCCEEDED
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void C_TRADEPANEL::OnTicks(bool KeyRun = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          if(KeyRun)
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
                    //-- DisplaySpeedInfo
                    SpeedMeter( true, true, "LBL_Speed"); ///"SPEED"///"LBL_Speed"
                    //-- StrategyTester
                    ///---off---if(IsTesting())OnTester(); //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          //---
}

//+------------------------------------------------------------------+
//| Speedometer                                                      |
//+------------------------------------------------------------------+
void C_TRADEPANEL::SpeedMeter(bool IsRun = false, bool IsPlayTicks = false, string nameCom = "@")
{         //---off---________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, (string)LineCOM + FuncCome + __FUNCTION__); //|
          //----
          if(IsRun)
          {         //-- CalcSpeed
                    double LastPrice    =  AvgPrice / _Point;
                    double CurrentPrice = ((MarketInfo(_Symbol, MODE_ASK) + MarketInfo(_Symbol, MODE_BID)) / 2) / _Point;
                    double Speed        = NormalizeDouble((CurrentPrice - LastPrice), 0);
                    AvgPrice           =  GetAvgPrice();
                    //=============================================================================
                    //-- SetMaxSpeed
                    if(Speed > 99)Speed = 99;///
                    //============================================================================= LBL_Speed#
                    //-- ReSetColors
                    for(int i = 0; i < (MaxSpeedBars); i++)//ª///
                    {         //-- SetObjects
                              if(ObjectFind(0, OBJPREFIX + nameCom + "#" + IntegerToString(i, 0, 0)) >= 0)
                                        ObjectSetInteger(0, OBJPREFIX + nameCom + "#" + IntegerToString(i, 0, 0), OBJPROP_COLOR, clrNONE);
                              //---off---else Alert("Not Find object by name " + nameCom + __FUNCTION__ + (string)__LINE__);
                              //---
                              if(ObjectFind(0, OBJPREFIX + nameCom + "§") >= 0)
                                        ObjectSetInteger(0, OBJPREFIX + nameCom + "§", OBJPROP_COLOR, clrNONE); //ª//§
                              //---off---else Alert("Not Find object by name " + nameCom + __FUNCTION__ + (string)__LINE__); //
                    } //
                    //============================//============================
                    if(Capitan_ResetLastErrorX)
                              ResetLastError();//
                    //---off---________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__,  (string)LineCOM + FuncCome + __FUNCTION__); //
                    //============================//============================
                    //-- SetColor & Text
                    for(int i = 0; i < MathAbs(Speed); i++)
                    {         if(Speed > 0)  //-- PositiveValue
                              {         //-- SetObjects
                                        if(ObjectFind(0, OBJPREFIX + nameCom + "#" + IntegerToString(i, 0, 0)) >= 0)
                                                  ObjectSetInteger(0, OBJPREFIX + nameCom + "#" + IntegerToString(i, 0, 0), OBJPROP_COLOR, COLOR_BUY);
                                        //---off---else Alert("Not Find object by name " + nameCom + __FUNCTION__ + (string)__LINE__); //
                                        //---
                                        if(ObjectFind(0, OBJPREFIX + nameCom + "§") >= 0)
                                                  ObjectSetInteger(0, OBJPREFIX + nameCom + "§", OBJPROP_COLOR, COLOR_BUY);//--++
                                        //---off---else Alert("Not Find object by name " + nameCom + __FUNCTION__ + (string)__LINE__); //
                                        UpTicks += Speed; //Cumulated
                              }
                              //============================//============================
                              if(Capitan_ResetLastErrorX)ResetLastError();//
                              //---off---________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__,  (string)LineCOM + FuncCome + __FUNCTION__); //
                              //============================//============================
                              //-- NegativeValue
                              if(Speed < 0) //-- NegativeValue
                              {         //-- SetObjects
                                        if(ObjectFind(0, OBJPREFIX + nameCom + "#" + IntegerToString(i, 0, 0)) >= 0)
                                                  ObjectSetInteger(0, OBJPREFIX + nameCom + "#" + IntegerToString(i, 0, 0), OBJPROP_COLOR, COLOR_SELL);
                                        //---off---else Alert("Not Find object by name " + nameCom + __FUNCTION__ + (string)__LINE__); //
                                        //---
                                        if(ObjectFind(0, OBJPREFIX + nameCom + "§") >= 0)
                                                  ObjectSetInteger(0, OBJPREFIX + nameCom + "§", OBJPROP_COLOR, COLOR_SELL);//§//--
                                        //---off---else Alert("Not Find object by name " + nameCom + __FUNCTION__ + (string)__LINE__); //
                                        DwnTicks += MathAbs(Speed); //Cumulated
                              }
                              if(ObjectFind(0, OBJPREFIX + nameCom + "§") >= 0)
                                        ObjectSetString(0, OBJPREFIX + nameCom + "§", OBJPROP_TEXT, 0, Utilities.±Str(Speed, 0)); //SetObject
                              //else Alert("Not Find object by name " + nameCom + __FUNCTION__ + (string)__LINE__); //
                    }//
                    //============================//============================
                    if(Capitan_ResetLastErrorX)ResetLastError();//
                    //---off---________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, (string)LineCOM + FuncCome + __FUNCTION__); //
                    //============================//============================
                    if(IsPlayTicks)//-- IsPlayTickSound
                    {         //-- SetWavFile
                              string SpeedToStr = "";
                              //-- PositiveValue
                              if(Speed > 0) {         SpeedToStr = "+" + DoubleToString(MathMin(Speed, 10), 0); }
                              //-- NegativeValue
                              else {         SpeedToStr = "" + DoubleToString(MathMax(Speed, -10), 0); }
                              //--
                              Sound.PlaySoundS("Tick" + SpeedToStr + ".wav"); //
                    }//
                    //--
          }//
          //---off---________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, (string)LineCOM + FuncCome + __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TRADEPANEL::SpeedBars(int WhichMode, bool IsKey, string NameCom = "@", int MaxSpeedBarsCom = 10, int MoveX = 0, int MoveY = 0, int SPEEDBAR_GAPCOM = 0, int LineCOM = 0, string FuncCome = "None")
{         fr_x = 0;
          MaxSpeedBars = MaxSpeedBarsCom;
          for(int i = 0; i < MaxSpeedBars; i++)
          {
                    {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              LabelX.GDS.Set_Desc_4(OBJPREFIX + NameCom + IntegerToString(i), "l", "Arial Black", 8);
                              LabelX.GDS.Set_Color_1(clrDarkOrchid);//clrNONE
                              LabelX.GDS.Set_Location_5((int)(140) + XBoxOne + fr_x, (int)(127) + SPEEDBAR_GAP_Y + YBoxOne, 0, CORNER_RIGHT_LOWER, ANCHOR_RIGHT);
                              LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + NameCom);
                              LabelX.GDS.Set_Chart_6();
                              LabelX.Action(LabelX); //
                              //0// LBL_.Create(Is_Create, Is_Move, OBJPREFIX + NameCom + IntegerToString(i), "l",
                              //0// (int)(145.6) + XBoxOne + fr_x, (int)(126.4) + SPEEDBAR_GAP_Y + YBoxOne,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_RIGHT, false, clrNONE, 0, 7, "Arial Black", clrNONE);
                              //Cat.s("wwwwwwwwwwwwwwwwwwwww" + IntegerToString(i) );
                              //
                    }
                    fr_x -= 5; //
          }//
          //Cat.s("wwwwwwwwwwwwwwwwwwwww" );
          return; //
}
//+------------------------------------------------------------------+
//| OnTester                                                         |
//+------------------------------------------------------------------+
void C_TRADEPANEL::OnTesters()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          //--- CheckObjects
          ObjectsCheckAll();
          //-- GetSet_UserInputs
          GetSet_Inputs(false);
          //-- DisplaySymbolInfo
          SymbolInfo(false);
          //-- DisplayAccount&TradeInfo
          AccAndTradeInfo(false);
          //-- SellClick
          if(ObjectFind(0, OBJPREFIX + "SELL") >= 0) //ObjectIsPresent
          {         if(ObjectGetInteger(0, OBJPREFIX + "SELL", OBJPROP_STATE))
                    {         //-- SendSellOrder
                              ct_Drive.TDD.ct_Start.Sender(OP_SELL, true);
                              if(ObjectFind(0,  OBJPREFIX + "SELL") >= 0)
                                        ObjectSetInteger(0, OBJPREFIX + "SELL", OBJPROP_STATE, false); //ResetButton
                    } //
          }
          //================================================================================//-- CloseClick
          if(ObjectFind(0, OBJPREFIX + "CLOSE") >= 0) //ObjectIsPresent
          {         if(ObjectGetInteger(0, OBJPREFIX + "CLOSE", OBJPROP_STATE))
                    {         //-- CloseOrder(s)
                              End_Pad.OrderTerminate();
                              ObjectSetInteger(0, OBJPREFIX + "CLOSE", OBJPROP_STATE, false); //ResetButton
                    }//
          }
          //================================================================================//-- BuyClick
          if(ObjectFind(0, OBJPREFIX + "BUY") >= 0) //ObjectIsPresent
          {         if(ObjectGetInteger(0, OBJPREFIX + "BUY", OBJPROP_STATE))
                    {         //-- SendBuyOrder
                              ct_Drive.TDD.ct_Start.Sender(OP_BUY, true);
                              ObjectSetInteger(0, OBJPREFIX + "BUY", OBJPROP_STATE, false); //ResetButton
                    }//
          }
          //================================================================================//-- MoveClient
          //if(ObjectFind(0, OBJPREFIX + "BCKGRND[]") == 0) //ObjectIsPresent
          //{         //-- GetCurrentPos
          //          int bg_x = (int)ObjectGetInteger(0, OBJPREFIX + "BCKGRND[]", OBJPROP_XDISTANCE);
          //          int bg_y = (int)ObjectGetInteger(0, OBJPREFIX + "BCKGRND[]", OBJPROP_YDISTANCE);
          //          //-- MoveObjects
          //          if(bg_x != x1 || bg_y != y1)
          //          {         GetSet_Coordinates();
          //                    ObjectsMoveAll(); } //
          //}
          //================================================================================//-- ResetPosition
          if(ObjectFind(0, OBJPREFIX + "RESET") >= 0 && ObjectGetInteger(0, OBJPREFIX + "RESET", OBJPROP_STATE))
          {         //-- MoveObject
                    LabelX./*OBJ.*/MoveAssign(OBJPREFIX + "BCKGRND[]", CLIENT_BG_X, CLIENT_BG_Y);
                    ObjectSetInteger(0, OBJPREFIX + "RESET", OBJPROP_STATE, false); //Set_Object
                    if(ObjectFind(0, OBJPREFIX + "MOVE") >= 0 && ObjectGetInteger(0, OBJPREFIX + "MOVE", OBJPROP_STATE)) {ObjectSetInteger(0, OBJPREFIX + "MOVE", OBJPROP_STATE, false);} //Set_Object
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
bool C_TRADEPANEL::Update(bool Is_Create = false, int LineCOM = 0, string FuncCome = "None")
{         //---
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          UPDATED = false;
          if(!ct_Drive.TDD.ct_Market_Symbol.Is_Running) SpeedMeter(Is_Running, PlayTicks); ////if isnt any tick...
          if(Is_Create)
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|//
                    if(Is_Running ) //
                    {         //ObjectsCheckAll();//--- CheckObjects
                              GetSet_Inputs(true);//-- GetSet_UserInputs
                              SymbolInfo(true);//-- DisplaySymbolInfo
                              AccAndTradeInfo(true);//-- DisplayAccount&TradeInfo
                              Set_ValuesPing();//ping valuse set//
                    } //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          }
          //---cheak LBL_AutoTrading
          if(Is_Running)
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
                    if(Dev_Checkup_Terminal._Mql_.CONNECTED)    {gTradePannelObj.LBL_Connection.GAC.Color(clrLime); }//// Alert(KeyAllow, ",,KeyAllow,","-Line:",__LINE__);
                    //---
                    if(Dev_Checkup_Terminal._Mql_.TRADE_ALLOWED && Dev_Checkup_Mql._Mql_.TRADE_ALLOWED && ct_Drive.TDD.ct_Market_Symbol.Is_Running)      gTradePannelObj.LBL_AutoTrading.GAC.Color( clrAqua );
                    if(!Dev_Checkup_Terminal._Mql_.TRADE_ALLOWED)                                                                   gTradePannelObj.LBL_AutoTrading.GAC.Color( clrRed );
                    if(!Dev_Checkup_Mql._Mql_.TRADE_ALLOWED)                                                                        gTradePannelObj.LBL_AutoTrading.GAC.Color( clrFireBrick );
                    if(!ct_Drive.TDD.ct_Market_Symbol.Is_Running)                                                                                 gTradePannelObj.LBL_AutoTrading.GAC.Color( clrDarkRed );  //
                    //---------------------------------------------------------------------------------------------------------------
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
                    //const bool KeyAllow = (TerminalInfoInteger(TERMINAL_TRADE_ALLOWED) && MQLInfoInteger(MQL_TRADE_ALLOWED));
                    //         if(!KeyAllow )  {         gTradePannelObj.LBL_AutoTrading.GAC.Color( BtnColors_TradePanel.DescColorPress = clrDarkGreen );  return; }
                    //         if(KeyAllow )   {         gTradePannelObj.LBL_AutoTrading.GAC.Color( BtnColors_TradePanel.DescColor      = clrRoyalBlue );  return; } //
                    //         if(!MQLInfoInteger(MQL_TRADE_ALLOWED)) { gTradePannelObj.LBL_AutoTrading.GAC.Color( BtnColors_TradePanel.DescColorPress = clrRed ); } //
          }
          if(Is_Running)//switching key/// must miroor
          {         Utilities.±ClrGMT("Sydney");
                    Utilities.±ClrGMT("tokyo");//
                    Utilities.±ClrGMT("london");
                    Utilities.±ClrGMT("newyork");//
          }
          TimerUpdateKey();
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATED = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          if(!this.UPDATED)       {Alert("TradePanel.UPDATED: ", this.UPDATED);}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          return UPDATED;//
}
//+------------------------------------------------------------------+
//|                                                                  |///I See.TV ..HidroGens..
//+------------------------------------------------------------------+
void C_TRADEPANEL::GetTradePanel(int WhichMode, bool IsKey)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_TRADEPANEL",  __LINE__, __FUNCTION__); //|
          //==========================================================
          //--- why >>???
          //--off--- OBJ.Texts.Textsdata.Frame.Action(MODE_MOVE, true, OBJ.Texts.Textsdata.sdata.Set_("Name", 10, 10, clrRed));
          //==========================================================
          //--- show or delete TradePanel
          Is_Running = IsKey == true && WhichMode == MODE_CREATE;
          if(Is_Running) { ObjectSetInteger(0, "RLBLBorderExpert", OBJPROP_BGCOLOR, clrRoyalBlue); }
          else        { ObjectSetInteger(0, "RLBLBorderExpert", OBJPROP_BGCOLOR, clrDarkOrchid );       } //
          {         //====================================================
                    int         CordinateX1     =       0;      x2      =       PANEL_CLIENT_BG_WIDTH;
                    int         CordinateY1     =       0;      y2      =       PANEL_CLIENT_BG_HEIGHT;
                    int         SizeX           =       30,     SizeY   =       13;
                    int         levelerX        =       1;
                    double      K               =       1;
                    //====================================================
                    //--off---  gTradePannelObj.RLBL_BorderUP.Create("RLBL_BorderUP", "BorderUP",             PANEL_RXaxMax*0.10, PANEL_RYaxMax*0.10 , 10, 10, CORNER_RIGHT_LOWER, ANCHOR_UPPER, true, BORDER_FLAT, clrSkyBlue, clrSkyBlue, clrSkyBlue);
                    //--off---  gTradePannelObj.RLBL_BorderBS.Create("RLBL_BorderBS", "BorderBS",             PANEL_RXaxMax*0.20, PANEL_RYaxMax*0.20 , 10, 10, CORNER_RIGHT_LOWER, ANCHOR_UPPER, true, BORDER_FLAT, C'240,240,240', C'240,240,240', C'240,240,240');///clrGray, clrBlack,
                    //--off---  PanelBorderDW.Create("PanelBorderDW", "BorderDW",             PANEL_RW+200, PANEL_RH-180, 10, 10, CORNER_RIGHT_LOWER, ANCHOR_UPPER, true, BORDER_FLAT, clrBlue, clrOrange, clrOrange);
                    //--off---  gTradePannelObj.RLBL_BorderR.Create("RLBL_BorderR", "BorderR",                260/260, 160*1.00, 39, 160*1.00,                                 CORNER_RIGHT_LOWER, ANCHOR_UPPER, false, BORDER_FLAT, clrRed,    clrOrange,                      0, STYLE_SOLID, 1, 8, "Arial");
                    //--off---  PanelBorderL.Create("PanelBorderL", "BorderL",                260, 160,  13, 160*1.00,                                                    CORNER_RIGHT_LOWER, ANCHOR_UPPER, false, BORDER_FLAT, clrOrange, clrOrange,                      0, STYLE_SOLID, 1, 8, "Arial");
                    ///---- Generic  RLBL_BorderTopUP---///
                    {         gTradePannelObj.RLBL_BorderTopUP.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.RLBL_BorderTopUP.GDS.Set_Desc_1("gTradePannelObj.RLBL_BorderTopUP");
                              gTradePannelObj.RLBL_BorderTopUP.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              gTradePannelObj.RLBL_BorderTopUP.GDS.Set_Color_2(clrBlack, COLOR_BORDER);
                              gTradePannelObj.RLBL_BorderTopUP.GDS.Set_Location_5((int)(247), (int)(200), (int)(260), 30, CORNER_RIGHT_LOWER);
                              gTradePannelObj.RLBL_BorderTopUP.GDS.Set_Chart_6();
                              gTradePannelObj.RLBL_BorderTopUP.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "gTradePannelObj.RLBL_BorderTopUP");
                              gTradePannelObj.RLBL_BorderTopUP.Action(gTradePannelObj.RLBL_BorderTopUP);//
                              //0// gTradePannelObj.RLBL_BorderTopUP.Create(Is_Create, Is_Move, "RLBL_BorderTopUP", "BorderTopUP",
                              //0// (int)(247), (int)(200), (int)(260), 30, CORNER_RIGHT_LOWER, ANCHOR_UPPER,
                              //0// false, BORDER_FLAT, Utilities.TransparentColor(),   COLOR_BORDER, 0, STYLE_SOLID, 1, 8, "Arial");
                    }//
                    ///---- Generic  RLBL_BorderUPr---///
                    {         gTradePannelObj.RLBL_BorderUP.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.RLBL_BorderUP.GDS.Set_Desc_1("gTradePannelObj.RLBL_BorderUP");
                              gTradePannelObj.RLBL_BorderUP.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              gTradePannelObj.RLBL_BorderUP.GDS.Set_Color_2(clrCornflowerBlue, COLOR_BORDER);
                              gTradePannelObj.RLBL_BorderUP.GDS.Set_Location_5((int)(247), (int)(176), (int)(260 ), 20, CORNER_RIGHT_LOWER);
                              gTradePannelObj.RLBL_BorderUP.GDS.Set_Chart_6();
                              gTradePannelObj.RLBL_BorderUP.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "gTradePannelObj.RLBL_BorderUP");
                              gTradePannelObj.RLBL_BorderUP.Action(gTradePannelObj.RLBL_BorderUP);//
                              //0// gTradePannelObj.RLBL_BorderUP.Create(Is_Create, Is_Move, "RLBL_BorderUP", "BorderUP",
                              //0// (int)(247), (int)(176), (int)(260 ), 20,CORNER_RIGHT_LOWER, ANCHOR_UPPER,
                              //0// false, BORDER_FLAT, clrCornflowerBlue, COLOR_BORDER, 0, STYLE_SOLID, 1, 8, "Arial");
                    }//
                    ///---- Generic  RLBL_BorderBS---///
                    {         gTradePannelObj.RLBL_BorderBS.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.RLBL_BorderBS.GDS.Set_Desc_1("gTradePannelObj.RLBL_BorderBS");
                              gTradePannelObj.RLBL_BorderBS.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              gTradePannelObj.RLBL_BorderBS.GDS.Set_Color_2(C'240,240,240', COLOR_BORDER);
                              gTradePannelObj.RLBL_BorderBS.GDS.Set_Location_5((int)(247), (int)( 160), (int)(234), (int)(160), CORNER_RIGHT_LOWER);
                              gTradePannelObj.RLBL_BorderBS.GDS.Set_Chart_6();
                              gTradePannelObj.RLBL_BorderBS.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "gTradePannelObj.RLBL_BorderBS");
                              gTradePannelObj.RLBL_BorderBS.Action(gTradePannelObj.RLBL_BorderBS);//
                              //0// gTradePannelObj.RLBL_BorderBS.Create(Is_Create, Is_Move, "RLBL_BorderBS", "BorderBS",
                              //0// (int)(247), (int)( 160), (int)(234), (int)(160), CORNER_RIGHT_LOWER, ANCHOR_UPPER,
                              //0// false, BORDER_FLAT, C'240,240,240', COLOR_BORDER,       0, STYLE_SOLID, 1, 8, "Arial");
                    }//
                    //--off--- PanelBorderDW.Create(Is_Create,"PanelBorderDW", "BorderDW",       (int)( 247), (int)( 8), (int)(260 ),20,                                            CORNER_RIGHT_LOWER, ANCHOR_UPPER, false, BORDER_FLAT, clrBlue, COLOR_BORDER,                     0, STYLE_SOLID, 1, 8, "Arial");
                    ///---- Generic  RLBL_BorderR---///
                    {         gTradePannelObj.RLBL_BorderR.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.RLBL_BorderR.GDS.Set_Desc_1("gTradePannelObj.RLBL_BorderR");
                              gTradePannelObj.RLBL_BorderR.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              gTradePannelObj.RLBL_BorderR.GDS.Set_Color_2(clrRed, COLOR_BORDER);
                              gTradePannelObj.RLBL_BorderR.GDS.Set_Location_5((int)(20.8), (int)(160), (int)(20.8), (int)(160), CORNER_RIGHT_LOWER);
                              gTradePannelObj.RLBL_BorderR.GDS.Set_Chart_6();
                              gTradePannelObj.RLBL_BorderR.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "gTradePannelObj.RLBL_BorderR");
                              gTradePannelObj.RLBL_BorderR.Action(gTradePannelObj.RLBL_BorderR);//
                              //0// gTradePannelObj.RLBL_BorderR.Create(Is_Create, Is_Move, "RLBL_BorderR", "BorderR",
                              //0// (int)(20.8), (int)(160), (int)(20.8), (int)(160), CORNER_RIGHT_LOWER, ANCHOR_UPPER,
                              //0// false, BORDER_FLAT, clrRed, COLOR_BORDER,               0, STYLE_SOLID, 1, 8, "Arial");
                    }//
                    //--off--- PanelBorderL.Create(Is_Create,"PanelBorderL", "BorderL",          (int)(260, 160), (int)(13),(int)( 160),20,                              CORNER_RIGHT_LOWER, ANCHOR_UPPER, false, BORDER_FLAT, clrOrange, COLOR_BORDER,                   0, STYLE_SOLID, 1, 8, "Arial");
                    //////---------------------------------------------//////---------------------------------------------//////---------------------------------------------//////---------------------------------------------//////---------------------------------------------//////---------------------------------------------
                    ////--- Generic LBL_CLOSE ---//
                    {         gTradePannelObj.LBL_CLOSE.GDS.Set_Action_2(WhichMode, IsKey);  if(CloseMode < 0) {CloseMode = 0;}//Reset // Alert((string)CloseMode);
                              gTradePannelObj.LBL_CLOSE.GDS.Set_Desc_4("gTradePannelObj.LabelClose¹²³", CloseArr[CloseMode], "Arial", 6);
                              gTradePannelObj.LBL_CLOSE.GDS.Set_Color_1(COLOR_FONT = clrWhite);
                              gTradePannelObj.LBL_CLOSE.GDS.Set_Location_5((int)(39), (int)(167.2), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_CLOSE.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gTradePannelObj.LBL_CLOSE");
                              gTradePannelObj.LBL_CLOSE.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_CLOSE.Action(gTradePannelObj.LBL_CLOSE);//
                              //0// gTradePannelObj.LBL_CLOSE.Create(Is_Create, Is_Move, "LabelClose¹²³",  CloseArr[CloseMode],
                              //0// (int)(39), (int)(167.2), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,  COLOR_FONT = clrWhite, 0, 6, "Arial");
                    }
                    ////--- Generic LBL_WorldLogo ---//
                    {         gTradePannelObj.LBL_WorldLogo.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_WorldLogo.GDS.Set_Desc_4("LBL_WorldLogo", "\xfb ", "Webdings", 35);
                              gTradePannelObj.LBL_WorldLogo.GDS.Set_Color_1(clrMidnightBlue);
                              gTradePannelObj.LBL_WorldLogo.GDS.Set_Location_5((int)(208) - 20,   (int)(136), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_WorldLogo.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_WorldLogo");
                              gTradePannelObj.LBL_WorldLogo.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_WorldLogo.Action(gTradePannelObj.LBL_WorldLogo);//
                              //0// gTradePannelObj.LBL_WorldLogo.Create(Is_Create, Is_Move, "LBL_WorldLogo", "\xfb ",
                              //0// (int)(208) - 20, (int)(136), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrBlue, 0, 35, "Webdings"); .W E B D I N G S.
                    }
                    ////--- Generic LBL_ConnectionPing ---//
                    {         //---error--CObject passer = (CObject)LBL_ConnectionPing; //---cannot cast 'Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_LABEL,CChartObjectLabel,Cg_TextsLabel>' to 'CObject'   pTradePanel.mqh
                              //---error--CObject *passer = dynamic_cast< Cg_GenericChartObj_API_MYs_MQLo_MYi< Sg_LABEL,  CChartObjectLabel,  Cg_TextsLabel> *> (&LBL_ConnectionPing);//-- '=' - type mismatch
                              //---error--CObject  passer = dynamic_cast< Cg_GenericChartObj_API_MYs_MQLo_MYi< Sg_LABEL,  CChartObjectLabel, Cg_TextsLabel> *> (&LBL_ConnectionPing); 'dynamic_cast' - parameter conversion not allowed
                              //---error--CObject *passer =  (CObject)LBL_ConnectionPing ; ///---generic not alowed converting//'poly morphic oop'
                              gTradePannelObj.LBL_ConnectionPing.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_ConnectionPing.GDS.Set_Desc_4("LBL_ConnectionPing", "+", "Tahoma", 15); ///---Tahoma "\xfb
                              gTradePannelObj.LBL_ConnectionPing.GDS.Set_Color_1(clrYellowGreen);
                              gTradePannelObj.LBL_ConnectionPing.GDS.Set_Location_5((int)(215.8) - 20, (int)(120), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_ConnectionPing.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_ConnectionPing");
                              gTradePannelObj.LBL_ConnectionPing.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_ConnectionPing.Action(gTradePannelObj.LBL_ConnectionPing);//
                              //0// gTradePannelObj.LBL_ConnectionPing.Create(Is_Create, Is_Move, "LBL_ConnectionPing", "\xfb ",
                              //0// (int)(215.8) - 20, (int)(120), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrYellowGreen, 0, 15, "Tahoma"); .C A L I B R I.
                    }
                    ////--- Generic LBL_GMT ---//
                    {         gTradePannelObj.LBL_GMT.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_GMT.GDS.Set_Desc_4("LBL_GMT", "©", "Tahoma", 10);
                              gTradePannelObj.LBL_GMT.GDS.Set_Color_1(clrRed);
                              gTradePannelObj.LBL_GMT.GDS.Set_Location_5((int)(119.6) - 20, 128, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_GMT.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_GMT");
                              gTradePannelObj.LBL_GMT.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_GMT.Action(gTradePannelObj.LBL_GMT);//
                              //0// gTradePannelObj.LBL_GMT.Create(Is_Create, Is_Move, "LBL_GMT", "¤",
                              //0// (int)(119.6) - 20, (int)(128), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrRed, 0, 20, "Tahoma");
                    }
                    ////--- Generic LBL_WorldLogoSydney ---//
                    {         gTradePannelObj.LBL_WorldLogoSydney.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_WorldLogoSydney.GDS.Set_Desc_4("LBL_WorldLogoSydney", "¤", "Wingdings", 5);
                              gTradePannelObj.LBL_WorldLogoSydney.GDS.Set_Color_1(clrRed);
                              gTradePannelObj.LBL_WorldLogoSydney.GDS.Set_Location_5((int)(192.4) - 20, (int)(131.2), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_WorldLogoSydney.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_WorldLogoSydney");
                              gTradePannelObj.LBL_WorldLogoSydney.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_WorldLogoSydney.Action(gTradePannelObj.LBL_WorldLogoSydney);//
                              //0// gTradePannelObj.LBL_WorldLogoSydney.Create(Is_Create, Is_Move, "LBL_WorldLogoSydney", "¤",
                              //0// (int)(192.4) - 20, (int)(131.2), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrRed, 0, 5, "Wingdings"); .W I N G D I N G S.
                    }
                    ////--- Generic LBL_WorldLogoTokyo ---//
                    {         gTradePannelObj.LBL_WorldLogoTokyo.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_WorldLogoTokyo.GDS.Set_Desc_4("LBL_WorldLogoTokyo", "¤", "Wingdings", 5);
                              gTradePannelObj.LBL_WorldLogoTokyo.GDS.Set_Color_1(clrRed);
                              gTradePannelObj.LBL_WorldLogoTokyo.GDS.Set_Location_5((int)(197.6) - 20, (int)(142.4), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_WorldLogoTokyo.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_WorldLogoTokyo");
                              gTradePannelObj.LBL_WorldLogoTokyo.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_WorldLogoTokyo.Action(gTradePannelObj.LBL_WorldLogoTokyo);//
                              //0// gTradePannelObj.LBL_WorldLogoTokyo.Create(Is_Create, Is_Move, "LBL_WorldLogoTokyo", "¤",
                              //0// (int)(197.6) - 20, (int)(142.4), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrRed, 0, 5, "Wingdings"); .W I N G D I N G S.
                    }
                    ////--- Generic LBL_WorldLogoLondon ---//
                    {         gTradePannelObj.LBL_WorldLogoLondon.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_WorldLogoLondon.GDS.Set_Desc_4("LBL_WorldLogoLondon", "¤", "Wingdings", 5);
                              gTradePannelObj.LBL_WorldLogoLondon.GDS.Set_Color_1(clrRed);
                              gTradePannelObj.LBL_WorldLogoLondon.GDS.Set_Location_5((int)(215.8) - 20, (int)(144), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_WorldLogoLondon.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_WorldLogoLondon");
                              gTradePannelObj.LBL_WorldLogoLondon.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_WorldLogoLondon.Action(gTradePannelObj.LBL_WorldLogoLondon);//
                              //0// gTradePannelObj.LBL_WorldLogoLondon.Create(Is_Create, Is_Move, "LBL_WorldLogoLondon", "¤",
                              //0// (int)(215.8) - 20, (int)(144), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrRed, 0, 5, "Wingdings");
                    }
                    ////--- Generic LBL_WorldLogoNewyork ---//
                    {         gTradePannelObj.LBL_WorldLogoNewyork.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_WorldLogoNewyork.GDS.Set_Desc_4("LBL_WorldLogoNewyork", "¤", "Wingdings", 5);
                              gTradePannelObj.LBL_WorldLogoNewyork.GDS.Set_Color_1(clrRed);
                              gTradePannelObj.LBL_WorldLogoNewyork.GDS.Set_Location_5((int)(231.4) - 20, (int)(140.8), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_WorldLogoNewyork.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_WorldLogoNewyork");
                              gTradePannelObj.LBL_WorldLogoNewyork.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_WorldLogoNewyork.Action(gTradePannelObj.LBL_WorldLogoNewyork);//
                              //0// gTradePannelObj.LBL_WorldLogoNewyork.Create(Is_Create, Is_Move, "LBL_WorldLogoNewyork", "¤",
                              //0// (int)(231.4) - 20, (int)(140.8), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrRed, 0, 5, "Wingdings");
                    }
                    ////--- Generic LBL_Caption ---//
                    {         gTradePannelObj.LBL_Caption.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Caption.GDS.Set_Desc_4("LBL_Caption", "Watcher", "Impact", 15);
                              gTradePannelObj.LBL_Caption.GDS.Set_Color_1(clrRed);
                              gTradePannelObj.LBL_Caption.GDS.Set_Location_5((int)(130) - 30,   147, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Caption.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Caption");
                              gTradePannelObj.LBL_Caption.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Caption.Action(gTradePannelObj.LBL_Caption);//
                              //0// gTradePannelObj.LBL_Caption.Create(Is_Create, Is_Move, "LBL_Caption", "Watcher",
                              //0// (int)(130) - 30,   (int)(142.4), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrRed, 0, 15, "Aeromono");Tahoma
                    }
                    ////--- Generic LBL_Timer ---//
                    {         gTradePannelObj.LBL_Timer.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Timer.GDS.Set_Desc_4("LBL_Timer", "", "Tahoma", 10);
                              gTradePannelObj.LBL_Timer.GDS.Set_Color_1(clrGreen);
                              gTradePannelObj.LBL_Timer.GDS.Set_Location_5((int)(104), (int)(116.8), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Timer.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Timer");
                              gTradePannelObj.LBL_Timer.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Timer.Action(gTradePannelObj.LBL_Timer);//
                              //0// gTradePannelObj.LBL_Timer.Create(Is_Create, Is_Move, "LBL_Timer", "",
                              //0// (int)(104), (int)(116.8), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,   clrGreen, 0, 10, "Tahoma");  //Tahoma
                    }
                    //=======================================
                    //--off--- gTradePannelObj.LBL_TF_M1.Create(Is_Create , Is_Move ,"LBL_TF_M1", "M1",                                  (int)(39), (int)(120),                                                        CORNER_RIGHT_LOWER, ANCHOR_LEFT, false, clrBlue, 0, 7, "Tahoma");
                    //--off--- LBL_TF_M5.Create(Is_Create , Is_Move ,"LBL_TF_M5", "M5",                                  (int)(39), (int)(108.8),                                                        CORNER_RIGHT_LOWER, ANCHOR_LEFT, false, clrBlue, 0, 7, "Tahoma");
                    //--off--- LBL_TF_M15.Create(Is_Create , Is_Move ,"LBL_TF_M15", "M15",                               (int)(39), (int)(97.6),                                                        CORNER_RIGHT_LOWER, ANCHOR_LEFT, false, clrBlue, 0, 7, "Tahoma");
                    //--off--- LBL_TF_M30.Create(Is_Create , Is_Move ,"LBL_TF_M30", "M30",                               (int)(39), (int)(86.4),                                                        CORNER_RIGHT_LOWER, ANCHOR_LEFT, false, clrBlue, 0, 7, "Tahoma");
                    //--off--- LBL_TF_H1.Create(Is_Create , Is_Move ,"LBL_TF_H1", "H1",                                  (int)(39), (int)(75.2),                                                        CORNER_RIGHT_LOWER, ANCHOR_LEFT, false, clrBlue, 0, 7, "Tahoma");
                    //--off--- LBL_TF_H4.Create(Is_Create , Is_Move ,"LBL_TF_H4", "H4",                                  (int)(39), (int)(64),                                                        CORNER_RIGHT_LOWER, ANCHOR_LEFT, false, clrBlue, 0, 7, "Tahoma");
                    //--off--- LabelTF_W1.Create(Is_Create , Is_Move ,"LabelTF_W1", "W1",                                  (int)(39), (int)(52.8),                                                        CORNER_RIGHT_LOWER, ANCHOR_LEFT, false, clrBlue, 0, 7, "Tahoma");
                    //--off--- LBL_TF_MN.Create(Is_Create , Is_Move ,"LBL_TF_MN", "MN",                                  (int)(39), (int)(41.6),                                                        CORNER_RIGHT_LOWER, ANCHOR_LEFT, false, clrBlue, 0, 7, "Tahoma");
                    //=======================================
                    //--off--- KeyZoomIn, KeyZoomOut, KeyGrid, KeyThem,;
                    //--off--- KeyZoomIn.Create(Is_Create,"KeyZoomIn", "ZoomIn", 40 + 30 + 30, 110 + 30,                 BUTTON_WIDTH, BUTTON_HEIGHT,                                                                             CORNER_RIGHT_UPPER, ANCHOR_CENTER, false, BUTTON_COLOR, clrGray, clrGreen);
                    //--off--- KeyZoomOut.Create(Is_Create,"KeyZoomOut", "ZoomOut", 40 + 30 + 30, 110 + 30 + 20,         BUTTON_WIDTH, BUTTON_HEIGHT,                                                                             CORNER_RIGHT_UPPER, ANCHOR_CENTER, false, BUTTON_COLOR, clrGray, clrGreen);
                    //--off--- KeyGrid.Create(Is_Create,"KeyGrid", "Grid", 40 + 30 + 30, 110 + 30 + 20 + 20,             BUTTON_WIDTH, BUTTON_HEIGHT,                                                                             CORNER_RIGHT_UPPER, ANCHOR_CENTER, false, BUTTON_COLOR, clrGray, clrGreen);
                    //--off--- KeyThem.Create(Is_Create,"KeyThem", "Them", 40 + 30 + 30, 110 + 30 + 20 + 20 + 20,        BUTTON_WIDTH, BUTTON_HEIGHT,                                                                             CORNER_RIGHT_UPPER, ANCHOR_CENTER, false, BUTTON_COLOR, clrGray, clrGreen);
                    //=======================================
                    //====================================================================================================================//  C'59,41,40', clrGray,
                    ////--- Generic LBL_Exit ---//
                    {         gTradePannelObj.LBL_Exit.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Exit.GDS.Set_Desc_4("LBL_Exit", "r", "Webdings", 13);
                              gTradePannelObj.LBL_Exit.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Exit.GDS.Set_Location_5((int)(10.4), (int)(9.6), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Exit.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Exit");
                              gTradePannelObj.LBL_Exit.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Exit.Action(gTradePannelObj.LBL_Exit);//
                              //0//gTradePannelObj.LBL_Exit.Create(Is_Create, Is_Move, "LBL_Exit", "r",
                              //0// (int)(10.4), (int)(9.6), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,  clrWhite, 0, 13, "Webdings");
                    }
                    ////--- Generic LBL_Connection ---//
                    {         gTradePannelObj.LBL_Connection.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Connection.GDS.Set_Desc_4("LBL_Connection", "ü", "Webdings", 10);
                              gTradePannelObj.LBL_Connection.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Connection.GDS.Set_Location_5((int)(10.4), (int)(28.8), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Connection.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Connection");
                              gTradePannelObj.LBL_Connection.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Connection.Action(gTradePannelObj.LBL_Connection);//
                              //0//gTradePannelObj.LBL_Connection.Create(Is_Create, Is_Move, "LBL_Connection", "ü",
                              //0// (int)(10.4), (int)(28.8), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,  clrWhite, 0, 10, "Webdings");
                    }
                    ////--- Generic LBL_Candels ---//
                    {         gTradePannelObj.LBL_Candels.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Candels.GDS.Set_Desc_4("LBL_Candels", "ß", "Webdings", 15);
                              gTradePannelObj.LBL_Candels.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Candels.GDS.Set_Location_5( (int)(10.4), (int)(48), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Candels.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Candels");
                              gTradePannelObj.LBL_Candels.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Candels.Action(gTradePannelObj.LBL_Candels);//
                              //0//gTradePannelObj.LBL_Candels.Create(Is_Create, Is_Move, "LBL_Candels", "ß",
                              //0// (int)(10.4), (int)(48), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,   clrWhite, 0, 15, "Webdings");
                    }
                    ////--- Generic LBL_Theme ---//
                    {         gTradePannelObj.LBL_Theme.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Theme.GDS.Set_Desc_4("LBL_Theme", "N", "Webdings", 15);
                              gTradePannelObj.LBL_Theme.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Theme.GDS.Set_Location_5((int)(10.4), (int)(64), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Theme.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Theme");
                              gTradePannelObj.LBL_Theme.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Theme.Action(gTradePannelObj.LBL_Theme);//
                              //0//gTradePannelObj.LBL_Theme.Create(Is_Create, Is_Move, "LBL_Theme", "N",
                              //0//(int)(10.4), (int)(64), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 15, "Webdings");
                    }
                    ////--- Generic LBL_Paint ---//
                    {         gTradePannelObj.LBL_Paint.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Paint.GDS.Set_Desc_4("LBL_Paint", "!", "Wingdings", 15);
                              gTradePannelObj.LBL_Paint.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Paint.GDS.Set_Location_5( (int)(10.4), (int)(80), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Paint.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Paint");
                              gTradePannelObj.LBL_Paint.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Paint.Action(gTradePannelObj.LBL_Paint);//
                              //0//gTradePannelObj.LBL_Paint.Create(Is_Create, Is_Move, "LBL_Paint", "!",
                              //0// (int)(10.4), (int)(80), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 15, "Wingdings");
                    }
                    ////--- Generic LBL_Play ---//
                    {         gTradePannelObj.LBL_Play.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Play.GDS.Set_Desc_4("LBL_Play", "4", "Webdings", 15);
                              gTradePannelObj.LBL_Play.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Play.GDS.Set_Location_5((int)(10.4), (int)(96), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Play.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Play");
                              gTradePannelObj.LBL_Play.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Play.Action(gTradePannelObj.LBL_Play);//
                              //0//gTradePannelObj.LBL_Play.Create(Is_Create, Is_Move, "LBL_Play", "4",
                              //0//(int)(10.4), (int)(96), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 15, "Webdings");
                    }
                    ////--- Generic LBL_Sound ---//
                    {         gTradePannelObj.LBL_Sound.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Sound.GDS.Set_Desc_4("LBL_Sound", "X", "Webdings", 10);
                              gTradePannelObj.LBL_Sound.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Sound.GDS.Set_Location_5((int)(13),   (int)(112), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Sound.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Sound");
                              gTradePannelObj.LBL_Sound.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Sound.Action(gTradePannelObj.LBL_Sound);//
                              //0//gTradePannelObj.LBL_Sound.Create(Is_Create, Is_Move, "LBL_Sound", "X",
                              //0// (int)(13), (int)(112), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 10, "Webdings");
                    }
                    ////--- Generic LBL_SoundIO ---//
                    {         gTradePannelObj.LBL_SoundIO.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_SoundIO.GDS.Set_Desc_4("LBL_SoundIO", "ð", "Webdings", 10);
                              gTradePannelObj.LBL_SoundIO.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_SoundIO.GDS.Set_Location_5((int)(3.9), (int)(112), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_SoundIO.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_SoundIO");
                              gTradePannelObj.LBL_SoundIO.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_SoundIO.Action(gTradePannelObj.LBL_SoundIO);//
                              //0//gTradePannelObj.LBL_SoundIO.Create(Is_Create, Is_Move, "LBL_SoundIO", "ð",
                              //0// (int)(3.9),  (int)(112), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 10, "Webdings");
                    }
                    ////--- Generic LBL_Shift ---//
                    {         gTradePannelObj.LBL_Shift.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Shift.GDS.Set_Desc_4("LBL_Shift", ":", "Webdings", 12);
                              gTradePannelObj.LBL_Shift.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Shift.GDS.Set_Location_5( (int)(10.4), (int)(136), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Shift.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Shift");
                              gTradePannelObj.LBL_Shift.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Shift.Action(gTradePannelObj.LBL_Shift);//
                              //0// gTradePannelObj.LBL_Shift.Create(Is_Create, Is_Move, "LBL_Shift", ":",
                              //0// (int)(10.4), (int)(136), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 12, "Webdings");
                    }
                    ////--- Generic LBL_Maximize ---//
                    {         gTradePannelObj.LBL_Maximize.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Maximize.GDS.Set_Desc_4("LBL_Maximize", "1", "Webdings", 12);
                              gTradePannelObj.LBL_Maximize.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Maximize.GDS.Set_Location_5( (int)(10.4), (int)(153.6), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Maximize.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Maximize");
                              gTradePannelObj.LBL_Maximize.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Maximize.Action(gTradePannelObj.LBL_Maximize);//
                              //0// gTradePannelObj.LBL_Maximize.Create(Is_Create, Is_Move, "LBL_Maximize", "1",
                              //0// (int)(10.4), (int)(153.6), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 12, "Webdings");
                    }
                    ////==========\\\\\\\\
                    ////--- Generic LBL_PeriodSeptor ---//
                    {         gTradePannelObj.LBL_PeriodSeptor.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_PeriodSeptor.GDS.Set_Desc_4("LBL_PeriodSeptor", "´", "Webdings", 12);
                              gTradePannelObj.LBL_PeriodSeptor.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_PeriodSeptor.GDS.Set_Location_5((int)(80.6),  (int)(167.2), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_PeriodSeptor.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_PeriodSeptor");
                              gTradePannelObj.LBL_PeriodSeptor.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_PeriodSeptor.Action(gTradePannelObj.LBL_PeriodSeptor);//
                              //0// gTradePannelObj.LBL_PeriodSeptor.Create(Is_Create, Is_Move, "LBL_PeriodSeptor", "´",
                              //0// (int)(80.6),  (int)(167.2), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 12, "Webdings");
                    }
                    ////--- Generic LBL_AutoTrading ---//
                    {         gTradePannelObj.LBL_AutoTrading.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_AutoTrading.GDS.Set_Desc_4("LBL_AutoTrading", "~", "Webdings", 12);
                              gTradePannelObj.LBL_AutoTrading.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_AutoTrading.GDS.Set_Location_5((int)(98.8), (int)(167.68), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_AutoTrading.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_AutoTrading");
                              gTradePannelObj.LBL_AutoTrading.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_AutoTrading.Action(gTradePannelObj.LBL_AutoTrading);//
                              //0// gTradePannelObj.LBL_AutoTrading.Create(Is_Create, Is_Move, "LBL_AutoTrading", "~",
                              //0// (int)(98.8), (int)(167.68), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 12, "Webdings");
                    }
                    ////--- Generic LBL_Navigator ---//
                    {         gTradePannelObj.LBL_Navigator.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Navigator.GDS.Set_Desc_4("LBL_Navigator", "À", "Webdings", 12);
                              gTradePannelObj.LBL_Navigator.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Navigator.GDS.Set_Location_5((int)(117), (int)(167.68), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Navigator.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Navigator");
                              gTradePannelObj.LBL_Navigator.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Navigator.Action(gTradePannelObj.LBL_Navigator);//
                              //0// gTradePannelObj.LBL_Navigator.Create(Is_Create, Is_Move, "LBL_Navigator", "À",
                              //0// (int)(117), (int)(167.68), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 12, "Webdings");
                    }
                    ////--- Generic LBL_Indiators ---//
                    {         gTradePannelObj.LBL_Indiators.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Indiators.GDS.Set_Desc_4("LBL_Indiators", "¤", "Webdings", 12);
                              gTradePannelObj.LBL_Indiators.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Indiators.GDS.Set_Location_5((int)(137.8), (int)(167.68), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Indiators.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Indiators");
                              gTradePannelObj.LBL_Indiators.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Indiators.Action(gTradePannelObj.LBL_Indiators);//
                              //0// gTradePannelObj.LBL_Indiators.Create(Is_Create, Is_Move, "LBL_Indiators", "¤",
                              //0// (int)(137.8), (int)(167.68), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 12, "Webdings");
                    }
                    ////--- Generic LBL_Volume ---//
                    {         gTradePannelObj.LBL_Volume.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Volume.GDS.Set_Desc_4("LBL_Volume", "Ø", "Webdings", 10);
                              gTradePannelObj.LBL_Volume.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Volume.GDS.Set_Location_5((int)(156),   (int)(167.68), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Volume.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Volume");
                              gTradePannelObj.LBL_Volume.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Volume.Action(gTradePannelObj.LBL_Volume);//
                              //0// gTradePannelObj.LBL_Volume.Create(Is_Create, Is_Move, "LBL_Volume", "",
                              //0// (int)(156),   (int)(167.68), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 10, "Webdings");
                    }
                    ////--- Generic LBL_ZoomIn ---//
                    {         gTradePannelObj.LBL_ZoomIn.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_ZoomIn.GDS.Set_Desc_4("LBL_ZoomIn", "Ò", "Webdings", 10);
                              gTradePannelObj.LBL_ZoomIn.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_ZoomIn.GDS.Set_Location_5((int)(176.8), (int)(167.68), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_ZoomIn.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_ZoomIn");
                              gTradePannelObj.LBL_ZoomIn.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_ZoomIn.Action(gTradePannelObj.LBL_ZoomIn);//
                              //0// gTradePannelObj.LBL_ZoomIn.Create(Is_Create, Is_Move, "LBL_ZoomIn", "Ò",
                              //0// (int)(176.8), (int)(167.68), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 10, "Webdings");
                    }
                    ////--- Generic LBL_ZoomOut ---//
                    {         gTradePannelObj.LBL_ZoomOut.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_ZoomOut.GDS.Set_Desc_4("LBL_ZoomOut", "Ó", "Webdings", 10);
                              gTradePannelObj.LBL_ZoomOut.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_ZoomOut.GDS.Set_Location_5((int)(195),   (int)(167.68), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_ZoomOut.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_ZoomOut");
                              gTradePannelObj.LBL_ZoomOut.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_ZoomOut.Action(gTradePannelObj.LBL_ZoomOut);//
                              //0// gTradePannelObj.LBL_ZoomOut.Create(Is_Create, Is_Move, "LBL_ZoomOut", "Ó",
                              //0// (int)(195),   (int)(167.68),        CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 10, "Webdings");
                    }
                    ////--- Generic LBL_Grid ---//
                    {         gTradePannelObj.LBL_Grid.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Grid.GDS.Set_Desc_4("LBL_Grid", "", "Webdings", 10);
                              gTradePannelObj.LBL_Grid.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Grid.GDS.Set_Location_5((int)(215.8), (int)(167.68), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Grid.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Grid");
                              gTradePannelObj.LBL_Grid.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Grid.Action(gTradePannelObj.LBL_Grid);//
                              //0// gTradePannelObj.LBL_Grid.Create(Is_Create, Is_Move, "LBL_Grid", "",
                              //0// (int)(215.8), (int)(167.68), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 10, "Webdings");
                    }
                    ////--- Generic LBL_Them ---//
                    {         gTradePannelObj.LBL_Them.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Them.GDS.Set_Desc_4("LBL_Them", "q", "Webdings", 10);
                              gTradePannelObj.LBL_Them.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_Them.GDS.Set_Location_5( (int)(234), (int)(167.68), 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Them.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Them");
                              gTradePannelObj.LBL_Them.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Them.Action(gTradePannelObj.LBL_Them);//
                              //0// gTradePannelObj.LBL_Them.Create(Is_Create, Is_Move, "LBL_Them", "q",
                              //0// (int)(234), (int)(167.68), CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 10, "Webdings");
                    }
                    //==========================================================
                    //==========================================================gFlowPad
                    //--off--PadFlowOBJ.BTN_PadFlowMover.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_PadFlowMover", "¥",             (int)(26019), (int)(176),    PANEL_BUTTON2_WIDTH / 2 - 10,   PANEL_BUTTON2_HEIGHT + 3 - 5,                CORNER_RIGHT_LOWER, ANCHOR_RIGHT, false, COLOR_MOVE = clrRed, clrRed, COLOR_FONT = clrWhite, 0, 10, "Wingdings");
                    ///[onPad] line 213 ///
                    ////---Generic BTN_RESET---//
                    {         gTradePannelObj.BTN_RESET.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gTradePannelObj.BTN_RESET.GDS.Set_Desc_4("BTN_RESET", "ó", "Wingdings", 10);
                              gTradePannelObj.BTN_RESET.GDS.Set_Self_1(ButtonDEF_state);
                              gTradePannelObj.BTN_RESET.GDS.Set_Location_5(263, 176, PANEL_BUTTON2_WIDTH / 2 - 10,   PANEL_BUTTON2_HEIGHT + 3 - 5, CORNER_RIGHT_LOWER);
                              gTradePannelObj.BTN_RESET.GDS.Set_Color_3(clrViolet, clrViolet, clrWhite);
                              gTradePannelObj.BTN_RESET.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "TradePanel.BTN_CommentPannel");
                              gTradePannelObj.BTN_RESET.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
                              gTradePannelObj.BTN_RESET.Action(gTradePannelObj.BTN_RESET);//
                              //0// gTradePannelObj.BTN_RESET.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_RESET", "ó",
                              //0// (int)(283.4), (int)(176), PANEL_BUTTON2_WIDTH / 2 - 10,   PANEL_BUTTON2_HEIGHT + 3 - 5, CORNER_RIGHT_LOWER, ANCHOR_CENTER,
                              //0// false, clrViolet, clrViolet, clrWhite, 0, 10, "Wingdings");
                              //
                    }
                    //====================
                    ////--- Generic LBL_Triangel ---//
                    {         gTradePannelObj.LBL_Triangel.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Triangel.GDS.Set_Desc_4("LBL_Triangel", "ê", "Webdings", 10);
                              gTradePannelObj.LBL_Triangel.GDS.Set_Color_1(clrRed);
                              gTradePannelObj.LBL_Triangel.GDS.Set_Location_5(239, 32, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Triangel.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Triangel");
                              gTradePannelObj.LBL_Triangel.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Triangel.Action(gTradePannelObj.LBL_Triangel);//
                              //0// gTradePannelObj.LBL_Triangel.Create(Is_Create, Is_Move, "LBL_Triangel", "ê",  (int)(239.2), (int)(32),
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrRed, 0, 10, "Webdings");
                    }
                    //---
                    //---
                    //---
                    //=====================//----sell buy hedge.
                    ////--- Generic LBL_FLOATz ---//logo
                    {         gTradePannelObj.LBL_FLOATz.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_FLOATz.GDS.Set_Desc_4("LBL_FLOATz", "l", "Wingdings", 15);
                              gTradePannelObj.LBL_FLOATz.GDS.Set_Color_1(clrBlue);
                              gTradePannelObj.LBL_FLOATz.GDS.Set_Location_5(221 + XBoxOne + XBoxTwo,   40 + YBoxOne + YBoxTwo + Y_Cordinate,  0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_FLOATz.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_FLOATz");
                              gTradePannelObj.LBL_FLOATz.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_FLOATz.Action(gTradePannelObj.LBL_FLOATz);//
                              //0// gTradePannelObj.LBL_FLOATz.Create(Is_Create, Is_Move, "LabelFLOAT", "logo",
                              //0// (int)(221) + XBoxOne + XBoxTwo, (int)(40) + YBoxOne + YBoxTwo + Y_Cordinate,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,  clrBlue, 0, 15, "Wingdings");
                    }
                    ////--- Generic LBL_FLOATa ---//
                    {         gTradePannelObj.LBL_FLOATa.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_FLOATa.GDS.Set_Desc_4("LabelFLOAT§", "text", "Tahoma", 10);///Tahoma ///Tahoma
                              gTradePannelObj.LBL_FLOATa.GDS.Set_Color_1(clrBlue);
                              gTradePannelObj.LBL_FLOATa.GDS.Set_Location_5(160 + XBoxOne + XBoxTwo,    40 + YBoxOne + YBoxTwo + Y_Cordinate,  0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_FLOATa.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LabelFLOAT§");
                              gTradePannelObj.LBL_FLOATa.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_FLOATa.Action(gTradePannelObj.LBL_FLOATa);//
                              //0// gTradePannelObj.LBL_FLOATa.Create(Is_Create, Is_Move, "LabelFLOAT§", "text",
                              //0// (int)(195) + XBoxOne + XBoxTwo, (int)(40) + YBoxOne + YBoxTwo + Y_Cordinate,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,  clrBlue, 0, 10, "Tahoma");
                    }
                    ////--- Generic LBL_FLOATb ---//
                    {         gTradePannelObj.LBL_FLOATb.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_FLOATb.GDS.Set_Desc_4("LabelFLOAT$", "price", "Tahoma", 10);  //--Comic Sans MS
                              gTradePannelObj.LBL_FLOATb.GDS.Set_Color_1(clrBlue);
                              gTradePannelObj.LBL_FLOATb.GDS.Set_Location_5(90 + XBoxOne + XBoxTwo + 40,     40 + YBoxOne + YBoxTwo + Y_Cordinate, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_FLOATb.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LabelFLOAT$");
                              gTradePannelObj.LBL_FLOATb.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_FLOATb.Action(gTradePannelObj.LBL_FLOATb);//
                              //0// gTradePannelObj.LBL_FLOATb.Create(Is_Create, Is_Move, "LabelFLOAT$", "price",
                              //0// (int)(143) + XBoxOne + XBoxTwo, (int)(40) + YBoxOne + YBoxTwo + Y_Cordinate,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,  clrBlue, 0, 10, "Tahoma");
                    }
                    ////--- Generic LBL_ROI ---//
                    {         gTradePannelObj.LBL_ROI.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_ROI.GDS.Set_Desc_4("LBL_ROI", "Today", "Tahoma", 10);
                              gTradePannelObj.LBL_ROI.GDS.Set_Color_1(clrBlue);
                              gTradePannelObj.LBL_ROI.GDS.Set_Location_5(194 + XBoxOne + XBoxTwo,         40 + YBoxOne + YBoxTwo + Y_Cordinate, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_ROI.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_ROI");
                              gTradePannelObj.LBL_ROI.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_ROI.Action(gTradePannelObj.LBL_ROI);//
                              //0// gTradePannelObj.LBL_ROI.Create(Is_Create, Is_Move, "LBL_ROI", "Today",
                              //0// (int)(234) + XBoxOne + XBoxTwo, (int)(40) + YBoxOne + YBoxTwo + Y_Cordinate,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,  clrBlue, 0, 10, "Tahoma");
                    }
                    ////--- Generic LBL_ROIa ---//
                    {         gTradePannelObj.LBL_ROIa.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_ROIa.GDS.Set_Desc_4("LBL_ROIa", "P", "Wingdings", 15);
                              gTradePannelObj.LBL_ROIa.GDS.Set_Color_1(clrBlue);
                              gTradePannelObj.LBL_ROIa.GDS.Set_Location_5(195 + XBoxOne + XBoxTwo + 50,        40 + YBoxOne + YBoxTwo + Y_Cordinate, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_ROIa.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_ROIa");
                              gTradePannelObj.LBL_ROIa.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_ROIa.Action(gTradePannelObj.LBL_ROIa);//
                              //0// gTradePannelObj.LBL_ROIa.Create(Is_Create, Is_Move, "LBL_ROI§", "P",
                              //0// (int)(195) + XBoxOne + XBoxTwo, (int)(40) + YBoxOne + YBoxTwo + Y_Cordinate,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,  clrBlue, 0, 15, "Wingdings");
                    }
                    ////--- Generic LBL_ROI2 ---//
                    {         gTradePannelObj.LBL_ROI2.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_ROI2.GDS.Set_Desc_4("LBL_ROI2", "-DD-", "Tahoma", 10);
                              gTradePannelObj.LBL_ROI2.GDS.Set_Color_1(clrBlue);
                              gTradePannelObj.LBL_ROI2.GDS.Set_Location_5(130 + XBoxOne + XBoxTwo,       40 + YBoxOne + YBoxTwo + Y_Cordinate, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_ROI2.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_ROI2");
                              gTradePannelObj.LBL_ROI2.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_ROI2.Action(gTradePannelObj.LBL_ROI2);//
                              //0// gTradePannelObj.LBL_ROI2.Create(Is_Create, Is_Move, "LBL_ROI%", "-DD-",
                              //0// (int)(143) + XBoxOne + XBoxTwo, (int)(40) + YBoxOne + YBoxTwo + Y_Cordinate,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,  clrBlue, 0, 10, "Tahoma");  //
                    }
                    ////--- Generic LBL_PROFITS ---//
                    {         gTradePannelObj.LBL_PROFITS.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_PROFITS.GDS.Set_Desc_4("LBL_PROFITS", "-DD-", "Tahoma", 10);
                              gTradePannelObj.LBL_PROFITS.GDS.Set_Color_1(clrBlue);
                              gTradePannelObj.LBL_PROFITS.GDS.Set_Location_5(86 + XBoxOne + XBoxTwo,      40 + YBoxOne + YBoxTwo + Y_Cordinate, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_PROFITS.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_PROFITS");
                              gTradePannelObj.LBL_PROFITS.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_PROFITS.Action(gTradePannelObj.LBL_PROFITS);//
                              //0// gTradePannelObj.LBL_PROFITS.Create(Is_Create, Is_Move, "LBL_PROFITS", "-DD-",
                              //0// (int)(85.8) + XBoxOne + XBoxTwo, (int)(40) + YBoxOne + YBoxTwo + Y_Cordinate,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,  clrBlue, 0, 10, "Tahoma");//--"Tahoma" ///tiwist.. boy...
                    }
                    ////--- Generic LBL_POINTS ---//
                    {         gTradePannelObj.LBL_POINTS.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_POINTS.GDS.Set_Desc_4("LBL_POINTS", "-DD-", "Tahoma", 10);
                              gTradePannelObj.LBL_POINTS.GDS.Set_Color_1(clrBlue);
                              gTradePannelObj.LBL_POINTS.GDS.Set_Location_5(51 + XBoxOne + XBoxTwo,       40 + YBoxOne + YBoxTwo + Y_Cordinate, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_POINTS.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_POINTS");
                              gTradePannelObj.LBL_POINTS.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_POINTS.Action(gTradePannelObj.LBL_POINTS);//
                              //0//gTradePannelObj.LBL_POINTS.Create(Is_Create, Is_Move, "LBL_POINTS", "-DD-",
                              //0// (int)(41.6) + XBoxOne + XBoxTwo, (int)(40) + YBoxOne + YBoxTwo + Y_Cordinate,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,  clrBlue, 0, 10, "Tahoma");
                    }
                    //========================================================//
                    //--
                    //--
                    //--
                    ////---Generic EDT_SL---//
                    {         gTradePannelObj.EDT_SL.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.EDT_SL.GDS.Set_Desc_4("EDT_SL", "", "Tahoma", 7);
                              gTradePannelObj.EDT_SL.GDS.Set_Self_2(ALIGN_CENTER, readonlyDEF);
                              gTradePannelObj.EDT_SL.GDS.Set_Location_5(104 + XBoxOne, 72 + YBoxOne + Y_Edite, PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT, CORNER_RIGHT_LOWER);
                              gTradePannelObj.EDT_SL.GDS.Set_Color_3(clrMidnightBlue, clrMidnightBlue, clrWhite);
                              gTradePannelObj.EDT_SL.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip + "EDT_SL");
                              gTradePannelObj.EDT_SL.GDS.Set_Chart_6();
                              gTradePannelObj.EDT_SL.Action(gTradePannelObj.EDT_SL);//
                              //0// gTradePannelObj.EDT_SL.Create(Is_Create, Is_Move, "EditeSL", DoubleToString(ct_Drive.TDD.ct_StopLoss.INP, 0),
                              //0// (int)(104) + XBoxOne, (int)(72) + YBoxOne + Y_Edite, PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT, CORNER_RIGHT_LOWER, ANCHOR_CENTER,
                              //0// false, STYLE_SOLID, 1, clrWhite, clrBlack,  C'59,41,40', 0, ALIGN_RIGHT, 7, "Tahoma");
                    }
                    ////--- Generic LBL_SL ---//
                    {         gTradePannelObj.LBL_SL.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_SL.GDS.Set_Desc_4("LBL_SL", "SL", "Arial", 7);
                              gTradePannelObj.LBL_SL.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_SL.GDS.Set_Location_5((int)(98.8) - 2 + XBoxOne, (int)(64) + YBoxOne + Y_Edite, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_SL.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_SL");
                              gTradePannelObj.LBL_SL.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_SL.Action(gTradePannelObj.LBL_SL);//
                              //0// gTradePannelObj.LBL_SL.Create(Is_Create, Is_Move, "LBL_SLª", "SL",
                              //0// (int)(98.8) - 2 + XBoxOne, (int)(64) + YBoxOne + Y_Edite,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrBlack, 0, 7, "Arial");
                    }
                    ////--- Generic LBL_ManualSLa ---//
                    {         gTradePannelObj.LBL_ManualSLa.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_ManualSLa.GDS.Set_Desc_4("LBL_ManualSLa", "Manual SL", "Arial bold", 7);
                              gTradePannelObj.LBL_ManualSLa.GDS.Set_Color_1(clrGray);
                              gTradePannelObj.LBL_ManualSLa.GDS.Set_Location_5((int)(98.8) - 2 + XBoxOne - 20, (int)(64) + YBoxOne + Y_Edite - 10, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_ManualSLa.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_ManualSLa");
                              gTradePannelObj.LBL_ManualSLa.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_ManualSLa.Action(gTradePannelObj.LBL_ManualSLa);//
                              //0// gTradePannelObj.LBL_ManualSLa.Create(Is_Create, Is_Move, "LBL_ManualSLa", "Manual SL",
                              //0// (int)(98.8) - 2 + XBoxOne - 20, (int)(64) + YBoxOne + Y_Edite - 10,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrGray, 0, 7, "Arial bold");
                    }
                    ////---Generic EDT_PutLots---//
                    {         gTradePannelObj.EDT_PutLots.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.EDT_PutLots.GDS.Set_Desc_4("EDT_PutLots", DoubleToString(ct_Drive.TDD.st_Size.INP, 2), "Tahoma", 7);
                              gTradePannelObj.EDT_PutLots.GDS.Set_Self_2(ALIGN_CENTER, readonlyDEF);
                              gTradePannelObj.EDT_PutLots.GDS.Set_Location_5(PANEL_EDIT_GAP_X + PANEL_EDIT_WIDTH + (int)(104) + XBoxOne, (int)(72) + YBoxOne + Y_Edite, PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT, CORNER_RIGHT_LOWER);
                              gTradePannelObj.EDT_PutLots.GDS.Set_Color_3(clrMidnightBlue, clrMidnightBlue, clrWhite);
                              gTradePannelObj.EDT_PutLots.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip + "EDT_SL");
                              gTradePannelObj.EDT_PutLots.GDS.Set_Chart_6();
                              gTradePannelObj.EDT_PutLots.Action(gTradePannelObj.EDT_PutLots);//
                              //0// gTradePannelObj.EDT_PutLots.Create(Is_Create, Is_Move, "EDT_PutLots", DoubleToString(ct_Drive.TDD.st_Size.INP, 2),
                              //0// PANEL_EDIT_GAP_X + PANEL_EDIT_WIDTH + (int)(104) + XBoxOne, (int)(72) + YBoxOne + Y_Edite, PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, STYLE_SOLID, 1, clrWhite, clrBlack,  C'59,41,40', 0,  ALIGN_CENTER, 7, "Tahoma");
                    }
                    ////--- Generic LBL_PutLotsUp ---//
                    {         gTradePannelObj.LBL_PutLotsUp.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_PutLotsUp.GDS.Set_Desc_4("LBL_PutLotsUp", "5", "Webdings", 10);
                              gTradePannelObj.LBL_PutLotsUp.GDS.Set_Color_1(clrMidnightBlue);
                              gTradePannelObj.LBL_PutLotsUp.GDS.Set_Location_5(PANEL_EDIT_GAP_X + PANEL_EDIT_WIDTH + 104  + XBoxOne - 46 - 5, 64  + YBoxOne + Y_Edite - 10, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_PutLotsUp.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_PutLotsUp");
                              gTradePannelObj.LBL_PutLotsUp.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_PutLotsUp.Action(gTradePannelObj.LBL_PutLotsUp);//
                              //0// gTradePannelObj.LBL_PutLotsUp.Create(Is_Create, Is_Move, "LBL_PutLotsUp", "5",
                              //0// PANEL_EDIT_GAP_X + PANEL_EDIT_WIDTH + (int)(104) + XBoxOne - 46, (int)(64) + YBoxOne + Y_Edite,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrBlack, 0, 10, "Webdings");
                    }
                    ////--- Generic LBL_PutLotsDown ---//
                    {         gTradePannelObj.LBL_PutLotsDown.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_PutLotsDown.GDS.Set_Desc_4("LBL_PutLotsDown", "6", "Webdings", 10);
                              gTradePannelObj.LBL_PutLotsDown.GDS.Set_Color_1(clrMidnightBlue);
                              gTradePannelObj.LBL_PutLotsDown.GDS.Set_Location_5(5 + PANEL_EDIT_GAP_X + PANEL_EDIT_WIDTH + 104 + XBoxOne - 12 + 5, 64 + YBoxOne + Y_Edite - 10, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_PutLotsDown.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_PutLotsDown");
                              gTradePannelObj.LBL_PutLotsDown.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_PutLotsDown.Action(gTradePannelObj.LBL_PutLotsDown);//
                              //0// gTradePannelObj.LBL_PutLotsDown.Create(Is_Create, Is_Move, "LBL_PutLotsDown", "6",
                              //0// 5 + PANEL_EDIT_GAP_X + PANEL_EDIT_WIDTH + (int)(104) + XBoxOne - 12, (int)(64) + YBoxOne + Y_Edite,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrBlack, 0, 10, "Webdings");
                    }
                    ////--- Generic LBL_ManualLot ---//
                    {         gTradePannelObj.LBL_ManualLot.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_ManualLot.GDS.Set_Desc_4("LBL_ManualLot", "ManualLot", "Arial bold", 6);
                              gTradePannelObj.LBL_ManualLot.GDS.Set_Color_1(clrGray);
                              gTradePannelObj.LBL_ManualLot.GDS.Set_Location_5(5 + PANEL_EDIT_GAP_X + PANEL_EDIT_WIDTH +     (int)(104) + XBoxOne - 32, (int)(64) + YBoxOne + Y_Edite - 10, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_ManualLot.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_ManualLot");
                              gTradePannelObj.LBL_ManualLot.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_ManualLot.Action(gTradePannelObj.LBL_ManualLot);//
                              //0// gTradePannelObj.LBL_ManualLot.Create(Is_Create, Is_Move, "LBL_ManualLot", "ManualLot",
                              //0// 5 + PANEL_EDIT_GAP_X + PANEL_EDIT_WIDTH +     (int)(104) + XBoxOne - 32, (int)(64) + YBoxOne + Y_Edite - 10,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrGray, 0, 7, "Arial bold");
                    }
                    ////---Generic EDT_TP---//
                    {         gTradePannelObj.EDT_TP.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.EDT_TP.GDS.Set_Desc_4("EDT_TP", DoubleToString(ct_Drive.TDD.ct_TakeProfit.INP_Pip, 0), "Tahoma", 7);
                              gTradePannelObj.EDT_TP.GDS.Set_Self_2(ALIGN_CENTER, readonlyDEF);
                              gTradePannelObj.EDT_TP.GDS.Set_Location_5(2 * PANEL_EDIT_GAP_X + 2 * PANEL_EDIT_WIDTH + (int)(104) + XBoxOne, (int)(72) + YBoxOne + Y_Edite, PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT, CORNER_RIGHT_LOWER);
                              gTradePannelObj.EDT_TP.GDS.Set_Color_3(clrMidnightBlue, clrMidnightBlue, clrWhite);
                              gTradePannelObj.EDT_TP.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip + "EDT_TP");
                              gTradePannelObj.EDT_TP.GDS.Set_Chart_6();
                              gTradePannelObj.EDT_TP.Action(gTradePannelObj.EDT_TP);//
                              //0// gTradePannelObj.EDT_TP.Create(Is_Create, Is_Move, "EDT_TP", DoubleToString(ct_Drive.TDD.ct_TakeProfit.INP, 0),
                              //0// 2 * PANEL_EDIT_GAP_X + 2 * PANEL_EDIT_WIDTH + (int)(104) + XBoxOne, (int)(72) + YBoxOne + Y_Edite, PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, STYLE_SOLID, 1, clrWhite, clrBlack,  C'59,41,40', 0, ALIGN_RIGHT, 7, "Tahoma");
                    }
                    ////--- Generic LBL_TPa ---//
                    {         gTradePannelObj.LBL_TPa.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_TPa.GDS.Set_Desc_4("LBL_TPa", "TP", "Arial", 7);
                              gTradePannelObj.LBL_TPa.GDS.Set_Color_1(clrWhite);
                              gTradePannelObj.LBL_TPa.GDS.Set_Location_5(2 * PANEL_EDIT_GAP_X + 2 * PANEL_EDIT_WIDTH + (int)(104) - 10 + XBoxOne, (int)(64) + YBoxOne + Y_Edite, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_TPa.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_TPa");
                              gTradePannelObj.LBL_TPa.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_TPa.Action(gTradePannelObj.LBL_TPa);//
                              //0// gTradePannelObj.LBL_TPa.Create(Is_Create, Is_Move, "LBL_TPa", "TP",
                              //0// 2 * PANEL_EDIT_GAP_X + 2 * PANEL_EDIT_WIDTH + (int)(104) - 10 + XBoxOne, (int)(64) + YBoxOne + Y_Edite,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 7, "Arial");
                    }
                    ////--- Generic LBL_ManualTP ---//
                    {         gTradePannelObj.LBL_ManualTP.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_ManualTP.GDS.Set_Desc_4("LBL_ManualTP", "Manual TP", "Arial bold", 7);
                              gTradePannelObj.LBL_ManualTP.GDS.Set_Color_1(clrGray);
                              gTradePannelObj.LBL_ManualTP.GDS.Set_Location_5(2 * PANEL_EDIT_GAP_X + 2 * PANEL_EDIT_WIDTH + (int)(104) - 10 + XBoxOne - 17, (int)(64) + YBoxOne + Y_Edite - 10, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_ManualTP.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_ManualTP");
                              gTradePannelObj.LBL_ManualTP.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_ManualTP.Action(gTradePannelObj.LBL_ManualTP);//
                              //0// gTradePannelObj.LBL_ManualTP.Create(Is_Create, Is_Move, "LBL_ManualTP", "Manual TP",
                              //0// 2 * PANEL_EDIT_GAP_X + 2 * PANEL_EDIT_WIDTH + (int)(104) - 10 + XBoxOne - 17, (int)(64) + YBoxOne + Y_Edite - 10,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrGray, 0, 7, "Arial bold");
                    }
                    //================================================================================================================
                    //=               LableTimer                                                                                     =
                    //================================================================================================================
                    ////---Generic BTN_Sell---//
                    {         gTradePannelObj.BTN_Sell.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gTradePannelObj.BTN_Sell.GDS.Set_Desc_4("BTN_Sell", "Sell", "Tahoma", 8);
                              gTradePannelObj.BTN_Sell.GDS.Set_Self_1(ButtonDEF_state);
                              gTradePannelObj.BTN_Sell.GDS.Set_Location_5((int)(104) + XBoxOne, (int)( 100.8) + YBoxOne,     (int)(PANEL_BUTTON_WIDTH), (int)(PANEL_BUTTON_HEIGHT * 1.1), CORNER_RIGHT_LOWER);
                              gTradePannelObj.BTN_Sell.GDS.Set_Color_3(C'255,128,128', C'144,176,239', C'59,41,40');
                              gTradePannelObj.BTN_Sell.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "BTN_Sell");
                              gTradePannelObj.BTN_Sell.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
                              gTradePannelObj.BTN_Sell.Action(gTradePannelObj.BTN_Sell);//
                              //0// gTradePannelObj.BTN_Sell.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_Sell", "Sell",
                              //0// (int)(104) + XBoxOne, (int)( 100.8) + YBoxOne,     (int)(PANEL_BUTTON_WIDTH), (int)(PANEL_BUTTON_HEIGHT * 1.1),
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, C'255,128,128', C'144,176,239', C'59,41,40', 0, 8, "Tahoma");
                    }
                    ////---Generic BTN_Close---//
                    {         gTradePannelObj.BTN_Close.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gTradePannelObj.BTN_Close.GDS.Set_Desc_4("BTN_Close", "Close", "Tahoma", 8);
                              gTradePannelObj.BTN_Close.GDS.Set_Self_1(ButtonDEF_state);
                              gTradePannelObj.BTN_Close.GDS.Set_Location_5((int)( PANEL_BUTTON_GAP_X + PANEL_BUTTON_WIDTH + 104) + XBoxOne, (int)( 100.8) + YBoxOne, (int)(PANEL_BUTTON_WIDTH), (int)( PANEL_BUTTON_HEIGHT * 1.1), CORNER_RIGHT_LOWER);
                              gTradePannelObj.BTN_Close.GDS.Set_Color_3(C'255,255,160', C'144,176,239', C'59,41,40');
                              gTradePannelObj.BTN_Close.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "BTN_Close");
                              gTradePannelObj.BTN_Close.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
                              gTradePannelObj.BTN_Close.Action(gTradePannelObj.BTN_Close);//
                              //0// gTradePannelObj.BTN_Close.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_Close", "Close",
                              //0// (int)( PANEL_BUTTON_GAP_X + PANEL_BUTTON_WIDTH + 104) + XBoxOne, (int)( 100.8) + YBoxOne, (int)(PANEL_BUTTON_WIDTH), (int)( PANEL_BUTTON_HEIGHT * 1.1),
                              //0//  CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, C'255,255,160', C'144,176,239', C'59,41,40', 0, 8, "Tahoma");
                    }
                    ////---Generic BTN_Buy---//
                    {         gTradePannelObj.BTN_Buy.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                              gTradePannelObj.BTN_Buy.GDS.Set_Desc_4("BTN_Buy", "Buy", "Tahoma", 8);
                              gTradePannelObj.BTN_Buy.GDS.Set_Self_1(ButtonDEF_state);
                              gTradePannelObj.BTN_Buy.GDS.Set_Location_5((int)(2 * PANEL_BUTTON_GAP_X + 2 * PANEL_BUTTON_WIDTH + 104) + XBoxOne, (int)( 100.8) + YBoxOne, (int)(PANEL_BUTTON_WIDTH), (int)( PANEL_BUTTON_HEIGHT * 1.1), CORNER_RIGHT_LOWER);
                              gTradePannelObj.BTN_Buy.GDS.Set_Color_3(C'160,192,255', C'144,176,239', C'59,41,40');
                              gTradePannelObj.BTN_Buy.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "BTN_Buy");
                              gTradePannelObj.BTN_Buy.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
                              gTradePannelObj.BTN_Buy.Action(gTradePannelObj.BTN_Buy);//
                              //0// gTradePannelObj.BTN_Buy.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_Buy", "Buy",
                              //0// (int)(2 * PANEL_BUTTON_GAP_X + 2 * PANEL_BUTTON_WIDTH + 104) + XBoxOne, (int)( 100.8) + YBoxOne, (int)(PANEL_BUTTON_WIDTH), (int)( PANEL_BUTTON_HEIGHT * 1.1),
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, C'160,192,255', C'144,176,239', C'59,41,40', 0, 8, "Tahoma");
                    }
                    ///==========================
                    if(0)
                    {         //--off--gTradePannelObj.BTN_TicketManage.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_TicketManage", "TicketManage",       (int)( 2 * PANEL_BUTTON_GAP_X + 2 * PANEL_BUTTON_WIDTH + -52) + XBoxOne,     (int)( 91.2) + YBoxOne,     (int)(PANEL_BUTTON_WIDTH), (int)( PANEL_BUTTON_HEIGHT * 1.1),       CORNER_RIGHT_UPPER, ANCHOR_CENTER, false, clrBeige, C'144,176,239', C'59,41,40', 0, 5, "Tahoma");
                              //--off--gTradePannelObj.BTN_ConditionWatch.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_ConditionWatch", "ConditionWatch", (int)( 2 * PANEL_BUTTON_GAP_X + 2 * PANEL_BUTTON_WIDTH + 78) + XBoxOne,              (int)( 91.2) + YBoxOne,     (int)(PANEL_BUTTON_WIDTH), (int)( PANEL_BUTTON_HEIGHT * 1.1),       CORNER_RIGHT_UPPER, ANCHOR_CENTER, false, clrBeige, C'144,176,239', C'59,41,40', 0, 5, "Tahoma");
                              //--off--gTradePannelObj.BTN_Trial.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_Trial", "Trial",                            (int)( 2 * PANEL_BUTTON_GAP_X + 2 * PANEL_BUTTON_WIDTH + -52) + XBoxOne,     (int)( 75.2) + YBoxOne,     (int)(PANEL_BUTTON_WIDTH), (int)( PANEL_BUTTON_HEIGHT * 1.1),       CORNER_RIGHT_UPPER, ANCHOR_CENTER, false, clrBeige, C'144,176,239', C'59,41,40', 0, 7, "Tahoma");
                              //--off--gTradePannelObj.BTN_PutOrders.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_PutOrders", "PutOrders",                (int)( 2 * PANEL_BUTTON_GAP_X + 2 * PANEL_BUTTON_WIDTH + 13) + XBoxOne,              (int)( 75.2) + YBoxOne,     (int)(PANEL_BUTTON_WIDTH), (int)( PANEL_BUTTON_HEIGHT * 1.1),       CORNER_RIGHT_UPPER, ANCHOR_CENTER, false, clrBeige, C'144,176,239', C'59,41,40', 0, 7, "Tahoma");  //
                              //--off--gTradePannelObj.BTN_CloseAll.Create(Is_Create, Is_Move, __FUNCSIG__, "BTN_CloseAll", "CloseAll",                   (int)( 2 * PANEL_BUTTON_GAP_X + 2 * PANEL_BUTTON_WIDTH + 78) + XBoxOne,              (int)( 75.2) + YBoxOne,     (int)(PANEL_BUTTON_WIDTH), (int)( PANEL_BUTTON_HEIGHT * 1.1),       CORNER_RIGHT_UPPER, ANCHOR_CENTER, false, clrBeige, C'144,176,239', C'59,41,40', 0, 7, "Tahoma");  //
                    }
                    //============================================================
                    ///---- Generic  RLBL_ASK---///
                    {         gTradePannelObj.RLBL_ASK.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.RLBL_ASK.GDS.Set_Desc_1("RLBL_ASK");
                              gTradePannelObj.RLBL_ASK.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              gTradePannelObj.RLBL_ASK.GDS.Set_Color_2(COLOR_ASK_REC, clrNONE);
                              gTradePannelObj.RLBL_ASK.GDS.Set_Location_5((int)(156) + XBoxOne, (int)(48) + YBoxOne + Y_Price, SizeX = 85, SizeY = 15, CORNER_RIGHT_LOWER);
                              gTradePannelObj.RLBL_ASK.GDS.Set_Chart_6();
                              gTradePannelObj.RLBL_ASK.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "RLBL_ASK");
                              gTradePannelObj.RLBL_ASK.Action(gTradePannelObj.RLBL_ASK);//
                              //0// gTradePannelObj.RLBL_ASK.Create(Is_Create, Is_Move, "RLBL_ASK",  "ASK",
                              //0// (int)(156) + XBoxOne, (int)(48) + YBoxOne + Y_Price, SizeX = 85, SizeY = 15,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_UPPER,  false, BORDER_FLAT,  COLOR_ASK_REC, clrNONE,  0, STYLE_SOLID, 1, 7, "Arial" );
                    }
                    ////--- Generic LBL_ASK ---//
                    {         gTradePannelObj.LBL_ASK.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_ASK.GDS.Set_Desc_4("LBL_ASK", "XXX", "Arial", 8);
                              gTradePannelObj.LBL_ASK.GDS.Set_Color_1(COLOR_FONT2);
                              gTradePannelObj.LBL_ASK.GDS.Set_Location_5((int)(130) + XBoxOne, (int)(41.6) + YBoxOne + Y_Price, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_ASK.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_ASK");
                              gTradePannelObj.LBL_ASK.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_ASK.Action(gTradePannelObj.LBL_ASK);//
                              //0//gTradePannelObj.LBL_ASK.Create(Is_Create, Is_Move, "LBL_ASK", "XXX",
                              //0// (int)(130) + XBoxOne, (int)(41.6) + YBoxOne + Y_Price,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,   COLOR_FONT2, 0, 8, "Arial");
                    }
                    ///---- Generic  RLBL_BID---///
                    {         gTradePannelObj.RLBL_BID.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.RLBL_BID.GDS.Set_Desc_1("RLBL_BID");
                              gTradePannelObj.RLBL_BID.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              gTradePannelObj.RLBL_BID.GDS.Set_Color_2(COLOR_BID_REC, clrNONE);
                              gTradePannelObj.RLBL_BID.GDS.Set_Location_5((int)(156) + 30 + XBoxOne, (int)(32) + YBoxOne + Y_Price,  SizeX = 85, SizeY = 15, CORNER_RIGHT_LOWER);
                              gTradePannelObj.RLBL_BID.GDS.Set_Chart_6();
                              gTradePannelObj.RLBL_BID.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "RLBL_BID");
                              gTradePannelObj.RLBL_BID.Action(gTradePannelObj.RLBL_BID);//
                              //0// gTradePannelObj.RLBL_BID.Create(Is_Create, Is_Move, "RLBL_BID",  "BID",
                              //0// (int)(156) + 30 + XBoxOne, (int)(32) + YBoxOne + Y_Price,  SizeX = 85, SizeY = 15,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_UPPER,  false, BORDER_FLAT,  COLOR_BID_REC, clrNONE,  0, STYLE_SOLID, 1, 7, "Arial" );
                    }
                    ////--- Generic LBL_BID ---//
                    {         gTradePannelObj.LBL_BID.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_BID.GDS.Set_Desc_4("LBL_BID", "XXX", "Arial", 8);
                              gTradePannelObj.LBL_BID.GDS.Set_Color_1(COLOR_FONT2);
                              gTradePannelObj.LBL_BID.GDS.Set_Location_5((int)(130) + XBoxOne,      (int)(25.6) + YBoxOne + Y_Price, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_BID.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_BID");
                              gTradePannelObj.LBL_BID.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_BID.Action(gTradePannelObj.LBL_BID);//
                              //0// gTradePannelObj.LBL_BID.Create(Is_Create, Is_Move, "LBL_BID", "XXX",
                              //0// (int)(130) + XBoxOne,      (int)(25.6) + YBoxOne + Y_Price,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,   COLOR_FONT2, 0, 8, "Arial");
                    }
                    ////--- Generic LBL_UPTICKS ---//
                    {         gTradePannelObj.LBL_UPTICKS.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_UPTICKS.GDS.Set_Desc_4("LBL_UPTICKS", "XX", "Arial", 8);
                              gTradePannelObj.LBL_UPTICKS.GDS.Set_Color_1(COLOR_FONT2);
                              gTradePannelObj.LBL_UPTICKS.GDS.Set_Location_5((int)(91) + XBoxOne, (int)(41.6) + YBoxOne + Y_Price, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_UPTICKS.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_UPTICKS");
                              gTradePannelObj.LBL_UPTICKS.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_UPTICKS.Action(gTradePannelObj.LBL_UPTICKS);//
                              //0// gTradePannelObj.LBL_UPTICKS.Create(Is_Create, Is_Move, "LBL_UPTICKS",  "XX",
                              //0// (int)(91) + XBoxOne, (int)(41.6) + YBoxOne + Y_Price,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,   COLOR_FONT2, 0, 8, "Arial");
                    }
                    ////--- Generic LBL_DWNTICKS ---//
                    {         gTradePannelObj.LBL_DWNTICKS.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_DWNTICKS.GDS.Set_Desc_4("LBL_DWNTICKS", "XX", "Arial", 8);
                              gTradePannelObj.LBL_DWNTICKS.GDS.Set_Color_1(COLOR_FONT2);
                              gTradePannelObj.LBL_DWNTICKS.GDS.Set_Location_5((int)(169) + XBoxOne, (int)(25.6) + YBoxOne + Y_Price, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_DWNTICKS.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_DWNTICKS");
                              gTradePannelObj.LBL_DWNTICKS.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_DWNTICKS.Action(gTradePannelObj.LBL_DWNTICKS);//
                              //0// gTradePannelObj.LBL_DWNTICKS.Create(Is_Create, Is_Move, "LBL_DWNTICKS", "XX",
                              //0// (int)(169) + XBoxOne, (int)(25.6) + YBoxOne + Y_Price,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,   COLOR_FONT2, 0, 8, "Arial");
                    }
                    ////--- Generic LBL_UP ---//
                    {         gTradePannelObj.LBL_UP.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_UP.GDS.Set_Desc_4("LBL_UP", "6", "Webdings", 12);
                              gTradePannelObj.LBL_UP.GDS.Set_Color_1(std_Global.COLOR_SELL);
                              gTradePannelObj.LBL_UP.GDS.Set_Location_5((int)(91) + XBoxOne, (int)(25.6) + YBoxOne + Y_Price, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_UP.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_UP");
                              gTradePannelObj.LBL_UP.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_UP.Action(gTradePannelObj.LBL_UP);//
                              //0// gTradePannelObj.LBL_UP.Create(Is_Create, Is_Move, "LBL_UP", "6",
                              //0// (int)(91) + XBoxOne, (int)(25.6) + YBoxOne + Y_Price,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, std_Global.COLOR_SELL, 0, 12, "Webdings");
                    }
                    ////--- Generic LBL_DN ---//
                    {         gTradePannelObj.LBL_DN.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_DN.GDS.Set_Desc_4("LBL_DN", "5", "Webdings", 12);
                              gTradePannelObj.LBL_DN.GDS.Set_Color_1(std_Global.COLOR_BUY);
                              gTradePannelObj.LBL_DN.GDS.Set_Location_5((int)(169) + XBoxOne, (int)(41.6) + YBoxOne + Y_Price, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_DN.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_DN");
                              gTradePannelObj.LBL_DN.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_DN.Action(gTradePannelObj.LBL_DN);//
                              //0// gTradePannelObj.LBL_DN.Create(Is_Create, Is_Move, "LBL_DN", "5",
                              //0// (int)(169) + XBoxOne, (int)(41.6) + YBoxOne + Y_Price,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,   std_Global.COLOR_BUY, 0, 12, "Webdings");
                    }
                    //==============================
                    ////---Generic EDT_Symbol---//
                    {         gTradePannelObj.EDT_Symbol.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.EDT_Symbol.GDS.Set_Desc_4("EDT_Symbol", _Symbol, "Trebuchet MS", 7);
                              gTradePannelObj.EDT_Symbol.GDS.Set_Self_2(ALIGN_CENTER, readonlyDEF);
                              gTradePannelObj.EDT_Symbol.GDS.Set_Location_5((int)(163.8) + XBoxOne, (int)(120) + YBoxOne,   PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT, CORNER_RIGHT_LOWER);
                              gTradePannelObj.EDT_Symbol.GDS.Set_Color_3(clrMidnightBlue, clrMidnightBlue, clrWhite);
                              gTradePannelObj.EDT_Symbol.GDS.Set_Common_6(false, 60, false, false, false, EditDEF_tooltip + "EDT_Symbol");
                              gTradePannelObj.EDT_Symbol.GDS.Set_Chart_6();
                              gTradePannelObj.EDT_Symbol.Action(gTradePannelObj.EDT_Symbol);//
                              //0// gTradePannelObj.EDT_Symbol.Create(Is_Create, Is_Move, "EDT_Symbol", _Symbol,
                              //0// (int)(163.8) + XBoxOne, (int)(120) + YBoxOne,   PANEL_EDIT_WIDTH, PANEL_EDIT_HEIGHT,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, STYLE_SOLID, 1, C'240,240,240', clrBlack, clrBlack, 0, ALIGN_CENTER, 7, "Trebuchet MS");
                    }
                    ////--- Generic LBL_Symbola ---//
                    {         gTradePannelObj.LBL_Symbola.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Symbola.GDS.Set_Desc_4("LBL_Symbola", "S", "Wingdings", 10);
                              gTradePannelObj.LBL_Symbola.GDS.Set_Color_1(clrBlack);
                              gTradePannelObj.LBL_Symbola.GDS.Set_Location_5((int)(101.4) + XBoxOne,    (int)(112) + YBoxOne, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Symbola.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Symbola");
                              gTradePannelObj.LBL_Symbola.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Symbola.Action(gTradePannelObj.LBL_Symbola);//
                              //0// gTradePannelObj.LBL_Symbola.Create(Is_Create, Is_Move, "LabelSYMBOL§", "",
                              //0// (int)(101.4) + XBoxOne,    (int)(112) + YBoxOne,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrLimeGreen, 0, 10, "Wingdings");
                    }
                    ////--- Generic LBL_Symbolb ---//
                    {         gTradePannelObj.LBL_Symbolb.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Symbolb.GDS.Set_Desc_4("LBL_Symbolb", "", "Arial Black", 9);
                              gTradePannelObj.LBL_Symbolb.GDS.Set_Color_1(clrBlue);
                              gTradePannelObj.LBL_Symbolb.GDS.Set_Location_5((int)(72.8) + XBoxOne, (int)(112) + YBoxOne, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Symbolb.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Symbolb");
                              gTradePannelObj.LBL_Symbolb.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Symbolb.Action(gTradePannelObj.LBL_Symbolb);//
                              //0// gTradePannelObj.LBL_Symbolb.Create(Is_Create, Is_Move, "LabelSYMBOL%", "",
                              //0// (int)(72.8) + XBoxOne, (int)(112) + YBoxOne,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrBlue, 0, 9, "Arial Black");
                    }
                    //=======================
                    ////--- Generic LBL_SPREAD ---//
                    {         gTradePannelObj.LBL_SPREAD.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_SPREAD.GDS.Set_Desc_4("LBL_SPREAD", "h", "Arial", 8);
                              gTradePannelObj.LBL_SPREAD.GDS.Set_Color_1(COLOR_FONT2);
                              gTradePannelObj.LBL_SPREAD.GDS.Set_Location_5((int)(208) + XBoxOne, (int)(112) + YBoxOne, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_SPREAD.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_SPREAD");
                              gTradePannelObj.LBL_SPREAD.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_SPREAD.Action(gTradePannelObj.LBL_SPREAD);//
                              //0// gTradePannelObj.LBL_SPREAD.Create(Is_Create, Is_Move, "LBL_SPREAD", "h",
                              //0// (int)(208) + XBoxOne, (int)(112) + YBoxOne,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false,   COLOR_FONT2, 0, 8, "Arial");
                    }
                    ////--- Generic LBL_SPREADa ---//
                    {         gTradePannelObj.LBL_SPREADa.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_SPREADa.GDS.Set_Desc_4("LBL_SPREADa", "h", "Wingdings", 12);
                              gTradePannelObj.LBL_SPREADa.GDS.Set_Color_1(COLOR_FONT2);//COLOR_FONT2
                              gTradePannelObj.LBL_SPREADa.GDS.Set_Location_5((int)(189.8) + XBoxOne,    (int)(112) + YBoxOne, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_SPREADa.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_SPREADa");
                              gTradePannelObj.LBL_SPREADa.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_SPREADa.Action(gTradePannelObj.LBL_SPREADa);//
                              //0// gTradePannelObj.LBL_SPREADa.Create(Is_Create, Is_Move, "LBL_SPREADa", "h",
                              //0// (int)(189.8) + XBoxOne, (int)(112) + YBoxOne,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, COLOR_FONT2, 0, 12, "Wingdings");
                    }
                    //=======================
                    ////--- Generic LBL_Speed ---//
                    {         gTradePannelObj.LBL_Speed.GDS.Set_Action_2(WhichMode, IsKey);
                              gTradePannelObj.LBL_Speed.GDS.Set_Desc_4("LBL_Speed§", "****", "Tahoma", 8);
                              gTradePannelObj.LBL_Speed.GDS.Set_Color_1(clrDarkOrchid);
                              gTradePannelObj.LBL_Speed.GDS.Set_Location_5((int)(158) + XBoxOne,    (int)(127) + YBoxOne, 0, CORNER_RIGHT_LOWER,  ANCHOR_CENTER);
                              gTradePannelObj.LBL_Speed.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Speed");
                              gTradePannelObj.LBL_Speed.GDS.Set_Chart_6();
                              gTradePannelObj.LBL_Speed.Action(gTradePannelObj.LBL_Speed);//
                              //0// gTradePannelObj.LBL_Speed.Create(Is_Create, Is_Move, "LBL_Speed§", "",
                              //0// (int)(163.8) + XBoxOne,    (int)(126.4) + YBoxOne,
                              //0// CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 7, "Tahoma");
                    }
                    SpeedBars(WhichMode, IsKey, "LBL_Speed#");
                    //
                    ///==================================================Right Side Pannnel
                    /////////////////////////
                    //============================//============================1
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "C_TRADEPANEL",  __LINE__, __FUNCTION__); //
                    //============================//============================
          } //
          if(WhichMode == MODE_CREATE && IsKey == false) {GlobalVar(false);}  if(WhichMode == MODE_CREATE ) {Is_Running = IsKey;}
          //=============================================================================================================
          {         //
                    if(WhichMode == MODE_CREATE && IsKey == true) {         gTradePannelObj.RLBL_BorderTopUP.GAC.BackColor(clrNavy); }
                    else if((WhichMode == MODE_CREATE && IsKey == false)) {gTradePannelObj.RLBL_BorderTopUP.GAC.BackColor(clrSaddleBrown); }//
          }
          Complex.Menu_Button(MODE_MODIFY, Is_Running, "Main", RightMenuPad_Color.GclrBody, RightMenuPad_Color.GclrBodyMargine, clrWhite,  RightMenuPad_Color.GclrBodyCyrclePress); //
          //=============================================================================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_TRADEPANEL",  __LINE__, __FUNCTION__); //|
          //
}
//+------------------------------------------------------------------+
//| CreateObjects                                                    |
//+------------------------------------------------------------------+
void C_TRADEPANEL::ObjectsCreateAll(bool Is_Create = false, bool Is_Move = false)
{         /*       ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|

          //--
                   BTN_.OBJ.CreateB(0, OBJPREFIX + "RESET", 0, CLIENT_BG_X, CLIENT_BG_Y, 15, 15, CORNER_LEFT_UPPER, "°", "Wingdings", 10, COLOR_FONT, COLOR_MOVE, clrOrange, false, false, false, true, 0, "\n");
                    RLBL_.OBJ.CreateR(0, OBJPREFIX + "BORDER[]", 0, x1, y1, x2, INDENT_TOP, clrOrange, BORDER_FLAT, CORNER_LEFT_UPPER, clrOrange, STYLE_SOLID, 1, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "CAPTION", 0, x1 + (x2 / 2), y1, CORNER_LEFT_UPPER, "Trade Panel", "Tahoma", 10, C'59,41,40', 0, ANCHOR_UPPER, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "EXIT", 0, (x1 + (x2 / 2)) + 115, y1 - 2, CORNER_LEFT_UPPER, "r", "Webdings", 10, C'59,41,40', 0, ANCHOR_UPPER, false, false, true, 0, "\n", false);
                   BTN_.OBJ.CreateB(0, OBJPREFIX + "MOVE", 0, x1, y1, 15, 15, CORNER_LEFT_UPPER, "ó", "Wingdings", 10, COLOR_FONT, COLOR_MOVE, clrDarkOrange, false, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "CONNECTION", 0, (x1 + (x2 / 2)) - 97, y1 - 2, CORNER_LEFT_UPPER, "ü", "Webdings", 10, C'59,41,40', 0, ANCHOR_UPPER, false, false, true, 0, "", false);
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "THEME", 0, (x1 + (x2 / 2)) - 72, y1 - 4, CORNER_LEFT_UPPER, "N", "Webdings", 15, C'59,41,40', 0, ANCHOR_UPPER, false, false, true, 0, "\n", false);
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "PAINT", 0, (x1 + (x2 / 2)) - 48, y1, CORNER_LEFT_UPPER, "$", "Wingdings 2", 13, C'59,41,40', 0, ANCHOR_UPPER, false, false, true, 0, "\n", false);
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "PLAY", 0, (x1 + (x2 / 2)) + 75, y1 - 5, CORNER_LEFT_UPPER, "4", "Webdings", 15, C'59,41,40', 0, ANCHOR_UPPER, false, false, true, 0, "\n", false);
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "CANDLES¦", 0, (x1 + (x2 / 2)) + 97, y1 - 6, CORNER_LEFT_UPPER, "ß", "Webdings", 15, C'59,41,40', 0, ANCHOR_UPPER, false, false, true, 0, "\n", false);
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "SOUND", 0, (x1 + (x2 / 2)) + 50, y1 - 2, CORNER_LEFT_UPPER, "X", "Webdings", 12, C'59,41,40', 0, ANCHOR_UPPER, false, false, true, 0, "\n", false);
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "SOUNDIO", 0, (x1 + (x2 / 2)) + 60, y1 - 1, CORNER_LEFT_UPPER, "ð", "Webdings", 10, C'59,41,40', 0, ANCHOR_UPPER, false, false, true, 0, "\n", false);
                    EDT_.OBJ.CreateE(0, OBJPREFIX + "SYMBOL¤", 0, x1 + BUTTON_GAP_X, y1 + INDENT_TOP + BUTTON_GAP_X, EDIT_WIDTH, EDIT_HEIGHT, _Symbol, "Trebuchet MS", 10, ALIGN_CENTER, false, CORNER_LEFT_UPPER, COLOR_FONT, COLOR_BG, clrDimGray, false, false, true, 0);
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "SYMBOL§", 0, x1 + 100, y1 + 27, CORNER_LEFT_UPPER, "", "Wingdings", 12, clrLimeGreen, 0, ANCHOR_RIGHT, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "SYMBOL%", 0, x1 + 145, y1 + 27, CORNER_LEFT_UPPER, "", "Arial Black", 8, COLOR_FONT, 0, ANCHOR_RIGHT, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "SPEEDª",  0, x1 + SPEEDTEXT_GAP_X, y1 + SPEEDTEXT_GAP_Y, CORNER_LEFT_UPPER, "", "Tahoma", 12, clrNONE, 0.0, ANCHOR_RIGHT, false, false, true, 0);
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "CLOSE¹²³", 0, (x1 + BUTTON_GAP_X) + 37, (y1 + INDENT_TOP + BUTTON_GAP_X) + 27, CORNER_LEFT_UPPER, CloseArr[CloseMode], "Arial", 6, COLOR_FONT, 0, ANCHOR_CENTER, false, false, true, 0, "\n", false);
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "SPREAD", 0, x1 + 90, y1 + 55, CORNER_LEFT_UPPER, "", "Arial", 8, COLOR_FONT, 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "SPREAD§", 0, x1 + 110, y1 + 55, CORNER_LEFT_UPPER, "h", "Wingdings", 12, COLOR_FONT, 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                    RLBL_.OBJ.CreateR(0, OBJPREFIX + "ASK[]", 0, x1 + 155, y1 + 41, 85, 15, COLOR_ASK_REC, BORDER_FLAT, CORNER_LEFT_UPPER, COLOR_ASK_REC, STYLE_SOLID, 1, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "ASK", 0, x1 + 180, y1 + 49, CORNER_LEFT_UPPER, "", "Arial", 8, COLOR_FONT2, 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                    RLBL_.OBJ.CreateR(0, OBJPREFIX + "BID[]", 0, x1 + 125, y1 + 56, 85, 15, COLOR_BID_REC, BORDER_FLAT, CORNER_LEFT_UPPER, COLOR_BID_REC, STYLE_SOLID, 1, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "BID", 0, x1 + 180, y1 + 63, CORNER_LEFT_UPPER, "", "Arial", 8, COLOR_FONT2, 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "UPTICKS", 0, x1 + 225, y1 + 49, CORNER_LEFT_UPPER, "", "Arial", 8, COLOR_FONT2, 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "DWNTICKS", 0, x1 + 140, y1 + 63, CORNER_LEFT_UPPER, "", "Arial", 8, COLOR_FONT2, 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "UP»", 0, x1 + 141, y1 + 47, CORNER_LEFT_UPPER, "6", "Webdings", 12, std_Global.COLOR_SELL, 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "DN»", 0, x1 + 225, y1 + 63, CORNER_LEFT_UPPER, "5", "Webdings", 12, std_Global.COLOR_BUY, 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "TIMER", 0, x1 + 10, y1 + 65, CORNER_LEFT_UPPER, "", "Tahoma", 7, COLOR_FONT, 0, ANCHOR_LEFT, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "FLOATª", 0, x1 + BUTTON_GAP_X + 5, inputs_y - 15, CORNER_LEFT_UPPER, "", "Wingdings", 15, clrNONE, 0, ANCHOR_LEFT, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "FLOAT§", 0, x1 + BUTTON_GAP_X + 45, inputs_y - 15, CORNER_LEFT_UPPER, "", "Arial", 9, clrNONE, 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "FLOAT$", 0, x1 + BUTTON_GAP_X + 120, inputs_y - 15, CORNER_LEFT_UPPER, "", "Arial", 9, clrNONE, 0, ANCHOR_RIGHT, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "PROFITS", 0, x1 + BUTTON_GAP_X + 190, inputs_y - 15, CORNER_LEFT_UPPER, "", "Arial", 9, clrNONE, 0, ANCHOR_RIGHT, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "POINTS", 0, x1 + BUTTON_GAP_X + 235, inputs_y - 15, CORNER_LEFT_UPPER, "", "Arial", 9, clrNONE, 0, ANCHOR_RIGHT, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "ROIª", 0, x1 + BUTTON_GAP_X + 5, inputs_y - 15, CORNER_LEFT_UPPER, "Today", "Arial", 9, clrNONE, 0, ANCHOR_LEFT, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "ROI§", 0, x1 + BUTTON_GAP_X + 45, inputs_y - 15, CORNER_LEFT_UPPER, "P", "Wingdings", 15, clrNONE, 0, ANCHOR_LEFT, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "ROI%", 0, x1 + BUTTON_GAP_X + 120, inputs_y - 15, CORNER_LEFT_UPPER, "", "Arial", 9, clrNONE, 0, ANCHOR_RIGHT, false, false, true, 0, "\n");
                    EDT_.OBJ.CreateE(0, OBJPREFIX + "SL<>", 0, x1 + BUTTON_GAP_X, inputs_y, EDIT_WIDTH, EDIT_HEIGHT, DoubleToString(ct_Drive.TDD.ct_StopLoss.INP, 0), "Tahoma", 10, ALIGN_RIGHT, false, CORNER_LEFT_UPPER, C'59,41,40', clrWhite, clrWhite, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "SLª", 0, x1 + BUTTON_GAP_X + EDIT_GAP_Y, label_y, CORNER_LEFT_UPPER, "sl", "Arial", 10, clrDarkGray, 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                    EDT_.OBJ.CreateE(0, OBJPREFIX + "LOTSIZE<>", 0, x1 + BUTTON_GAP_X + BUTTON_WIDTH + BUTTON_GAP_X, inputs_y, EDIT_WIDTH, EDIT_HEIGHT, DoubleToString(ct_Drive.TDD.st_Size.INP, 2), "Tahoma", 10, ALIGN_CENTER, false, CORNER_LEFT_UPPER, C'59,41,40', clrWhite, clrWhite, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "LOTSIZE<", 0, (x1 + BUTTON_GAP_X + EDIT_GAP_Y) + 75, label_y, CORNER_LEFT_UPPER, "6", "Webdings", 10, C'59,41,40', 0, ANCHOR_CENTER, false, false, true, 0, "\n", false);
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "LOTSIZE>", 0, (x1 + BUTTON_GAP_X + EDIT_GAP_Y) + 130, label_y, CORNER_LEFT_UPPER, "5", "Webdings", 10, C'59,41,40', 0, ANCHOR_CENTER, false, false, true, 0, "\n", false);
                    EDT_.OBJ.CreateE(0, OBJPREFIX + "TP<>", 0, x1 + (BUTTON_WIDTH * 2) + (BUTTON_GAP_X * 3), inputs_y, EDIT_WIDTH, EDIT_HEIGHT, DoubleToString(ct_Drive.TDD.ct_TakeProfit.INP, 0), "Tahoma", 10, ALIGN_RIGHT, false, CORNER_LEFT_UPPER, C'59,41,40', clrWhite, clrWhite, false, false, true, 0, "\n");
                   LBL_.OBJ.CreateL(0, OBJPREFIX + "TPª", 0, x1 + (BUTTON_WIDTH * 2) + (BUTTON_GAP_X * 3) + EDIT_GAP_Y, label_y, CORNER_LEFT_UPPER, "tp", "Arial", 10, clrDarkGray, 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                   BTN_.OBJ.CreateB(0, OBJPREFIX + "SELL", 0, x1 + BUTTON_GAP_X, button_y, BUTTON_WIDTH, BUTTON_HEIGHT, CORNER_LEFT_UPPER, "Sell", "Trebuchet MS", 10, C'59,41,40', C'255,128,128', C'239,112,112', false, false, false, true, 1, "\n");
                   BTN_.OBJ.CreateB(0, OBJPREFIX + "CLOSE", 0, x1 + BUTTON_WIDTH + (BUTTON_GAP_X * 2), button_y, BUTTON_WIDTH, BUTTON_HEIGHT, CORNER_LEFT_UPPER, "Close", "Trebuchet MS", 10, C'59,41,40', C'255,255,160', C'239,239,144', false, false, false, true, 1, "\n");
                   BTN_.OBJ.CreateB(0, OBJPREFIX + "BUY", 0, x1 + (BUTTON_WIDTH * 2) + (BUTTON_GAP_X * 3), button_y, BUTTON_WIDTH, BUTTON_HEIGHT, CORNER_LEFT_UPPER, "Buy", "Trebuchet MS", 10, C'59,41,40', C'160,192,255', C'144,176,239', false, false, false, true, 1, "\n");
                    Complex.CreateSpeedBars(Is_Create, Is_Move, "SPEED#", Complex.MaxSpeedBars, x1, y1, SPEEDBAR_GAP_Y);
          //-- Strategy Tester (Cannot change symbol)
                    if(IsTesting())
                    {         if(ObjectFind(0, OBJPREFIX + "SYMBOL¤") >= 0) //ObjectIsPresent
                              {         if(!ObjectGetInteger(0, OBJPREFIX + "SYMBOL¤", OBJPROP_READONLY)) //GetObject
                                                  ObjectSetInteger(0, OBJPREFIX + "SYMBOL¤", OBJPROP_READONLY, true); //Set_Object
                              } //
                    }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|

          //--
          */
}

//+------------------------------------------------------------------+
//| MoveObjects                                                      |
//+------------------------------------------------------------------+
void C_TRADEPANEL::ObjectsMoveAll(bool Is_Create = false, bool Is_Move = false)
{         /*   ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|

          //--
            LBL_.OBJ.MoveAssign( OBJPREFIX + "BORDER[]", x1, y1);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "CAPTION", (x1 + (x2 / 2)), y1);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "EXIT", (x1 + (x2 / 2)) + 115, y1 - 2);
            BTN_.OBJ.MoveAssign( OBJPREFIX + "MOVE", x1, y1);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "CONNECTION", (x1 + (x2 / 2)) - 97, y1 - 2);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "THEME", (x1 + (x2 / 2)) - 72, y1 - 4);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "PAINT", (x1 + (x2 / 2)) - 48, y1);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "PLAY", (x1 + (x2 / 2)) + 75, y1 - 5);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "CANDLES¦", (x1 + (x2 / 2)) + 97, y1 - 6);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "SOUND", (x1 + (x2 / 2)) + 50, y1 - 2);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "SOUNDIO", (x1 + (x2 / 2)) + 60, y1 - 1);
             EDT_.OBJ.MoveAssign( OBJPREFIX + "SYMBOL¤", x1 + BUTTON_GAP_X, y1 + INDENT_TOP + BUTTON_GAP_X);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "SYMBOL§", x1 + 100, y1 + 27);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "SYMBOL%", x1 + 145, y1 + 27);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "SPEEDª", x1 + SPEEDTEXT_GAP_X, y1 + SPEEDTEXT_GAP_Y);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "CLOSE¹²³", (x1 + BUTTON_GAP_X) + 37, (y1 + INDENT_TOP + BUTTON_GAP_X) + 27);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "SPREAD", x1 + 90, y1 + 55);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "SPREAD§", x1 + 110, y1 + 55);
             RLBL_.OBJ.MoveAssign( OBJPREFIX + "ASK[]", x1 + 155, y1 + 41);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "ASK", x1 + 180, y1 + 49);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "BID[]", x1 + 125, y1 + 56);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "BID", x1 + 180, y1 + 63);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "UPTICKS", x1 + 225, y1 + 49);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "DWNTICKS", x1 + 140, y1 + 63);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "UP»", x1 + 141, y1 + 47);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "DN»", x1 + 225, y1 + 63);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "TIMER", x1 + 10, y1 + 65);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "FLOATª", x1 + BUTTON_GAP_X + 5, inputs_y - 15);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "FLOAT§", x1 + BUTTON_GAP_X + 45, inputs_y - 15);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "FLOAT$", x1 + BUTTON_GAP_X + 120, inputs_y - 15);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "PROFITS", x1 + BUTTON_GAP_X + 190, inputs_y - 15);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "POINTS", x1 + BUTTON_GAP_X + 235, inputs_y - 15);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "ROIª", x1 + BUTTON_GAP_X + 5, inputs_y - 15);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "ROI§", x1 + BUTTON_GAP_X + 45, inputs_y - 15);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "ROI%", x1 + BUTTON_GAP_X + 120, inputs_y - 15);
             EDT_.OBJ.MoveAssign( OBJPREFIX + "SL<>", x1 + BUTTON_GAP_X, inputs_y);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "SLª", x1 + BUTTON_GAP_X + EDIT_GAP_Y, label_y);
             EDT_.OBJ.MoveAssign( OBJPREFIX + "LOTSIZE<>", x1 + BUTTON_WIDTH + (BUTTON_GAP_X * 2), inputs_y);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "LOTSIZE<", (x1 + BUTTON_GAP_X + EDIT_GAP_Y) + 75, label_y);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "LOTSIZE>", (x1 + BUTTON_GAP_X + EDIT_GAP_Y) + 130, label_y);
             EDT_.OBJ.MoveAssign( OBJPREFIX + "TP<>", x1 + (BUTTON_WIDTH * 2) + (BUTTON_GAP_X * 3), inputs_y);
            LBL_.OBJ.MoveAssign( OBJPREFIX + "TPª", x1 + (BUTTON_WIDTH * 2) + (BUTTON_GAP_X * 3) + EDIT_GAP_Y, label_y);
            BTN_.OBJ.MoveAssign( OBJPREFIX + "SELL", x1 + BUTTON_GAP_X, button_y);
            BTN_.OBJ.MoveAssign( OBJPREFIX + "CLOSE", x1 + BUTTON_WIDTH + (BUTTON_GAP_X * 2), button_y);
            BTN_.OBJ.MoveAssign( OBJPREFIX + "BUY", x1 + (BUTTON_WIDTH * 2) + (BUTTON_GAP_X * 3), button_y);
             Complex.CreateSpeedBars(Is_Create, Is_Move, "SPEED#", Complex.MaxSpeedBars, x1, y1, SPEEDBAR_GAP_Y);
          //--
             ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|

          */
}
//+------------------------------------------------------------------+
//| CheckObjects                                                     |
//+------------------------------------------------------------------+
void C_TRADEPANEL::ObjectsCheckAll()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          //-- CreateObjects
          ObjectsCreateAll();/*User may have deleted one*/
          //+------- TrackSomeObjects -------+
          //-- IsSelectable
          if(ObjectFind(0, OBJPREFIX + "MOVE") >= 0 && ObjectFind(0, OBJPREFIX + "BCKGRND[]") >= 0) //ObjectIsPresent
          {         if(ObjectGetInteger(0, OBJPREFIX + "MOVE", OBJPROP_STATE)) //GetObject
                    {         if(!ObjectGetInteger(0, OBJPREFIX + "BCKGRND[]", OBJPROP_SELECTED)) //GetObject
                                        ObjectSetInteger(0, OBJPREFIX + "BCKGRND[]", OBJPROP_SELECTED, true); //Set_Object
                    }
                    //-- IsNotSelectable
                    else
                    {         if(!ObjectGetInteger(0, OBJPREFIX + "MOVE", OBJPROP_STATE)) //GetObject
                                        ObjectSetInteger(0, OBJPREFIX + "BCKGRND[]", OBJPROP_SELECTED, false); //Set_Object
                    }//
          }
          //-- IsConnected
          if(ObjectFind(0, OBJPREFIX + "CONNECTION") >= 0) //ObjectIsPresent
          {         if(TerminalInfoInteger(TERMINAL_CONNECTED))
                    {         if(ObjectGetString(0, OBJPREFIX + "CONNECTION", OBJPROP_TEXT) != "ü") //GetObject
                                        ObjectSetString(0, OBJPREFIX + "CONNECTION", OBJPROP_TEXT, "ü"); //Set_Object
                              if(ObjectGetString(0, OBJPREFIX + "CONNECTION", OBJPROP_TOOLTIP) != "Connected") //GetObject
                                        ObjectSetString(0, OBJPREFIX + "CONNECTION", OBJPROP_TOOLTIP, "Connected"); //Set_Object
                    }
                    //-- IsDisconnected
                    else
                    {         if(ObjectGetString(0, OBJPREFIX + "CONNECTION", OBJPROP_TEXT) != "ñ") //GetObject
                                        ObjectSetString(0, OBJPREFIX + "CONNECTION", OBJPROP_TEXT, "ñ"); //Set_Object
                              if(ObjectGetString(0, OBJPREFIX + "CONNECTION", OBJPROP_TOOLTIP) != "No connection!") //GetObject
                                        ObjectSetString(0, OBJPREFIX + "CONNECTION", OBJPROP_TOOLTIP, "No connection!"); //Set_Object
                    } //
          }
          //-- Sound.IS_SoundEnabled
          if(ObjectFind(0, OBJPREFIX + "SOUNDIO") >= 0) //ObjectIsPresent
          {         if(Sound.IS_SoundEnabled)
                    {         if(ObjectGetInteger(0, OBJPREFIX + "SOUNDIO", OBJPROP_COLOR) != C'59,41,40') //GetObject
                                        ObjectSetInteger(0, OBJPREFIX + "SOUNDIO", OBJPROP_COLOR, C'59,41,40'); //Set_Object
                    }
                    //-- SoundIsDisabled
                    else
                    {         if(ObjectGetInteger(0, OBJPREFIX + "SOUNDIO", OBJPROP_COLOR) != clrNONE) //GetObject
                                        ObjectSetInteger(0, OBJPREFIX + "SOUNDIO", OBJPROP_COLOR, clrNONE); //Set_Object
                    } //
          }
          //-- TickSoundsAreEnabled
          if(ObjectFind(0, OBJPREFIX + "PLAY") >= 0) //ObjectIsPresent
          {         if(PlayTicks)
                    {         if(ObjectGetString(0, OBJPREFIX + "PLAY", OBJPROP_TEXT) != ";") //GetObject
                                        ObjectSetString(0, OBJPREFIX + "PLAY", OBJPROP_TEXT, ";"); //Set_Object
                              if(ObjectGetInteger(0, OBJPREFIX + "PLAY", OBJPROP_FONTSIZE) != 14) //GetObject
                                        ObjectSetInteger(0, OBJPREFIX + "PLAY", OBJPROP_FONTSIZE, 14); //Set_Object
                    }
                    //-- TickSoundsAreDisabled
                    else
                    {         if(ObjectGetString(0, OBJPREFIX + "PLAY", OBJPROP_TEXT) != "4") //GetObject
                                        ObjectSetString(0, OBJPREFIX + "PLAY", OBJPROP_TEXT, "4"); //Set_Object
                              if(ObjectGetInteger(0, OBJPREFIX + "PLAY", OBJPROP_FONTSIZE) != 15) //GetObject
                                        ObjectSetInteger(0, OBJPREFIX + "PLAY", OBJPROP_FONTSIZE, 15); //Set_Object
                    }//
          }
          //+--------------------------------+
          //--
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//| GetSet_Inputs                                                     |
//+------------------------------------------------------------------+
void C_TRADEPANEL::GetSet_Inputs(bool KeyRun)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          if(KeyRun)
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
                    {         //-- GetMarketInfo
                    }
                    //--    Utilities.DescToDouble(ObjName)
                    //---------------------------------------------------------------------------------------------------------------------------
                    //-- EDT_PutLots
                    if(true)
                    {         if(true && ObjectFind(0, "S_EDIT " + "EDT_PutLots") >= 0)ct_Drive.TDD.st_Size.INP = Utilities.DescToDouble("S_EDIT " + "EDT_PutLots"); /*Set_Object*/ ///"LOTSIZE<>"///OBJPREFIX + "LOTSIZE<>"
                              //-- RoundPutLots
                              if(false)ct_Drive.TDD.st_Size.Curr_Lots = ct_Drive.TDD.st_Size.INP;
                              //ct_Drive.TDD.st_Size.Curr_Lots = MathRound(ct_Drive.TDD.st_Size.Curr_Lots / ct_Drive.TDD.ct_Market_Symbol.LotStep) * ct_Drive.TDD.ct_Market_Symbol.LotStep;
                              if(false && ObjectFind(0, "S_EDIT " + "EDT_PutLots") >= 0)ObjectSetString(0, "S_EDIT " + "EDT_PutLots", OBJPROP_TEXT, 0, DoubleToString(ct_Drive.TDD.st_Size.Curr_Lots, 2)); /*Set_Object*/
                              if(true)          //-- WrongPutLots
                              {         if(ct_Drive.TDD.st_Size.Curr_Lots <= ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT) ct_Drive.TDD.st_Size.Curr_Lots = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT;
                                        if(ct_Drive.TDD.st_Size.Curr_Lots >= ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT) ct_Drive.TDD.st_Size.Curr_Lots = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT;
                                        if(ObjectFind(0,  "S_EDIT " + "EDT_PutLots") >= 0)ObjectSetString(0, "S_EDIT " + "EDT_PutLots", OBJPROP_TEXT, 0, DoubleToString(ct_Drive.TDD.st_Size.Curr_Lots, 2)); /*Set_Object*/
                              } //
                    }
                    //---------------------------------------------------------------------------------------------------------------------------
                    {         //-- GetINPut EDT_SL
                              if(ObjectFind(0, "S_EDIT " + "EDT_SL") >= 0)ct_Drive.TDD.ct_StopLoss.INP_Pip = (int)StringToDouble(ObjectGetString(0, "S_EDIT " + "EDT_SL", OBJPROP_TEXT)); /*GetObject*/
                              //-- WrongSL
                              if(ct_Drive.TDD.ct_StopLoss.INP_Pip < 0 || ct_Drive.TDD.ct_StopLoss.INP_Pip < ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_STOPLEVEL)
                              {         ct_Drive.TDD.ct_StopLoss.Curr_Pip = 0;
                                        if(ObjectFind(0, "S_EDIT " + "EDT_SL") >= 0)ObjectSetString(0, "S_EDIT " + "EDT_SL", OBJPROP_TEXT, 0, DoubleToString(ct_Drive.TDD.ct_StopLoss.Curr_Pip, 0)); /*Set_Object*/
                              }
                              else {ct_Drive.TDD.ct_StopLoss.Curr_Pip = ct_Drive.TDD.ct_StopLoss.INP_Pip; }//
                    }
                    //---------------------------------------------------------------------------------------------------------------------------
                    //caused errorrs/ EDT_TP
                    {         //-- GetINPut
                              if(ObjectFind(0, "S_EDIT " + "EDT_TP") >= 0)
                                        ct_Drive.TDD.ct_TakeProfit.INP_Pip = (int)StringToDouble(ObjectGetString(0, "S_EDIT " + "EDT_TP", OBJPROP_TEXT)); /*GetObject*/
                              //-- WrongTP
                              if(ct_Drive.TDD.ct_TakeProfit.INP_Pip < 0 || ct_Drive.TDD.ct_TakeProfit.INP_Pip < ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_STOPLEVEL)
                              {         ct_Drive.TDD.ct_TakeProfit.Curr_Pip = 0;
                                        if(ObjectFind(0, "S_EDIT " + "EDT_TP") >= 0)ObjectSetString(0, "S_EDIT " + "EDT_TP", OBJPROP_TEXT, 0, DoubleToString(ct_Drive.TDD.ct_TakeProfit.Curr_Pip, 0)); /*Set_Object*/
                              }
                              else {ct_Drive.TDD.ct_TakeProfit.Curr_Pip = ct_Drive.TDD.ct_TakeProfit.INP_Pip; }//
                    }
                    //---------------------------------------------------------------------------------------------------------------------------
                    {         //-- SymbolChanger EDT_Symbol
                              // if(PanelOnOff&&Chart.Changed())
                              if(ObjectFind(0, "S_EDIT " +  "EDT_Symbol") >= 0)
                              {         ct_Drive.TDD.ct_Market_Symbol.DevSymbol.Inp = ObjectGetString(0, "S_EDIT " + "EDT_Symbol", OBJPROP_TEXT); //GetSymbol_.SymbolInput
                                        if(ct_Drive.TDD.ct_Market_Symbol.DevSymbol.Inp != "" && _Symbol != ct_Drive.TDD.ct_Market_Symbol.DevSymbol.Inp)
                                        {         if(ct_Drive.TDD.ct_Market_Symbol.SymbolFind(ct_Drive.TDD.ct_Market_Symbol.DevSymbol.Inp))
                                                  {         ChartSetSymbolPeriod(0, ct_Drive.TDD.ct_Market_Symbol.DevSymbol.Inp, PERIOD_CURRENT); //Set_Chart
                                                  }
                                                  else
                                                  {         //-- WrongSymbol_.SymbolInput
                                                            MessageBox("Warning: Symbol " + ct_Drive.TDD.ct_Market_Symbol.DevSymbol.Inp + " couldn't be found!\n\nMake sure it is available in the symbol list.\n(View -> Curr_Symbol / Ctrl+U)",
                                                                       MB_CAPTION, MB_OK | MB_ICONWARNING);
                                                            ObjectSetString(0, "S_EDIT " + "EDT_Symbol", OBJPROP_TEXT, _Symbol); //Reset
                                                  }//
                                        }//
                              }//
                    }
                    //---------------------------------------------------------------------------------------------------------------------------
          }
          //--
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//| Set_Colors                                                        |
//+------------------------------------------------------------------+
bool C_TRADEPANEL::Set_Colors(const int Type)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          //--
          if(Type == LIGHT)
          {         //-- Light
                    COLOR_BG      = C'240,240,240';
                    COLOR_FONT    = C'40,41,59';
                    COLOR_FONT2   = COLOR_FONT;
                    COLOR_MOVE    = clrDarkGray;
                    COLOR_GREEN   = clrForestGreen;
                    COLOR_RED     = clrIndianRed;
                    COLOR_HEDGE   = clrGreen;
                    COLOR_ASK_REC = C'255,228,255';
                    COLOR_BID_REC = C'215,228,255';
                    COLOR_BORDER  = clrNONE; //
          }
          else
          {         //-- Dark
                    COLOR_BG      = C'28,28,28';
                    COLOR_FONT    = clrDarkGray;//C_STATICSUN::COLOR_FONT
                    COLOR_FONT2   = COLOR_BG;
                    COLOR_MOVE    = clrDimGray;
                    COLOR_GREEN   = clrLimeGreen;
                    COLOR_RED     =  clrRed;
                    COLOR_HEDGE   = clrGreen;
                    COLOR_ASK_REC = std_Global.COLOR_SELL;
                    COLOR_BID_REC = std_Global.COLOR_BUY;
                    COLOR_BORDER  = clrNONE;///
          }
          //--
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          return true; //
}
//+------------------------------------------------------------------+
//| Set_Theme                                                         |
//+------------------------------------------------------------------+
void C_TRADEPANEL::Set_PanleTheme(const int Type)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          // OBJPREFIX + "RESET"
          // OBJPREFIX + "BCKGRND[]"
          // OBJPREFIX + "CLOSE¹²³"
          // OBJPREFIX + "SYMBOL¤"
          // OBJPREFIX + "BID[]"
          // OBJPREFIX + "DWNTICKS"
          // OBJPREFIX + "SPREAD§"
          // OBJPREFIX + "SPREAD"
          // OBJPREFIX + "TIMER"
          long chart_ID = ChartData_ChartInfo.ID;
          if(Type == LIGHT)
          {         //-- Light
                    COLOR_BG = C'240,240,240';
                    COLOR_FONT = C'40,41,59';
                    COLOR_MOVE = clrDarkGray;
                    COLOR_GREEN = clrForestGreen;
                    COLOR_RED = clrIndianRed;
                    COLOR_HEDGE = clrDarkOrange;
                    //-- Set_Objects
                    if(ObjectFind(chart_ID, OBJPREFIX + "KeyReset") >= 0)ObjectSetInteger(0, OBJPREFIX + "KeyReset", OBJPROP_BGCOLOR, COLOR_MOVE);
                    if(ObjectFind(chart_ID, OBJPREFIX + "KeyReset") >= 0)ObjectSetInteger(0, OBJPREFIX + "KeyReset", OBJPROP_COLOR, COLOR_FONT);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "RLBL_BorderBS") >= 0)ObjectSetInteger(0, OBJPREFIX + "RLBL_BorderBS", OBJPROP_BGCOLOR, COLOR_BG);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "BTN_PadFlowMover") >= 0)ObjectSetInteger(0, OBJPREFIX + "BTN_PadFlowMover", OBJPROP_BGCOLOR, COLOR_MOVE);
                    if(ObjectFind(chart_ID, OBJPREFIX + "BTN_PadFlowMover") >= 0)ObjectSetInteger(0, OBJPREFIX + "BTN_PadFlowMover", OBJPROP_COLOR, COLOR_FONT);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_CLOSE¹²³") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_CLOSE¹²³", OBJPROP_COLOR, COLOR_FONT);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "EDT_Symbol") >= 0)ObjectSetInteger(0, OBJPREFIX + "EDT_Symbol", OBJPROP_BGCOLOR, COLOR_BG);
                    if(ObjectFind(chart_ID, OBJPREFIX + "EDT_Symbol") >= 0)ObjectSetInteger(0, OBJPREFIX + "EDT_Symbol", OBJPROP_COLOR, COLOR_FONT);
                    if(ObjectFind(chart_ID, OBJPREFIX + "RLBL_ASK") >= 0)ObjectSetInteger(0, OBJPREFIX + "RLBL_ASK", OBJPROP_BGCOLOR, C'255,228,255');
                    if(ObjectFind(chart_ID, OBJPREFIX + "RLBL_ASK") >= 0)ObjectSetInteger(0, OBJPREFIX + "RLBL_ASK", OBJPROP_COLOR, C'255,228,255');
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_ASK") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_ASK", OBJPROP_COLOR, COLOR_FONT);
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_UPTICKS") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_UPTICKS", OBJPROP_COLOR, COLOR_FONT);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "RLBL_BID") >= 0)ObjectSetInteger(0, OBJPREFIX + "RLBL_BID", OBJPROP_BGCOLOR, C'215,228,255');
                    if(ObjectFind(chart_ID, OBJPREFIX + "RLBL_BID") >= 0)ObjectSetInteger(0, OBJPREFIX + "RLBL_BID", OBJPROP_COLOR, C'215,228,255');
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_BID") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_BID", OBJPROP_COLOR, COLOR_FONT);
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_DWNTICKS") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_DWNTICKS", OBJPROP_COLOR, COLOR_FONT);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_SPREAD§") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_SPREAD§", OBJPROP_COLOR, COLOR_FONT);
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_SPREAD") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_SPREAD", OBJPROP_COLOR, COLOR_FONT);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_Timer") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_Timer", OBJPROP_COLOR, COLOR_FONT);
                    //-- StoreSelectedTheme
                    SelectedTheme = LIGHT;
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          }
          else
          {         //-- Dark
                    COLOR_BG = C'28,28,28';
                    COLOR_FONT = clrDarkGray;
                    COLOR_MOVE = clrDimGray;
                    COLOR_GREEN = clrLimeGreen;
                    COLOR_RED = clrRed;
                    COLOR_HEDGE = clrGold;
                    //-- Set_Objects
                    if(ObjectFind(chart_ID, OBJPREFIX + "KeyReset") >= 0) ObjectSetInteger(0, OBJPREFIX + "KeyReset", OBJPROP_BGCOLOR, COLOR_MOVE);
                    if(ObjectFind(chart_ID, OBJPREFIX + "KeyReset") >= 0) ObjectSetInteger(0, OBJPREFIX + "KeyReset", OBJPROP_COLOR, COLOR_FONT);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "RLBL_BorderBS") >= 0)ObjectSetInteger(0, OBJPREFIX + "RLBL_BorderBS", OBJPROP_BGCOLOR, COLOR_BG);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "Move2") >= 0)ObjectSetInteger(0, OBJPREFIX + "Move2", OBJPROP_BGCOLOR, COLOR_MOVE);
                    if(ObjectFind(chart_ID, OBJPREFIX + "Move2") >= 0)ObjectSetInteger(0, OBJPREFIX + "Move2", OBJPROP_COLOR, COLOR_FONT);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "LabelClose¹²³") >= 0)ObjectSetInteger(0, OBJPREFIX + "LabelClose¹²³", OBJPROP_COLOR, COLOR_FONT);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "EDT_Symbol") >= 0)ObjectSetInteger(0, OBJPREFIX + "EDT_Symbol", OBJPROP_BGCOLOR, COLOR_BG);
                    if(ObjectFind(chart_ID, OBJPREFIX + "EDT_Symbol") >= 0)ObjectSetInteger(0, OBJPREFIX + "EDT_Symbol", OBJPROP_COLOR, COLOR_FONT);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "RLBL_ASK") >= 0)ObjectSetInteger(0, OBJPREFIX + "RLBL_ASK", OBJPROP_BGCOLOR, std_Global.COLOR_SELL);
                    if(ObjectFind(chart_ID, OBJPREFIX + "RLBL_ASK") >= 0)ObjectSetInteger(0, OBJPREFIX + "RLBL_ASK", OBJPROP_COLOR, std_Global.COLOR_SELL);
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_ASK") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_ASK", OBJPROP_COLOR, COLOR_BG);
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_UPTICKS") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_UPTICKS", OBJPROP_COLOR, COLOR_BG);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "RLBL_BID") >= 0)ObjectSetInteger(0, OBJPREFIX + "RLBL_BID", OBJPROP_BGCOLOR, std_Global.COLOR_BUY);
                    if(ObjectFind(chart_ID, OBJPREFIX + "RLBL_BID") >= 0)ObjectSetInteger(0, OBJPREFIX + "RLBL_BID", OBJPROP_COLOR, std_Global.COLOR_BUY);
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_BID") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_BID", OBJPROP_COLOR, COLOR_BG = clrAqua);
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_DWNTICKS") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_DWNTICKS", OBJPROP_COLOR, COLOR_BG);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_SPREAD§") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_SPREAD§", OBJPROP_COLOR, COLOR_FONT);
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_SPREAD") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_SPREAD", OBJPROP_COLOR, COLOR_FONT);
                    //--
                    if(ObjectFind(chart_ID, OBJPREFIX + "LBL_Timer") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_Timer", OBJPROP_COLOR, COLOR_FONT);
                    //-- StoreSelectedTheme
                    SelectedTheme = DARK;
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          }//
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          //--
}
//+------------------------------------------------------------------+
//| SymbolInfo                                                       |
//+------------------------------------------------------------------+
void C_TRADEPANEL::SymbolInfo( bool KeyRun)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          if(KeyRun)
          {         //  if(PanelOnOff)
                    //-- Set_Objects
                    if(ObjectFind(0, "LBL_ASK") >= 0)ObjectSetString(0, "LBL_ASK", OBJPROP_TEXT, DoubleToString(MarketInfo(_Symbol, MODE_ASK), _Digits));
                    if(ObjectFind(0, "LBL_BID") >= 0)ObjectSetString(0, "LBL_BID", OBJPROP_TEXT, DoubleToString(MarketInfo(_Symbol, MODE_BID), _Digits));
                    if(ObjectFind(0, "LBL_UPTICKS") >= 0)ObjectSetString(0, "LBL_UPTICKS", OBJPROP_TEXT, DoubleToString(UpTicks, 0));//Alert("UpTicks","-Line:",__LINE__,"_---",UpTicks);
                    if(ObjectFind(0, "LBL_DWNTICKS") >= 0)ObjectSetString(0, "LBL_DWNTICKS", OBJPROP_TEXT, DoubleToString(DwnTicks, 0));
                    //-- Set_Objects
                    //if(ObjectFind(0, OBJPREFIX + "ASK") >= 0)ObjectSetString(0, OBJPREFIX + "ASK", OBJPROP_TEXT, DoubleToString(MarketInfo(_Symbol, MODE_ASK), _Digits));
                    //if(ObjectFind(0, OBJPREFIX + "BID") >= 0)ObjectSetString(0, OBJPREFIX + "BID", OBJPROP_TEXT, DoubleToString(MarketInfo(_Symbol, MODE_BID), _Digits));
                    //if(ObjectFind(0, OBJPREFIX + "UPTICKS") >= 0)ObjectSetString(0, OBJPREFIX + "UPTICKS", OBJPROP_TEXT, DoubleToString(UpTicks, 0));
                    //if(ObjectFind(0, OBJPREFIX + "DWNTICKS") >= 0)ObjectSetString(0, OBJPREFIX + "DWNTICKS", OBJPROP_TEXT, DoubleToString(DwnTicks, 0));
                    //if(ObjectFind(0, OBJPREFIX + "TIMER") >= 0)ObjectSetString(0, OBJPREFIX + "TIMER", OBJPROP_TEXT, "--> " + TimeToString(Time[0] + Period() * 60 - TimeCurrent(), TIME_MINUTES | TIME_SECONDS));
                    //if(ObjectFind(0, OBJPREFIX + "SPREAD") >= 0)ObjectSetString(0, OBJPREFIX + "SPREAD", OBJPROP_TEXT, DoubleToString(MarketInfo(_Symbol, MODE_SPREAD), 0) + "p");
                    //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    //-
                    if(ct_Drive.TDD.ct_Market_Symbol.Is_Running)
                    {         datetime timo = Time[0] + (datetime)(Period() * 60) - TimeCurrent();
                              string timingX = TimeToString(timo, TIME_MINUTES | TIME_SECONDS); //
                              if(ObjectFind(0,   "LBL_Timer") >= 0)ObjectSetString(0, "LBL_Timer", OBJPROP_TEXT, "Close--> " + timingX); //
                    }
                    else
                    {         //
                              datetime timo = Time[0] + (datetime)(Period() * 60) - Time[1] ;
                              string timingX = TimeToString(timo, TIME_MINUTES | TIME_SECONDS); //
                              if(ObjectFind(0, "LBL_Timer") >= 0)ObjectSetString(0, "LBL_Timer", OBJPROP_TEXT, "Close--> " + timingX); //
                              //
                    }
                    if(ObjectFind(0, "LBL_SPREAD") >= 0)ObjectSetString(0, "LBL_SPREAD", OBJPROP_TEXT, DoubleToString(MarketInfo(_Symbol, MODE_SPREAD), 0) + "p"); //
                    //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    if(ct_Drive.TDD.ct_SetPrices.DayClose != 0)//-- AvoidZeroDivide
                    {         //-- CalcPercentage
                              double symbol_p = NormalizeDouble((ct_Drive.TDD.ct_SetPrices.DayClose - ct_Drive.TDD.ct_SetPrices.DayOpen) / ct_Drive.TDD.ct_SetPrices.DayClose * 100, 2);//  Alert("symbol_p","-Line:",__LINE__,"_---",symbol_p);
                              //-- PositiveValue
                              if(symbol_p > 0)
                              {         //-- Set_Objects
                                        if(ObjectFind(0,   "LabelSYMBOL§") >= 0)ObjectSetString(0, "LabelSYMBOL§", OBJPROP_TEXT, 0, "é");// OBJPREFIX + "SYMBOL§"
                                        if(ObjectFind(0,   "LabelSYMBOL§") >= 0)ObjectSetInteger(0, "LabelSYMBOL§", OBJPROP_COLOR, Utilities.±Clr(symbol_p, COLOR_FONT));
                                        //--
                                        if(ObjectFind(0,   "LabelSYMBOL%") >= 0)ObjectSetString(0, "LabelSYMBOL%", OBJPROP_TEXT, 0, Utilities.±Str(symbol_p, 2) + "%");//OBJPREFIX + "SYMBOL%"
                                        if(ObjectFind(0,   "LabelSYMBOL%") >= 0)ObjectSetInteger(0, "LabelSYMBOL%", OBJPROP_COLOR, Utilities.±Clr(symbol_p, COLOR_FONT)); }
                              //-- NegativeValue
                              if(symbol_p < 0)
                              {         //-- Set_Objects
                                        if(ObjectFind(0,   "LabelSYMBOL§") >= 0)ObjectSetString(0, "LabelSYMBOL§", OBJPROP_TEXT, 0, "ê");
                                        if(ObjectFind(0,  "LabelSYMBOL§") >= 0)ObjectSetInteger(0, "LabelSYMBOL§", OBJPROP_COLOR, Utilities.±Clr(symbol_p, COLOR_FONT));
                                        //--
                                        if(ObjectFind(0,   "LabelSYMBOL%") >= 0)ObjectSetString(0, "LabelSYMBOL%", OBJPROP_TEXT, 0, Utilities.±Str(symbol_p, 2) + "%");
                                        if(ObjectFind(0,   "LabelSYMBOL%") >= 0)ObjectSetInteger(0, "LabelSYMBOL%", OBJPROP_COLOR, Utilities.±Clr(symbol_p, COLOR_FONT)); }
                              //-- NeutralValue
                              if(symbol_p == 0)
                              {         //-- Set_Objects
                                        if(ObjectFind(0,  "LabelSYMBOL§") >= 0)ObjectSetString(0, "LabelSYMBOL§", OBJPROP_TEXT, 0, "è");
                                        if(ObjectFind(0,   "LabelSYMBOL%") >= 0)ObjectSetInteger(0, "LabelSYMBOL%", OBJPROP_COLOR, Utilities.±Clr(symbol_p, COLOR_FONT));
                                        //--
                                        if(ObjectFind(0,  "LabelSYMBOL%") >= 0)ObjectSetString(0, "LabelSYMBOL%", OBJPROP_TEXT, 0, Utilities.±Str(symbol_p, 2) + "%");
                                        if(ObjectFind(0,   "LabelSYMBOL§") >= 0)ObjectSetInteger(0, "LabelSYMBOL§", OBJPROP_COLOR, Utilities.±Clr(symbol_p, COLOR_FONT)); } //
                    }//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          //--
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| AccAndTradeInfo                                                  |
//+------------------------------------------------------------------+
void C_TRADEPANEL::AccAndTradeInfo(bool KeyRun)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          if(KeyRun)
          {         if(ct_Drive.OpenPos_Count(OP_ALL) == 0)//-- ZeroOrders
                    {         //-- Set_Objects
                              if(ObjectFind(0, OBJPREFIX + "LBL_ROI") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_ROI", OBJPROP_COLOR, Utilities.±Clr( ct_Drive.TDD.ct_Bank.DailyProfits(), COLOR_FONT));
                              //TextSetFont (  OBJPREFIX + "LBL_ROI", NULL, FW_ULTRABOLD, 0);
                              if(ObjectFind(0, OBJPREFIX + "LBL_ROIa") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_ROIa", OBJPROP_COLOR, Utilities.±Clr( ct_Drive.TDD.ct_Bank.DailyProfits(), COLOR_FONT));
                              //TextSetFont (  OBJPREFIX + "LBL_ROIa", NULL, FW_BOLD, 0);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LBL_ROI2") >= 0) ObjectSetString(0, OBJPREFIX + "LBL_ROI2", OBJPROP_TEXT,  Utilities.±Str( ct_Drive.TDD.ct_Bank.DailyReturn(), 2) + "%");
                              if(ObjectFind(0, OBJPREFIX + "LBL_ROI2") >= 0) ObjectSetInteger(0, OBJPREFIX + "LBL_ROI2", OBJPROP_COLOR, Utilities.±Clr( ct_Drive.TDD.ct_Bank.DailyReturn(), COLOR_FONT));
                              // TextSetFont (  OBJPREFIX + "LBL_ROI2", NULL, FW_BOLD, 0);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LBL_PROFITS") >= 0)ObjectSetString(0, OBJPREFIX + "LBL_PROFITS", OBJPROP_TEXT, "" +  Utilities.±Str( ct_Drive.TDD.ct_Bank.DailyProfits(), 2) + ct_Drive.TDD.ct_Account.GetCurrency());
                              if(ObjectFind(0, OBJPREFIX + "LBL_PROFITS") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_PROFITS", OBJPROP_COLOR, Utilities.±Clr( ct_Drive.TDD.ct_Bank.DailyProfits(), COLOR_FONT));
                              //TextSetFont (  OBJPREFIX + "LBL_PROFITS", NULL, FW_ULTRABOLD, 0);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LBL_POINTS") >= 0)ObjectSetString(0, OBJPREFIX + "LBL_POINTS", OBJPROP_TEXT,  Utilities.±Str( ct_Drive.TDD.ct_Bank.DailyPoints(), 0) + "p");
                              if(ObjectFind(0, OBJPREFIX + "LBL_POINTS") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_POINTS", OBJPROP_COLOR, Utilities.±Clr( ct_Drive.TDD.ct_Bank.DailyPoints(), COLOR_FONT));
                              // TextSetFont (  OBJPREFIX + "LBL_POINTS", NULL, FW_ULTRABOLD, 0);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LBL_FLOATz") >= 0)ObjectSetString(0, OBJPREFIX + "LBL_FLOATz", OBJPROP_TEXT, "" + "");
                              if(ObjectFind(0, OBJPREFIX + "LBL_FLOATz") >= 0) ObjectSetInteger(0, OBJPREFIX + "LBL_FLOATz", OBJPROP_COLOR, clrNONE);
                              // TextSetFont (  OBJPREFIX + "LBL_FLOATz", NULL, FW_ULTRABOLD, 0);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT§") >= 0) ObjectSetString(0, OBJPREFIX + "LabelFLOAT§", OBJPROP_TEXT, "" + "");
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT§") >= 0) ObjectSetInteger(0, OBJPREFIX + "LabelFLOAT§", OBJPROP_COLOR, clrNONE);
                              // TextSetFont (  OBJPREFIX + "LabelFLOAT§", NULL, FW_ULTRABOLD, 0);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT$") >= 0)ObjectSetString(0, OBJPREFIX + "LabelFLOAT$", OBJPROP_TEXT, "" +  DoubleToString(0, _Digits));
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT$") >= 0)ObjectSetInteger(0, OBJPREFIX + "LabelFLOAT$", OBJPROP_COLOR, clrNONE); //
                              // TextSetFont (  OBJPREFIX + "LabelFLOAT$", NULL, FW_ULTRABOLD, 0); //
                    }//
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
                    //-- BuyOrders
                    if(ct_Drive.OpenPos_Count(OP_BUY) > 0 && ct_Drive.OpenPos_Count(OP_SELL) == 0)
                    {         //-- Set_Objects
                              if(ObjectFind(0, OBJPREFIX + "LBL_FLOATz") >= 0)ObjectSetString(0, OBJPREFIX + "LBL_FLOATz", OBJPROP_TEXT, "ö");
                              if(ObjectFind(0, OBJPREFIX + "LBL_FLOATz") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_FLOATz", OBJPROP_COLOR, clrDodgerBlue);
                              // TextSetFont (  OBJPREFIX + "LBL_FLOATz", NULL, FW_BOLD, 0);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT§") >= 0)ObjectSetString(0, OBJPREFIX + "LabelFLOAT§", OBJPROP_TEXT, "" + "Buy");
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT§") >= 0)ObjectSetInteger(0, OBJPREFIX + "LabelFLOAT§", OBJPROP_COLOR, clrDodgerBlue);
                              // TextSetFont (  OBJPREFIX + "LabelFLOAT§", NULL, FW_BOLD, 0);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT$") >= 0)ObjectSetString(0, OBJPREFIX + "LabelFLOAT$", OBJPROP_TEXT, "" + DoubleToString(ct_Drive.AVG_Price(), _Digits));
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT$") >= 0)ObjectSetInteger(0, OBJPREFIX + "LabelFLOAT$", OBJPROP_COLOR, clrDodgerBlue);
                              // TextSetFont (  OBJPREFIX + "LabelFLOAT$", NULL, FW_BOLD, 0);//
                    }
                    //-- SellOrders
                    if(ct_Drive.OpenPos_Count(OP_SELL) > 0 && ct_Drive.OpenPos_Count(OP_BUY) == 0)
                    {         //-- Set_Objects
                              if(ObjectFind(0, OBJPREFIX + "LBL_FLOATz") >= 0)ObjectSetString(0, OBJPREFIX + "LBL_FLOATz", OBJPROP_TEXT, "ø");
                              if(ObjectFind(0, OBJPREFIX + "LBL_FLOATz") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_FLOATz", OBJPROP_COLOR, clrOrangeRed);
                              //TextSetFont (  "Arial", 222, FW_BOLD, 0);//
                              //  ObjectSetString(0, "LBL_FLOATz",OBJPROP_SYMBOL,"Arial",10);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT§") >= 0)ObjectSetString(0, OBJPREFIX + "LabelFLOAT§", OBJPROP_TEXT, "" + "Sell");
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT§") >= 0)ObjectSetInteger(0, OBJPREFIX + "LabelFLOAT§", OBJPROP_COLOR, clrOrangeRed);
                              // TextSetFont (  OBJPREFIX + "LabelFLOAT§", NULL, FW_BOLD, 0);//
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT$") >= 0)ObjectSetString(0, OBJPREFIX + "LabelFLOAT$", OBJPROP_TEXT, "" + DoubleToString(ct_Drive.AVG_Price(), _Digits));
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT$") >= 0)ObjectSetInteger(0, OBJPREFIX + "LabelFLOAT$", OBJPROP_COLOR, clrOrangeRed);
                              // TextSetFont (  OBJPREFIX + "LabelFLOAT$", NULL, FW_BOLD, 0);//
                    }
                    //-- Buy&Sell Orders (Hedge)
                    if(ct_Drive.OpenPos_Count(OP_BUY) > 0 && ct_Drive.OpenPos_Count(OP_SELL) > 0)
                    {         //-- Set_Objects
                              if(ObjectFind(0, OBJPREFIX + "LBL_FLOATz") >= 0)ObjectSetString(0, OBJPREFIX + "LBL_FLOATz", OBJPROP_TEXT, "ô");
                              if(ObjectFind(0, OBJPREFIX + "LBL_FLOATz") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_FLOATz", OBJPROP_COLOR, COLOR_HEDGE);
                              // TextSetFont (  OBJPREFIX + "LBL_FLOATz", NULL, FW_BOLD, 0);//
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT§") >= 0)ObjectSetString(0, OBJPREFIX + "LabelFLOAT§", OBJPROP_TEXT, "" + "Hedge");
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT§") >= 0)ObjectSetInteger(0, OBJPREFIX + "LabelFLOAT§", OBJPROP_COLOR, COLOR_HEDGE);
                              // TextSetFont (  OBJPREFIX + "LabelFLOAT§", NULL, FW_BOLD, 0);//
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT$") >= 0)ObjectSetString(0, OBJPREFIX + "LabelFLOAT$", OBJPROP_TEXT, "" + DoubleToString(ct_Drive.AVG_Price(), _Digits));
                              if(ObjectFind(0, OBJPREFIX + "LabelFLOAT$") >= 0)ObjectSetInteger(0, OBJPREFIX + "LabelFLOAT$", OBJPROP_COLOR, COLOR_HEDGE);
                              //  TextSetFont (  OBJPREFIX + "LabelFLOAT$", NULL, FW_BOLD, 0);//
                    }
                    //-- AtLeastOneOrder
                    if(ct_Drive.OpenPos_Count(OP_ALL) > 0)
                    {         //-- Set_Objects
                              if(ObjectFind(0, OBJPREFIX + "LBL_ROI") >= 0) ObjectSetInteger(0, OBJPREFIX + "LBL_ROI", OBJPROP_COLOR, clrNONE);
                              //TextSetFont (  OBJPREFIX + "LBL_ROI", NULL, FW_BOLD, 0);//
                              if(ObjectFind(0, OBJPREFIX + "LBL_ROIa") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_ROIa", OBJPROP_COLOR, clrNONE);
                              // TextSetFont (  OBJPREFIX + "LBL_ROIa", NULL, FW_BOLD, 0);//
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LBL_ROI2") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_ROI2", OBJPROP_COLOR, clrNONE);
                              //  TextSetFont (  OBJPREFIX + "LBL_ROI2", NULL, FW_BOLD, 0);//
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LBL_PROFITS") >= 0)ObjectSetString(0, OBJPREFIX + "LBL_PROFITS", OBJPROP_TEXT, "" + Utilities.±Str(ct_Drive.All_Profits(), 2) + ct_Drive.TDD.ct_Account.GetCurrency());
                              // TextSetFont (  OBJPREFIX + "LBL_PROFITS", NULL, FW_BOLD, 0);//
                              if(ObjectFind(0, OBJPREFIX + "LBL_PROFITS") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_PROFITS", OBJPROP_COLOR, Utilities.±Clr(ct_Drive.All_Profits(), COLOR_FONT));
                              // TextSetFont (  OBJPREFIX + "LBL_PROFITS", NULL, FW_BOLD, 0);//
                              //--
                              if(ObjectFind(0, OBJPREFIX + "LBL_POINTS") >= 0)ObjectSetString(0, OBJPREFIX + "LBL_POINTS", OBJPROP_TEXT, "" + Utilities.±Str(ct_Drive.All_Points(), 0) + "p");
                              if(ObjectFind(0, OBJPREFIX + "LBL_POINTS") >= 0)ObjectSetInteger(0, OBJPREFIX + "LBL_POINTS", OBJPROP_COLOR, Utilities.±Clr(ct_Drive.All_Points(), COLOR_FONT));
                              // TextSetFont (  OBJPREFIX + "LBL_POINTS", NULL, FW_BOLD, 0);//
                    }//
          }
          else
          {         if(ct_Drive.OpenPos_Count(OP_ALL) == 0)//-- ZeroOrders
                    {         //-- Set_Objects
                              if(ObjectFind(0, OBJPREFIX + "ROIª") >= 0)ObjectSetInteger(0, OBJPREFIX + "ROIª", OBJPROP_COLOR, Utilities.±Clr( ct_Drive.TDD.ct_Bank.DailyProfits()));
                              if(ObjectFind(0, OBJPREFIX + "ROI§") >= 0)ObjectSetInteger(0, OBJPREFIX + "ROI§", OBJPROP_COLOR, Utilities.±Clr( ct_Drive.TDD.ct_Bank.DailyProfits(), COLOR_FONT));
                              //--
                              if(ObjectFind(0, OBJPREFIX + "ROI%") >= 0)ObjectSetString(0, OBJPREFIX + "ROI%", OBJPROP_TEXT, Utilities.±Str( ct_Drive.TDD.ct_Bank.DailyReturn(), 2) + "%");
                              if(ObjectFind(0, OBJPREFIX + "ROI%") >= 0)ObjectSetInteger(0, OBJPREFIX + "ROI%", OBJPROP_COLOR, Utilities.±Clr( ct_Drive.TDD.ct_Bank.DailyReturn(), COLOR_FONT));
                              //--
                              if(ObjectFind(0, OBJPREFIX + "PROFITS") >= 0)ObjectSetString(0, OBJPREFIX + "PROFITS", OBJPROP_TEXT, Utilities.±Str( ct_Drive.TDD.ct_Bank.DailyProfits(), 2) + ct_Drive.TDD.ct_Account.GetCurrency());
                              if(ObjectFind(0, OBJPREFIX + "PROFITS") >= 0)ObjectSetInteger(0, OBJPREFIX + "PROFITS", OBJPROP_COLOR, Utilities.±Clr( ct_Drive.TDD.ct_Bank.DailyProfits(), COLOR_FONT));
                              //--
                              if(ObjectFind(0, OBJPREFIX + "POINTS") >= 0)ObjectSetString(0, OBJPREFIX + "POINTS", OBJPROP_TEXT, Utilities.±Str( ct_Drive.TDD.ct_Bank.DailyPoints(), 0) + "p");
                              if(ObjectFind(0, OBJPREFIX + "POINTS") >= 0)ObjectSetInteger(0, OBJPREFIX + "POINTS", OBJPROP_COLOR, Utilities.±Clr( ct_Drive.TDD.ct_Bank.DailyPoints(), COLOR_FONT));
                              //--
                              if(ObjectFind(0, OBJPREFIX + "FLOATª") >= 0)ObjectSetString(0, OBJPREFIX + "FLOATª", OBJPROP_TEXT, "");
                              if(ObjectFind(0, OBJPREFIX + "FLOATª") >= 0)ObjectSetInteger(0, OBJPREFIX + "FLOATª", OBJPROP_COLOR, clrNONE);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "FLOAT§") >= 0)ObjectSetString(0, OBJPREFIX + "FLOAT§", OBJPROP_TEXT, "");
                              if(ObjectFind(0, OBJPREFIX + "FLOAT§") >= 0)ObjectSetInteger(0, OBJPREFIX + "FLOAT§", OBJPROP_COLOR, clrNONE);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "FLOAT$") >= 0)ObjectSetString(0, OBJPREFIX + "FLOAT$", OBJPROP_TEXT, DoubleToString(0, _Digits));
                              if(ObjectFind(0, OBJPREFIX + "FLOAT$") >= 0)ObjectSetInteger(0, OBJPREFIX + "FLOAT$", OBJPROP_COLOR, clrNONE); }
                    //-- BuyOrders
                    if(ct_Drive.OpenPos_Count(OP_BUY) > 0 && ct_Drive.OpenPos_Count(OP_SELL) == 0)
                    {         //-- Set_Objects
                              if(ObjectFind(0, OBJPREFIX + "FLOATª") >= 0)ObjectSetString(0, OBJPREFIX + "FLOATª", OBJPROP_TEXT, "ö");
                              if(ObjectFind(0, OBJPREFIX + "FLOATª") >= 0)ObjectSetInteger(0, OBJPREFIX + "FLOATª", OBJPROP_COLOR, clrDodgerBlue);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "FLOAT§") >= 0)ObjectSetString(0, OBJPREFIX + "FLOAT§", OBJPROP_TEXT, "Buy");
                              if(ObjectFind(0, OBJPREFIX + "FLOAT§") >= 0)ObjectSetInteger(0, OBJPREFIX + "FLOAT§", OBJPROP_COLOR, clrDodgerBlue);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "FLOAT$") >= 0)ObjectSetString(0, OBJPREFIX + "FLOAT$", OBJPROP_TEXT, DoubleToString(ct_Drive.AVG_Price(), _Digits));
                              if(ObjectFind(0, OBJPREFIX + "FLOAT$") >= 0)ObjectSetInteger(0, OBJPREFIX + "FLOAT$", OBJPROP_COLOR, clrDodgerBlue); }
                    //-- SellOrders
                    if(ct_Drive.OpenPos_Count(OP_SELL) > 0 && ct_Drive.OpenPos_Count(OP_BUY) == 0)
                    {         //-- Set_Objects
                              if(ObjectFind(0, OBJPREFIX + "FLOATª") >= 0)ObjectSetString(0, OBJPREFIX + "FLOATª", OBJPROP_TEXT, "ø");
                              if(ObjectFind(0, OBJPREFIX + "FLOATª") >= 0)ObjectSetInteger(0, OBJPREFIX + "FLOATª", OBJPROP_COLOR, clrOrangeRed);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "FLOAT§") >= 0)ObjectSetString(0, OBJPREFIX + "FLOAT§", OBJPROP_TEXT, "Sell");
                              if(ObjectFind(0, OBJPREFIX + "FLOAT§") >= 0)ObjectSetInteger(0, OBJPREFIX + "FLOAT§", OBJPROP_COLOR, clrOrangeRed);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "FLOAT$") >= 0)ObjectSetString(0, OBJPREFIX + "FLOAT$", OBJPROP_TEXT, DoubleToString(ct_Drive.AVG_Price(), _Digits));
                              if(ObjectFind(0, OBJPREFIX + "FLOAT$") >= 0)ObjectSetInteger(0, OBJPREFIX + "FLOAT$", OBJPROP_COLOR, clrOrangeRed); }
                    //-- Buy&Sell Orders (Hedge)
                    if(ct_Drive.OpenPos_Count(OP_BUY) > 0 && ct_Drive.OpenPos_Count(OP_SELL) > 0)
                    {         //-- Set_Objects
                              if(ObjectFind(0, OBJPREFIX + "FLOATª") >= 0)ObjectSetString(0, OBJPREFIX + "FLOATª", OBJPROP_TEXT, "ô");
                              if(ObjectFind(0, OBJPREFIX + "FLOATª") >= 0)ObjectSetInteger(0, OBJPREFIX + "FLOATª", OBJPROP_COLOR, COLOR_HEDGE);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "FLOAT§") >= 0)ObjectSetString(0, OBJPREFIX + "FLOAT§", OBJPROP_TEXT, "Hedge");
                              if(ObjectFind(0, OBJPREFIX + "FLOAT§") >= 0)ObjectSetInteger(0, OBJPREFIX + "FLOAT§", OBJPROP_COLOR, COLOR_HEDGE);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "FLOAT$") >= 0)ObjectSetString(0, OBJPREFIX + "FLOAT$", OBJPROP_TEXT, DoubleToString(ct_Drive.AVG_Price(), _Digits));
                              if(ObjectFind(0, OBJPREFIX + "FLOAT$") >= 0)ObjectSetInteger(0, OBJPREFIX + "FLOAT$", OBJPROP_COLOR, COLOR_HEDGE); }
                    //-- AtLeastOneOrder
                    if(ct_Drive.OpenPos_Count(OP_ALL) > 0)
                    {         //-- Set_Objects
                              if(ObjectFind(0, OBJPREFIX + "ROIª") >= 0)ObjectSetInteger(0, OBJPREFIX + "ROIª", OBJPROP_COLOR, clrNONE);
                              if(ObjectFind(0, OBJPREFIX + "ROI§") >= 0)ObjectSetInteger(0, OBJPREFIX + "ROI§", OBJPROP_COLOR, clrNONE);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "ROI%") >= 0)ObjectSetInteger(0, OBJPREFIX + "ROI%", OBJPROP_COLOR, clrNONE);
                              //--
                              if(ObjectFind(0, OBJPREFIX + "PROFITS") >= 0)ObjectSetString(0, OBJPREFIX + "PROFITS", OBJPROP_TEXT, Utilities.±Str(ct_Drive.All_Profits(), 2) + ct_Drive.TDD.ct_Account.GetCurrency());
                              if(ObjectFind(0, OBJPREFIX + "PROFITS") >= 0)ObjectSetInteger(0, OBJPREFIX + "PROFITS", OBJPROP_COLOR, Utilities.±Clr(ct_Drive.All_Profits(), COLOR_FONT));
                              //--
                              if(ObjectFind(0, OBJPREFIX + "POINTS") >= 0)ObjectSetString(0, OBJPREFIX + "POINTS", OBJPROP_TEXT, Utilities.±Str(ct_Drive.All_Points(), 0) + "p");
                              if(ObjectFind(0, OBJPREFIX + "POINTS") >= 0)ObjectSetInteger(0, OBJPREFIX + "POINTS", OBJPROP_COLOR, Utilities.±Clr(ct_Drive.All_Points(), COLOR_FONT)); } } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TRADEPANEL::Set_ValuesPing()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          if( ObjectFind(0, OBJPREFIX + "LBL_ConnectionPing") >= 0)
          {         //-- Set_TransparentColor
                    int sRed = 88, sGreen = 88, sBlue = 88, sRGB = 0;
                    sRGB = (sBlue << 16); sRGB |= (sGreen << 8); sRGB |= sRed;
                    //--
                    double Ping = TerminalInfoInteger(TERMINAL_PING_LAST); //Set_PingToMs
                    string text = TerminalInfoInteger(TERMINAL_CONNECTED) ? DoubleToString(Ping / 1000, 2) + " ms" : "NC"; /*Set_Text*/
                    //--
                    ObjectSetText(OBJPREFIX + "LBL_ConnectionPing", text, 7, NULL, sRGB);
                    // Create2(0, OBJPREFIX + "LBL_ConnectionPing", 0, ChartMiddleX(), ChartMiddleY(), CORNER_LEFT_UPPER, text, "Tahoma", 50, sRGB, 0, ANCHOR_CENTER, true, false, true, 0, "\n");
                    //--
                    // Sleep(1000);
                    ///C_STATICSUN::DeleteObject(OBJPREFIX + "PING", __LINE__);
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
} //
//+------------------------------------------------------------------+
//| GetSet_Coordinates                                                |
//+------------------------------------------------------------------+
void C_TRADEPANEL::GetSet_Coordinates()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          if(ObjectFind(0, OBJPREFIX + "BCKGRND[]") >= 0) //ObjectNotFound
          {         //-- DeleteObjects (Background must be at the back)
                    for(int i = 0; i < ObjectsTotal(); i++)
                    {         //-- GetObjectName
                              string obj_name = ObjectName(i);
                              //-- PrefixObjectFound
                              if(StringSubstr(obj_name, 0, StringLen(OBJPREFIX)) == OBJPREFIX)
                              {         //-- DeleteObjects
                                        if(ObjectFind(0, OBJPREFIX) >= 0)
                                                  if(ObjectsDeleteAll(0, OBJPREFIX, -1, -1) > 0)
                                                            break;//
                              } //
                    }
                    //-- GetXYValues (Saved)
                    if(GlobalVariableGet(ExpertName + " - X") != 0 && GlobalVariableGet(ExpertName + " - Y") != 0)
                    {         x1 = (int)GlobalVariableGet(ExpertName + " - X");
                              y1 = (int)GlobalVariableGet(ExpertName + " - Y"); }
                    //-- Set_XYValues (Default)
                    else
                    {         x1 = CLIENT_BG_X;
                              y1 = CLIENT_BG_Y; }
                    //-- CreateObject (Background)
                    //Create2(0, OBJPREFIX + "BCKGRND[]", 0, x1, y1, x2, y2, COLOR_BG, BORDER_FLAT, CORNER_LEFT_UPPER, clrOrange, STYLE_SOLID, 1, false, true, true, 0, "\n");
                    //ObjectSetInteger(0, OBJPREFIX + "BCKGRND[]", OBJPROP_SELECTED, false); //UnselectObject
          }
          //-- GetCoordinates
          //x1 = (int)ObjectGetInteger(0, OBJPREFIX + "BCKGRND[]", OBJPROP_XDISTANCE);
          //y1 = (int)ObjectGetInteger(0, OBJPREFIX + "BCKGRND[]", OBJPROP_YDISTANCE);
          //-- Set_CommonAxis
          button_y = y1 + y2 - (BUTTON_HEIGHT + BUTTON_GAP_Y);
          inputs_y = button_y - BUTTON_HEIGHT - BUTTON_GAP_Y;
          label_y = inputs_y + EDIT_HEIGHT / 2;
          //--
          fr_x = x1 + SPEEDBAR_GAP_X;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          //--
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TRADEPANEL::Deiniting(bool KeyRun = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          if(KeyRun)
          {         //
                    const int reason = -2;
                    if(0)
                    {         //--- DestroyTimer
                              //EventKillTimer();//void
                              //IS_TimerEnabled = false; //
                    }
                    //if(!IsTesting())
                    if(ChartGetInteger(0, CHART_EVENT_MOUSE_MOVE))Dev_Chart_Window.Set_ChartEvent_MouseMove(false); //-- DisableEventMouseMove
                    if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
                    //-- SaveStoredValues
                    if(reason != REASON_INITFAILED)
                              GlobalVar(true);             //-- ResetStoredTicks
                    if(reason == REASON_CHARTCHANGE)
                    {         UpTicks = 0;
                              DwnTicks = 0; }
                    //-- DeleteObjects
                    if(reason <= REASON_REMOVE || reason == REASON_INITFAILED)
                    {         if(ObjectsTotal() > 0)
                              {         for(int i = 0; i < ObjectsTotal(); i++)
                                        {         //-- GetObjectName
                                                  string obj_name = ObjectName(i);
                                                  //-- PrefixObjectFound
                                                  if(StringSubstr(obj_name, 0, StringLen(OBJPREFIX)) == OBJPREFIX)
                                                  {         //-- DeleteObjects
                                                            if(ObjectFind(0, OBJPREFIX) >= 0)
                                                                      if(ObjectsDeleteAll(0, OBJPREFIX, -1, -1) < 0)
                                                                      {         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
                                                                                break;//
                                                                      }//
                                                  } //
                                        }//
                              }//
                    }
                    //-- StoreDeinitReason
                    LastReason = reason;//
                    Dev_Chart_Window.OBJ_cleaner();
                    ///Alert("(3246)-"+"~OnChartOBJ()","-Line:",__LINE__);//
                    {         //delete ButtonX; delete ButtonY; delete BarTimer; delete StartTimeX; delete StartTimeY ;
                              //delete m_shape;
                              //m_shape = NULL;
                    }//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_TRADEPANEL::GlobalVar(bool Set_ = false)
{         return false;//
          if(!Set_ && true )
          {         KeyGlobalCheckSound       = GlobalVariableCheck(ExpertName + " - Sound");//
                    GetGlobalVarSound         = GlobalVariableGet(ExpertName + " - Sound");//
                    GetGlobalVarSelectedTheme = (int)GlobalVariableGet(ExpertName + " - Theme");
                    GetGlobalVarPutLots       = GlobalVariableGet(ExpertName + " - PutLots");
                    GetGlobalVarStopLoss      = (int)GlobalVariableGet(ExpertName + " - StopLoss");
                    GetGlobalVarTakeProfit    = (int)GlobalVariableGet(ExpertName + " - TakeProfit");
                    GetGlobalVarCloseMode     = (int)GlobalVariableGet(ExpertName + " - Close");//
                    return true;//
          }//
          else if( true )
          {         //
                    //-- SaveXYAxis
                    GlobalVariableSet(ExpertName + " - X", x1);
                    GlobalVariableSet(ExpertName + " - Y", y1);
                    //-- SaveUserInputs
                    GlobalVariableSet(ExpertName + " - PutLots", ct_Drive.TDD.st_Size.Curr_Lots);
                    GlobalVariableSet(ExpertName + " - StopLoss", ct_Drive.TDD.ct_StopLoss.Curr_Pip);
                    GlobalVariableSet(ExpertName + " - TakeProfit", ct_Drive.TDD.ct_TakeProfit.Curr_Pip);
                    //-- Strategy Tester
                    if(!IsTesting())
                    {         GlobalVariableSet(ExpertName + " - Theme", SelectedTheme);
                              GlobalVariableSet(ExpertName + " - Sound", Sound.IS_SoundEnabled);
                              GlobalVariableSet(ExpertName + " - Close", CloseMode); }
                    //--
                    GlobalVariablesFlush();
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
                    return true;//
          } //
          return false;//
}

//+------------------------------------------------------------------+
//||   ||||||||||              C_TRADEPANEL.mqh                     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
