//+------------------------------------------------------------------+
//||   ||||||||||       St_CondicatorData_Indicators_MA.mqh         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>
//+------------------------------------------------------------------+
//|             Class ZigzagUsing     BEGIN                          |
//+------------------------------------------------------------------+
class C_ZIGZAG
{
#define LimitX  100
public:
          void          C_ZIGZAG();
          void          ~C_ZIGZAG();
          bool          Update();
          bool          UPDATED;
          bool          Running;
//====================================================================
          bool KeyOutZigoRun;
protected:
//--- input parameters
          string     inpName;           // Fibo Name
          int        inpDepth;          // ZigZag Depth       = 12;   // Depth
          int        inpDeviation;      // ZigZag Deviation   = 5; // Deviation
          int        inpBackStep;       // ZigZag BackStep    = 3; // Backstep

          int        inpLeg;            // ZigZag Leg///ZigZag Leg 10\\\\is starting place
          int        LegCount;

          //////////////////////////////////////////
          /////////////////////////////////////////
          //---- indicator buffers
          double        ZigzagBufferZero[];
          double        High_BufferOne[];
          double        Low_BufferTwo[];
          //--- globals
          int            ExtLevel;//            = 3; // recounting's depth of extremums


          //////////////////////////////////////////////
          color      inpLineColor;      // Line Color
          color      inpLevelsColor;    // Levels Color
          bool       inpRay;            // Ray
          double     inpLeveled1;         // Level 1
          double     inpLeveled2;         // Level 2
          double     inpLeveled3;         // Level 3
          double     inpLeveled4;         // Level 4
          double     inpLeveled5;         // Level 5
          double     inpLeveled6;         // Level 6
          double     inpLeveled7;         // Level 7
          double     inpLeveled8;         // Level 8
          double     inpLeveled9;         // Level 9
          //--- global variables
          double     Levels[];     // Levels Array
          /////////////////////////Holders
          int        rates_totalF;
          int        prev_calculatedF;
          datetime   timeF[], timeF_min, timeF_max;
          double     openF[], openF_min, openF_max;
          double     highF[], highF_min, highF_max;
          double     lowF[], lowF_min, lowF_max;
          double     closeF[], closeF_min, closeF_max;
          long       tick_volumeF[], tick_volumeF_min, tick_volumeF_max;
          long       volumeF[], volumeF_min, volumeF_max;
          int        spreadF[], spreadF_min, spreadF_max;
          datetime   timeTick[], timeTick_max, timeTick_min;
          double     bidTick[], bidTick_max, bidTick_min;
          double     askTick[], askTick_max, askTick_min;
          double     lastTick[], lastTick_max, lastTick_min;
          ulong      volumeTick[], volumeTick_max, volumeTick_min;
          ///////////////////////////////////////////////////////////////////////

          /////////////
//========================================================================================================
public:   bool          ZigoRun(bool & keyOut[], bool keyCreate = false);

protected:
          void           ZigZager();
          bool           IsOverStep();
          int            indicatorINIT();
          void           ArraySetValues( double &GetZigzagBufferZero[], double &GetHigh_BufferOne[], double &GetLow_BufferTwo[]);
          void           Zigzag_Init_SetValues();
          template < typename VarType > VarType Init_Resizing_and_FindMax( VarType &GetArray[], VarType &max, VarType &min, int indextype = 0);
          template < typename VarType > VarType Init_Resizing( VarType &GetArray[], int indextype = 0);
          int           InitializeAllXBuffer();
          int           Gipo(int alpha, int betta) ;
          int           GipoX(int aX, int bX) ;
          bool          Get_ZigZagValue( datetime & time[], double & price[], int LegCom = 0, int LegCountCom = 10, int DepthCom = 12, int DeviationCom = 5, int BackStepCom = 3);
//=======================================================================================================================
          bool          GetZigZagValueX(datetime & time[], double & price[], int LegCom = 0, int LegCountCom = 10, int DepthCom = 12, int DeviationCom = 5, int BackStepCom = 3, bool keyCom = false, bool result = false);

          bool          ZigEunLine () ;
          bool          drawziging();

          bool          SetZigzagLine( bool &keyOut, bool keyCreate = false);
          bool          SetZigzagArrow(bool &keyOut, bool Is_Create = false, string Name = "FR", int LegCom = 0, int LegCountCom = 200, int DepthCom = 12, int DeviationCom = 5, int BackStepCom = 3,
                                       color ColorX = clrYellow, int width = 1, ENUM_LINE_STYLE style = STYLE_DASH, bool result = false);
          bool          SetZigzagLabel(bool &keyOut, bool Is_Create = false, string Name = "FR", int LegCom = 0, int LegCountCom = 200, int DepthCom = 12, int DeviationCom = 5, int BackStepCom = 3,
                                       color ColorX = clrYellow, bool result = false);
          bool          SetZigzagLabel2(bool &keyOut, bool Is_Create = false, string Name = "FR", int LegCom = 0, int LegCountCom = 200, int DepthCom = 12, int DeviationCom = 5, int BackStepCom = 3,
                                        color ColorX = clrYellow, bool result = false);
          bool          DrwingZigo(string Name = "FR", int LegCom = 0, int LegCountCom = 200, int DepthCom = 12, int DeviationCom = 5, int BackStepCom = 3,
                                   color ColorX = clrYellow, int width = 1, ENUM_LINE_STYLE style = STYLE_DASH, bool keyCreate = false, bool result = false);
          enum   ENUM_FIBO
          {         level_0_0   = 0,  // 0.0%
                    level_23_6  = 1,  // 23.6%
                    level_38_2  = 2,  // 38.2%
                    level_50_0  = 3,  // 50.0%
                    level_61_8  = 4,  // 61.8%
                    level_100_0 = 5,  // 100.0%
                    level_161_8 = 6,  // 161.8%
                    level_261_8 = 7,  // 261.8%
                    level_423_6 = 8,  // 423.6%
          };
          double        GetFibo(const ENUM_FIBO fibo);
          void          FiboMove(string name, datetime & time[], double & price[], color clrLevels);
          bool          FiboDraw( const string name, datetime & time[], double & price[], const color clrFibo = clrRed, const color clrLevels = clrYellow);
          bool          FiboSetLevels( const string name, double & price[], const color clrLevels = clrYellow);

          double        FindClosestZZ();

