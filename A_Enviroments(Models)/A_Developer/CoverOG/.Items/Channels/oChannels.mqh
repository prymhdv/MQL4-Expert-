//+------------------------------------------------------------------+
//||   ||||||||||             Graphical_Item_Solid.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Channels\oChannelsPitchfork.mqh>;         //C_ChannelPitchfork            Pitchfork_G;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Channels\oChannelsRegression.mqh>;        //C_ChannelRegression           Regression_G;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Channels\oChannelsStandardDeviation.mqh>; //C_ChannelStandardDeviation    StandardDeviation_G;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Channels\oChannelsEquidistant.mqh>;       //C_ChannelEquidistant          Equidistant_G;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Channels\oChannelsExtention.mqh>;       //C_ChannelEquidistant          Equidistant_G;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Channels\oChannelsZigZag.mqh>; 
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsChannels.mqh>

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_Channels
{
private:

public:
          void                          C_Channels() {};
          void                          ~C_Channels() {if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Channel Error",  __LINE__, __FUNCTION__); }

          //CChartObjectPitchfork         Pitchfork;
          //CChartObjectRegression        Regression;
          //CChartObjectStdDevChannel     StandardDeviation;
          //CChartObjectChannel           Equidistant;
          //
          C_ChannelsPitchfork            Pitchfork;
          C_ChannelsRegression           Regression;
          C_ChannelsStandardDeviation    StandardDeviation;
          C_ChannelsEquidistant          Equidistant;
       
          //***************************************
          C_ChannelsZigZag              ChannelsZigZag;     
          //extention channels
          C_Channels_Extention          _Extention;
                                       
//---
};

//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
