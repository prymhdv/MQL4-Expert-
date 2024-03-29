//+------------------------------------------------------------------+
//||   ||||||||||                 Sd_Debuging.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

struct Sd_Debuging
{         /*
          //================================================================================================================================
          MQL4 Reference  /  Constants, Enumerations and Structures  /  Named Constants / Predefined Macro Substitutions  ???????????
          Predefined Macro Substitutions
          To simplify the debugging process and obtain information about operation of a mql4-program,
          there are special macro constant, values of which are set at the moment of compilation.
           The easiest way to use these constants is outputting values by the Print() function, as it's shown in the example.
          Constant              Description
          //--------------------------------------------------------------------------------------------------------------------------------
          __DATE__              File compilation date without time (hours, minutes and seconds are equal to 0)
          __DATETIME__          File compilation date and time
          __LINE__              Line number in the source code, in which the macro is located
          __FILE__              Name of the currently compiled file
          __PATH__              An absolute path to the file that is currently being compiled
          __FUNCTION__          Name of the function, in whose body the macro is located
          __FUNCSIG__           Signature of the function in whose body the macro is located.
                                Logging of the full description of functions can be useful in the identification of overloaded functions.
          __MQLBUILD__,         Compiler build number
          __MQL4BUILD__         Compiler build number
          //================================================================================================================================
          */
          datetime      DATE_com;       //      __DATE__
          datetime      DATETIME_com;   //      __DATETIME__
          int           Line_com;       // = 0; __LINE__
          string        FILE_com;       //      __FILE__
          string        PATH_com;       //      __PATH__
          string        FUNCTION_com;   //      __FUNCTION__ = "None";
          string        FUNCSIG_com;    //      __FUNCSIG__
          int           MQLBUILD_com;   //      __MQLBUILD__
          int           MQL4BUILD_com;  //      __MQL4BUILD__
          //
          void          Catch(datetime A, datetime B, int C, string D, string E, string F, string G, int H, int I)
          {         DATE_com            = A;      //__DATE__;
                    DATETIME_com        = B;      //__DATETIME__;
                    Line_com            = C;      //__LINE__;
                    FILE_com            = D;      //__FILE__;
                    PATH_com            = E;      //__PATH__
                    FUNCTION_com        = F;      //__FUNCTION__;
                    FUNCSIG_com         = G;      //__FUNCSIG__;
                    MQLBUILD_com        = H;      //__MQLBUILD__; //
                    MQL4BUILD_com       = I;      //__MQL4BUILD__;
          }   //Debuging.Catch(__DATE__, __DATETIME__, __LINE__, __FILE__, __PATH__, __FUNCTION__, __FUNCSIG__, __MQLBUILD__, __MQL4BUILD__);//---Debuging.FUNCSIG_com
          //--------------------------------------------------------------------------------------------------------------------------------
}; Sd_Debuging Debuging;





//+------------------------------------------------------------------+
//||   ||||||||||                 Sd_Debuging.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
