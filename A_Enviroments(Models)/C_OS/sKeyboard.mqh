//+------------------------------------------------------------------+
//|                                           C_KEYBOARD.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\WinUser32.mqh>
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
//+------------------------------------------------------------------+
//|             Class C_KEYBOARD     BEGIN-END               |
//+------------------------------------------------------------------+
//#import "user32.dll"
//int     GetKeyState(int nVirtKey);///keyboard Key State
//#import
class C_KEYBOARD
{
public://Constructors
          void           C_KEYBOARD();
          void           ~C_KEYBOARD();
//#define KEYEVENTF_EXTENDEDKEY          0x0001
///#define KEYEVENTF_KEYUP                0x0002 \\\relase key   ///redefined in #include <WinUser32.mqh>

#define VK_0   48
#define VK_1   49
#define VK_2   50
#define VK_3   51
#define VK_4   52
#define VK_5   53
#define VK_6   54
#define VK_7   55
#define VK_8   56
#define VK_9   57
#define VK_A   65
#define VK_B   66
#define VK_C   67
#define VK_D   68
#define VK_E   69
#define VK_F   70
#define VK_G   71
#define VK_H   72
#define VK_I   73
#define VK_J   74
#define VK_K   75
#define VK_L   76
#define VK_M   77
#define VK_N   78
#define VK_O   79
#define VK_P   80
#define VK_Q   81
#define VK_R   82
#define VK_S   83
#define VK_T   84
#define VK_U   85
#define VK_V   86
#define VK_W   87
#define VK_X   88
#define VK_Y   89
#define VK_Z   90

//====
#define VK_LBUTTON         1     //Left mouse button
#define VK_RBUTTON         2     //Right mouse button
#define VK_CANCEL          3     //Control-break processing
#define VK_MBUTTON         4     //Middle mouse button (three-button mouse)
//====
#define VK_BACK            8     //BACKSPACE key
#define VK_TAB             9     //TAB key
#define VK_CLEAR           12    //CLEAR key
#define VK_RETURN          13    //ENTER key
#define VK_SHIFT           16    //SHIFT key
#define VK_CONTROL         17    //CTRL key
#define VK_MENU            18    //ALT key
#define VK_PAUSE           19    //PAUSE key
#define VK_CAPITAL         20    //CAPS LOCK key
#define VK_ESCAPE          27    //ESC key
#define VK_SPACE           32    //SPACEBAR
#define VK_PRIOR           33    //PAGE UP key
#define VK_NEXT            34    //PAGE DOWN key
#define VK_END             35    //END key
#define VK_HOME            36    //HOME key
#define VK_LEFT            37    //LEFT ARROW key
#define VK_UP              38    //UP ARROW key
#define VK_RIGHT           39    //RIGHT ARROW key
#define VK_DOWN            40    //DOWN ARROW key
#define VK_PRINT           42    //PRINT key
#define VK_SNAPSHOT        44    //PRINT SCREEN key
#define VK_INSERT          45    //INS key
#define VK_DELETE          46    //DEL key
#define VK_HELP            47    //HELP key
#define VK_LWIN            91    //Left Windows key (Microsoft® Natural® keyboard)
#define VK_RWIN            92    //Right Windows key (Natural keyboard)
#define VK_APPS            93    //Applications key (Natural keyboard)
#define VK_SLEEP           95    //Computer Sleep key
#define VK_NUMPAD0         96    //Numeric keypad 0 key
#define VK_NUMPAD1         97    //Numeric keypad 1 key
#define VK_NUMPAD2         98    //Numeric keypad 2 key
#define VK_NUMPAD3         99    //Numeric keypad 3 key
#define VK_NUMPAD4         100   //Numeric keypad 4 key
#define VK_NUMPAD5         101   //Numeric keypad 5 key
#define VK_NUMPAD6         102   //Numeric keypad 6 key
#define VK_NUMPAD7         103   //Numeric keypad 7 key
#define VK_NUMPAD8         104   //Numeric keypad 8 key
#define VK_NUMPAD9         105   //Numeric keypad 9 key
#define VK_MULTIPLY        106   //Multiply key
#define VK_ADD             107   //Add key
#define VK_SEPARATOR       108   //Separator key
#define VK_SUBTRACT        109   //Subtract key
#define VK_DECIMAL         110   //Decimal key
#define VK_DIVIDE          111   //Divide key
#define VK_F1              112   //F1 key
#define VK_F2              113   //F2 key
#define VK_F3              114   //F3 key
#define VK_F4              115   //F4 key
#define VK_F5              116   //F5 key
#define VK_F6              117   //F6 key
#define VK_F7              118   //F7 key
#define VK_F8              119   //F8 key
#define VK_F9              120   //F9 key
#define VK_F10             121   //F10 key
#define VK_F11             122   //F11 key
#define VK_F12             123   //F12 key
#define VK_F13             124   //F13 key
#define VK_NUMLOCK         144   //NUM LOCK key
#define VK_SCROLL          145   //SCROLL LOCK key
#define VK_LSHIFT          160   //Left SHIFT key
#define VK_RSHIFT          161   //Right SHIFT key
#define VK_LCONTROL        162   //Left CONTROL key
#define VK_RCONTROL        163   //Right CONTROL key
#define VK_LMENU           164   //Left MENU key
#define VK_RMENU           165   //Right MENU key
#define KEY_NUMPAD_5       12


#define KEYx_NUMLOCK_DOWN   98
#define KEYx_NUMLOCK_LEFT  100
#define KEYx_NUMLOCK_5     101
#define KEYx_NUMLOCK_RIGHT 102
#define KEYx_NUMLOCK_UP    104
#define KEYx_F11           122   //F11 key
#define KEYx_LEFT           37
#define KEYx_RIGHT          39
#define KEYx_UP             38
#define KEYx_DOWN           40
////
#define VK_ATTN      0xF6 /* Attn key */
#define VK_CRSEL     0xF7 /* CrSel key */
#define VK_EXSEL     0xF8 /* ExSel key */
#define VK_EREOF     0xF9 /* Erase EOF key */
#define VK_PLAY      0xFA /* Play key */
#define VK_ZOOM      0xFB /* Zoom key */
#define VK_NONAME    0xFC /* Reserved */
#define VK_PA1       0xFD /* PA1 key */
#define VK_OEM_CLEAR 0xFE /* Clear key */

////////==========================================
          //#define  VK_F9 0x78              // F9
          //#define  KEYEVENTF_KEYUPx KEYEVENTF_KEYUP  // key up
          //#define VK_F11             122   //F11 key
          //#define VK_F11             122   //F11 key
          //ChartSetDouble(UseChartX, CHART_FIXED_MAX, 100); //
          //keybd_event(10,10,KEYEVENTF_KEYUP,10);
          //keybd_event(0xA2, 0, 0, 0);      // press left CTRL
          //keybd_event(0x51, 0, 0, 0);      // press Q
          //keybd_event(0xA2, 0, 122, 0); // release left CTRL
          //keybd_event(0x51, 0, KEYEVENTF_KEYUP, 0); // release Q
          //
          //keybd_event(VK_F9, 0, 0, 0);
          //keybd_event(VK_F9, 0, KEYEVENTF_KEYUPx, 0);
          //keybd_event(0xA2, 0, 1, 0);      // press left CTRL
          //keybd_event(0x51, 0, 0, 0);      // press Q
          //keybd_event(0xA2, 0, KEYEVENTF_KEYUP, 0); // release left CTRL
          //keybd_event(0x51, 0, KEYEVENTF_KEYUP, 0); // release Q
          ////////==========================================
public://KeyStatesSYS