          bool          RefreshRatesX(void);
          //------------------------------------------------------------
          bool          Init_ValuesArray();
          void          PutingValueToArray(double ComeLevelValues = 0 );
          bool          Run(bool Is_Create = false, bool key = true);
          bool          check_history_inputsZigZagerRun(int& INrates_totalF, int& INinpDepth, int& INinpBackStep );
          void          firstcalculationsZigZagerRun(int& i, int& limit, int& counterZ, int& WhatLookFor, int& back, int& pos, int& LastHighPos, int& LastLowPos, double& extremum, double& curlow, double& curhigh, double& LastHigh, double& LastLow );
          void          mainloopZigZagerRun(int& i, int& limit, int& counterZ, int& WhatLookFor, int& back, int& pos, int& LastHighPos, int& LastLowPos, double& extremum, double& curlow, double& curhigh, double& LastHigh, double& LastLow);
          void          finalCuttingZigZagerRun( int& i, int& limit, int& counterZ, int& WhatLookFor, int& back, int& pos, int& LastHighPos, int& LastLowPos, double& extremum, double& curlow, double& curhigh, double& LastHigh, double& LastLow );
          //------------------------------------------------------------




} ;//Zigo;
//Zigo.ZigoCheakOnTimer(); //
///Zigo.KeyOutZigoRun
//Zigo.KeyOutZigoRun = Zigo.ZigoRun(false);
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_ZIGZAG::C_ZIGZAG()
{         //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
RunCallFunction++; if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          Zigzag_Init_SetValues();
          if(IsOverStep()) { return ;}
          PutingValueToArray(inpLeveled1);
          PutingValueToArray(inpLeveled2);
          PutingValueToArray(inpLeveled3);
          PutingValueToArray(inpLeveled4);
          PutingValueToArray(inpLeveled5);
          PutingValueToArray(inpLeveled6);
          PutingValueToArray(inpLeveled7);
          PutingValueToArray(inpLeveled8);
          PutingValueToArray(inpLeveled9);
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_ZIGZAG::~C_ZIGZAG()
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Objects Error",  __LINE__, __FUNCTION__);
          //StaticFunctions::DeleteObject(inpName,__LINE__); ///removed in deinit prosess before...then object of class delete..must cheak with object find func
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::Update()
{         UPDATED = false;
          if(0)bool KeyRun = Run(1); //Not efect ////== true ? E.Alerter(true) : E.Alerter("Zigo.Run(0) ",__LINE__,__FUNCTION__); //
          if(this.KeyOutZigoRun ) //Zigo.KeyOutZigoRun////Can check on mose move on chart events
          {         color DescColorPressIN = clrNONE;
                    gFlow_Pad.LBL_Zigzag.GDC.GAC.Color(DescColorPressIN = clrBlue );
                    gFlow_Pad.LBL_L2.GDC.GAC.Color(DescColorPressIN = clrYellow ); //
          }
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATED = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          if(!this.UPDATED)             {Alert("Zigo.UPDATED: ", this.UPDATED);}
          return UPDATED;//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define arraySize 100
void C_ZIGZAG::ZigZager()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //---- indicator buffers
          ZigzagBufferZero[arraySize]       = arraySize;
          High_BufferOne[arraySize]         = arraySize;
          Low_BufferTwo[arraySize]          = arraySize;
          //--- globals
          ExtLevel                = 3; // recounting's depth of extremums
          //////////////////////////
          InitializeAllXBuffer();
          const int k = 5;
          ////////////////////////
          indicatorINIT();
          InitializeAllXBuffer();
          //--- find lowest low in depth of bars
          if(IsConnected() && false)
          {         int i = 5; double high1[]; double low1[];
                    double extremum = low1[iLowest(NULL, 0, MODE_LOW, inpDepth, i)];
                    //--- find highest high in depth of bars
                    extremum = high1[iHighest(NULL, 0, MODE_HIGH, inpDepth, i)]; }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::IsOverStep()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          bool IsOverStep =  (inpBackStep >= inpDepth);
          if(IsOverStep)
          {         Print("Backstep cannot be greater or equal to Depth");
                    // return(INIT_FAILED);
                    Alert("(IsOverStep)-" + "InpBackstep >= InpDepth"); //
                    return true; } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return false;///
}

//========================================================================================================
int C_ZIGZAG::indicatorINIT()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(inpBackStep >= inpDepth)
          {         Print("Backstep cannot be greater or equal to Depth");
                    return(INIT_FAILED); }
//--- 2 additional buffers
          IndicatorBuffers(3);
//---- drawing settings
          SetIndexStyle(0, DRAW_SECTION);
//---- indicator buffers
          ArraySetValues(ZigzagBufferZero, High_BufferOne, Low_BufferTwo);
          SetIndexEmptyValue(0, 0.0);
//---- initialization done
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(INIT_SUCCEEDED);  //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ZIGZAG::ArraySetValues( double &GetZigzagBufferZero[], double &GetHigh_BufferOne[], double &GetLow_BufferTwo[])
{         ///
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ZIGZAG::Zigzag_Init_SetValues()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
//--- input parameters
          inpName           = "Fibo_01";      // Fibo Name
          ///////////////////////
          inpDepth          = 12;             // ZigZag Depth
          inpDeviation      = 5;              // ZigZag Deviation
          inpBackStep       = 3;              // ZigZag BackStep
          inpLeg            = 0;              // ZigZag Leg 10\\\\is >>>starting place<<<
          ///////////////////
          inpLineColor      = clrRed;         // Line Color
          inpLevelsColor    = clrSteelBlue;   // Levels Color
          inpRay            = false;          // Ray
          inpLeveled1         = 0.0;            // Level 1
          inpLeveled2         = 23.6;           // Level 2
          inpLeveled3         = 38.2;           // Level 3
          inpLeveled4         = 50.0;           // Level 4
          inpLeveled5         = 61.8;           // Level 5
          inpLeveled6         = 100.0;          // Level 6
          inpLeveled7         = 161.8;          // Level 7
          inpLeveled8         = 261.8;          // Level 8
          inpLeveled9         = 423.6;          // Level 9
//--- global variables
          ArrayResize(Levels, 9, 0);   // Levels Array
          ///////////////////////////
          ArrayInitialize(timeF, 0.0);
          ArrayInitialize(openF, 0.0);
          ArrayInitialize(highF, 0.0);
          ArrayInitialize(lowF, 0.0);
          ArrayInitialize(closeF, 0.0);
          ArrayInitialize(tick_volumeF, 0.0);
          ArrayInitialize(volumeF, 0.0);
          ArrayInitialize(spreadF, 0.0);
          ////////
          ArrayInitialize(timeTick, 0.0);
          ArrayInitialize(bidTick, 0.0);
          ArrayInitialize(askTick, 0.0);
          ArrayInitialize(lastTick, 0.0);
          ArrayInitialize(volumeTick, 0.0);
          ///////////////////
          //--- globals
          ExtLevel = 3;              // recounting's depth of extremums
          rates_totalF = 0 ;
          prev_calculatedF = 0;
          Init_Resizing(timeF, 0);
          Init_Resizing(openF, 0);
          Init_Resizing(highF, 0);
          Init_Resizing(lowF, 0);
          Init_Resizing(closeF, 0);
          Init_Resizing(tick_volumeF, 0);
          Init_Resizing(volumeF, 0);
          Init_Resizing(spreadF, 0);
          //////////
          Init_Resizing(timeTick, 0);
          Init_Resizing(bidTick, 0);
          Init_Resizing(askTick, 0);
          Init_Resizing(lastTick, 0);
          Init_Resizing(volumeTick, 0);
          //////////////////////
          //Init_Resizing_and_FindMax( timeF, timeF_max, timeF_min, 0); //Alert(timeF_max, "-timeF_max//", timeF_min, "-timeF_min"); //.
          //Init_Resizing_and_FindMax( openF, openF_max, openF_min, 1); //
          //Init_Resizing_and_FindMax( highF, highF_max, highF_min, 2); //
          //Init_Resizing_and_FindMax( lowF, lowF_max, lowF_min, 3); //
          //Init_Resizing_and_FindMax( closeF, closeF_max, closeF_min, 4);//Alert(closeF_min, "-closeF_min//", closeF_max, "-closeF_max"); // //
          //Init_Resizing_and_FindMax( tick_volumeF, tick_volumeF_max, tick_volumeF_min, 5); //
          //Init_Resizing_and_FindMax( volumeF, volumeF_max, volumeF_min, 6); //
          //Init_Resizing_and_FindMax( spreadF, spreadF_max, spreadF_min, 7); //Alert(spreadF_min, "-spreadF_min//", spreadF_max, "-spreadF_max"); //.//
          ///////////////////
          // Init_Resizing_and_FindMax( timeTick, timeTick_max, timeTick_min, 1); //
          // Init_Resizing_and_FindMax( bidTick, bidTick_max, bidTick_min, 1); //
          // Init_Resizing_and_FindMax( askTick, askTick_max, askTick_min, 1); //
          // Init_Resizing_and_FindMax( lastTick, lastTick_max, lastTick_min, 1); //
          // Init_Resizing_and_FindMax( volumeTick, volumeTick_max, volumeTick_min, 1); //
          //////////////////////////////////
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          Init_ValuesArray();
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|<<LastFuncRun>>Runtime Error>>>>(-C_ZIGZAG-Error)|(arrays are incompatible)|(4056)|Result->ERR_INCOMPATIBLE_ARRAYS)|Line->353|Func->C_ZIGZAG::Zigzag_Init_SetValues
          //=========================================================|
}
template < typename VarType >
VarType C_ZIGZAG::Init_Resizing_and_FindMax( VarType &GetArray[], VarType &max, VarType &min, int indextype = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //***back min max in parameters...***//.
          uint size = ArraySize(GetArray);
          ArrayResize(GetArray, Bars, 10); //**** forget ; ****
          size = ArraySize(GetArray);
          if(size == 0) { Alert(size, "-size//"); return(0);}
          /////////////////////
          ///////////p/////////
          MqlRates rates_array[];
          MqlRates rates[];
          MqlTick  last_tick[];// int copiedXY = CopyRates(Symbol(), 0, 0, Bars, last_tick);
          ///***no common way to katch spread by candel ...just file handeling mode cn use****//////
          ArrayResize(rates_array, Bars, 10);
          ArraySetAsSeries(rates, true);
          ArraySetAsSeries(rates_array, true);///***finaly seting value to structures...***///
          ArraySetAsSeries(last_tick, true);///***finaly seting value to structures...***///
          int copied   = CopyRates(Symbol(), 0, 0, 100, rates);
          int copiedX  = CopyRates(Symbol(), 0, 0, Bars, rates_array);
          /////
          if(copied > 0)///number of copyyy
          {         string format = "open = %G, high = %G, low = %G, close = %G, volume = %d, spread = %d";
                    string out;
                    int sizeZ = fmin(copied, 10);///function returns the minimal value of two values.
                    for(int i = 0; i < sizeZ; i++)
                    {         out = (string)i + ":" + TimeToString(rates[i].time);
                              out = out + " " + StringFormat(format,
                                                             rates[i].open,
                                                             rates[i].high,
                                                             rates[i].low,
                                                             rates[i].close,
                                                             rates[i].tick_volume,
                                                             rates[i].spread);
                              // Comment(out); //
                    }//
          }//
          int spread[];
          double Range;
          double savehigh, savelow;
          {         string format = ("                         open = %G,\n                         high = %G,\n                         low = %G,\n                         close = %G,\n                         volume = %d,\n                         Range = %.2f");
                    string out;
                    ArrayResize(spread, Bars, 10);
                    uint sizeC = ArraySize(spread);
                    for(uint n = 0; n < sizeC - 11; n++)
                    {         spread[n] = rates_array[n].spread; Sleep(20);
                              long   SpreadK = SymbolInfoInteger(Symbol(), SYMBOL_SPREAD);
                              savehigh = rates_array[n].high;
                              savelow = rates_array[n].low;
                              Range = savehigh - savelow ;
                              Range = NormalizeDouble(Range, 2);
                              out = StringFormat(format,
                                                 rates_array[n].open,
                                                 rates_array[n].high,
                                                 rates_array[n].low,
                                                 rates_array[n].close,
                                                 rates_array[n].tick_volume,
                                                 Range   );
                              //Alert(savehigh);
                              // Alert(savelow);
                              //  Alert(NormalizeDouble(Range,2));
                              //  if(rates_array[n].spread > 0)
                              //Comment(out, "    -Bar[" + (string)n + "]//"); //
                    } //
          }
          ///
          long tick_volume[];
          {         ArrayResize(tick_volume, Bars, 10);
                    uint sizeD = ArraySize(tick_volume);
                    for(uint n = 0; n < sizeD - 11; n++)
                    {         tick_volume[n] = rates_array[n].tick_volume;}//
          }
          //***can put limit array size***///
          if(indextype == 0)ArrayCopy(GetArray, Time, 0, 0, WHOLE_ARRAY);
          if(indextype == 1)ArrayCopy(GetArray, Open, 0, 0, WHOLE_ARRAY);
          if(indextype == 2)ArrayCopy(GetArray, High, 0, 0, WHOLE_ARRAY);
          if(indextype == 3)ArrayCopy(GetArray, Low, 0, 0, WHOLE_ARRAY);
          if(indextype == 4)ArrayCopy(GetArray, Close, 0, 0, WHOLE_ARRAY);
          if(indextype == 5)ArrayCopy(GetArray, tick_volume, 0, 0, WHOLE_ARRAY);
          if(indextype == 6)ArrayCopy(GetArray, Volume, 0, 0, WHOLE_ARRAY);
          if(indextype == 7)ArrayCopy(GetArray, spread, 0, 0, WHOLE_ARRAY);
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__);//
          //============================//============================
          ////
          if(indextype == 0)////****the doing just***///
                    for(uint n = 0; n < size; n++)
                    {         GetArray[n] = (VarType)Time[n];
                              ///
                    }
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__);//
          //============================//============================
          int copyReturn =  ArrayCopyRates(rates_array, NULL, 0);
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__);//
          //============================//============================
          datetime daytimes[];
          ArrayCopySeries(daytimes, MODE_TIME, NULL, 0); ///MODE_OPEN///arrays are incompatible wrong parameters
          /////////////////////
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__);//
          //============================//============================
          max = GetArray[0];
          for(uint n = 1; n < size; n++)
                    if(max < GetArray[n]) max = GetArray[n];
          /////////////////
          min = GetArray[0];
          for(uint n = 1; n < size; n++)
                    if(min > GetArray[n]) min = GetArray[n];///**theLast one seting***///
//---
          //Alert((double)max, "-max//");
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(max);
          //
}

template < typename VarType >
VarType C_ZIGZAG::Init_Resizing( VarType &GetArray[], int indextype = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          uint size = ArraySize(GetArray);
          ArrayResize(GetArray, Bars, 10); //**** forget ; ****
          size = ArraySize(GetArray);
          if(size == 0) { Alert(size, "-size//"); return(0);}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return GetArray[0];
          //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_ZIGZAG::InitializeAllXBuffer()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          ArrayInitialize(ZigzagBufferZero, 0.0);////0.0 double
          ArrayInitialize(High_BufferOne, 0.0);
          ArrayInitialize(Low_BufferTwo, 0.0);
//--- first counting position
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(Bars - inpDepth);//
}


