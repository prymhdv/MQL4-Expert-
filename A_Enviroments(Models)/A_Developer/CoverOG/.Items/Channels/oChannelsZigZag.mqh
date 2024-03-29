//+------------------------------------------------------------------+
//||   ||||||||||             Graphical_Item_Solid.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Lines\oLines.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Elliots\oElliotsWave3.mqh>                //C_ElliotWave3                 ElliotWave3;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Elliots\oElliotsWave5.mqh>                //C_ElliotWave5                 ElliotWave5;
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                  ElliotWave3.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//--
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Custom_ZigZag.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Lines\oLines.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Shapes\oShapes.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\oTexts.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoveriOC\.CoveriOC.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\Item_Structs\S_ElliotsWave3.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// C_Objects             C_ElliotsWave3::OBJ;
class C_ChannelsZigZag_Base: public __COBFA__<S_ElliotsWave3>
{         //===================================================================
private:
          string                 m_name;
          int                    m_index;
          int                    ShiftTime_Z, ShiftTime_wave_H;
          ENUM_TIMEFRAMES        Frame;
          color                   LineColorUp, LineColorDown, LineColorMiddleUp, LineColorMiddleDown;
          //===================================================================
public:
          void C_ChannelsZigZag_Base(ENUM_TIMEFRAMES f, color colors)
          {         Frame = f;
                    LineColorUp = LineColorDown = LineColorMiddleUp = LineColorMiddleDown = colors;
                    Is_InSide_Middle_Channel_Floor_Ceil_Bar0 = E_Void;
                    ShiftTime_wave_H = 80; ShiftTime_Z = 100;
                    Current_BreakOut_Up_Shift__Counter = -1;
                    Current_BreakOut_Down_Shift__Counter = -1;
                    Current_BreakOut_Side_Shift__Counter = -1; //
          };
          void                    C_ChannelsZigZag_Base() { Is_InSide_Middle_Channel_Floor_Ceil_Bar0 = E_Void; ShiftTime_wave_H = 80; ShiftTime_Z = 100; Current_BreakOut_Up_Shift__Counter = -1; Current_BreakOut_Down_Shift__Counter = -1; Current_BreakOut_Side_Shift__Counter = -1;};
          void                   ~C_ChannelsZigZag_Base() { Is_InSide_Middle_Channel_Floor_Ceil_Bar0 = E_Void;};


          S_ElliotsWave3         GAC;
          S_ElliotsWave3         GDS;

          //Cgs_DevObjectPack     Object_Pack_ElliotsWave3;
          //***********************************************
          C_Lines                C_Lines_ElliotsWave3_Wave1,  C_Lines_ElliotsWave3_Wave2,   C_Lines_ElliotsWave3_Wave3,   C_Lines_ElliotsWave3_Wave4,   C_Lines_ElliotsWave3_Wave5,
                                 C_Lines_ElliotsWave3_Wave_Middle_Up,           C_Lines_ElliotsWave3_Wave_Middle_Down,
                                 C_Lines_ElliotsWave3_Wave_Middle_Middle_Up,    C_Lines_ElliotsWave3_Wave_Middle_Middle_Down,
                                 C_Lines_ElliotsWave3_Wave5_High_Channel,       C_Lines_ElliotsWave3_Wave5_Low_Channel,                 C_Lines_ElliotsWave3_Wave5_High_Channel_R,      C_Lines_ElliotsWave3_Wave5_High_Channel_S,
                                 C_Lines_ElliotsWave3_Wave5_Bar0,               C_Lines_ElliotsWave3_Wave5_Bar0_High_Channel,           C_Lines_ElliotsWave3_Wave5_Bar0_Low_Channel
                                 ;
          C_Lines                C_Lines_Lowest_v_Close0, C_Lines_Highest_v_Close0;

          Cg_Texts               Cg_Texts_ElliotsWave_Shows;

          C_Shapes               C_Shapes_ElliotsWave_Shows;

          Sg_Wave_                 Middle_Up, Middle_Down, Middle_Middle_Up, Middle_Middle_Down;
          //***********************************************
          bool                  Is_Bulish_All_Middle, Is_Bulish_TL_2_4__TL_1_3, Is_Bearish_TL_2_4__TL_1_3, Is_Side_TL_2_4__TL_1_3;

          bool                  Is_Bulish_TL_2_4, Is_Bulish_TL_1_3, Is_Bulish_TL_3_5;
          bool                  Is_TL_2_4__Above_TL_1_3, Is_TL_3_5__Above_TL_2_4;
          //
          bool                  Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_2_4;
          bool                  Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_2_4;
          //
          bool                  Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_1_3;
          bool                  Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_1_3;
          //
          bool                  Is_Keep_Up_TL_2_4_TL_1_3, Is_Keep_Down_TL_2_4_TL_1_3, Is_Keep_Side_TL_2_4_TL_1_3;         //  4>2 && 3>1    ---   4<2 && 3<1  trend up  trend down,, trend side
          E_Trend_Keep            Current_Trend_Keep_TL_2_4_TL_1_3;
          E_Direction           Current_Direction_TL_2_4_TL_1_3;
          bool                  Is_Current_Direction_TL_2_4_TL_1_3_UpWard, Is_Current_Direction_TL_2_4_TL_1_3_DownWard, Is_Current_Direction_TL_2_4_TL_1_3_Side;
          E_BreakOut_Type       Current_BreakOut_Type;
          int                   Current_BreakOut_Up_Shift, Current_BreakOut_Down_Shift, Current_BreakOut_Side_Shift, Current_BreakOut_Up_Shift__Counter, Current_BreakOut_Down_Shift__Counter, Current_BreakOut_Side_Shift__Counter; //--outer var
          //---
          bool                  Is_BreakOut_Up, Is_BreakOut_Down, Is_BreakOut_Void;
          //
          bool                  Is_TrendUp_Forwarding_Correcting;
          bool                  Is_TrendDown_Forwarding_Correcting;
          bool                  Is_TrendUp_Forwarding;
          //***********************************************
          Sg_Point_              Extermum_Bar_1_3, Extermum_Bar_2_4, Extermum_Bar_3_5;
          //***********************************************
          bool                  Is_Mid_Up_Below_Ask;//   =  Price_TL_Mid_Up_0   < Ask;
          bool                  Is_Mid_Down_Above_Ask;// =  Price_TL_Mid_Down_0 > Ask;
          //***********************************************
          int        With;
          void       Draw_GDS(int WhichMode, bool IsKey, int w, bool Is_Delete, int zzMul, int zzg);
          void       Draw_TLs__calc_extemum__1_3__2_4(int WhichMode, bool IsKey, bool Is_Delete);
          void       Draw_wave_lines(int WhichMode, bool IsKey, bool Is_Delete);
          void       Draw_Wave_Labels(int WhichMode, bool IsKey, bool Is_Delete);
          void       Update_Waves_Desc();
          //
          void       Draw_wave_M_lines(int WhichMode, bool IsKey, bool Is_Delete);
          void       Draw_wave_M_lines_Channel(int WhichMode, bool IsKey, bool Is_Delete);
          void       Draw_wave_M_lines_Channel_Buffer(int WhichMode, bool IsKey, bool Is_Delete);
          //
          Sg_Point_            Middle_Channel_Ceil_Bar0,       Middle_Channel_Floor_Bar0;
          bool                  Is_OutSide_Middle_Channel_Ceil_Bar0, Is_OutSide_Middle_Channel_Floor_Bar0 ;
          E_Key3                Is_InSide_Middle_Channel_Floor_Ceil_Bar0;
          E_Place_Thirden       Place_Thirden;
          E_Place_Ninth         Place_Ninth;

          bool                  Is_Place_Thirden__E_Lower                ;//= ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Thirden      == E_Place_Thirden_Lower;
          bool                  Is_Place_Thirden__E_Middle               ;//= ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Thirden      == E_Place_Thirden_Middle;
          bool                  Is_Place_Thirden__E_Upper                ;//= ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Thirden      == E_Place_Thirden_Upper;
          //
          bool                  Is_Place_Ninth__E_Lower_Lower          ;//= ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth      == E_Place_Ninth_Lower_Lower;
          bool                  Is_Place_Ninth__E_Lower_Middle         ;//= ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth      == E_Place_Ninth_Lower_Middle;
          bool                  Is_Place_Ninth__E_Lower_Upper          ;//= ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth      == E_Place_Ninth_Lower_Upper;
          bool                  Is_Place_Ninth__E_Middle_Lower         ;//= ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth      == E_Place_Ninth_Middle_Lower;
          bool                  Is_Place_Ninth__E_Middle_Middle        ;//= ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth      == E_Place_Ninth_Middle_Middle;
          bool                  Is_Place_Ninth__E_Middle_Upper         ;//= ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth      == E_Place_Ninth_Middle_Upper;
          bool                  Is_Place_Ninth__E_Upper_Lower          ;//= ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth      == E_Place_Ninth_Upper_Lower;
          bool                  Is_Place_Ninth__E_Upper_Middle         ;//= ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth      == E_Place_Ninth_Upper_Middle;
          bool                  Is_Place_Ninth__E_Upper_Upper          ;//= ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth      == E_Place_Ninth_Upper_Upper;

          void       Draw_wave_M_lines_Channel_Calc(int WhichMode, bool IsKey, bool Is_Delete);
          //
          void       Draw_wave_H_lines(int WhichMode, bool IsKey, bool Is_Delete);
          void       Draw_wave_H_Labels(int WhichMode, bool IsKey, bool Is_Delete);
          void       Update_Waves_H_Desc();

          Sg_Wave_   Wave5_channel_High, Wave5_channel_Low, WaveX;
          void       Draw_Wave5_Channels(int WhichMode, bool IsKey, bool Is_Delete);

          Sg_Wave_   Wave5_Bar0_channel_High, Wave5_Bar0_channel_Low;
          void       Draw_Wave5_Bar0_Channels(int WhichMode, bool IsKey, bool Is_Delete);
          //

