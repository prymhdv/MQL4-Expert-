//+------------------------------------------------------------------+
//||   ||||||||||            tDevConductor.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\.CoverOGC.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Custom_ZigZag.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum E_Key_Type { E_Create, E_Exit, E_Update, E_On_Tick };
//
struct St_CondicatorData_ChartAnalise
{         void  St_CondicatorData_ChartAnalise();
          void  ~St_CondicatorData_ChartAnalise() {};
//---
          bool       Is_Trend_Line_Touched_UpSide_Forwarding_Price;
          bool       Is_Trend_Line_Touched_DownSide_Downwarding_Price;
          //
          Cgs_DevObjectPack             Object_Pack;
          Cgs_DevObjectPack_Extention   ObjectPack_Extention;
          bool                          Update();
          void                          Progress(int f_WhichMode, bool f_Is_Key);
          //**************************************************************
          bool                  Is_All, Pad_Is_All; //                  = false;
          E_Key_Type            Key_Type_All;
          //
          bool                  Is_Lines;//                  = false;
          bool                  Is_Channels;//               = false;
          bool                  Is_Fibos;//                  = false;
          //
          bool                  Is_Waves, Pad_Is_Waves; //                  = false;
          E_Key_Type            Key_Type_Waves;
          //
          bool                  Is_Extra;//                  = false;
          bool                  Is_Extra_20_Zigzag;//        = false;
          bool                  Is_Rectangle;//              = false;
          //
          bool                  Is_Extra_1000_Channel;//        = false;
          //*********************************************************
          //int                   WhichMode;// = MODE_CREATE;
          //bool                  IsKey;//    = true;;
          //
          bool                  __Call__ChartAnalise( E_Key_Type U_Key);
          bool                  Draw_ChannelsZigZag_Current_Key(int f_WhichMode, bool f_Is_Key);
          //*********************************************************************************
          double Diff_Amount_TL_Best_Supporter;
          double Diff_Amount_TL_Best_Ressistancer;
          double Calc_TL_Best_Ressistancer;
          double Calc_TL_Best_Supporter;
          Sg_Wave_ _channel_Supporter, _channel_Ressistancer;
          //
          void Draw_TL_Best_Ressistancer(int f_WhichMode, bool f_Is_Key)
          {         if(Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Shift < 10) {return;}
                    //---Set Suport line by lowest point to close price
                    Object_Pack.Lines.Trend.Draw_GDS_Lines(f_WhichMode, true, "TL.highest", "", Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Price, Time[0], Close[0], clrWhite, 3, false, STYLE_DOT, false);
                    Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_Highest_v_Close0.Trend.Draw_Channel_High_Low_By_TL(f_WhichMode, true, false, Object_Pack.Lines.Trend.name, Time[0], Close[0], Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Price, clrWhite, 1, false, STYLE_DASHDOTDOT, PERIOD_CURRENT, 0); //
                    //--Find Slope of trend line calc p1  and p2
                    double      p2, p1;
                    datetime    t2, t1;
                    p2 = Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Price;      p1 = Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_Highest_v_Close0.Trend.Point_Externed_High._Price;
                    t2 = Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Time;               t1 = Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_Highest_v_Close0.Trend.Point_Externed_High._Time;
                    _channel_Ressistancer.Dev_Math.Slope            = _channel_Ressistancer.Dev_Math.calcSlope(p2, p1, t2, t1);
                    _channel_Ressistancer.Dev_Math.Diff_B           = _channel_Ressistancer.Dev_Math.GetB_LineFormule(_channel_Ressistancer.Dev_Math.Slope, t1, p1 );
                    _channel_Ressistancer.Z._Time                    = Time[0] + PeriodSeconds() * 30;
                    _channel_Ressistancer.Z._Price          = _channel_Ressistancer.Dev_Math.GetY_LineFormule(_channel_Ressistancer.Dev_Math.Slope, _channel_Ressistancer.Z._Time, _channel_Ressistancer.Dev_Math.Diff_B);
                    //
                    Object_Pack.Lines.Trend.Draw_GDS_Lines(f_WhichMode, f_Is_Key, "TL.BestRessistancer", "", t2, p2, _channel_Ressistancer.Z._Time, _channel_Ressistancer.Z._Price, clrRed, 3, false, STYLE_DOT, false); //
                    //--[diff Ressistance amount]
                    Diff_Amount_TL_Best_Ressistancer = ObjectGetValueByShift("TL.BestRessistancer", 0) - Bid  ;
                    //
                    Object_Pack.Lines.Trend.Draw_GDS_Lines(f_WhichMode, false, "TL.highest", "", Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Price, Time[0], Close[0], clrWhite, 3, false, STYLE_DOT, false);
                    Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_Highest_v_Close0.Trend.Draw_Channel_High_Low_By_TL(f_WhichMode, false, false, Object_Pack.Lines.Trend.name, Time[0], Close[0], Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Price, clrWhite, 1, false, STYLE_DASHDOTDOT, PERIOD_CURRENT, 0); //
                    //
          } //
          void Draw_TL_Best_Supporter(int f_WhichMode, bool f_Is_Key)
          {         if(Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Shift < 10) {return;}
                    //---Set Suport line by lowest point to close price
                    Object_Pack.Lines.Trend.Draw_GDS_Lines(f_WhichMode, true, "TL.lowest", "", Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Price, Time[0], Close[0], clrWhite, 3, false, STYLE_DOT, false);
                    Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_Lowest_v_Close0.Trend.Draw_Channel_High_Low_By_TL(f_WhichMode, true, false,  Object_Pack.Lines.Trend.name, Time[0], Close[0], Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Price, clrWhite, 1, false, STYLE_DASHDOTDOT, PERIOD_CURRENT, 0);  //
                    //--Find Slope of trend line calc p1  and p2
                    double      p2, p1;
                    datetime    t2, t1;
                    p2 = Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Price;      p1 = Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_Lowest_v_Close0.Trend.Point_Externed_Low._Price;
                    t2 = Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Time;               t1 = Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_Lowest_v_Close0.Trend.Point_Externed_Low._Time;
                    _channel_Supporter.Dev_Math.Slope            = _channel_Supporter.Dev_Math.calcSlope(p2, p1, t2, t1);
                    _channel_Supporter.Dev_Math.Diff_B           = _channel_Supporter.Dev_Math.GetB_LineFormule(_channel_Supporter.Dev_Math.Slope, t1, p1 );
                    _channel_Supporter.Z._Time                    = Time[0] + PeriodSeconds() * 30;
                    _channel_Supporter.Z._Price          = _channel_Supporter.Dev_Math.GetY_LineFormule(_channel_Supporter.Dev_Math.Slope, _channel_Supporter.Z._Time, _channel_Supporter.Dev_Math.Diff_B);
                    //
                    Object_Pack.Lines.Trend.Draw_GDS_Lines(f_WhichMode, f_Is_Key, "TL.BestSupporter", "", t2, p2, _channel_Supporter.Z._Time, _channel_Supporter.Z._Price, clrRed, 3, false, STYLE_DOT, false); //
                    //--[diff suport amount]
                    Diff_Amount_TL_Best_Supporter = Ask - ObjectGetValueByShift("TL.BestSupporter", 0) ;
                    //
                    Object_Pack.Lines.Trend.Draw_GDS_Lines(f_WhichMode, false, "TL.lowest", "", Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Price, Time[0], Close[0], clrWhite, 3, false, STYLE_DOT, false);
                    Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_Lowest_v_Close0.Trend.Draw_Channel_High_Low_By_TL(f_WhichMode, false, false,  Object_Pack.Lines.Trend.name, Time[0], Close[0], Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Price, clrWhite, 1, false, STYLE_DASHDOTDOT, PERIOD_CURRENT, 0);  //
                    //
          }
          void Draw_TL_Best_Ressistancer_v_TL_Best_Supporter(int f_WhichMode, bool  f_Is_Key)
          {         //-----------------------------------------------
                    double xDiffs = Diff_Amount_TL_Best_Supporter + Diff_Amount_TL_Best_Ressistancer;
                    if(xDiffs == 0)return;
                    Calc_TL_Best_Ressistancer = Diff_Amount_TL_Best_Ressistancer  / (Diff_Amount_TL_Best_Supporter + Diff_Amount_TL_Best_Ressistancer);
                    Calc_TL_Best_Supporter    = Diff_Amount_TL_Best_Supporter   / (Diff_Amount_TL_Best_Supporter + Diff_Amount_TL_Best_Ressistancer) ;
                    //-----------------------------------------------
                    {         Object_Pack.Texts.Description.Draw_GDS_Text(f_WhichMode, f_Is_Key, "TL.BestRessistancer_amount", "RAM: " + DoubleToStr(Diff_Amount_TL_Best_Ressistancer, 2) + " : " + DoubleToStr(Calc_TL_Best_Ressistancer, 2),  _channel_Ressistancer.Z._Time, _channel_Ressistancer.Z._Price, clrYellow, "Arial", 10, ANCHOR_LEFT, 0, false); //
                              Object_Pack.Texts.Description.Draw_GDS_Text(f_WhichMode, f_Is_Key, "TL.BestSupporter_amount", "SAM: " + DoubleToStr(Diff_Amount_TL_Best_Supporter, 2) + " : " + DoubleToStr(Calc_TL_Best_Supporter, 2),  _channel_Supporter.Z._Time, _channel_Supporter.Z._Price, clrYellow, "Arial", 10, ANCHOR_LEFT, 0, false); //
                    }//
          }//

//---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_ChartAnalise::St_CondicatorData_ChartAnalise()
{         if(IsTesting() || IsOffChartShapes) return; //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          Pad_Is_All            = false;
          Pad_Is_Waves          = false;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          Is_All                = false;
          Is_Lines              = false;
          Is_Channels           = false;
          Is_Fibos              = false;
          Is_Waves              = false;
          Is_Extra              = false;
          Is_Extra_20_Zigzag    = false;
          Is_Rectangle          = false;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          __Call__ChartAnalise(E_Create);//
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_CondicatorData_ChartAnalise::Update()
{         if(IsTesting()) return true;//
          //Alert("Start-Stack error " + __FUNCTION__);
          __Call__ChartAnalise(E_Update);//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          return true;
//---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_CondicatorData_ChartAnalise::__Call__ChartAnalise( E_Key_Type f_Key_Type)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          switch(f_Key_Type)
          {         case  E_Update: {if(Key_Type_All == E_Exit) {return false;} Progress(MODE_CREATE, true);      Key_Type_All = f_Key_Type;}; break; //
                    case  E_Exit:   {                                           Progress(MODE_CREATE, false);                                   Key_Type_All = f_Key_Type;}; break; //
                    case  E_Create: {                                           Progress(MODE_CREATE, true);                                    Key_Type_All = f_Key_Type;}; break; //
                    default:   break; //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          return true;///
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CondicatorData_ChartAnalise::Progress(int f_WhichMode, bool f_Is_Key)
{         if(!Detect_NewBar._M1.CBT__Seccound.Is_NewBar && Initer.IsBasic_Done) {f_Is_Key = false;}
          if(!ct_Drive.TDD.ct_Configs.IsShow_Channel_Shapes && Initer.IsBasic_Done) {f_Is_Key = false;}
          //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          {         Object_Pack.Lines.Trend.Draw_GDS              (f_WhichMode, f_Is_Key, "TL-Cheach-Broken", 100, 100, FALSE, clrYellow, STYLE_DOT, 1, true, true); //---the line show is (berish)ressistence or (bulish)suport
                    Object_Pack.Lines.TrendByAngle.Draw_GDS       (f_WhichMode, f_Is_Key, "TLA", 100, 100, TRUE);
                    Object_Pack.Lines.Vertical.Draw_GDSVertical1  (f_WhichMode, f_Is_Key, "TLV", Time[0], STYLE_DOT, 1, clrYellow, TRUE);
                    Object_Pack.Lines.Horizontal.Draw_GDS         (f_WhichMode, f_Is_Key, "TLH", Close[0], TRUE);//
          }
          //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          {         Object_Pack.Channels.Regression.Draw_GDS        (f_WhichMode, f_Is_Key, "R1", 100, 100, TRUE);
                    //
                    {         bool IsOff = false;
                              IsOff = f_Is_Key;  //
                              if(!ct_Drive.TDD.ct_Configs.IsShow_CHSD_Shapes && Initer.IsBasic_Done){IsOff = false;}
                              if(ct_Drive.TDD.ct_Configs.IsShow_CHSD_Shapes && Initer.IsBasic_Done && !ct_Drive.TDD.ct_Configs.IsShow_Channel_Shapes){IsOff = true;}
                              Object_Pack.Channels.StandardDeviation.Draw_GDS (f_WhichMode, false, "S1.61", PERIOD_M1, 1.61, 1000, 0, 3, true, clrWhite, STYLE_SOLID, false);
                              Object_Pack.Channels.StandardDeviation.Draw_GDS (f_WhichMode, IsOff, "S1.61", PERIOD_M1, 1.61, 1000, 0, 3, true, clrWhite, STYLE_SOLID, false);
                              Object_Pack.Channels.StandardDeviation.Draw_GDS (f_WhichMode, false, "S2.61", PERIOD_M1, 2.61, 1000, 0, 3, true, clrOrangeRed, STYLE_SOLID, false);
                              Object_Pack.Channels.StandardDeviation.Draw_GDS (f_WhichMode, IsOff, "S2.61", PERIOD_M1, 2.61, 1000, 0, 3, true, clrOrangeRed, STYLE_SOLID, false);
                              Object_Pack.Channels.StandardDeviation.Draw_GDS (f_WhichMode, false, "S3.61", PERIOD_M1, 3.61, 1000, 0, 3, true, clrOrange, STYLE_SOLID, false);
                              Object_Pack.Channels.StandardDeviation.Draw_GDS (f_WhichMode, IsOff, "S3.61", PERIOD_M1, 3.61, 1000, 0, 3, true, clrOrange, STYLE_SOLID, false);//
                    }
                    //
                    Object_Pack.Channels.Pitchfork.Draw_GDS         (f_WhichMode, f_Is_Key, "P1", 100, 100, TRUE);
                    Object_Pack.Channels.Equidistant.Draw_GDS       (f_WhichMode, f_Is_Key, "E1", 100, 100, TRUE);//
          }
          //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          {         //-- Object_Pack.Fibos.Expansion.Draw_GDS    (f_WhichMode, f_Is_Key, "FE", 200, 100, FALSE);//--deleteing
                    //--
                    Object_Pack.Fibos.Retracement.Draw_GDS  (f_WhichMode, f_Is_Key, "FR", 100, 100, TRUE);
                    {         bool IsActive = f_Is_Key;
                              if(ct_Drive.TDD.ct_Configs.IsShow_Channel_Shapes && Initer.IsBasic_Done) {IsActive = false;}
                              Object_Pack.Fibos.Expansion.Draw_GDS    (f_WhichMode, IsActive = false, "FE", 200, 100, FALSE, true); // zero mean all bars on chart
                              //Object_Pack.Fibos.Expansion.Draw_GDS    (f_WhichMode, f_Is_Key,"FE2", 100, 100, TRUE);     // zero mean all bars on chart //one man one bar on chart  range 101-100 AB     a+b frist point
                              //
                    }
                    Object_Pack.Fibos.Channel.Draw_GDS      (f_WhichMode, f_Is_Key, "FC", 100, 100, TRUE);
                    Object_Pack.Fibos.Fan.Draw_GDS          (f_WhichMode, f_Is_Key, "FF", 100, 100, TRUE);
                    Object_Pack.Fibos.TimeZone.Draw_GDS     (f_WhichMode, f_Is_Key, "FT", 100, 100, TRUE);
                    Object_Pack.Fibos.Arc.Draw_GDS          (f_WhichMode, f_Is_Key, "FA", 100, 100, TRUE);//
                    if(false)
                    {         color clr_1 = clrAzure, clr_2 = clrAzure,  clr_3 = clrAzure, clr__1 = clrAzure, clr__2 = clrAzure, clr__3 = clrAzure;
                              int Shift_Extermum = 0;
                              Shift_Extermum            = Object_Pack.Fibos.Expansion.GDS.Is_Bulish ? iHighest(NULL, PERIOD_CURRENT, MODE_HIGH, Object_Pack.Fibos.Expansion.GDS.PRICE2_Shift / 2, 0) : iLowest(NULL, PERIOD_CURRENT, MODE_LOW, Object_Pack.Fibos.Expansion.GDS.PRICE2_Shift / 2, 0);
                              double Price_Extermum     = Object_Pack.Fibos.Expansion.GDS.Is_Bulish ? iHigh(NULL, PERIOD_CURRENT, Shift_Extermum)                                                : iLow(NULL, PERIOD_CURRENT, Shift_Extermum);
                              clr_1 =  (Object_Pack.Fibos.Expansion.GDS.PRICE2 < Price_Extermum) && Object_Pack.Fibos.Expansion.GDS.Is_Bulish  ? clrAzure : clrDarkOrchid;
                              clr_1 =  (Object_Pack.Fibos.Expansion.GDS.PRICE2 > Price_Extermum) && !Object_Pack.Fibos.Expansion.GDS.Is_Bulish ? clrAzure : clrDarkOrchid;
                              //---off---Alert("sz: ", ArraySize(Object_Pack.Fibos.Expansion.GDS.Price));
                              Object_Pack.Shapes.Rectangle.Draw_GDS(f_WhichMode, f_Is_Key, "FE-R-061", "", false, Time[0], Object_Pack.Fibos.Expansion.GDS.Price[3], Time[0] + PeriodSeconds() * 50, Object_Pack.Fibos.Expansion.GDS.Price[3] + 50 * Point, clr_1, true);
                              Object_Pack.Shapes.Rectangle.Draw_GDS(f_WhichMode, f_Is_Key, "FE-R-100", "", false, Time[0], Object_Pack.Fibos.Expansion.GDS.Price[5], Time[0] + PeriodSeconds() * 50, Object_Pack.Fibos.Expansion.GDS.Price[5] + 50 * Point, clr_2, true);
                              Object_Pack.Shapes.Rectangle.Draw_GDS(f_WhichMode, f_Is_Key, "FE-R-161", "", false, Time[0], Object_Pack.Fibos.Expansion.GDS.Price[8], Time[0] + PeriodSeconds() * 50, Object_Pack.Fibos.Expansion.GDS.Price[8] + 50 * Point, clr_3, true); //
                              //--
                              Object_Pack.Shapes.Rectangle.Draw_GDS(f_WhichMode, f_Is_Key, "FE-R--061", "", false, Time[0], Object_Pack.Fibos.Expansion.GDS.Price[17], Time[0] + PeriodSeconds() * 50, Object_Pack.Fibos.Expansion.GDS.Price[17] + 50 * Point, clr__1, true);
                              Object_Pack.Shapes.Rectangle.Draw_GDS(f_WhichMode, f_Is_Key, "FE-R--100", "", false, Time[0], Object_Pack.Fibos.Expansion.GDS.Price[19], Time[0] + PeriodSeconds() * 50, Object_Pack.Fibos.Expansion.GDS.Price[19] + 50 * Point, clr__2, true);
                              Object_Pack.Shapes.Rectangle.Draw_GDS(f_WhichMode, f_Is_Key, "FE-R--161", "", false, Time[0], Object_Pack.Fibos.Expansion.GDS.Price[22], Time[0] + PeriodSeconds() * 50, Object_Pack.Fibos.Expansion.GDS.Price[22] + 50 * Point, clr__3, true); //
                              //--- define fibo retracement of expantion
                              datetime  _Time = Object_Pack.Fibos.Expansion.GDS.TIME1 + PeriodSeconds() * 21;
                              Object_Pack.Texts.Description.Draw_GDS_Text(f_WhichMode, f_Is_Key, "FE-Retrecment: " + Object_Pack.Fibos.Expansion.GDS.Percent_Retrece_3_Desc,  "FE-Retrecment: " + Object_Pack.Fibos.Expansion.GDS.Percent_Retrece_3_Desc, _Time, Object_Pack.Fibos.Expansion.GDS.PRICE1, clrYellow, "Arial", 12, ANCHOR_LEFT, 0, false); //
                              //
                    }//
          }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          {         //
                    int zzg = 0; int zzmul = 3;
                    Object_Pack.Channels.ChannelsZigZag._Current.Draw_GDS(      f_WhichMode, f_Is_Key, 0, true, zzmul, zzg); //--creating
                    Object_Pack.Channels.ChannelsZigZag._MN.Draw_GDS(           f_WhichMode, f_Is_Key, 6, FALSE, zzmul, zzg);
                    Object_Pack.Channels.ChannelsZigZag._W1.Draw_GDS(           f_WhichMode, f_Is_Key, 6, FALSE, zzmul, zzg);
                    Object_Pack.Channels.ChannelsZigZag._D1.Draw_GDS(           f_WhichMode, f_Is_Key, 5, FALSE, zzmul, zzg);
                    Object_Pack.Channels.ChannelsZigZag._H4.Draw_GDS(           f_WhichMode, f_Is_Key, 5, FALSE, zzmul, zzg);
                    Object_Pack.Channels.ChannelsZigZag._H1.Draw_GDS(           f_WhichMode, f_Is_Key, 4, FALSE, zzmul, zzg);
                    Object_Pack.Channels.ChannelsZigZag._M30.Draw_GDS(          f_WhichMode, f_Is_Key, 4, FALSE, zzmul, zzg);
                    Object_Pack.Channels.ChannelsZigZag._M15.Draw_GDS(          f_WhichMode, f_Is_Key, 3, FALSE, zzmul, zzg);
                    Object_Pack.Channels.ChannelsZigZag._M5.Draw_GDS(           f_WhichMode, f_Is_Key, 3, FALSE, zzmul, zzg);
                    Object_Pack.Channels.ChannelsZigZag._M1.Draw_GDS(           f_WhichMode, f_Is_Key, 2, FALSE, zzmul, zzg);
                    Key_Type_Waves = E_Update; Is_Waves = false;//
          } //
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---extention
          if(false)
          {         Object_Pack.Channels._Extention.Channels_Extention_Current.Draw_Channels(f_Is_Key, Object_Pack.Fibos.Expansion.GDS);  Is_Extra    = true;//
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          {         //  ObjectPack_Extention._ZigZag_1000_Bar.Draw_ZigZag(f_WhichMode, f_Is_Key);
                    //  ObjectPack_Extention._ZigZag_1000_1000_Bar.Draw_ZigZag(f_WhichMode, f_Is_Key);//
          }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          if(false)
          {         double iATR_ = iATR(NULL, PERIOD_CURRENT, 14, 0); double P1 = iATR_ + 200 * Point;  double P2 = iATR_ * 100 * Point;
                    Object_Pack.Shapes.Rectangle.Draw_GDS(f_WhichMode, f_Is_Key,  "R1", "", TRUE, Time[0] + PeriodSeconds() * 40, Ask + P1, Time[0] + PeriodSeconds() * 42, Ask + P2, clrLime, true);
                    Object_Pack.Shapes.Rectangle.Draw_GDS(f_WhichMode, f_Is_Key,  "R2", "", TRUE, Time[0] + PeriodSeconds() * 40, Ask - P1, Time[0] + PeriodSeconds() * 42, Ask - P2, clrLime, true); //
          }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          if(false)
          {         int Shift = 15;
                    Object_Pack.Lines.Trend.Draw_GDS_Lines (f_WhichMode, f_Is_Key, "TL._1000_Channel", "", Time[Shift], Close[Shift], Time[1000], Close[1000], clrBlack, 3, false, STYLE_DOT, false); //
                    Object_Pack.Lines.Trend.Draw_Channel_High_Low_By_TL(f_WhichMode, f_Is_Key, false, "TL._1000_Channel", Time[Shift], Close[Shift], Time[1000], Close[1000], clrRed, 1, false, STYLE_DASHDOTDOT, PERIOD_CURRENT, 0); //
          }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//---Draw_Channel_High_Low_By_TL
//
          if(false)
          {         if(Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.IsBasic_Existed() || Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.ISBasic_NotExisted())
                    {         Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave2.Trend.Draw_Channel_High_Low_By_TL(f_WhichMode, f_Is_Key, false,  Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.name, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.Z._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.Z._Price, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.A._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave2.A._Price, clrWhite, 1, false, STYLE_DASHDOTDOT, PERIOD_CURRENT, 0); //
                              Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave3.Trend.Draw_Channel_High_Low_By_TL(f_WhichMode, f_Is_Key, false,  Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.name, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.Z._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.Z._Price, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.A._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave3.A._Price, clrWhite, 1, false, STYLE_DASHDOTDOT, PERIOD_CURRENT, 0); //
                              Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave4.Trend.Draw_Channel_High_Low_By_TL(f_WhichMode, f_Is_Key, false,  Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave4.name, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave4.Z._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave4.Z._Price, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave4.A._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave4.A._Price, clrWhite, 1, false, STYLE_DASHDOTDOT, PERIOD_CURRENT, 0); //
                              Object_Pack.Channels.ChannelsZigZag._Current.C_Lines_ElliotsWave3_Wave5.Trend.Draw_Channel_High_Low_By_TL(f_WhichMode, f_Is_Key, false,  Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.name, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Z._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.Z._Price, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.A._Time, Object_Pack.Channels.ChannelsZigZag._Current.GDS.Wave5.A._Price, clrWhite, 1, false, STYLE_DASHDOTDOT, PERIOD_CURRENT, 0); ////
                    } //
          }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          Draw_TL_Best_Supporter(f_WhichMode, f_Is_Key);
          Draw_TL_Best_Ressistancer(f_WhichMode, f_Is_Key);
          Draw_TL_Best_Ressistancer_v_TL_Best_Supporter(f_WhichMode, f_Is_Key);
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//----control by ema Keep near
          if(false)
          {         int       Bar_Shif_Lowest         = Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Shift;///
                    double    Wave_Price_Lowest       = Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Lowest._Price;///
                    int       Bar_Shif_Highest        = Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Shift;///
                    double    Wave_Price_Highest      = Object_Pack.Channels.ChannelsZigZag._Current.GDS.Point_Highest._Price;///
                    //---
                    double    Moving_EMA500_Lowest  =  iMA(NULL, PERIOD_CURRENT, 500, 0, MODE_EMA, PRICE_CLOSE, Bar_Shif_Lowest);
                    double    Moving_EMA500_Highest =  iMA(NULL, PERIOD_CURRENT, 500, 0, MODE_EMA, PRICE_CLOSE, Bar_Shif_Highest);
                    //
                    double    Highth_EMA500_Wave_Price_Lowest  = MathAbs(Moving_EMA500_Lowest - Wave_Price_Lowest);
                    double    Highth_EMA500_Bid_Lowest         = MathAbs(Moving_EMA500_Lowest - Bid);
                    double    Highth_EMA500_Wave_Price_Highest = MathAbs(Moving_EMA500_Highest - Wave_Price_Highest);
                    double    Highth_EMA500_Bid_Highest        = MathAbs(Moving_EMA500_Highest - Bid);
                    //
                    if(Highth_EMA500_Wave_Price_Lowest > Highth_EMA500_Bid_Lowest)
                    {         //--/Alert("Lowest Is Keep near EMA500");
                              //
                    }
                    //
                    if(Highth_EMA500_Wave_Price_Highest > Highth_EMA500_Bid_Highest)
                    {         //---- Alert("Highest Is Keep near EMA500");
                              //
                    }
                    //
          }
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool St_CondicatorData_ChartAnalise::Draw_ChannelsZigZag_Current_Key(int f_WhichMode, bool f_Is_Key)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          int zzg = 0; int zzmul = 3;
          Object_Pack.Channels.ChannelsZigZag._MN.Draw_GDS(f_WhichMode, f_Is_Key, 0, FALSE, zzmul, zzg); //--deleteing
          Object_Pack.Channels.ChannelsZigZag._W1.Draw_GDS(f_WhichMode, f_Is_Key, 0, FALSE, zzmul, zzg); //--deleteing
          Object_Pack.Channels.ChannelsZigZag._D1.Draw_GDS(f_WhichMode, f_Is_Key, 0, FALSE, zzmul, zzg); //--deleteing
          Object_Pack.Channels.ChannelsZigZag._H4.Draw_GDS(f_WhichMode, f_Is_Key, 0, FALSE, zzmul, zzg); //--deleteing
          Object_Pack.Channels.ChannelsZigZag._H1.Draw_GDS(f_WhichMode, f_Is_Key, 0, FALSE, zzmul, zzg); //--deleteing
          Object_Pack.Channels.ChannelsZigZag._M30.Draw_GDS(f_WhichMode, f_Is_Key, 0, FALSE, zzmul, zzg); //--deleteing
          Object_Pack.Channels.ChannelsZigZag._M15.Draw_GDS(f_WhichMode, f_Is_Key, 0, FALSE, zzmul, zzg); //--deleteing
          Object_Pack.Channels.ChannelsZigZag._M5.Draw_GDS(f_WhichMode, f_Is_Key, 0, FALSE, zzmul, zzg); //--deleteing
          Object_Pack.Channels.ChannelsZigZag._M1.Draw_GDS(f_WhichMode, f_Is_Key, 0, FALSE, zzmul, zzg); //--deleteing
          Object_Pack.Channels.ChannelsZigZag._Current.Draw_GDS(f_WhichMode, f_Is_Key, 0, FALSE, zzmul, zzg); //--deleteing
          Key_Type_Waves =  f_Is_Key ? E_Create : E_Exit;
          return true;
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
