//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_BUTTON.mqh                     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\Sg_LABEL.mqh>;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sg_BUTTON: public Sg_LABEL//STRUCT_OBJECT
{         //============================================================================================================
          //string                NAME_A_01;          //Object name
          //string                TEXT_B_01;          //Description of the object (the text contained in the object)    string
          //string                FONT_B_02;          //Font     string
          //int                   FONTSIZE_B_03;                     //Font size       int
          ////----------------------------------
          //color                 COLOR_C_00;                         //Color                           color
          //color                 COLOR_BackGround_C_01;              //The background color for  OBJ_EDIT, OBJ_BUTTON, OBJ_RECTANGLE_LABEL  color
          //color                 COLOR_Border_C_02;                  //Border color for the OBJ_EDIT and OBJ_BUTTON objects  color
          ////----------------------------------
          //int                   XDISTANCE_L_02;//_8;                //The distance in pixels along the X axis from the binding corner (see note)  int
          //int                   YDISTANCE_L_03;//_9;                //The distance in pixels along the Y axis from the binding corner (see note)  int
          //int                   XSIZE_L_04;                    //The object's width along the X axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.       int
          //int                   YSIZE_L_05;                    //The object's height along the Y axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.      int
          //ENUM_BASE_CORNER      CORNER_L_06;                   //The corner of the chart to link a graphical object   ENUM_BASE_CORNER
          //The OBJ_BUTTON, OBJ_RECTANGLE_LABEL and OBJ_EDIT objects have a fixed anchor point in the upper left corner (ANCHOR_LEFT_UPPER).
          //////----------------------------------
          //bool                  STATE_13;                    //Button state (pressed / depressed)      bool
          //////----------------------------------
          bool                  IS_Set_Self_1_57;
          //////----------------------------------
          //int                   MODE_I_00;          //= MODE_CREATE;= MODE_MOVE;= MODE_MODIFY;
          //bool                  IsKey_I_00;        //= false;
          //bool                  IS_SET_I_00;
          ////===================================
          //bool                  IS_Set_Action_2_56;
          //bool                  IS_Set_Desc_4_51;
          //bool                  IS_Set_Location_5_52;
          //bool                  IS_Set_Color_3_53;
          //bool                  IS_Set_Common_6_54;
          //bool                  IS_Set_Chart_6_55;

          //bool                  IS_Set_Self_1_57;
          //////----------------------------------
          //////----------------------------------

          //============================================================================================================
          //============================================================================================================
          void Sg_BUTTON()

                    :
                    //=======================
                    // NAME_A_01("Name"),
                    //TEXT_B_01("Description"),//'TEXT_B_01' - parent member initialization not allowed   oTextsButton.mqh    71        21
                    //FONT_B_02("Font"),
                    //FONTSIZE_B_03(7),
                    //=======================
                    //COLOR_C_00(clrNONE),
                    //COLOR_BackGround_C_01(clrNONE),
                    //COLOR_Border_C_02(clrNONE),
                    //=======================
                    //XDISTANCE_L_02(0),//_8
                    //YDISTANCE_L_03(0),//_9
                    //XSIZE_L_04(0),
                    //YSIZE_L_05(0),
                    //CORNER(CORNER_LEFT_UPPER),
                    //=======================
                    //STATE_13(false),
                    //=======================
                    IS_Set_Self_1_57(false)//,
                    //=======================
                    //MODE_I_00(MODE_CREATE),               //= MODE_CREATE;= MODE_MOVE;= MODE_MODIFY;
                    //IsKey_I_00(false),                   //= false;
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
                    //TYPE_O_00(OBJ_BUTTON),
                    //CHART_O_00(ChartData_ChartInfo.ID),
                    //SUBWINDOW_O_00(ChartData_ChartInfo.SubWindow)
                    //=======================

          {
//===================================================================
                    NAME_A_01               /*    = FRAME.NAME  */          = "Name";
                    TEXT_B_01                /*   = FRAME.TEXT   */         = "Description";
                    FONT_B_02                /*   = FRAME.FONT    */        = "Font";
                    FONTSIZE_B_03            /*   = FRAME.FONTSIZE */       = 7;
//===================================================================
                    COLOR_C_00                /*  = FRAME.COLOR    */       = clrNONE;
                    COLOR_BackGround_C_01    /*   = FRAME.BGCOLOR   */      = clrNONE;
                    COLOR_Border_C_02        /*   = FRAME.BORDER_COLOR*/    = clrNONE;
//===================================================================
                    XDISTANCE_L_02            /*  = FRAME.XDISTANCE */      = 0;
                    YDISTANCE_L_03            /*  = FRAME.YDISTANCE */      = 0;
                    XSIZE_L_04                /*     = FRAME.YDISTANCE */      = 0;
                    YSIZE_L_05               /*      = FRAME.YDISTANCE */      = 0;
                    CORNER_L_06              /*   = FRAME.CORNER      */    = CORNER_LEFT_UPPER;
                    //The OBJ_BUTTON, OBJ_RECTANGLE_LABEL and OBJ_EDIT objects have a fixed anchor point in the upper left corner (ANCHOR_LEFT_UPPER).
//===================================================================
                    STATE_13                 /*   = FRAME.STATE      */     = false;
//===================================================================
                    MODE_I_00                /*   = FRAME.MODE      */      = MODE_CREATE;
                    IsKey_I_00               /*   = FRAME.IsKEY     */     = false;
//===================================================================
                    IS_Set_Self_1_57              = false;
//===================================================================
//                    BACK_G_00              /*  = FRAME.BACK        */    = false;
//                    ZORDER_G_00            /*  = FRAME.ZORDER      */    = 10;
//                    HIDDEN_G_00            /*  = FRAME.HIDDEN      */    = false;
//                    SELECTED_G_00          /* = FRAME.SELECTED    */    = false;
//                    SELECTABLE_G_00        /*  = FRAME.SELECTABLE  */    = false;
//                    TOOLTIP_G_00           /*  = FRAME.TOOLTIP      */   = "tooltip";//
////===================================================================
//                    TIMEFRAMES_O_00        /*  = FRAME.TIMEFRAMES  */    = Period();
//                    SYMBOL_O_00            /*  = FRAME.SYMBOL      */    = Symbol();
//                    CREATETIME_O_00        /*  = FRAME.CREATETIME  */    = TimeLocal();
                    TYPE_O_00               /* = FRAME.TYPE          */  = OBJ_BUTTON;
//                    CHART_O_00            /*   = FRAME.CHART        */   = ChartData_ChartInfo.ID;
//                    SUBWINDOW_O_00         /*  = FRAME.SUBWINDOW   */    = ChartData_ChartInfo.SubWindow;
//===================================================================
          };
          void ~Sg_BUTTON() {};

          bool Set_Action_2(int WhichMode = MODE_CREATE, bool IsKey = false)
          {         MODE_I_00                  /* = FRAME.MODE  */  = WhichMode;
                    IsKey_I_00                 /* = FRAME.IsKEY */   = IsKey;
                    return IS_Set_Action_2_56     = true; //
          };

          bool Set_Desc_4(string name_1, string text_2, string font_3, int fontsize_4)
          {         NAME_A_01                /* = FRAME.NAME     */       = /*"Sg_BUTTON__" +*/ name_1; //"Name";
                    TEXT_B_01                /* = FRAME.TEXT     */       = text_2;
                    FONT_B_02                /* = FRAME.FONT     */       = font_3;
                    FONTSIZE_B_03            /* = FRAME.FONTSIZE */       = fontsize_4;
                    //
                    return IS_Set_Desc_4_51 = true; //
          };

          bool Set_Common_6(bool back_31, long zorder_32, bool hidden_33, bool selected_34, bool selectable_35, string tooltip_36)
          {         BACK_G_00               /* = FRAME.BACK       */     = back_31;
                    ZORDER_G_00             /* = FRAME.ZORDER     */     = zorder_32;
                    HIDDEN_G_00             /* = FRAME.HIDDEN     */     = hidden_33;
                    SELECTED_G_00           /* = FRAME.SELECTED   */     = selected_34;
                    SELECTABLE_G_00         /* = FRAME.SELECTABLE */    = selectable_35;
                    TOOLTIP_G_00            /* = FRAME.TOOLTIP     */    = tooltip_36;//
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
          bool Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
          {         TIMEFRAMES_O_00             /*  = FRAME.TIMEFRAMES   */   = Period();
                    SYMBOL_O_00                 /*  = FRAME.SYMBOL       */   = Symbol();
                    CREATETIME_O_00             /*  = FRAME.CREATETIME   */   = TimeLocal();
                    TYPE_O_00                   /*  = FRAME.TYPE         */   = OBJ_BUTTON;
                    CHART_O_00                  /*  = FRAME.CHART         */  = ChartData_ChartInfo.ID;
                    SUBWINDOW_O_00              /*  = FRAME.SUBWINDOW     */  = ChartData_ChartInfo.SubWindow;
                    //
                    return IS_Set_Chart_6_55 = true; //
          };
          bool Set_Color_3(color clr_5, color bgclr_6, color border_color_7)
          {         COLOR_C_00                /*  = FRAME.COLOR          */ = border_color_7;
                    COLOR_BackGround_C_01     /*  = FRAME.BGCOLOR        */ = clr_5;
                    COLOR_Border_C_02         /*  = FRAME.BORDER_COLOR   */ = bgclr_6;
                    //color                  BackColor       = C'36, 52, 69',
                    // color                 BorderColor     = clrGray,
                    // color                 DescColor     = clrYellow,
                    //
                    return IS_Set_Color_3_53 = true; //
          };


          bool Set_Location_5( int xdistance_8, int ydistance_9, int xsize_10, int ysize_11,  ENUM_BASE_CORNER corner_12 )
          {         XDISTANCE_L_02            /*  = FRAME.XDISTANCE    */   = xdistance_8;
                    YDISTANCE_L_03            /*  = FRAME.YDISTANCE    */   = ydistance_9;
                    XSIZE_L_04                /*     = FRAME.XSIZE     */      = xsize_10;
                    YSIZE_L_05                /*     = FRAME.YSIZE      */     = ysize_11;
                    CORNER_L_06               /*  = FRAME.CORNER        */  = corner_12;
                    //
                    return IS_Set_Location_5_52 = true; //
          };
          bool Set_Self_1( bool state_13 = false )
          {         STATE_13                  /*  = FRAME.STATE        */   = state_13;
                    //
                    return IS_Set_Self_1_57 = true; //
          };


          bool Seted() { return IS_SET_I_00 = (IS_Set_Desc_4_51 && IS_Set_Location_5_52 && IS_Set_Color_3_53 && IS_Set_Common_6_54 && IS_Set_Chart_6_55 && IS_Set_Self_1_57 && IS_Set_Action_2_56) ? true : false;};

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
          //OBJECT.X_Size(XSize);               //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_XSIZE, XSIZE);
          //OBJECT.Y_Size(YSize);               //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_YSIZE, YSIZE);
          //OBJECT.BackColor(BGCOLOR);          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BGCOLOR, BGCOLOR);
          //OBJECT.BorderColor(BORDER_COLOR);   //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BORDER_COLOR, BORDER_COLOR);//
          ////----------------------------------
          //OBJECT.State(STATE);/*ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_STATE, STATE);*/
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
                    if(this.TYPE_O_00 == OBJ_BUTTON)
                    {         //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_COLOR,         this.COLOR_C_00);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_XDISTANCE,     this.XDISTANCE_L_02);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_YDISTANCE,     this.YDISTANCE_L_03);//
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_CORNER,        this.CORNER_L_06); //
                              //
                              ObjectSetString( ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TEXT,          this.TEXT_B_01);
                              ObjectSetString( ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_FONT,          this.FONT_B_02);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_FONTSIZE,      this.FONTSIZE_B_03);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_XSIZE,         this.XSIZE_L_04);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_YSIZE,         this.YSIZE_L_05);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_BGCOLOR,       this.COLOR_BackGround_C_01);
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_BORDER_COLOR,  this.COLOR_Border_C_02);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_STATE,         this.STATE_13);
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_BACK,          this.BACK_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_SELECTABLE,    this.SELECTABLE_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_SELECTED,      this.SELECTED_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_HIDDEN,        this.HIDDEN_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_ZORDER,        this.ZORDER_G_00);
                              ObjectSetString( ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_TOOLTIP,       this.TOOLTIP_G_00);//
                              //
                    }//
                    return true;//
          }//
};




//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_BUTTON.mqh                     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
