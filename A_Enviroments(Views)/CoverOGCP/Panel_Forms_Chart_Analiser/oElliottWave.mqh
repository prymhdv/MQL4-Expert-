//+------------------------------------------------------------------+
//|                                        Cgp_ElliotWavePAD.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
//+------------------------------------------------------------------+
//|             Class Cgp_ElliotWavePAD     BEGIN-END                    |
//+------------------------------------------------------------------+
// Label modes
#define NUMERIC  0
#define LETTER   1
#define ROMAN    2
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cgp_ElliotWavePAD//: public C_FLOWPANEL // FlowPanelToolsController//errorr
{
public://Constructors Member
          //---------------------------------------------------------------------------------
          void                  Cgp_ElliotWavePAD();
          void                  ~Cgp_ElliotWavePAD(); //
          //---------------------------------------------------------------------------------
          bool                  Runed;//
          bool                  Is_ElliottWave_Shown;
          bool                  Is_ElliottWave_Run; //= false;
          bool                  Is_Clear_Waves;
          int                   Soild_X,  Soild_Y;
          //---------------------------------------------------------------------------------
          Sgo_ButtonColor       ElliotWavePAD_BTNColorA, ElliotWavePAD_BTNColorB;
          //---------------------------------------------------------------------------------
          //public://Data Member
private:
          string                m_prefix;
          int                   m_mode;
          int                   m_num_waves;
          long                  UsedChartInited;//ChartID();
          //---------------------------------------------------------
          string                CounterTextBoxCount;
          uint                  CounterValueBoxCount;
          //---------------------------------------------------------
public:   bool                  __CALL(int WhichMode, bool IsKey, Sg_Position2D  &Position2D);
          //=================================================
          void                  __SHOW(int WhichMode, bool IsKey, Sg_Position2D  &Position2D );
          //================================================
public: ///member access any wayy
#define  SizePriceTwoY 9
#define  SizeBarBox    9
#define  SizeArray200  200
#define  FixedArraySet_ false ////Worked by dynamic array///Cool 200-9-9-5-12-49
#define  DynamicArraySet_ true////Worked by dynamic array///Cool
          //====================================
          // double             ExtDynamic[];           // dynamic array
          // double             ExtStatic[100];         // static array.
          double                Array200[];             //200///>>>>297 OK not out of range...
          int                   BarBox[];               ///line amountBarNum[9]//>>>>..BarBox[9] //>>>Change dynamic...
          double                PriceTwoY[];            ///line PriceTwoY[9]
          int                   WAVECount;              // = 3;
          color                 PaintedColor;           // = Blue;
          color                 ProphetColor;           // = Red;
          int                   WaveBarDepthTryLimit;   // = 12;
          string                NameWavesCom;           // = "";
          //string              gs_dummy_112;
          double                PipPoint;
          int                   iTimeSize;              // = 49;
          int                   WaveBarDepthTryLimitAdjust;
          bool                  KeySearching;           // = TRUE;
          bool                  KeyPrint;               // = FALSE;
          int                   BarDepthBack;           // = 100
          //!#define BarDepthBackValue 100+BarDepthBack
#define BarDepthBackValue 10 ///100/1000///None efect///yet
          //==========================================================
          //public://Data Key Member
          //==========================================================
          //public://Data Key Member ClickingCount
          //==========================================================
public://Functions Member
          string        wave_label(int idx);
          string        wave_label_name(int cycle, int idx);
          string        index_to_alpha(int idx);
          string        int_to_roman(int n);
          void          DrawTextLabel(bool Is_Create = false, int mode = ROMAN, int num_waves = 5, string prefix = "WaveX", color m_color = clrRed, int m_fn_size = 20, string m_fn_family = "Arial");
public:
          //=================================================================================================================================================================================================================
          bool          __RUN(bool Is_Create = false, bool Is_INIT = false, bool KeyUpdate = false, string _NameWavesCom = "",
                              int _WAVECount = 3, int _WaveBarDepthTryLimit = 12, color _PaintedColor = Blue, color _ProphetColor = Red,
                              int _iTimeSize = 49, bool _KeySearching = 1, bool _KeyPrint = 0);
          bool          ElliottWavesINIT(bool Is_Create = false, string _NameWavesCom = "", int _WAVECount = 3, int _WaveBarDepthTryLimit = 12,
                                         color _PaintedColor = Blue, color _ProphetColor = Red,  int _iTimeSize = 49,
                                         bool _KeySearching = TRUE, bool _KeyPrint = FALSE);
          ///  need any array...just Fill bar is fractal or nat in depth///#define BarDepthBackValue 10///100/1000///None efect///yet

          void          UpdateFractalsOneArray(double & ArrayCom[], int iWaveBarDepthTryLimitAdjustCom, int iDownForCom, int BarDepthUpdateFractalsBackCom = BarDepthBackValue, bool IsUpdateLevels = TRUE, bool IsOtherArray = false); ////Search to Assign Fractal Bars of Waves in Depth>>>>
          ///no need any array...just return bar is fractal or nat in depth
          int           IS_FractalBar(int iDownForCom, int iWaveBarDepthTryLimitAdjustCom); ////Search To Define Fractal Bars of Waves in Depth>>>>
          void          UpdateWaveHigh(double &ArrayCom[], int iDownForCom, int BarDepthUpdateFractalsBackCom = 100, bool IsOtherArray = false);
          void          UpdateWaveLow(double &ArrayCom[], int iDownForCom, int BarDepthUpdateFractalsBackCom = 100, bool IsOtherArray = false);
          void          SearchingElliottWaves(bool Is_Create = false, string _NameWavesCom = "");

          ///int        ElliottWavesINIT(int, color, color, int, string, int, bool, bool  );

          void          UpdateElliottWaves_SET_Price_TIME_COLOR(bool Is_Create = false, string _NameWavesCom = "");
          void          UpdatingWavesTimePrice(int iWaveCom = 0, string _NameWavesCom = "");///take two day to adjust
          void          MyCreateObject(bool Is_Create = false, string NameCom = "", int timeOne = 0, double PriceOne = 0, int timeTwo = 0, double PriceTwo = 0,
                                       int iFor = 0, int Width = 1, ENUM_LINE_STYLE Style = STYLE_DASHDOT);
          int           ClearElliottWave(bool KeyDelete = TRUE);
          //=================================================
};//Elliott;///Wave;///off untill ok
//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+
void Cgp_ElliotWavePAD::Cgp_ElliotWavePAD()
{         RunCallFunction++;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          Runed = false; //
          ChartData_ChartInfo.ID = ChartID(); ///UseChart: //132721414949575924 before inited Expert...
          UsedChartInited = ChartData_ChartInfo.ID;///where chartnot opened??//ChartData_ChartInfo.ID seted after chart object oming///
          UsedChartInited = ChartID();
          //Alert("init---UsedChartInited != ChartData_ChartInfo.ID", "-UsedChartInited:", UsedChartInited, "--ChartData_ChartInfo.ID:", ChartData_ChartInfo.ID,"---ChartID();",ChartID()); //
          ////3;
          ////this.PaintedColor    = Blue;
          ////this.ProphetColor    = Red;
          ////this.RepeatTryLimit  = 12;
          ////this.gs_unused_104   = "";
          ////this.iTimeSize   = 49;
          ////this.KeySearching    = TRUE;
          ////this.KeyPrint        = FALSE;
          //ElliottWavesINIT(15, Blue, Red, 12, "", 100, 1, 0);
          //-------------------------------------------------------------------------------------------
          ElliotWavePAD_BTNColorA.Set_(clrBeige, C'144,176,239', clrBlack, clrGold, clrRed, clrRed);
          //ElliotWavePAD_BTNColorA.Set_(clrWhite, clrGray, C'59,41,40', clrGold, clrRed, clrRed);
          //ElliotWavePAD_BTNColorA.Set_(clrBeige, clrGray,clrBlack, clrGold, clrRed, clrRed);
          //-------------------------------------------------------------------------------------------
          ElliotWavePAD_BTNColorB.Set_(clrWhite, clrDarkCyan, clrDarkCyan, clrDarkCyan, clrLavender, clrLavender);
          //-------------------------------------------------------------------------------------------
          //-------------------------------------------------------------------------------------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cgp_ElliotWavePAD::~Cgp_ElliotWavePAD()
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          static string BeforeFuncname = "";
          if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
//+------------------------------------------------------------------+
//| Class to draw and track elliott wave label chart objects         |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Draw a label on the chart for the current wave                   |
//+------------------------------------------------------------------+
void Cgp_ElliotWavePAD::DrawTextLabel(bool Is_Create = false, int mode = ROMAN, int num_waves = 5, string prefix = "WaveX", color LineColor = clrRed, int Fontsize = 20, string Fontfamily = "Arial") ///FONT::FN
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          m_mode = mode;
          m_num_waves = num_waves;
          m_prefix = prefix; //
          //-----------------------------------------------------------------------
          int trywhile = 0;//3;
          int cycle = 0, idx = 0;
          datetime time;
          double price;
          string name;
          //-----------------------------------------------------------------------
          /* Loop through wave label objects to find the current name and wave index.
              * Once name is not found, the end has been reached and the name is the
              * new label name. */
          if(Is_Create)
          {         while(ObjectFind(name = wave_label_name(cycle, idx)) >= 0)///CHange names
                    {         if(idx == (m_num_waves - 1))
                              {         // Is this the end of the cycle?
                                        cycle++; //need to Control Cycel
                                        idx = 0; // Reset wave index
                              }
                              else {idx++;} //
                    }
                    time = WindowTimeOnDropped(); // Set_ the drop coordinatesX
                    price = WindowPriceOnDropped(); // Set_ the drop coordinatesY
                    //====================================
                    if(ObjectFind(0, name) < 1) ObjectCreate(name, OBJ_TEXT, 0, time, price);
                    if(ObjectFind(0, name) >= 0)ObjectSetText(name, wave_label(idx), Fontsize, Fontfamily, LineColor);  //
                    //====================================
          } //
          else
          {         while(ObjectFind(name = wave_label_name(cycle, idx)) >= 0 && trywhile == 5 )
                    {         if(idx == (m_num_waves - 1 )) //>>>  if(idx == (m_num_waves - 1))
                              {         // Is this the end of the cycle?
                                        cycle++; //need to Control Cycel
                                        idx = 0; // Reset wave index //need to Control idx for deleting///because m_num_waves is global value... over prossccing class
                              }
                              //else {idx++;} ////need to Control idx for deleting/..not to idx++
                              trywhile++;//>>>.Perfect Efect///
                    }
                    if(ObjectFind(0, name) >= 0)
                    {         ObjectDelete(0, name); ///
                              // Alert(name, "--Line:", __LINE__); //
                    }
                    //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          //
}
//+------------------------------------------------------------------+
//| Return the wave label string given the wave index idx            |
//+------------------------------------------------------------------+
string Cgp_ElliotWavePAD::wave_label(int idx)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          switch(m_mode)
          {         case NUMERIC:
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
                              return IntegerToString(idx + 1); }
                    case LETTER:
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
                              return index_to_alpha(idx); }
                    case ROMAN:
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
                              return int_to_roman(idx + 1); }
                    default:
                    {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
                              return "Invalid mode for wave label"; //
                    } //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}

