//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_TEXTDescription.mqh            ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
        TextX.Description.GDS.Set_Action_2(MODE_CREATE, true);
        TextX.Description.GDS.Set_Desc_4(  name_1,   text_2,   font_3,   fontsize_4);
        TextX.Description.GDS.Set_Color_2(  clr_5);
        TextX.Description.GDS.Set_Location_4(   time_6,   price_7,   angle_8,   anchor_point_9);
        TextX.Description.GDS.Set_Common_6(bool back_31, long zorder_32, bool hidden_33, bool selected_34, bool selectable_35, string tooltip_36);
        TextX.Description.GDS.Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0);
        TextX.Description..Action(LabelX); //

        TextsX.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
        TextsX.Description.GDS.Set_Desc_4("Bars_5M[" + (string)k + "].force_of_deals", "---:", "Arial", 19);
        TextsX.Description.GDS.Set_Color_2(  clrWhite);
        TextsX.Description.GDS.Set_Location_4(ct_Conductor.CandleBars.Bars_5M[k]._Time, ct_Conductor.CandleBars.Bars_5M[k]._Close + 1, 0, ANCHOR_LEFT);
        TextsX.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_5M[" + (string)k + "].force_of_deals");
        TextsX.Description.GDS.Set_Chart_6();
        TextsX.Description..Action(TextsX.Description); //
        {
          GDS.Set_Action_2(MODE_CREATE, true);//---DescX
          GDS.Set_Desc_4(  n, n, f, s);
          GDS.Set_Color_2(c);
          GDS.Set_Location_4(t, p, 0, ANCHOR_LEFT);
          GDS.Set_Common_6(false, 50, false, false, false, "tooltip-"  + n);
          GDS.Set_Chart_6();
          GDS.Set_Show_1(Is_Show);
          Action(this); //
        }


*/
struct S_TEXTDescription: public _COBF_
{         //============================================================================================================
          //string                NAME_A_01;
          //string                TEXT_B_01;          //Description of the object (the text contained in the object)    string
          //string                FONT_B_02;          //Font     string
          //int                   FONTSIZE_B_03;                     //Font size       int
          ////----------------------------------
          //color                 COLOR_C_00;         //Color                           color
          //------------------------------------
          //int                   XDISTANCE_L_02;
          //int                   YDISTANCE_L_03;

          ////----------------------------------
          //datetime              TIME_6;          //Time coordinate     datetime   modifier=number of anchor point
          //double                PRICE_7;         //Price coordinate
          //double                ANGLE_8;         //Angle.  For the objects with no angle specified, created from a program, the value is equal to EMPTY_VALUE      double
          //ENUM_ANCHOR_POINT     ANCHOR_POINT_9;             //Location of the anchor point of a graphical object  ENUM_ARROW_ANCHOR (for OBJ_ARROW), ENUM_ANCHOR_POINT //(for OBJ_LABEL, OBJ_BITMAP_LABEL and OBJ_TEXT)
          //////----------------------------------