          //===================================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Draw_GDS(int WhichMode, bool IsKey, int w,  bool Is_Delete, int zzMul, int zzg)
{         //------------------
          With = w; //Print("Frame: ",Frame);
          if(!ct_Drive.TDD.ct_Configs.IsShow_Channel_Shapes&&Initer.IsBasic_Done) {IsKey = false;}
          //------------------
          //---Find_Waves
          //if(IsKey)
          GDS.Find_Waves(Frame, zzMul, zzg,IsKey); //get data
          //------------------------
          if(1)
          {         Draw_wave_lines(WhichMode, IsKey, Is_Delete);//
          }
          if(IsKey)GDS.Wave1.Calc_Diffs(Frame);
          if(IsKey)GDS.Wave2.Calc_Diffs(Frame);
          if(IsKey)GDS.Wave3.Calc_Diffs(Frame);
          if(IsKey)GDS.Wave4.Calc_Diffs(Frame);
          if(IsKey)GDS.Wave5.Calc_Diffs(Frame);
          if(false) {Draw_Wave_Labels(WhichMode, IsKey, Is_Delete);}
          //
          if(false) {Draw_wave_M_lines(WhichMode, IsKey, Is_Delete);}
          //-----------------------------------------------------------
          if(1)Draw_wave_M_lines_Channel(WhichMode, IsKey, Is_Delete);
          //-----------------------------------------------------------
          if(false) {Draw_wave_M_lines_Channel_Buffer(WhichMode, IsKey, Is_Delete);}
          //-----------------------------------------------------------
          Draw_wave_M_lines_Channel_Calc(WhichMode, IsKey, Is_Delete);//ninth
          //---lable the channnels ninth
          {}
          //-----------------------------------------------------------
          if(false)
          {         Draw_wave_H_lines(WhichMode, IsKey, Is_Delete);
                    Draw_wave_H_Labels(WhichMode, IsKey, Is_Delete);
                    if(IsKey)Update_Waves_H_Desc(); //
          }
          //**********
          //--off--Draw_Wave5_Channels(WhichMode, IsKey, Is_Delete);
          if(false)
          {         Draw_Wave5_Bar0_Channels(WhichMode, IsKey, Is_Delete);//
          }
          //--If Is ellot standard Crate text to show..not label
          if(GDS.Is_Ellot_Standard)
          {         Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_ § Is_Ellot_Standard",  EnumToString(Frame) + "_ § Is_Ellot_Standard", GDS.Wave1.A._Time, GDS.Wave1.A._Price, clrYellow, "Arial", 12, ANCHOR_RIGHT, 0, Is_Delete); } //
          //***********************
          //depended wave
          if(IsKey) //--deleting obj make all condition false
          {         //Cheack is Uptend forwarding..
                    Is_TrendUp_Forwarding                                       = (GDS.Wave5.Z._Price > GDS.Wave5.A._Price) && (GDS.Wave3.Z._Price > GDS.Wave3.A._Price);
                    Is_TrendUp_Forwarding_Correcting                            = (GDS.Wave2.A._Price > GDS.Wave2.Z._Price) && (GDS.Wave4.Z._Price > GDS.Wave2.Z._Price);
                    Is_TrendDown_Forwarding_Correcting                          = (GDS.Wave2.A._Price < GDS.Wave2.Z._Price) && (GDS.Wave4.Z._Price < GDS.Wave2.Z._Price);
                    Is_Bulish_TL_2_4                                            = (GDS.Wave4.Z._Price > GDS.Wave2.Z._Price);
                    Is_Bulish_TL_1_3                                            = (GDS.Wave3.Z._Price > GDS.Wave1.Z._Price);
                    Is_Bulish_TL_3_5                                            = (GDS.Wave5.Z._Price > GDS.Wave3.Z._Price);
                    Is_TL_2_4__Above_TL_1_3                                     = (GDS.Wave2.Z._Price > GDS.Wave1.Z._Price) &&  (GDS.Wave4.Z._Price > GDS.Wave3.Z._Price);
                    Is_TL_3_5__Above_TL_2_4                                     = (GDS.Wave3.Z._Price > GDS.Wave2.Z._Price) &&  (GDS.Wave5.Z._Price > GDS.Wave4.Z._Price);
                    Is_Bulish_All_Middle                                        = (GDS.Wave0_1_4_5_Middle.A._Price < GDS.Wave0_1_4_5_Middle.Z._Price);
                    Is_Keep_Up_TL_2_4_TL_1_3   = Is_Bulish_TL_2_4__TL_1_3       = (Is_Bulish_TL_2_4)  &&  (Is_Bulish_TL_1_3);  //  4>2 && 3>1    ---
                    Is_Keep_Down_TL_2_4_TL_1_3 = Is_Bearish_TL_2_4__TL_1_3      = (!Is_Bulish_TL_2_4) && (!Is_Bulish_TL_1_3);   //                ---   4<2 && 3<1
                    Is_Keep_Side_TL_2_4_TL_1_3 = Is_Side_TL_2_4__TL_1_3         = (!Is_Bulish_TL_2_4 && Is_Bulish_TL_1_3) || (Is_Bulish_TL_2_4 && !Is_Bulish_TL_1_3);
                    //Alert("Is_Bulish_All_Middle: ", Is_Bulish_All_Middle);   TL_2_4_TL_1_3
                    {         if(Is_Keep_Up_TL_2_4_TL_1_3)            {Current_Trend_Keep_TL_2_4_TL_1_3 = E_Keep_Up;}
                              else if(Is_Keep_Down_TL_2_4_TL_1_3)     {Current_Trend_Keep_TL_2_4_TL_1_3 = E_Keep_Down;}
                              else if(Is_Keep_Side_TL_2_4_TL_1_3)     {Current_Trend_Keep_TL_2_4_TL_1_3 = E_Keep_Side;}
                              //
                    }//
          }
          //---need Is_Bulish_TL_2_4 ||  Is_Bulish_TL_1_3
          if(false)
          {         Draw_TLs__calc_extemum__1_3__2_4(WhichMode, IsKey, Is_Delete);}
          //***********************
          //---need Trend_1_3 ||  Trend_2_4
          if(IsKey) //--deleting obj make all condition false
          {         double Price_TL_1_3_0       = ObjectGetValueByShift( EnumToString(Frame) + "_Trend_1_3", 0);// Alert("Trend_1_3  ",        (string)Price_TL_1_3_0  ); frist call error
                    double Price_TL_2_4_0       = ObjectGetValueByShift( EnumToString(Frame) + "_Trend_2_4", 0);// Alert("Trend_2_4  ",        (string)Price_TL_2_4_0  );
                    double Price_TL_Mid_Up_0    = ObjectGetValueByShift( EnumToString(Frame) + "_Wavemiddle w1w5-Channel-Up", 0);// Alert("Trend_1_3  ",        (string)Price_TL_1_3_0  ); frist call error
                    double Price_TL_Mid_Down_0  = ObjectGetValueByShift( EnumToString(Frame) + "_Wavemiddle w1w5-Channel-Down", 0);// Alert("Trend_2_4  ",        (string)Price_TL_2_4_0  );
                    //
                    double Price_TL_1_3_Happend       = GDS.Wave3.Z._Shift;
                    double Price_TL_2_4_Happend       = GDS.Wave4.Z._Shift;
                    double Price_TL_Mid_Up_Happend    = ObjectGetShiftByValue( EnumToString(Frame) + "_Wavemiddle w1w5-Channel-Up", 0);// Alert("Trend_1_3  ",        (string)Price_TL_1_3_0  ); frist call error
                    double Price_TL_Mid_Down_Happend  = ObjectGetShiftByValue( EnumToString(Frame) + "_Wavemiddle w1w5-Channel-Down", 0);// Alert("Trend_2_4  ",        (string)Price_TL_2_4_0  );
                    //
                    //Cheack is Waves Cross
                    Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_1_3 = (!Is_TL_2_4__Above_TL_1_3 && (Ask > Price_TL_1_3_0)) ? true : false;
                    //Current_Direction_TL_2_4_TL_1_3                                   = Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_1_3 ? E_Direction_UpWard : E_Direction_DownWard;
                    //Alert("Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_1_3: ", Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_1_3);
                    Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_1_3   = (Is_TL_2_4__Above_TL_1_3  && (Ask < Price_TL_1_3_0)) ? true : false;
                    //Current_Direction_TL_2_4_TL_1_3                                   = Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_1_3 ? E_Direction_UpWard : E_Direction_DownWard;
                    //Alert("Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_1_3: ", Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_1_3);
                    //
                    Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_2_4   = (Is_TL_2_4__Above_TL_1_3  && (Ask > Price_TL_2_4_0)) ? true : false;
                    //Current_Direction_TL_2_4_TL_1_3                                   = Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_1_3 ? E_Direction_UpWard : E_Direction_DownWard;
                    //Alert("Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_2_4: ", Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_2_4);
                    Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_2_4 = (!Is_TL_2_4__Above_TL_1_3 && (Ask < Price_TL_2_4_0)) ? true : false;
                    //Current_Direction_TL_2_4_TL_1_3                                   = Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_1_3 ? E_Direction_UpWard : E_Direction_DownWard;
                    //Alert("Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_2_4: ", Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_2_4);
                    //
                    Is_Mid_Up_Below_Ask   =  Price_TL_Mid_Up_0   < Ask;
                    Is_Mid_Down_Above_Ask =  Price_TL_Mid_Down_0 > Ask;
                    //
                    /**************************************************************************************************************************************
                    double n1, n2, n3, n4;
                    n1  = Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_1_3;
                    n2  = Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_1_3;
                    n3  = Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_2_4;
                    n4  = Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_2_4;
                    //***********************
                    if(n1 && !n2 && !n3 && !n4)    { Current_Direction_TL_2_4_TL_1_3 = 0;} //   the solid deciion of just one condition
                    if(n2 && !n1 && !n3 && !n4)    { Current_Direction_TL_2_4_TL_1_3 = 0;} //
                    if(n3 && !n1 && !n2 && !n4)    { Current_Direction_TL_2_4_TL_1_3 = 0;} //
                    if(n4 && !n1 && !n2 && !n3)    { Current_Direction_TL_2_4_TL_1_3 = 0;} //
                    ****************************************************************************************************************************************/
                    double n1, n2, n3, n4;
                    n1  = Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_1_3;
                    n2  = Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_1_3;
                    n3  = Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_2_4;
                    n4  = Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_2_4;
                    //***********************
                    if(n1 && !n2 && !n3 && !n4)         { Current_Direction_TL_2_4_TL_1_3 = E_Direction_UpWard;    } //  Alert("Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_1_3  ",        (string)Price_TL_1_3_0  );} //   the solid deciion of just one condition
                    else if(n2 && !n1 && !n3 && !n4)    { Current_Direction_TL_2_4_TL_1_3 = E_Direction_DownWard;  } //  Alert("Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_1_3  ",          (string)Price_TL_1_3_0  );} //
                    else if(n3 && !n1 && !n2 && !n4)    { Current_Direction_TL_2_4_TL_1_3 = E_Direction_UpWard;    } //  Alert("Is_TL_2_4__Above_TL_1_3_AND_Is_ASK_Above__TL_2_4  ",          (string)Price_TL_2_4_0  );} //
                    else if(n4 && !n1 && !n2 && !n3)    { Current_Direction_TL_2_4_TL_1_3 = E_Direction_DownWard;  } //  Alert("Isnt_TL_2_4__Above_TL_1_3_AND_Is_ASK_Below__TL_2_4  ",        (string)Price_TL_2_4_0  );} //
                    else                                { Current_Direction_TL_2_4_TL_1_3 = E_Direction_Side;}
                    //Alert("Current_Direction_TL_2_4_TL_1_3: ", EnumToString(Current_Direction_TL_2_4_TL_1_3), "     Is_Bulish_TL_2_4__TL_1_3: ", Is_Bulish_TL_2_4__TL_1_3, "     Is_Bearish_TL_2_4__TL_1_3: ", Is_Bearish_TL_2_4__TL_1_3, "     Is_Side_TL_2_4__TL_1_3: ", Is_Side_TL_2_4__TL_1_3); //
                    //Is_BreakOut_Up      = (Current_Trend_Keep_TL_2_4_TL_1_3 == E_Keep_Down)     &&      (Current_Direction_TL_2_4_TL_1_3 == E_Direction_UpWard)   ? true : false ;
                    //Is_BreakOut_Down    = (Current_Trend_Keep_TL_2_4_TL_1_3 == E_Keep_Up)       &&      (Current_Direction_TL_2_4_TL_1_3 == E_Direction_DownWard) ? true : false ; ///----- Is_BreakOut_Side enum
                    Is_Current_Direction_TL_2_4_TL_1_3_UpWard = Is_Current_Direction_TL_2_4_TL_1_3_DownWard = Is_Current_Direction_TL_2_4_TL_1_3_Side = false;
                    if(Current_Direction_TL_2_4_TL_1_3       == E_Direction_UpWard)      { Is_Current_Direction_TL_2_4_TL_1_3_UpWard   = true; } //
                    else if (Current_Direction_TL_2_4_TL_1_3 == E_Direction_DownWard)    { Is_Current_Direction_TL_2_4_TL_1_3_DownWard = true; } //
                    else if (Current_Direction_TL_2_4_TL_1_3 == E_Direction_Side)        { Is_Current_Direction_TL_2_4_TL_1_3_Side     = true; } //
                    //
          }
          if(IsKey) //--deleting obj make all condition false
          {         //---Current_BreakOut_Shift = -1;;
                    Is_BreakOut_Up   = (((Current_Trend_Keep_TL_2_4_TL_1_3 == E_Keep_Down) || (Current_Trend_Keep_TL_2_4_TL_1_3 == E_Keep_Side)) && (Current_Direction_TL_2_4_TL_1_3 == E_Direction_UpWard))   ;//--|| Is_Mid_Up_Below_Ask
                    Is_BreakOut_Down = (((Current_Trend_Keep_TL_2_4_TL_1_3 == E_Keep_Up)   || (Current_Trend_Keep_TL_2_4_TL_1_3 == E_Keep_Side)) && (Current_Direction_TL_2_4_TL_1_3 == E_Direction_DownWard)) ;//--|| Is_Mid_Down_Above_Ask;
                    Is_BreakOut_Void = Current_Direction_TL_2_4_TL_1_3 == E_Direction_Side;
                    //
                    if      (Is_BreakOut_Up)
                    {         Current_BreakOut_Type = E_BreakOut_Up;    /*Current_BreakOut_Up_Shift   =  iBarShift(NULL, PERIOD_CURRENT, Time[0]);*/       Current_BreakOut_Up_Shift__Counter++    ;  Current_BreakOut_Down_Shift__Counter = -1;   Current_BreakOut_Side_Shift__Counter = -1;
                              //---Current_BreakOut_Up_Shift    = Is_TL_2_4__Above_TL_1_3 ? GDS.Wave4.Z._Shift : GDS.Wave3.Z._Shift; //
                              Current_BreakOut_Side_Shift = -1;
                              Current_BreakOut_Up_Shift   = -1;
                              Current_BreakOut_Down_Shift = -1; //
                    }
                    else if (Is_BreakOut_Down)
                    {         Current_BreakOut_Type = E_BreakOut_Down;  /*Current_BreakOut_Down_Shift =  iBarShift(NULL, PERIOD_CURRENT, Time[0]);*/       Current_BreakOut_Down_Shift__Counter++  ;  Current_BreakOut_Up_Shift__Counter   = -1;   Current_BreakOut_Side_Shift__Counter = -1;
                              //---Current_BreakOut_Down_Shift  = Is_TL_2_4__Above_TL_1_3 ? GDS.Wave3.Z._Shift : GDS.Wave4.Z._Shift; //
                              Current_BreakOut_Side_Shift = -1;
                              Current_BreakOut_Up_Shift   = -1;
                              Current_BreakOut_Down_Shift = -1; //
                    }
                    else if (Is_BreakOut_Void)
                    {         Current_BreakOut_Type = E_BreakOut_Void;  /*Current_BreakOut_Side_Shift =  iBarShift(NULL, PERIOD_CURRENT, Time[0]);*/        Current_BreakOut_Side_Shift__Counter++  ;  Current_BreakOut_Down_Shift__Counter = -1;   Current_BreakOut_Up_Shift__Counter   = -1;
                              Current_BreakOut_Side_Shift = GDS.Wave1.Z._Shift;  //Alert("Current_BreakOut_Side_Shift: ", Current_BreakOut_Side_Shift); //
                              Current_BreakOut_Up_Shift   = -1;
                              Current_BreakOut_Down_Shift = -1; //
                    } //
                    //
                    if (Is_TL_2_4__Above_TL_1_3)
                    {         if(Current_BreakOut_Type == E_BreakOut_Up)
                              {         for(int i = GDS.Wave4.Z._Shift; i >= 0; i--)
                                        {         if(iClose(NULL, Frame, i) > ObjectGetValueByShift( EnumToString(Frame) + "_Trend_2_4", i)) {Current_BreakOut_Up_Shift = i; /*Alert("Current_BreakOut_Up_Shift:", Current_BreakOut_Up_Shift); */              break;} //
                                        } //
                              }//
                              if(Current_BreakOut_Type == E_BreakOut_Down)
                              {         for(int i = GDS.Wave4.Z._Shift; i >= 0; i--)
                                        {         if(iClose(NULL, Frame, i) < ObjectGetValueByShift( EnumToString(Frame) + "_Trend_1_3", i)) {Current_BreakOut_Down_Shift = i; /*Alert("Current_BreakOut_Up_Shift:", Current_BreakOut_Up_Shift);*/ break;} //
                                        } //
                              }//
                    }//
                    else
                    {         if(Current_BreakOut_Type == E_BreakOut_Up)
                              {         for(int i = GDS.Wave4.Z._Shift; i >= 0; i--)
                                        {         if(iClose(NULL, Frame, i) > ObjectGetValueByShift( EnumToString(Frame) + "_Trend_1_3", i)) {Current_BreakOut_Up_Shift = i; /*Alert("Current_BreakOut_Up_Shift:", Current_BreakOut_Up_Shift); */break;} //
                                        }  //
                              }//
                              if(Current_BreakOut_Type == E_BreakOut_Down)
                              {         //
                                        for(int i = GDS.Wave4.Z._Shift; i >= 0; i--)
                                        {         if(iClose(NULL, Frame, i) < ObjectGetValueByShift( EnumToString(Frame) + "_Trend_2_4", i)) {Current_BreakOut_Down_Shift = i; /*Alert("Current_BreakOut_Up_Shift:", Current_BreakOut_Up_Shift);*/ break;} //
                                        }  //
                              }//
                    }//
                    //*************************************************************
          }
          //***********************
          if(IsKey)Update_Waves_Desc();
          //******************************************************
          if(!ct_Drive.TDD.ct_Configs.IsShow_Channel_Shapes&&Initer.IsBasic_Done) {ObjectsDeleteAll(0, PrefixCZZ);}
          //------------------------------------------------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Draw_wave_lines(int WhichMode, bool IsKey, bool Is_Delete)
{         //---Draw wave lines
          C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave1", "", GDS.Wave1.A._Time, GDS.Wave1.A._Price, GDS.Wave1.Z._Time, GDS.Wave1.Z._Price, clrYellow, 2, false, STYLE_DASH, Is_Delete);
          C_Lines_ElliotsWave3_Wave2.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave2", "", GDS.Wave2.A._Time, GDS.Wave2.A._Price, GDS.Wave2.Z._Time, GDS.Wave2.Z._Price, clrYellow, 2, false, STYLE_DASH, Is_Delete);
          C_Lines_ElliotsWave3_Wave3.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave3", "", GDS.Wave3.A._Time, GDS.Wave3.A._Price, GDS.Wave3.Z._Time, GDS.Wave3.Z._Price, clrYellow, 2, false, STYLE_DASH, Is_Delete);
          C_Lines_ElliotsWave3_Wave4.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave4", "", GDS.Wave4.A._Time, GDS.Wave4.A._Price, GDS.Wave4.Z._Time, GDS.Wave4.Z._Price, clrYellow, 2, false, STYLE_DASH, Is_Delete);
          C_Lines_ElliotsWave3_Wave5.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave5", "", GDS.Wave5.A._Time, GDS.Wave5.A._Price, GDS.Wave5.Z._Time, GDS.Wave5.Z._Price, clrYellow, 2, false, STYLE_DASH, Is_Delete);
          //
          //Alert("GDS.Wave1.A._Time: ", GDS.Wave1.A._Time, "   GDS.Wave1.Z._Price: ", GDS.Wave1.Z._Price, "   GDS.Wave2.Z._Time: ", GDS.Wave2.Z._Time, "   GDS.Wave2.Z._Price: ", GDS.Wave2.Z._Price);
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Draw_wave_M_lines(int WhichMode, bool IsKey, bool Is_Delete)
{         //
          GDS.Wave0_1_4_5_Middle.Dev_Math.Slope  = GDS.Wave0_1_4_5_Middle.Dev_Math.calcSlope(GDS.Wave0_1_4_5_Middle.A._Price, GDS.Wave0_1_4_5_Middle.Z._Price, GDS.Wave0_1_4_5_Middle.A._Time, GDS.Wave0_1_4_5_Middle.Z._Time);
          GDS.Wave0_1_4_5_Middle.Dev_Math.Diff_B = GDS.Wave0_1_4_5_Middle.Dev_Math.GetB_LineFormule(GDS.Wave0_1_4_5_Middle.Dev_Math.Slope, GDS.Wave0_1_4_5_Middle.A._Time, GDS.Wave0_1_4_5_Middle.A._Price);
          GDS.Wave0_1_4_5_Middle.Dev_Math.Diff_X = GDS.Wave0_1_4_5_Middle.S._Time = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * ShiftTime_Z;
          GDS.Wave0_1_4_5_Middle.Dev_Math.Diff_Y = GDS.Wave0_1_4_5_Middle.S._Price = GDS.Wave0_1_4_5_Middle.Dev_Math.GetY_LineFormule(GDS.Wave0_1_4_5_Middle.Dev_Math.Slope, GDS.Wave0_1_4_5_Middle.Dev_Math.Diff_X, GDS.Wave0_1_4_5_Middle.Dev_Math.Diff_B);
          C_Lines_ElliotsWave3_Wave5.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave-middle w1w5", "", GDS.Wave0_1_4_5_Middle.A._Time, GDS.Wave0_1_4_5_Middle.A._Price, GDS.Wave0_1_4_5_Middle.Dev_Math.Diff_X, GDS.Wave0_1_4_5_Middle.Dev_Math.Diff_Y, clrYellowGreen, 1, false, STYLE_DASH, Is_Delete);
          //
          //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Draw_wave_M_lines_Channel(int WhichMode, bool IsKey, bool Is_Delete)
{         //--Channelise line Up
          //----------------------
          ObjectDelete(EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up");                        ObjectDelete(EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up1");
          ObjectDelete(EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down");                      ObjectDelete(EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down1");
          ObjectDelete(EnumToString(Frame) + "_TL.Wave-Middle_Middle_Up w1w5-Channel-Middle_Up");       ObjectDelete(EnumToString(Frame) + "_TL.Wave-Middle_Middle_Up w1w5-Channel-Middle_Up1");
          ObjectDelete(EnumToString(Frame) + "_TL.Wave-Mid_Mid_Down w1w5-Channel-Middle_Down");         ObjectDelete(EnumToString(Frame) + "_TL.Wave-Mid_Mid_Down w1w5-Channel-Middle_Down1");
          //----------------------
          {         // Finde Extermium info
                    int _iLowest_Bar  = iLowest( NULL, Frame, MODE_LOW,  GDS.Wave0_1_4_5_Middle.A._Shift - GDS.Wave0_1_4_5_Middle.Z._Shift, GDS.Wave0_1_4_5_Middle.Z._Shift);
                    int _iHighest_Bar = iHighest(NULL, Frame, MODE_HIGH, GDS.Wave0_1_4_5_Middle.A._Shift - GDS.Wave0_1_4_5_Middle.Z._Shift, GDS.Wave0_1_4_5_Middle.Z._Shift);
                    //--correction
                    if(true)
                    {         int Extermum_last_shift    = GDS.Wave0_1_4_5_Middle.Is_Bulish ?  GDS.Point_Highest._Shift : GDS.Point_Lowest._Shift;
                              _iLowest_Bar               = iLowest( NULL, Frame, MODE_LOW,   GDS.Point_Lowest._Shift + 1,  GDS.Wave1.A._Shift);
                              _iHighest_Bar              = iHighest(NULL, Frame, MODE_HIGH,  GDS.Point_Highest._Shift + 1, GDS.Wave1.A._Shift); //
                    }
                    //
                    Sg_Point_ Extermum_Bar; //--_iHighest_Bar_High
                    Extermum_Bar._Shift                  = !GDS.Wave0_1_4_5_Middle.Is_Bulish                            ? _iHighest_Bar  : _iLowest_Bar; //???
                    Extermum_Bar._Shift                  = _iHighest_Bar ; //???  its up channel
                    //---Alert("Extermum_Bar_1_3._Shift: ", Extermum_Bar_1_3._Shift); //
                    double _iLowest_Bar_Low              = iLow(NULL, Frame, Extermum_Bar._Shift) ;
                    double _iHighest_Bar_High            = iHigh(NULL, Frame, Extermum_Bar._Shift);
                    //_iHighest_Bar_High
                    Extermum_Bar._Price                  = !GDS.Wave0_1_4_5_Middle.Is_Bulish                            ? _iHighest_Bar_High   : _iLowest_Bar_Low; //
                    Extermum_Bar._Price                  = _iHighest_Bar_High ; //
                    Extermum_Bar._Time                   = iTime(NULL, Frame, Extermum_Bar._Shift);
                    //
                    //--Find Slope of trend line calc p1  and p2
                    Middle_Up.Dev_Math.Slope             = Middle_Up.Dev_Math.calcSlope(GDS.Wave0_1_4_5_Middle.A._Price, GDS.Wave0_1_4_5_Middle.Z._Price, GDS.Wave0_1_4_5_Middle.A._Time, GDS.Wave0_1_4_5_Middle.Z._Time);//--- Alert("GDS.Wave0_1_4_5_Middle.Z._Price: ", GDS.Wave0_1_4_5_Middle.Z._Price);
                    Middle_Up.Dev_Math.Diff_B            = Middle_Up.Dev_Math.GetB_LineFormule(Middle_Up.Dev_Math.Slope, Extermum_Bar._Time, Extermum_Bar._Price);
                    Middle_Up.Z._Time                    = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * ShiftTime_Z;
                    Middle_Up.Z._Price                   = Middle_Up.Dev_Math.GetY_LineFormule(Middle_Up.Dev_Math.Slope, Middle_Up.Z._Time, Middle_Up.Dev_Math.Diff_B);
                    //----
                    Middle_Up.A._Time                    = GDS.Wave1.A._Time - PeriodSeconds(Frame) * 60; //GDS.Wave0_1_4_5_Middle.A._Time;
                    Middle_Up.A._Price                   = Middle_Up.Dev_Math.GetY_LineFormule(Middle_Up.Dev_Math.Slope, Middle_Up.A._Time, Middle_Up.Dev_Math.Diff_B);
                    //----
                    Middle_Up.S._Shift                   = 0; //GDS.Wave0_1_4_5_Middle.A._Time;
                    Middle_Up.S._Time                    = iTime(Symbol(), Frame, 0); //GDS.Wave0_1_4_5_Middle.A._Time;
                    Middle_Up.S._Price                   = Middle_Up.Dev_Math.GetY_LineFormule(Middle_Up.Dev_Math.Slope, Middle_Up.S._Time, Middle_Up.Dev_Math.Diff_B);
                    //
                    //---    Alert(" Up Middle_Up.A._Time: ",  Middle_Up.A._Time);        Alert(" Up Middle_Up.A._Price: ", Middle_Up.A._Price);    Alert(" Up Middle_Up.Z._Time: ",  Middle_Up.Z._Time);     Alert(" Up Middle_Up.Z._Price: ", Middle_Up.Z._Price);
                    C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", "", Middle_Up.A._Time, Middle_Up.A._Price, Middle_Up.Z._Time, Middle_Up.Z._Price, LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                    C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up1", "", Middle_Up.A._Time, Middle_Up.A._Price + 10 * Point(), Middle_Up.Z._Time, Middle_Up.Z._Price + 10 * Point(), LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                    {         //--formul for broken 3
                              if(true)
                              {         int Shift_Break = -1;
                                        int Extermum_bars_Up[3] = {0, 0, 0 };
                                        if(true)
                                        {         if(GDS.Wave1.Is_Bulish)
                                                  {         int Extermum_bars_Up_temp[3];// = {GDS.Wave1.Z._Shift, GDS.Wave3.Z._Shift, GDS.Wave5.Z._Shift }; //
                                                            Extermum_bars_Up_temp[0] = GDS.Wave1.Z._Shift;
                                                            Extermum_bars_Up_temp[1] = GDS.Wave3.Z._Shift;
                                                            Extermum_bars_Up_temp[2] = GDS.Wave5.Z._Shift;
                                                            int Extermum_count = ArrayCopy(  Extermum_bars_Up, Extermum_bars_Up_temp); //
                                                  }
                                                  else
                                                  {         int Extermum_bars_Up_temp[3];// = {GDS.Wave1.A._Shift, GDS.Wave2.Z._Shift, GDS.Wave4.Z._Shift }; //
                                                            Extermum_bars_Up_temp[0] = GDS.Wave1.A._Shift;
                                                            Extermum_bars_Up_temp[1] = GDS.Wave2.Z._Shift;
                                                            Extermum_bars_Up_temp[2] = GDS.Wave4.Z._Shift;
                                                            int Extermum_count = ArrayCopy( Extermum_bars_Up, Extermum_bars_Up_temp ); //
                                                  } //
                                        } //
                                        //
                                        for(int i = 0  ; i <= 2  ; i++)  //---  for(int i = GDS.Wave1.A._Shift  ; i >= Extermum_Bar._Shift  ; i--)
                                        {         double Price_TL_WM       = ObjectGetValueByShift( EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up",  Extermum_bars_Up[i]);
                                                  if(Price_TL_WM < iHigh( NULL, Frame, Extermum_bars_Up[i]))
                                                  {         Shift_Break = Extermum_bars_Up[i] ; //
                                                            C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, false, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", "", Middle_Up.A._Time, Middle_Up.A._Price, Middle_Up.Z._Time, Middle_Up.Z._Price, LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                                                            C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, false, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up1", "", Middle_Up.A._Time, Middle_Up.A._Price + 10 * Point(), Middle_Up.Z._Time, Middle_Up.Z._Price + 10 * Point(), LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                                                            //-- Alert(" Up Shift_Break: ", Shift_Break);
                                                            break;//
                                                  } //
                                        } //
                                        if(Shift_Break > -1)
                                        {         Extermum_Bar._Shift                  = Shift_Break ; //???  its up channel
                                                  //---Alert("Extermum_Bar_1_3._Shift: ", Extermum_Bar_1_3._Shift); //
                                                  _iHighest_Bar_High                  = iHigh(NULL, Frame, Extermum_Bar._Shift);
                                                  //_iHighest_Bar_High
                                                  Extermum_Bar._Price                  = _iHighest_Bar_High ; //
                                                  Extermum_Bar._Time                   = iTime(NULL, Frame, Extermum_Bar._Shift);
                                                  //
                                                  //--Find Slope of trend line calc p1  and p2
                                                  Middle_Up.Dev_Math.Slope            = Middle_Up.Dev_Math.calcSlope(GDS.Wave0_1_4_5_Middle.A._Price, GDS.Wave0_1_4_5_Middle.Z._Price, GDS.Wave0_1_4_5_Middle.A._Time, GDS.Wave0_1_4_5_Middle.Z._Time);
                                                  Middle_Up.Dev_Math.Diff_B           = Middle_Up.Dev_Math.GetB_LineFormule(Middle_Up.Dev_Math.Slope, Extermum_Bar._Time, Extermum_Bar._Price);
                                                  Middle_Up.Z._Time                    = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * ShiftTime_Z;
                                                  Middle_Up.Z._Price                   = Middle_Up.Dev_Math.GetY_LineFormule(Middle_Up.Dev_Math.Slope, Middle_Up.Z._Time, Middle_Up.Dev_Math.Diff_B);
                                                  //----
                                                  Middle_Up.A._Time                    = GDS.Wave1.A._Time - PeriodSeconds(Frame) * 60; //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Up.A._Price                   = Middle_Up.Dev_Math.GetY_LineFormule(Middle_Up.Dev_Math.Slope, Middle_Up.A._Time, Middle_Up.Dev_Math.Diff_B);
                                                  //----
                                                  Middle_Up.S._Shift                   = 0; //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Up.S._Time                    = iTime(Symbol(), Frame, 0); //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Up.S._Price                   = Middle_Up.Dev_Math.GetY_LineFormule(Middle_Up.Dev_Math.Slope, Middle_Up.S._Time, Middle_Up.Dev_Math.Diff_B);
                                                  //
                                                  C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", "", Middle_Up.A._Time, Middle_Up.A._Price, Middle_Up.Z._Time, Middle_Up.Z._Price, LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                                                  C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up1", "", Middle_Up.A._Time, Middle_Up.A._Price + 10 * Point(), Middle_Up.Z._Time, Middle_Up.Z._Price + 10 * Point(), LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                                                  //
                                        }//
                              }//
                              //--formul for broken 2
                              if(true)
                              {         int Shift_Break = -1;
                                        int Extermum_bars_Up[2] = {0, 0 };
                                        if(true)
                                        {         if(GDS.Wave1.Is_Bulish)
                                                  {         int Extermum_bars_Up_temp[2];// = {GDS.Wave1.Z._Shift, GDS.Wave3.Z._Shift, GDS.Wave5.Z._Shift }; //
                                                            Extermum_bars_Up_temp[0] = GDS.Wave3.Z._Shift;
                                                            Extermum_bars_Up_temp[1] = GDS.Wave5.Z._Shift;
                                                            int Extermum_count = ArrayCopy(  Extermum_bars_Up, Extermum_bars_Up_temp); //
                                                  }
                                                  else
                                                  {         int Extermum_bars_Up_temp[2];// = {GDS.Wave1.A._Shift, GDS.Wave2.Z._Shift, GDS.Wave4.Z._Shift }; //
                                                            Extermum_bars_Up_temp[0] = GDS.Wave2.Z._Shift;
                                                            Extermum_bars_Up_temp[1] = GDS.Wave4.Z._Shift;
                                                            int Extermum_count = ArrayCopy(  Extermum_bars_Up, Extermum_bars_Up_temp); //
                                                  } //
                                        } //
                                        //
                                        for(int i = 0  ; i <= 1  ; i++)  //---  for(int i = GDS.Wave1.A._Shift  ; i >= Extermum_Bar._Shift  ; i--)
                                        {         double Price_TL_WM       = ObjectGetValueByShift( EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up",  Extermum_bars_Up[i]);
                                                  if(Price_TL_WM < iHigh( NULL, Frame, Extermum_bars_Up[i]))
                                                  {         Shift_Break = Extermum_bars_Up[i] ; //
                                                            C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, false, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", "", Middle_Up.A._Time, Middle_Up.A._Price, Middle_Up.Z._Time, Middle_Up.Z._Price, LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                                                            C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, false, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up1", "", Middle_Up.A._Time, Middle_Up.A._Price + 10 * Point(), Middle_Up.Z._Time, Middle_Up.Z._Price + 10 * Point(), LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                                                            //-- Alert(" Up Shift_Break: ", Shift_Break);
                                                            break;//
                                                  } //
                                        } //
                                        if(Shift_Break > -1)
                                        {         Extermum_Bar._Shift                  = Shift_Break ; //???  its up channel
                                                  //---Alert("Extermum_Bar_1_3._Shift: ", Extermum_Bar_1_3._Shift); //
                                                  _iHighest_Bar_High                  = iHigh(NULL, Frame, Extermum_Bar._Shift);
                                                  //_iHighest_Bar_High
                                                  Extermum_Bar._Price                  = _iHighest_Bar_High ; //
                                                  Extermum_Bar._Time                   = iTime(NULL, Frame, Extermum_Bar._Shift);
                                                  //
                                                  //--Find Slope of trend line calc p1  and p2
                                                  Middle_Up.Dev_Math.Slope            = Middle_Up.Dev_Math.calcSlope(GDS.Wave0_1_4_5_Middle.A._Price, GDS.Wave0_1_4_5_Middle.Z._Price, GDS.Wave0_1_4_5_Middle.A._Time, GDS.Wave0_1_4_5_Middle.Z._Time);
                                                  Middle_Up.Dev_Math.Diff_B           = Middle_Up.Dev_Math.GetB_LineFormule(Middle_Up.Dev_Math.Slope, Extermum_Bar._Time, Extermum_Bar._Price);
                                                  Middle_Up.Z._Time                    = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * ShiftTime_Z;
                                                  Middle_Up.Z._Price                   = Middle_Up.Dev_Math.GetY_LineFormule(Middle_Up.Dev_Math.Slope, Middle_Up.Z._Time, Middle_Up.Dev_Math.Diff_B);
                                                  //----
                                                  Middle_Up.A._Time                    = GDS.Wave1.A._Time - PeriodSeconds(Frame) * 60; //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Up.A._Price                   = Middle_Up.Dev_Math.GetY_LineFormule(Middle_Up.Dev_Math.Slope, Middle_Up.A._Time, Middle_Up.Dev_Math.Diff_B);
                                                  //----
                                                  Middle_Up.S._Shift                   = 0; //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Up.S._Time                    = iTime(Symbol(), Frame, 0); //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Up.S._Price                   = Middle_Up.Dev_Math.GetY_LineFormule(Middle_Up.Dev_Math.Slope, Middle_Up.S._Time, Middle_Up.Dev_Math.Diff_B);
                                                  //
                                                  C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", "", Middle_Up.A._Time, Middle_Up.A._Price, Middle_Up.Z._Time, Middle_Up.Z._Price, LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                                                  C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up1", "", Middle_Up.A._Time, Middle_Up.A._Price + 10 * Point(), Middle_Up.Z._Time, Middle_Up.Z._Price + 10 * Point(), LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                                                  //
                                        }//
                              }//
                              //--formul for broken 1
                              if(true)
                              {         int Shift_Break = -1;
                                        int Extermum_bars_Up[1] = {0 };
                                        if(true)
                                        {         if(GDS.Wave1.Is_Bulish)
                                                  {         int Extermum_bars_Up_temp[1];// = {GDS.Wave1.Z._Shift, GDS.Wave3.Z._Shift, GDS.Wave5.Z._Shift }; //
                                                            Extermum_bars_Up_temp[0] = GDS.Wave5.Z._Shift;
                                                            int Extermum_count = ArrayCopy(  Extermum_bars_Up, Extermum_bars_Up_temp); //
                                                  }
                                                  else
                                                  {         int Extermum_bars_Up_temp[1];// = {GDS.Wave1.A._Shift, GDS.Wave2.Z._Shift, GDS.Wave4.Z._Shift }; //
                                                            Extermum_bars_Up_temp[0] = GDS.Wave4.Z._Shift;
                                                            int Extermum_count = ArrayCopy(  Extermum_bars_Up, Extermum_bars_Up_temp); //
                                                  } //
                                        } //
                                        //
                                        for(int i = 0  ; i < 1  ; i++)  //---  for(int i = GDS.Wave1.A._Shift  ; i >= Extermum_Bar._Shift  ; i--)
                                        {         double Price_TL_WM       = ObjectGetValueByShift( EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up",  Extermum_bars_Up[i]);
                                                  if(Price_TL_WM < iHigh( NULL, Frame, Extermum_bars_Up[i]))
                                                  {         Shift_Break = Extermum_bars_Up[i] ; //
                                                            C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, false, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", "", Middle_Up.A._Time, Middle_Up.A._Price, Middle_Up.Z._Time, Middle_Up.Z._Price, LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                                                            C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, false, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up1", "", Middle_Up.A._Time, Middle_Up.A._Price + 10 * Point(), Middle_Up.Z._Time, Middle_Up.Z._Price + 10 * Point(), LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                                                            //-- Alert(" Up Shift_Break: ", Shift_Break);
                                                            break;//
                                                  } //
                                        } //
                                        if(Shift_Break > -1)
                                        {         Extermum_Bar._Shift                  = Shift_Break ; //???  its up channel
                                                  //---Alert("Extermum_Bar_1_3._Shift: ", Extermum_Bar_1_3._Shift); //
                                                  _iHighest_Bar_High                  = iHigh(NULL, Frame, Extermum_Bar._Shift);
                                                  //_iHighest_Bar_High
                                                  Extermum_Bar._Price                  = _iHighest_Bar_High ; //
                                                  Extermum_Bar._Time                   = iTime(NULL, Frame, Extermum_Bar._Shift);
                                                  //
                                                  //--Find Slope of trend line calc p1  and p2
                                                  Middle_Up.Dev_Math.Slope            = Middle_Up.Dev_Math.calcSlope(GDS.Wave0_1_4_5_Middle.A._Price, GDS.Wave0_1_4_5_Middle.Z._Price, GDS.Wave0_1_4_5_Middle.A._Time, GDS.Wave0_1_4_5_Middle.Z._Time);
                                                  Middle_Up.Dev_Math.Diff_B           = Middle_Up.Dev_Math.GetB_LineFormule(Middle_Up.Dev_Math.Slope, Extermum_Bar._Time, Extermum_Bar._Price);
                                                  Middle_Up.Z._Time                    = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * ShiftTime_Z;
                                                  Middle_Up.Z._Price                   = Middle_Up.Dev_Math.GetY_LineFormule(Middle_Up.Dev_Math.Slope, Middle_Up.Z._Time, Middle_Up.Dev_Math.Diff_B);
                                                  //----
                                                  Middle_Up.A._Time                    = GDS.Wave1.A._Time - PeriodSeconds(Frame) * 60; //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Up.A._Price                   = Middle_Up.Dev_Math.GetY_LineFormule(Middle_Up.Dev_Math.Slope, Middle_Up.A._Time, Middle_Up.Dev_Math.Diff_B);
                                                  //----
                                                  Middle_Up.S._Shift                   = 0; //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Up.S._Time                    = iTime(Symbol(), Frame, 0); //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Up.S._Price                   = Middle_Up.Dev_Math.GetY_LineFormule(Middle_Up.Dev_Math.Slope, Middle_Up.S._Time, Middle_Up.Dev_Math.Diff_B);
                                                  //
                                                  C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", "", Middle_Up.A._Time, Middle_Up.A._Price, Middle_Up.Z._Time, Middle_Up.Z._Price, LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                                                  C_Lines_ElliotsWave3_Wave_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up1", "", Middle_Up.A._Time, Middle_Up.A._Price + 10 * Point(), Middle_Up.Z._Time, Middle_Up.Z._Price + 10 * Point(), LineColorUp, With, false, STYLE_DASH, Is_Delete); //
                                                  //
                                        }//
                              }//
                    }//
          }//
          //--Channelise line Down
          //----------------------
          {         // Finde Extermium info
                    int _iLowest_Bar                    = iLowest( NULL, Frame, MODE_LOW,  GDS.Wave0_1_4_5_Middle.A._Shift - GDS.Wave0_1_4_5_Middle.Z._Shift, GDS.Wave0_1_4_5_Middle.Z._Shift);
                    int _iHighest_Bar                   = iHighest(NULL, Frame, MODE_HIGH, GDS.Wave0_1_4_5_Middle.A._Shift - GDS.Wave0_1_4_5_Middle.Z._Shift, GDS.Wave0_1_4_5_Middle.Z._Shift);
                    //--correction
                    if(true)
                    {         int Extermum_last_shift             = GDS.Wave0_1_4_5_Middle.Is_Bulish ?  GDS.Point_Highest._Shift : GDS.Point_Lowest._Shift;
                              _iLowest_Bar                    = iLowest( NULL, Frame, MODE_LOW,   GDS.Point_Lowest._Shift + 1,  GDS.Wave1.A._Shift);
                              _iHighest_Bar                   = iHighest(NULL, Frame, MODE_HIGH,  GDS.Point_Highest._Shift + 1, GDS.Wave1.A._Shift); //
                    }
                    //
                    Sg_Point_ Extermum_Bar; //---_iLowest_Bar_Low
                    Extermum_Bar._Shift                  = GDS.Wave0_1_4_5_Middle.Is_Bulish                            ? _iHighest_Bar  : _iLowest_Bar; //???
                    Extermum_Bar._Shift                  = _iLowest_Bar; //??? its down channel
                    //---Alert("Extermum_Bar_1_3._Shift: ", Extermum_Bar_1_3._Shift); //
                    double _iLowest_Bar_Low             = iLow(NULL, Frame, Extermum_Bar._Shift) ;
                    double _iHighest_Bar_High           = iHigh(NULL, Frame, Extermum_Bar._Shift);
                    //
                    Extermum_Bar._Price                  = GDS.Wave0_1_4_5_Middle.Is_Bulish                            ? _iHighest_Bar_High   : _iLowest_Bar_Low; //
                    Extermum_Bar._Price                  = _iLowest_Bar_Low; //
                    Extermum_Bar._Time                   = iTime(NULL, Frame, Extermum_Bar._Shift);
                    //
                    //--Find Slope of trend line calc p1  and p2
                    Middle_Down.Dev_Math.Slope          = Middle_Down.Dev_Math.calcSlope(GDS.Wave0_1_4_5_Middle.A._Price, GDS.Wave0_1_4_5_Middle.Z._Price, GDS.Wave0_1_4_5_Middle.A._Time, GDS.Wave0_1_4_5_Middle.Z._Time);
                    Middle_Down.Dev_Math.Diff_B         = Middle_Down.Dev_Math.GetB_LineFormule(Middle_Down.Dev_Math.Slope, Extermum_Bar._Time, Extermum_Bar._Price);
                    Middle_Down.Z._Time                  = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * ShiftTime_Z;
                    Middle_Down.Z._Price                 = Middle_Down.Dev_Math.GetY_LineFormule(Middle_Down.Dev_Math.Slope, Middle_Down.Z._Time, Middle_Down.Dev_Math.Diff_B);
                    //----
                    Middle_Down.A._Time                  =  GDS.Wave1.A._Time - PeriodSeconds(Frame) * 60; //GDS.Wave0_1_4_5_Middle.A._Time;
                    Middle_Down.A._Price                 = Middle_Down.Dev_Math.GetY_LineFormule(Middle_Down.Dev_Math.Slope, Middle_Down.A._Time, Middle_Down.Dev_Math.Diff_B);
                    //----
                    Middle_Down.S._Shift                 = 0; //GDS.Wave0_1_4_5_Middle.A._Time;
                    Middle_Down.S._Time                  = iTime(Symbol(), Frame, 0); //GDS.Wave0_1_4_5_Middle.A._Time;
                    Middle_Down.S._Price                 = Middle_Down.Dev_Math.GetY_LineFormule(Middle_Down.Dev_Math.Slope, Middle_Down.S._Time, Middle_Down.Dev_Math.Diff_B);
                    //
                    C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", "",  Middle_Down.A._Time, Middle_Down.A._Price,                Middle_Down.Z._Time, Middle_Down.Z._Price, LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                    C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down1", "", Middle_Down.A._Time, Middle_Down.A._Price - 10 * Point(), Middle_Down.Z._Time, Middle_Down.Z._Price - 10 * Point(), LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                    {         //--formul for broken 3
                              if(true)
                              {         int Shift_Break = -1;
                                        int Extermum_bars_Down[3] = {0, 0, 0 };
                                        if(true)
                                        {         if(!GDS.Wave1.Is_Bulish)
                                                  {         int Extermum_bars_Down_temp[3];// = {GDS.Wave1.Z._Shift, GDS.Wave3.Z._Shift, GDS.Wave5.Z._Shift }; //
                                                            Extermum_bars_Down_temp[0] = GDS.Wave1.Z._Shift;  //-- Alert(" Down GDS.Wave1.Z._Shift: ", GDS.Wave1.Z._Shift);
                                                            Extermum_bars_Down_temp[1] = GDS.Wave3.Z._Shift;  //-- Alert(" Down GDS.Wave3.Z._Shift: ", GDS.Wave3.Z._Shift);
                                                            Extermum_bars_Down_temp[2] = GDS.Wave5.Z._Shift;  //-- Alert(" Down GDS.Wave5.Z._Shift: ", GDS.Wave5.Z._Shift);
                                                            int Extermum_count = ArrayCopy( Extermum_bars_Down,  Extermum_bars_Down_temp); //
                                                  }
                                                  else
                                                  {         int Extermum_bars_Down_temp[3];// = {GDS.Wave1.A._Shift, GDS.Wave2.Z._Shift, GDS.Wave4.Z._Shift }; //
                                                            Extermum_bars_Down_temp[0] = GDS.Wave1.A._Shift;  //-- Alert(" Down2 GDS.Wave1.A._Shift: ", GDS.Wave1.A._Shift);
                                                            Extermum_bars_Down_temp[1] = GDS.Wave2.Z._Shift;  //-- Alert(" Down2 GDS.Wave2.Z._Shift: ", GDS.Wave2.Z._Shift);
                                                            Extermum_bars_Down_temp[2] = GDS.Wave4.Z._Shift;  //-- Alert(" Down2 GDS.Wave4.Z._Shift: ", GDS.Wave4.Z._Shift);
                                                            int Extermum_count = ArrayCopy( Extermum_bars_Down,  Extermum_bars_Down_temp); //
                                                  } //
                                        } //
                                        for(int i = 0  ; i <= 2  ; i++) //--for(int i = GDS.Wave1.A._Shift  ; i >= Extermum_Bar._Shift  ; i--)  for(int i = Extermum_Bar._Shift; i <= GDS.Wave1.A._Shift ; i++)   (int i = 0  ; i <= 2  ; i++)
                                        {         double Price_TL_WM       = ObjectGetValueByShift( EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down",  Extermum_bars_Down[i]);
                                                  if(Price_TL_WM > iLow( NULL, Frame, Extermum_bars_Down[i]))
                                                  {         Shift_Break = Extermum_bars_Down[i]; //
                                                            C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, false, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", "",  Middle_Down.A._Time, Middle_Down.A._Price,                 Middle_Down.Z._Time, Middle_Down.Z._Price, LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                                                            C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, false, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down1", "", Middle_Down.A._Time, Middle_Down.A._Price - 10 * Point(),   Middle_Down.Z._Time, Middle_Down.Z._Price - 10 * Point(), LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                                                            //-- Alert(" Down Shift_Break: ", Shift_Break);
                                                            break;//
                                                  }//
                                        } //
                                        if(Shift_Break > -1)
                                        {         Extermum_Bar._Shift                  = Shift_Break; //??? its down channel
                                                  //---Alert("Extermum_Bar_1_3._Shift: ", Extermum_Bar_1_3._Shift); //
                                                  _iLowest_Bar_Low                     = iLow(NULL, Frame, Extermum_Bar._Shift) ;
                                                  _iHighest_Bar_High                   = iHigh(NULL, Frame, Extermum_Bar._Shift);
                                                  //
                                                  Extermum_Bar._Price                  = GDS.Wave0_1_4_5_Middle.Is_Bulish                            ? _iHighest_Bar_High   : _iLowest_Bar_Low; //
                                                  Extermum_Bar._Price                  = _iLowest_Bar_Low; //
                                                  Extermum_Bar._Time                   = iTime(NULL, Frame, Extermum_Bar._Shift);
                                                  //
                                                  //--Find Slope of trend line calc p1  and p2
                                                  Middle_Down.Dev_Math.Slope           = Middle_Down.Dev_Math.calcSlope(GDS.Wave0_1_4_5_Middle.A._Price, GDS.Wave0_1_4_5_Middle.Z._Price, GDS.Wave0_1_4_5_Middle.A._Time, GDS.Wave0_1_4_5_Middle.Z._Time);
                                                  Middle_Down.Dev_Math.Diff_B          = Middle_Down.Dev_Math.GetB_LineFormule(Middle_Down.Dev_Math.Slope, Extermum_Bar._Time, Extermum_Bar._Price);
                                                  Middle_Down.Z._Time                  = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * ShiftTime_Z;
                                                  Middle_Down.Z._Price                 = Middle_Down.Dev_Math.GetY_LineFormule(Middle_Down.Dev_Math.Slope, Middle_Down.Z._Time, Middle_Down.Dev_Math.Diff_B);
                                                  //----
                                                  Middle_Down.A._Time                  =  GDS.Wave1.A._Time - PeriodSeconds(Frame) * 60; //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Down.A._Price                 = Middle_Down.Dev_Math.GetY_LineFormule(Middle_Down.Dev_Math.Slope, Middle_Down.A._Time, Middle_Down.Dev_Math.Diff_B);
                                                  //----
                                                  Middle_Down.S._Shift                 = 0; //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Down.S._Time                  = iTime(Symbol(), Frame, 0); //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Down.S._Price                 = Middle_Down.Dev_Math.GetY_LineFormule(Middle_Down.Dev_Math.Slope, Middle_Down.S._Time, Middle_Down.Dev_Math.Diff_B);
                                                  //
                                                  C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", "", Middle_Down.A._Time, Middle_Down.A._Price, Middle_Down.Z._Time, Middle_Down.Z._Price, LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                                                  C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down1", "", Middle_Down.A._Time, Middle_Down.A._Price - 10 * Point(), Middle_Down.Z._Time, Middle_Down.Z._Price - 10 * Point(), LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                                        }//
                              }//
                              //--formul for broken 2
                              if(true)
                              {         int Shift_Break = -1;
                                        int Extermum_bars_Down[2] = {0,  0 };
                                        if(true)
                                        {         if(!GDS.Wave1.Is_Bulish)
                                                  {         int Extermum_bars_Down_temp[2];// = {GDS.Wave1.Z._Shift, GDS.Wave3.Z._Shift, GDS.Wave5.Z._Shift }; //
                                                            Extermum_bars_Down_temp[0] = GDS.Wave3.Z._Shift;
                                                            Extermum_bars_Down_temp[1] = GDS.Wave5.Z._Shift;
                                                            int Extermum_count = ArrayCopy( Extermum_bars_Down,  Extermum_bars_Down_temp); //
                                                  }
                                                  else
                                                  {         int Extermum_bars_Down_temp[2];// = {GDS.Wave1.A._Shift, GDS.Wave2.Z._Shift, GDS.Wave4.Z._Shift }; //
                                                            Extermum_bars_Down_temp[0] = GDS.Wave2.Z._Shift;
                                                            Extermum_bars_Down_temp[1] = GDS.Wave4.Z._Shift;
                                                            int Extermum_count = ArrayCopy(Extermum_bars_Down,  Extermum_bars_Down_temp); //
                                                  } //
                                        } //
                                        for(int i = 0  ; i <= 1  ; i++) //--for(int i = GDS.Wave1.A._Shift  ; i >= Extermum_Bar._Shift  ; i--)  for(int i = Extermum_Bar._Shift; i <= GDS.Wave1.A._Shift ; i++)   (int i = 0  ; i <= 2  ; i++)
                                        {         double Price_TL_WM       = ObjectGetValueByShift( EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down",  Extermum_bars_Down[i]);
                                                  if(Price_TL_WM > iLow( NULL, Frame, Extermum_bars_Down[i]))
                                                  {         Shift_Break = Extermum_bars_Down[i]; //
                                                            C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, false, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", "", Middle_Up.A._Time, Middle_Up.A._Price, Middle_Up.Z._Time, Middle_Up.Z._Price, LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                                                            C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, false, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down1", "", Middle_Up.A._Time, Middle_Up.A._Price - 10 * Point(), Middle_Up.Z._Time, Middle_Up.Z._Price - 10 * Point(), LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                                                            //-- Alert(" Down Shift_Break: ", Shift_Break);
                                                            break;//
                                                  }//
                                        } //
                                        if(Shift_Break > -1)
                                        {         Extermum_Bar._Shift                  = Shift_Break; //??? its down channel
                                                  //---Alert("Extermum_Bar_1_3._Shift: ", Extermum_Bar_1_3._Shift); //
                                                  _iLowest_Bar_Low                     = iLow(NULL, Frame, Extermum_Bar._Shift) ;
                                                  _iHighest_Bar_High                   = iHigh(NULL, Frame, Extermum_Bar._Shift);
                                                  //
                                                  Extermum_Bar._Price                  = GDS.Wave0_1_4_5_Middle.Is_Bulish                            ? _iHighest_Bar_High   : _iLowest_Bar_Low; //
                                                  Extermum_Bar._Price                  = _iLowest_Bar_Low; //
                                                  Extermum_Bar._Time                   = iTime(NULL, Frame, Extermum_Bar._Shift);
                                                  //
                                                  //--Find Slope of trend line calc p1  and p2
                                                  Middle_Down.Dev_Math.Slope          = Middle_Down.Dev_Math.calcSlope(GDS.Wave0_1_4_5_Middle.A._Price, GDS.Wave0_1_4_5_Middle.Z._Price, GDS.Wave0_1_4_5_Middle.A._Time, GDS.Wave0_1_4_5_Middle.Z._Time);
                                                  Middle_Down.Dev_Math.Diff_B         = Middle_Down.Dev_Math.GetB_LineFormule(Middle_Down.Dev_Math.Slope, Extermum_Bar._Time, Extermum_Bar._Price);
                                                  Middle_Down.Z._Time                 = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * ShiftTime_Z;
                                                  Middle_Down.Z._Price                = Middle_Down.Dev_Math.GetY_LineFormule(Middle_Down.Dev_Math.Slope, Middle_Down.Z._Time, Middle_Down.Dev_Math.Diff_B);
                                                  //----
                                                  Middle_Down.A._Time                 =  GDS.Wave1.A._Time - PeriodSeconds(Frame) * 60; //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Down.A._Price                = Middle_Down.Dev_Math.GetY_LineFormule(Middle_Down.Dev_Math.Slope, Middle_Down.A._Time, Middle_Down.Dev_Math.Diff_B);
                                                  //----
                                                  Middle_Down.S._Shift                = 0; //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Down.S._Time                 = iTime(Symbol(), Frame, 0); //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Down.S._Price                = Middle_Down.Dev_Math.GetY_LineFormule(Middle_Down.Dev_Math.Slope, Middle_Down.S._Time, Middle_Down.Dev_Math.Diff_B);
                                                  //
                                                  C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", "", Middle_Down.A._Time, Middle_Down.A._Price, Middle_Down.Z._Time, Middle_Down.Z._Price, LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                                                  C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down1", "", Middle_Down.A._Time, Middle_Down.A._Price - 10 * Point(), Middle_Down.Z._Time, Middle_Down.Z._Price - 10 * Point(), LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                                                  //
                                        }//
                              }//
                              //--formul for broken 1
                              if(true)
                              {         int Shift_Break = -1;
                                        int Extermum_bars_Down[1] = {0 };
                                        if(true)
                                        {         if(!GDS.Wave1.Is_Bulish)
                                                  {         int Extermum_bars_Down_temp[1];// = {GDS.Wave1.Z._Shift, GDS.Wave3.Z._Shift, GDS.Wave5.Z._Shift }; //
                                                            Extermum_bars_Down_temp[0] = GDS.Wave5.Z._Shift;
                                                            int Extermum_count = ArrayCopy( Extermum_bars_Down,  Extermum_bars_Down_temp); //
                                                  }
                                                  else
                                                  {         int Extermum_bars_Down_temp[1];// = {GDS.Wave1.A._Shift, GDS.Wave2.Z._Shift, GDS.Wave4.Z._Shift }; //
                                                            Extermum_bars_Down_temp[0] = GDS.Wave4.Z._Shift;
                                                            int Extermum_count = ArrayCopy(Extermum_bars_Down,  Extermum_bars_Down_temp); //
                                                  } //
                                        } //
                                        for(int i = 0  ; i < 1  ; i++) //--for(int i = GDS.Wave1.A._Shift  ; i >= Extermum_Bar._Shift  ; i--)  for(int i = Extermum_Bar._Shift; i <= GDS.Wave1.A._Shift ; i++)   (int i = 0  ; i <= 2  ; i++)
                                        {         double Price_TL_WM       = ObjectGetValueByShift( EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down",  Extermum_bars_Down[i]);
                                                  if(Price_TL_WM > iLow( NULL, Frame, Extermum_bars_Down[i]))
                                                  {         Shift_Break = Extermum_bars_Down[i]; //
                                                            C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, false, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", "", Middle_Up.A._Time, Middle_Up.A._Price, Middle_Up.Z._Time, Middle_Up.Z._Price, LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                                                            C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, false, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down1", "", Middle_Up.A._Time, Middle_Up.A._Price - 10 * Point(), Middle_Up.Z._Time, Middle_Up.Z._Price - 10 * Point(), LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                                                            //-- Alert(" Down Shift_Break: ", Shift_Break);
                                                            break;//
                                                  }//
                                        } //
                                        if(Shift_Break > -1)
                                        {         Extermum_Bar._Shift                  = Shift_Break; //??? its down channel
                                                  //---Alert("Extermum_Bar_1_3._Shift: ", Extermum_Bar_1_3._Shift); //
                                                  _iLowest_Bar_Low                     = iLow(NULL, Frame, Extermum_Bar._Shift) ;
                                                  _iHighest_Bar_High                   = iHigh(NULL, Frame, Extermum_Bar._Shift);
                                                  //
                                                  Extermum_Bar._Price                  = GDS.Wave0_1_4_5_Middle.Is_Bulish                            ? _iHighest_Bar_High   : _iLowest_Bar_Low; //
                                                  Extermum_Bar._Price                  = _iLowest_Bar_Low; //
                                                  Extermum_Bar._Time                   = iTime(NULL, Frame, Extermum_Bar._Shift);
                                                  //
                                                  //--Find Slope of trend line calc p1  and p2
                                                  Middle_Down.Dev_Math.Slope           = Middle_Down.Dev_Math.calcSlope(GDS.Wave0_1_4_5_Middle.A._Price, GDS.Wave0_1_4_5_Middle.Z._Price, GDS.Wave0_1_4_5_Middle.A._Time, GDS.Wave0_1_4_5_Middle.Z._Time);
                                                  Middle_Down.Dev_Math.Diff_B          = Middle_Down.Dev_Math.GetB_LineFormule(Middle_Down.Dev_Math.Slope, Extermum_Bar._Time, Extermum_Bar._Price);
                                                  Middle_Down.Z._Time                  = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * ShiftTime_Z;
                                                  Middle_Down.Z._Price                 = Middle_Down.Dev_Math.GetY_LineFormule(Middle_Down.Dev_Math.Slope, Middle_Down.Z._Time, Middle_Down.Dev_Math.Diff_B);
                                                  //----
                                                  Middle_Down.A._Time                  =  GDS.Wave1.A._Time - PeriodSeconds(Frame) * 60; //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Down.A._Price                 = Middle_Down.Dev_Math.GetY_LineFormule(Middle_Down.Dev_Math.Slope, Middle_Down.A._Time, Middle_Down.Dev_Math.Diff_B);
                                                  //----
                                                  Middle_Down.S._Shift                 = 0; //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Down.S._Time                  = iTime(Symbol(), Frame, 0); //GDS.Wave0_1_4_5_Middle.A._Time;
                                                  Middle_Down.S._Price                 = Middle_Down.Dev_Math.GetY_LineFormule(Middle_Down.Dev_Math.Slope, Middle_Down.S._Time, Middle_Down.Dev_Math.Diff_B);
                                                  //
                                                  C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", "", Middle_Down.A._Time, Middle_Down.A._Price, Middle_Down.Z._Time, Middle_Down.Z._Price, LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                                                  C_Lines_ElliotsWave3_Wave_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down1", "", Middle_Down.A._Time, Middle_Down.A._Price - 10 * Point(), Middle_Down.Z._Time, Middle_Down.Z._Price - 10 * Point(), LineColorDown, With, false, STYLE_DASH, Is_Delete); //
                                                  //
                                        }//
                              }//
                    }//
          }
          //--line middle middle
          {         //----------------------------------
                    double Diff_Thirden                         = (Middle_Up.S._Price - Middle_Down.S._Price) / 3    ;
                    Middle_Middle_Up.Dev_Math                   = Middle_Up.Dev_Math;
                    Middle_Middle_Up.Dev_Math.Diff_B            = Middle_Middle_Up.Dev_Math.GetB_LineFormule(Middle_Middle_Up.Dev_Math.Slope, Middle_Up.S._Time, Middle_Up.S._Price - Diff_Thirden );
                    Middle_Middle_Up.S._Shift                    = 0; //GDS.Wave0_1_4_5_Middle.A._Time;
                    Middle_Middle_Up.S._Time                     = iTime(Symbol(), Frame, 0); //GDS.Wave0_1_4_5_Middle.A._Time;
                    Middle_Middle_Up.S._Price                    = Middle_Middle_Up.Dev_Math.GetY_LineFormule(Middle_Middle_Up.Dev_Math.Slope, Middle_Up.S._Time, Middle_Middle_Up.Dev_Math.Diff_B);//
                    //----
                    Middle_Middle_Up.Dev_Math.Diff_B            = Middle_Middle_Up.Dev_Math.GetB_LineFormule(Middle_Middle_Up.Dev_Math.Slope, Middle_Middle_Up.S._Time,  Middle_Middle_Up.S._Price );
                    Middle_Middle_Up.A._Time                     = Middle_Middle_Up.Dev_Math.GetX_LineFormule(Middle_Middle_Up.Dev_Math.Slope, Middle_Up.A._Price - Diff_Thirden, Middle_Middle_Up.Dev_Math.Diff_B);
                    Middle_Middle_Up.A._Price                    = Middle_Middle_Up.Dev_Math.GetY_LineFormule(Middle_Middle_Up.Dev_Math.Slope, Middle_Middle_Up.A._Time,  Middle_Middle_Up.Dev_Math.Diff_B);
                    //------
                    Middle_Middle_Up.Z._Time                     = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * ShiftTime_Z; //GDS.Wave0_1_4_5_Middle.A._Time;
                    Middle_Middle_Up.Z._Price                    = Middle_Middle_Down.Dev_Math.GetY_LineFormule(Middle_Middle_Up.Dev_Math.Slope, Middle_Up.Z._Time, Middle_Middle_Up.Dev_Math.Diff_B);//
                    //------
                    C_Lines_ElliotsWave3_Wave_Middle_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-Middle_Middle_Up w1w5-Channel-Middle_Up", "",  Middle_Middle_Up.A._Time, Middle_Middle_Up.A._Price, Middle_Middle_Up.Z._Time, Middle_Middle_Up.Z._Price, LineColorMiddleUp, 1, false, STYLE_DASH, Is_Delete); //
                    C_Lines_ElliotsWave3_Wave_Middle_Middle_Up.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-Middle_Middle_Up w1w5-Channel-Middle_Up1", "",  Middle_Middle_Up.A._Time, Middle_Middle_Up.A._Price + 10 * Point(), Middle_Middle_Up.Z._Time, Middle_Middle_Up.Z._Price + 10 * Point(), LineColorMiddleUp, 1, false, STYLE_DASH, Is_Delete); //
                    //------------------------------------------
                    Middle_Middle_Down.Dev_Math                 = Middle_Down.Dev_Math;
                    Middle_Middle_Down.Dev_Math.Diff_B          = Middle_Middle_Down.Dev_Math.GetB_LineFormule(Middle_Middle_Down.Dev_Math.Slope, Middle_Down.S._Time, Middle_Down.S._Price + Diff_Thirden );
                    Middle_Middle_Down.S._Shift                  = 0; //GDS.Wave0_1_4_5_Middle.A._Time;
                    Middle_Middle_Down.S._Time                   = iTime(Symbol(), Frame, 0); //GDS.Wave0_1_4_5_Middle.A._Time;
                    Middle_Middle_Down.S._Price                  = Middle_Middle_Down.Dev_Math.GetY_LineFormule(Middle_Middle_Down.Dev_Math.Slope, Middle_Up.S._Time, Middle_Middle_Down.Dev_Math.Diff_B);//
                    //----
                    Middle_Middle_Down.Dev_Math.Diff_B          = Middle_Middle_Down.Dev_Math.GetB_LineFormule(Middle_Middle_Down.Dev_Math.Slope, Middle_Middle_Down.S._Time,  Middle_Middle_Down.S._Price );
                    Middle_Middle_Down.A._Time                   = Middle_Middle_Down.Dev_Math.GetX_LineFormule(Middle_Middle_Down.Dev_Math.Slope, Middle_Down.A._Price + Diff_Thirden, Middle_Middle_Down.Dev_Math.Diff_B);
                    Middle_Middle_Down.A._Price                  = Middle_Middle_Down.Dev_Math.GetY_LineFormule(Middle_Middle_Down.Dev_Math.Slope, Middle_Middle_Down.A._Time,  Middle_Middle_Down.Dev_Math.Diff_B);
                    //------
                    Middle_Middle_Down.Z._Time                   = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * ShiftTime_Z; //GDS.Wave0_1_4_5_Middle.A._Time;
                    Middle_Middle_Down.Z._Price                  = Middle_Middle_Down.Dev_Math.GetY_LineFormule(Middle_Middle_Down.Dev_Math.Slope, Middle_Up.Z._Time, Middle_Middle_Down.Dev_Math.Diff_B);//
                    //------
                    C_Lines_ElliotsWave3_Wave_Middle_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-Mid_Mid_Down w1w5-Channel-Middle_Down", "", Middle_Middle_Down.A._Time, Middle_Middle_Down.A._Price, Middle_Middle_Down.Z._Time, Middle_Middle_Down.Z._Price, LineColorMiddleDown, 1, false, STYLE_DASH, Is_Delete); //
                    C_Lines_ElliotsWave3_Wave_Middle_Middle_Down.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_TL.Wave-Mid_Mid_Down w1w5-Channel-Middle_Down1", "", Middle_Middle_Down.A._Time, Middle_Middle_Down.A._Price - 10 * Point(), Middle_Middle_Down.Z._Time, Middle_Middle_Down.Z._Price - 10 * Point(), LineColorMiddleDown, 1, false, STYLE_DASH, Is_Delete); //
                    //
          }
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Draw_wave_M_lines_Channel_Buffer(int WhichMode, bool IsKey, bool Is_Delete)
{
          {         //
                    color clr = Middle_Up.Calc_Is_Bulish() ? clrMediumSeaGreen : clrMaroon;
                    C_Shapes_ElliotsWave_Shows.Triangle.Draw_GDS(WhichMode, IsKey, EnumToString(Frame) + "_Up-channel-A", false,                     Middle_Up.A._Time,       Middle_Up.A._Price, Middle_Up.Z._Time, Middle_Up.Z._Price, Middle_Up.Z._Time, Middle_Up.Z._Price + 50 * Point, clr, true);
                    C_Shapes_ElliotsWave_Shows.Triangle.Draw_GDS(WhichMode, IsKey, EnumToString(Frame) + "_Up-channel-B", false,                     Middle_Up.A._Time,       Middle_Up.A._Price + 50 * Point, Middle_Up.A._Time, Middle_Up.A._Price, Middle_Up.Z._Time, Middle_Up.Z._Price + 50 * Point, clr, true);
                    //
                    C_Shapes_ElliotsWave_Shows.Triangle.Draw_GDS(WhichMode, IsKey, EnumToString(Frame) + "_Down-channel-A", false,                   Middle_Down.A._Time,     Middle_Down.A._Price, Middle_Down.Z._Time, Middle_Down.Z._Price, Middle_Down.Z._Time, Middle_Down.Z._Price - 50 * Point, clr, true);
                    C_Shapes_ElliotsWave_Shows.Triangle.Draw_GDS(WhichMode, IsKey, EnumToString(Frame) + "_Down-channel-B", false,                   Middle_Down.A._Time,     Middle_Down.A._Price - 50 * Point, Middle_Down.A._Time, Middle_Down.A._Price, Middle_Down.Z._Time, Middle_Down.Z._Price - 50 * Point, clr, true);
                    //
          }
          {         //
                    color clr = Middle_Up.Calc_Is_Bulish() ? clrMediumSeaGreen : clrMaroon;
                    C_Lines_ElliotsWave3_Wave5.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave-middle w1w5-Up-Buffer", "",           Middle_Up.A._Time,       Middle_Up.A._Price + 200 * Point,        Middle_Up.Z._Time,       Middle_Up.Z._Price + 200 * Point,        clr, 1, false, STYLE_DASH, false);
                    C_Shapes_ElliotsWave_Shows.Triangle.Draw_GDS(WhichMode, IsKey, EnumToString(Frame) + "_Up-channel-A-Up-Buffer", false,           Middle_Up.A._Time,       Middle_Up.A._Price + 200 * Point,        Middle_Up.Z._Time,       Middle_Up.Z._Price + 200 * Point,        Middle_Up.Z._Time,       Middle_Up.Z._Price + 250 * Point, clr, true);
                    C_Shapes_ElliotsWave_Shows.Triangle.Draw_GDS(WhichMode, IsKey, EnumToString(Frame) + "_Up-channel-B-Up-Buffer", false,           Middle_Up.A._Time,       Middle_Up.A._Price + 250 * Point,        Middle_Up.A._Time,       Middle_Up.A._Price + 200 * Point,        Middle_Up.Z._Time,       Middle_Up.Z._Price + 250 * Point, clr, true);
                    //
                    //
                    C_Lines_ElliotsWave3_Wave5.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave-middle w1w5-Down-Buffer", "",         Middle_Down.A._Time,     Middle_Down.A._Price - 200 * Point,      Middle_Down.Z._Time,     Middle_Down.Z._Price - 200 * Point,      clr, 1, false, STYLE_DASH, false);
                    C_Shapes_ElliotsWave_Shows.Triangle.Draw_GDS(WhichMode, IsKey, EnumToString(Frame) + "_Down-channel-A-Down-Buffer", false,       Middle_Down.A._Time,     Middle_Down.A._Price - 200 * Point,      Middle_Down.Z._Time,     Middle_Down.Z._Price - 200 * Point,      Middle_Down.Z._Time,     Middle_Down.Z._Price - 250 * Point, clr, true);
                    C_Shapes_ElliotsWave_Shows.Triangle.Draw_GDS(WhichMode, IsKey, EnumToString(Frame) + "_Down-channel-B-Down-Buffer", false,       Middle_Down.A._Time,     Middle_Down.A._Price - 250 * Point,      Middle_Down.A._Time,     Middle_Down.A._Price - 200 * Point,      Middle_Down.Z._Time,     Middle_Down.Z._Price - 250 * Point, clr, true);
                    //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Draw_wave_M_lines_Channel_Calc(int WhichMode, bool IsKey, bool Is_Delete)
{         Middle_Channel_Floor_Bar0._Price                = ObjectGetValueByShift(         EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", 0);    Middle_Channel_Floor_Bar0._Price = NormalizeDouble( Middle_Channel_Floor_Bar0._Price, Digits);                                          //
          Middle_Channel_Floor_Bar0._Time                 = ObjectGetTimeByValue(NULL,     EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down",        Middle_Channel_Floor_Bar0._Price); //;
          Middle_Channel_Ceil_Bar0._Price                 = ObjectGetValueByShift(         EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", 0);      Middle_Channel_Ceil_Bar0._Price = NormalizeDouble( Middle_Channel_Ceil_Bar0._Price, Digits);                                              //
          Middle_Channel_Ceil_Bar0._Time                  = ObjectGetTimeByValue(NULL,     EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up",          Middle_Channel_Ceil_Bar0._Price); //;
          double Diff_Price_min = 0.25;
          double Diff_Price = GDS.Wave0_1_4_5_Middle.Is_Bulish ? +Diff_Price_min : -Diff_Price_min;
          //----------------------------------------------------------------
          double High_Channel_RangeDiff = ObjectGetValueByShift(EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", 0) - Ask;
          double Down_Channel_RangeDiff = Bid - ObjectGetValueByShift(EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", 0) ;;
          double calc_ = Down_Channel_RangeDiff + High_Channel_RangeDiff; if(calc_ == 0) {calc_ = 1;}
          double Calc_Percent_MCDB0 = Down_Channel_RangeDiff / (calc_) ;
          double Calc_Percent_MCUB0 = High_Channel_RangeDiff / (calc_) ;
          //----------------------------------------------------------------
          ObjectDelete(EnumToString(Frame) + "_desc.Wave-middle w1w5-Channel-Down");  ObjectDelete(EnumToString(Frame) + "_desc.Wave-middle w1w5-Channel-Up");
          ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Down-H");                 ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Up-H");
          ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Down-Hprev1");            ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Up-Hprev1");
          ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Down-Hprev2");            ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Up-Hprev2");
          ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Down-Hprev3");            ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Up-Hprev3");
          ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Down-Hprev4");            ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Up-Hprev4");
          ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Down-Hprev5");            ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Up-Hprev5");
          ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Down-Hnext1");            ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Up-Hnext1");
          ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Down-Hnext2");            ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Up-Hnext2");
          ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Down-Hnext3");            ObjectDelete(EnumToString(Frame) + "_w1w5-Channel-Up-Hnext3");
          //----------------------------------------------------------------
          {         Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_desc.Wave-middle w1w5-Channel-Down", EnumToString(Frame) + " D " + " : " + (string)Middle_Channel_Floor_Bar0._Price + " : " + DoubleToStr(Calc_Percent_MCDB0, 2) + " : " + DoubleToStr(Down_Channel_RangeDiff, 2), Middle_Channel_Floor_Bar0._Time + PeriodSeconds(Frame) * 0, Middle_Channel_Floor_Bar0._Price + Diff_Price, clrYellow, "Arial", 7, ANCHOR_LEFT, 0, Is_Delete); //
                    Diff_Price_min = 0.25;
                    Diff_Price = GDS.Wave0_1_4_5_Middle.Is_Bulish ? +Diff_Price_min : -Diff_Price_min;
                    Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_desc.Wave-middle w1w5-Channel-Up",   EnumToString(Frame) + " U " + " : " + (string)Middle_Channel_Ceil_Bar0._Price + " : " + DoubleToStr(Calc_Percent_MCUB0, 2) + " : " + DoubleToStr(High_Channel_RangeDiff, 2), Middle_Channel_Ceil_Bar0._Time + PeriodSeconds(Frame) * 0, Middle_Channel_Ceil_Bar0._Price + Diff_Price, clrYellow, "Arial", 7, ANCHOR_LEFT, 0, Is_Delete); //
          }
          //----------------------------------------------------------------
          {         //
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Down-H", "", iTime(Symbol(), Frame, 0), Middle_Channel_Floor_Bar0._Price - Point * 15, iTime(Symbol(), Frame, 0), Middle_Channel_Floor_Bar0._Price + Point * 15, clrRed, 3, false, STYLE_DASH, Is_Delete);
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Up-H", "",   iTime(Symbol(), Frame, 0), Middle_Channel_Ceil_Bar0._Price  - Point * 15, iTime(Symbol(), Frame, 0),  Middle_Channel_Ceil_Bar0._Price + Point * 15, clrRed, 3, false, STYLE_DASH, Is_Delete);  //PERIOD_M1_TL.Wave-middle w1w5-Channel-Down
          }
          if(Frame != PERIOD_M1)
          {         //
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Down-Hprev1", "", iTime(Symbol(), Frame, 1), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", iTime(Symbol(), Frame, 1)) - Point * 100, iTime(Symbol(), Frame, 1), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", iTime(Symbol(), Frame, 1)) + Point * 100, clrRed, 1, false, STYLE_DASH, Is_Delete);
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Up-Hprev1", "",   iTime(Symbol(), Frame, 1), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", iTime(Symbol(), Frame, 1))  - Point * 100, iTime(Symbol(), Frame, 1),  ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", iTime(Symbol(), Frame, 1)) + Point * 100, clrRed, 1, false, STYLE_DASH, Is_Delete); //
          }
          if(Frame != PERIOD_M1)
          {         //
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Down-Hprev2", "", iTime(Symbol(), Frame, 2), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", iTime(Symbol(), Frame, 2)) - Point * 100, iTime(Symbol(), Frame, 2), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", iTime(Symbol(), Frame, 2)) + Point * 100, clrRed, 1, false, STYLE_DASH, Is_Delete);
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Up-Hprev2", "",   iTime(Symbol(), Frame, 2), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", iTime(Symbol(), Frame, 2))  - Point * 100, iTime(Symbol(), Frame, 2),  ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", iTime(Symbol(), Frame, 2)) + Point * 100, clrRed, 1, false, STYLE_DASH, Is_Delete); //
          }
          if(Frame != PERIOD_M1)
          {         //
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Down-Hprev3", "", iTime(Symbol(), Frame, 3), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", iTime(Symbol(), Frame, 3)) - Point * 100, iTime(Symbol(), Frame, 3), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", iTime(Symbol(), Frame, 3)) + Point * 100, clrRed, 1, false, STYLE_DASH, Is_Delete);
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Up-Hprev3", "",   iTime(Symbol(), Frame, 3), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", iTime(Symbol(), Frame, 3))  - Point * 100, iTime(Symbol(), Frame, 3),  ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", iTime(Symbol(), Frame, 3)) + Point * 100, clrRed, 1, false, STYLE_DASH, Is_Delete); //
          }
          if(Frame != PERIOD_M1)
          {         //
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Down-Hprev4", "", iTime(Symbol(), Frame, 4), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", iTime(Symbol(), Frame, 4)) - Point * 100, iTime(Symbol(), Frame, 4), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", iTime(Symbol(), Frame, 4)) + Point * 100, clrRed, 1, false, STYLE_DASH, Is_Delete);
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Up-Hprev4", "",   iTime(Symbol(), Frame, 4), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", iTime(Symbol(), Frame, 4))  - Point * 100, iTime(Symbol(), Frame, 4),  ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", iTime(Symbol(), Frame, 4)) + Point * 100, clrRed, 1, false, STYLE_DASH, Is_Delete); //
          }
          if(Frame != PERIOD_M1)
          {         //
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Down-Hprev5", "", iTime(Symbol(), Frame, 5), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", iTime(Symbol(), Frame, 5)) - Point * 100, iTime(Symbol(), Frame, 5), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Down", iTime(Symbol(), Frame, 5)) + Point * 100, clrRed, 1, false, STYLE_DASH, Is_Delete);
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Up-Hprev5", "",   iTime(Symbol(), Frame, 5), ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", iTime(Symbol(), Frame, 5))  - Point * 100, iTime(Symbol(), Frame, 5),  ObjectGetValueByTime(0, EnumToString(Frame) + "_TL.Wave-middle w1w5-Channel-Up", iTime(Symbol(), Frame, 5)) + Point * 100, clrRed, 1, false, STYLE_DASH, Is_Delete); //
          }
          if(Frame != PERIOD_M1)
          {         //
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Down-Hnext1", "", iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 1, Middle_Channel_Floor_Bar0._Price - Point * 150, iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 1, Middle_Channel_Floor_Bar0._Price + Point * 150, clrRed, 1, false, STYLE_DASH, Is_Delete);
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Up-Hnext1", "",   iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 1, Middle_Channel_Ceil_Bar0._Price  - Point * 150, iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 1,  Middle_Channel_Ceil_Bar0._Price + Point * 150, clrRed, 1, false, STYLE_DASH, Is_Delete);  //
          }
          if(Frame != PERIOD_M1)
          {         //
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Down-Hnext2", "", iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 2, Middle_Channel_Floor_Bar0._Price - Point * 150, iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 2, Middle_Channel_Floor_Bar0._Price + Point * 150, clrRed, 1, false, STYLE_DASH, Is_Delete);
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Up-Hnext2", "",   iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 2, Middle_Channel_Ceil_Bar0._Price  - Point * 150, iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 2,  Middle_Channel_Ceil_Bar0._Price + Point * 150, clrRed, 1, false, STYLE_DASH, Is_Delete);  //
          }
          if(Frame != PERIOD_M1)
          {         //
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Down-Hnext3", "", iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 3, Middle_Channel_Floor_Bar0._Price - Point * 150, iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 3, Middle_Channel_Floor_Bar0._Price + Point * 150, clrRed, 1, false, STYLE_DASH, Is_Delete);
                    C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_w1w5-Channel-Up-Hnext3", "",   iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 3, Middle_Channel_Ceil_Bar0._Price  - Point * 150, iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 3,  Middle_Channel_Ceil_Bar0._Price + Point * 150, clrRed, 1, false, STYLE_DASH, Is_Delete);  //
          }
          //----------------------------------------------------------------
          Middle_Channel_Floor_Bar0.Diff_Ask       = MathAbs(Middle_Channel_Floor_Bar0._Price - Ask);
          Middle_Channel_Ceil_Bar0.Diff_Ask        = MathAbs(Middle_Channel_Ceil_Bar0._Price - Ask);
          Middle_Channel_Floor_Bar0.Is_Touched     = ((Middle_Channel_Floor_Bar0._Price + 50 * Point) > Ask) ? true : false ;
          Middle_Channel_Ceil_Bar0.Is_Touched      = ((Middle_Channel_Ceil_Bar0._Price - 50 * Point) < Ask) ? true : false ;
          Is_OutSide_Middle_Channel_Floor_Bar0     = ((Middle_Channel_Floor_Bar0._Price + 150 * Point) < Ask) ? true : false ;
          Is_OutSide_Middle_Channel_Ceil_Bar0      = ((Middle_Channel_Ceil_Bar0._Price - 150 * Point) > Ask) ? true : false ;
          //---------------------------------------------------------------
          Is_InSide_Middle_Channel_Floor_Ceil_Bar0 = E_Void;
          if(((Middle_Channel_Floor_Bar0._Price  - 0 * Point) < Ask) &&  ((Middle_Channel_Ceil_Bar0._Price + 0 * Point) > Ask)) Is_InSide_Middle_Channel_Floor_Ceil_Bar0 = E_True;
          if(!((Middle_Channel_Floor_Bar0._Price - 0 * Point) < Ask) && !((Middle_Channel_Ceil_Bar0._Price + 0 * Point) > Ask)) Is_InSide_Middle_Channel_Floor_Ceil_Bar0 = E_False;
          //----------------------------------------------------------------
          double Cannal_Highth = MathAbs(Middle_Channel_Floor_Bar0._Price - Middle_Channel_Ceil_Bar0._Price);
          double Cannal_Highth_Thirden = Cannal_Highth / 3;  double Cannal_Highth_Ninth   = Cannal_Highth / 9;
          //
          double Middle_Channel_Floor_Bar0_Lower_Thirden         = Middle_Channel_Floor_Bar0._Price                     + Cannal_Highth_Thirden;
          double Middle_Channel_Floor_Bar0_Middle_Thirden        = Middle_Channel_Floor_Bar0_Lower_Thirden              + Cannal_Highth_Thirden;
          double Middle_Channel_Floor_Bar0_Upper_Thirden         = Middle_Channel_Floor_Bar0_Middle_Thirden             + Cannal_Highth_Thirden;
          //----------------------------------------------
          double Middle_Channel_Floor_Bar0_Lower_Lower_Ninth     = Middle_Channel_Floor_Bar0._Price                     + Cannal_Highth_Ninth;   //sum to floor every calc
          double Middle_Channel_Floor_Bar0_Lower_Middle_Ninth    = Middle_Channel_Floor_Bar0_Lower_Lower_Ninth          + Cannal_Highth_Ninth;
          double Middle_Channel_Floor_Bar0_Lower_Upper_Ninth     = Middle_Channel_Floor_Bar0_Lower_Middle_Ninth         + Cannal_Highth_Ninth;
          //
          double Middle_Channel_Floor_Bar0_Middle_Lower_Ninth    = Middle_Channel_Floor_Bar0_Lower_Upper_Ninth          + Cannal_Highth_Ninth;
          double Middle_Channel_Floor_Bar0_Middle_Middle_Ninth   = Middle_Channel_Floor_Bar0_Middle_Lower_Ninth         + Cannal_Highth_Ninth;
          double Middle_Channel_Floor_Bar0_Middle_Upper_Ninth    = Middle_Channel_Floor_Bar0_Middle_Middle_Ninth        + Cannal_Highth_Ninth;
          //
          double Middle_Channel_Floor_Bar0_Upper_Lower_Ninth     = Middle_Channel_Floor_Bar0_Middle_Upper_Ninth         + Cannal_Highth_Ninth;
          double Middle_Channel_Floor_Bar0_Upper_Middle_Ninth    = Middle_Channel_Floor_Bar0_Upper_Lower_Ninth          + Cannal_Highth_Ninth;
          double Middle_Channel_Floor_Bar0_Upper_Upper_Ninth     = Middle_Channel_Floor_Bar0_Upper_Middle_Ninth         + Cannal_Highth_Ninth;
          //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          if((Middle_Channel_Floor_Bar0._Price  < Ask)  && ( Middle_Channel_Floor_Bar0_Lower_Thirden > Ask))     { Place_Thirden  = E_Place_Thirden_Lower ;} // bettwin(floor,lower)
          if((Middle_Channel_Floor_Bar0_Lower_Thirden   < Ask)  && ( Middle_Channel_Floor_Bar0_Middle_Thirden > Ask))     { Place_Thirden  = E_Place_Thirden_Middle;}
          if((Middle_Channel_Floor_Bar0_Middle_Thirden  < Ask)  && ( Middle_Channel_Floor_Bar0_Upper_Thirden > Ask))      { Place_Thirden  = E_Place_Thirden_Upper;}
          //------------/* define ninth part of channel*/
          if((Middle_Channel_Floor_Bar0._Price          < Ask)  && ( Middle_Channel_Floor_Bar0_Lower_Lower_Ninth        > Ask)) { Place_Ninth  = E_Place_Ninth_Lower_Lower ;}
          if((Middle_Channel_Floor_Bar0_Lower_Lower_Ninth       < Ask)  && ( Middle_Channel_Floor_Bar0_Lower_Middle_Ninth       > Ask)) { Place_Ninth  = E_Place_Ninth_Lower_Middle;}
          if((Middle_Channel_Floor_Bar0_Lower_Middle_Ninth      < Ask)  && ( Middle_Channel_Floor_Bar0_Lower_Upper_Ninth        > Ask)) { Place_Ninth  = E_Place_Ninth_Lower_Upper;}
          //
          if((Middle_Channel_Floor_Bar0_Lower_Upper_Ninth       < Ask)  && ( Middle_Channel_Floor_Bar0_Middle_Lower_Ninth       > Ask)) { Place_Ninth  = E_Place_Ninth_Middle_Lower ;}
          if((Middle_Channel_Floor_Bar0_Middle_Lower_Ninth      < Ask)  && ( Middle_Channel_Floor_Bar0_Middle_Middle_Ninth      > Ask)) { Place_Ninth  = E_Place_Ninth_Middle_Middle;}
          if((Middle_Channel_Floor_Bar0_Middle_Middle_Ninth     < Ask)  && ( Middle_Channel_Floor_Bar0_Middle_Upper_Ninth       > Ask)) { Place_Ninth  = E_Place_Ninth_Middle_Upper;}
          //
          if((Middle_Channel_Floor_Bar0_Middle_Upper_Ninth      < Ask)  && ( Middle_Channel_Floor_Bar0_Upper_Lower_Ninth        > Ask)) { Place_Ninth  = E_Place_Ninth_Upper_Lower ;}
          if((Middle_Channel_Floor_Bar0_Upper_Lower_Ninth       < Ask)  && ( Middle_Channel_Floor_Bar0_Upper_Middle_Ninth       > Ask)) { Place_Ninth  = E_Place_Ninth_Upper_Middle;}
          if((Middle_Channel_Floor_Bar0_Upper_Middle_Ninth      < Ask)  && ( Middle_Channel_Floor_Bar0_Upper_Upper_Ninth        > Ask)) { Place_Ninth  = E_Place_Ninth_Upper_Upper;}
          //------------
          Is_Place_Thirden__E_Lower               =  Place_Thirden == E_Place_Thirden_Lower;
          Is_Place_Thirden__E_Middle              =  Place_Thirden == E_Place_Thirden_Middle;
          Is_Place_Thirden__E_Upper               =  Place_Thirden == E_Place_Thirden_Upper;
          //------------
          Is_Place_Ninth__E_Lower_Lower        =  Place_Ninth == E_Place_Ninth_Lower_Lower;
          Is_Place_Ninth__E_Lower_Middle       =  Place_Ninth == E_Place_Ninth_Lower_Middle;
          Is_Place_Ninth__E_Lower_Upper        =  Place_Ninth == E_Place_Ninth_Lower_Upper;
          Is_Place_Ninth__E_Middle_Lower       =  Place_Ninth == E_Place_Ninth_Middle_Lower;
          Is_Place_Ninth__E_Middle_Middle      =  Place_Ninth == E_Place_Ninth_Middle_Middle;
          Is_Place_Ninth__E_Middle_Upper       =  Place_Ninth == E_Place_Ninth_Middle_Upper;
          Is_Place_Ninth__E_Upper_Lower        =  Place_Ninth == E_Place_Ninth_Upper_Lower;
          Is_Place_Ninth__E_Upper_Middle       =  Place_Ninth == E_Place_Ninth_Upper_Middle;
          Is_Place_Ninth__E_Upper_Upper        =  Place_Ninth == E_Place_Ninth_Upper_Upper;
          //
          // Print(EnumToString(Frame), EnumToString(Place_Ninth)); ///--test ok
          ///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Draw_wave_H_lines(int WhichMode, bool IsKey, bool Is_Delete)
{         //
          ENUM_LINE_STYLE s = STYLE_DOT; //STYLE_DASH
          int w = 1;
          datetime Wavw5H_End_Time = GDS.Wave5.Z._Time + PeriodSeconds(Frame) * ShiftTime_wave_H;
          C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave0-H", "", GDS.Wave1.A._Time, GDS.Wave1.A._Price, Wavw5H_End_Time, GDS.Wave1.A._Price, clrYellow, w, false, s, Is_Delete);
          C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave1-H", "", GDS.Wave1.Z._Time, GDS.Wave1.Z._Price, Wavw5H_End_Time, GDS.Wave1.Z._Price, clrYellow, w, false, s, Is_Delete);
          C_Lines_ElliotsWave3_Wave2.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave2-H", "", GDS.Wave2.Z._Time, GDS.Wave2.Z._Price, Wavw5H_End_Time, GDS.Wave2.Z._Price, clrYellow, w, false, s, Is_Delete);
          C_Lines_ElliotsWave3_Wave3.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave3-H", "", GDS.Wave3.Z._Time, GDS.Wave3.Z._Price, Wavw5H_End_Time, GDS.Wave3.Z._Price, clrYellow, w, false, s, Is_Delete);
          C_Lines_ElliotsWave3_Wave4.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave4-H", "", GDS.Wave4.Z._Time, GDS.Wave4.Z._Price, Wavw5H_End_Time, GDS.Wave4.Z._Price, clrYellow, w, false, s, Is_Delete);
          C_Lines_ElliotsWave3_Wave5.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave5-H", "", GDS.Wave5.Z._Time, GDS.Wave5.Z._Price, Wavw5H_End_Time, GDS.Wave5.Z._Price, clrYellow, w, false, s, Is_Delete);
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Draw_Wave_Labels(int WhichMode, bool IsKey, bool Is_Delete)
{         double Diff_Price = 0;
          double Diff_Price_min = 0.25;
          Diff_Price = GDS.Wave1.Is_Bulish ? -Diff_Price_min : +Diff_Price_min;
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_(0)", EnumToString(Frame) + "_(0)", GDS.Wave1.A._Time, GDS.Wave1.A._Price + Diff_Price, clrYellow, "Arial", 10, ANCHOR_RIGHT, 0, Is_Delete); //
          //
          Diff_Price_min = 0.25;
          Diff_Price = GDS.Wave1.Is_Bulish ? +Diff_Price_min : -Diff_Price_min;
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_(1)", EnumToString(Frame) + "_(1)", GDS.Wave1.Z._Time, GDS.Wave1.Z._Price + Diff_Price, clrYellow, "Arial", 10, ANCHOR_RIGHT, 0, Is_Delete); //
          //
          Diff_Price_min = 0.25;
          Diff_Price = GDS.Wave2.Is_Bulish ? +Diff_Price_min : -Diff_Price_min;
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_(2)", EnumToString(Frame) + "_(2)", GDS.Wave2.Z._Time, GDS.Wave2.Z._Price + Diff_Price, clrYellow, "Arial", 10, ANCHOR_RIGHT, 0, Is_Delete); //
          //
          Diff_Price_min = 0.25;
          Diff_Price = GDS.Wave3.Is_Bulish ? +Diff_Price_min : -Diff_Price_min;
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_(3)", EnumToString(Frame) + "_(3)", GDS.Wave3.Z._Time, GDS.Wave3.Z._Price + Diff_Price, clrYellow, "Arial", 10, ANCHOR_RIGHT, 0, Is_Delete); //
          //
          Diff_Price_min = 0.25;
          Diff_Price = GDS.Wave4.Is_Bulish ? +Diff_Price_min : -Diff_Price_min;
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_(4)", EnumToString(Frame) + "_(4)", GDS.Wave4.Z._Time, GDS.Wave4.Z._Price + Diff_Price, clrYellow, "Arial", 10, ANCHOR_RIGHT, 0, Is_Delete); //
          //
          Diff_Price_min = 0.25;
          Diff_Price = GDS.Wave5.Is_Bulish ? +Diff_Price_min : -Diff_Price_min;
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_(5)", EnumToString(Frame) + "_(5)", GDS.Wave5.Z._Time, GDS.Wave5.Z._Price + Diff_Price, clrYellow, "Arial", 10, ANCHOR_RIGHT, 0, Is_Delete); //
          //
          Diff_Price_min = 0.25;
          Diff_Price                                   = -Diff_Price_min;
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_(Lowest)",  EnumToString(Frame) + "_(Lowest)",  GDS.Point_Lowest._Time,  GDS.Point_Lowest._Price + Diff_Price * 2, clrYellow, "Arial", 10, ANCHOR_RIGHT, 0, Is_Delete); //
          //
          Diff_Price_min = 0.25;
          Diff_Price                                   = +Diff_Price_min;
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_(Highest)",  EnumToString(Frame) + "_(Highest)", GDS.Point_Highest._Time, GDS.Point_Highest._Price + Diff_Price * 2, clrYellow, "Arial", 10, ANCHOR_RIGHT, 0, Is_Delete); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Draw_wave_H_Labels(int WhichMode, bool IsKey, bool Is_Delete)
{         //
          datetime Wavw5H_End_Time = GDS.Wave5.Z._Time + PeriodSeconds(Frame) * ShiftTime_wave_H;
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_H-(0)", EnumToString(Frame) + "_H-(0)", Wavw5H_End_Time, GDS.Wave1.A._Price, clrYellow, "Arial", 8, ANCHOR_LEFT, 0, Is_Delete); //
          //
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_H-(1)", EnumToString(Frame) + "_H-(1)", Wavw5H_End_Time, GDS.Wave1.Z._Price, clrYellow, "Arial", 8, ANCHOR_LEFT, 0, Is_Delete); //
          //
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_H-(2)", EnumToString(Frame) + "_H-(2)", Wavw5H_End_Time, GDS.Wave2.Z._Price, clrYellow, "Arial", 8, ANCHOR_LEFT, 0, Is_Delete); //
          //
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_H-(3)", EnumToString(Frame) + "_H-(3)", Wavw5H_End_Time, GDS.Wave3.Z._Price, clrYellow, "Arial", 8, ANCHOR_LEFT, 0, Is_Delete); //
          //
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_H-(4)", EnumToString(Frame) + "_H-(4)", Wavw5H_End_Time, GDS.Wave4.Z._Price, clrYellow, "Arial", 8, ANCHOR_LEFT, 0, Is_Delete); //
          //
          Cg_Texts_ElliotsWave_Shows.Description.Draw_GDS_Text(WhichMode, IsKey, EnumToString(Frame) + "_H-(5)", EnumToString(Frame) + "_H-(5)", Wavw5H_End_Time, GDS.Wave5.Z._Price, clrYellow, "Arial", 8, ANCHOR_LEFT, 0, Is_Delete); //
          //
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Update_Waves_H_Desc()
{         //
          string Desc =  "" ;
          double Diff_From_ExtermumTrend = 0;
          GDS.Highth_All = NormalizeDouble(GDS.Highth_All, Digits);
          if(GDS.Highth_All == 0) { return; }
          Diff_From_ExtermumTrend = Is_Bulish_All_Middle ? GDS.Point_Highest._Price : GDS.Point_Lowest._Price; Diff_From_ExtermumTrend = NormalizeDouble(Diff_From_ExtermumTrend, 1);
          //
          double Ratio_0_ex = ((Diff_From_ExtermumTrend - GDS.Wave1.A._Price) / GDS.Highth_All) * 100;   Ratio_0_ex = MathRound(Ratio_0_ex);
          Desc =  "(0)" + ":  " + DoubleToStr(GDS.Wave1.FiboRet_LastWave, 2) + " / " + DoubleToStr(Ratio_0_ex, 1) + "   " + (string)GDS.Wave1.A._Price + "   " + DoubleToStr(GDS.Wave1.Highth, 2) + "$";
          ObjectSetString(0,  EnumToString(Frame) + "_H-(0)", OBJPROP_TEXT, Desc);                       //Alert("GDS.Highth_All: ", GDS.Highth_All, "   ", "Ratio_0_ex: ", Ratio_0_ex, "     Diff_From_ExtermumTrend", Diff_From_ExtermumTrend); //
          //
          double Ratio_1_ex = ((Diff_From_ExtermumTrend - GDS.Wave1.Z._Price) / GDS.Highth_All) * 100;   Ratio_1_ex = MathRound(Ratio_1_ex);
          Desc =  "(1)" + ":  " + DoubleToStr(GDS.Wave1.FiboRet_LastWave, 2) + " / "  + DoubleToStr(Ratio_1_ex, 1) + "   " + (string)GDS.Wave1.Z._Price + "   " + DoubleToStr(GDS.Wave1.Highth, 2) + "$";
          ObjectSetString(0,  EnumToString(Frame) + "_H-(1)", OBJPROP_TEXT, Desc);                       //Alert("GDS.Highth_All: ", GDS.Highth_All, "   ", "Ratio_1_ex: ", Ratio_1_ex, "     Diff_From_ExtermumTrend", Diff_From_ExtermumTrend); ////
          //
          double Ratio_2_ex = ((Diff_From_ExtermumTrend - GDS.Wave2.Z._Price) / GDS.Highth_All) * 100;   Ratio_2_ex = MathRound(Ratio_2_ex);
          Desc =  "(2)" + ":  " + DoubleToStr(GDS.Wave2.FiboRet_LastWave, 2) + " / " + DoubleToStr(Ratio_2_ex, 1) + "   " + (string)GDS.Wave2.Z._Price + "   " + DoubleToStr(GDS.Wave2.Highth, 2) + "$";
          ObjectSetString(0,  EnumToString(Frame) + "_H-(2)", OBJPROP_TEXT, Desc);                       //Alert("GDS.Highth_All: ", GDS.Highth_All, "   ", "Ratio_2_ex: ", Ratio_2_ex, "     Diff_From_ExtermumTrend", Diff_From_ExtermumTrend); ////
          //
          double Ratio_3_ex = ((Diff_From_ExtermumTrend - GDS.Wave3.Z._Price) / GDS.Highth_All) * 100;   Ratio_3_ex = MathRound(Ratio_3_ex);
          Desc =  "(3)" + ":  " + DoubleToStr(GDS.Wave3.FiboRet_LastWave, 2) + " / " + DoubleToStr(Ratio_3_ex, 1) + "   " + (string)GDS.Wave3.Z._Price + "   " + DoubleToStr(GDS.Wave3.Highth, 2) + "$";
          ObjectSetString(0,  EnumToString(Frame) + "_H-(3)", OBJPROP_TEXT, Desc);                       //Alert("GDS.Highth_All: ", GDS.Highth_All, "   ", "Ratio_3_ex: ", Ratio_3_ex, "     Diff_From_ExtermumTrend", Diff_From_ExtermumTrend); ////
          //
          double Ratio_4_ex = ((Diff_From_ExtermumTrend - GDS.Wave4.Z._Price) / GDS.Highth_All) * 100;   Ratio_4_ex = MathRound(Ratio_4_ex);
          Desc =  "(4)" + ":  " + DoubleToStr(GDS.Wave4.FiboRet_LastWave, 2) + " / " + DoubleToStr(Ratio_4_ex, 1) + "   " + (string)GDS.Wave4.Z._Price + "   " + DoubleToStr(GDS.Wave4.Highth, 2) + "$";
          ObjectSetString(0,  EnumToString(Frame) + "_H-(4)", OBJPROP_TEXT, Desc);                       //Alert("GDS.Highth_All: ", GDS.Highth_All, "   ", "Ratio_4_ex: ", Ratio_4_ex, "     Diff_From_ExtermumTrend", Diff_From_ExtermumTrend); ////
          //
          double Ratio_5_ex = ((Diff_From_ExtermumTrend - GDS.Wave5.Z._Price) / GDS.Highth_All) * 100;   Ratio_5_ex = MathRound(Ratio_5_ex);
          Desc =  "(5)" + ":  " + DoubleToStr(GDS.Wave5.FiboRet_LastWave, 2) + " / " + DoubleToStr(Ratio_5_ex, 1) + "   " + (string)GDS.Wave5.Z._Price + "   " + DoubleToStr(GDS.Wave5.Highth, 2) + "$" ;
          ObjectSetString(0,  EnumToString(Frame) + "_H-(5)", OBJPROP_TEXT, Desc);                       //Alert("GDS.Highth_All: ", GDS.Highth_All, "   ", "Ratio_5_ex: ", Ratio_5_ex, "     Diff_From_ExtermumTrend", Diff_From_ExtermumTrend); ////
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Update_Waves_Desc()
{         if(Is_TrendUp_Forwarding && (GDS.Wave5.Z._Price > GDS.Wave3.Z._Price))
          {         string Desc =  "(5)" + ":" +  DoubleToStr(GDS.Wave5.FiboRet_LastWave, 2) + " : " +  DoubleToStr(GDS.Wave5.FiboRet_LastWave2, 2) + " : " + DoubleToStr(GDS.FiboRet_LastPrice__Lowest_Highest_Shape, 1);
                    ObjectSetString(0,  EnumToString(Frame) + "_(5)", OBJPROP_TEXT, Desc);//
                    ObjectSetString(0,  EnumToString(Frame) + "_(4)", OBJPROP_TEXT, EnumToString(Frame) + "_(4)" + " : " +  DoubleToStr(GDS.Wave4.FiboRet_LastWave, 2)); //
                    ObjectSetString(0,  EnumToString(Frame) + "_(3)", OBJPROP_TEXT, EnumToString(Frame) + "_(3)" + " : " +  DoubleToStr(GDS.Wave3.FiboRet_LastWave, 2)); //
                    ObjectSetString(0,  EnumToString(Frame) + "_(2)", OBJPROP_TEXT, EnumToString(Frame) + "_(2)" + " : " +  DoubleToStr(GDS.Wave2.FiboRet_LastWave, 2)); //
                    ObjectSetString(0,  EnumToString(Frame) + "_(1)", OBJPROP_TEXT, EnumToString(Frame) + "_(1)" + " : " +  DoubleToStr(GDS.Wave1.FiboRet_LastWave, 2)); //
                    //--
          }//
          int Help_Count = 0;
          if(Current_BreakOut_Up_Shift   > -1)     Help_Count = Current_BreakOut_Up_Shift;
          else if(Current_BreakOut_Down_Shift > -1)Help_Count = Current_BreakOut_Down_Shift;
          else if(Current_BreakOut_Side_Shift > -1)Help_Count = Current_BreakOut_Side_Shift; // Alert("----------Current_BreakOut_Side_Shift: ", Current_BreakOut_Side_Shift, "  Help_Count: ", Help_Count); //
          ObjectSetString(0,  EnumToString(Frame) + "_(Highest)", OBJPROP_TEXT, EnumToString(Frame) + "_(Highest)" + " : " + EnumToString(Current_Trend_Keep_TL_2_4_TL_1_3)  + " : " + EnumToString(Current_BreakOut_Type) + " : shift: "  + (string)Help_Count);//
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Draw_TLs__calc_extemum__1_3__2_4(int WhichMode, bool IsKey, bool Is_Delete)
{         //*********************************************draw tend line of extemum Trend_2_4
          GDS.Wave2.Dev_Math.Slope     = GDS.Wave2.Dev_Math.calcSlope(GDS.Wave2.Z._Price, GDS.Wave4.Z._Price, GDS.Wave2.Z._Time, GDS.Wave4.Z._Time);
          GDS.Wave2.Dev_Math.Diff_B    = GDS.Wave2.Dev_Math.GetB_LineFormule(GDS.Wave2.Dev_Math.Slope, GDS.Wave2.Z._Time, GDS.Wave2.Z._Price);
          GDS.Wave2.Dev_Math.Diff_X    = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 30;
          GDS.Wave2.Dev_Math.Diff_Y    = GDS.Wave2.Dev_Math.GetY_LineFormule(GDS.Wave2.Dev_Math.Slope, GDS.Wave2.Dev_Math.Diff_X, GDS.Wave2.Dev_Math.Diff_B);
          //------------------------------------------------------------------
          color c1 = clrGreen;
          c1 = Is_Bulish_TL_2_4 ? clrMediumSpringGreen : clrIndianRed;
          C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Trend_2_4", "", GDS.Wave2.Z._Time, GDS.Wave2.Z._Price, GDS.Wave2.Dev_Math.Diff_X, GDS.Wave2.Dev_Math.Diff_Y, c1, 1, false, STYLE_DASH, Is_Delete); //  GDS.Wave4.Z._Time, GDS.Wave4.Z._Price
          //
          //*********************************************draw tend line of extemum Trend_1_3
          GDS.Wave1.Dev_Math.Slope  = GDS.Wave1.Dev_Math.calcSlope(GDS.Wave1.Z._Price, GDS.Wave3.Z._Price, GDS.Wave1.Z._Time, GDS.Wave3.Z._Time);
          GDS.Wave1.Dev_Math.Diff_B = GDS.Wave1.Dev_Math.GetB_LineFormule(GDS.Wave1.Dev_Math.Slope, GDS.Wave1.Z._Time, GDS.Wave1.Z._Price);
          GDS.Wave1.Dev_Math.Diff_X = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 30;
          GDS.Wave1.Dev_Math.Diff_Y = GDS.Wave1.Dev_Math.GetY_LineFormule(GDS.Wave1.Dev_Math.Slope, GDS.Wave1.Dev_Math.Diff_X, GDS.Wave1.Dev_Math.Diff_B);
          //------------------------------------------------------------------
          color c2 = clrGreen;
          c2 = Is_Bulish_TL_1_3 ? clrMediumSpringGreen : clrIndianRed;
          C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Trend_1_3", "", GDS.Wave1.Z._Time, GDS.Wave1.Z._Price, GDS.Wave1.Dev_Math.Diff_X, GDS.Wave1.Dev_Math.Diff_Y, c2, 1, false, STYLE_DASH, Is_Delete); //---GDS.Wave3.Z._Time, GDS.Wave3.Z._Price
          //*********************************************draw tend line of extemum Trend_3_5
          GDS.Wave3.Dev_Math.Slope  = GDS.Wave3.Dev_Math.calcSlope(GDS.Wave3.Z._Price, GDS.Wave5.Z._Price, GDS.Wave3.Z._Time, GDS.Wave5.Z._Time);
          GDS.Wave3.Dev_Math.Diff_B = GDS.Wave3.Dev_Math.GetB_LineFormule(GDS.Wave3.Dev_Math.Slope, GDS.Wave3.Z._Time, GDS.Wave3.Z._Price);
          GDS.Wave3.Dev_Math.Diff_X = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 30;
          GDS.Wave3.Dev_Math.Diff_Y = GDS.Wave3.Dev_Math.GetY_LineFormule(GDS.Wave3.Dev_Math.Slope, GDS.Wave3.Dev_Math.Diff_X, GDS.Wave3.Dev_Math.Diff_B);
          //------------------------------------------------------------------
          color c3 = clrGreen;
          c3 = Is_Bulish_TL_3_5 ? clrMediumSpringGreen : clrIndianRed;
          C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Trend_3_5", "", GDS.Wave3.Z._Time, GDS.Wave3.Z._Price, GDS.Wave3.Dev_Math.Diff_X, GDS.Wave3.Dev_Math.Diff_Y, c3, 1, false, STYLE_DASH, Is_Delete); //---GDS.Wave3.Z._Time, GDS.Wave3.Z._Price
          //*********************************************
          //---Channeliser  Extermum__1_3   Extermum__2_4
          {         //Extermum__1_3
                    {         int _iLowest_Bar  = iLowest( NULL, Frame, MODE_LOW,  GDS.Wave1.Z._Shift - GDS.Wave3.Z._Shift, GDS.Wave3.Z._Shift);
                              int _iHighest_Bar = iHighest(NULL, Frame, MODE_HIGH, GDS.Wave1.Z._Shift - GDS.Wave3.Z._Shift, GDS.Wave3.Z._Shift) ;
                              //--off--- //Extermum_Bar_1_3._Shift  = Is_Bulish_TL_1_3                                        ? _iLowest_Bar   : _iHighest_Bar ; //
                              //--off--- Extermum_Bar_1_3._Shift  = Is_TL_2_4__Above_TL_1_3 && !Is_Bulish_TL_1_3          ? _iHighest_Bar  : _iLowest_Bar ; //
                              //--off--- Extermum_Bar_1_3._Shift  = Is_TL_2_4__Above_TL_1_3 && Is_Bulish_TL_1_3           ? _iLowest_Bar   : _iHighest_Bar; //
                              //--off--- Extermum_Bar_1_3._Shift  = !Is_TL_2_4__Above_TL_1_3 && !Is_Bulish_TL_1_3         ? _iLowest_Bar   : _iHighest_Bar; //
                              //--off--- Extermum_Bar_1_3._Shift  = !Is_TL_2_4__Above_TL_1_3 && Is_Bulish_TL_1_3          ? _iHighest_Bar  : _iLowest_Bar; //
                              //
                              Extermum_Bar_1_3._Shift  = Is_TL_2_4__Above_TL_1_3                            ? _iHighest_Bar  : _iLowest_Bar; //
                              //---Alert("Extermum_Bar_1_3._Shift: ", Extermum_Bar_1_3._Shift); //
                              double _iLowest_Bar_Low   = iLow(NULL, Frame, Extermum_Bar_1_3._Shift) ;
                              double _iHighest_Bar_High = iHigh(NULL, Frame, Extermum_Bar_1_3._Shift);
                              //Extermum_Bar_1_3._Price  = Is_Bulish_TL_1_3                                        ? _iLowest_Bar_Low   : _iHighest_Bar_High; //
                              //--off--- Extermum_Bar_1_3._Price  = Is_TL_2_4__Above_TL_1_3 && !Is_Bulish_TL_1_3          ? _iHighest_Bar_High : _iLowest_Bar_Low; //
                              //--off--- Extermum_Bar_1_3._Price  = Is_TL_2_4__Above_TL_1_3 && Is_Bulish_TL_1_3           ? _iLowest_Bar_Low   : _iHighest_Bar_High ; //
                              //--off--- Extermum_Bar_1_3._Price  = !Is_TL_2_4__Above_TL_1_3 && !Is_Bulish_TL_1_3         ? _iLowest_Bar_Low   : _iHighest_Bar_High ; //
                              //--off--- Extermum_Bar_1_3._Price  = !Is_TL_2_4__Above_TL_1_3 && Is_Bulish_TL_1_3          ? _iHighest_Bar_High : _iLowest_Bar_Low ; //
                              //
                              Extermum_Bar_1_3._Price  = Is_TL_2_4__Above_TL_1_3                            ? _iHighest_Bar_High   : _iLowest_Bar_Low; //
                              Extermum_Bar_1_3._Time   = iTime(NULL, Frame, Extermum_Bar_1_3._Shift);
                              //--correction
                              Extermum_Bar_1_3._Price  = GDS.Wave2.Z._Price;
                              Extermum_Bar_1_3._Time   = GDS.Wave2.Z._Time;
                              //--off--double Size_Channel     = MathAbs(Extermum_Bar_1_3._Price - ObjectGetValueByShift( "Lines.Trend "  + "Trend_1_3", Extermum_Bar_1_3._Shift));; //
                              //Alert("Size_Channel _1_3: ", Size_Channel); //
                              //**********************************************
                              //--off---datetime        Date2_  = GDS.Wave3.Z._Time;
                              //--off---double          Price2_ = Is_Bulish_TL_1_3 ? GDS.Wave3.Z._Price - Size_Channel : GDS.Wave3.Z._Price + Size_Channel ;
                              //**********************************************
                              GDS.Wave1.Dev_Math.Slope    = GDS.Wave1.Dev_Math.calcSlope(GDS.Wave1.Z._Price, GDS.Wave3.Z._Price, GDS.Wave1.Z._Time, GDS.Wave3.Z._Time);
                              GDS.Wave1.Dev_Math.Diff_B   = GDS.Wave1.Dev_Math.GetB_LineFormule(GDS.Wave1.Dev_Math.Slope, Extermum_Bar_1_3._Time, Extermum_Bar_1_3._Price);
                              GDS.Wave1.Dev_Math.Diff_X   = iTime(Symbol(), Frame, 0)  + PeriodSeconds(Frame) * 30;
                              GDS.Wave1.Dev_Math.Diff_Y   = GDS.Wave1.Dev_Math.GetY_LineFormule(GDS.Wave1.Dev_Math.Slope, GDS.Wave1.Dev_Math.Diff_X,  GDS.Wave1.Dev_Math.Diff_B);
                              GDS.Wave1.Dev_Math.Diff_Y2  = GDS.Wave1.Dev_Math.GetY_LineFormule(GDS.Wave1.Dev_Math.Slope, GDS.Wave1.Z._Time, GDS.Wave1.Dev_Math.Diff_B); //--GDS.Wave1.Z._Price
                              //
                              c2                          = Is_Bulish_TL_1_3 ? clrMediumSpringGreen : clrIndianRed;
                              C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Trend_1_3_Channel", "", GDS.Wave1.Z._Time, GDS.Wave1.Dev_Math.Diff_Y2, GDS.Wave1.Dev_Math.Diff_X, GDS.Wave1.Dev_Math.Diff_Y, c2, 1, false, STYLE_DOT, Is_Delete); //---GDS.Wave3.Z._Time, GDS.Wave3.Z._Price
                              //
                    }
                    // Extermum__2_4
                    {         int _iLowest_Bar  = iLowest( NULL, Frame, MODE_LOW,  GDS.Wave2.Z._Shift - GDS.Wave4.Z._Shift, GDS.Wave4.Z._Shift);
                              int _iHighest_Bar = iHighest(NULL, Frame, MODE_HIGH, GDS.Wave2.Z._Shift - GDS.Wave4.Z._Shift, GDS.Wave4.Z._Shift) ;
                              //--off--- //Extermum_Bar_2_4.Shift  = Is_Bulish_TL_2_4                                 ? _iLowest_Bar   : _iHighest_Bar; //; //
                              //--off--- Extermum_Bar_2_4.Shift  = Is_TL_2_4__Above_TL_1_3 && !Is_Bulish_TL_2_4   ? _iHighest_Bar  : _iLowest_Bar ; //
                              //--off--- Extermum_Bar_2_4.Shift  = Is_TL_2_4__Above_TL_1_3 && Is_Bulish_TL_2_4    ? _iLowest_Bar   : _iHighest_Bar ; //
                              //--off--- Extermum_Bar_2_4.Shift  = !Is_TL_2_4__Above_TL_1_3 && !Is_Bulish_TL_2_4  ? _iHighest_Bar  : _iLowest_Bar ; //
                              //--off--- Extermum_Bar_2_4.Shift  = !Is_TL_2_4__Above_TL_1_3 && Is_Bulish_TL_2_4   ? _iLowest_Bar   : _iHighest_Bar ; //
                              //
                              Extermum_Bar_2_4._Shift  = Is_TL_2_4__Above_TL_1_3                     ? _iLowest_Bar  : _iHighest_Bar; //
                              //Alert("Extermum_Bar_2_4.Shift: ", Extermum_Bar_2_4.Shift); //
                              double _iLowest_Bar_Low   = iLow(NULL,  Frame, Extermum_Bar_2_4._Shift);
                              double _iHighest_Bar_High = iHigh(NULL, Frame, Extermum_Bar_2_4._Shift);
                              //Extermum_Bar_2_4._Price  = Is_Bulish_TL_2_4                                 ? _iLowest_Bar_Low   : _iHighest_Bar_High; //
                              //--off--- Extermum_Bar_2_4._Price  = Is_TL_2_4__Above_TL_1_3 && !Is_Bulish_TL_2_4   ? _iLowest_Bar_Low   : _iHighest_Bar_High ; //
                              //--off--- Extermum_Bar_2_4._Price  = Is_TL_2_4__Above_TL_1_3 && Is_Bulish_TL_2_4    ? _iHighest_Bar_High : _iLowest_Bar_Low ; //
                              //--off--- Extermum_Bar_2_4._Price  = !Is_TL_2_4__Above_TL_1_3 && !Is_Bulish_TL_2_4  ? _iLowest_Bar_Low   : _iHighest_Bar_High ; //
                              //--off--- Extermum_Bar_2_4._Price  = !Is_TL_2_4__Above_TL_1_3 && Is_Bulish_TL_2_4   ? _iHighest_Bar_High : _iLowest_Bar_Low; //
                              //
                              Extermum_Bar_2_4._Price  = Is_TL_2_4__Above_TL_1_3                     ? _iLowest_Bar_Low : _iHighest_Bar_High; //
                              Extermum_Bar_2_4._Time   = iTime(NULL, Frame, Extermum_Bar_2_4._Shift);
                              //--correction
                              Extermum_Bar_2_4._Price  = GDS.Wave3.Z._Price;
                              Extermum_Bar_2_4._Time   = GDS.Wave3.Z._Time;
                              //--off--- double Size_Channel     = MathAbs(Extermum_Bar_2_4._Price - ObjectGetValueByShift("Lines.Trend "  + "Trend_2_4", Extermum_Bar_2_4.Shift));; //
                              //Alert("Size_Channel _2_4: ", Size_Channel); //
                              //**********************************************
                              //--off--- datetime        Date2_  = GDS.Wave4.Z._Time;
                              //--off--- double          Price2_ = Is_Bulish_TL_2_4 ? GDS.Wave4.Z._Price - Size_Channel : GDS.Wave4.Z._Price + Size_Channel ;
                              //**********************************************
                              GDS.Wave2.Dev_Math.Slope   = GDS.Wave2.Dev_Math.calcSlope(GDS.Wave2.Z._Price, GDS.Wave4.Z._Price, GDS.Wave2.Z._Time, GDS.Wave4.Z._Time);
                              GDS.Wave2.Dev_Math.Diff_B  = GDS.Wave2.Dev_Math.GetB_LineFormule(GDS.Wave2.Dev_Math.Slope, Extermum_Bar_2_4._Time, Extermum_Bar_2_4._Price);
                              GDS.Wave2.Dev_Math.Diff_X  = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 30;
                              GDS.Wave2.Dev_Math.Diff_Y  = GDS.Wave2.Dev_Math.GetY_LineFormule(GDS.Wave2.Dev_Math.Slope, GDS.Wave2.Dev_Math.Diff_X, GDS.Wave2.Dev_Math.Diff_B);
                              GDS.Wave2.Dev_Math.Diff_Y2 = GDS.Wave2.Dev_Math.GetY_LineFormule(GDS.Wave2.Dev_Math.Slope, GDS.Wave2.Z._Time, GDS.Wave2.Dev_Math.Diff_B);
                              //
                              c2                      = Is_Bulish_TL_2_4 ? clrMediumSpringGreen : clrIndianRed;
                              C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Trend_2_4_Channel", "", GDS.Wave2.Z._Time, GDS.Wave2.Dev_Math.Diff_Y2, GDS.Wave2.Dev_Math.Diff_X, GDS.Wave2.Dev_Math.Diff_Y, c2, 1, false, STYLE_DOT, Is_Delete); //---GDS.Wave3.Z._Time, GDS.Wave3.Z._Price
                              //
                    }
                    // Extermum__3_5
                    {         int _iLowest_Bar  = iLowest( NULL, Frame, MODE_LOW,  GDS.Wave3.Z._Shift - GDS.Wave5.Z._Shift, GDS.Wave5.Z._Shift);
                              int _iHighest_Bar = iHighest(NULL, Frame, MODE_HIGH, GDS.Wave3.Z._Shift - GDS.Wave5.Z._Shift, GDS.Wave5.Z._Shift) ;
                              //--off--- //Extermum_Bar_2_4.Shift  = Is_Bulish_TL_2_4                                 ? _iLowest_Bar   : _iHighest_Bar; //; //
                              //--off--- Extermum_Bar_2_4.Shift  = Is_TL_2_4__Above_TL_1_3 && !Is_Bulish_TL_2_4   ? _iHighest_Bar  : _iLowest_Bar ; //
                              //--off--- Extermum_Bar_2_4.Shift  = Is_TL_2_4__Above_TL_1_3 && Is_Bulish_TL_2_4    ? _iLowest_Bar   : _iHighest_Bar ; //
                              //--off--- Extermum_Bar_2_4.Shift  = !Is_TL_2_4__Above_TL_1_3 && !Is_Bulish_TL_2_4  ? _iHighest_Bar  : _iLowest_Bar ; //
                              //--off--- Extermum_Bar_2_4.Shift  = !Is_TL_2_4__Above_TL_1_3 && Is_Bulish_TL_2_4   ? _iLowest_Bar   : _iHighest_Bar ; //
                              //
                              Extermum_Bar_3_5._Shift  = Is_TL_3_5__Above_TL_2_4                     ? _iLowest_Bar  : _iHighest_Bar; //
                              //Alert("Extermum_Bar_2_4.Shift: ", Extermum_Bar_2_4.Shift); //
                              double _iLowest_Bar_Low   = iLow(NULL, Frame, Extermum_Bar_3_5._Shift);
                              double _iHighest_Bar_High = iHigh(NULL, Frame, Extermum_Bar_3_5._Shift);
                              //Extermum_Bar_2_4._Price  = Is_Bulish_TL_2_4                                 ? _iLowest_Bar_Low   : _iHighest_Bar_High; //
                              //--off--- Extermum_Bar_2_4._Price  = Is_TL_2_4__Above_TL_1_3 && !Is_Bulish_TL_2_4   ? _iLowest_Bar_Low   : _iHighest_Bar_High ; //
                              //--off--- Extermum_Bar_2_4._Price  = Is_TL_2_4__Above_TL_1_3 && Is_Bulish_TL_2_4    ? _iHighest_Bar_High : _iLowest_Bar_Low ; //
                              //--off--- Extermum_Bar_2_4._Price  = !Is_TL_2_4__Above_TL_1_3 && !Is_Bulish_TL_2_4  ? _iLowest_Bar_Low   : _iHighest_Bar_High ; //
                              //--off--- Extermum_Bar_2_4._Price  = !Is_TL_2_4__Above_TL_1_3 && Is_Bulish_TL_2_4   ? _iHighest_Bar_High : _iLowest_Bar_Low; //
                              //
                              Extermum_Bar_3_5._Price  = Is_TL_3_5__Above_TL_2_4                     ? _iLowest_Bar_Low : _iHighest_Bar_High; //
                              Extermum_Bar_3_5._Time   = iTime(Symbol(), Frame, Extermum_Bar_3_5._Shift);
                              //--correction
                              Extermum_Bar_3_5._Price  = GDS.Wave4.Z._Price;
                              Extermum_Bar_3_5._Time   = GDS.Wave4.Z._Time;
                              //--off--- double Size_Channel     = MathAbs(Extermum_Bar_2_4._Price - ObjectGetValueByShift("Lines.Trend "  + "Trend_2_4", Extermum_Bar_2_4.Shift));; //
                              //Alert("Size_Channel _2_4: ", Size_Channel); //
                              //**********************************************
                              //--off--- datetime        Date2_  = GDS.Wave4.Z._Time;
                              //--off--- double          Price2_ = Is_Bulish_TL_2_4 ? GDS.Wave4.Z._Price - Size_Channel : GDS.Wave4.Z._Price + Size_Channel ;
                              //**********************************************
                              GDS.Wave3.Dev_Math.Slope   = GDS.Wave3.Dev_Math.calcSlope(GDS.Wave3.Z._Price, GDS.Wave5.Z._Price, GDS.Wave3.Z._Time, GDS.Wave5.Z._Time);
                              GDS.Wave3.Dev_Math.Diff_B  = GDS.Wave3.Dev_Math.GetB_LineFormule(GDS.Wave3.Dev_Math.Slope, Extermum_Bar_3_5._Time, Extermum_Bar_3_5._Price);
                              GDS.Wave3.Dev_Math.Diff_X  = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 30;
                              GDS.Wave3.Dev_Math.Diff_Y  = GDS.Wave3.Dev_Math.GetY_LineFormule(GDS.Wave3.Dev_Math.Slope, GDS.Wave3.Dev_Math.Diff_X, GDS.Wave3.Dev_Math.Diff_B);
                              GDS.Wave3.Dev_Math.Diff_Y2 = GDS.Wave3.Dev_Math.GetY_LineFormule(GDS.Wave3.Dev_Math.Slope, GDS.Wave3.Z._Time, GDS.Wave3.Dev_Math.Diff_B);
                              //
                              c2                      = Is_Bulish_TL_2_4 ? clrMediumSpringGreen : clrIndianRed;
                              C_Lines_ElliotsWave3_Wave1.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Trend_3_5_Channel", "", GDS.Wave3.Z._Time, GDS.Wave3.Dev_Math.Diff_Y2, GDS.Wave3.Dev_Math.Diff_X, GDS.Wave3.Dev_Math.Diff_Y, c2, 1, false, STYLE_DOT, Is_Delete);  //---GDS.Wave3.Z._Time, GDS.Wave3.Z._Price
                              //
                    }
                    //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
///template<typename typer>
void C_ChannelsZigZag_Base::Draw_Wave5_Channels(int WhichMode, bool IsKey, bool Is_Delete)
{         //
          int diff_High_Shift =  GDS.Wave5.All[0].All_diff_High_Shift; //Alert(" diff_High_Shift ", diff_High_Shift, "    GDS.Wave5.All[diff_High_Shift].Diff_High ", GDS.Wave5.All[diff_High_Shift].Diff_High);
          int diff_Low_Shift  =  GDS.Wave5.All[0].All_diff_Low_Shift ;  //Alert(" diff_Low_Shift ", diff_Low_Shift, "    GDS.Wave5.All[diff_Low_Shift].Diff_Low ", GDS.Wave5.All[diff_Low_Shift].Diff_Low);
          int sz = ArraySize(GDS.Wave5.All);
          if(sz < diff_Low_Shift)  { ArrayResize(GDS.Wave5.All, sz + diff_Low_Shift ); }
          if(sz < diff_High_Shift) { ArrayResize(GDS.Wave5.All, sz + diff_High_Shift ); }
          //--Find Slope of trend line calc p1  and p2
          //
          if((ArraySize(GDS.Wave5.All) < diff_High_Shift ) || ArraySize(GDS.Wave5.All) < diff_Low_Shift) { return; }//---error
          Wave5_channel_High.Dev_Math.Slope            = Wave5_channel_High.Dev_Math.calcSlope(GDS.Wave5.A._Price + GDS.Wave5.All[diff_High_Shift].Diff_High, GDS.Wave5.Z._Price + GDS.Wave5.All[diff_High_Shift].Diff_High, GDS.Wave5.A._Time, GDS.Wave5.Z._Time);//--- Alert("GDS.Wave0_1_4_5_Middle.Z._Price: ", GDS.Wave0_1_4_5_Middle.Z._Price);
          Wave5_channel_High.Dev_Math.Diff_B           = Wave5_channel_High.Dev_Math.GetB_LineFormule(Wave5_channel_High.Dev_Math.Slope, GDS.Wave5.A._Time, GDS.Wave5.A._Price + GDS.Wave5.All[diff_High_Shift].Diff_High);
          Wave5_channel_High.Z._Time                    = Time[0] + PeriodSeconds() * 15;
          Wave5_channel_High.Z._Price                   = Wave5_channel_High.Dev_Math.GetY_LineFormule(Wave5_channel_High.Dev_Math.Slope, Wave5_channel_High.Z._Time, Wave5_channel_High.Dev_Math.Diff_B);
          C_Lines_ElliotsWave3_Wave5_High_Channel.Trend.Draw_GDS_Lines(WhichMode, IsKey, "Wave5_High_Channel_middle", "", GDS.Wave5.A._Time, GDS.Wave5.A._Price + GDS.Wave5.All[diff_High_Shift].Diff_High / 2, Wave5_channel_High.Z._Time, Wave5_channel_High.Z._Price - GDS.Wave5.All[diff_High_Shift].Diff_High / 2, clrLime, 1, false, STYLE_DASH, Is_Delete);
          //---
          Wave5_channel_Low.Dev_Math.Slope            = Wave5_channel_Low.Dev_Math.calcSlope(GDS.Wave5.A._Price + GDS.Wave5.All[diff_Low_Shift].Diff_Low, GDS.Wave5.Z._Price + GDS.Wave5.All[diff_Low_Shift].Diff_Low, GDS.Wave5.A._Time, GDS.Wave5.Z._Time);//--- Alert("GDS.Wave0_1_4_5_Middle.Z._Price: ", GDS.Wave0_1_4_5_Middle.Z._Price);
          Wave5_channel_Low.Dev_Math.Diff_B           = Wave5_channel_Low.Dev_Math.GetB_LineFormule(Wave5_channel_Low.Dev_Math.Slope, GDS.Wave5.A._Time, GDS.Wave5.A._Price + GDS.Wave5.All[diff_Low_Shift].Diff_Low);
          Wave5_channel_Low.Z._Time                    = Time[0] + PeriodSeconds() * 15;
          Wave5_channel_Low.Z._Price                   = Wave5_channel_Low.Dev_Math.GetY_LineFormule(Wave5_channel_Low.Dev_Math.Slope, Wave5_channel_Low.Z._Time, Wave5_channel_Low.Dev_Math.Diff_B);
          C_Lines_ElliotsWave3_Wave5_Low_Channel.Trend.Draw_GDS_Lines(WhichMode, IsKey, "Wave5_Low_Channel_middle", "", GDS.Wave5.A._Time, GDS.Wave5.A._Price + GDS.Wave5.All[diff_Low_Shift].Diff_Low / 2, Wave5_channel_Low.Z._Time, Wave5_channel_Low.Z._Price - GDS.Wave5.All[diff_Low_Shift].Diff_Low / 2, clrLime, 1, false, STYLE_DASH, Is_Delete);
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChannelsZigZag_Base::Draw_Wave5_Bar0_Channels(int WhichMode, bool IsKey, bool Is_Delete)           //if(GDS.Wave5.Z.Is_Lowest)
{         //if(GDS.Wave5.Z.Is_Lowest)
          {         //
                    // Alert(GDS.Wave5.name + "A is Is_Lowest", "   GDS.Wave5.A._Price    "   ,GDS.Wave5.A._Price ,"   GDS.Wave5.Z._Price    "   ,GDS.Wave5.Z._Price); //
                    {         C_Lines_ElliotsWave3_Wave5_Bar0.Trend.Draw_GDS_Lines(WhichMode, IsKey, EnumToString(Frame) + "_Wave5_Bar0", "", GDS.Wave5.Z._Time, GDS.Wave5.Z._Price, iTime(Symbol(), Frame, 0), iClose(Symbol(), Frame, 0), clrYellow, 1, false, STYLE_DOT, Is_Delete);
                              //
                              WaveX.Dev_Math.Slope            = WaveX.Dev_Math.calcSlope(iClose(Symbol(), Frame, 0), GDS.Wave5.Z._Price, iTime(Symbol(), Frame, 0), GDS.Wave5.Z._Time); //--- Alert("GDS.Wave0_1_4_5_Middle.Z._Price: ", GDS.Wave0_1_4_5_Middle.Z._Price);
                              WaveX.Dev_Math.Diff_B           = WaveX.Dev_Math.GetB_LineFormule(WaveX.Dev_Math.Slope, iTime(Symbol(), Frame, 0), iClose(Symbol(), Frame, 0));
                              WaveX.Z._Time                   = iTime(Symbol(), Frame, 0) + PeriodSeconds(Frame) * 10;
                              WaveX.Z._Price                  = WaveX.Dev_Math.GetY_LineFormule(WaveX.Dev_Math.Slope, WaveX.Z._Time, WaveX.Dev_Math.Diff_B);
                              C_Lines_ElliotsWave3_Wave5_Bar0.Trend.Draw_Channel_High_Low_By_TL(WhichMode, IsKey, Is_Delete, EnumToString(Frame) + "_Wave5_Bar0",  WaveX.Z._Time,  WaveX.Z._Price, GDS.Wave5.Z._Time, GDS.Wave5.Z._Price, clrRed, 1, false, STYLE_DASHDOTDOT, PERIOD_CURRENT, 0); //
                    }//
          }
          // else
          {         //
                    //  Alert(GDS.Wave5.name + "Z is Is_Lowest", "   GDS.Wave5.A._Price    "   ,GDS.Wave5.A._Price ,"   GDS.Wave5.Z._Price    "   ,GDS.Wave5.Z._Price); //
          } //
}
//+------------------------------------------------------------------+
//|                                          ChartObjectsElliott.mqh |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                              http://www.mql5.com |
//+------------------------------------------------------------------+
//| All Elliott tools.                                               |
//+------------------------------------------------------------------+
//#include "ChartObject.mqh"  mql5
//+------------------------------------------------------------------+
//| Class CChartObjectElliottWave3.                                  |
//| Purpose: Class of the "ElliottCorrectiveWave" object of chart.   |
//|          Derives from class CChartObject.                        |
////+------------------------------------------------------------------+
//class CChartObjectElliottWave3 : public CChartObject
//{
//public:
//          CChartObjectElliottWave3(void);
//          ~CChartObjectElliottWave3(void);
//          //--- methods of access to properties of the object
//          ENUM_ELLIOT_WAVE_DEGREE Degree(void)                           const;
//          bool              Degree(const ENUM_ELLIOT_WAVE_DEGREE degree) const;
//          bool              Lines(void)                                  const;
//          bool              Lines(const bool lines)                      const;
//          //--- method of creating the object
//          bool              Create(long chart_id, const string name, const int window,
//                                   const datetime time1, const double price1,
//                                   const datetime time2, const double price2,
//                                   const datetime time3, const double price3);
//          //--- method of identifying the object
//          virtual int       Type(void)                                   const { return(OBJ_ELLIOTWAVE3); }
//          //--- methods for working with files
//          virtual bool      Save(const int file_handle);
//          virtual bool      Load(const int file_handle); };
////+------------------------------------------------------------------+
////| Constructor                                                      |
////+------------------------------------------------------------------+
//CChartObjectElliottWave3::CChartObjectElliottWave3(void)
//{}
////+------------------------------------------------------------------+
////| Destructor                                                       |
////+------------------------------------------------------------------+
//CChartObjectElliottWave3::~CChartObjectElliottWave3(void)
//{}
////+------------------------------------------------------------------+
////| Create object "ElliottCorrectiveWave".                           |
////+------------------------------------------------------------------+
//bool CChartObjectElliottWave3::Create(long chart_id, const string name, const int window,
//                                      const datetime time1, const double price1,
//                                      const datetime time2, const double price2,
//                                      const datetime time3, const double price3)
//{         if(!ObjectCreate(chart_id, name, OBJ_ELLIOTWAVE3, window, time1, price1, time2, price2, time3, price3)) return(false);
//          if(!Attach(chart_id, name, window, 3))                                                            return(false);
////--- succeed
//          return(true); }
////+------------------------------------------------------------------+
////| Get value of the "Degree" property.                              |
////+------------------------------------------------------------------+
//ENUM_ELLIOT_WAVE_DEGREE CChartObjectElliottWave3::Degree(void) const
//{
////--- checking
//          if(m_chart_id == -1) return(WRONG_VALUE);
////--- result
//          return((ENUM_ELLIOT_WAVE_DEGREE)ObjectGetInteger(m_chart_id, m_name, OBJPROP_DEGREE)); }
////+------------------------------------------------------------------+
////| Set value for the "Degree" property.                             |
////+------------------------------------------------------------------+
//bool CChartObjectElliottWave3::Degree(const ENUM_ELLIOT_WAVE_DEGREE degree) const
//{
////--- checking
//          if(m_chart_id == -1) return(false);
////--- result
//          return(ObjectSetInteger(m_chart_id, m_name, OBJPROP_DEGREE, degree)); }
////+------------------------------------------------------------------+
////| Get value of the "Lines" property.                               |
////+------------------------------------------------------------------+
//bool CChartObjectElliottWave3::Lines(void) const
//{
////--- checking
//          if(m_chart_id == -1) return(false);
////--- result
//          return(ObjectGetInteger(m_chart_id, m_name, OBJPROP_DRAWLINES)); }
////+------------------------------------------------------------------+
////| Set value for the "Lines" property.                              |
////+------------------------------------------------------------------+
//bool CChartObjectElliottWave3::Lines(const bool lines) const
//{
////--- checking
//          if(m_chart_id == -1) return(false);
////--- result
//          return(ObjectSetInteger(m_chart_id, m_name, OBJPROP_DRAWLINES, lines)); }
////+------------------------------------------------------------------+
////| Writing parameters of object to file.                            |
////+------------------------------------------------------------------+
//bool CChartObjectElliottWave3::Save(const int file_handle)
//{         bool result;
////--- checking
//          if(file_handle <= 0) return(false);
//          if(m_chart_id == -1) return(false);
////--- writing
//          result = CChartObject::Save(file_handle);
//          if(result)
//          {         //--- writing value of the "Degree" property
//                    if(FileWriteInteger(file_handle, (int)ObjectGetInteger(m_chart_id, m_name, OBJPROP_DEGREE), INT_VALUE) != sizeof(int)) return(false);
//                    //--- writing value of the "Lines" property
//                    if(FileWriteInteger(file_handle, (int)ObjectGetInteger(m_chart_id, m_name, OBJPROP_DRAWLINES), INT_VALUE) != sizeof(int)) return(false); }
////--- result
//          return(result); }
////+------------------------------------------------------------------+
////| Reading parameters of object from file.                          |
////+------------------------------------------------------------------+
//bool CChartObjectElliottWave3::Load(const int file_handle)
//{         bool result;
////--- checking
//          if(file_handle <= 0) return(false);
//          if(m_chart_id == -1) return(false);
////--- reading
//          result = CChartObject::Load(file_handle);
//          if(result)
//          {         //--- reading value of the "Degree" property
//                    if(!ObjectSetInteger(m_chart_id, m_name, OBJPROP_DEGREE, FileReadInteger(file_handle, INT_VALUE))) return(false);
//                    //--- reading value of the "Lines" property
//                    if(!ObjectSetInteger(m_chart_id, m_name, OBJPROP_DRAWLINES, FileReadInteger(file_handle, INT_VALUE))) return(false); }
////--- result
//          return(result); }
////+------------------------------------------------------------------+
////| Class CChartObjectElliottWave5.                                  |
////| Purpose: Class of the "ElliottMotiveWave" object of chart.       |
////|          Derives from class CChartObjectElliottWave3    .        |
////+------------------------------------------------------------------+
//class CChartObjectElliottWave5 : public CChartObjectElliottWave3
//{
//public:
//          CChartObjectElliottWave5(void);
//          ~CChartObjectElliottWave5(void);
//          //--- method of creating the object
//          bool              Create(long chart_id, const string name, const int window,
//                                   const datetime time1, const double price1,
//                                   const datetime time2, const double price2,
//                                   const datetime time3, const double price3,
//                                   const datetime time4, const double price4,
//                                   const datetime time5, const double price5);
//          //--- method of identifying the object
//          virtual int       Type(void) const { return(OBJ_ELLIOTWAVE5); } };
////+------------------------------------------------------------------+
////| Constructor                                                      |
////+------------------------------------------------------------------+
//CChartObjectElliottWave5::CChartObjectElliottWave5(void)
//{}
////+------------------------------------------------------------------+
////| Destructor                                                       |
////+------------------------------------------------------------------+
//CChartObjectElliottWave5::~CChartObjectElliottWave5(void)
//{}
////+------------------------------------------------------------------+
////| Create object "ElliottMotiveWave".                               |
////+------------------------------------------------------------------+
//bool CChartObjectElliottWave5::Create(long chart_id, const string name, const int window,
//                                      const datetime time1, const double price1,
//                                      const datetime time2, const double price2,
//                                      const datetime time3, const double price3,
//                                      const datetime time4, const double price4,
//                                      const datetime time5, const double price5)
//{         if(!ObjectCreate(chart_id, name, OBJ_ELLIOTWAVE5, window, time1, price1, time2, price2, time3, price3, time4, price4, time5, price5)) return(false);
//          if(!Attach(chart_id, name, window, 5))                                                                                      return(false);
////--- succeed
//          return(true); }
////+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+



struct C_ChannelsZigZag
{         C_ChannelsZigZag()
          {         C_ChannelsZigZag_Base Current(PERIOD_CURRENT, clrYellow);      _Current = Current;
                    C_ChannelsZigZag_Base MN(PERIOD_MN1, clrWheat);               _MN      = MN;
                    C_ChannelsZigZag_Base W1(PERIOD_W1, clrKhaki);                _W1      = W1;
                    C_ChannelsZigZag_Base D1(PERIOD_D1, clrIndigo);                _D1      = D1;
                    C_ChannelsZigZag_Base H4(PERIOD_H4, clrTeal);                _H4      = H4;
                    C_ChannelsZigZag_Base H1(PERIOD_H1, clrDarkRed);                _H1      = H1;
                    C_ChannelsZigZag_Base M30(PERIOD_M30, clrCrimson);              _M30     = M30;
                    C_ChannelsZigZag_Base M15(PERIOD_M15, clrLawnGreen);              _M15     = M15;
                    C_ChannelsZigZag_Base M5(PERIOD_M5, clrCoral);                _M5      = M5;
                    C_ChannelsZigZag_Base M1(PERIOD_M1, clrYellow);                _M1      = M1; //
          };
          ~C_ChannelsZigZag() {};
          //---------------------------
          C_ChannelsZigZag_Base _Current;
          C_ChannelsZigZag_Base _MN;
          C_ChannelsZigZag_Base _W1;
          C_ChannelsZigZag_Base _D1;
          C_ChannelsZigZag_Base _H4;
          C_ChannelsZigZag_Base _H1;
          C_ChannelsZigZag_Base _M30;
          C_ChannelsZigZag_Base _M15;
          C_ChannelsZigZag_Base _M5;
          C_ChannelsZigZag_Base _M1;
          //
};
//+------------------------------------------------------------------+
