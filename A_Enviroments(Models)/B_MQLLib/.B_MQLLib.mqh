//+------------------------------------------------------------------+
//||   ||||||||||                 B_MQLLib.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BasePlane.mqh> //---Check Dependency--(Varibles)
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BaseWall.mqh> //---Check Dependency--(ErrorsManager)
//----------------------------------------------------//---Check Dependency--(Medium)
//+------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ MQLLib ~~ Terminal ~~ Mql ~~ Client ~~ Chart         |
//+------------------------------------------------------------------------------+
//+----------------------------------------------------------------------------------------------------------------+                                                                                                  |
//|    Module ~~ Model ~~ Data ~~ DataLogic ~~ Material MQLLib Struct Complex Struct  ~~ OS_Time ~~~~~~               | DataBase Common Logic Layer(Model)    (for All Layer)                                            |
//+----------------------------------------------------------------------------------------------------------------+ Object Common Complex - Struct                                                                   |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOC\.CoverOC.mqh>                                                                                                                                                             //|
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOCC\.CoverOCC.mqh>
//+----------------------------------------------------------------------------------------------------------------+                                                                                                  |
//|    Module ~~ Model ~~ Data ~~ DataLogic ~~ Material MQLLib Strings Complex Struct  ~~ OS_Time ~~~~~~              | DataBase Common Logic Layer(Model)    (for All Layer)                                            |
//+----------------------------------------------------------------------------------------------------------------+ Object Common Complex - Struct                                                                   |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOS\.CoverOS.mqh>                                                                                                                                                             //|
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOSC\.CoverOSC.mqh>
//+--------------------------------------------------------------------------------------------------------------------+                                                                                                  |
//|    Module ~~ Model ~~ Data ~~ DataLogic ~~ Material MQLLib Arrays Complex Struct  ~~ OS_Time ~~Canvas~~List~~TreeNode | DataBase Common Logic Layer(Model)    (for All Layer)                                            |
//+--------------------------------------------------------------------------------------------------------------------+ Object Common Complex - Struct                                                                   |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOA\.CoverOA.mqh>                                                                                                                                                             //|
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOAC\.CoverOAC.mqh>                                                                                                                                                           //| 
//+-----------------------------------------------------------------------------------------------------------------------------+                                                                                         |
//|    Module ~~ Model ~~ Data ~~ DataLogic ~~ Material MQLLib Files Operations Complex Struct ~~ OS_Time ~~Canvas~~List~~TreeNode | DataBase Files Operations Logic Layer(Model)    (for All Layer)                         |
//+-----------------------------------------------------------------------------------------------------------------------------+ Object Files Operations Complex - Struct                                                |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOF\.CoverOF.mqh>                                                                                                                                                             //|
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOFC\.CoverOFC.mqh>
//+------------------------------------------------------------------+
//|                 Graphical Objects - Controls                     |
//|                                                                  |
//+------------------------------------------------------------------+
//+--------------------------------------------------------------------------------------------------------------------+
//|    Module Material Graphical Solo ~~  Line ~ Shape ~ Text ~ Bitmaps ~ Events ~ Arrows ~ Fibos ~ Ganns ~ Channels   |
//+--------------------------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOG\MQLLib_GraphicalObjects.mqh>;                                         //--- noDependency (Build-Lib MQL))                                                                                                                                                      //|
//+-------------------------------------------------------------------------------------------------------------------------+                                                                                             |
//|    Module ~~ Model ~~ Data ~~ DataLogic ~~ Material MQLLib Graphical GUI Controler Object ~~ Dialog ~~ ListView ~~ Picture | DataBase Graphical Material Logic Layer(Model) (for GUI Layer)                              |
//+-------------------------------------------------------------------------------------------------------------------------+                                                                                             |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOGctrl\.CoverOGctrl.mqh>           //---   Material Graphical Controler Unite ~~  Dialog ~ ListView ~ Picture ~                                                                |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOGctrlC\.CoverOGctrlC.mqh>         //---   Material Graphical Controler Complex Unite ~~ pMasterPanel ~      |
//+---------------------------------------------------------------------------------------------------------------------+                                                                                             |
//|    Module ~~ Model ~~ Data ~~ DataLogic ~~ Material MQLLib Graphical GUI Canvas Object ~~   ~~   ~~                        | DataBase Graphical Material Logic Layer(Model) (for GUI Layer)                              |
//+---------------------------------------------------------------------------------------------------------------------+                                                                                             |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOGCanvas\.CoverOGCanvas.mqh>           //---   Material Graphical Controler Unite ~~  Dialog ~ ListView ~ Picture ~                                                                |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\CoverOGCanvasC\.CoverOGCanvasC.mqh>         //---   Material Graphical Controler Complex Unite ~~ pMasterPanel ~  
//+------------------------------------------------------------------+ Print("       Passd StackOverflow",__FUNCSIG__);
//||   ||||||||||                 B_MQLLib.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//+------------------------------------------------------------------------------------------------+
//+                           Object Drive System in MQL                                           +
//+------------------------------------------------------------------------------------------------+
//|     _COBF_                                                                                    ||
//|     _COBF_ Base Struct Of GraphicalChartObj(DataForm)                                         ||
//|     _COBF_ Handel DataForm GraphicalChartObj (set,get,save,load)                              ||
//|     Common handler of <mouse> events                                                          ||
//|                                                                                               ||
//|     Relation:                                                                                 ||
//|        ChartObj Handel DataAction Of GraphicalChartObj (Create,Move,Delete,Modify)            ||
//|                                                                                               ||
//|     Connection:                                                                               ||
//|         GraphicalActionClass DataBase (set,get,Change)                                                     ||
//|                                                                                               ||
//|     Diffrents:                                                                                ||
//|            "class CChartObject : public CObject" For Objects Play on ChartFrameWin            ||
//|            "class CChart : public CObject"       For ChartFrameWin                            ||
//|                                                                                               ||
//|     Regs: classes                                                                             ||
//|       CBit               as Field'2'  limited                                                 ||
//|                             (RAMSpace) Base class for storing 2 bool '/' ' '                  ||
//|       CTer               as Field'3'  limited                                                 ||
//|                              (RAMSpace) Base class for storing 3 pointerbool  '/' '\' ' '     ||
//|       -------------------------------------------------------------------------------------   ||
//|       CDoublerBit        as SomeField  (RAMSpace) Base class for storing 01      binary       ||
//|       CThublerBit        as SomeField  (RAMSpace) Base class for storing 010                  ||
//|       CComplexBit        as SomeField  (RAMSpace) Base class for storing 0101                 ||
//|       -------------------------------------------------------------------------------------   ||
//|       CDoublerTer        as SomeField  (RAMSpace) Base class for storing 21      ternary      ||
//|       CThublerTer        as SomeField  (RAMSpace) Base class for storing 012                  ||
//|       CComplexTer        as SomeField  (RAMSpace) Base class for storing 2112                 ||
//|       -------------------------------------------------------------------------------------   ||
//|       bool  doubool      as Partion    (RAMSpace)(RAMSpaceTable)                              ||
//|       int   long         as Partion    (RAMSpace)(RAMSpaceTable)                              ||
//|       float double       as Partion    (RAMSpace)(RAMSpaceTable)                              ||
//|       char  string       as Partion    (RAMSpace)(RAMSpaceTable)                              ||
//|       ---Include---------------------------------------------------------------------------   ||
//|       CObject:PartionHolderFrame(superTable) superTable{00000010101010101010100000} '00000'   ||
//|                          as Record (ComplexPartionsTable) Base class for storing elements     ||
//|       ---Charts----------------------------------------------------------------------------   ||
//|       CChart                :       CObject                 as Road Frame                     ||
//|       ---Controls--------------------------------------------------------------------------   ||
//|       CWnd                  :       CObject                 ss OnRoad control object          ||
//|       CWndObj               :       CWnd                    Actioner                          ||
//|       CWndContainer         :       CWnd                                                      ||
//|       ---ChartObjects----------------------------------------------------------------------   ||
//|       CChartObject          :       CObject                 as Car                            ||
//|       CChartObjectTrend     :       CChartObject            as Car_Engine                     ||
//|       CChartObjectPanel     :       CChartObjectButton      as Car_Body                       ||
//|       ---Files-----------------------------------------------------------------------------   ||
//|       CFile                 :       CObject                                                   ||
//|       CFileBin              :       CFile                                                     ||
//|       CFilePipe             :       CFile                                                     ||
//|       CFileTxt              :       CFile                                                     ||
//|       ---Indicators------------------------------------------------------------------------   ||
//|       CSeries               :       CObject                                                   ||
//|       ---Indicators > TimeSeries-----------------------------------------------------------   ||
//|       CPriceSeries          :       CSeries                                                   ||
//|       CiOpen                :       CPriceSeries                                              ||
//|       CiHigh                :       CPriceSeries                                              ||
//|       CiLow                 :       CPriceSeries                                              ||
//|       CiClose               :       CPriceSeries                                              ||
//|       CiTime                :       CSeries                                                   ||
//|       CiVolume              :       CSeries                                                   ||
//|       CIndicator            :       CSeries                                                   ||
//|       CIndicators           :       CArrayObj                                                 ||
//|       ---Indicators > Trend----------------------------------------------------------------   ||
//|       CiADX                 :       CIndicator       "Average Directional Index" indicator.   ||
//|       CiBands               :       CIndicator       "Bollinger Bands" indicator.             ||
//|       CiEnvelopes           :       CIndicator       "Envelopes" indicator.                   ||
//|       CiIchimoku            :       CIndicator       "Ichimoku Kinko Hyo" indicator.          ||
//|       CiMA                  :       CIndicator       "Moving Average" indicator.              ||
//|       CiSAR                 :       CIndicator       "Parabolic Stop And Reverse System"      ||
//|       CiStdDev              :       CIndicator       "Standard Deviation".                    ||
//|       ---Indicators > Volumes--------------------------------------------------------------   ||
//|       CiAD                  :       CIndicator       "Accumulation/Distribution" indicator.   ||
//|       CiMFI                 :       CIndicator       "Money Flow Index" indicator.            ||
//|       CiOBV                 :       CIndicator       "On Balance Volume" indicator            ||
//|       ---Indicators > Oscilators-----------------------------------------------------------   ||
//|       CiATR                 :       CIndicator       "Average True Range" idnicator.          ||
//|       CiATR                 :       CIndicator       "Average True Range" idnicator.          ||
//|       CiATR                 :       CIndicator       "Average True Range" idnicator.          ||
//|       CiATR                 :       CIndicator       "Average True Range" idnicator.          ||
//|       ---Indicators > Custom---------------------------------------------------------------   ||
//|       CiCustom              :       CIndicator       "custom" indicators.                     ||
//|       ---Indicators > BillWilliams---------------------------------------------------------   ||
//|       CiAC                  :       CIndicator       "Accelerator Oscillator" indicator.      ||
//|       CiAlligator           :       CIndicator       "Alligator" indicator.                   ||
//|       CiAO                  :       CIndicator       "Awesome Oscillator" indicator.          ||
//|       CiFractals            :       CIndicator       "Fractals" indicator.                    ||
//|       CiGator               :       CIndicator       "Gator oscillator" indicator.            ||
//|       CiBWMFI               :       CIndicator       "Market Facilitation Index" indicator    ||
//|       ---Canvas----------------------------------------------------------------------------   ||
//|       CCanvas                             Usage: class for working with a dynamic resource    ||
//|               base class that images that pixelec to drwe some thing                          ||
//|       ---Arrays----------------------------------------------------------------------------   ||
//|                                                                                               ||
//|                                                                                               ||
//|                                                                                               ||
//|       ---0srcCapitan-----------------------------------------------------------------------   ||
//|       ---Files-----------------------------------------------------------------------------   ||
//|                                                                                               ||
//+------------------------------------------------------------------------------------------------+