//+------------------------------------------------------------------+
//||   ||||||||||                 Cg_ShapesTriangle.mqh             || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Shapes\Sg_TRIANGLE.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsShapes.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_ShapesTriangle: public __COBFA__<S_TRIANGLE> 
{
//====================================================================
private:
//====================================================================
public:
          void                          C_ShapesTriangle() {};
          void                          ~C_ShapesTriangle() {};
//====================================================================
          S_TRIANGLE                    GDS;
          CChartObjectTriangle          GAC;
         
          void                          SetupSignal() {}
//====================================================================
          int                           UseCount ;
          int                           UseStart ;
//====================================================================
          bool                          Create(int                    mode            = MODE_CREATE,
                                               bool                   IsKey          = false,
                                               string                 Name            = "GAC",
                                               int                    XCordinate      = 10,
                                               int                    YCordinate      = 10,
                                               int                    XSize           = 10,
                                               int                    YSize           = 10,
                                               ENUM_BASE_CORNER       Corner          = CORNER_RIGHT_LOWER,
                                               bool                   Background      = false,
                                               bool                   Fill            = false,
                                               long                   Style           = 1,
                                               int                    Width           = 1,
                                               color                  DescColorIN     = clrYellow,
                                               string                 UseTextNameHigh = "High",
                                               string                 UseTextNameLow  = "Low",
                                               bool                   result          = false); // Text
//====================================================================



          void Draw_GDS(int WhichMode, bool IsKey, string n, bool Is_Delete, datetime t1, double p1, datetime t2, double p2, datetime t3, double p3, color c, bool f);
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ShapesTriangle::Draw_GDS(int WhichMode, bool IsKey, string n, bool Is_Delete, datetime t1, double p1, datetime t2, double p2, datetime t3, double p3, color c, bool f)
{         //
          GDS.Set_Action_2(WhichMode, IsKey);
          GDS.Set_Desc_1("Shape.Triangle" + n);
          GDS.Set_Cordinate_6( t1, p1, t2, p2, t3, p3);
          GDS.Set_Style_Width_Fill_Color(STYLE_SOLID, 2, f, c);
          GDS.Set_Common_6(true, 50, false, false, true, "Shape.Triangle" + n);
          GDS.Set_Chart_6();
          Action(this);//
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ShapesTriangle::Create(int                    mode            = MODE_CREATE,
                              bool                   IsKey          = false,
                              string                 Name            = "GAC",
                              int                    XCordinate      = 10,
                              int                    YCordinate      = 10,
                              int                    XSize           = 10,
                              int                    YSize           = 10,
                              ENUM_BASE_CORNER       Corner          = CORNER_RIGHT_LOWER,
                              bool                   Background      = false,
                              bool                   Fill            = false,
                              long                   Style           = 1,
                              int                    Width           = 1,
                              color                  DescColorIN     = clrYellow,
                              string                 UseTextNameHigh = "High",
                              string                 UseTextNameLow  = "Low",
                              bool                   result          = false) // Text
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          int HighestBar = iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,   MODE_HIGH,  UseCount = 200,  UseStart);//C_TOOLS.UseStart
          int HighestBar20 = iHighest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,   MODE_HIGH,  UseCount = 20,  UseStart);
          int LowestBar = iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_LOW,  UseCount = 200,  UseStart);
          int LowestBar20 = iLowest(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT,  MODE_LOW,  UseCount = 20,  UseStart);
//HighestBar = 0;
          int MeanBar = (HighestBar + LowestBar) / 2;
          if(false)
          {         if(HighestBar)MeanBar = (HighestBar + LowestBar) / 2;
                    else MeanBar = (HighestBar + LowestBar) / 2; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          datetime TimeCordinateOne = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, HighestBar); // Time[50];
          datetime TimeCordinateTwo = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar); // Time[50];
          datetime TimeCordinateThirdHigh = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar20); // Time[50];
          datetime TimeCordinateThirdLow = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar20); // Time[50];
          datetime TimeCordinateThird = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, LowestBar20); // Time[50];;
          TimeCordinateThird = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, 0); // Time[50];;
///Close[150] / 1.1)
// Alert(PriceCordinateTwo,"-Line:",__LINE__);
          double PriceCordinateOne = High[HighestBar];
          double PriceCordinateTwo = Low[LowestBar];
          double PriceCordinateThirdHigh = High[LowestBar20];
          double PriceCordinateThirdHighThirdLow = Low[LowestBar20];
          double PriceCordinateThird = Close[LowestBar20];
          PriceCordinateThird = Close[0];
//
          datetime TimeCordinateMean = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, MeanBar + HighestBar + LowestBar); // Time[50];
          double PriceCordinateMean = Close[(HighestBar + LowestBar) / 2];
////,TimeCordinateThird,PriceCordinateThird
          if (TimeCordinateOne > TimeCordinateTwo)//HighBackerthanLower
          {         // TimeCordinateOne = iTime(StSymbol.Current, ChartData_ChartInfo.Timeframe = PERIOD_CURRENT, 10 ); // MathAbs(HighestBar - LowestBar)
                    //
          }
          if (PriceCordinateOne < PriceCordinateTwo)//  down triangel
          {}
          else {}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, Name) < 0)
          {         if(!GAC.Create(ChartData_ChartInfo.ID, Name, ChartData_ChartInfo.SubWindow, TimeCordinateOne, PriceCordinateOne, TimeCordinateTwo, PriceCordinateTwo, TimeCordinateThird, PriceCordinateThird))  //when set time valu for price keep 20 minite
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
                    //=========================================================|
          }
          if(ObjectFind(ChartData_ChartInfo.ID, Name ) >= 0 )
          {         GAC.Description(Name);// = "High"
                    GAC.Color(DescColorIN);
                    GAC.Fill(Fill);
                    GAC.Width(Width);
                    GAC.SetInteger(OBJPROP_STYLE, Style);   // GAC.Style(2)
                    GAC.Selectable(true);
                    GAC.Background(Background);
                    //GAC.SetPoint(50, XTimeCordinate, YPriceCordinate);
                    //
                    result = true; //
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return result; //
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
