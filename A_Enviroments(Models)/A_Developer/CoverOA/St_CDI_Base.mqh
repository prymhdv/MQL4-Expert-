//+------------------------------------------------------------------+
//||   ||||||||||       Ct_DevCondicator_Base.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\tMqlConductor.mqh>
#define DirecrH 0
#define DirecrBackward5 5
//#define DirecrForward5 -5 \\not existed
#define DirecrBackward10 10
#define DirecrForward10 -10
#define EMA_FLine_Shift5 5
#define EMA_BLine_Shift5 -5
#define       limitY 200

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class  St_CDI_Base
{

public:
          St_MqlCondicator      MQL;
          St_CDI_Base(){};
          ~St_CDI_Base(){};


protected:
          void           Resize_X2000Array_X200Array_X20Array(double & First_X2000[], double & Second_X2000_EMA20[], double & Second_X2000_SMA20[], double & Second_X2000_EMA200[], double & Second_X2000_SMA200[], double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], double & First_X20[], double & Second_X20_EMA20[], double & Second_X20_SMA20[], double & Second_X20_EMA200[], double & Second_X20_SMA200[], int limitYX = 200);
          void           Resize_X200Array_X20Array(double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], double & First_X20[], double & Second_X20_EMA20[], double & Second_X20_SMA20[], double & Second_X20_EMA200[], double & Second_X20_SMA200[], int limitYX = 200);

          void           Init_X200Array_X20Array(string InMode, double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], double & First_X20[], double & Second_X20_EMA20[], double & Second_X20_SMA20[], double & Second_X20_EMA200[], double & Second_X20_SMA200[],  int limitYX = 200);
          void           Init_X2000Array_X200Array_X20Array(string InMode, double & First_X2000[], double & Second_X2000_EMA20[], double & Second_X2000_SMA20[], double & Second_X2000_EMA200[], double & Second_X2000_SMA200[], double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], double & First_X20[], double & Second_X20_EMA20[], double & Second_X20_SMA20[], double & Second_X20_EMA200[], double & Second_X20_SMA200[],  int limitYX = 200);

          void           Resize_XModeArray(double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], int limitYX = 200);
          void           Init_XModeArray(string InMode, double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], int limitYX = 200);//
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Base::Resize_X2000Array_X200Array_X20Array(double & First_X2000[], double & Second_X2000_EMA20[], double & Second_X2000_SMA20[], double & Second_X2000_EMA200[], double & Second_X2000_SMA200[], double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], double & First_X20[], double & Second_X20_EMA20[], double & Second_X20_SMA20[], double & Second_X20_EMA200[], double & Second_X20_SMA200[], int limitYX = 200)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          ArrayResize(First_X2000, limitYX, 10);
          ArrayResize(Second_X2000_EMA20, limitYX, 10);
          ArrayResize(Second_X2000_SMA20, limitYX, 10);
          ArrayResize(Second_X2000_EMA200, limitYX, 10);
          ArrayResize(Second_X2000_SMA200, limitYX, 10);
//==
          ArrayResize(First_X200, limitYX, 10);
          ArrayResize(Second_X200_EMA20, limitYX, 10);
          ArrayResize(Second_X200_SMA20, limitYX, 10);
          ArrayResize(Second_X200_EMA200, limitYX, 10);
          ArrayResize(Second_X200_SMA200, limitYX, 10);
//==
          ArrayResize(First_X20, limitYX, 10);
          ArrayResize(Second_X20_EMA20, limitYX, 10);
          ArrayResize(Second_X20_SMA20, limitYX, 10);
          ArrayResize(Second_X20_EMA200, limitYX, 10);
          ArrayResize(Second_X20_SMA200, limitYX, 10);
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Base::Resize_X200Array_X20Array(double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], double & First_X20[], double & Second_X20_EMA20[], double & Second_X20_SMA20[], double & Second_X20_EMA200[], double & Second_X20_SMA200[], int limitYX = 200)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          ArrayResize(First_X200, limitYX, 10);
          ArrayResize(Second_X200_EMA20, limitYX, 10);
          ArrayResize(Second_X200_SMA20, limitYX, 10);
          ArrayResize(Second_X200_EMA200, limitYX, 10);
          ArrayResize(Second_X200_SMA200, limitYX, 10);
