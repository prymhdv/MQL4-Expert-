//+------------------------------------------------------------------+
//||   ||||||||||                 eTradePanel.mqh                   ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
 
//+------------------------------------------------------------------+
//| enumerators                                                      |
//+------------------------------------------------------------------+
enum ENUM_CANDLE_PATTERNS  // candlestick patterns
{         THREE_BLACK_CROWS     = 1,
          THREE_WHITE_SOLDIERS  = 2,
          DARK_CLOUD_COVER      = 3,
          PIERCING_LINE         = 4,
          MORNING_DOJI          = 5,
          EVENING_DOJI          = 6,
          BEARISH_ENGULFING     = 7,
          BULLISH_ENGULFING     = 8,
          EVENING_STAR          = 9,
          MORNING_STAR          = 10,
          HAMMER                = 11,
          HANGING_MAN           = 12,
          BEARISH_HARAMI        = 13,
          BULLISH_HARAMI        = 14,
          BEARISH_MEETING_LINES = 15,
          BULLISH_MEETING_LINES = 16 };
//+------------------------------------------------------------------+
//| Stc_CandlePattern__There_bar class.                                            |
//| Derived from CExpertSignal class.                                |
//+------------------------------------------------------------------+
class Stc_CandlePattern__There_bar
{


public:
//--- class constructor
          Stc_CandlePattern__There_bar();
          //--- input parameters initialization methods
          void              MAPeriod(int period)        { m_ma_period = period; }


          //--- initialization
          virtual bool      ValidationSettings();

          //--- method for checking of a certiain candlestick pattern
          bool              Check_Candlestick_Pattern_enum(ENUM_CANDLE_PATTERNS CandlePattern);
          void              Check_Candlestick_Pattern(int _i = 0, ENUM_TIMEFRAMES _f = PERIOD_CURRENT);
          //--- methods for checking of bullish/bearish candlestick pattern
          bool              CheckPattern_All_Any_Bullish();
          bool              CheckPattern_All_Any_Bearish();
          //---
          bool              Is_Pattern_All_Any_Bullish;
          bool              Is_Pattern_All_Any_Bearish;
          //---
          ENUM_CANDLE_PATTERNS  Current_Patern;
          string                Current_Patern_Desc;
          //---check out
          bool              Is_Pattern_ThreeBlackCrows;
          bool              Is_Pattern_ThreeWhiteSoldiers;

          bool              Is_Pattern_DarkCloudCover;
          bool              Is_Pattern_PiercingLine;

          bool              Is_Pattern_MorningDoji;
          bool              Is_Pattern_EveningDoji;

          bool              Is_Pattern_BearishEngulfing;
          bool              Is_Pattern_BullishEngulfing;

          bool              Is_Pattern_EveningStar;
          bool              Is_Pattern_MorningStar;

          bool              Is_Pattern_Hammer;
          bool              Is_Pattern_HangingMan;

          bool              Is_Pattern_BearishHarami;
          bool              Is_Pattern_BullishHarami;

          bool              Is_Pattern_BearishMeetingLines;
          bool              Is_Pattern_BullishMeetingLines;
          //---check out desc
          string              desc_Pattern_ThreeBlackCrows;
          string              desc_Pattern_ThreeWhiteSoldiers;
          string              desc_Pattern_DarkCloudCover;
          string              desc_Pattern_PiercingLine;
          string              desc_Pattern_MorningDoji;
          string              desc_Pattern_EveningDoji;
          string              desc_Pattern_BearishEngulfing;
          string              desc_Pattern_BullishEngulfing;
          string              desc_Pattern_EveningStar;
          string              desc_Pattern_MorningStar;
          string              desc_Pattern_Hammer;
          string              desc_Pattern_HangingMan;
          string              desc_Pattern_BearishHarami;
          string              desc_Pattern_BullishHarami;
          string              desc_Pattern_BearishMeetingLines;
          string              desc_Pattern_BullishMeetingLines;
          //---

protected:  //---inner opption
          //---
          int                   i; //= 0,                index
          ENUM_TIMEFRAMES       f;// = PERIOD_CURRENT    time frame
          double                _Open(int _i)          const { return iOpen(  NULL, f, i + _i - 1); }   //--  - 1  for frist bar
          double                _Close(int _i)         const { return iClose( NULL, f, i + _i - 1); }
          double                _High(int _i)          const { return iHigh(  NULL, f, i + _i - 1); }
          double                _Low(int _i)           const { return iLow(   NULL, f, i + _i - 1); }

