//+------------------------------------------------------------------+
//|                                   Material i Complex Struct.mqh  |===Model====== Data Logic Members
//|                       Copyright © 2020-2022, Oprymhdv@Gmail.com  |===View======= Functions Set Get
//|                                        Email: @prymhdvgmail.com  |===Contrler=== Function Handel Request
//|                                        HTTPS: www.Oprymhdv.com   |
//+------------------------------------------------------------------+
struct Sg_ChartData_ChartInfo
{         //-------------------------------
          long                ID;  //--get from  'Mql.Data.ChartID_Current'
          ENUM_TIMEFRAMES     Timeframe;
          int                 SubWindow;                //ChartData_ChartInfo.SubWindow
          int                 BarShift;
          //-------------------------------
          datetime            DayStart;
          datetime            Last_Time;
          datetime            TimeLast;
          double              PriceClose20;
          //==================================
          bool                IsTrackingMouse;// = ChartGetInteger(0, CHART_EVENT_MOUSE_MOVE);
          //==================================

}; Sg_ChartData_ChartInfo ChartData_ChartInfo;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sg_ChartData_ChartFrame
{
public://///for PanelX
          //-------------------------------------------------------------------------------------------------
          int                   ChartMiddleX() { return((int)ChartGetInteger(0, CHART_WIDTH_IN_PIXELS) / 2);}
          int                   ChartMiddleY() { return((int)ChartGetInteger(0, CHART_HEIGHT_IN_PIXELS) / 2);}
          //-------------------------------------------------------------------------------------------------
          long                  HeightPixel ;          // = ChartGetInteger(0, CHART_HEIGHT_IN_PIXELS, 0);
          long                  WidthPixel ;           // = ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0);
          int                   HeightYOnDropped;      // = WindowYOnDropped();
          int                   WeightYOnDropped;      // = WindowYOnDropped();
          bool                  PixelGet()
          {         //
                    HeightPixel           = ChartGetInteger(0, CHART_HEIGHT_IN_PIXELS, 0);
                    WidthPixel            = ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0); //
                    HeightYOnDropped      = WindowYOnDropped();
                    WeightYOnDropped      = WindowYOnDropped();
                    return true;//
          } //
          //-------------------------------------------------------------------------------------------------

}; Sg_ChartData_ChartFrame ChartData_ChartFrame;
struct Sg_ChartTimePriceToXY
{         long           chart_id;     // Chart ID
          int            sub_window;   // The number of the subwindow
          datetime       time;         // Time on the chart
          double         price;        // Price on the chart
          int            x;            // The X coordinate for the time on the chart
          int            y;             // The Y coordinates for the price on the chart
};
struct Sg_ChartScreenShot
{         long             chart_id;                   // Chart ID
          string           filename;                   // Symbol name
          int              width;                      // Width
          int              height;                     // Height
          ENUM_ALIGN_MODE  align_mod;//=ALIGN_RIGHT      // Alignment type
};
struct Sg_WindowScreenShot
{         string           filename;            // file name
          int              size_x;              // width
          int              size_y;              // height
          int              start_bar;   //=-1,  // first visible bar
          int              chart_scale; //=-1,  // scale
          int              chart_mode;  //=-1   // mode
};

struct Sg_MqlChartWindowFunctionData
{         //
          bool                          IsChartApplyTemplate;           // bool                 ChartApplyTemplate( long chart_id, const string  Template_filename );
          bool                          IsChartSaveTemplate;            // bool                 ChartSaveTemplate( long chart_id, const string  save_template_filename );
          int                           ChartWindowFind_int;            // int                  ChartWindowFind();
          int                           ChartWindowFind_Indicator_int;  // int                  ChartWindowFind( long chart_id, string indicator_shortname );
          bool                          IsChartTimePriceToXY;           // bool                 ChartTimePriceToXY( long chart_id, int sub_window, datetime time, double price, int& x, int& y );
          Sg_ChartTimePriceToXY         ChartTimePriceToXY_;
          bool                          IsChartXYToTimePrice;           // bool                 ChartXYToTimePrice( long chart_id, int x, int y, int& sub_window, datetime& time, double& price );
          //
          long                          ChartID_Opened;                 // long                 ChartOpen( string symbol, ENUM_TIMEFRAMES period );
          long                          ChartID_First;                  // long                 ChartFirst();
          long                          ChartID_Next;                   // long                 ChartNext( long  chart_id  );
          //
          long                          ChartID_Close;                  // bool                 ChartClose( long  chart_id=0 );
          bool                          IsChartID_Close;                // bool                 ChartClose( long  chart_id=0 );
          string                        CurrentChartSymbol;             // string               ChartSymbol( long  chart_id=0 );
          ENUM_TIMEFRAMES               CurrentChartPeriod;             // ENUM_TIMEFRAMES      ChartPeriod( long  chart_id=0 );
          bool                          IsChartRedraw;                  // void                 ChartRedraw( long  chart_id=0 );
          //---Get
          bool                          IsChartSetDouble;               // bool                 ChartSetDouble( long chart_id, int prop_id, double  value );
          bool                          IsChartSetInteger;              // bool                 ChartSetInteger( long chart_id, int prop_id, long value );
          bool                          IsChartSetInteger_Sub;          // bool                 ChartSetInteger( long chart_id, int prop_id, uint sub_window,long value );
          bool                          IsChartSetString;               // bool                 ChartSetString( long chart_id, int prop_id, string str_value );
          //---Set
          double                        ChartGetDouble_Double;          // double               ChartGetDouble( long  chart_id, int prop_id, int sub_window=0 );
          bool                          IsChartGetDouble;               // bool                 ChartGetDouble( long chart_id, int prop_id, int sub_window, double& double_var );
          //
          long                          ChartGetInteger_long;           // long                 ChartGetInteger( long  chart_id, int prop_id, int   sub_window = 0 );
          bool                          IsChartGetInteger;              // bool                 ChartGetInteger( long chart_id, int prop_id, int sub_window, long& long_var );
          //
          string                        ChartGetString_string;          // string               ChartGetString( long  chart_id, int   prop_id );
          bool                          IsChartGetString;               // bool                 ChartGetString( long chart_id, int prop_id, string& string_var );
          //
          bool                          IsChartNavigate;                // bool                 ChartNavigate( long  chart_id, int   position, int shift=0 );
          long                          ChartID_Current;                // long                 ChartID();
          //
          bool                          IsChartIndicatorDelete;         // bool                 ChartIndicatorDelete( long chart_id, int sub_window, const string indicator_shortname );
          string                        ChartIndicatorName_string;      // string               ChartIndicatorName( long  chart_id, int   sub_window, int   index_list_indicators_added );
          int                           ChartIndicatorsTotal_int;       // int                  ChartIndicatorsTotal( long  chart_id, int sub_window );
          int                           ChartWindowOnDropped_int;       // int                  ChartWindowOnDropped();
          double                        ChartPriceOnDropped_double;     // double               ChartPriceOnDropped();
          int                           ChartXOnDropped_int;            // int                  ChartXOnDropped();
          int                           ChartYOnDropped_int;            // int                  ChartYOnDropped();
          bool                          IsChartSetSymbolPeriod;         // bool                 ChartSetSymbolPeriod( long chart_id, string symbol, ENUM_TIMEFRAMES  period );
          bool                          IsChartScreenShot;              // bool                 ChartScreenShot( long chart_id, string filename, int width, int height, ENUM_ALIGN_MODE  align_mode=ALIGN_RIGHT );
          Sg_ChartScreenShot            ChartScreenShot_;
          int                           Period_int;                     // int                  Period();
          string                        Symbol_string;                  // string               Symbol();
          //==============================================================================================
          int                           WindowBarsPerChart_int;         // int                  WindowBarsPerChart();
          string                        WindowExpertName_string;        // string               WindowExpertName();
          int                           WindowFind_int;                 // int                  WindowFind( string name );
          int                           WindowFirstVisibleBar_int;      // int                  WindowFirstVisibleBar();
          int                           WindowHandle_int;               // int                  WindowHandle( string symbol, int timeframe );
          int                           WindowIsVisible_int;            // int                  WindowIsVisible( int index_subwindow  );
          int                           WindowOnDropped_int;            // int                  WindowOnDropped();
          double                        WindowPriceMax_double;          // double                  WindowPriceMax( int index_subwindow=0 // subwindow );
          double                        WindowPriceMin_double;          // double                  WindowPriceMin( int index_subwindow=0   // subwindow    );
          double                        WindowPriceOnDropped_double;    // double               WindowPriceOnDropped();
          bool                          IsWindowRedraw;                 // bool                 WindowRedraw();
          bool                          IsWindowScreenShot;             // bool                 WindowScreenShot( string filename, int size_x, int size_y, int start_bar = -1, int chart_scale = -1, int chart_mode = -1 // mode);
          Sg_WindowScreenShot           WindowScreenShot_;
          datetime                      WindowTimeOnDropped_datetime;   // datetime             WindowTimeOnDropped();
          int                           WindowsTotal_int;               // int                  WindowsTotal();
          int                           WindowXOnDropped_int;           // int                  WindowXOnDropped();
          int                           WindowYOnDropped_int;           // int                  WindowYOnDropped();
          //
          //=========================================================
          //    Extention data
          //=========================================================
          int                           WindowFind_int_MACD_12_26_9;                 //int                   WindowFind( string name );

