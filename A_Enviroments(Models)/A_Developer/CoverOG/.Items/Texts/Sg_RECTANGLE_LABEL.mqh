//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_RECTANGLE_LABEL.mqh            || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\Sg_LABEL.mqh>;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct S_RECTANGLE_LABEL: public Sg_LABEL //public STRUCT_OBJECT
{         //============================================================================================================19 attribe
          //string              NAME_A_01;
          //////----------------------------------
          //color               COLOR_C_00;                    //Color                           color
          //color               COLOR_BackGround_C_01;                  //The background color for  OBJ_EDIT, OBJ_BUTTON, OBJ_RECTANGLE_LABEL  color
          //color               COLOR_Border_C_02;  //---fake
          ////----------------------------------
          //int                 XDISTANCE_L_02;                //The distance in pixels along the X axis from the binding corner (see note)  int
          //int                 YDISTANCE_L_03;                //The distance in pixels along the Y axis from the binding corner (see note)  int
          //int                   XSIZE_L_04;                     //The object's width along the X axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.       int
          //int                   YSIZE_L_05;                     //The object's height along the Y axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.      int
          //ENUM_BASE_CORNER    CORNER_L_06;                   //The corner of the chart to link a graphical object   ENUM_BASE_CORNER
          //The OBJ_BUTTON, OBJ_RECTANGLE_LABEL and OBJ_EDIT objects have a fixed anchor point in the upper left corner (ANCHOR_LEFT_UPPER).
          //////----------------------------------
          //ENUM_LINE_STYLE       STYLE_9;                    //Style                           ENUM_LINE_STYLE
          //int                   WIDTH_10;                    //Line thickness                  int
          ENUM_BORDER_TYPE      BORDER_TYPE_11;          //Border type for the "Rectangle label" object  ENUM_BORDER_TYPE
          ////----------------------------------

          //============================================================================================================
          //============================================================================================================
          void  S_RECTANGLE_LABEL();
          void  ~S_RECTANGLE_LABEL();
          bool  Set_Common_6(bool back_31, long zorder_32, bool hidden_33, bool selected_34, bool selectable_35, string tooltip_36);
          bool  Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0);
          bool  Set_Color_2(color clr_2, color bgclr_3);
          bool  Set_Tip_3(ENUM_LINE_STYLE style_9, int width_10, ENUM_BORDER_TYPE border_type_11);
          bool  Set_Desc_1(string name_1);
          bool  Set_Location_5( int xdistance_4, int ydistance_5, int xsize_6, int ysize_7,  ENUM_BASE_CORNER corner_8 );
          bool  INIT(string Desc, int PointX, int PointY, int SizeX, int SizeY, color Color, color bgColor);
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
                    if(this.TYPE_O_00 == OBJ_RECTANGLE_LABEL)
                    {         //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_COLOR,         this.COLOR_C_00);//
                              //---ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_BGCOLOR,       this.COLOR_BackGround_C_01);
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_XDISTANCE,     this.XDISTANCE_L_02);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_YDISTANCE,     this.YDISTANCE_L_03);//
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_CORNER,        this.CORNER_L_06); //
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_XSIZE,         this.XSIZE_L_04);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_YSIZE,         this.YSIZE_L_05);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_BGCOLOR,       this.COLOR_BackGround_C_01);
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_STYLE,         this.STYLE_9);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_WIDTH,         this.WIDTH_10);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_BACK,          this.BACK_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_SELECTABLE,    this.SELECTABLE_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_SELECTED,      this.SELECTED_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_HIDDEN,        this.HIDDEN_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, this.NAME_A_01, OBJPROP_ZORDER,        this.ZORDER_G_00);
                              ObjectSetString(ChartData_ChartInfo.ID,  this.NAME_A_01, OBJPROP_TOOLTIP,       this.TOOLTIP_G_00);//
                              //
                    }//
                    return true;//
          }//
};

void S_RECTANGLE_LABEL::S_RECTANGLE_LABEL()

          :
          //=======================
          //NAME_A_01("Name"),
          //=======================
          //COLOR_C_00(clrNONE),
          //COLOR_BackGround_C_01(clrNONE),
          //=======================
          //XDISTANCE_L_02(0),
          //YDISTANCE_L_03(0),
          //XSIZE_L_04(0),
          //YSIZE_L_05(0),
          //CORNER_L_06(CORNER_LEFT_UPPER),
          //=======================
          //STYLE_9(STYLE_DASHDOT),
          //WIDTH_10(1),
          BORDER_TYPE_11(BORDER_FLAT)
          //=======================
          //MODE_I_00(MODE_CREATE),
          //IsKey_I_00(false),
          //IS_SET_I_00(false),
          ////=======================
          //IS_Set_Action_2_56(false),
          //IS_Set_Desc_4_51(false),
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
          //TYPE_O_00(OBJ_RECTANGLE_LABEL),
          //CHART_O_00(ChartData_ChartInfo.ID),
          //SUBWINDOW_O_00(ChartData_ChartInfo.SubWindow)
          //=======================

