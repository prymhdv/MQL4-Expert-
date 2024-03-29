//+------------------------------------------------------------------+
//|                                            C_GOLDVIP.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class TechnicalX     BEGIN-END                       |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
//+------------------------------------------------------------------+
//||   ||||||||||       St_CondicatorData_Indicators_MA.mqh         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
class C_GOLDVIP;
//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

#define XSideBS 0
#define YSideBS 30
struct Std_GoldVip_Panel_data_Frame
{         //
          int                   WhichMode, WhichMode__Safe;
          bool                  IsKey, IsKey__Safe;
          bool                  Is_Move;
          bool                  Is_Show;         // = false;
          bool                  Is_Create;
          bool                  Is_Created;      // = false;
          bool                  IsCallMiniMode;   // = false;
          bool                  Is_Reset_Desc;
          ENUM_TIMEFRAMES       PeriodTMCom;     // = PERIOD_CURRENT;
          //
          int                   MoveX;           // = 0;
          int                   MoveY;           // = 0;
          int                   SizeX;           // = 0;
          int                   SizeY;           // = 0;
          int                   SizeExtendX;     // = 0;
          int                   SizeExtendY;     // = 0;.
          //
          int                   SaveMoveXCom;    // = 0;
          int                   SaveMoveYCom;    // = 0; //
          int                   SizeinX;         // = 220;
          int                   SizeinY;         // = PANEL_INDENT_TOP + 103 ;
          color                 ColorBody;       // = clrGray;//clrWhite;
          color                 ColorLogo;       // = clrWhite;//clrWhite;
          color                 ColorBodyMargine;// = clrDarkSlateGray ;
          color                 ColorBodyText;   // = clrDarkTurquoise;
          color                 ColorBodyCyrcle; // = clrRed;
          bool                  result;          // = false;
          //
          int                   LineCOM;         // = 0;
          string                FuncCome;        // = "None";
          //
          //
          //================================Period Define  ///whitch page call///
          bool                  IsPadPress_Main; // = 0;
          bool                  Is_Daily;        // = 0;
          bool                  Is_4Hour;        // = 0;
          bool                  Is_30Min;        // = 0;
          bool                  Is_5Min ;        // = 0;
          bool                  Is_Tab;
          //
          //Std_GoldVip_Panel_data_Frame Cmini;
          //Cmini.WhichMode           = MODE_MINI;
          //Cmini.IsKey               = true;
          //Cmini.Is_Show             = Is_CShow;
          //Cmini.Is_Created          = Is_CCreated;
          //Cmini.IsCallMiniMode       = IsPadPress_Mini;
          //Cmini.PeriodTMCom         = PERIOD_CURRENT;
          //Cmini.MoveX               = true;
          //Cmini.MoveY               = true;
          //Cmini.SizeX               = true;
          //Cmini.SizeY               = true;
          //Cmini.SizeExtendX         = true;
          //Cmini.SizeExtendY         = true;
          //
};

struct Std_GoldVip_Panel_data_Desc
{

          int           WhichMode;
          bool          IsKey;
          //-------------------------------------
          string        PeriodDesc;
          string        Text030_Period;
          //-------------------------------------
          int           MoveX;
          int           SaveMoveXCom;
          int           CMoveX_independ;
          //-------------------------------------
          int           MoveY;
          int           SaveMoveYCom;
          int           CMoveY_independ;
          //-------------------------------------
          string        Text040_Pivots;
          //-------------------------------------
          string        TP1Desc;
          string        Text050_TP1;
          color         TPX_Text050_TP1Color;
          //-------------------------------------
          string        TP2Desc;
          string        Text060_TP2;
          color         TPX_Text050_TP2Color;
          //-------------------------------------
          string        TP3Desc;
          string        Text070_TP3;
          color         TPX_Text050_TP3Color;
          //-------------------------------------
          string        Text080_Go;
          string        Text090;
          //-------------------------------------

};

struct Std_GoldVip_Panel_data_Desc_TPX
{         string     TPX_TimePeriodDesc;             //= "";
          string     TPX_DateCalculatingDesc;        //= "";
          string     TPX_ProfitPipDesc;              //= "";
          //-----
          string     TPX_R4ValueDesc;               //= "";
          string     TPX_R2ValueDesc;                //= "";
          string     TPX_PPValueDesc;                //= "";
          string     TPX_S2ValueDesc;                //= "";
          string     TPX_S4ValueDesc;                //= "";
          //-----
          string     TPX_TP1ValueDesc;               //= "";
          string     TPX_TP1PercentValueDesc;        //= "";
          string     TPX_TP1ValueDictanceDesc;       //= "";
          double     TPX_TP1PercentValueCalc;        //= -1;
          //-----
          string     TPX_TP2ValueDesc;               //= "";
          string     TPX_TP2PercentValueDesc;        //= "";
          string     TPX_TP2ValueDictanceDesc;       //= "";
          double     TPX_TP2PercentValueCalc;        //= -1;
          //-----;
          string     TPX_TP3ValueDesc;               //= "";
          string     TPX_TP3PercentValueDesc;        //= "";
          string     TPX_TP3ValueDictanceDesc;       //= "";
          double     TPX_TP3PercentValueCalc;        //= -1;
          //-----;
          string     TPX_Set_TypeDesc;                //= "";
          string     TPX_StartPriceDesc;             //= "";
          string     TPX_StopLossValueDesc;          //= "";
          string     TPX_StopLossValueDictanceDesc;  //= "";
          string     TPX_EndTimeDesc;                //= "";
          //-----;
          color      TPX_Text050_TP1Color;            //= clrBlue;
          color      TPX_Text050_TP2Color;            //= clrBlue;
          color      TPX_Text050_TP3Color;            //= clrBlue;
          //---------
          string     TPX_SozCom;                     //= ""; //
          //-------------
          //bool       TPX_Is_Buy1_Sell0;
          //bool       TPX_Is_Tp1_Achived;
          //bool       TPX_Is_Tp2_Achived;
          //bool       TPX_Is_Tp3_Achived;
          //bool       TPX_Is_Sl_Achived;
          //
};
//---
//---
//---
struct C_GOLDVIP_Panel
{         //member data
          bool                  IsPadPress;
          bool                  IsMini;//
          bool                  Is_CMove;//   = false;
          bool                  Is_CCreate;// = false;
          bool                  Is_CCreateMini;//
          bool                  Is_CCreated;
          int                   WhichModeCall; //
          //-------------------------------------
          ////
          ENUM_TIMEFRAMES         Key_Period;
          ENUM_TIMEFRAMES         Key_PeriodSafe;        // = PERIOD_CURRENT;
          bool                    Is_PadClear;
          bool                    IsPadPress_Mini;
          ////---
          int                     CMoveX_independ;
          int                     CMoveY_independ;
          bool                    CIs_Move;
          ///
          bool                    Is_CordinateChange;
          int                     X_Last, Y_Last;
          //=======================================================================================
          bool                  CIs_DoMain;            // = 0;//
          bool                  CIs_DoDaily;           // = 0;//
          bool                  CIs_Do4Hour;           // = 0;//
          bool                  CIs_Do30Min;           // = 0;//
          bool                  CIs_Do5Min;            // = 0;//
          //=======================================================================================
          bool                  CIs_DoMainDraw;        // = 0;//
          bool                  CIs_DoDailyDraw;       // = 0;//
          bool                  CIs_Do4HourDraw;       // = 0;//
          bool                  CIs_Do30MinDraw;       // = 0;//
          bool                  CIs_Do5MinDraw;        // = 0;//

};
struct Sgp_GoldVIP_Data
{         Std_GoldVip_Panel_data_Desc_TPX _M1;
          Std_GoldVip_Panel_data_Desc_TPX _M5;
          Std_GoldVip_Panel_data_Desc_TPX _M15;
          Std_GoldVip_Panel_data_Desc_TPX _M30;
          Std_GoldVip_Panel_data_Desc_TPX _H1;
          Std_GoldVip_Panel_data_Desc_TPX _H4;
          Std_GoldVip_Panel_data_Desc_TPX _D1;
          Std_GoldVip_Panel_data_Desc_TPX _W1;
          Std_GoldVip_Panel_data_Desc_TPX _MN;
          Std_GoldVip_Panel_data_Desc_TPX _ClientTPX;//as current

//
};
Sgp_GoldVIP_Data GoldVIP_PanelPeriodsData;

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|             Class TechnicalX     BEGIN-END                       |
//+------------------------------------------------------------------+
struct Sgtd_Levels_element_Desc
{         //---
          //string        Desc_004;  // = "-1"; // //= TOOLS.Use.LevelDescription(4); // Alert(TPX_LEVELTEXT_TrendGo_004, "===TPX_LEVELTEXT_TrendGo_004==>>>");
          string        ArrayDesc[28];
          //string        Desc_00;   // = "-1"; ////= ObjectGetString(0, UseName, OBJPROP_LEVELTEXT, 1);
          //string        Desc_01;   // = "-1"; //
          //string        Desc_02;
          //string        Desc_03;
          //string        Desc_04;
          //string        Desc_05;
          //string        Desc_06;
          //string        Desc_07;
          //string        Desc_08;
          //string        Desc_09;
          //string        Desc_10;
          //string        Desc_11;
          //string        Desc_12;
          //string        Desc_13;
          //string        Desc_14;//
          //string        Desc_15;   // = "-1"; //
          //string        Desc_16;
          //string        Desc_17;
          //string        Desc_18;
          //string        Desc_19;
          //string        Desc_20;
          //string        Desc_21;
          //string        Desc_22;
          //string        Desc_23;
          //string        Desc_24;
          //string        Desc_25;
          //string        Desc_26;
          //string        Desc_27;
          //string        Desc_28;//
          void          Sgtd_Levels_element_Desc() {  ArrayResize(ArrayDesc, 28);}
          //
};
struct Sgtd_Levels_element_Value
{         //---
          double        ArrayValue[28];
          //double        Value_00_0000 ;//= -1; //      = Price3 - LEVELPosetive00 * PriceRange1and2;//0.00
          //---
//          double        Value_01_0236 ;//= -1;//       = Price3 + LEVELPosetive01 * PriceRange1and2;//0.236   Price3 - LEVELNegetive15 * PriceRange1and2;//-0.236
//          double        Value_02_0382 ;//= -1;//       = Price3 + LEVELPosetive02 * PriceRange1and2;//0.382    //Start Trend
//          double        Value_03_0500 ;//= -1;//       = Price3 + LEVELPosetive03 * PriceRange1and2;//0.50
//          double        Value_04_0618 ;//= -1;//       = Price3 + LEVELPosetive04 * PriceRange1and2;//0.618    //Target One///
//          double        Value_05_0786 ;//= -1;//       = Price3 + LEVELPosetive05 * PriceRange1and2;//0.786
//          double        Value_06_0888 ;//= -1;//       = Price3 + LEVELPosetive06 * PriceRange1and2;//0.888    //Target Two
//          double        Value_07_1000 ;//= -1;//       = Price3 + LEVELPosetive07 * PriceRange1and2;//1.00
//          double        Value_08_1236 ;//= -1;//       = Price3 + LEVELPosetive08 * PriceRange1and2;//1.236
//          double        Value_09_1382 ;//= -1;//       = Price3 + LEVELPosetive09 * PriceRange1and2;//1.328
//          double        Value_10_1500 ;//= -1;//       = Price3 + LEVELPosetive10 * PriceRange1and2;//1.50
//          double        Value_11_1618 ;//= -1;//       = Price3 + LEVELPosetive11 * PriceRange1and2;//1.618    //Target Three
//          double        Value_12_2000 ;//= -1;//       = Price3 + LEVELPosetive12 * PriceRange1and2;//2.00
//          double        Value_13_2618 ;//= -1;//       = Price3 + LEVELPosetive13 * PriceRange1and2;//2.618
//          double        Value_14_3000 ;//= -1;//       = Price3 + LEVELPosetive14 * PriceRange1and2;//3.00
//
//          double        Value_15_0236 ;//= -1;//       = Price3 + LEVELPosetive01 * PriceRange1and2;//0.236   Price3 - LEVELNegetive15 * PriceRange1and2;//-0.236
//          double        Value_16_0382 ;//= -1;//       = Price3 + LEVELPosetive02 * PriceRange1and2;//0.382    //Start Trend
//          double        Value_17_0500 ;//= -1;//       = Price3 + LEVELPosetive03 * PriceRange1and2;//0.50
//          double        Value_18_0618 ;//= -1;//       = Price3 + LEVELPosetive04 * PriceRange1and2;//0.618    //Target One///
//          double        Value_19_0786 ;//= -1;//       = Price3 + LEVELPosetive05 * PriceRange1and2;//0.786
//          double        Value_20_0888 ;//= -1;//       = Price3 + LEVELPosetive06 * PriceRange1and2;//0.888    //Target Two
//          double        Value_21_1000 ;//= -1;//       = Price3 + LEVELPosetive07 * PriceRange1and2;//1.00
//          double        Value_22_1236 ;//= -1;//       = Price3 + LEVELPosetive08 * PriceRange1and2;//1.236
//          double        Value_23_1382 ;//= -1;//       = Price3 + LEVELPosetive09 * PriceRange1and2;//1.328
//          double        Value_24_1500 ;//= -1;//       = Price3 + LEVELPosetive10 * PriceRange1and2;//1.50
//          double        Value_25_1618 ;//= -1;//       = Price3 + LEVELPosetive11 * PriceRange1and2;//1.618    //Target Three
//          double        Value_26_2000 ;//= -1;//       = Price3 + LEVELPosetive12 * PriceRange1and2;//2.00
//          double        Value_27_2618 ;//= -1;//       = Price3 + LEVELPosetive13 * PriceRange1and2;//2.618
//          double        Value_28_3000 ;//= -1;//       = Price3 + LEVELPosetive14 * PriceRange1and2;//3.00
          void          Sgtd_Levels_element_Value() {  ArrayResize(ArrayValue, 28);}
          //

};
struct Sgtd_Levels_Direct_Desc
{         Sgtd_Levels_element_Desc TrendGo;
          Sgtd_Levels_element_Desc TrendBack;
          Sgtd_Levels_element_Desc Trend;
          //
};
struct Sgtd_Levels_Direct_Value
{         Sgtd_Levels_element_Value TrendGo;
          Sgtd_Levels_element_Value TrendBack;
          Sgtd_Levels_element_Value Trend;
          //TrendGo==Posetive //TrendBack==Negative
          //double FIRSTLEVEL01 = ObjectGet(UseName, OBJPROP_FIRSTLEVEL - 1);//not existed ///after 14 is negetive levels
          //
};
struct Sgtd_Fivo_Expantion_Levels
{

          Sgtd_Levels_Direct_Desc       LEVEL_TEXT;

          Sgtd_Levels_Direct_Value      LEVEL_Percent;    //= -1; // = ObjectGet(UseName, OBJPROP_FIRSTLEVEL + 0);  // = ObjectGet(UseName, OBJPROP_FIRSTLEVEL + 1);//Integer value to set/get the value of Fibonacci object level with index n. Index n can be from 0 //levels value by percent
          //--
          Sgtd_Levels_Direct_Value      LEVEL_Price3;
          Sgtd_Levels_Direct_Value      LEVEL_Price3_adjust;
          //
          double TPX_Price1                     ;//= -1; //                 = ObjectGet(UseName, OBJPROP_PRICE1);
          double TPX_Price2                     ;//= -1; //                 = ObjectGet(UseName, OBJPROP_PRICE2);
          double TPX_Price3                     ;//= -1; //                 = ObjectGet(UseName, OBJPROP_PRICE3);///CurretPricePivot
          double TPX_PriceRange1and2            ;//= -1; //        = MathAbs(Price1 - Price2);
          string PeriodTMComDesc               ;//= Utilities.TimeFrameToString(PeriodTMCom ); ///"CURRENT"   "M1"   "M5"    "M15"   "M30"   "H1"   "H4"  "D1"   "W1"   "MN1";
          //---
          double TPX_PriceDistance_Target_Start   ;//= -1;
          double TPX_PriceDistance_Target_One     ;//= -1;
          double TPX_PriceDistance_Target_Two     ;//= -1;
          double TPX_PriceDistance_Target_Three   ;//= -1;
          //
          bool   TFSDirectionDOWN               ;//= false;
          //
};

struct Sgtd_Fivo_Expantion__Periods_Levels
{

          Sgtd_Fivo_Expantion_Levels _CURRENT;
          Sgtd_Fivo_Expantion_Levels _MN1;
          Sgtd_Fivo_Expantion_Levels _W1;
          Sgtd_Fivo_Expantion_Levels _H4;
          Sgtd_Fivo_Expantion_Levels _H1;
          Sgtd_Fivo_Expantion_Levels _D1;
          Sgtd_Fivo_Expantion_Levels _M30;
          Sgtd_Fivo_Expantion_Levels _M15;
          Sgtd_Fivo_Expantion_Levels _M5;
          Sgtd_Fivo_Expantion_Levels _M1;

};
//+------------------------------------------------------------------+

struct Std_GoldVip_period_data
{         double         PriceCordinateOne;
          datetime       TimeCordinateOne;

          double         PriceCordinateTwo;
          datetime       TimeCordinateTwo;

          datetime       TimeCordinateThree;
          double         PriceCordinateThree;
          //---------------------------------------------------
          color          Text050_TP1Color;   //=clrWhite//
          string         Text050_TP1Desc;
          double         Tp1Value;
          bool           Is_TP1_Achived;

          color          Text050_TP2Color;
          string         Text050_TP2Desc;
          double         Tp2Value;
          bool           Is_TP2_Achived;

          color          Text050_TP3Color;
          string         Text050_TP3Desc;
          double         Tp3Value;
          bool           Is_TP3_Achived;


};
struct Std_GoldVip_period
{         Std_GoldVip_period_data  _CURRENT;
          Std_GoldVip_period_data  _MN1;
          Std_GoldVip_period_data  _W1;
          Std_GoldVip_period_data  _D1;
          Std_GoldVip_period_data  _H4;
          Std_GoldVip_period_data  _H1;
          Std_GoldVip_period_data  _M30;
          Std_GoldVip_period_data  _M15;
          Std_GoldVip_period_data  _M5;
          Std_GoldVip_period_data  _M1;