//+------------------------------------------------------------------+
//| Return the wave label's internal object name                     |
//| given the cycle and wave index idx.                              |
//+------------------------------------------------------------------+
string Cgp_ElliotWavePAD::wave_label_name(int cycle, int idx)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          return StringConcatenate(m_prefix, "_Ccycle:", cycle, "_Idx:", idx); }
//+------------------------------------------------------------------+
//| Return the capital letter(s) corresponding to idx,               |
//| where 0 corresponds to A, 1 to B, and so on.                     |
//| If idx exceeds 25 (Z), the return value will be appended         |
//| such that 26 is AA, 27 is BB, and so on.                         |
//+------------------------------------------------------------------+
string Cgp_ElliotWavePAD::index_to_alpha(int idx)//Converting
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          string res = "";
          int repeat = 1;
          int c = 'A' + idx;
          // Just in case NUM_WAVES > 26
          while(c > 'Z')
          {         c -= 26;
                    repeat++; }
          while(repeat-- > 0)
          {         res += CharToStr((char)c); }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          return res;  //
}
//+------------------------------------------------------------------+
//| Return the roman numeral string representation                   |
//| given a positive integer n.                                      |
//+------------------------------------------------------------------+
string Cgp_ElliotWavePAD::int_to_roman(int n)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          int digits[] = { 1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000 };
          string romn[] =
          {         "I", "IV", "V", "IX", "X", "XL",
                    "L", "XC", "C", "CD", "D", "CM", "M" };
          string roman = "";
          int sz = MathMin(ArraySize(romn), ArraySize(digits));
          int i = sz - 1;
          while(i >= 0)
          {         if(n < digits[i])
                    {         i--; }
                    else
                    {         n -= digits[i];
                              roman = StringConcatenate(roman, romn[i]); } }///puting to roman
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          return roman;  //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cgp_ElliotWavePAD::__RUN(bool Is_Create = false, bool Is_INIT = false, bool KeyUpdate = false, string _NameWavesCom = "",
                              int _WAVECount = 3, int _WaveBarDepthTryLimit = 12, color _PaintedColor = Blue, color _ProphetColor = Red,
                              int _iTimeSize = 49, bool _KeySearching = 1, bool _KeyPrint = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          //////===
          bool result = false;
#define  ModeTest   1
          //============================================================
          static bool Is_INIT_Defuse = false;
          ///ArrayResize(Array200, 500);///ita setting class variabel...
          //============================================================
          bool IsInited = false;
          if(ModeTest)
          {         IsInited = ElliottWavesINIT(Is_Create, _NameWavesCom, _WAVECount, _WaveBarDepthTryLimit, _PaintedColor, _ProphetColor, _iTimeSize, _KeySearching, _KeyPrint);
                    if(IsInited)
                    {         UpdateElliottWaves_SET_Price_TIME_COLOR(Is_Create, _NameWavesCom);//
                              //
                    } //
                    if(UsedChartInited != ChartData_ChartInfo.ID)
                    {         UpdateElliottWaves_SET_Price_TIME_COLOR(Is_Create, _NameWavesCom); //
                              //Alert("UsedChartInited != ChartData_ChartInfo.ID", "-UsedChartInited:", UsedChartInited, "--ChartData_ChartInfo.ID:", ChartData_ChartInfo.ID); //
                              //
                    }//
          }
          if(0)
          {         if(Is_INIT && !Is_INIT_Defuse)
                    {         IsInited = ElliottWavesINIT(Is_Create, _NameWavesCom, _WAVECount, _WaveBarDepthTryLimit, _PaintedColor, _ProphetColor, _iTimeSize, _KeySearching, _KeyPrint);
                              Is_INIT_Defuse = false; } //true/mean one time runing frist call...after just update,,
                    else if(KeyUpdate && IsInited) UpdateElliottWaves_SET_Price_TIME_COLOR(Is_Create, _NameWavesCom);
                    else if(IsInited)UpdateElliottWaves_SET_Price_TIME_COLOR(Is_Create, _NameWavesCom); ///Even keys fall its update evry calling
          }
          result = true;
          //==========================================================
          if(!Is_Create) { ClearElliottWave(); result = false;} //>>???if nor in block always fallls
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          return (result); //
          ///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cgp_ElliotWavePAD::ElliottWavesINIT(bool Is_Create = false, string _NameWavesCom = "", int _WAVECount = 3, int _WaveBarDepthTryLimit = 12,
                    color _PaintedColor = Blue, color _ProphetColor = Red,   int _iTimeSize = 49,
                    bool _KeySearching = TRUE, bool _KeyPrint = FALSE)
