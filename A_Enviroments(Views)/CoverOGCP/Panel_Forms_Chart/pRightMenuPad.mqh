//+------------------------------------------------------------------+
//||   ||||||||||                 C_RightMenuPad.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
//+------------------------------------------------------------------+
//|             Class C_RightMenuPad     BEGIN-END                   |
//+------------------------------------------------------------------+
//static bool KeySwitch = false;
//KeySwitch = KeySwitch ? false : true; //
//if( ct_Drive.IsOrdersModifications) {KeySwitch = false;} /*Alert("ct_Drive.IsOrdersModifications: ", ct_Drive.IsOrdersModifications);*/
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\Cp_SubEMA.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\Cp_SubController.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\Cp_SubStatus.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Views)\CoverOGCP\Panel_Forms_Chart\Cp_Side_MarketKeys_Loger.mqh>

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_RightMenuPad
{
private:
          //======================================================================================================
public:
          void                  C_RightMenuPad();
          void                  ~C_RightMenuPad() {};
          bool                  UpdateExtern();
          bool                  UPDATEDExtern;
          //======================================================================================================@aGROPARMaI#
          void                          _Show(int WhichMode = MODE_CREATE, bool IsKey = false, int MoveX = 0, int MoveY = 0, int FontSize = 0, string FontType = "Arial Bold", ENUM_ANCHOR_POINT AnchorText = ANCHOR_CENTER, ENUM_ANCHOR_POINT Anchor = ANCHOR_CENTER, color clrBody = clrWhite,  color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed);
          void                          _Show_Report(int WhichMode = MODE_CREATE, bool IsKey = false, int MoveX = 0, int MoveY = 0, int FontSize = 0, string FontType = "Arial Bold", ENUM_ANCHOR_POINT AnchorText = ANCHOR_CENTER, ENUM_ANCHOR_POINT Anchor = ANCHOR_CENTER, color clrBody = clrWhite,  color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed );
          bool                          Is_Show_Report;

          void  _Show_ReportPatern(int WhichMode                  = MODE_CREATE,   bool   IsKey    = false,
                                   int MoveX                      = 0,             int    MoveY    = 0,
                                   int FontSize                   = 0,             string FontType = "Arial Bold",
                                   ENUM_ANCHOR_POINT AnchorText   = ANCHOR_CENTER,
                                   ENUM_ANCHOR_POINT Anchor       = ANCHOR_CENTER,
                                   color clrBody                  = clrWhite,
                                   color clrBodyMargine           = clrNavy,
                                   color clrBodyText              = clrNavy,
                                   color clrBodyCyrcle            = clrRed );
          bool                          Is_Show_ReportPatern;
          void  _Show_ReportFrame(int WhichMode                  = MODE_CREATE,   bool   IsKey    = false,
                                  int MoveX                      = 0,             int    MoveY    = 0,
                                  int FontSize                   = 0,             string FontType = "Arial Bold",
                                  ENUM_ANCHOR_POINT AnchorText   = ANCHOR_CENTER,
                                  ENUM_ANCHOR_POINT Anchor       = ANCHOR_CENTER,
                                  color clrBody                  = clrWhite,
                                  color clrBodyMargine           = clrNavy,
                                  color clrBodyText              = clrNavy,
                                  color clrBodyCyrcle            = clrRed );
          void  _Show_ReportFrameChannelZigzag(int WhichMode                  = MODE_CREATE,   bool   IsKey    = false,
                                               int MoveX                      = 0,             int    MoveY    = 0,
                                               int FontSize                   = 0,             string FontType = "Arial Bold",
                                               ENUM_ANCHOR_POINT AnchorText   = ANCHOR_CENTER,
                                               ENUM_ANCHOR_POINT Anchor       = ANCHOR_CENTER,
                                               color clrBody                  = clrWhite,
                                               color clrBodyMargine           = clrNavy,
                                               color clrBodyText              = clrNavy,
                                               color clrBodyCyrcle            = clrRed );

          void  _Show_ReportFrameMACDs(int WhichMode                  = MODE_CREATE,   bool   IsKey    = false,
                                       int MoveX                      = 0,             int    MoveY    = 0,
                                       int FontSize                   = 0,             string FontType = "Arial Bold",
                                       ENUM_ANCHOR_POINT AnchorText   = ANCHOR_CENTER,
                                       ENUM_ANCHOR_POINT Anchor       = ANCHOR_CENTER,
                                       color clrBody                  = clrWhite,
                                       color clrBodyMargine           = clrNavy,
                                       color clrBodyText              = clrNavy,
                                       color clrBodyCyrcle            = clrRed );
          //======================================================================================================
          Cp_SubEMA                     SubEMA;
          Cp_SubStatus                  SubStatus;
          Cp_SubController              SubController;
          Cp_SubSide_MarketKeys_Loger   SubSide_MarketKeys_Loger;
          //======================================================================================================
          int                   TextExtermLong(string Desc, int Factor = 3) { return (int)(StringLen(Desc) * Factor);} //
          //======================================================================================================
          //======================================================================================================
          bool                  IsPadPress_Main,        IsPadActive_Main;
          bool                  IsPadPress_Side,        IsPadActive_Side;                                    //LabelMenuPadsMainText-Side
          bool                  IsPadPress_Status,      IsPadActive_Status;
          bool                  IsPadPress_EMA,         IsPadActive_EMA;
          bool                  IsPadPress_Controller,  IsPadActive_Controller;
          bool                  IsPadPress_Calculator,  IsPadActive_Calculator;
          //======================================================================================================
          void                  Show_BarInfo(bool IsSet_);
          void                  SHOW_force_of_deals_shadows(int k);
          void                  SHOW_CandlePattern__Inside_Engulfing_Bar(int k);
          void                  SHOW_CandlePattern__There_bar(int k);
          bool                  SHOW_Report_Signal(int WhichMode = MODE_CREATE, bool IsKey = false, int MoveX = 0, int MoveY = 0, int _x_Digit = 210);
          //------------------------------
          //graphical object
          Cgs_DevObjectPack          Object_Pack;
          void                  Desc_Status(bool b, bool IsUpdate);
          bool                  IsBasic_Active_Status;
          bool                  IsBasic_Showed_Active_Status;
          bool                  IsBasic_Showed_Active_Peport;
          bool                  IsBasic_Showed_Active_PeportSignal;
          bool                  IsBasic_Showed_Active_Flow;
          bool                  IsBasic_Showed_Active_Harmonic;//
          bool                  IsBasic_Showed_Active_MACDs;
          //
};
//======================================================================================================
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_RightMenuPad::C_RightMenuPad()
{         if(IsTesting())return;//
          RightMenuPad_Color.Set_(clrBlue, clrWhite, clrNavy, clrNavy, clrRed, clrYellowGreen, clrOrange);
          Is_Show_Report = true;
          IsBasic_Showed_Active_PeportSignal = true;
          IsBasic_Showed_Active_Peport = true;
          _Show(MODE_CREATE, true, 0, 10); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_RightMenuPad::UpdateExtern()
{         UPDATEDExtern = false;
          //----
          SubStatus.TopMiddle.Update();
          SubSide_MarketKeys_Loger.Update();
          SubStatus.PadMini.Update();
          //RightMenu.SubEMA.SubEMA_KeysStatus();
          {         if(TRADER_Panel_DATA.Is_AutoTradeDirect) {  ObjectSetInteger(0, "Logo-AutoTradeDirect", OBJPROP_COLOR, clrNavy);} //
                    else                                     {  ObjectSetInteger(0, "Logo-AutoTradeDirect", OBJPROP_COLOR, clrWhite);} //
          }
          //=======================================================================
          {         if(ObjectFind(0, "LBL_Clock") >= 0)
                              ObjectSetString(0, "LBL_Clock", OBJPROP_TEXT, TimeToString(TimeCurrent(), TIME_DATE | TIME_MINUTES | TIME_SECONDS)); //
                    //else Alert("LBL_Clock false ObjectSetString()"); //
          }
          //
          {         if(ObjectFind(0, "LBL_Clock.local") >= 0)
                              ObjectSetString(0, "LBL_Clock.local", OBJPROP_TEXT, TimeToString(TimeLocal(), TIME_DATE | TIME_MINUTES | TIME_SECONDS)); //
                    //else Alert("LBL_Clock.local false ObjectSetString()"); //
          }
          //=======================================================================
          {         if(ObjectFind(0, "ATR14-X") >= 0)
                    {         double factor = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_14_1 / ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_200_1;
                              ObjectSetString(0, "ATR14-X", OBJPROP_TEXT, 0, DoubleToStr( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_14_1, 2) + " / " + DoubleToStr( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_200_1, 2)  + " F:" + DoubleToStr(factor, 2)); //Set_Object
                    }
                    //else Alert("Not Find object by name " + "ATR14-X" + __FUNCTION__ + (string)__LINE__); //
                    if(ObjectFind(0, "desc.ATR14") >= 0)
                    {         if( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_14_1 > ct_Drive.TDD.ct_Conductor.DC_data.Indicators._ATR.ATR_200_1 )
                              {         ObjectSetInteger(0, "desc.ATR14", OBJPROP_COLOR, clrYellowGreen);//
                              }//
                              else
                              {         //
                                        ObjectSetInteger(0, "desc.ATR14", OBJPROP_COLOR, clrRed);//
                              }//
                    }
                    //---
                    //=======================================================================
                    if(ObjectFind(0, "WR%200") >= 0)
                    {         /// change by state
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.WpR_14_1 > ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.WpR_200_1)
                              {         ObjectSetInteger(0, "WR%200", OBJPROP_COLOR, clrYellowGreen);//
                              }//
                              else
                              {         //
                                        ObjectSetInteger(0, "WR%200", OBJPROP_COLOR, clrRed);//
                              }//
                    }
                    if(ObjectFind(0, "WR%200-X") >= 0)
                    {         ObjectSetString(0, "WR%200-X", OBJPROP_TEXT, 0, DoubleToStr( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.WpR_14_1, 2) + " / " + DoubleToStr( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.WpR_200_1, 2)); //
                    }
                    if(ObjectFind(0, "WR%200-X") >= 0)
                    {         if( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.WpR_14_1 > -50 && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.WpR_200_1 > -50 )
                              {         ObjectSetInteger(0, "WR%200-X", OBJPROP_COLOR, clrYellowGreen);//
                              }//
                              else  if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.WpR_14_1 < -50 && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR.WpR_200_1 < -50 )
                              {         //
                                        ObjectSetInteger(0, "WR%200-X", OBJPROP_COLOR, clrRed);//
                              }//
                    }
                    //=======================================================================
                    if(ObjectFind(0, "WR%200M") >= 0)
                    {         /// change by state
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.iWPR_200_iEMA200[0] > ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.iWPR_200_iEMA200_iEMA200[0])
                              {         ObjectSetInteger(0, "WR%200M", OBJPROP_COLOR, clrYellowGreen);//
                              }//
                              else
                              {         //
                                        ObjectSetInteger(0, "WR%200M", OBJPROP_COLOR, clrRed);//
                              }//
                    }
                    if(ObjectFind(0, "WR%200M-X") >= 0)
                    {         ObjectSetString(0, "WR%200M-X", OBJPROP_TEXT, 0, DoubleToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.iWPR_200_iEMA200[0], 2) + ":" + DoubleToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.iWPR_200_iEMA200_iEMA200[0], 2)); //
                    }
                    if(ObjectFind(0, "WR%200M-X") >= 0)
                    {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 )
                              {         ObjectSetInteger(0, "WR%200M-X", OBJPROP_COLOR, clrYellowGreen);//expanding 1,14
                              }//
                              else
                              {         //
                                        ObjectSetInteger(0, "WR%200M-X", OBJPROP_COLOR, clrRed);//nearing 1,14
                              }//
                    }
                    //Set_Object
                    //else Alert("Not Find object by name " + "WR%200-X" + __FUNCTION__ + (string)__LINE__); //
                    //=======================================================================
                    //---
                    if(ObjectFind(0, "Volume-X") >= 0)
                    {         string text = DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Volume.Volume_1, 0) + ":" +
                                            DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Volume.Volume_M_[0], 0) +
                                            "   Diff5: " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Volume.Volume_Diff5, 0);
                              ObjectSetString(0, "Volume-X", OBJPROP_TEXT, 0, text); //Set_Object
                              /// change by state
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Volume.Volume_1 > ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Volume.Volume_M_[0])
                              {         ObjectSetInteger(0, "Volumes", OBJPROP_COLOR, clrYellowGreen);//
                              }//
                              else
                              {         //
                                        ObjectSetInteger(0, "Volumes", OBJPROP_COLOR, clrRed);//
                              }//
                    }
                    //else Alert("Not Find object by name " + "Volume-X" + __FUNCTION__ + (string)__LINE__); //
                    //=======================================================================
                    if(ObjectFind(0, "EMA500s-X") >= 0)
                    {         bool IsEXpDiff = MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_[0] - ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_M[0]) > MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_[3] - ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_M[3]);
                              if(IsEXpDiff)
                              {         ObjectSetInteger(0, "EMA500s-X", OBJPROP_COLOR, clrYellowGreen);//
                              }//
                              else
                              {         //
                                        ObjectSetInteger(0, "EMA500s-X", OBJPROP_COLOR, clrRed);//
                              }//
                              ObjectSetString(0, "EMA500s-X", OBJPROP_TEXT, 0, DoubleToStr( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0, 2) + ":" + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_M[0], 2) ); //Set_Object
                    }
                    //else Alert("Not Find object by name " + "EMA500_L5-X" + __FUNCTION__ + (string)__LINE__); //DoubleToStr( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Minimum_Shift_Main, 2)
                    //------------------
                    if(ObjectFind(0, "EMA500s") >= 0)
                    {         //adjust colors by expand nearing and posetive negative
                              if( ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 > ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_M[0] )
                              {         ObjectSetInteger(0, "EMA500s", OBJPROP_COLOR, clrYellowGreen);//
                                        if(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsNearing_EMA500_Close200)
                                        {         ObjectSetInteger(0, "EMA500s", OBJPROP_COLOR, clrLightGreen);//
                                        }
                                        else
                                        {         ObjectSetInteger(0, "EMA500s", OBJPROP_COLOR, clrForestGreen);//
                                        } //
                                        //
                              } //
                              else
                              {         //
                                        ObjectSetInteger(0, "EMA500s", OBJPROP_COLOR, clrRed);//
                                        if(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsNearing_EMA500_Close200)
                                        {         ObjectSetInteger(0, "EMA500s", OBJPROP_COLOR, clrOrangeRed);//
                                        }
                                        else
                                        {         ObjectSetInteger(0, "EMA500s", OBJPROP_COLOR, clrMaroon);//
                                        } //
                                        //
                              } //
                              //---------------------------------------------------------------------------- -
                              string ArrowText = "?";
                              if(MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) < 3.00 && MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) > 0)
                              {         ArrowText = "L3"; }
                              else  if(MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) < 5.00 && MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) > 3.00)
                              {         ArrowText = "L5"; }
                              else  if(MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) < 8.00 && MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) > 5.00)
                              {         ArrowText = "L8"; }
                              else  if(MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) < 13.00 && MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) > 8.00)
                              {         ArrowText = "L13"; }
                              else  if(MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) < 21.00 && MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) > 13.00)
                              {         ArrowText = "L21"; }
                              else  if(MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) < 34.00 && MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) > 21.00)
                              {         ArrowText = "L34"; }
                              else  if(MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) < 55.00 && MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MA._Data.Value_NULL_0_Period500_0_MODE_EMA_PRICE_CLOSE_0 - Close[0]) > 34.00)
                              {         ArrowText = "L55"; }
                              ObjectSetString(0, "EMA500s", OBJPROP_TEXT, 0, "EMA500:" + ArrowText); //
                    } //
                    //======================================================================================================
                    if(ObjectFind(0, "EMA20T") >= 0)
                    {         /// change by state
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_[0] > ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_M[0])
                              {         ObjectSetInteger(0, "EMA20T", OBJPROP_COLOR, clrYellowGreen);//
                              }//
                              else
                              {         //
                                        ObjectSetInteger(0, "EMA20T", OBJPROP_COLOR, clrRed);//
                              }//
                    }
                    if(ObjectFind(0, "EMA20T-X") >= 0)
                    {         bool IsEXpDiff = MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_[0] - ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_M[0]) > MathAbs(ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_[3] - ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_M[3]);
                              if(IsEXpDiff)
                              {         ObjectSetInteger(0, "EMA20T-X", OBJPROP_COLOR, clrYellowGreen);//
                              }//
                              else
                              {         //
                                        ObjectSetInteger(0, "EMA20T-X", OBJPROP_COLOR, clrRed);//
                              }//
                              /// change by state
                              ObjectSetString(0, "EMA20T-X", OBJPROP_TEXT, DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_[0], 2) + ":" + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Trigers._20_M[0], 2)); //
                    }//
                    //=======================================================================
                    ///  Alert(IntegerToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Minimum_Shift_Main), "   IntegerToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Minimum_Shift_Main)");
                    /// change by state
                    if(ObjectFind(0, "MACD_DiV") >= 0)
                    {         /// change by state
                              if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Main.Curr._Value > ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signal.Curr._Value )
                              {         ObjectSetInteger(0, "MACD_DiV", OBJPROP_COLOR, clrYellowGreen);//
                              }//
                              else
                              {         //
                                        ObjectSetInteger(0, "MACD_DiV", OBJPROP_COLOR, clrRed);//
                              }//
                    }
                    ///
                    if(ObjectFind(0, "MACD_DiV-X") >= 0)
                    {         if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Main.Curr._Value > 0 && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signal.Curr._Value > 0 )
                              {         ObjectSetInteger(0, "MACD_DiV-X", OBJPROP_COLOR, clrYellowGreen);//
                              }//
                              else  if(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Main.Curr._Value < 0 && ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signal.Curr._Value < 0 )
                              {         //
                                        ObjectSetInteger(0, "MACD_DiV-X", OBJPROP_COLOR, clrRed);//
                              }//
                              /// change by state
                              ObjectSetString(0, "MACD_DiV-X", OBJPROP_TEXT, " M: " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Main.Curr._Value, 2) + " : S: " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.Signal.Curr._Value, 2)); //
                    } //Set_Object  ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.t_iMACD_Main_12_26_9_PriceClose[0]._Value
                    //else Alert("Not Find object by name " + "MACD_DiV-X" + __FUNCTION__ + (string)__LINE__); //
          }
          //--------------------------------- MACDs-W1-X
          {         if(ObjectFind(0, "MACDs-M1-X") >= 0)
                    {         ObjectSetString(0, "MACDs-M1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.DATAS[0].eMACD_STATE) ); //
                              ObjectSetInteger(0, "MACDs-M1-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.DATAS[0].eMACD_STATE == UP_IN || ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.DATAS[0].eMACD_STATE == DOWN_OUT ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "MACDs-M5-X") >= 0)
                    {         ObjectSetString(0, "MACDs-M5-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.DATAS[0].eMACD_STATE) ); //
                              ObjectSetInteger(0, "MACDs-M5-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.DATAS[0].eMACD_STATE == UP_IN || ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.DATAS[0].eMACD_STATE == DOWN_OUT ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "MACDs-M15-X") >= 0)
                    {         ObjectSetString(0, "MACDs-M15-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M15.MACD_Cross_Signal.DATAS[0].eMACD_STATE) ); //
                              ObjectSetInteger(0, "MACDs-M15-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M15.MACD_Cross_Signal.DATAS[0].eMACD_STATE == UP_IN || ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M15.MACD_Cross_Signal.DATAS[0].eMACD_STATE == DOWN_OUT ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "MACDs-M30-X") >= 0)
                    {         ObjectSetString(0, "MACDs-M30-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M30.MACD_Cross_Signal.DATAS[0].eMACD_STATE) ); //
                              ObjectSetInteger(0, "MACDs-M30-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M30.MACD_Cross_Signal.DATAS[0].eMACD_STATE == UP_IN || ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M30.MACD_Cross_Signal.DATAS[0].eMACD_STATE == DOWN_OUT ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "MACDs-H1-X") >= 0)
                    {         ObjectSetString(0, "MACDs-H1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.MACD_Cross_Signal.DATAS[0].eMACD_STATE) ); //
                              ObjectSetInteger(0, "MACDs-H1-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.MACD_Cross_Signal.DATAS[0].eMACD_STATE == UP_IN || ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.MACD_Cross_Signal.DATAS[0].eMACD_STATE == DOWN_OUT ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "MACDs-H4-X") >= 0)
                    {         ObjectSetString(0, "MACDs-H4-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H4.MACD_Cross_Signal.DATAS[0].eMACD_STATE) ); //
                              ObjectSetInteger(0, "MACDs-H4-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H4.MACD_Cross_Signal.DATAS[0].eMACD_STATE == UP_IN || ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H4.MACD_Cross_Signal.DATAS[0].eMACD_STATE == DOWN_OUT ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "MACDs-D1-X") >= 0)
                    {         ObjectSetString(0, "MACDs-D1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._D1.MACD_Cross_Signal.DATAS[0].eMACD_STATE) ); //
                              ObjectSetInteger(0, "MACDs-D1-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._D1.MACD_Cross_Signal.DATAS[0].eMACD_STATE == UP_IN || ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._D1.MACD_Cross_Signal.DATAS[0].eMACD_STATE == DOWN_OUT ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "MACDs-W1-X") >= 0)
                    {         ObjectSetString(0, "MACDs-W1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._W1.MACD_Cross_Signal.DATAS[0].eMACD_STATE) ); //
                              ObjectSetInteger(0, "MACDs-W1-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._W1.MACD_Cross_Signal.DATAS[0].eMACD_STATE == UP_IN || ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._W1.MACD_Cross_Signal.DATAS[0].eMACD_STATE == DOWN_OUT ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "MACDs-MN1-X") >= 0)
                    {         ObjectSetString(0, "MACDs-MN1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._MN.MACD_Cross_Signal.DATAS[0].eMACD_STATE) ); //
                              ObjectSetInteger(0, "MACDs-MN1-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._MN.MACD_Cross_Signal.DATAS[0].eMACD_STATE == UP_IN || ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._MN.MACD_Cross_Signal.DATAS[0].eMACD_STATE == DOWN_OUT ? clrGreenYellow : clrOrangeRed)); //
                    } //
          }
          //---------------------------------
          {         if(ObjectFind(0, "ChannelZigzag-M1-X") >= 0)
                    {         ObjectSetString(0, "ChannelZigzag-M1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M1.Place_Ninth) ); //
                              ObjectSetInteger(0, "ChannelZigzag-M1-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M1.Is_Bulish_All_Middle ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "ChannelZigzag-M5-X") >= 0)
                    {         ObjectSetString(0, "ChannelZigzag-M5-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M5.Place_Ninth) ); //
                              ObjectSetInteger(0, "ChannelZigzag-M5-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M5.Is_Bulish_All_Middle ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "ChannelZigzag-M15-X") >= 0)
                    {         ObjectSetString(0, "ChannelZigzag-M15-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M15.Place_Ninth) ); //
                              ObjectSetInteger(0, "ChannelZigzag-M15-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M15.Is_Bulish_All_Middle ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "ChannelZigzag-M30-X") >= 0)
                    {         ObjectSetString(0, "ChannelZigzag-M30-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M30.Place_Ninth) ); //
                              ObjectSetInteger(0, "ChannelZigzag-M30-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._M30.Is_Bulish_All_Middle ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "ChannelZigzag-H1-X") >= 0)
                    {         ObjectSetString(0, "ChannelZigzag-H1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._H1.Place_Ninth) ); //
                              ObjectSetInteger(0, "ChannelZigzag-H1-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._H1.Is_Bulish_All_Middle ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "ChannelZigzag-H4-X") >= 0)
                    {         ObjectSetString(0, "ChannelZigzag-H4-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._H4.Place_Ninth) ); //
                              ObjectSetInteger(0, "ChannelZigzag-H4-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._H4.Is_Bulish_All_Middle ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "ChannelZigzag-D1-X") >= 0)
                    {         ObjectSetString(0, "ChannelZigzag-D1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._D1.Place_Ninth) ); //
                              ObjectSetInteger(0, "ChannelZigzag-D1-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._D1.Is_Bulish_All_Middle ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "ChannelZigzag-W1-X") >= 0)
                    {         ObjectSetString(0, "ChannelZigzag-W1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._W1.Place_Ninth) ); //
                              ObjectSetInteger(0, "ChannelZigzag-W1-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._W1.Is_Bulish_All_Middle ? clrGreenYellow : clrOrangeRed)); //
                    } //
                    if(ObjectFind(0, "ChannelZigzag-MN1-X") >= 0)
                    {         ObjectSetString(0, "ChannelZigzag-MN1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._MN.Place_Ninth) ); //
                              ObjectSetInteger(0, "ChannelZigzag-MN1-X", OBJPROP_COLOR, (ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._MN.Is_Bulish_All_Middle ? clrGreenYellow : clrOrangeRed)); //
                    } //
          }
          //---------------------------------
          {         if(ObjectFind(0, "Harmonic-M1-X") >= 0)
                    {         ObjectSetString(0, "Harmonic-M1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M1[0].Bar_Pattern.Harmonic_Bar.e_Harmonics)); //
                    } //
                    if(ObjectFind(0, "Harmonic-M5-X") >= 0)
                    {         ObjectSetString(0, "Harmonic-M5-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[0].Bar_Pattern.Harmonic_Bar.e_Harmonics)); //
                    } //
                    if(ObjectFind(0, "Harmonic-M15-X") >= 0)
                    {         ObjectSetString(0, "Harmonic-M15-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M15[0].Bar_Pattern.Harmonic_Bar.e_Harmonics)); //
                    } //
                    if(ObjectFind(0, "Harmonic-M30-X") >= 0)
                    {         ObjectSetString(0, "Harmonic-M30-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M30[0].Bar_Pattern.Harmonic_Bar.e_Harmonics)); //
                    } //
                    if(ObjectFind(0, "Harmonic-H1-X") >= 0)
                    {         ObjectSetString(0, "Harmonic-H1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H1[0].Bar_Pattern.Harmonic_Bar.e_Harmonics)); //
                    } //
                    if(ObjectFind(0, "Harmonic-H4-X") >= 0)
                    {         ObjectSetString(0, "Harmonic-H4-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H4[0].Bar_Pattern.Harmonic_Bar.e_Harmonics)); //
                    } //
                    if(ObjectFind(0, "Harmonic-D1-X") >= 0)
                    {         ObjectSetString(0, "Harmonic-D1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_D1[0].Bar_Pattern.Harmonic_Bar.e_Harmonics)); //
                    } //
                    if(ObjectFind(0, "Harmonic-W1-X") >= 0)
                    {         ObjectSetString(0, "Harmonic-W1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_W1[0].Bar_Pattern.Harmonic_Bar.e_Harmonics)); //
                    } //
                    if(ObjectFind(0, "Harmonic-MN1-X") >= 0)
                    {         ObjectSetString(0, "Harmonic-MN1-X", OBJPROP_TEXT,  "=> " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_MN1[0].Bar_Pattern.Harmonic_Bar.e_Harmonics)); //
                    } //
          }
          //---------------------------------
          {         if(ObjectFind(0, "Signal_Estimate_Curr_NN_") >= 0)
                    {         ObjectSetString(0, "Signal_Estimate_Curr_NN_-X", OBJPROP_TEXT,  "=> " + ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalCommand + ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.VtradeDesc); //
                    }
                    if(ObjectFind(0, "Signal_Estimate_Curr_NN_A") >= 0)
                    {         ObjectSetString(0, "Signal_Estimate_Curr_NN_A-X", OBJPROP_TEXT, "=> " + ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalInfoAH + " " + ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalInfoBH ); //
                    }
                    if(ObjectFind(0, "Signal_Estimate_Curr_NN_B") >= 0)
                    {         ObjectSetString(0, "Signal_Estimate_Curr_NN_B-X", OBJPROP_TEXT, "=> " + ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalInfoCH + " " + ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalInfoDH ); //
                    }
                    if(ObjectFind(0, "Signal_Estimate_Curr_NN_A1") >= 0)
                    {         ObjectSetString(0, "Signal_Estimate_Curr_NN_A1-X", OBJPROP_TEXT, "=> " + ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalInfoAL + " " + ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalInfoBL ); //
                    }
                    if(ObjectFind(0, "Signal_Estimate_Curr_NN_B1") >= 0)
                    {         ObjectSetString(0, "Signal_Estimate_Curr_NN_B1-X", OBJPROP_TEXT, "=> " + ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalInfoCL + " " + ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalInfoDL ); //
                    }
                    if(ObjectFind(0, "Signal_Estimate_Curr_NN_C") >= 0)
                    {         ObjectSetString(0, "Signal_Estimate_Curr_NN_C-X", OBJPROP_TEXT, "=> " + ct_Drive.TDD.ct_Signals.Extern_Signals.MTSNN.DATAS.SignalInfo_InputsPatern); //
                    }
                    //-------------------------------------------------------------------------------------------------------------------------------
                    //-------------------------------------------------------------------------------------------------------------------------------
                    if(ObjectFind(0, "Signal_Estimate_Curr_TREE") >= 0)
                    {         ObjectSetString(0, "Signal_Estimate_Curr_TREE-X", OBJPROP_TEXT, "=> " + EnumToString(ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Enum_Offer_Type) + " " + ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Desc_Offer_NameNode); //
                    }
                    if(ObjectFind(0, "Signal_Estimate_Curr_TREE_info1") >= 0)
                    {         ObjectSetString(0, "Signal_Estimate_Curr_TREE_info-X", OBJPROP_TEXT, "=> " + ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Desc_Offer_InfoNode); //
                    }
                    if(ObjectFind(0, "Signal_Estimate_Curr_TREE_info2") >= 0)
                    {         ObjectSetString(0, "Signal_Estimate_Curr_TREE_info2-X", OBJPROP_TEXT, "=> " + ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Desc_Offer_InfoNode2); //Print(__FUNCTION__, "treeinfo", ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Desc_Offer_InfoNode2); // v
                    }
                    if(ObjectFind(0, "Signal_Estimate_Curr_TREE_Supername") >= 0)
                    {         ObjectSetString(0, "Signal_Estimate_Curr_TREE_Supername-X", OBJPROP_TEXT, "=> " + ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Desc_Offer_SuperNameNode); //
                    }
                    //-------------------------------------------------------------------------------------------------------------------------------
                    //-------------------------------------------------------------------------------------------------------------------------------
                    //if(ObjectFind(0, "Signal_Estimate_Curr_ARRAY_Enter_Curr") >= 0)
                    //{         ObjectSetString(0, "Signal_Estimate_Curr_ARRAY_Enter_Curr-X", OBJPROP_TEXT, "=> "); //
                    //}
                    string texttype = "";
                    if(ct_Drive.TDD.ct_Signals.Extern_Signals.MTSA._LineSence_Blocks[St_LineSence_Block::gcBlock_Curr].CurrntOP_type == OP_MANUEL)texttype = "OP_MANUEL";
                    if(ct_Drive.TDD.ct_Signals.Extern_Signals.MTSA._LineSence_Blocks[St_LineSence_Block::gcBlock_Curr].CurrntOP_type == OP_VOID)texttype = "OP_VOID";
                    if(ObjectFind(0, "Signal_Estimate_Curr_ARRAY_Exit_Curr") >= 0)
                    {         ObjectSetString(0, "Signal_Estimate_Curr_ARRAY_Exit_Curr-X", OBJPROP_TEXT, "=> "
                                              + " Offer Profit: " + DoubleToStr(ct_Drive.TDD.ct_Signals.Extern_Signals.MTSA._LineSence_Blocks[St_LineSence_Block::gcBlock_Curr].VTrade_data.Vtrade_Profit, 2)
                                              + " Dur:" + TimeToString(ct_Drive.TDD.ct_Signals.Extern_Signals.MTSA._LineSence_Blocks[St_LineSence_Block::gcBlock_Curr].VTrade_data.Vtrade_TimeDuation, TIME_SECONDS)
                                              + " T: " + texttype
                                              + " O:" + ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_Offer //
                                             ); //
                    }
                    if(ObjectFind(0, "Signal_Estimate_Curr_ARRAY_Estimate_Curr") >= 0)
                    {         string desc =  "=> "
                                             + ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_SAW                 + " "
                                             + ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_ProfitedAll         + " "
                                             + ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_ProfitAllBlocksNow  + " "
                                             + ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_ProfitedElement
                                             ;
                              ObjectSetString(0, "Signal_Estimate_Curr_ARRAY_Estimate_Curr-X", OBJPROP_TEXT, desc ); ////+ " " +  ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc_Exit_Curr_Out
                    }
                    //-------------------------------------------------------------------------------------------------------------------------------
                    //-------------------------------------------------------------------------------------------------------------------------------
                    if(ObjectFind(0, "Signal_Estimate_Curr_ALL_Optimum_Curr") >= 0)
                    {         ObjectSetString(0, "Signal_Estimate_Curr_ALL_Optimum_Curr-X", OBJPROP_TEXT, "=> " + "SA:" + DoubleToStr( ct_Drive.TDD.ct_Signals.DATAS.ScalpAmount_All_Trader, _Digits) + " WaiteBar: " + (string)ct_Drive.TDD.ct_Start.Counter_Waite_5_Bar + "/" + (string)ct_Drive.TDD.ct_Start.Max_Candel_Wating_After_Win + " " + EnumToString(ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Enum) + " : " + ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Desc ); //
                    }
                    //-------------------------------------------------------------------------------------------------------------------------------
          }//
          //Cat.s("----------" + (string)NormalizeDouble( ct_Conductor.Indicators_ATR.ATR_14_0, 2));
          Show_BarInfo(true);
          t_Pattern.__SHOW(0);
          //---------------------------------------------------------
          {         Desc_Status(false, IsBasic_Showed_Active_Status);  //--update and startiong
                    IsBasic_Showed_Active_Status        ? ObjectSetInteger(0, "Logo-Active_Status", OBJPROP_COLOR, clrGreen) : ObjectSetInteger(0, "Logo-Active_Status", OBJPROP_COLOR, clrWhite); //
                    IsBasic_Showed_Active_Peport        ? ObjectSetInteger(0, "Logo-Active_Peport", OBJPROP_COLOR, clrGreen) : ObjectSetInteger(0, "Logo-Active_Peport", OBJPROP_COLOR, clrWhite); //
                    IsBasic_Showed_Active_Flow          ? ObjectSetInteger(0, "Logo-Active_Flow", OBJPROP_COLOR, clrGreen) : ObjectSetInteger(0, "Logo-Active_Flow", OBJPROP_COLOR, clrWhite); //
                    IsBasic_Showed_Active_Harmonic      ? ObjectSetInteger(0, "Logo-Active_Harmonic", OBJPROP_COLOR, clrGreen) : ObjectSetInteger(0, "Logo-Active_Harmonic", OBJPROP_COLOR, clrWhite); //
                    IsBasic_Showed_Active_PeportSignal  ? ObjectSetInteger(0, "Logo-Active_ReportSignal", OBJPROP_COLOR, clrGreen) : ObjectSetInteger(0, "Logo-Active_ReportSignal", OBJPROP_COLOR, clrWhite); //
          }
          //=========================================================
          UPDATEDExtern = true;
          if(!this.UPDATEDExtern)       {Alert("RightMenu.UPDATED: ", this.UPDATEDExtern);}
          return UPDATEDExtern = true; //
}

//+------------------------------------------------------------------+
//|                                                                  |mode,IsKey
//+------------------------------------------------------------------+
void C_RightMenuPad::_Show(int WhichMode                  = MODE_CREATE,   bool   IsKey    = false,
                           int MoveX                      = 0,             int    MoveY    = 0,
                           int FontSize                   = 0,             string FontType = "Arial Bold",
                           ENUM_ANCHOR_POINT AnchorText   = ANCHOR_CENTER,
                           ENUM_ANCHOR_POINT Anchor       = ANCHOR_CENTER,
                           color clrBody                  = clrWhite,
                           color clrBodyMargine           = clrNavy,
                           color clrBodyText              = clrNavy,
                           color clrBodyCyrcle            = clrRed )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
          //-------------------------------------------------------------------------------
          color ColorDayBodyText = clrOrange;//
          if(ct_Drive.TDD.ct_Market_Symbol.Is_Running) ColorDayBodyText = clrYellowGreen;//need update by timer// text way
          if((ct_Inform.TodayDesc() == " SUNDAY ") || (ct_Inform.TodayDesc() == " SATURDAY "))ColorDayBodyText = clrRed; //
          int TextLengh         = StringLen(ct_Inform.TodayWeekMonthDesc());
          int ExtermLong        = (int)(TextLengh * 3 ); //
          int Angel             = 0;    int xCom = 0;           int yCom = 0;
          //------------------------------------------------------------------------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Complex.LongPanel(WhichMode, IsKey, clrNONE, "Timer.local",  30 + MoveX - 15      /**/, All_RightMenu_Pad_Y + MoveY + 15 + 1 - 7, clrWhite, Angel, 10 + 0);        //---Day
          Complex.LongPanel(WhichMode, IsKey, clrNONE, "Timer",        30 + MoveX - 15      /**/, All_RightMenu_Pad_Y + MoveY + 30 + 1 - 7, clrWhite, Angel, 10 + 0);        //---Day
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          int _x_Digit = 210; int _x_Desc = 135;
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LBL_Clock.local", "Ô", "Arial Bold", 10);
                    LabelX.GDS.Set_Color_1(clrNavy);
                    LabelX.GDS.Set_Location_5((int)(30 + 35) + MoveX, All_RightMenu_Pad_Y + MoveY +  22 - 15, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Clock.local");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }//
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4("LBL_Clock", "Ô", "Arial Bold", 10);
                    LabelX.GDS.Set_Color_1(clrRed);
                    LabelX.GDS.Set_Location_5((int)(30 + 35) + MoveX, All_RightMenu_Pad_Y + MoveY +  22, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "LBL_Clock");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
                    //0//LBL_.Create(WhichMode, IsKey, "LBL_Clock", "Ô", (int)(30 + 35) + MoveX, MoveY + (int)(24),
                    //0//CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrWhite, 0, 7, "Arial Bold");
          }//
          //=================================================================================================================================
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Complex.Menu_ButtonX(WhichMode, IsKey, ct_Inform.TodayWeekMonthDesc(), MoveX, All_RightMenu_Pad_Y + MoveY - 125,  ExtermLong, 0, -2, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
          //  //Is_Create, Is_Move, ct_Drive.TDD.ct_Market_Symbol.IsMarket_TICKNew,
          Complex.Menu_ButtonX(WhichMode, IsKey, "Main",       MoveX, All_RightMenu_Pad_Y + MoveY - 100, TextExtermLong("Main",       2), 0, 0, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
          Complex.Menu_ButtonX(WhichMode, IsKey, "Side",       MoveX, All_RightMenu_Pad_Y + MoveY - 75,  TextExtermLong("Side",       2), 0, 0, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
          Complex.Menu_ButtonX(WhichMode, IsKey, "Status",     MoveX, All_RightMenu_Pad_Y + MoveY - 50,  TextExtermLong("Status",     2), 0, 0, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
          Complex.Menu_ButtonX(WhichMode, IsKey, "EMA",        MoveX, All_RightMenu_Pad_Y + MoveY - 25,  TextExtermLong("EMA",        2), 0, 0, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
          Complex.Menu_ButtonX(WhichMode, IsKey, "Controller", MoveX, All_RightMenu_Pad_Y + MoveY - 0,   TextExtermLong("Controller", 2), 0, 0, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
          Complex.Menu_ButtonX(WhichMode, IsKey, "Calculator", MoveX, All_RightMenu_Pad_Y + MoveY + 25,  TextExtermLong("Calculator"), 0, 0, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle); //
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          DevTextsButton.BTNCycle(MODE_CREATE, IsKey, "Active_Flow",         "a", 10, -15 - 2, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrNavy, clrWhite,  0, 0, 4, "Webdings", 2, 0 ); // v Q
          DevTextsButton.BTNCycle(MODE_CREATE, IsKey, "Active_Peport",       "a", 10, 3   - 2,   CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrNavy, clrWhite,  0, 0, 4, "Webdings", 2, 0 ); // v Q
          DevTextsButton.BTNCycle(MODE_CREATE, IsKey, "Active_Status",       "a", 10, 20  - 2,  CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrMidnightBlue, clrWhite,  0, 0, 4, "Webdings", 1, 1 ); // v Q Í
          DevTextsButton.BTNCycle(MODE_CREATE, IsKey, "Active_ReportSignal", "a", 10, 37  - 2,  CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrMidnightBlue, clrWhite,  0, 0, 4, "Webdings", 1, 1 ); // v Q Í
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          DevTextsButton.BTNCycle(WhichMode, IsKey, "Auto-All",        "¤", 10, All_RightMenu_Pad_Y + 43, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrWhite, clrRed,  0, 0, 3, "Wingdings", -1, -0); // v Q
          DevTextsButton.BTNCycle(WhichMode, IsKey, "Auto-Wave",       "¤", 10, All_RightMenu_Pad_Y + 59, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrWhite, clrRed,  0, 0, 3, "Wingdings", -1, -0); // v Q
          DevTextsButton.BTNCycle(WhichMode, IsKey, "AutoTradeDirect", "v", 10, All_RightMenu_Pad_Y + 76, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrRed, clrWhite,  0, 0, 4, "Wingdings" ); // v Q
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          DevTextsButton.BTNCycle(MODE_CREATE, IsKey, "Active_Harmonic",         "a", 28, -15 - 2, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrNavy, clrWhite,  0, 0, 4, "Webdings", 2, 0 ); // v Q
          DevTextsButton.BTNCycle(MODE_CREATE, IsKey, "Active_ChannelZigzag",    "a", 28, 0 + 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrNavy, clrWhite,  0, 0, 4, "Webdings", 2, 0 ); // v Q
          DevTextsButton.BTNCycle(MODE_CREATE, IsKey, "Active_MACDs",            "a", 28, 0 + 15, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrNavy, clrWhite,  0, 0, 4, "Webdings", 2, 0 ); // v Q
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          //---Alert("MoneyManagerPad ", WhichMode, "  ", IsKey, "  ", __LINE__);
          Complex.Set_BottumPanel(WhichMode, IsKey, 0, clrNONE, "MoneyManagerPad", "a", 30 - 15,  All_RightMenu_Pad_Y + 180 - 0, clrWhite, clrBlue, Angel, xCom - 8, yCom, 0 + 3, "Webdings", 9 + 3); //
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          DevTextsButton.BTNCycle(MODE_CREATE, IsKey, "Active_MapSence", "Ï", 28, All_RightMenu_Pad_Y + 77, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrNavy, clrWhite,  0, 0, 4, "Webdings", 2, 0 ); // v Q
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          if(IsKey)
          {         SubStatus._Call(MODE_CREATE, false);
                    SubEMA._Call(MODE_CREATE, false); //
                    SubController._Show(MODE_CREATE, false); //
                    SubSide_MarketKeys_Loger._Call(MODE_CREATE, false); //
          }
          if(!IsKey)
          {         SHOW_Report_Signal(WhichMode, IsKey, MoveX, MoveY, _x_Digit);// if()
          }
          else if(IsBasic_Showed_Active_PeportSignal) {SHOW_Report_Signal(WhichMode, IsKey, MoveX, MoveY, _x_Digit);}
          //=======
          if(!IsKey)
          {         _Show_Report(WhichMode, IsKey, MoveX, MoveY);; // if()
          }
          else if (IsBasic_Showed_Active_Peport) { _Show_Report(WhichMode, IsKey, MoveX, MoveY);}
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_RightMenuPad::_Show_ReportFrame(int WhichMode                  = MODE_CREATE,   bool   IsKey    = false,
                                       int MoveX                      = 0,             int    MoveY    = 0,
                                       int FontSize                   = 0,             string FontType = "Arial Bold",
                                       ENUM_ANCHOR_POINT AnchorText   = ANCHOR_CENTER,
                                       ENUM_ANCHOR_POINT Anchor       = ANCHOR_CENTER,
                                       color clrBody                  = clrWhite,
                                       color clrBodyMargine           = clrNavy,
                                       color clrBodyText              = clrNavy,
                                       color clrBodyCyrcle            = clrRed )

{         int Angel = 0; MoveY -= 7;  IsBasic_Showed_Active_Harmonic = IsKey;  //Is_Show_Report = IsKey;
          int moverXF = 10; int moverYF = 0;
          //=========================
          RectLabelX.GDS.Set_Action_2(MODE_CREATE, IsKey);
          RectLabelX.GDS.Set_Desc_1("RLBLB-ReportPatern-harmonic");
          RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
          RectLabelX.GDS.Set_Color_2(clrMidnightBlue, clrNONE);
          RectLabelX.GDS.Set_Location_5(moverXF + 300, 30, 310, 220, CORNER_LEFT_UPPER);
          RectLabelX.GDS.Set_Chart_6();
          RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, "RLBLB-ReportPatern-harmonic");
          RectLabelX.Action(RectLabelX); //
          //
          RectLabelX.GDS.Set_Action_2(MODE_CREATE, IsKey);
          RectLabelX.GDS.Set_Desc_1("RLBLB-ReportPatern-harmonic-Panel2");
          RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
          RectLabelX.GDS.Set_Color_2(clrDarkSlateBlue, clrNONE);
          RectLabelX.GDS.Set_Location_5(moverXF + 300, 30, 310, 15, CORNER_LEFT_UPPER);
          RectLabelX.GDS.Set_Chart_6();
          RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, "RLBLB-ReportPatern-harmonic-Panel2");
          RectLabelX.Action(RectLabelX); //
          //
          LabelX.GDS.Set_Action_2(MODE_CREATE, IsKey);
          LabelX.GDS.Set_Desc_4("RLBLB-ReportPatern-harmonic-Panel-Header", "Patern harmonic", "Arial", 9);
          LabelX.GDS.Set_Color_1(clrWhite);
          LabelX.GDS.Set_Location_5(moverXF + (300 + 155), 37, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
          LabelX.GDS.Set_Common_6(false, 50, false, false, false, "RLBLB-ReportPatern-harmonic-Panel-Header");
          LabelX.GDS.Set_Chart_6();
          LabelX.Action(LabelX);//
          //=========================0
          int moverX = 10; int moverY = 10;
          //---[Harmonic-M1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.Harmonic-M1", "Harmonic-M1 : ", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 45 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.Harmonic-M1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Harmonic-M1-X", "---:", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 100, 45 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Harmonic-M1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
} //

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_RightMenuPad::_Show_ReportFrameMACDs(int WhichMode                  = MODE_CREATE,   bool   IsKey    = false,
                    int MoveX                      = 0,             int    MoveY    = 0,
                    int FontSize                   = 0,             string FontType = "Arial Bold",
                    ENUM_ANCHOR_POINT AnchorText   = ANCHOR_CENTER,
                    ENUM_ANCHOR_POINT Anchor       = ANCHOR_CENTER,
                    color clrBody                  = clrWhite,
                    color clrBodyMargine           = clrNavy,
                    color clrBodyText              = clrNavy,
                    color clrBodyCyrcle            = clrRed )

{         int Angel = 0; MoveY -= 7;  IsBasic_Showed_Active_MACDs = IsKey;  //Is_Show_Report = IsKey;
          int moverXF = 10; int moverYF = 0;
          //=========================
          RectLabelX.GDS.Set_Action_2(MODE_CREATE, IsKey);
          RectLabelX.GDS.Set_Desc_1("RLBLB-Report-MACDs");
          RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
          RectLabelX.GDS.Set_Color_2(clrMidnightBlue, clrNONE);
          RectLabelX.GDS.Set_Location_5(moverXF + 300, 30, 340, 220, CORNER_LEFT_UPPER);
          RectLabelX.GDS.Set_Chart_6();
          RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, "RLBLB-Report-MACDs");
          RectLabelX.Action(RectLabelX); //
          //
          RectLabelX.GDS.Set_Action_2(MODE_CREATE, IsKey);
          RectLabelX.GDS.Set_Desc_1("RLBLB-ReportSignal MACDs2");
          RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
          RectLabelX.GDS.Set_Color_2(clrDarkSlateBlue, clrNONE);
          RectLabelX.GDS.Set_Location_5(moverXF + 300, 30, 340, 15, CORNER_LEFT_UPPER);
          RectLabelX.GDS.Set_Chart_6();
          RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, "RLBLB-ReportSignal MACDs2");
          RectLabelX.Action(RectLabelX); //
          //
          LabelX.GDS.Set_Action_2(MODE_CREATE, IsKey);
          LabelX.GDS.Set_Desc_4("RLBLB-ReportSignal MACDs-Header", "Signal MACDs", "Arial", 9);
          LabelX.GDS.Set_Color_1(clrWhite);
          LabelX.GDS.Set_Location_5(moverXF + (300 + 170), 37, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
          LabelX.GDS.Set_Common_6(false, 50, false, false, false, "RLBLB-ReportSignal MACDs-Header");
          LabelX.GDS.Set_Chart_6();
          LabelX.Action(LabelX);//
          //=========================0
          int moverX = 10; int moverY = 10;
          //---[MACDs-M1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.MACDs-M1", "MACDs M1 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 45 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.MACDs-M1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-M1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "MACDs-M1-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 45 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "MACDs-M1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-M5]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.MACDs-M5", "MACDs M5 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 65 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.MACDs-M5");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-M5]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "MACDs-M5-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 65 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "MACDs-M5-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-M15]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.MACDs-M15", "MACDs M15 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 85 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.MACDs-M15");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-M15]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "MACDs-M15-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 85 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "MACDs-M15-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-M30]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.MACDs-M30", "MACDs M30 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 105 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.MACDs-M30");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-M30]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "MACDs-M30-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 105 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "MACDs-M30-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-H1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.MACDs-H1", "MACDs H1 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 125 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.MACDs-H1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-H1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "MACDs-H1-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 125 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "MACDs-H1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-H4]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.MACDs-H4", "MACDs H4 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 145 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.MACDs-H4");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-H4]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "MACDs-H4-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 145 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "MACDs-H4-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-D1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.MACDs-D1", "MACDs D1 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 165 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.MACDs-D1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-H4]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "MACDs-D1-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 165 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "MACDs-D1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-W1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.MACDs-W1", "MACDs W1 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 185 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.MACDs-W1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-H4]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "MACDs-W1-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 185 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "MACDs-W1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACDs-MN1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.MACDs-MN1", "MACDs MN1 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 205 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.MACDs-MN1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-MN1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "MACDs-MN1-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 205 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "MACDs-MN1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_RightMenuPad::_Show_ReportFrameChannelZigzag(int WhichMode                  = MODE_CREATE,   bool   IsKey    = false,
                    int MoveX                      = 0,             int    MoveY    = 0,
                    int FontSize                   = 0,             string FontType = "Arial Bold",
                    ENUM_ANCHOR_POINT AnchorText   = ANCHOR_CENTER,
                    ENUM_ANCHOR_POINT Anchor       = ANCHOR_CENTER,
                    color clrBody                  = clrWhite,
                    color clrBodyMargine           = clrNavy,
                    color clrBodyText              = clrNavy,
                    color clrBodyCyrcle            = clrRed )

{         int Angel = 0; MoveY -= 7;  IsBasic_Showed_Active_Harmonic = IsKey;  //Is_Show_Report = IsKey;
          int moverXF = 10; int moverYF = 0;
          //=========================
          RectLabelX.GDS.Set_Action_2(MODE_CREATE, IsKey);
          RectLabelX.GDS.Set_Desc_1("RLBLB-Report-ChannelZigzag");
          RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
          RectLabelX.GDS.Set_Color_2(clrMidnightBlue, clrNONE);
          RectLabelX.GDS.Set_Location_5(moverXF + 300, 30, 340, 220, CORNER_LEFT_UPPER);
          RectLabelX.GDS.Set_Chart_6();
          RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, "RLBLB-Report-ChannelZigzag");
          RectLabelX.Action(RectLabelX); //
          //
          RectLabelX.GDS.Set_Action_2(MODE_CREATE, IsKey);
          RectLabelX.GDS.Set_Desc_1("RLBLB-ReportPatern-ChannelZigzag2");
          RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
          RectLabelX.GDS.Set_Color_2(clrDarkSlateBlue, clrNONE);
          RectLabelX.GDS.Set_Location_5(moverXF + 300, 30, 340, 15, CORNER_LEFT_UPPER);
          RectLabelX.GDS.Set_Chart_6();
          RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, "RLBLB-Report-ChannelZigzag2");
          RectLabelX.Action(RectLabelX); //
          //
          LabelX.GDS.Set_Action_2(MODE_CREATE, IsKey);
          LabelX.GDS.Set_Desc_4("RLBLB-ReportPatern-ChannelZigzag-Header", "Patern harmonic", "Arial", 9);
          LabelX.GDS.Set_Color_1(clrWhite);
          LabelX.GDS.Set_Location_5(moverXF + (300 + 170), 37, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
          LabelX.GDS.Set_Common_6(false, 50, false, false, false, "RLBLB-ReportPatern-ChannelZigzag-Header");
          LabelX.GDS.Set_Chart_6();
          LabelX.Action(LabelX);//
          //=========================0
          int moverX = 10; int moverY = 10;
          //---[Harmonic-M1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.ChannelZigzag-M1", "ChannelZigzag M1 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 45 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.ChannelZigzag-M1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "ChannelZigzag-M1-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 45 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "ChannelZigzag-M1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M5]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.ChannelZigzag-M5", "ChannelZigzag M5 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 65 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.ChannelZigzag-M5");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M5]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "ChannelZigzag-M5-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 65 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "ChannelZigzag-M5-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M15]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.ChannelZigzag-M15", "ChannelZigzag M15 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 85 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.ChannelZigzag-M15");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M15]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "ChannelZigzag-M15-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 85 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "ChannelZigzag-M15-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M30]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.ChannelZigzag-M30", "ChannelZigzag M30 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 105 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.ChannelZigzag-M30");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M30]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "ChannelZigzag-M30-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 105 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "ChannelZigzag-M30-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-H1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.ChannelZigzag-H1", "ChannelZigzag H1 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 125 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.ChannelZigzag-H1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-H1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "ChannelZigzag-H1-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 125 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "ChannelZigzag-H1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-H4]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.ChannelZigzag-H4", "ChannelZigzag H4 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 145 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.ChannelZigzag-H4");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-H4]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "ChannelZigzag-H4-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 145 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "ChannelZigzag-H4-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-D1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.ChannelZigzag-D1", "ChannelZigzag D1 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 165 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.ChannelZigzag-D1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-H4]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "ChannelZigzag-D1-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 165 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "ChannelZigzag-D1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-W1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.ChannelZigzag-W1", "ChannelZigzag W1 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 185 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.ChannelZigzag-W1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-H4]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "ChannelZigzag-W1-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 185 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "ChannelZigzag-W1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-MN1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.ChannelZigzag-MN1", "ChannelZigzag MN1 : ", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 205 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.ChannelZigzag-MN1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-MN1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "ChannelZigzag-MN1-X", "---:", "Arial", 8);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 115, 205 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "ChannelZigzag-MN1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
} //
void C_RightMenuPad::_Show_ReportPatern(int WhichMode                  = MODE_CREATE,   bool   IsKey    = false,
                                        int MoveX                      = 0,             int    MoveY    = 0,
                                        int FontSize                   = 0,             string FontType = "Arial Bold",
                                        ENUM_ANCHOR_POINT AnchorText   = ANCHOR_CENTER,
                                        ENUM_ANCHOR_POINT Anchor       = ANCHOR_CENTER,
                                        color clrBody                  = clrWhite,
                                        color clrBodyMargine           = clrNavy,
                                        color clrBodyText              = clrNavy,
                                        color clrBodyCyrcle            = clrRed )

{         int Angel = 0; MoveY -= 7;  IsBasic_Showed_Active_Harmonic = IsKey;  //Is_Show_Report = IsKey;
          int moverXF = 10; int moverYF = 0;
          //=========================
          RectLabelX.GDS.Set_Action_2(MODE_CREATE, IsKey);
          RectLabelX.GDS.Set_Desc_1("RLBLB-ReportPatern-harmonic");
          RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
          RectLabelX.GDS.Set_Color_2(clrMidnightBlue, clrNONE);
          RectLabelX.GDS.Set_Location_5(moverXF + 300, 30, 310, 220, CORNER_LEFT_UPPER);
          RectLabelX.GDS.Set_Chart_6();
          RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, "RLBLB-ReportPatern-harmonic");
          RectLabelX.Action(RectLabelX); //
          //
          RectLabelX.GDS.Set_Action_2(MODE_CREATE, IsKey);
          RectLabelX.GDS.Set_Desc_1("RLBLB-ReportPatern-harmonic-Panel2");
          RectLabelX.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
          RectLabelX.GDS.Set_Color_2(clrDarkSlateBlue, clrNONE);
          RectLabelX.GDS.Set_Location_5(moverXF + 300, 30, 310, 15, CORNER_LEFT_UPPER);
          RectLabelX.GDS.Set_Chart_6();
          RectLabelX.GDS.Set_Common_6(false, 10, false, false, false, "RLBLB-ReportPatern-harmonic-Panel2");
          RectLabelX.Action(RectLabelX); //
          //
          LabelX.GDS.Set_Action_2(MODE_CREATE, IsKey);
          LabelX.GDS.Set_Desc_4("RLBLB-ReportPatern-harmonic-Panel-Header", "Patern harmonic", "Arial", 9);
          LabelX.GDS.Set_Color_1(clrWhite);
          LabelX.GDS.Set_Location_5(moverXF + (300 + 155), 37, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
          LabelX.GDS.Set_Common_6(false, 50, false, false, false, "RLBLB-ReportPatern-harmonic-Panel-Header");
          LabelX.GDS.Set_Chart_6();
          LabelX.Action(LabelX);//
          //=========================0
          int moverX = 10; int moverY = 10;
          //---[Harmonic-M1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.Harmonic-M1", "Harmonic-M1 : ", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 45 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.Harmonic-M1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Harmonic-M1-X", "---:", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 100, 45 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Harmonic-M1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.Harmonic-M5", "Harmonic-M5 : ", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 65 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.Harmonic-M5");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Harmonic-M5-X", "---:", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 100, 65 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Harmonic-M5-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.Harmonic-M15", "Harmonic-M15 : ", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 85 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.Harmonic-M15");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Harmonic-M15-X", "---:", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 100, 85 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Harmonic-M15-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.Harmonic-M30", "Harmonic-M30 : ", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 105 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.Harmonic-M30");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Harmonic-M30-X", "---:", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 100, 105 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Harmonic-M30-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.Harmonic-H1", "Harmonic-H1 : ", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 125 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.Harmonic-H1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Harmonic-H1-X", "---:", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 100, 125 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Harmonic-H1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.Harmonic-H4", "Harmonic-H4 : ", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 145 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.Harmonic-H4");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Harmonic-H4-X", "---:", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 100, 145 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Harmonic-H4-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.Harmonic-D1", "Harmonic-D1 : ", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 165 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.Harmonic-D1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Harmonic-D1-X", "---:", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 100, 165 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Harmonic-D1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.Harmonic-W1", "Harmonic-W1 : ", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 185 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.Harmonic-W1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Harmonic-W1-X", "---:", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 100, 185 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Harmonic-W1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.Harmonic-MN1", "Harmonic-MN1 : ", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300, 205 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.Harmonic-MN1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Harmonic-M1]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Harmonic-MN1-X", "---:", "Arial", 10);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(moverXF + moverX + 300 + 100, 205 + moverY + moverYF, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Harmonic-MN1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
} //
void C_RightMenuPad::_Show_Report(int WhichMode                  = MODE_CREATE,   bool   IsKey    = false,
                                  int MoveX                      = 0,             int    MoveY    = 0,
                                  int FontSize                   = 0,             string FontType = "Arial Bold",
                                  ENUM_ANCHOR_POINT AnchorText   = ANCHOR_CENTER,
                                  ENUM_ANCHOR_POINT Anchor       = ANCHOR_CENTER,
                                  color clrBody                  = clrWhite,
                                  color clrBodyMargine           = clrNavy,
                                  color clrBodyText              = clrNavy,
                                  color clrBodyCyrcle            = clrRed )

{         int Angel             = 0; MoveY -= 7;  IsBasic_Showed_Active_Peport = IsKey;  //Is_Show_Report = IsKey;
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Complex.LongPanel(WhichMode, IsKey, clrNONE, "ATRVal",  140 + MoveX         /**/, All_RightMenu_Pad_Y + MoveY + 30 + 1,  clrNavy, Angel, 10 + 12);                    //---Day
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Complex.LongPanel(WhichMode, IsKey, clrNONE, "WR%200",  140 + MoveX         /**/, All_RightMenu_Pad_Y + MoveY + 50 + 1,  clrNavy, Angel, 10 + 12);         //---Day
          Complex.LongPanel(WhichMode, IsKey, clrNONE, "WR%200M",  140 + MoveX         /**/, All_RightMenu_Pad_Y + MoveY + 70 + 1,  clrNavy, Angel, 10 + 12);         //---Day
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Complex.LongPanel(WhichMode, IsKey, clrNONE, "Volume",  140 + MoveX         /**/, All_RightMenu_Pad_Y + MoveY + 90 + 1,  clrNavy, Angel, 10 + 12);         //---Day
          Complex.LongPanel(WhichMode, IsKey, clrNONE, "EMA500Level_5",  140 + MoveX  /**/, All_RightMenu_Pad_Y + MoveY + 110 + 1,  clrNavy, Angel, 10 + 12);  //---Day
          Complex.LongPanel(WhichMode, IsKey, clrNONE, "EMA20T",  140 + MoveX  /**/, All_RightMenu_Pad_Y + MoveY + 130 + 1,  clrNavy, Angel, 10 + 12);  //---Day
          Complex.LongPanel(WhichMode, IsKey, clrNONE, "MACD_DiV",  140 + MoveX  /**/, All_RightMenu_Pad_Y + MoveY + 150 + 1,  clrNavy, Angel, 10 + 12);  //---Day
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
          int _x_Digit = 210; int _x_Desc = 135;
          LabelX.Clear(); //
          //---[ATR14]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "desc.ATR14", "ATR : ", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Desc + MoveX, All_RightMenu_Pad_Y + MoveY + 30, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "desc.ATR14");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ATR14]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "ATR14-X", "---:", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Digit + MoveX, All_RightMenu_Pad_Y + MoveY + 30, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "ATR14-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[WR%200]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "WR%200", "WR%200: ", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Desc + MoveX, All_RightMenu_Pad_Y + MoveY + 50, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "WR%200");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[WR%200]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "WR%200-X", "---:", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Digit + MoveX, All_RightMenu_Pad_Y + MoveY + 50, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "WR%200-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[WR%200]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "WR%200M", "WR%200M: ", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Desc + MoveX, All_RightMenu_Pad_Y + MoveY + 70, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "WR%200M");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[WR%200]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "WR%200M-X", "---:", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Digit + MoveX, All_RightMenu_Pad_Y + MoveY + 70, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "WR%200M-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Volume]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Volumes", "Volume: ", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Desc + MoveX, All_RightMenu_Pad_Y + MoveY + 90, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Volumes");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[Volume]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Volume-X", "---:", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Digit + MoveX, All_RightMenu_Pad_Y + MoveY + 90, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Volume-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[EMA500_L5]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "EMA500s", "EMA500: ", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Desc + MoveX - 0, All_RightMenu_Pad_Y + MoveY + 110, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "EMA500_L5");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[EMA500_L5]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "EMA500s-X", "---:", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Digit + MoveX, All_RightMenu_Pad_Y + MoveY + 110, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "EMA500s-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[EMA20T]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "EMA20T", "EMA20T: ", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Desc + MoveX - 0, All_RightMenu_Pad_Y + MoveY + 130, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "EMA20T");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[EMA20T-X]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "EMA20T-X", "---:", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Digit + MoveX, All_RightMenu_Pad_Y + MoveY + 130, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "EMA20T-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACD_DiV]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "MACD_DiV", "MACD: ", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Digit + MoveX - 70 - 5, All_RightMenu_Pad_Y + MoveY + 150, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "MACD_DiV");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[MACD_DiV]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "MACD_DiV-X", "---:", "Arial", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(_x_Digit + MoveX, All_RightMenu_Pad_Y + MoveY + 150, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "MACD_DiV-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }//
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_RightMenuPad::Show_BarInfo(bool IsSet_)
{         if(IsSet_ = false)        // //---[UpdateBar]---
          {         //Alert(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[2]._Place);
                    for(int k = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.ViewRange - 1; k >= 0; k--)
                    {         //Alert(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k]._Place);  //ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Is_force_of_deals_high_shadow_normal || ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Is_force_of_deals_high_shadow_High ||
                              //Sleep(10);
                              //---
                              //---
                              SHOW_force_of_deals_shadows(k);              //10 patern Shadow
                              //---
                              SHOW_CandlePattern__Inside_Engulfing_Bar(k); //4 pattern Two_bar
                              //---
                              SHOW_CandlePattern__There_bar(k);            //16 pattern There_bar
                              //---
                    }
                    //
          }//
          if(false && Detect_NewBar._CURRENT.CBT.Is_NewBar)
          {         Zigzag_simula Zigzag_;
                    Zigzag_.Update();
                    for(int k = 0; k < 100; k++) {Alert(Zigzag_.Price[k]);}//
          }
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_RightMenuPad::SHOW_force_of_deals_shadows(int k)
{         if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.ShadowHigh.Is_Range_ExrtraHigh )
          {
                    {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                              Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].force_of_deals ++++", "*", "Arial", 11);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrRoyalBlue);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 3 * Point, 0, ANCHOR_LEFT);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].force_of_deals ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                              Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                              Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                              //
                    } //
          } //
          if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.ShadowHigh.Is_Range_UltraHigh )
          {
                    {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                              Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].force_of_deals +++", "*", "Arial", 11);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrSpringGreen);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 3 * Point, 0, ANCHOR_LEFT);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].force_of_deals +++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                              Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                              Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                              //
                    } //
          } //
          if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.ShadowHigh.Is_Range_High )
          {
                    {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                              Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].force_of_deals ++", "*", "Arial", 11);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrYellow);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 3 * Point, 0, ANCHOR_LEFT);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].force_of_deals ++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                              Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                              Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                              //
                    } //
          } //
          if(false)
          {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                    Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].force_of_deals ++", "   >" + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2), "Arial", 6);
                    Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrYellow);
                    Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 3 * Point, 0, ANCHOR_LEFT);
                    Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].force_of_deals ++");
                    Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                    Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                    //
          } //
          //--[-------------------]
          //Alert(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Is_force_of_deals_low_shadow_UltraHigh);//
          if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.ShadowLow.Is_Range_ExrtraHigh )
          {
                    {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                              Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].force_of_deals ----", "*", "Arial", 11);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrRoyalBlue);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 3 * Point, 0, ANCHOR_LEFT);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].force_of_deals ----  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_low_per_Body, 2));
                              Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                              Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                              //
                    } //
          } //
          if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.ShadowLow.Is_Range_UltraHigh )
          {
                    {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                              Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].force_of_deals ---", "*", "Arial", 11);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrOrangeRed);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 3 * Point, 0, ANCHOR_LEFT);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].force_of_deals ---  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_low_per_Body, 2));
                              Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                              Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                              //
                    } //
          } //
          if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.ShadowLow.Is_Range_High )
          {
                    {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                              Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].force_of_deals --", "*", "Arial", 11);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrYellow);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 3 * Point, 0, ANCHOR_LEFT);
                              Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].force_of_deals --  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_low_per_Body, 2));
                              Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                              Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                              //
                    } //
          } //
          if(false)
          {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                    Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].force_of_deals --", "   >" + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_low_per_Body, 2), "Arial", 6);
                    Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrYellow);
                    Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 3 * Point, 0, ANCHOR_LEFT);
                    Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].force_of_deals --");
                    Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                    Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                    //
          } //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_RightMenuPad::SHOW_CandlePattern__Inside_Engulfing_Bar(int k)
{         //---
          //Alert(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k]._Place);
          //---
          {         if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.Inside_Engulfing_Bar.Is_Engulfing_bullish )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Engulfing_bullish ++++", "**————2.Engulfing_bullish", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrCornflowerBlue);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 5 * Point, 0, ANCHOR_LEFT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Engulfing_bullish ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
                    if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.Inside_Engulfing_Bar.Is_Engulfing_bearish )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Engulfing_bearish ++++", "2.Engulfing_bearish————*", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrRed);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 5 * Point, 0, ANCHOR_RIGHT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Engulfing_bearish ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
          }
          //
          //
          {         if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.Inside_Engulfing_Bar.Is_InSideBar_Bulish )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_InSideBar_Bulish ++++", "*————2.InSideBar_Bulish", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrCornflowerBlue);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 5 * Point, 0, ANCHOR_LEFT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_InSideBar_Bulish ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
                    if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.Inside_Engulfing_Bar.Is_InSideBar_bearish )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_InSideBar_bearish ++++", "2.InSideBar_bearish————*", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrRed);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 5 * Point, 0, ANCHOR_RIGHT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_InSideBar_bearish ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_RightMenuPad::SHOW_CandlePattern__There_bar(int k)
{         //---
          //bool              Is_Pattern_ThreeBlackCrows;
          //bool              Is_Pattern_ThreeWhiteSoldiers;
          //bool              Is_Pattern_DarkCloudCover;
          //bool              Is_Pattern_PiercingLine;
          //bool              Is_Pattern_MorningDoji;
          //bool              Is_Pattern_EveningDoji;
          //bool              Is_Pattern_BearishEngulfing;
          //bool              Is_Pattern_BullishEngulfing;
          //bool              Is_Pattern_EveningStar;
          //bool              Is_Pattern_MorningStar;
          //bool              Is_Pattern_Hammer;
          //bool              Is_Pattern_HangingMan;
          //bool              Is_Pattern_BearishHarami;
          //bool              Is_Pattern_BullishHarami;
          //bool              Is_Pattern_BearishMeetingLines;
          //bool              Is_Pattern_BullishMeetingLines;
          //---
          {         if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_ThreeWhiteSoldiers )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_ThreeWhiteSoldiers ++++", "*————3.ThreeWhiteSoldiers", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrCornflowerBlue);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 10 * Point, 0, ANCHOR_LEFT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_ThreeWhiteSoldiers ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
                    if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_ThreeBlackCrows )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_ThreeBlackCrows ++++", "3.ThreeBlackCrows————*", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrRed);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 10 * Point, 0, ANCHOR_RIGHT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_ThreeBlackCrows ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
          }
          //---
          {         if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_PiercingLine )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_PiercingLine ++++", "*————3.PiercingLine", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrCornflowerBlue);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 10 * Point, 0, ANCHOR_LEFT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_PiercingLine ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
                    if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_DarkCloudCover )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_DarkCloudCover ++++", "3.DarkCloudCover————*", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrRed);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 10 * Point, 0, ANCHOR_RIGHT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_DarkCloudCover ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
          }
          //---
          {         if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_EveningDoji )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_EveningDoji ++++", "*————3.EveningDoji", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrCornflowerBlue);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 10 * Point, 0, ANCHOR_LEFT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_EveningDoji ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
                    if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_MorningDoji )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_MorningDoji ++++", "3.MorningDoji————*", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrRed);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 10 * Point, 0, ANCHOR_RIGHT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_MorningDoji ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
          }
          //---
          {         if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_BullishEngulfing )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_BullishEngulfing ++++", "*————3.BullishEngulfing", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrCornflowerBlue);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 10 * Point, 0, ANCHOR_LEFT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_BullishEngulfing ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
                    if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_BearishEngulfing )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_BearishEngulfing ++++", "3.BearishEngulfing————*", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrRed);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 10 * Point, 0, ANCHOR_RIGHT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_BearishEngulfing ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
          }
          //---
          {         if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_EveningStar )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_EveningStar ++++", "*————3.EveningStar", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrCornflowerBlue);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 10 * Point, 0, ANCHOR_LEFT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_EveningStar ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
                    if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_MorningStar )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_MorningStar ++++", "3.MorningStar————*", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrRed);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 10 * Point, 0, ANCHOR_RIGHT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_MorningStar ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
          }
          //---
          {         if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_HangingMan )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_HangingMan ++++", "*————3.HangingMan", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrCornflowerBlue);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 10 * Point, 0, ANCHOR_LEFT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_HangingMan ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
                    if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_Hammer )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_Hammer ++++", "3.Pattern_Hammer————*", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrRed);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 10 * Point, 0, ANCHOR_RIGHT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_Hammer ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
          }
          //---
          {         if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_BullishHarami )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_BullishHarami ++++", "*————3.BullishHarami", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrCornflowerBlue);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 10 * Point, 0, ANCHOR_LEFT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_BullishHarami ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
                    if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_BearishHarami )
                    {
                              {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_BearishHarami ++++", "3.BearishHarami————*", "Arial", 7);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrRed);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 10 * Point, 0, ANCHOR_RIGHT);
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_BearishHarami ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                        Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                        Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                        //
                              } //
                    } //
                    //---
                    {         if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_BullishMeetingLines )
                              {
                                        {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                                  Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_BullishMeetingLines ++++", "*————3.BullishMeetingLines", "Arial", 7);
                                                  Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrCornflowerBlue);
                                                  Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._High + 10 * Point, 0, ANCHOR_LEFT);
                                                  Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_BullishMeetingLines ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                                  Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                                  Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                                  //
                                        } //
                              } //
                              if( ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.There_bar.Is_Pattern_BearishMeetingLines )
                              {
                                        {         Dev_Object_Pack.Texts.Description.GDS.Set_Action_2(MODE_CREATE, true);//---DescX
                                                  Dev_Object_Pack.Texts.Description.GDS.Set_Desc_4("Bars_M5[" + (string)k + "].Is_Pattern_BearishMeetingLines ++++", "3.BearishMeetingLines————*", "Arial", 7);
                                                  Dev_Object_Pack.Texts.Description.GDS.Set_Color_1(clrRed);
                                                  Dev_Object_Pack.Texts.Description.GDS.Set_Location_4(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Time, ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Solid._Low - 10 * Point, 0, ANCHOR_RIGHT);
                                                  Dev_Object_Pack.Texts.Description.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Bars_M5[" + (string)k + "].Is_Pattern_BearishMeetingLines ++++  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_shadow.shadow_high_per_Body, 2));
                                                  Dev_Object_Pack.Texts.Description.GDS.Set_Chart_6();
                                                  Dev_Object_Pack.Texts.Description.Action(Dev_Object_Pack.Texts.Description); //
                                                  //
                                        } //
                              } //
                    }
                    //---
          }///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_RightMenuPad::Desc_Status(bool b, bool IsUpdate)
{         if(!IsUpdate)
          {         int FontSZ = 10;
                    Object_Pack.Texts.RectLabel.Draw_GDS(MODE_CREATE, b, "RL.BackGrandTexts", 0, 200, 480, 200, CORNER_LEFT_LOWER, clrMidnightBlue, clrMidnightBlue, STYLE_SOLID, 1, BORDER_FLAT, false);
                    //DevTextsButton.BTNCycle(MODE_CREATE, false, "Active_Status", "a", 0, 0, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrMidnightBlue, clrWhite,  0, 0, 4, "Webdings", 1, 3 ); // v Q Í
                    //DevTextsButton.BTNCycle(MODE_CREATE, b, "Active_Status", "a", -80 + 90, 20, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrMidnightBlue, clrWhite,  0, 0, 4, "Webdings", 1, 1 ); // v Q Í
                    //--------------------
                    Object_Pack.Texts.Label.Create_Solo(!b, 0, "Signal_DescFinal",         0, 20, 20, CORNER_LEFT_LOWER, "->> "  + ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_DescFinals, "Arial", FontSZ, clrYellow, 0, ANCHOR_LEFT_UPPER);
                    Object_Pack.Texts.Label.Create_Solo(!b, 0, "Signal_Desc2",         0, 20, 20 + 20, CORNER_LEFT_LOWER, "->> " + ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1, "Arial", FontSZ, clrYellow, 0, ANCHOR_LEFT_UPPER);
                    Object_Pack.Texts.Label.Create_Solo(!b, 0, "Signal_Desc1",         0, 20, 40 + 20, CORNER_LEFT_LOWER, "->> " + ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0, "Arial", FontSZ, clrYellow, 0, ANCHOR_LEFT_UPPER);
                    Object_Pack.Texts.Label.Create_Solo(!b, 0, "Signal_Desc0",         0, 20, 60 + 20, CORNER_LEFT_LOWER, "->> " + ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc, "Arial", FontSZ, clrYellow, 0, ANCHOR_LEFT_UPPER);
                    Object_Pack.Texts.Label.Create_Solo(!b, 0, "Signal_Value",         0, 20, 80 + 20, CORNER_LEFT_LOWER, "->> " + ct_Drive.TDD.ct_Signals.DATAS.WinRate_Desc + " >> " + EnumToString(ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Enum), "Arial", FontSZ, clrYellow, 0, ANCHOR_LEFT_UPPER);
                    Object_Pack.Texts.Label.Create_Solo(!b, 0, "Channel_Value",        0, 20, 100 + 20, CORNER_LEFT_LOWER, "->> " + ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels._Extention.Channels_Extention_Current.ChannelNavigation_Desc, "Arial", FontSZ, clrYellow, 0, ANCHOR_LEFT_UPPER);
                    Object_Pack.Texts.Label.Create_Solo(!b, 0, "Wave_Value",           0, 20, 120 + 20, CORNER_LEFT_LOWER, "->> ", "Arial", FontSZ, clrYellow, 0, ANCHOR_LEFT_UPPER);
                    Object_Pack.Texts.Label.Create_Solo(!b, 0, "Market_Correction",    0, 20, 140 + 20, CORNER_LEFT_LOWER, "->> ", "Arial", FontSZ, clrYellow, 0, ANCHOR_LEFT_UPPER);
                    Object_Pack.Texts.Label.Create_Solo(!b, 0, "Perdiction1",          0, 20, 160 + 20, CORNER_LEFT_LOWER, "->> ", "Arial", FontSZ, clrYellow, 0, ANCHOR_LEFT_UPPER);
                    Object_Pack.Texts.Label.Create_Solo(!b, 0, "Perdiction",           0, 20, 180 + 20, CORNER_LEFT_LOWER, "->> ", "Arial", FontSZ, clrYellow, 0, ANCHOR_LEFT_UPPER); //
                    IsBasic_Showed_Active_Status = b;//
          }
          //+------------------------------------------------------------------+
          else
          {         //DevTextsButton.BTNCycle(MODE_CREATE, true, "Active_Status", "a", -80 + 90, 20, CORNER_LEFT_UPPER, ANCHOR_RIGHT, false, clrDarkSlateGray, clrMidnightBlue, clrWhite,  0, 0, 4, "Webdings", 1, 1 ); // v Q Í  ?
                    Object_Pack.Texts.Label.Create_Solo_Update("Signal_DescFinal",     "->-> "  + ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_DescFinals );
                    Object_Pack.Texts.Label.Create_Solo_Update("Signal_Desc2",     "->-> "  + ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc1 );
                    Object_Pack.Texts.Label.Create_Solo_Update("Signal_Desc1",     "->-> "  + ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc0 );
                    Object_Pack.Texts.Label.Create_Solo_Update("Signal_Desc0",     "->-> "  + ct_Drive.TDD.ct_Signals.DATAS.Signals_Flags.Enum_Signal_Desc );
                    Object_Pack.Texts.Label.Create_Solo_Update("Signal_Value", "PW:" +  (string)ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Enum__Power__ + "/" + (string)ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Enum__Power__Point     + ct_Drive.TDD.ct_Signals.DATAS.WinRate_Desc + " " + EnumToString(ct_Drive.TDD.ct_Signals.DATAS.Decition_All_SignalEstimateOut.Enum) + " " + (string)ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Enum__LINE__ + " " + ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Enum__Desc__ + "   " + EnumToString(ct_Drive.Etf_Trade_Mode));
                    Object_Pack.Texts.Label.Create_Solo_Update("Channel_Value",   "->-> " + ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels._Extention.Channels_Extention_Current.ChannelNavigation_Desc + "   >>  " + DoubleToStr(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels._Extention.Channels_Extention_Current.Channel_Size, 2));
                    //
                    Object_Pack.Texts.Label.Create_Solo_Update("Wave_Value",      "->-> " + " UpTrend Forwarding" + "   >>  " + (string)ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_TrendUp_Forwarding);
                    Object_Pack.Texts.Label.Create_Solo_Update("Market_Correction", "->-> " + " Is_Market_Correction" + "   >>  " + (string)ct_Drive.TDD.ct_Conductor.DC_data.Is_Market_Correction_Sell);
                    Object_Pack.Texts.Label.Create_Solo_Update("Perdiction1",       "->-> " + GoldVIP_PanelPeriodsData._ClientTPX.TPX_Set_TypeDesc +   "  TP1: " + GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP1ValueDesc   +   "  TP2: " + GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP2ValueDesc  +   "  TP3: " + GoldVIP_PanelPeriodsData._ClientTPX.TPX_TP3ValueDesc +     "  SL: " + GoldVIP_PanelPeriodsData._ClientTPX.TPX_StopLossValueDesc );//
                    Object_Pack.Texts.Label.Create_Solo_Update("Perdiction",        "->-> " + " Perdiction::" + "   >>  " + EnumToString(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Current_Direction_TL_2_4_TL_1_3)   + " GBuy:" + (string)ct_Drive.TDD.ct_Signals.DATAS.Is_Good_To_Buy + " GSell:" + (string)ct_Drive.TDD.ct_Signals.DATAS.Is_Good_To_Sell ); //
                    IsBasic_Showed_Active_Status = true;//
          } //
} //

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_RightMenuPad::SHOW_Report_Signal(int WhichMode = MODE_CREATE, bool IsKey = false, int MoveX = 0, int MoveY = 0, int _x_Digit = 210)
{         //---[XXXX]******************************************************************************************************************
          int xpoint = -130; int ypoint = 100;//230;
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NN_", "Signal_Estimate_Curr_NeuralNetwork:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 145 + 75, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NN_");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NN_-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 145 + 75, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NN_-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //-------------------------------------------------------------------------------------------------------------------------------------
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NN_A", "Signal_Estimate_Curr_NeuralNetwork:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 145 + 60, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NN_A");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NN_A-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 145 + 60, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NN_A-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //-------------------------------------------------------------------------------------------------------------------------------------
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NN_B", "Signal_Estimate_Curr_NeuralNetwork:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 145 + 45, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NN_B");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NN_B-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 145 + 45, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NN_B-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //-------------------------------------------------------------------------------------------------------------------------------------
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NN_A1", "Signal_Estimate_Curr_NeuralNetwork:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 145 + 30, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NN_A1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NN_A1-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 145 + 30, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NN_A1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //-------------------------------------------------------------------------------------------------------------------------------------
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NN_B1", "Signal_Estimate_Curr_NeuralNetwork:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 145 + 15, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NN_B1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NN_B1-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 145 + 15, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NN_B1-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //-------------------------------------------------------------------------------------------------------------------------------------
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NN_C", "Signal_Estimate_Curr_NeuralNetwork:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 145 + 0, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NN_C");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NN_C-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 145 + 0, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NN_C-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //-------------------------------------------------------------------------------------------------------------------------------------
          //{         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
          //          LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NULL", " ", "Arial Bold", 9);
          //          LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
          //          LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 130, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
          //          LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NULL");
          //          LabelX.GDS.Set_Chart_6();
          //          LabelX.Action(LabelX); //
          //}
          ////---[ ]
          //{         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
          //          LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NULL-X", " ", "Arial Bold", 9);
          //          LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
          //          LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 130, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
          //          LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NULL-X");
          //          LabelX.GDS.Set_Chart_6();
          //          LabelX.Action(LabelX); //
          //}
          //-------------------------------------------------------------------------------------------------------------------------------------
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_TREE_Supername", "Signal_Estimate_Curr_TREE_" + (string)C_TD2::XlevelDecition + "_Supername: ", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 115, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_TREE_Supername");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_TREE_Supername-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 115, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_TREE_Supername-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[XXXX]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_TREE", "Signal_Estimate_Curr_TREE_" + (string)C_TD2::XlevelDecition, "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 100, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_TREE");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_TREE-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 100, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_TREE-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[XXXX]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_TREE_info2", "Signal_Estimate_Curr_TREE_" + (string)C_TD2::XlevelDecition + "_info2: ", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 85, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_TREE_info2");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_TREE_info2-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 85, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_TREE_info2-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[XXXX]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_TREE_info1", "Signal_Estimate_Curr_TREE_" + (string)C_TD2::XlevelDecition + "_info: ", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 70, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_TREE_info1");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_TREE_info-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 70, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_TREE_info-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[XXXX]******************************************************************************************************************
          //{         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
          //          LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NULL2", "Signal_Estimate_Curr_ARRAY_Enter_Curr: ", "Arial Bold", 9);
          //          LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
          //          LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 55, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
          //          LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NULL2");
          //          LabelX.GDS.Set_Chart_6();
          //          LabelX.Action(LabelX); //
          //}
          ////---[ ]
          //{         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
          //          LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_NULL2-X", "---:", "Arial Bold", 9);
          //          LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
          //          LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 55, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
          //          LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_NULL2-X");
          //          LabelX.GDS.Set_Chart_6();
          //          LabelX.Action(LabelX); //
          //}
          //---[ ]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_ARRAY_Exit_Curr", "Signal_Estimate_Curr_ARRAY_Exit_Curr: ", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 40, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_ARRAY_Exit_Curr");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_ARRAY_Exit_Curr-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 40, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_ARRAY_Exit_Curr-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_ARRAY_Estimate_Curr", "Signal_Estimate_Curr_ARRAY_Estimate_Curr: ", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 25, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_ARRAY_Estimate_Curr");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_ARRAY_Estimate_Curr-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 25, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_ARRAY_Estimate_Curr-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]]******************************************************************************************************************
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_ALL_Optimum_Curr", "Signal_Estimate_Curr_ALL_Optimum_Curr: ", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX - 70 - 5, 10, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_ALL_Optimum_Curr");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[ ]
          {         LabelX.GDS.Set_Action_2(WhichMode, IsKey);
                    LabelX.GDS.Set_Desc_4( "Signal_Estimate_Curr_ALL_Optimum_Curr-X", "---:", "Arial Bold", 9);
                    LabelX.GDS.Set_Color_1(clrWhite);//clrNONE
                    LabelX.GDS.Set_Location_5(xpoint + _x_Digit + MoveX + 55 + 150, 10, 0, CORNER_LEFT_LOWER, ANCHOR_LEFT);
                    LabelX.GDS.Set_Common_6(false, 50, false, false, false, "tooltip-" + "Signal_Estimate_Curr_ALL_Optimum_Curr-X");
                    LabelX.GDS.Set_Chart_6();
                    LabelX.Action(LabelX); //
          }
          //---[XXXX]******************************************************************************************************************
          if(WhichMode == MODE_CREATE) IsBasic_Showed_Active_PeportSignal = IsKey;
          return true; //
}
//+------------------------------------------------------------------+
//||   ||||||||||                 C_RightMenuPad.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