{
//===================================================================
          NAME_A_01                   /*  = FRAME.NAME    */ = "Name";
//===================================================================
          //COLOR_C_00                /*  = FRAME.COLOR    */= clrNONE;
          COLOR_BackGround_C_01       /*  = FRAME.BGCOLOR  */ = clrNONE;
//===================================================================
          XDISTANCE_L_02              /*  = FRAME.XDISTANCE      */  = 0;
          YDISTANCE_L_03              /*  = FRAME.YDISTANCE      */  = 0;
          XSIZE_L_04                  /*     = FRAME.YDISTANCE   */     = 0;
          YSIZE_L_05                  /*     = FRAME.YDISTANCE   */     = 0;
          CORNER_L_06                 /*  = FRAME.CORNER         */  = CORNER_LEFT_UPPER;
          //The OBJ_BUTTON, OBJ_RECTANGLE_LABEL and OBJ_EDIT objects have a fixed anchor point in the upper left corner (ANCHOR_LEFT_UPPER).
//===================================================================
          //STYLE_9                   /*  = FRAME.STYLE       */    = STYLE_DASHDOT;;
          //WIDTH_10                  /*  = FRAME.WIDTH       */    = 1;;
          //BORDER_TYPE_11            /*  = FRAME.BORDER_TYPE */    = BORDER_FLAT;
//===================================================================
          BACK_G_00                   /*  = FRAME.BACK          */   = false;
          ZORDER_G_00                 /*  = FRAME.ZORDER       */    = 10;
          HIDDEN_G_00                 /*  = FRAME.HIDDEN        */   = false;
          SELECTED_G_00                /* = FRAME.SELECTED     */    = false;
          SELECTABLE_G_00              /* = FRAME.SELECTABLE   */    = false;
          TOOLTIP_G_00                 /* = FRAME.TOOLTIP      */    = "tooltip";//
//===================================================================
          TIMEFRAMES_O_00              /* = FRAME.TIMEFRAMES    */   = Period();
          SYMBOL_O_00                  /* = FRAME.SYMBOL       */    = Symbol();
          CREATETIME_O_00              /* = FRAME.CREATETIME   */    = TimeLocal();
          TYPE_O_00                     /*= FRAME.TYPE         */    = OBJ_RECTANGLE_LABEL;
          CHART_O_00                   /* = FRAME.CHART        */    = ChartData_ChartInfo.ID;
          SUBWINDOW_O_00               /* = FRAME.SUBWINDOW   */     = ChartData_ChartInfo.SubWindow;
//===================================================================
};
void S_RECTANGLE_LABEL::~S_RECTANGLE_LABEL() {};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_RECTANGLE_LABEL::Set_Common_6(bool back_31, long zorder_32, bool hidden_33, bool selected_34, bool selectable_35, string tooltip_36)
{         BACK_G_00               /* = FRAME.BACK          */   = back_31;
          ZORDER_G_00             /* = FRAME.ZORDER        */   = zorder_32;
          HIDDEN_G_00            /*  = FRAME.HIDDEN       */    = hidden_33;
          SELECTED_G_00           /* = FRAME.SELECTED     */    = selected_34;
          SELECTABLE_G_00         /* = FRAME.SELECTABLE   */    = selectable_35;
          TOOLTIP_G_00            /* = FRAME.TOOLTIP      */    = tooltip_36;//
          //
          //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_BACK,              BACK);
          //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_SELECTABLE,        SELECTABLE);
          //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_SELECTED,          SELECTED);
          //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_HIDDEN,            HIDDEN);
          //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_ZORDER,            ZORDER);
          //ObjectSetString(ChartData_ChartInfo.ID,  CName, OBJPROP_TOOLTIP,           TOOLTIP);//
          //
          return true;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_RECTANGLE_LABEL::Set_Chart_6(long timeframe_41 = 0, string symbol_42 = "", datetime createtime_43 = 0, ENUM_OBJECT typr_44 = 0, long chart_45 = 0, int subwindow_46 = 0)
{         TIMEFRAMES_O_00            /*   = FRAME.TIMEFRAMES   */    = Period();
          SYMBOL_O_00                /*   = FRAME.SYMBOL       */    = Symbol();
          CREATETIME_O_00            /*   = FRAME.CREATETIME   */    = TimeLocal();
          TYPE_O_00                  /*   = FRAME.TYPE         */    = OBJ_RECTANGLE_LABEL;
          CHART_O_00                 /*   = FRAME.CHART        */    = ChartData_ChartInfo.ID;
          SUBWINDOW_O_00             /*   = FRAME.SUBWINDOW   */     = ChartData_ChartInfo.SubWindow;
          //
          return true;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_RECTANGLE_LABEL::Set_Color_2(color clr_2, color bgclr_3)
{         COLOR_C_00                  /*  = FRAME.COLOR       */     = bgclr_3;     //bgclr_3 //--desc color
          COLOR_BackGround_C_01       /*  = FRAME.BGCOLOR     */     = clr_2;   //clr_2   //--shape color
          //
          return true;//
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_RECTANGLE_LABEL::Set_Tip_3(ENUM_LINE_STYLE style_9, int width_10, ENUM_BORDER_TYPE border_type_11)
{         STYLE_9                      /* = FRAME.STYLE        */    = style_9;;
          WIDTH_10                     /* = FRAME.WIDTH        */    = width_10;
          BORDER_TYPE_11               /* = FRAME.BORDER_TYPE  */    = border_type_11;
          //
          return true;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_RECTANGLE_LABEL::Set_Desc_1(string name_1)
{         NAME_A_01                    /* = FRAME.NAME      */       = /*"S_RECTANGLE_LABEL__" +*/ name_1; //"Name";
          //
          return true;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool S_RECTANGLE_LABEL::Set_Location_5( int xdistance_4, int ydistance_5, int xsize_6, int ysize_7,  ENUM_BASE_CORNER corner_8 )
{         XDISTANCE_L_02                /*= FRAME.XDISTANCE    */    = xdistance_4;
          YDISTANCE_L_03               /* = FRAME.YDISTANCE    */    = ydistance_5;
          XSIZE_L_04                   /* = FRAME.XSIZE        */    = xsize_6;
          YSIZE_L_05                   /* = FRAME.YSIZE        */    = ysize_7;
          CORNER_L_06                  /* = FRAME.CORNER      */     = corner_8;
          //
          return true;//
};
//===================================================================
//OBJECT.Color(COLOR);                //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_COLOR, COLOR);//
////----------------------------------
//OBJECT.X_Distance(XDISTANCE);       //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_XDISTANCE, XDISTANCE);
//OBJECT.Y_Distance(YDISTANCE);       //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_YDISTANCE, YDISTANCE);//
//OBJECT.Corner(CORNER);              //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_CORNER, CORNER); //
////----------------------------------
//OBJECT.X_Size(XSize);               //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_XSIZE, XSIZE);
//OBJECT.Y_Size(YSize);               //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_YSIZE, YSIZE);
//OBJECT.BackColor(BGCOLOR);          //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_BGCOLOR, BGCOLOR);
//OBJECT.BorderColor(BORDER_COLOR);   //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_BORDER_COLOR, BORDER_COLOR);//
////----------------------------------
//OBJECT.Style(STYLE);                //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_STYLE, STYLE);
//OBJECT.Width(WIDTH);                //ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_WIDTH, WIDTH);//
//////----------------------------------
//OBJECT.BorderType(BORDER_TYPE);     //  ObjectSetInteger(ChartData_ChartInfo.ID,CName,OBJPROP_BORDER_TYPE,BORDER_TYPE));//
////----------------------------------
//ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_BACK, BACK);
//ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_SELECTABLE, SELECTABLE);
//ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_SELECTED, SELECTED);
//ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_HIDDEN, HIDDEN);
//ObjectSetInteger(ChartData_ChartInfo.ID, CName, OBJPROP_ZORDER, ZORDER);
//ObjectSetString(ChartData_ChartInfo.ID,  CName, OBJPROP_TOOLTIP, TOOLTIP);//
//============================================================================================================
bool S_RECTANGLE_LABEL::INIT(string Desc, int PointX, int PointY, int SizeX, int SizeY, color Color, color bgColor)
{         ////----------------------------------
          NAME_A_01                   = Desc;
          ////----------------------------------
          COLOR_C_00                  = Color;
          COLOR_BackGround_C_01       = bgColor;
          ////----------------------------------
          XDISTANCE_L_02              = PointX;
          YDISTANCE_L_03              = PointY;
          CORNER_L_06                 = CORNER_LEFT_UPPER;
          //////----------------------------------
          XSIZE_L_04                     = SizeX;
          YSIZE_L_05                     = SizeY;
          //////----------------------------------
          STYLE_9                     = STYLE_DASHDOT;
          WIDTH_10                    = 1;
          BORDER_TYPE_11              = BORDER_SUNKEN;
          ////----------------------------------
          BACK_G_00                   = true;
          ZORDER_G_00                 = 10;
          HIDDEN_G_00                 = false;
          SELECTED_G_00               = false;
          SELECTABLE_G_00             = false;
          TOOLTIP_G_00                = Desc;
          ////----------------------------------
          TIMEFRAMES_O_00             = Period();
          SYMBOL_O_00                 = Symbol();
          CREATETIME_O_00             = TimeLocal();
          TYPE_O_00                   = OBJ_RECTANGLE_LABEL;
          CHART_O_00                  = ChartData_ChartInfo.ID;
          SUBWINDOW_O_00              = 0;
          ////----------------------------------
          return true;//
};





//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_RECTANGLE_LABEL.mqh            || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
