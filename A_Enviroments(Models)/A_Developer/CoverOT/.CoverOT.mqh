//+------------------------------------------------------------------+
//||   ||||||||||       St_CondicatorData_Indicators_MA.mqh         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class Trade Objects     BEGIN                        |0 errors, 1 warnings, 214--220-305 msec elapsed
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\.CoverOGC.mqh>
//----------------------------------------------------//---Check Dependency--(High)
//---off--- C_CONDUCTOR //use gFlowPad.IsBTN_CommentPannel --ct_Inform.CommentOx(false) ct_Drive.IsConditionWatch

////+------------------------------------------------------------------+
////|    Module ~~ Trade ~~ Service ~~ app ~~Base~~                    | //---   Service Trade app
////+------------------------------------------------------------------+
        
//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\Trade_Data_Enum.mqh>                //----Object Trade DefinesEnumsStracts
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\Trade_Data_Structs.mqh>

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\uMathematic.mqh>
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\uExecuteONPulse.mqh>                     C_ExecuteONPulse        PulseTwo, PulseOne, PulseThere,PulseHourly;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Std_Bar_Info.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\uBarNews.mqh>                           C_BarNews_              Detect_NewBar;   //(Dependency C_CONDUCTOR (tConductor.mqh))
//---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\oPivots.mqh>
//---

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\St_Labels.mqh>                           Std_Labels                       std_Labels;
////+------------------------------------------------------------------+
////|                   Trade MARKET Information                       | DataBase
////+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\Ct_Instrument.mqh>                                                        ///>>OKEY 19 >>>>by ordering calll class.
////+------------------------------------------------------------------+
////|                    Positions Manager Data information            | Logical DataBase
////+------------------------------------------------------------------+
////+------------------------------------------------------------------+
////|                   Trade MARKET Account Information               | DataBase (depended symbol and size for calc remain margin)
////+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\.CoverOT_BaseData.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\Ct_Series_Base.mqh>             Ct_Series_Base            ct_Series_Base;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\Ct_Series.mqh>                  Ct_Series               ct_Series;
//----
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\Ct_Account.mqh>                      //---dependency havy to St_SIZE of trade
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\Ct_Market_Symbol.mqh>            //---Cover for Next
//---




////+------------------------------------------------------------------+
////|    Module ~~ Trade ~~ Service ~~ app ~~Base~~                    | //---   Service Trade app
////+------------------------------------------------------------------+
//**************************************************************************************************************
//**************************************************************************************************************Compiled elements no error '2022 01 23'
//**************************************************************************************************************