          datetime              _Time(int _i)          const { return iTime(  NULL, f, i + _i - 1); }
          long                  _Volume(int _i)        const { return iVolume(NULL, f, i + _i - 1); }
          //---
          //--- methods, used for check of the candlestick pattern formation
          double            AvgBody(int ind);          //---avrage candel for all candel in period and added ind
          double            MidPoint(int ind)          const { return(0.5 * (_High(ind) + _Low(ind)));   }     //--- '_High' - call non-const method for constant object  Bar_Candle_Patterns.mqh       111       78
          double            MidOpenClose(int ind)      const { return(0.5 * (_Open(ind) + _Close(ind))); }

          double            CloseAvg(int ind)          const { return(iMA(NULL, 0, ind, 0, MODE_EMA, PRICE_CLOSE, 0)); }

          //--- methods for checking of candlestick patterns
          bool              CheckPattern_ThreeBlackCrows();
          bool              CheckPattern_ThreeWhiteSoldiers();
          //---
          bool              CheckPattern_DarkCloudCover();
          bool              CheckPattern_PiercingLine();
          //---
          bool              CheckPattern_MorningDoji();
          bool              CheckPattern_EveningDoji();
          //---
          bool              CheckPattern_BearishEngulfing();
          bool              CheckPattern_BullishEngulfing();
          //---
          bool              CheckPattern_EveningStar();
          bool              CheckPattern_MorningStar();

          bool              CheckPattern_Hammer();
          bool              CheckPattern_HangingMan();

          bool              CheckPattern_BearishHarami();
          bool              CheckPattern_BullishHarami();

          bool              CheckPattern_BearishMeetingLines();
          bool              CheckPattern_BullishMeetingLines();
          ///
          int               m_ma_period;
          //---
};
//+------------------------------------------------------------------+
//| Stc_CandlePattern__There_bar class constructor.                                |
//| INPUT:  no.                                                      |
//| OUTPUT: no.                                                      |
//| REMARK: no.                                                      |
//+------------------------------------------------------------------+
void Stc_CandlePattern__There_bar::Stc_CandlePattern__There_bar()
{
//--- set default inputs
          m_ma_period = 12;
//---check out desc
          desc_Pattern_ThreeBlackCrows          = "Pattern_ThreeBlackCrows";
          desc_Pattern_ThreeWhiteSoldiers       = "Pattern_ThreeWhiteSoldiers";
          desc_Pattern_DarkCloudCover           = "Pattern_DarkCloudCover";
          desc_Pattern_PiercingLine             = "Pattern_PiercingLine";
          desc_Pattern_MorningDoji              = "Pattern_MorningDoji";
          desc_Pattern_EveningDoji              = "Pattern_EveningDoji";
          desc_Pattern_BearishEngulfing         = "Pattern_BearishEngulfing";
          desc_Pattern_BullishEngulfing         = "Pattern_BullishEngulfing";
          desc_Pattern_EveningStar              = "Pattern_EveningStar";
          desc_Pattern_MorningStar              = "Pattern_MorningStar";
          desc_Pattern_Hammer                   = "Pattern_Hammer";
          desc_Pattern_HangingMan               = "Pattern_HangingMan";
          desc_Pattern_BearishHarami            = "Pattern_BearishHarami";
          desc_Pattern_BullishHarami            = "Pattern_BullishHarami";
          desc_Pattern_BearishMeetingLines      = "Pattern_BearishMeetingLines";
          desc_Pattern_BullishMeetingLines      = "Pattern_BullishMeetingLines";;
//---
}
//+------------------------------------------------------------------+
//| Validation settings.                                             |
//| INPUT:  no.                                                      |
//| OUTPUT: true-if settings are correct, false otherwise.           |
//| REMARK: no.                                                      |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::ValidationSettings()
{
//--- initial data checks
          if(m_ma_period <= 0)
          {         printf(__FUNCTION__ + ": period MA must be greater than 0");
                    return(false); }
//--- ok
          return(true); }
