//+------------------------------------------------------------------+
//||   ||||||||||             Graphical_Item_Solid.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Fibos\oFibosRetracement.mqh>;             //C_FiboRetracement             FiboRetracement_G;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Fibos\oFibosArc.mqh>;                     //C_FiboArc                     FiboArc_G;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Fibos\oFibosChannel.mqh>;                 //C_FiboChannel                 FiboChannel_G;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Fibos\oFibosExpansion.mqh>;               //C_FiboExpansion               FiboExpansion_G;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Fibos\oFibosFan.mqh>;                     //C_FiboFan                     FiboFan_G;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Fibos\oFibosTimeZone.mqh>;                //C_FiboTimeZone                FiboTimeZone_G;
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsFibo.mqh>


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_Fibos
{
//===================================================================
private:
          string                        m_name;
          int                           m_index;
//===================================================================
public:
          void                          C_Fibos() {};
          void                          ~C_Fibos() {if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); }
//===================================================================CChartObjectFibo
          C_FibosRetracement             Retracement;
          C_FibosArc                     Arc;
          C_FibosChannel                 Channel;
          C_FibosExpansion               Expansion;
          C_FibosFan                     Fan;
          C_FibosTimeZone                TimeZone;
          
 
          void fibox();
          //+----------------------------------------------------------------------------------+
          //| CChartObjectFibo & UseFiboX, CChartObjectFiboTimes & UseFiboTimesX,              |
          //| CChartObjectFiboArc & UseFiboArcX, CChartObjectFiboChannel & UseFiboChannelX,    |
          //| CChartObjectFiboExpansion & UseFiboExpansionX, CChartObjectFiboFan & UseFiboFanX,|
          //+----------------------------------------------------------------------------------+Positive
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Fibos::fibox()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          int    obj_total = ObjectsTotal();
          string name, text;
          int i, j, TextStyle;
          for(i = 0; i < obj_total; i++)
          {         name = ObjectName(i);
                    if(ObjectType(name) == OBJ_FIBO)
                    {         for(j = 0; j < 32; j++)
                              {         if(GetLastError() != 0)
                                                  break;
                                        switch (TextStyle)
                                        {         case 2 :
                                                            // Style 2 example is:  61.8  234.67
                                                            if(ObjectFind(0, name) >= 0)
                                                                      ObjectSetFiboDescription(name, j, DoubleToStr(ObjectGet(name,
                                                                                               OBJPROP_FIRSTLEVEL + j) * 100, 1) + "  %$");
                                                            break;
                                                  case 0 :
                                                            // Style 0 example is:  61.8
                                                            if(ObjectFind(0, name) >= 0)
                                                                      ObjectSetFiboDescription(name, j, DoubleToStr(ObjectGet(name,
                                                                                               OBJPROP_FIRSTLEVEL + j) * 100, 1));
                                                            break;
                                                  default:
                                                            // default, or style 1.  Example:  (61.8) - 234.67
                                                            if(ObjectFind(0, name) >= 0)
                                                                      ObjectSetFiboDescription(name, j, "(" + DoubleToStr(ObjectGet(name,
                                                                                               OBJPROP_FIRSTLEVEL + j) * 100, 1) + ")" + " - %$"); } } }
                    else if(ObjectType(name) == OBJ_EXPANSION)
                    {         for(j = 0; j < 32; j++)
                              {         if(GetLastError() != 0)
                                                  break;
                                        switch (TextStyle)
                                        {         case 2 :
                                                            // Style 2 example is:  FE 61.8  234.67
                                                            if(ObjectFind(0, name) >= 0)
                                                                      ObjectSetFiboDescription(name, j, "FE " + DoubleToStr(ObjectGet(name,
                                                                                               OBJPROP_FIRSTLEVEL + j) * 100, 1) + "  %$");
                                                            break;
                                                  case 0 :
                                                            // Style 0 example is:  FE 61.8
                                                            if(ObjectFind(0, name) >= 0)
                                                                      ObjectSetFiboDescription(name, j, "FE " + DoubleToStr(ObjectGet(name,
                                                                                               OBJPROP_FIRSTLEVEL + j) * 100, 1));
                                                            break;
                                                  default:
                                                            // default, or style 1.  Example:  FE (61.8) - 234.67
                                                            if(ObjectFind(0, name) >= 0)
                                                                      ObjectSetFiboDescription(name, j, "FE (" + DoubleToStr(ObjectGet(name,
                                                                                               OBJPROP_FIRSTLEVEL + j) * 100, 1) + ")" + " - %$"); //
                                        }//
                              } //
                    }//
          }//
          string textXX;
          for( i = 0; i < 32; i++)
          {         if(ObjectFind(0, "MyObjectName") >= 0)
                              textXX = ObjectGetFiboDescription("MyObjectName", i);
                    //---- checking whether the objects has less than 32 levels
                    if(GetLastError() != ERR_NO_ERROR) break;
                    Print("MyObjectName", "level: ", i, " description: ", textXX); //
          } //
          {         //
                    int shiftLowest = 0, shiftHighest = 0, err;
                    color ColorDowntrend = clrRed;
                    if(ObjectFind(0, "objOuterId") < 0)
                    {         ObjectCreate("objOuterId", OBJ_FIBO, 0, Time[shiftLowest], Low[shiftLowest], Time[shiftHighest], High[shiftHighest]);
                              if(ObjectFind(0, "objOuterId") >= 0)
                              {         ObjectSet("objOuterId", OBJPROP_COLOR, ColorDowntrend);
                                        ObjectSet("objOuterId", OBJPROP_LEVELCOLOR, ColorDowntrend);
                                        ObjectSet("objOuterId", OBJPROP_LEVELSTYLE, STYLE_DOT);
                                        ObjectGet("objOuterId", ObjectFind("objOuterId"));//
                              } }
                    for(j = 0; j < 32; j++)
                    {         if(ObjectFind(0, "objOuterId") >= 0)
                                        ObjectSetFiboDescription("objOuterId", j, "(" + DoubleToStr(ObjectGet("objOuterId", OBJPROP_FIRSTLEVEL + j) * 100, 1) + ")" + " - %$");
                              err = GetLastError();
                              if(err != 0)
                              {         Print(err, " set: ", ErrorDescription(err));
                                        break; } }
                    for(i = 0; i < 32; i++)
                    {         if(ObjectFind(0, "objOuterId") >= 0)
                                        text = ObjectGetFiboDescription("objOuterId", i);
                              //---- checking whether the objects has less than 32 levels
                              err = GetLastError();
                              if(err != 0)
                              {         Print(err, " get: ", ErrorDescription(err));
                                        break; }
                              Print("objOuterId", "level: ", i, " description: ", text); }
                    //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
} //
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
