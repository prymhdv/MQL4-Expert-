//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_LABEL.mqh                      || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct S_RECTANGLE: public  _COBF_
{         //============================================================================================================
          //ObjectCreate(chart_ID,name,OBJ_RECTANGLE,sub_window,time1,price1,time2,price2);
          //datetime time1 = 0, double price1 = 0, datetime time2 = 0, double price2 = 0, datetime time3 = 0, double
          //============================================================================================================
          void                  S_RECTANGLE() {TYPE_O_00 = OBJ_RECTANGLE;}; // {Point2XY(0, 0, 0, 0);}; //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0  S_HLINE.PointTime.TIME2==0   S_HLINE.PointTime.PRICE2==0
          S_point               Point2XY;// = ((datetime)0, 0, 0, 0);                                               //S_HLINE.PointTime.TIME1==0  S_HLINE.PointTime.PRICE1==0
          ////----------------------------------
          //datetime              TIME1;                 //0       datetime        Datetime value to set/get first coordinate time part
          //double                PRICE1;                //1       double          Double value to set/get first coordinate price part
          //datetime              TIME2;                 //2       datetime        Datetime value to set/get second coordinate time part
          //double                PRICE2;                //3       double          Double value to set/get second coordinate price part
          ////----------------------------------
          //color                 COLOR;                        //Color                           color
          //ENUM_LINE_STYLE       STYLE;                        //Style                           ENUM_LINE_STYLE
          //int                   WIDTH;                        //Line thickness                  int
          ////----------------------------------
          //bool                  FILL;
          //////----------------------------------
          //============================================================================================================
          //OBJECT.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);
          //OBJECT.Style(STYLE);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STYLE, STYLE);
          //OBJECT.Width(Width);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_WIDTH, WIDTH);//
          ////----------------------------------
          //OBJECT.Fill(FILL); /*ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_FILL, FILL);*/
          ////----------------------------------
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
          bool Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         TIMEFRAMES_O_00               /*= FRAME.TIMEFRAMES*/      = Period();
                    SYMBOL_O_00                   /*= FRAME.SYMBOL*/          = Symbol();
                    CREATETIME_O_00               /*= FRAME.CREATETIME*/      = TimeLocal();
                    TYPE_O_00                     /*= FRAME.TYPE*/            = OBJ_RECTANGLE;
                    CHART_O_00                    /*= FRAME.CHART*/           = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00                /*= FRAME.SUBWINDOW*/       = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          };//
          void Set_Cordinate_4( datetime _TIME1, double _PRICE1, datetime _TIME2, double _PRICE2)
          {         TIME1       = _TIME1;
                    PRICE1      = _PRICE1;
                    TIME2       = _TIME2;
                    PRICE2      = _PRICE2;
                    //
          } //

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
                    {         //any type
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_COLOR,   this.COLOR_C_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_STYLE,   this.STYLE_9);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_WIDTH,   this.WIDTH_10);//
                    }
                    {         ObjectSetInteger( ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TIME1,  this.TIME1);
                              ObjectSetDouble(  ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_PRICE1, this.PRICE1);//
                              ObjectSetInteger( ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TIME2,  this.TIME2);
                              ObjectSetDouble(  ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_PRICE2, this.PRICE2);//
                    }
                    if(this.TYPE_O_00 == OBJ_RECTANGLE) { ObjectSetInteger( ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_FILL, this.FILL); }//]
                    return false;//
          }

};
//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_LABEL.mqh                      || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
