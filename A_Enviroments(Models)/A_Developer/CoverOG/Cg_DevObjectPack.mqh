//+------------------------------------------------------------------+
//|                        C_GraphicalObjectFrame.mqh                |
//+------------------------------------------------------------------+
//||   ||||||||||               Cg_DevObjectPack.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Graphical_Item_Solid.mqh>
//====================================================================================================== //---Typed sub objects Global use cover
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cgs_DevObjectPack
{
private:

public:
          void                          Cgs_DevObjectPack() {};
          void                          ~Cgs_DevObjectPack() {if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Objects Error",  __LINE__, __FUNCTION__); }
          //---
          bool                          Update() {return true;};
          bool                          UPDATED;

          C_Shapes                      Shapes;
          C_Lines                       Lines;
          C_Channels                    Channels;
          C_Ganns                       Ganns;
          C_Fibos                       Fibos;
          C_ElliotsWaves                ElliotsWaves;
          Cg_Texts                      Texts;
          C_Bitmaps                     Bitmaps;
          C_Arrows                      Arrows;
          C_Events                      Events;//

};
Cgs_DevObjectPack     Object_Pack_1;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_ZigZag_X_Bar
{
private:
          int           Bar_count_Start;
          int           Bar_count;
          int           Zigzag_count;
          string        Name, NameCom;
public:
          void                  C_ZigZag_X_Bar(void) { ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); };
          void                  C_ZigZag_X_Bar(string N_Com, int B_C_S, int B_C, int Z_C )
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    WhichMode           = MODE_CREATE;
                    Is_Key              = false;
                    NameCom             = N_Com;
                    Bar_count_Start     = B_C_S;  //---560
                    Bar_count           = B_C;    //--1000
                    Zigzag_count        = Z_C;
                    initer();           //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          };
          void                  ~C_ZigZag_X_Bar(void) {};


          void                  Draw_ZigZag(int whichMode, bool is_key) {WhichMode = whichMode;  Is_Key = is_key;  initer();};
          void                  initer();
          //--Cgs_DevObjectPack     Object_Pack;
          int                   WhichMode;
          bool                  Is_Key;
          //********************************
          int           IDX_Highest_X_Bar;//        = iHighest(NULL, PERIOD_CURRENT, MODE_HIGH, 1000, 0);
          int           IDX_Lowest_X_Bar;//         = iLowest(NULL, PERIOD_CURRENT, MODE_LOW, 1000, 0);
          double        High_Highest_X_Bar;//       = iHigh(NULL, PERIOD_CURRENT, IDX_Highest_X_Bar);
          double        Low_Lowest_X_Bar;//         = iLow(NULL, PERIOD_CURRENT, IDX_Lowest_X_Bar);
          datetime      Time_Lowest_X_Bar;//        = iTime(NULL, PERIOD_CURRENT, IDX_Lowest_X_Bar);
          datetime      Time_Highest_X_Bar;//       = iTime(NULL, PERIOD_CURRENT, IDX_Highest_X_Bar);
          int           IDX_Price_Minimum;//       = ArrayMinimum(_CZZ_12_5_3_Current._CZZ_Point_2._Price, _CZZ_12_5_3_Current.ZigzagIndex, 0); // Alert("IDX_Price_Minimum: ", IDX_Price_Minimum, "  _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum]: ", _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum], "  _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum]: ", _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum]);
          int           IDX_Price_Maxmum ;//       = ArrayMaximum(_CZZ_12_5_3_Current._CZZ_Point_2._Price, _CZZ_12_5_3_Current.ZigzagIndex, 0); // Alert("IDX_Price_Maxmum: ", IDX_Price_Maxmum,   "  _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum]: ",  _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum], "   _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum]: ",  _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum]);
          bool          Is_Bulish;//               = _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum] < _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum];
          color         Color;//                   = Is_Bulish ? clrGreen : clrRed;
          //----
          Sg_Point_      Point_frist, Point_secound, Point_Correction;
          double        Range_All, Range_Correction, Range_Correction_Ask, Correction_Percent, Correction_Percent_Ask;
          //-----
          //
          double        Price_Mid;//        = _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum] + MathAbs (_CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum] - _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum]) / 2 ;
          datetime      Time_Mid_1;//       = Is_Bulish ? _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum] : _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum];
          datetime      Time_Mid;//         = Time_Mid_1 + MathAbs (_CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum] - _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum]) / 2 ;
          //
          int           Shift_Minimum;//    = iBarShift(NULL, PERIOD_CURRENT, _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum]) ;
          int           Shift_Maximum;//    = iBarShift(NULL, PERIOD_CURRENT, _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum]) ;
          int           Shift_Mid;//        = MathAbs (Shift_Minimum - Shift_Maximum) / 2 ;
          int           Shift_Mid_1;//      = Is_Bulish ? Shift_Maximum : Shift_Minimum;
          int           Shift_Mid_Current; // = Shift_Mid_1 + Shift_Mid;
          //
          datetime      Time_1  ;//= 0; //= Is_Bulish ?  Time_Lowest_X_Bar : Time_Highest_X_Bar;
          double        Price_1 ;//= 0; //= Is_Bulish ? Low_Lowest_X_Bar  : High_Highest_X_Bar;
          //
          int           IDX_Highest_Mid__B_C_S;//      = iHighest(NULL, PERIOD_CURRENT, MODE_HIGH, Shift_Mid_Current, 0);
          int           IDX_Lowest_Mid__B_C_S;//       = iLowest(NULL, PERIOD_CURRENT, MODE_LOW, Shift_Mid_Current, 0);
          double        High_Highest_Mid__B_C_S;//     = iHigh(NULL, PERIOD_CURRENT, IDX_Highest_Mid__B_C_S);
          double        Low_Lowest_Mid__B_C_S;//       = iLow(NULL, PERIOD_CURRENT, IDX_Lowest_Mid__B_C_S);
          datetime      Time_Lowest_Mid__B_C_S;//      = iTime(NULL, PERIOD_CURRENT, IDX_Lowest_Mid__B_C_S);
          datetime      Time_Highest_Mid__B_C_S;//     = iTime(NULL, PERIOD_CURRENT, IDX_Highest_Mid__B_C_S);
          ///---
          datetime      Time_2;//  = 0;
          double        Price_2;// = 0;//
          int           PointCount; //=100
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ZigZag_X_Bar::initer()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          if(!Initer.IsBasic_Done) {return;}
          PointCount = 100;
          Name       = "Zigzag-X_Bar" + NameCom;
          // ------------------ Define Zigzag ----------------------
          St_CDI_CZZ _CZZ_12_5_3_Current;
          //--if(Is_Key)
          {         //--- St_CDI_CZZ _CZZ_12_5_3_Current(12, 5, 3, PERIOD_CURRENT, NULL, 0, Bar_count + Bar_count_Start, 10, 1 );// //its class
                    {         St_CDI_CZZ _CZZ_(false,"_CZZ_X_Bar" + EnumToString(PERIOD_CURRENT),12, 5, 3, PERIOD_CURRENT, NULL, 0, Bar_count + Bar_count_Start, 10, 1 );
                              _CZZ_12_5_3_Current = _CZZ_; } //Zigzag_count = 0, Bar_count + Bar_count_Start //--Bar_count_Start
          }
          // ------------------ Define Zigzag Points ----------------------
          //_CZZ_12_5_3_Current.ZigZags[];
          IDX_Highest_X_Bar            = iHighest(     NULL, PERIOD_CURRENT, MODE_HIGH, Bar_count, Bar_count_Start);
          IDX_Lowest_X_Bar             = iLowest(      NULL, PERIOD_CURRENT, MODE_LOW, Bar_count, Bar_count_Start);
          High_Highest_X_Bar           = iHigh(        NULL, PERIOD_CURRENT, IDX_Highest_X_Bar);
          Low_Lowest_X_Bar             = iLow(         NULL, PERIOD_CURRENT, IDX_Lowest_X_Bar);
          Time_Lowest_X_Bar            = iTime(        NULL, PERIOD_CURRENT, IDX_Lowest_X_Bar);
          Time_Highest_X_Bar           = iTime(        NULL, PERIOD_CURRENT, IDX_Highest_X_Bar);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //---Zigzag-25-
          //---if(Is_Key)
          {         IDX_Price_Minimum           = ArrayMinimum(_CZZ_12_5_3_Current._CZZ_Point_2._Price, _CZZ_12_5_3_Current.ZigzagIndex, 0); // Alert("IDX_Price_Minimum: ", IDX_Price_Minimum, "  _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum]: ", _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum], "  _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum]: ", _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum]);
                    IDX_Price_Maxmum            = ArrayMaximum(_CZZ_12_5_3_Current._CZZ_Point_2._Price, _CZZ_12_5_3_Current.ZigzagIndex, 0); // Alert("IDX_Price_Maxmum: ", IDX_Price_Maxmum,   "  _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum]: ",  _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum], "   _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum]: ",  _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum]);
                    //--Alert("--------sz------", ArraySize(_CZZ_12_5_3_Current._CZZ_Point_2._Time));
                    Is_Bulish                   = _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum] < _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum];
                    Color                       = Is_Bulish ? clrGreen : clrRed;
                    if(Is_Bulish)
                    {         Point_frist._Price         = _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum];
                              Point_frist._Time          = _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum];
                              Point_frist._Shift         = _CZZ_12_5_3_Current._CZZ_Point_2._Shift[IDX_Price_Minimum];
                              Point_secound._Price       = _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum];
                              Point_secound._Time        = _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum];
                              Point_secound._Shift       = _CZZ_12_5_3_Current._CZZ_Point_2._Shift[IDX_Price_Maxmum];
                              //---
                              Range_All                 = Point_secound._Price - Point_frist._Price;
                              Range_Correction          = Point_secound._Price - iLow(NULL, PERIOD_CURRENT, iLowest(NULL, PERIOD_CURRENT, MODE_LOW, Point_secound._Shift, 0));
                              if(Range_All != 0)        Correction_Percent = Range_Correction / Range_All;
                              //
                              Range_Correction_Ask      = Point_secound._Price - Ask;
                              if(Range_All != 0)        Correction_Percent_Ask = Range_Correction_Ask / Range_All;
                              //---
                              Point_Correction._Shift    = iLowest(NULL, PERIOD_CURRENT, MODE_LOW, Point_secound._Shift, 0);
                              Point_Correction._Price    = iLow(NULL, PERIOD_CURRENT, Point_Correction._Shift);
                              Point_Correction._Time     = iTime(NULL, PERIOD_CURRENT, Point_Correction._Shift);
                              //----
                    }
                    else
                    {         Point_frist._Price        = _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum];
                              Point_frist._Time                  = _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum];
                              Point_frist._Shift                 = _CZZ_12_5_3_Current._CZZ_Point_2._Shift[IDX_Price_Maxmum];
                              Point_secound._Price      = _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum];
                              Point_secound._Time                = _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum];
                              Point_secound._Shift               = _CZZ_12_5_3_Current._CZZ_Point_2._Shift[IDX_Price_Minimum];
                              Range_All                         = Point_frist._Price - Point_secound._Price;
                              Range_Correction                  =  iHigh(NULL, PERIOD_CURRENT, iHighest(NULL, PERIOD_CURRENT, MODE_HIGH, Point_secound._Shift, 0)) - Point_secound._Price;
                              if(Range_All != 0)        Correction_Percent = Range_Correction / Range_All;
                              //
                              Range_Correction_Ask     = Ask - Point_secound._Price;
                              if(Range_All != 0)        Correction_Percent_Ask = Range_Correction_Ask / Range_All;
                              //---
                              Point_Correction._Shift    = iHighest(NULL, PERIOD_CURRENT, MODE_HIGH, Point_secound._Shift, 0);
                              Point_Correction._Price    = iHigh(NULL, PERIOD_CURRENT, Point_Correction._Shift );
                              Point_Correction._Time     = iTime(NULL, PERIOD_CURRENT, Point_Correction._Shift);
                              //----
                    }
                    //
          }
          {         Object_Pack_1.Lines.Trend.Draw_GDS_Lines(WhichMode, Is_Key, Name, "",                        _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum], _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum], _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum], _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum], Color, 1, false, STYLE_DOT, false);
                    Object_Pack_1.Lines.Trend.Draw_GDS_Lines(WhichMode, Is_Key, Name + "-high-Res", "",           _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum],  _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum],   Time[0] + PeriodSeconds() * 30, _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum], Color, 1, false, STYLE_DOT, false);
                    Object_Pack_1.Lines.Trend.Draw_GDS_Lines(WhichMode, Is_Key, Name + "-low-Sup", "",            _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum], _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum],  Time[0] + PeriodSeconds() * 30, _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum], Color, 1, false, STYLE_DOT, false); //
                    Object_Pack_1.Shapes.Rectangle.Draw_GDS(WhichMode, Is_Key, "R1-" + Name + "-high-Res", "", false, _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum], _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum],  Time[0] + PeriodSeconds() * 30, _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum] + Point * 100, Color, true); //
                    Object_Pack_1.Shapes.Rectangle.Draw_GDS(WhichMode, Is_Key, "R1-" + Name + "-low-Sup", "", false,  _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum], _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum], Time[0] + PeriodSeconds() * 30, _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum] - Point * 100, Color, true); //
                    if(Is_Bulish)
                    {         Object_Pack_1.Shapes.Rectangle.Draw_GDS(WhichMode, Is_Key, "R1-" + Name + "-Range-Vertical", "", false, _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum], _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum], _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum] + PeriodSeconds() * 30, _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum], Color, true); //
                    }//
                    else
                    {         Object_Pack_1.Shapes.Rectangle.Draw_GDS(WhichMode, Is_Key, "R1-" + Name + "-Range-Vertical", "", false, _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum], _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum], _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum] + PeriodSeconds() * 30, _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum], Color, true); //
                    }//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //---Zigzag-25-mid
          {         Price_Mid                   = _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum] + MathAbs (_CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum] - _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum]) / 2 ;
                    Time_Mid_1                  = Is_Bulish ? _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum] : _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum];
                    Time_Mid                    = Time_Mid_1 + MathAbs (_CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum] - _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum]) / 2 ;
                    //
                    Shift_Minimum               = iBarShift(    NULL, PERIOD_CURRENT, _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Minimum]) ;
                    Shift_Maximum               = iBarShift(    NULL, PERIOD_CURRENT, _CZZ_12_5_3_Current._CZZ_Point_2._Time[IDX_Price_Maxmum]) ;
                    Shift_Mid                   = MathAbs (Shift_Minimum - Shift_Maximum) / 2 ;
                    Shift_Mid_1                 = Is_Bulish ? Shift_Maximum : Shift_Minimum;
                    Shift_Mid_Current           = Shift_Mid_1 + Shift_Mid;
                    Time_Mid                    = iTime(        NULL, PERIOD_CURRENT, Shift_Mid_Current);
                    Object_Pack_1.Lines.Trend.Draw_GDS_Lines(WhichMode, Is_Key, Name + "-mid", "", Time_Mid, Price_Mid, Time[0] + PeriodSeconds() * 30, Price_Mid, Color, 1, false, STYLE_DOT, false); //Alert("Point: ",Point);//
                    Object_Pack_1.Shapes.Rectangle.Draw_GDS(WhichMode, Is_Key, "R1-" + Name + "-mid", "", false, Time_Mid, Price_Mid, Time[0] + PeriodSeconds() * 30, Price_Mid + Point * 100, Color, true); //
                    if(Is_Bulish)
                    {         Object_Pack_1.Shapes.Rectangle.Draw_GDS(WhichMode, Is_Key, "R1-" + Name + "-mid-Vertical", "", false, Time_Mid, Price_Mid, Time_Mid + PeriodSeconds() * 30, _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum], Color, true); //
                    }//
                    else
                    {         Object_Pack_1.Shapes.Rectangle.Draw_GDS(WhichMode, Is_Key, "R1-" + Name + "-mid-Vertical", "", false, Time_Mid, Price_Mid, Time_Mid + PeriodSeconds() * 30, _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum], Color, true); //
                    }
                    //
                    {         Object_Pack_1.Texts.Description.Draw_GDS_Text(WhichMode, Is_Key, Name + "Correction_Percent", Name + "Correction_Percent",  Time_Mid + PeriodSeconds() * 100, Price_Mid, clrYellow, "Arial", 10, ANCHOR_RIGHT, 0, false); //
                              ObjectSetString(0,    Name + "Correction_Percent", OBJPROP_TEXT, "->Correction_Percent:" + DoubleToStr(Correction_Percent_Ask, 2) + "% / " + DoubleToStr(Correction_Percent, 2) + "%"); //
                    } //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //---Supporter ressistence
          {         //---calc Periodsecound 20 bar
                    Sg_Wave_                 Line_Temp;
                    Line_Temp.Dev_Math.Slope  = Line_Temp.Dev_Math.calcSlope(Point_frist._Price, Point_Correction._Price, Point_frist._Time, Point_Correction._Time);
                    Line_Temp.Dev_Math.Diff_B = Line_Temp.Dev_Math.GetB_LineFormule(Line_Temp.Dev_Math.Slope, Point_frist._Time, Point_frist._Price);
                    Line_Temp.Dev_Math.Diff_X = Time[0] + PeriodSeconds() * 30;
                    Line_Temp.Dev_Math.Diff_Y = Line_Temp.Dev_Math.GetY_LineFormule(Line_Temp.Dev_Math.Slope, Line_Temp.Dev_Math.Diff_X, Line_Temp.Dev_Math.Diff_B);
                    //----
                    Object_Pack_1.Lines.Trend.Draw_GDS_Lines(WhichMode, Is_Key, Name + "SRT", "", Point_frist._Time, Point_frist._Price, Line_Temp.Dev_Math.Diff_X, Line_Temp.Dev_Math.Diff_Y, Color, 2, false, STYLE_DOT, false);
                    //
          }
          //---Zigzag-25-TrendLine-1               Zigzag-25-TrendLine-30               Zigzag-25-TrendLine-200
          //---draw the trend line from  bigining to half right of low high maximum
          {         Time_1                      = Is_Bulish ?  Time_Lowest_X_Bar : Time_Highest_X_Bar;
                    Price_1                     = Is_Bulish ? Low_Lowest_X_Bar  : High_Highest_X_Bar;
                    //
                    IDX_Highest_Mid__B_C_S           = iHighest(     NULL, PERIOD_CURRENT, MODE_HIGH, Shift_Mid_Current, Bar_count_Start);
                    IDX_Lowest_Mid__B_C_S            = iLowest(      NULL, PERIOD_CURRENT, MODE_LOW, Shift_Mid_Current, Bar_count_Start);
                    High_Highest_Mid__B_C_S          = iHigh(        NULL, PERIOD_CURRENT, IDX_Highest_Mid__B_C_S);
                    Low_Lowest_Mid__B_C_S            = iLow(         NULL, PERIOD_CURRENT, IDX_Lowest_Mid__B_C_S);
                    Time_Lowest_Mid__B_C_S           = iTime(        NULL, PERIOD_CURRENT, IDX_Lowest_Mid__B_C_S);
                    Time_Highest_Mid__B_C_S          = iTime(        NULL, PERIOD_CURRENT, IDX_Highest_Mid__B_C_S);
                    ///---
                    Time_2                      = Is_Bulish ? Time_Lowest_Mid__B_C_S : Time_Highest_Mid__B_C_S;     //--Time[0] + PeriodSeconds() * 30
                    Price_2                     = Is_Bulish ? Low_Lowest_Mid__B_C_S  : High_Highest_Mid__B_C_S;
                    Object_Pack_1.Lines.Trend.Draw_GDS_Lines(WhichMode, Is_Key,   Name + "-TrendLine-1", "", Time_1, Price_1, Time_2, Price_2, Color, 2, false, STYLE_DOT, false); //
                    ///--
                    Sg_Wave_                      Line_Temp;
                    Line_Temp.Dev_Math.Slope              = Line_Temp.Dev_Math.calcSlope(Price_1, Price_2, Time_1, Time_2);
                    Line_Temp.Dev_Math.Diff_B             = Line_Temp.Dev_Math.GetB_LineFormule(Line_Temp.Dev_Math.Slope, Time_1, Price_1);
                    Line_Temp.Dev_Math.Diff_Y             = Line_Temp.Dev_Math.GetY_LineFormule(Line_Temp.Dev_Math.Slope, Time[0] + PeriodSeconds() * 30, Line_Temp.Dev_Math.Diff_B);
                    Object_Pack_1.Lines.Trend.Draw_GDS_Lines(WhichMode, Is_Key, Name + "-TrendLine-30", "",  Time_1, Price_1, Time[0] + PeriodSeconds() * 30,  Line_Temp.Dev_Math.Diff_Y, Color, 1, false, STYLE_DOT, false); //
                    Line_Temp.Dev_Math.Diff_Y             = Line_Temp.Dev_Math.GetY_LineFormule(Line_Temp.Dev_Math.Slope, Time[0] + PeriodSeconds() * 100, Line_Temp.Dev_Math.Diff_B + 100);
                    //Object_Pack_1.Lines.Trend.Draw_GDS_Lines(WhichMode, Is_Key, "Zigzag-X_Bar-TrendLine-100", Time_1, Price_1, Time[0] + PeriodSeconds() * 100, Dev_Math.Diff_Y, Color, 1, false, STYLE_DOT, false); //
                    Line_Temp.Dev_Math.Diff_Y             = Line_Temp.Dev_Math.GetY_LineFormule(Line_Temp.Dev_Math.Slope, Time[0] + PeriodSeconds() * 200, Line_Temp.Dev_Math.Diff_B - 100);
                    //Object_Pack_1.Lines.Trend.Draw_GDS_Lines(WhichMode, Is_Key, "Zigzag-X_Bar-TrendLine-200", Time_1, Price_1, Time[0] + PeriodSeconds() * 200, Dev_Math.Diff_Y, Color, 1, false, STYLE_DOT, false); //
          } ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //---Percent zigzag ... represent in self
          if(false)
          {         Object_Pack_1.Texts.Description.Draw_GDS_Text(WhichMode, Is_Key, Name + "Percent zigzag",  Name + "Percent zigzag", Time[0] + PeriodSeconds() * 30, Ask, clrWhite, "Arial", 10, ANCHOR_CENTER, 0, false); //
                    double range_All = MathAbs(_CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum] - _CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum]);
                    double range_Ask = Is_Bulish ? MathAbs(_CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Maxmum] - Ask) : MathAbs(_CZZ_12_5_3_Current._CZZ_Point_2._Price[IDX_Price_Minimum] - Ask);
                    if (range_All == 0) return;
                    double Percent =  NormalizeDouble(range_Ask / range_All, 3);
                    ObjectSetString(0,   Name + "Percent zigzag", OBJPROP_TEXT, "Corrction1000: " + DoubleToStr(Percent, 2) + "%"); ///
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cgs_DevObjectPack_Extention
{
public:
          Cgs_DevObjectPack_Extention(void)
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    C_ZigZag_X_Bar ZigZag_1000X_Bar("K_Bar", 0, 1000, 0);                     _ZigZag_1000_Bar        = ZigZag_1000X_Bar;  //--250=0 dynamic..
                    int B_C_S = ZigZag_1000X_Bar.Point_frist._Shift ; //--- Alert("B_C_S:", B_C_S);
                    //--C_ZigZag_X_Bar _ZigZag_10000X_Bar("K_K_Bar", 0, 10000, 250);        _ZigZag_10000_Bar   = _ZigZag_10000X_Bar; /// --overall..
                    C_ZigZag_X_Bar _ZigZag_1000X_1000_Bar("K_K_Bar", B_C_S, 1000, 0);         _ZigZag_1000_1000_Bar   = _ZigZag_1000X_1000_Bar; ///
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          };
          ~Cgs_DevObjectPack_Extention(void) {};
          //
          C_ZigZag_X_Bar        _ZigZag_1000_Bar;
          C_ZigZag_X_Bar        _ZigZag_1000_1000_Bar;
          C_ZigZag_X_Bar        _ZigZag_10000_Bar;
          //
};
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------
//int WhichMode = MODE_CREATE, bool IsKey = false
//this.TextLabel.Create();
//this.Create(TextLabel,MODE_CREATE,false);
//this.Create(TextLabel.Set_("Name",10,20,clrRed),MODE(CREATE,false));//
//this.Create(TextLabel.Set_("Name",10,20,clrRed),MODE(MOVE,true,MoveX,MoveY));//
//this.Create(TextLabel.Set_("Name",10,20,clrRed),MODE(SIZE,true,SizeX,SizeY));//
//this.Create(TextLabel.Set_("Name",10,20,clrRed),MODE(MODIFY,true,clrGreen));//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------
//TextLabel.FRAME.Action(MODE(CREATE,true),this.Set_("Name",10,20,clrRed));
//TextLabel.FRAME.Action(MODE_CREATE,true,this.Set_("Name",10,20,clrRed));
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------
//TextDescription.FRAME.Action(MODE_CREATE,true,this.Set_("Name",10,20,clrRed));
//TextDescription.FRAME.Action(MODE_MOVE,true,this.Set_("Name",movex,movey,sizex,sizey,clrRed));
//OBJ.Text.Label.Frame.Action(MODE_MOVE,true,TextLabel.sdata.Set_("Name",movex,movey,sizex,sizey,clrRed));
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------
//+------------------------------------------------------------------+
