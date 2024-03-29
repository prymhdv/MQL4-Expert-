//+------------------------------------------------------------------+
//||   ||||||||||             Graphical_Item_Solid.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Ganns\oGannsLine.mqh>;                    //C_GannLine                    GannLine_G;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Ganns\oGannsFan.mqh>;                     //C_GannFan                     GannFan_G;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Ganns\oGannsGrid.mqh>;                    //C_GannGrid                    GannGrid_G;
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsGann.mqh>
// C_Objects             C_Gann::OBJ;
class C_Ganns
{
//===================================================================
private:
          string                 m_name;
          int                    m_index;
//===================================================================
public:
          void                   C_Ganns()  {};
          void                   ~C_Ganns() {};
//===================================================================
//===================================================================
          C_GannsLine            Line;
          C_GannsFan             Fan;
          C_GannsGrid            Grid;
    
//===================================================================
//===================================================================
};
//+------------------------------------------------------------------+
