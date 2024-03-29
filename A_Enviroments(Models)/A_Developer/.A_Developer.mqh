//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#ifndef __DEVELOPER__
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BasePlane.mqh> //---Check Dependency--(Varibles)
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BaseWall.mqh> //---Check Dependency--(ErrorsManager)
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\C_OSLib\.C_OSLib.mqh>
//----------------------------------------------------//---Check Dependency--(Medium)
//******************************************************************************************
//||      ||      ||     ||      |||||   ||      ||      ||                             ||\\
//||       ||    ||      ||      ||       ||    ||||    ||                              ||\\
//||        ||  ||       ||      ||||      ||  ||  ||  ||                               ||\\
//||         ||||        ||      ||         ||||    ||||                                ||\\
//||          ||         ||      |||||       ||      ||                                 ||\\ HighImpactEvents.mq4
//******************************************************************************************
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CD_Extern_Signals_LineSence_Block.mqh>  ///MAIN PLACE OF BROTHERS IS C:\Users\MASTER\AppData\Roaming\MetaQuotes\Terminal\4670CDF95A06DC14CD0E559F35B548F7\MQL4\Include\.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CD_Extern_Signals.mqh
//+-----------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment(View) ~~ Dev ~~ Material Common  ~~ Material Trade ~~ Material Graphical |
//+-----------------------------------------------------------------------------------------------+

//+-------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment(Models) ~~ Dev ~~ Material Common  ~~ Material Trade ~~ Material Graphical |
//+-------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOF\.CoverOF.mqh>              /*STORE DATA-Files-Structures*/
//+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment(Models) ~~ Dev ~~ Material Common  ~~ Material Trade ~~ Material Graphical |RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD|
//+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\Structs_Pack_MQL5_MQL4.mqh>      /*STRUCT DATA */  //Solid calss  //---   Enviroment API DeveloperLib   ---(((--No Dependency any--)))---
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\Structs_Pack.mqh>                /*STRUCT DATA */    //---   Enviroment API DeveloperLib   ---(((--No Dependency any--)))---

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\Data_Struct_Test.mqh>            /*STRUCT DATA -test*/
//-----------------------------------------------------------------------------------------------------
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\SQL\DataBase_SQL.mqh>                    /*STORE DATA-Files*/
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\SQL\MQLMySQLDev.mqh>                     Cd_MySql_Dev  MySql_Dev;  //??? accecc vioalte mmemory out of mql addres limint range 
//
//000#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\SQL\mql4-mysql_Run.mqh>               //Cd_SQL SQL;
//000#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\SQL\mql4-sqllite_Run.mqh>                //Cd_SQLLite SQLLite; ..--cant init obj out of mql

//+----------------------------------------------------------------------------------------------------------------+    Material Common Complex - Struct                                                                                                  |
//|    Module ~~ Model ~~ Data ~~ DataLogic ~~ Material iStruct Complex Struct  ~~ OS_Time ~~~~~~                  |    DataBase Common Logic Layer(Model)    (for All Layer)                                            |
//+----------------------------------------------------------------------------------------------------------------+    Object Common Complex - Struct                                                                   |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoveriOC\.CoveriOC.mqh>   /*Common TERMINAL*/                                                                                                                                                           //|
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoveriOCC\.CoveriOCC.mqh>
//+---------------------------------------------------------------------------------------------------------------+                                                                                                   |
//|    Module ~~ Model ~~ Data ~~ DataLogic ~~ Material Graphical GUI Base Object ~~ Line ~~ Shape ~~ ComplexLine | DataBase Graphical Material Logic Layer(Model) (for GUI Layer)                                    |
//+---------------------------------------------------------------------------------------------------------------+                                                                                                   |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.CoverOG.mqh>     /*Graphical*/          //---   Material Graphical Solo Unite ~~  Line ~ Shape ~ Text ~ Bitmaps ~ Events ~ Arrows ~ Fibos ~ Ganns ~ Channels                                |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\.CoverOGC.mqh>                          //---   Material Graphical Complex Unite ~~ pMasterPanel ~                                                                                          |
//Model Pass #1_D_Graphical Object------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//--# Need Graphical obects
//Model Pass #1_C_Trade Object-------------------------------------------------------------------------
//+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment(Models) ~~ Dev ~~ Material Common  ~~ Material Trade ~~ Material Graphical |RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD|
//+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\Sessions.mqh>                                            St_Sessions           Sessions;//
//+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment(Models) ~~ Dev ~~ Material Common  ~~ Material Trade ~~ Material Graphical |RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD|
//+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTimeCallenderNews\A_Developer_Callender.mqh>       Ctime_CallenderNews   CallenderNews;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTimeCallenderNews\A_Developer_Callender2.mqh>      Ctime_CallenderNews2  CallenderNews2;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTimeCallenderNews\A_Developer_Callender3.mqh>      Ctime_CallenderNews3  CallenderNews3;
//+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment(Models) ~~ Dev ~~ Material Common  ~~ Material Trade ~~ Material Graphical |RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD|
//+---------------------------------------------------------------------------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverBookOrders\BookOrderOANDAX.mqh>                     C_OrderBook           OrderBook;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverBookOrders\BookOrderZ.mqh>                          C_OrderBookZ          OrderBookZ;
//+----------------------------------------------------------------------------------------------------+                                                                                                              |
//|    Module ~~ Model ~~ Data ~~ DataLogic ~~ Material Business Trade ~~ Elements ~~ Series ~~ MARKET | DataBase Business Trade Logic Layer(Model)    (for GUI Layer)                                                |
//+----------------------------------------------------------------------------------------------------+                                                                                                              |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOT\.CoverOT.mqh>    /*Trade*/          //---   Material Trade Elements ~~  Series ~ Indicators ~ Text ~ Bar ~ Pivots  (3obj--Dependency_Graphical_Obj_to_Out_Put_Info)                     |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTB\.CoverOTB.mqh>  /*Trade*/
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTC\.CoverOTC.mqh>  /*Trade*/          //---   Material Trade ~~ Trade MARKET Information ~~ Trade Positions Manager  (100obj--Dependency_Graphical_Obj_to_Out_Put_Info)                   |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOTD\.CoverOTD.mqh>  /*Trade*/
//+-----------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment(View) ~~ Dev ~~ Material Common  ~~ Material Trade ~~ Material Graphical |
//+-----------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\.CoverON.mqh>    /*AI Neural Network*/
//+-----------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment(View) ~~ Dev ~~ Material Common  ~~ Material Trade ~~ Material Graphical |
//+-----------------------------------------------------------------------------------------------+
#endif
//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
