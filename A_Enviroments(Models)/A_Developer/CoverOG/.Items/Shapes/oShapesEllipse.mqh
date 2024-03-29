//+------------------------------------------------------------------+
//||   ||||||||||                 C_ShapesEllipse.mqh               || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Shapes\Sg_ELLIPSE.mqh>
//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsShapes.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_ShapesEllipse: public __COBFA__<S_ELLIPSE> 
{
//====================================================================
private:
//====================================================================
public:
          void                          C_ShapesEllipse() { };
          void                          ~C_ShapesEllipse() {};
//====================================================================
          S_ELLIPSE                     GDS;
          CChartObjectEllipse           GAC;

          void                          SetupSignal() {}
//====================================================================
          int                           UseCount ;
          int                           UseStart ;
//====================================================================
          bool                          CreateByPeriod();
          bool                          Create(int             mode            = MODE_CREATE,
                                               bool            IsKey          = false,
                                               string          Name            = "GAC",
                                               datetime        dtTime1         = 0,
                                               double          dblPrice1       = 0,
                                               datetime        dtTime2         = 0,
                                               double          dblPrice2       = 0,
                                               datetime        dtTime3         = 0,
                                               double          dblPrice3       = 0,
                                               color           Color           = 0,
                                               double          Scale           = 0);
//====================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ShapesEllipse::CreateByPeriod()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          double Height;
          int Width;
          double Scale;
          switch(Period())
          {         //---- codes returned from trade server
                    case PERIOD_M1: Height = 30; Width = Period() * 3; Scale = 0.12; break;
                    case PERIOD_M5: Height = 75; Width = Period() * 3; Scale = 0.08; break;
                    case PERIOD_M15: Height = 100; Width = Period() * 3; Scale = 0.08; break;
                    case PERIOD_M30: Height = 200; Width = Period() * 3; Scale = 0.04; break;
                    case PERIOD_H1: Height = 250; Width = Period() * 3; Scale = 0.04; break;
                    case PERIOD_H4: Height = 350; Width = Period() * 3; Scale = 0.02; break;
                    case PERIOD_D1: Height = 500; Width = Period() * 3; Scale = 0.01; break;
                    case PERIOD_W1: Height = 1000; Width = Period() * 7; Scale = 0.002; break;
                    case PERIOD_MN1: Height = 3000; Width = Period() * 10; Scale = 0.002; break;
                    default:   Height = 250; //
          }
          Create(MODE_CREATE, true, "Ellipse_" + (string)WindowTimeOnDropped(), WindowTimeOnDropped() - Width,
                 WindowPriceOnDropped() - Height * Point, WindowTimeOnDropped() + Width,
                 WindowPriceOnDropped() + Height * Point, clrSilver, Scale);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return(true);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ShapesEllipse::Create(int             mode            = MODE_CREATE,
                             bool            IsKey          = false,
                             string          Name            = "GAC",
                             datetime        dtTime1         = 0,
                             double          dblPrice1       = 0,
                             datetime        dtTime2         = 0,
                             double          dblPrice2       = 0,
                             datetime        dtTime3         = 0,
                             double          dblPrice3       = 0,
                             color           Color           = 0,
                             double          Scale           = 0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, Name) < 0)
                    if(!ObjectCreate(ChartData_ChartInfo.ID, Name, OBJ_ELLIPSE, ChartData_ChartInfo.SubWindow, 0, 0, 0, 0, 0))
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
          GAC.Create(ChartData_ChartInfo.ID, Name, ChartData_ChartInfo.SubWindow, 0, 0, 0, 0, 0, 0);
//=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, Name) >= 0)
          {         //===================================================
                    ObjectSet(Name, OBJPROP_SCALE, Scale);
                    ObjectSet(Name, OBJPROP_COLOR, Color);
                    ObjectSet(Name, OBJPROP_FILL, 1);
                    ObjectSet(Name, OBJPROP_BACK, False); //
                    //===================================================
                    GAC.SetInteger(OBJPROP_TIME1, dtTime1);
                    GAC.SetDouble(OBJPROP_PRICE1, dblPrice1);
                    //===================================================
                    GAC.SetInteger(OBJPROP_TIME2, dtTime2);
                    GAC.SetDouble(OBJPROP_PRICE2, dblPrice2);
                    //===================================================
                    GAC.SetInteger(OBJPROP_TIME3, dtTime3);
                    GAC.SetDouble(OBJPROP_PRICE3, dblPrice3);
                    //===================================================
                    GAC.Color();
                    GAC.Fill();
                    GAC.Hidden();
                    GAC.Width();
                    GAC.Style();
                    //OBJ_ELLIPSE
                    double ellipse_scale = 0;
                    ObjectSet(Name, OBJPROP_SCALE, ellipse_scale);
                    //
                    return true;//
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return false;//
}


//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
