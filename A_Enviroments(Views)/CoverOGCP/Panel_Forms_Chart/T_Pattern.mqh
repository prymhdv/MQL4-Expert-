//+------------------------------------------------------------------+
//||   ||||||||||                 Ce_eBank.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
struct Stg_Data
{

          datetime      time1,  time2 ;
          double        price1, price2 ;

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct T_Pattern
{         void          __SHOW(bool b);
          Stg_Data      data[4];//
          void          Set___Shape(int WhichMode, bool IsKey, Stg_Data &d[], string name, color cx); //
          template<typename Typer> void Perido_Shows(Typer &typer, string p);
          //---
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void T_Pattern::__SHOW(bool b)
{         if(b)
          {         int Elements = ArraySize(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5);
                    for(int k = 0; k < Elements - 1; k++)
                    {         Perido_Shows(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[k].Bar_Pattern.Harmonic_Bar,    "Current "); //---
                              Perido_Shows(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_MN1[k].Bar_Pattern.Harmonic_Bar,        "MN1 "); //---
                              Perido_Shows(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_W1[k].Bar_Pattern.Harmonic_Bar,         "W1 "); //---
                              Perido_Shows(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_D1[k].Bar_Pattern.Harmonic_Bar,         "D1 "); //---
                              Perido_Shows(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H4[k].Bar_Pattern.Harmonic_Bar,         "H4 "); //---
                              Perido_Shows(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_H1[k].Bar_Pattern.Harmonic_Bar,         "H1 "); //---
                              Perido_Shows(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M30[k].Bar_Pattern.Harmonic_Bar,        "M30 "); //---
                              Perido_Shows(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M15[k].Bar_Pattern.Harmonic_Bar,        "M15 "); //---
                              Perido_Shows(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M5[k].Bar_Pattern.Harmonic_Bar,         "M5 "); //---
                              Perido_Shows(ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_M1[k].Bar_Pattern.Harmonic_Bar,         "M1 "); //---
                              //---
                    }//
          }
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void T_Pattern::Set___Shape(int WhichMode, bool IsKey, Stg_Data &d[], string name, color cx)
{         //---[----Draw Trend Lines//ExtemumPlace by indexed---]
          {         Dev_Object_Pack.Lines.Trend.GDS.Set_Action_2(WhichMode, IsKey);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Desc_1(  "Leg_One" + name );
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Location_4(d[0].time1, d[0].price1, d[0].time2, d[0].price2);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Color_1(cx);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Tip_2(STYLE_DOT, 3,false);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Common_6(false, 10, false, false, true,  "Leg_One" + name);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Chart_6();
                    Dev_Object_Pack.Lines.Trend.Action(Dev_Object_Pack.Lines.Trend);//
          }//
          //---[----Draw Trend Lines//ExtemumPlace by indexed---]
          {         Dev_Object_Pack.Lines.Trend.GDS.Set_Action_2(WhichMode, IsKey);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Desc_1(  "Leg_Two" + name );
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Location_4(d[1].time1, d[1].price1, d[1].time2, d[1].price2);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Color_1(cx);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Tip_2(STYLE_DOT, 3,false);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Common_6(false, 10, false, false, true,  "Leg_Two" + name);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Chart_6();
                    Dev_Object_Pack.Lines.Trend.Action(Dev_Object_Pack.Lines.Trend);//
          }//
          //---[----Draw Trend Lines//ExtemumPlace by indexed---]
          {         Dev_Object_Pack.Lines.Trend.GDS.Set_Action_2(WhichMode, IsKey);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Desc_1(  "Leg_There" + name );
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Location_4(d[2].time1, d[2].price1, d[2].time2, d[2].price2);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Color_1(cx);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Tip_2(STYLE_DOT, 3,false);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Common_6(false, 10, false, false, true,  "Leg_There" + name);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Chart_6();
                    Dev_Object_Pack.Lines.Trend.Action(Dev_Object_Pack.Lines.Trend);//
          }//
          //---[----Draw Trend Lines//ExtemumPlace by indexed---]
          {         Dev_Object_Pack.Lines.Trend.GDS.Set_Action_2(WhichMode, IsKey);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Desc_1(  "Leg_Four"  + name);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Location_4(d[3].time1, d[3].price1, d[3].time2, d[3].price2);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Color_1(cx);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Tip_2(STYLE_DOT, 3,false);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Common_6(false, 10, false, false, true,  "Leg_Four" + name);
                    Dev_Object_Pack.Lines.Trend.GDS.Set_Chart_6();
                    Dev_Object_Pack.Lines.Trend.Action(Dev_Object_Pack.Lines.Trend);//
          }//
          // Alert("d[3].price2 ",d[3].price1);//
} //
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename Typer>
void T_Pattern::Perido_Shows(Typer &typer, string p)
{         color cx;
          if(typer.Harmonic__ABCD.Is_ABCD)
          {         typer.Harmonic__ABCD.Is_Bulish ? cx = clrAqua : cx = clrTomato;
                    data[0].time1     = typer.Harmonic__ABCD.Line_AB._Start.Time;                     data[0].time2  = typer.Harmonic__ABCD.Line_AB._End.Time;
                    data[0].price1    = typer.Harmonic__ABCD.Line_AB._Start.Price.Start;              data[0].price2 = typer.Harmonic__ABCD.Line_AB._End.Price.End;
                    //
                    data[1].time1     = typer.Harmonic__ABCD.Line_BC._Start.Time;                     data[1].time2  = typer.Harmonic__ABCD.Line_BC._End.Time;
                    data[1].price1    = typer.Harmonic__ABCD.Line_BC._Start.Price.Start;              data[1].price2 = typer.Harmonic__ABCD.Line_BC._End.Price.End;
                    //
                    data[2].time1     = typer.Harmonic__ABCD.Line_CD._Start.Time;                     data[2].time2  = typer.Harmonic__ABCD.Line_CD._End.Time;
                    data[2].price1    = typer.Harmonic__ABCD.Line_CD._Start.Price.Start;              data[2].price2 = typer.Harmonic__ABCD.Line_CD._End.Price.End;
                    data[3].time1     = 0      ; data[3].time2         =  0     ;
                    data[3].price1    = 0      ; data[3].price2        =  0     ;
                    Set___Shape(MODE_CREATE, true, data, "Is_ABCD" + p, cx); //
          }
          if(typer.Harmonic__Butterfly.Is_Butterfly)
          {         typer.Harmonic__Butterfly.Is_Bulish ? cx = clrAqua : cx = clrTomato;
                    data[0].time1     = typer.Harmonic__Butterfly.Line_AB._Start.Time;                data[0].time2  = typer.Harmonic__Butterfly.Line_AB._End.Time;
                    data[0].price1    = typer.Harmonic__Butterfly.Line_AB._Start.Price.Start;         data[0].price2 = typer.Harmonic__Butterfly.Line_AB._End.Price.End;
                    //
                    data[1].time1     = typer.Harmonic__Butterfly.Line_BC._Start.Time;                data[1].time2  = typer.Harmonic__Butterfly.Line_BC._End.Time;
                    data[1].price1    = typer.Harmonic__Butterfly.Line_BC._Start.Price.Start;         data[1].price2 = typer.Harmonic__Butterfly.Line_BC._End.Price.End;
                    //
                    data[2].time1     = typer.Harmonic__Butterfly.Line_CD._Start.Time;                data[2].time2  = typer.Harmonic__Butterfly.Line_CD._End.Time;
                    data[2].price1    = typer.Harmonic__Butterfly.Line_CD._Start.Price.Start;         data[2].price2 = typer.Harmonic__Butterfly.Line_CD._End.Price.End;
                    //
                    data[3].time1     = typer.Harmonic__Butterfly.Line_XA._Start.Time;                data[3].time2  = typer.Harmonic__Butterfly.Line_XA._End.Time;
                    data[3].price1    = typer.Harmonic__Butterfly.Line_XA._Start.Price.Start;         data[3].price2 = typer.Harmonic__Butterfly.Line_XA._End.Price.End;
                    Set___Shape(MODE_CREATE, true, data, "Is_Butterfly" + p, cx); //
          }
          if(typer.Harmonic__Bat.Is_Bat)
          {         typer.Harmonic__Bat.Is_Bulish ? cx = clrAqua : cx = clrTomato;
                    data[0].time1     = typer.Harmonic__Bat.Line_AB._Start.Time;                      data[0].time2  = typer.Harmonic__Bat.Line_AB._End.Time;
                    data[0].price1    = typer.Harmonic__Bat.Line_AB._Start.Price.Start;               data[0].price2 = typer.Harmonic__Bat.Line_AB._End.Price.End;
                    //
                    data[1].time1     = typer.Harmonic__Bat.Line_BC._Start.Time;                      data[1].time2  = typer.Harmonic__Bat.Line_BC._End.Time;
                    data[1].price1    = typer.Harmonic__Bat.Line_BC._Start.Price.Start;               data[1].price2 = typer.Harmonic__Bat.Line_BC._End.Price.End;
                    //
                    data[2].time1     = typer.Harmonic__Bat.Line_CD._Start.Time;                      data[2].time2  = typer.Harmonic__Bat.Line_CD._End.Time;
                    data[2].price1    = typer.Harmonic__Bat.Line_CD._Start.Price.Start;               data[2].price2 = typer.Harmonic__Bat.Line_CD._End.Price.End;
                    //
                    data[3].time1     = typer.Harmonic__Bat.Line_XA._Start.Time;                      data[3].time2  = typer.Harmonic__Bat.Line_XA._End.Time;
                    data[3].price1    = typer.Harmonic__Bat.Line_XA._Start.Price.Start;               data[3].price2 = typer.Harmonic__Bat.Line_XA._End.Price.End;
                    Set___Shape(MODE_CREATE, true, data, "Is_Bat" + p, cx); //
          }
          if(typer.Harmonic__Crab.Is_Crab)
          {         typer.Harmonic__Crab.Is_Bulish ? cx = clrAqua : cx = clrTomato;
                    data[0].time1     = typer.Harmonic__Crab.Line_AB._Start.Time;                     data[0].time2  = typer.Harmonic__Crab.Line_AB._End.Time;
                    data[0].price1    = typer.Harmonic__Crab.Line_AB._Start.Price.Start;              data[0].price2 = typer.Harmonic__Crab.Line_AB._End.Price.End;
                    //
                    data[1].time1     = typer.Harmonic__Crab.Line_BC._Start.Time;                     data[1].time2  = typer.Harmonic__Crab.Line_BC._End.Time;
                    data[1].price1    = typer.Harmonic__Crab.Line_BC._Start.Price.Start;              data[1].price2 = typer.Harmonic__Crab.Line_BC._End.Price.End;
                    //
                    data[2].time1     = typer.Harmonic__Crab.Line_CD._Start.Time;                     data[2].time2  = typer.Harmonic__Crab.Line_CD._End.Time;
                    data[2].price1    = typer.Harmonic__Crab.Line_CD._Start.Price.Start;              data[2].price2 = typer.Harmonic__Crab.Line_CD._End.Price.End;
                    //
                    data[3].time1     = typer.Harmonic__Crab.Line_XA._Start.Time;                     data[3].time2  = typer.Harmonic__Crab.Line_XA._End.Time;
                    data[3].price1    = typer.Harmonic__Crab.Line_XA._Start.Price.Start;              data[3].price2 = typer.Harmonic__Crab.Line_XA._End.Price.End;
                    Set___Shape(MODE_CREATE, true, data, "Is_Crab" + p, cx); //
          }
          if(typer.Harmonic__Cypher.Is_Cypher)
          {         typer.Harmonic__Cypher.Is_Bulish ? cx = clrAqua : cx = clrTomato;
                    data[0].time1     = typer.Harmonic__Cypher.Line_AB._Start.Time;                   data[0].time2  = typer.Harmonic__Cypher.Line_AB._End.Time;
                    data[0].price1    = typer.Harmonic__Cypher.Line_AB._Start.Price.Start;            data[0].price2 = typer.Harmonic__Cypher.Line_AB._End.Price.End;
                    //
                    data[1].time1     = typer.Harmonic__Cypher.Line_BC._Start.Time;                   data[1].time2  = typer.Harmonic__Cypher.Line_BC._End.Time;
                    data[1].price1    = typer.Harmonic__Cypher.Line_BC._Start.Price.Start;            data[1].price2 = typer.Harmonic__Cypher.Line_BC._End.Price.End;
                    //
                    data[2].time1     = typer.Harmonic__Cypher.Line_CD._Start.Time;                   data[2].time2  = typer.Harmonic__Cypher.Line_CD._End.Time;
                    data[2].price1    = typer.Harmonic__Cypher.Line_CD._Start.Price.Start;            data[2].price2 = typer.Harmonic__Cypher.Line_CD._End.Price.End;
                    //
                    data[3].time1     = typer.Harmonic__Cypher.Line_XA._Start.Time;                   data[3].time2  = typer.Harmonic__Cypher.Line_XA._End.Time;
                    data[3].price1    = typer.Harmonic__Cypher.Line_XA._Start.Price.Start;            data[3].price2 = typer.Harmonic__Cypher.Line_XA._End.Price.End;
                    Set___Shape(MODE_CREATE, true, data, "Is_Cypher" + p, cx); //
          }
          if(typer.Harmonic__Gartley.Is_Gartley)
          {         typer.Harmonic__Gartley.Is_Bulish ? cx = clrAqua : cx = clrTomato;
                    data[0].time1     = typer.Harmonic__Gartley.Line_AB._Start.Time;                  data[0].time2  = typer.Harmonic__Gartley.Line_AB._End.Time;
                    data[0].price1    = typer.Harmonic__Gartley.Line_AB._Start.Price.Start;           data[0].price2 = typer.Harmonic__Gartley.Line_AB._End.Price.End;
                    //
                    data[1].time1     = typer.Harmonic__Gartley.Line_BC._Start.Time;                  data[1].time2  = typer.Harmonic__Gartley.Line_BC._End.Time;
                    data[1].price1    = typer.Harmonic__Gartley.Line_BC._Start.Price.Start;           data[1].price2 = typer.Harmonic__Gartley.Line_BC._End.Price.End;
                    //
                    data[2].time1     = typer.Harmonic__Gartley.Line_CD._Start.Time;                  data[2].time2  = typer.Harmonic__Gartley.Line_CD._End.Time;
                    data[2].price1    = typer.Harmonic__Gartley.Line_CD._Start.Price.Start;           data[2].price2 = typer.Harmonic__Gartley.Line_CD._End.Price.End;
                    //
                    data[3].time1     = typer.Harmonic__Gartley.Line_XA._Start.Time;                  data[3].time2  = typer.Harmonic__Gartley.Line_XA._End.Time;
                    data[3].price1    = typer.Harmonic__Gartley.Line_XA._Start.Price.Start;           data[3].price2 = typer.Harmonic__Gartley.Line_XA._End.Price.End;
                    Set___Shape(MODE_CREATE, true, data, "Is_Gartley" + p, cx); //
          }
          if(typer.Harmonic__Shark.Is_Shark)
          {         typer.Harmonic__Shark.Is_Bulish ? cx = clrAqua : cx = clrTomato;
                    data[0].time1     = typer.Harmonic__Shark.Line_OX._Start.Time;                    data[0].time2  = typer.Harmonic__Shark.Line_OX._End.Time;
                    data[0].price1    = typer.Harmonic__Shark.Line_OX._Start.Price.Start;             data[0].price2 = typer.Harmonic__Shark.Line_OX._End.Price.End;
                    //
                    data[1].time1     = typer.Harmonic__Shark.Line_XA._Start.Time;                    data[1].time2  = typer.Harmonic__Shark.Line_XA._End.Time;
                    data[1].price1    = typer.Harmonic__Shark.Line_XA._Start.Price.Start;             data[1].price2 = typer.Harmonic__Shark.Line_XA._End.Price.End;
                    //
                    data[2].time1     = typer.Harmonic__Shark.Line_AB._Start.Time;                    data[2].time2  = typer.Harmonic__Shark.Line_AB._End.Time;
                    data[2].price1    = typer.Harmonic__Shark.Line_AB._Start.Price.Start;             data[2].price2 = typer.Harmonic__Shark.Line_AB._End.Price.End;
                    //
                    data[3].time1     = typer.Harmonic__Shark.Line_BC._Start.Time;                    data[3].time2  = typer.Harmonic__Shark.Line_BC._End.Time;
                    data[3].price1    = typer.Harmonic__Shark.Line_BC._Start.Price.Start;             data[3].price2 = typer.Harmonic__Shark.Line_BC._End.Price.End;
                    Set___Shape(MODE_CREATE, true, data, "Is_Shark" + p, cx); //
          } //
          if(typer.Harmonic__3Drives.Is_3Drives)
          {         typer.Harmonic__3Drives.Is_Bulish ? cx = clrAqua : cx = clrTomato;
                    data[0].time1     = typer.Harmonic__3Drives.Line_O1._Start.Time;                  data[0].time2  = typer.Harmonic__3Drives.Line_O1._End.Time;
                    data[0].price1    = typer.Harmonic__3Drives.Line_O1._Start.Price.Start;           data[0].price2 = typer.Harmonic__3Drives.Line_O1._End.Price.End;
                    //
                    data[1].time1     = typer.Harmonic__3Drives.Line_O2._Start.Time;                  data[1].time2  = typer.Harmonic__3Drives.Line_O2._End.Time;
                    data[1].price1    = typer.Harmonic__3Drives.Line_O2._Start.Price.Start;           data[1].price2 = typer.Harmonic__3Drives.Line_O2._End.Price.End;
                    //
                    data[2].time1     = typer.Harmonic__3Drives.Line_C2._Start.Time;                  data[2].time2  = typer.Harmonic__3Drives.Line_C2._End.Time;
                    data[2].price1    = typer.Harmonic__3Drives.Line_C2._Start.Price.Start;           data[2].price2 = typer.Harmonic__3Drives.Line_C2._End.Price.End;
                    //
                    data[3].time1     = typer.Harmonic__3Drives.Line_C3._Start.Time;                  data[3].time2  = typer.Harmonic__3Drives.Line_C3._End.Time;
                    data[3].price1    = typer.Harmonic__3Drives.Line_C3._Start.Price.Start;           data[3].price2 = typer.Harmonic__3Drives.Line_C3._End.Price.End;
                    Set___Shape(MODE_CREATE, true, data, "Is_3Drives" + p, cx); //
          }
          if(typer.Harmonic__5Drives.Is_5Drives)
          {         typer.Harmonic__5Drives.Is_Bulish ? cx = clrAqua : cx = clrTomato;
                    data[0].time1     = typer.Harmonic__5Drives.Line_AB._Start.Time;                  data[0].time2  = typer.Harmonic__5Drives.Line_AB._End.Time;
                    data[0].price1    = typer.Harmonic__5Drives.Line_AB._Start.Price.Start;           data[0].price2 = typer.Harmonic__5Drives.Line_AB._End.Price.End;
                    //
                    data[1].time1     = typer.Harmonic__5Drives.Line_BC._Start.Time;                  data[1].time2  = typer.Harmonic__5Drives.Line_BC._End.Time;
                    data[1].price1    = typer.Harmonic__5Drives.Line_BC._Start.Price.Start;           data[1].price2 = typer.Harmonic__5Drives.Line_BC._End.Price.End;
                    //
                    data[2].time1     = typer.Harmonic__5Drives.Line_CD._Start.Time;                  data[2].time2  = typer.Harmonic__5Drives.Line_CD._End.Time;
                    data[2].price1    = typer.Harmonic__5Drives.Line_CD._Start.Price.Start;           data[2].price2 = typer.Harmonic__5Drives.Line_CD._End.Price.End;
                    //
                    data[3].time1     = typer.Harmonic__5Drives.Line_OX._Start.Time;                  data[3].time2  = typer.Harmonic__5Drives.Line_OX._End.Time;
                    data[3].price1    = typer.Harmonic__5Drives.Line_OX._Start.Price.Start;           data[3].price2 = typer.Harmonic__5Drives.Line_OX._End.Price.End;
                    Set___Shape(MODE_CREATE, true, data, "Is_5Drives" + p, cx); //
          } //
}//