//--------------------------------------------------------------------
int C_ZIGZAG::Gipo(int alpha, int betta)           // User-defined function
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          alpha = alpha * alpha + betta * betta; // Sum of the squares of catheti
          alpha = (int)MathSqrt(alpha);              // Hypotenuse
          return(alpha);                        // Function exit operator
}
//--
//--------------------------------------------------------------------
int C_ZIGZAG::GipoX(int aX, int bX)                   // User-defined function
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return((int)MathSqrt(aX * aX + bX * bX));      // Function exit operator
}
//---
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::ZigEunLine ()          //int limiT = 5000; ////Bars;
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //for (i = 0; i < 1000; i++)
          // static int i = 0;
          ///////////////////////////////
          double ZigAT[]; double Zigon[];
          double savesigzag[];
          ArrayResize(Zigon, Bars, 10);
          ArrayInitialize(Zigon, 0);
          ArrayResize(ZigAT, Bars, 10);
          ArrayInitialize(ZigAT, 0);
          ArrayResize(savesigzag, Bars, 10);
          ArrayInitialize(savesigzag, 0);
          ///////////////////////////////
          double PriceZag = 1900;
          datetime timeZag = 0;
          datetime   time[5000];
          double   price[5000];
          // Get Times and Price ZigZag Values.
          if(!Get_ZigZagValue(time, price, 0, 20)) return false; ////
          ArraySetAsSeries(time, true); ArraySetAsSeries(price, true);
          if(0)for (int i = 1; i < Bars; i++)
                    {         if(ObjectFind(0, "UseTrendZigon" + IntegerToString(i)) < 0)
                                        Dev_Object_Pack.Lines.Trend.Create(true, false, "UseTrendZigon" + IntegerToString(i), "UseTrendDescriptionZigon", time[i], price[i], time[i - 1], price[i - 1], 1, 3); // Create new Fibonacci
                              //Alert( price[i], "_price[" + (string)i + "]"); Alert( time[i], "_time[" + (string)i + "]");
                              // Move current Fibonacci
                              if(Zigon[i] != 0)
                              {         Alert(Zigon[i]);
                                        savesigzag[i] = Zigon[i];
                                        ZigAT[i] = Zigon[i];
                                        if(i > 1)
                                        {         PriceZag = (double)ObjectGet("UseTrendZigon" + IntegerToString(i - 1), OBJPROP_PRICE1);
                                                  ///ObjectGetDouble(0,"UseTrendZigon" + IntegerToString(i-1),OBJPROP_PRICE,0);
                                                  timeZag = (datetime)ObjectGet("UseTrendZigon" + IntegerToString(i - 1), OBJPROP_TIME1);//
                                        } } //                                                    // Refresh chart
                              if(i > 1)
                              {         Dev_Object_Pack.Lines.Trend.Create(true, false, "UseTrendZigon" + IntegerToString(i), "UseTrendDescriptionZigon",
                                                                           time[i], price[i], time[i - 1], price[i - 1], 1, 3); //
                              }
                              //
                    }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true;///
} //
bool C_ZIGZAG::drawziging()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //
          double PriceZag = 1900;
          datetime timeZag = 0;
          double savesigzag[];
          ArrayResize(savesigzag, Bars, 10);
          ArrayInitialize(savesigzag, 0);
          for(int i = 0; i < Bars; i++)
          {         PriceZag = savesigzag[i]; }
          ///
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::SetZigzagArrow( bool &keyOut, bool Is_Create = false, string Name = "FR", int LegCom = 0, int LegCountCom = 200, int DepthCom = 12, int DeviationCom = 5, int BackStepCom = 3,
                               color ColorX = clrYellow, int width = 1, ENUM_LINE_STYLE style = STYLE_DASH, bool result = false)
{
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //string nameC1[]; ArrayResize(nameC1, Bars);
          //string nameC2[]; ArrayResize(nameC2, Bars);
          //string nameC3[]; ArrayResize(nameC3, Bars);
          //=========================================================|
          datetime times[];  ///in defining it has 3 eements
          double price[]; //price[2];
          static int sizetime = 0;
          static int  sizeprice = 0;
          sizetime = ArrayResize(times, Bars, 10);///zero reseved array mode
          sizeprice = ArrayResize(price, Bars, 10);
          // Get Times and Price ZigZag Values.
          if(!Get_ZigZagValue(times, price, LegCom, LegCountCom, DepthCom, DeviationCom, BackStepCom)) {Alert(" Get Times and Price ZigZag Values. false !Get_ZigZagValue "); return false;}
          //==========================================================
          for(int i = 0; i < Bars; i++)
          {         string nameC1 = "F1-" + (string)price[i] + "-" + IntegerToString(i);
//.
                    if(!Is_Create) {C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, nameC1, __LINE__); return true;} //
                    if(ObjectFind(0, nameC1) < 0 && Is_Create)
                    {         if(!ObjectCreate(0, nameC1, OBJ_ARROW, 0, times[i], price[i])) { Alert(__LINE__);} ///Time[i]
                              if(ObjectFind(0, nameC1) >= 0)// && false)///<<<<controlling
                              {         //>>>> ObjectSetInteger(0, nameC1, OBJPROP_FONTSIZE, 20);//>>>instade with work for size
                                        ObjectSetInteger(0, nameC1, OBJPROP_BACK, true);//>>>NoT Wrong
                                        if(i > Bars - 2)continue;
                                        if( price[i] > price[i + 1]) //KeyZigZagValueSafe ||
                                        {         double ZigZagValueHigh =  price[i];//ZigZagValue;//
                                                  ObjectSetInteger(0, nameC1, OBJPROP_ANCHOR, ANCHOR_BOTTOM );
                                                  ObjectSetInteger(0, nameC1, OBJPROP_ARROWCODE, 242); //>>>NoT Wrong//
                                                  ///SYMBOL_ARROWUP 241  Arrow up symbol  SYMBOL_ARROWDOWN  242  Arrow down symbol
                                                  ObjectSetInteger(0, nameC1, OBJPROP_COLOR, clrBlue);
                                                  //
                                        }
                                        else
                                        {         double ZigZagValueLow = price[i];// ZigZagValue;//
                                                  ObjectSetInteger(0, nameC1, OBJPROP_ANCHOR, ANCHOR_TOP);
                                                  ObjectSetInteger(0, nameC1, OBJPROP_ARROWCODE, 241); //>>>NoT Wrong//
                                                  ///SYMBOL_ARROWUP 241  Arrow up symbol  SYMBOL_ARROWDOWN  242  Arrow down symbol
                                                  ObjectSetInteger(0, nameC1, OBJPROP_COLOR, clrRed);
                                                  //
                                        }
                                        //ObjectSetInteger(0, nameC1, OBJPROP_ANCHOR, ANCHOR_TOP);
                                        ObjectSetInteger(0, nameC1, OBJPROP_STYLE, STYLE_DASH);//<<<DRAW_ARROW
                                        ObjectSetInteger(0, nameC1, OBJPROP_WIDTH, 1);
                                        ObjectSetInteger(0, nameC1, OBJPROP_BACK, true);
                                        ObjectSetInteger(0, nameC1, OBJPROP_SELECTABLE, false);
                                        ObjectSetInteger(0, nameC1, OBJPROP_SELECTED, false);
                                        ObjectSetInteger(0, nameC1, OBJPROP_HIDDEN, false);
                                        ObjectSetInteger(0, nameC1, OBJPROP_ZORDER, 0); //
                              } //
                              return true;//
                    } //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::SetZigzagLabel( bool &keyOut, bool Is_Create = false, string Name = "FR", int LegCom = 0, int LegCountCom = 200, int DepthCom = 12, int DeviationCom = 5, int BackStepCom = 3,
                               color ColorX = clrYellow, bool result = false )
{
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //string nameC1[]; ArrayResize(nameC1, Bars);
          //string nameC2[]; ArrayResize(nameC2, Bars);
          //string nameC3[]; ArrayResize(nameC3, Bars);
          //=========================================================|
          datetime times[];  ///in defining it has 3 eements
          double price[]; //price[2];
          static int sizetime = 0;
          static int  sizeprice = 0;
          sizetime = ArrayResize(times, Bars, 0);///zero reseved array mode
          sizeprice = ArrayResize(price, Bars, 0);
          int GetX[]; ArrayResize(GetX, Bars, 0);
          int GetY[]; ArrayResize(GetY, Bars, 0);
          // Get Times and Price ZigZag Values.
          if(!Get_ZigZagValue(times, price, LegCom, LegCountCom, DepthCom, DeviationCom, BackStepCom )) {Alert(" Get Times and Price ZigZag Values. false !Get_ZigZagValue "); return false;}
          //==========================================================
          for(int i = 0; i < Bars - 1; i++)
          {         string nameC2 = "F2-" + (string)price[i] + "-" + IntegerToString(i);
                    ////////////////////////////////////////////////////////////////////////////////////////
                    ////--- Generic gLabelX ---// gLabelX.GDS
                    {         gLabelX.GDS.Set_Action_2(MODE_CREATE, Is_Create);
                              gLabelX.GDS.Set_Desc_4(nameC2, "n", "Webdings", 14);
                              gLabelX.GDS.Set_Color_1(clrLavender);
                              gLabelX.GDS.Set_Location_5(GetX[i], GetY[i], 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                              gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "nameC2");
                              gLabelX.GDS.Set_Chart_6();
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(Is_Create, false, nameC2, "n", GetX[i], GetY[i], CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 14, "Webdings");
                    }
                    //Alert(" Get Times and Price ZigZag Values. true  "); //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return true; }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::SetZigzagLabel2( bool &keyOut, bool Is_Create = false, string Name = "FR", int LegCom = 0, int LegCountCom = 200, int DepthCom = 12, int DeviationCom = 5, int BackStepCom = 3,
                                color ColorX = clrYellow, bool result = false )
{
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //string nameC1[]; ArrayResize(nameC1, Bars);
          //string nameC2[]; ArrayResize(nameC2, Bars);
          //string nameC3[]; ArrayResize(nameC3, Bars);
          //=========================================================|
          datetime times[];  ///in defining it has 3 eements
          double price[]; //price[2];
          static int sizetime = 0;
          static int  sizeprice = 0;
          sizetime = ArrayResize(times, Bars, 0);///zero reseved array mode
          sizeprice = ArrayResize(price, Bars, 0);
          // Get Times and Price ZigZag Values.
          if(!Get_ZigZagValue(times, price, LegCom, LegCountCom, DepthCom, DeviationCom, BackStepCom )) {Alert(" Get Times and Price ZigZag Values. false !Get_ZigZagValue "); return false;}
          //==========================================================
          for(int i = 0; i < Bars; i++)
          {         string nameC3 = "F3-" + (string)price[i] + "-" + IntegerToString(i);
//.
                    int GetX[]; ArrayResize(GetX, Bars, 0);
                    int GetY[]; ArrayResize(GetY, Bars, 0);
                    ////--- Generic gLabelX ---// gLabelX.GDS
                    {         gLabelX.GDS.Set_Action_2(MODE_CREATE, Is_Create);
                              gLabelX.GDS.Set_Desc_4(nameC3, nameC3, "Webdings", 5);
                              gLabelX.GDS.Set_Color_1(clrWhite);
                              gLabelX.GDS.Set_Location_5(GetX[i], GetY[i], 0, CORNER_RIGHT_LOWER, ANCHOR_CENTER);
                              gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "nameC2");
                              gLabelX.GDS.Set_Chart_6();
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(Is_Create, false, nameC3, nameC3, GetX[i], GetY[i], CORNER_RIGHT_LOWER, ANCHOR_CENTER, true, clrWhite, 0, 5, "Webdings") ;//
                    } //
          } //
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
//const int rates_total, const int prev_calculated, const datetime & time[],
//const double & open[], const double & high[], const double & low[], const double & close[],
//const long & tick_volume[], const long & volume[], const int &spread[],
bool C_ZIGZAG::SetZigzagLine( bool & keyOut, bool keyCreate = false)
{
//---
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //////////////////////////////////////////////
          bool IS_FivoExist  = ObjectFind(0, inpName) < 0;
          bool IsDrowZigo12  = DrwingZigo("F12-", 0, 20, 12, 5, 3, clrGold, 1, STYLE_DOT, keyCreate);
          if(!IsDrowZigo12)Alert("IsDrowZigo12:", IsDrowZigo12); Sleep(10);
          //////
          bool IsDrowZigo25  = DrwingZigo("F25-", 0, 20, 25, 5, 3, clrRed, 1, STYLE_DOT, keyCreate);
          if(!IsDrowZigo25)Alert("IsDrowZigo25:", IsDrowZigo25); Sleep(10);
          //////
          bool IsDrowZigo50  = DrwingZigo("F50-", 0, 20, 50, 5, 3, clrFireBrick, 1, STYLE_DOT, keyCreate);
          if(!IsDrowZigo50)Alert("IsDrowZigo50:", IsDrowZigo50); Sleep(10);
          //////
          bool IsDrowZigo100 = DrwingZigo("F100-", 0, 20, 100, 5, 3, clrSilver, 1, STYLE_DOT, keyCreate);
          if(!IsDrowZigo100)Alert("IsDrowZigo100:", IsDrowZigo100); Sleep(10);
          //////
          bool IsDrowZigo200 = DrwingZigo("F200-", 0, 10, 200, 5, 3, clrBlue, 1, STYLE_DOT, keyCreate); ///no name issue///is naming isssuu llllfasscct///
          if(!IsDrowZigo200)Alert("IsDrowZigo200:", IsDrowZigo200); Sleep(10);
          //////
          //////////////==============================================
          if(IsDrowZigo12 && IsDrowZigo25 && IsDrowZigo50 && IsDrowZigo100 && IsDrowZigo200) keyOut = true;
          if(!keyOut)Alert("keyOut:", keyOut);
          //////;////////////////////////////////////////////////////////
          // Move current Fibonacci
          //{         if(IS_FivoExist) FiboDraw(inpName, times, price, inpLineColor, inpLevelsColor); // Create new Fibonacci
          //          else FiboMove(inpName, times, price, inpLevelsColor); //
          //          }
          //////////////==============================================
          //--- return value of prev_calculated for next call
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(keyOut);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::DrwingZigo(string Name = "FR",
                          int LegCom = 0,
                          int LegCountCom = 200,
                          int DepthCom = 12,
                          int DeviationCom = 5,
                          int BackStepCom = 3,
                          color ColorX = clrYellow,
                          int width = 1,
                          ENUM_LINE_STYLE style = STYLE_DASH,
                          bool keyCreate = false,
                          bool result = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          datetime      times[];  ///in defining it has 3 eements
          double        price[]; //price[2];
          static int    sizetime = 0;
          static int    sizeprice = 0;
          sizetime      = ArrayResize(times, Bars, 0);///zero reseved array mode
          sizeprice     = ArrayResize(price, Bars, 0);
          // Get Times and Price ZigZag Values.
          if(!Get_ZigZagValue(times, price, LegCom, LegCountCom, DepthCom, DeviationCom, BackStepCom )) {Alert(" Get Times and Price ZigZag Values. false !Get_ZigZagValue "); return false;}
          ///=========================================================
          if(keyCreate)///drowing lines by given arrays
          {         int priceSize = ArraySize(price);
                    // Alert("priceSize:", priceSize);
                    for(int j = 0 ; j < priceSize ; j++)
                    {         if(  j > LegCount - 1)continue; ///no need////9///hello atribe of*** ////
                              if(ObjectFind(0, Name + IntegerToString(j)) < 0)///j - 1
                                        if(ObjectCreate(0, Name + IntegerToString(j), OBJ_TREND, 0, times[j + 1], price[j + 1], times[j], price[j]))
                                                  if(ObjectFind(0, Name + IntegerToString(j)) >= 0)///reseting value attribe
                                                  {         ObjectSetInteger(0, Name + IntegerToString(j), OBJPROP_RAY, false); // ObjectSet(Name + IntegerToString(j), OBJPROP_RAY, false);///cause bug
                                                            ObjectSetInteger(0, Name + IntegerToString(j), OBJPROP_STYLE, style  );
                                                            ObjectSetInteger(0, Name + IntegerToString(j), OBJPROP_WIDTH, width);
                                                            ObjectSetInteger(0, Name + IntegerToString(j), OBJPROP_COLOR, ColorX);
                                                            ObjectSetInteger(0, Name + IntegerToString(j), OBJPROP_SELECTABLE, false); //
                                                            ObjectSetInteger(0, Name + IntegerToString(j), OBJPROP_BACK, true);
                                                            //ObjectSetInteger(0, nameC1, OBJPROP_BACK, true); //
                                                  }
                              // continue; ///
                    }//
                    result = true; //
                    ///Alert(" Get Times and Price ZigZag Values. true  "); //
          } //
          else if(!keyCreate)
          {         int priceSize = ArraySize(price);
                    // Alert("priceSize:", priceSize);
                    for(int j = 0 ; j < priceSize ; j++)
                    {         if(  j > LegCount - 1)continue; ///no need////9///hello atribe of*** ////
                              C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, Name + IntegerToString(j), __LINE__); ///reseting value attribe
                    }
                    // continue; ///
          }//
          result = true; //
          // Alert("deleting Get Times and Price ZigZag Values. true  "); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return result; //
}
//+------------------------------------------------------------------+
//| GetFibo                                                          |
//+------------------------------------------------------------------+
double C_ZIGZAG::GetFibo(const ENUM_FIBO fibo)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          double result = 0;;
          switch(fibo)
          {         case level_0_0:   result = 0.0;   break;
                    case level_23_6:  result = 23.6;  break;
                    case level_38_2:  result = 38.2;  break;
                    case level_50_0:  result = 50.0;  break;
                    case level_61_8:  result = 61.8;  break;
                    case level_100_0: result = 100.0; break;
                    case level_161_8: result = 161.8; break;
                    case level_261_8: result = 261.8; break;
                    case level_423_6: result = 423.6; break; }
//---
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(result);//
}
//+------------------------------------------------------------------+
//| FiboMove function                                                |
//+------------------------------------------------------------------+
void C_ZIGZAG::FiboMove(string name, datetime & time[], double & price[], color clrLevels)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
// Move current Fibonacci
          ObjectMove(0, name, 0, time[1], price[1]); // Move first point of the fibo
          ObjectMove(0, name, 1, time[0], price[0]); // Move second point of the fibo
          FiboSetLevels(name, price, clrLevels);    // Set Levels of the fibo
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| FiboDraw function                                                |
//+------------------------------------------------------------------+
bool C_ZIGZAG::FiboDraw( const string      name,                   // object name
                         datetime          & time[],               // array time
                         double            & price[],              // array price
                         const color       clrFibo = clrRed,       // object color
                         const color       clrLevels = clrYellow)  // levels color
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          long chart_ID = 0;
          int sub_window = 0;
          if(Capitan_ResetLastErrorX)
                    ResetLastError();
