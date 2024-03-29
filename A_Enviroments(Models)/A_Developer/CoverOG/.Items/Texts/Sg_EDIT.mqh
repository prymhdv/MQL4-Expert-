//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_EDIT.mqh                       ||
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
struct S_EDIT: public _COBF_
{         //============================================================================================================
          //////----------------------------------
          //string                NAME_A_01;                 //Object name
          //string                TEXT_B_01;                     //Description of the object (the text contained in the object)    string
          //string                FONT_B_02;                     //Font     string
          //int                   FONTSIZE_B_03;                 //Font size       int
          //////----------------------------------
          //color                 COLOR_C_00;                        //Color                           color
          //color                 COLOR_BackGround_C_01;              //The background color for  OBJ_EDIT, OBJ_BUTTON, OBJ_RECTANGLE_LABEL  color
          //color                 COLOR_Border_C_02;         //Border color for the OBJ_EDIT and OBJ_BUTTON objects  color
          ////----------------------------------
          //int                   XDISTANCE_L_02;                //The distance in pixels along the X axis from the binding corner (see note)  int
          //int                   YDISTANCE_L_03;                //The distance in pixels along the Y axis from the binding corner (see note)  int
          //int                   XSIZE_L_04;                    //The object's width along the X axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.       int
          //int                   YSIZE_L_05;                    //The object's height along the Y axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.      int
          //ENUM_BASE_CORNER      CORNER_L_06;                   //The corner of the chart to link a graphical object   ENUM_BASE_CORNER
          //////----------------------------------
          //ENUM_ALIGN_MODE       ALIGN_13;                        //Horizontal text alignment in the "Edit" object (OBJ_EDIT)    ENUM_ALIGN_MODE
          //bool                  READONLY_14;                     //Ability to edit text in the Edit object   bool
          //////----------------------------------
          string TEXT_B_01_inp;
          //============================================================================================================
          void  S_EDIT();
          void  ~S_EDIT();
          bool  Set_Common_6(bool back_31, long zorder_32, bool hidden_33, bool selected_34, bool selectable_35, string tooltip_36);
          bool  Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0);
          bool  Set_Color_3(color clr_5, color bgclr_6, color border_color_7);
          bool  Set_Desc_4(string name_1, string text_2, string font_3, int fontsize_4);
          bool  Set_Location_5( int xdistance_8, int ydistance_9, int xsize_10, int ysize_11,  ENUM_BASE_CORNER corner_12 );
          bool  Set_Self_2(ENUM_ALIGN_MODE align_13 = ALIGN_CENTER, bool readonly_14 = false );
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
                    if(this.TYPE_O_00 == OBJ_EDIT)
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
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_ALIGN,         this.ALIGN_13);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_READONLY,      this.READONLY_14);//
                              //
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
//|                                                                  |
//+------------------------------------------------------------------+
void S_EDIT::S_EDIT()
//:
//=======================
// NAME_A_01("Name"),
//TEXT_B_01("Description"),
//FONT_B_02("Font"),
//FONTSIZE_B_03(7),
//=======================
// COLOR_C_00(clrNONE),
//COLOR_BackGround_C_01(clrNONE),
//COLOR_Border_C_02(clrNONE),
//=======================
//XDISTANCE_L_02(0),
//YDISTANCE_L_03(0),
//XSIZE_L_04(0),
//YSIZE_L_05(0),
//CORNER_L_06(CORNER_LEFT_UPPER)
//=======================
//ALIGN_13(ALIGN_CENTER),
//READONLY_14(false)//,
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
//TYPE_O_00(OBJ_EDIT),
//CHART_O_00(ChartData_ChartInfo.ID),
//SUBWINDOW_O_00(ChartData_ChartInfo.SubWindow)
//=======================