          void Std_GoldVip_period();
          void Set(Std_GoldVip_period_data &data)
          {         data.PriceCordinateOne      = -1;
                    data.TimeCordinateOne       = -1;
                    //
                    data.PriceCordinateTwo      = -1;
                    data.TimeCordinateTwo       = -1;
                    //
                    data.PriceCordinateThree    = -1;
                    data.TimeCordinateThree     = -1;
                    //
                    data.Text050_TP1Color       = clrWhite;
                    data.Text050_TP1Desc        = "++++";
                    //
                    data.Text050_TP2Color       = clrWhite;
                    data.Text050_TP1Desc        = "++++";
                    //
                    data.Text050_TP3Color       = clrWhite;
                    data.Text050_TP1Desc        = "++++";
                    //
          };

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Std_GoldVip_period::Std_GoldVip_period()
{         Set(_CURRENT);
          Set(_MN1);
          Set(_W1);
          Set(_D1);
          Set(_H4);
          Set(_H1);
          Set(_M30);
          Set(_M15);
          Set(_M1);
//
}
//+------------------------------------------------------------------+

enum E_SignalPeriods
{         Mainly = 0,
          Daily = 1,
          Hour4 = 4,///"4Hour" Not accepted just int need"
          Min30 = 30,
          Min5 = 5 //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Std_GoldVIP_Signals
{         void Std_GoldVIP_Signals();
          void ~Std_GoldVIP_Signals() {};
public://data members //---Period_X_
          string  TimePeriodDesc               ;//= "4Hour";
          string  DateCalculatingDesc          ;//= "2021-03-07";
          string  ProfitPipDesc                ;//= "+1730pip";
          string  R4ValueDesc                  ;//= "1977";
          string  R2ValueDesc                  ;//= "1807";
          string  PPValueDesc                  ;//= "1720";
          string  S2ValueDesc                  ;//= "1635";
          string  S4ValueDesc                  ;//= "1460";
          //------
          double  TP1ValueCalc                 ;//= 1;               //= TechnicalO.Price3Level04_0618_adjust;
          double  TP2ValueCalc                 ;//= 1;               //= TechnicalO.Price3Level07_1000_adjust;
          double  TP3ValueCalc                 ;// = 1;            // = TechnicalO.Price3Level11_1618_adjust;
          string  TP1ValueDesc                 ;//= "TP1Value:-1";
          string  TP2ValueDesc                 ;//= "TP2Value:-1";
          string  TP3ValueDesc                 ;//= "TP3Value:-1";
          //------
          double  TP1PercentValueCalc          ;// = 0;
          double  TP2PercentValueCalc          ;// = 0;
          double  TP3PercentValueCalc          ;// = 0;
          string  TP1PercentValueDesc          ;//= "TP1ValuePercent:-1";
          string  TP2PercentValueDesc          ;//= "TP1ValuePercent:-1";
          string  TP3PercentValueDesc          ;//= "TP3ValuePercent:-1";
          //---
          string  TP1ValueDictanceDesc         ;//= "TP1ValueDictance:-1";
          string  TP2ValueDictanceDesc         ;//= "TP2ValueDictance:-1";
          string  TP3ValueDictanceDesc         ;//= "TP3ValueDictance:-1";
          //---
          string  Trade_Type_Desc              ;//= "Trade_Type_Desc:Stop";
          string  StartPriceDesc               ;//= "StartPriceDesc:-1";
          string  StartTimeDesc                ;//= "StartTimeDesc:-1";//"1460";
          string  EndTimeDesc                  ;//= "EndTimeDesc:-1";//"21-03-19";
          //---
          string  StopLossValueDictanceDesc    ;//= "StopLossValueDictanceDesc:-1";
          string  StopLossValueDesc            ;//= "StopLossValueDesc:-1";
          //-------------
          double  StartPriceCalc               ;//= 1;
          int     StopLossValueDictanceCalc    ;//= (int)MathAbs(S.StartPriceCalc - StopLossValueCalc);
          double  StopLossValueCalc            ;//= 1;
          int     pipValue                     ;//= 10;
          //--------------------------------------------
          bool    IsBulish;
          bool    IsTp1Achived;
          bool    IsTp2Achived;
          bool    IsTp3Achived;
          //--------------------------------------------


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Std_GoldVIP_Signals::Std_GoldVIP_Signals()
{         RunCallFunction++;
// ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //Alert("Ctd_GoldVIP_Signals_Periods::Ctd_GoldVIP_Signals_Periods()");
          //=================================================================================================PeriodCurrent_
          TimePeriodDesc               = "TimePeriod";
          DateCalculatingDesc          = "2000-00-00";
          ProfitPipDesc                = "+0000pip";
          R4ValueDesc                  = "0000";
          R2ValueDesc                  = "0000";
          PPValueDesc                  = "0000";
          S2ValueDesc                  = "0000";
          S4ValueDesc                  = "0000";
          //---
          TP1ValueCalc                 = -1;            //= TechnicalO.Price3Level04_0618_adjust;
          TP2ValueCalc                 = -1;            //= TechnicalO.Price3Level07_1000_adjust;
          TP3ValueCalc                 = -1;            //= TechnicalO.Price3Level11_1618_adjust;
          TP1ValueDesc                 = "TP1Value:-1";
          TP2ValueDesc                 = "TP2Value:-1";
          TP3ValueDesc                 = "TP3Value:-1";
          //------
          TP1PercentValueCalc          = -1;
          TP2PercentValueCalc          = -1;
          TP3PercentValueCalc          = -1;
          TP1PercentValueDesc          = "TP1ValuePercent:-1";
          TP2PercentValueDesc          = "TP1ValuePercent:-1";
          TP3PercentValueDesc          = "TP3ValuePercent:-1";
          //---
          TP1ValueDictanceDesc         = "TP1ValueDictance:-1";
          TP2ValueDictanceDesc         = "TP2ValueDictance:-1";
          TP3ValueDictanceDesc         = "TP3ValueDictance:-1";
          //---
          Trade_Type_Desc              = "SetTypeDesc:Stop";
          StartPriceDesc               = "StartPriceDesc:-1";
          StartTimeDesc                = "StartTimeDesc:-1";//"1460";
          EndTimeDesc                  = "EndTimeDesc:-1";//"21-03-19";
          //---
          StopLossValueDictanceDesc    = "StopLossValueDictanceDesc:-1";
          StopLossValueDesc            = "StopLossValueDesc:-1";
          //-------------
          StartPriceCalc               = -1;
          StopLossValueDictanceCalc    = -1;                     //(int)MathAbs(S.StartPriceCalc - StopLossValueCalc);
          StopLossValueCalc            = -1;
          pipValue                     = 10;
          //---
          IsBulish                     = false; //
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ctd_GoldVIP_Signals_Periods
{
private:

public:
          Ctd_GoldVIP_Signals_Periods();
          ~Ctd_GoldVIP_Signals_Periods();
          void  Update();
          //---
          Std_GoldVIP_Signals Period_X_;

          Std_GoldVIP_Signals _CURRENT;
          Std_GoldVIP_Signals _MN1;

          Std_GoldVIP_Signals _W1;
          Std_GoldVIP_Signals _D1;
          Std_GoldVIP_Signals _H4;
          Std_GoldVIP_Signals _H1;

          Std_GoldVIP_Signals _M30;
          Std_GoldVIP_Signals _M15;
          Std_GoldVIP_Signals _M5;
          Std_GoldVIP_Signals _M1;
          //---

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ctd_GoldVIP_Signals_Periods::Ctd_GoldVIP_Signals_Periods()
{         RunCallFunction++;
// ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //Alert("Ctd_GoldVIP_Signals_Periods::Ctd_GoldVIP_Signals_Periods()");
          //=================================================================================================PeriodCurrent_
          //=================================================================================================Period5Min_
          ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
Ctd_GoldVIP_Signals_Periods::~Ctd_GoldVIP_Signals_Periods()
{         if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ctd_GoldVIP_Signals_Periods::Update()
{         int total = SignalBaseTotal();//--- get total amount of signals in the terminal
          for(int i = 0; i < total; i++)//--- select the signal by index//--- process all signals
          {         if(SignalBaseSelect(i))//--- get signal properties
                    {         long      id         = SignalBaseGetInteger(SIGNAL_BASE_ID);         // signal id
                              long      pips       = SignalBaseGetInteger(SIGNAL_BASE_PIPS);       // profit in pips
                              long      subscr     = SignalBaseGetInteger(SIGNAL_BASE_SUBSCRIBERS); // number of subscribers
                              string    name       = SignalBaseGetString(SIGNAL_BASE_NAME);        // signal name
                              double    price      = SignalBaseGetDouble(SIGNAL_BASE_PRICE);       // signal price
                              string    curr       = SignalBaseGetString(SIGNAL_BASE_CURRENCY);    // signal currency
                              if(price == 0.0 && pips > 0 && subscr > 0)
                              {         //PrintFormat("id=%d, name=\"%s\", currency=%s, pips=%d, subscribers=%d", id, name, curr, pips, subscr); //  //--- print all profitable free signals with subscribers
                              } }
                    else
                    {         //PrintFormat("Error in call of SignalBaseSelect. Error code=%d", GetLastError());//
                    }//
          } //
}

//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//
struct Sgtd_TPX_All_PriceCalc
{

          bool   _TFS_DirectionDOWN       ;//   = false;
          //---
          double _ValueCalc           ;//= -1;
          string _ValueDesc           ;//= "";
          double _PercentValueCalc    ;//= -1;
          string _PercentValueDesc    ;//= "";
          //---
          double _PriceDistance_Target_One ;//= -1;
          string _ValueDictance_Desc   ;//= "";
          color  _Text050_Color       ;//= clrNONE; //
          double _ValueCalc_TrendGo    ;//= -1;
          double _ValueCalc_TrendBack  ;//= -1;

          double _TFS_StopLoss_ValueCalc   ;//= -1;
          double _ValueCalc_TrendBack2 ;//= -1;
          double _ValueCalc_TrendGo2   ;//= -1;

          string _TFS_StopLoss_ValueDesc   ;//= "";
          int    _TFS_StopLoss_Value_DictanceCalc ;//= -1;
          string _TFS_StopLoss_Value_DictanceDesc ;//= "";

          int    _pipValue                  ;//= -1;

          double _TFS_StartPrice_Calc            ;//= -1;
          double _TFS_Price_CordinateThree    ;//= -1;
          double _TFS_CloseX                    ;//= iClose(NULL, PeriodTMCom, 0); //

          double _ValueCalc_CPrice_Cordinate_Three ;//= -1;
          //---
          string _StartPrice_Desc            ;//  = "";
          //---

          color  _SignalFaile_Color               ;//= clrBlack;
          color  _SignalGoing_Color               ;//= clrOrange;
          color  _SignalAchived_Color             ;//= clrYellowGreen;
          color  _SignalGapHistoty_Color          ;//= clrGoldenrod;//clrYellowGreen;///clrGoldenrod;
          color  _TFS_SignalDefault_Color              ;//= clrPink; //
          //---
          //---

          int    _Set__Mode                 ;//= -1;//
          double _ValueCalc_Safe       ;//= -1; //
          double _GetValue            ;//= -1; //
          //---
          //---
          //---
          //-----------------------------------------------------
          datetime _TFS_Time_CordinateOne     ;//= -1;
          double   _TFS_Price_CordinateOne    ;//= -1;
          datetime _TFS_Time_CordinateTwo     ;//= -1;
          double   _TFS_Price_CordinateTwo    ;//= -1;
          datetime _TFS_Time_CordinateThree   ;//= -1;
          //double   _TFS_Price_CordinateThree  ;//= -1; //
          //-----------------------------------------------------
          double   _CloseValue                     ;//= -1;//
          bool     _BoxIn_ValueCalc_UPTrend    ;//= false;
          bool     _BoxOut_ValueCalc_UPTrend   ;//= false;
          bool     _BoxIn_ValueCalc_DOWNTrend  ;//= false;
          bool     _BoxOut_ValueCalc_DOWNTrend ;//= false;
          //---------------
          bool     _Is_TPXValueCalc_DOWNTrend_Achived ;//= false;
          bool     _Is_TPXValueCalc_UPTrend_Achived   ;//= false;
          //---
          //+------------------------------------------------------------------+
          //|     percent                                                      |
          //+------------------------------------------------------------------+
          double   _TFS_TPXValue_Calc                                ;//= -1;
          double   _TFS_PercentValue_Calc                            ;//= -1;
          double   _TFS_PercentValue_CalcSafe                        ;//= -1;
//-----------------------------------
//bool   TFSBoxSwitchIN = false;??>>>exporting out block
//bool   TFSBoxSwitchOUT = false;//>>not achived ...Nooo Need//
///bool   TFSBoxInTPXValueCalc_BoxInUPTrend              = false;//// ...Nooo Need// by dive the Direction
//-----------------------------------
//-----------------
          double _TFS_RangeTarget_StartPrice                       ;//= -1; // MathAbs(GoldVIP.Signals_Periods.Period_Current.StartPriceCalc - C_STATICSUN::CPriceCordinateThree_PERIOD_CURRENT );
          double _TFS_TPXRange_Target                              ;//= -1; // MathAbs(GoldVIP.Signals_Periods.Period_Current.TP1ValueCalc - C_STATICSUN::CPriceCordinateThree_PERIOD_CURRENT );
          double _RangeProgressed                                 ;//= -1; //MathAbs(_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow - C_STATICSUN::CPriceCordinateThree_PERIOD_CURRENT);
          double _RangeProgressd_UPTrend                          ;//= -1; //MathAbs(_Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh - TFSCPriceCordinateThree);
          double _RangeProgressed_DOWNTrend                        ;//= -1; //MathAbs(_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow   - TFSCPriceCordinateThree);
          double _Achivment_StartPrice_Percent                     ;//= -1; //(_TFS_RangeTarget_StartPrice / _RangeProgressed) * 100;
          double _Achivment_Percent_TFSTPX                        ;//= -1; //(RangeTargetTP1 / _RangeProgressed) * 100;
//-----------
          bool   _Touched_StartPrice_TFS_ByRange                  ;//= false;//
          bool   _Touched_StartPrice_TFS_DOWNTrend_ByRange         ;//= false;// _RangeProgressed > _TFS_RangeTarget_StartPrice;
          bool   _Touched_StartPrice_TFS_UPTrend_ByRange           ;//= false;//
//-----------
          bool   _Touched_StartPrice_DOWNTrend_ByiLowest           ;//= false;//
          bool   _Touched_StartPrice_DOWNTrend_ByiHighest          ;//= false;//
          bool   _Touched_StartPrice_UPTrend_ByiLowest             ;//= false;//
          bool   _Touched_StartPrice_UPTrend_ByiHighest            ;//= false;//
//-------
          bool   _Touched_Target_TFS_ByRange                      ;//= false;// _RangeProgressed > RangeTargetTP1;
          bool   _Touched_Target_TFS_UPTrend_ByRange               ;//= false;//
          bool   _Touched_Target_TFS_DOWNTrend_ByRange             ;//= false;//
          //+------------------------------------------------------------------+
          //|      Desc                                                            |
          //+------------------------------------------------------------------+
          //bool   _TFS_DirectionDOWN                    ;//= false;
          //double _ValueCalc                        ;//= -1;
          //string _ValueDesc                        ;//= "";
          //double _PercentValueCalc                 ;//= -1;
          //string _PercentValueDesc                 ;//= "";
          double _TFS_PriceDistance_TargetTPX      ;//= -1;
          double _TPX_ValueDictance_Value          ;//= -1;
          //string _ValueDictance_Desc               ;//= "";
          //color  _Text050_Color                    ;//= clrNONE; //
};//
struct Sfd_SetLabels
{         //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          int                   MoveX                   ;//= LinesCycles .DiffDictanceCycle;//
//=====================
          double                PriceLevel618           ;//= 0;
          int                   BarSizeTime             ;//= Period() * 60;
///    iBarShift()//by Time  MoveX
          int                   IndependMove            ;//= (MoveX * BarSizeTime);///we need for target cordinate of labels
//============================
          datetime              CTimeCordinateThree_TFS ;//= -1;
          datetime              CTimeCordinateOne       ;//= -1;
          double                CPriceCordinateOne      ;//= -1;
          datetime              CTimeCordinateTwo       ;//= -1;
          double                CPriceCordinateTwo      ;//= -1;
          bool                  _TFS_DirectionDOWN ;//= false;
          double                TPX_LEVELPrice3         ;//= -1;
          string                LabelOneName            ;//= "";
          int                   x01                     ;//= -1;//TOOLS.ChartTimePriceConvertToXY(FuncCom + __FUNCTION__, CTimeCordinateTwo,  Price3Level04_0618_adjust, x01, y01);
          int                   y01                     ;//= -1;// Alert( "x01: ", x01, " ---y01: ", y01 );
          double                YY_061                  ;//= -1;//YY_061 = Price3Level04_0618_adjust;
          datetime              XX_061                  ;//= -1;
          string                LabelTwoName            ;//= "";
          int                   x02                     ;//= -1;
          int                   y02                     ;//= -1;//TOOLS.ChartTimePriceConvertToXY(FuncCom + __FUNCTION__, CTimeCordinateTwo, Price3Level07_1000_adjust, x02, y02 );
          double                YY_100                  ;//= -1;
          datetime              XX_100                  ;//= -1; //TOOLS.ChartTimePriceConvertToXY(FuncCom + __FUNCTION__, CTimeCordinateTwo, Price3Level21_1000_adjust, x02, y02 );
          string                LabelThereName          ;//= "";
          int                   x03                     ;//= -1;
          int                   y03                     ;//= -1;//TOOLS.ChartTimePriceConvertToXY(FuncCom + __FUNCTION__, CTimeCordinateTwo, Price3Level11_1618_adjust, x03, y03 );
          double                YY_161                  ;//= -1;
          datetime              XX_161                  ;//= -1;//YY_161 = Price3Level11_1618_adjust;
          string                LabelForeName           ;//= "";
          int                   x01_032                 ;//= -1;
          int                   y01_032                 ;//= -1;//TOOLS.ChartTimePriceConvertToXY(FuncCom + __FUNCTION__, CTimeCordinateTwo,  Price3Level02_0328_adjust, x01_032, y01_032);
          double                YY_032                  ;//= -1;  // Alert( "x01: ", x01, " ---y01: ", y01 );
          datetime              XX_032                  ;//= -1;//YY_032 = Price3Level02_0328_adjust;
          int                   ChangeYDesc             ;//= 10;//
          int                   FontSizeDesc            ;//= -4;//
//====================
          int                   ChangeYTrend            ;//= 3;
          int                   Width                   ;//= 1;
          color                 DescColor               ;//= clrYellow;
          bool                  Rayed                   ;//= false;
          ENUM_LINE_STYLE       Style                   ;//= STYLE_DASHDOTDOT;


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct S_GoldVipDesc_Calc_Data
{         int                   __Data_TFS_Bar_CordinateThree                     ;//= iBarShift(NULL, PeriodTMCom, C_STATICSUN::CTimeCordinateThree_PERIOD_CURRENT ); ///
          double                __Data_TFS_Bar_CordinateThree__ClosePrice          ;//= iClose(NULL, PeriodTMCom, _Data.__Data_TFS_Bar_CordinateThree ); ///
          //==========================================================================
          int                   __Data_TFS_Bar_CordinateOne                       ;//= iBarShift(NULL, PeriodTMCom, C_STATICSUN::CTimeCordinateOne_PERIOD_CURRENT ); ///
          //==========================================================================_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow
          int                   __Data_TFS_Bar_CordinateThree_iLowest_BarX        ;//= iLowest(NULL, PeriodTMCom, MODE_LOW, _Data.__Data_TFS_Bar_CordinateThree, 0);
          double                __Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow   ;//= iLow(NULL, PeriodTMCom, _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX );
          //==========================================================================
          int                   __Data_TFS_Bar_CordinateThree_iHighest_BarX       ;//= iHighest(NULL, PeriodTMCom, MODE_LOW, _Data.__Data_TFS_Bar_CordinateThree, 0);
          double                __Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh ;//= iHigh(NULL, PeriodTMCom, _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX );
          //==========================================================================
          //bool                  _Data.__Data_BoxIn_CTime_CordinateOne_BoxOut_UPTrend      ;//= !(_Data.__Data_CloseUnder_TFS_Bar_CordinateOnePrice && _Data.__Data_BoxOut_UPTrend);
          //bool                  _Data.__Data_BoxOutCTime_CordinateOne_BoxOut_UPTrend     ;//= !(_Data.__Data_CloseUPer_TFS_Bar_CordinateOnePrice && _Data.__Data_BoxOut_UPTrend);
          //==========================================================================
          bool                  __Data_BoxIn_Point_3                      ;//== false; //  _Data.__Data_CloseUnder_Point3;//
          bool                  __Data_BoxOut_Point_3                      ;//== false; //  _Data.__Data_CloseUnder_Point3;//
          //==========================================================================
          bool                  __Data_TP1_DOWNTrend_Achived              ;//== false; // _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow < GoldVIP.Signals_Periods.Period_Current.TP1ValueCalc;
          bool                  __Data_TP2_DOWNTrend_Achived              ;//== false; // _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow < GoldVIP.Signals_Periods.Period_Current.TP2ValueCalc;
          bool                  __Data_TP3_DOWNTrend_Achived              ;//== false; // _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow < GoldVIP.Signals_Periods.Period_Current.TP3ValueCalc;
          //==========================================================================
          bool                  __Data_TP1_UPTrend_Achived                ;//== false; // !(_Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh < GoldVIP.Signals_Periods.Period_Current.TP1ValueCalc);/////Do Smart/// before DOWNTrend///a cross DOWNTrend TP1
          bool                  __Data_TP2_UPTrend_Achived                ;//== false; // !(_Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh < GoldVIP.Signals_Periods.Period_Current.TP2ValueCalc);/////Do Smart/// before DOWNTrend///a cross DOWNTrend TP1
          bool                  __Data_TP3_UPTrend_Achived                ;//== false; // !(_Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh < GoldVIP.Signals_Periods.Period_Current.TP3ValueCalc);/////Do Smart/// before DOWNTrend///a cross DOWNTrend TP1
          //==========================================================================
          bool                  __Data_CloseUnder_TFS_Bar_CordinateOnePrice         ;//== false; //   Close[0] < _Data.__Data__Data.__Data_TFS_Bar_CordinateOnePrice;////////////////////////////////-------------*---
          bool                  __Data_CloseUPer_TFS_Bar_CordinateOnePrice          ;//== false; //   Close[0] > _Data.__Data__Data.__Data_TFS_Bar_CordinateOnePrice;////////////////////////////////--*--------------
          bool                  __Data_BoxIn_UPTrend                                  ;//== false; // !(_Data.__Data_CloseUnder_Point3);/////Do Smart/// before DOWNTrend///a cross DOWNTrend
          bool                  __Data_BoxOut_UPTrend                                 ;//== false; // !(_Data.__Data_CloseUPer_Point3);/////Do Smart/// before DOWNTrend///not a cross DOWNTrend
          bool                  __Data_BoxInCTime_CordinateOne_BoxOut_DOWNTrend         ;//== false; //   _Data.__Data_CloseUnder_TFS_Bar_CordinateOnePrice && BoxOutDOWNTrend;//--------*--------///Still in fibo
          bool                  __Data_BoxOutCTime_CordinateOne_BoxOut_DOWNTrend        ;//== false; //   _Data.__Data_CloseUPer_TFS_Bar_CordinateOnePrice && BoxOutDOWNTrend;///------*-----*----///get out from fibo ok//
          bool                  __Data_BoxIn_FiboExtention_Point1_UPTrend               ;//== false; //    _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh < _Data.__Data__Data.__Data_TFS_Bar_CordinateOnePrice;//Close[0]-------------*--
          bool                  __Data_BoxOut_FiboExtention_Point1_UPTrend              ;//== false; //    _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh > _Data.__Data__Data.__Data_TFS_Bar_CordinateOnePrice;//Close[0]-------------*--
          bool                  __Data_BoxIn_FiboExtention_Point1_DOWNTrend             ;//== false; //    _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh < _Data.__Data__Data.__Data_TFS_Bar_CordinateOnePrice;//Close[0]-------------*--
          bool                  __Data_BoxOut_FiboExtention_Point1_DOWNTrend            ;//== false; //    _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh > _Data.__Data__Data.__Data_TFS_Bar_CordinateOnePrice;//Close[0]-------------*--
          //==========================================================================
          bool                  __Data_Lowest_Pick_UPer_TPX                             ;//== false; //  = _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow   > _ValueCalc;
          bool                  __Data_Highest_Pick_UPer_TPX                            ;//== false; //  = _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh > _ValueCalc;
          bool                  __Data_BoxIn_Point_3DOWNTrend             ;//== false; //
          bool                  __Data_BoxOut_Point_3DOWNTrend            ;//== false; //
          bool                  __Data_BoxIn_Point_3UPTrend               ;//== false; //
          bool                  __Data_BoxOut_Point_3UPTrend              ;//== false; //
          //==========================================================================
          bool                  __Data_BoxIn_Point1_DOWNTrend             ;//== false; //
          bool                  __Data_BoxOut_Point1_DOWNTrend            ;//== false; //
          bool                  __Data_BoxIn_Point1_UPTrend               ;//== false; //
          bool                  __Data_BoxOut_Point1_UPTrend              ;//== false; //
          //==========================================================================
          bool                  __Data_CloseUnder_Point3                ;//== false; //Close[0] < _Data.__Data_TFS_Bar_CordinateThree__ClosePrice;//
          bool                  __Data_CloseUPer_Point3                 ;//== false; //Close[0] > _Data.__Data_TFS_Bar_CordinateThree__ClosePrice;//
          bool                  __Data_CloseUnder_Point1                ;//== false; //Close[0] < _Data.__Data_TFS_Bar_CordinateThree__ClosePrice;//
          bool                  __Data_CloseUPer_Point1                 ;//== false; //Close[0] > _Data.__Data_TFS_Bar_CordinateThree__ClosePrice;//
          //==========================================================================
          bool                  __Data_BoxIn_FiboExtention_Point1_DOWNTrend_Keep_I           ;//== false;
          bool                  __Data_BoxIn_FiboExtention_Point2_DOWNTrend_Keep_III         ;//== false;
          bool                  __Data_BoxIn_FiboExtention_Point3_DOWNTrend_Keep_II          ;//== false;
          bool                  __Data_BoxOut_FiboExtention_Point1_DOWNTrend_Break           ;//== false;
          //==========================================================================
          bool                  __Data_BoxIn_FiboExtention_Point1_UPTrend_Keep_I             ;//== false;
          bool                  __Data_BoxIn_FiboExtention_Point2_UPTrend_Keep_III           ;//== false;
          bool                  __Data_BoxIn_FiboExtention_Point3_UPTrend_Keep_II            ;//== false;
          bool                  __Data_BoxOut_FiboExtention_Point1_UPTrend_Break             ;//== false;
          //=======================================================================================Period1Min
          double                __Data_PricesLEVEL_00_0000_adjustArray[3][14][14][9];
          //==========================================================================PeriodCurrent_LEVELPrice3_TrendBack_23_1328_adjust

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class S_GoldVipDesc_Calc
{
public:
          void                                  S_GoldVipDesc_Calc();
          S_GoldVipDesc_Calc_Data               _Data ;
          Sgtd_Fivo_Expantion__Periods_Levels   Periods_Levels;   //
          bool                                  Is_LevelsSet_;

          bool    /* #A  */              Get__Panel__calculate(int WhichMode, bool IsKey, const bool Is_Show = false);

          bool    /* #AA */              Get__Create__And__Calc__(int WhichMode, bool IsKey, const bool Is_Show = false, ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT, int CalcMode = 3);
          bool    /* #AB */              Fill__Signal__Varibels(string DefinePeriodDesc = "None", ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT, E_SignalPeriods PeriodS = Mainly);

          bool    /* #AAA */             Define__Calc__Just(ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT, string UseName = "XTrading");
          void                           XTrading_Set__calc(int WhichMode, bool IsKey, const bool Is_Calculate = false,  ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT);

          void    /* #AAAB */            Define__Levels__Value(string UseName, Sgtd_Fivo_Expantion_Levels & _Levels_TPX, ENUM_TIMEFRAMES PeriodTMCom);


          void    /* #ABA */             Set___SubSignal__Header__Calc(ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT, string DefinePeriodDesc = "None");
          void    /* #ABB */             Set___SubSignal__Pivots__Calc(ENUM_TIMEFRAMES PeriodTMCom);
          void    /* #ABC */             Set___SubSignal__StartPrice__Calc(ENUM_TIMEFRAMES PeriodTMCom); ///Set_StartPriceCalc
          void    /* #ABD */             Set___SubSignal__StopLossPrice__Calc(ENUM_TIMEFRAMES PeriodTMCom); ///Set_StopLossPriceCalc
          void    /* #ABE */             Set___SubSignal__StartTime__Calc(ENUM_TIMEFRAMES PeriodTMCom); ///Set_StartTimeCalc
          void    /* #ABF */             Set___SubSignal__Reset__Desc(ENUM_TIMEFRAMES PeriodTMCom);//ResetValuesGoldVIP
          void    /* #ABG */             Set___SubSignal__TradeType__Calc(ENUM_TIMEFRAMES PeriodTMCom);
          void    /* #ABH */             Set___SubSignal__TPs_Desc_Percent_Status__Calc(ENUM_TIMEFRAMES PeriodTMCom, int TPX); //
          //==========================================================================
          void    /* #ABHA */             Set_TPXValuesNeed(ENUM_TIMEFRAMES PeriodTMCom, double TPXValueCalced, int TPX); //
          double                          GetTPXValue_function(ENUM_TIMEFRAMES PeriodTMCom, int TPX);//GetTP1Value(PeriodTMCom)
          //==========================================================================
          void                            TPX__Color__Status(ENUM_TIMEFRAMES PeriodTMCom, int TPX);//>>>OK SUPERSMART
          bool                            TFSPercentStatus(ENUM_TIMEFRAMES PeriodTMCom, int TPX, bool & TFSBoxSwitchIN);
          void                            Calc__Descs(ENUM_TIMEFRAMES PeriodTMCom, int TPX, bool & TFSBoxSwitchIN);//>>>OK SUPERSMART
          //==========================================================================
          void                            SetLabels(int WhichMode, bool IsKey, const bool Is_Calculate = false, ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT);
          void                            Set___Global__Variable( bool Is_Run = false);

          template<typename Typer1, typename Typer2, typename Typer3>                   void DefineValue__StartPrice__Calc(Typer1 & T1, Typer2 & T2, Typer3 & T3, Sgtd_TPX_All_PriceCalc  &Sgtd_TPX);
          template<typename Typer>                                                      void Set_Back__SignalValue__StartPrice__Calced(Typer & typer, Sgtd_TPX_All_PriceCalc  &Sgtd_TPX);
          //---
          template<typename Typer1, typename Typer2, typename Typer3>                   void DefineValue__StopLoss__Calc(Typer1 & T1, const Typer2 & T2, Typer3 & T3, Sgtd_TPX_All_PriceCalc  &Sgtd_TPX);
          template<typename Typer>                                                      void Set_Back__SignalValue__StopLoss__Calced(Typer & typer, Sgtd_TPX_All_PriceCalc  &Sgtd_TPX);
          //---
          template<typename Typer1, typename Typer2, typename Typer3>                   void Defines__Value__Calc(int TPX, Typer1 & T1, Typer2 & T2, Typer3 & T3);

          template<typename Typer1>                                                     void Set_Reset__Signal__Values(Typer1 & T1);
          template<typename Typer1>                                                     void Set_TPX_Start_Time(Typer1 & T1);

          template<typename Typer1, typename Typer2>                                    void Set__Direction(Typer1 & T1, Typer2 & T2);                               /* #AAAA */
          template<typename Typer1, typename Typer2, typename Typer3 >                  void Set_Back__Levels__Class__Data(Typer1 &T1, Typer2 &T2, Typer3 &T3 );               /* #AAAC *///>>>>>>>>>>>>>>>

          template<typename Typer>                                                      void Set_Signal_Header(Typer & typer, string DefinePeriodDesc);
          template<typename Typer>                                                      void Set_Back__Signal__Pivot(Typer & typer);

          template<typename Typer1, typename Typer2, typename Typer3>                   void Set_TPX_values(Typer1 & T1, Typer2 & T2, Typer3  & T3, ENUM_TIMEFRAMES PeriodTMCom);
          template<typename Typer1, typename Typer2, typename Typer3>                   void Set_TPX_TrendValues(Typer1 & T1, Typer2 & T2, Typer3 & T3, int TPX);
          template<typename Typer1, typename Typer2>                                    void Set_Signal_TPsValueCals( Typer1 & T1, Typer2 & T2, int TPX );

          template<typename Typer1, typename Typer2, typename Typer3>                   void Set_TPX_ColorStatus(Typer1 & T1, Typer2 & T2, Typer3 & T3, int TPX);
          template<typename Typer1, typename Typer2>                                    void Set_TPX_ColorStatus_Back(Typer1 & T1, Typer2 & T2, int TPX, bool RunColor);

          template<typename Typer1, typename Typer2, typename Typer3, typename Typer4>  void Set_TPX_PersentStatus(  Typer1 & T1,   Typer2 & T2,  Typer3 & T3,   Typer4 & typer4, int TPX, bool & TFSBoxSwitchIN);
          template<typename Typer1, typename Typer2>                                    void Set_SignalPersent(Typer1 & T1, Typer2 & T2, int TPX);
          template<typename Typer1, typename Typer2>                                    void Set_TPX_Desc(Typer1 & T1, Typer2 & T2);

          template<typename Typer1, typename Typer2, typename Typer3, typename Typer4>  void Set_TPX_Desc2(Typer1 & T1, Typer2 & T2, Typer3 & T3, Typer4 & typer4, int TPX);
          template<typename Typer1, typename Typer2>                                    void Set_Back__Signal__Desc(Typer1 & T1, Typer2 & T2, int TPX);
          template<typename Typer1, typename Typer2, typename Typer3, typename Typer4>  void Set_TPX_Label(Typer1 & T1, Typer2 & T2, Typer3 & T3, Typer4 & typer4);
          //==========================================================================LEVEL_Price3_adjust.Trend.ArrayValue[18]
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_GoldVipDesc_Calc::S_GoldVipDesc_Calc() {}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_GoldVipDesc_Calc::Set___SubSignal__Pivots__Calc(ENUM_TIMEFRAMES PeriodTMCom)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
          switch(PeriodTMCom)
          {         case  PERIOD_CURRENT:       { Set_Back__Signal__Pivot(GoldVIP.Signals_Periods._CURRENT); } break; //
                    case  PERIOD_MN1:           { Set_Back__Signal__Pivot(GoldVIP.Signals_Periods._MN1); } break; //
                    case  PERIOD_W1:            { Set_Back__Signal__Pivot(GoldVIP.Signals_Periods._W1); } break; //
                    case  PERIOD_D1:            { Set_Back__Signal__Pivot(GoldVIP.Signals_Periods._D1); } break; //
                    case  PERIOD_H4:            { Set_Back__Signal__Pivot(GoldVIP.Signals_Periods._H4); } break; //
                    case  PERIOD_H1:            { Set_Back__Signal__Pivot(GoldVIP.Signals_Periods._H1); } break; //
                    case  PERIOD_M30:           { Set_Back__Signal__Pivot(GoldVIP.Signals_Periods._M30); } break; //
                    case  PERIOD_M15:           { Set_Back__Signal__Pivot(GoldVIP.Signals_Periods._M15); } break; //
                    case  PERIOD_M5:            { Set_Back__Signal__Pivot(GoldVIP.Signals_Periods._M5); } break; //
                    case  PERIOD_M1:            { Set_Back__Signal__Pivot(GoldVIP.Signals_Periods._M1); } break; //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_GoldVipDesc_Calc::Set___SubSignal__Header__Calc(ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT, string DefinePeriodDesc = "None")
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
          switch(PeriodTMCom)
          {         case  PERIOD_CURRENT: {Set_Signal_Header(GoldVIP.Signals_Periods._CURRENT, DefinePeriodDesc);} break; //
                    case  PERIOD_MN1:     {Set_Signal_Header(GoldVIP.Signals_Periods._MN1,     DefinePeriodDesc);} break;     //
                    case  PERIOD_W1:      {Set_Signal_Header(GoldVIP.Signals_Periods._W1,      DefinePeriodDesc);} break;      //
                    case  PERIOD_D1:      {Set_Signal_Header(GoldVIP.Signals_Periods._D1,      DefinePeriodDesc);} break;      //
                    case  PERIOD_H4:      {Set_Signal_Header(GoldVIP.Signals_Periods._H4,      DefinePeriodDesc);} break;      //
                    case  PERIOD_H1:      {Set_Signal_Header(GoldVIP.Signals_Periods._H1,      DefinePeriodDesc);} break;      //
                    case  PERIOD_M30:     {Set_Signal_Header(GoldVIP.Signals_Periods._M30,     DefinePeriodDesc);} break;     //
                    case  PERIOD_M15:     {Set_Signal_Header(GoldVIP.Signals_Periods._M15,     DefinePeriodDesc);} break;     //
                    case  PERIOD_M5:      {Set_Signal_Header(GoldVIP.Signals_Periods._M5,      DefinePeriodDesc);} break;      //
                    case  PERIOD_M1:      {Set_Signal_Header(GoldVIP.Signals_Periods._M1,      DefinePeriodDesc);} break;      //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_GoldVipDesc_Calc::Set___SubSignal__StartPrice__Calc(ENUM_TIMEFRAMES PeriodTMCom) ///Set_StartPriceCalc
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================================================
          Sgtd_TPX_All_PriceCalc  Sgtd_TPX;
          //
          Sgtd_TPX._TFS_DirectionDOWN              = false;
          Sgtd_TPX._TFS_Price_CordinateThree       = -1; //
          Sgtd_TPX._ValueCalc                      = -1;
          Sgtd_TPX._ValueDesc                      = "";
          Sgtd_TPX._PercentValueCalc               = -1;
          Sgtd_TPX._PercentValueDesc               = "";
          Sgtd_TPX._PriceDistance_Target_One       = -1;
          Sgtd_TPX._ValueDictance_Desc             = "";
          Sgtd_TPX._Text050_Color                  = clrNONE; //
          Sgtd_TPX._ValueCalc_TrendGo              = -1;
          Sgtd_TPX._ValueCalc_TrendBack            = -1;
          Sgtd_TPX._TFS_StopLoss_ValueCalc         = -1;
          Sgtd_TPX._ValueCalc_TrendBack2           = -1;
          Sgtd_TPX._ValueCalc_TrendGo2             = -1;
          Sgtd_TPX._TFS_StopLoss_ValueDesc         = "";
          Sgtd_TPX._TFS_StopLoss_Value_DictanceCalc = -1;
          Sgtd_TPX._TFS_StopLoss_Value_DictanceDesc = "";
          Sgtd_TPX._pipValue                               = -1;
          Sgtd_TPX._TFS_StartPrice_Calc                    = -1;
          Sgtd_TPX._StartPrice_Desc                        = "";
//============================================================
          switch(PeriodTMCom)///geting to set up sgtd_TPX
          {         case  PERIOD_CURRENT:       { DefineValue__StartPrice__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._CURRENT,        Periods_Levels._CURRENT,  GoldVIP.Signals_Periods._CURRENT, Sgtd_TPX); } break;  //
                    case  PERIOD_MN1:           { DefineValue__StartPrice__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._MN1,            Periods_Levels._MN1,      GoldVIP.Signals_Periods._MN1,     Sgtd_TPX);   } break; //
                    case  PERIOD_W1:            { DefineValue__StartPrice__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._W1,             Periods_Levels._W1,       GoldVIP.Signals_Periods._W1,      Sgtd_TPX);   } break; //
                    case  PERIOD_D1:            { DefineValue__StartPrice__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._D1,             Periods_Levels._D1,       GoldVIP.Signals_Periods._D1,      Sgtd_TPX);   } break; //
                    case  PERIOD_H4:            { DefineValue__StartPrice__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._H4,             Periods_Levels._H4,       GoldVIP.Signals_Periods._H4,      Sgtd_TPX);   } break; //
                    case  PERIOD_H1:            { DefineValue__StartPrice__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._H1,             Periods_Levels._H1,       GoldVIP.Signals_Periods._H1,      Sgtd_TPX);   } break; //
                    case  PERIOD_M30:           { DefineValue__StartPrice__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._M30,            Periods_Levels._M30,      GoldVIP.Signals_Periods._M30,     Sgtd_TPX);   } break; //
                    case  PERIOD_M15:           { DefineValue__StartPrice__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._M15,            Periods_Levels._M15,      GoldVIP.Signals_Periods._M15,     Sgtd_TPX);    } break; //
                    case  PERIOD_M5:            { DefineValue__StartPrice__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._M5,             Periods_Levels._M5,       GoldVIP.Signals_Periods._M5,      Sgtd_TPX);    } break; //
                    case  PERIOD_M1:            { DefineValue__StartPrice__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._M1,             Periods_Levels._M1,       GoldVIP.Signals_Periods._M1,      Sgtd_TPX);    } break; //
          }
//============================================================//formulator
          {         if(Sgtd_TPX._TFS_DirectionDOWN)
                    {         if(Close[0] > Sgtd_TPX._ValueCalc_TrendGo)
                              {         Sgtd_TPX._TFS_StartPrice_Calc = Sgtd_TPX._TFS_Price_CordinateThree;
                                        //Alert(PeriodTMCom, "---//_TFS_StartPrice_Calc: ", _TFS_StartPrice_Calc, " = ", _TFS_Price_CordinateThree);//
                              } // Alert(StartPriceCalc, "-StartPriceCalc");}
                              else {Sgtd_TPX._TFS_StartPrice_Calc = Sgtd_TPX._ValueCalc_TrendGo;} //Alert(PeriodTMCom, "---//", _TFS_StartPrice_Calc, "=", _ValueCalc_TrendGo);} //
                    }
                    else
                    {         if(Close[0] < Sgtd_TPX._ValueCalc_TrendBack2) {Sgtd_TPX._TFS_StartPrice_Calc = Sgtd_TPX._TFS_Price_CordinateThree;}
                              else {         Sgtd_TPX._TFS_StartPrice_Calc = Sgtd_TPX._ValueCalc_TrendBack2;} //
                    }
                    //---
                    Sgtd_TPX._StartPrice_Desc = DoubleToStr(Sgtd_TPX._TFS_StartPrice_Calc, Digits); ///"1823";
                    //=================================================================StopLossValueCalc
                    //double StartPriceCalc = 1;//gone UPer block//gone Signals Class member
                    //string StartPrice = "1823";
          }
//===================================================
          switch(PeriodTMCom)///Set_ing///
          {         case  PERIOD_CURRENT:       { Set_Back__SignalValue__StartPrice__Calced(GoldVIP.Signals_Periods._CURRENT,    Sgtd_TPX); } break;
                    case  PERIOD_MN1:           { Set_Back__SignalValue__StartPrice__Calced(GoldVIP.Signals_Periods._MN1,        Sgtd_TPX); } break; //
                    case  PERIOD_W1:            { Set_Back__SignalValue__StartPrice__Calced(GoldVIP.Signals_Periods._W1,         Sgtd_TPX); } break; //
                    case  PERIOD_D1:            { Set_Back__SignalValue__StartPrice__Calced(GoldVIP.Signals_Periods._D1,         Sgtd_TPX); } break; ////
                    case  PERIOD_H4:            { Set_Back__SignalValue__StartPrice__Calced(GoldVIP.Signals_Periods._H4,         Sgtd_TPX); } break; ////.
                    case  PERIOD_H1:            { Set_Back__SignalValue__StartPrice__Calced(GoldVIP.Signals_Periods._H1,         Sgtd_TPX); } break; //
                    case  PERIOD_M30:           { Set_Back__SignalValue__StartPrice__Calced(GoldVIP.Signals_Periods._M30,        Sgtd_TPX); } break; /////
                    case  PERIOD_M15:           { Set_Back__SignalValue__StartPrice__Calced(GoldVIP.Signals_Periods._M15,        Sgtd_TPX); } break; //
                    case  PERIOD_M5:            { Set_Back__SignalValue__StartPrice__Calced(GoldVIP.Signals_Periods._M5,         Sgtd_TPX); } break; ////
                    case  PERIOD_M1:            { Set_Back__SignalValue__StartPrice__Calced(GoldVIP.Signals_Periods._M1,         Sgtd_TPX); } break; //
                              ///
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_GoldVipDesc_Calc::Set___SubSignal__StopLossPrice__Calc(ENUM_TIMEFRAMES PeriodTMCom) ///Set_StartPriceCalc
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
//============================================================
          Sgtd_TPX_All_PriceCalc  Sgtd_TPX;
          Sgtd_TPX._TFS_DirectionDOWN                      = false;
          Sgtd_TPX._ValueCalc                              = -1;
          Sgtd_TPX._ValueDesc                              = "";
          Sgtd_TPX._PercentValueCalc                       = -1;
          Sgtd_TPX._PercentValueDesc                       = "";
          Sgtd_TPX._PriceDistance_Target_One               = -1;
          Sgtd_TPX._ValueDictance_Desc                     = "";
          Sgtd_TPX._Text050_Color                          = clrNONE; //
          Sgtd_TPX._ValueCalc_TrendGo                      = -1;
          Sgtd_TPX._ValueCalc_TrendBack                    = -1;
          Sgtd_TPX._TFS_StopLoss_ValueCalc                 = -1;
          Sgtd_TPX._ValueCalc_TrendBack2                   = -1;
          Sgtd_TPX._ValueCalc_TrendGo2                     = -1;
          Sgtd_TPX._TFS_StopLoss_ValueDesc                 = "";
          Sgtd_TPX._TFS_StopLoss_Value_DictanceCalc        = -1;
          Sgtd_TPX._TFS_StopLoss_Value_DictanceDesc        = "";
          Sgtd_TPX._pipValue                               = -1;
          Sgtd_TPX._TFS_StartPrice_Calc                    = -1;
          Sgtd_TPX._TFS_Price_CordinateThree               = -1;
          Sgtd_TPX._TFS_CloseX                             = iClose(NULL, PeriodTMCom, 0); //
          Sgtd_TPX._ValueCalc_CPrice_Cordinate_Three = -1;
//============================================================
          switch(PeriodTMCom)///geting
          {         case  PERIOD_CURRENT:       { DefineValue__StopLoss__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._CURRENT, Periods_Levels._CURRENT, GoldVIP.Signals_Periods._CURRENT, Sgtd_TPX); } break; //
                    case  PERIOD_MN1:           { DefineValue__StopLoss__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._MN1,     Periods_Levels._MN1,     GoldVIP.Signals_Periods._MN1,     Sgtd_TPX); } break; //
                    case  PERIOD_W1:            { DefineValue__StopLoss__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._W1,      Periods_Levels._W1,      GoldVIP.Signals_Periods._W1,      Sgtd_TPX); } break; //
                    case  PERIOD_D1:            { DefineValue__StopLoss__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._D1,      Periods_Levels._D1,      GoldVIP.Signals_Periods._D1,      Sgtd_TPX); } break; ////
                    case  PERIOD_H4:            { DefineValue__StopLoss__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._H4,      Periods_Levels._H4,      GoldVIP.Signals_Periods._H4,      Sgtd_TPX); } break; ////
                    case  PERIOD_H1:            { DefineValue__StopLoss__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._H1,      Periods_Levels._H1,      GoldVIP.Signals_Periods._H1,      Sgtd_TPX); } break; //
                    case  PERIOD_M30:           { DefineValue__StopLoss__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._M30,     Periods_Levels._M30,     GoldVIP.Signals_Periods._M30,     Sgtd_TPX); } break; /////
                    case  PERIOD_M15:           { DefineValue__StopLoss__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._M15,     Periods_Levels._M15,     GoldVIP.Signals_Periods._M15,     Sgtd_TPX); } break; //
                    case  PERIOD_M5:            { DefineValue__StopLoss__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._M5,      Periods_Levels._M5,      GoldVIP.Signals_Periods._M5,      Sgtd_TPX); } break; ////
                    case  PERIOD_M1:            { DefineValue__StopLoss__Calc( Dev_Object_Pack.Fibos.Expansion._Periods._M1,      Periods_Levels._M1,      GoldVIP.Signals_Periods._M1,      Sgtd_TPX); } break; //
                              //
          }
          //Cat.say(Sgtd_TPX._TFS_DirectionDOWN);
          //Cat.say(Sgtd_TPX._TFS_CloseX > Sgtd_TPX._ValueCalc_TrendGo);
          //Cat.say("   " + Sgtd_TPX._ValueCalc_TrendBack);
          //Cat.say("   " + Sgtd_TPX._TFS_StopLoss_ValueCalc);
          //[---Formulator---]
          {         if(Sgtd_TPX._TFS_DirectionDOWN)
                    {         if(Sgtd_TPX._TFS_CloseX > Sgtd_TPX._ValueCalc_TrendGo) {Sgtd_TPX._TFS_StopLoss_ValueCalc = Sgtd_TPX._ValueCalc_TrendBack;}
                              else                                                             {Sgtd_TPX._TFS_StopLoss_ValueCalc = Sgtd_TPX._ValueCalc_CPrice_Cordinate_Three;} //
                    }
                    else
                    {         if(Sgtd_TPX._TFS_CloseX < Sgtd_TPX._ValueCalc_TrendBack2) {Sgtd_TPX._TFS_StopLoss_ValueCalc = Sgtd_TPX._ValueCalc_TrendGo2;}
                              else                                                                {Sgtd_TPX._TFS_StopLoss_ValueCalc = Sgtd_TPX._TFS_Price_CordinateThree;}  //
                    }
                    //---
                    Sgtd_TPX._TFS_StopLoss_ValueDesc          = DoubleToStr( Sgtd_TPX._TFS_StopLoss_ValueCalc, Digits); //"1875";
                    Sgtd_TPX._TFS_StopLoss_Value_DictanceCalc = (int)MathAbs(Sgtd_TPX._TFS_StartPrice_Calc - Sgtd_TPX._TFS_StopLoss_ValueCalc);
                    //int pipValue = 10;
                    Sgtd_TPX._TFS_StopLoss_Value_DictanceDesc = "-" + DoubleToStr(Sgtd_TPX._TFS_StopLoss_Value_DictanceCalc * Sgtd_TPX._pipValue, 0) + "pip"; //// "-" + "520" + "pip";
                    //Cat.say("    " + Sgtd_TPX._TFS_StopLoss_Value_DictanceDesc);
                    //=================================================================StopLossValueCalc
          }
//===================================================
          switch(PeriodTMCom)///Set_ing///
          {         case  PERIOD_CURRENT:       { Set_Back__SignalValue__StopLoss__Calced(GoldVIP.Signals_Periods._CURRENT,    Sgtd_TPX);     } break; //
                    case  PERIOD_MN1:           { Set_Back__SignalValue__StopLoss__Calced(GoldVIP.Signals_Periods._MN1,        Sgtd_TPX);     } break; //
                    case  PERIOD_W1:            { Set_Back__SignalValue__StopLoss__Calced(GoldVIP.Signals_Periods._W1,         Sgtd_TPX);     } break; //
                    case  PERIOD_D1:            { Set_Back__SignalValue__StopLoss__Calced(GoldVIP.Signals_Periods._D1,         Sgtd_TPX);     } break; ////
                    case  PERIOD_H4:            { Set_Back__SignalValue__StopLoss__Calced(GoldVIP.Signals_Periods._H4,         Sgtd_TPX);     } break; ////
                    case  PERIOD_H1:            { Set_Back__SignalValue__StopLoss__Calced(GoldVIP.Signals_Periods._H1,         Sgtd_TPX);     } break; //
                    case  PERIOD_M30:           { Set_Back__SignalValue__StopLoss__Calced(GoldVIP.Signals_Periods._M30,        Sgtd_TPX);     } break; /////
                    case  PERIOD_M15:           { Set_Back__SignalValue__StopLoss__Calced(GoldVIP.Signals_Periods._M15,        Sgtd_TPX);     } break; //
                    case  PERIOD_M5:            { Set_Back__SignalValue__StopLoss__Calced(GoldVIP.Signals_Periods._M5,         Sgtd_TPX);     } break; ////
                    case  PERIOD_M1:            { Set_Back__SignalValue__StopLoss__Calced(GoldVIP.Signals_Periods._M1,         Sgtd_TPX);     } break; //
                              ///
          }//