// Create Fibonacci Object
          if(!ObjectCreate(chart_ID, name, OBJ_FIBO, sub_window, time[1], price[1], time[0], price[0]))
          {         Print(__FUNCTION__,
                          ": failed to create \"Fibonacci Retracement\"! Error code = ", GetLastError());
                    return(false); }
//--- set fibonacci object properties
          ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clrFibo);   // Set Fibo Color
          ObjectSetInteger(chart_ID, name, OBJPROP_STYLE, STYLE_SOLID); // Set Fibo Line Style
          ObjectSetInteger(chart_ID, name, OBJPROP_WIDTH, 1);         // Set Fibo Line Width
          ObjectSetInteger(chart_ID, name, OBJPROP_BACK, false);      // Set Fibo To Front
          ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, false); // Set Fibo Not Selectable
          ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, false);  // Set Fibo Not Selected
          ObjectSetInteger(chart_ID, name, OBJPROP_RAY_RIGHT, inpRay); // Set Fibo Ray
          ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, false);    // Set Fibo Hidden in Object List
          ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, 0);
// Set Fibonacci Levels
          FiboSetLevels(name, price, clrLevels);
//--- successful execution
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(true); //
}
//+------------------------------------------------------------------+
//| FiboSetLevels function                                           |
//+------------------------------------------------------------------+
bool C_ZIGZAG::FiboSetLevels( const string      name,                   // object name
                              double            & price[],              // array price
                              const color       clrLevels = clrYellow)  // levels color
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          long chart_ID = 0;
          int sub_window = 0;
          int Num = ArraySize(Levels);
          string str = "";
          if(Capitan_ResetLastErrorX)
                    ResetLastError();
// Define number of levels
          ObjectSetInteger(chart_ID, name, OBJPROP_LEVELS, Num);
// Set Levels Properties
          for(int i = 0; i < Num; i++)
          {         ObjectSetDouble(chart_ID, name, OBJPROP_LEVELVALUE, i, Levels[i] / 100.0); // Set Level Value
                    ObjectSetInteger(chart_ID, name, OBJPROP_LEVELCOLOR, i, clrLevels);     // Set Level Color
                    ObjectSetInteger(chart_ID, name, OBJPROP_LEVELSTYLE, i, STYLE_DOT);     // Set Level Line Style
                    ObjectSetInteger(chart_ID, name, OBJPROP_LEVELWIDTH, i, 1);             // Set Level Line Width
          }
// Set Levels descriptions
          for(int i = 0; i < Num; i++)
          {         str = DoubleToString(Levels[i], 1) + "% = ";                                           // Set % levels value
                    str += DoubleToString(price[0] + (Levels[i] / 100.0) * (price[1] - price[0]), _Digits) + "  "; // Set price level value
                    ObjectSetString(chart_ID, name, OBJPROP_LEVELTEXT, i, str);                            // Set Description Text
          }
//--- successful execution
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(true);//
}
//+------------------------------------------------------------------+
//| Get_ZigZagValue function  getZigzag value                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::Get_ZigZagValue(datetime & time[], double & price[],
                              int LegCom = 0,   int LegCountCom = 10,
                              int DepthCom = 12,   int DeviationCom = 5,    int BackStepCom = 3   )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          bool result = false;
          //LegCom = inpLeg;///globalEfect
          inpLeg = LegCom;
          LegCount = LegCountCom;
          //////////////seting
          int           leg = (int)MathMax(1, LegCom);//// wave distance///The largest of the two values.///grater than one
          int           counting = 0;////counting  cnt
          int           index = 0;////index   idx
          int           Reserve = 0;
          int           j = 0;
          static int    n = 0;
          static int    sizetime = 0;
          static int    sizeprice = 0;
          double        ZigZagValue = 0;
          //---
          sizetime  = ArrayResize(time, Bars, Reserve);///no need 10 reserved
          sizeprice = ArrayResize(price, Bars, Reserve);
          //---
          int GetX[];  ArrayResize(GetX, Bars, Reserve);
          int GetY[];  ArrayResize(GetY, Bars, Reserve);
          //---
          if(0)
          {         if (ArraySize(time) != sizetime || ArraySize(price) != sizeprice)
                    {         sizetime = ArrayResize(time, Bars, Reserve);
                              sizeprice = ArrayResize(price, Bars, Reserve); }//
          }
          ///////////////doing
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(1)for(int i = 0; i < Bars - 1; i++)///main extractiong for...
                    {         //---
                              ZigZagValue = iCustom(_Symbol, 0, "ZigZag", DepthCom, DeviationCom, BackStepCom, 0, i);
                              //---
                              ///&& i < 1///not compare all
                              //if(ZigZagValue != 0) price[i] = ZigZagValue;////<<<<the diffrence is off index for existed valuse not loops steps
                              if(ZigZagValue <= 0.0 || ZigZagValue == EMPTY_VALUE || ZigZagValue > 1000000.0) continue;////exite loop stape
                              //===============================================================
                              counting++;
                              if(counting < leg) continue;////exite loop stape
                              time[index]  = Time[i];////Get Time cordinate///fill array
                              price[index] = ZigZagValue;////Get Price cordinate
                              Dev_Chart_Window.TimePrice_To_XY_Array(time[index], price[index], GetX, GetY); ///converting data...
                              index++;//--- gone if exixted zogzag...
                              //--- end for
                              if(index > LegCount) { result = true; break; } // place for end...///outing zigzaging
                    }//---ending loop Extractions
          double   priceOut = price[n];
          datetime timeOut =  time[n];
          // Alert((string)n++ +"---  price[index]:", priceOut, "--- time[index]:", timeOut);
          if(n > Bars + Reserve) {n = 0;} //Alert(__LINE__);}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result; //
}
//+------------------------------------------------------------------+
//| Get_ZigZagValue function  getZigzag value                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::GetZigZagValueX(datetime & time[], double & price[], int LegCom = 0, int LegCountCom = 10, int DepthCom = 12, int DeviationCom = 5, int BackStepCom = 3,
                               bool keyCom = false, bool result = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //LegCom = inpLeg;///globalEfect
          inpLeg = LegCom;
          LegCount = LegCountCom;
          //////////////seting
          int leg = (int)MathMax(1, LegCom);//// wave distance///The largest of the two values.///grater than one
          int counting = 0;////counting  cnt
          int index = 0;////index   idx
          double ZigZagValue = 0.0;
          double ZigZagValueFrist = 0.0;
          double ZigZagValueSecound = 0.0;
          static  double ZigZagValueSafeIN = 0.0;
          static  double ZigZagValueSafeOut = 0.0;
          //need array to comare
          double ZigZagValueSafeArrayFrist[] = {0, 0 };
          double ZigZagValueSafeArraySecound[] = {0, 0 };
          ArrayResize(ZigZagValueSafeArrayFrist, Bars, 0);///no need 10 reserved
          ArrayResize(ZigZagValueSafeArraySecound, Bars, 0);///no need 10 reserved
          static bool KeyZigZagValueSafe = false;
          double ZigZagValueHigh = 0.0;
          double ZigZagValueLow = 0.0;
          ZigZagValueSafeOut = ZigZagValueSafeIN;
          /////////////////////////////////////////
          int j = 0;
          static int n = 0;
          static int sizetime = 0;
          static int  sizeprice = 0;
          ////////////////////
          ///////////////////////////////////////////
          sizetime = ArrayResize(time, Bars, 0);///no need 10 reserved
          sizeprice = ArrayResize(price, Bars, 0);
          //============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          ////////////////////////////////////////
          ////////////////////
          ///////////////doing
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(1)
          {         ////////////////////////
                    if(0)for(int k = 0; k < Bars - 1; k++)///Parralel  calculating every loop
                              {         //ZigZagValueFrist = iCustom(_Symbol, 0, "ZigZag", DepthCom, DeviationCom, BackStepCom, 0, k);
                                        ZigZagValueSecound = iCustom(_Symbol, 0, "ZigZag", DepthCom, DeviationCom, BackStepCom, 0, k + 1);
                                        //if(ZigZagValueFrist <= 0.0 || ZigZagValueFrist == EMPTY_VALUE || ZigZagValueFrist > 1000000.0) continue;////exite loop stape//>>>>the same >>//
                                        ///Fornot out of range array<<<,,&& i < 1 ///&& i < 1///not compare allresize for all baars
                                        if(ZigZagValueSecound != 0)ZigZagValueSafeArraySecound[k] = ZigZagValueSecound;
                                        if(ZigZagValueSecound <= 0.0 || ZigZagValueSecound == EMPTY_VALUE || ZigZagValueSecound > 1000000.0) continue;////exite loop stape
                                        //
                              }
                    ///
                    for(int i = 0; i < Bars - 1; i++)
                    {         ////////////////////////
                              if(0) for(int k = 0; k < i; k++)///iner calculating every loop//k < Bars - 1<<waite fro i last zogzag value
                                        {         //ZigZagValueFrist = iCustom(_Symbol, 0, "ZigZag", DepthCom, DeviationCom, BackStepCom, 0, k);
                                                  ZigZagValueSecound = iCustom(_Symbol, 0, "ZigZag", DepthCom, DeviationCom, BackStepCom, 0, k + 1);
                                                  //if(ZigZagValueFrist <= 0.0 || ZigZagValueFrist == EMPTY_VALUE || ZigZagValueFrist > 1000000.0) continue;////exite loop stape//>>>>the same >>//
                                                  if(ZigZagValueSecound <= 0.0 || ZigZagValueSecound == EMPTY_VALUE || ZigZagValueSecound > 1000000.0) continue;////exite loop stape
                                                  //
                                        }
                              ZigZagValue = iCustom(_Symbol, 0, "ZigZag", DepthCom, DeviationCom, BackStepCom, 0, i);
                              //ZigZagValue = iCustom(Symbol(), 0, "ZigZag", inpDepth, inpDeviation, inpBackStep, 0, j);
                              ///double Zigon[];Zigon[i] = iCustom(Symbol(), Period(), "ZigZag", 12, 5, 3, 0, i);
                              //============================//============================
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //
                              //============================//============================
                              ///&& i < 1///not compare all
                              if(ZigZagValue != 0)ZigZagValueSafeArrayFrist[i] = ZigZagValue;
                              if(ZigZagValue <= 0.0 || ZigZagValue == EMPTY_VALUE || ZigZagValue > 1000000.0) continue;////exite loop stape
                              ///
                              //
                              ZigZagValueSafeIN = ZigZagValue;
                              //KeyZigZagValueSafe = ZigZagValueSafeIN >= ZigZagValueSafeIN;
                              //KeyZigZagValueSafe = !(ZigZagValueSafeIN == ZigZagValueSafeIN);
                              //===============================================================
                              // Alert(ZigZagValue, "<<ZigZagValueFrist----", ZigZagValue, "<<ZigZagValueSecound");
                              if(0) if(ZigZagValueSafeArrayFrist[i] > ZigZagValueSafeArrayFrist[i - 1]) ///(ZigZagValue > ZigZagValueSecound)
                                        {         KeyZigZagValueSafe = 1;
                                                  //Alert(ZigZagValue, "<<ZigZagValue----", ZigZagValueSecound, "<<ZigZagValueSecound"); //
                                                  Alert(ZigZagValueSafeArrayFrist[i], "<<ZigZagValueSafeArrayFrist[i]----", ZigZagValueSafeArrayFrist[i - 1], "<<ZigZagValueSafeArrayFrist[i-1]"); //
                                        }
                                        else if(ZigZagValueSafeArrayFrist[i] < ZigZagValueSafeArrayFrist[i + 1]) //(ZigZagValue < ZigZagValueSecound)
                                        {         KeyZigZagValueSafe = 0;
                                                  //Alert(ZigZagValue, "<<ZigZagValue----", ZigZagValueSecound, "<<ZigZagValueSecound"); //
                                                  Alert(ZigZagValueSafeArrayFrist[i], "<<ZigZagValueSafeArrayFrist[i]----", ZigZagValueSafeArrayFrist[i - 1], "<<ZigZagValueSafeArrayFrist[i-1]"); //
                                        }
                              if(0) if(ZigZagValueSafeArrayFrist[i] > ZigZagValueSafeArraySecound[i]) ///(ZigZagValue > ZigZagValueSecound)
                                        {         KeyZigZagValueSafe = 1;
                                                  //Alert(ZigZagValue, "<<ZigZagValue----", ZigZagValueSecound, "<<ZigZagValueSecound"); //
                                                  Alert(ZigZagValueSafeArrayFrist[i], "<<ZigZagValueSafeArrayFrist[i]----", ZigZagValueSafeArraySecound[i], "<<ZigZagValueSafeArraySecound[i]"); //
                                        }
                                        else if(ZigZagValueSafeArrayFrist[i] < ZigZagValueSafeArraySecound[i]) //(ZigZagValue < ZigZagValueSecound)
                                        {         KeyZigZagValueSafe = 0;
                                                  //Alert(ZigZagValue, "<<ZigZagValue----", ZigZagValueSecound, "<<ZigZagValueSecound"); //
                                                  Alert(ZigZagValueSafeArrayFrist[i], "<<ZigZagValueSafeArrayFrist[i]----", ZigZagValueSafeArraySecound[i], "<<ZigZagValueSafeArraySecound[i]"); //
                                        }
                              //Alert(ZigZagValueSafeIN, "<<ZigZagValueSafeIN----", ZigZagValueSafeIN, "<<ZigZagValueSafeIN");
                              if(0) if(ZigZagValueSafeIN > ZigZagValueSafeIN)
                                        {         KeyZigZagValueSafe = 1;
                                                  //Alert(ZigZagValueSafeIN, "<<ZigZagValueSafeIN----", ZigZagValueSafeIN, "<<ZigZagValueSafeIN"); //
                                        }
                                        else if(ZigZagValueSafeIN < ZigZagValueSafeIN)
                                        {         KeyZigZagValueSafe = 0;
                                                  //Alert(ZigZagValueSafeIN, "<<ZigZagValueSafeIN----", ZigZagValueSafeIN, "<<ZigZagValueSafeIN"); //
                                        }
                              ///////
                              if(0) if(KeyZigZagValueSafe)
                                        {         ZigZagValueHigh = ZigZagValue;}
                                        else
                                        {         ZigZagValueLow = ZigZagValue;}
                              //===============================================================
                              /// Alert((string)n++ + "--ZigZagValue= ",ZigZagValue);Sleep(500);
                              counting++;
                              if(counting < leg) continue;////exite loop stape
                              time[index] = Time[i];////Get Time cordinate
                              price[index] = ZigZagValue;////Get Price cordinate
                              //============================//============================
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //
                              //============================//============================
                              ///
                              index++;
                              //////////////////
                              //////////////////end for
                              if(index > LegCount) { result = true; break; } // place for end...///outing zigzaging
                    }//
          }//