          bool  C_KEYBOARD::GetKeyState_VK_MENU;
          bool  C_KEYBOARD::GetKeyState_VK_CONTROL;
          bool  C_KEYBOARD::GetKeyState_VK_SHIFT;
          bool  C_KEYBOARD::GetKeyState_VK_RBUTTON;
          bool  C_KEYBOARD::GetKeyState_VK_LBUTTON;
          bool  C_KEYBOARD::GetKeyState_VK_MBUTTON;
          bool  C_KEYBOARD::GetKeyState_VK_SPACE;
          bool  C_KEYBOARD::GetKeyState_VK_0;
          bool  C_KEYBOARD::GetKeyState_VK_1;
          bool  C_KEYBOARD::GetKeyState_VK_2;
          bool  C_KEYBOARD::GetKeyState_VK_3;
          bool  C_KEYBOARD::GetKeyState_VK_4;
          bool  C_KEYBOARD::GetKeyState_VK_5;
          bool  C_KEYBOARD::GetKeyState_VK_6;
          bool  C_KEYBOARD::GetKeyState_VK_7;
          bool  C_KEYBOARD::GetKeyState_VK_8;
          bool  C_KEYBOARD::GetKeyState_VK_9;
          bool  C_KEYBOARD::GetKeyState_VK_A;
          bool  C_KEYBOARD::GetKeyState_VK_B;
          bool  C_KEYBOARD::GetKeyState_VK_C;
          bool  C_KEYBOARD::GetKeyState_VK_D;
          bool  C_KEYBOARD::GetKeyState_VK_E;
          bool  C_KEYBOARD::GetKeyState_VK_F;
          bool  C_KEYBOARD::GetKeyState_VK_G;
          bool  C_KEYBOARD::GetKeyState_VK_H;
          bool  C_KEYBOARD::GetKeyState_VK_I;
          bool  C_KEYBOARD::GetKeyState_VK_J;
          bool  C_KEYBOARD::GetKeyState_VK_K;
          bool  C_KEYBOARD::GetKeyState_VK_L;
          bool  C_KEYBOARD::GetKeyState_VK_M;
          bool  C_KEYBOARD::GetKeyState_VK_N;
          bool  C_KEYBOARD::GetKeyState_VK_O;
          bool  C_KEYBOARD::GetKeyState_VK_P;
          bool  C_KEYBOARD::GetKeyState_VK_Q;
          bool  C_KEYBOARD::GetKeyState_VK_R;
          bool  C_KEYBOARD::GetKeyState_VK_S;
          bool  C_KEYBOARD::GetKeyState_VK_T;
          bool  C_KEYBOARD::GetKeyState_VK_U;
          bool  C_KEYBOARD::GetKeyState_VK_V;
          bool  C_KEYBOARD::GetKeyState_VK_W;
          bool  C_KEYBOARD::GetKeyState_VK_X;
          bool  C_KEYBOARD::GetKeyState_VK_Y;
          bool  C_KEYBOARD::GetKeyState_VK_Z;

public:
          int    C_KEYBOARD::btnW, btnH, btnX, btnY, btnXSpacer, btnYSpacer ;
          int    C_KEYBOARD::Orders;
          string C_KEYBOARD::bh, brtf, bi, bo, sh, srtf, si, so ;
////////////////////////////////////////////////////////////////////////////////////////
          void  C_KEYBOARD::SendKey(int key, bool release = false);

          void  C_KEYBOARD::OnChartEvents(const int id, const long &lparam, const double &dparam, const string &sparam);
          void  C_KEYBOARD::OBJECT_CLICK(string FuncCom, const string & sparam);
          int   C_KEYBOARD::RunKeyboard();
          //----------------------------------------------------------------
          bool  C_KEYBOARD::ScanPreesKeys(const int id = 0);

          //-----------------------------------------------------------------
          bool C_KEYBOARD::Press_A(); //
          bool C_KEYBOARD::Press_B(); //
          bool C_KEYBOARD::Press_C(); //
          bool C_KEYBOARD::Press_D(); //
          bool C_KEYBOARD::Press_E(); //
          bool C_KEYBOARD::Press_F(); //
          bool C_KEYBOARD::Press_G(); //
          bool C_KEYBOARD::Press_H(); //
          bool C_KEYBOARD::Press_I(); //
          bool C_KEYBOARD::Press_J(); //
          bool C_KEYBOARD::Press_K(); //
          bool C_KEYBOARD::Press_L(); //
          bool C_KEYBOARD::Press_M(); //
          bool C_KEYBOARD::Press_N(); //
          bool C_KEYBOARD::Press_O(); //
          bool C_KEYBOARD::Press_P(); //
          bool C_KEYBOARD::Press_Q(); //
          bool C_KEYBOARD::Press_R(); //
          bool C_KEYBOARD::Press_S(); //
          bool C_KEYBOARD::Press_T(); //
          bool C_KEYBOARD::Press_U(); //
          bool C_KEYBOARD::Press_V(); //
          bool C_KEYBOARD::Press_W(); //
          bool C_KEYBOARD::Press_X(); //
          bool C_KEYBOARD::Press_Y(); //
          bool C_KEYBOARD::Press_Z(); //
          bool C_KEYBOARD::Press_0(); //
          bool C_KEYBOARD::Press_1(); //
          bool C_KEYBOARD::Press_2(); //
          bool C_KEYBOARD::Press_3(); //
          bool C_KEYBOARD::Press_4(); //
          bool C_KEYBOARD::Press_5(); //
          bool C_KEYBOARD::Press_6(); //
          bool C_KEYBOARD::Press_7(); //
          bool C_KEYBOARD::Press_8(); //
          bool C_KEYBOARD::Press_9(); //

          bool C_KEYBOARD::Press_F11();


          bool C_KEYBOARD::Press_END(); //
          bool C_KEYBOARD::Press_Esc(); //
          bool C_KEYBOARD::Press_ADD(); //
          bool C_KEYBOARD::Press_SUBTRACT(); //
          bool C_KEYBOARD::Press_Ctrl_E(); //
          bool C_KEYBOARD::Press_Ctrl_F(); //