{
//===================================================================
          this.NAME_A_01               /*  = FRAME.NAME    */        = "Name";
          this.TEXT_B_01              /*   = FRAME.TEXT    */        = "Description";
          this.FONT_B_02               /*  = FRAME.FONT    */        = "Font";
          this.FONTSIZE_B_03           /*  = FRAME.FONTSIZE*/        = 7;
//===================================================================
          this.COLOR_C_00              /*  = FRAME.COLOR    */       = clrNONE;
          this.COLOR_BackGround_C_01   /*  = FRAME.BGCOLOR  */       = clrNONE;
          this.COLOR_Border_C_02       /*  = FRAME.BORDER_COLOR*/    = clrNONE;
//===================================================================
          this.XDISTANCE_L_02           /* = FRAME.XDISTANCE   */  = 0;
          this.YDISTANCE_L_03           /* = FRAME.YDISTANCE   */   = 0;
          this.XSIZE_L_04               /*    = FRAME.YDISTANCE */     = 0;
          this.YSIZE_L_05               /*    = FRAME.YDISTANCE */      = 0;
          this.CORNER_L_06              /* = FRAME.CORNER       */   = CORNER_LEFT_UPPER;
          //The OBJ_BUTTON, OBJ_RECTANGLE_LABEL and OBJ_EDIT objects have a fixed anchor point in the upper left corner (ANCHOR_LEFT_UPPER).
//===================================================================
          this.ALIGN_13                 /* = FRAME.ALIGN        */   = ALIGN_CENTER;
          this.READONLY_14             /*  = FRAME.READONLY     */   = false;
//===================================================================
          //int                   Sg_LABEL::MODE_I_00;          //= MODE_CREATE;= MODE_MOVE;= MODE_MODIFY;
          //bool                  Sg_LABEL::IsKey_I_00;        //= false;
          //bool                  Sg_LABEL::IS_SET_I_00;
//===================================================================derived from FATHER
//                    this.BACK_G_00             /*   = FRAME.BACK      */      = false;
//                    this.ZORDER_G_00            /*  = FRAME.ZORDER    */      = 10;
//                    this.HIDDEN_G_00            /*  = FRAME.HIDDEN    */      = false;
//                    this.SELECTED_G_00          /*  = FRAME.SELECTED  */      = false;
//                    this.SELECTABLE_G_00        /*  = FRAME.SELECTABLE*/      = false;
//                    this.TOOLTIP_G_00           /*  = FRAME.TOOLTIP   */      = "tooltip";//
////===================================================================
//                    this.TIMEFRAMES_O_00       /*   = FRAME.TIMEFRAMES */     = Period();
//                    this.SYMBOL_O_00            /*  = FRAME.SYMBOL     */     = Symbol();
//                    this.CREATETIME_O_00       /*   = FRAME.CREATETIME */     = TimeLocal();
          this.TYPE_O_00             /* = FRAME.TYPE       */     = OBJ_EDIT;
//                    this.CHART_O_00            /*   = FRAME.CHART      */     = ChartData_ChartInfo.ID;
//                    this.SUBWINDOW_O_00        /*   = FRAME.SUBWINDOW  */     = ChartData_ChartInfo.SubWindow;
//===================================================================
};
void S_EDIT::~S_EDIT() {};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_EDIT::Set_Common_6(bool back_31, long zorder_32, bool hidden_33, bool selected_34, bool selectable_35, string tooltip_36)
{         this.BACK_G_00               /* = FRAME.BACK     */       = back_31;
          this.ZORDER_G_00             /* = FRAME.ZORDER   */       = zorder_32;
          this.HIDDEN_G_00             /* = FRAME.HIDDEN    */      = hidden_33;
          this.SELECTED_G_00           /* = FRAME.SELECTED   */     = selected_34;
          this.SELECTABLE_G_00         /* = FRAME.SELECTABLE */     = selectable_35;
          this.TOOLTIP_G_00             /*= FRAME.TOOLTIP     */    = tooltip_36;//
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
bool S_EDIT::Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
{         this.TIMEFRAMES_O_00            /*   = FRAME.TIMEFRAMES  */    = Period();
          this.SYMBOL_O_00                /*   = FRAME.SYMBOL      */    = Symbol();
          this.CREATETIME_O_00            /*   = FRAME.CREATETIME  */    = TimeLocal();
          this.TYPE_O_00                  /*   = FRAME.TYPE        */    = OBJ_EDIT;
          this.CHART_O_00                 /*   = FRAME.CHART       */    = ChartData_ChartInfo.ID;
          this.SUBWINDOW_O_00             /*   = FRAME.SUBWINDOW   */    = ChartData_ChartInfo.SubWindow;
          //
          return true;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_EDIT::Set_Color_3(color clr_5, color bgclr_6, color border_color_7)
{         this.COLOR_C_00              /* = FRAME.COLOR        */   = border_color_7;
          this.COLOR_BackGround_C_01   /* = FRAME.BGCOLOR      */   = bgclr_6;
          this.COLOR_Border_C_02       /* = FRAME.BORDER_COLOR */   = clr_5;
          //
          // color BackColor   = C'36, 52, 69',
          // color BorderColor = clrGray,
          // color DescColorIN = clrYellow,
          return true;//
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_EDIT::Set_Desc_4(string name_1, string text_2, string font_3, int fontsize_4)
{         this.NAME_A_01              /*   = FRAME.NAME      */      = "S_EDIT " +name_1; //"Name"; //--may later change this option name adding to solid name enterd 
          this.TEXT_B_01              /*   = FRAME.TEXT      */      = text_2;
          this.FONT_B_02             /*    = FRAME.FONT      */      = font_3;
          this.FONTSIZE_B_03          /*   = FRAME.FONTSIZE  */      = fontsize_4;
          //
          return true;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_EDIT::Set_Location_5( int xdistance_8, int ydistance_9, int xsize_10, int ysize_11,  ENUM_BASE_CORNER corner_12 )
{         this.XDISTANCE_L_02         /*   = FRAME.XDISTANCE  */     = xdistance_8;
          this.YDISTANCE_L_03         /*   = FRAME.YDISTANCE  */     = ydistance_9;
          this.XSIZE_L_04             /*      = FRAME.XSIZE   */        = xsize_10;
          this.YSIZE_L_05             /*      = FRAME.YSIZE   */        = ysize_11;
          this.CORNER_L_06             /*  = FRAME.CORNER     */     = corner_12;
          //
          return true;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_EDIT::Set_Self_2(ENUM_ALIGN_MODE align_13 = ALIGN_CENTER, bool readonly_14 = false )
{         this.ALIGN_13             /*  = FRAME.ALIGN        */   = align_13;
          this.READONLY_14          /*  = FRAME.READONLY     */   = readonly_14;
          //
          return true;//
};
//============================================================================================================
//OBJECT.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);//
////----------------------------------
//OBJECT.X_Distance(XDISTANCE_L_02);  //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_XDISTANCE, XDISTANCE_L_02);
//OBJECT.Y_Distance(YDISTANCE_L_03);  //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_YDISTANCE, YDISTANCE_L_03);//
//OBJECT.Corner(CORNER_L_06);         //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_CORNER, CORNER_L_06); //
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
//OBJECT.TextAlign(ALIGN);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ALIGN, ALIGN);
//OBJECT.ReadOnly(READONLY);          //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_READONLY, READONLY);//
////----------------------------------
//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
//ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
//ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
//============================================================================================================
//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_EDIT.mqh                       ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