//////////////////////ending
          double priceOut = price[n];
          datetime timeOut =  time[n];
          // Alert((string)n++ +"---  price[index]:", priceOut, "--- time[index]:", timeOut);
          if(n > Bars + 10) {n = 0; Alert(__LINE__);}
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double C_ZIGZAG::FindClosestZZ()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          ///iCustom(Symbol(),0,"zigzag",your parameter,your parameter,your parameter,0,i);
          double PSar = iCustom(NULL, 0, "Sar", 0.02, 0.2, 0, 0);
          int i;
          double zzh;
          for (i = 0; i < 1000; i++)
          {         zzh = iCustom(Symbol(), Period(), "ZigZag", 12, 5, 3, 0, i);
                    if (zzh != 0)
                              return(zzh); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(0);///
}
//if(
//      p4                    <  p3                   &&
//      p4                    >  p2                   &&
//      p4                    >  p1                   &&
//      p3                    >  p2                   &&
//      p3                    >  p1                   &&
//      p2                    <  p1                   &&
//      BUY                   <= Max_long_Orders      &&
//      p3                    != p3_trade_long        &&
//      CCI                   >  100                  &&
//      Ask                   >= p3                   &&
//      new_trade_allowed     == true                 &&
//      buy_allowed           == true                      //trend check
//     )
///////////////////////===
//int n, i,
// double p0, p1, p2, p3, p4, p5;
// i=0;
//    while(n<5)
//    {
//    if(p0>0) {p5=p4; p4=p3; p3=p2; p2=p1; p1=p0; }
//    p0=iCustom(Symbol(),0,"zigzag",ExtDepth,ExtDeviation,ExtBackstep,0,i);
//    if(p0>0) {n+=1; }
//    i++;
//    }
//  Hello all,
//
//I've been looking for an answer aswell of how to get those high and low values from the ZigZag indicator. As i didn't come up with a solution, i've programed it myself,  and i'm sharing it so other people that find same problem have already a solution.
//
//First problem is that ZigZag indicator redraws, so, getting last high or low, needs a little bit of a trick.
//
//To get other values we should add this code to your EA.
//
// Please notice that the cycle begins with i=2, 10000 is the number of highs or lows you need, 10.000 is just an example.
//
//The values will be saved on Array temp in wich
//
//Position 0 saves the last high or low drawn in the chart, position 1 saves the high or low previous and so on...
//
//for(int i=2;i<10000;i++)
//
//       {
//
//         zo=iCustom(Symbol(),PERIOD_M15,"ZigZag",0,i);
//
//         if(zo!=0) // while Zigzag does't get a higher high, or deapth, deviation , etc conditions are not yet satisfied, ZigZag indicator equals zero , so we need to filter this empty values.
//
//            {
//
//                temp[k]=zo; // highs and lows are saved in array temp[]
//
//                k++;
//
//      }
//
//
//
//
//
// Now, to get last Wave value, you just have use current price, you comparing it to value saved in position 0,
//
// if (Ask>temp[0]) means that last value was a low, so to get distance you just need to do last_wave=Ask-temp[0]
//
//else means last value was a high to get distance do last_wave= temp[0]-Ask
//
//if you don't need to know wheather it's a low or a high, and you just want the distance, then you just do last_wave= MathAbs(Ask-temp[0]) (distance always positive, right? ;) )
//
//and that's about it, hope it helped.
//
//good luck in your programming!
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::RefreshRatesX(void)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
//--- refresh rates
          if(!RefreshRates())
          {         Print("RefreshRates error");
                    return(false); }
//--- protection against the return value of "zero"
          if(Ask == 0 || Bid == 0)
                    return(false);
