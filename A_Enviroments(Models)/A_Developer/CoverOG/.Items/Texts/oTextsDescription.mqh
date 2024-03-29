//+------------------------------------------------------------------+
//||   ||||||||||       St_CondicatorData_Indicators_MA.mqh         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\Sg_TEXTDescription.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsTxtControls.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
//#include <0srcCapitan\QuartsExperts\Objects.mqh>;C_Objects             OBJ;
class Cg_TextsDescription: public __COBFA__<S_TEXTDescription>
{
//===================================================================
private:
          string                m_name;
          int                   m_index;
          int                   ObjTry;
//===================================================================
public:
          void                  Cg_TextsDescription()                     {  };
          void                  Cg_TextsDescription(string name) { m_name = name + (string)++m_index; if(KeyAlert)Alert("Constructor: " + m_name + "_" + (string)++ObjTry + "--------C_TextDescription----------", __FUNCSIG__, __LINE__); };
          void                  ~Cg_TextsDescription()                    { if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextDescription Error",  __LINE__, __FUNCTION__); }
//===================================================================ChartObjectsTxtControls.mqh
          CChartObjectText      GAC;     ///---API  Invoke---///
          S_TEXTDescription     GDS;     ///---Mine Invoke---///
          // __COBFA__           Frame;   ///---Parent as member---///
          void                  SetupSignal() {}
//===================================================================
          void          HighLow(bool KeyHighLow, string TEXTNameHigh = "High", string TEXTNameLow = "Low");
          bool          SetAttribe();
          bool          Create(int                     mode                    = MODE_CREATE,
                               bool                    IsKey                  = false,
                               string                  TEXTName                = "TEXT",
                               string                  Description             = "RegressionDescription",
                               datetime                TimeCordinateOne        = 10,
                               double                  PriceCordinateOne       = 10,
                               ENUM_BASE_CORNER        Corner                  = CORNER_RIGHT_LOWER,
                               ENUM_ANCHOR_POINT       Anchor                  = ANCHOR_CENTER,
                               bool                    Background              = false,
                               ENUM_LINE_STYLE         Style                   = STYLE_SOLID,
                               bool                    Selectable              = false,
                               int                     Width                   = 1,
                               color                   DescColorIN             = clrYellow,
                               double                  Angle                   = 0,
                               int                     FontSize                = 7,
                               string                  Font                    = "Arial"); // Text
//===================================================================
          int                   UseCount;
          int                   UseStart;
//===================================================================
          //---Draw_GDS_Text("Is_Ellot_Standard", GDS.Wave1.A.Time, GDS.Wave1.A.Price, clrYellow, "Arial", "10", TRUE)
          void    Draw_GDS_Text(int WhichMode, bool IsKey, string n, string d, datetime t, double p, color colors, string f, int s, ENUM_ANCHOR_POINT a, double an, bool Is_Delete)
          {         GDS.Set_Action_2(WhichMode, IsKey); //---DescX
                    GDS.Set_Desc_4( n, d, f, s);      //---"TEXTs.Description " + n
                    GDS.Set_Color_1(colors);
                    GDS.Set_Location_4(t, p, an, a); //---ANCHOR_LEFT
                    GDS.Set_Common_6(true, 40, false, false, true, "tooltip-"   + n); //--BACK TRUE MEAN LOWER zBUFFER
                    GDS.Set_Chart_6();
                    GDS.Set_ToDelete_1(Is_Delete);
                    Action(this); //
          }

//===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cg_TextsDescription::Create(int                     mode                    = MODE_CREATE,
                                 bool                    IsKey                  = false,
                                 string                  TEXTName                = "TEXT",
                                 string                  Description             = "RegressionDescription",
                                 datetime                TimeCordinateOne        = 10,
                                 double                  PriceCordinateOne       = 10,
                                 ENUM_BASE_CORNER        Corner                  = CORNER_RIGHT_LOWER,
                                 ENUM_ANCHOR_POINT       Anchor                  = ANCHOR_CENTER,
                                 bool                    Background              = false,
                                 ENUM_LINE_STYLE         Style                   = STYLE_SOLID,
                                 bool                    Selectable              = false,
                                 int                     Width                   = 1,
                                 color                   DescColorIN             = clrYellow,
                                 double                  Angle                   = 0,
                                 int                     FontSize                = 7,
                                 string                  Font                    = "Arial") // Text
{         //
//     return Create(MODE_CREATE, true); //  if(!ObjectCreate(chart_ID, name, OBJ_RECTANGLE_LABEL, sub_window, 0, 0))
          if(mode == MODE_CREATE && !IsKey && ObjectFind(ChartData_ChartInfo.ID, TEXTName) >= 0) {return ObjectDelete(ChartData_ChartInfo.ID, TEXTName);}//
          if(mode == MODE_CREATE && IsKey && ObjectFind(ChartData_ChartInfo.ID, TEXTName ) < 0) { return GAC.Create(ChartData_ChartInfo.ID, TEXTName, ChartData_ChartInfo.SubWindow, TimeCordinateOne, PriceCordinateOne); }
          return(false);//
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
bool Cg_TextsDescription::SetAttribe()
{         if(ObjectFind(ChartData_ChartInfo.ID, GDS.NAME_A_01) >= 0)
          {         //
                    //
                    GAC.Description(GDS.TEXT_B_01);                //ObjectSetString( 0, GDS.NAME_A_01, OBJPROP_TEXT,             Description);
                    GAC.Font(GDS.FONT_B_02);                       //ObjectSetString( 0, GDS.NAME_A_01, OBJPROP_FONT,             Font);
                    GAC.FontSize(GDS.FONTSIZE_B_03);               //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_FONTSIZE,         FontSize);
                    //
                    GAC.Color(GDS.COLOR_C_00);                     //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_COLOR,            DescColorIN);
                    //
                    GAC.Time(GDS.ANCHOR_POINT_9, GDS.TIME_6);                     //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_TIME,             GDS.TIME_6);
                    GAC.Price(GDS.ANCHOR_POINT_9, GDS.PRICE_7);                   //ObjectSetDouble(0, GDS.NAME_A_01, OBJPROP_PRICE,             GDS.PRICE_7);
                    GAC.Angle(GDS.ANGLE_8);                    //ObjectSetDouble(0, GDS.NAME_A_01, OBJPROP_ANGLE              GDS.ANGLE_8);
                    GAC.Anchor(GDS.ANCHOR_POINT_9);            //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_ANCHOR,           GDS.ANCHOR_POINT_9);
                    //
                    GAC.Background(GDS.BACK_G_00);                //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_BACK,             Background);        //CORNER_RIGHT_UPPER
                    GAC.Z_Order(GDS.ZORDER_G_00);                 //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_ZORDER,           11);//UseLabel.GDS(false);
                    GAC.Hidden(GDS.HIDDEN_G_00);                  //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_HIDDEN,           true);
                    GAC.Selected(GDS.SELECTED_G_00);              //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_SELECTED,         false);
                    GAC.Selectable(GDS.SELECTABLE_G_00);          //ObjectSetInteger(0, GDS.NAME_A_01, OBJPROP_SELECTABLE,       false);
                    GAC.Tooltip(GDS.TOOLTIP_G_00);                //ObjectSetString(0,  GDS.NAME_A_01, OBJPROP_TOOLTIP,          sRectLabel.TOOLTIP_G_00);
                    //==================================================================
          } //
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cg_TextsDescription::HighLow(bool KeyHighLow, string TEXTNameHigh = "High", string TEXTNameLow = "Low")
{
//
          string                  Description             = "RegressionDescription";
          datetime                TimeCordinateOne        = 10;
          double                  PriceCordinateOne       = 10;
          ENUM_BASE_CORNER        Corner                  = CORNER_RIGHT_LOWER;
          ENUM_ANCHOR_POINT       Anchor                  = ANCHOR_CENTER;
          bool                    Background              = false;
          ENUM_LINE_STYLE         Style                   = STYLE_SOLID;
          bool                    Selectable              = false;
          int                     Width                   = 1;
          color                   DescColorIN             = clrYellow;
          double                  Angle                   = 0;
          int                     FontSize                = 7;
          string                  Font                    = "Arial";
//
          if(KeyHighLow)
          {         int HighestBar = iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,   MODE_HIGH, UseCount = 200, UseStart);
                    int LowestBar = iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, MODE_LOW, UseCount = 200, UseStart);
                    //HighestBar = 0;
                    datetime TimeCordinateOneX = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, HighestBar); // Time[50];
                    datetime TimeCordinateTwoX = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar); // Time[50];
                    // Alert(PriceCordinateTwo,"-Line:",__LINE__);
                    double PriceCordinateOneX = High[HighestBar];
                    double PriceCordinateTwoX = Low[LowestBar];
                    //==========================================
                    if(ObjectFind(ChartData_ChartInfo.ID, TEXTNameHigh = "High") < 0)
                    {         if(!GAC.Create(ChartData_ChartInfo.ID, TEXTNameHigh = "High", ChartData_ChartInfo.SubWindow, TimeCordinateOneX, PriceCordinateOneX))//when set time valu for price keep 20 minite
                                        ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
                              //=========================================================|
                    }
                    if(ObjectFind(ChartData_ChartInfo.ID, TEXTNameHigh = "High") >= 0 )
                    {         GAC.Color(DescColorIN);
                              GAC.Width(3);
                              GAC.Style(2);
                              GAC.Angle(Angle);
                              GAC.SetInteger(OBJPROP_STYLE, 3);
                              GAC.Description(Description = "High");
                              GAC.Font(Font);
                              GAC.FontSize(FontSize);
                              GAC.Selectable(false);
                              GAC.Background(Background);
                              //TEXT.SetPoint(50, XTimeCordinate, YPriceCordinate);
                              //
                    }
                    //// ================================
                    if(ObjectFind(ChartData_ChartInfo.ID, TEXTNameLow = "Low") < 0)
                              if(!GAC.Create(ChartData_ChartInfo.ID, TEXTNameLow = "Low", ChartData_ChartInfo.SubWindow, TimeCordinateTwoX, PriceCordinateTwoX))
                                        ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
                    if(ObjectFind(ChartData_ChartInfo.ID, TEXTNameLow = "Low") >= 0 )
                    {         GAC.Color(DescColorIN);
                              GAC.Width(3);
                              GAC.Style(2);
                              GAC.Angle(Angle);
                              GAC.SetInteger(OBJPROP_STYLE, 3);
                              GAC.Description(Description = "Low");
                              GAC.Font(Font);
                              GAC.FontSize(FontSize);
                              GAC.Selectable(false);
                              //Alert(TEXTNameHigh,"-Line:",__LINE__);
                              //TEXT.SetPoint(50, XTimeCordinate, YPriceCordinate);
                              //
                    }//
          }//
}
//============================================================================================================
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
