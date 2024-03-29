//+------------------------------------------------------------------+
//||   ||||||||||            uMqlSeries.mqh                         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|          IMPLANTING CLASS  C_SYMBOLS BEGIN-END                   |
//+------------------------------------------------------------------+
class Ct_MqlSeries
{

          /*
          *==============================================================================================================================================================
          * These are functions for working with timeseries and indicators. A timeseries differs from the usual data array by its reverse ordering - elements of timeseries
          * are indexed from the end of an array to its begin (from the most recent data to the oldest ones).
          * To copy the time-series values and indicator data, it's recommended to use dynamic arrays only,
          * because copying functions are designed to allocate the necessary size of arrays that receive values.
          *==============================================================================================================================================================
          * It is historically accepted that an access to the price data in an array is performed from the end of the data.
          * Physically, the new data are always written at the array end, but the index of the array is always equal to zero.
          * The 0 index in the timeseries array denotes data of the current bar, i.e. the bar that corresponds to the unfinished time interval in this timeframe.
          * A timeframe is the time period, during which a single price bar is formed. There are several predefined standard timeframes.
          *==============================================================================================================================================================
          * Function                              Action
          * SeriesInfoInteger                     Returns information about the state of historical data
          * RefreshRates                          Refreshing of data in pre-defined variables and series arrays
          * CopyRates                             Gets history data of the Rates structure for a specified symbol and period into an array
          * CopyTime                              Gets history data on bar opening time for a specified symbol and period into an array
          * CopyOpen                              Gets history data on bar opening price for a specified symbol and period into an array
          * CopyHigh                              Gets history data on maximal bar price for a specified symbol and period into an array
          * CopyLow                               Gets history data on minimal bar price for a specified symbol and period into an array
          * CopyClose                             Gets history data on bar closing price for a specified symbol and period into an array
          * CopyTickVolume                        Gets history data on tick volumes for a specified symbol and period into an array
          * Bars                                  Returns the number of bars count in the history for a specified symbol and period
          * iBars                                 Returns the number of bars on the specified chart
          * iBarShift                             Returns the index of the bar which covers the specified time
          * iClose                                Returns Close price value for the bar of specified symbol with timeframe and shift
          * iHigh                                 Returns High price value for the bar of specified symbol with timeframe and shift
          * iHighest                              Returns the shift of the maximum value over a specific number of bars
          * iLow                                  Returns Low price value for the bar of indicated symbol with timeframe and shift
          * iLowest                               Returns the shift of the lowest value over a specific number of bars
          * iOpen                                 Returns Open price value for the bar of specified symbol with timeframe and shif
          * iTime                                 Returns time value for the bar of specified symbol with timeframe and shift
          * iVolume                               Returns Tick Volume value for the bar of specified symbol with timeframe and shift   iVolume();
          *==============================================================================================================================================================
          * long  SeriesInfoInteger(string symbol_name, ENUM_TIMEFRAMES timeframe, ENUM_SERIES_INFO_INTEGER
           prop_id); In the first case, it returns value of the long type. For the second case,  it returns true,
           if the specified property is available and its value has been placed into long_var variable, otherwise it returns false. For more details about an error, call GetLastError().
          *==============================================================================================================================================================
          * bool  RefreshRates();               Refreshing of data in pre-defined variables and series arrays.
          *==============================================================================================================================================================
          * Returns the number of copied elements or -1 in case of  an error.
          * int CopyRates( string symbol_name, ENUM_TIMEFRAMES  timeframe, int start_pos, int count, MqlRates rates_array[]);                  Call by the first position and the number of required elements
          * int CopyRates( string symbol_name, ENUM_TIMEFRAMES  timeframe, datetime start_time, int count, MqlRates rates_array[] );           Call by the start date and the number of required elements
          * int CopyRates( string symbol_name, ENUM_TIMEFRAMES  timeframe, datetime start_time, datetime stop_time, MqlRates rates_array[] );  Call by the start and end dates of a required time interval
          *==============================================================================================================================================================
          * Returns the copied data count or -1 in case of an error
          * int CopyTime( string symbol_name, ENUM_TIMEFRAMES  timeframe, int      start_pos , int      count,     datetime time_array[] );      Call by the first position and the number of required elements
          * int CopyTime( string symbol_name, ENUM_TIMEFRAMES  timeframe, datetime start_time, int      count,     datetime time_array[] );      Call by the start date and the number of required elements
          * int CopyTime( string symbol_name, ENUM_TIMEFRAMES  timeframe, datetime start_time, datetime stop_time, datetime time_array[] );      Call by the start and end dates of a required time interval
          *==============================================================================================================================================================
          *Returns the number of element in the array or -1 in case of an error.
          * int CopyOpen( string symbol_name, ENUM_TIMEFRAMES timeframe, int start_pos, int count,  double open_array[] );                       Call by the first position and the number of required elements
          * int CopyOpen( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time, int count, double open_array[] );                  Call by the start date and the number of required elements
          * int CopyOpen( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time, datetime stop_time, double open_array[] );         Call by the start and end dates of a required time interval
          *==============================================================================================================================================================
          * Returns the copied data count or -1 in case of an error.
          * int CopyHigh( string symbol_name, ENUM_TIMEFRAMES timeframe, int start_pos, int count, double high_array[] );                        Call by the first position and the number of required elements
          * int CopyHigh( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time, int count, double high_array[] );                  Call by the start date and the number of required elements
          * int CopyHigh( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time, datetime stop_time, double high_array[] );         Call by the start and end dates of a required time interval
          *==============================================================================================================================================================
          * Returns the copied data count or -1 in case of an error.
          * int CopyLow( string symbol_name, ENUM_TIMEFRAMES timeframe, int start_pos, int count, double low_array[] );                          Call by the first position and the number of required elements
          * int CopyLow( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time, int count, double low_array[] );                    Call by the start date and the number of required elements
          * int CopyLow( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time, datetime stop_time, double low_array[] );           Call by the start and end dates of a required time interval
          *==============================================================================================================================================================
          * Returns the copied data count or -1 in case of an error.
          * int CopyClose( string symbol_name, ENUM_TIMEFRAMES timeframe, int start_pos, int count, double close_array[] );                      Call by the first position and the number of required elements
          * int CopyClose( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time, int count, double close_array[] );                Call by the start date and the number of required elements
          * int CopyClose( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time, datetime stop_time, double close_array[] );       Call by the start and end dates of a required time interval
          *==============================================================================================================================================================
          * eturns the copied data count or -1 in case of an error.
          * int CopyTickVolume( string symbol_name, ENUM_TIMEFRAMES timeframe, int start_pos, int count, long volume_array[] );                  Call by the first position and the number of required elements
          * int CopyTickVolume( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time, int count, long volume_array[] );            Call by the start date and the number of required elements
          * int CopyTickVolume( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time, datetime stop_time, long volume_array[] );   Call by the start and end dates of a required time interval
          *==============================================================================================================================================================
          * If the start_time and stop_time parameters are defined, the function returns the number of bars in the specified time interval, otherwise it returns the total number of bars.

          * int Bars( string symbol_name, ENUM_TIMEFRAMES timeframe );                                                                             Request all of the history bars
          * int Bars( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time, datetime stop_time );                                    Request the history bars for the selected time interval
          *==============================================================================================================================================================
          * int         iBars( string symbol, int timeframe );
          * int         iBarShift( string symbol, int timeframe, datetime time, bool exact=false );
          * double      iClose( string symbol, int timeframe, int shift );
          * double      iHigh( string symbol, int timeframe, int shift );
          * int         iHighest( string symbol, int timeframe, int type, int count, int start );
          * double      iLow( string symbol, int timeframe, int shift );
          * int         iLowest( string symbol, int timeframe, int type, int count, int start );
          * double      iOpen( string symbol, int timeframe, int shift );
          * datetime    iTime( string symbol, int timeframe, int shift );
          * long        iVolume( string symbol, int timeframe, int shift );
          * ==============================================================================================================================================================
          * ==============================================================================================================================================================
          * History Database Properties
          * When accessing timeseries the SeriesInfoInteger() function is used for obtaining additional symbol information. Identifier of a required property is passed as the function parameter. The identifier can be one of values of ENUM_SERIES_INFO_INTEGER.
          * ENUM_SERIES_INFO_INTEGER
          * Identifier                    Description                                                                                     Type
          * SERIES_BARS_COUNT             Bars count for the symbol-period for the current moment                                         long
          * SERIES_FIRSTDATE              The very first date for the symbol-period for the current moment                                datetime
          * SERIES_LASTBAR_DATE           Open time of the last bar of the symbol-period                                                  datetime
          * SERIES_SERVER_FIRSTDATE       The very first date in the history of the symbol on the server regardless of the timeframe      datetime
          * ==============================================================================================================================================================
          *
          *
          *
          *
          *
          *
          *
          */



private:
//===================================================================
public:
          void           Ct_MqlSeries()  {/*RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); //|*/ }
          void           ~Ct_MqlSeries() {/*Alert("Deinit: ", __FUNCSIG__);*/};

