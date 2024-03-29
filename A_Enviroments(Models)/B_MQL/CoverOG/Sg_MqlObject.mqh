//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_MqlObject.mqh                  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct Sg_ObjectCreate
{         long          chart_id;      // chart ID
          string        object_name;   // object name
          ENUM_OBJECT   object_type;   // object type
          int           sub_window;    // window index
          datetime      time1;         // time of the first anchor point
          double        price1;        // price of the first anchor point
          //...
          datetime      timeN;         //= 0;     // time of the N-th anchor point
          double        priceN;        //= 0;     // price of the N-th anchor point
};
struct Sg_ObjectCreateB
{         string        object_name;   // object name
          ENUM_OBJECT   object_type;   // object type
          int           sub_window;    // window index
          datetime      time1;         // time of the first anchor point
          double        price1;        // price of the first anchor point
          datetime      time2;          //=0,    // time of the second anchor point
          double        price2;         //=0,   // price of the second anchor point
          datetime      time3;          //=0,   // time of the third anchor point
          double        price3;         //=0    // price of the third anchor point
};
struct Sg_ObjectName
{         int   object_index;   // object index
};
struct Sg_ObjectDelete
{         long     chart_id;     // chart ID
          string     object_name;   // object name
};

struct  Sg_TextSetFont
{         const string  name;            // font name or path to font file on the disk
          int           size;            // font size
          uint          flags;          // = 0, // combination of flags
          int           orientation;    // = 0  // text slope angle
};


struct  Sg_TextOut
{         const string        text;          // displayed text
          int                 x;             // X coordinate
          int                 y;             // Y coordinate
          uint                anchor;        // anchor type
          uint                data[];       // output buffer
          uint                width;         // buffer width in pixels
          uint                height;        // buffer height in pixels
          uint                textcolor;         // text color                  'color' - unexpected token    gMqlObject.mqh      51        31
          ENUM_COLOR_FORMAT   color_format;  // color format for output
};
struct  Sg_TextGetSize
{         const string   text;    // text string
          uint           width;   // buffer width in pixels
          uint           height;  // buffer height in pixels
};
struct  Sg_ObjectSetText
{         string   object_name;         // object name
          string   text;                // description
          int      font_size;//=0,         // font size
          string   font_name;//=NULL,      // font name
          color    text_color;//=clrNONE   // text color
};
//+------------------------------------------------------------------+
//||   ||||||||||             Frame_Data_Fields.mqh                 || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               || 0 errors, 0 warnings, 137-141 msec elapsed
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class GraphicalChartObj(DataAction)      BEGIN       |
//+------------------------------------------------------------------+
class Sg_MqlObjectData            //---as model (DataBase)
{
public:
          void                          Sg_MqlObjectData() {/*Alert("===========Sg_MqlObjectData::Sg_MqlObjectData()================2022 06 29");*/};
          void                          ~Sg_MqlObjectData() {};
          //+----------------------------------------------------------------------------------------------------+
          //|                               functions  ObjectGet() and ObjectSet()                               |
          //+----------------------------------------------------------------------------------------------------+
          datetime                       _TIME1;                 //0       datetime        Datetime value to set/get first coordinate time part
          double                         _PRICE1;                //1       double          Double value to set/get first coordinate price part
          datetime                       _TIME2;                 //2       datetime        Datetime value to set/get second coordinate time part
          double                         _PRICE2;                //3       double          Double value to set/get second coordinate price part
          datetime                       _TIME3;                 //4       datetime        Datetime value to set/get third coordinate time part
          double                         _PRICE3;                //5       double          Double value to set/get third coordinate price part
          color                          _COLOR;                 //6       color           Color value to set/get object color
          int                            _STYLE;                 //7       int             Value is one of STYLE_SOLID, STYLE_DASH, STYLE_DOT, STYLE_DASHDOT, STYLE_DASHDOTDOT constants to set/get object line style
          int                            _WIDTH;                 //8       int             Integer value to set/get object line width. Can be from 1 to 5
          bool                           _BACK;                  //9       bool            Boolean value to set/get background drawing flag for object
          bool                           _RAY;                   //10      bool            Boolean value to set/get ray flag of object.
          bool                           _ELLIPSE;               //11      bool            Boolean value to set/get ellipse flag for fibo arcs
          double                         _SCALE;                 //12      double          Double value to set/get scale object property
          double                         _ANGLE;                 //13      double          Double value to set/get angle object property in degrees
          uchar                          _ARROWCODE;             //14      uchar           Integer value or arrow enumeration to set/get arrow code object property
          int                            _TIMEFRAMES;            //15      int             Value can be one or combination (bitwise addition) of object visibility constants to set/get timeframe object property
          double                         _DEVIATION;             //16      double          Double value to set/get deviation property for Standard deviation objects
          int                            _FONTSIZE;              //100     int             Integer value to set/get font size for text objects
          int                            _CORNER;                //101     int             Integer value to set/get anchor corner property for label objects. Must be from 0-3.
          int                            _XDISTANCE;             //102     int             Integer value to set/get anchor X distance object property in pixels (see note)
          int                            _YDISTANCE;             //103     int             Integer value is to set/get anchor Y distance object property in pixels (see note)
          int                            _FIBOLEVELS;            //200     int             Integer value to set/get Fibonacci object level count. Can be from 0 to 32
          color                          _LEVELCOLOR;            //201     color           Color value to set/get object level line color
          int                            _LEVELSTYLE;            //202     int             Value is one of STYLE_SOLID, STYLE_DASH, STYLE_DOT, STYLE_DASHDOT, STYLE_DASHDOTDOT constants to set/get object level line style
          int                            _LEVELWIDTH;            //203     int             Integer value to set/get object level line width. Can be from 1 to 5
          int                            _FIRSTLEVEL_00;         //210+n   int             Integer value to set/get the value of Fibonacci object level with index n. Index n can be from 0 (number of levels -1), but not larger than 31
          //+----------------------------------------------------------------------------------------------------+
          //|     ENUM_OBJECT_PROPERTY_INTEGER          functions ObjectSetInteger() and ObjectGetInteger()      |
          //+----------------------------------------------------------------------------------------------------+
          int                            MODE;                    //= MODE_CREATE;= MODE_MOVE;= MODE_MODIFY;
          bool                           IsKEY;                  //= false;
          //--- Frame Data Fields

