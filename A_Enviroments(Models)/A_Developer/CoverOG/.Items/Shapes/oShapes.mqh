//+------------------------------------------------------------------+
//||   ||||||||||             Graphical_Item_Solid.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Shapes\oShapesRectangle.mqh>;             C_ShapesRectangle               RCTNGL_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Shapes\oShapesTriangle.mqh>;              C_ShapesTriangle                TRNGL_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Shapes\oShapesEllipse.mqh>;               //C_ShapesEllipse               ELPS_;
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsShapes.mqh>



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_Shapes_Demo
{         Cg_GenericChartObj_API_MYs_MQLo_MYi<S_RECTANGLE, CChartObjectRectangle, C_ShapesRectangle>    gRectangle;
          Cg_GenericChartObj_API_MYs_MQLo_MYi<S_TRIANGLE, CChartObjectTriangle, C_ShapesTriangle>       gTriangle;
          Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ELLIPSE, CChartObjectEllipse, C_ShapesEllipse>          gEllipse;
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_Shapes
{
//---
private:
//---
public:
          void                          C_Shapes() {};
          void                          ~C_Shapes() {};
//---
          C_ShapesRectangle             Rectangle;
          C_ShapesTriangle              Triangle;
          C_ShapesEllipse               Ellipse;



//---
};
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