          bool C_KEYBOARD::Press_Ctrl_L(); //
          bool C_KEYBOARD::Press_Ctrl_G(); //
          bool C_KEYBOARD::Press_Ctrl_N(); //
          bool C_KEYBOARD::Press_Ctrl_I(); //
          bool C_KEYBOARD::Press_Ctrl_Y(); //
          bool C_KEYBOARD::Press_Ctrl_W(); //
//-----
          bool C_KEYBOARD::Press_Alt_1(); //
          bool C_KEYBOARD::Press_Alt_2(); //
          bool C_KEYBOARD::Press_Alt_3(); //
          bool C_KEYBOARD::Press_Alt_F(); //
          bool C_KEYBOARD::Press_Alt_I(); //
          bool C_KEYBOARD::Press_Alt_M(); //
          bool C_KEYBOARD::Press_Alt_S();
          bool C_KEYBOARD::Press_Alt_R(); //
          //---
          bool C_KEYBOARD::Press_Alt_I_I_O();//caling Indicators osilators
          bool C_KEYBOARD::Press_Alt_I_I_O_M_Enter();//caling Indicators osilators macd
          //
          bool C_KEYBOARD::Press_Alt_I_I_V_M();
          bool C_KEYBOARD::Press_Alt_I_I_V_O();//caling Indicators Volum obv
          //============
          bool C_KEYBOARD::Press_Alt_I_L_T();//caling TrenLine
          bool C_KEYBOARD::Press_Alt_I_L_H();//caling HorizontalLine
          bool C_KEYBOARD::Press_Alt_I_L_V();//caling HorizontalLine
          bool C_KEYBOARD::Press_Alt_I_L_A();//caling TrenLine By Angel
          //============
          bool C_KEYBOARD::Press_Alt_I_C_F();//caling Channel Fibo
          bool C_KEYBOARD::Press_Alt_I_C_R();//caling Channel Linear Regression
          bool C_KEYBOARD::Press_Alt_I_C_E();//caling Channel Equidistant
          bool C_KEYBOARD::Press_Alt_I_C_S();//caling Channel StandardDeviation
          //============
          bool C_KEYBOARD::Press_Alt_I_G_L();//caling GannLine
          bool C_KEYBOARD::Press_Alt_I_G_F();//caling GannFan
          bool C_KEYBOARD::Press_Alt_I_G_G();//caling GannGrid
          //============
          bool C_KEYBOARD::Press_Alt_I_F_R();//caling FibonacciRetracement
          bool C_KEYBOARD::Press_Alt_I_F_T();//caling FibonacciTimeZone
          bool C_KEYBOARD::Press_Alt_I_F_F();//caling FibonacciFan
          bool C_KEYBOARD::Press_Alt_I_F_A();//caling FibonacciArcs
          bool C_KEYBOARD::Press_Alt_I_F_E();//caling FibonacciExpansion
          //============
          bool C_KEYBOARD::Press_Alt_I_S_R();//caling ShapeRectangle
          bool C_KEYBOARD::Press_Alt_I_S_T();//caling ShapeTriangle
          bool C_KEYBOARD::Press_Alt_I_S_E();//caling ShapeEllipse

//============
          bool C_KEYBOARD::Press_Alt_C_T_ENTER_1();//caling TimeFrames_1Minute
          bool C_KEYBOARD::Press_Alt_C_T_ENTER_5();//caling TimeFrames_5Minute
          bool C_KEYBOARD::Press_Alt_C_T_ENTER_Down_Down_ENTER();//caling TimeFrames_15Minute
          bool C_KEYBOARD::Press_Alt_C_T_ENTER_3();//caling TimeFrames_30Minute
          bool C_KEYBOARD::Press_Alt_C_T_ENTER_H();//caling TimeFrames_1Hour
          bool C_KEYBOARD::Press_Alt_C_T_ENTER_4();//caling TimeFrames_4Hours
          bool C_KEYBOARD::Press_Alt_C_T_ENTER_D();//caling TimeFrames_Daily
          bool C_KEYBOARD::Press_Alt_C_T_ENTER_W();//caling TimeFrames_Weekly
          bool C_KEYBOARD::Press_Alt_C_T_ENTER_M();//caling TimeFrames_Monthly
//============
//============
          //=====================================================================

