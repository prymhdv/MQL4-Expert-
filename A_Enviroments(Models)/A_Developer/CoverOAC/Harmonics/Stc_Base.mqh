//+------------------------------------------------------------------+
//||   ||||||||||     Stc_CandlePattern__Harmonic_Shape_ABCD.mqh    ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
// #include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.CoverOG.mqh>

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#property strict
struct Stc_Point_Price
{         double    Open;
          double     Close;
          double     High;
          double     Low; //
          double     Start;
          double     End; ///

};

struct Stc_Point
{         //
          Stc_Point_Price    Price;
          datetime           Time;
          //-------------
          int        BarNumber;//
          double     Fractal_Value; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
struct Stc_CandlePattern__Harmonic_Path_data
{         //---

          Stc_Point             _Start;
          Stc_Point             _End;//
          double                Lenght;
          double                Height;  //   _Start_High - _End_Low
          //---
          //double High_OX_Path;    //--- if DownWard -> High(Highest)  //--- if UpWard -> Low(Lowest)
          //double High_AB_Path;
          //double High_BC_Path;
          //double High_CD_Path;
};
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
struct Stc_CandlePattern__Harmonic_Shape_Base
{         //---
          void          Stc_CandlePattern__Harmonic_Shape_Base()  { Rang_Zigzag = ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.ViewRange + 100; } //---for catch 199 bat  200;  ct_Conductor.CandleBars.ViewRange
          int           ZigZag_Shift[];
          int           Rang_Zigzag;// = 100;
          void          Calc__Zigzag__Points( int Rang_zzigzag, ENUM_TIMEFRAMES f, int mul);
          //template<typename Typer> void __Calc__Lines(Typer & Path_data, int Start, int End, ENUM_TIMEFRAMES f);  // '__Calc__Lines<Stc_CandlePattern…' - cannot to apply template  Stc_CandlePattern__Harmonic.mqh         125       41

          void          __Calc__Lines(Stc_CandlePattern__Harmonic_Path_data & Path_data, ENUM_TIMEFRAMES f, int Start, int End);
          bool          Is_Perfect;// = false;
          bool          Is_Bulish;//
          //===
          bool          Is_Zigzag_Source;
///

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//void Stc_CandlePattern__Harmonic_Shape_Base::Stc_CandlePattern__Harmonic_Shape_Base()
//{         Rang_Zigzag = 100; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_Base::Calc__Zigzag__Points( int Rang_zzigzag, ENUM_TIMEFRAMES f, int mul)
{         int       ExtDepth        = 12 * mul;
          int       ExtDeviation    = 5 * mul;
          int       ExtBackstep     = 3 * mul;
          double    ZigZag_Value[];//   = 0;
          datetime  ZigZag_Time[]; //    = 0;
          //
          ArrayResize(ZigZag_Value, Rang_zzigzag);
          ArrayResize(ZigZag_Time,  Rang_zzigzag);
          ArrayResize(ZigZag_Shift, Rang_zzigzag);
          //
          int       ZigZag_Shift_Counter    = 0;
          bool      Is_Inside_Range = false;
          ArrayInitialize(ZigZag_Shift, 0);
          int Shift = 0;
          //if(!Detect_NewBar._M1.CBT__HalfMinute.Is_NewBar)return;
          for(Shift; Shift < Rang_zzigzag - 1; Shift++)
          {         double ZigZag_Value_Get = iCustom(NULL, f, "ZigZag", ExtDepth, ExtDeviation, ExtBackstep, 0, Shift);
                    if( ZigZag_Value_Get != 0)
                    {         ZigZag_Value[Shift]                   = ZigZag_Value_Get;
                              ZigZag_Time[Shift]                    = iTime( NULL, f, Shift);
                              ZigZag_Shift[ZigZag_Shift_Counter++]  = Shift;
                              //
                    }
                    continue;
                    //---
                    //---
          }
          if(ZigZag_Shift[4] > Rang_zzigzag) Is_Inside_Range = true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__Harmonic_Shape_Base::__Calc__Lines(Stc_CandlePattern__Harmonic_Path_data & Path_data, ENUM_TIMEFRAMES f, int fStart, int fEnd)
{         //Line_AB = FIND__BC_Cordinate(f);
          int _Start_Place                  = ZigZag_Shift[fStart];
          Path_data._Start.Price.High         = iHigh(        NULL, f, _Start_Place);
          Path_data._Start.Price.Open         = iOpen(        NULL, f, _Start_Place);
          Path_data._Start.Price.Close        = iClose(       NULL, f, _Start_Place);
          Path_data._Start.Price.Low          = iLow(         NULL, f, _Start_Place);
          Path_data._Start.Time               = iTime(        NULL, f, _Start_Place);
          Path_data._Start.BarNumber          = iBarShift(    NULL, f, Path_data._Start.Time);
          //---
          int _End_Place                    = ZigZag_Shift[fEnd];;
          Path_data._End.Price.High           = iHigh(        NULL, f, _End_Place);
          Path_data._End.Price.Open           = iOpen(        NULL, f, _End_Place);
          Path_data._End.Price.Close          = iClose(       NULL, f, _End_Place);
          Path_data._End.Price.Low            = iLow(         NULL, f, _End_Place);
          Path_data._End.Time                 = iTime(        NULL, f, _End_Place);
          Path_data._End.BarNumber            = iBarShift(    NULL, f, Path_data._End.Time);
          //
          //if(ObjectCreate(0,  "test Leg AB", OBJ_TREND, 0, Line_AB._Start.Time, Line_AB._Start.Price.Close, Line_AB._End.Time, Line_AB._End.Price.Close )) Cat.s("AB_Start_Place: " + AB_Start_Place + "   AB_End_Place :" + AB_End_Place   +  "  is created tend  " + "  ct_Start.Price.Close " + Line_AB._Start.Time +  "  ct_Start.Price.Close " + Line_AB._Start.Price.Close + "   ct_End.Time " + Line_AB._End.Time + "  _End.Price.Close " + Line_AB._End.Price.Close  );
          //
          Is_Bulish                         = Path_data._End.Price.High    >  Path_data._Start.Price.High;
          //
          if(Is_Bulish)      {Path_data.Height = Path_data._End.Price.High    -  Path_data._Start.Price.Low;}
          else               {Path_data.Height = Path_data._Start.Price.High  -  Path_data._End.Price.Low; }//
          //--
          if(Is_Bulish)      {Path_data._Start.Price.Start = Path_data._Start.Price.Low;}
          else               {Path_data._Start.Price.Start = Path_data._Start.Price.High;}
          //
          if(Is_Bulish)      {Path_data._End.Price.End     = Path_data._End.Price.High;}
          else               {Path_data._End.Price.End     = Path_data._End.Price.Low;}
          //
}
//+------------------------------------------------------------------+