          bool           Update()
          {         //===================================================================
                    //===================================================================
                    return true;//
          }

//===================================================================
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

          //--- long  SeriesInfoInteger SeriesInfoInteger(string symbol_name, ENUM_TIMEFRAMES timeframe, ENUM_SERIES_INFO_INTEGER prop_id);
          //--- In the first case, it returns value of the long type. For the second case,  it returns true,
          //--- if the specified property is available and its value has been placed into long_var variable, otherwise it returns false. For more details about an error, call GetLastError().
          long      SERIES_BARS_COUNT_int;          //SeriesInfoInteger(string symbol_name, ENUM_TIMEFRAMES timeframe, SERIES_BARS_COUNT);
          datetime  SERIES_FIRSTDATE_int;           //SeriesInfoInteger(string symbol_name, ENUM_TIMEFRAMES timeframe, SERIES_FIRSTDATE);
          datetime  SERIES_LASTBAR_DATE_int;        //SeriesInfoInteger(string symbol_name, ENUM_TIMEFRAMES timeframe, SERIES_LASTBAR_DATE);
          datetime  SERIES_SERVER_FIRSTDATE_int;    //SeriesInfoInteger(string symbol_name, ENUM_TIMEFRAMES timeframe, SERIES_SERVER_FIRSTDATE);
          //==============================================================================================================================================================
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          bool  _RefreshRates() {return RefreshRates();}               //Refreshing of data in pre - defined variables and series arrays.
          //==============================================================================================================================================================
          // Returns the number of copied elements or -1 in case of  an error.
          int   _CopyRates(string symbol_name, ENUM_TIMEFRAMES timeframe, int      start_pos,   int      count,         MqlRates &rates_array[])    {return CopyRates( symbol_name, timeframe, start_pos,  count,     rates_array);} //Call by the first position and the number of required elements
          int   _CopyRates(string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,  int      count,         MqlRates &rates_array[])    {return CopyRates( symbol_name, timeframe, start_time, count,     rates_array);} //Call by the start date and the number of required elements
          int   _CopyRates(string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,  datetime stop_time,     MqlRates &rates_array[])    {return CopyRates( symbol_name, timeframe, start_time, stop_time, rates_array);} //Call by the start and end dates of a required time interval
          //==============================================================================================================================================================
          // Returns the copied data count or -1 in case of an error
          int   _CopyTime( string symbol_name, ENUM_TIMEFRAMES timeframe, int      start_pos,   int      count,         datetime &time_array[])     {return CopyTime( symbol_name, timeframe, start_pos,  count,     time_array);}//Call by the first position and the number of required elements
          int   _CopyTime( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,  int      count,         datetime &time_array[])     {return CopyTime( symbol_name, timeframe, start_time, count,     time_array);}//Call by the start date and the number of required elements
          int   _CopyTime( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,  datetime stop_time,     datetime &time_array[])     {return CopyTime( symbol_name, timeframe, start_time, stop_time, time_array);}//Call by the start and end dates of a required time interval
          //==============================================================================================================================================================
          //Returns the number of element in the array or -1 in case of an error.
          int   _CopyOpen( string symbol_name, ENUM_TIMEFRAMES timeframe, int      start_pos,   int      count,         double &open_array[])      {return CopyOpen( symbol_name, timeframe, start_pos,  count,     open_array);}   //Call by the first position and the number of required elements
          int   _CopyOpen( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,  int      count,         double &open_array[])      {return CopyOpen( symbol_name, timeframe, start_time, count,     open_array);}                  //Call by the start date and the number of required elements
          int   _CopyOpen( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,  datetime stop_time,     double &open_array[])      {return CopyOpen( symbol_name, timeframe, start_time, stop_time, open_array);}       //Call by the start and end dates of a required time interval
          //==============================================================================================================================================================
          // Returns the copied data count or -1 in case of an error.
          int   _CopyHigh( string symbol_name, ENUM_TIMEFRAMES timeframe, int      start_pos,   int      count,         double &high_array[])      {return CopyHigh( symbol_name, timeframe, start_pos,  count,     high_array );}                        //Call by the first position and the number of required elements
          int   _CopyHigh( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,  int      count,         double &high_array[])      {return CopyHigh( symbol_name, timeframe, start_time, count,     high_array );}                  //Call by the start date and the number of required elements
          int   _CopyHigh( string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,  datetime stop_time,     double &high_array[])      {return CopyHigh( symbol_name, timeframe, start_time, stop_time, high_array );}         //Call by the start and end dates of a required time interval
          //==============================================================================================================================================================
          // Returns the copied data count or -1 in case of an error.
          int   _CopyLow(  string symbol_name, ENUM_TIMEFRAMES timeframe, int      start_pos,   int      count,         double &low_array[])       {return CopyLow( symbol_name, timeframe, start_pos,  count,      low_array );}                          //Call by the first position and the number of required elements
          int   _CopyLow(  string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,  int      count,         double &low_array[])       {return CopyLow( symbol_name, timeframe, start_time, count,      low_array );}                    //Call by the start date and the number of required elements
          int   _CopyLow(  string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,  datetime stop_time,     double &low_array[])       {return CopyLow( symbol_name, timeframe, start_time, stop_time,  low_array );}           //Call by the start and end dates of a required time interval
          //==============================================================================================================================================================
          // Returns the copied data count or -1 in case of an error.
          int   _CopyClose(string symbol_name, ENUM_TIMEFRAMES timeframe, int      start_pos,   int      count,         double &close_array[])     {return CopyClose( symbol_name, timeframe, start_pos,  count,     close_array );}                      //Call by the first position and the number of required elements
          int   _CopyClose(string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,  int      count,         double &close_array[])     {return CopyClose( symbol_name, timeframe, start_time, count,     close_array );}                //Call by the start date and the number of required elements
          int   _CopyClose(string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,  datetime stop_time,     double &close_array[])     {return CopyClose( symbol_name, timeframe, start_time, stop_time, close_array );}       //Call by the start and end dates of a required time interval
          //==============================================================================================================================================================
          // eturns the copied data count or -1 in case of an error.
          int   _CopyTickVolume(string symbol_name, ENUM_TIMEFRAMES timeframe, int      start_pos,      int      count,         long &volume_array[])    {return CopyTickVolume( symbol_name, timeframe, start_pos,  count,     volume_array );}                  //Call by the first position and the number of required elements
          int   _CopyTickVolume(string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,     int      count,         long &volume_array[])    {return CopyTickVolume( symbol_name, timeframe, start_time, count,     volume_array );}            //Call by the start date and the number of required elements
          int   _CopyTickVolume(string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time,     datetime stop_time,     long &volume_array[])    {return CopyTickVolume( symbol_name, timeframe, start_time, stop_time, volume_array );}   //Call by the start and end dates of a required time interval
          //==============================================================================================================================================================
          // If the start_time and stop_time parameters are defined, the function returns the number of bars in the specified time interval, otherwise it returns the total number of bars.
          int   _Bars(string symbol_name, ENUM_TIMEFRAMES timeframe)                                          {return Bars( symbol_name, timeframe );}                              //Request all of the history bars
          int   _Bars(string symbol_name, ENUM_TIMEFRAMES timeframe, datetime start_time, datetime stop_time) {return Bars( symbol_name, timeframe, start_time, stop_time );}       //Request the history bars for the selected time interval
          //==============================================================================================================================================================
          int           _iBars(     string symbol, int timeframe)                                       {return iBars(     symbol, timeframe);}
          int           _iBarShift( string symbol, int timeframe, datetime time, bool exact = false)    {return iBarShift( symbol, timeframe, time, exact );}
          double        _iClose(    string symbol, int timeframe, int shift )                           {return iClose(    symbol, timeframe, shift); }
          double        _iHigh(     string symbol, int timeframe, int shift )                           {return iHigh(     symbol, timeframe, shift ); }
          int           _iHighest(  string symbol, int timeframe, int type, int count, int start )      {return iHighest(  symbol, timeframe, type, count, start ); }
          double        _iLow(      string symbol, int timeframe, int shift )                           {return iLow(      symbol, timeframe, shift ); }
          int           _iLowest(   string symbol, int timeframe, int type, int count, int start )      {return iLowest(   symbol, timeframe, type, count, start ); }
          double        _iOpen(     string symbol, int timeframe, int shift )                           {return iOpen(     symbol, timeframe, shift ); }
          datetime      _iTime(     string symbol, int timeframe, int shift )                           {return iTime(     symbol, timeframe, shift ); }
          long          _iVolume(   string symbol, int timeframe, int shift )                           {return iVolume(   symbol, timeframe, shift ); }
          //==============================================================================================================================================================
//===================================================================
//===================================================================
};
//+------------------------------------------------------------------+
//|          IMPLANTING CLASS  C_SYMBOLS BEGIN-END                   |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//||   ||||||||||            uMqlSeries.mqh                         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
