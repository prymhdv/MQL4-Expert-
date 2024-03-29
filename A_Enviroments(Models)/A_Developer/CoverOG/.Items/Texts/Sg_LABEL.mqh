//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_LABEL.mqh                      || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set_ Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\_COBF_.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\Sg_TEXTDescription.mqh>;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sg_LABEL : public S_TEXTDescription
{         //============================================================================================================22
          //////----------------------------------
          // string               NAME_A_01;          //Object name  //--- Drived
          //string                TEXT_B_01;          //Description of the object (the text contained in the object)    string
          //string                FONT_B_02;          //Font     string
          //int                   FONTSIZE_B_03;                     //Font size       int
          ////----------------------------------
          //color                 COLOR_C_00;                        //Color                           color
          ////----------------------------------
          ///---//---- >>>  Proxy Handler STRUCT_OBJECT Line79
          ///---off proxy of parrent,,, ---On proxy child
          //int                   XDISTANCE_L_02;                //The distance in pixels along the X axis from the binding corner (see note)  int
          //int                   YDISTANCE_L_03;                //The distance in pixels along the Y axis from the binding corner (see note)  int
          ///---//---- >>>
          //double                  ANGLE_8;         //Angle.  For the objects with no angle specified, created from a program, the value is equal to EMPTY_VALUE      double
          //ENUM_BASE_CORNER        CORNER_L_06;                 //The corner of the chart to link a graphical object   ENUM_BASE_CORNER
          //ENUM_ANCHOR_POINT       ANCHOR_POINT_9;             //Location of the anchor point of a graphical object  ENUM_ARROW_ANCHOR (for OBJ_ARROW), ENUM_ANCHOR_POINT //(for OBJ_LABEL, OBJ_BITMAP_LABEL and OBJ_TEXT)
          //The OBJ_BUTTON, OBJ_RECTANGLE_LABEL and OBJ_EDIT objects have a fixed anchor point in the upper left corner (ANCHOR_LEFT_UPPER).
          ////----------------------------------
          //int                   MODE_I_00;          //= MODE_CREATE;= MODE_MOVE;= MODE_MODIFY;
          //bool                  IsKey_I_00;        //= false;
          //bool                  IS_SET_I_00;
          ////===================================
          //bool                  IS_Set_Action_2_56;
          bool                    IS_Set_Desc_4_51;
          //bool                  IS_Set_Location_5_52;
          //bool                  IS_Set_Color_1_53;
          //bool                  IS_Set_Common_6_54;
          //bool                  IS_Set_Chart_6_55;

          //////----------------------------------

          //============================================================================================================
          void       Sg_LABEL()

                    :
                    //=======================
                    //NAME_A_01("Name"),
                    //TEXT_B_01("Description"),
                    //FONT_B_02("Font"),
                    //FONTSIZE_B_03(7),
                    //=======================
                    //COLOR_C_00(clrNONE),
                    //=======================
                    //XDISTANCE_L_02(0),           ///----'XDISTANCE' - parent member initialization not allowed    oTextsdata.mqh     120       21  ///---'this' - struct member undefined
                    //YDISTANCE_L_03(0),
                    //ANGLE_8(0),
                    //CORNER_L_06(CORNER_LEFT_UPPER),
                    //ANCHOR_POINT_9(ANCHOR_LEFT_UPPER),//,
                    //=======================
                    //MODE_I_00(MODE_CREATE),
                    //IsKey_I_00(false),
                    //IS_SET_I_00(false),
                    ////=======================
                    //IS_Set_Action_2_56(false),
                    IS_Set_Desc_4_51(false)//,
                    //IS_Set_Location_5_52(false),
                    //IS_Set_Color_1_53(false),
                    //IS_Set_Common_6_54(false),
                    //IS_Set_Chart_6_55(false),
                    ////=======================
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
                    //TYPE_O_00(OBJ_LABEL),
                    //CHART_O_00(ChartData_ChartInfo.ID),
                    //SUBWINDOW_O_00(ChartData_ChartInfo.SubWindow)
                    //=======================

          {
//===================================================================
                    NAME_A_01                    /*= FRAME.NAME         */    = "Name";
                    TEXT_B_01                    /*= FRAME.TEXT         */    = "Description";
                    FONT_B_02                    /*= FRAME.FONT         */    = "Font";
                    FONTSIZE_B_03                /*= FRAME.FONTSIZE      */   = 7;
//===================================================================
                    COLOR_C_00                   /*= FRAME.COLOR         */   = clrNONE;
//===================================================================
                    XDISTANCE_L_02               /*= FRAME.XDISTANCE    */    = 0;
                    YDISTANCE_L_03               /*= FRAME.YDISTANCE    */    = 0;
                    ANGLE_8                      /*= FRAME.ANGLE        */    = 0;
                    CORNER_L_06                  /*= FRAME.CORNER       */    = CORNER_LEFT_UPPER;
                    ANCHOR_POINT_9               /*= FRAME.ANCHOR_POINT */    = ANCHOR_LEFT_UPPER;
//===================================================================
                    BACK_G_00                    /*= FRAME.BACK        */     = false;
                    ZORDER_G_00                  /*= FRAME.ZORDER      */     = 10;
                    HIDDEN_G_00                  /*= FRAME.HIDDEN       */    = false;
                    SELECTED_G_00                /*= FRAME.SELECTED     */    = false;
                    SELECTABLE_G_00              /*= FRAME.SELECTABLE   */    = false;
                    TOOLTIP_G_00                 /*= FRAME.TOOLTIP      */    = "tooltip";//
//===================================================================
                    TIMEFRAMES_O_00              /*= FRAME.TIMEFRAMES  */     = Period();
                    SYMBOL_O_00                  /*= FRAME.SYMBOL       */    = Symbol();
                    CREATETIME_O_00              /*= FRAME.CREATETIME  */     = TimeLocal();
                    TYPE_O_00                    /*= FRAME.TYPE        */     = OBJ_LABEL;
                    CHART_O_00                   /*= FRAME.CHART      */      = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00               /*= FRAME.SUBWINDOW  */      = ChartData_ChartInfo.SubWindow;
//===================================================================
          };
          void      ~Sg_LABEL() {};

          bool       Set_Action_2(int WhichMode = MODE_CREATE, bool IsKey = false)
          {         MODE_I_00                    /*= FRAME.MODE   */  = WhichMode;
                    IsKey_I_00                   /*= FRAME.IsKEY   */  = IsKey;
                    return IS_Set_Action_2_56 = true; //
          };
          //---
          //---
          //---
          bool       Set_Desc_4(string name_1, string text_2, string font_3, int fontsize_4)
          {         NAME_A_01                   /*= FRAME.NAME */           =  name_1; //"Name";/*"Sg_LABEL__"  +*/
                    if(MODE_I_00 == MODE_MOVE) return false;///---for  LabelX.GDS.Set_Desc_4(),,,,  LabelX is variable changing... need to update for every obj to act right...
                    TEXT_B_01                    /*= FRAME.TEXT       */      = text_2;
                    FONT_B_02                    /*= FRAME.FONT       */      = font_3;
                    FONTSIZE_B_03                /*= FRAME.FONTSIZE  */       = fontsize_4;
                    //
                    return IS_Set_Desc_4_51 = true; //
          };

          bool       Set_Common_6(bool back_31, long zorder_32, bool hidden_33, bool selected_34, bool selectable_35, string tooltip_36)
          {         if(MODE_I_00 == MODE_MOVE) return false;
                    BACK_G_00                 /*= FRAME.BACK        */     = back_31;
                    ZORDER_G_00               /*= FRAME.ZORDER     */      = zorder_32;
                    HIDDEN_G_00               /*= FRAME.HIDDEN     */      = hidden_33;
                    SELECTED_G_00             /*= FRAME.SELECTED   */      = selected_34;
                    SELECTABLE_G_00           /*= FRAME.SELECTABLE */      = selectable_35;
                    TOOLTIP_G_00              /*= FRAME.TOOLTIP */        = tooltip_36;//
                    //
                    //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_BACK,              BACK);
                    //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_SELECTABLE,        SELECTABLE);
                    //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_SELECTED,          SELECTED);
                    //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_HIDDEN,            HIDDEN);
                    //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_ZORDER,            ZORDER);
                    //ObjectSetString(ChartData_ChartInfo.ID,  CName, OBJPROP_TOOLTIP,           TOOLTIP);//
                    //
                    return IS_Set_Common_6_54 = true; //
          };
          //---
          //---
          //---
          bool       Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         if(MODE_I_00 == MODE_MOVE) return false;
                    TIMEFRAMES_O_00              /*= FRAME.TIMEFRAMES */     = Period();
                    SYMBOL_O_00                  /*= FRAME.SYMBOL     */     = Symbol();
                    CREATETIME_O_00              /*= FRAME.CREATETIME */     = TimeLocal();
                    TYPE_O_00                    /*= FRAME.TYPE       */     = OBJ_LABEL;
                    CHART_O_00                  /* = FRAME.CHART      */     = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00              /* = FRAME.SUBWINDOW  */     = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          };
          //---
          //---
          //---
          bool       Set_Color_1(color clr_5)
          {         if(MODE_I_00 == MODE_MOVE) return false;
                    COLOR_C_00                   /*= FRAME.COLOR      */     = clr_5;
                    //
                    return IS_Set_Color_1_53 = true; //
          };
          //---
          //---
          //---
          bool       Set_Location_5( int xdistance_6, int ydistance_7, double angle_8, ENUM_BASE_CORNER corner_9, ENUM_ANCHOR_POINT anchor_point_10)
          {         //
                    XDISTANCE_L_02               /*= FRAME.XDISTANCE  */     = xdistance_6;
                    YDISTANCE_L_03               /*= FRAME.YDISTANCE  */     = ydistance_7;
                    //Cat.s( "name:" + NAME_A_01  + "   X:" + (string)XDISTANCE_L_02 + "   Y:" + (string)YDISTANCE_L_03);
                    //if (ObjectFind(NAME_A_01) < 0) Alert("ObjectFind(NAME_A_01) >= 0: ", ObjectFind(NAME_A_01) >= 0);
                    //if(MODE_I_00 == MODE_MOVE)  IS_Set_Location_5_52 = true;
                    ANGLE_8                      /*= FRAME.ANGLE       */    = angle_8;
                    CORNER_L_06                  /*= FRAME.CORNER      */    = corner_9;
                    ANCHOR_POINT_9               /*= FRAME.ANCHOR_POINT */   = anchor_point_10;
                    //
                    return IS_Set_Location_5_52 = true; //
          };
          //
          bool       Set_Location_5_TimePrice( datetime xtime_6, double yprice_7, double angle_8, ENUM_BASE_CORNER corner_9, ENUM_ANCHOR_POINT anchor_point_10)
          {         //
                    TIME_6                       /*= FRAME.TIME        */    = xtime_6;
                    PRICE_7                      /*= FRAME.PRICE        */   = yprice_7;
                    //if (ObjectFind(NAME_A_01) < 0) Alert("ObjectFind(NAME_A_01) >= 0: ", ObjectFind(NAME_A_01) >= 0);
                    //if(MODE_I_00 == MODE_MOVE)  IS_Set_Location_5_52 = true;
                    ANGLE_8                      /*= FRAME.ANGLE        */   = angle_8;
                    CORNER_L_06                  /*= FRAME.CORNER        */  = corner_9;
                    ANCHOR_POINT_9               /*= FRAME.ANCHOR_POINT  */  = anchor_point_10;
                    //
                    return IS_Set_Location_5_52 = true; //
          };
          //---
          //---
          //---

          ///*--off---*/bool       Set_ed() { return IS_SET_I_00 = (IS_Set_Desc_4_51 && IS_Set_Location_5_52 && IS_Set_Color_1_53 && IS_Set_Common_6_54 && IS_Set_Chart_6_55 && IS_Set_Action_2_56) ? true : false;};
          //============================================================================================================
          //OBJECT.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);//
          ////----------------------------------
          //OBJECT.X_Distance(XDISTANCE);  //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_XDISTANCE, XDISTANCE);
          //OBJECT.Y_Distance(YDISTANCE);  //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_YDISTANCE, YDISTANCE);//
          //OBJECT.Corner(CORNER);         //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_CORNER, CORNER); //
          ////----------------------------------
          //OBJECT.Description(TEXT);       //ObjectSetString( ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_TEXT, TEXT);
          //OBJECT.Font(FONT);              //ObjectSetString( ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_FONT, FONT);
          //OBJECT.FontSize(FONTSIZE);      //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_FONTSIZE, FONTSIZE);//
          ////----------------------------------
          //OBJECT.Angle(ANGLE);            //ObjectSetDouble( ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ANGLE, ANGLE);
          //OBJECT.Anchor(ANCHOR_POINT);    //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ANCHOR, ANCHOR_POINT); //
          ////----------------------------------
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
          //============================================================================================================
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
                    if(this.TYPE_O_00 == OBJ_LABEL)
                    {         //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_COLOR,         this.COLOR_C_00);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_XDISTANCE,     this.XDISTANCE_L_02);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_YDISTANCE,     this.YDISTANCE_L_03);//
                              //
                              if(true)
                              {         ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TIME,          this.TIME_6);//
                                        ObjectSetDouble( ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_PRICE,         this.PRICE_7);//
                              }
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_CORNER,        this.CORNER_L_06); //
                              //
                              ObjectSetString( ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TEXT,          this.TEXT_B_01);
                              ObjectSetString( ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_FONT,          this.FONT_B_02);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_FONTSIZE,      this.FONTSIZE_B_03);//
                              //
                              ObjectSetDouble( ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_ANGLE,         this.ANGLE_8);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_ANCHOR,        this.ANCHOR_POINT_9); //
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_BACK,          this.BACK_G_00);      //--this.BACK_G_00 //--if true then candel cover on label
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_SELECTABLE,    this.SELECTABLE_G_00);//--this.SELECTABLE_G_00
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_SELECTED,      this.SELECTED_G_00);  //--this.SELECTED_G_00
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_HIDDEN,        this.HIDDEN_G_00);    //--this.HIDDEN_G_00
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_ZORDER,        this.ZORDER_G_00);
                              ObjectSetString(ChartData_ChartInfo.ID,  this.NAME_A_01, OBJPROP_TOOLTIP,       this.TOOLTIP_G_00);//
                              //
                    }//
                    return true;//
          }//
};



//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_LABEL.mqh                      || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set_ Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