          //
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_KEYBOARD::C_KEYBOARD()
{         RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          /////
          btnW = 70;
          btnH = 16;
          btnX = 220;
          btnY = 1;
          btnXSpacer = 10;
          btnYSpacer = 4;
////////////////////////////////////////////////////////
          Orders   = 0;
          bh       = "afxBtnTradeBH";
          brtf     = "afxBtnTradeBRTF";
          bi       = "afxBtnTradeBI";
          bo       = "afxBtnTradeBO";
          sh       = "afxBtnTradeSH";
          srtf     = "afxBtnTradeSRTF";
          si       = "afxBtnTradeSI";
          so       = "afxBtnTradeSO";//
          //RunKeyboard ();//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------ +
//| Custom indicator deinitialization function                        |
//+------------------------------------------------------------------ +
void C_KEYBOARD::~C_KEYBOARD( )
{         //Alert("Deinit: ", __FUNCSIG__, __LINE__);
          if(_LastError != 0 && _LastError != 4000 && false) { Alert(ErrorDescription(_LastError) + "-", _LastError, "-", "-Line:", __LINE__, "-", __FUNCTION__); } //
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(0)
          {         int  reason = UninitializeReason();
                    Print("AFX Deinit reason: ", reason);
                    if(ObjectFind(0, "afx") >= 0)
                              if(ObjectsDeleteAll(0, "afx") < 1)
                                        Alert("Line:", __LINE__, __FUNCTION__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(false, false, true, "noteStatusLabel", __LINE__);
                    C_STATICSUN::DeleteAnaliseAllObjectName(false, false, true, "noteHeaderLabel", __LINE__);//
          }
//
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //Alert("Deinit: ", __FUNCSIG__, __LINE__);
          //=========================================================|
}

//+------------------------------------------------------------------+#define KEY_F11           122
//| Allow the sending of a button                                    |
//+------------------------------------------------------------------+ keybd_event(KEY_F11, 0, 0, 0);
void C_KEYBOARD::SendKey(int key, bool release = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Print("KeyDown");
          keybd_event(VK_MENU, 0, 0, 0);                                      // Ctrl/alt key down
          keybd_event(key, 0, 0, 0);                                          // key down
          Sleep(2000);
          keybd_event(key, 0, KEYEVENTF_KEYUP, 0);            // key up
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);        // ctrl/alt key up
          Print("KeyUp"); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}

//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void C_KEYBOARD::OnChartEvents(const int id, const long &lparam, const double &dparam, const string &sparam)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //OBJECT_CLICK(sparam);
          //=========================================================|
}//
void C_KEYBOARD:: OBJECT_CLICK(string FuncCom, const string & sparam)
{         if(sparam == bh)                        // Alt-H
          {         SendKey(VK_H, 0); }
          else if(sparam == brtf)         // Alt-T
          {         SendKey(VK_T, 0); }
          else if(sparam == bi)           // Alt-I
          {         SendKey(VK_I, 0); }
          else if(sparam == bo)           // Alt-O
          {         SendKey(VK_O, 0); }
          else if(sparam == sh)           // Alt-N
          {         SendKey(VK_N, 0); }
          else if(sparam == srtf)         // Alt-G
          {         SendKey(VK_G, 0); }
          else if(sparam == si)           // Alt-K
          {         SendKey(VK_K, 0); }
          else if(sparam == so)           // Alt-L
          {         SendKey(VK_L, 0); } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_KEYBOARD::RunKeyboard()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          C_STATICSUN::DeleteAnaliseAllObjectName(false, false, true, "afx", __LINE__);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //if(! Tools.UseButtonXCreate(bh, "Buy On H+", btnX + (btnW * 0), btnY, btnW, btnH))                           {  Alert(  ",,,-Line:", __LINE__); return(90); }
          //if(! Tools.UseButtonXCreate( brtf, "Buy On H+", btnX + (btnW * 1), btnY, btnW, btnH))                       { Alert(  ",,,-Line:", __LINE__); return(90); }
          //if(! Tools.UseButtonXCreate( bi, "Buy Inside", btnX + (btnW * 2), btnY, btnW, btnH))                         { Alert(  ",,,-Line:", __LINE__); return(90); }
          //if(! Tools.UseButtonXCreate( bo,  "Buy Outside", btnX + (btnW * 3), btnY, btnW, btnH))                       { Alert(  ",,,-Line:", __LINE__); return(90); }
          //if(! Tools.UseButtonXCreate( sh,  "Sell On H+", btnX + (btnW * 0), btnY + btnH + btnYSpacer, btnW, btnH))    { Alert(  ",,,-Line:", __LINE__); return(90); }
          //if(! Tools.UseButtonXCreate( srtf, "Sell On R/TF+", btnX + (btnW * 1), btnY + btnH + btnYSpacer, btnW, btnH)) { Alert(  ",,,-Line:", __LINE__); return(90); }
          //if(! Tools.UseButtonXCreate( si, "Sell Inside", btnX + (btnW * 2), btnY + btnH + btnYSpacer, btnW, btnH))     { Alert(  ",,,-Line:", __LINE__); return(90); }
          //if(! Tools.UseButtonXCreate( so, "Sell Outside", btnX + (btnW * 3), btnY + btnH + btnYSpacer, btnW, btnH))    { Alert(  ",,,-Line:", __LINE__); return(90); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return 0;      /////return(INIT_SUCCEEDED); //  errorrrringggg
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::ScanPreesKeys(const int id = 0)
{         //
///
          //keybd_event( 0, VK_CONTROL, 0, 0)
//
//
//-----------------
//===============================================================================================================
//yea fuctng  GetKeyState///>>>> when press right gone bool 1,else bool 0 false//////(GetKeyStateVK_CONTROL >= 0)
          {         ////=====MEGA SWITCHING KEYS STATE
                    /// int     GetKeyState(int nVirtKey);///keyboard Key State
                    {         //
                              //
                              GetKeyState_VK_MENU = (bool)GetKeyState(VK_MENU);///keyboard Key State////retun {65409,65409,true}{,0,1,false}
                              // if(GetKeyState_VK_MENU) {Alert(GetKeyState_VK_MENU, "-<<<GetKeyState_VK_MENU-"); GetKeyState_VK_MENU = false;} //
                              //else Alert(GetKeyState_VK_MENU, "-<<<GetKeyState_VK_MENU-"); //
                              //
                    }
                    ////==========================================================================================================
                    GetKeyState_VK_CONTROL = (bool)GetKeyState(VK_CONTROL);///keyboard Key State
                    //if(GetKeyState_VK_CONTROL)Alert(GetKeyState_VK_CONTROL, "-<<<GetKeyState_VK_CONTROL-");
                    ////==========================================================================================================
                    GetKeyState_VK_SHIFT = (bool)GetKeyState(VK_SHIFT);///keyboard Key State
                    // if(GetKeyState_VK_SHIFT)Alert(GetKeyState_VK_SHIFT, "-<<<GetKeyState_VK_SHIFT-");
                    ////==========================================================================================================
                    GetKeyState_VK_RBUTTON = (bool)GetKeyState(VK_RBUTTON);///keyboard Key State///>>>int  GetKeyState_VK_RBUTTON = GetKeyState(VK_RBUTTON);///keyboard Key State
                    // if(GetKeyState_VK_RBUTTON)Alert(GetKeyState_VK_RBUTTON, "-<<<GetKeyState_VK_RBUTTON-");
                    ////==========================================================================================================
                    {         if(0)
                              {         GetKeyState_VK_LBUTTON =  (bool)GetKeyState(VK_LBUTTON);///keyboard Key State///>>>runing with kernel
                                        Alert((bool)GetKeyState(VK_LBUTTON), "-<<<(bool)GetKeyState(VK_LBUTTON)-");
                                        if(GetKeyState_VK_LBUTTON)
                                        {         Alert(GetKeyState_VK_LBUTTON, "-<<<GetKeyState_VK_LBUTTON-", "---Mouse.KeyBotton_PressLeftClick_Count >>", Mouse.KeyBotton_PressLeftClick_Count );
                                                  GetKeyState_VK_LBUTTON = false;
                                                  if(Mouse.KeyBotton_PressLeftClick_Count > 3)Mouse.KeyBotton_PressLeftClick_Count = 0; //
                                                  Mouse.KeyBotton_PressLeftClick_Count++; //
                                                  //
                                        } //
                                        else
                                        {         Alert(GetKeyState_VK_LBUTTON, "-<<<GetKeyState_VK_LBUTTON-", "---Mouse.KeyBotton_PressLeftClick_Count >>", Mouse.KeyBotton_PressLeftClick_Count);
                                                  GetKeyState_VK_LBUTTON = true;
                                                  Mouse.KeyBotton_PressLeftClick_Count--; //
                                                  if(Mouse.KeyBotton_PressLeftClick_Count < 0)Mouse.KeyBotton_PressLeftClick_Count = 0; ///
                                                  //
                                        } //
                              }
                              if(id == CHARTEVENT_CLICK)///>>>>perfect Three day///end Complet succeccing...
                              {         GetKeyState_VK_LBUTTON =  (bool)GetKeyState(VK_LBUTTON);///keyboard Key State///>>>runing with kernel
                                        //Alert((bool)GetKeyState(VK_LBUTTON), "-<<<(bool)GetKeyState(VK_LBUTTON)-");///
                                        /// if(GetKeyState_VK_LBUTTON)//UnDepended to cliking,
                                        if( GetKeyState(VK_LBUTTON) >= 0)
                                        {         //
                                                  Mouse.KeyBotton_PressLeftClick_Count++; //
                                                  //Alert((bool)GetKeyState(VK_LBUTTON), "-<<<(bool)GetKeyState(VK_LBUTTON)-", "---Mouse.KeyBotton_PressLeftClicK_Count >>", Mouse.KeyBotton_PressLeftClicK_Count);///
                                                  if(Mouse.KeyBotton_PressLeftClick_Count >= 5)
                                                            Mouse.KeyBotton_PressLeftClick_Count = 0; //>>>amout controlling///gone one every clicking..
                                                  //
                                        }
                                        ///
                                        ///
                                        //
                              }
                              //
                    }
                    ////==========================================================================================================
                    {         GetKeyState_VK_MBUTTON =  (bool)GetKeyState(VK_MBUTTON);///keyboard Key State
                              // if(GetKeyState_VK_MBUTTON) {Alert(GetKeyState_VK_MBUTTON, "-<<<GetKeyState_VK_MBUTTON-"); GetKeyState_VK_MBUTTON = false;} //
                              //  else Alert(GetKeyState_VK_MBUTTON, "-<<<GetKeyState_VK_MBUTTON-"); //
                    }
                    ////==========================================================================================================
                    GetKeyState_VK_SPACE = (bool)GetKeyState(VK_SPACE); ///keyboard Key State
                    // if(GetKeyState_VK_SPACE)Alert(GetKeyState_VK_SPACE, "-<<<GetKeyState_VK_SPACE-");
                    ////==========================================================================================================
                    ////==========================================================================================================
                    GetKeyState_VK_0 = (bool)GetKeyState(VK_0);///keyboard Key State
                    // if(GetKeyState_VK_0)Alert(GetKeyState_VK_0, "-<<<GetKeyState_VK_0-");
                    ////==========================================================================================================
                    GetKeyState_VK_1 = (bool)GetKeyState(VK_1);///keyboard Key State
                    // if(GetKeyState_VK_1)Alert(GetKeyState_VK_1, "-<<<GetKeyState_VK_1-");
                    ////==========================================================================================================
                    GetKeyState_VK_2 = (bool)GetKeyState(VK_2);///keyboard Key State
                    // if(GetKeyState_VK_2)Alert(GetKeyState_VK_2, "-<<<GetKeyState_VK_2-");
                    ////==========================================================================================================
                    GetKeyState_VK_3 = (bool)GetKeyState(VK_3);///keyboard Key State
                    // if(GetKeyState_VK_3)Alert(GetKeyState_VK_3, "-<<<GetKeyState_VK_3-");
                    ////==========================================================================================================
                    GetKeyState_VK_4 = (bool)GetKeyState(VK_4);///keyboard Key State
                    // if(GetKeyState_VK_4)Alert(GetKeyState_VK_4, "-<<<GetKeyState_VK_4-");
                    ////==========================================================================================================
                    GetKeyState_VK_5 = (bool)GetKeyState(VK_5);///keyboard Key State
                    // if(GetKeyState_VK_5)Alert(GetKeyState_VK_5, "-<<<GetKeyState_VK_5-");
                    ////==========================================================================================================
                    GetKeyState_VK_6 = (bool)GetKeyState(VK_6);///keyboard Key State
                    // if(GetKeyState_VK_6)Alert(GetKeyState_VK_6, "-<<<GetKeyState_VK_6-");
                    ////==========================================================================================================
                    GetKeyState_VK_7 = (bool)GetKeyState(VK_7);///keyboard Key State
                    // if(GetKeyState_VK_7)Alert(GetKeyState_VK_7, "-<<<GetKeyState_VK_7-");
                    ////==========================================================================================================
                    GetKeyState_VK_8 = (bool)GetKeyState(VK_8);///keyboard Key State
                    // if(GetKeyState_VK_8)Alert(GetKeyState_VK_8, "-<<<GetKeyState_VK_8-");
                    ////==========================================================================================================
                    GetKeyState_VK_9 = (bool)GetKeyState(VK_9);///keyboard Key State
                    // if(GetKeyState_VK_9)Alert(GetKeyState_VK_9, "-<<<GetKeyState_VK_9-");
                    ////==========================================================================================================
                    GetKeyState_VK_A = (bool)GetKeyState(VK_A);///keyboard Key State
                    // if(GetKeyState_VK_A)Alert(GetKeyState_VK_A, "-<<<GetKeyState_VK_A-");
                    ////==========================================================================================================
                    GetKeyState_VK_B = (bool)GetKeyState(VK_B);///keyboard Key State
                    // if(GetKeyState_VK_B)Alert(GetKeyState_VK_B, "-<<<GetKeyState_VK_B-");
                    ////==========================================================================================================
                    GetKeyState_VK_C = (bool)GetKeyState(VK_C);///keyboard Key State
                    // if(GetKeyState_VK_C)Alert(GetKeyState_VK_C, "-<<<GetKeyState_VK_C-");
                    ////==========================================================================================================
                    GetKeyState_VK_D = (bool)GetKeyState(VK_D);///keyboard Key State
                    // if(GetKeyState_VK_D)Alert(GetKeyState_VK_D, "-<<<GetKeyState_VK_D-");
                    ////==========================================================================================================
                    GetKeyState_VK_E = (bool)GetKeyState(VK_E);///keyboard Key State
                    // if(GetKeyState_VK_E)Alert(GetKeyState_VK_E, "-<<<GetKeyState_VK_E-");
                    ////==========================================================================================================
                    GetKeyState_VK_F = (bool)GetKeyState(VK_F);///keyboard Key State
                    // if(GetKeyState_VK_F)Alert(GetKeyState_VK_F, "-<<<GetKeyState_VK_F-");
                    ////==========================================================================================================
                    GetKeyState_VK_G = (bool)GetKeyState(VK_G);///keyboard Key State
                    // if(GetKeyState_VK_G)Alert(GetKeyState_VK_G, "-<<<GetKeyState_VK_G-");
                    ////==========================================================================================================
                    GetKeyState_VK_H = (bool)GetKeyState(VK_H);///keyboard Key State
                    // if(GetKeyState_VK_H)Alert(GetKeyState_VK_H, "-<<<GetKeyState_VK_H-");
                    ////==========================================================================================================
                    GetKeyState_VK_I = (bool)GetKeyState(VK_I);///keyboard Key State
                    // if(GetKeyState_VK_I)Alert(GetKeyState_VK_I, "-<<<GetKeyState_VK_I-");
                    ////==========================================================================================================
                    GetKeyState_VK_J = (bool)GetKeyState(VK_J);///keyboard Key State
                    // if(GetKeyState_VK_J)Alert(GetKeyState_VK_J, "-<<<GetKeyState_VK_J-");
                    ////==========================================================================================================
                    GetKeyState_VK_K = (bool)GetKeyState(VK_K);///keyboard Key State
                    // if(GetKeyState_VK_K)Alert(GetKeyState_VK_K, "-<<<GetKeyState_VK_K-");
                    ////==========================================================================================================
                    GetKeyState_VK_L = (bool)GetKeyState(VK_L);///keyboard Key State
                    // if(GetKeyState_VK_L)Alert(GetKeyState_VK_L, "-<<<GetKeyState_VK_L-");
                    ////==========================================================================================================
                    GetKeyState_VK_M = (bool)GetKeyState(VK_M);///keyboard Key State
                    // if(GetKeyState_VK_M)Alert(GetKeyState_VK_M, "-<<<GetKeyState_VK_M-");
                    ////==========================================================================================================
                    GetKeyState_VK_N = (bool)GetKeyState(VK_N);///keyboard Key State
                    // if(GetKeyState_VK_N)Alert(GetKeyState_VK_N, "-<<<GetKeyState_VK_N-");
                    ////==========================================================================================================
                    GetKeyState_VK_O = (bool)GetKeyState(VK_O);///keyboard Key State
                    // if(GetKeyState_VK_O)Alert(GetKeyState_VK_O, "-<<<GetKeyState_VK_O-");
                    ////==========================================================================================================
                    GetKeyState_VK_P = (bool)GetKeyState(VK_P);///keyboard Key State
                    // if(GetKeyState_VK_P)Alert(GetKeyState_VK_P, "-<<<GetKeyState_VK_P-");
                    ////==========================================================================================================
                    GetKeyState_VK_Q = (bool)GetKeyState(VK_Q);///keyboard Key State
                    // if(GetKeyState_VK_Q)Alert(GetKeyState_VK_Q, "-<<<GetKeyState_VK_Q-");
                    ////==========================================================================================================
                    GetKeyState_VK_R = (bool)GetKeyState(VK_R);///keyboard Key State
                    // if(GetKeyState_VK_R)Alert(GetKeyState_VK_R, "-<<<GetKeyState_VK_R-");
                    ////==========================================================================================================
                    GetKeyState_VK_S = (bool)GetKeyState(VK_S);///keyboard Key State
                    // if(GetKeyState_VK_S)Alert(GetKeyState_VK_S, "-<<<GetKeyState_VK_S-");
                    ////==========================================================================================================
                    GetKeyState_VK_T = (bool)GetKeyState(VK_T);///keyboard Key State
                    // if(GetKeyState_VK_T)Alert(GetKeyState_VK_T, "-<<<GetKeyState_VK_T-");
                    ////==========================================================================================================
                    GetKeyState_VK_U = (bool)GetKeyState(VK_U);///keyboard Key State
                    // if(GetKeyState_VK_U)Alert(GetKeyState_VK_U, "-<<<GetKeyState_VK_U-");
                    ////==========================================================================================================
                    GetKeyState_VK_V = (bool)GetKeyState(VK_V);///keyboard Key State
                    // if(GetKeyState_VK_V)Alert(GetKeyState_VK_V, "-<<<GetKeyState_VK_V-");
                    ////==========================================================================================================
                    GetKeyState_VK_W = (bool)GetKeyState(VK_W);///keyboard Key State
                    // if(GetKeyState_VK_W)Alert(GetKeyState_VK_W, "-<<<GetKeyState_VK_W-");
                    ////==========================================================================================================
                    GetKeyState_VK_X = (bool)GetKeyState(VK_X);///keyboard Key State
                    // if(GetKeyState_VK_X)Alert(GetKeyState_VK_X, "-<<<GetKeyState_VK_X-");
                    ////==========================================================================================================
                    GetKeyState_VK_Y = (bool)GetKeyState(VK_Y);///keyboard Key State
                    // if(GetKeyState_VK_Y)Alert(GetKeyState_VK_Y, "-<<<GetKeyState_VK_Y-");
                    ////==========================================================================================================
                    GetKeyState_VK_Z = (bool)GetKeyState(VK_Z);///keyboard Key State
                    // if(GetKeyState_VK_Z)Alert(GetKeyState_VK_Z, "-<<<GetKeyState_VK_Z-");
                    ////==========================================================================================================
                    ////==========================================================================================================
                    ///
          }
          //===============================================================================================================
          if(0)   switch (0)
                    {         //       case VK_0   : {Alert(GetKeyState_VK_MENU, "-<<<GetKeyState_VK_MENU-");} break;
                              case VK_1   : {} break;
                              case VK_2   : {} break;
                              case VK_3   : {} break;
                              case VK_4   : {} break;
                              case VK_5   : {} break;
                              case VK_6   : {} break;
                              case VK_7   : {} break;
                              case VK_8   : {} break;
                              case VK_9   : {} break;
                              case VK_A   : {} break;
                              case VK_B   : {} break;
                              case VK_C   : {} break;
                              case VK_D   : {} break;
                              case VK_E   : {} break;
                              case VK_F   : {} break;
                              case VK_G   : {} break;
                              case VK_H   : {} break;
                              case VK_I   : {} break;
                              case VK_J   : {} break;
                              case VK_K   : {} break;
                              case VK_L   : {} break;
                              case VK_M   : {} break;
                              case VK_N   : {} break;
                              case VK_O   : {} break;
                              case VK_P   : {} break;
                              case VK_Q   : {} break;
                              case VK_R   : {} break;
                              case VK_S   : {} break;
                              case VK_T   : {} break;
                              case VK_U   : {} break;
                              case VK_V   : {} break;
                              case VK_W   : {} break;
                              case VK_X   : {} break;
                              case VK_Y   : {} break;
                              case VK_Z   : {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break;
                                        //case VK_MENU: {} break; //
                    }
          //======================================================================================
          bool KeyScan = false;
          // keybd_event( 0, (int)KeyScan, VK_CONTROL, 0); ///// keybd_event(int bVk,int bScan,int dwFlags,int dwExtraInfo);
          // Alert(KeyScan, "-<<KeyScan-");
          return (KeyScan);
          ////
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_A()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_A, 0, 0, 0);
                    keybd_event(VK_A, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_B()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_B, 0, 0, 0);
                    keybd_event(VK_B, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_C()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_D()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_D, 0, 0, 0);
                    keybd_event(VK_D, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_E()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_E, 0, 0, 0);
                    keybd_event(VK_E, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_F()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_F, 0, 0, 0);
                    keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_G()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_G, 0, 0, 0);
                    keybd_event(VK_G, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_H()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_H, 0, 0, 0);
                    keybd_event(VK_H, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_I()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_J()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_J, 0, 0, 0);
                    keybd_event(VK_J, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_K()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_K, 0, 0, 0);
                    keybd_event(VK_K, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_L()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_L, 0, 0, 0);
                    keybd_event(VK_L, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_M()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_M, 0, 0, 0);
                    keybd_event(VK_M, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_N()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_N, 0, 0, 0);
                    keybd_event(VK_N, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_O()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_O, 0, 0, 0);
                    keybd_event(VK_O, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_P()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_P, 0, 0, 0);
                    keybd_event(VK_P, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Q()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_Q, 0, 0, 0);
                    keybd_event(VK_Q, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_R()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_R, 0, 0, 0);
                    keybd_event(VK_R, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_S()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_S, 0, 0, 0);
                    keybd_event(VK_S, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_T()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_U()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_U, 0, 0, 0);
                    keybd_event(VK_U, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_V()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_V, 0, 0, 0);
                    keybd_event(VK_V, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_W()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_W, 0, 0, 0);
                    keybd_event(VK_W, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_X()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_X, 0, 0, 0);
                    keybd_event(VK_X, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Y()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_Y, 0, 0, 0);
                    keybd_event(VK_Y, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Z()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         //
                    keybd_event(VK_Z, 0, 0, 0);
                    keybd_event(VK_Z, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_F11()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //if(True == Charter.keyMaximize.UseButton.State())
          {         //
                    ///resultX = Charter.keyMaximize.UseButton.Name();
                    keybd_event(VK_F11, 0, KEYEVENTF_KEYUP, 0);//
                    keybd_event(VK_F11, 0, 0, 0);
                    keybd_event(VK_F11, 0, KEYEVENTF_KEYUP, 0);//
          }
          //else
          //{         resultX = "Running ";  keybd_event(VK_F11, 0, 0, 0);
          //          keybd_event(VK_F11, 0, KEYEVENTF_KEYUP, 0);//
          //} //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Ctrl_L() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_CONTROL, 0, 0, 0);
          keybd_event(VK_L, 0, 0, 0);
          keybd_event(VK_L, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
} //
bool C_KEYBOARD::Press_END() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_END, 0, KEYEVENTF_KEYUP, 0); //
          keybd_event(VK_END, 0, 0, 0);
          keybd_event(VK_END, 0, KEYEVENTF_KEYUP, 0); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
} //.
bool C_KEYBOARD::Press_Esc() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_ESCAPE, 0, 0, 0);
          keybd_event(VK_ESCAPE, 0, KEYEVENTF_KEYUP, 0); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
} //
bool C_KEYBOARD::Press_ADD() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_ADD, 0, 0, 0);
          keybd_event(VK_ADD, 0, KEYEVENTF_KEYUP, 0); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; } //