          color                          COLOR;                        //Color                           color
          ENUM_LINE_STYLE                STYLE;                        //Style                           ENUM_LINE_STYLE
          int                            WIDTH;                        //Line thickness                  int
          //
          bool                           BACK;                         //Object in the background        bool
          long                           ZORDER;                       //Priority of a graphical object for receiving events of clicking on a chart (CHARTEVENT_CLICK).The default zero value is set when creating an object; the priority can be increased if necessary.When objects are placed one atop another, only one of them with the highest priority will receive the CHARTEVENT_CLICK event.       long
          bool                           HIDDEN;                       //Prohibit showing of the name of a graphical object in the list of objects from the terminal menu "Charts" - "Objects" - "List of objects". The true value allows to hide an object from the list. By default, true is set to the objects that display calendar events, trading history and to the objects created from MQL4 programs. To see such graphical objects and access their properties, click on the "All" button in the "List of objects" window.   bool
          bool                           SELECTED;                     //Object is selected   bool
          bool                           READONLY;                     //Ability to edit text in the Edit object   bool
          ENUM_OBJECT                    TYPE;                         //Object type   ENUM_OBJECT   r/o
          //
          datetime                       TIME;                         //Time coordinate     datetime   modifier=number of anchor point
          datetime                       TIME1;                 //0       datetime        Datetime value to set/get first coordinate time part
          datetime                       TIME2;                 //2       datetime        Datetime value to set/get second coordinate time part
          datetime                       TIME3;                 //4       datetime        Datetime value to set/get third coordinate time part
          //
          bool                           SELECTABLE;                   //Object availability    bool
          datetime                       CREATETIME;                   //Time of object creation      datetime    r/o
          int                            LEVELS;                       //Number of levels    int
          color                          LEVELCOLOR;                   //Color of the line-level    color   modifier=level number
          ENUM_LINE_STYLE                LEVELSTYLE;                   //Style of the line-level   ENUM_LINE_STYLE modifier=level number
          int                            LEVELWIDTH;                   //Thickness of the line-level    int      modifier=level number
          //
          ENUM_ALIGN_MODE                ALIGN;                        //Horizontal text alignment in the "Edit" object (OBJ_EDIT)    ENUM_ALIGN_MODE
          int                            FONTSIZE;                     //Font size       int
          bool                           RAY_RIGHT;                    //Ray goes to the right     bool
          bool                           ELLIPSE;                      //Showing the full ellipse of the Fibonacci Arc object (OBJ_FIBOARC)    bool
          uchar                          ARROWCODE;                    //Arrow code for the Arrow object    uchar
          long                           TIMEFRAMES;                   //Visibility of an object at timeframes    set of flags flags (OBJ_ALL_PERIODS)  ObjectSetInteger(0,highlevel,OBJPROP_TIMEFRAMES,OBJ_PERIOD_M15|OBJ_PERIOD_H1);
          ENUM_ARROW_ANCHOR              ANCHOR_ARROW;                 //Location of the anchor point of a graphical object  ENUM_ARROW_ANCHOR (for OBJ_ARROW), ENUM_ANCHOR_POINT //(for OBJ_LABEL, OBJ_BITMAP_LABEL and OBJ_TEXT)
          ENUM_ANCHOR_POINT              ANCHOR_POINT;                 //Location of the anchor point of a graphical object  ENUM_ARROW_ANCHOR (for OBJ_ARROW), ENUM_ANCHOR_POINT //(for OBJ_LABEL, OBJ_BITMAP_LABEL and OBJ_TEXT)
          //---
          int                            XDISTANCE;                    //The distance in pixels along the X axis from the binding corner (see note)  int
          int                            YDISTANCE;                    //The distance in pixels along the Y axis from the binding corner (see note)  int
          bool                           DRAWLINES;            //Displaying lines for marking the Elliott Wave  bool
          bool                           STATE;                //Button state (pressed / depressed)      bool
          //
          int                            XSIZE;                //The object's width along the X axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.       int
          int                            YSIZE;                //The object's height along the Y axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.      int
          int                            XOFFSET;              //The X coordinate of the upper left corner of the rectangular visible area in the graphical objects"Bitmap Label" and "Bitmap" (OBJ_BITMAP_LABEL and OBJ_BITMAP).The value is set in pixels relative to the upper left corner of the original image.  int
          int                            YOFFSET;              //The Y coordinate of the upper left corner of the rectangular visible area in the graphical objects "Bitmap Label" and "Bitmap" (OBJ_BITMAP_LABEL and OBJ_BITMAP). The value is set in pixels relative to the upper left corner of the original image.    int
          //
          color                          BGCOLOR;              //The background color for  OBJ_EDIT, OBJ_BUTTON, OBJ_RECTANGLE_LABEL  color
          ENUM_BASE_CORNER               CORNER;               //The corner of the chart to link a graphical object   ENUM_BASE_CORNER
          ENUM_BORDER_TYPE               BORDER_TYPE;          //Border type for the "Rectangle label" object  ENUM_BORDER_TYPE
          color                          BORDER_COLOR;         //Border color for the OBJ_EDIT and OBJ_BUTTON objects  color
          //---------------
          bool                           FILL;
          bool                           DIRECTION;            //   Gannfan GaanGrid bool            direction=true,    // trend direction
          bool                           RAY;                   //10      bool            Boolean value to set/get ray flag of object.
          int                            SUBWINDOW;
          long                           CHART;
          //+----------------------------------------------------------------------------------------------------+
          //|     ENUM_OBJECT_PROPERTY_DOUBLE          functions ObjectSetDouble() and ObjectGetDouble()         |
          //+----------------------------------------------------------------------------------------------------+
          double                         PRICE;         //Price coordinate
          double                         PRICE1;                //1       double          Double value to set/get first coordinate price part
          double                         PRICE2;                //3       double          Double value to set/get second coordinate price part
          double                         PRICE3;                //5       double          Double value to set/get third coordinate price part
          //                                                                              double    modifier=number of anchor point
          double                         LEVELVALUE;    //Level value                                                                                                     double    modifier=level number
          double                         SCALE;         //Scale (properties of Gann objects, Fibonacci Arcs and Ellipse)                                                  double
          double                         ANGLE;         //Angle.  For the objects with no angle specified, created from a program, the value is equal to EMPTY_VALUE      double
          double                         DEVIATION;     //Deviation for the Standard Deviation Channel                                                                    double
          //+----------------------------------------------------------------------------------------------------+
          //|     ENUM_OBJECT_PROPERTY_STRING          functions ObjectSetString() and ObjectGetString()         |
          //+----------------------------------------------------------------------------------------------------+
          string                         NAME;          //Object name                                                     string
          string                         TEXT;          //Description of the object (the text contained in the object)    string
          string                         TOOLTIP;       //The text of a tooltip. If the property is not set, then the tooltip generated automatically by the terminal is shown. A tooltip can be disabled by setting the "\n" (line feed) value to it    string
          string                         LEVELTEXT;     //Level description                                               string    modifier=level number
          string                         FONT;          //Font     string
          string                         BMPFILE;       //The name of BMP-file for Bitmap Label. See also Resources       string    modifier: 0-state ON, 1-state OFF
          string                         BMPFILE_OFF;
          string                         BMPFILE_ON;
          string                         SYMBOL;        //Symbol for the Chart object                                     string
//======================================================================================================
};
//+------------------------------------------------------------------+
//||   ||||||||||             Frame_Data_Fields.mqh                 || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               || 0 errors, 0 warnings, 137-141 msec elapsed
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class Sg_MqlObject     BEGIN                         |
//|              noDependency (Build-In MQL)                         |
//+------------------------------------------------------------------+
class Sg_MqlObject
{         /*
          * Object Functions
          * This is the group of functions intended for working with graphic objects relating to any specified chart.
          * When working with objects on the current chart, a direct access is used, i.e.
          * the existence of the specified object is pre-checked during the function call, and the error code is immediately returned in case of failure.
          * When a function is used for the objects of a chart other than the current one,
          * an asynchronous function call is used, during which no pre-checks are performed and the function is added to the queue of that chart as is.
          * Functions that set the properties of graphical objects, as well as the ObjectCreate() and ObjectMove() operations
          * are actually used for sending commands to a chart. If these functions are executed successfully,
          * the command is added to the queue of chart events. Visual changes in the properties of graphical objects are implemented upon handling of chart events from the queue.
          * ============================================================================================================================================================================
          * That is why you should do not expect an immediate visual update of graphical objects after calling these functions.
          * Generally, graphical objects on a chart are updated automatically by the terminal based on update events,
          * such as a new quote arrival, chart window resizing, etc. Use the ChartRedraw() command to force the update of graphical objects.
          * ============================================================================================================================================================================
          //-------------------------------------------------------------
                            Object Functions
          //-------------------------------------------------------------
          * Function                            Action
          * ObjectCreate                        Creates an object of the specified type in a specified chart
          * ObjectName                          Returns the name of an object by its index in the objects list
          * ObjectDelete                        Removes the object having the specified name
          * ObjectsDeleteAll                    Removes all objects of the specified type from the specified chart subwindow
          * ObjectFind                          Searches for an object having the specified name
          * ObjectGetTimeByValue                Returns the time value for the specified object price value
          * ObjectGetValueByTime                Returns the price value of an object for the specified time
          * ObjectMove                          Changes the coordinates of the specified object anchor point
          * ObjectsTotal                        Returns the number of objects of the specified type
          * ObjectGetDouble                     Returns the double value of the corresponding object property
          * ObjectGetInteger                    Returns the integer value of the corresponding object property
          * ObjectGetString                     Returns the string value of the corresponding object property
          * ObjectSetDouble                     Sets the value of the corresponding object property
          * ObjectSetInteger                    Sets the value of the corresponding object property
          * ObjectSetString                     Sets the value of the corresponding object property
          * TextSetFont                         Sets the font for displaying the text using drawing methods (Arial 20 used by default)
          * TextOut                             Transfers the text to the custom array (buffer) designed for creation of a graphical resource
          * TextGetSize                         Returns the string's width and height at the current font settings
          * ObjectDescription                   Returns the object description
          * ObjectGet                           Returns the value of the specified object property
          * ObjectGetFiboDescription            Returns the level description of a Fibonacci object
          * ObjectGetShiftByValue               Calculates and returns bar index for the given price
          * ObjectGetValueByShift               Calculates and returns the price value for the specified bar
          * ObjectSet                           Changes the value of the specified object property
          * ObjectSetFiboDescription            Sets a new description to a level of a Fibonacci object
          * ObjectSetText                       Changes the object description
          * ObjectType                          Returns the object type
          ============================================================================================================================================================================
          * Every graphical object should have a name unique within one chart, including its subwindows. Changing of a name of a graphic object generates two events:
          * event of deletion of an object with the old name, and event of creation of an object with a new name.
          * After an object is created or an object property is modified it is recommended to call the ChartRedraw() function,
          * which commands the client terminal to forcibly draw a chart (and all visible objects in it).
          ============================================================================================================================================================================
          * What's new in MQL5
          * MQL5 features more graphical objects, and the most unusual of them is OBJ_CHART(Chart) – you are able to insert such objects as symbol charts.
          * If you complement OBJ_CHART with indicators and control panels handling custom events,
          * a usual chart turns into a convenient analysis tool with the ability to quickly change symbols and timeframes in a single mouse click.
          * The properties of objects for managing program objects have been significantly expanded. Now you are able to set colors,
          * move an object to the back or front, set the priority for intercepting keyboard and mouse events on a chart,
          * as well as select an object or hide it from the list of visible ones. All this allows you to develop a graphical user interface of any complexity.
          ============================================================================================================================================================================
          bool  ObjectCreate(
          long          chart_id,      // chart ID
          string        object_name,   // object name
          ENUM_OBJECT   object_type,   // object type
          int           sub_window,    // window index
          datetime      time1,         // time of the first anchor point
          double        price1,        // price of the first anchor point
          ...
          datetime      timeN=0,       // time of the N-th anchor point
          double        priceN=0       // price of the N-th anchor point
          );
          //=============================================================
          bool  ObjectCreate(
          string        object_name,   // object name
          ENUM_OBJECT   object_type,   // object type
          int           sub_window,    // window index
          datetime      time1,         // time of the first anchor point
          double        price1,        // price of the first anchor point
          datetime      time2=0,       // time of the second anchor point
          double        price2=0,      // price of the second anchor point
          datetime      time3=0,       // time of the third anchor point
          double        price3=0       // price of the third anchor point
          );
          //=============================================================
          string        ObjectName( int object_index // object index );

          bool          ObjectDelete( long chart_id, // chartID  string object_name // object name );
          bool          ObjectDelete( string object_name // object name );

          int           ObjectsDeleteAll( long chart_id, int sub_window=EMPTY, int object_type=EMPTY );                          Removes all objects from the specified chart, specified chart subwindow, of the specified type.
          int           ObjectsDeleteAll( int sub_window=EMPTY, int object_type=EMPTY );                                         Removes all objects of the specified type from the specified chart subwindow.
          int           ObjectsDeleteAll( long chart_id, const string prefix, int sub_window=EMPTY, int object_type=EMPTY );     Removes all objects of the specified type using prefix in object names.

          int           ObjectFind( long chart_id, string object_name ); The function searches for an object having the specified name. There are two variants of the function:
          int           ObjectFind( string object_name );                The function searches the object with the specified name:

          datetime      ObjectGetTimeByValue( long chart_id, string object_name, double value, int line_id=0 );
          double        ObjectGetValueByTime( long chart_id, string object_name, datetime time, int line_id=0 );
          double        ObjectGetValueByTime( long chart_id, string object_name, datetime time, int line_id=0 );

          bool          ObjectMove( string object_name, int point_index,(anchor point number) datetime time, double price ); //---The number of anchor points depends on the type of object.   //--- move the 2nd anchor point of the trend line
          bool          ObjectMove( string object_name, int point_index,(anchor point number) datetime time, double price ); //---Objects can have from one to three coordinates depending on their types. The object coordinates are numbered starting from 0.

          int           ObjectsTotal( long chart_id, int sub_window=-1, int type=-1 );
          int           ObjectsTotal( int type=EMPTY );

          double        ObjectGetDouble( long chart_id, string object_name, int prop_id, int prop_modifier=0 );
          bool          ObjectGetDouble( long chart_id, string object_name, int prop_id, int prop_modifier, double& double_var );

          long          ObjectGetInteger( long chart_id, string object_name, int prop_id, int prop_modifier=0 );
          bool          ObjectGetInteger( long chart_id, string object_name, int prop_id, int prop_modifier, long& long_var );

          string        ObjectGetString( long chart_id, string  object_name, int prop_id, int prop_modifier=0 );
          bool          ObjectGetString( long chart_id, string  object_name, int prop_id, int prop_modifier, string& string_var );

          bool          ObjectSetDouble( long chart_id, string object_name, int prop_id, double prop_value );
          bool          ObjectSetDouble( long chart_id, string object_name, int prop_id, int prop_modifier, double prop_value );

          bool          ObjectSetInteger( long chart_id, string object_name, int prop_id, long prop_value );
          bool          ObjectSetInteger( long chart_id, string object_name, int prop_id, int prop_modifier, long prop_value );

          bool          ObjectSetString( long chart_id, string object_name, int prop_id, string prop_value );
          bool          ObjectSetString( long chart_id, string object_name, int prop_id, int prop_modifier, string prop_value );

          bool          TextSetFont( const string  name, int size, uint flags=0, int orientation=0 );
          bool          TextOut( const string text, int x, int y, uint anchor, uint &data[], uint width, uint height, uint color, ENUM_COLOR_FORMAT color_format );
          bool          TextGetSize( const string text, uint& width, uint& height );

          string        ObjectDescription( string object_name );
          double        ObjectGet( string object_name, int index );
          string        ObjectGetFiboDescription( string object_name, int index );

          int           ObjectGetShiftByValue( string object_name, double value );
          double        ObjectGetValueByShift( string object_name, int shift );

          bool          ObjectSet( string object_name, int index, double value );
          bool          ObjectSetFiboDescription( string object_name, int index, string text );
          bool          ObjectSetText( string object_name, string text, int font_size=0, string font_name=NULL, color text_color=clrNONE );
          int           ObjectType( string object_name );
          //-------------------------------------------------------------
                            Object Properties
          //-------------------------------------------------------------
          Graphical objects can have various properties depending on the object type. All objects used in technical analysis are bound to the time and price coordinates:
          trendline, channels, Fibonacci tools, etc. But there is a number of auxiliary objects intended to improve the user interface that
          are bound to the always visible part of a chart (main chart windows or indicator subwindows):
          //=============================================================================================================================================
          // (Object)                (ID)                   (X / Y)    (Width / Height)   (Date / Price)   (OBJPROP_CORNER)    (OBJPROP_ANCHOR)   (OBJPROP_ANGLE)
          //  Text                   OBJ_TEXT                —         —                   Yes             —                    Yes               Yes
          //  Label                  OBJ_LABEL               Yes       Yes (read only)     —               Yes                  Yes               Yes
          //  Button                 OBJ_BUTTON              Yes       Yes                 —               Yes                  —                 —
          //  Bitmap                 OBJ_BITMAP              —         Yes (read only)     Yes             —                    Yes               —
          //  Bitmap Label           OBJ_BITMAP_LABEL        Yes       Yes (read only)     —               Yes                  Yes               —
          //  Edit                   OBJ_EDIT                Yes       Yes                 —               Yes                  —                 —
          //  Rectangle Label        OBJ_RECTANGLE_LABEL     Yes       Yes                 —               Yes                  —                 —
          //=============================================================================================================================================
          Every graphical object in a price chart has a certain set of properties.
          Object value index used with ObjectGet() and ObjectSet() functions. It can be any of the following values:
          ID                            Value   Type            Description
          OBJPROP_TIME1                 0       datetime        Datetime value to set/get first coordinate time part
          OBJPROP_PRICE1                1       double          Double value to set/get first coordinate price part
          OBJPROP_TIME2                 2       datetime        Datetime value to set/get second coordinate time part
          OBJPROP_PRICE2                3       double          Double value to set/get second coordinate price part
          OBJPROP_TIME3                 4       datetime        Datetime value to set/get third coordinate time part
          OBJPROP_PRICE3                5       double          Double value to set/get third coordinate price part
          OBJPROP_COLOR                 6       color           Color value to set/get object color
          OBJPROP_STYLE                 7       int             Value is one of STYLE_SOLID, STYLE_DASH, STYLE_DOT, STYLE_DASHDOT, STYLE_DASHDOTDOT constants to set/get object line style
          OBJPROP_WIDTH                 8       int             Integer value to set/get object line width. Can be from 1 to 5
          OBJPROP_BACK                  9       bool            Boolean value to set/get background drawing flag for object
          OBJPROP_RAY                   10      bool            Boolean value to set/get ray flag of object.
          OBJPROP_ELLIPSE               11      bool            Boolean value to set/get ellipse flag for fibo arcs
          OBJPROP_SCALE                 12      double          Double value to set/get scale object property
          OBJPROP_ANGLE                 13      double          Double value to set/get angle object property in degrees
          OBJPROP_ARROWCODE             14      uchar           Integer value or arrow enumeration to set/get arrow code object property
          OBJPROP_TIMEFRAMES            15      int             Value can be one or combination (bitwise addition) of object visibility constants to set/get timeframe object property
          OBJPROP_DEVIATION             16      double          Double value to set/get deviation property for "Standard deviation" objects
          OBJPROP_FONTSIZE              100     int             Integer value to set/get font size for text objects
          OBJPROP_CORNER                101     int             Integer value to set/get anchor corner property for label objects. Must be from 0-3.
          OBJPROP_XDISTANCE             102     int             Integer value to set/get anchor X distance object property in pixels (see note)
          OBJPROP_YDISTANCE             103     int             Integer value is to set/get anchor Y distance object property in pixels (see note)
          OBJPROP_FIBOLEVELS            200     int             Integer value to set/get Fibonacci object level count. Can be from 0 to 32
          OBJPROP_LEVELCOLOR            201     color           Color value to set/get object level line color
          OBJPROP_LEVELSTYLE            202     int             Value is one of STYLE_SOLID, STYLE_DASH, STYLE_DOT, STYLE_DASHDOT, STYLE_DASHDOTDOT constants to set/get object level line style
          OBJPROP_LEVELWIDTH            203     int             Integer value to set/get object level line width. Can be from 1 to 5
          OBJPROP_FIRSTLEVEL+n          210+n   int             Integer value to set/get the value of Fibonacci object level with index n. Index n can be from 0 (number of levels -1), but not larger than 31
          //=============================================================
          //--------------------------------------------------------------
          //  For functions ObjectSetInteger() and ObjectGetInteger()   //
          //                Object Properties ENUM INTEGER              //
          //--------------------------------------------------------------
          ENUM_OBJECT_PROPERTY_INTEGER
          Identifier            Description                     Property Type
          OBJPROP_COLOR         Color                           color
          OBJPROP_STYLE         Style                           ENUM_LINE_STYLE
          OBJPROP_WIDTH         Line thickness                  int
          OBJPROP_BACK          Object in the background        bool
          OBJPROP_ZORDER        Priority of a graphical object for receiving events of clicking on a chart (CHARTEVENT_CLICK).
                                The default zero value is set when creating an object; the priority can be increased if necessary.
                                When objects are placed one atop another, only one of them with the highest priority will receive the CHARTEVENT_CLICK event.       long

          OBJPROP_HIDDEN        Prohibit showing of the name of a graphical object in the list of objects from the terminal menu
                                "Charts" - "Objects" - "List of objects". The true value allows to hide an object from the list.
                                By default, true is set to the objects that display calendar events, trading history and to the objects
                                created from MQL4 programs. To see such graphical objects and access their properties,
                                click on the "All" button in the "List of objects" window.   bool

          OBJPROP_SELECTED      Object is selected   bool
          OBJPROP_READONLY      Ability to edit text in the Edit object   bool
          OBJPROP_TYPE          Object type   ENUM_OBJECT   r/o
          OBJPROP_TIME          Time coordinate     datetime   modifier=number of anchor point
          OBJPROP_SELECTABLE    Object availability    bool
          OBJPROP_CREATETIME    Time of object creation      datetime    r/o
          OBJPROP_LEVELS        Number of levels    int
          OBJPROP_LEVELCOLOR    Color of the line-level    color   modifier=level number
          OBJPROP_LEVELSTYLE    Style of the line-level   ENUM_LINE_STYLE modifier=level number
          OBJPROP_LEVELWIDTH    Thickness of the line-level    int      modifier=level number
          OBJPROP_ALIGN         Horizontal text alignment in the "Edit" object (OBJ_EDIT)    ENUM_ALIGN_MODE
          OBJPROP_FONTSIZE      Font size       int
          OBJPROP_RAY_RIGHT     Ray goes to the right     bool
          OBJPROP_ELLIPSE       Showing the full ellipse of the Fibonacci Arc object (OBJ_FIBOARC)    bool
          OBJPROP_ARROWCODE     Arrow code for the Arrow object    uchar
          OBJPROP_TIMEFRAMES    Visibility of an object at timeframes    set of flags flags
          OBJPROP_ANCHOR        Location of the anchor point of a graphical object     ENUM_ARROW_ANCHOR (for OBJ_ARROW),ENUM_ANCHOR_POINT     (for OBJ_LABEL, OBJ_BITMAP_LABEL and OBJ_TEXT)
          OBJPROP_XDISTANCE     The distance in pixels along the X axis from the binding corner (see note)  int
          OBJPROP_YDISTANCE     The distance in pixels along the Y axis from the binding corner (see note)  int
          OBJPROP_DRAWLINES     Displaying lines for marking the Elliott Wave  bool
          OBJPROP_STATE         Button state (pressed / depressed)      bool
          OBJPROP_XSIZE         The object's width along the X axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.       int
          OBJPROP_YSIZE         The object's height along the Y axis in pixels. Specified for  OBJ_LABEL (read only),OBJ_BUTTON, OBJ_BITMAP, OBJ_BITMAP_LABEL, OBJ_EDIT, OBJ_RECTANGLE_LABEL objects.      int
          OBJPROP_XOFFSET       The X coordinate of the upper left corner of the rectangular visible area in the graphical objects"Bitmap Label" and "Bitmap" (OBJ_BITMAP_LABEL and OBJ_BITMAP).The value is set in pixels relative to the upper left corner of the original image.  int
          OBJPROP_YOFFSET       The Y coordinate of the upper left corner of the rectangular visible area in the graphical objects "Bitmap Label" and "Bitmap" (OBJ_BITMAP_LABEL and OBJ_BITMAP). The value is set in pixels relative to the upper left corner of the original image.    int
          OBJPROP_BGCOLOR       The background color for  OBJ_EDIT, OBJ_BUTTON, OBJ_RECTANGLE_LABEL  color
          OBJPROP_CORNER        The corner of the chart to link a graphical object   ENUM_BASE_CORNER
          OBJPROP_BORDER_TYPE   Border type for the "Rectangle label" object  ENUM_BORDER_TYPE
          OBJPROP_BORDER_COLOR  Border color for the OBJ_EDIT and OBJ_BUTTON objects  color
          //=============================================================
          //-------------------------------------------------------------
          //    For functions ObjectSetDouble() and ObjectGetDouble()  //
          //                Object Properties ENUM DOUBLE              //
          //-------------------------------------------------------------
          ENUM_OBJECT_PROPERTY_DOUBLE
          Identifier            Description                                                                                                     Property Type
          OBJPROP_PRICE         Price coordinate                                                                                                double    modifier=number of anchor point
          OBJPROP_LEVELVALUE    Level value                                                                                                     double    modifier=level number
          OBJPROP_SCALE         Scale (properties of Gann objects, Fibonacci Arcs and Ellipse)                                                  double
          OBJPROP_ANGLE         Angle.  For the objects with no angle specified, created from a program, the value is equal to EMPTY_VALUE      double
          OBJPROP_DEVIATION     Deviation for the Standard Deviation Channel                                                                    double
          //=============================================================
          //-------------------------------------------------------------
          //    For functions ObjectSetString() and ObjectGetString()  //
          //                Object Properties ENUM STRING              //
          //-------------------------------------------------------------
          ENUM_OBJECT_PROPERTY_STRING
          Identifier            Description                                                     Property Type
          OBJPROP_NAME          Object name                                                     string
          OBJPROP_TEXT          Description of the object (the text contained in the object)    string
          OBJPROP_TOOLTIP       The text of a tooltip. If the property is not set, then the tooltip generated automatically by the terminal is shown. A tooltip can be disabled by setting the "\n" (line feed) value to it    string
          OBJPROP_LEVELTEXT     Level description                                               string    modifier=level number
          OBJPROP_FONT          Font     string
          OBJPROP_BMPFILE       The name of BMP-file for Bitmap Label. See also Resources       string    modifier: 0-state ON, 1-state OFF
          OBJPROP_SYMBOL        Symbol for the Chart object                                     string
          //=============================================================
          //-------------------------------------------------------------
          //                  Object Properties ENUM BORDER_TYPE       //
          //-------------------------------------------------------------
          For the OBJ_RECTANGLE_LABEL object ("Rectangle label") one of the three design modes can be set, to which the following values of ENUM_BORDER_TYPE correspond.
          ENUM_BORDER_TYPE
          Identifier            Description
          BORDER_FLAT           Flat form
          BORDER_RAISED         Prominent form
          BORDER_SUNKEN         Concave form
          //=============================================================
          For the OBJ_EDIT object ("Edit") and for the ChartScreenShot()function, you can specify the horizontal alignment type using the values of the ENUM_ALIGN_MODE enumeration.
          //-------------------------------------------------------------
          //                 Object Properties ENUM ALIGN_MODE         //
          //-------------------------------------------------------------
          ENUM_ALIGN_MODE
          Identifier            Description
          ALIGN_LEFT            Left alignment
          ALIGN_CENTER          Centered (only for the Edit object)
          ALIGN_RIGHT           Right alignment
          //=============================================================
          Object Types
          When a graphical object is created using the ObjectCreate() function, it's necessary to specify the type of object being created,
           which can be one of the values of the ENUM_OBJECT enumeration. Object type identifiers are used in ObjectCreate(), ObjectsDeleteAll() and ObjectType() functions.
          Further specifications of object properties are possible using functions for working with graphical objects.
          //-------------------------------------------------------------
          //                 Object Properties ENUM OBJECT (Type)      //
          //-------------------------------------------------------------
          ENUM_OBJECT           ID                      Description
          OBJ_VLINE             vertical_line           Vertical Line
          OBJ_HLINE             horizonal_line          Horizontal Line
          OBJ_TREND             trend_line              Trend Line
          OBJ_TRENDBYANGLE      trend_line)by_angle     Trend Line By Angle
          OBJ_CYCLES            cycle_lines             Cycle Lines
          OBJ_CHANNEL           equidistance_channel    Equidistant Channel
          OBJ_STDDEVCHANNEL     stddeviation_channel    Standard Deviation Channel
          OBJ_REGRESSION        regression_channel      Linear Regression Channel
          OBJ_PITCHFORK         andrewspitchfork        Andrews’ Pitchfork
          OBJ_GANNLINE          gann_line               Gann Line
          OBJ_GANNFAN           gann_fan                Gann Fan
          OBJ_GANNGRID          gann_grid               Gann Grid
          OBJ_FIBO              fibonacci_levels        Fibonacci Retracement
          OBJ_FIBOTIMES         fibonacci_time_zones    Fibonacci Time Zones
          OBJ_FIBOFAN           fibo_fan                Fibonacci Fan
          OBJ_FIBOARC           fibo_arc                Fibonacci Arcs
          OBJ_FIBOCHANNEL       fibo_channel            Fibonacci Channel
          OBJ_EXPANSION         fibo_expansion          Fibonacci Expansion
          OBJ_RECTANGLE         rectangle               Rectangle
          OBJ_TRIANGLE          triangle                Triangle
          OBJ_ELLIPSE           ellipse                 Ellipse
          OBJ_ARROW_THUMB_UP    THUMB_UP                Thumbs Up
          OBJ_ARROW_THUMB_DOWN  THUMB_DOWN              Thumbs Down
          OBJ_ARROW_UP          arrow_up                Arrow Up
          OBJ_ARROW_DOWN        arrow_down              Arrow Down
          OBJ_ARROW_STOP        stop_signal             Stop Sign
          OBJ_ARROW_CHECK       check_signal            Check Sign
          OBJ_ARROW_LEFT_PRICE  left_price_label        Left Price Label
          OBJ_ARROW_RIGHT_PRICE right_price_label       Right Price Label
          OBJ_ARROW_BUY         buy_sign_icon           Buy Sign
          OBJ_ARROW_SELL        sell_sign_icon          Sell Sign
          OBJ_ARROW             arrow_symbol            Arrow
          OBJ_TEXT              text_object             Text
          OBJ_LABEL             label_object            Label
          OBJ_BUTTON            button_object           Button
          OBJ_BITMAP            picture_object          Bitmap
          OBJ_BITMAP_LABEL      bitmap_object           Bitmap Label
          OBJ_EDIT              edit_object             Edit
          OBJ_EVENT             obj_event               The "Event" object corresponding to an event in the economic calendar
          OBJ_RECTANGLE_LABEL   rectangle_label         The "Rectangle label" object for creating and designing the custom graphical interface.
          //=============================================================
          //-------------------------------------------------------------
          //                 Object Properties ENUM ARROW_ANCHOR       //
          //-------------------------------------------------------------
          ENUM_ARROW_ANCHOR
          ID                    Description
          ANCHOR_TOP            Anchor on the top side
          ANCHOR_BOTTOM         Anchor on the bottom side
          //=============================================================
          //-------------------------------------------------------------
          //                 Object Properties ENUM ANCHOR_POINT       //
          //-------------------------------------------------------------
          ENUM_ANCHOR_POINT
          ID                    Description
          ANCHOR_LEFT_UPPER     Anchor point at the upper left corner
          ANCHOR_LEFT           Anchor point to the left in the center
          ANCHOR_LEFT_LOWER     Anchor point at the lower left corner
          ANCHOR_LOWER          Anchor point below in the center
          ANCHOR_RIGHT_LOWER    Anchor point at the lower right corner
          ANCHOR_RIGHT          Anchor point to the right in the center
          ANCHOR_RIGHT_UPPER    Anchor point at the upper right corner
          ANCHOR_UPPER          Anchor point above in the center
          ANCHOR_CENTER         Anchor point strictly in the center of the object
          //=============================================================
          //-------------------------------------------------------------
          //                 Object Properties Define OBJ_PERIOD       //
          //-------------------------------------------------------------
          Visibility of Objects
          The combination of object visibility flags determines chart timeframes, where the object is visible.
           To set/get the value of the OBJPROP_TIMEFRAMES property, you can use the ObjectSet()/ObjectGet or ObjectSetInteger()/ObjectGetInteger() functions.
          ID   Value    Description
          OBJ_NO_PERIODS,EMPTY   -1             The object is not drawn in all timeframes
          OBJ_PERIOD_M1         0x0001          The object is drawn in 1-minute chart
          OBJ_PERIOD_M5         0x0002          The object is drawn in 5-minute chart
          OBJ_PERIOD_M15        0x0004          The object is drawn in 15-minute chart
          OBJ_PERIOD_M30        0x0008          The object is drawn in 30-minute chart
          OBJ_PERIOD_H1         0x0010          The object is drawn in 1-hour chart
          OBJ_PERIOD_H4         0x0020          The object is drawn in 4-hour chart
          OBJ_PERIOD_D1         0x0040          The object is drawn in day charts
          OBJ_PERIOD_W1         0x0080          The object is drawn in week charts
          OBJ_PERIOD_MN1        0x0100          The object is drawn in month charts
          OBJ_ALL_PERIODS       0x01ff          The object is drawn in all timeframes
          //=============================================================
          */
          //================================================================================================
public:
          void           Sg_MqlObject() { };//Print("       Passd StackOverflow",__FUNCSIG__);
          void           ~Sg_MqlObject() {};
          bool           Update() { return UPDATED = true;}
          bool           UPDATED;
          //================================================================================================
          bool           Delete(string Name); //--by name just
          ENUM_OBJECT    Type(string Name); //--by name just
          bool           Move(string Name);
          bool           MoveAnchorTimePrice(string Name, int AnchorPoint_index, datetime time, double price);
          //=================================================================================================
          bool          _ObjectCreate(Sg_ObjectCreate  &ObjCreate )                                                                             { return ObjectCreate           ( ObjCreate.chart_id, ObjCreate.object_name, ObjCreate.object_type, ObjCreate.sub_window, ObjCreate.time1, ObjCreate.price1, ObjCreate.timeN, ObjCreate.priceN);};
          bool          _ObjectCreate(Sg_ObjectCreateB &ObjCreateB )                                                                            { return ObjectCreate           ( ObjCreateB.object_name, ObjCreateB.object_type, ObjCreateB.sub_window, ObjCreateB.time1, ObjCreateB.price1, ObjCreateB.time2, ObjCreateB.price2, ObjCreateB.time3, ObjCreateB.price3);};
          string        _ObjectName  (Sg_ObjectName    &ObjName )                                                                               { return ObjectName             ( ObjName.object_index);}
          bool          _ObjectDelete(Sg_ObjectDelete  &ObjDelete )                                                                             { return ObjectDelete           ( ObjDelete.chart_id, ObjDelete.object_name);;}
          bool          _ObjectDelete( long chart_id, string object_name)                                                                       { return ObjectDelete           ( object_name);}
          bool          _ObjectDelete( string object_name )                                                                                     { return ObjectDelete           ( object_name);}
          int           _ObjectsDeleteAll( long chart_id, int sub_window = EMPTY, int object_type = EMPTY)                                      { return ObjectsDeleteAll       ( chart_id, sub_window, object_type );}
          int           _ObjectsDeleteAll( int sub_window = EMPTY, int object_type = EMPTY )                                                    { return ObjectsDeleteAll       ( sub_window, object_type );}
          int           _ObjectsDeleteAll( long chart_id, const string prefix, int sub_window = EMPTY, int object_type = EMPTY )                { return ObjectsDeleteAll       ( chart_id, prefix, sub_window, object_type );}
          int           _ObjectFind( long chart_id, string object_name )                                                                        { return ObjectFind             ( chart_id, object_name );}
          int           _ObjectFind( string object_name )                                                                                       { return ObjectFind             ( object_name );}
          datetime      _ObjectGetTimeByValue( long chart_id, string object_name, double value_price, int line_id = 0 )                         { return ObjectGetTimeByValue   ( chart_id, object_name, value_price, line_id );}
          double        _ObjectGetValueByTime( long chart_id, string object_name, datetime time, int line_id = 0 )                              { return ObjectGetValueByTime   ( chart_id, object_name, time, line_id );}
          bool          _ObjectMove( string object_name, int point_index_anchor_point_number, datetime time, double price )                     { return ObjectMove             ( object_name, point_index_anchor_point_number, time, price );}
          bool          _ObjectMove( long chart_id, string object_name, int point_index_anchor_point_number, datetime time, double price )      { return ObjectMove             ( chart_id, object_name, point_index_anchor_point_number, time, price );}
          int           _ObjectsTotal( long chart_id, int sub_window = -1, int type = -1 )                                                      { return ObjectsTotal           ( chart_id, sub_window, type );}
          int           _ObjectsTotal( int type = EMPTY)                                                                                        { return ObjectsTotal           ( type ); }
          //---
          //---
          double        _ObjectGetDouble(  long chart_id, string object_name, int prop_id, int prop_modifier = 0 )                              { return ObjectGetDouble        ( chart_id, object_name, prop_id, prop_modifier );}
          bool          _ObjectGetDouble(  long chart_id, string object_name, int prop_id, int prop_modifier, double& double_var )              { return ObjectGetDouble        ( chart_id, object_name, prop_id, prop_modifier, double_var );}
          //---
          long          _ObjectGetInteger( long chart_id, string object_name, int prop_id, int prop_modifier = 0)                               { return ObjectGetInteger       ( chart_id, object_name, prop_id, prop_modifier );}
          bool          _ObjectGetInteger( long chart_id, string object_name, int prop_id, int prop_modifier, long& long_var )                  { return ObjectGetInteger       ( chart_id, object_name, prop_id, prop_modifier, long_var ); }
          //---
          string        _ObjectGetString( long chart_id, string object_name, int prop_id, int prop_modifier = 0 )                               { return ObjectGetString        ( chart_id, object_name, prop_id, prop_modifier );}
          bool          _ObjectGetString( long chart_id, string object_name, int prop_id, int prop_modifier, string& string_var )               { return ObjectGetString        ( chart_id, object_name, prop_id, prop_modifier, string_var );}
          //---
          bool          _ObjectSetDouble( long chart_id, string object_name, int prop_id, double prop_value )                                   { return ObjectSetDouble        ( chart_id, object_name, prop_id, prop_value ) ;}
          bool          _ObjectSetDouble( long chart_id, string object_name, int prop_id, int prop_modifier, double prop_value )                { return ObjectSetDouble        ( chart_id, object_name, prop_id, prop_modifier, prop_value );}
          //---
          bool          _ObjectSetInteger( long chart_id, string object_name, int prop_id, long prop_value )                                    { return ObjectSetInteger       ( chart_id, object_name, prop_id, prop_value );}
          bool          _ObjectSetInteger( long chart_id, string object_name, int prop_id, int prop_modifier, long prop_value )                 { return ObjectSetInteger       ( chart_id, object_name, prop_id, prop_modifier, prop_value );}
          //---
          bool          _ObjectSetString( long chart_id, string object_name, int prop_id, string prop_value )                                   { return ObjectSetString        ( chart_id, object_name, prop_id, prop_value );}
          bool          _ObjectSetString( long chart_id, string   object_name, int prop_id, int prop_modifier, string prop_value )              { return ObjectSetString        ( chart_id, object_name, prop_id, prop_modifier, prop_value );}
          //---
          //---
          bool          _TextSetFont    ( Sg_TextSetFont &_TextSetFont)                         { return TextSetFont    ( _TextSetFont.name,    _TextSetFont.size,     _TextSetFont.flags,      _TextSetFont.orientation ) ;}
          bool          _TextOut        ( Sg_TextOut     &_TextOut )                            { return TextOut        ( _TextOut.text,        _TextOut.x,            _TextOut.y,              _TextOut.anchor,        _TextOut.data, _TextOut.width, _TextOut.height, _TextOut.textcolor, _TextOut.color_format );}
          bool          _TextGetSize    ( Sg_TextGetSize &_TextGetSize )                        { return TextGetSize    ( _TextGetSize.text,    _TextGetSize.width,    _TextGetSize.height );}
          //---
          string        _ObjectDescription( string object_name )                                { return ObjectDescription( object_name );}
          double        _ObjectGet( string object_name, int index_object_property )             { return ObjectGet( object_name, index_object_property );}
          string        _ObjectGetFiboDescription( string object_name, int index_level)         { return ObjectGetFiboDescription( object_name, index_level);}
          int           _ObjectGetShiftByValue( string object_name, double value_price )        { return ObjectGetShiftByValue( object_name, value_price );}
          double        _ObjectGetValueByShift( string object_name, int shift_bar_index )       { return ObjectGetValueByShift(   object_name,   shift_bar_index );}
          bool          _ObjectSet( string object_name, int index_property, double value )      { return ObjectSet( object_name, index_property, value );}
          bool          _ObjectSetFiboDescription( string object_name, int index_level, string text_new_description ) { return ObjectSetFiboDescription( object_name, index_level, text_new_description );}
          bool          _ObjectSetText(Sg_ObjectSetText &_ObjectSetText )                       { return ObjectSetText(_ObjectSetText.object_name, _ObjectSetText.text, _ObjectSetText.font_size, _ObjectSetText.font_name, _ObjectSetText.text_color);}
          int           _ObjectType( string object_name ) { return ObjectType( object_name );}