          //=========================================================
          //int            WNBarsPerChart;
          //string         WNExpertName;
          //int            WNIndex_MACD_12_26_9;
          //int            FirstVisibleBar;
          //int            WNHandleIndex;
          //string         WNSymbol;
          //int            WNTimeframe;
          //bool           Is_WNIsVisible;
          //int            WNIsVisibleIndex;
          //int            WNOnDroppedIndex;
          //double         WNPriceMaxTop;
          //double         WNPriceMaxbottom;
          //double         WNPriceOnDropped;
          //bool           Is_WNRedraw;
          //bool           Is_WNScreenShot;                  //=== bool   WindowScreenShot( string filename, int size_x, int size_y, int start_bar=-1, int chart_scale=-1, int chart_mode=-1 );
          //string         ScreenShotFileName;
          //int            ScreenShotWidthPixel;             //Screen shot width in pixels.
          //int            ScreenShotHeightPixel;
          //int            ScreenShotChart_Scale;
          //int            ScreenShotChart_Mode;
          ////CHART_Current (-1 is a sequence of Current),
          ////CHART_BAR (0 is a sequence of bars),
          ////CHART_CANDLE(1 is a sequence of candlesticks),
          ////CHART_LINE (2 is a close prices line).
          //datetime       WNTimeOnDropped;
          //int            WNTotal;
          //int            WNXOnDropped;
          //int            WNYOnDropped;
          //=================================================================
          //
};
struct Sg_MqlChartWindowPropertyData
{

//+-----------------------------------------------------------------------------------------------------------------------------------------------------------+
          //|   ENUM_CHART_PROPERTY_INTEGER             For functions ChartSetInteger() and ChartGetInteger()                                                           |
          //+-----------------------------------------------------------------------------------------------------------------------------------------------------------+
          //ID                                                          Description                                                                     Property Type
          bool                          IsCHART_BRING_TO_TOP_bool;        // Show chart on top of other charts                                            bool   w/o
          bool                          IsCHART_MOUSE_SCROLL_bool;
          // Scrolling the chart horizontally using the left mouse button.
          // Vertical scrolling is also available if the value of any following properties is set to true:
          // CHART_SCALEFIX, CHART_SCALEFIX_11 or CHART_SCALE_PT_PER_BAR                                                                                bool

          bool                          IsCHART_EVENT_MOUSE_MOVE_bool;    // Send notifications of mouse move and mouse click events (CHARTEVENT_MOUSE_MOVE) to all mql4 programs on a chart         bool
          bool                          IsCHART_EVENT_OBJECT_CREATE_bool; // Send a notification of an event of new object creation (CHARTEVENT_OBJECT_CREATE) to all mql4-programs on a chart       bool
          bool                          IsCHART_EVENT_OBJECT_DELETE_bool; // Send a notification of an event of object deletion (CHARTEVENT_OBJECT_DELETE) to all mql4-programs on a chart           bool
          ENUM_CHART_MODE               CHART_MODE_ENUM;                      // Chart type (candlesticks, bars or line)                                      enum    ENUM_CHART_MODE
          bool                          IsCHART_FOREGROUND_bool;         // Price chart in the foreground                                                        bool
          bool                          IsCHART_SHIFT_bool;       // Mode of price chart indent from the right border                                     bool
          bool                          IsCHART_AUTOSCROLL_bool;  // Mode of automatic moving to the right border of the chart                            bool

          bool                          IsCHART_QUICK_NAVIGATION_bool;
          // Allow the chart to intercept Space and Enter key strokes to activate the quick navigation bar.
          // The quick navigation bar automatically appears at the bottom of the chart after double-clicking
          // the mouse or pressing Space/Enter. It allows you to quickly change a symbol,
          // timeframe and first visible bar date.                                                                                                      bool
          int                           CHART_SCALE_int;                //Scale                                                                         int        from 0 to 5
          bool                          IsCHART_SCALEFIX_bool;            //Fixed scale mode                                                              bool
          bool                          IsCHART_SCALEFIX_11_bool;         //Scale 1:1 mode                                                                bool
          long                          IsCHART_SCALE_PT_PER_BAR_bool;    //Scale to be specified in points per bar                                       bool !!
          bool                          IsCHART_SHOW_OHLC_bool;           //Show OHLC values in the upper left corner                                     bool
          bool                          IsCHART_SHOW_BID_LINE_bool;       //Display Bid values as a horizontal line in a chart                            bool
          bool                          IsCHART_SHOW_ASK_LINE_bool;       //Display Ask values as a horizontal line in a chart                            bool
          bool                          IsCHART_SHOW_LAST_LINE_bool;      //Display Last values as a horizontal line in a chart                           bool
          bool                          IsCHART_SHOW_PERIOD_SEP_bool;     //Display vertical separators between adjacent periods                          bool
          bool                          IsCHART_SHOW_GRID_bool;           //Display grid in the chart                                                     bool
          ENUM_CHART_VOLUME_MODE        CHART_SHOW_VOLUMES_int;         //Display volume in the chart                                                   enum     ENUM_CHART_VOLUME_MODE
          bool                          IsCHART_SHOW_OBJECT_DESCR_bool;   //Display textual descriptions of objects (not available for all objects)       bool
          int                           CHART_VISIBLE_BARS_int;         //The number of bars on the chart that can be displayed                         int r/o
          int                           CHART_WINDOWS_TOTAL_int;        //The total number of chart windows, including indicator subwindows             int r/o
          bool                          IsCHART_WINDOW_IS_VISIBLE_bool;   //Visibility of subwindows                                                      bool r/o   modifier - subwindow number
          int                           CHART_WINDOW_HANDLE_int;        //Chart window handle (HWND)                                                    int r/o
          int                           CHART_WINDOW_YDISTANCE_int;
          //The distance between the upper frame of the indicator subwindow and the upper frame of the main chart window,
          //along the vertical Y axis, in pixels. In case of a mouse event, the cursor coordinates are passed in terms
          //of the coordinates of the main chart window, while the coordinates of graphical objects in an indicator
          //subwindow are set relative to the upper left corner of the subwindow.
          //The value is required for converting the absolute coordinates of the main chart to the local coordinates
          //of a subwindow for correct work with the graphical objects, whose coordinates are set relative to
          //the upper left corner of the subwindow frame.                                                                                                               int r/o     modifier - subwindow number

