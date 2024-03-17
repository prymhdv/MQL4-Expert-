//+------------------------------------------------------------------+
//||   ||||||||||             Graphical_Item_Solid.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Bitmaps\oBitmapsLabel.mqh>;              //C_BitmapLabel                  BitmapLabel_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Bitmaps\oBitmapsBar.mqh>;                //C_BitmapBar                    BitmapBar_;
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsBmpControls.mqh>
class C_Bitmaps
{
//===================================================================
private:
          string                 m_name;
          int                   m_index;
//===================================================================
public:
          void                  C_Bitmaps()  {};
          void                  ~C_Bitmaps() {};
//===================================================================
//===================================================================
          C_BitmapsLabel       Label;
          C_BitmapsBar         Bar;
        
//===================================================================

//===================================================================

};
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
