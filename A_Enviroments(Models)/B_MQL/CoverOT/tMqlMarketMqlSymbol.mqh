//+------------------------------------------------------------------+
//||   ||||||||||            tMqlMarketMqlSymbol.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 3 msec elapsed            1         1
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
struct St_MqlMarketSymbol
{         /*
          * =========================================================================================================================================================================
          * Getting Market Information
          * These are functions intended for receiving information about the market state.
          * Function                      Action
          * =========================================================================================================================================================================
          * MarketInfo                    Returns various data about securities listed in the "Market Watch" window
          * SymbolsTotal                  Returns the number of available (NameSymbol in Market Watch or all) symbols
          * SymbolName                    Returns the name of a specified symbol
          * SymbolSelect                  Selects a symbol in the Market Watch window or removes a symbol from the window
          * SymbolInfoDouble              Returns the double value of the symbol for the corresponding property
          * SymbolInfoInteger             Returns a value of an integer type (long, datetime, int or bool) of a specified symbol for the corresponding property
          * SymbolInfoString              Returns a value of the string type of a specified symbol for the corresponding property
          * SymbolInfoTick Returns        the current prices for the specified symbol in a variable of the MqlTick type
          * SymbolInfoSessionQuote        Allows receiving time of beginning and end of the specified quoting sessions for a specified symbol and day of week.
          * SymbolInfoSessionTrade        Allows receiving time of beginning and end of the specified trading sessions for a specified symbol and day of week.
          * =========================================================================================================================================================================
          * Symbol Properties
          * Market information identifiers, used with MarketInfo() function. It can be any of the following values:
          * //=====================================================================================================
          * ID                            Value           Description
          * MODE_LOW                      1               Low day price
          * MODE_HIGH                     2               High day price
          * MODE_TIME                     5               The last incoming tick time (last known server time)
          * MODE_BID                      9               Last incoming bid price. For the current symbol, it is stored in the predefined variable Bid
          * MODE_ASK                      10              Last incoming ask price. For the current symbol, it is stored in the predefined variable Ask
          * MODE_POINT                    11              Point size in the quote currency. For the current symbol, it is stored in the predefined variable Point
          * MODE_DIGITS                   12              Count of digits after decimal point in the symbol prices. For the current symbol, it is stored in the predefined variable Digits
          * MODE_SPREAD                   13              Spread value in points
          * MODE_STOPLEVEL                14              Stop level in points      A zero value of MODE_STOPLEVEL means either absence of any restrictions on the minimal distance for Stop Loss/Take Profit or the fact that a trade server utilizes some external mechanisms for dynamic level control, which cannot be translated in the client terminal. In the second case, GetLastError() can return error 130, because MODE_STOPLEVEL is actually "floating" here.
          * MODE_LOTSIZE                  15              Lot size in the base currency
          * MODE_TICKVALUE                16              Tick value in the deposit currency
          * MODE_TICKSIZE                 17              Tick size in points
          * MODE_SWAPLONG                 18              Swap of the buy order
          * MODE_SWAPSHORT                19              Swap of the sell order
          * MODE_STARTING                 20              Market starting date (usually used for futures)
          * MODE_EXPIRATION               21              Market expiration date (usually used for futures)
          * MODE_TRADEALLOWED             22              Trade is allowed for the symbol
          * MODE_MINLOT                   23              Minimum permitted amount of a lot
          * MODE_LOTSTEP                  24              Step for changing lots
          * MODE_MAXLOT                   25              Maximum permitted amount of a lot
          * MODE_SWAPTYPE                 26              Swap calculation method. 0 - in points; 1 - in the symbol base currency; 2 - by interest; 3 - in the margin currency
          * MODE_PROFITCALCMODE           27              Profit calculation mode. 0 - Forex; 1 - CFD; 2 - Futures
          * MODE_MARGINCALCMODE           28              Margin calculation mode. 0 - Forex; 1 - CFD; 2 - Futures; 3 - CFD for indices
          * MODE_MARGININIT               29              Initial margin requirements for 1 lot
          * MODE_MARGINMAINTENANCE        30              Margin to maintain open orders calculated for 1 lot
          * MODE_MARGINHEDGED             31              Hedged margin calculated for 1 lot
          * MODE_MARGINREQUIRED           32              Free margin required to open 1 lot for buying
          * MODE_FREEZELEVEL              33              ct_Order freeze level in points. If the execution price lies within the range defined by the freeze level, the order cannot be modified, cancelled or closed
          * MODE_CLOSEBY_ALLOWED          34              Allowed using OrderCloseBy() to close opposite orders on a specified symbol
          * ========================================================================================================================================================================
          *
          * To obtain the current market information there are several functions:
          * SymbolInfoInteger(),    SymbolInfoDouble()    and SymbolInfoString().
          * The first parameter is the symbol name, the values of the second function parameter can be one of
          * the identifiers of ENUM_SYMBOL_INFO_INTEGER, ENUM_SYMBOL_INFO_DOUBLE and ENUM_SYMBOL_INFO_STRING.
          * ENUM_SYMBOL_INFO_INTEGER//ENUM_SYMBOL_INFO_DOUBLE//ENUM_SYMBOL_INFO_STRING//ENUM_SYMBOL_TRADE_MODE//ENUM_SYMBOL_TRADE_EXECUTION//ENUM_DAY_OF_WEEK
          *=========================================================================================================================================================================
          * //+------------------------------------------------------------------+
          * //|   * For function SymbolInfoInteger():  ENUM_SYMBOL_INFO_INTEGER  |
          * //+------------------------------------------------------------------+
          * Identifier                                  Description                                                                                                       Type
          *=========================================================================================================================================================================
          * SYMBOL_SELECT         Symbol is NameSymbol in Market Watch.   Some symbols can be hidden in Market Watch, but still they are considered as NameSymbol.            bool
          * SYMBOL_VISIBLE        Symbol is visible in Market Watch.    Some symbols (mostly, these are cross rates required for calculation of
          *                       margin requirements or profits in deposit currency) are NameSymbol automatically, but generally are not visible in Market Watch.
          *                       To be displayed such symbols have to be explicitly NameSymbol.                                                                            bool
          * SYMBOL_SESSION_DEALS                Not supported                                                                                                             long
          * SYMBOL_SESSION_BUY_ORDERS           Not supported                                                                                                             long
          * SYMBOL_SESSION_SELL_ORDERS          Not supported                                                                                                             long
          * SYMBOL_VOLUME                       Not supported                                                                                                             long
          * SYMBOL_VOLUMEHIGH                   Not supported                                                                                                             long
          * SYMBOL_VOLUMELOW                    Not supported                                                                                                             long
          * SYMBOL_TIME                         Time of the "last quote"                                                                                                    datetime
          * SYMBOL_DIGITS                       Digits after a decimal point                                                                                              int
          * SYMBOL_SPREAD_FLOAT                 Indication of a floating spread                                                                                           bool
          * SYMBOL_SPREAD                       Spread value in points                                                                                                    int
          * SYMBOL_TRADE_CALC_MODE              Contract price calculation mode                                                                                           int
          * SYMBOL_TRADE_MODE                   ct_Order execution type                                                                                    ENUM_SYMBOL_TRADE_MODE
          * SYMBOL_START_TIME                   Date of the symbol trade beginning (usually used for futures)                                                             datetime
          * SYMBOL_EXPIRATION_TIME              Date of the symbol trade end (usually used for futures)                                                                   datetime
          * SYMBOL_TRADE_STOPS_LEVEL            Minimal indention in points from the current close price to place Stop orders                                             int
          * SYMBOL_TRADE_FREEZE_LEVEL           Distance to freeze trade operations in points                                                                             int
          * SYMBOL_TRADE_EXEMODE                Deal execution mode                                                                                     ENUM_SYMBOL_TRADE_EXECUTION
          * SYMBOL_SWAP_MODE                    Swap calculation model                                                                                                    int
          * SYMBOL_SWAP_ROLLOVER3DAYS           Day of week to charge 3 days swap rollover                                                              ENUM_DAY_OF_WEEK
          * SYMBOL_EXPIRATION_MODE              Not supported                                                                                                             int
          * SYMBOL_FILLING_MODE                 Not supported                                                                                                             int
          * SYMBOL_ORDER_MODE                   Not supported                                                                                                             int
          *=========================================================================================================================================================================
          * //+------------------------------------------------------------------+
          * //|   * For function SymbolInfoDouble():   ENUM_SYMBOL_INFO_DOUBLE   |
          * //+------------------------------------------------------------------+
          * Identifier                                  Description                                                                                                     Type
          *=========================================================================================================================================================================
          * SYMBOL_BID                          Bid - best sell offer                                                                                                   double
          * SYMBOL_BIDHIGH                      Not supported                                                                                                           double
          * SYMBOL_BIDLOW                       Not supported                                                                                                           double
          * SYMBOL_ASK                          Ask - best buy offer                                                                                                    double
          * SYMBOL_ASKHIGH                      Not supported                                                                                                           double
          * SYMBOL_ASKLOW                       Not supported                                                                                                           double
          * SYMBOL_LAST                         Not supported                                                                                                           double
          * SYMBOL_LASTHIGH                     Not supported                                                                                                           double
          * SYMBOL_LASTLOW                      Not supported                                                                                                           double
          * SYMBOL_POINT                        Symbol point value                                                                                                      double
          * SYMBOL_TRADE_TICK_VALUE             Value of SYMBOL_TRADE_TICK_VALUE_PROFIT                                                                                 double
          * SYMBOL_TRADE_TICK_VALUE_PROFIT      Not supported                                                                                                           double
          * SYMBOL_TRADE_TICK_VALUE_LOSS        Not supported                                                                                                           double
          * SYMBOL_TRADE_TICK_SIZE              Minimal price change                                                                                                    double
          * SYMBOL_TRADE_CONTRACT_SIZE          Trade contract size                                                                                                     double
          * SYMBOL_VOLUME_MIN                   Minimal volume for a deal                                                                                               double
          * SYMBOL_VOLUME_MAX                   Maximal volume for a deal                                                                                               double
          * SYMBOL_VOLUME_STEP                  Minimal volume change step for deal execution                                                                           double
          * SYMBOL_VOLUME_LIMIT                 Not supported                                                                                                           double
          * SYMBOL_SWAP_LONG                    Buy order swap value                                                                                                    double
          * SYMBOL_SWAP_SHORT                   Sell order swap value                                                                                                   double
          * SYMBOL_MARGIN_INITIAL               Initial margin means the amount in the margin currency required for opening an order with the volume of one lot.
          *                                     It is used for checking a client's assets when he or she enters the market.                                             double
          * SYMBOL_MARGIN_MAINTENANCE           The maintenance margin. If it is set, it sets the margin amount in the margin currency of the symbol,
          *                                     charged from one lot. It is used for checking a client's assets when his/her account state changes.
          *                                      If the maintenance margin is equal to 0, the initial margin is used.                                                   double
          * SYMBOL_MARGIN_LONG                  Not supported                                                                                                           double
          * SYMBOL_MARGIN_SHORT                 Not supported                                                                                                           double
          * SYMBOL_MARGIN_LIMIT                 Not supported                                                                                                           double
          * SYMBOL_MARGIN_STOP                  Not supported                                                                                                           double
          * SYMBOL_MARGIN_STOPLIMIT             Not supported                                                                                                           double
          * SYMBOL_SESSION_VOLUME               Not supported                                                                                                           double
          * SYMBOL_SESSION_TURNOVER             Not supported                                                                                                           double
          * SYMBOL_SESSION_INTEREST             Not supported                                                                                                           double
          * SYMBOL_SESSION_BUY_ORDERS_VOLUME    Not supported                                                                                                           double
          * SYMBOL_SESSION_SELL_ORDERS_VOLUME   Not supported                                                                                                           double
          * SYMBOL_SESSION_OPEN                 Not supported                                                                                                           double
          * SYMBOL_SESSION_CLOSE                Not supported                                                                                                           double
          * SYMBOL_SESSION_AW                   Not supported                                                                                                           double
          * SYMBOL_SESSION_PRICE_SETTLEMENT     Not supported                                                                                                           double
          * SYMBOL_SESSION_PRICE_LIMIT_MIN      Not supported                                                                                                           double
          * SYMBOL_SESSION_PRICE_LIMIT_MAX      Not supported                                                                                                           double
          *=========================================================================================================================================================================
          * //+------------------------------------------------------------------+
          * //|   * For function SymbolInfoString():   ENUM_SYMBOL_INFO_STRING   |
          * //+------------------------------------------------------------------+
          * Identifier                                  Description                                                                                                     Type
          *=========================================================================================================================================================================
          * SYMBOL_CURRENCY_BASE                Basic currency of a symbol                                                                                              string
          * SYMBOL_CURRENCY_PROFIT              Profit currency                                                                                                         string
          * SYMBOL_CURRENCY_MARGIN              Margin currency                                                                                                         string
          * SYMBOL_DESCRIPTION                  Symbol description                                                                                                      string
          * SYMBOL_PATH                         Path in the symbol tree                                                                                                 string
          *=========================================================================================================================================================================
          * There are several symbol trading modes. Information about trading modes of a certain symbol is reflected in the values of enumeration ENUM_SYMBOL_TRADE_MODE.
          * //+------------------------------------------------------------------+
          * //|   * For function SymbolInfoInteger():   ENUM_SYMBOL_TRADE_MODE   |
          * //+------------------------------------------------------------------+
          * Identifier                          Description
          * SYMBOL_TRADE_MODE_DISABLED          Trade is disabled for the symbol
          * SYMBOL_TRADE_MODE_LONGONLY*         Allowed only long positions
          * SYMBOL_TRADE_MODE_SHORTONLY*        Allowed only short positions
          * SYMBOL_TRADE_MODE_CLOSEONLY         Allowed only position close operations
          * SYMBOL_TRADE_MODE_FULL              No trade restrictions
          *=========================================================================================================================================================================
          * Possible deal execution modes for a certain symbol are defined in enumeration ENUM_SYMBOL_TRADE_EXECUTION.
          * //+------------------------------------------------------------------+
          * //|  * For function SymbolInfoInteger(): ENUM_SYMBOL_TRADE_EXECUTION |
          * //+------------------------------------------------------------------+
          * Identifier                          Description
          * SYMBOL_TRADE_EXECUTION_REQUEST      Execution by request
          * SYMBOL_TRADE_EXECUTION_INSTANT      Instant execution
          * SYMBOL_TRADE_EXECUTION_MARKET       Market execution
          * SYMBOL_TRADE_EXECUTION_EXCHANGE*    Exchange execution
          *=========================================================================================================================================================================
          * These values are not used in MQL4 (added for compatibility with MQL5).
          * Values of the ENUM_DAY_OF_WEEK enumeration are used for specifying days of week.
          * //+------------------------------------------------------------------+
          * //|  * For function SymbolInfoInteger(): ENUM_DAY_OF_WEEK            |
          * //+------------------------------------------------------------------+
          * Identifier                          Description
          *=========================================================================================================================================================================
          * SUNDAY                              Sunday
          * MONDAY                              Monday
          * TUESDAY                             Tuesday
          * WEDNESDAY                           Wednesday
          * THURSDAY                            Thursday
          * FRIDAY                              Friday
          * SATURDAY                            Saturday
          *=========================================================================================================================================================================
          * SymbolIsSynchronized()---Updated()?
          */
//+------------------------------------------------------------------+
//|     double MarketInfo(string NameSymbol,int information_type)    |
//+------------------------------------------------------------------+
          double                        Market_BID;
          double                        Market_ASK;
          double                        Market_HIGH;
          double                        Market_LOW;
          double                        Market_TIME;
          double                        Market_POINT;
          double                        Market_DIGITS;
          double                        Market_SPREAD;
          //==================================================MarketInfo
          double                        Market_LOTSIZE ;
          double                        Market_LOTSTEP ;
          double                        Market_MINLOT ;
          double                        Market_MAXLOT ;
          double                        Market_STOPLEVEL;//MinStop
          double                        Market_TICKVALUE;               //= GetNameSymbolProp(MODE_TICKVALUE);//For tp/sl//TickValue,Tick value in the deposit currency
          double                        Market_TICKSIZE;                //= GetNameSymbolProp(MODE_TICKSIZE);//For tp/sl //TickSize,Tick size in points
          //====================================================MarketInfo
          double                        Market_SWAPLONG;
          double                        Market_SWAPSHORT;
          double                        Market_SWAPTYPE;
          double                        Market_PROFITCALCMODE;
          double                        Market_MARGINCALCMODE;
          double                        Market_MARGININIT;
          double                        Market_MARGINMAINTENANCE;
          double                        Market_MARGINHEDGED;
          double                        Market_MarginHedging;//
          double                        Market_MARGINREQUIRED;
          double                        Market_FREEZELEVEL;
          //====================================================MarketInfo
          double                        Market_STARTING;
          double                        Market_EXPIRATION;
          double                        Market_TRADEALLOWED;//Casting to bool>>>just market info have it
          //====================================================MarketInfo
          double                        Market_CLOSEBY_ALLOWED;
//==============================================================================================================
//==============================================================================================================
//+-----------------------------------------------------------------------------------------------------+
//|     double  SymbolInfoInteger( string NameSymbol, ENUM_SYMBOL_INFO_DOUBLE  property_identifier );   |
//+-----------------------------------------------------------------------------------------------------+
          bool                          Symbol_SELECT;//                       Symbol is NameSymbol in Market Watch.
          bool                          Symbol_VISIBLE;//                      Symbol is visible in Market Watch.
          long                          Symbol_SESSION_DEALS;//                Not supported
          long                          Symbol_SESSION_BUY_ORDERS;//           Not supported
          long                          Symbol_SESSION_SELL_ORDERS;//          Not supported
          long                          Symbol_VOLUME;//                       Not supported                                                                                                             long
          long                          Symbol_VOLUMEHIGH;//                   Not supported
          long                          Symbol_VOLUMELOW;//                    Not supported
          datetime                      Symbol_TIME;//                         Time of the "last quote"
          int                           Symbol_DIGITS;//                       Digits after a decimal point
          bool                          Symbol_SPREAD_FLOAT;//                 Indication of a floating spread
          int                           Symbol_SPREAD;//                       Spread value in points
          int                           Symbol_TRADE_CALC_MODE;//              Contract price calculation mode
          ENUM_SYMBOL_TRADE_MODE        Symbol_TRADE_MODE;//                   ct_Order execution type
          datetime                      Symbol_START_TIME;//                   Date of the symbol trade beginning (usually used for futures)
          datetime                      Symbol_EXPIRATION_TIME;//              Date of the symbol trade end (usually used for futures)
          int                           Symbol_TRADE_STOPS_LEVEL;//            Minimal indention in points from the current close price to place Stop orders
          int                           Symbol_TRADE_FREEZE_LEVEL;//           Distance to freeze trade operations in points
          ENUM_SYMBOL_TRADE_EXECUTION   Symbol_TRADE_EXEMODE;//                Deal execution mode
          int                           Symbol_SWAP_MODE;//                    Swap calculation model
          ENUM_DAY_OF_WEEK              Symbol_SWAP_ROLLOVER3DAYS;//           Day of week to charge 3 days swap rollover///SwapsTripleDay
          int                           Symbol_EXPIRATION_MODE;//              Not supported
          int                           Symbol_FILLING_MODE;//                 Not supported
          int                           Symbol_ORDER_MODE;//                   Not supported
//==============================================================================================================SymbolInfoDouble():
//+-----------------------------------------------------------------------------------------------------+
//|     double  SymbolInfoDouble( string NameSymbol, ENUM_SYMBOL_INFO_DOUBLE  property_identifier );    |
//+-----------------------------------------------------------------------------------------------------+
          double                        Symbol_BID;//                          Bid - best sell offer
          double                        Symbol_BIDHIGH;//                      Not supported
          double                        Symbol_BIDLOW;//                       Not supported
          double                        Symbol_ASK;//                          Ask - best buy offer
          double                        Symbol_ASKHIGH;//                      Not supported
          double                        Symbol_ASKLOW;//                       Not supported
          double                        Symbol_LAST;//                         Not supported
          double                        Symbol_LASTHIGH;//                     Not supported
          double                        Symbol_LASTLOW;//                      Not supported
          double                        Symbol_POINT;//                        Symbol point value
          double                        Symbol_TRADE_TICK_VALUE;//             Value of SYMBOL_TRADE_TICK_VALUE_PROFIT
          double                        Symbol_TRADE_TICK_VALUE_PROFIT;//      Not supported
          double                        Symbol_TRADE_TICK_VALUE_LOSS;//        Not supported
          double                        Symbol_TRADE_TICK_SIZE;//              Minimal price change
          double                        Symbol_TRADE_CONTRACT_SIZE;//          Trade contract size
          double                        Symbol_VOLUME_MIN;//                   Minimal volume for a deal
          double                        Symbol_VOLUME_MAX;//                   Maximal volume for a deal
          double                        Symbol_VOLUME_STEP;//                  Minimal volume change step for deal execution
          double                        Symbol_VOLUME_LIMIT;//                 Not supported
          double                        Symbol_SWAP_LONG;//                    Buy order swap value
          double                        Symbol_SWAP_SHORT;//                   Sell order swap value
          double                        Symbol_MARGIN_INITIAL;//               Initial margin means the amount in the margin currency required for opening an order with the volume of one lot.
          double                        Symbol_MARGIN_MAINTENANCE;//           The maintenance margin. If it is set, it sets the margin amount in the margin currency of the symbol,
          double                        Symbol_MARGIN_LONG;//                  Not supported
          double                        Symbol_MARGIN_SHORT;//                 Not supported
          double                        Symbol_MARGIN_LIMIT;//                 Not supported
          double                        Symbol_MARGIN_STOP;//                  Not supported
          double                        Symbol_MARGIN_STOPLIMIT;//             Not supported
          double                        Symbol_SESSION_VOLUME;//               Not supported
          double                        Symbol_SESSION_TURNOVER;//             Not supported
          double                        Symbol_SESSION_INTEREST;//             Not supported
          double                        Symbol_SESSION_BUY_ORDERS_VOLUME;//    Not supported
          double                        Symbol_SESSION_SELL_ORDERS_VOLUME;//   Not supported
          double                        Symbol_SESSION_OPEN;//                 Not supported
          double                        Symbol_SESSION_CLOSE;//                Not supported
          double                        Symbol_SESSION_AW;//                   Not supported
          double                        Symbol_SESSION_PRICE_SETTLEMENT;//     Not supported
          double                        Symbol_SESSION_PRICE_LIMIT_MIN;//      Not supported
          double                        Symbol_SESSION_PRICE_LIMIT_MAX ;//     Not supported
//==============================================================================================================SymbolInfoString():
//+-----------------------------------------------------------------------------------------------------+
//|     double  SymbolInfoString( string NameSymbol, ENUM_SYMBOL_INFO_DOUBLE  property_identifier );    |
//+-----------------------------------------------------------------------------------------------------+
          string                        Symbol_CURRENCY_BASE;//                Basic currency of a symbol
          string                        Symbol_CURRENCY_PROFIT;//              Profit currency
          string                        Symbol_CURRENCY_MARGIN;//              Margin currency
          string                        Symbol_DESCRIPTION;//                  Symbol description
          string                        Symbol_PATH;//                         Path in the symbol tree
//==============================================================================================================ENUM_SYMBOL_TRADE_MODE():
//==============================================================================================================ENUM_SYMBOL_TRADE_EXECUTION():
//==============================================================================================================ENUM_DAY_OF_WEEK
//+------------------------------------------------------------------+
//|   UpdateAll Methods     UpdateAll Methods     UpdateAll Methods  |
//+------------------------------------------------------------------+
public: //UpdateALL method
          bool                          UPDATEDAll;
          bool                          UpdateAll(string NameSymbol) {UPDATEDAll = false; UpdateMarket(NameSymbol); UpdateSymbol(NameSymbol); return UPDATEDAll = true;};
//+------------------------------------------------------------------+
//| UpdateMarket Methods  UpdateMarket Methods  UpdateMarket Methods |
//+------------------------------------------------------------------+
public: //UpdateMarket method
          bool                          UPDATEDMarket;
          bool                          UpdateMarket(string NameSymbol);

//+------------------------------------------------------------------+
//| UpdateSymbol Methods  UpdateSymbol Methods  UpdateSymbol Methods |
//+------------------------------------------------------------------+
public: //UpdateSymbol method
          bool                          UPDATEDSymbol;
          bool                          UpdateSymbol(string NameSymbol);

//==============================================================================================================
//+------------------------------------------------------------------+
//| UpdateSymbol Methods  UpdateSymbol Methods  UpdateSymbol Methods |
//+------------------------------------------------------------------+
public://protected:
          //MarketInfo(),               Returns various data about securities listed in the "Market Watch" window
          double __MarketInfo( string symbolName, int information_type) {return (MarketInfo(symbolName, information_type));};;
          //SymbolsTotal()              Returns the number of available (NameSymbol in Market Watch or all) symbols,
          int    __SymbolsTotal( bool  NameSymbol /*True - only symbols in MarketWatch*/) {return (SymbolsTotal(NameSymbol));};
          //===============================================================
          //SymbolName(),               Returns the name of a specified symbol
          string __SymbolNameByPos( int posNumber_in_the_list, bool NameSymbol_true_only_symbols_in_MarketWatch) {return (SymbolName(posNumber_in_the_list, NameSymbol_true_only_symbols_in_MarketWatch));};
          //===============================================================
          //SymbolSelect()              Selects a symbol in the Market Watch window or removes a symbol from the window
          bool   __SymbolSelect( string  symbolName, bool selectAddorTemove ) {return (SymbolSelect(symbolName, selectAddorTemove));};
          //===============================================================
          //SymbolInfoDouble()          Returns the double value of the symbol for the corresponding property
          double  __SymbolInfoDouble( string symbolName, ENUM_SYMBOL_INFO_DOUBLE  prop_id ) {return (SymbolInfoDouble(symbolName, prop_id));};
          //===============================================================
          //SymbolInfoInteger()         Returns a value of an integer type (long, datetime, int or bool) of a specified symbol for the corresponding property
          long  __SymbolInfoInteger( string symbolName, ENUM_SYMBOL_INFO_INTEGER  prop_id) {return (SymbolInfoInteger(symbolName, prop_id));};
          //===============================================================
          //SymbolInfoString()          Returns a value of the string type of a specified symbol for the corresponding property
          string  __SymbolInfoString( string symbolName, ENUM_SYMBOL_INFO_STRING  prop_id ) {return (SymbolInfoString(symbolName, prop_id));};
          //===============================================================
          //SymbolInfoTick()            Returns the current prices for the specified symbol in a variable of the MqlTick type
          bool  __SymbolInfoTick( string symbolName, MqlTick& tickReference_to_a_structure) {return (SymbolInfoTick(symbolName, tickReference_to_a_structure));};
          //===============================================================
          //SymbolInfoSessionQuote()    Allows receiving time of beginning and end of the specified quoting sessions for a specified symbol and day of week.
          // By the way, session index depends of the traded symbol. I never saw such list.
          // [out]  Session beginning time in seconds from 00 hours 00 minutes, in the returned value date should be ignored.
          // [in]   Ordinal number of a session, whose beginning and end time we want to receive. Indexing of sessions starts with 0.
          // [out]  Session end time in seconds from 00 hours 00 minutes, in the returned value date should be ignored.
          bool  __SymbolInfoSessionQuote ( string symbolName, ENUM_DAY_OF_WEEK  day_of_week, uint session_index, datetime& from_time_of_the_session_beginning, datetime& to_time_of_the_session_end) {return (SymbolInfoSessionQuote(symbolName, day_of_week, session_index, from_time_of_the_session_beginning, to_time_of_the_session_end));};
          //===============================================================
          //SymbolInfoSessionTrade()    Allows receiving time of beginning and end of the specified trading sessions for a specified symbol and day of week.
          // session index//[in]  Ordinal number of a session, whose beginning and end time we want to receive. Indexing of sessions starts with 0.
          // session end time
          // session beginning time
          bool  __SymbolInfoSessionTrade( string symbolName, ENUM_DAY_OF_WEEK  day_of_week, uint session_index, datetime& from_session_beginning_time, datetime& tosession_end_time ) {return (SymbolInfoSessionTrade(symbolName, day_of_week, session_index, from_session_beginning_time, tosession_end_time));};
          //===============================================================
          // MQL5 >>Depth of Market()
          //MarketBookAdd()
          //MarketBookRelease()
          //MarketBookGet()
//=========================================================================================================================================================================

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_MqlMarketSymbol::UpdateMarket(string NameSymbol)
{         UPDATEDMarket                   = false;
          Market_BID                 = MarketInfo(NameSymbol, MODE_BID); //
          Market_ASK                 = MarketInfo(NameSymbol, MODE_ASK); //
          Market_HIGH                = MarketInfo(NameSymbol, MODE_HIGH); //High day price
          Market_LOW                 = MarketInfo(NameSymbol, MODE_LOW); // Low  day price
          Market_TIME                = MarketInfo(NameSymbol, MODE_TIME); //The last incoming tick time (last known server time)
          Market_POINT               = MarketInfo(NameSymbol, MODE_POINT); // Low  day price
          Market_DIGITS              = MarketInfo(NameSymbol, MODE_DIGITS); //Alert("MODE_DIGITS: ", DIGITS); // //// Low  day price
          Market_SPREAD              = MarketInfo(NameSymbol, MODE_SPREAD); //
//---------------------------------------------------------------------------------------------------
          Market_STOPLEVEL           = MarketInfo(NameSymbol, MODE_STOPLEVEL); //MODE_STOPLEVELMinStop
          Market_TICKVALUE           = MarketInfo(NameSymbol, MODE_TICKVALUE); //
          Market_TICKSIZE            = MarketInfo(NameSymbol, MODE_TICKSIZE); //
          Market_LOTSIZE             = MarketInfo(NameSymbol, MODE_LOTSIZE); //
          Market_MINLOT              = MarketInfo(NameSymbol, MODE_MINLOT); //Alert("MODE_MINLOT", MinStop); // //
          Market_MAXLOT              = MarketInfo(NameSymbol, MODE_MAXLOT); //Alert("MODE_MAXLOT", MaxLot); // //
          Market_LOTSTEP             = MarketInfo(NameSymbol, MODE_LOTSTEP); //
//---------------------------------------------------------------------------------------------------
          Market_SWAPLONG            = MarketInfo(NameSymbol, MODE_SWAPLONG); //Swap of the buy order
          Market_SWAPSHORT           = MarketInfo(NameSymbol, MODE_SWAPSHORT);//Swap of the sell order
          Market_SWAPTYPE            = MarketInfo(NameSymbol, MODE_SWAPTYPE);//Swap calculation method. 0 - in points; 1 - in the symbol base currency; 2 - by interest; 3 - in the margin currency
          Market_PROFITCALCMODE      = MarketInfo(NameSymbol, MODE_PROFITCALCMODE); //Profit calculation mode. 0 - Forex; 1 - CFD; 2 - Futures
          Market_MARGINCALCMODE      = MarketInfo(NameSymbol, MODE_MARGINCALCMODE); //Margin calculation mode. 0 - Forex; 1 - CFD; 2 - Futures; 3 - CFD for indices
          Market_MARGININIT          = MarketInfo(NameSymbol, MODE_MARGININIT); //Initial margin requirements for 1 lot
          Market_MARGINMAINTENANCE   = MarketInfo(NameSymbol, MODE_MARGINMAINTENANCE);//Margin to maintain open orders calculated for 1 lot
          Market_MARGINHEDGED        = MarketInfo(NameSymbol, MODE_MARGINHEDGED);//Hedged margin calculated for 1 lot
          Market_MarginHedging       = MarketInfo(NameSymbol, MODE_MARGINHEDGED);
          Market_MARGINREQUIRED      = MarketInfo(NameSymbol, MODE_MARGINREQUIRED);//Free margin required to open 1 lot for buying --
          Market_FREEZELEVEL         = MarketInfo(NameSymbol, MODE_FREEZELEVEL);//ct_Order freeze level in points. If the execution price lies within the range defined by the freeze level, the order cannot be modified, cancelled or closed
//---------------------------------------------------------------------------------------------------
          Market_STARTING            = MarketInfo(NameSymbol, MODE_STARTING); //Market starting date (usually used for futures)
          Market_EXPIRATION          = MarketInfo(NameSymbol, MODE_EXPIRATION); //Market expiration  date (usually used for futures)
//---------------------------------------------------------------------------------------------------
          Market_TRADEALLOWED        = MarketInfo(NameSymbol, MODE_TRADEALLOWED );
          Market_CLOSEBY_ALLOWED     = MarketInfo(NameSymbol, MODE_CLOSEBY_ALLOWED);
//---------------------------------------------------------------------------------------------------
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATEDMarket = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          return UPDATEDMarket;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_MqlMarketSymbol::UpdateSymbol(string NameSymbol)
{         ///---off ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          UPDATEDSymbol       = false;
          //---? Amount of money in base currency for 1 lot//
          //+----------------------------------------------------------------------+
          //|-------integer--------//-------integer--------//-------integer--------|SymbolInfoInteger();
          //+----------------------------------------------------------------------+
          Symbol_SELECT                              = SymbolInfoInteger(NameSymbol, SYMBOL_SELECT);//                                 Symbol is NameSymbol in Market Watch.
          Symbol_VISIBLE                             = SymbolInfoInteger(NameSymbol, SYMBOL_VISIBLE);//                                Symbol is visible in Market Watch.
          //---Symbol_SESSION_DEALS                  = SymbolInfoInteger(NameSymbol, SYMBOL_SESSION_DEALS);//                Not supported
          //---Symbol_SESSION_BUY_ORDERS             = SymbolInfoInteger(NameSymbol, SYMBOL_SESSION_BUY_ORDERS);//           Not supported
          //---Symbol_SESSION_SELL_ORDERS            = SymbolInfoInteger(NameSymbol, SYMBOL_SESSION_SELL_ORDERS);//          Not supported
          //---Symbol_VOLUME                         = SymbolInfoInteger(NameSymbol, SYMBOL_VOLUME);//                       Not supported                                                                                                             long
          //---Symbol_VOLUMEHIGH                     = SymbolInfoInteger(NameSymbol, SYMBOL_VOLUMEHIGH);//                   Not supported
          //---Symbol_VOLUMELOW                      = SymbolInfoInteger(NameSymbol, SYMBOL_VOLUMELOW);//                    Not supported
          Symbol_TIME                                = (datetime)SymbolInfoInteger(NameSymbol, SYMBOL_TIME);//                                   Time of the "last quote"
          Symbol_DIGITS                              = (int)SymbolInfoInteger(NameSymbol, SYMBOL_DIGITS);//                                      Digits after a decimal point
          Symbol_SPREAD_FLOAT                        = SymbolInfoInteger(NameSymbol, SYMBOL_SPREAD_FLOAT);//                                     Indication of a floating spread
          Symbol_SPREAD                              = (int)SymbolInfoInteger(NameSymbol, SYMBOL_SPREAD);//                                      Spread value in points
          Symbol_TRADE_CALC_MODE                     = (int)SymbolInfoInteger(NameSymbol, SYMBOL_TRADE_CALC_MODE);//                             Contract price calculation mode
          ///---offE.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          Symbol_TRADE_MODE                          = (ENUM_SYMBOL_TRADE_MODE)SymbolInfoInteger(NameSymbol, SYMBOL_TRADE_MODE);//               ct_Order execution type //---retuner -- SYMBOL_TRADE_MODE_FULL
          Symbol_START_TIME                          = (datetime)SymbolInfoInteger(NameSymbol, SYMBOL_START_TIME);//                             Date of the symbol trade beginning (usually used for futures)
          Symbol_EXPIRATION_TIME                     = (datetime)SymbolInfoInteger(NameSymbol, SYMBOL_EXPIRATION_TIME);//                        Date of the symbol trade end (usually used for futures)
          Symbol_TRADE_STOPS_LEVEL                   = (int)SymbolInfoInteger(NameSymbol, SYMBOL_TRADE_STOPS_LEVEL);//                           Minimal indention in points from the current close price to place Stop orders
          Symbol_TRADE_FREEZE_LEVEL                  = (int)SymbolInfoInteger(NameSymbol, SYMBOL_TRADE_FREEZE_LEVEL);//                          Distance to freeze trade operations in points
          Symbol_TRADE_EXEMODE                       = (ENUM_SYMBOL_TRADE_EXECUTION)SymbolInfoInteger(NameSymbol, SYMBOL_TRADE_EXEMODE);//       Deal execution mode
          Symbol_SWAP_MODE                           = (int)SymbolInfoInteger(NameSymbol, SYMBOL_SWAP_MODE);//                                   Swap calculation model
          Symbol_SWAP_ROLLOVER3DAYS                  = (ENUM_DAY_OF_WEEK)SymbolInfoInteger(NameSymbol, SYMBOL_SWAP_ROLLOVER3DAYS);//             Day of week to charge 3 days swap rollover
          //--- Symbol_EXPIRATION_MODE               = (int)SymbolInfoInteger(NameSymbol, SYMBOL_EXPIRATION_MODE);//                 Not supported
          //--- Symbol_FILLING_MODE                  = (int)SymbolInfoInteger(NameSymbol, SYMBOL_FILLING_MODE);//                    Not supported
          //--- Symbol_ORDER_MODE                    = (int)SymbolInfoInteger(NameSymbol, SYMBOL_ORDER_MODE);//                      Not supported
          //+----------------------------------------------------------------------+
          //|-------Double---------//--------Double--------//--------Double--------|SymbolInfoDouble():
          //+----------------------------------------------------------------------+
          Symbol_BID                                 = SymbolInfoDouble(NameSymbol, SYMBOL_BID);//                                   Bid - best sell offer
          //--- Symbol_BIDHIGH                       = SymbolInfoDouble(NameSymbol, SYMBOL_BIDHIGH);//                               Not supported
          //--- Symbol_BIDLOW                        = SymbolInfoDouble(NameSymbol, SYMBOL_BIDLOW);//                                Not supported
          Symbol_ASK                                 = SymbolInfoDouble(NameSymbol, SYMBOL_ASK);//                                   Ask - best buy offer
          //--- Symbol_ASKHIGH                       = SymbolInfoDouble(NameSymbol, SYMBOL_ASKHIGH);//                               Not supported
          //--- Symbol_ASKLOW                        = SymbolInfoDouble(NameSymbol, SYMBOL_ASKLOW);//                                Not supported
          //--- Symbol_LAST                          = SymbolInfoDouble(NameSymbol, SYMBOL_LAST);//                                  Not supported
          //--- Symbol_LASTHIGH                      = SymbolInfoDouble(NameSymbol, SYMBOL_LASTHIGH);//                              Not supported
          //--- Symbol_LASTLOW                       = SymbolInfoDouble(NameSymbol, SYMBOL_LASTLOW);//                               Not supported
          Symbol_POINT                               = SymbolInfoDouble(NameSymbol, SYMBOL_POINT);//                                 Symbol point value
          Symbol_TRADE_TICK_VALUE                    = SymbolInfoDouble(NameSymbol, SYMBOL_TRADE_TICK_VALUE);//                      Value of SYMBOL_TRADE_TICK_VALUE_PROFIT //Tick value in the deposit currency
          //--- Symbol_TRADE_TICK_VALUE_PROFIT       = SymbolInfoDouble(NameSymbol, SYMBOL_TRADE_TICK_VALUE_PROFIT);//               Not supported
          //--- Symbol_TRADE_TICK_VALUE_LOSS         = SymbolInfoDouble(NameSymbol, SYMBOL_TRADE_TICK_VALUE_LOSS);//                 Not supported
          Symbol_TRADE_TICK_SIZE                     = SymbolInfoDouble(NameSymbol, SYMBOL_TRADE_TICK_SIZE);//                       Minimal price change
          Symbol_TRADE_CONTRACT_SIZE                 = SymbolInfoDouble(NameSymbol, SYMBOL_TRADE_CONTRACT_SIZE);//Alert("TRADE_CONTRACT_SIZE: ", TRADE_CONTRACT_SIZE); //          Trade contract size
          Symbol_VOLUME_MIN                          = SymbolInfoDouble(NameSymbol, SYMBOL_VOLUME_MIN);//                   Minimal volume for a deal
          Symbol_VOLUME_MAX                          = SymbolInfoDouble(NameSymbol, SYMBOL_VOLUME_MAX); //Alert("VOLUME_MAX: ", VOLUME_MAX); //                   Maximal volume for a deal
          Symbol_VOLUME_STEP                         = SymbolInfoDouble(NameSymbol, SYMBOL_VOLUME_STEP);//                  Minimal volume change step for deal execution
          //---Symbol_VOLUME_LIMIT                   = SymbolInfoDouble(NameSymbol, SYMBOL_VOLUME_LIMIT);//                 Not supported
          Symbol_SWAP_LONG                           = SymbolInfoDouble(NameSymbol, SYMBOL_SWAP_LONG);//                    Buy order swap value
          Symbol_SWAP_SHORT                          = SymbolInfoDouble(NameSymbol, SYMBOL_SWAP_SHORT);//                   Sell order swap value
          Symbol_MARGIN_INITIAL                      = SymbolInfoDouble(NameSymbol, SYMBOL_MARGIN_INITIAL);//               Initial margin means the amount in the margin currency required for opening an order with the volume of one lot.
          Symbol_MARGIN_MAINTENANCE                  = SymbolInfoDouble(NameSymbol, SYMBOL_MARGIN_MAINTENANCE);//           The maintenance margin. If it is set, it sets the margin amount in the margin currency of the symbol,
          //--- Symbol_MARGIN_LONG                   = SymbolInfoDouble(NameSymbol, SYMBOL_MARGIN_LONG);//                  Not supported
          //--- Symbol_MARGIN_SHORT                  = SymbolInfoDouble(NameSymbol, SYMBOL_MARGIN_SHORT);//                 Not supported
          //--- Symbol_MARGIN_LIMIT                  = SymbolInfoDouble(NameSymbol, SYMBOL_MARGIN_LIMIT);//                 Not supported
          //--- Symbol_MARGIN_STOP                   = SymbolInfoDouble(NameSymbol, SYMBOL_MARGIN_STOP);//                  Not supported
          //--- Symbol_MARGIN_STOPLIMIT              = SymbolInfoDouble(NameSymbol, SYMBOL_MARGIN_STOPLIMIT);//             Not supported
          //--- Symbol_SESSION_VOLUME                = SymbolInfoDouble(NameSymbol, SYMBOL_SESSION_VOLUME);//               Not supported
          //--- Symbol_SESSION_TURNOVER              = SymbolInfoDouble(NameSymbol, SYMBOL_SESSION_TURNOVER);//             Not supported
          //--- Symbol_SESSION_INTEREST              = SymbolInfoDouble(NameSymbol, SYMBOL_SESSION_INTEREST);//             Not supported
          //--- Symbol_SESSION_BUY_ORDERS_VOLUME     = SymbolInfoDouble(NameSymbol, SYMBOL_SESSION_BUY_ORDERS_VOLUME);//    Not supported
          //--- Symbol_SESSION_SELL_ORDERS_VOLUME    = SymbolInfoDouble(NameSymbol, SYMBOL_SESSION_SELL_ORDERS_VOLUME);//   Not supported
          //--- Symbol_SESSION_OPEN                  = SymbolInfoDouble(NameSymbol, SYMBOL_SESSION_OPEN);//                 Not supported
          //--- Symbol_SESSION_CLOSE                 = SymbolInfoDouble(NameSymbol, SYMBOL_SESSION_CLOSE);//                Not supported
          //--- Symbol_SESSION_AW                    = SymbolInfoDouble(NameSymbol, SYMBOL_SESSION_AW);//                   Not supported
          //--- Symbol_SESSION_PRICE_SETTLEMENT      = SymbolInfoDouble(NameSymbol, SYMBOL_SESSION_PRICE_SETTLEMENT);//     Not supported
          //--- Symbol_SESSION_PRICE_LIMIT_MIN       = SymbolInfoDouble(NameSymbol, SYMBOL_SESSION_PRICE_LIMIT_MIN);//      Not supported
          //--- Symbol_SESSION_PRICE_LIMIT_MAX       = SymbolInfoDouble(NameSymbol, SYMBOL_SESSION_PRICE_LIMIT_MAX);//     Not supported
          ///---off ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          //+----------------------------------------------------------------------+
          //|-------String---------//--------String--------//--------String--------|SymbolInfoString():
          //+----------------------------------------------------------------------+
          Symbol_CURRENCY_BASE                       = SymbolInfoString(NameSymbol, SYMBOL_CURRENCY_BASE);         if (Symbol_CURRENCY_BASE == "RUR") Symbol_CURRENCY_BASE = "RUB"; //Alert("SYMBOL_CURRENCY_BASE: ", CURRENCY_BASE);//                Basic currency of a symbol
          Symbol_CURRENCY_PROFIT                     = SymbolInfoString(NameSymbol, SYMBOL_CURRENCY_PROFIT);       if (Symbol_CURRENCY_PROFIT == "RUR") Symbol_CURRENCY_PROFIT = "RUB";
          Symbol_CURRENCY_MARGIN                     = SymbolInfoString(NameSymbol, SYMBOL_CURRENCY_BASE);//       Margin currency
          Symbol_DESCRIPTION                         = SymbolInfoString(NameSymbol, SYMBOL_DESCRIPTION);//         Symbol description
          Symbol_PATH                                = SymbolInfoString(NameSymbol, SYMBOL_PATH);//                Path in the symbol tree.
//=================================================================================================================
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATEDSymbol = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          ///---offE.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          return UPDATEDSymbol;//
}
//+------------------------------------------------------------------+
//||   ||||||||||            tMqlMarketMqlSymbol.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 3 msec elapsed            1         1
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