          int           CHART_FIRST_VISIBLE_BAR_int;    //Number of the first visible bar in the chart. Indexing of bars is the same as for timeseries.                 int r/o
          int           CHART_WIDTH_IN_BARS_int;        //Chart width in bars                                                                                           int r/o
          int           CHART_WIDTH_IN_PIXELS_int;      //Chart width in pixels                                                                                         int r/o
          int           CHART_HEIGHT_IN_PIXELS_int;     //Chart height in pixels                                                                                        int      modifier - subwindow number
          color         CHART_COLOR_BACKGROUND_color;   //Chart background color                                                                                        color
          color         CHART_COLOR_FOREGROUND_color;   //Color of axes, scales and OHLC line                                                                           color
          color         CHART_COLOR_GRID_color;         //Grid color                                                                                                    color
          color         CHART_COLOR_VOLUME_color;       //Color of volumes and order opening levels                                                                     color
          color         CHART_COLOR_CHART_UP_color;     //Color for the up bar, shadows and body borders of bull candlesticks                                           color
          color         CHART_COLOR_CHART_DOWN_color;   //Color for the down bar, shadows and body borders of bear candlesticks                                         color
          color         CHART_COLOR_CHART_LINE_color;   //Line chart color and color of "Doji" Japanese candlesticks                                                    color
          color         CHART_COLOR_CANDLE_BULL_color;  //Body color of a bull candlestick                                                                              color
          color         CHART_COLOR_CANDLE_BEAR_color;  //Body color of a bear candlestick                                                                              color
          color         CHART_COLOR_BID_color;          //Bid price level color                                                                                         color
          color         CHART_COLOR_ASK_color;          //Ask price level color                                                                                         color
          color         CHART_COLOR_LAST_color;         //Line color of the last executed deal price (Last)                                                             color
          color         CHART_COLOR_STOP_LEVEL_color;   //Color of stop order levels (Stop Loss and Take Profit)                                                        color
          bool          IsCHART_SHOW_TRADE_LEVELS_bool; //Displaying trade levels in the chart (levels of open orders, Stop Loss, Take Profit and pending orders)       bool
          bool          IsCHART_DRAG_TRADE_LEVELS_bool; //Permission to drag trading levels on a chart with a mouse. The drag mode is enabled by default (true value)   bool
          bool          IsCHART_SHOW_DATE_SCALE_bool;   //Showing the time scale on a chart                                                                             bool
          bool          IsCHART_SHOW_PRICE_SCALE_bool;  //Showing the price scale on a chart                                                                            bool
          bool          IsCHART_IS_OFFLINE_bool;        //Flag, indicating that chart opened in offline mode                                                            bool   r/o
          //+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
          //|  ENUM_CHART_PROPERTY_DOUBLE     For functions ChartSetDouble() and ChartGetDouble()                                                                                  |
          //+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
          //ID                                          Description                                                                             Property Type
          double        CHART_SHIFT_SIZE_double;        // The size of the zero bar indent from the right border in percents  double  (from 10 to 50 percents)
          double        CHART_FIXED_POSITION_double;    // Chart fixed position from the left border in percent value.
          // Chart fixed position is marked by a small gray triangle on the horizontal time axis.
          // It is displayed only if the automatic chart scrolling to the right on tick incoming
          // is disabled (see CHART_AUTOSCROLL property).
          // The bar on a fixed position remains in the same place when zooming in and out.       double

          double        CHART_FIXED_MAX_double;          // Fixed  chart maximum                                                                double
          double        CHART_FIXED_MIN_double;          // Fixed  chart minimum                                                                double
          double        CHART_POINTS_PER_BAR_double;     // Scale in points per bar                                                             double
          double        CHART_PRICE_MIN_double;          // Chart minimum                                                                       double r/o       modifier - subwindow number
          double        CHART_PRICE_MAX_double;          // Chart maximum                                                                       double r/o       modifier - subwindow number