//==
          ArrayResize(First_X20, limitYX, 10);
          ArrayResize(Second_X20_EMA20, limitYX, 10);
          ArrayResize(Second_X20_SMA20, limitYX, 10);
          ArrayResize(Second_X20_EMA200, limitYX, 10);
          ArrayResize(Second_X20_SMA200, limitYX, 10);
//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Base::Init_X200Array_X20Array(string InMode, double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], double & First_X20[], double & Second_X20_EMA20[], double & Second_X20_SMA20[], double & Second_X20_EMA200[], double & Second_X20_SMA200[],  int limitYX = 200)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          ArrayResize(First_X200, limitYX, 10);
          ArrayResize(Second_X200_EMA20, limitYX, 10);
          ArrayResize(Second_X200_SMA20, limitYX, 10);
          ArrayResize(Second_X200_EMA200, limitYX, 10);
          ArrayResize(Second_X200_SMA200, limitYX, 10);
//==
          ArrayResize(First_X20, limitYX, 10);
          ArrayResize(Second_X20_EMA20, limitYX, 10);
          ArrayResize(Second_X20_SMA20, limitYX, 10);
          ArrayResize(Second_X20_EMA200, limitYX, 10);
          ArrayResize(Second_X20_SMA200, limitYX, 10);
////////
          if(InMode == "iRSI")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] = iRSI(NULL, 0, 200, PRICE_CLOSE, i);
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              First_X20[i]  = iRSI(NULL, 0, 14, PRICE_CLOSE, i);
                              First_X20[i]  = NormalizeDouble(First_X20[i], 2);
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
///====
          if(InMode == "iBearsPower")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] = iBearsPower(NULL, 0, 200, PRICE_CLOSE, i);//
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              First_X20[i]  =  iBearsPower(NULL, 0, 14, PRICE_CLOSE, i);//
                              First_X20[i]  = NormalizeDouble(First_X20[i], 2);
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
///====
          if(InMode == "iBullsPower")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] = iBullsPower(NULL, 0, 200, PRICE_CLOSE, i);//
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              First_X20[i]  =  iBullsPower(NULL, 0, 14, PRICE_CLOSE, i);//
                              First_X20[i]  = NormalizeDouble(First_X20[i], 2);
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
///====
          if(InMode == "iStochastic")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] = iStochastic(NULL, 0, 200,  3, 3, MODE_EMA, 0, MODE_MAIN, i);//
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              First_X20[i]  = iStochastic(NULL, 0, 20,  3, 3, MODE_EMA, 0, MODE_MAIN, i);//
                              First_X20[i]  = NormalizeDouble(First_X20[i], 2);
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
///====
          if(InMode == "iMFI")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] = iMFI(NULL, 0, 200, i ); //
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              First_X20[i] = iMFI(NULL, 0, 20, i ); //
                              First_X20[i] = NormalizeDouble(First_X20[i], 2);
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
///====
          if(InMode == "iWPR")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] = iWPR(NULL, 0, 200, i ); //
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              First_X20[i] = iWPR(NULL, 0, 20, i ); //
                              First_X20[i] = NormalizeDouble(First_X20[i], 2);
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
          if(InMode == "iMomentum")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] = iMomentum(NULL, 0, 200, PRICE_CLOSE, i);  //
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              First_X20[i] = iMomentum(NULL, 0, 20, PRICE_CLOSE, i);  //
                              First_X20[i] = NormalizeDouble(First_X20[i], 2);
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
          if(InMode == "iCCI")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] = iCCI(NULL, 0, 200, PRICE_CLOSE, i);  //
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              First_X20[i] = iCCI(NULL, 0, 20, PRICE_CLOSE, i);  //
                              First_X20[i] = NormalizeDouble(First_X20[i], 2);
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
          if(InMode == "iStdDev")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] = iStdDev(NULL,  0, 200, 0, MODE_EMA, PRICE_CLOSE, i);  //
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              First_X20[i] = iStdDev(NULL,  0, 20, 0, MODE_EMA, PRICE_CLOSE, i);  //
                              First_X20[i] = NormalizeDouble(First_X20[i], 2);
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
//if(ArraySetAsSeries(First_WPRs200, true))//wrong//
          {         //Alert( First_WPRs200[0], "--First_WPRs200--", __LINE__); ///First_WPRs200[limitY - 1]
                    //
          }
          ArraySetAsSeries(First_X200, true);
          ArraySetAsSeries(First_X20, true);