///int Cgp_ElliotWavePAD::ElliottWavesINIT(bool,int, color, color, int, string, int, bool, bool)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          //////===
          {         //==
                    this.WAVECount              = _WAVECount;// 3;
                    this.PaintedColor           = _PaintedColor;//Blue;
                    this.ProphetColor           = _ProphetColor;//Red;
                    this.WaveBarDepthTryLimit   = _WaveBarDepthTryLimit;// = 12; //120;//12;///long of waves....
                    this.NameWavesCom           = _NameWavesCom;//"";
                    this.iTimeSize              = _iTimeSize ;//49;
                    this.KeySearching           = _KeySearching;///TRUE;
                    this.KeyPrint               = _KeyPrint;///FALSE;
                    //==
          }
          //////===
          if (Point == 0.00001) PipPoint = 0.0001;
          else
          {         if (Point == 0.001) PipPoint = 0.01;
                    else PipPoint = Point; }
          //========================================================
          //its defined arrary size of class...
          if(FixedArraySet_)
          {         //#define  PriceTwoYSize
                    //#define  BarBoxSize
                    //#define  Array200Size
                    ArrayResize(Array200, SizeArray200);
                    ArrayResize(BarBox, SizeBarBox);
                    ArrayResize(PriceTwoY, SizePriceTwoY); }
          //==================================
          //==================================
          else if(DynamicArraySet_)
          {         int HalfOfBars = (int)(Bars / 2); //////MathCeil(Bars / 2);
                    ArrayResize(Array200, HalfOfBars);
                    ArrayResize(BarBox, HalfOfBars);
                    ArrayResize(PriceTwoY, HalfOfBars); //
          }
          //==================================
          //>>>.Runing undeiniting...
          ///>>>>> Alert("*ArraySize:Array200>", ArraySize(Array200), "--ArraySize:BarBox>", ArraySize(BarBox), "--ArraySize:PriceTwoY>", ArraySize(PriceTwoY));
          //========================================================
          int SizeOfArray200  = ArraySize(Array200);
          int SizeOfBarBox    = ArraySize(BarBox);
          int SizeOfPriceTwoY = ArraySize(PriceTwoY);
          //==========================================================================================
          if (WAVECount > 5 ) WAVECount = 5; ///cheaking lines count//if (WAVECount > 5 ) WAVECount = 5;
          int ArrayTotalElements = SizeOfArray200;
          //==========================================================================================
          //Fill Arrays Reseting Values//
          for (int i = 0; i < ArrayTotalElements; i++) Array200[i] = 0;//assign zero vallue to all Elemets///Array200[200];defined///200+1 elenent exist///
          for (int i = 0; i < SizeOfPriceTwoY; i++) { BarBox[i] = -1; PriceTwoY[i] = 0; }//>>>Assign values// BarBox[i] = -1>>??>>>mean non BarNum
          //==========================================================================================
          int ArrayLastElementIndexAddress = (ArrayTotalElements - 1);//>>>mean start from zero element....>>> Select Last element
          WaveBarDepthTryLimitAdjust = (int)(MathRound(WaveBarDepthTryLimit + 1) / 2.0);//>>>for not floating number or Ord number,,13579
          //Alert("ArrayLastElementIndexAddress", ArrayLastElementIndexAddress);
          //==========================================================================================Start Fractals Define
          //TrackingINDEX///iDown=2499//"ArrayLastElementIndexAddress:2499"==gone to function////
          for (int iDown = ArrayLastElementIndexAddress ; iDown > 0; iDown--) UpdateFractalsOneArray(Array200, WaveBarDepthTryLimitAdjust, iDown);// for (int i = 199; i > 0; i--)
          //==========================================================================================
          //>>//erooring un exited
          KeySearching = TRUE; if (KeySearching) { SearchingElliottWaves(Is_Create, _NameWavesCom ); KeySearching = FALSE; } //>>>>important to Creating lines of Waves.... by default
          //==========================================================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          iTimeSize     = 0; int i ;////thrwo time  for loop////start untill... Gancix For...//musibat dii....sharti...
          int Timebar   = 0;//(int)iTime(Symbol(), PERIOD_H1, 0);
          if(Dev_Checkup_Terminal._Mql_.CONNECTED)
          {         Timebar   =  (int)iTime(Symbol(), PERIOD_H1, 0); }
          bool ShiftBar = 0;//ShiftBar = iBarShift(Symbol(), PERIOD_H1, i, TRUE) != -1;
          for (i = Timebar; ShiftBar ; i -= 3600)
          {         if(Dev_Checkup_Terminal._Mql_.CONNECTED)
                              ShiftBar = iBarShift(Symbol(), PERIOD_H1, i, TRUE) != -1; //
          } ///erroring updating data
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //|
          //==========================================================================================
          bool ShiftBar2 = 0;//ShiftBar = iBarShift(Symbol(), PERIOD_H1, i, TRUE) != -1;
          while (ShiftBar2) /////Examplewhile (iBarShift(Symbol(), PERIOD_H1, i, TRUE) == -1) { i -= 3600; iTimeSize++; }///erroring updating data
          {         i -= 3600; iTimeSize++;
                    if(Dev_Checkup_Terminal._Mql_.CONNECTED)
                              ShiftBar2 = iBarShift(Symbol(), PERIOD_H1, i, TRUE) == -1; //
          } ///erroring updating data
          //==========================================================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return (true); //
          //
          //
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cgp_ElliotWavePAD::UpdateFractalsOneArray(double & ArrayCom[], int iWaveBarDepthTryLimitAdjustCom, int iDownForCom, int BarDepthUpdateFractalsBackCom = BarDepthBackValue, bool IsUpdateLevels = TRUE, bool IsOtherArray = false) ///deffrent name on interface.ok..//      Cgp_ElliotWavePAD::UpdateFractalsOneArray(double &ada_0[], int ai_4, int ai_8, bool ai_12 = TRUE);
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          //TrackingINDEX///iDownForCom=iDown=2499//"ArrayLastElementIndexAddress:2499"==gone to function////
#define FractalNone 0
#define FractalUp 1
#define FractalDown 2
          //===
          ///if(ArrayIsDynamic(ArrayCom))
          //ArrayResize(ArrayCom, 400); ///>>>>>>>>>.ddd
          //-----------------------------------
          //int FractalBarValue = IS_FractalBar(iDownForCom, iWaveBarDepthTryLimitAdjustCom);
          //if (FractalBarValue == 0) ArrayCom[iDownForCom] = 0;
          //if (FractalBarValue == 1)
          //{         ArrayCom[iDownForCom] = High[iDownForCom];////Assining value of miror
          //          if (IsUpdateLevels) update_high(ArrayCom, iDownForCom); }
          //if (FractalBarValue == 2)
          //{         ArrayCom[iDownForCom] = Low[iDownForCom];////Assining value of miror
          //          if (IsUpdateLevels) update_low(ArrayCom, iDownForCom); }
          {         //
                    //TrackingINDEX///iDownForCom=iDown=2499//"ArrayLastElementIndexAddress:2499"==gone to function////
                    int FractalBarValue = IS_FractalBar(iDownForCom, iWaveBarDepthTryLimitAdjustCom);//TrackingINDEX//////every element state///
                    switch (FractalBarValue)///Switching to Fill ArrayBox of Wave....
                    {         case FractalNone:
                              {         //Alert(iDownForCom, "<iDownForCom-FractalNone-*ArraySize:Array200>", ArraySize(Array200), " __LINE__ ", __LINE__, " __FUNCTION__ ", __FUNCTION__ );
                                        if(IsOtherArray) { ArrayCom[iDownForCom] = 0;}
                                        else { Array200[iDownForCom] = 0;} //
                              } break;
                              case FractalUp:
                              {         //Alert(iDownForCom, "<iDownForCom-FractalUp-*ArraySize:Array200>", ArraySize(Array200), " __LINE__ ", __LINE__, " __FUNCTION__ ", __FUNCTION__);
                                        if(IsOtherArray) { ArrayCom[iDownForCom] = High[iDownForCom];}
                                        else {Array200[iDownForCom] = High[iDownForCom];}////Assining value of miror//>>>>>>>>>>array com isse
                                        if(IsOtherArray) {  if (IsUpdateLevels)UpdateWaveHigh(ArrayCom, iDownForCom, BarDepthUpdateFractalsBackCom, IsOtherArray); } //
                                        else if (IsUpdateLevels) UpdateWaveHigh(Array200, iDownForCom, BarDepthUpdateFractalsBackCom, IsOtherArray); //////Assining value over 100BarOlder//>
                              } break;
                              case FractalDown:
                              {         //Alert(iDownForCom, "<iDownForCom-FractalDown-*ArraySize:Array200>", ArraySize(Array200), " __LINE__ ", __LINE__, " __FUNCTION__ ", __FUNCTION__);
                                        if(IsOtherArray) { ArrayCom[iDownForCom] = Low[iDownForCom];}
                                        else { Array200[iDownForCom] = Low[iDownForCom];}////Assining value of miror
                                        if(IsOtherArray) {  if (IsUpdateLevels)UpdateWaveLow(ArrayCom, iDownForCom, BarDepthUpdateFractalsBackCom, IsOtherArray); } //
                                        else if (IsUpdateLevels) UpdateWaveLow(Array200, iDownForCom, BarDepthUpdateFractalsBackCom, IsOtherArray); //
                              } break; //
                    }
                    /////
                    // if (FractalBarValue == 0) { Alert("*ArraySize:Array200>", ArraySize(Array200) ); Array200[iDownForCom] = 0;}
                    //if (FractalBarValue == 1)
                    //{         Array200[iDownForCom] = High[iDownForCom];////Assining value of miror//>>>>>>>>>>array com isse
                    //          if (IsUpdateLevels) update_high(Array200, iDownForCom); }
                    //if (FractalBarValue == 2)
                    //{         Array200[iDownForCom] = Low[iDownForCom];////Assining value of miror
                    //          if (IsUpdateLevels) update_low(Array200, iDownForCom); }
                    //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          //===
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cgp_ElliotWavePAD::UpdateWaveHigh(double & ArrayCom[], int iDownForCom, int BarDepthUpdateFractalsBackCom = 100, bool IsOtherArray = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          ///=============
          //Variable scope is from declaration to the end of the block, in which the variable is declared
          //Variable scope is from declaration (even in the nested block) to the function end
          //=================
          ///---IndexCom + 1 //>>>mean next 100 candels
          //for (int i = iForCom + 1; i < iForCom + 100; i++)///over next older bars
          //{         if (ArrayCom[i] != 0.0) break; //>>>mean next one candels Not equal zero out loop;
          //          if (ArrayCom[i] == High[i])//>>>mean next one candels   equal high of candel ;
          //          {         if (High[iForCom] > High[i]) ArrayCom[i] = 0;//>>>mean next one candels hight, grater than  high of candel IndexCom ; ArrayCom next candel equal to zero
          //                    if (High[iForCom] < High[i]) ArrayCom[iForCom] = 0;//////HighDirection up
          //          } //
          //} //
          if(IsOtherArray)  //
          {         ///
                    int ArrayComSize = ArraySize(ArrayCom);
                    bool IsOverSize = iDownForCom + BarDepthUpdateFractalsBackCom > ArrayComSize;
                    if(IsOverSize )ArrayResize(ArrayCom, ArrayComSize + BarDepthUpdateFractalsBackCom);  //iDownForCom + 101
                    int i;
                    for (i = iDownForCom + 1; i < iDownForCom + BarDepthUpdateFractalsBackCom; i++) //>>>Start From Come200index untill 300indexBar ///over next older bars///Come200index??>>>300indexBar
                    {         if (ArrayCom[i] != 0.0) break; //>>>mean next one candels Not equal zero out loop;
                              //if (Array200[i] == High[i])//>>>mean next one candels   equal high of candel ;
                              //         {         if (High[iDownForCom] > High[i]) Array200[i] = 0;//>>>mean next one candels hight, grater than  high of candel IndexCom ; ArrayCom next candel equal to zero
                              //                   if (High[iDownForCom] < High[i]) Array200[iDownForCom] = 0;//////HighDirection up
                              //         } //
                    } //
                    if (ArrayCom[i] == High[i])//>>>mean next one candels   equal high of candel ;
                    {         if (High[iDownForCom] > High[i]) ArrayCom[i] = 0;//>>>mean next one candels hight, grater than  high of candel IndexCom ; ArrayCom next candel equal to zero
                              if (High[iDownForCom] < High[i]) ArrayCom[iDownForCom] = 0;//////HighDirection up
                    } //
                    //
          }
          else
          {         int Array200Size = ArraySize(Array200);
                    bool IsOverSize = iDownForCom + BarDepthUpdateFractalsBackCom > Array200Size;
                    if(IsOverSize )ArrayResize(Array200, Array200Size + BarDepthUpdateFractalsBackCom);  //iDownForCom + 101
                    int i;
                    for (i = iDownForCom + 1; i < iDownForCom + BarDepthUpdateFractalsBackCom; i++) //>>>Start From Come200index untill 300indexBar ///over next older bars///Come200index??>>>300indexBar
                    {         if (Array200[i] != 0.0) break; //>>>mean next one candels Not equal zero out loop;
                              //if (Array200[i] == High[i])//>>>mean next one candels   equal high of candel ;
                              //         {         if (High[iDownForCom] > High[i]) Array200[i] = 0;//>>>mean next one candels hight, grater than  high of candel IndexCom ; ArrayCom next candel equal to zero
                              //                   if (High[iDownForCom] < High[i]) Array200[iDownForCom] = 0;//////HighDirection up
                              //         } //
                    } //
                    Array200Size = ArraySize(Array200);
                    //Alert((string)Array200Size, "   ", (string)i); ////--2500 candel
                    if (Array200[i - 1] == High[i - 1]) //>>>mean next one candels   equal high of candel ;
                    {         if (High[iDownForCom] > High[i - 1]) Array200[i - 1] = 0;             //>>>mean next one candels hight, grater than  high of candel IndexCom ; ArrayCom next candel equal to zero
                              if (High[iDownForCom] < High[i - 1]) Array200[iDownForCom - 1] = 0;   //////HighDirection up
                    } //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cgp_ElliotWavePAD::UpdateWaveLow(double & ArrayCom[], int iDownForCom, int BarDepthUpdateFractalsBackCom = 100, bool IsOtherArray = false) //void          Cgp_ElliotWavePAD::update_low(double &ada_0[], int ai_4);
{         //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          //TrackingINDEX///iDownForCom=iDownForCom=iDown=2499//"ArrayLastElementIndexAddress:2499"==gone to function////
          ///==========
          //          double ExtDynamic[];   // dynamic array
          //          double ExtStatic[100]; // static array
          //
          //if(ArrayIsDynamic(ArrayCom))
          {         //ArrayResize(ArrayCom, 400); ///>>>>>>>>>.ddd
                    //Alert("ArraySize: ", ArraySize(ArrayCom));//
                    //
          }
          {         //for (int i = iForCom + 1; i < iForCom + 100; i++)
                    //{         ///==================================
                    //          ///
                    //          ///==================================
                    //                if (ArrayCom[i] != 0.0) break;
                    //
                    //          //
                    //}
                    //if (ArrayCom[i] == Low[i])
                    //                    {         if (Low[iForCom] < Low[i]) ArrayCom[i] = 0;
                    //                              if (Low[iForCom] > Low[i]) ArrayCom[iForCom] = 0;////>>>mean next one candels low, lower than  low of candel IndexCom ; ArrayCom IndexCom candel equal to zero///LowDirection Down
                    //                    }//
          }
          //Alert(iDownForCom, "<iDownForCom-FractalDown-*ArraySize:Array200>", ArraySize(Array200), " __LINE__ ", __LINE__ );
          if(IsOtherArray)  //
          {         //TrackingINDEX///iDownForCom=iDownForCom=iDown=2499//"ArrayLastElementIndexAddress:2499"==gone to function////
                    int ArrayComSize = ArraySize(ArrayCom);
                    bool IsOverSize = iDownForCom + BarDepthUpdateFractalsBackCom > ArrayComSize;
                    if(IsOverSize )ArrayResize(ArrayCom, ArrayComSize + BarDepthUpdateFractalsBackCom);  //iDownForCom + 101
                    //Alert(iDownForCom + 100, "-:-", ArraySize(Array200), " __LINE__ ", __LINE__, " __FUNCTION__ ", __FUNCTION__  );
                    int i ;
                    for (i = iDownForCom + 1; i < iDownForCom + BarDepthUpdateFractalsBackCom ; i++)///chaking before values
                    {         ///global array
                              //TrackingINDEX///iDownForCom=iDownForCom=iDown=2499//"ArrayLastElementIndexAddress:2499"==gone to function////
                              //TrackingINDEX///i= 2499+1=2499//"ArrayLastElementIndexAddress:2499"==gone to function////
                              //Alert(iDownForCom, "<iDownForCom-FractalDown-*ArraySize:Array200>", ArraySize(Array200), " __LINE__ ", __LINE__, " __FUNCTION__ ", __FUNCTION__  );
                              //Alert(i, "<i-iDownForCom-FractalDown-*ArraySize:Array200>", ArraySize(Array200), " __LINE__ ", __LINE__, " __FUNCTION__ ", __FUNCTION__  );
                              if (ArrayCom[i] != 0.0) break;///if non fractal has valuse not zero mean wrong array came,,,out for loop////pre cheaking
                              //Wrong//if (Array200[i] == Low[i])////2495==2495 low....
                              //Wrong//{         if (Low[iDownForCom] < Low[i]) Array200[i] = 0;////fore recheking pivot point fractall get...
                              //Wrong          if (Low[iDownForCom] > Low[i]) Array200[iDownForCom] = 0;////>>>mean next one candels low, lower than  low of candel IndexCom ; ArrayCom IndexCom candel equal to zero///LowDirection Down
                              //Wrong}//
                              //////////
                    }//
                    if (ArrayCom[i] == Low[i])////2495==2495 low....
                    {         if (Low[iDownForCom] < Low[i]) ArrayCom[i] = 0;////fore recheking pivot point fractall get...
                              if (Low[iDownForCom] > Low[i]) ArrayCom[iDownForCom] = 0;////>>>mean next one candels low, lower than  low of candel IndexCom ; ArrayCom IndexCom candel equal to zero///LowDirection Down
                    }//
                    //
          }
          else
          {         //TrackingINDEX///iDownForCom=iDownForCom=iDown=2499//"ArrayLastElementIndexAddress:2499"==gone to function////
                    int Array200Size = ArraySize(Array200);
                    bool IsOverSize = iDownForCom + BarDepthUpdateFractalsBackCom > Array200Size;
                    if(IsOverSize )ArrayResize(Array200, Array200Size + BarDepthUpdateFractalsBackCom);  //iDownForCom + 101
                    //Alert(iDownForCom + 100, "-:-", ArraySize(Array200), " __LINE__ ", __LINE__, " __FUNCTION__ ", __FUNCTION__  );
                    int i ;
                    for (i = iDownForCom + 1; i < iDownForCom + BarDepthUpdateFractalsBackCom ; i++)///chaking before values
                    {         ///global array
                              //TrackingINDEX///iDownForCom=iDownForCom=iDown=2499//"ArrayLastElementIndexAddress:2499"==gone to function////
                              //TrackingINDEX///i= 2499+1=2499//"ArrayLastElementIndexAddress:2499"==gone to function////
                              //Alert(iDownForCom, "<iDownForCom-FractalDown-*ArraySize:Array200>", ArraySize(Array200), " __LINE__ ", __LINE__, " __FUNCTION__ ", __FUNCTION__  );
                              //Alert(i, "<i-iDownForCom-FractalDown-*ArraySize:Array200>", ArraySize(Array200), " __LINE__ ", __LINE__, " __FUNCTION__ ", __FUNCTION__  );
                              if (Array200[i] != 0.0) break;///if non fractal has valuse not zero mean wrong array came,,,out for loop////pre cheaking
                              //Wrong//if (Array200[i] == Low[i])////2495==2495 low....
                              //Wrong//{         if (Low[iDownForCom] < Low[i]) Array200[i] = 0;////fore recheking pivot point fractall get...
                              //Wrong          if (Low[iDownForCom] > Low[i]) Array200[iDownForCom] = 0;////>>>mean next one candels low, lower than  low of candel IndexCom ; ArrayCom IndexCom candel equal to zero///LowDirection Down
                              //Wrong}//
                              //////////
                    }//
                    if (Array200[i] == Low[i])////2495==2495 low....
                    {         if (Low[iDownForCom] < Low[i]) Array200[i] = 0;////fore recheking pivot point fractall get...
                              if (Low[iDownForCom] > Low[i]) Array200[iDownForCom] = 0;////>>>mean next one candels low, lower than  low of candel IndexCom ; ArrayCom IndexCom candel equal to zero///LowDirection Down
                    }//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Cgp_ElliotWavePAD::IS_FractalBar(int iDownForCom, int iWaveBarDepthTryLimitAdjustCom)
{         ///no need any array...just return bar is fractal or nat in depth
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          ////===============================================================================
          ////Search To Define Fractal Bars of Waves in Depth>>>>
          ////===============================================================================
          int WaveNextBarDepth = 1;
          int IndexHighCount = 0;
          int IndexLowCount = 0;
          while (WaveNextBarDepth < iWaveBarDepthTryLimitAdjustCom)
          {         if (High[iDownForCom] > High[iDownForCom + WaveNextBarDepth])//if come bar higher than //?? [newer]older bar  //>>>[gone up direct]
                    {         if (iDownForCom - WaveNextBarDepth >= 0)//if come bar - trylimit bar grater than zeroo///[existed]!  //>>>gone up direct
                                        if (High[iDownForCom] > High[iDownForCom - WaveNextBarDepth]) IndexHighCount++; ////if come bar higher than newer bar [count up];;;
                    }
                    if (Low[iDownForCom] < Low[iDownForCom + WaveNextBarDepth])//if come bar lower than //?? [newer]older bar  //>>>gone down direct
                    {         if (iDownForCom - WaveNextBarDepth >= 0)//[existed]!
                                        if (Low[iDownForCom] < Low[iDownForCom - WaveNextBarDepth]) IndexLowCount++; //////if come bar lower than newer bar count up;;;
                    }
                    WaveNextBarDepth++; //
          }
          if (IndexHighCount == iWaveBarDepthTryLimitAdjustCom - 1) return (1);///>>unknowen try//>>>>Come bar higher than newer bar count up;;; and  [HighCount equal to TryLimit-1]///[fractal Up]////
          if (IndexLowCount == iWaveBarDepthTryLimitAdjustCom - 1) return (2);///>>>low Fractal...
          ////===
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          return (0);/////[Not any type of fractal]////
          ///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cgp_ElliotWavePAD::UpdateElliottWaves_SET_Price_TIME_COLOR(bool Is_Create = false, string _NameWavesCom = "")//GetSet_
{         //////===
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          if(Is_Create)
          {         int Time1X;
                    string TextComment = "=====================\n"
                                         + "||   ELLIOTT WAVE PROPHETS  ||\n"
                                         + "||Ïèíêè        || \n"
                                         + " ||    Áðÿê  || \n"
                                         + " == == == Waves DataS : == == == \n\n";
                    double PriceLenght = 0;
                    //=======================================================================
                    for (int i = 1; i < 9; i++)
                    {         string LineName  = _NameWavesCom + "Wave " + ((string)(i - 0));
                              string LineName2 = _NameWavesCom + "Wave " + ((string)(i - 1));
                              string LineName3 = _NameWavesCom + "Wave " + ((string)(i + 1));
                              string LineName4 = _NameWavesCom + "Wave " + ((string)(i - 2));
                              //--------------------------------------------------------------------------
                              ///------------------------------------
                              double Time1Y = ObjectGet(LineName, OBJPROP_TIME2);
                              double Price1Y = ObjectGet(LineName, OBJPROP_PRICE1);
                              double Price2Y = ObjectGet(LineName, OBJPROP_PRICE2);
                              if (PriceLenght == 0.0) PriceLenght = MathAbs(Price2Y - Price1Y);
                              PriceLenght = MathAbs(Price2Y - Price1Y);
                              //=======================================================================
                              if (Price1Y != PriceTwoY[i - 1] && i != 1)
                              {         Time1X = (int)ObjectGet(LineName, OBJPROP_TIME1);
                                        ObjectSet(LineName2, OBJPROP_PRICE2, Price1Y);
                                        ObjectSet(LineName2, OBJPROP_TIME2, Time1X);
                                        PriceTwoY[i - 1] = Price1Y;
                                        BarBox[i - 1] = iBarShift(Symbol(), Period(), Time1X);
                                        UpdatingWavesTimePrice(i - 1); }
                              //=======================================================================
                              if (Price1Y != PriceTwoY[0] && i == 1)
                              {         UpdatingWavesTimePrice();
                                        PriceTwoY[0] = Price1Y; }
                              //=======================================================================
                              if (Price2Y != PriceTwoY[i] && i != 8)
                              {         Time1X = (int)ObjectGet(LineName, OBJPROP_TIME2);
                                        ObjectSet(LineName3, OBJPROP_PRICE1, Price2Y);
                                        ObjectSet(LineName3, OBJPROP_TIME1, Time1X);
                                        PriceTwoY[i] = Price2Y;
                                        BarBox[i] = iBarShift(Symbol(), Period(), Time1X);
                                        UpdatingWavesTimePrice(i - 1); }
                              //=======================================================================
                              if (i == 1) TextComment = TextComment + LineName
                                                                  + ": "
                                                                  + DoubleToStr(MathAbs(Price2Y - Price1Y) / PipPoint, 1)
                                                                  + " pips \n";
                              if (i == 2 || i == 4)
                              {         double PriceOneLine2 = ObjectGet(LineName2, OBJPROP_PRICE1);
                                        double PriceTwoLine = ObjectGet(LineName, OBJPROP_PRICE2);//LineName
                                        Alert("PriceOneLine2 - PriceTwoLine", PriceOneLine2 - PriceTwoLine);
                                        TextComment = TextComment + LineName
                                                      + ": "
                                                      + DoubleToStr(MathAbs(Price2Y - Price1Y) / PipPoint, 1)
                                                      + " pips "
                                                      + DoubleToStr(100.0 * MathAbs((Price2Y - Price1Y) / (PriceOneLine2 - PriceTwoLine)), 1)
                                                      + " % from Wave "
                                                      + ((string)(i - 1))
                                                      + "\n"; }
                              //=======================================================================
                              if (i == 3 || i == 5)
                              {         double PriceOneW4 = ObjectGet(LineName4, OBJPROP_PRICE1);///PriceTwoW6
                                        double PriceTwoW4 = ObjectGet(LineName4, OBJPROP_PRICE2);
                                        TextComment = TextComment + LineName
                                                      + ": "
                                                      + DoubleToStr(MathAbs(Price2Y - Price1Y) / PipPoint, 1)
                                                      + " pips "
                                                      + DoubleToStr(100.0 * MathAbs((Price2Y - Price1Y) / (PriceOneW4 - PriceTwoW4) ), 1)
                                                      + " % from Wave "
                                                      + ((string)(i - 2))
                                                      + "\n"; }
                              //=======================================================================
                              if (i == 7 || i == 8)
                              {         string LineNameWave6  = _NameWavesCom + "Wave 6" ;
                                        double PriceOneW6 = ObjectGet(LineNameWave6, OBJPROP_PRICE1);
                                        double PriceTwoW6 = ObjectGet(LineNameWave6, OBJPROP_PRICE2);
                                        TextComment = TextComment
                                                      + ObjectDescription(LineName)
                                                      + ": "
                                                      + DoubleToStr(MathAbs(Price2Y - Price1Y) / PipPoint, 1)
                                                      + " pips "
                                                      + DoubleToStr(100.0 * MathAbs((Price2Y - Price1Y) / (PriceOneW6 - PriceTwoW6 )), 1)
                                                      + " % from Wave A\n"; }
                              ///======================
                              if (i == 6)
                              {         string LineNameWave5  = _NameWavesCom + "Wave 5" ;
                                        double PriceOneW5 = ObjectGet(LineNameWave5, OBJPROP_PRICE1);
                                        double PriceTwoW5 = ObjectGet(LineNameWave5, OBJPROP_PRICE2);
                                        TextComment = TextComment
                                                      + "Wave A"
                                                      + ": "
                                                      + DoubleToStr(MathAbs(Price2Y - Price1Y) / PipPoint, 1)
                                                      + " pips "
                                                      + DoubleToStr(100.0 * MathAbs((Price2Y - Price1Y) / (PriceOneW5  - PriceTwoW5)), 1)
                                                      + " % from Wave 5\n"; }
                              ///======================
                              if (Time[0] < Time1Y)
                                        ObjectSet(LineName, OBJPROP_COLOR, ProphetColor);
                              else
                                        ObjectSet(LineName, OBJPROP_COLOR, PaintedColor); //
                    }
                    //=======================================================================
                    // Comment(TextComment); //
          }
          // else ClearElliottWave(); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cgp_ElliotWavePAD::SearchingElliottWaves(bool Is_Create = false, string _NameWavesCom = "" )
{         //=======================================================================================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          //>>>>.Array200////Must fill before searching////
          int j = 0;    ///;int Index4 = 0;
          int BarNum = 0;  //int l_index_0 = 0///the time bar index//???>>>is out of forr loo to keep values used...//>>>solved...
          //=================================================================================================================================
          for (int  i = 0; i < WAVECount; i++)////Searching Pivot Bars/////Creating Waves by WAVECount controled
          {         string NameWaveDownCount = _NameWavesCom + "Wave " +  (string)(WAVECount - i);
                    //=======================================================================================================================
                    ///>>>wrong///int BarNum = 0;  //int l_index_0 = 0///the time bar index//???>>>is out of forr loo to keep values used...
                    while (Array200[BarNum] == 0.0) BarNum++;///When Elemet of array iz Zero llop end//////Find BarsNotZero                ==
                    //=======================================================================================================================
                    for (j = BarNum + 1; Array200[j] == 0.0; j++) {}///When Elemet of array iz Zero////// From ZeroBar untill Older ZeroBar==
                    //=======================================================================================================================
                    //>>>>>..Creating Line From Bar is Zero value in element of array To the Older Bar is Zero value in element of array ////
                    //>>//erooring un exited
                    MyCreateObject(Is_Create, NameWaveDownCount, (int)Time[j], Array200[j], (int)Time[BarNum], Array200[BarNum], WAVECount - i);
                    //=======================================================================================================================
                    BarBox[WAVECount - i] = BarNum;
                    BarBox[WAVECount - i - 1] = j;
                    PriceTwoY[WAVECount - i] = Array200[BarNum];
                    BarNum = j; //
                    //=======================================================================================================================
          }
          //=======================================================================================================================
          PriceTwoY[0] = Array200[j]; //
          //=================================================================================================================================
          string                                NameWaveLine            = _NameWavesCom + "Wave " + (string)WAVECount;
          //-----------------------------------------------------------------------------------------------------------
          double                                Price2WaveLine          = 0;
          double                                Price1WaveLine          = 0;
          int                                   Time1WaveLine           = 0;
          int                                   Time2WaveLine           = 0;
          if(ObjectFind(0, NameWaveLine) >= 0)
          {         Price2WaveLine = ObjectGet(NameWaveLine, OBJPROP_PRICE2);
                    Price1WaveLine = ObjectGet(NameWaveLine, OBJPROP_PRICE1);
                    Time1WaveLine = (int)ObjectGet(NameWaveLine, OBJPROP_TIME1);
                    Time2WaveLine = (int)ObjectGet(NameWaveLine, OBJPROP_TIME2);//
          }
          //----------------------------------------------------------------------------------------------------------
          int                                   PostiveNagative         = 1;
          if (Price2WaveLine > Price1WaveLine)  PostiveNagative         = -1;///Control Price Direct
          double                                IndexWaveLenghtFibo     = 50;
          int                                   WaveTimeLengthFibo      = 5;
          double                                WaveLengthFibo          = 0.618;
          int                                   WaveNum                 = 0;
          //================================================================================
          double   Price1WaveCurrect = 0;// = ObjectGet(NameWaveCurrect, OBJPROP_PRICE2);
          double   Price2WaveCurrect = 0 ; // = ObjectGet(NameWaveCurrect, OBJPROP_PRICE2);
          datetime Time2WaveCurrect  = 0;//  = (int)ObjectGet(NameWaveCurrect, OBJPROP_TIME2);
          //================================================================================
          for (int k = WAVECount; k < 8; k++)
          {         if (k == 1)
                    {         WaveLengthFibo = 0.618;
                              WaveNum = 1; }
                    if (k == 2)
                    {         WaveLengthFibo = 1.618;
                              WaveNum = 1; }
                    if (k == 3)
                    {         WaveLengthFibo = 0.382;
                              WaveNum = 3; }
                    if (k == 4)
                    {         WaveLengthFibo = 0.618;
                              WaveNum = 3; }
                    if (k == 5)
                    {         WaveLengthFibo = 0.618;
                              WaveNum = 5; }
                    if (k == 6)
                    {         WaveLengthFibo = 0.5;
                              WaveNum = 6; }
                    if (k == 7)
                    {         WaveLengthFibo = 1;
                              WaveNum = 6; }
                    int Next = k + 1;
                    string NameWaveCurrect = _NameWavesCom + "Wave " + (string)k;
                    string NameWaveNext    = _NameWavesCom + "Wave " + (string)(Next);
                    if(ObjectFind(0, NameWaveCurrect) >= 0)
                    {         Price2WaveCurrect = ObjectGet(NameWaveCurrect, OBJPROP_PRICE2);
                              Time2WaveCurrect  = (int)ObjectGet(NameWaveCurrect, OBJPROP_TIME2);//
                    }
                    //====================================================
                    string  NameWaveNum   = _NameWavesCom + "Wave " + (string)WaveNum;
                    //====================================================
                    double  Price2WaveNum = 0; // Price2WaveCurrect = ObjectGet(NameWaveNum, OBJPROP_PRICE2);
                    double  Price1WaveNum = 0; // Price1WaveCurrect = ObjectGet(NameWaveNum, OBJPROP_PRICE1);
                    double  Time1WaveNum  = 0; // ObjectGet(NameWaveNum, OBJPROP_TIME1);
                    double  Time2WaveNum  = 0; // ObjectGet(NameWaveNum, OBJPROP_TIME2);//
                    if(ObjectFind(0, NameWaveNum) >= 0)
                    {         Price2WaveNum =  Price2WaveCurrect = ObjectGet(NameWaveNum, OBJPROP_PRICE2);
                              Price1WaveNum =  Price1WaveCurrect = ObjectGet(NameWaveNum, OBJPROP_PRICE1);
                              Time1WaveNum  =  ObjectGet(NameWaveNum, OBJPROP_TIME1);
                              Time2WaveNum  =  ObjectGet(NameWaveNum, OBJPROP_TIME2);//
                              ///
                    }
                    //====================================================
                    IndexWaveLenghtFibo   = WaveLengthFibo * MathAbs(Price2WaveNum  - Price1WaveNum);
                    //====================================================
                    WaveTimeLengthFibo    = (int)MathFloor(WaveLengthFibo * MathAbs(Time1WaveNum - Time2WaveNum));
                    //====================================================
                    //>>//
                    MyCreateObject(Is_Create, NameWaveNext, (int)Time2WaveCurrect, Price2WaveCurrect, (int)Time2WaveCurrect  + WaveTimeLengthFibo, Price2WaveCurrect + PostiveNagative * IndexWaveLenghtFibo, Next);
                    //====================================================
                    PriceTwoY[k] = Price2WaveCurrect;
                    Price2WaveCurrect += PostiveNagative * IndexWaveLenghtFibo;
                    Time2WaveCurrect  += WaveTimeLengthFibo;
                    PostiveNagative = -PostiveNagative; //
                    //====================================================
          }
          PriceTwoY[8] = Price2WaveLine = Price2WaveCurrect;
          //>>//>>//erooring un exited
          UpdatingWavesTimePrice(WAVECount - 1, _NameWavesCom );//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          //////===
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cgp_ElliotWavePAD::UpdatingWavesTimePrice(int iWaveCom = 0, string _NameWavesCom = "")//void update_waves(int ai_0 = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          //////===
          {         int         Count;
                    string      NameWaveComCurrent              = _NameWavesCom + "Wave " + ((string)(iWaveCom ));
                    string      NameWaveComNext                 = _NameWavesCom + "Wave " + ((string)(iWaveCom + 1));
                    string      NameWaveNext;//                 = _NameWavesCom + "Wave " + ((string)(iStart + 1));
                    string      NameWaveCurrent;//              = _NameWavesCom + "Wave " + ((string)(iStart ));
                    //==
                    string      NameWaveNumNext;//              = _NameWavesCom + "Wave " + ((string)(iWaveNum + 1));
                    string      NameWaveNumCurrent;//           = _NameWavesCom + "Wave " + ((string)(iWaveNum ));
                    int         iBarShiftTime2WaveNumCurrent;// = iBarShift(Symbol(), Period(), (datetime)Time2WaveNumCurrent);
                    int         iBarShiftTime1WaveNumCurrent;// = iBarShift(Symbol(), Period(), (datetime)Time1WaveNumCurrent);
                    int         iBarShiftTime2WaveComNext;//    = iBarShift(Symbol(), Period(), Time2WaveWaveComNext);
                    ////===============================
                    double      Price1WaveComNext               = 0; //(double)ObjectGet(NameWaveComNext, OBJPROP_PRICE1);
                    double      Price2WaveComNext               = 0; //(double)ObjectGet(NameWaveComNext, OBJPROP_PRICE2);
                    datetime    Time1WaveComNext                = 0; //(datetime)ObjectGet(NameWaveComNext, OBJPROP_TIME1);
                    datetime    Time2WaveComNext                = 0; //(datetime)ObjectGet(NameWaveComNext, OBJPROP_TIME2);
                    if(ObjectFind(0, NameWaveComNext) >= 0)
                    {         Price1WaveComNext               = (double)ObjectGet(NameWaveComNext, OBJPROP_PRICE1);
                              Price2WaveComNext               = (double)ObjectGet(NameWaveComNext, OBJPROP_PRICE2);
                              Time1WaveComNext                = (datetime)ObjectGet(NameWaveComNext, OBJPROP_TIME1);
                              Time2WaveComNext                = (datetime)ObjectGet(NameWaveComNext, OBJPROP_TIME2);//
                    }
                    //=================================
                    datetime    Time1WaveNumCurrent = 0; //          =(datetime)ObjectGet(NameWaveNumCurrent, OBJPROP_TIME1);
                    datetime    Time2WaveNumCurrent = 0; //          =(datetime)ObjectGet(NameWaveNumCurrent, OBJPROP_TIME2);
                    double      Price1WaveNumCurrent = 0; //         =(double)ObjectGet(NameWaveNumCurrent, OBJPROP_PRICE1);
                    double      Price2WaveNumCurrent = 0; //         =(double)ObjectGet(NameWaveNumCurrent, OBJPROP_PRICE2);
                    //=================================
                    double      Price1WaveCurrent = 0; //            =(double)ObjectGet(NameWaveCurrent, OBJPROP_PRICE1);
                    double      Price2WaveCurrent = 0; //            =(double)ObjectGet(NameWaveCurrent, OBJPROP_PRICE2);
                    datetime    Time1WaveCurrent = 0; //             =(datetime)ObjectGet(NameWaveCurrent, OBJPROP_TIME1);
                    datetime    Time2WaveCurrent = 0; //             =(datetime)ObjectGet(NameWaveCurrent, OBJPROP_TIME2);
                    ////===============================
                    double      Price1WaveNext = 0; //               =(double)ObjectGet(NameWaveNext, OBJPROP_PRICE1);
                    double      Price2WaveNext = 0; //               =(double)ObjectGet(NameWaveNext, OBJPROP_PRICE2);
                    datetime    Time1WaveNext = 0; //                =(datetime)ObjectGet(NameWaveNext, OBJPROP_TIME1);
                    datetime    Time2WaveNext = 0; //                =(datetime)ObjectGet(NameWaveNext, OBJPROP_TIME2);
                    ////===============================
                    int         iPostiveNagative                = 1;
                    if (Price2WaveComNext > Price1WaveComNext) iPostiveNagative = -1;///Negetive efect
                    double IndexWaveLenghtFibo          = 50;
                    int iWaveTime                       = 60 * (5 * Period());
                    double iWaveFibo                    = 1;
                    int iWaveNum                        = 0;
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    for (int iStart = iWaveCom + 1; iStart < 8; iStart++)///selecting waves//
                    {         //=======================================================switch breaking...Fill the WaveNumber and Wave fibo ratio//
                              NameWaveCurrent           = _NameWavesCom + "Wave " + (string)iStart;
                              NameWaveNext              = _NameWavesCom + "Wave " + (string)(iStart + 1);
                              ////===============================
                              if (iStart == 1)
                              {         iWaveFibo = 0.618;
                                        iWaveNum = 1; }
                              if (iStart == 2)
                              {         iWaveFibo = 1.618;
                                        iWaveNum = 1; }
                              if (iStart == 3)
                              {         iWaveFibo = 0.382;
                                        iWaveNum = 3; }
                              if (iStart == 4)
                              {         iWaveFibo = 0.618;
                                        iWaveNum = 3; }
                              if (iStart == 5)
                              {         iWaveFibo = 0.618;
                                        iWaveNum = 5; }
                              if (iStart == 6)
                              {         iWaveFibo = 0.5;
                                        iWaveNum = 6; }
                              if (iStart == 7)
                              {         iWaveFibo = 1;
                                        iWaveNum = 6; }
                              NameWaveNumNext              = _NameWavesCom + "Wave " + (string)(iWaveNum + 1);//When off its not create Waves
                              NameWaveNumCurrent           = _NameWavesCom + "Wave " + (string)iWaveNum ;
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
                              //===========================================================================
                              if(ObjectFind(0, NameWaveNumCurrent) >= 0)
                              {         Time1WaveNumCurrent          = (datetime)ObjectGet(NameWaveNumCurrent, OBJPROP_TIME1);
                                        Time2WaveNumCurrent          = (datetime)ObjectGet(NameWaveNumCurrent, OBJPROP_TIME2);
                                        Price1WaveNumCurrent         = (double)ObjectGet(NameWaveNumCurrent, OBJPROP_PRICE1);
                                        Price2WaveNumCurrent         = (double)ObjectGet(NameWaveNumCurrent, OBJPROP_PRICE2);//
                              }
                              //===========================================================================
                              if(ObjectFind(0, NameWaveCurrent) >= 0)
                              {         Price1WaveCurrent            = (double)ObjectGet(NameWaveCurrent, OBJPROP_PRICE1);
                                        Price2WaveCurrent            = (double)ObjectGet(NameWaveCurrent, OBJPROP_PRICE2);
                                        Time1WaveCurrent             = (datetime)ObjectGet(NameWaveCurrent, OBJPROP_TIME1);
                                        Time2WaveCurrent             = (datetime)ObjectGet(NameWaveCurrent, OBJPROP_TIME2);//
                              }
                              //===========================================================================
                              if(ObjectFind(0, NameWaveNext) >= 0)
                              {         Price1WaveNext               = (double)ObjectGet(NameWaveNext, OBJPROP_PRICE1);
                                        Price2WaveNext               = (double)ObjectGet(NameWaveNext, OBJPROP_PRICE2);
                                        Time1WaveNext                = (datetime)ObjectGet(NameWaveNext, OBJPROP_TIME1);
                                        Time2WaveNext                = (datetime)ObjectGet(NameWaveNext, OBJPROP_TIME2);//
                              }
                              //===========================================================================
                              iBarShiftTime1WaveNumCurrent = iBarShift(Symbol(), Period(), Time1WaveNumCurrent);
                              iBarShiftTime2WaveNumCurrent = iBarShift(Symbol(), Period(), Time2WaveNumCurrent);
                              iBarShiftTime2WaveComNext    = iBarShift(Symbol(), Period(), Time2WaveComNext);
                              //=========================================
                              if (KeyPrint) Print("Painting " + (string)NameWaveNext);
                              //=========================================
                              Price2WaveComNext = Price2WaveCurrent;
                              Time2WaveComNext  = Time2WaveCurrent;
                              //=========================================
                              if (KeyPrint) Print("dtLast of " + (string)NameWaveCurrent + " is " + (string)Time2WaveComNext + " Bar:" + (string)iBarShiftTime2WaveComNext);
                              IndexWaveLenghtFibo = iWaveFibo * MathAbs(Price2WaveNumCurrent - Price1WaveNumCurrent);
                              //=========================================
                              if (KeyPrint) Print("iBarShift " + (string)NameWaveNumCurrent + " is " + (string)iBarShiftTime2WaveNumCurrent);
                              //=========================================
                              if (iBarShiftTime2WaveNumCurrent > 0)
                                        iWaveTime = (int)MathFloor(60.0 * (iWaveFibo * (iBarShiftTime1WaveNumCurrent - iBarShiftTime2WaveNumCurrent) * Period()));
                              else
                              {         iWaveTime = (int)MathFloor(iWaveFibo * (Time2WaveNumCurrent - Time1WaveNumCurrent));
                                        //=========================================
                                        if (KeyPrint) Print("dRatio" + (string)iWaveFibo + " iPeriods " + (string)iWaveTime + "s for " + (string)NameWaveNumCurrent + "or " + DoubleToStr(iWaveTime / (60 * Period()), 2));
                                        Time1WaveNext = Time1WaveNumCurrent;///willling points...
                                        Time2WaveNext = Time2WaveNumCurrent;///willling points...
                                        Count = 0;
                                        //=========================================
                                        while (Time1WaveNext < Time2WaveNext)
                                        {         Time1WaveNext += 3600;
                                                  //=========================================
                                                  if (TimeDayOfWeek(Time1WaveNext) == 6 && Time1WaveNext < Time[0] + 60 * Period())
                                                  {         Count++;
                                                            Time1WaveNext += 60 * (60 * iTimeSize);//
                                                  } //
                                        }
                                        //=========================================
                                        //off///iBarShiftTime1WaveNumCurrent = iBarShift(Symbol(), Period(), Time1WaveNumCurrent);
                                        if (Count != 0 && iBarShiftTime1WaveNumCurrent > 0)iWaveTime = (int)MathFloor(iWaveFibo * MathAbs(Time2WaveNumCurrent - Time1WaveNumCurrent - 60 * (60 * (Count * iTimeSize))));
                                        //=========================================
                                        if (KeyPrint) Print("iWeekEnds=" + (string)Count + " so iPeriods " + (string)iWaveTime + "s or " + DoubleToStr(iWaveTime / (60 * Period()), 2)); //
                              }
                              //=========================================
                              {         //
                                        if(ObjectFind(0, NameWaveNext) >= 0)
                                        {         ObjectSet(NameWaveNext, OBJPROP_PRICE1, Price2WaveComNext);// XYOne ///set price one cordinate to price one///Updating..
                                                  ObjectSet(NameWaveNext, OBJPROP_TIME1, Time2WaveComNext);//XYTwo    ///set price one cordinate to price one///Updating..
                                        }//
                                        PriceTwoY[iStart] = Price2WaveComNext;/////>>>>>>>>>>>.fill Prices//
                                        Price2WaveComNext += iPostiveNagative * IndexWaveLenghtFibo;
                                        Time2WaveComNext += iWaveTime;
                                        if(ObjectFind(0, NameWaveNext) >= 0)
                                        {         ObjectSet(NameWaveNext, OBJPROP_PRICE2, Price2WaveComNext);//XYTwo ///set price one cordinate to price one///Updating..
                                                  ObjectSet(NameWaveNext, OBJPROP_TIME2, Time2WaveComNext);//XYTwo   ///set price one cordinate to price one///Updating..
                                                  //off//Time1WaveNext = ObjectGet(NameWaveNext, OBJPROP_TIME1);
                                                  //off//Time2WaveNext = ObjectGet(NameWaveNext, OBJPROP_TIME2);
                                        }
                                        Count = 0;
                                        //=========================================
                                        while (Time1WaveNext < Time2WaveNext)/////adjusting time before after pointing
                                        {         Time1WaveNext += 3600;
                                                  if (TimeDayOfWeek(Time1WaveNext) == 6 && Time1WaveNext < Time[0] + 60 * Period())
                                                  {         Count++;
                                                            Time1WaveNext += 60 * (60 * iTimeSize); }
                                                  if (KeyPrint)
                                                            if (iStart == 2) Print(TimeToStr(Time1WaveNext) + " Day " + (string)TimeDayOfWeek(Time1WaveNext));//
                                        }
                                        //
                              }
                              //=========================================
                              {         datetime Set_tingTime2WaveComNext = Time2WaveComNext + 60 * (60 * (Count * iTimeSize));
                                        if (Count != 0)
                                        {         if(ObjectFind(0, NameWaveNext) >= 0)
                                                            ObjectSet(NameWaveNext, OBJPROP_TIME2, Set_tingTime2WaveComNext);///set price one cordinate to price one///Updating..
                                        }
                                        if (KeyPrint) Print((string)NameWaveNext + " has " + (string)Count + " WeekEnds");
                                        iPostiveNagative = -iPostiveNagative;//
                              } //
                    } //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cgp_ElliotWavePAD::MyCreateObject(bool Is_Create = false, string NameCom = "", int timeOne = 0, double PriceOne = 0, int timeTwo = 0, double PriceTwo = 0,
                                       int iFor = 0, int Width = 1, ENUM_LINE_STYLE Style = STYLE_DASHDOT)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          //////===
          if(Is_Create)
          {         if(ObjectFind(0, NameCom) < 1)
                              ObjectCreate(NameCom, OBJ_TREND, 0, timeOne, PriceOne, timeTwo, PriceTwo);
                    if(ObjectFind(0, NameCom) >= 0)
                    {         ObjectSet(NameCom, OBJPROP_RAY, FALSE);
                              ObjectSet(NameCom, OBJPROP_COLOR, PaintedColor);
                              if (iFor < 6) ObjectSetText(NameCom, NameCom, 10);
                              else
                              {         if (iFor == 6) ObjectSetText(NameCom, "Wave___Elliot A", 10);
                                        if (iFor == 7) ObjectSetText(NameCom, "Wave___Elliot B", 10);
                                        if (iFor == 8) ObjectSetText(NameCom, "Wave___Elliot C", 10); }
                              ObjectSet(NameCom, OBJPROP_WIDTH, Width = 2); //
                              ObjectSet(NameCom, OBJPROP_STYLE, Style);//
                    }//
          }
          else
          {         //
                    if(ObjectFind(0, NameCom) >= 0)ObjectDelete(0, NameCom);
                    //
          }
          ///
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          //////===
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Cgp_ElliotWavePAD::ClearElliottWave(bool KeyDelete = TRUE)
{         //===
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          int ObjectTotal;
          // Comment("");
          string Name = "";
          while (KeyDelete)
          {         KeyDelete = FALSE;
                    ObjectTotal = ObjectsTotal();
                    for (int i = 0; i < ObjectTotal; i++)
                    {         Name = ObjectName(i);
                              ResetLastError(); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
                              if (StringFind(Name, "Wave___Elliot") != -1)///existed
                              {         //Alert(Name);
                                        ObjectDelete(Name);
                                        KeyDelete = TRUE; //
                              }//
                              ResetLastError(); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
                    }//
          }
          ////===
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cgp_ElliotWavePAD Error",  __LINE__, __FUNCTION__); //
          return (0); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cgp_ElliotWavePAD::__CALL(int WhichMode, bool IsKey, Sg_Position2D  &Position2D  )
{         //---------------------------------------------------------------------------------------------------------------------------------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-FlowPanelToolsController Error",  __LINE__, __FUNCTION__); //|
          //---Alert("Cgp_ElliotWavePAD::PadFlow_SubElliottWAVE_PAD");
          //---------------------------------------------------------------------------------------------------------------------------------------
          //---Alert("Cgp_ElliotWavePAD::PadFlow_SubElliottWAVE_PAD  Is_Click: ", IsKey);
          //--------------------------------------------------------------------------------------------------------------------
          //if(IsCreateMode(WhichMode) && IsKey)  { gElliotWave_Pad.BTN_ElliottWAVE.GDC.MoveAdd("gElliotWave_Pad.BTN_ElliottWAVE", -14, 0); Runed = true;  }
          //if(IsCreateMode(WhichMode) && !IsKey) { gElliotWave_Pad.BTN_ElliottWAVE.GDC.MoveAdd("gElliotWave_Pad.BTN_ElliottWAVE", +14, 0); Runed = false; } //
          //---------------------------------------------------------------------------------------------------------------------------------------
          //Alert("Cgp_ElliotWavePAD::PadFlow_SubElliottWAVE_PAD");
          if(Elliott_PAD.Is_Clear_Waves)
          {         IsKey = false;
                    //---
                    DrawTextLabel(IsKey);
                    __RUN(IsKey, true, true, "12", 3, 12, Blue, Red);
                    __RUN(IsKey, true, true, "60", 3, 60, clrGold, clrGreen);
                    __RUN(IsKey, true, true, "120", 3, 120, clrWhite, clrGray);
                    __RUN(IsKey, true, true, "240", 3, 240, clrFireBrick, clrRoyalBlue); //
                    Is_ElliottWave_Run = IsKey; //
                    return true;//
          }//
          //---------------------------------------------------------------------------------------------------------------------------------------
          if(WhichMode == MODE_CREATE || WhichMode == MODE_MOVE )__SHOW(WhichMode, IsKey, Position2D); //---pad com
          //---------------------------------------------------------------------------------------------------------------------------------------
          //---
          if(WhichMode == MODE_CREATE)
          {         DrawTextLabel(IsKey);
                    __RUN(IsKey, true, true, "12", 3, 12, Blue, Red);
                    __RUN(IsKey, true, true, "60", 3, 60, clrGold, clrGreen);
                    __RUN(IsKey, true, true, "120", 3, 120, clrWhite, clrGray);
                    __RUN(IsKey, true, true, "240", 3, 240, clrFireBrick, clrRoyalBlue); //
                    Is_ElliottWave_Run = IsKey; //
          }//
          //---
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-FlowPanelToolsController Error",  __LINE__, __FUNCTION__); //|
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cgp_ElliotWavePAD::__SHOW(int WhichMode, bool IsKey, Sg_Position2D  &Position2D )
{         //-------------------------------------------------------------------------------------------------------------------------------------------
          if(false)
          {         if(!IsKey)
                    {         gElliotWave_Pad.BTN_ElliottWAVE.GAC.Color(BtnColors_FlowPanelB.DescColor);
                              gElliotWave_Pad.BTN_ElliottWAVE.GAC.BackColor(BtnColors_FlowPanelB.BackColor);
                              gElliotWave_Pad.BTN_ElliottWAVE.GAC.BorderColor(BtnColors_FlowPanelB.BorderColor);//
                    }
                    else
                    {         gElliotWave_Pad.BTN_ElliottWAVE.GAC.State(IsKey);
                              gElliotWave_Pad.BTN_ElliottWAVE.GAC.Color(BtnColors_FlowPanelB.DescColorPress);
                              gElliotWave_Pad.BTN_ElliottWAVE.GAC.BackColor(BtnColors_FlowPanelB.BackColorPress);
                              gElliotWave_Pad.BTN_ElliottWAVE.GAC.BorderColor(BtnColors_FlowPanelB.BorderColorPress);//
                    }//
          }
          Is_ElliottWave_Shown =  IsKey;//--WhichMode == MODE_CREATE &&
          //*************************************************************************************************
          //efine x y
          {         if(WhichMode == MODE_CREATE) {Position2D.x = gFlow_Pad.LBL_C2.GAC.X_Distance() - 480;   Position2D.y = gFlow_Pad.LBL_C2.GAC.Y_Distance() - 82; }
                    if(WhichMode == MODE_MOVE)   {Position2D.x = gFlow_Pad.LBL_C2.GAC.X_Distance() - 480;   Position2D.y = gFlow_Pad.LBL_C2.GAC.Y_Distance() - 82; }
                    //*************************************************************************************************
                    Soild_X = FixPadFlowX + (int)Position2D.x; //Alert("FixPadFlowX? ", FixPadFlowX, "    Position2D.x? ", Position2D.x);
                    Soild_Y = FixPadFlowY + (int)Position2D.y; //Alert("FixPadFlowY? ", FixPadFlowY, "    Position2D.y? ", Position2D.y);//
          }
          //-------------------------------------------------------------------------------------------------------------------------------------------
          ///[onPad] line 213 ///
          ////---Generic gFlow_Pad.BTN_ElliottWAVEFillResetCount---//
          {         gElliotWave_Pad.BTN_ElliottWAVEFillResetCount.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                    gElliotWave_Pad.BTN_ElliottWAVEFillResetCount.GDS.Set_Desc_4("gElliotWave_Pad.BTN_ElliottWAVEFillResetCount", "", "Wingdings", 15);
                    gElliotWave_Pad.BTN_ElliottWAVEFillResetCount.GDS.Set_Self_1(ButtonDEF_state);
                    gElliotWave_Pad.BTN_ElliottWAVEFillResetCount.GDS.Set_Location_5((int)(354.9) + Soild_X, (int)(171) + Soild_Y, BUTTONX_WIDTH / 4 + 6, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                    gElliotWave_Pad.BTN_ElliottWAVEFillResetCount.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                    gElliotWave_Pad.BTN_ElliottWAVEFillResetCount.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gElliotWave_Pad.BTN_ElliottWAVEFillResetCount");
                    gElliotWave_Pad.BTN_ElliottWAVEFillResetCount.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
                    gElliotWave_Pad.BTN_ElliottWAVEFillResetCount.Action(gElliotWave_Pad.BTN_ElliottWAVEFillResetCount);//
                    //0// gElliotWave_Pad.BTN_ElliottWAVEFillResetCount.Create(Is_Create, Is_Move, __FUNCSIG__, "gElliotWave_Pad.BTN_ElliottWAVEFillResetCount", "",
                    //0// (int)(354.9) + FixPadFlowX + FlowPanel.independ2D.x + (int)MoveX2, (int)MoveY2 + (int)(171) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 4 + 6, BUTTONX_HEIGHT,
                    //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 15, "Wingdings");
                    //---off---Alert("Cgp_ElliotWavePAD::PadFlow_SubElliottWAVE_PAD,---1: ", (int)(354.9) + FixPadFlowX + FlowPanel.independ2D.x + (int)MoveX2, "  ----  ", (int)MoveY2 + (int)(171) + FixPadFlowY + FlowPanel.independ2D.y); //
          }
          ////--- Generic gFlow_Pad.LBL_ElliottWAVECount ---//
          {         gElliotWave_Pad.LBL_ElliottWAVECount.GDS.Set_Action_2(WhichMode, IsKey);
                    gElliotWave_Pad.LBL_ElliottWAVECount.GDS.Set_Desc_4("gElliotWave_Pad.LBL_ElliottWAVECount", (string)CounterValueBoxCount, "Arial", 7);
                    gElliotWave_Pad.LBL_ElliottWAVECount.GDS.Set_Color_1(clrDarkCyan);
                    gElliotWave_Pad.LBL_ElliottWAVECount.GDS.Set_Location_5((int)(361.4) + Soild_X, (int)(178.2) + Soild_Y, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                    gElliotWave_Pad.LBL_ElliottWAVECount.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "gElliotWave_Pad.LBL_ElliottWAVECount");
                    gElliotWave_Pad.LBL_ElliottWAVECount.GDS.Set_Chart_6();
                    gElliotWave_Pad.LBL_ElliottWAVECount.Action(gElliotWave_Pad.LBL_ElliottWAVECount);//
                    //0// gElliotWave_Pad.LBL_ElliottWAVECount.Create(Is_Create, Is_Move, "gElliotWave_Pad.LBL_ElliottWAVECount", (string)CounterValueBoxCount,
                    //0// (int)(361.4) + FixPadFlowX + FlowPanel.independ2D.x + (int)MoveX2, (int)MoveY2 + (int)(178.2) + FixPadFlowY + FlowPanel.independ2D.y,
                    //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false,  clrDarkCyan, 0, 7, "Arial");
          }
          ////---Generic gFlow_Pad.BTN_ElliottWAVEUp---//
          {         gElliotWave_Pad.BTN_ElliottWAVEUp.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                    gElliotWave_Pad.BTN_ElliottWAVEUp.GDS.Set_Desc_4("gElliotWave_Pad.BTN_ElliottWAVEUp", "5", "Webdings", 10);
                    gElliotWave_Pad.BTN_ElliottWAVEUp.GDS.Set_Self_1(ButtonDEF_state);
                    gElliotWave_Pad.BTN_ElliottWAVEUp.GDS.Set_Location_5((int)(338) + Soild_X, (171) + Soild_Y, BUTTONX_WIDTH / 4 + 5, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                    gElliotWave_Pad.BTN_ElliottWAVEUp.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                    gElliotWave_Pad.BTN_ElliottWAVEUp.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gElliotWave_Pad.BTN_ElliottWAVEUp");
                    gElliotWave_Pad.BTN_ElliottWAVEUp.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
                    gElliotWave_Pad.BTN_ElliottWAVEUp.Action(gElliotWave_Pad.BTN_ElliottWAVEUp);//
                    //0// gElliotWave_Pad.BTN_ElliottWAVEUp.Create(Is_Create, Is_Move, __FUNCSIG__, "gElliotWave_Pad.BTN_ElliottWAVEUp", "5",
                    //0// (int)(338) + FixPadFlowX + FlowPanel.independ2D.x + (int)MoveX2, (int)MoveY2 + (int)(171) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 4 + 5, BUTTONX_HEIGHT,
                    //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 10, "Webdings");
          }
          ////---Generic gFlow_Pad.BTN_ElliottWAVEDown---//
          {         gElliotWave_Pad.BTN_ElliottWAVEDown.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                    gElliotWave_Pad.BTN_ElliottWAVEDown.GDS.Set_Desc_4("gElliotWave_Pad.BTN_ElliottWAVEDown", "6", "Webdings", 10);
                    gElliotWave_Pad.BTN_ElliottWAVEDown.GDS.Set_Self_1(ButtonDEF_state);
                    gElliotWave_Pad.BTN_ElliottWAVEDown.GDS.Set_Location_5((int)(371.8) + Soild_X,  (int)(171) + Soild_Y, BUTTONX_WIDTH / 4 + 4, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                    gElliotWave_Pad.BTN_ElliottWAVEDown.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                    gElliotWave_Pad.BTN_ElliottWAVEDown.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gElliotWave_Pad.BTN_ElliottWAVEDown");
                    gElliotWave_Pad.BTN_ElliottWAVEDown.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
                    gElliotWave_Pad.BTN_ElliottWAVEDown.Action(gElliotWave_Pad.BTN_ElliottWAVEDown);//
                    //0// gElliotWave_Pad.BTN_ElliottWAVEDown.Create(Is_Create, Is_Move, __FUNCSIG__,   "gElliotWave_Pad.BTN_ElliottWAVEDown", "6",
                    //0// (int)(371.8) + FixPadFlowX + FlowPanel.independ2D.x + (int)MoveX2, (int)MoveY2 + (int)(171) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 4 + 4, BUTTONX_HEIGHT,
                    //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan, 0, 10, "Webdings");
          }
          ////---Generic gFlow_Pad.BTN_ElliottWAVEDown---//
          //if(false)
          {         gElliotWave_Pad.BTN_ElliottWAVEKeyClear.GDS.Set_Action_2(WhichMode, IsKey /*int WhichMode = MODE_CREATE, bool IsKey = false*/);
                    gElliotWave_Pad.BTN_ElliottWAVEKeyClear.GDS.Set_Desc_4("gElliotWave_Pad.BTN_ElliottWAVEKeyClear", "Clear", "Arial", 7);
                    gElliotWave_Pad.BTN_ElliottWAVEKeyClear.GDS.Set_Self_1(ButtonDEF_state);
                    gElliotWave_Pad.BTN_ElliottWAVEKeyClear.GDS.Set_Location_5((int)(338) + Soild_X,  (int)(156.8) + Soild_Y, BUTTONX_WIDTH / 3 + 33, BUTTONX_HEIGHT, CORNER_LEFT_UPPER);
                    gElliotWave_Pad.BTN_ElliottWAVEKeyClear.GDS.Set_Color_3(clrLavender, clrLavender, clrDarkCyan);
                    gElliotWave_Pad.BTN_ElliottWAVEKeyClear.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gElliotWave_Pad.BTN_ElliottWAVEKeyClear");
                    gElliotWave_Pad.BTN_ElliottWAVEKeyClear.GDS.Set_Chart_6(/*long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0*/);
                    gElliotWave_Pad.BTN_ElliottWAVEKeyClear.Action(gElliotWave_Pad.BTN_ElliottWAVEKeyClear);//
                    //0// gElliotWave_Pad.BTN_ElliottWAVEKeyClear.Create(Is_Create, Is_Move, __FUNCSIG__, "gElliotWave_Pad.BTN_ElliottWAVEKeyClear", "Clear",
                    //0// (int)(338) + FixPadFlowX + FlowPanel.independ2D.x + (int)MoveX2, (int)MoveY2 + (int)(156.8) + FixPadFlowY + FlowPanel.independ2D.y, BUTTONX_WIDTH / 3 + 33, BUTTONX_HEIGHT,
                    //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, clrLavender, clrDarkCyan);
          }
          ///---Progressing
          ///--
          ///-
}//
//+------------------------------------------------------------------+
//|             Class Cgp_ElliotWavePAD     BEGIN-END            |
//+------------------------------------------------------------------+
//======================================================================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