//===================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
static void S_GoldVipDesc_Calc::Set___SubSignal__StartTime__Calc(ENUM_TIMEFRAMES PeriodTMCom)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
          switch(PeriodTMCom)
          {         case  PERIOD_CURRENT:       { Set_TPX_Start_Time(GoldVIP.Signals_Periods._CURRENT); } break; //
                    case  PERIOD_MN1:           { Set_TPX_Start_Time(GoldVIP.Signals_Periods._MN1);     } break; //
                    case  PERIOD_W1:            { Set_TPX_Start_Time(GoldVIP.Signals_Periods._W1);      } break; //
                    case  PERIOD_D1:            { Set_TPX_Start_Time(GoldVIP.Signals_Periods._D1);   } break; //
                    case  PERIOD_H4:            { Set_TPX_Start_Time(GoldVIP.Signals_Periods._H4);   } break; //
                    case  PERIOD_H1:            { Set_TPX_Start_Time(GoldVIP.Signals_Periods._H1);   } break; //
                    case  PERIOD_M30:           { Set_TPX_Start_Time(GoldVIP.Signals_Periods._M30);   } break; //
                    case  PERIOD_M15:           { Set_TPX_Start_Time(GoldVIP.Signals_Periods._M15);   } break; //
                    case  PERIOD_M5:            { Set_TPX_Start_Time(GoldVIP.Signals_Periods._M5);    } break; //
                    case  PERIOD_M1:            { Set_TPX_Start_Time(GoldVIP.Signals_Periods._M1);    } break; //
                              ///
                              //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_GoldVipDesc_Calc::Set___SubSignal__Reset__Desc(ENUM_TIMEFRAMES PeriodTMCom)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
          switch(PeriodTMCom)//seting
          {         case  PERIOD_CURRENT: { Set_Reset__Signal__Values(GoldVIP.Signals_Periods._CURRENT); } break; //
                    case  PERIOD_MN1:     { Set_Reset__Signal__Values(GoldVIP.Signals_Periods._MN1);   } break; //
                    case  PERIOD_W1:      { Set_Reset__Signal__Values(GoldVIP.Signals_Periods._W1);   } break; //
                    case  PERIOD_D1:      { Set_Reset__Signal__Values(GoldVIP.Signals_Periods._D1);   } break; //
                    case  PERIOD_H4:      { Set_Reset__Signal__Values(GoldVIP.Signals_Periods._H4);   } break; //
                    case  PERIOD_H1:      { Set_Reset__Signal__Values(GoldVIP.Signals_Periods._H1);   } break; //
                    case  PERIOD_M30:     { Set_Reset__Signal__Values(GoldVIP.Signals_Periods._M30);   } break; //
                    case  PERIOD_M15:     { Set_Reset__Signal__Values(GoldVIP.Signals_Periods._M15);   } break; //
                    case  PERIOD_M5:      { Set_Reset__Signal__Values(GoldVIP.Signals_Periods._M5);    } break; //
                    case  PERIOD_M1:      { Set_Reset__Signal__Values(GoldVIP.Signals_Periods._M1);    } break; //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
}//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_GoldVipDesc_Calc::Set___SubSignal__TPs_Desc_Percent_Status__Calc(ENUM_TIMEFRAMES PeriodTMCom, int TPX )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
          Sgtd_TPX_All_PriceCalc  Sgtd_TPX;
          Sgtd_TPX._TFS_DirectionDOWN       = false;
          Sgtd_TPX._Set__Mode                 = -1;//
          Sgtd_TPX._ValueCalc_Safe       = -1; //
          Sgtd_TPX._GetValue            = -1; //
//=====================================
//[ Calc Tps value] 1 2 3
          for (int i = 1; i < 4; i++)
          {         TPX = i;//
                    switch(PeriodTMCom)///getting
                    {         case  PERIOD_CURRENT:     { Defines__Value__Calc(TPX, GoldVIP.Signals_Periods._CURRENT,    Dev_Object_Pack.Fibos.Expansion._Periods._CURRENT,       Sgtd_TPX);  } break; //
                              case  PERIOD_MN1:         { Defines__Value__Calc(TPX, GoldVIP.Signals_Periods._MN1,        Dev_Object_Pack.Fibos.Expansion._Periods._MN1,           Sgtd_TPX);  } break; //
                              case  PERIOD_W1:          { Defines__Value__Calc(TPX, GoldVIP.Signals_Periods._W1,         Dev_Object_Pack.Fibos.Expansion._Periods._W1,            Sgtd_TPX);  } break; //
                              case  PERIOD_D1:          { Defines__Value__Calc(TPX, GoldVIP.Signals_Periods._D1,         Dev_Object_Pack.Fibos.Expansion._Periods._D1,            Sgtd_TPX);  } break; ////
                              case  PERIOD_H4:          { Defines__Value__Calc(TPX, GoldVIP.Signals_Periods._H4,         Dev_Object_Pack.Fibos.Expansion._Periods._H4,            Sgtd_TPX);  } break; ////
                              case  PERIOD_H1:          { Defines__Value__Calc(TPX, GoldVIP.Signals_Periods._H1,         Dev_Object_Pack.Fibos.Expansion._Periods._H1,            Sgtd_TPX);  } break; //
                              case  PERIOD_M30:         { Defines__Value__Calc(TPX, GoldVIP.Signals_Periods._M30,        Dev_Object_Pack.Fibos.Expansion._Periods._M30,           Sgtd_TPX);  } break; ////
                              case  PERIOD_M15:         { Defines__Value__Calc(TPX, GoldVIP.Signals_Periods._M15,        Dev_Object_Pack.Fibos.Expansion._Periods._M15,           Sgtd_TPX);  } break; //
                              case  PERIOD_M5:          { Defines__Value__Calc(TPX, GoldVIP.Signals_Periods._M5,         Dev_Object_Pack.Fibos.Expansion._Periods._M5,            Sgtd_TPX);  } break; //
                              case  PERIOD_M1:          { Defines__Value__Calc(TPX, GoldVIP.Signals_Periods._M1,         Dev_Object_Pack.Fibos.Expansion._Periods._M1,            Sgtd_TPX);  } break; ////
                    }
                    //[ formulator ]
                    {         //===============================================================================//formulator//
                              Sgtd_TPX._GetValue   = GetTPXValue_function(PeriodTMCom, Sgtd_TPX._Set__Mode);
                              //----
                              Set_TPXValuesNeed(PeriodTMCom, Sgtd_TPX._GetValue, Sgtd_TPX._Set__Mode); //; //#1//#11//DetermineMarketDirectionStatus  //#112 Condition of Price close now from _Data.__Data_TFS_Bar_CordinateThree__ClosePrice
                              //=================================================================TP2ValueCalc
                              bool TFSBoxSwitchIN = false;//
                              //================================================
                              //#113 DetermineMarketTP2ColorStatus
                              bool PercentStatusOK = TFSPercentStatus(PeriodTMCom, Sgtd_TPX._Set__Mode, TFSBoxSwitchIN);
                              //Alert("_ValueCalc_Safe: >> ", _ValueCalc_Safe,"_GetValue: >> ", _GetValue, "--PeriodTMCom: ", PeriodTMCom, "--TPX: ", TPX, "--TFSBoxSwitchIN: ", TFSBoxSwitchIN); //
                              Calc__Descs(PeriodTMCom, Sgtd_TPX._Set__Mode, TFSBoxSwitchIN); // //PeriodTMCom////#114 DetermineMarketTP1PercentStatus
                              //----
                              if(PercentStatusOK)TPX__Color__Status(PeriodTMCom, Sgtd_TPX._Set__Mode ); //PeriodTMCom
                    } //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_GoldVipDesc_Calc::Set_TPXValuesNeed(ENUM_TIMEFRAMES PeriodTMCom, double TPXValueCalced, int TPX) //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//---
          Sgtd_TPX_All_PriceCalc TPX_Calc;
          switch(PeriodTMCom)///geting
          {         case  PERIOD_CURRENT:       { Set_TPX_values(Dev_Object_Pack.Fibos.Expansion._Periods._CURRENT, GoldVIP.periods._CURRENT, TPX_Calc, PeriodTMCom); } break; //
                    case  PERIOD_MN1:           { Set_TPX_values(Dev_Object_Pack.Fibos.Expansion._Periods._MN1,     GoldVIP.periods._MN1,     TPX_Calc, PeriodTMCom); } break; //
                    case  PERIOD_W1:            { Set_TPX_values(Dev_Object_Pack.Fibos.Expansion._Periods._W1,      GoldVIP.periods._W1,      TPX_Calc, PeriodTMCom); } break; //
                    case  PERIOD_D1:            { Set_TPX_values(Dev_Object_Pack.Fibos.Expansion._Periods._D1,      GoldVIP.periods._D1,      TPX_Calc, PeriodTMCom); } break; //
                    case  PERIOD_H4:            { Set_TPX_values(Dev_Object_Pack.Fibos.Expansion._Periods._H4,      GoldVIP.periods._H4,      TPX_Calc, PeriodTMCom); } break; //
                    case  PERIOD_H1:            { Set_TPX_values(Dev_Object_Pack.Fibos.Expansion._Periods._H1,      GoldVIP.periods._H1,      TPX_Calc, PeriodTMCom); } break; //
                    case  PERIOD_M30:           { Set_TPX_values(Dev_Object_Pack.Fibos.Expansion._Periods._M30,     GoldVIP.periods._M30,     TPX_Calc, PeriodTMCom); } break; //
                    case  PERIOD_M15:           { Set_TPX_values(Dev_Object_Pack.Fibos.Expansion._Periods._M15,     GoldVIP.periods._M15,     TPX_Calc, PeriodTMCom); } break; //
                    case  PERIOD_M5:            { Set_TPX_values(Dev_Object_Pack.Fibos.Expansion._Periods._M15,     GoldVIP.periods._M5,      TPX_Calc, PeriodTMCom); } break; //
                    case  PERIOD_M1:            { Set_TPX_values(Dev_Object_Pack.Fibos.Expansion._Periods._M1,      GoldVIP.periods._M1,      TPX_Calc, PeriodTMCom); } break; //
          }
//[//safe Proccessing Const]
          {         //[Set_ing Values]
                    {         _Data.__Data_TFS_Bar_CordinateThree                            = iBarShift(NULL, PeriodTMCom, TPX_Calc._TFS_Time_CordinateThree ); ///
                              _Data.__Data_TFS_Bar_CordinateOne                              = iBarShift(NULL, PeriodTMCom, TPX_Calc._TFS_Time_CordinateOne ); ///
                              //the point cordinate >>***iClose(NULL, PERIOD_CURRENT, _Data.__Data_TFS_Bar_CordinateThree ); ///if>>DOWN trend ihigh()///if>>UP trend iLow()
                              _Data.__Data_TFS_Bar_CordinateThree__ClosePrice                 = iClose(NULL,   PeriodTMCom, _Data.__Data_TFS_Bar_CordinateThree ); ///just close not pivoter point.>>
                              _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX               = iLowest(NULL,  PeriodTMCom, MODE_LOW, _Data.__Data_TFS_Bar_CordinateThree, 0);
                              _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow          = iLow(NULL,     PeriodTMCom, _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX );//Alert("_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow: ", _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow);
                              _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX              = iHighest(NULL, PeriodTMCom, MODE_HIGH, _Data.__Data_TFS_Bar_CordinateThree, 0);//>>>why MODE_LOW?
                              _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh        = iHigh(NULL,    PeriodTMCom, _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX );//Alert("_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow: ", _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow);
                    }
                    //=================================================================
                    //[ Set_ing Keys]
                    {         _Data.__Data_Lowest_Pick_UPer_TPX                    = _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow   > TPX_Calc._ValueCalc;
                              _Data.__Data_Highest_Pick_UPer_TPX                   = _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh > TPX_Calc._ValueCalc;
                              //---
                              //---
                              //---
                              _Data.__Data_BoxIn_Point_3DOWNTrend    = ( TPX_Calc._TFS_DirectionDOWN)  && ( _Data.__Data_CloseUnder_Point3   = TPX_Calc._CloseValue <=  TPX_Calc._TFS_Price_CordinateThree); // //#112 Condition of Price close now from _Data.__Data_TFS_Bar_CordinateThree__ClosePrice
                              _Data.__Data_BoxOut_Point_3DOWNTrend   = ( TPX_Calc._TFS_DirectionDOWN)  && ( _Data.__Data_CloseUPer_Point3    = TPX_Calc._CloseValue >=  TPX_Calc._TFS_Price_CordinateThree); //
                              _Data.__Data_BoxIn_Point_3UPTrend      = (!TPX_Calc._TFS_DirectionDOWN)  && !(_Data.__Data_CloseUnder_Point3   = TPX_Calc._CloseValue <=  TPX_Calc._TFS_Price_CordinateThree);/////Do Smart/// before DOWNTrend///a cross DOWNTrend
                              _Data.__Data_BoxOut_Point_3UPTrend     = (!TPX_Calc._TFS_DirectionDOWN)  && !(_Data.__Data_CloseUPer_Point3    = TPX_Calc._CloseValue >=  TPX_Calc._TFS_Price_CordinateThree);/////Do Smart/// before DOWNTrend///not a cross DOWNTrend
                              //---
                              _Data.__Data_BoxIn_Point1_DOWNTrend    = ( TPX_Calc._TFS_DirectionDOWN)  && (_Data.__Data_CloseUnder_Point1    = TPX_Calc._CloseValue <= TPX_Calc._TFS_Price_CordinateOne);
                              _Data.__Data_BoxOut_Point1_DOWNTrend   = ( TPX_Calc._TFS_DirectionDOWN)  && (_Data.__Data_CloseUnder_Point1    = TPX_Calc._CloseValue >= TPX_Calc._TFS_Price_CordinateOne);
                              _Data.__Data_BoxIn_Point1_UPTrend      = (!TPX_Calc._TFS_DirectionDOWN)  && !(_Data.__Data_CloseUnder_Point1   = TPX_Calc._CloseValue <= TPX_Calc._TFS_Price_CordinateOne);
                              _Data.__Data_BoxOut_Point1_UPTrend     = (!TPX_Calc._TFS_DirectionDOWN)  && !(_Data.__Data_CloseUnder_Point1   = TPX_Calc._CloseValue >= TPX_Calc._TFS_Price_CordinateOne);
                              //---
                              //---
                              //---
                              _Data.__Data_BoxIn_FiboExtention_Point1_DOWNTrend_Keep_I   = (TPX_Calc._TFS_DirectionDOWN) && (_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow <= TPX_Calc._TFS_Price_CordinateOne);//Close[0]-------------*--
                              _Data.__Data_BoxIn_FiboExtention_Point2_DOWNTrend_Keep_III  = (TPX_Calc._TFS_DirectionDOWN) && (_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow <= TPX_Calc._TFS_Price_CordinateOne)     && (_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow <= TPX_Calc._TFS_Price_CordinateTwo) && (_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow <= TPX_Calc._TFS_Price_CordinateThree); //Close[0]-------------*--
                              _Data.__Data_BoxIn_FiboExtention_Point3_DOWNTrend_Keep_II   = (TPX_Calc._TFS_DirectionDOWN) && (_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow <= TPX_Calc._TFS_Price_CordinateOne)     && (_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow <= TPX_Calc._TFS_Price_CordinateThree); //Close[0]-------------*--
                              //
                              //
                              //-- The iHighest_BarX_iHigh must dive 2 distance fivo 3 point to Bar  zero... the extemum define how much keep back...
                              _Data.__Data_BoxOut_FiboExtention_Point1_DOWNTrend_Break    = ( TPX_Calc._TFS_DirectionDOWN) && (_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow   >= TPX_Calc._TFS_Price_CordinateOne); //Close[0]-------------*--
                              //---
                              _Data.__Data_BoxIn_FiboExtention_Point1_UPTrend_Keep_I      = (!TPX_Calc._TFS_DirectionDOWN) && (_Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh >= TPX_Calc._TFS_Price_CordinateOne);//Close[0]-------------*--
                              _Data.__Data_BoxIn_FiboExtention_Point2_UPTrend_Keep_III     = (!TPX_Calc._TFS_DirectionDOWN) && (_Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh >= TPX_Calc._TFS_Price_CordinateOne) && (_Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh >= TPX_Calc._TFS_Price_CordinateTwo) && (_Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh >= TPX_Calc._TFS_Price_CordinateThree); //Close[0]-------------*--
                              _Data.__Data_BoxIn_FiboExtention_Point3_UPTrend_Keep_II      = (!TPX_Calc._TFS_DirectionDOWN) && (_Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh >= TPX_Calc._TFS_Price_CordinateOne) && (_Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh >= TPX_Calc._TFS_Price_CordinateThree); //Close[0]-------------*--
                              //--- The iHighest_BarX_iHigh must dive 2 distance fivo 3 point to Bar  zero... the extemum define how much keep back...
                              _Data.__Data_BoxOut_FiboExtention_Point1_UPTrend_Break      = (!TPX_Calc._TFS_DirectionDOWN) && (_Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh <= TPX_Calc._TFS_Price_CordinateOne); //Close[0]-------------*--
                              //--- there  isnt work in UP trend i low... nether high in DOWN trend
                              //
                              //
                              //
                              TPX_Calc._BoxIn_ValueCalc_UPTrend                  = TPX_Calc._Is_TPXValueCalc_UPTrend_Achived   = _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh >= TPXValueCalced;
                              //>>off no need >>> _BoxOut_ValueCalc_UPTrend                 = _Is_TPXValueCalc_UPTrend_Achived   = _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh < TPXValueCalced;
                              //---------------
                              TPX_Calc._BoxIn_ValueCalc_DOWNTrend                = TPX_Calc._Is_TPXValueCalc_DOWNTrend_Achived = _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow <= TPXValueCalced;
                              //>>off no need >>>_BoxOut_ValueCalc_DOWNTrend               = _Is_TPXValueCalc_DOWNTrend_Achived = _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow >= TPXValueCalced;
                              //----------------------------------------------------------------------------------------------------
                              /////|------------*--|-------*---*------|
                              /////|-*-------------|---------*--------|
                              /////|-------*-------|-----*------------|///Still in fibo    /////Do Smart/// before DOWNTrend///a cross DOWNTrend CTimeCordinateOne
                              /////|----*-----*----|--------------*---|///get out from fibo/////Do Smart/// before DOWNTrend///a cross DOWNTrend CTimeCordinateOne
                    }//
                    //=================================================================
                    {         //Set_ting Conditions///
                              //=========
                    }////
          }//
//[set achivments]
          {         if(TPX == 1)
                    {         _Data.__Data_TP1_UPTrend_Achived                              = TPX_Calc._Is_TPXValueCalc_UPTrend_Achived;/////Do Smart/// before DOWNTrend///a cross DOWNTrend TP1
                              _Data.__Data_TP1_DOWNTrend_Achived                            = TPX_Calc._Is_TPXValueCalc_DOWNTrend_Achived;//
                    }
                    if(TPX == 2)
                    {         _Data.__Data_TP2_UPTrend_Achived                              = TPX_Calc._Is_TPXValueCalc_UPTrend_Achived;/////Do Smart/// before DOWNTrend///a cross DOWNTrend TP1
                              _Data.__Data_TP2_DOWNTrend_Achived                            = TPX_Calc._Is_TPXValueCalc_DOWNTrend_Achived;//
                    }
                    if(TPX == 3)
                    {         _Data.__Data_TP3_UPTrend_Achived                              = TPX_Calc._Is_TPXValueCalc_UPTrend_Achived;/////Do Smart/// before DOWNTrend///a cross DOWNTrend TP1
                              _Data.__Data_TP3_DOWNTrend_Achived                            = TPX_Calc._Is_TPXValueCalc_DOWNTrend_Achived;//
                    } //
          }
//============================//============================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double S_GoldVipDesc_Calc::GetTPXValue_function(ENUM_TIMEFRAMES PeriodTMCom, int TPX) ///GetTP1Value(PeriodTMCom)
{         //---
          Sgtd_TPX_All_PriceCalc TPX_Calc;
          switch(PeriodTMCom)////*geting values*///
          {         case  PERIOD_CURRENT:       { Set_TPX_TrendValues(Periods_Levels._CURRENT, TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._CURRENT,  TPX ); } break; //
                    case  PERIOD_MN1:           { Set_TPX_TrendValues(Periods_Levels._MN1,     TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._MN1,      TPX ); } break;     //
                    case  PERIOD_W1:            { Set_TPX_TrendValues(Periods_Levels._W1,      TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._W1,       TPX ); } break;      //
                    case  PERIOD_D1:            { Set_TPX_TrendValues(Periods_Levels._D1,      TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._D1,       TPX ); } break;      //
                    case  PERIOD_H4:            { Set_TPX_TrendValues(Periods_Levels._H4,      TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._H4,       TPX ); } break;      //
                    case  PERIOD_H1:            { Set_TPX_TrendValues(Periods_Levels._H1,      TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._H1,       TPX ); } break;      //
                    case  PERIOD_M30:           { Set_TPX_TrendValues(Periods_Levels._M30,     TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M30,      TPX ); } break;     //
                    case  PERIOD_M15:           { Set_TPX_TrendValues(Periods_Levels._M15,     TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M15,      TPX ); } break;     //
                    case  PERIOD_M5:            { Set_TPX_TrendValues(Periods_Levels._M5,      TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M5,       TPX ); } break;      //
                    case  PERIOD_M1:            { Set_TPX_TrendValues(Periods_Levels._M1,      TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M1,       TPX ); } break; //
          }
//============================================================//
          {         if(TPX_Calc._TFS_DirectionDOWN) TPX_Calc._ValueCalc =  TPX_Calc._ValueCalc_TrendGo;////must Static member or call by object of class  ///DOWNTrend
                    else                                      TPX_Calc._ValueCalc =  TPX_Calc._ValueCalc_TrendBack;////must Static member or call by object of class
          }//
//===================================================
          switch(PeriodTMCom)///*/Set_ing*////
          {         case  PERIOD_CURRENT:       {Set_Signal_TPsValueCals(GoldVIP.Signals_Periods._CURRENT, TPX_Calc, TPX );}
                    case  PERIOD_MN1:           {Set_Signal_TPsValueCals(GoldVIP.Signals_Periods._MN1,     TPX_Calc, TPX );}
                    case  PERIOD_W1:            {Set_Signal_TPsValueCals(GoldVIP.Signals_Periods._W1,      TPX_Calc, TPX );}
                    case  PERIOD_D1:            {Set_Signal_TPsValueCals(GoldVIP.Signals_Periods._D1,      TPX_Calc, TPX );}
                    case  PERIOD_H4:            {Set_Signal_TPsValueCals(GoldVIP.Signals_Periods._H4,      TPX_Calc, TPX );}
                    case  PERIOD_H1:            {Set_Signal_TPsValueCals(GoldVIP.Signals_Periods._H1,      TPX_Calc, TPX );}
                    case  PERIOD_M30:           {Set_Signal_TPsValueCals(GoldVIP.Signals_Periods._M30,     TPX_Calc, TPX );}
                    case  PERIOD_M15:           {Set_Signal_TPsValueCals(GoldVIP.Signals_Periods._M15,     TPX_Calc, TPX );}
                    case  PERIOD_M5:            {Set_Signal_TPsValueCals(GoldVIP.Signals_Periods._M5,      TPX_Calc, TPX );}
                    case  PERIOD_M1:            {Set_Signal_TPsValueCals(GoldVIP.Signals_Periods._M1,      TPX_Calc, TPX );}//
          } //
//===================================================
          return TPX_Calc._ValueCalc; //
} //

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_GoldVipDesc_Calc::TPX__Color__Status(ENUM_TIMEFRAMES PeriodTMCom, int TPX)
{
//============================================================
          Sgtd_TPX_All_PriceCalc TPX_Calc;
          TPX_Calc._TFS_DirectionDOWN                 = false;
          TPX_Calc._ValueCalc                     = -1;
          TPX_Calc._Text050_Color                 = clrWhite; //clrNONE
          TPX_Calc._PercentValueCalc              = -1;
          TPX_Calc._SignalFaile_Color             = clrBlack;
          TPX_Calc._SignalGoing_Color             = clrOrange;
          TPX_Calc._SignalAchived_Color           = clrYellowGreen;
          TPX_Calc._SignalGapHistoty_Color        = clrGoldenrod;//clrYellowGreen;///clrGoldenrod;
          TPX_Calc._TFS_SignalDefault_Color       = clrPink; //
//============================================================
          switch(PeriodTMCom)///geting
          {         case  PERIOD_CURRENT:       { Set_TPX_ColorStatus(GoldVIP.Signals_Periods._CURRENT,       TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._CURRENT,    TPX);}
                    case  PERIOD_MN1:           { Set_TPX_ColorStatus(GoldVIP.Signals_Periods._MN1,           TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._MN1,        TPX);}
                    case  PERIOD_W1:            { Set_TPX_ColorStatus(GoldVIP.Signals_Periods._W1,            TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._W1,         TPX);}
                    case  PERIOD_D1:            { Set_TPX_ColorStatus(GoldVIP.Signals_Periods._D1,            TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._D1,         TPX);}
                    case  PERIOD_H4:            { Set_TPX_ColorStatus(GoldVIP.Signals_Periods._H4,            TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._H4,         TPX);}
                    case  PERIOD_H1:            { Set_TPX_ColorStatus(GoldVIP.Signals_Periods._H1,            TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._H1,         TPX);}
                    case  PERIOD_M30:           { Set_TPX_ColorStatus(GoldVIP.Signals_Periods._M30,           TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M30,        TPX);}
                    case  PERIOD_M15:           { Set_TPX_ColorStatus(GoldVIP.Signals_Periods._M15,           TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M15,        TPX);}
                    case  PERIOD_M5:            { Set_TPX_ColorStatus(GoldVIP.Signals_Periods._M5,            TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M5,         TPX);}
                    case  PERIOD_M1:            { Set_TPX_ColorStatus(GoldVIP.Signals_Periods._M1,            TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M1,         TPX);}//
          }
//=================================================================Factory
          if(0)
          {         if(TPX_Calc._TFS_DirectionDOWN)///DOWNTrend
                    {         if(_Data.__Data_BoxIn_Point_3DOWNTrend) //#1131 Mean BoxInDOWNTrend// if(DetermineMarketTP1ColorStatus)//ok //#113 DetermineMarketTP1ColorStatus//bool DetermineMarketTP1ColorStatus                      = true;//
                              {         if(_Data.__Data_Lowest_Pick_UPer_TPX)           TPX_Calc._Text050_Color = TPX_Calc._SignalGoing_Color; //; ///Not Crossed DOWNTrend TP1///not recogniseddd
                                        else if(!_Data.__Data_Lowest_Pick_UPer_TPX)     TPX_Calc._Text050_Color = TPX_Calc._SignalAchived_Color; // /// Crossed DOWNTrend TP1///  recogniseddd
                              }
                              else if(_Data.__Data_BoxOut_Point_3DOWNTrend)////#1132
                              {         //neeed Safe value of _Data.__Data_TFS_Bar_CordinateThree__ClosePrice to remember last signal status/// how much loseprofite
                                        ///neeed some volume cheaking to  reality of market fundamental...!!!!!! need fundamental class..!!!!!!!!!!
                                        //=================================================================
                                        TPX_Calc._Text050_Color = TPX_Calc._SignalFaile_Color;//wrong ///signal failing///
                              } //
                    } //
                    else
                    {         if(_Data.__Data_BoxIn_Point_3UPTrend) //#1231 Mean BoxInDOWNTrend
                              {         if(_Data.__Data_Highest_Pick_UPer_TPX)          TPX_Calc._Text050_Color = TPX_Calc._SignalAchived_Color; //; ///Not Crossed DOWNTrend TP1///not recogniseddd
                                        else if(!_Data.__Data_Highest_Pick_UPer_TPX)    TPX_Calc._Text050_Color = TPX_Calc._SignalGoing_Color ; // /// Crossed DOWNTrend TP1///  recogniseddd
                              }
                              else if(_Data.__Data_BoxOut_Point_3UPTrend)////#1232
                              {         //neeed Safe value of _Data.__Data_TFS_Bar_CordinateThree__ClosePrice to remember last signal status/// how much loseprofite
                                        ///neeed some volume cheaking to  reality of market fundamental...!!!!!! need fundamental class..!!!!!!!!!!
                                        TPX_Calc._Text050_Color = TPX_Calc._SignalFaile_Color;//wrong ///signal failing///
                                        //
                              }//
                    }//
          }//
          bool RunColor = TPX_Calc._Text050_Color == clrNONE ; //
          if(RunColor)//percent calced
          {         //==========================
                    //>>>>>>
                    //Alert("TPX: ", TPX, "--PeriodTMCom: ", PeriodTMCom, "--_TFS_SignalDefault_Color: ", _TFS_SignalDefault_Color); //
                    if(TPX == 1)
                    {         if(TPX_Calc._PercentValueCalc < 0)  TPX_Calc._TFS_SignalDefault_Color    = TPX_Calc._SignalFaile_Color;//clrRed//clrYellow//wrong ///signal failing///
                              if(TPX_Calc._PercentValueCalc > 33) TPX_Calc._TFS_SignalDefault_Color    = TPX_Calc._SignalAchived_Color;//clrRed//clrYellow//wrong ///signal failing///
                              if(TPX_Calc._PercentValueCalc > 66) TPX_Calc._TFS_SignalDefault_Color    = TPX_Calc._SignalAchived_Color;//clrRed//clrYellow//wrong ///signal failing///
                              if(TPX_Calc._PercentValueCalc > 99) TPX_Calc._TFS_SignalDefault_Color    = TPX_Calc._SignalGapHistoty_Color;//clrRed//clrYellow//wrong ///signal failing///
                    }//
                    //>>>>>>
                    //>>>>>>
                    if(TPX == 2)
                    {         if(TPX_Calc._PercentValueCalc < 0)  TPX_Calc._TFS_SignalDefault_Color    = TPX_Calc._SignalFaile_Color;//clrRed//clrYellow//wrong ///signal failing///
                              if(TPX_Calc._PercentValueCalc > 33) TPX_Calc._TFS_SignalDefault_Color    = TPX_Calc._SignalAchived_Color;//clrRed//clrYellow//wrong ///signal failing///
                              if(TPX_Calc._PercentValueCalc > 66) TPX_Calc._TFS_SignalDefault_Color    = TPX_Calc._SignalAchived_Color;//clrRed//clrYellow//wrong ///signal failing///
                              if(TPX_Calc._PercentValueCalc > 99) TPX_Calc._TFS_SignalDefault_Color    = TPX_Calc._SignalGapHistoty_Color;//clrRed//clrYellow//wrong ///signal failing///
                    }//
                    //>>>>>>
                    //>>>>>>
                    if(TPX == 3)
                    {         if(TPX_Calc._PercentValueCalc < 0) TPX_Calc._TFS_SignalDefault_Color    = TPX_Calc._SignalFaile_Color;//clrRed//clrYellow//wrong ///signal failing///
                              if(TPX_Calc._PercentValueCalc > 33) TPX_Calc._TFS_SignalDefault_Color    = TPX_Calc._SignalAchived_Color;//clrRed//clrYellow//wrong ///signal failing///
                              if(TPX_Calc._PercentValueCalc > 66) TPX_Calc._TFS_SignalDefault_Color    = TPX_Calc._SignalAchived_Color;//clrRed//clrYellow//wrong ///signal failing///
                              if(TPX_Calc._PercentValueCalc > 99) TPX_Calc._TFS_SignalDefault_Color    = TPX_Calc._SignalGapHistoty_Color;//clrRed//clrYellow//wrong ///signal failing///
                    }//
                    //>>>>>>
                    //==============================
          }//
//===================================================
          switch(PeriodTMCom)///Set_ing///
          {         case  PERIOD_CURRENT:       {Set_TPX_ColorStatus_Back(GoldVIP.periods._CURRENT,       TPX_Calc, TPX, RunColor);}
                    case  PERIOD_MN1:           {Set_TPX_ColorStatus_Back(GoldVIP.periods._MN1,           TPX_Calc, TPX, RunColor);}
                    case  PERIOD_W1:            {Set_TPX_ColorStatus_Back(GoldVIP.periods._W1,            TPX_Calc, TPX, RunColor);}
                    case  PERIOD_D1:            {Set_TPX_ColorStatus_Back(GoldVIP.periods._D1,            TPX_Calc, TPX, RunColor);}
                    case  PERIOD_H4:            {Set_TPX_ColorStatus_Back(GoldVIP.periods._H4,            TPX_Calc, TPX, RunColor);}
                    case  PERIOD_H1:            {Set_TPX_ColorStatus_Back(GoldVIP.periods._H1,            TPX_Calc, TPX, RunColor);}
                    case  PERIOD_M30:           {Set_TPX_ColorStatus_Back(GoldVIP.periods._M30,           TPX_Calc, TPX, RunColor);}
                    case  PERIOD_M15:           {Set_TPX_ColorStatus_Back(GoldVIP.periods._M15,           TPX_Calc, TPX, RunColor);}
                    case  PERIOD_M5:            {Set_TPX_ColorStatus_Back(GoldVIP.periods._M5,            TPX_Calc, TPX, RunColor);} //
                    case  PERIOD_M1:            {Set_TPX_ColorStatus_Back(GoldVIP.periods._M1,            TPX_Calc, TPX, RunColor);} //
          }//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_GoldVipDesc_Calc::TFSPercentStatus(ENUM_TIMEFRAMES PeriodTMCom, int TPX, bool & TFSBoxSwitchIN )
{
//=====================================
//Need StartPriceCalc values to findout lose Profite percent//GoldVIP.Signals_Periods.Period_Current.StartPriceCalc
//#11411 DetermineMarketTP1PercentStatus_Data.__Data_TP1_DOWNTrend_Achived
//#12421 DetermineMarketTP1PercentStatus_Data.__Data_TP1_UPTrend_Achived
// if(Dev_Object_Pack.Fibos.Expansion._Periods._Current.Is_Bulish);/////DOWNTrend//no need
//=====================================
//if(_Data.__Data_BoxIn_UPTrend);/////////  Crossed DOWNTrend TP1  recogniseddd
//if(_Data.__Data_BoxOut_UPTrend);////////  Not Crossed DOWNTrend TP1///not recogniseddd
//if(BoxInDOWNTrend);///////  Crossed DOWNTrend TP1  recogniseddd
//if(BoxOutDOWNTrend);//////  Not Crossed DOWNTrend TP1///not recogniseddd
//=================================================
          Sgtd_TPX_All_PriceCalc TPX_Calc;
//=================================================
          switch(PeriodTMCom)
          {         case  PERIOD_CURRENT:       { Set_TPX_PersentStatus(GoldVIP.Signals_Periods._CURRENT,     GoldVIP.periods._CURRENT,        TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._CURRENT,    TPX, TFSBoxSwitchIN); } break; //
                    case  PERIOD_MN1:           { Set_TPX_PersentStatus(GoldVIP.Signals_Periods._MN1,         GoldVIP.periods._MN1,            TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._MN1,        TPX, TFSBoxSwitchIN); } break; //
                    case  PERIOD_W1:            { Set_TPX_PersentStatus(GoldVIP.Signals_Periods._W1,          GoldVIP.periods._W1,             TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._W1,         TPX, TFSBoxSwitchIN); } break; //
                    case  PERIOD_D1:            { Set_TPX_PersentStatus(GoldVIP.Signals_Periods._D1,          GoldVIP.periods._D1,             TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._D1,         TPX, TFSBoxSwitchIN); } break; //
                    case  PERIOD_H4:            { Set_TPX_PersentStatus(GoldVIP.Signals_Periods._H4,          GoldVIP.periods._H4,             TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._H4,         TPX, TFSBoxSwitchIN); } break; //
                    case  PERIOD_H1:            { Set_TPX_PersentStatus(GoldVIP.Signals_Periods._H1,          GoldVIP.periods._H1,             TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._H1,         TPX, TFSBoxSwitchIN); } break; //
                    case  PERIOD_M30:           { Set_TPX_PersentStatus(GoldVIP.Signals_Periods._M30,         GoldVIP.periods._M30,            TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M30,        TPX, TFSBoxSwitchIN); } break; //
                    case  PERIOD_M15:           { Set_TPX_PersentStatus(GoldVIP.Signals_Periods._M15,         GoldVIP.periods._M15,            TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M15,        TPX, TFSBoxSwitchIN); } break; //
                    case  PERIOD_M5:            { Set_TPX_PersentStatus(GoldVIP.Signals_Periods._M5,          GoldVIP.periods._M5,             TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M5,         TPX, TFSBoxSwitchIN); } break; //
                    case  PERIOD_M1:            { Set_TPX_PersentStatus(GoldVIP.Signals_Periods._M1,          GoldVIP.periods._M1,             TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M1,         TPX, TFSBoxSwitchIN); } break; //
          }
//Alert("_TFS_PercentValue_CalcSafe: ", _TFS_PercentValue_CalcSafe, "--TPX: ", TPX, "--PeriodTMCom: ", PeriodTMCom); //Exiting
//=================================================//#1141 DetermineMarketTP1PercentStatusBoxInDOWNTrend
///error///2021.09.13 18:58:36.038      QUARTS_DEBUG ct_XAUUSD.F,H4: zero divide in 'GoldVIP.mqh' (5389,127)
          if(TPX_Calc._TFS_Price_CordinateThree < 0) return false;
          TPX_Calc._TFS_TPXRange_Target                      = MathAbs(TPX_Calc._TFS_TPXValue_Calc                - TPX_Calc._TFS_Price_CordinateThree );// Alert("_TFS_TPXValue_Calc  - _TFS_Price_CordinateThree: ", _TFS_TPXValue_Calc  - _TFS_Price_CordinateThree, "-----", "_TFS_TPXValue_Calc: ", _TFS_TPXValue_Calc, "---- _TFS_Price_CordinateThree: ", _TFS_Price_CordinateThree);
          TPX_Calc._TFS_RangeTarget_StartPrice               = MathAbs(TPX_Calc._TFS_StartPrice_Calc              - TPX_Calc._TFS_Price_CordinateThree ) - 0.00001; ////for not goning dived zero..
          TPX_Calc._RangeProgressd_UPTrend                   = MathAbs(_Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh  - TPX_Calc._TFS_Price_CordinateThree);//ilowe for DOWN trend==_TFS_Price_CordinateThree
          TPX_Calc._RangeProgressed_DOWNTrend                = MathAbs(_Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow    - TPX_Calc._TFS_Price_CordinateThree);//
          //------------------------------------------------------THE Keys
          TPX_Calc._Touched_Target_TFS_ByRange               = TPX_Calc._RangeProgressed           > TPX_Calc._TFS_TPXRange_Target;///for not calcing problems///
          TPX_Calc._Touched_Target_TFS_UPTrend_ByRange       = TPX_Calc._RangeProgressd_UPTrend    > TPX_Calc._TFS_TPXRange_Target;
          TPX_Calc._Touched_Target_TFS_DOWNTrend_ByRange     = TPX_Calc._RangeProgressed_DOWNTrend > TPX_Calc._TFS_TPXRange_Target;
          //---------
          TPX_Calc._Touched_StartPrice_TFS_ByRange           = TPX_Calc._RangeProgressed           > TPX_Calc._TFS_RangeTarget_StartPrice;//
          TPX_Calc._Touched_StartPrice_TFS_DOWNTrend_ByRange = TPX_Calc._RangeProgressed_DOWNTrend > TPX_Calc._TFS_RangeTarget_StartPrice; //
          TPX_Calc._Touched_StartPrice_TFS_UPTrend_ByRange   = TPX_Calc._RangeProgressd_UPTrend    > TPX_Calc._TFS_RangeTarget_StartPrice;//
          //------------key by points>..
          TPX_Calc._Touched_StartPrice_DOWNTrend_ByiLowest   = _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow   < TPX_Calc._TFS_StartPrice_Calc ;/////should be ihighest for touched start price..
          TPX_Calc._Touched_StartPrice_DOWNTrend_ByiHighest  = _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh > TPX_Calc._TFS_StartPrice_Calc ;//>>>DOWNtrend ok not lossing ///else lossing
          TPX_Calc._Touched_StartPrice_UPTrend_ByiLowest     = _Data.__Data_TFS_Bar_CordinateThree_iLowest_BarX_iLow   < TPX_Calc._TFS_StartPrice_Calc ;/////DOWNtrend ok not lossing ///else lossing
          TPX_Calc._Touched_StartPrice_UPTrend_ByiHighest    = _Data.__Data_TFS_Bar_CordinateThree_iHighest_BarX_iHigh > TPX_Calc._TFS_StartPrice_Calc ;//>>>should be ihighest for touched start price..
          //-----------------------------------------------------Conditions
          if(0)
          {         bool LogX = false;
                    bool LogY = false;
                    _Data.__Data_BoxIn_Point_3DOWNTrend ? (LogX = true) : (LogY = true);
                    TPX_Calc._Touched_Target_TFS_ByRange   && LogX  ? TPX_Calc._Achivment_Percent_TFSTPX = ( TPX_Calc._TFS_TPXRange_Target / TPX_Calc._RangeProgressed) * 100 : TPX_Calc._Achivment_Percent_TFSTPX = (TPX_Calc._RangeProgressed / TPX_Calc._TFS_TPXRange_Target) * 100; /////how much progresed
                    TPX_Calc._Touched_StartPrice_TFS_ByRange && LogY ? TPX_Calc._Achivment_StartPrice_Percent = (TPX_Calc._TFS_RangeTarget_StartPrice / TPX_Calc._RangeProgressed) * 100 : TPX_Calc._Achivment_StartPrice_Percent = (TPX_Calc._RangeProgressed / TPX_Calc._TFS_RangeTarget_StartPrice) * 100; //
                    TPX_Calc._Touched_Target_TFS_ByRange ? TPX_Calc._TFS_PercentValue_Calc = -(TPX_Calc._Achivment_StartPrice_Percent) : TPX_Calc._TFS_PercentValue_Calc = -(TPX_Calc._Achivment_StartPrice_Percent); // //
          }
          if(1)
          {         //>>>if(TFSBoxSwitchIN);////IS_Touched?
                    if(TPX_Calc._TFS_DirectionDOWN)
                    {         //
                              if(_Data.__Data_BoxIn_Point_3DOWNTrend)//IS_Touched? Under FXT3Point
                              {         TPX_Calc._Achivment_Percent_TFSTPX = TPX_Calc._Touched_Target_TFS_DOWNTrend_ByRange ?  ( TPX_Calc._RangeProgressed_DOWNTrend / TPX_Calc._TFS_TPXRange_Target) * 100 :  (TPX_Calc._RangeProgressed_DOWNTrend / TPX_Calc._TFS_TPXRange_Target) * 100;
                                        ///for defining how much increased profite need to clc extended profiting..
                                        ///show how much longer than tpx///else how much till too tpx
                                        TPX_Calc._TFS_PercentValue_Calc = +(TPX_Calc._Achivment_Percent_TFSTPX); //Alert(TP1PercentValueCalc, "-TP1PercentValueCalc");//
                                        //Alert("_Data.__Data_BoxIn_Point_3DOWNTrend-_TFS_PercentValue_Calc: ", _TFS_PercentValue_Calc, "--TPX: ", TPX, "--PeriodTMCom: ", PeriodTMCom); //Exiting
                              }
                              else if(_Data.__Data_BoxOut_Point_3DOWNTrend)////Not Touched ?///not run ////Not Touched
                              {         TPX_Calc._Achivment_StartPrice_Percent  = TPX_Calc._Touched_StartPrice_TFS_DOWNTrend_ByRange ?  (TPX_Calc._TFS_RangeTarget_StartPrice / TPX_Calc._RangeProgressed_DOWNTrend) * 100 :  (TPX_Calc._RangeProgressed_DOWNTrend / TPX_Calc._TFS_RangeTarget_StartPrice) * 100; //
                                        if(TPX_Calc._Touched_StartPrice_DOWNTrend_ByiHighest ) {TPX_Calc._TFS_PercentValue_Calc = -(TPX_Calc._Achivment_StartPrice_Percent); } //
                                        TPX_Calc._TFS_PercentValue_Calc = -(TPX_Calc._Achivment_StartPrice_Percent);//
                                        //Alert("_Data.__Data_BoxOut_Point_3DOWNTrend-_TFS_PercentValue_Calc: ", _TFS_PercentValue_Calc, "--TPX: ", TPX, "--PeriodTMCom: ", PeriodTMCom); //Exiting
                              }
                              //
                    }
                    else
                    {         if(_Data.__Data_BoxIn_Point_3UPTrend)//IS_Touched? Under FXT3Point
                              {         TPX_Calc._Achivment_Percent_TFSTPX = TPX_Calc._Touched_Target_TFS_UPTrend_ByRange ?  (TPX_Calc._RangeProgressd_UPTrend / TPX_Calc._TFS_TPXRange_Target) * 100 :  (TPX_Calc._RangeProgressd_UPTrend / TPX_Calc._TFS_TPXRange_Target) * 100;
                                        TPX_Calc._TFS_PercentValue_Calc = +(TPX_Calc._Achivment_Percent_TFSTPX); //Alert(TP1PercentValueCalc, "-TP1PercentValueCalc");//
                                        ///show how much longer than tpx///else how much till too tpx}
                                        // Alert("_TFS_TPXRange_Target: ",_TFS_TPXRange_Target,"//-_TFS_PercentValue_Calc: ", _TFS_PercentValue_Calc, "--TPX: ", TPX, "--PeriodTMCom: ", PeriodTMCom); //Exiting
                              }
                              else if(_Data.__Data_BoxOut_Point_3UPTrend)////Not Touched ?///not run ////Not Touched
                              {         TPX_Calc._Touched_StartPrice_TFS_UPTrend_ByRange ? TPX_Calc._Achivment_StartPrice_Percent = (TPX_Calc._TFS_RangeTarget_StartPrice / TPX_Calc._RangeProgressd_UPTrend) * 100 : TPX_Calc._Achivment_StartPrice_Percent = (TPX_Calc._RangeProgressd_UPTrend / TPX_Calc._TFS_RangeTarget_StartPrice) * 100; //
                                        TPX_Calc._TFS_PercentValue_Calc = -(TPX_Calc._Achivment_StartPrice_Percent);//
                                        //Alert("BoxOuPoint3UPTrend-_TFS_PercentValue_Calc: ", _TFS_PercentValue_Calc, "--TPX: ", TPX, "--PeriodTMCom: ", PeriodTMCom); //Exiting
                              }
                              //
                    } //
                    //#1142 DetermineMarketTP1PercentStatusBoxOutDOWNTrend
          }
          //=================================================
          switch(PeriodTMCom)/////seting TP3PercentValueCalc by TFS & TPX
          {         case  PERIOD_CURRENT:       {Set_SignalPersent(GoldVIP.Signals_Periods._CURRENT,  TPX_Calc, TPX);}
                    case  PERIOD_MN1:           {Set_SignalPersent(GoldVIP.Signals_Periods._MN1,      TPX_Calc, TPX);}
                    case  PERIOD_W1:            {Set_SignalPersent(GoldVIP.Signals_Periods._W1,       TPX_Calc, TPX);}
                    case  PERIOD_D1:            {Set_SignalPersent(GoldVIP.Signals_Periods._D1,       TPX_Calc, TPX);}
                    case  PERIOD_H4:            {Set_SignalPersent(GoldVIP.Signals_Periods._H4,       TPX_Calc, TPX);}
                    case  PERIOD_H1:            {Set_SignalPersent(GoldVIP.Signals_Periods._H1,       TPX_Calc, TPX);}
                    case  PERIOD_M30:           {Set_SignalPersent(GoldVIP.Signals_Periods._M30,      TPX_Calc, TPX);}
                    case  PERIOD_M15:           {Set_SignalPersent(GoldVIP.Signals_Periods._M15,      TPX_Calc, TPX);}
                    case  PERIOD_M5:            {Set_SignalPersent(GoldVIP.Signals_Periods._M5,       TPX_Calc, TPX);}
                    case  PERIOD_M1:            {Set_SignalPersent(GoldVIP.Signals_Periods._M1,       TPX_Calc, TPX);}//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
          return true;//             //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void   S_GoldVipDesc_Calc::Set___SubSignal__TradeType__Calc(ENUM_TIMEFRAMES PeriodTMCom)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
          //============================//============================
          switch(PeriodTMCom)
          {         //=================================================================Set___SubSignal__TradeType__Calc
                    case  PERIOD_CURRENT:       {  Set_TPX_Desc(GoldVIP.Signals_Periods._CURRENT,     Dev_Object_Pack.Fibos.Expansion._Periods._CURRENT);}
                    case  PERIOD_MN1:           {  Set_TPX_Desc(GoldVIP.Signals_Periods._MN1,         Dev_Object_Pack.Fibos.Expansion._Periods._MN1);}
                    case  PERIOD_W1:            {  Set_TPX_Desc(GoldVIP.Signals_Periods._W1,          Dev_Object_Pack.Fibos.Expansion._Periods._W1);}
                    case  PERIOD_D1:            {  Set_TPX_Desc(GoldVIP.Signals_Periods._D1,          Dev_Object_Pack.Fibos.Expansion._Periods._D1);}
                    case  PERIOD_H4:            {  Set_TPX_Desc(GoldVIP.Signals_Periods._H4,          Dev_Object_Pack.Fibos.Expansion._Periods._H4);}
                    case  PERIOD_H1:            {  Set_TPX_Desc(GoldVIP.Signals_Periods._H1,          Dev_Object_Pack.Fibos.Expansion._Periods._H1);}
                    case  PERIOD_M30:           {  Set_TPX_Desc(GoldVIP.Signals_Periods._M30,         Dev_Object_Pack.Fibos.Expansion._Periods._M30);}
                    case  PERIOD_M15:           {  Set_TPX_Desc(GoldVIP.Signals_Periods._M15,         Dev_Object_Pack.Fibos.Expansion._Periods._M15);}
                    case  PERIOD_M5:            {  Set_TPX_Desc(GoldVIP.Signals_Periods._M5,          Dev_Object_Pack.Fibos.Expansion._Periods._M5);}
                    case  PERIOD_M1:            {  Set_TPX_Desc(GoldVIP.Signals_Periods._M1,          Dev_Object_Pack.Fibos.Expansion._Periods._M1);}//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
          //============================//============================
}


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void   S_GoldVipDesc_Calc::Calc__Descs(ENUM_TIMEFRAMES PeriodTMCom, int TPX, bool & TFSBoxSwitchIN)
{
//============================================================
          Sgtd_TPX_All_PriceCalc TPX_Calc;
          TPX_Calc._TFS_DirectionDOWN             = false;
          TPX_Calc._ValueCalc                     = -1;
          TPX_Calc._ValueDesc                     = "";
          TPX_Calc._PercentValueCalc              = -1;
          TPX_Calc._PercentValueDesc              = "";
          TPX_Calc._TFS_PriceDistance_TargetTPX   = -1;
          TPX_Calc._TPX_ValueDictance_Value       = -1;
          TPX_Calc._ValueDictance_Desc            = "";
          TPX_Calc._Text050_Color                 = clrNONE; //
//============================================================
          switch(PeriodTMCom)///geting
          {         case  PERIOD_CURRENT:       { Set_TPX_Desc2(GoldVIP.Signals_Periods._CURRENT,     TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._CURRENT,    TechnicalO._CURRENT,    TPX); } break; //
                    case  PERIOD_MN1:           { Set_TPX_Desc2(GoldVIP.Signals_Periods._MN1,         TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._MN1,        TechnicalO._MN1,        TPX); } break; //
                    case  PERIOD_W1:            { Set_TPX_Desc2(GoldVIP.Signals_Periods._W1,          TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._W1,         TechnicalO._W1,         TPX); } break; //
                    case  PERIOD_D1:            { Set_TPX_Desc2(GoldVIP.Signals_Periods._D1,          TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._D1,         TechnicalO._D1,         TPX); } break; //
                    case  PERIOD_H4:            { Set_TPX_Desc2(GoldVIP.Signals_Periods._H4,          TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._H4,         TechnicalO._H4,         TPX); } break; //
                    case  PERIOD_H1:            { Set_TPX_Desc2(GoldVIP.Signals_Periods._H1,          TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._H1,         TechnicalO._H1,         TPX); } break; //
                    case  PERIOD_M30:           { Set_TPX_Desc2(GoldVIP.Signals_Periods._M30,         TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M30,        TechnicalO._M30,        TPX); } break; //
                    case  PERIOD_M15:           { Set_TPX_Desc2(GoldVIP.Signals_Periods._M15,         TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M15,        TechnicalO._M15,        TPX); } break; //
                    case  PERIOD_M5:            { Set_TPX_Desc2(GoldVIP.Signals_Periods._M5,          TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M5,         TechnicalO._M5,         TPX); } break; //
                    case  PERIOD_M1:            { Set_TPX_Desc2(GoldVIP.Signals_Periods._M1,          TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M1,         TechnicalO._M1,         TPX); } break; //
                              //
          }
//Alert("_PercentValueCalc: >> ", _PercentValueCalc,"--_ValueCalc: >> ", _ValueCalc, "--PeriodTMCom: ", PeriodTMCom, "--TPX: ", TPX, "--TFSBoxSwitchIN: ", TFSBoxSwitchIN); //
//============================================================// #115//DetermineMarketDirectionStatusTP1DescS
          {         TPX_Calc._ValueDesc                  = DoubleToString(TPX_Calc._ValueCalc, Digits); ///"1771.22";<<<<why
                    TPX_Calc._ValueDictance_Desc          = "%+" + (DoubleToString(TPX_Calc._TFS_PriceDistance_TargetTPX * 10, 0)) + "pip"; //"+" + "0810" + "pip";
                    double TPXPercentValueCalcReamain = -1;
                    //Cat.say("  Calc__Descs " + TPX_Calc._TFS_DirectionDOWN);
                    if(TPX_Calc._TFS_DirectionDOWN)///DOWNTrend
                    {         //=====================================
                              if(TFSBoxSwitchIN || _Data.__Data_BoxIn_Point_3DOWNTrend)//#1151//DetermineMarketDirectionStatusTP1DescS
                              {         if(TPX_Calc._PercentValueCalc > 100)//#11511//DetermineMarketDirectionStatusTP1DescS
                                        {         TPXPercentValueCalcReamain = TPX_Calc._PercentValueCalc - 100; if(TPXPercentValueCalcReamain > 1000)TPXPercentValueCalcReamain = 0; if(TPXPercentValueCalcReamain < 1000)TPXPercentValueCalcReamain = 0;
                                                  //---------------------[]------------
                                                  TPX_Calc._PercentValueDesc        = "+" + "100 + " + DoubleToStr(TPXPercentValueCalcReamain, 0)  + "%"; ////"100" + "%";
                                        }
                                        else
                                        {         if(TPX_Calc._PercentValueCalc > 1000)TPX_Calc._PercentValueCalc = 0; if(TPX_Calc._PercentValueCalc < 1000)TPX_Calc._PercentValueCalc = 0;
                                                  TPX_Calc._PercentValueDesc        = "+" + DoubleToStr(TPX_Calc._PercentValueCalc, 0)  + "%"; } //"100" + "%";
                              }//
                              else if(_Data.__Data_BoxOut_Point_3DOWNTrend)
                              {         //===================================== //#11411 DetermineMarketTP1PercentStatus_Data.__Data_TP1_DOWNTrend_Achived
                                        if(_Data.__Data_BoxIn_Point1_DOWNTrend)
                                        {         //
                                                  TPX_Calc._PercentValueDesc        = "InFiboExtention -" + DoubleToStr(TPX_Calc._PercentValueCalc, 0)  + "%"; } //"100" + "%";
                                        //
                                        else if(_Data.__Data_BoxOut_Point1_DOWNTrend)
                                        {         TPX_Calc._PercentValueDesc        = "OutFiboExtention -" + DoubleToStr(TPX_Calc._PercentValueCalc, 0)  + "%";} //"100" + "%";
                                        //=====================================
                              }
                              //Alert("_ValueCalc>> ", _ValueCalc, "--PeriodTMCom", PeriodTMCom); //
                    }//
                    else//#125//DetermineMarketDirectionStatusTP1DescS
                    {         //=====================================
                              if(TFSBoxSwitchIN || _Data.__Data_BoxIn_Point_3UPTrend)//#1251//DetermineMarketDirectionStatusTP1DescS
                              {         if(TPX_Calc._PercentValueCalc > 100)//#12511//DetermineMarketDirectionStatusTP1DescS
                                        {         TPXPercentValueCalcReamain = TPX_Calc._PercentValueCalc - 100; if(TPXPercentValueCalcReamain > 1000)TPXPercentValueCalcReamain = 0; if(TPXPercentValueCalcReamain < 1000)TPXPercentValueCalcReamain = 0;
                                                  //---------------------[]------------
                                                  TPX_Calc._PercentValueDesc        = "+" + "100 + " + DoubleToStr(TPXPercentValueCalcReamain, 0)  + "%"; ////"100" + "%";
                                        }
                                        else
                                        {         if(TPX_Calc._PercentValueCalc > 1000)TPX_Calc._PercentValueCalc = 0; if(TPX_Calc._PercentValueCalc < 1000)TPX_Calc._PercentValueCalc = 0;
                                                  TPX_Calc._PercentValueDesc        = "+" + DoubleToStr(TPX_Calc._PercentValueCalc, 0)  + "%"; } //"100" + "%";
                              }//
                              else if(_Data.__Data_BoxOut_Point_3UPTrend)
                              {         //===================================== //#11411 DetermineMarketTP1PercentStatus_Data.__Data_TP1_DOWNTrend_Achived
                                        if(_Data.__Data_BoxIn_Point1_UPTrend)
                                        {         //
                                                  TPX_Calc._PercentValueDesc        = "InFiboExtention -" + DoubleToStr(TPX_Calc._PercentValueCalc, 0)  + "%"; } //"100" + "%";
                                        //
                                        else if(_Data.__Data_BoxOut_Point1_UPTrend)
                                        {         TPX_Calc._PercentValueDesc        = "OutFiboExtention -" + DoubleToStr(TPX_Calc._PercentValueCalc, 0)  + "%";} //"100" + "%";
                                        //=====================================
                              }
                              //Alert("_ValueCalc>> ", _ValueCalc, "--PeriodTMCom", PeriodTMCom); //
                    }//
          }//
//===================================================
          switch(PeriodTMCom)///Set_ing///
          {         case  PERIOD_CURRENT:       { Set_Back__Signal__Desc(GoldVIP.Signals_Periods._CURRENT,  TPX_Calc, TPX);} break; //
                    case  PERIOD_MN1:           { Set_Back__Signal__Desc(GoldVIP.Signals_Periods._MN1,      TPX_Calc, TPX);} break; //
                    case  PERIOD_W1:            { Set_Back__Signal__Desc(GoldVIP.Signals_Periods._W1,       TPX_Calc, TPX);} break; //
                    case  PERIOD_D1:            { Set_Back__Signal__Desc(GoldVIP.Signals_Periods._D1,       TPX_Calc, TPX);} break; //
                    case  PERIOD_H4:            { Set_Back__Signal__Desc(GoldVIP.Signals_Periods._H4,       TPX_Calc, TPX);} break; //
                    case  PERIOD_H1:            { Set_Back__Signal__Desc(GoldVIP.Signals_Periods._H1,       TPX_Calc, TPX);} break; //
                    case  PERIOD_M30:           { Set_Back__Signal__Desc(GoldVIP.Signals_Periods._M30,      TPX_Calc, TPX);} break; //
                    case  PERIOD_M15:           { Set_Back__Signal__Desc(GoldVIP.Signals_Periods._M15,      TPX_Calc, TPX);} break; //
                    case  PERIOD_M5:            { Set_Back__Signal__Desc(GoldVIP.Signals_Periods._M5,       TPX_Calc, TPX);} break; //
                    case  PERIOD_M1:            { Set_Back__Signal__Desc(GoldVIP.Signals_Periods._M1,       TPX_Calc, TPX);} break; //
                              ///
          }//
//===================================================
}//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_GoldVipDesc_Calc::Get__Create__And__Calc__(int WhichMode, bool IsKey, const bool Is_Show = false,  ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT,  int CalcMode = 3)
{         bool IsDone = false;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
          //-------------------------------
          string  PeriodTMComDesc = Utilities.TimeFrameToString(PeriodTMCom);
          string  NameSet_         = "XTrading" + PeriodTMComDesc;
          //-------------------------------
          //---
          //---
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          //[---Creating---]
          IsDone = Dev_Object_Pack.Fibos.Expansion.Create(WhichMode, IsKey, NameSet_, PeriodTMCom, CalcMode = 3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial"); //
          if(!IsDone)Cat.say("Create failed : S_GoldVipDesc_Calc::Get__Create__And__Calc__(...)");
          //else Cat.say("Create succed : S_GoldVipDesc_Calc::Get__Create__And__Calc__(...)");
          //---
          //---
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          //[---Calc---]
          IsDone = Define__Calc__Just( PeriodTMCom, NameSet_ );///>>OK
          if(!IsDone)Cat.say("calc failed : S_GoldVipDesc_Calc::Get__Create__And__Calc__(...)");
          //---
          //---
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          //[---deleting the levels and lines---]( Clicked == "gFlow_Pad.BTN_FiboExpTrade")
          if(!Is_Show)
          {         IsDone = C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, NameSet_, __LINE__);
                    //if(!IsDone)Cat.say("delete levels failed : S_GoldVipDesc_Calc::Get__Create__And__Calc__(...)");//
                    return IsDone; //
          }
          //-------------------------------
          //
          if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
          return IsDone; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_GoldVipDesc_Calc::XTrading_Set__calc(int WhichMode, bool IsKey, const bool Is_Calculate = false,  ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT)
{         ________________________________________________________Xerorr.SuperviserX(_LastError,  "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
          Get__Create__And__Calc__(WhichMode, IsKey, Is_Calculate, PeriodTMCom); //
//----
          SetLabels(WhichMode, IsKey, Is_Calculate, PeriodTMCom);
          Set___Global__Variable(false);
//
//[for UPdating Signal Values]
          bool UPdateVariables = false;//E_SignalPeriods PeriodS;//for UPdating Signal Values///
          if(UPdateVariables)
          {         Fill__Signal__Varibels("Main",  PERIOD_CURRENT, Mainly); ///calc Signal values
                    Fill__Signal__Varibels("Daily", PERIOD_D1,      Daily); ///calc Signal values
                    Fill__Signal__Varibels("4Hour", PERIOD_H4,      Hour4); ///calc Signal values
                    Fill__Signal__Varibels("30Min", PERIOD_M30,     Min30); ///calc Signal values
                    Fill__Signal__Varibels("5Min",  PERIOD_M5,      Min5); ///calc Signal values
                    //if(PeriodTMCom == PERIOD_CURRENT)   Alert("PeriodTMCom==PERIOD_CURRENT" + __FUNCTION__);
                    //if(PeriodTMCom == PERIOD_D1)        Alert("PeriodTMCom==PERIOD_D1" + __FUNCTION__);
                    //if(PeriodTMCom == PERIOD_H4)        Alert("PeriodTMCom==PERIOD_H4" + __FUNCTION__);
                    //if(PeriodTMCom == PERIOD_M30)       Alert("PeriodTMCom==PERIOD_M30" + __FUNCTION__);
                    //if(PeriodTMCom == PERIOD_M5)        Alert("PeriodTMCom==PERIOD_M5" + __FUNCTION__); ///
          }
//=========================================================|Desc Text Format
          ________________________________________________________Xerorr.SuperviserX(_LastError,  "C_GOLDVIP Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_GoldVipDesc_Calc::Get__Panel__calculate(int WhichMode, bool IsKey, const bool Is_Show = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError,  "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
//============================//============================
          bool IsDone = false;
          //[---//Calcing---Creating---leveling---deleting ----chart lines---]
          {         IsDone = Get__Create__And__Calc__(WhichMode, IsKey, Is_Show, PERIOD_CURRENT); //>>ok
                    IsDone = Get__Create__And__Calc__(WhichMode, IsKey, Is_Show, PERIOD_MN1); //>>ok
                    IsDone = Get__Create__And__Calc__(WhichMode, IsKey, Is_Show, PERIOD_W1); //>>ok
                    IsDone = Get__Create__And__Calc__(WhichMode, IsKey, Is_Show, PERIOD_D1); //>>ok
                    IsDone = Get__Create__And__Calc__(WhichMode, IsKey, Is_Show, PERIOD_H4); //>>ok
                    IsDone = Get__Create__And__Calc__(WhichMode, IsKey, Is_Show, PERIOD_H1); //>>ok
                    IsDone = Get__Create__And__Calc__(WhichMode, IsKey, Is_Show, PERIOD_M30); //>>ok
                    IsDone = Get__Create__And__Calc__(WhichMode, IsKey, Is_Show, PERIOD_M15); //>>ok
                    IsDone = Get__Create__And__Calc__(WhichMode, IsKey, Is_Show, PERIOD_M5); //>>ok
                    IsDone = Get__Create__And__Calc__(WhichMode, IsKey, Is_Show, PERIOD_M1); //>>ok
                    if(!IsDone)Cat.say("Create and calc failed : S_GoldVipDesc_Calc::Get__Panel__calculate(...)"); //
          }
          //
          //
          ///[---Filing variables---]
          bool Is_Filing_Variables  = true;
          IsDone                    = false;
          if(Is_Filing_Variables)//for all period seting signalls values
          {         IsDone = Fill__Signal__Varibels("Main",             PERIOD_CURRENT); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("Daily",            PERIOD_D1); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("4Hour",            PERIOD_H4); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("30Min",            PERIOD_M30); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("5Min",             PERIOD_M5); ///calc Signal values
                    //
                    IsDone = Fill__Signal__Varibels("__CURRENT",        PERIOD_CURRENT); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("_MN1",             PERIOD_MN1); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("_W1",              PERIOD_W1); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("_D1",              PERIOD_D1); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("_H4",              PERIOD_H4); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("_H1",              PERIOD_H1); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("_M30",             PERIOD_M30); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("_M15",             PERIOD_M15); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("_M5",              PERIOD_M5); ///calc Signal values
                    IsDone = Fill__Signal__Varibels("_M1",              PERIOD_M1); ///calc Signal values
                    if(!IsDone)Cat.say("Is_Filing_Variables failed : S_GoldVipDesc_Calc::Get__Panel__calculate(...)"); //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError,  "C_GOLDVIP Error",  __LINE__, __FUNCTION__); //|
          return IsDone; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_GoldVipDesc_Calc::SetLabels(int WhichMode, bool IsKey, const bool Is_Calculate = false, ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
//=========================================================
//Alert("RunPeriodTMCom: ", PeriodTMCom); ///
          if(true)Dev_Object_Pack.Lines.Cycles .Create(); ///before  DiffDictanceCycle//DO we Need?///we need for target cordinate of labels
          //--
          Sgtd_TPX_All_PriceCalc        TPX_Calc;
          Sfd_SetLabels             _SetLabels;
          _SetLabels.MoveX                   = Dev_Object_Pack.Lines.Cycles.DiffDictanceCycle;//
//=====================
          _SetLabels.PriceLevel618           = 0;
          _SetLabels.BarSizeTime             = Period() * 60;
///    iBarShift()//by Time  MoveX
          _SetLabels.IndependMove            = (_SetLabels.MoveX * _SetLabels.BarSizeTime);///we need for target cordinate of labels
//============================
          _SetLabels.CTimeCordinateThree_TFS = -1;
          _SetLabels.CTimeCordinateOne       = -1;
          _SetLabels.CPriceCordinateOne      = -1;
          _SetLabels.CTimeCordinateTwo       = -1;
          _SetLabels.CPriceCordinateTwo      = -1;
          _SetLabels._TFS_DirectionDOWN = false;
          _SetLabels.TPX_LEVELPrice3         = -1;
          //
          _SetLabels.LabelOneName            = "";
          _SetLabels.x01                     = -1;//TOOLS.ChartTimePriceConvertToXY(FuncCom + __FUNCTION__, CTimeCordinateTwo,  Price3Level04_0618_adjust, x01, y01);
          _SetLabels.y01                     = -1;// Alert( "x01: ", x01, " ---y01: ", y01 );
          _SetLabels.YY_061                  = -1;//YY_061 = Price3Level04_0618_adjust;
          _SetLabels.XX_061                  = -1;
          //
          _SetLabels.LabelTwoName            = "";
          _SetLabels.x02                     = -1;
          _SetLabels.y02                     = -1;//TOOLS.ChartTimePriceConvertToXY(FuncCom + __FUNCTION__, CTimeCordinateTwo, Price3Level07_1000_adjust, x02, y02 );
          _SetLabels.YY_100                  = -1;
          _SetLabels.XX_100                  = -1; //TOOLS.ChartTimePriceConvertToXY(FuncCom + __FUNCTION__, CTimeCordinateTwo, Price3Level21_1000_adjust, x02, y02 );
          //
          _SetLabels.LabelThereName          = "";
          _SetLabels.x03                     = -1;
          _SetLabels.y03                     = -1;//TOOLS.ChartTimePriceConvertToXY(FuncCom + __FUNCTION__, CTimeCordinateTwo, Price3Level11_1618_adjust, x03, y03 );
          _SetLabels.YY_161                  = -1;
          _SetLabels.XX_161                  = -1;//YY_161 = Price3Level11_1618_adjust;
          //
          _SetLabels.LabelForeName           = "";
          _SetLabels.x01_032                 = -1;
          _SetLabels.y01_032                 = -1;//TOOLS.ChartTimePriceConvertToXY(FuncCom + __FUNCTION__, CTimeCordinateTwo,  Price3Level02_0328_adjust, x01_032, y01_032);
          _SetLabels.YY_032                  = -1;  // Alert( "x01: ", x01, " ---y01: ", y01 );
          _SetLabels.XX_032                  = -1;//YY_032 = Price3Level02_0328_adjust;
          _SetLabels.ChangeYDesc             = 10;//
          _SetLabels.FontSizeDesc            = -4;//
//====================
          _SetLabels.ChangeYTrend            = 3;
          _SetLabels.Width                   = 1;
          _SetLabels.DescColor               = clrYellow;
          _SetLabels.Rayed                   = false;
          _SetLabels.Style                   = STYLE_DASHDOTDOT;
//===================================================================
          switch(PeriodTMCom)
          {         case  PERIOD_CURRENT:       {  Set_TPX_Label(Periods_Levels._CURRENT,      _SetLabels, TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._CURRENT);}  break; //
                    case  PERIOD_MN1:           {  Set_TPX_Label(Periods_Levels._MN1,          _SetLabels, TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._MN1);}  break; //
                    case  PERIOD_W1:            {  Set_TPX_Label(Periods_Levels._W1,           _SetLabels, TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._W1);}  break; //
                    case  PERIOD_D1:            {  Set_TPX_Label(Periods_Levels._D1,           _SetLabels, TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._D1);}  break; //
                    case  PERIOD_H4:            {  Set_TPX_Label(Periods_Levels._H4,           _SetLabels, TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._H4);}  break; //
                    case  PERIOD_H1:            {  Set_TPX_Label(Periods_Levels._H1,           _SetLabels, TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._H1);}  break; //
                    case  PERIOD_M30:           {  Set_TPX_Label(Periods_Levels._M30,          _SetLabels, TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M30);}  break; //
                    case  PERIOD_M15:           {  Set_TPX_Label(Periods_Levels._M15,          _SetLabels, TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M15);}  break; //
                    case  PERIOD_M5:            {  Set_TPX_Label(Periods_Levels._M5,           _SetLabels, TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M5);}  break; //
                    case  PERIOD_M1:            {  Set_TPX_Label(Periods_Levels._M1,           _SetLabels, TPX_Calc, Dev_Object_Pack.Fibos.Expansion._Periods._M1);}  break; //
          }
//===================================================================
          if(!Is_Calculate)           ///============================#1
          {         //Alert("Is_Calculate: ", Is_Calculate,"---Is_Create: ", Is_Create); ///
                    //#1 Trend One 0.618
                    {         _SetLabels.CTimeCordinateOne  = _SetLabels.CTimeCordinateThree_TFS ; //Time[0];//Dev_Object_Pack.Fibos.Expansion.CTimeCordinateOneCycle;//
                              _SetLabels.CPriceCordinateOne = _SetLabels.TPX_LEVELPrice3;
                              _SetLabels.CPriceCordinateTwo = _SetLabels.TPX_LEVELPrice3; //
                              _SetLabels.CTimeCordinateTwo  = _SetLabels.CTimeCordinateOne + _SetLabels.IndependMove; //Dev_Object_Pack.Fibos.Expansion.CTimeCordinateTwoCycle;//CTimeCordinateOne + Period() * 60 * 10;
                              //
                              Dev_Object_Pack.Lines.Trend.Create(WhichMode, IsKey, _SetLabels.LabelOneName, _SetLabels.LabelOneName, _SetLabels.CTimeCordinateOne, _SetLabels.CPriceCordinateOne + _SetLabels.ChangeYTrend, _SetLabels.CTimeCordinateTwo, _SetLabels.CPriceCordinateTwo + _SetLabels.ChangeYTrend, false, _SetLabels.Width, _SetLabels.DescColor, _SetLabels.Rayed,  _SetLabels.Style ); // UseTrend
                              //Alert("LabelOneName: ", LabelOneName, "---CTimeCordinateOne: ", CTimeCordinateOne, "---CPriceCordinateOne: ", CPriceCordinateOne, "---CTimeCordinateTwo: ", CTimeCordinateTwo, "---CPriceCordinateTwo: ", CPriceCordinateTwo); ///
                    }
                    _SetLabels.XX_061 = _SetLabels.CTimeCordinateTwo;
                    //=============================================================
                    //=============================================================#2
                    //#1 Trend Two 1.000
                    {         _SetLabels.CTimeCordinateOne = _SetLabels.CTimeCordinateTwo;
                              _SetLabels.CTimeCordinateTwo =  _SetLabels.CTimeCordinateOne + _SetLabels.IndependMove * 1;
                              Dev_Object_Pack.Lines.Trend.Create(WhichMode, IsKey, _SetLabels.LabelTwoName, _SetLabels.LabelTwoName, _SetLabels.CTimeCordinateOne, _SetLabels.YY_100 + _SetLabels.ChangeYTrend, _SetLabels.CTimeCordinateTwo, _SetLabels.YY_100 + _SetLabels.ChangeYTrend, false, _SetLabels.Width, _SetLabels.DescColor, _SetLabels.Rayed,  _SetLabels.Style ); // UseTrend
                    }
                    _SetLabels.XX_100 = _SetLabels.CTimeCordinateTwo;
                    //=====================================================
                    //=====================================================#3
                    //#1 Trend There 1.618
                    {         _SetLabels.CTimeCordinateOne = _SetLabels.CTimeCordinateTwo;
                              _SetLabels.CTimeCordinateTwo = _SetLabels.CTimeCordinateOne + _SetLabels.IndependMove * 1;
                              Dev_Object_Pack.Lines.Trend.Create(WhichMode, IsKey, _SetLabels.LabelThereName, _SetLabels.LabelThereName, _SetLabels.CTimeCordinateOne, _SetLabels.YY_161 + _SetLabels.ChangeYTrend, _SetLabels.CTimeCordinateTwo, _SetLabels.YY_161 + _SetLabels. ChangeYTrend, false, _SetLabels.Width, _SetLabels.DescColor, _SetLabels.Rayed,  _SetLabels.Style ); // UseTrend
                    }
                    _SetLabels.XX_161 = _SetLabels.CTimeCordinateTwo;
                    //-------------------------------
                    // TOOLS.ChartTimePriceConvertToXY(FuncCom + __FUNCTION__, CTimeCordinateTwo, Price3Level25_1618_adjust, x03, y03 );
                    //================================================================================#4
                    //================================================================================
                    //#1 Trend start 1.328
                    {         Dev_Object_Pack.Lines.Trend.Create(WhichMode, IsKey, _SetLabels.LabelForeName, _SetLabels.LabelForeName, _SetLabels.CTimeCordinateThree_TFS, _SetLabels.YY_032 + _SetLabels.ChangeYTrend, _SetLabels.CTimeCordinateThree_TFS + _SetLabels.IndependMove, _SetLabels.YY_032 + _SetLabels.ChangeYTrend, false, _SetLabels.Width, _SetLabels.DescColor, _SetLabels.Rayed,  _SetLabels.Style ); // UseTrend
                    }
                    _SetLabels.XX_032 = _SetLabels.CTimeCordinateThree_TFS + _SetLabels.IndependMove;
                    ////===================================
                    {         Dev_Object_Pack.Texts.Description.Create(WhichMode, IsKey, "PriceDistanceTargetStart", "DistanceTargetStart: "     +  DoubleToString(TechnicalO._CURRENT.PriceDistance_Target_Start, 2), _SetLabels.XX_032 - _SetLabels.BarSizeTime * 70, _SetLabels.YY_032 + _SetLabels.ChangeYDesc, CORNER_LEFT_UPPER, ANCHOR_RIGHT, true, STYLE_SOLID, false, 1, clrWhite, 0, 10 + _SetLabels.FontSizeDesc, "Arial Bold"); //
                              Dev_Object_Pack.Texts.Description.Create(WhichMode, IsKey, "_PriceDistance_Target_One", "DistanceTargetOne: " +  DoubleToString(TechnicalO._CURRENT.PriceDistance_Target_One, 2),   _SetLabels.XX_061 - _SetLabels.BarSizeTime * 70, _SetLabels.YY_061 + _SetLabels.ChangeYDesc, CORNER_LEFT_UPPER, ANCHOR_RIGHT, true, STYLE_SOLID, false, 1, clrWhite, 0, 10 + _SetLabels.FontSizeDesc, "Arial Bold");
                              Dev_Object_Pack.Texts.Description.Create(WhichMode, IsKey, "PriceDistanceTargetTwo", "DistanceTargetTwo: "         +  DoubleToString(TechnicalO._CURRENT.PriceDistance_Target_Two, 2),   _SetLabels.XX_100 - _SetLabels.BarSizeTime * 70, _SetLabels.YY_100 + _SetLabels.ChangeYDesc, CORNER_LEFT_UPPER, ANCHOR_RIGHT, true, STYLE_SOLID, false, 1, clrWhite, 0, 10 + _SetLabels.FontSizeDesc, "Arial Bold");
                              Dev_Object_Pack.Texts.Description.Create(WhichMode, IsKey, "PriceDistanceTargetThree", "DistanceTargetThree: "     +  DoubleToString(TechnicalO._CURRENT.PriceDistance_Target_Three, 2), _SetLabels.XX_161 - _SetLabels.BarSizeTime * 70, _SetLabels.YY_161 + _SetLabels.ChangeYDesc, CORNER_LEFT_UPPER, ANCHOR_RIGHT, true, STYLE_SOLID, false, 1, clrWhite, 0, 10 + _SetLabels.FontSizeDesc, "Arial Bold"); //
                              if(WhichMode == MODE_CREATE && !IsKey)
                              {         Dev_Object_Pack.Lines.Trend.Create(WhichMode, IsKey, _SetLabels.LabelForeName ); // UseTrend
                                        Dev_Object_Pack.Lines.Trend.Create(WhichMode, IsKey, _SetLabels.LabelOneName );   // UseTrend
                                        Dev_Object_Pack.Lines.Trend.Create(WhichMode, IsKey, _SetLabels.LabelTwoName ); // UseTrend
                                        Dev_Object_Pack.Lines.Trend.Create(WhichMode, IsKey, _SetLabels.LabelThereName ); // UseTrend
                              } //
                              //
                    }//
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_GoldVipDesc_Calc::Set___Global__Variable( bool Is_Run = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_GOLDVIP Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(Is_Run)
          {         int GlobalVariablesTotalX =  GlobalVariablesTotal();
                    //=====================================================  //Set_s a new value for a global variable. If the variable does not exist, the system creates a new global variable.
                    GlobalVariableSet("CPriceCordinateOne",     Dev_Object_Pack.Fibos.Expansion._Periods._D1.CC1._Price);
                    GlobalVariableSet("CTimeCordinateOne",      Dev_Object_Pack.Fibos.Expansion._Periods._D1.CC1._Time);
                    GlobalVariableSet("CPriceCordinateTwo",     Dev_Object_Pack.Fibos.Expansion._Periods._D1.CC2._Price);
                    GlobalVariableSet("CTimeCordinateTwo",      Dev_Object_Pack.Fibos.Expansion._Periods._D1.CC2._Time);
                    GlobalVariableSet("CPriceCordinateThree",   Dev_Object_Pack.Fibos.Expansion._Periods._D1.CC3._Price);
                    GlobalVariableSet("CTimeCordinateThree",    Dev_Object_Pack.Fibos.Expansion._Periods._D1.CC3._Time);
                    //======================================================
                    //Alert(GlobalVariablesTotalX,"==GlobalVariablesTotalX");Sleep(50);
                    //GlobalVariableGet()
                    //Alert((datetime)GlobalVariableGet("CTimeCordinateThree"),"==GlobalVariableGet(CTimeCordinateThree)");///where pivot point is starting place
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_GOLDVIP Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_GoldVipDesc_Calc::Fill__Signal__Varibels(string DefinePeriodDesc = "None", ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT, E_SignalPeriods PeriodS = Mainly)
{         bool IsDone = false;//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
//---
          if(Is_LevelsSet_)
          {         Set___SubSignal__Reset__Desc(PeriodTMCom);
                    Set___SubSignal__Header__Calc(PeriodTMCom, DefinePeriodDesc );
                    Set___SubSignal__Pivots__Calc(PeriodTMCom);
                    Set___SubSignal__StartPrice__Calc(PeriodTMCom); ///Set_StartPriceCalc
                    Set___SubSignal__StartTime__Calc(PeriodTMCom);
                    Set___SubSignal__StopLossPrice__Calc(PeriodTMCom);
//---
                    Set___SubSignal__TPs_Desc_Percent_Status__Calc(PeriodTMCom, 1 ); ////#113 DetermineMarketTP1ColorStatus
                    Set___SubSignal__TradeType__Calc( PeriodTMCom); //
          }
          else Cat.say(" Is_LevelsSet_ false ");
//---
//---Set_ing TPs Valuse By TMFrame///make so Long Prossecing/// Functional Better choose now///
          ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
          return IsDone = true;//
}
//---------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_GoldVipDesc_Calc::Define__Calc__Just(ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT, string UseName = "XTrading")
{         bool IsDone = false;
          ________________________________________________________Xerorr.SuperviserX(_LastError,  "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
          //---
          Sgtd_Fivo_Expantion_Levels _Levels_TPX;
          //[Get Is_Bulish each timeframe]
          switch(PeriodTMCom)
          {         case  PERIOD_CURRENT: { Set__Direction(_Levels_TPX, Dev_Object_Pack.Fibos.Expansion._Periods._CURRENT); } break; //
                    case  PERIOD_MN1:     { Set__Direction(_Levels_TPX, Dev_Object_Pack.Fibos.Expansion._Periods._MN1);    } break; //
                    case  PERIOD_W1:      { Set__Direction(_Levels_TPX, Dev_Object_Pack.Fibos.Expansion._Periods._W1);    } break; //
                    case  PERIOD_D1:      { Set__Direction(_Levels_TPX, Dev_Object_Pack.Fibos.Expansion._Periods._D1);   } break; //
                    case  PERIOD_H4:      { Set__Direction(_Levels_TPX, Dev_Object_Pack.Fibos.Expansion._Periods._H4);   } break; //
                    case  PERIOD_H1:      { Set__Direction(_Levels_TPX, Dev_Object_Pack.Fibos.Expansion._Periods._H1);    } break; //
                    case  PERIOD_M30:     { Set__Direction(_Levels_TPX, Dev_Object_Pack.Fibos.Expansion._Periods._M30);   } break; //
                    case  PERIOD_M15:     { Set__Direction(_Levels_TPX, Dev_Object_Pack.Fibos.Expansion._Periods._M15);    } break; //
                    case  PERIOD_M5:      { Set__Direction(_Levels_TPX, Dev_Object_Pack.Fibos.Expansion._Periods._M5);    } break; //
                    case  PERIOD_M1:      { Set__Direction(_Levels_TPX, Dev_Object_Pack.Fibos.Expansion._Periods._M1);    } break; //
          }
          //[---FORMULATOR---]
          if(ObjectFind(0, UseName) >= 0) Define__Levels__Value( UseName, _Levels_TPX, PeriodTMCom); //main>>>when not found mean not creating///its History gap..     //---formulator
          //
          //[---Set_ PriceDistanc Targets---]
          switch(PeriodTMCom)///
          {         case  PERIOD_CURRENT:       { Set_Back__Levels__Class__Data(Periods_Levels._CURRENT,     _Levels_TPX, TechnicalO._CURRENT); } break; //
                    case  PERIOD_MN1:           { Set_Back__Levels__Class__Data(Periods_Levels._MN1,         _Levels_TPX, TechnicalO._MN1); } break; //
                    case  PERIOD_W1:            { Set_Back__Levels__Class__Data(Periods_Levels._W1,          _Levels_TPX, TechnicalO._W1); } break; //
                    case  PERIOD_D1:            { Set_Back__Levels__Class__Data(Periods_Levels._D1,          _Levels_TPX, TechnicalO._D1); } break; //
                    case  PERIOD_H4:            { Set_Back__Levels__Class__Data(Periods_Levels._H4,          _Levels_TPX, TechnicalO._H4); } break; //
                    case  PERIOD_H1:            { Set_Back__Levels__Class__Data(Periods_Levels._H1,          _Levels_TPX, TechnicalO._H1); } break; //
                    case  PERIOD_M30:           { Set_Back__Levels__Class__Data(Periods_Levels._M30,         _Levels_TPX, TechnicalO._M30); } break; //
                    case  PERIOD_M15:           { Set_Back__Levels__Class__Data(Periods_Levels._M15,         _Levels_TPX, TechnicalO._M15); } break; //
                    case  PERIOD_M5:            { Set_Back__Levels__Class__Data(Periods_Levels._M5,          _Levels_TPX, TechnicalO._M5); } break; //
                    case  PERIOD_M1:            { Set_Back__Levels__Class__Data(Periods_Levels._M1,          _Levels_TPX, TechnicalO._M1); } break; //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError,   "-C_GOLDVIP Error",  __LINE__, __FUNCTION__); //
          return IsDone = true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2, typename Typer3>
void S_GoldVipDesc_Calc::DefineValue__StartPrice__Calc(Typer1 & T1, Typer2 & T2, Typer3 & T3, Sgtd_TPX_All_PriceCalc  &Sgtd_TPX)
{         //---
          Sgtd_TPX._TFS_DirectionDOWN                = !T1.Is_Bulish;
          Sgtd_TPX._TFS_Price_CordinateThree         = T1.C3._Price;
//---
          Sgtd_TPX._ValueCalc_TrendGo                = T2.LEVEL_Price3_adjust.Trend.ArrayValue[2];     //T2.Period_X__LEVELPrice3_TrendGo_02_0382_adjust;          _Periods._CURRENT.LEVEL_Price3_adjust.Trend.ArrayValue[2]
          Sgtd_TPX._ValueCalc_TrendBack              = T2.LEVEL_Price3_adjust.Trend.ArrayValue[15];    //T2.Period_X__LEVELPrice3_TrendBack_15_0236_adjust;
          Sgtd_TPX._ValueCalc_TrendGo2               = T2.LEVEL_Price3_adjust.Trend.ArrayValue[1];     //T2.Period_X__LEVELPrice3_TrendGo_01_0236_adjust;
          Sgtd_TPX._ValueCalc_TrendBack2             = T2.LEVEL_Price3_adjust.Trend.ArrayValue[16];    //T2.Period_X__LEVELPrice3_TrendBack_16_0382_adjust;
//---
          Sgtd_TPX._TFS_StartPrice_Calc              = T3.StartPriceCalc;
          Sgtd_TPX._pipValue                         = T3.pipValue;
//---
          Sgtd_TPX._ValueCalc_CPrice_Cordinate_Three =  T1.CC3._Price;
//---
//_TFS_StartPrice_Calc                = GoldVIP.Signals_Periods.Period_4Hour.StartPriceCalc;
          //Cat.say(" StartPrice__Calc   " + T2.LEVEL_Price3_adjust.Trend.ArrayValue[2]);
          //Cat.say(" StartPrice__Calc   " + T2.LEVEL_Price3_adjust.Trend.ArrayValue[15]);
          //Cat.say(" StartPrice__Calc   " + T2.LEVEL_Price3_adjust.Trend.ArrayValue[1]);
          //Cat.say(" StartPrice__Calc   " + T2.LEVEL_Price3_adjust.Trend.ArrayValue[16]);
//
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer>
void S_GoldVipDesc_Calc::Set_Back__SignalValue__StartPrice__Calced(Typer & typer, Sgtd_TPX_All_PriceCalc  &Sgtd_TPX)
{
//
          typer.StartPriceCalc            = Sgtd_TPX._TFS_StartPrice_Calc;
          typer.StartPriceDesc            = Sgtd_TPX._StartPrice_Desc;
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2, typename Typer3>
void S_GoldVipDesc_Calc::DefineValue__StopLoss__Calc(Typer1 & T1, const Typer2 & T2, Typer3 & T3, Sgtd_TPX_All_PriceCalc  &Sgtd_TPX)
{         //---
          Sgtd_TPX._TFS_DirectionDOWN                = !T1.Is_Bulish;
          Sgtd_TPX._TFS_Price_CordinateThree         = T1.C3._Price;
//---
          Sgtd_TPX._ValueCalc_TrendGo                = T2.LEVEL_Price3_adjust.Trend.ArrayValue[2];     //T2.Period_X__LEVELPrice3_TrendGo_02_0382_adjust;          _Periods._CURRENT.LEVEL_Price3_adjust.Trend.ArrayValue[2]
          Sgtd_TPX._ValueCalc_TrendBack              = T2.LEVEL_Price3_adjust.Trend.ArrayValue[15];    //T2.Period_X__LEVELPrice3_TrendBack_15_0236_adjust;
          Sgtd_TPX._ValueCalc_TrendGo2               = T2.LEVEL_Price3_adjust.Trend.ArrayValue[1];     //T2.Period_X__LEVELPrice3_TrendGo_01_0236_adjust;
          Sgtd_TPX._ValueCalc_TrendBack2             = T2.LEVEL_Price3_adjust.Trend.ArrayValue[16];    //T2.Period_X__LEVELPrice3_TrendBack_16_0382_adjust;
//---
          Sgtd_TPX._TFS_StartPrice_Calc              = T3.StartPriceCalc;
          Sgtd_TPX._pipValue                         = T3.pipValue;
//---
          Sgtd_TPX._ValueCalc_CPrice_Cordinate_Three =  T1.CC3._Price;
//---
//_TFS_StartPrice_Calc                = GoldVIP.Signals_Periods.Period_4Hour.StartPriceCalc;
          //Cat.say("   " + Sgtd_TPX._TFS_StopLoss_ValueCalc);
          //Cat.say("   " + Sgtd_TPX._ValueCalc_TrendBack);
          //Cat.say(" StopLoss__Calc  " + T2.LEVEL_Price3_adjust.Trend.ArrayValue[15]);
//
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer>
void S_GoldVipDesc_Calc::Set_Back__SignalValue__StopLoss__Calced(Typer & typer, Sgtd_TPX_All_PriceCalc  &Sgtd_TPX)
{         typer.StopLossValueCalc         = Sgtd_TPX._TFS_StopLoss_ValueCalc;
          typer.StopLossValueDesc         = Sgtd_TPX._TFS_StopLoss_ValueDesc;
          typer.StopLossValueDictanceCalc = Sgtd_TPX._TFS_StopLoss_Value_DictanceCalc;
          typer.StopLossValueDictanceDesc = Sgtd_TPX._TFS_StopLoss_Value_DictanceDesc;//
//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2, typename Typer3>
void S_GoldVipDesc_Calc::Defines__Value__Calc(int TPX, Typer1 & T1, Typer2 & T2, Typer3 & T3)
{         T3._TFS_DirectionDOWN = !T2.Is_Bulish;
          if(TPX == 1) {T3._Set__Mode = 1; T3._ValueCalc_Safe       = T1.TP1ValueCalc;}//not geted yet///
          if(TPX == 2) {T3._Set__Mode = 2; T3._ValueCalc_Safe       = T1.TP2ValueCalc;}
          if(TPX == 3) {T3._Set__Mode = 3; T3._ValueCalc_Safe       = T1.TP3ValueCalc;}//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1>
void S_GoldVipDesc_Calc::Set_Reset__Signal__Values(Typer1 & T1)
{         T1.TimePeriodDesc               = "TimePeriod";    //---can set for every bar to know the each signall..
          T1.DateCalculatingDesc          = "2000-00-00";
          T1.ProfitPipDesc                = "+0000pip";
          T1.R4ValueDesc                  = "0000";
          T1.R2ValueDesc                  = "0000";
          T1.PPValueDesc                  = "0000";
          T1.S2ValueDesc                  = "0000";
          T1.S4ValueDesc                  = "0000";
//---
          T1.TP1ValueCalc                 = -1;                    //= Price3Level04_0618_adjust;
          T1.TP2ValueCalc                 = -1;                    //= Price3Level07_1000_adjust;
          T1.TP3ValueCalc                 = -1;                    // = Price3Level11_1618_adjust;
          T1.TP1ValueDesc                 = "TP1Value:-1";
          T1.TP2ValueDesc                 = "TP2Value:-1";
          T1.TP3ValueDesc                 = "TP3Value:-1";
//---
          T1.TP1PercentValueCalc          = -1;
          T1.TP2PercentValueCalc          = -1;
          T1.TP3PercentValueCalc          = -1;
          T1.TP1PercentValueDesc          = "TP1PercentValue:-1";
          T1.TP2PercentValueDesc          = "TP1PercentValue:-1";
          T1.TP3PercentValueDesc          = "TP3PercentValue:-1";
//---
          T1.TP1ValueDictanceDesc         = "TP1ValueDictance:-1";
          T1.TP2ValueDictanceDesc         = "TP2ValueDictance:-1";
          T1.TP3ValueDictanceDesc         = "TP3ValueDictance:-1";
//---
          T1.Trade_Type_Desc              = "TradeType__Desc:Stop";
          T1.StartPriceDesc               = "StartPriceDesc:-1";
          T1.StartTimeDesc                = "StartTimeDesc:-1";//"1460";
          T1.EndTimeDesc                  = "EndTimeDesc:-1";//"21-03-19";
//---
          T1.StopLossValueDictanceDesc    = "StopLossValueDictanceDesc:-1";
          T1.StopLossValueDesc            = "StopLossValueDesc:-1";
//-------------
          T1.StartPriceCalc               = -1;
          T1.StopLossValueDictanceCalc    = -1;                     //(int)MathAbs(S.StartPriceCalc - StopLossValueCalc);
          T1.StopLossValueCalc            = -1;
          T1.pipValue                     = 10; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1>
void S_GoldVipDesc_Calc::Set_TPX_Start_Time(Typer1 & T1)
{         T1.StartTimeDesc = "1460";
          T1.EndTimeDesc = "21-03-19";//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2>
void S_GoldVipDesc_Calc::Set__Direction(Typer1 & T1, Typer2 & T2)
{         T1.TFSDirectionDOWN =  !T2.Is_Bulish;
//UseName += PeriodTMComDesc;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  S_GoldVipDesc_Calc::Define__Levels__Value(string UseName, Sgtd_Fivo_Expantion_Levels & _Levels_TPX, ENUM_TIMEFRAMES PeriodTMCom)
{         //[---Get Levels Description Text---]
          if(true)      { for(int k = 0; k < 28 ; k++) {_Levels_TPX.LEVEL_TEXT.Trend.ArrayDesc[k]      = ObjectGetString(0, UseName, OBJPROP_LEVELTEXT, k);} } //
          //[---Get levels value by percent----]
          if(1)         { for(int k = 0; k < 28 ; k++) { _Levels_TPX.LEVEL_Percent.Trend.ArrayValue[k] = ObjectGet( UseName, OBJPROP_FIRSTLEVEL + k);}   } /// = ObjectGet(UseName, OBJPROP_FIRSTLEVEL + 0);
          Is_LevelsSet_ = ObjectFind(ChartData_ChartInfo.ID, UseName) >= 0 ? true : false;
          //[---Get Prices From Fibo extention---]
          if(1)
          {         _Levels_TPX.TPX_Price1                           = ObjectGet(UseName, OBJPROP_PRICE1);
                    _Levels_TPX.TPX_Price2                           = ObjectGet(UseName, OBJPROP_PRICE2);
                    _Levels_TPX.TPX_Price3                           = ObjectGet(UseName, OBJPROP_PRICE3);///CurretPricePivot
                    _Levels_TPX.TPX_PriceRange1and2                  = MathAbs(_Levels_TPX.TPX_Price1 - _Levels_TPX.TPX_Price2); //
          }
          //[---GetPriceLevels---]
          if(1)
          {         for(int k = 0; k < 28 ; k++)
                    {         if(k <= 14)   _Levels_TPX.LEVEL_Price3.Trend.ArrayValue[k] = _Levels_TPX.TPX_Price3 - (_Levels_TPX.LEVEL_Percent.Trend.ArrayValue[k] * _Levels_TPX.TPX_PriceRange1and2);//
                              else          _Levels_TPX.LEVEL_Price3.Trend.ArrayValue[k] = _Levels_TPX.TPX_Price3 - (_Levels_TPX.LEVEL_Percent.Trend.ArrayValue[k] * _Levels_TPX.TPX_PriceRange1and2);//  /(ARRAY HAS NEGATIVE VALUE)
                    }//
          } //
          //[---Set_PriceAdjust By Piont---] //digit is best choosiing    // (int)_Point // MathPow(TPX_Price3_LevelX4,100) //when not exist error wrong properity///
          if(1)
          {         int DigitAccure = 0;
                    if(ct_Drive.TDD.ct_Market_Symbol.POINT_PIP == 0.01)   { DigitAccure = 2; for(int k = 0; k < 28 ; k++) { _Levels_TPX.LEVEL_Price3_adjust.Trend.ArrayValue[k] = NormalizeDouble(_Levels_TPX.LEVEL_Price3.Trend.ArrayValue[k], DigitAccure);  }} //= MathRound(TPX_Price3_LevelX4); //MathFloor();
                    if(ct_Drive.TDD.ct_Market_Symbol.POINT_PIP == 0.0001) { DigitAccure = 4; for(int k = 0; k < 28 ; k++) { _Levels_TPX.LEVEL_Price3_adjust.Trend.ArrayValue[k] = NormalizeDouble(_Levels_TPX.LEVEL_Price3.Trend.ArrayValue[k], DigitAccure);  } } //
                    if(1)                                                      { for(int k = 0; k < 28 ; k++) { _Levels_TPX.LEVEL_Price3_adjust.Trend.ArrayValue[k] = NormalizeDouble(_Levels_TPX.LEVEL_Price3.Trend.ArrayValue[k], Digits);  }   }////
          }//
          //[---Set_ PriceDistance_Target---]
          if(true)
          {         double ClosePeriodTMCom = iClose(Symbol(), PeriodTMCom, 0);
                    if( _Levels_TPX.TFSDirectionDOWN)
                    {         _Levels_TPX.TPX_PriceDistance_Target_Start = NormalizeDouble(MathAbs(_Levels_TPX.LEVEL_Price3_adjust.Trend.ArrayValue[2]  - ClosePeriodTMCom), 2);
                              _Levels_TPX.TPX_PriceDistance_Target_One   = NormalizeDouble(MathAbs(_Levels_TPX.LEVEL_Price3_adjust.Trend.ArrayValue[4]  - ClosePeriodTMCom), 2);
                              _Levels_TPX.TPX_PriceDistance_Target_Two   = NormalizeDouble(MathAbs(_Levels_TPX.LEVEL_Price3_adjust.Trend.ArrayValue[7]  - ClosePeriodTMCom), 2);
                              _Levels_TPX.TPX_PriceDistance_Target_Three = NormalizeDouble(MathAbs(_Levels_TPX.LEVEL_Price3_adjust.Trend.ArrayValue[11] - ClosePeriodTMCom), 2); ///
                    }
                    else
                    {         _Levels_TPX.TPX_PriceDistance_Target_Start = NormalizeDouble(MathAbs(_Levels_TPX.LEVEL_Price3_adjust.Trend.ArrayValue[16] - ClosePeriodTMCom), 2);////close are same in last candels 0
                              _Levels_TPX.TPX_PriceDistance_Target_One   = NormalizeDouble(MathAbs(_Levels_TPX.LEVEL_Price3_adjust.Trend.ArrayValue[18] - ClosePeriodTMCom), 2);
                              _Levels_TPX.TPX_PriceDistance_Target_Two   = NormalizeDouble(MathAbs(_Levels_TPX.LEVEL_Price3_adjust.Trend.ArrayValue[21] - ClosePeriodTMCom), 2);
                              _Levels_TPX.TPX_PriceDistance_Target_Three = NormalizeDouble(MathAbs(_Levels_TPX.LEVEL_Price3_adjust.Trend.ArrayValue[25] - ClosePeriodTMCom), 2); //
                    } //
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2, typename Typer3 >
void S_GoldVipDesc_Calc::Set_Back__Levels__Class__Data(Typer1 &T1, Typer2 &T2, Typer3 &T3 )
{         //[---Set_ level of Periods_Levels._CURRENT----]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
          for(int k = 0; k < 28 ; k++) {  T1.LEVEL_Price3_adjust.Trend.ArrayValue[k]    = T2.LEVEL_Price3_adjust.Trend.ArrayValue[k];}
          //Cat.say(" Levels__Class  " + T1.LEVEL_Price3_adjust.Trend.ArrayValue[15]);
          //---
          //---
          T3.PriceDistance_Target_Start  = T2.TPX_PriceDistance_Target_Start;
          T3.PriceDistance_Target_One    = T2.TPX_PriceDistance_Target_One;
          T3.PriceDistance_Target_Two    = T2.TPX_PriceDistance_Target_Two;
          T3.PriceDistance_Target_Three  = T2.TPX_PriceDistance_Target_Three;
// Alert("#4GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendBack_25_1618_adjust: ", GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendBack_25_1618_adjust, " >> UseName: ", UseName); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer>
void S_GoldVipDesc_Calc::Set_Signal_Header(Typer & typer, string DefinePeriodDesc)
{         typer.TimePeriodDesc      = DefinePeriodDesc;////Main--Daily--4Hour--30Min--5Min///
          typer.DateCalculatingDesc = "2021-03-07";
          typer.ProfitPipDesc       = "+1730pip"; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer>
void S_GoldVipDesc_Calc::Set_Back__Signal__Pivot(Typer & typer)
{         typer.R4ValueDesc = "1977";
          typer.R2ValueDesc = "1807";
          typer.PPValueDesc = "1720";
          typer.S2ValueDesc = "1635";
          typer.S4ValueDesc = "1460"; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2, typename Typer3>
void S_GoldVipDesc_Calc::Set_TPX_values(Typer1 & T1, Typer2 & T2, Typer3  & T3, ENUM_TIMEFRAMES PeriodTMCom)
{         T3._TFS_DirectionDOWN =  !T1.Is_Bulish;
//if(TPX == 1) { _ValueCalc_TrendGo = PeriodCurrent_LEVELPrice3_TrendGo_04_0618_adjust; _ValueCalc_TrendBack = PeriodCurrent_LEVELPrice3_TrendBack_18_0618_adjust;} //
//if(TPX == 2) { _ValueCalc_TrendGo = PeriodCurrent_LEVELPrice3_TrendGo_07_1000_adjust; _ValueCalc_TrendBack = PeriodCurrent_LEVELPrice3_TrendBack_21_1000_adjust;} //
//if(TPX == 3) { _ValueCalc_TrendGo = PeriodCurrent_LEVELPrice3_TrendGo_11_1618_adjust; _ValueCalc_TrendBack = PeriodCurrent_LEVELPrice3_TrendBack_25_1618_adjust;} //
//_PriceDistance_Target_One = TechnicalO.PeriodCurrent_PriceDistanceTargetOne;
          T3._TFS_Time_CordinateOne           = T2.TimeCordinateOne;
          T3._TFS_Price_CordinateOne          = T2.PriceCordinateOne;
          T3._TFS_Time_CordinateTwo           = T2.TimeCordinateTwo;
          T3._TFS_Price_CordinateTwo          = T2.PriceCordinateTwo;
          T3._TFS_Time_CordinateThree         = T2.TimeCordinateThree;
          T3._TFS_Price_CordinateThree        = T2.PriceCordinateThree;
          T3._CloseValue                         = iClose(Symbol(), PeriodTMCom, 0); //Close[0];
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2, typename Typer3>
void S_GoldVipDesc_Calc::Set_TPX_TrendValues(Typer1 & T1, Typer2 & T2, Typer3 & T3, int TPX)
{         T2._TFS_DirectionDOWN =  !T3.Is_Bulish;
          if(TPX == 1) { T2._ValueCalc_TrendGo = T1.LEVEL_Price3_adjust.Trend.ArrayValue[4];  T2._ValueCalc_TrendBack = T1.LEVEL_Price3_adjust.Trend.ArrayValue[18];} ///T2.LEVEL_Price3_adjust.Trend.ArrayValue[2];    GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendGo_04_0618_adjust  GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendBack_18_0618_adjust
          if(TPX == 2) { T2._ValueCalc_TrendGo = T1.LEVEL_Price3_adjust.Trend.ArrayValue[7];  T2._ValueCalc_TrendBack = T1.LEVEL_Price3_adjust.Trend.ArrayValue[21];} //                                                    GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendGo_07_1000_adjust  GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendBack_21_1000_adjust
          if(TPX == 3) { T2._ValueCalc_TrendGo = T1.LEVEL_Price3_adjust.Trend.ArrayValue[11]; T2._ValueCalc_TrendBack = T1.LEVEL_Price3_adjust.Trend.ArrayValue[25];} //                                                    GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendGo_11_1618_adjust  GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendBack_25_1618_adjust
//_PriceDistance_Target_One = TechnicalO.PeriodCurrent_PriceDistanceTargetOne;
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2>
void S_GoldVipDesc_Calc::Set_Signal_TPsValueCals( Typer1 & T1, Typer2 & T2, int TPX )
{         if(TPX == 1) {T1.TP1ValueCalc = T2._ValueCalc;}
          if(TPX == 2) {T1.TP2ValueCalc = T2._ValueCalc;}
          if(TPX == 3) {T1.TP3ValueCalc = T2._ValueCalc;}
//Alert("GoldVIP.Signals_Periods.Period_Current.TP3ValueCalc>>>:  ", GoldVIP.Signals_Periods.Period_Current.TP3ValueCalc); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2, typename Typer3>
void S_GoldVipDesc_Calc::Set_TPX_ColorStatus(Typer1 & T1, Typer2 & T2, Typer3 & T3, int TPX)
{         T2._TFS_DirectionDOWN =  !T3.Is_Bulish;
          if(TPX == 1) {  T2._ValueCalc = T1.TP1ValueCalc; T2._PercentValueCalc = T1.TP1PercentValueCalc;} //
          if(TPX == 2) {  T2._ValueCalc = T1.TP2ValueCalc; T2._PercentValueCalc = T1.TP2PercentValueCalc;} //
          if(TPX == 3) {  T2._ValueCalc = T1.TP3ValueCalc; T2._PercentValueCalc = T1.TP3PercentValueCalc;} //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2>
void S_GoldVipDesc_Calc::Set_TPX_ColorStatus_Back(Typer1 & T1, Typer2 & T2, int TPX, bool RunColor)
{         if(TPX == 1)
          {         T1.Text050_TP1Color = T2._Text050_Color;
                    if(RunColor)T1.Text050_TP1Color = T2._TFS_SignalDefault_Color; }
          if(TPX == 2)
          {         T1.Text050_TP2Color = T2._Text050_Color;
                    if(RunColor)T1.Text050_TP2Color = T2._TFS_SignalDefault_Color; }
          if(TPX == 3)
          {         T1.Text050_TP3Color = T2._Text050_Color;
                    if(RunColor)T1.Text050_TP3Color = T2._TFS_SignalDefault_Color; } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2, typename Typer3, typename Typer4>
void S_GoldVipDesc_Calc::Set_TPX_PersentStatus(  Typer1 & T1,   Typer2 & T2,  Typer3 & T3,   Typer4 & typer4, int TPX, bool & TFSBoxSwitchIN)
{         T3._TFS_DirectionDOWN =  !typer4.Is_Bulish;
          if(TPX == 1) {T3._TFS_TPXValue_Calc =  T1.TP1ValueCalc;          TFSBoxSwitchIN = T3._TFS_DirectionDOWN ? _Data.__Data_TP1_DOWNTrend_Achived : _Data.__Data_TP1_UPTrend_Achived;} //TFSBoxSwitchOUT = BoxOutTP1ValueCalc_BoxInDOWNTrend;
          if(TPX == 2) {T3._TFS_TPXValue_Calc =  T1.TP2ValueCalc;          TFSBoxSwitchIN = T3._TFS_DirectionDOWN ? _Data.__Data_TP2_DOWNTrend_Achived : _Data.__Data_TP2_UPTrend_Achived;} // TFSBoxSwitchOUT = BoxOutTP2ValueCalc_BoxInDOWNTrend;
          if(TPX == 3) {T3._TFS_TPXValue_Calc =  T1.TP3ValueCalc;          TFSBoxSwitchIN = T3._TFS_DirectionDOWN ? _Data.__Data_TP3_DOWNTrend_Achived : _Data.__Data_TP3_UPTrend_Achived;} //TFSBoxSwitchOUT = BoxOutTP3ValueCalc_BoxInDOWNTrend;
          T3._TFS_StartPrice_Calc               = T1.StartPriceCalc;
          T3._TFS_Price_CordinateThree          = T2.PriceCordinateThree;
          if(TPX == 1)T3._TFS_PercentValue_CalcSafe     = T1.TP1PercentValueCalc;
          if(TPX == 2)T3._TFS_PercentValue_CalcSafe     = T1.TP2PercentValueCalc;
          if(TPX == 3)T3._TFS_PercentValue_CalcSafe     = T1.TP3PercentValueCalc;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2>
void S_GoldVipDesc_Calc::Set_SignalPersent(Typer1 & T1, Typer2 & T2, int TPX)
{         if(TPX == 1)
          {         T1.TP1PercentValueCalc = T2._TFS_PercentValue_Calc;//
                    //GoldVIP.Signals_Periods.Period_Current.TP3PercentValueDesc = DoubleToString(_TFS_PercentValue_Calc, Digits); //
                    T1.IsTp1Achived = T2._Touched_Target_TFS_ByRange;//
          }
          if(TPX == 2)
          {         T1.TP2PercentValueCalc = T2._TFS_PercentValue_Calc;
                    //GoldVIP.Signals_Periods.Period_Current.TP3PercentValueDesc = DoubleToString(_TFS_PercentValue_Calc, Digits); //
                    T1.IsTp2Achived = T2._Touched_Target_TFS_ByRange;//
          }
          if(TPX == 3)
          {         T1.TP3PercentValueCalc = T2._TFS_PercentValue_Calc;
                    //GoldVIP.Signals_Periods.Period_Current.TP3PercentValueDesc = DoubleToString(_TFS_PercentValue_Calc, Digits); //
                    T1.IsTp3Achived = T2._Touched_Target_TFS_ByRange;//
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2>
void S_GoldVipDesc_Calc::Set_TPX_Desc(Typer1 & T1, Typer2 & T2)
{         //[ Set___SubSignal__TradeType__Calc = "Stop";]
          if(T2.Is_Bulish)  { T1.Trade_Type_Desc = "Buy";}
          else                  { T1.Trade_Type_Desc = "Sell";} //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2, typename Typer3, typename Typer4>
void S_GoldVipDesc_Calc::Set_TPX_Desc2(Typer1 & T1, Typer2 & T2, Typer3 & T3, Typer4 & typer4, int TPX)
{         T2._TFS_DirectionDOWN =  ! T3.Is_Bulish;     T1.IsBulish = T3.Is_Bulish; //
          if(TPX == 1) {  T2._ValueCalc = T1.TP1ValueCalc; T2._ValueDesc = T1.TP1ValueDesc; T2._PercentValueCalc = T1.TP1PercentValueCalc; T2._TFS_PriceDistance_TargetTPX = typer4.PriceDistance_Target_One;} //
          if(TPX == 2) {  T2._ValueCalc = T1.TP2ValueCalc; T2._ValueDesc = T1.TP2ValueDesc; T2._PercentValueCalc = T1.TP2PercentValueCalc; T2._TFS_PriceDistance_TargetTPX = typer4.PriceDistance_Target_Two;} //
          if(TPX == 3) {  T2._ValueCalc = T1.TP3ValueCalc; T2._ValueDesc = T1.TP3ValueDesc; T2._PercentValueCalc = T1.TP3PercentValueCalc; T2._TFS_PriceDistance_TargetTPX = typer4.PriceDistance_Target_Three;} //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2>
void S_GoldVipDesc_Calc::Set_Back__Signal__Desc(Typer1 & T1, Typer2 & T2, int TPX)
{         if(TPX == 1) {T1.TP1ValueDesc = T2._ValueDesc; T1.TP1PercentValueDesc = T2._PercentValueDesc; T1.TP1ValueDictanceDesc = T2._ValueDictance_Desc;}
          if(TPX == 2) {T1.TP2ValueDesc = T2._ValueDesc; T1.TP2PercentValueDesc = T2._PercentValueDesc; T1.TP2ValueDictanceDesc = T2._ValueDictance_Desc;}
          if(TPX == 3) {T1.TP3ValueDesc = T2._ValueDesc; T1.TP3PercentValueDesc = T2._PercentValueDesc; T1.TP3ValueDictanceDesc = T2._ValueDictance_Desc;} //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer1, typename Typer2, typename Typer3, typename Typer4>
void S_GoldVipDesc_Calc::Set_TPX_Label(Typer1 & T1, Typer2 & T2, Typer3 & T3, Typer4 & typer4)
{         //
          T3._TFS_DirectionDOWN        = !typer4.Is_Bulish;
          T2.CTimeCordinateThree_TFS        =  typer4.C3._Time;
          //GradientPositive
          if(T3._TFS_DirectionDOWN)
          {         T2.TPX_LEVELPrice3    = T1.LEVEL_Price3_adjust.Trend.ArrayValue[4];//Period_X__LEVELPrice3_TrendGo_04_0618_adjust;////need fore rectangle shapes //LEVEL_Price3_adjust.Trend.ArrayValue[4];//
                    T2.CPriceCordinateTwo = T1.LEVEL_Price3_adjust.Trend.ArrayValue[4];//Period_X__LEVELPrice3_TrendGo_04_0618_adjust; //
                    //------
                    T2.LabelOneName       = "GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendGo_04_0618_adjust"; //
                    T2.YY_061             = T1.LEVEL_Price3_adjust.Trend.ArrayValue[4];//Period_X__LEVELPrice3_TrendGo_04_0618_adjust;//
                    //-------
                    T2.LabelTwoName       = "GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendGo_07_1000_adjust"; //
                    T2.YY_100             = T1.LEVEL_Price3_adjust.Trend.ArrayValue[7];//Period_X__LEVELPrice3_TrendGo_07_1000_adjust;//
                    //------
                    T2.LabelThereName     = "GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendGo_11_1618_adjust"; //
                    T2.YY_161             = T1.LEVEL_Price3_adjust.Trend.ArrayValue[11];//Period_X__LEVELPrice3_TrendGo_11_1618_adjust;//
                    //------
                    T2.LabelForeName      = "GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendGo_02_0382_adjust";//
                    T2.YY_032             = T1.LEVEL_Price3_adjust.Trend.ArrayValue[2];//Period_X__LEVELPrice3_TrendGo_02_0382_adjust;
                    //
          }
          else
          {         T2.TPX_LEVELPrice3    = T1.LEVEL_Price3_adjust.Trend.ArrayValue[18];//Period_X__LEVELPrice3_TrendBack_18_0618_adjust;//
                    T2.CPriceCordinateTwo = T1.LEVEL_Price3_adjust.Trend.ArrayValue[18];//Period_X__LEVELPrice3_TrendBack_18_0618_adjust;//
                    //------
                    T2.LabelOneName       = "GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendBack_18_0618_adjust";//
                    T2.YY_061             = T1.LEVEL_Price3_adjust.Trend.ArrayValue[18];//Period_X__LEVELPrice3_TrendBack_18_0618_adjust;//
                    //------
                    T2.LabelTwoName       = "GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendBack_21_1000_adjust"; //
                    T2.YY_100             = T1.LEVEL_Price3_adjust.Trend.ArrayValue[21];//Period_X__LEVELPrice3_TrendBack_21_1000_adjust;//
                    //------
                    T2.LabelThereName     = "GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendBack_25_1618_adjust"; //
                    T2.YY_161             = T1.LEVEL_Price3_adjust.Trend.ArrayValue[25];//Period_X__LEVELPrice3_TrendBack_25_1618_adjust;//
                    //------
                    T2.LabelForeName      = "GOLDVIP_LEVELCurrent.Period_X__LEVELPrice3_TrendBack_16_0382_adjust";//
                    T2.YY_032             = T1.LEVEL_Price3_adjust.Trend.ArrayValue[16];//Period_X__LEVELPrice3_TrendBack_16_0382_adjust;
                    //
          }
          //---    Alert("YY_032: ", T2.YY_032, "YY_161: ", T2.YY_161); ///
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_GOLDVIP ///NONT DERIVE JUST CAN USE BY C_GOLDVIP : (public | protected | private)  C_GOLDVIP
{
private:
          //---Errors.... , not change tab.
          //---Errors.... , not draw fibo extention.
          //---Errors.... , not signaling work.
          Sgp_RightMenuPad_Color C_GOLDVIP_Color;
          //--------------------------------------
public:
          void     /* #1 */                     C_GOLDVIP();   //--- Desc_Calc.Get__Panel__calculate(..)
          void                                  ~C_GOLDVIP();
          bool                                  Update();
          bool                                  Is_Updated;
          void                                  Main();
          //**************************************************
          C_GOLDVIP_Panel                       Panel;
          S_GoldVipDesc_Calc                    Desc_Calc;     //---calcer
          //---
          //---
          Std_GoldVip_period                    periods;
          Ctd_GoldVIP_Signals_Periods           Signals_Periods;                      ///>>OKEY 040
          //---
public://func members
          //==========================================================================
          void                  OnChartEvents(const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None");
          void                  OBJECT_CLICK();
          void                  Event_MOUSE_MOVE();
          //==========================================================================
          void                  ColoringDraw(string sparam);
          void                  ColoringTarget(string sparam);
          //==========================================================================
          void    /* #2  */     _Call__Panel(Std_GoldVip_Panel_data_Frame & client_Frame);                                                                     //#A

          void    /* #21 */     OnShow__Panel__Frame(Std_GoldVip_Panel_data_Frame & client_Frame);                                                            //#AA  haneling frame

          //
          void    /* #22 */     OnShow__Panel__Desc(Std_GoldVip_Panel_data_Frame & client_Frame);                                                             //#AB     haneling desc
          void                  Show__Descs__(Std_GoldVip_Panel_data_Desc & Client_Desc);                                                                                //#ABC2

          //
          void                  Fill__Panel_TPXKey__Texts(Std_GoldVip_Panel_data_Frame & client, Std_GoldVip_Panel_data_Desc &ClientDesc, ENUM_TIMEFRAMES PeriodTMCom, string SozCom = "-");    //#ABC
          void                  Set_Update__Signal__data__ByPeriod(Std_GoldVip_Panel_data_Desc_TPX &Out_ClientTPX, ENUM_TIMEFRAMES PeriodTMCom, string SozCom = "-"); //#ABC1
          void                  Set___HistoryGap( string &  SozSet_, ENUM_TIMEFRAMES TF);
          //------------------------------------------------
          template<typename Y1, typename Y2,>
          void                  Set_Desc( Std_GoldVip_Panel_data_Desc_TPX & Client, Y1 & y, Y2 & y2, string desc, string SozCom = "-");

          //------------------------------------------------

          void                  Panel_PeriodCom_Define(Std_GoldVip_Panel_data_Frame &client);
          void                  Panel_Coloring(ENUM_TIMEFRAMES PeriodTMCom);
          //----

          void                  Event_Panel_STATE();

          bool                  Draw__Fibo__Extention( ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT);
          string                TFXHistoryGapRestore(ENUM_TIMEFRAMES PeriodTMCom, string &TFXHistoryGapDesc, bool &TFXHistoryGapValue);
          void Set_Back_Gap(HistoryGap_Data & _Data,  string TFXHistoryGapDesc, bool TFXHistoryGapValue)
          {         TFXHistoryGapDesc  = _Data.HistoryGap_Desc   ;
                    TFXHistoryGapValue = _Data.Is_HistoryGap ;//
          }
          void __Detach__Panel()
          {         Std_GoldVip_Panel_data_Frame Detach;
                    Detach.WhichMode           = MODE_CREATE;
                    Detach.IsKey               = false;
                    Detach.Is_Reset_Desc       = false ;
                    Detach.PeriodTMCom         = Panel.Key_PeriodSafe;
                    _Call__Panel(Detach); //>>>RightMiddel Pannel
          }//
};//end class interface

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_GOLDVIP::C_GOLDVIP()
{         RunCallFunction++;
          //--------------------------------------
          //--------------------------------------
          //=======================================
          Main();
          //---for Ct_DevCondicator::Ct_DevCondicator()   void St_CondicatorData_Extern_Signals::Extern_Trade__Commands__Alfa()
          Std_GoldVip_Panel_data_Frame CGoldVip;
          CGoldVip.WhichMode           = MODE_CREATE;
          CGoldVip.IsKey               = true;
          CGoldVip.Is_Reset_Desc       = true;
          CGoldVip.Is_Created          = GoldVIP.Panel.Is_CCreated = false;
          CGoldVip.IsCallMiniMode      = GoldVIP.Panel.IsPadPress_Mini   = true;
          CGoldVip.PeriodTMCom         = PERIOD_CURRENT;
          CGoldVip.MoveX               =  300;
          CGoldVip.MoveY               = -170;
          CGoldVip.SizeX               = 120;
          CGoldVip.SizeY               = 0;
          CGoldVip.SizeExtendX         = 0;
          CGoldVip.SizeExtendY         = 0;
          GoldVIP._Call__Panel(CGoldVip);//
          CGoldVip.IsKey               = false;
          GoldVIP._Call__Panel(CGoldVip);//
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_GOLDVIP::~C_GOLDVIP()
{}
//+------------------------------------------------------------------+
bool C_GOLDVIP::Update()
{         //-----
          Main();//>>>> all period signals update>>GoldVIP.Signals_Periods._M5
          return Is_Updated = true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::Main()
{         //---
          Panel.Is_CCreate      = true;
          Panel.Is_CMove        = false;
          bool Is_Show          = false;//
          //
          Desc_Calc.Get__Panel__calculate(MODE_CREATE, true, Is_Show ); //calc before setting values    //#1 self     and      //#2 C_TECHNICAL
          C_GOLDVIP_Color.Set_(clrBlue, clrWhite, clrNavy, clrNavy, clrRed, clrYellowGreen, clrOrange);//
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::ColoringDraw(string sparam)
{         //string sparam, bool & KeyClicked, string PeriodTFS
          string PeriodTFS = "__Period__4Hour__";
          static bool KeyClicked = true;
          // bool KeyClicke; //string PeriodTFS;
          if(Event.sparam == "MoveLogoLeftO2__Period__4Hour__Target" || Event.sparam == "MoveLogoLeftO1__Period__4Hour__Target" || Event.sparam == "MoveLogo__Period__4Hour__Target"
                              //Event.sparam == "LeftO3-__Period__4Hour__Tab"
            )
          {         ObjectSetInteger(0, "MoveLogoLeftO2__Period__Main__Target", OBJPROP_COLOR, clrRed);
                    ObjectSetInteger(0, "MoveLogo__Period__Main__Target", OBJPROP_COLOR, clrWhite);
                    //---
                    ObjectSetInteger(0, "MoveLogoLeftO2__Period__Daily__Target", OBJPROP_COLOR, clrRed); //
                    ObjectSetInteger(0, "MoveLogo__Period__Daily__Target", OBJPROP_COLOR, clrWhite);
                    //----
                    ObjectSetInteger(0, "MoveLogoLeftO2__Period__4Hour__Target", OBJPROP_COLOR, clrRed); //
                    ObjectSetInteger(0, "MoveLogo__Period__4Hour__Target", OBJPROP_COLOR, clrWhite);
                    //--
                    ObjectSetInteger(0, "MoveLogoLeftO2__Period__30Min__Target", OBJPROP_COLOR, clrRed); //
                    ObjectSetInteger(0, "MoveLogo__Period__30Min__Target", OBJPROP_COLOR, clrWhite);
                    ///--
                    ObjectSetInteger(0, "MoveLogoLeftO2__Period__5Min__Target", OBJPROP_COLOR, clrRed); //
                    ObjectSetInteger(0, "MoveLogo__Period__5Min__Target", OBJPROP_COLOR, clrWhite);
                    //--
                    if(KeyClicked)
                    {         ObjectSetInteger(0, "MoveLogoLeftO2" + PeriodTFS + "Target", OBJPROP_COLOR, clrYellowGreen); //
                              ObjectSetInteger(0, "MoveLogo" + PeriodTFS + "Target", OBJPROP_COLOR, clrBlack); //
                              KeyClicked = false; //
                    } //
                    else KeyClicked = true; //
          }
          //-----------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::ColoringTarget (string sparam)
{         //string sparam, bool & KeyClicked, string PeriodTFS
          string PeriodTFS = "__Period__4Hour__";
          static bool KeyClicked = true;
          // bool KeyClicke; //string PeriodTFS;
          if(Event.sparam == "MoveLogoLeftO2__Period__4Hour__Target" || Event.sparam == "MoveLogoLeftO1__Period__4Hour__Target" || Event.sparam == "MoveLogo__Period__4Hour__Target"
                              //Event.sparam == "LeftO3-__Period__4Hour__Tab"
            )
          {         ObjectSetInteger(0, "MoveLogoLeftO2__Period__Main__Target", OBJPROP_COLOR, clrRed);
                    ObjectSetInteger(0, "MoveLogo__Period__Main__Target", OBJPROP_COLOR, clrWhite);
                    //---
                    ObjectSetInteger(0, "MoveLogoLeftO2__Period__Daily__Target", OBJPROP_COLOR, clrRed); //
                    ObjectSetInteger(0, "MoveLogo__Period__Daily__Target", OBJPROP_COLOR, clrWhite);
                    //----
                    ObjectSetInteger(0, "MoveLogoLeftO2__Period__4Hour__Target", OBJPROP_COLOR, clrRed); //
                    ObjectSetInteger(0, "MoveLogo__Period__4Hour__Target", OBJPROP_COLOR, clrWhite);
                    //--
                    ObjectSetInteger(0, "MoveLogoLeftO2__Period__30Min__Target", OBJPROP_COLOR, clrRed); //
                    ObjectSetInteger(0, "MoveLogo__Period__30Min__Target", OBJPROP_COLOR, clrWhite);
                    ///--
                    ObjectSetInteger(0, "MoveLogoLeftO2__Period__5Min__Target", OBJPROP_COLOR, clrRed); //
                    ObjectSetInteger(0, "MoveLogo__Period__5Min__Target", OBJPROP_COLOR, clrWhite);
                    //--
                    if(KeyClicked)
                    {         ObjectSetInteger(0, "MoveLogoLeftO2" + PeriodTFS + "Target", OBJPROP_COLOR, clrYellowGreen); //
                              ObjectSetInteger(0, "MoveLogo" + PeriodTFS + "Target", OBJPROP_COLOR, clrBlack); //
                              KeyClicked = false; //
                    } //
                    else KeyClicked = true; //
          }
          //-----------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::Event_MOUSE_MOVE()
{         //------------------------------------------------------------------165
          if(Panel.CIs_Move)
          {         Std_GoldVip_Panel_data_Frame CMove;
                    CMove.WhichMode           = MODE_MOVE;
                    CMove.IsKey               = true;
                    CMove.Is_Reset_Desc       = true;
                    CMove.Is_Created          = Panel.Is_CCreated           = true;
                    CMove.IsCallMiniMode      = Panel.IsPadPress_Mini       = false;
                    CMove.PeriodTMCom         = Panel.Key_PeriodSafe;
                    CMove.MoveX               = Panel.X_Last = (int)(Event.lparam - 233) + 200;
                    CMove.MoveY               = Panel.Y_Last = (int)(Event.dparam - 210);
                    //CMove.SaveMoveXCom  =;
                    //CMove.SaveMoveYCom  =;
                    CMove.SizeX               = 120;
                    CMove.SizeY               = 0;
                    CMove.SizeExtendX         = 0;
                    CMove.SizeExtendY         = 0;
                    _Call__Panel(CMove);
                    //0//_Call__Panel(MODE_MOVE, true, Is_CShow, Is_CCreated, Is_CCreateMini, Key_Period, (int)(Event.lparam - 233), (int)(Event.dparam - 210), 120);
                    //
          }
          //---
          //---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::OBJECT_CLICK()
{         //-----------------------------
          color ColorOne = clrOrange ;
          color ColorTwo = clrFireBrick;
          color ColorTwo2 = clrFireBrick;
          color ColorLogo = clrBlue;
          color ColorBody = clrWhite;
          color ColorBodyMargine = clrNavy;
          color ColorBodyText = clrNavy;
          color ColorBodyCyrcle = clrRed;
          color clrOne = clrOrange ;
          color clrTwo = clrFireBrick;
          color clrTwo2 = clrFireBrick;
          color clrLogo = clrBlue;
          color clrBody = clrWhite;
          color clrBodyMargine = clrNavy;
          color clrBodyText = clrNavy;
          color clrBodyCyrcleUnPress = clrRed; //
          color clrBodyCyrclePress = clrYellowGreen; //
          color clrBodyCyrcleActive = clrOrange;
          //---
          //---
          //---
          if(Event.sparam == "Panel__Mini__-X" || Event.sparam == "Panel__Mini__LeftO2-X" || Event.sparam == "Panel__Mini__LeftO1-X")
          {         Panel.IsMini = Panel.IsMini ? false : true;
                    //---Alert("IsMini: ", IsMini);
                    if(Panel.IsMini)//deleting
                    {         ///solution/// when the deleting the frist one is created one for the one is existed....
                              //Key_PeriodSafe = Key_Period;
                              //
                              Std_GoldVip_Panel_data_Frame Cmini;
                              Cmini.WhichMode           = MODE_MINI; ///MODE_CREATE
                              Cmini.IsKey               = true;
                              Cmini.Is_Reset_Desc       = true;
                              Cmini.Is_Created          = Panel.Is_CCreated           = true;
                              Cmini.IsCallMiniMode      = Panel.IsPadPress_Mini       = true;
                              Cmini.PeriodTMCom         = Panel.Key_PeriodSafe;
                              Cmini.MoveX               = 0;
                              Cmini.MoveY               = 0;
                              Cmini.SizeX               = 0;
                              Cmini.SizeY               = 0;
                              Cmini.SizeExtendX         = 0;
                              Cmini.SizeExtendY         = 0;
                              _Call__Panel(Cmini); //>>>RightMiddel Pannel ///deleting//must have perod value...becaused eroriing
                              if(ObjectFind("Panel__Mini__LeftO2-X") >= 0) ObjectSetInteger(0, "Panel__Mini__LeftO2-X", OBJPROP_COLOR, clrYellowGreen); //
                              //---work donw
                    }
                    else///creating
                    {         //
                              Std_GoldVip_Panel_data_Frame Cmini;
                              Cmini.WhichMode           = MODE_MINI;
                              Cmini.IsKey               = false;
                              Cmini.Is_Reset_Desc       = false;
                              Cmini.Is_Created          = Panel.Is_CCreated           = true;;
                              Cmini.IsCallMiniMode      = Panel.IsPadPress_Mini      = false;;
                              Cmini.PeriodTMCom         = Panel.Key_PeriodSafe;
                              Cmini.MoveX               = (int)Event.lparam + 5;
                              Cmini.MoveY               = (int)Event.dparam - 212;
                              Cmini.SizeX               = 120;
                              Cmini.SizeY               = 0;
                              Cmini.SizeExtendX         = 0;
                              Cmini.SizeExtendY         = 0;
                              _Call__Panel(Cmini); //>>>RightMiddel Pannel ///>>>Creating
                              if(ObjectFind("Panel__Mini__LeftO2-X") >= 0) ObjectSetInteger(0, "Panel__Mini__LeftO2-X", OBJPROP_COLOR, clrRed); //
                              Event_Panel_STATE();///
                              ///
                    } //
                    //
          }
          //---
          //---
          //---
          if(Event.sparam == "GoldVIP_ExitLogo" || Event.sparam == "GoldVIP_ExitLeftO2" || Event.sparam == "GoldVIP_ExitLeftO1")
          {         //Alert("Panel_Call___GoldVIP_ExitLogo A");
                    Std_GoldVip_Panel_data_Frame CExit;
                    CExit.WhichMode           = MODE_CREATE;
                    CExit.IsKey               = false;
                    CExit.Is_Reset_Desc       = false;
                    CExit.Is_Created          = Panel.Is_CCreated           = false;
                    CExit.IsCallMiniMode      = Panel.IsPadPress_Mini       = false;
                    CExit.PeriodTMCom         = Panel.Key_PeriodSafe;
                    CExit.MoveX               = 0;
                    CExit.MoveY               = 0;
                    CExit.SizeX               = 0;
                    CExit.SizeY               = 0;
                    CExit.SizeExtendX         = 0;
                    CExit.SizeExtendY         = 0;
                    _Call__Panel(CExit); //>>>RightMiddel Pannel
                    Panel.Is_CordinateChange  = false;
                    GoldVIP.Panel.IsPadPress = false;
                    //GoldVIP._Call__Panel(MODE_CREATE, TPX, true, false, false, PERIOD_CURRENT, 300 + GoldVIP.CMoveX, -170 + GoldVIP.CMoveY, 120);}
                    //===================
                    //Alert("Panel_Call___GoldVIP_ExitLogo B");
                    //===================
                    //
                    //
          }
          //---
          //---
          //---
          if(Event.sparam == "MoveLogo" || Event.sparam == "MoveLogoLeftO2" || Event.sparam == "MoveLogoLeftO1")
          {         if(!Panel.CIs_Move) {Panel.CIs_Move = true;  ObjectSetInteger(0, "MoveLogo", OBJPROP_COLOR, clrBlue);  } //---clrRed,clrGray
                    else                {Panel.CIs_Move = false; ObjectSetInteger(0, "MoveLogo", OBJPROP_COLOR, clrWhite); } //---clrWhite
                    //
          }
          //---
          //---
          //---
          if(Event.sparam == "GoldVIP_ClearLogo" || Event.sparam == "GoldVIP_ClearLeftO2" || Event.sparam == "GoldVIP_ClearLeftO1")
          {         //
                    //
                    //===================
                    Panel.Is_PadClear = true;
                    //
                    Std_GoldVip_Panel_data_Frame CClear;
                    CClear.WhichMode           = MODE_CREATE;
                    CClear.IsKey               = false;
                    CClear.Is_Reset_Desc       = false;
                    CClear.Is_Created          = Panel.Is_CCreated           = false;
                    CClear.IsCallMiniMode      = Panel.IsPadPress_Mini       = false;
                    CClear.PeriodTMCom         = Panel.Key_PeriodSafe;
                    CClear.MoveX               = 0;
                    CClear.MoveY               = 0;
                    CClear.SizeX               = 0;
                    CClear.SizeY               = 0;
                    CClear.SizeExtendX         = 0;
                    CClear.SizeExtendY         = 0;
                    _Call__Panel(CClear); //>>>RightMiddel Pannel
                    ///>>>IsPadPress_Mini = true;
                    Panel.CIs_Move = false; //
                    //===================
                    //Alert("GoldVIP_ClearLogo");
                    //===================
                    Panel.Is_PadClear = false;
                    //
                    CClear.WhichMode           = MODE_CREATE;
                    CClear.IsKey               = true;
                    CClear.Is_Reset_Desc       = true;
                    CClear.Is_Created          = Panel.Is_CCreated           = false;
                    CClear.IsCallMiniMode      = Panel.IsPadPress_Mini       = false;
                    CClear.PeriodTMCom         = Panel.Key_PeriodSafe;
                    CClear.MoveX               = 300;
                    CClear.MoveY               = -170;
                    CClear.SizeX               = 120;
                    CClear.SizeY               = 0;
                    CClear.SizeExtendX         = 0;
                    CClear.SizeExtendY         = 0;
                    _Call__Panel(CClear); //>>>RightMiddel Pannel//creating///CMoveY
                    GoldVIP.Panel.IsPadPress = true;
                    Panel.Is_CordinateChange  = false;
                    ///>>>IsPadPress_Mini = false;
                    //===================
                    //===================
                    //
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          if(Event.sparam == "Logo-__Period__Main__Tab" || Event.sparam == "LeftO5-__Period__Main__Tab" || Event.sparam == "LeftO2-__Period__Main__Tab" || Event.sparam == "LeftO4-__Period__Main__Tab")
          {         __Detach__Panel();
                    Std_GoldVip_Panel_data_Frame CPeriodMain;
                    //
                    CPeriodMain.WhichMode           = MODE_MODIFY;
                    CPeriodMain.IsKey               = True;
                    CPeriodMain.Is_Reset_Desc       = true;
                    CPeriodMain.Is_Created          = Panel.Is_CCreated           = true;
                    CPeriodMain.IsCallMiniMode      = Panel.IsPadPress_Mini       = false;
                    CPeriodMain.PeriodTMCom         = Panel.Key_PeriodSafe = PERIOD_CURRENT;
                    //----
                    if(Panel.Is_CordinateChange)        {CPeriodMain.MoveX = Panel.X_Last; CPeriodMain.MoveY = Panel.Y_Last;}
                    else                                {CPeriodMain.MoveX = 300;  CPeriodMain.MoveY = -170;}
                    //CPeriodMain.MoveX               = 300 ;// + Panel.CMoveX_independ;      //   300
                    //CPeriodMain.MoveY               = -170;//+ Panel.CMoveY_independ;     //  -170
                    CPeriodMain.SizeX               = 120;
                    CPeriodMain.SizeY               = 0;
                    CPeriodMain.SizeExtendX         = 0;
                    CPeriodMain.SizeExtendY         = 0;
                    _Call__Panel(CPeriodMain); //>>>RightMiddel Pannel
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          if(Event.sparam == "Logo-__Period__Daily__Tab" || Event.sparam == "LeftO5-__Period__Daily__Tab" || Event.sparam == "LeftO2-__Period__Daily__Tab" || Event.sparam == "LeftO4-__Period__Daily__Tab")
          {         //
                    __Detach__Panel();
                    Std_GoldVip_Panel_data_Frame CPeriodDaily;
                    CPeriodDaily.WhichMode           = MODE_MODIFY;
                    CPeriodDaily.IsKey               = True;
                    CPeriodDaily.Is_Reset_Desc       = true;
                    CPeriodDaily.Is_Created          = Panel.Is_CCreated           = true;
                    CPeriodDaily.IsCallMiniMode      = Panel.IsPadPress_Mini       = false;
                    CPeriodDaily.PeriodTMCom         = Panel.Key_PeriodSafe        = PERIOD_D1;
                    if(Panel.Is_CordinateChange)        {CPeriodDaily.MoveX = Panel.X_Last; CPeriodDaily.MoveY = Panel.Y_Last;}
                    else                                {CPeriodDaily.MoveX = 300;  CPeriodDaily.MoveY = -170;}
                    CPeriodDaily.SizeX               = 120;
                    CPeriodDaily.SizeY               = 0;
                    CPeriodDaily.SizeExtendX         = 0;
                    CPeriodDaily.SizeExtendY         = 0;
                    _Call__Panel(CPeriodDaily); //>>>RightMiddel Pannel
                    //0//_Call__Panel(MODE_CREATE, false, false, true, true,  Key_PeriodSafe = PERIOD_D1, 130 + CMoveX, -170 + CMoveY, 120); //>>>RightMiddel Pannel
                    //
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          if(Event.sparam == "Logo-__Period__4Hour__Tab" || Event.sparam == "LeftO5-__Period__4Hour__Tab" || Event.sparam == "LeftO2-__Period__4Hour__Tab" || Event.sparam == "LeftO4-__Period__4Hour__Tab")
          {         __Detach__Panel();
                    //
                    Std_GoldVip_Panel_data_Frame CPeriod4Hour;
                    CPeriod4Hour.WhichMode           = MODE_MODIFY;
                    CPeriod4Hour.IsKey               = True;
                    CPeriod4Hour.Is_Reset_Desc       = true;
                    CPeriod4Hour.Is_Created          = Panel.Is_CCreated           = true;
                    CPeriod4Hour.IsCallMiniMode      = Panel.IsPadPress_Mini       = false;
                    CPeriod4Hour.PeriodTMCom         = Panel.Key_PeriodSafe        = PERIOD_H4;
                    if(Panel.Is_CordinateChange)        {CPeriod4Hour.MoveX = Panel.X_Last; CPeriod4Hour.MoveY = Panel.Y_Last;}
                    else                                {CPeriod4Hour.MoveX = 300;  CPeriod4Hour.MoveY = -170;}
                    CPeriod4Hour.SizeX               = 120;
                    CPeriod4Hour.SizeY               = 0;
                    CPeriod4Hour.SizeExtendX         = 0;
                    CPeriod4Hour.SizeExtendY         = 0;
                    _Call__Panel(CPeriod4Hour); //>>>RightMiddel Pannel
                    //
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          if(Event.sparam == "Logo-__Period__30Min__Tab" || Event.sparam == "LeftO5-__Period__30Min__Tab" || Event.sparam == "LeftO2-__Period__30Min__Tab" || Event.sparam == "LeftO4-__Period__30Min__Tab" )
          {         __Detach__Panel();
                    Std_GoldVip_Panel_data_Frame CPeriod30Min;
                    //
                    CPeriod30Min.WhichMode           = MODE_MODIFY;
                    CPeriod30Min.IsKey               = True;
                    CPeriod30Min.Is_Reset_Desc       = true;
                    CPeriod30Min.Is_Created          = Panel.Is_CCreated           = true;
                    CPeriod30Min.IsCallMiniMode      = Panel.IsPadPress_Mini       = false;
                    CPeriod30Min.PeriodTMCom         = Panel.Key_PeriodSafe        = PERIOD_M30;
                    if(Panel.Is_CordinateChange)        {CPeriod30Min.MoveX = Panel.X_Last; CPeriod30Min.MoveY = Panel.Y_Last;}
                    else                                {CPeriod30Min.MoveX = 300;  CPeriod30Min.MoveY = -170;}
                    CPeriod30Min.SizeX               = 120;
                    CPeriod30Min.SizeY               = 0;
                    CPeriod30Min.SizeExtendX         = 0;
                    CPeriod30Min.SizeExtendY         = 0;
                    _Call__Panel(CPeriod30Min); //>>>RightMiddel Pannel
                    //Alert("StatusSubPanelGoldVip(FuncCom, 0, false, false, true, true, Period30Min, PERIOD_M30, 130, -170, 120)");
                    //
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          if(Event.sparam == "Logo-__Period__5Min__Tab" || Event.sparam == "LeftO5-__Period__5Min__Tab" || Event.sparam == "LeftO2-__Period__5Min__Tab" || Event.sparam == "LeftO4-__Period__5Min__Tab")
          {         __Detach__Panel();
                    Std_GoldVip_Panel_data_Frame CPeriod5Min;
                    //
                    CPeriod5Min.WhichMode           = MODE_MODIFY;
                    CPeriod5Min.IsKey               = True;
                    CPeriod5Min.Is_Reset_Desc       = true;
                    CPeriod5Min.Is_Created          = Panel.Is_CCreated           = true;
                    CPeriod5Min.IsCallMiniMode      = Panel.IsPadPress_Mini       = false;
                    CPeriod5Min.PeriodTMCom         = Panel.Key_PeriodSafe        = PERIOD_M5;
                    if(Panel.Is_CordinateChange)        {CPeriod5Min.MoveX = Panel.X_Last; CPeriod5Min.MoveY = Panel.Y_Last;}
                    else                                {CPeriod5Min.MoveX = 300;  CPeriod5Min.MoveY = -170;}
                    CPeriod5Min.SizeX               = 120;
                    CPeriod5Min.SizeY               = 0;
                    CPeriod5Min.SizeExtendX         = 0;
                    CPeriod5Min.SizeExtendY         = 0;
                    _Call__Panel(CPeriod5Min); //>>>RightMiddel Pannel
          }
          bool WhichMode = MODE_CREATE; bool IsKey = true; //---command to draw
          //============//#X0 naming for drew fibo extention
          if(Event.sparam == "MoveLogoLeftO2__Period__Main__Draw"  || Event.sparam == "MoveLogoLeftO1__Period__Main__Draw"  || Event.sparam == "MoveLogo__Period__Main__Draw"  || Event.sparam == "LeftO3-__Period__Main__Tab")  { Draw__Fibo__Extention(PERIOD_CURRENT);}
          if(Event.sparam == "MoveLogoLeftO2__Period__Daily__Draw" || Event.sparam == "MoveLogoLeftO1__Period__Daily__Draw" || Event.sparam == "MoveLogo__Period__Daily__Draw" || Event.sparam == "LeftO3-__Period__Daily__Tab") { Draw__Fibo__Extention(PERIOD_D1);}
          if(Event.sparam == "MoveLogoLeftO2__Period__4Hour__Draw" || Event.sparam == "MoveLogoLeftO1__Period__4Hour__Draw" || Event.sparam == "MoveLogo__Period__4Hour__Draw" || Event.sparam == "LeftO3-__Period__4Hour__Tab") { Draw__Fibo__Extention(PERIOD_H4);}
          if(Event.sparam == "MoveLogoLeftO2__Period__30Min__Draw" || Event.sparam == "MoveLogoLeftO1__Period__30Min__Draw" || Event.sparam == "MoveLogo__Period__30Min__Draw" || Event.sparam == "LeftO3-__Period__30Min__Tab") { Draw__Fibo__Extention(PERIOD_M30);}
          if(Event.sparam == "MoveLogoLeftO2__Period__5Min__Draw"  || Event.sparam == "MoveLogoLeftO1__Period__5Min__Draw"  || Event.sparam == "MoveLogo__Period__5Min__Draw"  || Event.sparam == "LeftO3-__Period__5Min__Tab")  { Draw__Fibo__Extention(PERIOD_M5);}
          ColoringDraw(Event.sparam);
          ColoringTarget(Event.sparam);
          //
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::OnChartEvents(const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None")
{
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
                    if(id == CHARTEVENT_OBJECT_CLICK) {}
                    if(id == CHARTEVENT_KEYDOWN) {}
                    if(id == CHARTEVENT_MOUSE_MOVE) {}
                    if(id == CHARTEVENT_CLICK) {};
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::Panel_Coloring(ENUM_TIMEFRAMES PeriodTMCom)
{         //
          color Set_ColorX = clrWhite;
          color Set_ColorY = clrRed;
          //Alert("IsPadPress_Mini || Is_PadClear", IsPadPress_Mini, Is_PadClear); //
          if(!Panel.IsPadPress_Mini || !Panel.Is_PadClear )PeriodTMCom = Panel.Key_PeriodSafe;
          Panel.Key_Period = PeriodTMCom;
          //================================================
          //[---reset---]
          {
                    {         if(ObjectFind(0,  "Logo-__Period__Main__Tab" ) >= 0)      { ObjectSetInteger(0, "Logo-__Period__Main__Tab",   OBJPROP_COLOR, Set_ColorX);}
                              if(ObjectFind(0,  "LeftO5-__Period__Main__Tab" ) >= 0)    { ObjectSetInteger(0, "LeftO5-__Period__Main__Tab", OBJPROP_COLOR, Set_ColorY);}
                              if(ObjectFind(0,  "LeftO2-__Period__Main__Tab" ) >= 0)    { ObjectSetInteger(0, "LeftO2-__Period__Main__Tab", OBJPROP_COLOR, Set_ColorY);}
                              if(ObjectFind(0,  "LeftO4-__Period__Main__Tab" ) >= 0)    { ObjectSetInteger(0, "LeftO4-__Period__Main__Tab", OBJPROP_COLOR, Set_ColorY);}  //
                    }
                    //============================
                    {         if(ObjectFind(0,  "Logo-__Period__Daily__Tab" ) >= 0)     { ObjectSetInteger(0, "Logo-__Period__Daily__Tab",   OBJPROP_COLOR, Set_ColorX);}
                              if(ObjectFind(0,  "LeftO5-__Period__Daily__Tab" ) >= 0)   { ObjectSetInteger(0, "LeftO5-__Period__Daily__Tab", OBJPROP_COLOR, Set_ColorY);}
                              if(ObjectFind(0,  "LeftO2-__Period__Daily__Tab" ) >= 0)   { ObjectSetInteger(0, "LeftO2-__Period__Daily__Tab", OBJPROP_COLOR, Set_ColorY);}
                              if(ObjectFind(0,  "LeftO4-__Period__Daily__Tab" ) >= 0)   { ObjectSetInteger(0, "LeftO4-__Period__Daily__Tab", OBJPROP_COLOR, Set_ColorY);}  //
                    }
                    //============================
                    {         if(ObjectFind(0,  "Logo-__Period__4Hour__Tab" ) >= 0)     { ObjectSetInteger(0, "Logo-__Period__4Hour__Tab",   OBJPROP_COLOR, Set_ColorX);}
                              if(ObjectFind(0,  "LeftO5-__Period__4Hour__Tab" ) >= 0)   { ObjectSetInteger(0, "LeftO5-__Period__4Hour__Tab", OBJPROP_COLOR, Set_ColorY);}
                              if(ObjectFind(0,  "LeftO2-__Period__4Hour__Tab" ) >= 0)   { ObjectSetInteger(0, "LeftO2-__Period__4Hour__Tab", OBJPROP_COLOR, Set_ColorY);}
                              if(ObjectFind(0,  "LeftO4-__Period__4Hour__Tab" ) >= 0)   { ObjectSetInteger(0, "LeftO4-__Period__4Hour__Tab", OBJPROP_COLOR, Set_ColorY);}  //
                    }
                    //============================
                    {         if(ObjectFind(0,  "Logo-__Period__30Min__Tab" ) >= 0)     { ObjectSetInteger(0, "Logo-__Period__30Min__Tab",    OBJPROP_COLOR, Set_ColorX);}
                              if(ObjectFind(0,  "LeftO5-__Period__30Min__Tab" ) >= 0)   { ObjectSetInteger(0,  "LeftO5-__Period__30Min__Tab", OBJPROP_COLOR, Set_ColorY);}
                              if(ObjectFind(0,  "LeftO2-__Period__30Min__Tab") >= 0)    { ObjectSetInteger(0, "LeftO2-__Period__30Min__Tab",  OBJPROP_COLOR, Set_ColorY);}
                              if(ObjectFind(0,  "LeftO4-__Period__30Min__Tab" ) >= 0)   { ObjectSetInteger(0,  "LeftO4-__Period__30Min__Tab", OBJPROP_COLOR, Set_ColorY);}  //
                    }
                    //============================
                    {         if(ObjectFind(0,  "Logo-__Period__5Min__Tab" ) >= 0)      { ObjectSetInteger(0, "Logo-__Period__5Min__Tab",    OBJPROP_COLOR, Set_ColorX);}
                              if(ObjectFind(0,  "LeftO5-__Period__5Min__Tab" ) >= 0)    { ObjectSetInteger(0,  "LeftO5-__Period__5Min__Tab", OBJPROP_COLOR, Set_ColorY);}
                              if(ObjectFind(0,  "LeftO2-__Period__5Min__Tab" ) >= 0)    { ObjectSetInteger(0, "LeftO2-__Period__5Min__Tab",  OBJPROP_COLOR, Set_ColorY);}
                              if(ObjectFind(0,  "LeftO4-__Period__5Min__Tab" ) >= 0)    { ObjectSetInteger(0,  "LeftO4-__Period__5Min__Tab", OBJPROP_COLOR, Set_ColorY);}  //
                    }//
          }//
          //========================================
          switch(PeriodTMCom)///geting
          {         case  PERIOD_CURRENT:
                    {         //=================================================================
                              {         if(ObjectFind(0, "Logo-__Period__Main__Tab" ) >= 0)         { ObjectSetInteger(0, "Logo-__Period__Main__Tab",    OBJPROP_COLOR, Set_ColorY);}
                                        if(ObjectFind(0,  "LeftO5-__Period__Main__Tab" ) >= 0)      { ObjectSetInteger(0,  "LeftO5-__Period__Main__Tab", OBJPROP_COLOR, Set_ColorX);}
                                        if(ObjectFind(0, "LeftO2-__Period__Main__Tab" ) >= 0)       { ObjectSetInteger(0, "LeftO2-__Period__Main__Tab",  OBJPROP_COLOR, Set_ColorX);}
                                        if(ObjectFind(0,  "LeftO4-__Period__Main__Tab" ) >= 0)      { ObjectSetInteger(0,  "LeftO4-__Period__Main__Tab", OBJPROP_COLOR, Set_ColorX);}  //
                              }//
                              //=================================================================
                    } break; //
                    case  PERIOD_D1:
                    {         //=================================================================
                              {         if(ObjectFind(0, "Logo-__Period__Daily__Tab" ) >= 0)        { ObjectSetInteger(0, "Logo-__Period__Daily__Tab",    OBJPROP_COLOR, Set_ColorY);}
                                        if(ObjectFind(0,  "LeftO5-__Period__Daily__Tab" ) >= 0)     { ObjectSetInteger(0,  "LeftO5-__Period__Daily__Tab", OBJPROP_COLOR, Set_ColorX);}
                                        if(ObjectFind(0, "LeftO2-__Period__Daily__Tab" ) >= 0)      { ObjectSetInteger(0, "LeftO2-__Period__Daily__Tab",  OBJPROP_COLOR, Set_ColorX);}
                                        if(ObjectFind(0,  "LeftO4-__Period__Daily__Tab" ) >= 0)     { ObjectSetInteger(0,  "LeftO4-__Period__Daily__Tab", OBJPROP_COLOR, Set_ColorX);}  //
                              }//
                              //=================================================================
                    } break; ////
                    case  PERIOD_H4:
                    {         //=================================================================
                              {         if(ObjectFind(0, "Logo-__Period__4Hour__Tab" ) >= 0)        { ObjectSetInteger(0, "Logo-__Period__4Hour__Tab",    OBJPROP_COLOR, Set_ColorY);}
                                        if(ObjectFind(0,  "LeftO5-__Period__4Hour__Tab" ) >= 0)     { ObjectSetInteger(0,  "LeftO5-__Period__4Hour__Tab", OBJPROP_COLOR, Set_ColorX);}
                                        if(ObjectFind(0, "LeftO2-__Period__4Hour__Tab" ) >= 0)      { ObjectSetInteger(0, "LeftO2-__Period__4Hour__Tab",  OBJPROP_COLOR, Set_ColorX);}
                                        if(ObjectFind(0,  "LeftO4-__Period__4Hour__Tab" ) >= 0)     { ObjectSetInteger(0,  "LeftO4-__Period__4Hour__Tab", OBJPROP_COLOR, Set_ColorX);}  //
                              }//
                              //=================================================================
                    } break; ////
                    case  PERIOD_M30:
                    {         //=================================================================
                              {         if(ObjectFind(0, "Logo-__Period__30Min__Tab") >= 0)         { ObjectSetInteger(0, "Logo-__Period__30Min__Tab",    OBJPROP_COLOR, Set_ColorY);}
                                        if(ObjectFind(0,  "LeftO5-__Period__30Min__Tab") >= 0)      { ObjectSetInteger(0,  "LeftO5-__Period__30Min__Tab", OBJPROP_COLOR, Set_ColorX);}
                                        if(ObjectFind(0, "LeftO2-__Period__30Min__Tab") >= 0)       { ObjectSetInteger(0, "LeftO2-__Period__30Min__Tab",  OBJPROP_COLOR, Set_ColorX);}
                                        if(ObjectFind(0,  "LeftO4-__Period__30Min__Tab") >= 0)      { ObjectSetInteger(0,  "LeftO4-__Period__30Min__Tab", OBJPROP_COLOR, Set_ColorX);}//
                              }//
                              //=================================================================
                    } break; /////
                    case  PERIOD_M5:
                    {         //=================================================================
                              {         if(ObjectFind(0, "Logo-__Period__5Min__Tab" ) >= 0)         { ObjectSetInteger(0, "Logo-__Period__5Min__Tab",    OBJPROP_COLOR, Set_ColorY);}
                                        if(ObjectFind(0,  "LeftO5-__Period__5Min__Tab" ) >= 0)      { ObjectSetInteger(0,  "LeftO5-__Period__5Min__Tab", OBJPROP_COLOR, Set_ColorX);}
                                        if(ObjectFind(0, "LeftO2-__Period__5Min__Tab" ) >= 0)       { ObjectSetInteger(0, "LeftO2-__Period__5Min__Tab",  OBJPROP_COLOR, Set_ColorX);}
                                        if(ObjectFind(0,  "LeftO4-__Period__5Min__Tab" ) >= 0)      { ObjectSetInteger(0,  "LeftO4-__Period__5Min__Tab", OBJPROP_COLOR, Set_ColorX);}  //
                              }//
                              //=================================================================
                    } break; ////
                              ///
                              //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::_Call__Panel(Std_GoldVip_Panel_data_Frame &client_Frame)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          //===============================================================================================================
          /*****************************
          # one         Call panel curect mode       medium ok
          # two         Call panel Navigation mode   fixed ok by         //Cmini.MoveX = (int)Event.lparam + 5;   Cmini.MoveY = (int)Event.dparam - 212;//
          # there       Call panel period tabs mode  errorr
          ******************************/
          //---CordinateControlling
          client_Frame.SaveMoveXCom           = 0;
          client_Frame.SaveMoveYCom           = 0; //
          client_Frame.SizeinX                = 220;
          client_Frame.SizeinY                = PANEL_INDENT_TOP + 103 ;
          //---
          client_Frame.ColorBody              = clrWhite;//clrWhite;clrGray //--headers
          client_Frame.ColorLogo              = clrWhite;//clrWhite;
          client_Frame.ColorBodyMargine       = clrNavy ;//clrWhite;clrDarkSlateGray;clrBlueViolet //--margins
          client_Frame.ColorBodyText          = clrDarkOrchid;//clrWhite;clrDarkTurquoise //--hrader text
          client_Frame.ColorBodyCyrcle        = clrRed;
          client_Frame.result                 = false;
          //---
          //---
          //--- Param Controling Request
          client_Frame.WhichMode__Safe = client_Frame.WhichMode;
          client_Frame.IsKey__Safe     = client_Frame.IsKey;
          Panel.Key_PeriodSafe   = client_Frame.PeriodTMCom;
          //Cat.s(  client.IsKey + "   -_Call__Panel[===]--   " + client.WhichMode     ); //
          //[----cheack state of panel---]
          ((client_Frame.WhichMode == MODE_MOVE) && client_Frame.IsKey) ? Panel.Is_CMove = true : Panel.Is_CMove = false;
          if(Panel.Is_CMove) { Panel.Is_CordinateChange = true;}
          //[----------------------------]
          switch (client_Frame.WhichMode)
          {         //
                    case MODE_CREATE:  {        OnShow__Panel__Frame(client_Frame);  OnShow__Panel__Desc(client_Frame); } break;                                                              ///its work well ok   upper layer configuration data call..
                    case MODE_MINI:
                    {         client_Frame.WhichMode = MODE_CREATE; client_Frame.IsKey = !client_Frame.IsKey;         OnShow__Panel__Frame(client_Frame);
                              client_Frame.WhichMode = MODE_CREATE; client_Frame.IsKey = !client_Frame.IsKey__Safe;   OnShow__Panel__Desc(client_Frame); //
                    } break; ///its work well ok   upper layer configuration data call..
                    case MODE_MOVE:
                    {         //
                              //if(client.IsKey) {Panel.CMoveX_independ = client.MoveX; Panel.CMoveY_independ = client.MoveY; }
                              OnShow__Panel__Frame(client_Frame);
                              OnShow__Panel__Desc(client_Frame); //
                    } break;                                                              ///its work well ok   upper layer configuration data call.. & select  switch case MODE_MOVE;
                    //case MODE_EXIT:  {        __Show__Frame( client);                                                           } break;                                                             ///its work well ok   upper layer configuration data call..
                    //case MODE_REPOS: {        __Show__Frame( client);                                                           } break;                                                             ///its work well ok   upper layer configuration data call..
                    //
                    //
                    case MODE_MODIFY:
                    {         // change tab
                              //client_Frame.WhichMode          = MODE_CREATE;
                              //client_Frame.IsKey              = false;
                              //client_Frame.PeriodTMCom        = Panel.Key_PeriodSafe;//Key_Period
                              //OnShow__Panel__Frame( client_Frame);
                              //OnShow__Panel__Desc( client_Frame);
                              __Detach__Panel();
                              //
                              //
                              client_Frame.WhichMode          = MODE_CREATE;
                              client_Frame.IsKey              = true;
                              client_Frame.PeriodTMCom        = Panel.Key_PeriodSafe;
                              OnShow__Panel__Frame( client_Frame);
                              OnShow__Panel__Desc( client_Frame);
                              return;
                              //
                    } break;
                    case MODE_COLOR:    {} break;
                              //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          Panel.IsPadPress = Panel.Is_CCreate | client_Frame.IsCallMiniMode; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  C_GOLDVIP::OnShow__Panel__Frame(Std_GoldVip_Panel_data_Frame & client_Frame)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, client_Frame.FuncCome + __FUNCTION__); //|
          //---
          //---
          //---
          int           WhichMode               = client_Frame.WhichMode;
          bool          IsKey                   = client_Frame.IsKey;
          bool          IsCallMiniMode          = client_Frame.IsCallMiniMode;
          bool          Is_Created              = client_Frame.Is_Created;
          bool          result                  = client_Frame.result;
          //
          color         ColorBody               = client_Frame.ColorBody;
          color         ColorBodyMargine        = client_Frame.ColorBodyMargine;
          color         ColorBodyText           = client_Frame.ColorBodyText;
          color         ColorBodyCyrcle         = client_Frame.ColorBodyCyrcle;
          //
          int           MoveX                   = client_Frame.MoveX;
          int           SaveMoveXCom            = client_Frame.SaveMoveXCom;
          int           SizeX                   = client_Frame.SizeX;
          int           SizeinX                 = client_Frame.SizeinX;
          int           SizeExtendX             = client_Frame.SizeExtendX;
          //
          int           MoveY                   = client_Frame.MoveY;
          int           SaveMoveYCom            = client_Frame.SaveMoveYCom;
          int           SizeY                   = client_Frame.SizeY;
          int           SizeinY                 = client_Frame.SizeinY;
          int           SizeExtendY             = client_Frame.SizeExtendY;
          string        FuncCome                = client_Frame.FuncCome;
          string        PeriodDesc              = Utilities.TimeFrameToString(client_Frame.PeriodTMCom);
          //---
          //---
          //---
          string temp_string = StringFormat("Contract specification for %s:\r\n", _Symbol);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, client_Frame.FuncCome + __FUNCTION__); //|
          string HeaderTop = StringFormat(" GOLD VIP Service 4TimeFrame %s", "");///>ERR_FORMAT_TOO_MANY_FORMATTERS)| if not decide type %i//??>>>when deleting fe valuse of movex chnaged...
          static const string SizeXsafe = "";
          HeaderTop = StringFormat(" GOLD VIP Service 4TimeFrame %s", SizeXsafe);
          HeaderTop = "  GOLD VIP Service 4TimeFrame";
          //string Text011 = StringConcatenate(" GOLD VIP Service 4TimeFrame ");///>ERR_FORMAT_TOO_MANY_FORMATTERS)| if not decide type %i//??>>>when deleting fe valuse of movex chnaged...
          string FooterDown = StringConcatenate(" ct_XAUUSD 2021, Feb, 26, Friday ");///
          FooterDown = " ct_XAUUSD " + (string)TimeYear(TimeCurrent()) + " " + Dev_Calender.DayOfMonth_Desc(TimeCurrent()) + " " + (string)TimeDay(TimeCurrent()) + " " + Dev_Calender.DayOfWeek_Desc(TimeCurrent()) ;
          //---
          {         ENUM_ANCHOR_POINT AnchorText = ANCHOR_CENTER;
                    //=================
                    int lenth = 20; int MoveinX = -335; int MoveinY = 230;
                    int lenthText = StringLen(HeaderTop);
                    if(!DoOnTimer) lenthText = StringLen(HeaderTop);
                    double FixedRatio = 8.8;//5
                    lenth =  lenth = (int)(lenthText * FixedRatio);
                    int FontSize = 0;//
                    //---
                    //---
                    //---[HeaderTop]
                    Complex.Menu_Button(WhichMode, IsKey, HeaderTop,  ColorBody, ColorBodyMargine, ColorBodyText, ColorBodyCyrcle, clrWhite,
                                        MoveX +  SaveMoveXCom + MoveinX, MoveY +  SaveMoveYCom +  MoveinY, CORNER_LEFT_UPPER, 88 + lenth, 25,
                                        (int)(197.6) + 150,                 (int)(4) - 35,
                                        (int)(195) + 150,                   (int)(18.4) - 35,
                                        (int)(286) + 150 + lenth,           (int)(18.4) - 35,
                                        (int)(202.8) + 150,                 (int)(16) - 35,
                                        (int)(202.8) + 150,                 (int)(16) - 35,
                                        (int)(247) + 150 + lenth / 2 + 3,   (int)(16) - 35,
                                        FontSize, +0, "Arial bold", AnchorText); //
                    //===========
                    lenth = 20;   MoveinX = -335;   MoveinY = 230;
                    lenthText = StringLen(FooterDown);
                    if(!DoOnTimer) lenthText = StringLen(FooterDown);
                    FixedRatio = 8.55;//5
                    lenth = (int)(lenthText * FixedRatio);
                    //---[FooterDown]
                    Complex.Menu_Button(WhichMode, IsKey, FooterDown, ColorBody, ColorBodyMargine, ColorBodyText, ColorBodyCyrcle, clrWhite,
                                        MoveX +  SaveMoveXCom + MoveinX, MoveY +  SaveMoveYCom + MoveinY, CORNER_LEFT_UPPER, 88 + lenth, 25,
                                        (int)(197.6) + 150,                 (int)(4) + 105,
                                        (int)(195) + 150,                   (int)(18.4) + 105,
                                        (int)(286) + 150 + lenth,           (int)(18.4) + 105,
                                        (int)(202.8) + 150,                 (int)(16) + 105,
                                        (int)(202.8) + 150,                 (int)(16) + 105,
                                        (int)(247) + 150 + lenth / 2 + 3,   (int)(16) + 105,
                                        FontSize, +0, "Arial bold", AnchorText); //
                    //
                    //
                    client_Frame.Is_Created = true; //
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, FuncCome + __FUNCTION__); //|
          } //
          {         ////================================MoveX + (int)(48) - 4, MoveY + (int)(212)
                    int PlaceEnd = SizeX + SizeinX - (50);
                    ////>>>>FrameLeft.UseLabelCreate(true, "FrameLeft", "Å",)///>>>eroriing in exiting...
                    //--- [Generic gLabelX.GDS] [FrameLeft]  ---//
                    if(false)
                    {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              gLabelX.GDS.Set_Desc_4("FrameLeft", "Å", "Webdings", 140);
                              gLabelX.GDS.Set_Color_1(clrDarkSlateGray);
                              gLabelX.GDS.Set_Location_5(MoveX + SaveMoveXCom +  48, (int)(244.8) + 37 + MoveY + SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                              gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "FrameLeft" + PeriodDesc);
                              gLabelX.GDS.Set_Chart_6();
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(WhichMode, IsKey, "FrameLeft", "Å",  MoveX + SaveMoveXCom +  48, (int)(244.8) + 37 + MoveY + SaveMoveYCom,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false,  clrDarkSlateGray, 0, 140, "Webdings");
                    }
                    //--- Generic gLabelX.GDS  ---//
                    {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              gLabelX.GDS.Set_Desc_4("FrameRight", "Å", "Webdings", 140);
                              gLabelX.GDS.Set_Color_1(clrDarkSlateGray);
                              gLabelX.GDS.Set_Location_5(MoveX + SaveMoveXCom + PlaceEnd + SizeExtendX, (int)(244.8) + 37 + MoveY + SaveMoveYCom + SizeExtendY, 180, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                              gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "FrameRight" + PeriodDesc);
                              gLabelX.GDS.Set_Chart_6();
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(WhichMode, IsKey, "FrameRight", "Å",
                              //0// MoveX + SaveMoveXCom + PlaceEnd + SizeExtendX, (int)(244.8) + 37 + MoveY + SaveMoveYCom + SizeExtendY,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false,  clrDarkSlateGray, 180, 140, "Webdings");
                    }
                    //===============
                    // ---- Generic  gFlowPad.RLBL_Pad_AutoCharter-- - /// gRectLabelX.GDS
                    {         gRectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              gRectLabelX.GDS.Set_Desc_1("RightMiddleBorderBS");
                              gRectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              gRectLabelX.GDS.Set_Color_2(clrDarkSlateGray, clrDarkSlateGray);
                              gRectLabelX.GDS.Set_Location_5(MoveX + SaveMoveXCom + XSideBS + (int)(0), YSideBS + (int)(192) + MoveY + SaveMoveYCom, SizeX + SizeinX + SizeExtendX, SizeY + SizeinY + SizeExtendY, CORNER_LEFT_UPPER);
                              gRectLabelX.GDS.Set_Chart_6();
                              gRectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "RightMiddleBorderBS" + PeriodDesc);
                              gRectLabelX.Action(gRectLabelX);//
                              //0// RLBL_.Create(WhichMode, IsKey, "PanelGoldVip1", "RightMiddleBorderBS",
                              //0// MoveX + SaveMoveXCom + XSideBS + (int)(0), YSideBS + (int)(192) + MoveY + SaveMoveYCom, SizeX + SizeinX + SizeExtendX, SizeY + SizeinY + SizeExtendY,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, BORDER_FLAT, clrDarkSlateGray, clrDarkSlateGray, 0, STYLE_SOLID, 1, 8, "Arial" );
                    }//
                    // ---- Generic  gFlowPad.RLBL_Pad_AutoCharter-- - /// gRectLabelX.GDS
                    {         gRectLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              gRectLabelX.GDS.Set_Desc_1("RightMiddleBorderBS");
                              gRectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                              gRectLabelX.GDS.Set_Color_2(clrDimGray, clrDarkSlateGray);
                              gRectLabelX.GDS.Set_Location_5(MoveX + SaveMoveXCom + XSideBS + 3, YSideBS + (int)(192) + 3 + MoveY + SaveMoveYCom, SizeX + SizeinX - 6 + SizeExtendX, SizeY + SizeinY - 6 + SizeExtendY, CORNER_LEFT_UPPER);
                              gRectLabelX.GDS.Set_Chart_6();
                              gRectLabelX.GDS.Set_Common_6(false, 10, false, false, false, RLDEF_tooltip + "RightMiddleBorderBS" + PeriodDesc);
                              gRectLabelX.Action(gRectLabelX);//
                              //0// RLBL_.Create(WhichMode, IsKey, "PanelGoldVip2", "RightMiddleBorderBS",
                              //0// MoveX + SaveMoveXCom + XSideBS + 3, YSideBS + (int)(192) + 3 + MoveY + SaveMoveYCom, SizeX + SizeinX - 6 + SizeExtendX, SizeY + SizeinY - 6 + SizeExtendY,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, BORDER_FLAT, clrDimGray, clrDarkSlateGray, 0, STYLE_SOLID, 1, 8, "Arial" );
                    }//
                    //--- Generic gLabelX.GDS  ---//
                    {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              gLabelX.GDS.Set_Desc_4("MoveLogoLeftO1", "n", "Webdings", 13);
                              gLabelX.GDS.Set_Color_1(ColorBodyMargine);
                              gLabelX.GDS.Set_Location_5(MoveX +  SaveMoveXCom + (int)(48) - 4, (int)(212) + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                              gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "MoveLogoLeftO1" + PeriodDesc);
                              gLabelX.GDS.Set_Chart_6();
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(WhichMode, IsKey, "MoveLogoLeftO1", "n", MoveX +  SaveMoveXCom + (int)(48) - 4, (int)(212) + MoveY +  SaveMoveYCom,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyMargine, 0, 13, "Webdings"); //
                    }
                    //--- Generic gLabelX.GDS  ---//
                    {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              gLabelX.GDS.Set_Desc_4("MoveLogoLeftO2", "n", "Webdings", 10);
                              gLabelX.GDS.Set_Color_1(ColorBodyCyrcle);
                              gLabelX.GDS.Set_Location_5(MoveX +  SaveMoveXCom + (int)(46) - 4, (int)(211) + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                              gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "MoveLogoLeftO2" + PeriodDesc);
                              gLabelX.GDS.Set_Chart_6();
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(WhichMode, IsKey, "MoveLogoLeftO2", "n", MoveX +  SaveMoveXCom + (int)(46) - 4, (int)(211) + MoveY +  SaveMoveYCom,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyCyrcle, 0, 10, "Webdings"); //
                    }
                    //--- Generic gLabelX.GDS  ---//
                    {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              gLabelX.GDS.Set_Desc_4("MoveLogo", "n", "Webdings", 7);
                              gLabelX.GDS.Set_Color_1(clrWhite);
                              gLabelX.GDS.Set_Location_5(MoveX +  SaveMoveXCom + 44  - 4,  210  + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                              gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "FrameRight" + PeriodDesc);
                              gLabelX.GDS.Set_Chart_6();
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(WhichMode, IsKey, "MoveLogo", "n",  MoveX +  SaveMoveXCom + (int)(44) - 4, (int)(210) + MoveY +  SaveMoveYCom,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrWhite, 0, 7, "Webdings");
                    }
                    //===
                    //--- Generic gLabelX.GDS  ---//
                    {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              gLabelX.GDS.Set_Desc_4("GoldVIP_ClearLeftO1", "n", "Webdings", 13);
                              gLabelX.GDS.Set_Color_1(ColorBodyMargine);
                              gLabelX.GDS.Set_Location_5(MoveX +  SaveMoveXCom + 48  + 14,  212  + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                              gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "GoldVIP_ClearLeftO1" + PeriodDesc);
                              gLabelX.GDS.Set_Chart_6();
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(WhichMode, IsKey, "GoldVIP_ClearLeftO1", "n", MoveX +  SaveMoveXCom + (int)(48) + 14, (int)(212) + MoveY +  SaveMoveYCom, .
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyMargine, 0, 13, "Webdings"); //
                    }
                    //--- Generic gLabelX.GDS  ---//
                    {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              gLabelX.GDS.Set_Desc_4("GoldVIP_ClearLeftO2", "n", "Webdings", 10);
                              gLabelX.GDS.Set_Color_1(ColorBodyCyrcle);
                              gLabelX.GDS.Set_Location_5(MoveX +  SaveMoveXCom +   46 + 14, 211 + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                              gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "GoldVIP_ClearLeftO2" + PeriodDesc);
                              gLabelX.GDS.Set_Chart_6();
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(WhichMode, IsKey, "GoldVIP_ClearLeftO2", "n", MoveX +  SaveMoveXCom + (int)(46) + 14, (int)(211) + MoveY +  SaveMoveYCom,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyCyrcle, 0, 10, "Webdings"); //
                    }
                    //--- Generic gLabelX.GDS  ---//
                    {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              gLabelX.GDS.Set_Desc_4("GoldVIP_ClearLogo", "q", "Webdings", 12);
                              gLabelX.GDS.Set_Color_1(clrWhite);
                              gLabelX.GDS.Set_Location_5(MoveX +  SaveMoveXCom + 62  + 0,  211  + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                              gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "GoldVIP_ClearLogo" + PeriodDesc);
                              gLabelX.GDS.Set_Chart_6();
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(WhichMode, IsKey, "GoldVIP_ClearLogo", "q", MoveX +  SaveMoveXCom + (int)(61.9) + 0, (int)(211) + MoveY +  SaveMoveYCom,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrWhite, 0, 12, "Webdings");
                    }
                    //===
                    //--- Generic gLabelX.GDS  ---//
                    {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              gLabelX.GDS.Set_Desc_4("GoldVIP_ExitLeftO1", "n", "Webdings", 13);
                              gLabelX.GDS.Set_Color_1(ColorBodyMargine);
                              gLabelX.GDS.Set_Location_5(MoveX +  SaveMoveXCom +  80 + 0,  212  + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                              gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "GoldVIP_ExitLeftO1" + PeriodDesc);
                              gLabelX.GDS.Set_Chart_6();
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(WhichMode, IsKey, "GoldVIP_ExitLeftO1", "n", MoveX +  SaveMoveXCom + (int)(80) + 0, (int)(212) + MoveY +  SaveMoveYCom,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyMargine, 0, 13, "Webdings"); //
                    }
                    //--- Generic gLabelX.GDS  ---//
                    {         //if(WhichMode != MODE_MOVE)
                              {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                                        gLabelX.GDS.Set_Desc_4("GoldVIP_ExitLeftO2", "n", "Webdings", 10);
                                        gLabelX.GDS.Set_Color_1(ColorBodyCyrcle);
                                        gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "GoldVIP_ExitLeftO2" + PeriodDesc);
                                        gLabelX.GDS.Set_Chart_6(); //
                              }
                              gLabelX.GDS.Set_Desc_4("GoldVIP_ExitLeftO2", "n", "Webdings", 10);
                              gLabelX.GDS.Set_Location_5(MoveX +  SaveMoveXCom + 78  + 0,  211 + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(WhichMode, IsKey, "GoldVIP_ExitLeftO2", "n", MoveX +  SaveMoveXCom + (int)(78) + 0, (int)(211) + MoveY +  SaveMoveYCom,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyCyrcle, 0, 10, "Webdings"); //
                    }
                    //Sleep(300);
                    //Alert(MoveX +  SaveMoveXCom + 78  + 0);
                    //--- Generic gLabelX.GDS  ---//
                    {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey);
                              gLabelX.GDS.Set_Desc_4("GoldVIP_ExitLogo", "r", "Webdings", 10);
                              gLabelX.GDS.Set_Color_1(clrWhite);
                              gLabelX.GDS.Set_Location_5(MoveX +  SaveMoveXCom + 78, 211 + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                              gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "GoldVIP_ExitLogo" + PeriodDesc);
                              gLabelX.GDS.Set_Chart_6();
                              gLabelX.Action(gLabelX);//
                              //0// LBL_.Create(WhichMode, IsKey, "GoldVIP_ExitLogo", "r",  MoveX +  SaveMoveXCom + (int)(78), (int)(211) + MoveY +  SaveMoveYCom,
                              //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrWhite, 0, 10, "Webdings");
                    }
                    // ----Progressing
                    // --
                    // -
                    //
                    //================================MoveX + (int)(48) - 4, MoveY + (int)(212)
                    // Alert(  "if(Is_Create )-before IsCallMiniMode>>: ", IsCallMiniMode);//
                    //--when show request frist .. then show all.
                    //-- when show request mini .. then all delete exept mini
                    if(!IsCallMiniMode && WhichMode != MODE_MOVE) //for not covering leftO
                    {         //bool res1;
                              gLabelX.MQL.Delete("Panel__Mini__LeftO1-X");  //--  LBL_.Create(false, Is_Move, "Panel__Mini__LeftO1-X"); //
                              gLabelX.MQL.Delete("Panel__Mini__LeftO2-X");  //--  LBL_.Create(false, Is_Move, "Panel__Mini__LeftO2-X"); //
                              gLabelX.MQL.Delete("Panel__Mini__-X");        //--  LBL_.Create(false, Is_Move, "Panel__Mini__-X"); //
                    } //
                    if(!IsCallMiniMode)          //--- Generic gLabelX.GDS  ---//
                    {
                              {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey );
                                        gLabelX.GDS.Set_Desc_4("Panel__Mini__LeftO1-X", "n", "Webdings", 13);
                                        gLabelX.GDS.Set_Color_1(ColorBodyMargine);
                                        gLabelX.GDS.Set_Location_5(MoveX +  SaveMoveXCom + 2  + 0,   212  - 0 + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "Panel__Mini__LeftO1-X" + PeriodDesc);
                                        gLabelX.GDS.Set_Chart_6();
                                        gLabelX.Action(gLabelX);//
                                        //0// LBL_.Create(IsCallMiniMode, Is_Move, "Panel__Mini__LeftO1-X", "n",
                                        //0// MoveX +  SaveMoveXCom + (int)(2) + 0,  (int)(212) - 0 + MoveY +  SaveMoveYCom,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyMargine, 0, 13, "Webdings"); //
                              }
                              //--- Generic gLabelX.GDS  ---//
                              {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey );
                                        gLabelX.GDS.Set_Desc_4("Panel__Mini__LeftO2-X", "n", "Webdings", 10);
                                        gLabelX.GDS.Set_Color_1(ColorBodyCyrcle);
                                        gLabelX.GDS.Set_Location_5(MoveX +  SaveMoveXCom +  0, 211  - 0 + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "Panel__Mini__LeftO2-X" + PeriodDesc);
                                        gLabelX.GDS.Set_Chart_6();
                                        gLabelX.Action(gLabelX);//
                                        //0// LBL_.Create(IsCallMiniMode, Is_Move, "Panel__Mini__LeftO2-X", "n",
                                        //0// MoveX +  SaveMoveXCom +  0,  (int)(211) - 0 + MoveY +  SaveMoveYCom,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyCyrcle, 0, 10, "Webdings"); //
                              }
                              //--- Generic gLabelX.GDS  ---//
                              {         gLabelX.GDS.Set_Action_2(WhichMode, IsKey );
                                        gLabelX.GDS.Set_Desc_4("Panel__Mini__-X", "0", "Webdings", 10);
                                        gLabelX.GDS.Set_Color_1(clrWhite);
                                        gLabelX.GDS.Set_Location_5(MoveX +  SaveMoveXCom +  0, 211  - 0 + MoveY +  SaveMoveYCom, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT);
                                        gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "Panel__Mini__-X" + PeriodDesc);
                                        gLabelX.GDS.Set_Chart_6();
                                        gLabelX.Action(gLabelX);//
                                        //0// LBL_.Create(IsCallMiniMode, Is_Move, "Panel__Mini__-X", "0",
                                        //0// MoveX +  SaveMoveXCom +  0,  (int)(211) - 0 + MoveY +  SaveMoveYCom,
                                        //0// CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrWhite, 0, 10, "Webdings"); ///
                              }
                              //Alert("IsCallMiniMode>>: ", IsCallMiniMode);//
                    }
                    //================================bool Is_Create = false, bool Is_Move = false,  Is_Create , Is_Move ,
                    //--- [---Tab---]
                    int XPosTab = +10; int YPosTab = 0;
                    gButtonExtention.GDC.BTN__Cycle__Long(WhichMode, IsKey, "__Period__Main__Tab",  "Main",  MoveX +  SaveMoveXCom  - 95 + XPosTab,  135 + MoveY +  SaveMoveYCom, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyMargine,  ColorBodyCyrcle, 0, 8, 0, "Arial Black", -4 );
                    gButtonExtention.GDC.BTN__Cycle__Long(WhichMode, IsKey, "__Period__Daily__Tab", "Daily", MoveX +  SaveMoveXCom  - 95 + XPosTab,  160 + MoveY +  SaveMoveYCom, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyMargine,  ColorBodyCyrcle, 0, 8, 0, "Arial Black", -4 );
                    gButtonExtention.GDC.BTN__Cycle__Long(WhichMode, IsKey, "__Period__4Hour__Tab", "4Hour", MoveX +  SaveMoveXCom  - 95 + XPosTab,  185 + MoveY +  SaveMoveYCom, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyMargine,  ColorBodyCyrcle, 0, 8, 0, "Arial Black", -4);
                    gButtonExtention.GDC.BTN__Cycle__Long(WhichMode, IsKey, "__Period__30Min__Tab", "30Min", MoveX +  SaveMoveXCom  - 95 + XPosTab,  210 + MoveY +  SaveMoveYCom, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyMargine,  ColorBodyCyrcle, 0, 8, 0, "Arial Black", -4);
                    gButtonExtention.GDC.BTN__Cycle__Long(WhichMode, IsKey, "__Period__5Min__Tab",  "5Min",  MoveX +  SaveMoveXCom  - 95 + XPosTab,  235 + MoveY +  SaveMoveYCom, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, ColorBodyMargine,  ColorBodyCyrcle, 0, 8, 0, "Arial Black", -4);
                    //--- [---Target---]
                    int XPosTarget = -7; int YPosTarget = 22;
                    gButtonExtention.GDC.LBL_MoveCycle(WhichMode, IsKey, "__Period__Main__Target",                    SaveMoveXCom, SaveMoveYCom, MoveX - 95 + XPosTarget, MoveY + 135 + YPosTarget, ColorBody = clrWhite, ColorBodyMargine, ColorBodyText = clrWhite, ColorBodyCyrcle, "Q", 0);
                    gButtonExtention.GDC.LBL_MoveCycle(WhichMode, IsKey, "__Period__Daily__Target",                   SaveMoveXCom, SaveMoveYCom, MoveX - 95 + XPosTarget, MoveY + 160 + YPosTarget, ColorBody = clrWhite, ColorBodyMargine, ColorBodyText = clrWhite, ColorBodyCyrcle, "Q", 0);
                    gButtonExtention.GDC.LBL_MoveCycle(WhichMode, IsKey, "__Period__4Hour__Target",                   SaveMoveXCom, SaveMoveYCom, MoveX - 95 + XPosTarget, MoveY + 185 + YPosTarget, ColorBody = clrWhite, ColorBodyMargine, ColorBodyText = clrWhite, ColorBodyCyrcle, "Q", 0);
                    gButtonExtention.GDC.LBL_MoveCycle(WhichMode, IsKey, "__Period__30Min__Target",                   SaveMoveXCom, SaveMoveYCom, MoveX - 95 + XPosTarget, MoveY + 210 + YPosTarget, ColorBody = clrWhite, ColorBodyMargine, ColorBodyText = clrWhite, ColorBodyCyrcle, "Q", 0);
                    gButtonExtention.GDC.LBL_MoveCycle(WhichMode, IsKey, "__Period__5Min__Target",                    SaveMoveXCom, SaveMoveYCom, MoveX - 95 + XPosTarget, MoveY + 235 + YPosTarget, ColorBody = clrWhite, ColorBodyMargine, ColorBodyText = clrWhite, ColorBodyCyrcle, "Q", 0);
                    ////
                    //--- [---Draw---]
                    int XPosDraw = 0;  int YPosDraw = 0;
                    gButtonExtention.GDC.LBL_MoveCycle(WhichMode, IsKey, "__Period__Main__Draw",                      SaveMoveXCom, SaveMoveYCom, MoveX - 95 + XPosDraw, MoveY + 145 + YPosDraw, ColorBody = clrWhite, ColorBodyMargine, ColorBodyText = clrWhite, ColorBodyCyrcle );
                    gButtonExtention.GDC.LBL_MoveCycle(WhichMode, IsKey, "__Period__Daily__Draw",                     SaveMoveXCom, SaveMoveYCom, MoveX - 95 + XPosDraw, MoveY + 170 + YPosDraw, ColorBody = clrWhite, ColorBodyMargine, ColorBodyText = clrWhite, ColorBodyCyrcle );
                    gButtonExtention.GDC.LBL_MoveCycle(WhichMode, IsKey, "__Period__4Hour__Draw",                     SaveMoveXCom, SaveMoveYCom, MoveX - 95 + XPosDraw, MoveY + 195 + YPosDraw, ColorBody = clrWhite, ColorBodyMargine, ColorBodyText = clrWhite, ColorBodyCyrcle );
                    gButtonExtention.GDC.LBL_MoveCycle(WhichMode, IsKey, "__Period__30Min__Draw",                     SaveMoveXCom, SaveMoveYCom, MoveX - 95 + XPosDraw, MoveY + 220 + YPosDraw, ColorBody = clrWhite, ColorBodyMargine, ColorBodyText = clrWhite, ColorBodyCyrcle );
                    gButtonExtention.GDC.LBL_MoveCycle(WhichMode, IsKey, "__Period__5Min__Draw",                      SaveMoveXCom, SaveMoveYCom, MoveX - 95 + XPosDraw, MoveY + 245 + YPosDraw, ColorBody = clrWhite, ColorBodyMargine, ColorBodyText = clrWhite, ColorBodyCyrcle );
                    //===
                    ///===========================Is_5Min
                    Is_Created = IsKey; //
                    result = true;
                    ///
                    //
          }
          Panel_Coloring(client_Frame.PeriodTMCom);
          ///
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, FuncCome + __FUNCTION__); //|
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void  C_GOLDVIP::OnShow__Panel__Desc(Std_GoldVip_Panel_data_Frame & client_Frame)
{         //[----]
          //[------]
          Std_GoldVip_Panel_data_Desc  Client_Desc;
          //[------]
          {         Panel_PeriodCom_Define(client_Frame);
                    string   SozSet_ = "-";/////because for error not have any character...
                    Set___HistoryGap(SozSet_, client_Frame.PeriodTMCom);
                    //--[make all data Set_]
                    {         //update all periods data not selected for signaling
                              Fill__Panel_TPXKey__Texts(client_Frame, Client_Desc, PERIOD_MN1, SozSet_);
                              Fill__Panel_TPXKey__Texts(client_Frame, Client_Desc, PERIOD_W1, SozSet_);
                              Fill__Panel_TPXKey__Texts(client_Frame, Client_Desc, PERIOD_D1, SozSet_);
                              Fill__Panel_TPXKey__Texts(client_Frame, Client_Desc, PERIOD_H4, SozSet_);
                              Fill__Panel_TPXKey__Texts(client_Frame, Client_Desc, PERIOD_H1, SozSet_);
                              Fill__Panel_TPXKey__Texts(client_Frame, Client_Desc, PERIOD_M30, SozSet_);
                              Fill__Panel_TPXKey__Texts(client_Frame, Client_Desc, PERIOD_M15, SozSet_);
                              Fill__Panel_TPXKey__Texts(client_Frame, Client_Desc, PERIOD_M5, SozSet_);
                              Fill__Panel_TPXKey__Texts(client_Frame, Client_Desc, PERIOD_M1, SozSet_); //
                    }
                    Fill__Panel_TPXKey__Texts(client_Frame, Client_Desc, client_Frame.PeriodTMCom, SozSet_);     //return;// Is_CCreate = client.IsPadPress_Main
          }
          //Cat.s("Client_Desc.MoveX:" + Client_Desc.MoveX + "  CMoveX_independ:  " + Client_Desc.CMoveX_independ + "  SaveMoveYCom:  " + Client_Desc.SaveMoveYCom + "     Client_Desc.PeriodDesc:_" + Client_Desc.PeriodDesc);
          //Cat.s("Client_Desc.MoveX:" + Client_Desc.MoveX + "Client_Desc.WhichMode:" + Client_Desc.WhichMode); //
          Show__Descs__(Client_Desc);
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::Show__Descs__(Std_GoldVip_Panel_data_Desc & Client_Desc)
{         //[-----------]
          //Cat.s(  Client_Desc.IsKey + "   -Show__Descs__--   " + Client_Desc.WhichMode     ); //
          //Cat.s("Show__Descs__   Client_Desc.MoveX:" + Client_Desc.MoveX + "......" + Client_Desc.WhichMode + "......" + Client_Desc.IsKey); //
          if(true)//---ok
          {         gLabelX.GDS.Set_Action_2(Client_Desc.WhichMode, Client_Desc.IsKey);
                    gLabelX.GDS.Set_Desc_4("Text030_Period" + Client_Desc.PeriodDesc,                  "* " + Client_Desc.Text030_Period,                         "Arial Black", 9);
                    gLabelX.GDS.Set_Color_1(clrWhite);
                    gLabelX.GDS.Set_Location_5(Client_Desc.CMoveX_independ + Client_Desc.MoveX +  Client_Desc.SaveMoveXCom + XSideBS + 169,              YSideBS + 208 + Client_Desc.MoveY +  Client_Desc.SaveMoveYCom + Client_Desc.CMoveY_independ, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                    gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "Text030_Period" + Client_Desc.PeriodDesc);
                    gLabelX.GDS.Set_Chart_6();
                    gLabelX.Action(gLabelX);//
                    //0// LBL_.Create(WhichMode, IsKey, "Text030_Period" + PeriodDesc, Text030_Period,
                    //0//  CMoveX_independ + MoveX +  SaveMoveXCom + XSideBS + 169,   YSideBS + (int)(208) + MoveY +  SaveMoveYCom + CMoveY_independ,
                    //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false,  clrWhite, 0, 9, "Arial Black");
          }
          ////--- Generic gFlowPad.Text040_Pivots ---// gLabelX.GDS
          if(true)//---ok
          {         gLabelX.GDS.Set_Action_2(Client_Desc.WhichMode, Client_Desc.IsKey);
                    gLabelX.GDS.Set_Desc_4("Text040_Pivots" + Client_Desc.PeriodDesc,                   "* " + Client_Desc.Text040_Pivots,                         "tahoma", 8);
                    gLabelX.GDS.Set_Color_1(clrWhite);
                    gLabelX.GDS.Set_Location_5(Client_Desc.CMoveX_independ + Client_Desc.MoveX +  Client_Desc.SaveMoveXCom + XSideBS + 169,              YSideBS + 224 + Client_Desc.MoveY +  Client_Desc.SaveMoveYCom + Client_Desc.CMoveY_independ, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                    gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "Text040_Pivots" + Client_Desc.PeriodDesc);
                    gLabelX.GDS.Set_Chart_6();
                    gLabelX.Action(gLabelX);//
                    //0// LBL_.Create(WhichMode, IsKey, "Text040_Pivots" + PeriodDesc, Text040_Pivots,
                    //0// CMoveX_independ + MoveX +  SaveMoveXCom + XSideBS + 169,   YSideBS + (int)(224) + MoveY +  SaveMoveYCom + CMoveY_independ,
                    //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false,  clrWhite, 0, 7, "tahoma Bold");
          }
          //=======
          ////--- Generic gFlowPad.Text050_TP1 ---// gLabelX.GDS
          if(true)
          {         gLabelX.GDS.Set_Action_2(Client_Desc.WhichMode, Client_Desc.IsKey);
                    gLabelX.GDS.Set_Desc_4("Text050_TP1"    + Client_Desc.PeriodDesc,                   "* " + Client_Desc.TP1Desc + Client_Desc.Text050_TP1,           "tahoma", 8);
                    gLabelX.GDS.Set_Color_1(Client_Desc.TPX_Text050_TP1Color);
                    gLabelX.GDS.Set_Location_5(Client_Desc.CMoveX_independ + Client_Desc.MoveX +  Client_Desc.SaveMoveXCom + XSideBS + 169,              YSideBS + 240 + Client_Desc.MoveY +  Client_Desc.SaveMoveYCom + Client_Desc.CMoveY_independ, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                    gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "Text050_TP1" + Client_Desc.PeriodDesc);
                    gLabelX.GDS.Set_Chart_6();
                    gLabelX.Action(gLabelX);//
                    //0// LBL_.Create(WhichMode, IsKey, "Text050_TP1"    + PeriodDesc, TP1Desc + Text050_TP1,
                    //0// CMoveX_independ + MoveX +  SaveMoveXCom + XSideBS + 169,   YSideBS + (int)(240) + MoveY +  SaveMoveYCom + CMoveY_independ,
                    //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false,  TPX_Text050_TP1Color, 0, 7, "tahoma Bold");
          }
          ////--- Generic gFlowPad.Text060_TP2 ---// gLabelX.GDS
          if(true)
          {         gLabelX.GDS.Set_Action_2(Client_Desc.WhichMode, Client_Desc.IsKey);
                    gLabelX.GDS.Set_Desc_4("Text060_TP2" + Client_Desc.PeriodDesc,                       "* "  + Client_Desc.TP2Desc + Client_Desc.Text060_TP2,         "tahoma", 8);
                    gLabelX.GDS.Set_Color_1(Client_Desc.TPX_Text050_TP2Color);
                    gLabelX.GDS.Set_Location_5(Client_Desc.CMoveX_independ + Client_Desc.MoveX +  Client_Desc.SaveMoveXCom + XSideBS + 169,              YSideBS + 256 + Client_Desc.MoveY +  Client_Desc.SaveMoveYCom + Client_Desc.CMoveY_independ, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                    gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "Text060_TP2" + Client_Desc.PeriodDesc);
                    gLabelX.GDS.Set_Chart_6();
                    gLabelX.Action(gLabelX);//
                    //0// LBL_.Create(WhichMode, IsKey, "Text060_TP2" + PeriodDesc, TP2Desc + Text060_TP2,
                    //0// CMoveX_independ + MoveX +  SaveMoveXCom + XSideBS + 169,   YSideBS + (int)(256) + MoveY +  SaveMoveYCom + CMoveY_independ,
                    //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false,  TPX_Text050_TP2Color, 0, 7, "tahoma Bold");
          }
          ////--- Generic gFlowPad.Text070_TP3 ---// gLabelX.GDS
          {         gLabelX.GDS.Set_Action_2(Client_Desc.WhichMode, Client_Desc.IsKey);
                    gLabelX.GDS.Set_Desc_4("Text070_TP3" + Client_Desc.PeriodDesc,                      "* "  + Client_Desc.TP3Desc + Client_Desc.Text070_TP3,           "tahoma", 8);
                    gLabelX.GDS.Set_Color_1(Client_Desc.TPX_Text050_TP3Color);
                    gLabelX.GDS.Set_Location_5(Client_Desc.CMoveX_independ + Client_Desc.MoveX +  Client_Desc.SaveMoveXCom + XSideBS + 169,              YSideBS + 272 + Client_Desc.MoveY +  Client_Desc.SaveMoveYCom + Client_Desc.CMoveY_independ, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                    gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "Text070_TP3" + Client_Desc.PeriodDesc);
                    gLabelX.GDS.Set_Chart_6();
                    gLabelX.Action(gLabelX);//
                    //0// LBL_.Create(WhichMode, IsKey, "Text070_TP3" + PeriodDesc, TP3Desc + Text070_TP2,
                    //0// CMoveX_independ + MoveX +  SaveMoveXCom + XSideBS + 169,   YSideBS + (int)(272) + MoveY +  SaveMoveYCom + CMoveY_independ,
                    //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false,  TPX_Text050_TP3Color, 0, 7, "tahoma Bold");
          }
          //=======
          ////--- Generic gFlowPad.Text080_Go ---// gLabelX.GDS
          {         gLabelX.GDS.Set_Action_2(Client_Desc.WhichMode, Client_Desc.IsKey);
                    gLabelX.GDS.Set_Desc_4("Text080_Go" + Client_Desc.PeriodDesc,                       "* "  + Client_Desc.Text080_Go,                             "tahoma Bold", 8);
                    gLabelX.GDS.Set_Color_1(clrWhite);
                    gLabelX.GDS.Set_Location_5(Client_Desc.CMoveX_independ + Client_Desc.MoveX +  Client_Desc.SaveMoveXCom + XSideBS + 169,              YSideBS + 288 + Client_Desc.MoveY +  Client_Desc.SaveMoveYCom + Client_Desc.CMoveY_independ, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                    gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "Text080_Go" + Client_Desc.PeriodDesc);
                    gLabelX.GDS.Set_Chart_6();
                    gLabelX.Action(gLabelX);//
                    //0// LBL_.Create(WhichMode, IsKey, "Text080_Go" + PeriodDesc, Text080_Go,
                    //0// CMoveX_independ + MoveX +  SaveMoveXCom + XSideBS + 169,   YSideBS + (int)(288) + MoveY +  SaveMoveYCom + CMoveY_independ,
                    //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false,  clrWhite, 0, 7, "tahoma Bold");
          }
          ////--- Generic gFlowPad.Text090_HGap ---// gLabelX.GDS
          {         gLabelX.GDS.Set_Action_2(Client_Desc.WhichMode, Client_Desc.IsKey);
                    gLabelX.GDS.Set_Desc_4("Text090_HGap" + Client_Desc.PeriodDesc,                     "* "  + Client_Desc.Text090,                                "tahoma", 8);
                    gLabelX.GDS.Set_Color_1(clrWhite);
                    gLabelX.GDS.Set_Location_5(Client_Desc.CMoveX_independ + Client_Desc.MoveX +  Client_Desc.SaveMoveXCom +  XSideBS + 169,             YSideBS + 264 + 40 + Client_Desc.MoveY + Client_Desc.SaveMoveYCom + Client_Desc.CMoveY_independ, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                    gLabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "Text090_HGap" + Client_Desc.PeriodDesc);
                    gLabelX.GDS.Set_Chart_6();
                    gLabelX.Action(gLabelX);//
                    //0// LBL_.Create(WhichMode, IsKey, "Text090_HGap" + PeriodDesc, Text090,
                    //0// CMoveX_independ + MoveX +  SaveMoveXCom +  XSideBS + 169, YSideBS + (int)(264 ) + (35) + MoveY + SaveMoveYCom + CMoveY_independ,
                    //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false,  clrKhaki, 0, 7, "tahoma Bold");
          }//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::Panel_PeriodCom_Define( Std_GoldVip_Panel_data_Frame &client)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          if( client.result || client.Is_Created)
          {         switch(client.PeriodTMCom)
                    {         case PERIOD_CURRENT:
                              {         if(client.Is_Created || client.Is_Create) { client.IsPadPress_Main  = true; }
                                        else                                      { client.IsPadPress_Main  = false; }    //
                              } break;
                              case PERIOD_D1:
                              {         if(client.Is_Created || client.Is_Create) { client.Is_Daily  = true;  }
                                        else                                      { client.Is_Daily  = false; }    //
                              } break;
                              case PERIOD_H4:
                              {         if(client.Is_Created || client.Is_Create) { client.Is_4Hour  = true; }
                                        else                                      { client.Is_4Hour  = false; }    //
                              } break;
                              case PERIOD_M30:
                              {         if(client.Is_Created || client.Is_Create) { client.Is_30Min  = true; }
                                        else                                      { client.Is_30Min  = false; }    //
                              } break;
                              case PERIOD_M5:
                              {         if(client.Is_Created || client.Is_Create) { client.Is_5Min  = true; }
                                        else                                      { client.Is_5Min  = false; }    //
                              } break;
                                        //
                    };//# setting values
                    Panel.CIs_DoMain  = client.IsPadPress_Main  = client.PeriodTMCom == PERIOD_CURRENT;; //mean deiniting//
                    Panel.CIs_DoDaily = client.Is_Daily         = client.PeriodTMCom == PERIOD_D1;; //
                    Panel.CIs_Do4Hour = client.Is_4Hour         = client.PeriodTMCom == PERIOD_H4;; //
                    Panel.CIs_Do30Min = client.Is_30Min         = client.PeriodTMCom == PERIOD_M30;; //
                    Panel.CIs_Do5Min  = client.Is_5Min          = client.PeriodTMCom == PERIOD_M5;; //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
}


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::Fill__Panel_TPXKey__Texts(Std_GoldVip_Panel_data_Frame & client_Frame, Std_GoldVip_Panel_data_Desc & ClientDesc, ENUM_TIMEFRAMES PeriodTMCom, string SozCom = "-")
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          //[---Define Data by signal collector---]
          {         //for all periods update data
                    switch(PeriodTMCom)
                    {         case PERIOD_M1:   {         Set_Update__Signal__data__ByPeriod(GoldVIP_PanelPeriodsData._M1, PERIOD_M1, SozCom); } break;
                              case PERIOD_M5:   {         Set_Update__Signal__data__ByPeriod(GoldVIP_PanelPeriodsData._M5, PERIOD_M5, SozCom); } break;
                              case PERIOD_M15:  {         Set_Update__Signal__data__ByPeriod(GoldVIP_PanelPeriodsData._M15, PERIOD_M15, SozCom); } break;
                              case PERIOD_M30:  {         Set_Update__Signal__data__ByPeriod(GoldVIP_PanelPeriodsData._M30, PERIOD_M30, SozCom); } break;
                              case PERIOD_H1:   {         Set_Update__Signal__data__ByPeriod(GoldVIP_PanelPeriodsData._H1, PERIOD_H1, SozCom); } break;
                              case PERIOD_H4:   {         Set_Update__Signal__data__ByPeriod(GoldVIP_PanelPeriodsData._H4, PERIOD_H4, SozCom); } break;
                              case PERIOD_D1:   {         Set_Update__Signal__data__ByPeriod(GoldVIP_PanelPeriodsData._D1, PERIOD_D1, SozCom); } break;
                              case PERIOD_W1:   {         Set_Update__Signal__data__ByPeriod(GoldVIP_PanelPeriodsData._W1, PERIOD_W1, SozCom); } break;
                              case PERIOD_MN1:  {         Set_Update__Signal__data__ByPeriod(GoldVIP_PanelPeriodsData._MN, PERIOD_MN1, SozCom); } break;
                                        //
                    } //
          }
          Set_Update__Signal__data__ByPeriod(GoldVIP_PanelPeriodsData._ClientTPX, PeriodTMCom, SozCom);
          //
          string PeriodDesc = Utilities.TimeFrameToString(PeriodTMCom); ///"CURRENT"   "M1"   "M5"    "M15"   "M30"   "H1"   "H4"  "D1"   "W1"   "MN1";
          //---
          //string Text030_Period       = StringConcatenate(" Year R4[2721] R2[2166] PP[1824]>>*S2[1480] S4[0925] ");
          //string Text040_Pivots       = StringConcatenate(" Month R4[2245] *R2[1921] PP[1750] S2[1581]>>S4[1249] ");
          //string Text050_TP1          = StringConcatenate(" Week R4[1977] *R2[1807] PP[1720] S2[1635]>>_S4[1460] ");
          //string Text030_Period       = StringConcatenate(" Daily Bar Chart 💹2021-03-07 Result:+1730pip💾");
          //---
          string Text030_Period         = StringConcatenate( GoldVIP_PanelPeriodsData._ClientTPX.TPX_TimePeriodDesc + " Bar Chart " + GoldVIP_PanelPeriodsData._ClientTPX.TPX_DateCalculatingDesc + " Result: " + GoldVIP_PanelPeriodsData._ClientTPX.TPX_ProfitPipDesc);
          //---
          string Text040_Pivots         = StringConcatenate("Week R4[" + GoldVIP_PanelPeriodsData._ClientTPX.TPX_R4ValueDesc  + "] *R2[" + GoldVIP_PanelPeriodsData._ClientTPX.TPX_R2ValueDesc         + "] PP[" + GoldVIP_PanelPeriodsData._ClientTPX.TPX_PPValueDesc          + "] S2[" + GoldVIP_PanelPeriodsData._ClientTPX.TPX_S2ValueDesc + "]>> S4[" + GoldVIP_PanelPeriodsData._ClientTPX.TPX_S4ValueDesc + "]");
          //=======
          string Text050_TP1            = StringConcatenate("TP1: "    + GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP1ValueDesc + " ("     + GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP1PercentValueDesc + ") ("   + GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP1ValueDictanceDesc + ")"  );
          //Alert(Text050_TP1);///
          string Text060_TP2            = StringConcatenate("TP2: "    + GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP2ValueDesc + " ("     + GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP2PercentValueDesc + ") ("   + GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP2ValueDictanceDesc + ")"  );
          //Alert(Text060_TP2);///
          string Text070_TP3            = StringConcatenate("TP3: "    + GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP3ValueDesc + " ("     + GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP3PercentValueDesc + ") ("   + GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP3ValueDictanceDesc + ")"  );
          //Alert(Text070_TP3);///
          //=======
          string Text080_Go             = StringConcatenate("Go "      + GoldVIP_PanelPeriodsData._ClientTPX.TPX_Set_TypeDesc  + ": "     + GoldVIP_PanelPeriodsData._ClientTPX.TPX_StartPriceDesc      + " SL: " + GoldVIP_PanelPeriodsData._ClientTPX.TPX_StopLossValueDesc    + " (" + GoldVIP_PanelPeriodsData._ClientTPX.TPX_StopLossValueDictanceDesc + ") R\\R! (" + GoldVIP_PanelPeriodsData._ClientTPX.TPX_EndTimeDesc + ")END");
          //---
          string Text090                = StringConcatenate(GoldVIP_PanelPeriodsData._ClientTPX.TPX_SozCom);
          //---
          string Text050_TP1Desc        = "";//
          string Text050_TP2Desc        = "";//
          string Text050_TP3Desc        = "";//
          string TP1Desc                = "    ";
          string TP2Desc                = "    ";
          string TP3Desc                = "    ";//
          //---
          if(GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP1PercentValueCalc < 100) TP1Desc = Text050_TP1Desc = "->";
          if(GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP2PercentValueCalc >= 100)TP2Desc = Text050_TP2Desc = "->";
          if(GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP3PercentValueCalc >= 100)TP3Desc = Text050_TP3Desc = "->";
          //---
          //---
          Message.MessagingTelegrm();
          //[-----------finilizing desc-------------------]
          {         //-------------------
                    ClientDesc.WhichMode              = client_Frame.WhichMode;
                    ClientDesc.IsKey                  = client_Frame.IsKey;
                    ClientDesc.PeriodDesc             = PeriodDesc;
                    //-------------------------------------
                    ClientDesc.Text030_Period         = Text030_Period;
                    //-------------------------------------///[---if moved must know where to place text location!!!]
                    ClientDesc.MoveX                  = client_Frame.MoveX;
                    ClientDesc.MoveY                  = client_Frame.MoveY;
                    //
                    ClientDesc.CMoveX_independ        = Panel.CMoveX_independ;
                    ClientDesc.CMoveY_independ        = Panel.CMoveY_independ;
                    ClientDesc.SaveMoveYCom           = client_Frame.SaveMoveYCom;
                    ClientDesc.SaveMoveXCom           = client_Frame.SaveMoveXCom;
                    //-------------------------------------
                    ClientDesc.Text040_Pivots         = Text040_Pivots;
                    //-------------------------------------
                    ClientDesc.TP1Desc                = TP1Desc;
                    ClientDesc.Text050_TP1            = Text050_TP1;  //--- Text050_TP1Desc;
                    //Alert(ClientDesc.Text050_TP1);///
                    ClientDesc.TPX_Text050_TP1Color   = GoldVIP_PanelPeriodsData._ClientTPX.TPX_Text050_TP1Color;
                    //-------------------------------------
                    ClientDesc.TP2Desc                = TP2Desc;
                    ClientDesc.Text060_TP2            = Text060_TP2;  //---Text050_TP2Desc;
                    //Alert(ClientDesc.Text060_TP2);///
                    ClientDesc.TPX_Text050_TP2Color   = GoldVIP_PanelPeriodsData._ClientTPX.TPX_Text050_TP2Color;
                    //-------------------------------------
                    ClientDesc.TP3Desc                = TP3Desc;
                    ClientDesc.Text070_TP3            = Text070_TP3;  //---Text050_TP3Desc;
                    //Alert(ClientDesc.Text070_TP3);///
                    ClientDesc.TPX_Text050_TP3Color   = GoldVIP_PanelPeriodsData._ClientTPX.TPX_Text050_TP3Color;
                    //-------------------------------------
                    ClientDesc.Text080_Go             = Text080_Go;
                    ClientDesc.Text090                = Text090;
                    //-------------------------------------
                    //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::Event_Panel_STATE()
{         //===
          ObjectSetInteger(0, "MoveLogoLeftO2__Period__Main__Draw", OBJPROP_COLOR, clrRed);
          ObjectSetInteger(0, "MoveLogo__Period__Main__Draw", OBJPROP_COLOR, clrWhite);
          //---
          ObjectSetInteger(0, "MoveLogoLeftO2__Period__Daily__Draw", OBJPROP_COLOR, clrRed); //
          ObjectSetInteger(0, "MoveLogo__Period__Daily__Draw", OBJPROP_COLOR, clrWhite);
          //----
          ObjectSetInteger(0, "MoveLogoLeftO2__Period__4Hour__Draw", OBJPROP_COLOR, clrRed); //
          ObjectSetInteger(0, "MoveLogo__Period__4Hour__Draw", OBJPROP_COLOR, clrWhite);
          //--
          ObjectSetInteger(0, "MoveLogoLeftO2__Period__30Min__Draw", OBJPROP_COLOR, clrRed); //
          ObjectSetInteger(0, "MoveLogo__Period__30Min__Draw", OBJPROP_COLOR, clrWhite);
          ///--
          ObjectSetInteger(0, "MoveLogoLeftO2__Period__5Min__Draw", OBJPROP_COLOR, clrRed); //
          ObjectSetInteger(0, "MoveLogo__Period__5Min__Draw", OBJPROP_COLOR, clrWhite);
          if(Panel.CIs_DoMain)///controllling//
          {         ///
                    //Alert("#1CIs_DoMain: ", CIs_DoMain);//
                    Panel_Coloring(PERIOD_CURRENT);///for key pressed
                    //
          };//
          if(Panel.CIs_DoMainDraw)
          {         ObjectSetInteger(0, "MoveLogoLeftO2__Period__Main__Draw", OBJPROP_COLOR, clrYellowGreen);
                    ObjectSetInteger(0, "MoveLogo__Period__Main__Draw", OBJPROP_COLOR, clrBlack);
                    //---
                    //Alert("#2CIs_DoMainDraw: ", CIs_DoMainDraw);
                    //--
          } //
          if(Panel.CIs_DoDaily)
          {         // Alert("#1CIs_DoDaily: ", CIs_DoDaily);//
                    Panel_Coloring(PERIOD_D1);//
          }//
          if(Panel.CIs_DoDailyDraw)
          {         //---
                    ObjectSetInteger(0, "MoveLogoLeftO2__Period__Daily__Draw", OBJPROP_COLOR, clrYellowGreen); //
                    ObjectSetInteger(0, "MoveLogo__Period__Daily__Draw", OBJPROP_COLOR, clrBlack);
                    //----
                    //---
                    // Alert("#2CIs_DoDailyDraw: ", CIs_DoDailyDraw);
                    //--
          } //
          ;//
          if(Panel.CIs_Do4Hour)
          {         Alert("#1CIs_Do4Hour: ", Panel.CIs_Do4Hour);//
                    Panel_Coloring(PERIOD_H4);//
          }
          if(Panel.CIs_Do4HourDraw)
          {         //----
                    ObjectSetInteger(0, "MoveLogoLeftO2__Period__4Hour__Draw", OBJPROP_COLOR, clrYellowGreen); //
                    ObjectSetInteger(0, "MoveLogo__Period__4Hour__Draw", OBJPROP_COLOR, clrBlack);
                    //--
                    //--
                    //Alert("#2CIs_Do4HourDraw: ", CIs_Do4HourDraw);
                    //--
                    //--
          } //
          ;//
          if(Panel.CIs_Do30Min)
          {         ///Alert("#1CIs_Do30Min: ", CIs_Do30Min);//
                    Panel_Coloring(PERIOD_M30);//
          }
          if(Panel.CIs_Do30MinDraw)
          {         //--
                    ObjectSetInteger(0, "MoveLogoLeftO2__Period__30Min__Draw", OBJPROP_COLOR, clrYellowGreen); //
                    ObjectSetInteger(0, "MoveLogo__Period__30Min__Draw", OBJPROP_COLOR, clrBlack);
                    //--
                    //Alert("#2CIs_Do30MinDraw: ", CIs_Do30MinDraw);
                    //--
          } //
          ;//
          if(Panel.CIs_Do5Min)
          {         //Alert("#1CIs_Do5Min: ", CIs_Do5Min);
                    Panel_Coloring(PERIOD_M5);//
          }
          if(Panel.CIs_Do5MinDraw)
          {         ///--
                    ObjectSetInteger(0, "MoveLogoLeftO2__Period__5Min__Draw", OBJPROP_COLOR, clrYellowGreen); //
                    ObjectSetInteger(0, "MoveLogo__Period__5Min__Draw", OBJPROP_COLOR, clrBlack);
                    //--
                    //--
                    //Alert("#2CIs_Do5MinDraw: ", CIs_Do5MinDraw);
                    //--
          } //
          ;//
}//
//================================================================================================================
//=======================================================================================  double C_GOLDVIP:: Period5Min
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_GOLDVIP::Draw__Fibo__Extention(ENUM_TIMEFRAMES PeriodTMCom = PERIOD_CURRENT)
{         //=====================================//#X Delete lasts
          string NamingPERIOD_CURRENT   = "XTrading" + "PERIOD_CURRENT_PanelGoldVip: " + _Symbol;
          string NamingPERIOD_D1        = "XTrading" + "PERIOD_D1_PanelGoldVip: "      + _Symbol;
          string NamingPERIOD_H4        = "XTrading" + "PERIOD_H4_PanelGoldVip: "      + _Symbol;
          string NamingPERIOD_M30       = "XTrading" + "PERIOD_M30_PanelGoldVip: "     + _Symbol;
          string NamingPERIOD_M5        = "XTrading" + "PERIOD_M5_PanelGoldVip: "      + _Symbol;
          static bool Is_DoMain         = false;//
          static bool Is_DoDaily        = false;//
          static bool Is_Do4Hour        = false;//
          static bool Is_Do30Min        = false;//
          static bool Is_Do5Min         = false;//
          //[---Draw---]
          {         bool Is_AnyActive = Panel.CIs_DoMainDraw || Panel.CIs_DoDailyDraw || Panel.CIs_Do4HourDraw || Panel.CIs_Do30MinDraw || Panel.CIs_Do5MinDraw; //----- Is_DoMain || Is_DoDaily || Is_Do4Hour || Is_Do30Min || Is_Do5Min;
                    if(Is_AnyActive)
                    {         //--- Alert("Is_AnyActive:", Is_AnyActive);
                              switch(PeriodTMCom)
                              {         case PERIOD_CURRENT:   {     Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, false, NamingPERIOD_CURRENT, PERIOD_CURRENT, 3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial"); Is_DoMain  = false;} break; //
                                        case PERIOD_D1:        {     Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, false, NamingPERIOD_D1,      PERIOD_D1,      3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial"); Is_DoDaily = false;} break; //
                                        case PERIOD_H4:        {     Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, false, NamingPERIOD_H4,      PERIOD_H4,      3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial"); Is_Do4Hour = false;} break; //
                                        case PERIOD_M30:       {     Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, false, NamingPERIOD_M30,     PERIOD_M30,     3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial"); Is_Do30Min = false;} break; //
                                        case PERIOD_M5:        {     Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, false, NamingPERIOD_M5,      PERIOD_M5,      3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial"); Is_Do5Min  = false;} break; //
                              }//
                              {         //
                                        if(Is_DoMain)  {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__Main__"  + "Draw", OBJPROP_COLOR, clrYellowGreen);       ObjectSetInteger(0, "MoveLogo" + "__Period__Main__"  + "Draw", OBJPROP_COLOR, clrBlack); }
                                        else           {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__Main__"  + "Draw", OBJPROP_COLOR, clrRed);               ObjectSetInteger(0, "MoveLogo" + "__Period__Main__"  + "Draw", OBJPROP_COLOR, clrWhite); } //
                                        if(Is_DoDaily) {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__Daily__" + "Draw", OBJPROP_COLOR, clrYellowGreen);       ObjectSetInteger(0, "MoveLogo" + "__Period__Daily__" + "Draw", OBJPROP_COLOR, clrBlack);}
                                        else           {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__Daily__" + "Draw", OBJPROP_COLOR, clrRed);               ObjectSetInteger(0, "MoveLogo" + "__Period__Daily__" + "Draw", OBJPROP_COLOR, clrWhite);} //
                                        if(Is_Do4Hour) {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__4Hour__" + "Draw", OBJPROP_COLOR, clrYellowGreen);       ObjectSetInteger(0, "MoveLogo" + "__Period__4Hour__" + "Draw", OBJPROP_COLOR, clrBlack);} //
                                        else           {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__4Hour__" + "Draw", OBJPROP_COLOR, clrRed);               ObjectSetInteger(0, "MoveLogo" + "__Period__4Hour__" + "Draw", OBJPROP_COLOR, clrWhite); } //
                                        if(Is_Do30Min) {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__30Min__" + "Draw", OBJPROP_COLOR, clrYellowGreen);       ObjectSetInteger(0, "MoveLogo" + "__Period__30Min__" + "Draw", OBJPROP_COLOR, clrBlack);} //
                                        else           {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__30Min__" + "Draw", OBJPROP_COLOR, clrRed);               ObjectSetInteger(0, "MoveLogo" + "__Period__30Min__" + "Draw", OBJPROP_COLOR, clrWhite); } //
                                        if(Is_Do5Min)  {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__5Min__"  + "Draw", OBJPROP_COLOR, clrYellowGreen);       ObjectSetInteger(0, "MoveLogo" + "__Period__5Min__"  + "Draw", OBJPROP_COLOR, clrBlack); }
                                        else           {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__5Min__"  + "Draw", OBJPROP_COLOR, clrRed);               ObjectSetInteger(0, "MoveLogo" + "__Period__5Min__"  + "Draw", OBJPROP_COLOR, clrWhite);} //......
                              } //
                              Panel.CIs_DoMainDraw = Panel.CIs_DoDailyDraw = Panel.CIs_Do4HourDraw = Panel.CIs_Do30MinDraw = Panel.CIs_Do5MinDraw = false;
                              return true;//
                    }//
          }
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          {         //[---reset---]
                    Std_GoldVip_Panel_data_Frame CDraw;
                    CDraw.WhichMode               = MODE_CREATE;
                    CDraw.IsKey                   = false;
                    CDraw.PeriodTMCom             = Panel.Key_PeriodSafe;
                    _Call__Panel(CDraw);
                    //
          }
          {         //[---Create---]
                    Std_GoldVip_Panel_data_Frame CDraw;
                    CDraw.WhichMode               = MODE_CREATE;
                    CDraw.IsKey                   = true;
                    CDraw.Is_Reset_Desc           = true;
                    CDraw.Is_Created              = Panel.Is_CCreated           = true;
                    CDraw.IsCallMiniMode          = Panel.IsPadPress_Mini       = false;
                    CDraw.PeriodTMCom             = Panel.Key_PeriodSafe = PeriodTMCom;
                    CDraw.MoveX                   =  130 + 170;
                    CDraw.MoveY                   = -170;
                    if(Panel.Is_CordinateChange)        {CDraw.MoveX = Panel.X_Last; CDraw.MoveY = Panel.Y_Last;}
                    else                                {CDraw.MoveX = 300;  CDraw.MoveY = -170;}
                    CDraw.SizeX                   = 120;
                    CDraw.SizeY                   = 0;
                    CDraw.SizeExtendX             = 0;
                    CDraw.SizeExtendY             = 0;//
                    _Call__Panel(CDraw); //>>>RightMiddel Pannel
          } //
          {         //[---reset Fibos.Expansion.Create all ---]
                    Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, false, NamingPERIOD_CURRENT, PERIOD_CURRENT, 3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial");
                    Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, false, NamingPERIOD_D1,      PERIOD_D1,      3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial");
                    Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, false, NamingPERIOD_H4,      PERIOD_H4,      3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial");
                    Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, false, NamingPERIOD_M30,     PERIOD_M30,     3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial");
                    Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, false, NamingPERIOD_M5,      PERIOD_M5,      3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial");
                    Is_DoMain         = false;//
                    Is_DoDaily        = false;//
                    Is_Do4Hour        = false;//
                    Is_Do30Min        = false;//
                    Is_Do5Min         = false;//
          }
          {         //[---Create by period Fibos.Expansion.Create---]
                    switch(PeriodTMCom)
                    {         case PERIOD_CURRENT:   { Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, true, NamingPERIOD_CURRENT, PERIOD_CURRENT, 3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial");      Is_DoMain  = true;} break; //
                              case PERIOD_D1:        { Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, true, NamingPERIOD_D1,      PERIOD_D1,      3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial");      Is_DoDaily = true;} break; //
                              case PERIOD_H4:        { Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, true, NamingPERIOD_H4,      PERIOD_H4,      3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial");      Is_Do4Hour = true;} break; //
                              case PERIOD_M30:       { Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, true, NamingPERIOD_M30,     PERIOD_M30,     3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial");      Is_Do30Min = true;} break; //
                              case PERIOD_M5:        { Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, true, NamingPERIOD_M5,      PERIOD_M5,      3, true, 1,  STYLE_DOT, 1, clrLime, clrRed, 0, 7, "Arial");      Is_Do5Min  = true;} break; //
                    }//
          }
          //[---#X2 Create for currect period---]
          Panel_Coloring(PeriodTMCom);//
          //------------------------------------------
          {         //
                    if(Is_DoMain)  {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__Main__"  + "Draw", OBJPROP_COLOR, clrYellowGreen);       ObjectSetInteger(0, "MoveLogo" + "__Period__Main__"  + "Draw", OBJPROP_COLOR, clrBlack); }
                    else           {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__Main__"  + "Draw", OBJPROP_COLOR, clrRed);               ObjectSetInteger(0, "MoveLogo" + "__Period__Main__"  + "Draw", OBJPROP_COLOR, clrWhite); } //
                    if(Is_DoDaily) {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__Daily__" + "Draw", OBJPROP_COLOR, clrYellowGreen);       ObjectSetInteger(0, "MoveLogo" + "__Period__Daily__" + "Draw", OBJPROP_COLOR, clrBlack);}
                    else           {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__Daily__" + "Draw", OBJPROP_COLOR, clrRed);               ObjectSetInteger(0, "MoveLogo" + "__Period__Daily__" + "Draw", OBJPROP_COLOR, clrWhite);} //
                    if(Is_Do4Hour) {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__4Hour__" + "Draw", OBJPROP_COLOR, clrYellowGreen);       ObjectSetInteger(0, "MoveLogo" + "__Period__4Hour__" + "Draw", OBJPROP_COLOR, clrBlack);} //
                    else           {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__4Hour__" + "Draw", OBJPROP_COLOR, clrRed);               ObjectSetInteger(0, "MoveLogo" + "__Period__4Hour__" + "Draw", OBJPROP_COLOR, clrWhite); } //
                    if(Is_Do30Min) {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__30Min__" + "Draw", OBJPROP_COLOR, clrYellowGreen);       ObjectSetInteger(0, "MoveLogo" + "__Period__30Min__" + "Draw", OBJPROP_COLOR, clrBlack);} //
                    else           {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__30Min__" + "Draw", OBJPROP_COLOR, clrRed);               ObjectSetInteger(0, "MoveLogo" + "__Period__30Min__" + "Draw", OBJPROP_COLOR, clrWhite); } //
                    if(Is_Do5Min)  {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__5Min__"  + "Draw", OBJPROP_COLOR, clrYellowGreen);       ObjectSetInteger(0, "MoveLogo" + "__Period__5Min__"  + "Draw", OBJPROP_COLOR, clrBlack); }
                    else           {ObjectSetInteger(0, "MoveLogoLeftO2" + "__Period__5Min__"  + "Draw", OBJPROP_COLOR, clrRed);               ObjectSetInteger(0, "MoveLogo" + "__Period__5Min__"  + "Draw", OBJPROP_COLOR, clrWhite);} //......
          } //
          {         Panel.CIs_DoMain  = Is_DoMain  ; //
                    Panel.CIs_DoDaily = Is_DoDaily ; //
                    Panel.CIs_Do4Hour = Is_Do4Hour ; //
                    Panel.CIs_Do30Min = Is_Do30Min ; //
                    Panel.CIs_Do5Min  = Is_Do5Min  ; //
                    //[---reset---]
                    Panel.CIs_DoMainDraw  = false;//
                    Panel.CIs_DoDailyDraw = false;//
                    Panel.CIs_Do4HourDraw = false;//
                    Panel.CIs_Do30MinDraw = false;//
                    Panel.CIs_Do5MinDraw  = false;//
                    //[---Define Keys----]
                    if(Is_DoMain)        {Panel.CIs_DoMain        = Is_DoMain   = false;       Panel.CIs_DoMainDraw  = true;}
                    if(Is_DoDaily)       {Panel.CIs_DoDaily       = Is_DoDaily  = false;       Panel.CIs_DoDailyDraw = true;}//
                    if(Is_Do4Hour)       {Panel.CIs_Do4Hour       = Is_Do4Hour  = false;       Panel.CIs_Do4HourDraw = true;}//
                    if(Is_Do30Min)       {Panel.CIs_Do30Min       = Is_Do30Min  = false;       Panel.CIs_Do30MinDraw = true;}//
                    if(Is_Do5Min)        {Panel.CIs_Do5Min        = Is_Do5Min   = false;       Panel.CIs_Do5MinDraw  = true;}//
                    //=====================================//
          }
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string C_GOLDVIP::TFXHistoryGapRestore(ENUM_TIMEFRAMES PeriodTMCom, string & TFXHistoryGapDesc, bool & TFXHistoryGapValue)
{         switch(PeriodTMCom)
          {         case  PERIOD_CURRENT:       {Set_Back_Gap(_HistoryGap._CURRENT,      TFXHistoryGapDesc, TFXHistoryGapValue); } break; //
                    case  PERIOD_MN1:           {Set_Back_Gap(_HistoryGap._MN1,          TFXHistoryGapDesc, TFXHistoryGapValue); } break; //
                    case  PERIOD_W1:            {Set_Back_Gap(_HistoryGap._W1,           TFXHistoryGapDesc, TFXHistoryGapValue); } break; //
                    case  PERIOD_D1:            {Set_Back_Gap(_HistoryGap._D1,           TFXHistoryGapDesc, TFXHistoryGapValue); } break; //
                    case  PERIOD_H4:            {Set_Back_Gap(_HistoryGap._H4,           TFXHistoryGapDesc, TFXHistoryGapValue); } break; //
                    case  PERIOD_H1:            {Set_Back_Gap(_HistoryGap._H1,           TFXHistoryGapDesc, TFXHistoryGapValue); } break; //
                    case  PERIOD_M30:           {Set_Back_Gap(_HistoryGap._M30,          TFXHistoryGapDesc, TFXHistoryGapValue); } break; //
                    case  PERIOD_M15:           {Set_Back_Gap(_HistoryGap._M15,          TFXHistoryGapDesc, TFXHistoryGapValue); } break; //
                    case  PERIOD_M5:            {Set_Back_Gap(_HistoryGap._M5,           TFXHistoryGapDesc, TFXHistoryGapValue); } break; //
                    case  PERIOD_M1:            {Set_Back_Gap(_HistoryGap._M1,           TFXHistoryGapDesc, TFXHistoryGapValue); } break; //
          } //
          return("OK");//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::Set_Update__Signal__data__ByPeriod(Std_GoldVip_Panel_data_Desc_TPX & Out_ClientTPX, ENUM_TIMEFRAMES PeriodTMCom, string SozCom = "-")
{         switch(PeriodTMCom)///Set_ing///
          {         case  PERIOD_CURRENT:       { Set_Desc( Out_ClientTPX, GoldVIP.Signals_Periods._CURRENT, GoldVIP.periods._CURRENT,        "CURRENT",       SozCom); }     break;  ////
                    case  PERIOD_MN1:           { Set_Desc( Out_ClientTPX, GoldVIP.Signals_Periods._MN1,     GoldVIP.periods._MN1,            "MN1",           SozCom); }     break;  ////
                    case  PERIOD_W1:            { Set_Desc( Out_ClientTPX, GoldVIP.Signals_Periods._W1,      GoldVIP.periods._W1,             "W1",            SozCom ); }    break;  ////
                    case  PERIOD_D1:            { Set_Desc( Out_ClientTPX, GoldVIP.Signals_Periods._D1,      GoldVIP.periods._D1,             "D1",            SozCom ); }    break;  ////
                    case  PERIOD_H4:            { Set_Desc( Out_ClientTPX, GoldVIP.Signals_Periods._H4,      GoldVIP.periods._H4,             "H4",            SozCom ); }    break;  ////
                    case  PERIOD_H1:            { Set_Desc( Out_ClientTPX, GoldVIP.Signals_Periods._H1,      GoldVIP.periods._H1,             "H1",            SozCom ); }    break;  ////
                    case  PERIOD_M30:           { Set_Desc( Out_ClientTPX, GoldVIP.Signals_Periods._M30,     GoldVIP.periods._M30,            "M30",           SozCom ); }    break;  /////
                    case  PERIOD_M15:           { Set_Desc( Out_ClientTPX, GoldVIP.Signals_Periods._M15,     GoldVIP.periods._M15,            "M15",           SozCom ); }    break;  /////
                    case  PERIOD_M5:            { Set_Desc( Out_ClientTPX, GoldVIP.Signals_Periods._M5,      GoldVIP.periods._M5,             "M5",            SozCom ); }    break;  ////
                    case  PERIOD_M1:            { Set_Desc( Out_ClientTPX, GoldVIP.Signals_Periods._M1,      GoldVIP.periods._M1,             "M1",            SozCom ); }    break;  ////
          }//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Y1, typename Y2>
void C_GOLDVIP::Set_Desc( Std_GoldVip_Panel_data_Desc_TPX & Out_ClientTPX, Y1 & y, Y2 & y2, string desc, string SozCom = "-" )
{         Out_ClientTPX.TPX_TimePeriodDesc            = y.TimePeriodDesc;
          Out_ClientTPX.TPX_DateCalculatingDesc       = y.DateCalculatingDesc;
          Out_ClientTPX.TPX_ProfitPipDesc             = y.ProfitPipDesc;
          //-----
          Out_ClientTPX.TPX_R4ValueDesc               = y.R4ValueDesc;
          Out_ClientTPX.TPX_R2ValueDesc               = y.R2ValueDesc;
          Out_ClientTPX.TPX_PPValueDesc               = y.PPValueDesc;
          Out_ClientTPX.TPX_S2ValueDesc               = y.S2ValueDesc;
          Out_ClientTPX.TPX_S4ValueDesc               = y.S4ValueDesc;
          //------
          Out_ClientTPX.TPX_TP1ValueDesc              = y.TP1ValueDesc;
          Out_ClientTPX.TPX_TP1PercentValueDesc       = y.TP1PercentValueDesc;
          Out_ClientTPX.TPX_TP1ValueDictanceDesc      = y.TP1ValueDictanceDesc;
          Out_ClientTPX.TPX_TP1PercentValueCalc       = y.TP1PercentValueCalc;
          //------
          Out_ClientTPX.TPX_TP2ValueDesc              = y.TP2ValueDesc;
          Out_ClientTPX.TPX_TP2PercentValueDesc       = y.TP2PercentValueDesc;
          Out_ClientTPX.TPX_TP2ValueDictanceDesc      = y.TP2ValueDictanceDesc;
          Out_ClientTPX.TPX_TP2PercentValueCalc       = y.TP2PercentValueCalc;
          //------
          Out_ClientTPX.TPX_TP3ValueDesc              = y.TP3ValueDesc;
          Out_ClientTPX.TPX_TP3PercentValueDesc       = y.TP3PercentValueDesc;
          Out_ClientTPX.TPX_TP3ValueDictanceDesc      = y.TP3ValueDictanceDesc;
          Out_ClientTPX.TPX_TP3PercentValueCalc       = y.TP3PercentValueCalc;
          //------
          Out_ClientTPX.TPX_Set_TypeDesc               = y.Trade_Type_Desc;
          Out_ClientTPX.TPX_StartPriceDesc             = y.StartPriceDesc;
          //
          Out_ClientTPX.TPX_StopLossValueDesc         = y.StopLossValueDesc;
          Out_ClientTPX.TPX_StopLossValueDictanceDesc = y.StopLossValueDictanceDesc;
          //
          Out_ClientTPX.TPX_EndTimeDesc               = y.EndTimeDesc;
          //-------------------
          Out_ClientTPX.TPX_Text050_TP1Color          = y2.Text050_TP1Color;
          Out_ClientTPX.TPX_Text050_TP2Color          = y2.Text050_TP2Color;
          Out_ClientTPX.TPX_Text050_TP3Color          = y2.Text050_TP3Color;
          //-----------------------
          int StringFindX = StringFind(SozCom, desc);
          if(StringFindX != -1)Out_ClientTPX.TPX_SozCom = SozCom;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_GOLDVIP::Set___HistoryGap( string  & SozSet_, ENUM_TIMEFRAMES TF)
{
          {         //#3_StatusSubPanelGoldVipIs_Main_FillTexts
                    string   TFXHistoryGapDesc = "-"; bool  TFXHistoryGapValue = false;
                    //---
                    //---
                    //---
                    TFXHistoryGapRestore(TF, TFXHistoryGapDesc, TFXHistoryGapValue);
                    if(TFXHistoryGapValue)SozSet_ = TFXHistoryGapDesc;//need to one to one///
          }//
}
//+------------------------------------------------------------------+
//|             Class TechnicalX     BEGIN-END                       |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