          //---
          //=================================================================================================



};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  Sg_MqlObject::Delete(string Name) //--by name just
{         if(ObjectFind(Name) >= 0) return ObjectDelete(Name); //
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ENUM_OBJECT   Sg_MqlObject::Type(string Name)  //--by name just
{         if(ObjectFind(Name) >= 0) return (ENUM_OBJECT)ObjectType(Name);
          return -1;//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  Sg_MqlObject::MoveAnchorTimePrice(string Name, int AnchorPoint_index, datetime time, double price )
{
//
//        //--- move the 2nd anchor point of the trend line   0-1-2-3   Index of the anchor point. The number of anchor points depends on the type of object.
          return ObjectMove(Name, AnchorPoint_index, time, price);
//
//
}
//+------------------------------------------------------------------+
//|             Class Sg_MqlObject     BEGIN                         |
//|              noDependency (Build-In MQL)                         |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//-----mql class  mode and solid build-in mode
//OBJECT.Color(COLOR);              //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_COLOR, COLOR);//
////----------------------------------
//OBJECT.X_Distance(XDISTANCE);     //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_XDISTANCE, XDISTANCE);
//OBJECT.Y_Distance(YDISTANCE);     //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_YDISTANCE, YDISTANCE);//
//OBJECT.Corner(CORNER);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_CORNER, CORNER); //
////----------------------------------
//OBJECT.Description(TEXT);         //ObjectSetString( ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_TEXT, TEXT);
//OBJECT.Font(FONT);                //ObjectSetString( ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_FONT, FONT);
//OBJECT.FontSize(FONTSIZE);        //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_FONTSIZE, FONTSIZE);//
////----------------------------------
//OBJECT.Angle(ANGLE);              //ObjectSetDouble( ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ANGLE, ANGLE);
//OBJECT.Anchor(ANCHOR_POINT);      //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ANCHOR, ANCHOR_POINT); //
////----------------------------------
//OBJECT.Back(BACK);                //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_BACK, BACK);
//OBJECT.Selectable(SELECTABLE);    //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTABLE, SELECTABLE);
//OBJECT.Selected(SELECTED);        //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_SELECTED, SELECTED);
//OBJECT.Hidden(HIDDEN);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_HIDDEN, HIDDEN);
//OBJECT.Zorder(ZORDER);            //ObjectSetInteger(ChartData_ChartInfo.ID, OBJ.CName, OBJPROP_ZORDER, ZORDER);
//OBJECT.Tooltip(TOOLTIP);          //ObjectSetString(ChartData_ChartInfo.ID,  OBJ.CName, OBJPROP_TOOLTIP, TOOLTIP);//
//============================================================================================================38 prop
//OBJPROP_   ObjectGet() and ObjectSet() functions.             //Every graphical object in a price chart has a certain set of properties.
//-0x00-const long              chart_ID      = 0,                    // chart's ID
//-0x01-const string            name          = "Button",             // button name
//-0x02-const int               sub_window    = 0,                    // subwindow index
//-0x03-const int               x             = 0,                    // X coordinate
//-0x04-const int               y             = 0,                    // Y coordinate
//-0x05-const int               width         = 50,                   // button width
//-0x06-const int               height        = 18,                   // button height
//-0x07-const ENUM_BASE_CORNER  corner        = CORNER_LEFT_UPPER,    // chart corner for anchoring
//-0x08-const string            text          = "Button",             // text
//-0x09-const string            font          = "Arial",              // font
//-0x0A-const int               font_size     = 10,                   // font size
//-0x0B-const color             clr           = clrBlack,             // text color
//-0x0C-const color             back_clr      = C'236,233,216',       // background color
//-0x0D-const color             border_clr    = clrNONE,              // border color
//-0x0E-const ENUM_BORDER_TYPE  border        = BORDER_SUNKEN,        // border type
//-0x0F-const ENUM_LINE_STYLE   style         = STYLE_SOLID,          // border line style
//-0x10-const bool              state         = false,                // pressed/released
//-0x11-const bool              back          = false,                // in the background
//-0x12-const bool              selection     = false,                // highlight to move
//-0x13-const bool              hidden        = true,                 // hidden in the object list
//-0x14-const long              z_order       = 0,                    // priority for mouse click
//-0x15-const string            tooltip       = "\n"                  // Mose cover object show description for object  A tooltip can be disabled by setting the "\n" (line feed) value to it
//============================================================================================================================================
