//+------------------------------------------------------------------+
//|                                                 C_UTILITIES .mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
// #include <.RTL_Prymhdv\QuartsExperts\Base01\.Base01.mqh> //---Check Dependency
class Cd_UTILITIES_Switch
{
public:
          bool                  Bool(bool &boolCom)             { if(boolCom) {boolCom = false ;} else {boolCom = true;} return true;    /*return boolCom = boolCom ? false : true;*/ }
          bool                  BoolValue(bool &boolCom)        { if(boolCom) {boolCom = false ;} else {boolCom = true;} return boolCom;}
          //
}; Cd_UTILITIES_Switch UTILITIES_Switch; Cd_UTILITIES_Switch USwitchValue;
//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+      //if(Utilities.OnTimer_ExecuteONPulse(1,10)) // while(1 && !Utilities.OnTimer_ExecuteONPulse(1,2));

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_UTILITIES
{
private:

public:
          ///friend calss ErrorController;
          //  virtual ///for implantion func in children class derived
          void                  C_UTILITIES ();
          void                  ~C_UTILITIES ();
          bool                  Update();
          bool                  UPDATED;
//=====================================================================Utilities.PrintAndComment
          //---------------------------------------------------------------------------------------------------------------------------------
          double                DescToDouble(string ObjName);
          //---
          color                 sRGB_045_026_033();
          int                   TransparentColor();
          //---
          void                  PrintAndComment(string par_text) {/*Print and show comment of text*/Print ( par_text ); Comment ( par_text ); }
          string                MultiLine_ ;//= /*SRTING CONTROLING*/StringConcatenate("This is a multi-line statement. ", "For clarity, we will indent multiple lines in this book"); ///LINK BY , EVERY PART ULES UE + FOR ANY
          void                  ControlBlock() { bool Compound = false; if(Compound == true) {/* /////////USE OF CONTROL BLOCKS////////////  */Print("This is a compound expression");}; }
//=====================================================================
          color                 RandomColor(bool KeyRun = false);
          color                 TextOuter();
          static void           SetRunColors(string nameX = "none");///>>>>BINGOO//there is object in class block..defined by class global Scope..no error of access.
//=====================================================================


          static string         ±Str(double Inp, int Precision);
          static color          ±Clr(double Inp, color clrDef = clrGray);; ///PanelController & ///static updation before existing..///bu re place after pannel defining..
          color                 ±ClrGMT(string Location, color colorDef = clrYellow); //---static
///====================================================================
          string                FormatDouble(const string number, const int digits = 2);//
          string                ValueSeprate(double ValueCom, int digitCom, string ValueDesc = "~~");
#define LOTSO double

          string                lots_as_string(LOTSO lots);
          int                   digits_in(double d);
          int                   DigitsIn(double d);
          int                   CountDigits(double val);
          int                   CountDigits3(double val, int maxPrecision = 8);
          int                   CountDigits4(double val, int maxPrecision = 8);
          int                   DigitsCount6(double number);
          int                   CountDigits2(double val);
          double                Round(const double value, const double digits, bool round_down = false);
          int                   CountDecimalPlaces(double number);//
          int                   GetPrecision(double ValueCom);
          string                DoubleToStrMorePrecisionX(double number, int precision);
          bool                  StringToStringArray(string DescCom, string & DescOutArray[]);
          int                   StringFindRev(string Str, string Find);
          void                  Capitan_TestBarExisted();
          bool                  StringLieraled(string NameCom = "none");//
          bool                  StringDigited(string NameCom = "none" );//
          //=====================================================================
          bool                  Set_Color(string Name, color Color);//
          //=====================================================================

          string                NameTimeFrame(ENUM_TIMEFRAMES f_timeFrame); // przedział czasowy
          string                NameTypePrice(ENUM_APPLIED_PRICE f_typePrice); // typ ceny
          string                NameTypeTradeOperation(int f_typeOperation); // typ operacji handlowej
          string                NameWeekDay(ENUM_DAY_OF_WEEK f_weekDay); // dzień tygodnia
          //=====================================================================
          string                TimeFrameToString(ENUM_TIMEFRAMES  PeriodTMCom ); //_Period);//int PeriodCom///"CURRENT"   "M1"   "M5"    "M15"   "M30"   "H1"   "H4"  "D1"   "W1"   "MN1";
          bool                  TimeFrameUpdating();
          bool                  UpdatesAllTimeFrame();
          //=====================================================================

//=============================================================

//=============================================================
          //
};
//+------------------------------------------------------------------+
//|          IMPLANTING CLASS  Utilities BEGIN                       |
//+------------------------------------------------------------------+
C_UTILITIES::C_UTILITIES ()
{         //Alert("C_UTILITIES::C_UTILITIES ()");
          RunCallFunction++;///////////////////////////////
          //---
          //---
          //---
          //---
          //---
///////////////////////////////////////////////////////////////////
          //________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_UTILITIES::~C_UTILITIES ()
{         //
          // if(Capitan_DeinitErrorCatching)________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_UTILITIES::Update()
{         UPDATED = false;
          //==========================================================
          // SYS Timer Cheackup Start C_WINUSER32 App Enviroments<<<<|
          //==========================================================
          //
          UPDATED = true;
          //
          //==========================================================
          // SYS Timer Cheackup End C_WINUSER32 App Enviroments<<<<<<|
          //==========================================================
          if(!this.UPDATED)       {Alert("Utilities.UPDATED: ", this.UPDATED);}
          return UPDATED;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double C_UTILITIES::DescToDouble(string ObjName)
{         return StringToDouble(ObjectGetString(0,  ObjName, OBJPROP_TEXT));//
}

//+------------------------------------------------------------------+
//| RandomColor                                                      |
//+------------------------------------------------------------------+
color C_UTILITIES::RandomColor(bool KeyRun = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
//--
          int p1 = 0; //
          int p2 = 0; //
          int p3 = 0; //
          if(KeyRun)
          {
//--
                    p1 = 150 + 255 * MathRand() / 32768;///Integer value within the range of 0 to 32767.
                    p2 = 250 + 255 * MathRand() / 32768;
                    p3 = 350 + 255 * MathRand() / 32768;
//--
//p1  ^= ~p3 >> (~p3 | p1);
//p2  ^= ~p1 << ~p2 ;
//p3  ^= ~p2 & ~p1;
//////////////////
//p1  = p3 >> 8;
//p2  = p1 << 8;
//p3  = p2 << 8;//
          }
          else
          {         p1 = 0 + 255 * MathRand() / 32768;
                    p2 = 0 + 255 * MathRand() / 32768;
                    p3 = 0 + 255 * MathRand() / 32768; //
          } //
//--
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return(StringToColor(IntegerToString(p1) + "," + IntegerToString(p2) + "," + IntegerToString(p3)));//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
color C_UTILITIES::TextOuter()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          const string        text = "0";        // displayed text
          int                 x = 0;           // X coordinate
          int                 y = 0;           // Y coordinate
          uint                anchor = 0;      // anchor type
          uint                data_[];       // output buffer///  &data[];
          uint                width = 0;       // buffer width in pixels
          uint                height = 0;      // buffer height in pixels
          uint                colorF = 0;       // text color
          ENUM_COLOR_FORMAT   color_format = COLOR_FORMAT_ARGB_RAW; // color format for output
          bool TextOutX = TextOut(text, x, y, anchor, data_, width, height, colorF, color_format); //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          return clrRed;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_UTILITIES::SetRunColors(string nameCOM = "none")///>>>must defined in class globals
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          //if (C.ATR_14_0 > 1.5)
          //          if(ObjectFind(0, nameCOM) >= 0)
          //                    if(!ObjectSetInteger(0, nameCOM, OBJPROP_COLOR, clrBlue)) //SetObject
          //                              Alert( "-Line:", __LINE__, " ChartMeterX"); //
          //if (C.ATR_14_0 < 1.5)
          //          if(ObjectFind(0, nameCOM) >= 0)
          //                    if(!ObjectSetInteger(0, nameCOM, OBJPROP_COLOR, clrYellow)) //SetObject
          //                              Alert( "-Line:", __LINE__, " ChartMeterX"); //
          ////
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}



//+------------------------------------------------------------------+
//| ±Str                                                             |
//+------------------------------------------------------------------+
string C_UTILITIES::±Str(double Inp, int Precision)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(Inp > 0) { return("+" + DoubleToString(Inp, Precision)); } //-- PositiveValue
          else { return(DoubleToString(Inp, Precision)); }//-- NegativeValue
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//| ±Clr                                                             |
//+------------------------------------------------------------------+
color C_UTILITIES::±Clr(double Inp, color clrDef = clrGray) //
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          color clr = clrNONE;
          if(Inp > 0)  {clr = clrGreen; }       //-- PositiveValue
          if(Inp < 0)  {clr = clrRed; }         //-- NegativeValue
          if(Inp == 0) {clr = clrDef; }         //-- NeutralValue
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return(clr); //
}

//+------------------------------------------------------------------+
//| ±Clr                                                             |
//+------------------------------------------------------------------+
color C_UTILITIES::±ClrGMT(string Location, color colorDef = clrYellow)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          int           InpHour         = TimeHour(TimeGMT());
          int           InpMinute       = TimeMinute(TimeGMT());
          color         clr             = clrNONE;
          static bool   tSydney         = true;
          static bool   tTokyo          = true;
          static bool   tLondon         = true;
          static bool   tNewyork        = true;//Alert(InpHour,",,,","-Line:",__LINE__);//-- PositiveValue
          if(ObjectFind(0, "LBL_GMT") >= 0) {string GMTPM = TimeToStr(TimeGMT(), TIME_DATE | TIME_SECONDS); ObjectSetText( "LBL_GMT", GMTPM, 9, NULL, clrRed);}
//==============================================
          if(Location == "Sydney")
          {         if( ((22 < InpHour) || (7 > InpHour))) //sydney
                    {         //Alert(InpHour, ",,,", "-Line:",__LINE__);
                              //Cat.say("Sydney");
                              if(tSydney)
                              {         tSydney = 0;//
                                        if(ObjectFind(0, "LBL_WorldLogoSydney") >= 0)
                                                  ObjectSetText( "LBL_WorldLogoSydney", "¤", 10, NULL, clrRed);
                                        else { Cat.say("Sydney");}
                                        //
                              }
                              else
                              {         if(ObjectFind(0, "LBL_WorldLogoSydney") >= 0)
                                                  ObjectSetText( "LBL_WorldLogoSydney", "¤", 20, NULL, clrRed);
                                        //Sleep(20); //
                                        tSydney = 1; //
                              }
                              //
                    }
                    if( ((23 < InpHour) || (7 > InpHour)) && (Location == "Sydney"))
                    {         //  Alert(InpHour, ",,,", "-Line:",__LINE__);
                              // if(tSydney){         tSydney = 0;}
                              //if(!tSydney){         tSydney = 1;}
                              //Cat.say("Sydney2");
                              if(!tSydney)
                              {         tSydney = 1;//
                                        if(ObjectFind(0, "LBL_WorldLogoSydney") >= 0)
                                                  //  ObjectSetText( "LabelWorldLogotokyo", "");
                                                  ObjectSetText( "LBL_WorldLogoSydney", "¤", 10, NULL, clrYellow);
                                        else { Cat.say("Sydney2");}
                                        //Sleep(20); //
                              }//
                              else
                              {         // clr = clrBlue;
                                        if(ObjectFind(0, "LBL_WorldLogoSydney") >= 0)
                                                  //  ObjectSetText( "LabelWorldLogotokyo", "");
                                                  ObjectSetText( "LBL_WorldLogoSydney", "¤", 5, NULL, clrYellow);
                                        //Sleep(20); //
                                        tSydney = 0; //
                              }
                              return(clr); //
                              //
                    }//
                    return(clr); //
          }
//Alert(Inp,",TimeHour(TimeGMT()),,","-Line:",__LINE__);
//==============================================
          if(Location == "tokyo")
          {         if((23 < InpHour) || (8 > InpHour)) //Asian Session          Tokyo     11 p.m. to 8 a.m.
                    {         //Alert(InpHour,",,,","-Line:",__LINE__);
                              //Cat.say("tokyo");
                              if(tTokyo)
                              {         tTokyo = 0;//
                                        if(ObjectFind(0, "LBL_WorldLogoTokyo") >= 0)ObjectSetText( "LBL_WorldLogoTokyo", "¤", 10, NULL, clrRed);   else { Cat.say("tokyo");}//Sleep(20); //
                              }
                              //
                              else
                              {         if(ObjectFind(0, "LBL_WorldLogoTokyo") >= 0)ObjectSetText( "LBL_WorldLogoTokyo", "¤", 20, NULL, clrRed);//Sleep(20); //
                                        tTokyo = 1;//
                              }
                              //
                    }
                    if( (6 < InpHour) && (8 > InpHour))///grater than 6:59 mean 7 6end //&& (59 < InpMinute)
                    {         // Alert(InpHour,",,,","-Line:",__LINE__);
                              //Cat.say("tokyo2");
                              if(tTokyo)
                              {         if(ObjectFind(0, "LBL_WorldLogoTokyo") >= 0)
                                                  //  ObjectSetText( "LabelWorldLogotokyo", "");
                                                  ObjectSetText( "LBL_WorldLogoTokyo", "¤", 10, NULL, clrYellow);
                                        else { Cat.say("tokyo2");}
                                        //Sleep(20); //
                                        tTokyo = 1;//
                              }//
                              else
                              {         // clr = clrBlue;
                                        if(ObjectFind(0, "LBL_WorldLogoTokyo") >= 0)
                                                  //  ObjectSetText( "LabelWorldLogotokyo", "");
                                                  ObjectSetText( "LBL_WorldLogoTokyo", "¤", 5, NULL, clrOrange);
                                        //Sleep(20); //
                                        tTokyo = 0; //
                              }
                              //
                    }//
                    return(clr); //
          }
//==============================================
          if(Location == "london")
          {         if( (6 < InpHour) && (16 > InpHour)) //European Session       London    7 a.m. to 4 p.m.
                    {         if(tLondon)
                              {         if(ObjectFind(0, "LBL_WorldLogoLondon") >= 0)
                                                  ObjectSetText( "LBL_WorldLogoLondon", "¤", 10, NULL, clrRed);
                                        else { Cat.say("london");}
                                        //Sleep(20); //
                                        tLondon = 0;//
                              }
                              //}
                              else
                              {         // clr = clrBlue;
                                        if(ObjectFind(0, "LBL_WorldLogoLondon") >= 0)
                                                  //  ObjectSetText( "LabelWorldLogoLondon", "");
                                                  ObjectSetText( "LBL_WorldLogoLondon", "¤", 20, NULL, clrRed);
                                        //Sleep(20); //
                                        tLondon = 1; //
                              }//
                    }
                    if( (11.5 < InpHour) && (16 > InpHour)) //European Session       London    7 a.m. to 4 p.m. // && (29 < InpMinute)
                    {         if(tLondon)
                              {         if(ObjectFind(0, "LBL_WorldLogoLondon") >= 0)
                                                  //  ObjectSetText( "LabelWorldLogoLondon", "");
                                                  ObjectSetText( "LBL_WorldLogoLondon", "¤", 10, NULL, clrYellow);
                                        else { Cat.say("london2");}
                                        //Sleep(20); //
                                        tLondon = 1;//
                              }//
                              else
                              {         // clr = clrBlue;
                                        if(ObjectFind(0, "LBL_WorldLogoLondon") >= 0)
                                                  //  ObjectSetText( "LabelWorldLogoLondon", "");
                                                  ObjectSetText( "LBL_WorldLogoLondon", "¤", 5, NULL, clrYellow);
                                        //Sleep(20); //
                                        tLondon = 0; //
                              }
                              //
                              return(clr); //
                    }//
                    return(clr); //
          }
//============================================== ||(29 < InpMinute)
          if(Location == "newyork")
          {         if( (11.5 < InpHour) && (20 > InpHour) ) //North American Session       New York  noon to 8 p.m.
                    {         if(tNewyork)
                              {         if(ObjectFind(0, "LBL_WorldLogoNewyork") >= 0)
                                                  ObjectSetText( "LBL_WorldLogoNewyork", "¤", 20, NULL, clrRed);
                                        else { Cat.say("newyork");}
                                        //Sleep(20); //
                                        tNewyork = 0;//
                                        //
                              }
                              else
                              {         if(ObjectFind(0, "LBL_WorldLogoNewyork") >= 0)
                                                  ObjectSetText( "LBL_WorldLogoNewyork", "¤", 10, NULL, clrRed);
                                        ///
                                        //Sleep(20); //
                                        tNewyork = 1; //
                              }
                              //
                              return(clr);//
                    }//
          }
          //------------------------------------------------------------
          if(InpHour < 0)  { clr = clrYellow;}//-- NegativeValue
          if(InpHour == 0) { clr = colorDef;}
          //------------------------------------------------------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ChartController Error",  __LINE__, __FUNCTION__); //|
          return(clr);//--
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//====================================================
//+---------------------------------------------------------------------------+
//| Formats double with thousands separator for so many digits after the dot. |
//+---------------------------------------------------------------------------+
string C_UTILITIES::FormatDouble(const string number, const int digits = 2)
{
// Find "." position.
          int pos = StringFind(number, ".");
          string integer = number;
          string decimal = "";
          if (pos > -1)
          {         integer = StringSubstr(number, 0, pos);
                    decimal = StringSubstr(number, pos, digits + 1); }
          string formatted = "";
          string comma = "";
          while (StringLen(integer) > 3)
          {         int length = StringLen(integer);
                    string group = StringSubstr(integer, length - 3);
                    formatted = group + comma + formatted;
                    comma = ",";
                    integer = StringSubstr(integer, 0, length - 3); }
          if (integer == "-") comma = "";
          if (integer != "") formatted = integer + comma + formatted;
          return(formatted + decimal);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string C_UTILITIES::ValueSeprate(double ValueCom, int digitCom, string ValueDesc = "~~")
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
//----------------------------------------------------------------
          ValueCom = NormalizeDouble(ValueCom, digitCom);
          bool One = false; bool Two     = false;
          ValueDesc = DoubleToString( ValueCom, digitCom);
          //----------------------------------------------------------------
          //StringReserve();StringToDouble();StringConcatenate(, ",")      // StringReplace(ValueDesc, ",", "."); StringFind(ValueDesc, ".");
          if(StringBufferLen(ValueDesc) > 6)One = true;//StringAdd(ValueDesc, ",");
          if(StringBufferLen(ValueDesc) > 9)Two = true;//StringAdd(ValueDesc, ",");
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          //----------------------------------------------------------------
          ValueDesc = DoubleToString( ValueCom, digitCom);//save persion s//
          double PrecisionSaveBack      =  0;//MathCeil((0.999 - (MathFloor(ValueCom) - (ValueCom)))) / 100 ;
          PrecisionSaveBack             = ValueCom - (int)ValueCom ;
          //Alert("PrecisionSaveBack: ",PrecisionSaveBack,"__(int)ValueCom :", (int)ValueCom, "___", "ValueCom:", ValueCom); //
          //----------------------------------------------------------------
          double U0   = MathFloor(ValueCom / 1000000000000000) ;
          double U02  = MathFloor(ValueCom / 1000000000000000) ;
          double T000 = MathFloor(ValueCom / 100000000000000) ;
          double T00  = MathFloor(ValueCom / 10000000000000) ;
          double T0   = MathFloor(ValueCom / 1000000000000) - (U02 * 1000);;
          double T02  = MathFloor(ValueCom / 1000000000000) ;
          double G000 = MathFloor(ValueCom / 100000000000) ;
          double G00  = MathFloor(ValueCom / 10000000000) ;
          double G0   = MathFloor(ValueCom / 1000000000) - (T02 * 1000);
          double G02  = MathFloor(ValueCom / 1000000000);
          double M000 = MathFloor(ValueCom / 100000000) ;
          double M00  = MathFloor(ValueCom / 10000000) ;
          double M0   = MathFloor(ValueCom / 1000000)  - (G02 * 1000) ; //The function returns integer numeric value closest from below.//The function returns integer numeric value closest from above.
          double M02  = MathFloor(ValueCom / 1000000);
          double K000 = MathFloor(ValueCom / 100000) ;
          double K00  = MathFloor(ValueCom / 10000) ;
          double K0   = MathFloor(ValueCom / 1000)  - (M02 * 1000) ;
          double K02  = MathFloor(ValueCom / 1000);//
          double B000 = MathFloor(ValueCom / 100) ;
          double B00  = MathFloor(ValueCom / 10) ;
          double B0   = MathFloor(ValueCom / 1) - (K02 * 1000) + PrecisionSaveBack;
          //Alert( "__PrecisionSaveBack: ", PrecisionSaveBack, "__B0:", B0);  //
          //----------------------------------------------------------------
          string DescG0   = DoubleToStr(G0   - 0, 0);
          //==
          string DescM000 = DoubleToStr(M000 - 0, 0);
          string DescM00  = DoubleToStr(M00  - 0, 0);
          string DescM0   = DoubleToStr(M0   - 0, 0);
          //===
          string DescK000 = DoubleToStr(K000 - 0, 0);
          string DescK00  = DoubleToStr(K00  - 0, 0);
          string DescK0   = DoubleToStr(K0   - 0, 0);
          //===
          string DescB000 = DoubleToStr(B000 - 0, 0);
          string DescB00  = DoubleToStr(B00  - 0, 0);
          string DescB0   = DoubleToStr(B0   - 0, digitCom);
          //----------------------------------------------------------------
          string OutDescG0   = "xxx";
          //==
          string OutDescM000 = "xxx";
          string OutDescM00  = "xxx";
          string OutDescM0   = "xxx";
          //===
          string OutDescK000 = "xxx";
          string OutDescK00  = "xxx";
          string OutDescK0   = "xxx";
          //===
          string OutDescB000 = "xxx";
          string OutDescB00  = "xxx";
          string OutDescB0   = "xxx";
          //----------------------------------------------------------------
          //DoubleToStrMorePrecision(ValueCom,16);
          // ValueDesc =  DescM00 + DescM0 + "," + DescK000 + DescK00 + DescK0 + "," + DescB000 + DescB00 + DescB0;
          if(false)
          {         Alert( "G0: ", DescG0, "__/n",
                           //"M000: ", DescM000, "__/n", //
                           //"M00: ", DescM00, "__/n",
                           "M0: ", DescM0, "__/n",
                           //"K000: ", DescK000, "__/n", //
                           //"K00: ", DescK00, "__/n",
                           "K0: ", DescK0, "__/n",
                           //"B000: ", DescB000, "__/n"//,
                           //"B00: ", DescB00, "__/n",
                           "B0: ", DescB0, "__"
                         ); //
          }
          //----------------------------------------------------------------
          if(true)
          {         OutDescM0 = DescM0;
                    if(M0 > 10 && true)
                    {         if(M0 < 100)OutDescM0 = "0" + DescM0;
                              if(M0 < 100 && ValueCom < 1000000000) OutDescM0 = "" + DescM0;
                              if(M0 < 10) OutDescM0 = "00" + DescM0;//
                              if(M0 < 100 && ValueCom < 1000000000) OutDescM0 = "" + DescM0;//
                    }
                    //----------------------------------------------------------------
                    OutDescK0 = DescK0;
                    if(true)
                    {         if(K0 < 100)OutDescK0 = "0" + DescK0;
                              if(K0 < 100 && ValueCom < 1000000) OutDescK0 = "" + DescK0;
                              if(K0 < 10) OutDescK0 = "00" + DescK0;
                              if(K0 < 100 && ValueCom < 1000000) OutDescK0 = "" + DescK0;//
                    }
                    //----------------------------------------------------------------
                    OutDescB0 =  DescB0;
                    if(true)
                    {         if(B0 < 100)OutDescB0 = "0" + DescB0;
                              if(B0 < 100 && ValueCom < 1000) OutDescB0 = "" + DescB0;
                              if(B0 < 10 ) OutDescB0 = "00" + DescB0;
                              if(B0 < 10 && ValueCom < 1000) OutDescB0 = "" + DescB0;//
                    }//
          }
          //----------------------------------------------------------------
          if(false)
          {         Alert( "G0: ", OutDescG0, "__",
                           //"M000: ", DescM000, "__", //
                           //"M00: ", DescM00, "__",
                           "M0: ", OutDescM0, "__",
                           //"K000: ", DescK000, "__", //
                           //"K00: ", DescK00, "__",
                           "K0: ", OutDescK0, "__",
                           //"B000: ", DescB000, "__"//,
                           //"B00: ", DescB00, "__",
                           "B0: ", OutDescB0, "__"
                         ); //
          }
          string Seprator1 = ",";
          string Seprator2 = ",";
          if(ValueCom < 1000) {OutDescK0 = ""; OutDescM0 = ""; Seprator1 = "" ; Seprator2 = "";} //
          if(ValueCom < 1000000) {OutDescM0 = ""; Seprator2 = "";} //
          ValueDesc  = OutDescM0 + Seprator2 + OutDescK0 + Seprator1 + OutDescB0 ;
          //==============================================================================
          if(false)
          {         //----------------------------------------------------------------
                    ValueCom = NormalizeDouble(ValueCom, digitCom);
                    ValueDesc = DoubleToString( ValueCom, digitCom);
                    //----------------------------------------------------------------
                    string GetCharString[];
                    int SizeStr = StringLen(ValueDesc); //
                    ArrayResize(GetCharString, SizeStr); //
                    StringToStringArray(ValueDesc, GetCharString);
                    bool KeySetValueDesc = false; //
                    if(KeySetValueDesc)
                    {         for(int i = 0; i < SizeStr - 1; i++)
                              {         bool Find =  "." == GetCharString[i];//
                                        //
                                        string B0Desc = "00"; //
                                        string K0Desc = "00"; //
                                        string M0Desc = "00"; //
                                        string G0Desc = "00"; //
                                        string T0Desc = "00"; //
                                        string ValueDesc2 = "00"; //
                                        if(Find)
                                        {         B0Desc = GetCharString[i + 1] + GetCharString[i + 2] + GetCharString[i + 3] ;///
                                                  K0Desc = GetCharString[i + 4] + GetCharString[i + 5] + GetCharString[i + 6] ;///
                                                  M0Desc = GetCharString[i + 7] + GetCharString[i + 8] + GetCharString[i + 9] ;///
                                                  G0Desc = GetCharString[i + 10] + GetCharString[i + 11] + GetCharString[i + 12] ;///
                                                  T0Desc = GetCharString[i + 13] + GetCharString[i + 14] + GetCharString[i + 15] ;///
                                                  ValueDesc2 = T0Desc + "," + G0Desc + "," + M0Desc + "," + K0Desc + "," + B0Desc ;
                                                  //
                                        }
                                        //
                              }//
                    }//
                    bool InsertInDescByPos = false; //
                    if(InsertInDescByPos)
                    {         int Posmode = 0;
                              int PosCordinateFromRight = 0;
                              int PosCordinateFromLeft = SizeStr - 1;
                              int PosCordinateFromMiddle = (SizeStr - 1) / 2;
                              //-------------------------------------------
                              int i = 0; //
                              int ModeDist = 0;
                              if(Posmode == -1)ModeDist = PosCordinateFromRight;
                              if(Posmode == 0)ModeDist = PosCordinateFromMiddle;
                              if(Posmode == 1)ModeDist = PosCordinateFromLeft;
                              //-------------------------------------------
                              for( i ; i < ModeDist; i++)
                              {         bool Find =  "." == GetCharString[i];//
                                        //
                                        string B0Desc2 = "00"; //
                                        string K0Desc2 = "00"; //
                                        string M0Desc2 = "00"; //
                                        string G0Desc2 = "00"; //
                                        string T0Desc2 = "00"; //
                                        string ValueDesc2 = "00"; //
                                        if(Find)
                                        {         B0Desc2 = GetCharString[i + 1] + GetCharString[i + 2] + GetCharString[i + 3] ;///
                                                  K0Desc2 = GetCharString[i + 4] + GetCharString[i + 5] + GetCharString[i + 6] ;///
                                                  M0Desc2 = GetCharString[i + 7] + GetCharString[i + 8] + GetCharString[i + 9] ;///
                                                  G0Desc2 = GetCharString[i + 10] + GetCharString[i + 11] + GetCharString[i + 12] ;///
                                                  T0Desc2 = GetCharString[i + 13] + GetCharString[i + 14] + GetCharString[i + 15] ;///
                                                  ValueDesc2 = T0Desc2 + "," + G0Desc2 + "," + M0Desc2 + "," + K0Desc2 + "," + B0Desc2 ;
                                                  //
                                        }
                                        //
                              }//
                    }//
                    //----------------------------------------------------------------
          }
          //----------------------------------------------------------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADEPANEL Error",  __LINE__, __FUNCTION__); //|
          return ValueDesc;//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string C_UTILITIES::lots_as_string(LOTSO lots)
{         static int  lotDigits = EMPTY;
          if(EMPTY == lotDigits)
                    lotDigits   = digits_in(MarketInfo(_Symbol, MODE_LOTSTEP) );
          return DoubleToStr(lots, lotDigits); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_UTILITIES::digits_in(double d)
{         int digits = 0;
          while(d - int(d) > 1.E-8)
          {         d *= 10.0; ++digits; }
          return digits;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_UTILITIES::DigitsIn(double d)
{         double tempDouble = d;
          if (tempDouble > 1.0)
                    tempDouble -= int(tempDouble);
          int digits = 0;
          double subtract = tempDouble - int(tempDouble);
          while(subtract > 1.E-8)
          {         tempDouble *= 10.0;
                    subtract = tempDouble - int(tempDouble);
                    ++digits; //
          }
          return digits; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_UTILITIES::CountDigits(double val)//the best
{         int digits = 0;
          while(NormalizeDouble(val, digits) != NormalizeDouble(val, 8)) digits++;
          return digits; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_UTILITIES::CountDigits3(double val, int maxPrecision = 8)
{         int digits = 0;
          while(NormalizeDouble(val, digits) != NormalizeDouble(val, maxPrecision))
                    digits++;
          return digits;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_UTILITIES::CountDigits4(double val, int maxPrecision = 8)
{         int digits = -1;
          double maxp = NormalizeDouble(val, maxPrecision);
          while(NormalizeDouble(val, ++digits) != maxp);
          return digits;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

int C_UTILITIES::DigitsCount6(double number)

{         int digits = 0;
          while (NormalizeDouble(number, digits) != number) {digits += 1;}
          return digits;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_UTILITIES::CountDigits2(double val)
{         // If precision can be reduced, e.g. to 6, then the function
          // becomes slightly faster on average.
          int precision = 8;
          val = MathAbs(val);
          string x = DoubleToString(val - MathFloor(val), precision);
          int pos = StringFind(x, "0", 2);
          return (pos > 0 ? pos - 2 : precision); //
}
//+------------------------------------------------------------------+
//| Round a double value to a given decimal place - down or normal.  |
//+------------------------------------------------------------------+
double C_UTILITIES::Round(const double value, const double digits, bool round_down = false)
{         int norm = (int)MathPow(10, digits);
          if (!round_down) return(MathRound(value * norm) / norm);
          else return(MathFloor(value * norm) / norm); //
}

//+------------------------------------------------------------------+
//| Counts decimal places.                                           |
//+------------------------------------------------------------------+
int C_UTILITIES::CountDecimalPlaces(double number)
{
// 100 as maximum length of number.
          for (int i = 0; i < 100; i++)
          {         double pwr = MathPow(10, i);
                    if (MathRound(number * pwr) / pwr == number) return(i);//25.25*10 = 252.5 ///252/10= (25.2==25.25)???
          }
          return(-1); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_UTILITIES::GetPrecision(double ValueCom)//DigitGe (double ValueCom)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          int digitControl = 0;    int DigitCountX = 444; bool x = true; ////
          // Curr_RiskPercent > 0.99 ? digitControl = 0 : digitControl = 3;
          //========================================================================Get Precision Value
          double PrecisionSaveBack    =  ValueCom - (int)ValueCom;//MathPow(
          //MathPow(ValueCom, 10 * i);
          double Pow10 = MathPow(PrecisionSaveBack, 10 * 10);//
          //========================================================================0.90000001
          if(true)
          {         (DigitCountX != 9) &&(PrecisionSaveBack <= 0.00000009)&&( PrecisionSaveBack >= 0.00000000) ? DigitCountX = 8 : x = false;//>>>>>
                    (DigitCountX != 8) &&(PrecisionSaveBack <= 0.11111110)&&( PrecisionSaveBack >= 0.00000001) ? DigitCountX = 7 : x = false;//
                    (DigitCountX != 7) &&(PrecisionSaveBack <= 0.11111100)&&( PrecisionSaveBack >= 0.00000011) ? DigitCountX = 6 : x = false;//
                    (DigitCountX != 6) &&(PrecisionSaveBack <= 0.11111000)&&( PrecisionSaveBack >= 0.00000111) ? DigitCountX = 5 : x = false;//
                    (DigitCountX != 5) &&(PrecisionSaveBack <= 0.11110000)&&( PrecisionSaveBack >= 0.00001111) ? DigitCountX = 4 : x = false;///>>>>>>>>>.
                    (DigitCountX != 4) &&(PrecisionSaveBack <= 0.11100000)&&( PrecisionSaveBack >= 0.00011111) ? DigitCountX = 3 : x = false;
                    (DigitCountX != 3) &&(PrecisionSaveBack <= 0.11000000)&&( PrecisionSaveBack >= 0.00111111) ? DigitCountX = 2 : x = false;
                    (DigitCountX != 2) &&(PrecisionSaveBack <= 0.10000000)&&( PrecisionSaveBack >= 0.01111111) ? DigitCountX = 1 : x = false;
                    (DigitCountX != 1) &&(PrecisionSaveBack <= 1.00000000)&&( PrecisionSaveBack >= 0.11111111) ? DigitCountX = 0 : x = false;//
          }
          //========================================================================
          string  SaveDesc            = DoubleToStr(PrecisionSaveBack, DigitCountX);
          int PositioninDesc          = StringFind(SaveDesc, ".", 0);
          int SizeDesc                = StringLen(SaveDesc);
          int DigitCount              = 8 - (PositioninDesc); //
          Alert( "CountDigits(ValueCom): ", CountDigits(ValueCom), "__!x:", !x, "__DigitCountX: ", DigitCountX, "____DigitCount: ", DigitCount, "__PositioninDesc: ", PositioninDesc); //
          if(false)
          {         if(ValueCom > 50)          PrecisionSaveBack < 1 ? digitControl = 1 : digitControl = 1;
                    if(ValueCom > 50)          PrecisionSaveBack < 0.1 ? digitControl = 1 : digitControl = 1;
                    if(ValueCom > 500)         PrecisionSaveBack < 0.01 ? digitControl = 2 : digitControl = 2;
                    if(ValueCom > 5000)        PrecisionSaveBack < 0.001 ? digitControl = 3 : digitControl = 3;
                    if(ValueCom > 50000)       PrecisionSaveBack < 0.0001 ? digitControl = 4 : digitControl = 4;
                    if(ValueCom > 500000)      PrecisionSaveBack < 0.00001 ? digitControl = 5 : digitControl = 5;
                    if(ValueCom > 5000000)     PrecisionSaveBack < 0.000001 ? digitControl = 6 : digitControl = 6;//
          }//
          {         PrecisionSaveBack < 1 ? digitControl = DigitCount : x = 1;
                    //PrecisionSaveBack <= 0.9 ? digitControl = 2 : x = 2;
                    //PrecisionSaveBack <= 0.99 ? digitControl = 3 : x = 3;
                    //PrecisionSaveBack <= 0.999 ? digitControl = 4 : x = 4;
                    //PrecisionSaveBack <= 0.9999 ? digitControl = 5 : x = 5;
                    //PrecisionSaveBack <= 0.99999 ? digitControl = 6 : x = 6;
                    //PrecisionSaveBack <= 0.999999 ? digitControl = 7 : x = 7;//
                    ValueCom == 0 ? digitControl = 1 : x = 7; //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          return(digitControl);//
} //

//+------------------------------------------------------------------+
//| up to 16 digits after decimal point                              |
//+------------------------------------------------------------------+
string C_UTILITIES::DoubleToStrMorePrecisionX(double number, int precision)
{         static double DecimalArray[17] =
          {         1.0,                        ////if(precision==0) p=1.0;
                    10.0,                      ////if(precision==1) p=10.0;
                    100.0,
                    1000.0,
                    10000.0,
                    100000.0,
                    1000000.0,
                    10000000.0,
                    100000000.0,
                    1000000000.0,
                    10000000000.0,
                    100000000000.0,
                    1000000000000.0,
                    10000000000000.0,
                    100000000000000.0,
                    1000000000000000.0,
                    10000000000000000.0 };
          double rem, integer, integer2;
          string intstring, remstring, retstring;
          bool   isnegative = false;
          int    rem2;
//---
          if(precision < 0)  precision = 0;
          if(precision > 16) precision = 16;
//---
          double p = DecimalArray[precision];
          if(number < 0.0)       {         isnegative = true; number = -number;}
          integer = MathFloor(number);
          //==========================================
          rem = MathRound((number - integer) * p);//finding precisioncount
          //==========================================
          remstring = "";
          //==========================================
          for(int i = 0; i < precision; i++)
          {         integer2 = MathFloor(rem / 10);
                    rem2 = (int)NormalizeDouble(rem - integer2 * 10, 0);
                    remstring = IntegerToString(rem2) + remstring;
                    rem = integer2; //
          }
//---
          intstring = DoubleToStr(integer, 0);
          if(isnegative)        retstring = "-" + intstring;
          else                  retstring = intstring;
          if(precision > 0)     retstring = retstring + "." + remstring;
//---
          return(retstring); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_UTILITIES::StringToStringArray(string DescCom, string & DescOutArray[])
{         int SizeStr = StringLen(DescCom); //
          uchar BoxStringChar[];//
          ArrayResize(BoxStringChar, SizeStr); //
          int ElementsCopy = StringToCharArray(DescCom, BoxStringChar, 0, WHOLE_ARRAY, CP_ACP); //
          //StringToShortArray(ValueDesc,BoxString, 0, -1)
          //----------------------------------------------------------------
          ArrayResize(DescOutArray, SizeStr); //
          for(int i = 0; i < SizeStr - 1; i++)
          {         DescOutArray[i]  = CharToString(BoxStringChar[i]); //
          }//
          return true;//
} //
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_UTILITIES::StringFindRev(string Str, string Find)
{
//--- the pos variable for the returned value
          int pos;
//--- auxiliary variable initialized to -1,
//--- in case the substring is not found in the string
          int tmp = -1;
//--- loop. It will be executed at least once
          do
          {         //--- assign the last known position of the substring
                    pos = tmp;
                    //--- continue searching (using the third parameter of the function)
                    tmp = StringFind(Str, Find, tmp + 1); }
          while(tmp != -1); // If the substring is not found in the remaining part of the string, the loop
          // is terminated and the pos variable stores the last
          // known position
//--- return the position
          return(pos);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_UTILITIES::Capitan_TestBarExisted()
{         if((iBars(NULL, 0) == 0))///not uper or equal to zero//not existed
          {         Capitan_KeyBreakeErrorTest = false;
                    //DLL calls must be allowed
                    Alert("***Waite Untile Update ChartData-ExpertRemove And Restart Agane Please.*** BarCount: ", (iBars(NULL, 0)));
                    //return (INIT_FAILED); //
                    ExpertRemove(); //
          }//
} ///

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  C_UTILITIES::StringDigited(string NameCom = "none" )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, __FUNCTION__); //
          //==============================================================
          bool          res             = false; ////
          //==============================================================GetDesc
          string        DescCom         =      ObjectGetString(0, NameCom, OBJPROP_TEXT); //
          //==============================================================GetLenght
          int           SizeDesc        = StringLen(DescCom);//
          int           Pos             = -1; //
          bool          KeyFindDigit    = false;//
          bool          KeyOut          = false; //
          //==============================================================While Lenght Grater Than Possition Mark//
          while(SizeDesc > ++Pos )//run when true///
          {         //==============================================================From Num Zero To Nine
                    for(int i = 0; i < 10; i++)///find any digit...
                    {         //==============================================================Is Find in Current string Desc Pos Frist Any num digit?
                              KeyFindDigit = !(-1 == StringFind(DescCom, IntegerToString(i), Pos)); //
                              Alert("NameCom: ", NameCom, "__DescCom: ", DescCom, "__SizeDesc: ", SizeDesc, "__Pos: ", Pos, "__i: ", i, "__KeyOut: ", KeyOut); Sleep(30); //
                              if(KeyFindDigit) {break;} //
                              //==============================================================Is Find Any Digit Breake Loop
                    }//
                    //============================================================== Gone Next Position //
                    //Alert("NameCom: ", NameCom, "__DescCom: ", DescCom, "__SizeDesc: ", SizeDesc, "__Pos: ", Pos, "__KeyOut: ", KeyOut); Sleep(30); //
                    if(KeyFindDigit)KeyOut = KeyFindDigit; //safe the yes
                    continue;///
                    //==============================================================
          } //if(SizeDesc < Pos)res = false; //
          //==============================================================if Whole All Pos Have true its mean in string Have Digit// ese false
          if(KeyOut) {  res = true; return res;} //
          //==============================================================
          return res;//
}


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  C_UTILITIES::StringLieraled(string NameCom = "none")
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TRADER Error", __LINE__, NameCom + ": " + __FUNCTION__); //
//==============================================================
          bool          res             = false; ////
          //==============================================================GetDesc
          string        DescCom         =      ObjectGetString(0, NameCom, OBJPROP_TEXT); //
          if(DescCom == "")                     {   return true;}//
          if(StringFind(DescCom, "Set ") > -1)  {   return res; } ////if searching value is NUll //errorr wrong parameter///
          //==============================================================GetLenght
          int           SizeDesc        = StringLen(DescCom);//
          int           Pos             = -1; //
          bool          KeyFindLieral    = false;//
          bool          KeyFindDigit    = false;//
          bool          KeyOut          = false; //
          //==============================================================While Lenght Grater Than Possition Mark//
          while(SizeDesc > ++Pos )//run when true///
          {         //==============================================================
                    int char_code = StringGetChar(DescCom, Pos);
                    bool IsChar_Digit = ((char_code >= 48 && char_code <= 57) || char_code  ==  46);
                    //------------------
                    if(!IsChar_Digit) {KeyFindLieral = true;}//return false;
                    if(IsChar_Digit) {KeyFindLieral = false;}//return false;
                    // else { return true;} //
                    //===============
                    if(KeyFindLieral)KeyOut = KeyFindLieral;
                    continue;//
                    //-----------------
                    if(false)          //==============================================================From Num Zero To Nine
                    {         for(int i = 0; i < 10; i++)///find any digit...
                              {         //==============================================================Is Find in Current string Desc Pos Frist Any num digit?
                                        //==============================================================Is Find Any Digit Breake Loop
                                        //Returns position number in a string, from which the searched substring starts, or -1, if the substring is not found.
                                        KeyFindDigit = (-1 < StringFind(DescCom, IntegerToString(i)));//
                                        if(KeyFindDigit) { break ;} ////if find Lieral in frist element gone out loop
                                        //==============================================================
                              }//
                              //============================================================== Gone Next Position //
                              if(KeyFindLieral)KeyOut = KeyFindLieral; // while KeyFind is true Safe it for next pos
                              continue; //
                    }///
          } //where find any literal..
//==============================================================if Whole All Pos Have true its mean in string Have Digit// ese false
          //Alert("NameCom: ", NameCom, "__DescCom: ", DescCom, "__SizeDesc: ", SizeDesc, "__Pos: ", Pos, "__KeyOut: ", KeyOut, "__KeyFindLieral: ", KeyFindLieral);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__);
          if(KeyOut) {  res = true; return res;} //
//==============================================================
          return res;//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_UTILITIES::Set_Color(string Name, color Color)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
          ObjectSetInteger(0, Name, OBJPROP_COLOR, Color);
          return true;//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_CHART Error",  __LINE__, __FUNCTION__); //|
}
// Convert a decimal number to a text string
string sub_dbl2strbrokerdigits ( double par_a )
{         return ( DoubleToStr ( par_a, BrokerDigits ) ); //
}

// Adjust numbers with as many decimals as the broker uses
double sub_normalizebrokerdigits ( double par_a )
{         return ( NormalizeDouble ( par_a, BrokerDigits ) ); //
}

// Adjust textstring with zeros at the end
string sub_adjust00instring ( int par_a )
{         if ( par_a < 10 )
                    return ( "00" + (string)par_a );
          if ( par_a < 100 )
                    return ( "0" + (string)par_a );
          return ( "" + (string)par_a ); //
}


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string C_UTILITIES::TimeFrameToString(ENUM_TIMEFRAMES PeriodTMCom )
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
//ENUM_TIMEFRAMES PeriodCom
//The _Period variable contains the value of the timeframe of the current chart.
//_Period;
          string result = "";
          switch(PeriodTMCom)
          {         // "CURRENT"   "M1"   "M5"    "M15"   "M30"   "H1"   "H4"  "D1"   "W1"   "MN1";
                    case PERIOD_CURRENT: result = "CURRENT"; break;
                    case PERIOD_M1:      result = "M1"; break;
                    case PERIOD_M5:      result = "M5"; break;
                    case PERIOD_M15:     result = "M15"; break;
                    case PERIOD_M30:     result = "M30"; break;
                    case PERIOD_H1:      result = "H1"; break;
                    case PERIOD_H4:      result = "H4"; break;
                    case PERIOD_D1:      result = "D1"; break;
                    case PERIOD_W1:      result = "W1"; break;
                    case PERIOD_MN1:     result = "MN1"; break;
                              //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "UtilitiesController Error",  __LINE__,   __FUNCTION__); //|
//=========================================================|
          return result;///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string C_UTILITIES::NameTimeFrame(ENUM_TIMEFRAMES f_timeFrame) // przedział czasowy
{         switch(f_timeFrame)
          {         case PERIOD_CURRENT: return "Current time frame";
                    case PERIOD_M1:      return "M1";
                    case PERIOD_M5:      return "M5";
                    case PERIOD_M15:     return "M15";
                    case PERIOD_M30:     return "M30";
                    case PERIOD_H1:      return "H1";
                    case PERIOD_H4:      return "H4";
                    case PERIOD_D1:      return "D1";
                    case PERIOD_W1:      return "W1";
                    case PERIOD_MN1:     return "MN1";
                    default:             return "Unknown time frame"; } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_UTILITIES::TimeFrameUpdating()
{         ENUM_TIMEFRAMES TimeFrameSet[] =
          {         PERIOD_M1,  PERIOD_M5, PERIOD_M15,
                    PERIOD_M30, PERIOD_H1, PERIOD_H4,
                    PERIOD_D1,  PERIOD_W1, PERIOD_MN1//
          };
          for(int i = SymbolsTotal(true) - 1; i >= 0; --i)//in market whatch///
          {         for(int j = ArraySize(TimeFrameSet) - 1; j >= 0; --j)
                    {         while(!IsStopped())//---running sysytem
                              {         ResetLastError();
                                        int BarsNumber = iBars(SymbolName(i, true), TimeFrameSet[j]);
                                        if(  BarsNumber > 0)break;//
                              }//
                    }//
          }//
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+NameTypePrice(PRICE_OPEN);
string C_UTILITIES::NameTypePrice(ENUM_APPLIED_PRICE f_typePrice) // typ ceny
{         switch(f_typePrice)
          {         case PRICE_CLOSE:    return "Close";
                    case PRICE_OPEN:     return "Open";
                    case PRICE_HIGH:     return "High";
                    case PRICE_LOW:      return "Low";
                    case PRICE_MEDIAN:   return "Median";
                    case PRICE_TYPICAL:  return "Typical";
                    case PRICE_WEIGHTED: return "Weighted";
                    default:             return "Unknown type of price"; } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+NameTypeTradeOperation(OP_SELL);
string C_UTILITIES::NameTypeTradeOperation(int f_typeOperation) // typ operacji handlowej
{         switch(f_typeOperation)
          {         case OP_BUY:       return "Buy";
                    case OP_SELL:      return "Sell";
                    case OP_BUYLIMIT:  return "Buy limit";
                    case OP_SELLLIMIT: return "Sell limit";
                    case OP_BUYSTOP:   return "Buy stop";
                    case OP_SELLSTOP:  return "Sell stop";
                    default:           return "Unknown type of trade operation"; } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+NameWeekDay(TUESDAY);
string C_UTILITIES::NameWeekDay(ENUM_DAY_OF_WEEK f_weekDay) // dzień tygodnia
{         switch(f_weekDay)
          {         case SUNDAY:    return "Sunday";
                    case MONDAY:    return "Monday";
                    case TUESDAY:   return "Tuesday";
                    case WEDNESDAY: return "Wednesday";
                    case THURSDAY:  return "Thursday";
                    case FRIDAY:    return "Friday";
                    case SATURDAY:  return "Saturday";
                    default:        return "Unknown day of week"; } //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_UTILITIES::UpdatesAllTimeFrame()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-ToolsController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
// updates all timeframe on all charts
// to update initialising cart placeduplice chart symbol
          bool   UseInitialChartTimeframe = true;
          long   firstChartID          = ChartFirst();
          long   initialChartID        = ChartID();
          string initialChartSymbol    = ChartSymbol(initialChartID);
          int    initialChartTimeframe = ChartPeriod(initialChartID);
          long   previousChartID       = firstChartID;
          long   currentChartID        = previousChartID;
          string currentChartSymbol    = ChartSymbol(currentChartID);
          int    currentChartTimeframe = ChartPeriod(currentChartID);
          int    maxOpenCharts         = 128;
          int    i                     = 0;
          int timeframeArrayA[9];
          int k = 0;
          timeframeArrayA[0] = PERIOD_M1;
          timeframeArrayA[1] = PERIOD_M5;
          timeframeArrayA[2] = PERIOD_M15;
          timeframeArrayA[3] = PERIOD_M30;
          timeframeArrayA[4] = PERIOD_H1;
          timeframeArrayA[5] = PERIOD_H4;
          timeframeArrayA[6] = PERIOD_D1;
          timeframeArrayA[7] = PERIOD_W1;
          timeframeArrayA[8] = PERIOD_MN1;
          long   initialChartIDsame     = initialChartID;
          string initialChartSelectedame = initialChartSymbol;
          long   previousChartIDsame    = previousChartID;
          string currentChartSelectedame = currentChartSymbol;
          long   currentChartIDsame     = currentChartID;
          bool   symbolsSame            = true;
          bool   timeframeSame         = true;
          while(i < maxOpenCharts)
          {         if(ChartPeriod(currentChartIDsame) != ChartPeriod(ChartNext(currentChartIDsame))  && ChartPeriod(ChartNext(currentChartIDsame)) != 0)
                    {         timeframeSame = false;
                              break; }
                    currentChartIDsame     = ChartNext(previousChartIDsame);
                    if(currentChartIDsame < 0) { break; } //end of chart list, currentChartID = -1
                    currentChartSelectedame = ChartSymbol(currentChartIDsame);
                    currentChartTimeframe  = ChartPeriod(currentChartIDsame);
                    previousChartIDsame    = currentChartIDsame;
                    Sleep(1000);
                    i = i + 1;//
          }
          i = 0;
// while(i<maxOpenCharts && timeframeSame==false)
          while(i < maxOpenCharts)
          {         if(currentChartID != initialChartID)
                    {         ChartSetSymbolPeriod(currentChartID, currentChartSymbol, timeframeArrayA[0]); Sleep(1000);
                              ChartSetSymbolPeriod(currentChartID, currentChartSymbol, timeframeArrayA[1]); Sleep(1000);
                              ChartSetSymbolPeriod(currentChartID, currentChartSymbol, timeframeArrayA[2]); Sleep(1000);
                              ChartSetSymbolPeriod(currentChartID, currentChartSymbol, timeframeArrayA[3]); Sleep(1000);
                              ChartSetSymbolPeriod(currentChartID, currentChartSymbol, timeframeArrayA[4]); Sleep(1000);
                              ChartSetSymbolPeriod(currentChartID, currentChartSymbol, timeframeArrayA[5]); Sleep(1000);
                              ChartSetSymbolPeriod(currentChartID, currentChartSymbol, timeframeArrayA[6]); Sleep(1000);
                              ChartSetSymbolPeriod(currentChartID, currentChartSymbol, timeframeArrayA[7]); Sleep(1000);
                              ChartSetSymbolPeriod(currentChartID, currentChartSymbol, timeframeArrayA[8]); Sleep(1000);
                              ChartSetSymbolPeriod(currentChartID, currentChartSymbol, currentChartTimeframe); //resets to initial TF
                    }
                    if(currentChartID != initialChartID && UseInitialChartTimeframe)
                    {         ChartSetSymbolPeriod(currentChartID, currentChartSymbol, initialChartTimeframe); }
                    currentChartID        = ChartNext(previousChartID);
                    if(currentChartID < 0) {Print("break-->", currentChartID); break; } //end of chart list, currentChartID = -1
                    currentChartSymbol    = ChartSymbol(currentChartID);
                    currentChartTimeframe = ChartPeriod(currentChartID);
                    previousChartID       = currentChartID;
                    Sleep(1000);
                    i = i + 1; ///
          }
          ChartNext(previousChartID);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-ToolsController Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_UTILITIES::TransparentColor()
{         //-- SetTransparentColor
          int sRed = 88, sGreen = 88, sBlue = 88, sRGB = 0;
          sRGB = (sBlue << 16);
          sRGB |= (sGreen << 8);
          return sRGB |= sRed; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
color C_UTILITIES::sRGB_045_026_033()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "C_UTILITIES  Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          color rgb = C'92,79,161';//cool
          return rgb = C'45,26,33';//
}
//+------------------------------------------------------------------+
//|          IMPLANTING CLASS  Utilities BEGIN-END                   |
//+------------------------------------------------------------------+