          //+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
          //|  ENUM_CHART_PROPERTY_STRING     For functions ChartSetString() and ChartGetString()                                                                                  |
          //+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
          //ID                                  Description                             Property Type
          string        CHART_COMMENT_string;    // Text of a comment in a chart    string
          //================================================================================================================================================



};
struct Sg_MqlChartWindow
{         /*
                  Chart Operations
                  These are functions for working with charts. All chart operations are allowed in Expert Advisors and scripts only.
                  The functions defining the chart properties are actually used for sending change commands to the chart.
                  If these functions are executed successfully, the command is included in the common queue of the chart events.
                  The changes are implemented to the chart when handling the queue of the chart events.

                  Thus, do not expect an immediate visual update of the chart after calling these functions.
                  Generally, the chart is updated automatically by the terminal following the change events - a new quote arrival,
                  resizing the chart window, etc. Use ChartRedraw() function to forcefully update the chart.
                  * ================================================================================================================================================
                  Function                              Action
                  ChartApplyTemplate                    Applies a specific template from a specified file to the chart
                  ChartSaveTemplate                     Saves current chart settings in a template with a specified name
                  ChartWindowFind                       Returns the number of a subwindow where an indicator is drawn
                  ChartTimePriceToXY                    Converts the coordinates of a chart from the time/price representation to the X and Y coordinates
                  ChartXYToTimePrice                    Converts the X and Y coordinates on a chart to the time and price values
                  ChartOpen                             Opens a new chart with the specified symbol and period
                  ChartFirst                            Returns the ID of the first chart of the client terminal
                  ChartNext                             Returns the chart ID of the chart next to the specified one
                  ChartClose                            Closes the specified chart
                  ChartSymbol                           Returns the symbol name of the specified chart
                  ChartPeriod                           Returns the period value of the specified chart
                  ChartRedraw                           Calls a forced redrawing of a specified chart
                  ChartSetDouble                        Sets the double value for a corresponding property of the specified chart
                  ChartSetInteger                       Sets the integer value (datetime, int, color, bool or char) for a corresponding property of the specified chart
                  ChartSetString                        Sets the string value for a corresponding property of the specified chart
                  ChartGetDouble                        Returns the double value property of the specified chart
                  ChartGetInteger                       Returns the integer value property of the specified chart
                  ChartGetString                        Returns the string value property of the specified chart
                  ChartNavigate                         Performs shift of the specified chart by the specified number of bars relative to the specified position in the chart
                  ChartID                               Returns the ID of the current chart
                  ChartIndicatorDelete                  Removes an indicator with a specified name from the specified chart window
                  ChartIndicatorName                    Returns the short name of the indicator by the number in the indicators list on the specified chart window
                  ChartIndicatorsTotal                  Returns the number of all indicators applied to the specified chart window.
                  ChartWindowOnDropped                  Returns the number (index) of the chart subwindow the Expert Advisor or script has been dropped to
                  ChartPriceOnDropped                   Returns the price coordinate of the chart point the Expert Advisor or script has been dropped to
                  ChartTimeOnDropped                    Returns the time coordinate of the chart point the Expert Advisor or script has been dropped to
                  ChartXOnDropped                       Returns the X coordinate of the chart point the Expert Advisor or script has been dropped to
                  ChartYOnDropped                       Returns the Y coordinate of the chart point the Expert Advisor or script has been dropped to
                  ChartSetSymbolPeriod                  Changes the symbol value and a period of the specified chart
                  ChartScreenShot                       Provides a screenshot of the chart of its current state in a gif format
                  Period                                Returns timeframe of the current chart
                  Symbol                                Returns a text string with the name of the current financial instrument
                  WindowBarsPerChart                    Returns the amount of bars visible on the chart
                  WindowExpertName                      Returns the name of the executed Expert Advisor, script, custom indicator, or library
                  WindowFind                            Returns the window index containing this specified indicator
                  WindowFirstVisibleBar                 Returns index of the first visible bar in the current chart window
                  WindowHandle                          Returns the system handle of the chart window
                  WindowIsVisible                       Returns the visibility flag of the chart subwindow
                  WindowOnDropped                       Returns the window index where Expert Advisor, custom indicator or script was dropped
                  WindowPriceMax                        Returns the maximal value of the vertical scale of the specified subwindow of the current chart
                  WindowPriceMin                        Returns the minimal value of the vertical scale of the specified subwindow of the current chart
                  WindowPriceOnDropped                  Returns the price of the chart point where Expert Advisor or script was dropped
                  WindowRedraw                          Redraws the current chart forcedly
                  WindowScreenShot                      Saves current chart screen shot as a GIF, PNG or BMP file depending on specified extension
                  WindowTimeOnDropped                   Returns the time of the chart point where Expert Advisor or script was dropped
                  WindowsTotal                          Returns total number of indicator windows on the chart
                  WindowXOnDropped                      Returns the value at X axis in pixels for the chart window client area point at which the Expert Advisor or script was dropped
                  WindowYOnDropped                      Returns the value at Y axis in pixels for the chart window client area point at which the Expert Advisor or script was dropped
                  * ================================================================================================================================================
                  //+------------------------------------------------------------------+
                  //|     ChartSetInteger     ChartSetDouble       ChartSetString      |
                  //+------------------------------------------------------------------+
                  MQL4 Reference  /  Constants, Enumerations and Structures  /  Chart Constants / Chart Properties  ???????????
                  Chart Properties
                  Identifiers of ENUM_CHART_PROPERTY enumerations are used as parameters of functions for working with charts.
                  The abbreviation of r/o in the "Property Type" column means that this property is read-only and cannot be changed.
                  The w/o abbreviation in the "Property Type" column means that this property is write-only and it cannot be received.
                  When accessing certain properties, it's necessary to specify an additional parameter-modifier (modifier),
                  which serves to indicate the number of chart subwindows. 0 means the main window.
                  //+-----------------------------------------------------------------------------------------------------------------------------------------------------------+
                  //|   ENUM_CHART_PROPERTY_INTEGER             For functions ChartSetInteger() and ChartGetInteger()                                                           |
                  //+-----------------------------------------------------------------------------------------------------------------------------------------------------------+
                  ID                    Description                                                                                                                     Property Type
                  CHART_BRING_TO_TOP    Show chart on top of other charts                                                                                               bool   w/o
                  CHART_MOUSE_SCROLL    Scrolling the chart horizontally using the left mouse button.
                                        Vertical scrolling is also available if the value of any following properties is set to true:
                                        CHART_SCALEFIX, CHART_SCALEFIX_11 or CHART_SCALE_PT_PER_BAR                                                                     bool

                  CHART_EVENT_MOUSE_MOVE        Send notifications of mouse move and mouse click events (CHARTEVENT_MOUSE_MOVE) to all mql4 programs on a chart         bool
                  CHART_EVENT_OBJECT_CREATE     Send a notification of an event of new object creation (CHARTEVENT_OBJECT_CREATE) to all mql4-programs on a chart       bool
                  CHART_EVENT_OBJECT_DELETE     Send a notification of an event of object deletion (CHARTEVENT_OBJECT_DELETE) to all mql4-programs on a chart           bool
                  CHART_MODE                    Chart type (candlesticks, bars or line)    enum     ENUM_CHART_MODE
                  CHART_FOREGROUND              Price chart in the foreground                                                                                           bool
                  CHART_SHIFT                   Mode of price chart indent from the right border                                                                        bool
                  CHART_AUTOSCROLL              Mode of automatic moving to the right border of the chart                                                               bool

                  CHART_QUICK_NAVIGATION        Allow the chart to intercept Space and Enter key strokes to activate the quick navigation bar.
                                                The quick navigation bar automatically appears at the bottom of the chart after double-clicking
                                                the mouse or pressing Space/Enter. It allows you to quickly change a symbol,
                                                timeframe and first visible bar date.                                                                           bool

                  CHART_SCALE                   Scale                                                                                                           int        from 0 to 5
                  CHART_SCALEFIX                Fixed scale mode                                                                                                bool
                  CHART_SCALEFIX_11             Scale 1:1 mode                                                                                                  bool
                  CHART_SCALE_PT_PER_BAR        Scale to be specified in points per bar                                                                         bool
                  CHART_SHOW_OHLC               Show OHLC values in the upper left corner                                                                       bool
                  CHART_SHOW_BID_LINE           Display Bid values as a horizontal line in a chart                                                              bool
                  CHART_SHOW_ASK_LINE           Display Ask values as a horizontal line in a chart                                                              bool
                  CHART_SHOW_LAST_LINE          Display Last values as a horizontal line in a chart                                                             bool
                  CHART_SHOW_PERIOD_SEP         Display vertical separators between adjacent periods                                                            bool
                  CHART_SHOW_GRID               Display grid in the chart                                                                                       bool
                  CHART_SHOW_VOLUMES            Display volume in the chart                                                                                     enum     ENUM_CHART_VOLUME_MODE
                  CHART_SHOW_OBJECT_DESCR       Display textual descriptions of objects (not available for all objects)                                         bool
                  CHART_VISIBLE_BARS            The number of bars on the chart that can be displayed                                                           int r/o
                  CHART_WINDOWS_TOTAL           The total number of chart windows, including indicator subwindows                                               int r/o
                  CHART_WINDOW_IS_VISIBLE       Visibility of subwindows                                                                                        bool r/o   modifier - subwindow number
                  CHART_WINDOW_HANDLE           Chart window handle (HWND)                                                                                      int r/o

                  CHART_WINDOW_YDISTANCE        The distance between the upper frame of the indicator subwindow and the upper frame of the main chart window,
                                                along the vertical Y axis, in pixels. In case of a mouse event, the cursor coordinates are passed in terms
                                                of the coordinates of the main chart window, while the coordinates of graphical objects in an indicator
                                                subwindow are set relative to the upper left corner of the subwindow.
                                                The value is required for converting the absolute coordinates of the main chart to the local coordinates
                                                of a subwindow for correct work with the graphical objects, whose coordinates are set relative to
                                                the upper left corner of the subwindow frame.                                                                   int r/o     modifier - subwindow number

                  CHART_FIRST_VISIBLE_BAR       Number of the first visible bar in the chart. Indexing of bars is the same as for timeseries.                   int r/o
                  CHART_WIDTH_IN_BARS           Chart width in bars                                                                                             int r/o
                  CHART_WIDTH_IN_PIXELS         Chart width in pixels                                                                                           int r/o
                  CHART_HEIGHT_IN_PIXELS        Chart height in pixels                                                                                          int      modifier - subwindow number
                  CHART_COLOR_BACKGROUND        Chart background color                                                                                          color
                  CHART_COLOR_FOREGROUND        Color of axes, scales and OHLC line                                                                             color
                  CHART_COLOR_GRID              Grid color                                                                                                      color
                  CHART_COLOR_VOLUME            Color of volumes and order opening levels                                                                       color
                  CHART_COLOR_CHART_UP          Color for the up bar, shadows and body borders of bull candlesticks                                             color
                  CHART_COLOR_CHART_DOWN        Color for the down bar, shadows and body borders of bear candlesticks                                           color
                  CHART_COLOR_CHART_LINE        Line chart color and color of "Doji" Japanese candlesticks                                                      color
                  CHART_COLOR_CANDLE_BULL       Body color of a bull candlestick                                                                                color
                  CHART_COLOR_CANDLE_BEAR       Body color of a bear candlestick                                                                                color
                  CHART_COLOR_BID               Bid price level color                                                                                           color
                  CHART_COLOR_ASK               Ask price level color                                                                                           color
                  CHART_COLOR_LAST              Line color of the last executed deal price (Last)                                                               color
                  CHART_COLOR_STOP_LEVEL        Color of stop order levels (Stop Loss and Take Profit)                                                          color
                  CHART_SHOW_TRADE_LEVELS       Displaying trade levels in the chart (levels of open orders, Stop Loss, Take Profit and pending orders)         bool
                  CHART_DRAG_TRADE_LEVELS       Permission to drag trading levels on a chart with a mouse. The drag mode is enabled by default (true value)     bool
                  CHART_SHOW_DATE_SCALE         Showing the time scale on a chart                                                                               bool
                  CHART_SHOW_PRICE_SCALE        Showing the price scale on a chart                                                                              bool
                  CHART_IS_OFFLINE              Flag, indicating that chart opened in offline mode                                                              bool   r/o

                  //+-------------------------------------------------------------------------------------+
                  //|  ENUM_CHART_PROPERTY_DOUBLE     For functions ChartSetDouble() and ChartGetDouble() |
                  //+-------------------------------------------------------------------------------------+
                  ID                            Description                                                                                     Property Type
                  CHART_SHIFT_SIZE              The size of the zero bar indent from the right border in percents  double  (from 10 to 50 percents)
                  CHART_FIXED_POSITION          Chart fixed position from the left border in percent value.
                                                Chart fixed position is marked by a small gray triangle on the horizontal time axis.
                                                It is displayed only if the automatic chart scrolling to the right on tick incoming
                                                is disabled (see CHART_AUTOSCROLL property).
                                                The bar on a fixed position remains in the same place when zooming in and out.                  double

                  CHART_FIXED_MAX       Fixed  chart maximum                                                                                    double
                  CHART_FIXED_MIN       Fixed  chart minimum                                                                                    double
                  CHART_POINTS_PER_BAR  Scale in points per bar                                                                                 double
                  CHART_PRICE_MIN       Chart minimum                                                                                           double r/o       modifier - subwindow number
                  CHART_PRICE_MAX       Chart maximum                                                                                           double r/o       modifier - subwindow number

                  //+-------------------------------------------------------------------------------------+
                  //|  ENUM_CHART_PROPERTY_STRING     For functions ChartSetString() and ChartGetString() |
                  //+-------------------------------------------------------------------------------------+
                  ID                      Description                             Property Type
                  CHART_COMMENT         Text of a comment in a chart            string
                  ================================================================================================================================================
                  MQL4 Reference  /  Constants, Enumerations and Structures  /  Chart Constants / Chart Representation  ???????????
                  Chart Representation
                  Price charts can be displayed in three ways:
                  •as bars;
                  •as candlesticks;
                  •as a line.
                  //+------------------------------------------------------------------------------------------------------------------------------------------+
                  //| ENUM_CHART_MODE                                                                                                                          |
                  //|   The specific way of displaying the price chart is set by the function ChartSetInteger(chart_handle,CHART_MODE, chart_mode),            |
                  //|   where chart_mode is one of the values of the ENUM_CHART_MODE enumeration.                                                              |
                  //+------------------------------------------------------------------------------------------------------------------------------------------+
                  ID                    Description
                  CHART_BARS            Display as a sequence of bars
                  CHART_CANDLES         Display as Japanese candlesticks
                  CHART_LINE            Display as a line drawn by Close prices
                  //+------------------------------------------------------------------------------------------------------------------------------------------+
                  //|  ENUM_CHART_VOLUME_MODE                                                                                                                  |
                  //| To specify the mode of displaying volumes in the price chart the function ChartSetInteger(chart_handle, CHART_SHOW_VOLUMES, volume_mode) |
                  //| is used, where volume_mode is one of values of the ENUM_CHART_VOLUME_MODE enumeration.                                                   |
                  //+------------------------------------------------------------------------------------------------------------------------------------------+
                  ID                    Description
                  CHART_VOLUME_HIDE     Volumes are not shown
                  CHART_VOLUME_TICK     Tick volumes
                  ================================================================================================================================================
          */

public://Constructors
          void                  Sg_MqlChartWindow() { Update();};
          void                  ~Sg_MqlChartWindow() {};
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          int CHART_WIDTH_IN_PIXELS_int()  {    return PropertyData.CHART_WIDTH_IN_PIXELS_int  = (int)ChartGetInteger(ChartID(), CHART_WIDTH_IN_PIXELS, 0);}
          int CHART_HEIGHT_IN_PIXELS_int() {    return PropertyData.CHART_HEIGHT_IN_PIXELS_int = (int)ChartGetInteger(ChartID(), CHART_HEIGHT_IN_PIXELS, 0);}
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+

