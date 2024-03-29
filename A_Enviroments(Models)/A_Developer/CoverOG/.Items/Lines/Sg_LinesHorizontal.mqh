//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_LinesHorizontal.mqh            || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
struct S_HLINE: public _COBF_
{         //============================================================================================================
          void                 S_HLINE() {TYPE_O_00 = OBJ_HLINE;}; // {Point1Y(0, 0);};

          ////----------------------------------
          S_point               Point1Y;                                     //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          //--double                PRICE_2;                      //PRICE y                        double;//
          ////----------------------------------
          //color                  COLOR;                        //Color                           color
          //ENUM_LINE_STYLE        STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                    WIDTH;                        //Line thickness                  int
          ////----------------------------------
          bool                   IS_Set_Location_1_52;//
          //////----------------------------------
          //bool                 BACK;          //Object in the background        bool
          //long                 ZORDER;        //Priority of a graphical object for receiving events of clicking on a chart (CHARTEVENT_CLICK).The default zero value is set when creating an object; the priority can be increased if necessary.When objects are placed one atop another, only one of them with the highest priority will receive the CHARTEVENT_CLICK event.       long
          //bool                 HIDDEN;        //Prohibit showing of the name of a graphical object in the list of objects from the terminal menu "Charts" - "Objects" - "List of objects". The true value allows to hide an object from the list. By default, true is set to the objects that display calendar events, trading history and to the objects created from MQL4 programs. To see such graphical objects and access their properties, click on the "All" button in the "List of objects" window.   bool
          //bool                 SELECTED;      //Object is selected   bool
          //bool                 SELECTABLE;    //Object availability    bool
          //string               TOOLTIP;       //The text of a tooltip. If the property is not set, then the tooltip generated automatically by the terminal is shown. A tooltip can be disabled by setting the "\n" (line feed) value to it    string
          //////----------------------------------
          //long                 TIMEFRAMES;    //Visibility of an object at timeframes    set of flags flags (OBJ_ALL_PERIODS)  ObjectSetInteger(0,highlevel,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15|OBJ_PERIOD_H1);
          //string               NAME;          //Object name                                                     string
          //string               SYMBOL;        //Symbol for the Chart object                                     string
          //datetime             CREATETIME;    //Time of object creation      datetime    r/o
          //ENUM_OBJECT          TYPE;          //Object type   ENUM_OBJECT   r/o
          //============================================================================================================
          bool Set_Location_1(double p)
          {         this.PRICE1      /*  = FRAME.PRICE */          = p;
                    return IS_Set_Location_1_52 = true; //
          }
          bool Set_Tip_2(ENUM_LINE_STYLE style_9, int width_10)
          {         this.STYLE_9             /*   = FRAME.STYLE  */         = style_9;
                    this.WIDTH_10             /*  = FRAME.WIDTH  */         = width_10;
                    //
                    return true;//
          };
          bool Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
                    SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
                    CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_HLINE;
                    CHART_O_00                    /*= FRAME.CHART*/           = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00                /*= FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          };
          bool Setup()
          {
                    {         //any type
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_BACK,            this.BACK_G_00); //Sleep(1);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_HIDDEN,          this.HIDDEN_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_SELECTABLE,      this.SELECTABLE_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_SELECTED,        this.SELECTED_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_ZORDER,          this.ZORDER_G_00);
                              ObjectSetString( ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TOOLTIP,         this.TOOLTIP_G_00);//
                    }
                    //any type Line
                    ObjectSetInteger    (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_COLOR, this.COLOR_C_00);
                    ObjectSetInteger    (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_STYLE, this.STYLE_9);
                    ObjectSetInteger    (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_WIDTH, this.WIDTH_10);
                    //
                    ObjectSetDouble     (ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_PRICE,    this.PRICE1);
                    //
                    return true;//
          };
          //============================================================================================================
          //OBJECT.Color(COLOR); //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE); //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(WIDTH); //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);
          ////----------------------------------
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
};

//+------------------------------------------------------------------+
//||   ||||||||||                  Sg_LinesHorizontal.mqh           || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
