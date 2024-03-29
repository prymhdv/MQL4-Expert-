//+------------------------------------------------------------------+
//||   ||||||||||                 Graphical_Object_Base.mqh         || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\gDefinesEnumsStracts.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\GOB_Elementry.mqh>
//---
//--- gFlow_Pad.BTN_FiboExpTrade.GDS.Set_Common_6(false, 80, false, false, false, ButtonDEF_tooltip + "gFlow_Pad.BTN_FiboExpTrade");
//--- gFlow_Pad.BTN_FiboExpTrade.GDS.Set_Chart_6();
//---
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Graphical_Object_Base
{
public:
          string                NAME_A_01;          //Object name
          long                  chart_ID ;//= 0;      // chart's ID
          //string                name = "FiboLevels" xss;
          ////----------------------------------
          color                 COLOR_C_00;                        //Color                           color
          ////----------------------------------
          int                   MODE_I_00;          //= MODE_CREATE;= MODE_MOVE;= MODE_MODIFY;
          bool                  IsKey_I_00;        //= false;
          bool                  IS_SET_I_00;
          bool                  Is_Delete;
          bool                  Is_Set_Signal;
          ////----------------------------------
          bool                  IsCreated;
          bool                  IS_Set_Action_2_56;
          bool                  IS_Set_Desc_1_51;
          bool                  IS_Set_Location_5_52;
          bool                  IS_Set_Color_1_53;
          bool                  IS_Set_Color_3_53;
          bool                  IS_Set_Common_6_54;
          bool                  IS_Set_Chart_6_55;
          ////----------------------------------
          bool                  BACK_G_00;          //Object in the background        bool
          long                  ZORDER_G_00;        //Priority of a graphical object for receiving events of clicking on a chart (CHARTEVENT_CLICK).The default zero value is set when creating an object; the priority can be increased if necessary.When objects are placed one atop another, only one of them with the highest priority will receive the CHARTEVENT_CLICK event.       long
          bool                  HIDDEN_G_00;        //Prohibit showing of the name of a graphical object in the list of objects from the terminal menu "Charts" - "Objects" - "List of objects". The true value allows to hide an object from the list. By default, true is set to the objects that display calendar events, trading history and to the objects created from MQL4 programs. To see such graphical objects and access their properties, click on the "All" button in the "List of objects" window.   bool
          bool                  SELECTED_G_00;      //Object is selected   bool
          bool                  SELECTABLE_G_00;    //Object availability    bool
          string                TOOLTIP_G_00;       //The text of a tooltip. If the property is not set, then the tooltip generated automatically by the terminal is shown. A tooltip can be disabled by setting the "\n" (line feed) value to it    string
          ////----------------------------------
          long                  TIMEFRAMES_O_00;    //Visibility of an object at timeframes    set of flags flags (OBJ_ALL_PERIODS)  ObjectSetInteger(0,highlevel,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15|OBJ_PERIOD_H1);
          string                SYMBOL_O_00;        //Symbol for the Chart object                                     string
          datetime              CREATETIME_O_00;    //Time of object creation      datetime    r/o
          ENUM_OBJECT           TYPE_O_00;          //Object type   ENUM_OBJECT   r/o
          long                  CHART_O_00;         //Object chart  id number in
          int                   SUBWINDOW_O_00;
          ////----------------------------------
          void                  Graphical_Object_Base();
          bool                  Set_Action_2(int WhichMode = MODE_CREATE, bool IsKey = false);
          bool                  Set_Desc_1(string name_1);
          bool                  Set_Color_1(color clr_5);
          bool                  SetLocationDemo();
          bool                  Set_Common_6(bool back_31, long zorder_32, bool hidden_33, bool selected_34, bool selectable_35, string tooltip_36);
          bool                  Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0);
          bool                  Seted();//
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Graphical_Object_Base::Graphical_Object_Base() :
          //=======================
          NAME_A_01("Name"),   //'NAME_A_01' - parent member initialization not allowed   _COBF_.mqh          103       21
          //=======================
          COLOR_C_00(clrNONE),
          ///---off proxy of parrent,,, ---On proxy child
          //XDISTANCE_L_02(0),           ///----'XDISTANCE_L_02' - parent member initialization not allowed   ///--- 'XDISTANCE_L_02(0)' ,  'this' - struct member undefined
          //YDISTANCE_7(0),                //---- >>>  Proxy Handler
          //=======================
          MODE_I_00(MODE_CREATE),
          IsKey_I_00(false),
          IS_SET_I_00(false),
          //=======================
          IS_Set_Action_2_56(false),
          IS_Set_Desc_1_51(false),
          IS_Set_Location_5_52(false),
          IS_Set_Color_1_53(false),
          IS_Set_Common_6_54(false),
          IS_Set_Chart_6_55(false),
          //=======================
          BACK_G_00(false),
          ZORDER_G_00(10),
          HIDDEN_G_00(false),
          SELECTED_G_00(false),
          SELECTABLE_G_00(false),
          TOOLTIP_G_00("tooltip"),
          //=======================
          TIMEFRAMES_O_00(Period()),
          SYMBOL_O_00(Symbol()),
          CREATETIME_O_00(TimeLocal()),
          TYPE_O_00(-1),////--OBJ_LABEL
          CHART_O_00(ChartData_ChartInfo.ID),
          SUBWINDOW_O_00(ChartData_ChartInfo.SubWindow)
          //=======================
{         //testGFRAME();// no problem yeat... MQL4\Include\0srcCapitan\QuartsExperts\OnLearn\Template Generic Coding.mqh
//===================================================================
          this.NAME_A_01                 /*= FRAME.NAME*/            = "Name";
//===================================================================
          this.COLOR_C_00                /*=  FRAME.COLOR*/           = clrNONE;        //
//===================================================================
          this.BACK_G_00                /*=  FRAME.BACK*/            = false;
          this.ZORDER_G_00              /*=  FRAME.ZORDER*/          = 10;
          this.HIDDEN_G_00              /*=  FRAME.HIDDEN*/          = false;
          this.SELECTED_G_00            /*=  FRAME.SELECTED*/        = false;
          this.SELECTABLE_G_00          /*=  FRAME.SELECTABLE*/      = false;
          this.TOOLTIP_G_00             /*=  FRAME.TOOLTIP*/         = "tooltip";       //
//===================================================================
          this.TIMEFRAMES_O_00          /*=  FRAME.TIMEFRAMES*/      = Period();
          this.SYMBOL_O_00              /*=  FRAME.SYMBOL*/          = Symbol();
          this.CREATETIME_O_00          /*=  FRAME.CREATETIME*/      = TimeLocal();
          this.TYPE_O_00                /*=  FRAME.TYPE*/            = -1;              // OBJ_LABEL;  OBJ_HLINE
          this.CHART_O_00               /*=  FRAME.CHART*/           = ChartData_ChartInfo.ID;
          this.SUBWINDOW_O_00           /*=  FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
//===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Graphical_Object_Base::Set_Action_2(int WhichMode = MODE_CREATE, bool IsKey = false)
{         this.MODE_I_00 /*= FRAME.MODE*/   = WhichMode;
          this.IsKey_I_00 /*= FRAME.IsKey*/ = IsKey;
          return IS_Set_Action_2_56 = true; //
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Graphical_Object_Base::Seted()
{         if(IsCreated)return false;
          return IS_SET_I_00 = (IS_Set_Desc_1_51 && IS_Set_Location_5_52 && IS_Set_Color_1_53 && IS_Set_Common_6_54 && IS_Set_Chart_6_55 && IS_Set_Action_2_56) ? true : false; }; //

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Graphical_Object_Base::Set_Desc_1(string name_1)
{         NAME_A_01 /*=  FRAME.NAME*/ = "none"; //"Name";
          NAME_A_01 /*=  FRAME.NAME*/ = name_1; //"Name";
          //
          return IS_Set_Desc_1_51 = true; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Graphical_Object_Base::Set_Color_1(color clr_5)
{         //if(IsCreated)return false;
          this.COLOR_C_00 /*= FRAME.COLOR*/ = clr_5;
          //
          return IS_Set_Color_1_53 = true; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Graphical_Object_Base::Set_Common_6(bool back_31, long zorder_32, bool hidden_33, bool selected_34, bool selectable_35, string tooltip_36)
{         //if(IsCreated)return false;
          BACK_G_00                /*= FRAME.BACK*/            = back_31;
          ZORDER_G_00              /*= FRAME.ZORDER*/          = zorder_32;
          HIDDEN_G_00              /*= FRAME.HIDDEN*/          = hidden_33;
          SELECTED_G_00            /*= FRAME.SELECTED*/        = selected_34;
          SELECTABLE_G_00          /*= FRAME.SELECTABLE*/      = selectable_35;
          TOOLTIP_G_00             /*= FRAME.TOOLTIP*/         = tooltip_36;//
          //--
          //
          //ObjectSetInteger(ChartData_ChartInfo.ID, this.CName, OBJPROP_BACK,              this.BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, this.CName, OBJPROP_SELECTABLE,        this.SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, this.CName, OBJPROP_SELECTED,          this.SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, this.CName, OBJPROP_HIDDEN,            this.HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, this.CName, OBJPROP_ZORDER,            this.ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  this.CName, OBJPROP_TOOLTIP,           this.TOOLTIP);//
          //
          return IS_Set_Common_6_54 = true; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Graphical_Object_Base::Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
{         if(IsCreated)return false;
          TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
          SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
          CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
          TYPE_O_00                     /*= FRAME.TYPE*/            = NULL;
          CHART_O_00                    /*= FRAME.CHART*/           = ChartData_ChartInfo.ID;
          SUBWINDOW_O_00                /*= FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
          //
          return IS_Set_Chart_6_55 = true; //
};
//
//+------------------------------------------------------------------+
//||   ||||||||||                 Graphical_Object_Base.mqh         || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
