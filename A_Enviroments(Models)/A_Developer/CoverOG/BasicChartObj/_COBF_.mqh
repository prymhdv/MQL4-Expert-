//+------------------------------------------------------------------+
//||   ||||||||||                 C_ObjectFrame.mqh                 ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\gDefinesEnumsStracts.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\Graphical_Object_Base.mqh>
//+------------------------------------------------------------------+
//|             Class GraphicalChartObj(DataAction)      BEGIN       |
//+------------------------------------------------------------------+
//+-------------------------------------------------------------------------------------+copy of inner decs
//|     STRUCT_OBJECT Base Struct Of GraphicalChartObj(DataForm)                       ||
//|     STRUCT_OBJECT Handel DataForm GraphicalChartObj (set,get,save,load)            ||
//|                                                                                    ||
//|     Relation:                                                                      ||
//|        ChartObj Handel DataAction Of GraphicalChartObj (Create,Move,Delete,Modify) ||
//|                                                                                    ||
//|     Connection:                                                                    ||
//|         GraphicalActionClass DataBase (set,get,Change)                             ||
//|                                                                                    ||
//|     Diffrents:                                                                     ||
//|            "class CChartObject : public CObject"                                   ||
//|            "class CChart : public CObject"                                         ||
//|                                                                                    ||
//|                                                                                    ||
//+-------------------------------------------------------------------------------------+
struct Graphical_Object_Texts : public Graphical_Object_Base
{
public:
          ////---------------------------------- ref to class this file to line >>>> template<typename GraphicalDataStruct, typename GraphicalActionClass, typename GraphicalDevClass>class ChartObj: public __COBFA__   //--- Factory
          ///---off proxy of parrent,,, ---On proxy child
          int                   XDISTANCE_L_02;  //---- >>>  Proxy Handler of Shape not has this field that is ther just handle error   'XDISTANCE_L_02' - struct member undefine
          int                   YDISTANCE_L_03;  //---- >>>  Proxy Handler  ///---'virtual' not permitted in data declaration


};
//+------------------------------------------------------------------+Object_Graphical_Protertise  ||Attribe  SOGC sogc          --- Struct--Object-Grapgical-Control---
//|                                                                  |GraphicalObjectProtertise    ||  _COBF_                    --- ChartObjectBaseFormation  ---
//+------------------------------------------------------------------+WindowsChartGraphicalObjectFormation(SWCGOF)  swcgof       --- ChartObjectBaseFormation  ---
struct _COBF_ : public Graphical_Object_Base //S_GraphicsObj  GraphicalChartObj(DataForm) STRUCT_OBJECT  On_COBF_ //--s_Win_Chart_Data_Form  sWinChart_DataForm
{         ///---class CWnd        : public CObject        As Road
          ///---class CWndObj     : public CWnd           Actioner

public://---fake attribes.
          string                TEXT_B_01;          //Description of the object (the text contained in the object)    string
          string                FONT_B_02;          //Font     string
          int                   FONTSIZE_B_03;                     //Font size       int
          //============================================================================================================
          int                   XDISTANCE_L_02;
          int                   YDISTANCE_L_03;
          ENUM_BASE_CORNER      CORNER_L_06;
          int                   XSIZE_L_04;                    //  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.       int
          int                   YSIZE_L_05;                    //  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.      int
          int                   XOFFSET_L_07;;                  //The X coordinate of the upper left corner of the rectangular visible area in the graphical objects"Bitmap Label" and "Bitmap" (OBJ_BITMAP_LABEL and OBJ_BITMAP).The value is set in pixels relative to the upper left corner of the original image.  int
          int                   YOFFSET_L_08;;
          //============================================================================================================
          //color               COLOR_C_00;             //Color                           color
          color                 COLOR_BackGround_C_01;  //The background color for  OBJ_EDIT, OBJ_BUTTON, OBJ_RECTANGLE_LABEL  color
          color                 COLOR_Border_C_02;      //---fake
          //============================================================================================================
          ENUM_LINE_STYLE       STYLE_9;                      //Style                           ENUM_LINE_STYLE
          int                   WIDTH_10;                     //Line thickness                  int
          int                   HEIGHT_12;
          bool                  RAY_RIGHT_11;                 //Ray goes to the right           bool   just for channels
          int                   POINT_WIDTH;
          //============================================================================================================
          ENUM_ALIGN_MODE       ALIGN_13;                        //Horizontal text alignment in the "Edit" object (OBJ_EDIT)    ENUM_ALIGN_MODE
          bool                  READONLY_14;                     //Ability to edit text in the Edit object   bool.
          //============================================================================================================
          bool                  STATE_13;     //---fake
          ENUM_ANCHOR_POINT     ANCHOR_POINT_9;
          double                ANGLE_8;
          string                File_F_01;
          string                File_ON_F_02;
          string                File_OFF_F_03;
          //============================================================================================================
          //---OBJ_TEXT && OBJ_BITMAP
          datetime              TIME_6;                 //---fake
          double                PRICE_7;                //---fake

          //============================================================================================================
          //---shape OBJ_RECTANGLE
          datetime              TIME1;                 //0       datetime        Datetime value to set/get first coordinate time part
          double                PRICE1;                //1       double          Double value to set/get first coordinate price part
          datetime              TIME2;                 //2       datetime        Datetime value to set/get second coordinate time part
          double                PRICE2;                //3       double          Double value to set/get second coordinate price part
          //--- OBJ_TRIANGLE && OBJ_TRIANGLE && OBJ_ELLIPSE
          datetime              TIME3;
          double                PRICE3;
          ////----------------------------------

          ////----------------------------------
          bool                  FILL;           //--Trend Channels & Shapes
          double                DEVIATION;
          ////----------------------------------
          double                SCALE;         //Scale (properties of Gann objects, Fibonacci Arcs and Ellipse)  double
          bool                  ELLIPSE;       //Showing the full ellipse of the Fibonacci Arc object (OBJ_FIBOARC)    bool
          bool                  RAY;
          //============================================================================================================
          void _COBF_()  {}
          void ~_COBF_() {};
          bool                  Set_Style_Width_Fill_Color(ENUM_LINE_STYLE s, int w, bool f, color c)    { /*if(IsCreated)return false; */ STYLE_9 = s;  WIDTH_10 = w; FILL = f; COLOR_C_00 = c;   return true;}
          bool                  Set_Colors_2(color cbg, color cbo)                                        { /*if(IsCreated)return false; */ COLOR_BackGround_C_01 = cbg;  COLOR_Border_C_02 = cbo;  return true;}
          bool                  Set_Model_3(ENUM_LINE_STYLE style, int width, bool fill = false)           { /*if(IsCreated)return false; */ STYLE_9 = style;  WIDTH_10 = width;  FILL = fill; return true;}
          //============================================================================================================
          void                  Set_ToDelete_1(bool Is_delete)          { Is_Delete        = Is_delete;             return  ;}
          void                  Set_Signal_1(bool Is_setSignal)         { Is_Set_Signal   = Is_setSignal;        return  ;}
          bool                  Setup()
          {         return true;//
          }; //
          //
};
//+------------------------------------------------------------------+
//|             Class GraphicalChartObj(DataAction)      BEGIN       |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
