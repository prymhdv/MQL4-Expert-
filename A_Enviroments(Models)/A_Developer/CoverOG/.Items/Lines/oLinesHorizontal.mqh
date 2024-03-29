//+------------------------------------------------------------------+
//||   ||||||||||                 C_LinesHorizontal.mqh             || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Lines\Sg_LinesHorizontal.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsLines.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
//{
        //HorizontalX.sHorizontal.Set_Action_2(WhichMode, IsKey);
        //HorizontalX.sHorizontal.Set_Desc_1(  "S_HLINE" +" " );
        //HorizontalX.sHorizontal.Set_Location_1(Price);
        //HorizontalX.sHorizontal.Set_Color_1(clrRed);
        //HorizontalX.sHorizontal.Set_Tip_2(STYLE_4,WIDTH_5);
        //HorizontalX.sHorizontal.Set_Common_6(false, 10, false, false, false, "tooltip");
        //HorizontalX.sHorizontal.Set_Chart_6();
        //HorizontalX.Action(HorizontalX);//
//}
*/
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_LinesHorizontal: public __COBFA__<S_HLINE> 
{
//====================================================================
private:


//====================================================================
public:
          void                 C_LinesHorizontal();
          void                 ~C_LinesHorizontal() {};
//====================================================================
          CChartObjectHLine_MQL4    GAC;
          S_HLINE              GDS;
       
          bool                 CreateCall(long ChartID_, string Name_, int SubWindow_) {return GAC.Create(ChartID_, Name_, SubWindow_, 0);}  //-- GAC_CreateCall
         // void                 SetupSignal() {}
//====================================================================
          int                  Count ;
          int                  Start ;
          bool                 GradientPositive;//        = TimeCordinateOne > TimeCordinateTwo;
          bool                 GradientNegative;//        = TimeCordinateOne < TimeCordinateTwo;
          double               PriceCordinateOne;// = PriceCordinateOne;
          datetime             TimeCordinateOne;//  = TimeCordinateOne;
          double               PriceCordinateTwo;// = PriceCordinateTwo;
          datetime             TimeCordinateTwo;//  = TimeCordinateTwo;
          double               PriceCordinateThere;// = PriceCordinateTwo;
          datetime             TimeCordinateThere;//  = TimeCordinateTwo;
//====================================================================
          bool Create(int, string, int, int, int);//---fake
          bool Create(bool Is_Create, bool Is_Move, string LineHorizontal_Name = "LineH", const string Description = "LineHDescription", const double YCordinate = 0,
                      ENUM_LINE_STYLE Style = 1, int Width = 1, color  DescColorIN = clrYellow, const bool Background = false );// HLine
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          void HorizonlineX( string UseNameX = "none", string UsenameX1 = "HlineX", string UsenameX2 = "PriceHIGH_Value", string UsenameX3 = "PriceLOW_Value", string UsenameX4 = "PriceMid_Value");
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          bool Delete() {return (GAC.Delete());}
          //---[----Draw Trend Lines//ExtemumPlace by indexed---]
          void Draw_GDS(int WhichMode  , bool IsKey  ,string n, double p, bool Is_Delete)
          {         GDS.Set_Action_2(WhichMode, IsKey);
                    GDS.Set_Desc_1("Lines.Horizontal" + n);
                    GDS.Set_Color_1(clrYellow);
                    GDS.Set_Location_1(p);
                    GDS.Set_Tip_2(STYLE_DOT, 1);
                    GDS.Set_Common_6(false, 10, false, false, false, "tooltip-Lines.Horizontal" + n);
                    GDS.Set_Chart_6();
                    GDS.Set_ToDelete_1(Is_Delete);
                    GDS.Set_Signal_1(false);
                    Action(this); //
          }//
//====================================================================
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_LinesHorizontal::C_LinesHorizontal()
{}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_LinesHorizontal::Create(bool Is_Create, bool Is_Move, string LineHorizontal_Name = "LineH", const string Description = "LineHDescription", const double YCordinate = 0,
                               ENUM_LINE_STYLE Style = 1, int Width = 1, color  DescColorIN = clrYellow, const bool Background = false )// HLine
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesHorizontal Error",  __LINE__, __FUNCTION__); //|
          if(ObjectFind(ChartData_ChartInfo.ID, LineHorizontal_Name) >= 0 && Is_Move )
          {         ObjectSetInteger(0, LineHorizontal_Name, OBJPROP_YDISTANCE, (int)YCordinate);////Label_.Y_Distance(YCordinate); //
                    return true;//
          }
          if(ObjectFind(ChartData_ChartInfo.ID, LineHorizontal_Name) >= 0 && !Is_Create) {return ObjectDelete(ChartData_ChartInfo.ID, LineHorizontal_Name);}
          if(Is_Create)
          {         if(ObjectFind(ChartData_ChartInfo.ID, LineHorizontal_Name) < 0)
                              if(! GAC.Create(ChartData_ChartInfo.ID, LineHorizontal_Name, ChartData_ChartInfo.SubWindow, YCordinate))________________________________________________________Xerorr.SuperviserX(_LastError, "C_LinesHorizontal Error",  __LINE__, __FUNCTION__); //|
                    if(ObjectFind(ChartData_ChartInfo.ID, LineHorizontal_Name) >= 0)
                    {         GAC.Color(DescColorIN);
                              GAC.Width(Width);
                              GAC.SetInteger(OBJPROP_STYLE, Style);
                              GAC.Style(Style);
                              GAC.Background(Background); //
                    }//
                    return true;//
          }
          if(false)
          {         if(ObjectFind(ChartData_ChartInfo.ID, LineHorizontal_Name = "LineH100") < 0)
                              GAC.Create(ChartData_ChartInfo.ID, LineHorizontal_Name = "LineH100", ChartData_ChartInfo.SubWindow,  Close[100]);
                    if(ObjectFind(ChartData_ChartInfo.ID, LineHorizontal_Name = "LineH150") < 0)
                              GAC.Create(ChartData_ChartInfo.ID, LineHorizontal_Name = "LineH150", ChartData_ChartInfo.SubWindow,  Close[150]);
                    if(ObjectFind(ChartData_ChartInfo.ID, LineHorizontal_Name = "LineH200") < 0)
                              GAC.Create(ChartData_ChartInfo.ID, LineHorizontal_Name = "LineH200", ChartData_ChartInfo.SubWindow,  Close[200]); //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesHorizontal Error",  __LINE__, __FUNCTION__); //|
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_LinesHorizontal::HorizonlineX( string UseNameX = "none", string UsenameX1 = "HlineX", string UsenameX2 = "PriceHIGH_Value",
                                      string UsenameX3 = "PriceLOW_Value", string UsenameX4 = "PriceMid_Value")
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesHorizontal Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          ChartData_ChartInfo.SubWindow          = 0;
          double      PriceLOW_Value   = ChartGetDouble(0, CHART_FIXED_MIN, 0);
          double      PriceHIGH_Value  = ChartGetDouble(0, CHART_FIXED_MAX, 0);
//Alert(PriceHIGH_Value,",PriceHIGH_Value,,","-Line:",__LINE__);Sleep(5000);
          double      PriceMid_Value   = (PriceHIGH_Value + PriceLOW_Value) / 4;
          double      argwhat            = 1900;
          ENUM_OBJECT type             = OBJ_HLINE;
          datetime argtime = Time[0];
////////////////////////////////////////////
          if(ct_Series_Base.IsRefreshRate)argtime = iTime(Symbol(), PERIOD_M1, 0);///D'2021.01.19 00:00'
          if(ObjectFind(ChartData_ChartInfo.ID, UsenameX1 + "Close[20]") < 0)
                    if(!ObjectCreate(ChartData_ChartInfo.ID, UsenameX1 + "Close[20]", OBJ_HLINE, ChartData_ChartInfo.SubWindow, argtime, Close[20] ))Alert("Not Object Create" + (string)__LINE__);
          if(ObjectFind(ChartData_ChartInfo.ID, UsenameX1 + "Close[20]") >= 0)
          {         bool        Hline1Set        = ObjectSet(UsenameX1 + "Close[20]", OBJPROP_WIDTH, 2) ;
                    bool        Hline1Set2       = ObjectSet(UsenameX1 + "Close[20]", OBJPROP_COLOR, clrGreen) ;
                    bool        Hline1Set2SetText = ObjectSetText(UsenameX1 + "Close[20]", "Hline1++", 12,  "Tahoma", clrYellow); //
          }
////////////////////////////////////////////
          if(ObjectFind(ChartData_ChartInfo.ID, UsenameX2) < 0)
                    if(!ObjectCreate(ChartData_ChartInfo.ID, UsenameX2, OBJ_HLINE, ChartData_ChartInfo.SubWindow, argtime, PriceHIGH_Value  ))Alert("Not Object Create" + (string)__LINE__);
          if(ObjectFind(ChartData_ChartInfo.ID, UsenameX2) >= 0)
          {         bool        Hline2Set        = ObjectSet( UsenameX2, OBJPROP_WIDTH, 2);
                    bool        Hline2Set2       = ObjectSet(UsenameX2, OBJPROP_COLOR, clrBlue) ;
                    bool        Hline1Set2SetText = ObjectSetText(UsenameX2,  "Hline2++", 12,  "Tahoma", clrYellow);//
          }
////////////////////////////////////////////
          if(ObjectFind(ChartData_ChartInfo.ID, UsenameX3) < 0)
                    if(!ObjectCreate(ChartData_ChartInfo.ID, UsenameX3, OBJ_HLINE, ChartData_ChartInfo.SubWindow, argtime, PriceLOW_Value ))Alert("Not Object Create" + (string)__LINE__);
          if(ObjectFind(ChartData_ChartInfo.ID, UsenameX3) >= 0)
          {         bool        Hline3Set        = ObjectSet( UsenameX3, OBJPROP_WIDTH, 2);
                    bool        Hline3Set2       = ObjectSet(UsenameX3, OBJPROP_COLOR, clrBlue) ; if(true)
                              bool        Hline1Set2SetText = ObjectSetText(UsenameX3, "Hline3++", 12, "Tahoma", clrYellow);//
          }
////////////////////////////////////////////
          if(False && ObjectFind(ChartData_ChartInfo.ID, UsenameX4) < 0)
                    if(!ObjectCreate(ChartData_ChartInfo.ID, UsenameX4, OBJ_HLINE, ChartData_ChartInfo.SubWindow, argtime, PriceMid_Value ))Alert("Not Object Create" + (string)__LINE__);
          if(ObjectFind(ChartData_ChartInfo.ID, UsenameX4) >= 0)
          {         bool        Hline4Set        = ObjectSet(UsenameX4, OBJPROP_WIDTH, 2);
                    bool        Hline4Set2       = ObjectSet(UsenameX4, OBJPROP_COLOR, clrYellow) ;
                    bool        Hline1Set2SetText = ObjectSetText(UsenameX4, "Hline4++", 12,  "Tahoma", clrYellow);//
          }
//Print("````HlineX````Create```");//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_LinesHorizontal Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}
//+------------------------------------------------------------------+
//||   ||||||||||                 C_LinesHorizontal.mqh             || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
