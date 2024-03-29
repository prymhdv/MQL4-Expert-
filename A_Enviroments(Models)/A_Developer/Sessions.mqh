//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\.CoverOGC.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
enum E_Location
{         Sydney,
          Tokyo,
          London,
          Newyork //
};

struct St_Sessions
{         St_Sessions() {};
          ~St_Sessions() {};
          Cgs_DevObjectPack Object_Pack;
          E_Location Location;
          void       Update()
          {         MqlDateTime   str1;
                    datetime      times = TimeGMT(str1); //
                    int           InpHour          = TimeHour(TimeGMT());
                    int           InpMinute        = TimeMinute(TimeGMT()); //
                    datetime      StartDAY         = iTime(Symbol(), PERIOD_D1, 0); StartDAY += 3 * 60 * PeriodSeconds(PERIOD_M1); //
                    datetime      StartDAY1        = iTime(Symbol(), PERIOD_D1, 1); StartDAY1 += 3 * 60 * PeriodSeconds(PERIOD_M1); //
                    //double        diffGMTSvsSERVER = MathAbs(TimeGMT() - TimeCurrent()); // TimeGMTOffset() 3:00 h
                    //Print(TimeToString(diffGMTSvsSERVER));
                    //
                    if( ((22  < InpHour) || (7  > InpHour)))  Location = Sydney;  //sydney
                    if( ((23  < InpHour) || (7  > InpHour)))  Location = Sydney;
                    if( (23   < InpHour) || (8  > InpHour))   Location = Tokyo;   //Asian Session          Tokyo     11 p.m. to 8 a.m.
                    if( (6    < InpHour) && (8  > InpHour))   Location = Tokyo;   ///grater than 6:59 mean 7 6end //&& (59 < InpMinute)
                    if( (6    < InpHour) && (16 > InpHour))   Location = London;  //European Session       London    7 a.m. to 4 p.m.
                    if( (11.5 < InpHour) && (16 > InpHour))   Location = London;  //European Session       London    7 a.m. to 4 p.m. // && (29 < InpMinute)
                    if( (11.5 < InpHour) && (20 > InpHour))   Location = Newyork; //North American Session       New York  noon to 8 p.m.
                    //------------------------------------------------------------------------------------------------------------------------------------------- 24  * 60 * PeriodSeconds(PERIOD_M1)
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, 0, "Rect." +  "Sydney",  "Rect." + EnumToString(Location), false, TimeHour(TimeGMT() + 22 * 60 * PeriodSeconds()), WindowPriceMin() + 36 * Point(), TimeHour(TimeGMT() + 7 * 60 * PeriodSeconds()), WindowPriceMin() + 48 * Point(), clrRed,    true); //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, 0, "Rect." +  "Tokyo",   "Rect." + EnumToString(Location), false, TimeHour(TimeGMT() + 21 * 60 * PeriodSeconds()), WindowPriceMin() + 24 * Point(), TimeHour(TimeGMT() + 22 * 60 * PeriodSeconds()), WindowPriceMin() + 36 * Point(), clrYellow, true); //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, 0, "Rect." +  "London",  "Rect." + EnumToString(Location), false, TimeHour(TimeGMT() + 6 * 60 * PeriodSeconds()), WindowPriceMin() + 12 * Point(), TimeHour(TimeGMT() + 16 * 60 * PeriodSeconds()), WindowPriceMin() + 24 * Point(), clrGreen,  true); //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, 0, "Rect." +  "Newyork", "Rect." + EnumToString(Location), false, TimeHour(TimeGMT() + 11 * 60 * PeriodSeconds()), WindowPriceMin() + 0 * Point(), TimeHour(TimeGMT() + 19 * 60 * PeriodSeconds()), WindowPriceMin() + 12 * Point(), clrAzure,  true); //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, 0, "Rect." +  "Sydney1",  "Rect." + EnumToString(Location) + " Sydney1 "  + TimeToString(TimeGMT()), false,  StartDAY1 + 22 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36  * Point(), StartDAY1 + 22 * 60 * PeriodSeconds(PERIOD_M1) + 7 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 48 * Point(), clrRed,    true);   //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, 0, "Rect." +  "Tokyo1",   "Rect." + EnumToString(Location) + " Tokyo1"    + TimeToString(TimeGMT()), false,  StartDAY1 + 23 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 24 * Point(), StartDAY1 + 23 * 60 * PeriodSeconds(PERIOD_M1) + 9 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36 * Point(), clrYellow, true);   //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, 0, "Rect." +  "London1",  "Rect." + EnumToString(Location) + " London1 "  + TimeToString(TimeGMT()), false,  StartDAY1 + 7  * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 12 * Point(), StartDAY1 + 7  * 60 * PeriodSeconds(PERIOD_M1) + 9 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 24 * Point(), clrGreen,  true);   //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, 0, "Rect." +  "Newyork1", "Rect." + EnumToString(Location) + " Newyork1 " + TimeToString(TimeGMT()), false,  StartDAY1 + 12 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 0 * Point(), StartDAY1 + 12 * 60 * PeriodSeconds(PERIOD_M1) + 8 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 12 * Point(), clrDodgerBlue,  true);   //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, 0, "Rect." +  "Sydney2",  "Rect." + EnumToString(Location) + " Sydney1 "  + TimeToString(TimeGMT()), false,  StartDAY1, WindowPriceMin() + 75  * Point(), StartDAY1 + 5 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 100 * Point(), clrRed,    true);    //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, 0, "Rect." +  "Tokyo2",   "Rect." + EnumToString(Location) + " Tokyo1"    + TimeToString(TimeGMT()), false,  StartDAY1, WindowPriceMin() + 50 * Point(), StartDAY1 + 8 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 75 * Point(), clrYellow, true);    //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, 0, "Rect." +  "Sydney3",  "Rect." + EnumToString(Location) + " Sydney1 "  + TimeToString(TimeGMT()), false,  StartDAY1, WindowPriceMin() + 25  * Point(), StartDAY1 + 5 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 50 * Point(), clrRed,    true);    //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, 0, "Rect." +  "Tokyo3",   "Rect." + EnumToString(Location) + " Tokyo1"    + TimeToString(TimeGMT()), false,  StartDAY1, WindowPriceMin() + 0 * Point(), StartDAY1 + 8 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 25 * Point(), clrYellow, true);    //
                    //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, 0, "DescriptionSessions[Sydney1].",  TimeToString((StartDAY1 + 21 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY1 + 21 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 48 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, 0, "DescriptionSessions[Tokyo1].",   TimeToString((StartDAY1 + 23 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY1 + 23 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, 0, "DescriptionSessions[London1].",  TimeToString((StartDAY1 + 7 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY1 + 7 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 24 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, 0, "DescriptionSessions[Newyork1].", TimeToString((StartDAY1 + 12 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY1 + 12 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 12 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, 0, "DescriptionSessions[Sydney].",  TimeToString((StartDAY + 21 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY + 21 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 48 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, 0, "DescriptionSessions[Tokyo].",   TimeToString((StartDAY + 23 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY + 23 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, 0, "DescriptionSessions[London].",  TimeToString((StartDAY + 7 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY + 7 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 24 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, 0, "DescriptionSessions[Newyork].", TimeToString((StartDAY + 12 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY + 12 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 12 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    //
                    if(TimeDayOfWeek(TimeCurrent()) == 1)
                    {         Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, true, "Rect." +  "Sydney2",  "Rect." + EnumToString(Location) + " Sydney1 "  + TimeToString(TimeGMT()), false,  StartDAY1 - 3 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36  * Point(), StartDAY1 + 6 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 48 * Point(), clrRed,    true);   //
                              Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, true, "Rect." +  "Tokyo2",   "Rect." + EnumToString(Location) + " Tokyo1"    + TimeToString(TimeGMT()), false,  StartDAY1 - 3 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 24 * Point(), StartDAY1 + 8 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36 * Point(), clrYellow, true);    //
                    }
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, true, "Rect." +  "Sydney1",  "Rect." + EnumToString(Location) + " Sydney1 "  + TimeToString(TimeGMT()), false,  StartDAY1 + 21 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36  * Point(), StartDAY1 + 21 * 60 * PeriodSeconds(PERIOD_M1) + 9 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 48 * Point(), clrRed,    true);   //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, true, "Rect." +  "Tokyo1",   "Rect." + EnumToString(Location) + " Tokyo1"    + TimeToString(TimeGMT()), false,  StartDAY1 + 23 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 24 * Point(), StartDAY1 + 23 * 60 * PeriodSeconds(PERIOD_M1) + 9 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36 * Point(), clrYellow, true);   //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, true, "Rect." +  "London1",  "Rect." + EnumToString(Location) + " London1 "  + TimeToString(TimeGMT()), false,  StartDAY1 + 7  * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 12 * Point(), StartDAY1 + 7  * 60 * PeriodSeconds(PERIOD_M1) + 9 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 24 * Point(), clrGreen,  true);   //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, true, "Rect." +  "Newyork1", "Rect." + EnumToString(Location) + " Newyork1 " + TimeToString(TimeGMT()), false,  StartDAY1 + 12 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 0 * Point(), StartDAY1 + 12 * 60 * PeriodSeconds(PERIOD_M1) + 9 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 12 * Point(), clrDodgerBlue,  true);   //
                    //
                    if(TimeDayOfWeek(TimeCurrent()) == 1)
                    {         Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, true, "Rect." +  "Sydney3",  "Rect." + EnumToString(Location) + " Sydney1 "  + TimeToString(TimeGMT()), false,  StartDAY - 3 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36  * Point(), StartDAY + 6 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 48 * Point(), clrRed,    true);   //
                              Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, true, "Rect." +  "Tokyo3",   "Rect." + EnumToString(Location) + " Tokyo1"    + TimeToString(TimeGMT()), false,  StartDAY - 3 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 24 * Point(), StartDAY + 8 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36 * Point(), clrYellow, true);   //
                    }
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, true, "Rect." +  "Sydney",  "Rect." + EnumToString(Location) + " Sydney "  + TimeToString(TimeGMT()), false,  StartDAY + 21 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36  * Point(), StartDAY + 21 * 60 * PeriodSeconds(PERIOD_M1) + 9 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 48 * Point(), clrRed,    true);   //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, true, "Rect." +  "Tokyo",   "Rect." + EnumToString(Location) + " Tokyo"    + TimeToString(TimeGMT()), false,  StartDAY + 23 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 24 * Point(), StartDAY + 23 * 60 * PeriodSeconds(PERIOD_M1) + 9 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36 * Point(), clrYellow, true);   //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, true, "Rect." +  "London",  "Rect." + EnumToString(Location) + " London "  + TimeToString(TimeGMT()), false,  StartDAY + 7  * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 12 * Point(), StartDAY + 7  * 60 * PeriodSeconds(PERIOD_M1) + 9 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 24 * Point(), clrGreen,  true);   //
                    Object_Pack.Shapes.Rectangle.Draw_GDS(MODE_CREATE, true, "Rect." +  "Newyork", "Rect." + EnumToString(Location) + " Newyork " + TimeToString(TimeGMT()), false,  StartDAY + 12 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 0 * Point(), StartDAY + 12 * 60 * PeriodSeconds(PERIOD_M1) + 9 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 12 * Point(), clrDodgerBlue,  true);   //
                    //---------iTime(Symbol(), PERIOD_M1, 0)
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, true, "DescriptionSessions[Sydney1].",  TimeToString((StartDAY1 + 21 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY1 + 21 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 48 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, true, "DescriptionSessions[Tokyo1].",   TimeToString((StartDAY1 + 23 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY1 + 23 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, true, "DescriptionSessions[London1].",  TimeToString((StartDAY1 + 7 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY1 + 7 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 24 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, true, "DescriptionSessions[Newyork1].", TimeToString((StartDAY1 + 12 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY1 + 12 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 12 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, true, "DescriptionSessions[Sydney].",  TimeToString((StartDAY + 21 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY + 21 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 48 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, true, "DescriptionSessions[Tokyo].",   TimeToString((StartDAY + 23 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY + 23 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 36 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, true, "DescriptionSessions[London].",  TimeToString((StartDAY + 7 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY + 7 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 24 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    Object_Pack.Texts.DescriptionSessions.Draw_GDS_Text(MODE_CREATE, true, "DescriptionSessions[Newyork].", TimeToString((StartDAY + 12 * 60 * PeriodSeconds(PERIOD_M1)) - TimeCurrent(), TIME_SECONDS), StartDAY + 12 * 60 * PeriodSeconds(PERIOD_M1), WindowPriceMin() + 12 * Point(), clrYellow, "Arial", 8, ANCHOR_CENTER, 0, false); //
                    //
          }
          //----------------------------
};
//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