//---
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(true); //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::ZigoRun(bool & keyOut[], bool keyCreate = false ) //= false
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          ///  if(keyCom||!keyCom)
          {         static int rates_totalFX = 0; ArrayResize(keyOut, Bars);
                    if(Detect_NewBar._CURRENT.CBT.Is_NewBar)
                    {         // Alert("Execute_on_bar", Time[0]);
                              rates_totalFX = SetZigzagLine(keyOut[1], keyCreate); //
                              SetZigzagArrow(keyOut[2], keyCreate, "FXArrow", 0, 100, 12, 5, 3, clrRed, 1); //
                              SetZigzagLabel(keyOut[3], 1, "FXLabel", 0, 100, 12, 5, 3, clrRed, 1);
                              SetZigzagLabel2(keyOut[4], 1, "FXLabel2", 0, 100, 12, 5, 3, clrRed, 1);//
                    }
                    else
                    {         // Alert("not-Execute_on_bar", Time[0]); //
                              SetZigzagLine(keyOut[11], keyCreate); //
                              SetZigzagArrow(keyOut[22], keyCreate, "FXArrow", 0, 100, 12, 5, 3, clrRed, 1); //
                              SetZigzagLabel(keyOut[33], 0, "FXLabel", 0, 100, 12, 5, 3, clrRed, 1);
                              SetZigzagLabel2(keyOut[44], 0, "FXLabel2", 0, 100, 12, 5, 3, clrRed, 1);//
                    }
                    //====================================================================================================================
                    ////==================== scaning values
                    //a1.key_Execute_on_bar ? ZigEunLine() : false;
                    //ZigEunLine();
                    ////==================== read  values
                    //drawziging();///
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return  keyOut[1];//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::Init_ValuesArray()
{         bool result = false;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          {         MqlRates RatesX[];////set arrayyy of structure
                    int ElementsContainedArrayRatesX = ArrayResize(RatesX, Bars, 0);
                    int CopiedBarsAmountRatesX = ArrayCopyRates(RatesX, NULL, 0);
                    //or -1 if failed.
                    bool Is_ArrayResize = ElementsContainedArrayRatesX == -1;
                    bool KeyArrayCopyRates = CopiedBarsAmountRatesX == -1;
                    if (Is_ArrayResize  )
                    {         Alert("Init_ValuesArray" + "  -ElementsContainedArrayRatesX == -1", " - line: ", __LINE__, __FUNCTION__); return result;}
                    else if (KeyArrayCopyRates)
                    {         Alert("Init_ValuesArray" + " CopiedBarsAmountRatesX == -1 ", " - line: ", __LINE__, __FUNCTION__); return result;}
                    else if(!Is_ArrayResize || !KeyArrayCopyRates)
                    {         for(int i = 0; i < Bars - 1; i++)
                              {         timeF[i]          = Time[i];
                                        timeF[i]          = RatesX[i].time;  ///secound assaining
                                        openF[i]          = Open[i];
                                        openF[i]          = RatesX[i].open;
                                        highF[i]          = High[i];
                                        highF[i]          = RatesX[i].high;
                                        lowF[i]           = Low[i];
                                        lowF[i]           = RatesX[i].low;
                                        closeF[i]         = Close[i];
                                        closeF[i]         = RatesX[i].close;
                                        tick_volumeF[i]   = Volume[i];
                                        tick_volumeF[i]   = RatesX[i].tick_volume;
                                        volumeF[i]        = Volume[i];//
                                        volumeF[i]        = RatesX[i].real_volume;//
                              }//
                              result = true;//
                    } //
          } //
          if(ct_Drive.TDD.ct_Market_Symbol.Is_Running && false) //no need yet
          {         MqlTick TickX[]; Alert("Bars: ", Bars); //
                    int ElementsContainedArrayTickX = ArrayResize(TickX, Bars, 0);
                    int CopiedBarsAmountTickX = ArrayCopyRates(TickX, NULL, 0);
                    //or -1 if failed.
                    bool Is_ArrayResize = ElementsContainedArrayTickX == -1;
                    bool KeyArrayCopyRates = CopiedBarsAmountTickX == -1;
                    if (Is_ArrayResize)         {         Alert("Init_ValuesArray" + "  -ElementsContainedArrayTickX == -1", " - line: ", __LINE__, __FUNCTION__); return result;}
                    else if (KeyArrayCopyRates) {         Alert("Init_ValuesArray" + " CopiedBarsAmountTickX == -1 ", " - line: ", __LINE__, __FUNCTION__); return result;}
                    else if(!Is_ArrayResize || !KeyArrayCopyRates)
                    {         for(int i = 0; i < Bars - 1; i++)
                              {         timeTick[i]          = TickX[i].time;
                                        bidTick[i]          = TickX[i].bid;
                                        askTick[i]          = TickX[i].ask;
                                        lastTick[i]           = TickX[i].last;
                                        volumeTick[i]         = TickX[i].volume; //
                              } //
                    }//
                    result = true;//
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return result;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::Run(bool Is_Create = false, bool key = true)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          /////////////////////////>>>>>>>>>>>>>>>>.
          if(Is_Create)
          {         int    i = -1, limit = -1, counterZ = -1, WhatLookFor = 0;
                    int    back = -1, pos = -1, LastHighPos = 0, LastLowPos = 0;
                    double extremum = -1.0;
                    double curlow = 0.0, curhigh = 0.0, LastHigh = 0.0, LastLow = 0.0;
                    if(!check_history_inputsZigZagerRun(rates_totalF, inpDepth, inpBackStep))return(false);
                    firstcalculationsZigZagerRun(i, limit, counterZ, WhatLookFor,///
                                                 back, pos, LastHighPos, LastLowPos,////
                                                 extremum,////
                                                 curlow, curhigh, LastHigh, LastLow );
                    ///////////////////////////
                    mainloopZigZagerRun( i, limit, counterZ, WhatLookFor,///
                                         back, pos, LastHighPos, LastLowPos,////
                                         extremum,////
                                         curlow, curhigh, LastHigh, LastLow);
                    finalCuttingZigZagerRun( i, limit, counterZ, WhatLookFor,///
                                             back, pos, LastHighPos, LastLowPos,////
                                             extremum,////
                                             curlow, curhigh, LastHigh, LastLow );
//--- done
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    //return(rates_total); //
                    return key = true;//
          } //
          return false;//
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAG::check_history_inputsZigZagerRun(int& INrates_totalF, int& INinpDepth, int& INinpBackStep )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(INrates_totalF < INinpDepth || INinpBackStep >= INinpDepth)//--- check for history and inputs
          {         //return(key = false);
                    return(false);
                    Alert((string)__LINE__ + " rates_totalF < inpDepth || inpBackStep >= inpDepth ");
                    //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(true); //
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ZIGZAG::firstcalculationsZigZagerRun(int& i, int& limit, int& counterZ, int& WhatLookFor,
                    int&    back, int& pos, int& LastHighPos, int& LastLowPos,
                    double & extremum,
                    double & curlow, double & curhigh, double & LastHigh, double & LastLow ) 
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(prev_calculatedF == 0)//--- first calculations
                    limit = InitializeAllXBuffer();
          else
          {         //--- find first extremum in the depth ExtLevel or 100 last bars
                    i = counterZ = 0;
                    while(counterZ < ExtLevel && i < 100)
                    {         if(ZigzagBufferZero[i] != 0.0)
                                        counterZ++;
                              i++;//
                    }
                    if(counterZ == 0) //--- no extremum found - recounting all from begin
                              limit = InitializeAllXBuffer();
                    else
                    {         limit = i - 1; //--- set start position to found extremum position
                              //--- what kind of extremum?
                              if(Low_BufferTwo[i] != 0.0)
                              {         //--- low extremum
                                        curlow = Low_BufferTwo[i];
                                        WhatLookFor = 1; // //--- will look for the next high extremum
                              }
                              else
                              {         curhigh = High_BufferOne[i];   //--- high extremum
                                        WhatLookFor = -1; //   //--- will look for the next low extremum
                              }
                              for(i = limit - 1; i >= 0; i--) //--- clear the rest data
                              {         ZigzagBufferZero[i] = 0.0;
                                        Low_BufferTwo[i] = 0.0;
                                        High_BufferOne[i] = 0.0; //
                              }//
                    }//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ZIGZAG::mainloopZigZagerRun(int& i, int& limit, int& counterZ, int& WhatLookFor,
                                   int& back, int& pos, int& LastHighPos, int& LastLowPos,
                                   double & extremum,
                                   double & curlow, double & curhigh, double & LastHigh, double & LastLow)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          for(i = limit; i >= 0; i--)//--- main loop\\\endless until is candel
          {         extremum = Low[iLowest(NULL, 0, MODE_LOW, inpDepth, i)];  //--- find lowest low in depth of bars
                    if(extremum == LastLow) //--- this lowest has been found previously
                              extremum = 0.0;
                    else
                    {         LastLow = extremum;  //--- new last low
                              if(Low[i] - extremum > inpDeviation * Point) //--- discard extremum if current low is too high
                                        extremum = 0.0;
                              else
                              {         for(back = 1; back <= inpBackStep; back++) //--- clear previous extremums in backstep bars
                                        {         pos = i + back;
                                                  if(Low_BufferTwo[pos] != 0 && Low_BufferTwo[pos] > extremum)
                                                            Low_BufferTwo[pos] = 0.0; //
                                        } //
                              } //
                    }
                    if(Low[i] == extremum) {Low_BufferTwo[i] = extremum;}  //--- found extremum is current low
                    else {Low_BufferTwo[i] = 0.0;}
                    extremum = High[iHighest(NULL, 0, MODE_HIGH, inpDepth, i)];  //--- find highest high in depth of bars
                    if(extremum == LastHigh) {extremum = 0.0;}  //--- this highest has been found previously
                    else
                    {         LastHigh = extremum;   //--- new last high
                              if(extremum - High[i] > inpDeviation * Point) {extremum = 0.0;} //--- discard extremum if current high is too low
                              else
                              {         for(back = 1; back <= inpBackStep; back++)   //--- clear previous extremums in backstep bars
                                        {         pos = i + back;
                                                  if(High_BufferOne[pos] != 0 && High_BufferOne[pos] < extremum) {High_BufferOne[pos] = 0.0;} //
                                        }//
                              }//
                    }
                    if(High[i] == extremum)  //--- found extremum is current high
                              High_BufferOne[i] = extremum;
                    else
                              High_BufferOne[i] = 0.0; //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ZIGZAG::finalCuttingZigZagerRun( int& i, int& limit, int& counterZ, int& WhatLookFor,
                                        int& back, int& pos, int& LastHighPos, int& LastLowPos,
                                        double & extremum,
                                        double & curlow, double & curhigh, double & LastHigh, double & LastLow )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(WhatLookFor == 0)//--- final cutting
          {         LastLow = 0.0;
                    LastHigh = 0.0; //
          }
          else
          {         LastLow = curlow;
                    LastHigh = curhigh;//
          }
          for(i = limit; i >= 0; i--)
          {         switch(WhatLookFor)
                    {         case 0:
                                        if(LastLow == 0.0 && LastHigh == 0.0)// look for peak or lawn
                                        {         if(High_BufferOne[i] != 0.0)
                                                  {         LastHigh = High[i];
                                                            LastHighPos = i;
                                                            WhatLookFor = -1;
                                                            ZigzagBufferZero[i] = LastHigh; //
                                                  }
                                                  if(Low_BufferTwo[i] != 0.0)
                                                  {         LastLow = Low[i];
                                                            LastLowPos = i;
                                                            WhatLookFor = 1;
                                                            ZigzagBufferZero[i] = LastLow; //
                                                  } //
                                        }
                                        break;
                              case 1:
                                        if(Low_BufferTwo[i] != 0.0 && Low_BufferTwo[i] < LastLow && High_BufferOne[i] == 0.0)// look for peak
                                        {         ZigzagBufferZero[LastLowPos] = 0.0;
                                                  LastLowPos = i;
                                                  LastLow = Low_BufferTwo[i];
                                                  ZigzagBufferZero[i] = LastLow; //
                                        }
                                        if(High_BufferOne[i] != 0.0 && Low_BufferTwo[i] == 0.0)
                                        {         LastHigh = High_BufferOne[i];
                                                  LastHighPos = i;
                                                  ZigzagBufferZero[i] = LastHigh;
                                                  WhatLookFor = -1; //
                                        }
                                        break;
                              case -1:
                                        if(High_BufferOne[i] != 0.0 && High_BufferOne[i] > LastHigh && Low_BufferTwo[i] == 0.0)// look for lawn
                                        {         ZigzagBufferZero[LastHighPos] = 0.0;
                                                  LastHighPos = i;
                                                  LastHigh = High_BufferOne[i];
                                                  ZigzagBufferZero[i] = LastHigh; //
                                        }
                                        if(Low_BufferTwo[i] != 0.0 && High_BufferOne[i] == 0.0)
                                        {         LastLow = Low_BufferTwo[i];
                                                  LastLowPos = i;
                                                  ZigzagBufferZero[i] = LastLow;
                                                  WhatLookFor = 1; //
                                        }
                                        break; //
                    } //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
///////////////////////////////////////////////
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ZIGZAG::PutingValueToArray(double ComeLevelValues = 0 )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
// Set Levels Array Values//
          for(static int i = 0; i < 9 ; i++)
          {         Levels[i] = ComeLevelValues; } //
          if(0)
          {         Levels[0] = inpLeveled1;  Levels[1] = inpLeveled2;
                    Levels[2] = inpLeveled3;  Levels[3] = inpLeveled4;
                    Levels[4] = inpLeveled5;  Levels[5] = inpLeveled6;
                    Levels[6] = inpLeveled7;  Levels[7] = inpLeveled8;  Levels[8] = inpLeveled9; //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
} //
//+------------------------------------------------------------------+
//|             Class ZigzagUsing     BEGIN-END                      |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class ZigzagUsing     BEGIN-END                      |
//+------------------------------------------------------------------+
class C_ZIGZAGX
{
public:
          void          C_ZIGZAGX() { Initialize(12, 5, 3); OnInit_();};
          void          ~C_ZIGZAGX() {};
          bool          Update();
          bool          UPDATED;
          int           OnInit_();
//===================================================================
          int           rates_totalIN;
          int           rates_totalOut;
          int           prev_calculatedIN;
          int           OnCalculate_(const int rates_total, const int prev_calculated);
          int           InitializeAll();

//===================================================================
          //#property indicator_chart_window
          //#property indicator_buffers 1
          //#property indicator_color1  Red
//===================================================================
          bool          Initialize(int DepthCom = 12, int DeviationCom = 5, int BackstepCom = 3, int ExtLevelCom = 3);
//===================================================================
          int           InpDepth;    //= 12; // Depth                                //---- indicator parameters
          int           InpDeviation;// = 5; // Deviation
          int           InpBackstep; // = 3; // Backstep
//===================================================================
          double        ZigzagBuffer[];                                              //---- indicator buffers
          double        HighBuffer[];
          double        LowBuffer[];
          int           ZigzagBufferShift[];                                          //---- indicator buffers
//===================================================================
          int           rates_totalAll;
          int           ExtLevel;    // = 3; // recounting's depth of extremum      //--- globals
//===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAGX::Update()
{         UPDATED = false; //
          if(rates_totalOut > 0)rates_totalIN = rates_totalOut;
          rates_totalOut = OnCalculate_(rates_totalIN, prev_calculatedIN);// Alert(__FUNCSIG__);
          return UPDATED;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_ZIGZAGX::OnInit_()
{         if(InpBackstep >= InpDepth)           {Print("Backstep cannot be greater or equal to Depth"); return(INIT_FAILED);}
//===================================================================///define array to line drwing count
          //IndicatorBuffers(3);                  //--- 2 additional buffers
//---define main array to line drwing Style
          //SetIndexStyle(0, DRAW_SECTION);       //---- drawing settings
//---assining array to line drwing
          //SetIndexBuffer(0, ZigzagBuffer);   //---- indicator buffers (main)
          //SetIndexBuffer(1, HighBuffer);
          //SetIndexBuffer(2, LowBuffer);
//---
          //SetIndexEmptyValue(0, 0.0);
//---
          //IndicatorShortName("ZigZag(" + string(InpDepth) + "," + string(InpDeviation) + "," + string(InpBackstep) + ")");//---- indicator short name
//---
          return(INIT_SUCCEEDED);//---- initialization done
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ZIGZAGX::Initialize(int DepthCom = 12, int DeviationCom = 5, int BackstepCom = 3, int ExtLevelCom = 3)
{         InpDepth      = DepthCom;
          InpDeviation  = DeviationCom;
          InpBackstep   = BackstepCom;
          ExtLevel      = ExtLevelCom;
          rates_totalIN = Bars;
          ArrayResize(ZigzagBuffer, Bars);
          ArrayResize(HighBuffer, Bars);
          ArrayResize(LowBuffer, Bars);
          ArrayResize(ZigzagBufferShift, Bars);
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_ZIGZAGX::OnCalculate_(const int rates_total, const int prev_calculated)
{         int    i, limit, counterZ, WhatLookFor = 0;
          int    back, pos, LastHighPos = 0, LastLowPos = 0;
          double extremum;
          double curlow = 0.0, curhigh = 0.0, LastHigh = 0.0, LastLow = 0.0;
//===================================================================//////
          if(rates_total < InpDepth || InpBackstep >= InpDepth)  {Alert(__FUNCSIG__, InpBackstep, "<", InpDepth, "   ", rates_total, ">=", InpDepth); return(0);}         //--- check for history and inputs
//===================================================================//////Define Limit
          if(prev_calculated == 0) { limit = InitializeAll();}                          //--- first calculations
          else
          {         i = counterZ = 0;                                                   //--- find first extremum in the depth ExtLevel or 100 last bars
                    while(counterZ < ExtLevel && i < 100) {if(ZigzagBuffer[i] != 0.0) {counterZ++; ZigzagBufferShift[counterZ] = i;} i++;}///i >>300
                    //----------------------------------------------------------------------------------------------------
                    if(counterZ == 0)limit = InitializeAll();                           //--- no extremum found - recounting all from begin
                    else
                    {         limit = i - 1;                                            //--- set start position to found extremum position //299
                              if(LowBuffer[i] != 0.0)                                   //--- what kind of extremum?
                              {         curlow = LowBuffer[i];                          //--- low extremum
                                        WhatLookFor = 1;                                //--- will look for the next high extremum
                              }
                              else
                              {         curhigh = HighBuffer[i];                        //--- high extremum
                                        WhatLookFor = -1;                               //--- will look for the next low extremum
                              }
                              for(i = limit - 1; i >= 0; i--) {ZigzagBuffer[i] = 0.0; LowBuffer[i] = 0.0; HighBuffer[i] = 0.0; } //  //--- clear the rest data
                    } //
          }
//===================================================================//////
          for(i = limit; i >= 0; i--)//--- main loop  //299
          {         extremum = Low[iLowest(NULL, 0, MODE_LOW, InpDepth, i)];                    //--- find lowest low in depth of bars
                    if(extremum == LastLow) extremum = 0.0;                                     //--- this lowest has been found previously
                    else
                    {         LastLow = extremum;//--- new last low
                              if(Low[i] - extremum > InpDeviation * Point) {extremum = 0.0;}    //--- discard extremum if current low is too high
                              else
                              {         for(back = 1; back <= InpBackstep; back++)              //--- clear previous extremums in backstep bars
                                        {         pos = i + back; if(LowBuffer[pos] != 0 && LowBuffer[pos] > extremum) LowBuffer[pos] = 0.0; }//
                              }//
                    }
                    if(Low[i] == extremum)      {LowBuffer[i] = extremum;}                   //--- found extremum is current low
                    else                        {/*Alert(__FUNCSIG__, "i: ", i, " Size: ", ArraySize(LowBuffer));*/ LowBuffer[i] = 0.0; }
                    //-----------------------------------------------------------------------------------------------------------
                    extremum = High[iHighest(NULL, 0, MODE_HIGH, InpDepth, i)];  //--- find highest high in depth of bars
                    if(extremum == LastHigh) extremum = 0.0; //--- this highest has been found previously
                    else
                    {         LastHigh = extremum;//--- new last high
                              if(extremum - High[i] > InpDeviation * Point) extremum = 0.0;//--- discard extremum if current high is too low
                              else  //--- clear previous extremums in backstep bars
                              {         for(back = 1; back <= InpBackstep; back++) {pos = i + back; if(HighBuffer[pos] != 0 && HighBuffer[pos] < extremum) HighBuffer[pos] = 0.0; } //
                              }//
                    }
                    if(High[i] == extremum) HighBuffer[i] = extremum;  //--- found extremum is current high
                    else HighBuffer[i] = 0.0;//
          }
//===================================================================////////--- final cuttingStep
          if(WhatLookFor == 0)  {LastLow = 0.0;    LastHigh = 0.0; }//Force to Calc
          else                  {LastLow = curlow; LastHigh = curhigh; }
          for(i = limit; i >= 0; i--)
          {         switch(WhatLookFor)
                    {         case 0:
                              {         if(LastLow == 0.0 && LastHigh == 0.0)// look for peak or lawn//Update
                                        {         if(HighBuffer[i] != 0.0) {LastHigh = High[i]; LastHighPos = i; WhatLookFor = -1; ZigzagBuffer[i] = LastHigh;}
                                                  if(LowBuffer[i]  != 0.0) {LastLow  = Low[i];  LastLowPos = i;  WhatLookFor = 1;  ZigzagBuffer[i] = LastLow;} //
                                        } //
                              } break;
                              case 1:  // look for peak
                              {         if(HighBuffer[i] == 0.0 && LowBuffer[i] != 0.0 && (LowBuffer[i] < LastLow) )   { ZigzagBuffer[LastLowPos] = 0.0; LastLowPos = i; LastLow = LowBuffer[i]; ZigzagBuffer[i] = LastLow;}
                                        if(HighBuffer[i] != 0.0 && LowBuffer[i] == 0.0)                               { LastHigh = HighBuffer[i]; LastHighPos = i; ZigzagBuffer[i] = LastHigh; WhatLookFor = -1; } //
                              } break;
                              case -1: // look for lawn
                              {         if(HighBuffer[i] != 0.0 && LowBuffer[i] == 0.0 && (HighBuffer[i] > LastHigh)) { ZigzagBuffer[LastHighPos] = 0.0; LastHighPos = i; LastHigh = HighBuffer[i]; ZigzagBuffer[i] = LastHigh;}
                                        if(HighBuffer[i] == 0.0 && LowBuffer[i] != 0.0 )                              { LastLow = LowBuffer[i]; LastLowPos = i; ZigzagBuffer[i] = LastLow; WhatLookFor = 1; } //
                              } break; //
                    } //
          }
//===================================================================////////--- final DrewStep
          datetime ZigzagBufferDate,  ZigzagBufferDatePre; //Alert(__FUNCSIG__);
          double   ZigzagBufferPrice, ZigzagBufferPricePre;
          for(int j = ArraySize(ZigzagBuffer) - 1; j >= 0; j--)
          {         if(j < 1)return rates_total;
                    ZigzagBufferPrice           = ZigzagBuffer[j]; Alert(__FUNCSIG__, "j: ", j);
                    ZigzagBufferPricePre        = ZigzagBuffer[j - 1]; //
                    ZigzagBufferDate            = iTime(Symbol(), Period(), ZigzagBufferShift[j]); //
                    ZigzagBufferDatePre         = iTime(Symbol(), Period(), ZigzagBufferShift[j - 1]); //
                    Dev_Object_Pack.Lines.Trend.Create(true, false, "ZigZag", "ZigZag", ZigzagBufferDate, ZigzagBufferPrice, ZigzagBufferDatePre, ZigzagBufferPricePre, false, 3, clrAqua, false,  STYLE_DASH ); // UseTrend
          }
//===================================================================////////--- final DrewStep
          return(rates_total); ////--- done
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_ZIGZAGX::InitializeAll()
{         ArrayInitialize(ZigzagBuffer, 0.0);
          ArrayInitialize(HighBuffer, 0.0);
          ArrayInitialize(LowBuffer, 0.0);
          return(Bars - InpDepth);////--- first counting position
}
//+------------------------------------------------------------------+
//|             Class ZigzagUsing     BEGIN-END                      |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
class Ctc_ZIGZAG_Solid
{

public:
          void          Runzgzag();
          bool          SearchZigZagExtremums(const int count, double & array_results[]);
          void          ArrayresizeXModeArray(double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], int limitYX = 200);
          void          X200Array_X20Array_initX(string InMode, double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[],  int limitYX = 200);



};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctc_ZIGZAG_Solid::Runzgzag()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          double array_results[];
          if(!SearchZigZagExtremums(3, array_results)) return;
          if(!ObjectCreate(0, "line", OBJ_TREND, 0, Time[0], array_results[0], Time[50], array_results[50])) Alert("Alert", __LINE__);
          double high = 0.0, low = 0.0;
          double room_0 = array_results[0];
          double room_1 = array_results[1];
          double room_2 = array_results[2];
          //--- находим верх и низ
          if(room_1 > room_2) { high = room_1; low = room_2; }
          else                { high = room_2; low = room_1; }
          //---
          double size_corridor = high - low;  // ширина коридора
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//| Search for indicator extremums                                   |
//+------------------------------------------------------------------+
bool Ctc_ZIGZAG_Solid::SearchZigZagExtremums(const int count, double & array_results[])
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          if(!ArrayIsDynamic(array_results))
          {         Print("This a no dynamic array!");
                    return(false); }
          ArrayFree(array_results);
          ArrayResize(array_results, count);
          ArraySetAsSeries(array_results, true);
          int      buffer_num = 0;         // indicator buffer number
          double   arr_buffer[];
          ArraySetAsSeries(arr_buffer, true);
//--- reset error code
          if(Capitan_ResetLastErrorX)
                    ResetLastError();
//--- fill a part of the iCustom array with values from the indicator buffer
//=========================================
          double FirstX_X200[];
          double SecondX_X200_EMA20[];
          double SecondX_X200_SMA20[];
          double SecondX_X200_EMA200[];
          double SecondX_X200_SMA200[];
          int limitYX = 200;
          ArrayresizeXModeArray( FirstX_X200, SecondX_X200_EMA20,  SecondX_X200_SMA20,  SecondX_X200_EMA200, SecondX_X200_SMA200, 200);
          X200Array_X20Array_initX("ZigZag", FirstX_X200, SecondX_X200_EMA20, SecondX_X200_SMA20, SecondX_X200_EMA200, SecondX_X200_SMA200, 200);
          double            handle_iCustom;               // variable for storing the handle of the iCustom indicator
//--- create handle of the indicator iCustom
          handle_iCustom = iCustom(Symbol(), Period(), "Examples\\ZigZag", 1, 0);
//--- if the handle is not created
//==========================================
          int copied =  ArrayCopy(arr_buffer, FirstX_X200, 0, 0); ///CopyBuffer(handle_iCustom, buffer_num, 0, 100, arr_buffer);
          if(copied < 0)
          {         //--- if the copying fails, tell the error code
                    //PrintFormat("Failed to copy data from the iCustom indicator, error code %d", GetLastError());
                    //--- quit with zero result - it means that the indicator is considered as not calculated
                    return(false); }
          int elements = 0;
          for(int i = 0; i < copied; i++)
          {         if(arr_buffer[i] != 0)
                    {         array_results[elements] = arr_buffer[i];
                              elements++;
                              if(elements == count)
                                        break; } }
          if(elements == count)
                    return(true);
//---
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(false);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctc_ZIGZAG_Solid::ArrayresizeXModeArray(double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], int limitYX = 200)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          ArrayResize(First_X200, limitYX, 10);
          ArrayResize(Second_X200_EMA20, limitYX, 10);
          ArrayResize(Second_X200_SMA20, limitYX, 10); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctc_ZIGZAG_Solid::X200Array_X20Array_initX(string InMode, double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[],  int limitYX = 200)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          ArrayResize(First_X200, limitYX, 10);///---------limitY
          if(InMode == "ZigZag")
                    for(int i = 0; i < limitYX ; i++)
                    {         First_X200[i] = iCustom(Symbol(), Period(), "Examples\\ZigZag", 1, i); //
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
          ArraySetAsSeries(First_X200, true);
          for(int i = 0; i < limitYX  ; i++)
          {         Second_X200_EMA20[i]   = iMAOnArray(First_X200, 0, 20, 0, MODE_EMA, i);// 0 means the whole array.
                    Second_X200_EMA20[i] = NormalizeDouble(Second_X200_EMA20[i], 2);
                    //////======
                    Second_X200_SMA20[i]   = iMAOnArray(First_X200, 0, 20, 0, MODE_SMA, i);
                    Second_X200_SMA20[i] = NormalizeDouble(Second_X200_SMA20[i], 2);
                    ///--------------------------
                    Second_X200_SMA200[i]   = iMAOnArray(First_X200, 0, 200, 0, MODE_SMA, i);
                    Second_X200_SMA200[i] = NormalizeDouble(Second_X200_SMA200[i], 2);
                    //////======
                    Second_X200_EMA200[i]   = iMAOnArray(First_X200, 0, 200, 0, MODE_EMA, i);
                    Second_X200_EMA200[i] = NormalizeDouble(Second_X200_EMA200[i], 2);
                    ////
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct S_Series_Infos
{         int             rates_total;        // size of input time series      number of bars, available to the indicator for calculation,
          int             prev_calculated;    // bars handled in previous call  During the function call, the prev_calculated parameter contains a value returned by OnCalculate() during previous call.
          datetime        time[];
          double          open[];
          double          high[];
          double          low[];
          double          close[];
          long            tick_volume[];
          long            volume[];
          int             spread[];
          void Set()
          {         //---
                    ArrayResize(high, Bars);//
                    ArrayResize(low, Bars);//
                    ArrayResize(close, Bars);//
          }

};
struct S_Zigzag_data
{         void S_Zigzag_data() {};
          void Set()
          {         color1              = Red;
                    InpDepth            = 12;   // Depth
                    InpDeviation        = 5; // Deviation
                    InpBackstep         = 3; // Backstep
                    ExtLevel            = 3; //
                    //---
                    ArrayResize(ExtZigzagBuffer, Bars);//
                    ArrayResize(ExtHighBuffer, Bars);//
                    ArrayResize(ExtLowBuffer, Bars);//
          }
          //#property indicator_chart_window
          //#property indicator_buffers 1
          color  color1;//Red
          //---- indicator parameters
          int    InpDepth          ;//= 12;   // Depth
          int    InpDeviation      ;//= 5; // Deviation
          int    InpBackstep       ;//= 3; // Backstep
          //---- indicator buffers
          double ExtZigzagBuffer[];
          double ExtHighBuffer[];
          double ExtLowBuffer[];
          //--- globals
          int    ExtLevel       ;// 3; // recounting's depth of extremums


};

struct Zigzag_simula
{         S_Zigzag_data         _data;
          S_Series_Infos        _Series;
          //---
          double                Price[];
          datetime              Times[];
          //---
          void  Update();

          void  Zigzag_simula()                 {_OnInit(_data);};
          int   _OnInit(S_Zigzag_data &data);

          int   _OnCalculate( S_Series_Infos &Series); //--- #1
          int   _InitializeAll(S_Zigzag_data &data);  //--- #2

          int   _Cheack_and_FristCalc(S_Series_Infos &Series);
          void  _Calc_Main_Loop();                    //--- #3
          void  _Calc_Final_Cutting();
          //----------------------
          int    i, limit, counterZ, whatlookfor;       // = 0;
          int    back, pos, lasthighpos, lastlowpos;    // = 0;
          double extremum;
          double curlow, curhigh, lasthigh, lastlow;   // = 0.0;
};

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int Zigzag_simula::_OnInit(S_Zigzag_data &data)
{         ArrayResize(Price, Bars, 100);
          ArrayResize(Times, Bars, 100);
          _data.Set();
          _Series.Set();
          if(data.InpBackstep >= data.InpDepth) { Print("Backstep cannot be greater or equal to Depth"); return(INIT_FAILED); }
          //--- 2 additional buffers
          //IndicatorBuffers(3);
          //---- drawing settings
          //SetIndexStyle(0, DRAW_SECTION);
          //---- indicator buffers
          //SetIndexBuffer(0, ExtZigzagBuffer);
          //SetIndexBuffer(1, ExtHighBuffer);
          //SetIndexBuffer(2, ExtLowBuffer);
          //SetIndexEmptyValue(0, 0.0);
          //---- indicator short name
          //IndicatorShortName("ZigZag(" + string(InpDepth) + "," + string(InpDeviation) + "," + string(InpBackstep) + ")");
          //---- initialization done
          return(INIT_SUCCEEDED); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Zigzag_simula::Update()
{         //;//
          //_Series.rates_total;
          //_Series.prev_calculated;
          //_Series.time[];
          //_Series.open[];
          CopyHigh( NULL, PERIOD_CURRENT, 0, _Series.prev_calculated, _Series.high);  //  _Series.high[];
          CopyLow(  NULL, PERIOD_CURRENT, 0, _Series.prev_calculated, _Series.low); //_Series.low[];
          //_Series.close[];
          //_Series.tick_volume[];
          //_Series.volume[];
          //_Series.spread[];
          _Series.prev_calculated = _OnCalculate(_Series);   //----return rates_total is calculated mean prev_calculated
          //;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Zigzag_simula::_OnCalculate( S_Series_Infos &Series)
{         i             = limit         = counterZ      = whatlookfor = 0;
          back          = pos           = lasthighpos   = lastlowpos = 0;
          extremum      = 0;
          curlow        = curhigh       = lasthigh      = lastlow = 0.0;
          //
          if(_Cheack_and_FristCalc(Series) == 0) return(0); //--- check for history and inputs   'Series' - constant variable cannot be passed as reference     wZigzag.mqh         2024      36
          _Calc_Main_Loop();            //--- main loop
          _Calc_Final_Cutting();        //--- final cutting
          //--- done
          return(_Series.rates_total);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Zigzag_simula::_InitializeAll(S_Zigzag_data &data)
{         ArrayInitialize(data.ExtZigzagBuffer, 0.0);
          ArrayInitialize(data.ExtHighBuffer,   0.0);
          ArrayInitialize(data.ExtLowBuffer,    0.0);
          //--- first counting position
          return(Bars - data.InpDepth); //
}
#define look_peak_or_lawn  0
#define look_peak          1
#define look_lawn         -1
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Zigzag_simula::_Cheack_and_FristCalc(S_Series_Infos &Series)
{         //--- check for history and inputs
          if(Series.rates_total < _data.InpDepth || _data.InpBackstep >= _data.InpDepth) return(0);
          //--- first calculations
          if(Series.prev_calculated == 0)limit = _InitializeAll(_data);
          else
          {         //--- find first extremum in the depth ExtLevel or 100 last bars
                    i = counterZ = 0;
                    while(counterZ < _data.ExtLevel && i < 100) { if(_data.ExtZigzagBuffer[i] != 0.0) {counterZ++;} i++; }
                    //--- no extremum found - recounting all from begin
                    if(counterZ == 0) {limit = _InitializeAll(_data);}
                    else
                    {         //--- set start position to found extremum position
                              limit = i - 1;
                              //--- what kind of extremum?
                              if(_data.ExtLowBuffer[i] != 0.0)
                              {         //--- low extremum
                                        curlow = _data.ExtLowBuffer[i];
                                        //--- will look for the next high extremum
                                        whatlookfor = look_peak; //
                              }
                              else
                              {         //--- high extremum
                                        curhigh = _data.ExtHighBuffer[i];
                                        //--- will look for the next low extremum
                                        whatlookfor = look_lawn;//
                              }
                              //--- clear the rest data
                              for(i = limit - 1; i >= 0; i--)
                              {         _data.ExtZigzagBuffer[i] = 0.0;
                                        _data.ExtLowBuffer[i]    = 0.0;
                                        _data.ExtHighBuffer[i]   = 0.0; //
                              }//
                    } //
          }//
          return 1;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Zigzag_simula::_Calc_Main_Loop()
{         for(i = limit; i >= 0; i--)
          {
                    {         //--- find lowest low in depth of bars
                              extremum = _Series.low[iLowest(NULL, 0, MODE_LOW, _data.InpDepth, i)];
                              //--- this lowest has been found previously
                              if(extremum == lastlow) extremum = 0.0;
                              else
                              {         //--- new last low
                                        lastlow = extremum;
                                        //--- discard extremum if current low is too high
                                        if(_Series.low[i] - extremum > _data.InpDeviation * Point) extremum = 0.0;
                                        else
                                        {         //--- clear previous extremums in backstep bars
                                                  for(back = 1; back <= _data.InpBackstep; back++)
                                                  {         pos = i + back;
                                                            if(_data.ExtLowBuffer[pos] != 0 && _data.ExtLowBuffer[pos] > extremum) {_data.ExtLowBuffer[pos] = 0.0;}//
                                                  } //
                                        }//
                              }
                              //--- found extremum is current low
                              if(_Series.low[i] == extremum) _data.ExtLowBuffer[i] = extremum;
                              else                           _data.ExtLowBuffer[i] = 0.0; //
                    } //
                    //+------------------------------------------------------------------+
                    //|                                                                  |
                    //+------------------------------------------------------------------+
                    {         //--- find highest high in depth of bars
                              extremum = _Series.high[iHighest(NULL, 0, MODE_HIGH, _data.InpDepth, i)];
                              //--- this highest has been found previously
                              if(extremum == lasthigh) extremum = 0.0;
                              else
                              {         //--- new last high
                                        lasthigh = extremum;
                                        //--- discard extremum if current high is too low
                                        if(extremum - _Series.high[i] > _data.InpDeviation * Point)extremum = 0.0;
                                        else
                                        {         //--- clear previous extremums in backstep bars
                                                  for(back = 1; back <= _data.InpBackstep; back++)
                                                  {         pos = i + back;
                                                            if(_data.ExtHighBuffer[pos] != 0 && _data.ExtHighBuffer[pos] < extremum) {_data.ExtHighBuffer[pos] = 0.0;} //
                                                  } //
                                        } //
                              }
                              //--- found extremum is current high
                              if(_Series.high[i] == extremum)_data.ExtHighBuffer[i] = extremum;
                              else                           _data.ExtHighBuffer[i] = 0.0; //
                    }//
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Zigzag_simula::_Calc_Final_Cutting()
{         //---
          if(whatlookfor == look_peak_or_lawn)  { lastlow = 0.0         ; lasthigh = 0.0; }
          else                                  { lastlow = curlow      ; lasthigh = curhigh; }
          for(i = limit; i >= 0; i--)
          {         switch(whatlookfor)
                    {         case look_peak_or_lawn: // look for peak or lawn
                                        if(lastlow == 0.0 && lasthigh == 0.0)
                                        {         if(_data.ExtHighBuffer[i] != 0.0)
                                                  {         lasthigh            = High[i];
                                                            lasthighpos         = i;
                                                            whatlookfor         = look_lawn;
                                                            _data.ExtZigzagBuffer[i]  = lasthigh; //
                                                  }
                                                  if(_data.ExtLowBuffer[i] != 0.0)
                                                  {         lastlow             = Low[i];
                                                            lastlowpos          = i;
                                                            whatlookfor         = look_peak;
                                                            _data.ExtZigzagBuffer[i]  = lastlow; //
                                                  } ///
                                        } break;
                              case look_peak: // look for peak
                                        if(_data.ExtLowBuffer[i] != 0.0 && _data.ExtLowBuffer[i] < lastlow && _data.ExtHighBuffer[i] == 0.0)
                                        {         _data.ExtZigzagBuffer[lastlowpos]     = 0.0;
                                                  lastlowpos                            = i;
                                                  lastlow                               = _data.ExtLowBuffer[i];
                                                  _data.ExtZigzagBuffer[i]              = lastlow;//
                                        }
                                        if(_data.ExtHighBuffer[i] != 0.0 && _data.ExtLowBuffer[i] == 0.0)
                                        {         lasthigh                              = _data.ExtHighBuffer[i];
                                                  lasthighpos                           = i;
                                                  _data.ExtZigzagBuffer[i]              = lasthigh;
                                                  whatlookfor                           = look_lawn;//
                                        } break;
                              case look_lawn: // look for lawn
                                        if(_data.ExtHighBuffer[i] != 0.0 && _data.ExtHighBuffer[i] > lasthigh && _data.ExtLowBuffer[i] == 0.0)
                                        {         _data.ExtZigzagBuffer[lasthighpos]    = 0.0;
                                                  lasthighpos                           = i;
                                                  lasthigh                              = _data.ExtHighBuffer[i];
                                                  _data.ExtZigzagBuffer[i]              = lasthigh;//
                                        }
                                        if(_data.ExtLowBuffer[i] != 0.0 && _data.ExtHighBuffer[i] == 0.0)
                                        {         lastlow                               = _data.ExtLowBuffer[i];
                                                  lastlowpos                            = i;
                                                  _data.ExtZigzagBuffer[i]              = lastlow;
                                                  whatlookfor                           = look_peak; //
                                        } break; //
                    }//
                    static int Counter = 0;
                    if(_data.ExtZigzagBuffer[i] != 0)
                    {         Counter++;
                              Price[Counter] = _data.ExtZigzagBuffer[i];
                              Times[Counter] = iTime(NULL, PERIOD_CURRENT, i); //
                    }//
          } //
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
