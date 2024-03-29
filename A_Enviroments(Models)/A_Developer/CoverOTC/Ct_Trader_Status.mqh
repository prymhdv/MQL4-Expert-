//+------------------------------------------------------------------+
//|                                                     C_TRADER.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+MyRobo
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class C_TRADER     BEGIN                             |
//+------------------------------------------------------------------+

//=====================================================================================
union U_Staticer
{         double NetProfit,  GROSS_PROFIT,  GROSS_LOSS,  INITIAL_DEPOSIT;
          double MAX_PROFITTRADE,  TRADES,  LOSS_TRADES,  SHORT_TRADES;
          double  LONG_TRADES,  LOSSTRADES_AVG,  PROFITTRADES_AVG, NetPROFITTRADES_AVG;
//===============================================================================
          void  U_Staticer()  //
          {         //
                    //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    return; //
          }; // constructor must be of the void type Capitan.mqh         3160      15
//===============================================================================
          ~U_Staticer()  //
          {         //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    return; //
          }; //
//===============================================================================
};
//===============================================================================//===============================================================================
U_Staticer fStaticS() //create function of enum..  the return
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          U_Staticer U_Staticer1;
          U_Staticer1.NetProfit = TesterStatistics(STAT_PROFIT);                  //STAT_PROFIT       double    // STAT_TRADES; //STAT_BALANCEMIN //statistic_id  // ENUM_STATISTICS
          U_Staticer1.GROSS_PROFIT = TesterStatistics(STAT_GROSS_PROFIT);         //STAT_GROSS_PROFIT            double
          U_Staticer1.GROSS_LOSS =  TesterStatistics(STAT_GROSS_LOSS);               //STAT_GROSS_LOSS              double
          U_Staticer1.INITIAL_DEPOSIT =  TesterStatistics(STAT_INITIAL_DEPOSIT);     //STAT_INITIAL_DEPOSIT         double
          U_Staticer1.MAX_PROFITTRADE =  TesterStatistics(STAT_MAX_PROFITTRADE);     //STAT_MAX_PROFITTRADE         double
          U_Staticer1.TRADES =   TesterStatistics(STAT_TRADES);
          U_Staticer1.LOSS_TRADES =  TesterStatistics(STAT_LOSS_TRADES);
          U_Staticer1.SHORT_TRADES =  TesterStatistics(STAT_SHORT_TRADES);
          U_Staticer1.LONG_TRADES =  TesterStatistics(STAT_LONG_TRADES);
          U_Staticer1.LOSSTRADES_AVG =  TesterStatistics(STAT_LOSSTRADES_AVGCON);
          U_Staticer1.PROFITTRADES_AVG =  TesterStatistics(STAT_PROFITTRADES_AVGCON);
          U_Staticer1.NetPROFITTRADES_AVG =  U_Staticer1.PROFITTRADES_AVG - U_Staticer1.LOSSTRADES_AVG; return U_Staticer1;
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Capitan.mqh Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return U_Staticer1; //
//
}
//+------------------------------------------------------------------+
//|             Class C_TRADER     BEGIN                             |
//+------------------------------------------------------------------+ 
