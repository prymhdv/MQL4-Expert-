//+------------------------------------------------------------------+ ProjectName - CompanyName - Copyright - WebSite
//||    ||||||||||          ProjectName:QUARTS.mq4                  || Worlds Watcher V00-build FC-2021-01-10//QUARTS_DEBUG build FC-2021-04-10
//|||   ||||||  ||        Copyright © 2020-2022, MetaJetEngine     ||| MyRoboTrader V00-build FC-2021-01-10
//||||  ||   |||||            Email: @prymhdvgmail.com            |||| MyRoboTrader V06-build FC-2021-04-10
//|||   |||||||  |            HTTPS: www.Oprymhdv.com              ||| MyRoboTrader V08-build FC-2022-01-13
//||    ||||||||||      MyRoboTrader V08-build FC-2022-01-13        ||"ComponentInterfaceAbstractImplanting" 2021 12 13 02:13:36 ct_Start. Weekly Reply
//+------------------------------------------------------------------+0 errors, 0 warnings, 801 msec elapsed  2022 02 18 18 51
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\    |
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//||          ||||      ||||         |||        ||||       |||||    ||                 ||\\ PouryamoonDaweSulu.                                                                                                                          |
//||         ||  ||    ||  ||      ||   ||      ||  ||     ||       ||                 ||\\ Attila.Atilla                                                                                                                          |
//||        ||    ||  ||    ||    ||     ||     ||   ||    |||||    ||                 ||\\ SparlexScrewyAchiwments                                                                                                                          |
//||       ||      ||||      ||    ||   ||      ||  ||     ||       ||                 ||\\ DumanOrdum                                                                                                   |
//||      ||        ||        ||     |||        ||||       |||||    ||||||             ||\\ Sahandim@ymail.com                                                                                                                          |
//+-------------------------------------------------------------------------------------+===Model====== Data Logic Members                                                                                            |
//|    Module ~~ Model ~~ Data ~~ DataLogic ~~ Material DataBase Existasnce ~~ Function | DataBase Basic Layer(Model)                                                                                                 |
//+-------------------------------------------------------------------------------------+
#ifndef __MODEL__
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BasePlane.mqh>                 //---   Existasnce      ~~ Defines ~ Macros ~ Enums ~ Variables ~ Imports ~ Inputs (DMEVII)(Plane) //--- (None)Dependency     (Build-In Mine)       |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BaseWall.mqh>                  //---   Function Global ~~ RandomColor ~~ Global Service ~~ Service --- Utilities app (Walls)      //--- (Minor)Dependency    (.BasePlane.mqh Mine) |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BaseDoor.mqh>                  //---   Classes Structs Predefine
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CoverDataTypes.mqh>
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- +
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\.B_MQL.mqh>                       //---   Enviroment API MQL Build-in   ~~ Error ~ Terminal ~ Mql ~ Client ~ Chart ()                     //--- (Medium)Dependency    (.BaseWall.mqh Mine)  |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\.B_MQLLib.mqh>                 //---   Enviroment API MQLLib         ~~ Error ~ Terminal ~ Mql ~ Client ~ Chart () 
//

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\C_OS\.C_OS.mqh>                         //---   Enviroment API OS             ~~ Keyboard ~ Mouse ~ Sound ~ Network ~ Disk ~ Monitor ~ Power ~           //--- (High)Dependency      (.A_MQL.mqh Mine)     |
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\C_OSLib\.C_OSLib.mqh>                   //---   Enviroment API OS             ~~ MotherBoard<CPU,RAM,GPU> System Parts*/ {extract OsDlls}                                                                                //|
//

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\.A_Developer.mqh>           //---   Enviroment API Developer      ---(((- Dependency B_MQL & C_OS)))--- //--- (Medium)Dependency    (.BaseWall.mqh Mine)  | 
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\_ACTOR_.mqh>                                 C_ACTOR_               _ACTOR_;
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\LicenceCheck.mqh>                    C_Licence              Licence;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\LoginCheck.mqh>                      C_Login                Login;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\C_OS\sAuthority.mqh>                         C_AUTHORITY            AUTHORITY;                  ///>>OKEY 010 ///gone Global scoping //#NOERRORRING
#endif
//Model Pass #1_A_Enviroments(Models) Object----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//Model Pass #1_B_DataBase Basic Object-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\//---   Module  ---\\    |
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//+------------------------------------------------------------------+ ProjectName - CompanyName - Copyright - WebSite
//||    ||||||||||          ProjectName:QUARTS.mq4                  || Worlds Watcher V00-build FC-2021-01-10//QUARTS_DEBUG build FC-2021-04-10
//|||   ||||||  ||        Copyright © 2020-2022, MetaJetEngine     ||| MyRoboTrader V00-build FC-2021-01-10
//||||  ||   |||||            Email: @prymhdvgmail.com            |||| MyRoboTrader V06-build FC-2021-04-10
//|||   |||||||  |            HTTPS: www.Oprymhdv.com              ||| MyRoboTrader V08-build FC-2022-01-13
//||    ||||||||||      MyRoboTrader V08-build FC-2022-01-13        ||"ComponentInterfaceAbstractImplanting" 2021 12 13 02:13:36 ct_Start. Weekly Reply
//+------------------------------------------------------------------+
struct Sgo_RightMenuPad
{

          Cg_TextsButton        BTN_OrdersPutMode_Press;//

          Cg_TextsLabel         LBL_RSI,
                                LBL_WRp,
                                LBL_MACDmain,
                                LBL_MACDSignal,
                                LBL_OBV,
                                LBL_ATR;

          Cg_TextsRectLabel     RLBL_GabRSI,
                                RLBL_RSI,
                                RLBL_GabWRp,
                                RLBL_WRp,
                                RLBL_GabMACDmain,
                                RLBL_MACDmain,
                                RLBL_GabMACDSignal,
                                RLBL_MACDSignal,
                                RLBL_GabOBV,
                                RLBL_OBV,
                                RLBL_GabATR,
                                RLBL_ATR;

          Cg_TextsRectLabel     RLBL_TopMiddle;
          //==========================================================
          Cg_TextsLabel         LBL_MarketKeys_Loger;
          Cg_TextsRectLabel     RLBL_MarketKeys_Loger;
          //C_TextRectLabel     MarketKeys_Loger;
          //==========================================================

          Cg_TextsButton        BTN_TrailingOK;
          Cg_TextsLabel         LBL_TrailingStopXvalue,
                                LBL_MinProfitXvalue,
                                LBL_MinProfitUP,
                                LBL_MinProfitDN,
                                LBL_TrailingUP,
                                LBL_TrailingDN;
          Cg_TextsRectLabel     RLBL_TrailBox,
                                RLBL_Trailing,
                                RLBL_TrailingTwo;
          Cg_TextsEdit          EDT_Trailing,
                                EDT_MinProfit;
          //========================================

          Cg_TextsLabel         LBL_MenuPadsRightController,  ////<<<<<<<<<<<<<<<<<<<<<,ten erroring...
                                LBL_WpR20_CrossUp_200,
                                LBL_Accelerator_UP,
                                LBL_BullsPower_14_UpTrend,
                                LBL_MFI_UP,
                                LBL_OBVClose_EMA20_CrossUp_SMA20,
                                LBLSuperKeys,
                                LBL_MicroTrendUp;


}; Sgo_RightMenuPad RightMenuPad;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