bool C_KEYBOARD::Press_SUBTRACT() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_SUBTRACT, 0, 0, 0);
          keybd_event(VK_SUBTRACT, 0, KEYEVENTF_KEYUP, 0); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
} //
bool C_KEYBOARD::Press_Ctrl_E() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_E, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, 0, 0);
          keybd_event(VK_E, 0, 0, 0);
          keybd_event(VK_E, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
} //

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Ctrl_F() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);////unpress
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);////unpress
          keybd_event(VK_CONTROL, 0, 0, 0);
          keybd_event(VK_F, 0, 0, 0);
          keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);////unpress
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);////unpress
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
} //

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Ctrl_G() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_G, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, 0, 0);
          keybd_event(VK_G, 0, 0, 0);
          keybd_event(VK_G, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
bool C_KEYBOARD::Press_Ctrl_N() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_CONTROL, 0, 0, 0);
          keybd_event(VK_N, 0, 0, 0);
          keybd_event(VK_N, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
bool C_KEYBOARD::Press_Ctrl_I() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_CONTROL, 0, 0, 0);
          keybd_event(VK_I, 0, 0, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
bool C_KEYBOARD::Press_Ctrl_Y() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_Y, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, 0, 0);
          keybd_event(VK_Y, 0, 0, 0);
          keybd_event(VK_Y, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
bool C_KEYBOARD::Press_Ctrl_W()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);//Alert("Ctr+W",__LINE__,__FUNCSIG__);//
          keybd_event(VK_W, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, 0, 0);
          keybd_event(VK_W, 0, 0, 0);
          keybd_event(VK_W, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_CONTROL, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
bool C_KEYBOARD::Press_Alt_1() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, 0, 0);
          keybd_event(VK_1, 0, 0, 0);
          keybd_event(VK_1, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
bool C_KEYBOARD::Press_Alt_2() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, 0, 0);
          keybd_event(VK_2, 0, 0, 0);
          keybd_event(VK_2, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
bool C_KEYBOARD::Press_Alt_3() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, 0, 0);
          keybd_event(VK_3, 0, 0, 0);
          keybd_event(VK_3, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
bool C_KEYBOARD::Press_Alt_F() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, 0, 0);
          keybd_event(VK_F, 0, 0, 0);
          keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