          //============================================================================================================
          //OBJECT.Color(COLOR);            //ObjectSetInteger(CChart_ID, CName, OBJPROP_COLOR, COLOR);//
          ////----------------------------------
          //OBJECT.Time(TIME);                 //ObjectSetInteger(CChart_ID, CName, OBJPROP_TEXT, TIME);
          //OBJECT.Price(PRICE);               //ObjectSetDouble( CChart_ID, CName, OBJPROP_TEXT, PRICE);
          //OBJECT.Description(TEXT);        //ObjectSetString( CChart_ID, CName, OBJPROP_TEXT, TEXT);
          //OBJECT.Font(FONT);               //ObjectSetString( CChart_ID, CName, OBJPROP_FONT, FONT);
          //OBJECT.FontSize(FONTSIZE);       //ObjectSetInteger(CChart_ID, CName, OBJPROP_FONTSIZE, FONTSIZE);
          //OBJECT.Angle(ANGLE);             //ObjectSetDouble( CChart_ID, CName, OBJPROP_ANGLE, ANGLE);
          //OBJECT.Anchor(ANCHOR_POINT);     //ObjectSetInteger(CChart_ID, CName, OBJPROP_ANCHOR, ANCHOR_POINT); //
          ////----------------------------------
          //ObjectSetInteger(CChart_ID, CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(CChart_ID, CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(CChart_ID, CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(CChart_ID, CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(CChart_ID, CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(CChart_ID,  CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
          void  S_TEXTDescription();
          void  ~S_TEXTDescription();
          //
          bool  Set_Desc_4(string name_1, string text_2, string font_3, int fontsize_4);
          bool  Set_Color_1(color clr_5);
          bool  Set_Location_4( datetime time_6, double price_7, double angle_8, ENUM_ANCHOR_POINT anchor_point_9);
          bool  Set_Common_6(bool back_31, long zorder_32, bool hidden_33, bool selected_34, bool selectable_35, string tooltip_36);
          bool  Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0);
          //============================================================================================================
          bool                  Setup()
          {         return true;//
          }; //


};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_TEXTDescription::S_TEXTDescription()//string Desc, datetime TimeX, double PriceY, color Color
//:
//=======================
//  NAME_A_01("Name"),
//TEXT_B_01("Description"),
//FONT_B_02("Font"),
//FONTSIZE_B_03(7)
//=======================
// COLOR_C_00(clrNONE),
//=======================
//TIME_6(Time[0]),
//PRICE_7(Close[0]),
//ANGLE_8(0)
//ANCHOR_POINT_9(ANCHOR_LEFT_UPPER)//,
//=======================
//BACK_G_00(false),
//ZORDER_G_00(10),
//HIDDEN_G_00(false),
//SELECTED_G_00(false),
//SELECTABLE_G_00(false),
//TOOLTIP_G_00("tooltip"),
////=======================
//TIMEFRAMES_O_00(Period()),
//SYMBOL_O_00(Symbol()),
//CREATETIME_O_00(TimeLocal()),
//TYPE_O_00(OBJ_TEXT),
//CHART_O_00(ChartData_ChartInfo.ID),
//SUBWINDOW_O_00(ChartData_ChartInfo.SubWindow)
//=======================
{         //===================================================================
          //this.NAME_A_01                 = FRAME.NAME            = "NAME";
          this.TEXT_B_01                  /*= FRAME.TEXT  */          = "TEXT";
          this.FONT_B_02                  /*= FRAME.FONT   */         = "Arial";
          this.FONTSIZE_B_03              /*= FRAME.FONTSIZE*/        = 7;
          //===================================================================
          // this.COLOR_C_00                = FRAME.COLOR           = clrNONE;
          //===================================================================
          this.TIME_6                  /*= FRAME.TIME   */         = 0;//Time[0];
          this.PRICE_7                 /*= FRAME.PRICE  */         = 0;//Close[0];
          this.ANGLE_8                /* = FRAME.ANGLE     */      = 0;
          this.ANCHOR_POINT_9         /* = FRAME.ANCHOR_POINT*/    = ANCHOR_LEFT_UPPER;
          //===================================================================
          //this.BACK_G_00                = FRAME.BACK            = false;
          //this.ZORDER_G_00              = FRAME.ZORDER          = 10;
          //this.HIDDEN_G_00              = FRAME.HIDDEN          = false;
          //this.SELECTED_G_00            = FRAME.SELECTED        = false;
          //this.SELECTABLE_G_00          = FRAME.SELECTABLE      = false;
          //this.TOOLTIP_G_00             = FRAME.TOOLTIP         = "tooltip";//
          ////===================================================================
          //this.TIMEFRAMES_O_00          = FRAME.TIMEFRAMES      = Period();
          //this.SYMBOL_O_00              = FRAME.SYMBOL          = Symbol();
          //this.CREATETIME_O_00          = FRAME.CREATETIME      = TimeLocal();
          this.TYPE_O_00                 /* = FRAME.TYPE  */          = OBJ_TEXT;
          //this.CHART_O_00               = FRAME.CHART           = ChartData_ChartInfo.ID;
          //this.SUBWINDOW_O_00           = FRAME.SUBWINDOW       = ChartData_ChartInfo.SubWindow;
          //===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void S_TEXTDescription::~S_TEXTDescription() {};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_TEXTDescription::Set_Desc_4(string name_1, string text_2, string font_3, int fontsize_4)
{         ObjectDelete(name_1);
          this.NAME_A_01                  /*= FRAME.NAME      */      = ""; //"Name";
          this.TEXT_B_01                  /*= FRAME.TEXT       */     = "";
          this.FONT_B_02                  /*= FRAME.FONT      */      = "";
          this.FONTSIZE_B_03              /*= FRAME.FONTSIZE  */      = 0;
//
          this.NAME_A_01                  /*= FRAME.NAME     */       = name_1; //"Name";
          //--- if(IsCreated)return false;
          if(MODE_I_00 == MODE_MOVE) return false;
          this.TEXT_B_01                 /* = FRAME.TEXT    */        = text_2;
          this.FONT_B_02                 /* = FRAME.FONT    */        = font_3;
          this.FONTSIZE_B_03             /* = FRAME.FONTSIZE */       = fontsize_4;
          //
          return true;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_TEXTDescription::Set_Color_1(color clr_5)
{         //if(IsCreated)return false;
          //if(MODE_I_00 == MODE_MOVE) return false;
          this.COLOR_C_00                 /*= FRAME.COLOR*/           = clrNONE;
          //
          this.COLOR_C_00                /* = FRAME.COLOR */          = clr_5;
          //
          return true;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_TEXTDescription::Set_Location_4( datetime time_6, double price_7, double angle_8, ENUM_ANCHOR_POINT anchor_point_9)
{         //---  if(IsCreated && !(MODE_I_00 == MODE_MOVE))return false;
          this.TIME_6             /*= FRAME.TIME        */    = time_6;
          this.PRICE_7            /* = FRAME.PRICE      */    = price_7;
          this.ANGLE_8            /*= FRAME.ANGLE      */     = angle_8;
          this.ANCHOR_POINT_9     /*= FRAME.ANCHOR_POINT*/    = anchor_point_9;
          //
          return true;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_TEXTDescription::Set_Common_6(bool back_31, long zorder_32, bool hidden_33, bool selected_34, bool selectable_35, string tooltip_36)
{         //---if(IsCreated)return false;
          if(MODE_I_00 == MODE_MOVE) return false;
          this.BACK_G_00                /* = FRAME.BACK      */      = back_31;
          this.ZORDER_G_00               /*= FRAME.ZORDER    */      = zorder_32;
          this.HIDDEN_G_00               /*= FRAME.HIDDEN    */      = hidden_33;
          this.SELECTED_G_00             /*= FRAME.SELECTED  */      = selected_34;
          this.SELECTABLE_G_00           /*= FRAME.SELECTABLE */     = selectable_35;
          this.TOOLTIP_G_00              /*= FRAME.TOOLTIP */        = tooltip_36;//
          //
          //ObjectSetInteger(ChartData_ChartInfo.ID, this.CName, OBJPROP_BACK,              this.BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, this.CName, OBJPROP_SELECTABLE,        this.SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, this.CName, OBJPROP_SELECTED,          this.SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, this.CName, OBJPROP_HIDDEN,            this.HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, this.CName, OBJPROP_ZORDER,            this.ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  this.CName, OBJPROP_TOOLTIP,           this.TOOLTIP);//
          //
          return true;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_TEXTDescription::Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
{         if(MODE_I_00 == MODE_MOVE) return false;
          TIMEFRAMES_O_00                /*= FRAME.TIMEFRAMES   /* */    = Period();
          SYMBOL_O_00                    /*= FRAME.SYMBOL       /* */    = Symbol();
          CREATETIME_O_00                /*= FRAME.CREATETIME   /* */    = TimeLocal();
          TYPE_O_00                      /*= FRAME.TYPE         /* */    = OBJ_TEXT;
          CHART_O_00                     /*= FRAME.CHART        /* */    = ChartData_ChartInfo.ID;
          SUBWINDOW_O_00                 /*= FRAME.SUBWINDOW    /* */    = ChartData_ChartInfo.SubWindow;
          //
          return true;//
};
//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_TEXTDescription.mqh            ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