//+------------------------------------------------------------------+
//| Returns the averaged value of candle body size                   |
//+------------------------------------------------------------------+
double Stc_CandlePattern__There_bar::AvgBody(int ind)
{         double candle_body = 0;
///--- calculate the averaged size of the candle's body
          for(int ind_ = ind; ind_ < ind + m_ma_period; ind_++) { candle_body += MathAbs(_Open(ind_) - _Close(ind_)); }
          candle_body = candle_body / m_ma_period;
///--- return body size
          return(candle_body); }
//+------------------------------------------------------------------+
//| Checks formation of bullish patterns                             |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_All_Any_Bullish()
{
//
          Is_Pattern_All_Any_Bullish = CheckPattern_ThreeWhiteSoldiers() ||
                                       CheckPattern_PiercingLine()       ||
                                       CheckPattern_MorningDoji()        ||
                                       CheckPattern_BullishEngulfing()   ||
                                       CheckPattern_BullishHarami()      ||
                                       CheckPattern_MorningStar()        ||
                                       CheckPattern_BullishMeetingLines();
          //---
          return(Is_Pattern_All_Any_Bullish);
          //
}
//+------------------------------------------------------------------+
//| Checks formation of bearish patterns                             |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_All_Any_Bearish()
{         //
          Is_Pattern_All_Any_Bearish = CheckPattern_ThreeBlackCrows()    ||
                                       CheckPattern_DarkCloudCover()     ||
                                       CheckPattern_EveningDoji()        ||
                                       CheckPattern_BearishEngulfing()   ||
                                       CheckPattern_BearishHarami()      ||
                                       CheckPattern_EveningStar()        ||
                                       CheckPattern_BearishMeetingLines();
          //---
          return(Is_Pattern_All_Any_Bearish);
          //
}
//+------------------------------------------------------------------+
//| Checks formation of Three Black Crows candlestick pattern        |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_ThreeBlackCrows()
{
//--- 3 Black Crows
          if(
                    (_Open(3) - _Close(3) > AvgBody(1)) && // long black
                    (_Open(2) - _Close(2) > AvgBody(1)) &&
                    (_Open(1) - _Close(1) > AvgBody(1)) &&
                    (MidPoint(2) < MidPoint(3))       && // lower midpoints
                    (MidPoint(1) < MidPoint(2))          //---
          )
          {         Current_Patern_Desc = desc_Pattern_ThreeBlackCrows = "Pattern_ThreeBlackCrows";
                    return (Is_Pattern_ThreeBlackCrows = true);//
          }
//---
          return(Is_Pattern_ThreeBlackCrows = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Three White Soldiers candlestick pattern     |
//+------------------------------------------------------------------+  !!! changing variable place   _Open(3) - _Close(3)  ---  _Close(3) - _Open(3)
bool Stc_CandlePattern__There_bar::CheckPattern_ThreeWhiteSoldiers()
{
//--- 3 White Soldiers
          if(
                    (_Close(3) - _Open(3) > AvgBody(1)) && // long white
                    (_Close(2) - _Open(2) > AvgBody(1)) &&
                    (_Close(1) - _Open(1) > AvgBody(1)) &&
                    (MidPoint(2) > MidPoint(3))       && // higher midpoints
                    (MidPoint(1) > MidPoint(2)))
          {         Current_Patern_Desc = desc_Pattern_ThreeWhiteSoldiers   = "Pattern_ThreeWhiteSoldiers";
                    return(Is_Pattern_ThreeWhiteSoldiers = true);//
          }
//---
          return(Is_Pattern_ThreeWhiteSoldiers = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Dark Cloud Cover candlestick pattern         |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_DarkCloudCover()
{
//--- Dark cloud cover
          if(
                    (_Close(2) - _Open(2) > AvgBody(1))  && // long white
                    (_Close(1) < _Close(2))              && // close within previous body
                    (_Close(1) > _Open(2))               &&
                    (MidOpenClose(2) > CloseAvg(1))    && // uptrend
                    (_Open(1) > _High(2)))              // open at new high
          {         Current_Patern_Desc = desc_Pattern_DarkCloudCover       = "Pattern_DarkCloudCover";
                    return(Is_Pattern_DarkCloudCover = true);//
          }
//---
          return(Is_Pattern_DarkCloudCover = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Piercing Line candlestick pattern            |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_PiercingLine()
{
//--- Piercing Line
          if(
                    (_Close(1) - _Open(1) > AvgBody(1)) && // long white
                    (_Open(2) - _Close(2) > AvgBody(1)) && // long black
                    (_Close(2) > _Close(1))             && // close inside previous body
                    (_Close(1) < _Open(2))              &&
                    (MidOpenClose(2) < CloseAvg(2))   && // downtrend
                    (_Open(1) < _Low(2)))              // close inside previous body
          {         Current_Patern_Desc = desc_Pattern_PiercingLine         = "Pattern_PiercingLine";
                    return(Is_Pattern_PiercingLine = true); //
          }
//---
          return(Is_Pattern_PiercingLine = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Morning Doji candlestick pattern             |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_MorningDoji()
{
//--- Morning Doji
          if(
                    (_Open(3) - _Close(3) > AvgBody(1))   &&
                    (AvgBody(2) < AvgBody(1) * 0.1)     &&
                    (_Close(2) < _Close(3))               &&
                    (_Open(2) < _Open(3))                 &&
                    (_Open(1) > _Close(2))                &&
                    (_Close(1) > _Close(2)))
          {         Current_Patern_Desc = desc_Pattern_MorningDoji          = "Pattern_MorningDoji";
                    return(Is_Pattern_MorningDoji = true);//
          }//
//---
          return(Is_Pattern_MorningDoji = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Evening Doji candlestick pattern             |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_EveningDoji()
{
//--- Evening Doji
          if(
                    (_Close(3) - _Open(3) > AvgBody(1)) &&
                    (AvgBody(2) < AvgBody(1) * 0.1)   &&
                    (_Close(2) > _Close(3))             &&
                    (_Open(2) > _Open(3))               &&
                    (_Open(1) < _Close(2))              &&
                    (_Close(1) < _Close(2)))
          {         Current_Patern_Desc = desc_Pattern_EveningDoji          = "Pattern_EveningDoji";
                    return(Is_Pattern_EveningDoji = true);//
          }
//---
          return(Is_Pattern_EveningDoji = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Bearish Engulfing candlestick pattern        |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_BearishEngulfing()
{
//--- Bearish Engulfing
          if(
                    (_Open(2) < _Close(2))              &&
                    (_Open(1) - _Close(1) > AvgBody(1)) &&
                    (_Close(1) < _Open(2))              &&
                    (MidOpenClose(2) > CloseAvg(2))   &&
                    (_Open(1) > _Close(2)))
          {         Current_Patern_Desc = desc_Pattern_BearishEngulfing     = "Pattern_BearishEngulfing";
                    return(Is_Pattern_BearishEngulfing = true);//
          }
//---
          return(Is_Pattern_BearishEngulfing = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Bullish Engulfing candlestick pattern        |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_BullishEngulfing()
{
//--- Bullish Engulfing
          if(
                    (_Open(2) > _Close(2))               &&
                    (_Close(1) - _Open(1) > AvgBody(1))  &&
                    (_Close(1) > _Open(2))               &&
                    (MidOpenClose(2) < CloseAvg(2))    &&
                    (_Open(1) < _Close(2)))
          {         Current_Patern_Desc = desc_Pattern_BullishEngulfing     = "Pattern_BullishEngulfing";
                    return(Is_Pattern_BullishEngulfing = true);//
          }
//---
          return(Is_Pattern_BullishEngulfing = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Evening Star candlestick pattern             |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_EveningStar()
{
//--- Evening Star
          if(
                    (_Close(3) - _Open(3) > AvgBody(1))                &&
                    (MathAbs(_Close(2) - _Open(2)) < AvgBody(1) * 0.5) &&
                    (_Close(2) > _Close(3))                            &&
                    (_Open(2) > _Open(3))                              &&
                    (_Close(1) < MidOpenClose(3)))
          {         Current_Patern_Desc = desc_Pattern_EveningStar          = "Pattern_EveningStar";
                    return(Is_Pattern_EveningStar = true); //
          }
//---
          return(Is_Pattern_EveningStar = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Morning Star candlestick pattern             |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_MorningStar()
{
//--- Morning Star
          if(
                    (_Open(3) - _Close(3) > AvgBody(1))                &&
                    (MathAbs(_Close(2) - _Open(2)) < AvgBody(1) * 0.5) &&
                    (_Close(2) < _Close(3))                            &&
                    (_Open(2) < _Open(3))                              &&
                    (_Close(1) > MidOpenClose(3)))
          {         Current_Patern_Desc = desc_Pattern_MorningStar          = "Pattern_MorningStar";
                    return(Is_Pattern_MorningStar = true);//
          }
//---
          return(Is_Pattern_MorningStar = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Hammer candlestick pattern                   |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_Hammer()
{
//--- Hammer
          if(
                    (MidPoint(1) < CloseAvg(2))                                         && // down trend
                    (MathMin(_Open(1), _Close(1)) > (_High(1) - (_High(1) - _Low(1)) / 3.0)) && // body in upper 1/3
                    (_Close(1) < _Close(2)) && (_Open(1) < _Open(2)))                          // body gap
          {         Current_Patern_Desc = desc_Pattern_Hammer               = "Pattern_Hammer";
                    return(Is_Pattern_Hammer = true); //
          }
//---
          return(Is_Pattern_Hammer = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Hanging Man candlestick pattern              |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_HangingMan()
{
//--- Hanging man
          if(
                    (MidPoint(1) > CloseAvg(2))                                        && // up trend
                    (MathMin(_Open(1), _Close(1) > (_High(1) - (_High(1) - _Low(1)) / 3.0)) && // body in upper 1/3
                     (_Close(1) > _Close(2)) && (_Open(1) > _Open(2))))                       // body gap
          {         Current_Patern_Desc = desc_Pattern_HangingMan           = "Pattern_HangingMan";
                    return(Is_Pattern_HangingMan = true);//
          }
//---
          return(Is_Pattern_HangingMan = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Bearish Harami candlestick pattern           |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_BearishHarami()
{
//--- Bearish Harami
          if(
                    (_Close(1) < _Open(1))                 && // black day
                    ((_Close(2) - _Open(2)) > AvgBody(1))  && // long white
                    ((_Close(1) > _Open(2))                &&
                     (_Open(1) < _Close(2)))               && // engulfment
                    (MidPoint(2) > CloseAvg(2)))            // up trend
          {         Current_Patern_Desc = desc_Pattern_BearishHarami        = "Pattern_BearishHarami";
                    return(Is_Pattern_BearishHarami = true);//
          }
//---
          return(Is_Pattern_BearishHarami = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Bullish Harami candlestick pattern           |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_BullishHarami()
{
//--- Bullish Harami
          if(
                    (_Close(1) > _Open(1))                 && // white day
                    ((_Open(2) - _Close(2)) > AvgBody(1))  && // long black
                    ((_Close(1) < _Open(2))                &&
                     (_Open(1) > _Close(2)))               && // engulfment
                    (MidPoint(2) < CloseAvg(2)))            // down trend
          {         Current_Patern_Desc = desc_Pattern_BullishHarami        = "Pattern_BullishHarami"; //
                    return(Is_Pattern_BullishHarami = true); //
          }
//---
          return(Is_Pattern_BullishHarami = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Bearish Meeting Lines candlestick pattern    |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_BearishMeetingLines()
{
//--- Bearish MeetingLines
          if(
                    (_Close(2) - _Open(2) > AvgBody(1))                  && // long white
                    ((_Open(1) - _Close(1)) > AvgBody(1))                && // long black
                    (MathAbs(_Close(1) - _Close(2)) < 0.1 * AvgBody(1)))    // doji close
          {         Current_Patern_Desc = desc_Pattern_BearishMeetingLines  = "Pattern_BearishMeetingLines";
                    return(Is_Pattern_BearishMeetingLines = true);//
          }
//---
          return(Is_Pattern_BearishMeetingLines = false); //
}
//+------------------------------------------------------------------+
//| Checks formation of Bullish Meeting Lines candlestick pattern    |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::CheckPattern_BullishMeetingLines()
{
//--- Bullish MeetingLines
          if(
                    (_Open(2) - _Close(2) > AvgBody(1))                  && // long black
                    ((_Close(1) - _Open(1)) > AvgBody(1))                && // long white
                    (MathAbs(_Close(1) - _Close(2)) < 0.1 * AvgBody(1)))    // doji close
          {         Current_Patern_Desc = desc_Pattern_BullishMeetingLines  = "Pattern_BullishMeetingLines";
                    return(Is_Pattern_BullishMeetingLines = true);//
          }
//---
          return(Is_Pattern_BullishMeetingLines = false); //
}
//-------------------------------------------------------------------+
//| Checks formation of a certain candlestick pattern                |
//+------------------------------------------------------------------+
bool Stc_CandlePattern__There_bar::Check_Candlestick_Pattern_enum(ENUM_CANDLE_PATTERNS CandlePattern)
{         switch(CandlePattern)
          {         case THREE_BLACK_CROWS:      return(CheckPattern_ThreeBlackCrows());
                    case THREE_WHITE_SOLDIERS:   return(CheckPattern_ThreeWhiteSoldiers());
                    case DARK_CLOUD_COVER:       return(CheckPattern_DarkCloudCover());
                    case PIERCING_LINE:          return(CheckPattern_PiercingLine());
                    case MORNING_DOJI:           return(CheckPattern_MorningDoji());
                    case EVENING_DOJI:           return(CheckPattern_EveningDoji());
                    case BEARISH_ENGULFING:      return(CheckPattern_BearishEngulfing());
                    case BULLISH_ENGULFING:      return(CheckPattern_BullishEngulfing());
                    case EVENING_STAR:           return(CheckPattern_EveningStar());
                    case MORNING_STAR:           return(CheckPattern_MorningStar());
                    case HAMMER:                 return(CheckPattern_Hammer());
                    case HANGING_MAN:            return(CheckPattern_HangingMan());
                    case BEARISH_HARAMI:         return(CheckPattern_BearishHarami());
                    case BULLISH_HARAMI:         return(CheckPattern_BullishHarami());
                    case BEARISH_MEETING_LINES:  return(CheckPattern_BearishMeetingLines());
                    case BULLISH_MEETING_LINES:  return(CheckPattern_BullishMeetingLines());//
          }
//---
          return(false);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Stc_CandlePattern__There_bar::Check_Candlestick_Pattern(int _i = 0, ENUM_TIMEFRAMES _f = PERIOD_CURRENT)
{         //---
          i = _i; f = _f;
          CheckPattern_ThreeBlackCrows();               Check_Candlestick_Pattern_enum(THREE_BLACK_CROWS);
          CheckPattern_ThreeWhiteSoldiers();            Check_Candlestick_Pattern_enum(THREE_WHITE_SOLDIERS);
          //---
          CheckPattern_DarkCloudCover();                Check_Candlestick_Pattern_enum(DARK_CLOUD_COVER);
          CheckPattern_PiercingLine();                  Check_Candlestick_Pattern_enum(PIERCING_LINE);
          //---
          CheckPattern_MorningDoji();                   Check_Candlestick_Pattern_enum(MORNING_DOJI);
          CheckPattern_EveningDoji();                   Check_Candlestick_Pattern_enum(EVENING_DOJI);
          //---
          CheckPattern_BearishEngulfing();              Check_Candlestick_Pattern_enum(BEARISH_ENGULFING);
          CheckPattern_BullishEngulfing();              Check_Candlestick_Pattern_enum(BULLISH_ENGULFING);
          //---
          CheckPattern_EveningStar();                   Check_Candlestick_Pattern_enum(EVENING_STAR);
          CheckPattern_MorningStar();                   Check_Candlestick_Pattern_enum(MORNING_STAR);
          //---
          CheckPattern_Hammer();                        Check_Candlestick_Pattern_enum(HAMMER);
          CheckPattern_HangingMan();                    Check_Candlestick_Pattern_enum(HANGING_MAN);
          //---
          CheckPattern_BearishHarami();                 Check_Candlestick_Pattern_enum(BEARISH_HARAMI);
          CheckPattern_BullishHarami();                 Check_Candlestick_Pattern_enum(BULLISH_HARAMI);
          //---
          CheckPattern_BearishMeetingLines();           Check_Candlestick_Pattern_enum(BEARISH_MEETING_LINES);
          CheckPattern_BullishMeetingLines();           Check_Candlestick_Pattern_enum(BULLISH_MEETING_LINES);//
          //---
          CheckPattern_All_Any_Bullish();
          CheckPattern_All_Any_Bearish();
          //----
          if(false)
          {         string Desc = "";
                    Desc = Utilities.TimeFrameToString(_f) + "   ";
                    //----
                    if(Is_Pattern_ThreeBlackCrows)             { Alert(Desc + "Is_Pattern_ThreeBlackCrows");         Current_Patern = THREE_BLACK_CROWS ;}
                    else if(Is_Pattern_ThreeWhiteSoldiers)     { Alert(Desc + "Is_Pattern_ThreeWhiteSoldiers");      Current_Patern = THREE_WHITE_SOLDIERS ;}
                    //----
                    else if(Is_Pattern_DarkCloudCover)         { Alert(Desc + "Is_Pattern_DarkCloudCover");          Current_Patern = DARK_CLOUD_COVER ;}
                    else if(Is_Pattern_PiercingLine)           { Alert(Desc + "Is_Pattern_PiercingLine");            Current_Patern = PIERCING_LINE ;}
                    //----
                    else if(Is_Pattern_MorningDoji)            { Alert(Desc + "Is_Pattern_MorningDoji");             Current_Patern = MORNING_DOJI ;}
                    else if(Is_Pattern_EveningDoji)            { Alert(Desc + "Is_Pattern_EveningDoji");             Current_Patern = EVENING_DOJI ;}
                    //----
                    else if(Is_Pattern_BearishEngulfing)       { Alert(Desc + "Is_Pattern_BearishEngulfing");        Current_Patern = BEARISH_ENGULFING ;}
                    else if(Is_Pattern_BullishEngulfing)       { Alert(Desc + "Is_Pattern_BullishEngulfing");        Current_Patern = BULLISH_ENGULFING ;}
                    //----
                    else if(Is_Pattern_EveningStar)            { Alert(Desc + "Is_Pattern_EveningStar");             Current_Patern = EVENING_STAR ;}
                    else if(Is_Pattern_MorningStar)            { Alert(Desc + "Is_Pattern_MorningStar");             Current_Patern = MORNING_STAR ;}
                    //----
                    else if(Is_Pattern_Hammer)                 { Alert(Desc + "Is_Pattern_Hammer");                  Current_Patern = HAMMER ;}
                    else if(Is_Pattern_HangingMan)             { Alert(Desc + "Is_Pattern_HangingMan");              Current_Patern = HANGING_MAN ;}
                    //----
                    else if(Is_Pattern_BearishHarami)          { Alert(Desc + "Is_Pattern_BearishHarami");           Current_Patern = BEARISH_HARAMI ;}
                    else if(Is_Pattern_BullishHarami)          { Alert(Desc + "Is_Pattern_BullishHarami");           Current_Patern = BULLISH_HARAMI ;}
                    //----
                    else if(Is_Pattern_BearishMeetingLines)    { Alert(Desc + "Is_Pattern_BearishMeetingLines");     Current_Patern = BEARISH_MEETING_LINES ;}
                    else if(Is_Pattern_BullishMeetingLines)    { Alert(Desc + "Is_Pattern_BullishMeetingLines");     Current_Patern = BULLISH_MEETING_LINES ;} //
          }
          //----
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