bool C_KEYBOARD::Press_Alt_I()  //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, 0, 0);
          keybd_event(VK_I, 0, 0, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Alt_M() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, 0, 0);
          keybd_event(VK_M, 0, 0, 0);
          keybd_event(VK_M, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
bool C_KEYBOARD::Press_Alt_S() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, 0, 0);
          keybd_event(VK_S, 0, 0, 0);
          keybd_event(VK_S, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
bool C_KEYBOARD::Press_Alt_R() //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, 0, 0);
          keybd_event(VK_S, 0, 0, 0);
          keybd_event(VK_R, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;//
          //
} //
bool C_KEYBOARD::Press_Alt_I_I_O_M_Enter()
{         Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_O, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_M, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    //--------------------------
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_O, 0, 0, 0);
                    keybd_event(VK_O, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_M, 0, 0, 0);
                    keybd_event(VK_M, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_RETURN, 0, 0, 0);
                    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
                    //---------------//not efect
                    //keybd_event(VK_MENU, 0, 0, 0);
                    //keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //----------------
                    //keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);//
          } //
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Alt_I_I_V_M()
{
          {         Sleep(10);
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    keybd_event(VK_V, 0, KEYEVENTF_KEYUP, 0);
                    keybd_event(VK_M, 0, KEYEVENTF_KEYUP, 0);
                    //--------
                    if(1)
                    {         //
                              keybd_event(VK_MENU, 0, 0, 0);
                              keybd_event(VK_I, 0, 0, 0);
                              //--------------------------
                              keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                              keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                              //--------------
                              keybd_event(VK_I, 0, 0, 0);
                              keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                              //---------------isuue
                              keybd_event(VK_V, 0, 0, 0);
                              keybd_event(VK_V, 0, KEYEVENTF_KEYUP, 0);
                              //---------------isuue
                              keybd_event(VK_M, 0, 0, 0);
                              keybd_event(VK_M, 0, KEYEVENTF_KEYUP, 0);
                              //---------------isuue
                    } //
                    return true; //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Alt_I_I_V_O()
{
          {         Sleep(10);
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    keybd_event(VK_V, 0, KEYEVENTF_KEYUP, 0);
                    keybd_event(VK_O, 0, KEYEVENTF_KEYUP, 0);
                    //--------
                    if(1)
                    {         //
                              keybd_event(VK_MENU, 0, 0, 0);
                              keybd_event(VK_I, 0, 0, 0);
                              //--------------------------
                              keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                              keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                              //--------------
                              keybd_event(VK_I, 0, 0, 0);
                              keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                              //---------------isuue
                              keybd_event(VK_V, 0, 0, 0);
                              keybd_event(VK_V, 0, KEYEVENTF_KEYUP, 0);
                              //---------------isuue
                              keybd_event(VK_O, 0, 0, 0);
                              keybd_event(VK_O, 0, KEYEVENTF_KEYUP, 0);
                              //---------------isuue
                    } //
                    return true; //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Alt_I_L_T()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_L, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_L, 0, 0, 0);
                    keybd_event(VK_L, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
                    //---------------//not efect
                    //keybd_event(VK_MENU, 0, 0, 0);
                    //keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //----------------
                    //keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

bool C_KEYBOARD::Press_Alt_I_L_H()//caling HorizontalLine

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_L, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_H, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_L, 0, 0, 0);
                    keybd_event(VK_L, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_H, 0, 0, 0);
                    keybd_event(VK_H, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Alt_I_L_V()//caling HorizontalLine
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_L, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_V, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_L, 0, 0, 0);
                    keybd_event(VK_L, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_V, 0, 0, 0);
                    keybd_event(VK_V, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_I_L_A()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_L, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_A, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_L, 0, 0, 0);
                    keybd_event(VK_L, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_A, 0, 0, 0);
                    keybd_event(VK_A, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_I_C_F()  //caling TrenLine By Angel
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_F, 0, 0, 0);
                    keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Alt_I_C_R() //caling TrenLine By Angel
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_R, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_R, 0, 0, 0);
                    keybd_event(VK_R, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_KEYBOARD::Press_Alt_I_C_E()//caling TrenLine By Angel
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_E, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_E, 0, 0, 0);
                    keybd_event(VK_E, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_I_C_S()//caling TrenLine By Angel
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_S, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_S, 0, 0, 0);
                    keybd_event(VK_S, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_I_G_L()//caling GannLine
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_G, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_L, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_G, 0, 0, 0);
                    keybd_event(VK_G, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_L, 0, 0, 0);
                    keybd_event(VK_L, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_I_G_F()//caling GannFan
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_G, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_G, 0, 0, 0);
                    keybd_event(VK_G, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_F, 0, 0, 0);
                    keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_I_G_G()//caling GannGrid
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_G, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_G, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_G, 0, 0, 0);
                    keybd_event(VK_G, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_G, 0, 0, 0);
                    keybd_event(VK_G, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
//===========
bool C_KEYBOARD::Press_Alt_I_F_R()//caling FibonacciRetracement
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_R, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_F, 0, 0, 0);
                    keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_R, 0, 0, 0);
                    keybd_event(VK_R, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_I_F_T()//caling FibonacciTimeZone
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_F, 0, 0, 0);
                    keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_I_F_F()//caling FibonacciFan
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_F, 0, 0, 0);
                    keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_F, 0, 0, 0);
                    keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_I_F_A()//caling FibonacciArcs
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_A, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_F, 0, 0, 0);
                    keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_A, 0, 0, 0);
                    keybd_event(VK_A, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_I_F_E()//caling FibonacciExpansion
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_E, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_F, 0, 0, 0);
                    keybd_event(VK_F, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_E, 0, 0, 0);
                    keybd_event(VK_E, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //

//============
bool C_KEYBOARD::Press_Alt_I_S_R()//caling ShapeRectangle
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_S, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_R, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_S, 0, 0, 0);
                    keybd_event(VK_S, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_R, 0, 0, 0);
                    keybd_event(VK_R, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_I_S_T()//caling ShapeTriangle
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_S, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_S, 0, 0, 0);
                    keybd_event(VK_S, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_I_S_E()//caling ShapeEllipse
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_S, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_E, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_I, 0, 0, 0);
                    keybd_event(VK_I, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_S, 0, 0, 0);
                    keybd_event(VK_S, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_E, 0, 0, 0);
                    keybd_event(VK_E, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_C_T_ENTER_1()//caling TimeFrames_1Minute
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_1, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_RETURN, 0, 0, 0);
                    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_1, 0, 0, 0);
                    keybd_event(VK_1, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_C_T_ENTER_5()//caling TimeFrames_5Minute
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_5, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_RETURN, 0, 0, 0);
                    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_5, 0, 0, 0);
                    keybd_event(VK_5, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_C_T_ENTER_Down_Down_ENTER()//caling TimeFrames_15Minute
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_M, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_RETURN, 0, 0, 0);
                    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_DOWN, 0, 0, 0);
                    keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
                    keybd_event(VK_DOWN, 0, 0, 0);
                    keybd_event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_RETURN, 0, 0, 0);
                    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_C_T_ENTER_3()//caling TimeFrames_30Minute
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_3, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_RETURN, 0, 0, 0);
                    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_3, 0, 0, 0);
                    keybd_event(VK_3, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_C_T_ENTER_H()//caling TimeFrames_1Hour
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_H, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_RETURN, 0, 0, 0);
                    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_H, 0, 0, 0);
                    keybd_event(VK_H, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_C_T_ENTER_4()//caling TimeFrames_4Hours
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_4, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_RETURN, 0, 0, 0);
                    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_4, 0, 0, 0);
                    keybd_event(VK_4, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_C_T_ENTER_D()//caling TimeFrames_Daily
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_D, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_RETURN, 0, 0, 0);
                    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_D, 0, 0, 0);
                    keybd_event(VK_D, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_C_T_ENTER_W()//caling TimeFrames_Weekly
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_W, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_RETURN, 0, 0, 0);
                    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_W, 0, 0, 0);
                    keybd_event(VK_W, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
bool C_KEYBOARD::Press_Alt_C_T_ENTER_M()//caling TimeFrames_Monthly
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Sleep(10);
          keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
          keybd_event(VK_M, 0, KEYEVENTF_KEYUP, 0);
          //--------
          if(1)
          {         //
                    keybd_event(VK_MENU, 0, 0, 0);
                    keybd_event(VK_C, 0, 0, 0);
                    keybd_event(VK_C, 0, KEYEVENTF_KEYUP, 0);
                    //--------------------------
                    keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_T, 0, 0, 0);
                    keybd_event(VK_T, 0, KEYEVENTF_KEYUP, 0);
                    //--------------
                    keybd_event(VK_RETURN, 0, 0, 0);
                    keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
                    //---------------isuue
                    keybd_event(VK_M, 0, 0, 0);
                    keybd_event(VK_M, 0, KEYEVENTF_KEYUP, 0); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_KEYBOARD-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;
          //
} //
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
//+------------------------------------------------------------------+
//|             Class C_KEYBOARD     BEGIN-END               |
//+------------------------------------------------------------------+
