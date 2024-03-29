//+------------------------------------------------------------------+
//||   ||||||||||             Graphical_Item_Solid.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#ifndef __OLINE__
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsLines.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Lines\oLinesVertical.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Lines\oLinesHorizontal.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Lines\oLinesTrend.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Lines\oLinesTrendByAngle.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Lines\oLinesCycles.mqh>
#endif 
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
class C_Lines
{
//---
private:

          string                         ObjName;//name num comfe from ObjAllNum
          uint                           ObjNum;//just run once created obj
          datetime                       ObjCreateTime;
          //---
          int                            UseCount;
          int                            UseStart;
          //static int OBJCount;// = 0;>>may come error//resolved//by set value out class block::
//---
public:
          void C_Lines() {};
          void ~C_Lines() {};
//---
          C_LinesVertical                Vertical,      VlineS;
          C_LinesHorizontal              Horizontal, HorizontalX,    HorizonlineAskX, HorizonlineX;
          C_LinesTrend                   Trend;
          C_LinesTrendByAngle            TrendByAngle;
          C_LinesCycles                  Cycles;
          //---
        
//---    



//---

};
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