/////////////////===== _WPRs_MA
          for(int i = 0; i < limitY  ; i++)
          {         Second_X200_EMA20[i]   = iMAOnArray(First_X200, 0, 20, 0, MODE_EMA, i);// 0 means the whole array.
                    Second_X200_EMA20[i] = NormalizeDouble(Second_X200_EMA20[i], 2);
                    //////======
                    Second_X200_SMA20[i]   = iMAOnArray(First_X200, 0, 20, 0, MODE_SMA, i);
                    Second_X200_SMA20[i] = NormalizeDouble(Second_X200_SMA20[i], 2);
                    ///--------------------------
                    Second_X20_EMA20[i]   = iMAOnArray(First_X20, 0, 20, 0, MODE_EMA, i);// 0 means the whole array.
                    Second_X20_EMA20[i] = NormalizeDouble(Second_X20_EMA20[i], 2);
                    //////======
                    Second_X20_SMA20[i]   = iMAOnArray(First_X20, 0, 20, 0, MODE_SMA, i);
                    Second_X20_SMA20[i] = NormalizeDouble(Second_X20_SMA20[i], 2);
                    ////
          }
///To access to the array elements as to a series array (i.e., from right to left), one has to use the ArraySetAsSeries() function.
////////====
//  if(!ArraySetAsSeries(First_WPRs, false));//wrong// for line creating
          {         // Alert( Second_WPRs200_EMA20[0] , "--Second_WPRs200_EMA20--", __LINE__); //Second_WPRs200_EMA20[limitY - 1]
                    // Alert( Second_WPRs200_SMA20[0] , "--Second_WPRs200_SMA20--", __LINE__); //Second_WPRs200_SMA20[limitY - 1],
          }
//ArraySetAsSeries(Second_WPRsEMA, true);//wrong
//ArraySetAsSeries(Second_WPRsSMA, true);//Wrong
///============
// return Second_MA;//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}//;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Base::Init_X2000Array_X200Array_X20Array(string InMode, double & First_X2000[], double & Second_X2000_EMA20[], double & Second_X2000_SMA20[], double & Second_X2000_EMA200[], double & Second_X2000_SMA200[], double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], double & First_X20[], double & Second_X20_EMA20[], double & Second_X20_SMA20[], double & Second_X20_EMA200[], double & Second_X20_SMA200[],  int limitYX = 200)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          ArrayResize(First_X200, limitYX, 10);
          ArrayResize(Second_X200_EMA20, limitYX, 10);
          ArrayResize(Second_X200_SMA20, limitYX, 10);
          ArrayResize(Second_X200_EMA200, limitYX, 10);
          ArrayResize(Second_X200_SMA200, limitYX, 10);
//==
          ArrayResize(First_X20, limitYX, 10);
          ArrayResize(Second_X20_EMA20, limitYX, 10);
          ArrayResize(Second_X20_SMA20, limitYX, 10);
          ArrayResize(Second_X20_EMA200, limitYX, 10);
          ArrayResize(Second_X20_SMA200, limitYX, 10);
////////
          if(InMode == "iRSI")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] = iRSI(NULL, 0, 200, PRICE_CLOSE, i);
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              First_X20[i]  = iRSI(NULL, 0, 14, PRICE_CLOSE, i);
                              First_X20[i]  = NormalizeDouble(First_X20[i], 2);
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }///
          ArraySetAsSeries(First_X200, true);
          ArraySetAsSeries(First_X20, true);
/////////////////===== _WPRs_MA
          for(int i = 0; i < limitY  ; i++)
          {         Second_X200_EMA20[i]   = iMAOnArray(First_X200, 0, 20, 0, MODE_EMA, i);// 0 means the whole array.
                    Second_X200_EMA20[i] = NormalizeDouble(Second_X200_EMA20[i], 2);
                    //////======
                    Second_X200_SMA20[i]   = iMAOnArray(First_X200, 0, 20, 0, MODE_SMA, i);
                    Second_X200_SMA20[i] = NormalizeDouble(Second_X200_SMA20[i], 2);
                    ///--------------------------
                    Second_X20_EMA20[i]   = iMAOnArray(First_X20, 0, 20, 0, MODE_EMA, i);// 0 means the whole array.
                    Second_X20_EMA20[i] = NormalizeDouble(Second_X20_EMA20[i], 2);
                    //////======
                    Second_X20_SMA20[i]   = iMAOnArray(First_X20, 0, 20, 0, MODE_SMA, i);
                    Second_X20_SMA20[i] = NormalizeDouble(Second_X20_SMA20[i], 2);
                    ////
          } //