          Sg_MqlChartWindowFunctionData         FunctionData;
          Sg_MqlChartWindowPropertyData         PropertyData;
          bool                  Update()
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "- Error",  __LINE__, __FUNCTION__); //|
                    if(!Initer.IsBasic_Done) {return false;}
                    {         FunctionData.ChartID_Current                = ChartID();
                              FunctionData.Symbol_string                  = Symbol();
                              FunctionData.Period_int                     = Period();
                              //==================================================
                              FunctionData.WindowBarsPerChart_int         = WindowBarsPerChart();                 //Returns the amount of bars visible on the chart                                                 ===int    WindowBarsPerChart();
                              FunctionData.WindowExpertName_string        = WindowExpertName();   //Returns the name of the executed Expert Advisor, script, custom indicator, or library           ===string WindowExpertName();
                              ///=================================================
                              FunctionData.WindowFind_int_MACD_12_26_9    = WindowFind("MACD(12,26,9)");          //Returns the window index containing this "specified indicator"                                  ===int    WindowFind( string name ); int win_idx=WindowFind("MACD(12,26,9)");
                              FunctionData.WindowFirstVisibleBar_int      = WindowFirstVisibleBar();              //Returns index of the first visible bar in the current chart window                              ===int    WindowFirstVisibleBar();
                              FunctionData.WindowHandle_int               = WindowHandle(FunctionData.Symbol_string, FunctionData.Period_int);  //Returns the system handle of the chart window                                                   ===int    WindowHandle( string symbol, int timeframe );
                              FunctionData.WindowIsVisible_int            = WindowIsVisible(FunctionData.WindowFind_int_MACD_12_26_9);  // x>-1  //Returns the visibility flag of the chart subwindow                                              ===int    WindowIsVisible( int index /* subwindow */  );
                              FunctionData.WindowOnDropped_int            = WindowOnDropped();                    //Returns the window index where Expert Advisor, custom indicator or script was dropped           ===int        WindowOnDropped();
                              FunctionData.WindowPriceMax_double          = WindowPriceMax();     //Returns the maximal value of the vertical scale of the specified subwindow of the current chart ===int        WindowPriceMax( int index=0 /* subwindow */ );
                              FunctionData.WindowPriceMin_double          = WindowPriceMin();     //Returns the minimal value of the vertical scale of the specified subwindow of the current chart ===int        WindowPriceMin( int index=0 /* subwindow */ );
                              FunctionData.WindowPriceOnDropped_double    = WindowPriceOnDropped();               //Returns the price of the chart point where Expert Advisor or script was dropped                 ===double     WindowPriceOnDropped();
                              FunctionData.IsWindowRedraw                 = _WindowRedraw(true);                    //Redraws the current chart forcedly                                                              ===void       WindowRedraw();
                              FunctionData.IsWindowScreenShot             = _WindowScreenShot(false, FunctionData.WindowScreenShot_);
                              FunctionData.WindowTimeOnDropped_datetime   = WindowTimeOnDropped();                //Returns the time of the chart point where Expert Advisor or script was dropped                  ===datetime  WindowTimeOnDropped();
                              FunctionData.WindowsTotal_int               = WindowsTotal();                       //Returns total number of indicator windows on the chart                                                          ===int  WindowsTotal();
                              FunctionData.WindowXOnDropped_int           = WindowXOnDropped();                   //Returns the value at X axis in pixels for the chart window client area point at which the Expert Advisor or script was dropped  ===int  WindowXOnDropped();
                              FunctionData.WindowYOnDropped_int           = WindowYOnDropped();                   //Returns the value at Y axis in pixels for the chart window client area point at which the Expert Advisor or script was dropped  ===int  WindowYOnDropped();
                    }
                    {         //         //+-------------------------------------------------------------------------------+
                              //          //|       ENUM_CHART_PROPERTY_INTEGER     ChartSetInteger and ChartGetInteger()   |
                              //          //+-------------------------------------------------------------------------------+
                              //          bool      IsGet_IsCHART_BRING_TO_TOP_bool           = ChartGetInteger(ChartID(), CHART_BRING_TO_TOP,              ChartData_ChartInfo.SubWindow, PropertyData.IsCHART_BRING_TO_TOP_bool);
                              //          bool      IsGet_IsCHART_MOUSE_SCROLL_bool           = ChartGetInteger(ChartID(), CHART_MOUSE_SCROLL,              ChartData_ChartInfo.SubWindow, PropertyData.IsCHART_MOUSE_SCROLL_bool);
                              //          bool      IsGet_IsCHART_EVENT_MOUSE_MOVE_bool       = ChartGetInteger(ChartID(), CHART_EVENT_MOUSE_MOVE,          PropertyData.IsCHART_EVENT_MOUSE_MOVE_bool);
                              //          bool      IsGet_IsCHART_EVENT_OBJECT_CREATE_bool    = ChartGetInteger(ChartID(), CHART_EVENT_OBJECT_CREATE,       PropertyData.IsCHART_EVENT_OBJECT_CREATE_bool);
                              //          bool      IsGet_IsCHART_EVENT_OBJECT_DELETE_bool    = ChartGetInteger(ChartID(), CHART_EVENT_OBJECT_DELETE,       PropertyData.IsCHART_EVENT_OBJECT_DELETE_bool);
                              //          bool      IsGet_CHART_MODE_ENUM                     = ChartGetInteger(ChartID(), CHART_MODE,                      PropertyData.CHART_MODE_ENUM);
                              //          bool      IsGet_IsCHART_FOREGROUND_bool             = ChartGetInteger(ChartID(), CHART_FOREGROUND,                PropertyData.IsCHART_FOREGROUND_bool);
                              //          bool      IsGet_IsCHART_SHIFT_bool                  = ChartGetInteger(ChartID(), CHART_SHIFT,                     PropertyData.IsCHART_SHIFT_bool);
                              //          bool      IsGet_IsCHART_AUTOSCROLL_bool             = ChartGetInteger(ChartID(), CHART_AUTOSCROLL,                PropertyData.IsCHART_AUTOSCROLL_bool);
                              //          bool      IsGet_IsCHART_QUICK_NAVIGATION_bool       = ChartGetInteger(ChartID(), CHART_QUICK_NAVIGATION,          PropertyData.IsCHART_QUICK_NAVIGATION_bool);
                              //          bool      IsGet_CHART_SCALE_int                     = ChartGetInteger(ChartID(), CHART_SCALE,                     PropertyData.CHART_SCALE_int);
                              //          bool      IsGet_IsCHART_SCALEFIX_bool               = ChartGetInteger(ChartID(), CHART_SCALEFIX,                  PropertyData.IsCHART_SCALEFIX_bool);
                              //          bool      IsGet_IsCHART_SCALEFIX_11_bool            = ChartGetInteger(ChartID(), CHART_SCALEFIX_11,               PropertyData.IsCHART_SCALEFIX_11_bool);
                              //          bool      IsGet_IsCHART_SCALE_PT_PER_BAR_bool       = ChartGetInteger(ChartID(), CHART_SCALE_PT_PER_BAR,          PropertyData.IsCHART_SCALE_PT_PER_BAR_bool);
                              //          bool      IsGet_IsCHART_SHOW_OHLC_bool              = ChartGetInteger(ChartID(), CHART_SHOW_OHLC,                 PropertyData.IsCHART_SHOW_OHLC_bool);
                              //          bool      IsGet_IsCHART_SHOW_BID_LINE_bool          = ChartGetInteger(ChartID(), CHART_SHOW_BID_LINE,             PropertyData.IsCHART_SHOW_BID_LINE_bool);
                              //          bool      IsGet_IsCHART_SHOW_ASK_LINE_bool          = ChartGetInteger(ChartID(), CHART_SHOW_ASK_LINE,             PropertyData.IsCHART_SHOW_ASK_LINE_bool);
                              //          bool      IsGet_IsCHART_SHOW_LAST_LINE_bool         = ChartGetInteger(ChartID(), CHART_SHOW_LAST_LINE,            PropertyData.IsCHART_SHOW_LAST_LINE_bool);
                              //          bool      IsGet_IsCHART_SHOW_PERIOD_SEP_bool        = ChartGetInteger(ChartID(), CHART_SHOW_PERIOD_SEP,           PropertyData.IsCHART_SHOW_PERIOD_SEP_bool);
                              //          bool      IsGet_IsCHART_SHOW_GRID_bool              = ChartGetInteger(ChartID(), CHART_SHOW_GRID,                 PropertyData.IsCHART_SHOW_GRID_bool);
                              //          bool      IsGet_CHART_SHOW_VOLUMES_int            = ChartGetInteger(ChartID(), CHART_SHOW_VOLUMES,                PropertyData.CHART_SHOW_VOLUMES_int);
                              //          bool      IsGet_IsCHART_SHOW_OBJECT_DESCR_bool      = ChartGetInteger(ChartID(), CHART_SHOW_OBJECT_DESCR,         PropertyData.IsCHART_SHOW_OBJECT_DESCR_bool);
                              //          bool      IsGet_CHART_VISIBLE_BARS_int            = ChartGetInteger(ChartID(), CHART_VISIBLE_BARS,                PropertyData.CHART_VISIBLE_BARS_int);
                              //          bool      IsGet_CHART_WINDOWS_TOTAL_int           = ChartGetInteger(ChartID(), CHART_WINDOWS_TOTAL,               PropertyData.CHART_WINDOWS_TOTAL_int);
                              //          bool      IsGet_IsCHART_WINDOW_IS_VISIBLE_bool      = ChartGetInteger(ChartID(), CHART_WINDOW_IS_VISIBLE,         PropertyData.IsCHART_WINDOW_IS_VISIBLE_bool);
                              //          bool      IsGet_CHART_WINDOW_HANDLE_int           = ChartGetInteger(ChartID(), CHART_WINDOW_HANDLE,               PropertyData.CHART_WINDOW_HANDLE_int);
                              //          bool      IsGet_CHART_WINDOW_YDISTANCE_int        = ChartGetInteger(ChartID(), CHART_WINDOW_YDISTANCE,            PropertyData.CHART_WINDOW_YDISTANCE_int);
                              //          bool      IsGet_CHART_FIRST_VISIBLE_BAR_int       = ChartGetInteger(ChartID(), CHART_FIRST_VISIBLE_BAR,           PropertyData.CHART_FIRST_VISIBLE_BAR_int);
                              //          bool      IsGet_CHART_WIDTH_IN_BARS_int           = ChartGetInteger(ChartID(), CHART_WIDTH_IN_BARS,               PropertyData.CHART_WIDTH_IN_BARS_int);
                              //          bool      IsGet_CHART_WIDTH_IN_PIXELS_int         = ChartGetInteger(ChartID(), CHART_WIDTH_IN_PIXELS,             PropertyData.CHART_WIDTH_IN_PIXELS_int);
                              //          bool      IsGet_CHART_HEIGHT_IN_PIXELS_int        = ChartGetInteger(ChartID(), CHART_HEIGHT_IN_PIXELS,            PropertyData.CHART_HEIGHT_IN_PIXELS_int);
                              //          bool      IsGet_CHART_COLOR_BACKGROUND_color      = ChartGetInteger(ChartID(), CHART_COLOR_BACKGROUND,            PropertyData.CHART_COLOR_BACKGROUND_color);
                              //          bool      IsGet_CHART_COLOR_FOREGROUND_color      = ChartGetInteger(ChartID(), CHART_COLOR_FOREGROUND,            PropertyData.CHART_COLOR_FOREGROUND_color);
                              //          bool      IsGet_CHART_COLOR_GRID_color            = ChartGetInteger(ChartID(), CHART_COLOR_GRID,                  PropertyData.CHART_COLOR_GRID_color);
                              //          bool      IsGet_CHART_COLOR_VOLUME_color          = ChartGetInteger(ChartID(), CHART_COLOR_VOLUME,                PropertyData.CHART_COLOR_VOLUME_color);
                              //          bool      IsGet_CHART_COLOR_CHART_UP_color        = ChartGetInteger(ChartID(), CHART_COLOR_CHART_UP,              PropertyData.CHART_COLOR_CHART_UP_color);
                              //          bool      IsGet_CHART_COLOR_CHART_DOWN_color      = ChartGetInteger(ChartID(), CHART_COLOR_CHART_DOWN,            PropertyData.CHART_COLOR_CHART_DOWN_color);
                              //          bool      IsGet_CHART_COLOR_CHART_LINE_color      = ChartGetInteger(ChartID(), CHART_COLOR_CHART_LINE,            PropertyData.CHART_COLOR_CHART_LINE_color);
                              //          bool      IsGet_CHART_COLOR_CANDLE_BULL_color     = ChartGetInteger(ChartID(), CHART_COLOR_CANDLE_BULL,           PropertyData.CHART_COLOR_CANDLE_BULL_color);
                              //          bool      IsGet_CHART_COLOR_CANDLE_BEAR_color     = ChartGetInteger(ChartID(), CHART_COLOR_CANDLE_BEAR,           PropertyData.CHART_COLOR_CANDLE_BEAR_color);
                              //          bool      IsGet_CHART_COLOR_BID_color             = ChartGetInteger(ChartID(), CHART_COLOR_BID,                   PropertyData.CHART_COLOR_BID_color);
                              //          bool      IsGet_CHART_COLOR_ASK_color             = ChartGetInteger(ChartID(), CHART_COLOR_ASK,                   PropertyData.CHART_COLOR_ASK_color);
                              //          bool      IsGet_CHART_COLOR_LAST_color            = ChartGetInteger(ChartID(), CHART_COLOR_LAST,                  PropertyData.CHART_COLOR_LAST_color);
                              //          bool      IsGet_CHART_COLOR_STOP_LEVEL_color      = ChartGetInteger(ChartID(), CHART_COLOR_STOP_LEVEL,            PropertyData.CHART_COLOR_STOP_LEVEL_color);
                              //          bool      IsGet_IsCHART_SHOW_TRADE_LEVELS_bool    = ChartGetInteger(ChartID(), CHART_SHOW_TRADE_LEVELS,           PropertyData.IsCHART_SHOW_TRADE_LEVELS_bool);
                              //          bool      IsGet_IsCHART_DRAG_TRADE_LEVELS_bool    = ChartGetInteger(ChartID(), CHART_SHOW_PRICE_SCALE,            PropertyData.IsCHART_SHOW_PRICE_SCALE_bool);
                              //          bool      IsGet_IsCHART_SHOW_DATE_SCALE_bool      = ChartGetInteger(ChartID(), CHART_SHOW_DATE_SCALE,             PropertyData.IsCHART_SHOW_DATE_SCALE_bool);
                              //          bool      IsGet_IsCHART_SHOW_PRICE_SCALE_bool     = ChartGetInteger(ChartID(), CHART_SHOW_PRICE_SCALE,            PropertyData.IsCHART_SHOW_PRICE_SCALE_bool);
                              //          bool      IsGet_IsCHART_IS_OFFLINE_bool           = ChartGetInteger(ChartID(), CHART_IS_OFFLINE,                  PropertyData.IsCHART_IS_OFFLINE_bool);
                              //          //+-------------------------------------------------------------------------------+
                              //          //|       ENUM_CHART_PROPERTY_DOUBLE      ChartSetDouble and ChartGetDouble()     |
                              //          //+-------------------------------------------------------------------------------+
                              //          bool      IsGet_CHART_SHIFT_SIZE_double           = ChartGetDouble(ChartID(), CHART_SHIFT_SIZE,                   PropertyData.CHART_SHIFT_SIZE_double);
                              //          bool      IsGet_CHART_FIXED_POSITION_double       = ChartGetDouble(ChartID(), CHART_FIXED_POSITION,               PropertyData.CHART_FIXED_POSITION_double);
                              //          bool      IsGet_CHART_FIXED_MAX_double            = ChartGetDouble(ChartID(), CHART_FIXED_MAX,                    PropertyData.CHART_FIXED_MAX_double);
                              //          bool      IsGet_CHART_FIXED_MIN_double            = ChartGetDouble(ChartID(), CHART_FIXED_MIN,                    PropertyData.CHART_FIXED_MIN_double);
                              //          bool      IsGet_CHART_POINTS_PER_BAR_double       = ChartGetDouble(ChartID(), CHART_POINTS_PER_BAR,               PropertyData.CHART_POINTS_PER_BAR_double);
                              //          bool      IsGet_CHART_PRICE_MIN_double            = ChartGetDouble(ChartID(), CHART_PRICE_MIN,                    PropertyData.CHART_PRICE_MIN_double);
                              //          bool      IsGet_CHART_PRICE_MAX_double            = ChartGetDouble(ChartID(), CHART_PRICE_MAX,                    PropertyData.CHART_PRICE_MAX_double);
                              //          //+-------------------------------------------------------------------------------+
                              //          //|       ENUM_CHART_PROPERTY_STRING      ChartSetString and ChartGetString()     |
                              //          //+-------------------------------------------------------------------------------+
                              //          bool      IsGet_CHART_COMMENT_string              = ChartGetString(ChartID(), CHART_COMMENT,                      PropertyData.CHART_COMMENT_string);//
                              //+-------------------------------------------------------------------------------+
                              //|       ENUM_CHART_PROPERTY_INTEGER     ChartSetInteger and ChartGetInteger()   |
                              //+-------------------------------------------------------------------------------+
                              //  Alert("ChartData_ChartInfo.SubWindow: ", ChartData_ChartInfo.SubWindow);
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.IsCHART_BRING_TO_TOP_bool            = (bool)ChartGetInteger(ChartID(), CHART_BRING_TO_TOP,          ChartData_ChartInfo.SubWindow);
                              PropertyData.IsCHART_MOUSE_SCROLL_bool            = (bool)ChartGetInteger(ChartID(), CHART_MOUSE_SCROLL,          ChartData_ChartInfo.SubWindow);
                              PropertyData.IsCHART_EVENT_MOUSE_MOVE_bool        = (bool)ChartGetInteger(ChartID(), CHART_EVENT_MOUSE_MOVE,      ChartData_ChartInfo.SubWindow);
                              PropertyData.IsCHART_EVENT_OBJECT_CREATE_bool     = (bool)ChartGetInteger(ChartID(), CHART_EVENT_OBJECT_CREATE,         ChartData_ChartInfo.SubWindow);
                              PropertyData.IsCHART_EVENT_OBJECT_DELETE_bool     = (bool)ChartGetInteger(ChartID(), CHART_EVENT_OBJECT_DELETE,         ChartData_ChartInfo.SubWindow );
                              PropertyData.CHART_MODE_ENUM                      = (ENUM_CHART_MODE)ChartGetInteger(ChartID(), CHART_MODE,                        ChartData_ChartInfo.SubWindow );
                              PropertyData.IsCHART_FOREGROUND_bool              = (bool)ChartGetInteger(ChartID(), CHART_FOREGROUND,                  ChartData_ChartInfo.SubWindow );
                              PropertyData.IsCHART_SHIFT_bool                   = (bool)ChartGetInteger(ChartID(), CHART_SHIFT,                       ChartData_ChartInfo.SubWindow);
                              PropertyData.IsCHART_AUTOSCROLL_bool              = (bool)ChartGetInteger(ChartID(), CHART_AUTOSCROLL,                  ChartData_ChartInfo.SubWindow);
                              PropertyData.IsCHART_QUICK_NAVIGATION_bool        = (bool)ChartGetInteger(ChartID(), CHART_QUICK_NAVIGATION,            ChartData_ChartInfo.SubWindow);
                              PropertyData.CHART_SCALE_int                      = (int)ChartGetInteger(ChartID(), CHART_SCALE,                       ChartData_ChartInfo.SubWindow);
                              PropertyData.IsCHART_SCALEFIX_bool                = (bool)ChartGetInteger(ChartID(), CHART_SCALEFIX,                    ChartData_ChartInfo.SubWindow);
                              PropertyData.IsCHART_SCALEFIX_11_bool             = (bool)ChartGetInteger(ChartID(), CHART_SCALEFIX_11,                 ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              //  bool Is_ = ChartGetInteger(ChartID(), CHART_SCALE_PT_PER_BAR,            ChartData_ChartInfo.SubWindow, (bool)PropertyData.IsCHART_SCALE_PT_PER_BAR_bool);
                              //  Alert("PropertyData.IsCHART_SCALE_PT_PER_BAR_bool: ", PropertyData.IsCHART_SCALE_PT_PER_BAR_bool);
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.IsCHART_SHOW_OHLC_bool               = (bool)ChartGetInteger(ChartID(), CHART_SHOW_OHLC,                   ChartData_ChartInfo.SubWindow);  ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.IsCHART_SHOW_BID_LINE_bool           = (bool)ChartGetInteger(ChartID(), CHART_SHOW_BID_LINE,               ChartData_ChartInfo.SubWindow);  ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.IsCHART_SHOW_ASK_LINE_bool           = (bool)ChartGetInteger(ChartID(), CHART_SHOW_ASK_LINE,               ChartData_ChartInfo.SubWindow);  ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              //PropertyData.IsCHART_SHOW_LAST_LINE_bool          = (bool)ChartGetInteger(ChartID(), CHART_SHOW_LAST_LINE,              ChartData_ChartInfo.SubWindow);
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.IsCHART_SHOW_PERIOD_SEP_bool         = (bool)ChartGetInteger(ChartID(), CHART_SHOW_PERIOD_SEP,             ChartData_ChartInfo.SubWindow);  ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.IsCHART_SHOW_GRID_bool               = (bool)ChartGetInteger(ChartID(), CHART_SHOW_GRID,                   ChartData_ChartInfo.SubWindow);  ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_SHOW_VOLUMES_int               = (ENUM_CHART_VOLUME_MODE)ChartGetInteger(ChartID(), CHART_SHOW_VOLUMES,                ChartData_ChartInfo.SubWindow);  ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.IsCHART_SHOW_OBJECT_DESCR_bool       = (bool)ChartGetInteger(ChartID(), CHART_SHOW_OBJECT_DESCR,           ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_VISIBLE_BARS_int               = (int)ChartGetInteger(ChartID(), CHART_VISIBLE_BARS,                ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_WINDOWS_TOTAL_int              = (int)ChartGetInteger(ChartID(), CHART_WINDOWS_TOTAL,               ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.IsCHART_WINDOW_IS_VISIBLE_bool       = (bool)ChartGetInteger(ChartID(), CHART_WINDOW_IS_VISIBLE,           ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_WINDOW_HANDLE_int              = (int)ChartGetInteger(ChartID(), CHART_WINDOW_HANDLE,               ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_WINDOW_YDISTANCE_int           = (int)ChartGetInteger(ChartID(), CHART_WINDOW_YDISTANCE,            ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_FIRST_VISIBLE_BAR_int          = (int)ChartGetInteger(ChartID(), CHART_FIRST_VISIBLE_BAR,           ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              //---
                              PropertyData.CHART_WIDTH_IN_BARS_int              = (int)ChartGetInteger(ChartID(), CHART_WIDTH_IN_BARS,               ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_WIDTH_IN_PIXELS_int            = (int)ChartGetInteger(ChartID(), CHART_WIDTH_IN_PIXELS,             ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_HEIGHT_IN_PIXELS_int           = (int)ChartGetInteger(ChartID(), CHART_HEIGHT_IN_PIXELS,            ChartData_ChartInfo.SubWindow);
                              //---
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_COLOR_BACKGROUND_color         = (color)ChartGetInteger(ChartID(), CHART_COLOR_BACKGROUND,            ChartData_ChartInfo.SubWindow);
                              PropertyData.CHART_COLOR_FOREGROUND_color         = (color)ChartGetInteger(ChartID(), CHART_COLOR_FOREGROUND,            ChartData_ChartInfo.SubWindow);
                              PropertyData.CHART_COLOR_GRID_color               = (color)ChartGetInteger(ChartID(), CHART_COLOR_GRID,                  ChartData_ChartInfo.SubWindow);
                              PropertyData.CHART_COLOR_VOLUME_color             = (color)ChartGetInteger(ChartID(), CHART_COLOR_VOLUME,                ChartData_ChartInfo.SubWindow);
                              PropertyData.CHART_COLOR_CHART_UP_color           = (color)ChartGetInteger(ChartID(), CHART_COLOR_CHART_UP,              ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_COLOR_CHART_DOWN_color         = (color)ChartGetInteger(ChartID(), CHART_COLOR_CHART_DOWN,            ChartData_ChartInfo.SubWindow);
                              PropertyData.CHART_COLOR_CHART_LINE_color         = (color)ChartGetInteger(ChartID(), CHART_COLOR_CHART_LINE,            ChartData_ChartInfo.SubWindow);
                              PropertyData.CHART_COLOR_CANDLE_BULL_color        = (color)ChartGetInteger(ChartID(), CHART_COLOR_CANDLE_BULL,           ChartData_ChartInfo.SubWindow);
                              PropertyData.CHART_COLOR_CANDLE_BEAR_color        = (color)ChartGetInteger(ChartID(), CHART_COLOR_CANDLE_BEAR,           ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_COLOR_BID_color                = (color)ChartGetInteger(ChartID(), CHART_COLOR_BID,                   ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_COLOR_ASK_color                = (color)ChartGetInteger(ChartID(), CHART_COLOR_ASK,                   ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              //PropertyData.CHART_COLOR_LAST_color               = (color)ChartGetInteger(ChartID(), CHART_COLOR_LAST,                  ChartData_ChartInfo.SubWindow);
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_COLOR_STOP_LEVEL_color         = (color)ChartGetInteger(ChartID(), CHART_COLOR_STOP_LEVEL,            ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.IsCHART_SHOW_TRADE_LEVELS_bool       = (bool)ChartGetInteger(ChartID(), CHART_SHOW_TRADE_LEVELS,           ChartData_ChartInfo.SubWindow);
                              PropertyData.IsCHART_SHOW_PRICE_SCALE_bool        = (bool)ChartGetInteger(ChartID(), CHART_SHOW_PRICE_SCALE,            ChartData_ChartInfo.SubWindow);
                              PropertyData.IsCHART_SHOW_DATE_SCALE_bool         = (bool)ChartGetInteger(ChartID(), CHART_SHOW_DATE_SCALE,             ChartData_ChartInfo.SubWindow); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.IsCHART_SHOW_PRICE_SCALE_bool        = (bool)ChartGetInteger(ChartID(), CHART_SHOW_PRICE_SCALE,            ChartData_ChartInfo.SubWindow);
                              PropertyData.IsCHART_IS_OFFLINE_bool              = (bool)ChartGetInteger(ChartID(), CHART_IS_OFFLINE,                  ChartData_ChartInfo.SubWindow);
                              //+-------------------------------------------------------------------------------+
                              //|       ENUM_CHART_PROPERTY_DOUBLE      ChartSetDouble and ChartGetDouble()     |
                              //+-------------------------------------------------------------------------------+
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_SHIFT_SIZE_double           = ChartGetDouble(ChartID(), CHART_SHIFT_SIZE,      ChartData_ChartInfo.SubWindow ); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_FIXED_POSITION_double       = ChartGetDouble(ChartID(), CHART_FIXED_POSITION,  ChartData_ChartInfo.SubWindow ); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_FIXED_MAX_double            = ChartGetDouble(ChartID(), CHART_FIXED_MAX,       ChartData_ChartInfo.SubWindow ); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_FIXED_MIN_double            = ChartGetDouble(ChartID(), CHART_FIXED_MIN,       ChartData_ChartInfo.SubWindow ); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              //  ResetLastError();
                              //  Sleep(15); PropertyData.CHART_POINTS_PER_BAR_double       = ChartGetDouble(ChartID(), CHART_POINTS_PER_BAR,  ChartData_ChartInfo.SubWindow );
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_PRICE_MIN_double            = ChartGetDouble(ChartID(), CHART_PRICE_MIN,       ChartData_ChartInfo.SubWindow ); ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              PropertyData.CHART_PRICE_MAX_double            = ChartGetDouble(ChartID(), CHART_PRICE_MAX,       ChartData_ChartInfo.SubWindow );
                              //+-------------------------------------------------------------------------------+
                              //|       ENUM_CHART_PROPERTY_STRING      ChartSetString and ChartGetString()     |
                              //+-------------------------------------------------------------------------------+
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "-Cg_DevChartWindow Error",  __LINE__, __FUNCTION__); //|
                              bool      IsGet_CHART_COMMENT_string              = ChartGetString(ChartID(), CHART_COMMENT,                      PropertyData.CHART_COMMENT_string);//
                    }
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-  Error",  __LINE__, __FUNCTION__); //|
                    return true;//
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+.
//    ChartSetDouble                        Sets the double value for a corresponding property of the specified chart
//    ChartSetInteger                       Sets the integer value (datetime, int, color, bool or char) for a corresponding property of the specified chart
//    ChartSetString                        Sets the string value for a corresponding property of the specified chart
//    ChartGetDouble                        Returns the double value property of the specified chart
//    ChartGetInteger                       Returns the integer value property of the specified chart
//    ChartGetString                        Returns the string value property of the specified chart
//------------------------------------------------------------------------------------------------------
          bool          _WindowRedraw(bool Is)          { if(Is) {WindowRedraw(); return true;} return false;}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          bool          _WindowScreenShot(bool Is, Sg_WindowScreenShot &x)      {if(Is) return WindowScreenShot(x.filename, x.size_x, x.size_y, x.start_bar, x.chart_scale, x.chart_mode ); return false;};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+



};

//+------------------------------------------------------------------+
//|                                   Material i Complex Struct.mqh  |===Model====== Data Logic Members
//|                       Copyright © 2020-2022, Oprymhdv@Gmail.com  |===View======= Functions Set Get
//|                                        Email: @prymhdvgmail.com  |===Contrler=== Function Handel Request
//|                                        HTTPS: www.Oprymhdv.com   |
//+------------------------------------------------------------------+