///
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Base::Resize_XModeArray(double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], int limitYX = 200)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          ArrayResize(First_X200, limitYX, 10);
          ArrayResize(Second_X200_EMA20, limitYX, 10);
          ArrayResize(Second_X200_SMA20, limitYX, 10);
          ArrayResize(Second_X200_EMA200, limitYX, 10);
          ArrayResize(Second_X200_SMA200, limitYX, 10);
//==
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_Base::Init_XModeArray(string InMode, double & First_X200[], double & Second_X200_EMA20[], double & Second_X200_SMA20[], double & Second_X200_EMA200[], double & Second_X200_SMA200[], int limitYX = 200)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          ArrayResize(First_X200, limitYX, 10);
          ArrayResize(Second_X200_EMA20, limitYX, 10);
          ArrayResize(Second_X200_SMA20, limitYX, 10);
          ArrayResize(Second_X200_EMA200, limitYX, 10);
          ArrayResize(Second_X200_SMA200, limitYX, 10);
//==
          if(InMode == "iAD")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] = iAD(NULL, 0, i); //
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
///
          if(InMode == "iAC")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] =  iAC(NULL, 0, i); //
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
          if(InMode == "iAO")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] =  iAO(NULL, 0, i); //
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
////////
          if(InMode == "iVolume")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] =  (double)iVolume(NULL, 0, i); //
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
          if(InMode == "iOBV")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] =  iOBV(NULL, 0, PRICE_CLOSE, i); //
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
          if(InMode == "isOBV")
                    for(int i = 0; i < limitY ; i++)
                    {         First_X200[i] =  iOBV(NULL, 0, PRICE_CLOSE, i); //
                              First_X200[i] = NormalizeDouble(First_X200[i], 2);
                              ///------------
                              ///Print("Is this a dynamic array = ", ArrayIsDynamic(First_WPRs) ? "Yes" : "No"); //
                    }
//if(ArraySetAsSeries(First_WPRs200, true))//wrong//
          {         //Alert( First_WPRs200[0], "--First_WPRs200--", __LINE__); ///First_WPRs200[limitY - 1]
                    //
          }
          ArraySetAsSeries(First_X200, true);
/////////////////===== _WPRs_MA
          for(int i = 0; i < limitY  ; i++)
          {         Second_X200_EMA20[i]   = iMAOnArray(First_X200, 0, 20, 0, MODE_EMA, i);// 0 means the whole array.
                    Second_X200_EMA20[i] = NormalizeDouble(Second_X200_EMA20[i], 2);
                    //////======
                    Second_X200_SMA20[i]   = iMAOnArray(First_X200, 0, 20, 0, MODE_SMA, i);
                    Second_X200_SMA20[i] = NormalizeDouble(Second_X200_SMA20[i], 2);
                    ///--------------------------
                    Second_X200_SMA200[i]   = iMAOnArray(First_X200, 0, 200, 0, MODE_SMA, i);
                    Second_X200_SMA200[i] = NormalizeDouble(Second_X200_SMA200[i], 2);
                    //////======
                    Second_X200_EMA200[i]   = iMAOnArray(First_X200, 0, 200, 0, MODE_EMA, i);
                    Second_X200_EMA200[i] = NormalizeDouble(Second_X200_EMA200[i], 2);
                    ////
          }
///To access to the array elements as to a series array (i.e., from right to left), one has to use the ArraySetAsSeries() function.
////////====
//  if(!ArraySetAsSeries(First_WPRs, false));//wrong// for line creating
          {         // Alert( Second_WPRs200_EMA20[0] , "--Second_WPRs200_EMA20--", __LINE__); //Second_WPRs200_EMA20[limitY - 1]
                    // Alert( Second_WPRs200_SMA20[0] , "--Second_WPRs200_SMA20--", __LINE__); //Second_WPRs200_SMA20[limitY - 1],
          }
//ArraySetAsSeries(Second_WPRsEMA, true);//wrong
//ArraySetAsSeries(Second_WPRsSMA, true);//Wrong
///============
// return Second_MA;//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_STATICSUN Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}//;
//+------------------------------------------------------------------+
//||   ||||||||||       Ct_DevCondicator_Base.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
