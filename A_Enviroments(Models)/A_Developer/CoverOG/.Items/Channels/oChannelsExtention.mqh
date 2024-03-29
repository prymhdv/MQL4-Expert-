//+------------------------------------------------------------------+
//||   ||||||||||             Graphical_Item_Solid.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOGC\.CoverOGC.mqh>
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Graphical_Item_Solid.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Lines\oLines.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Fibos\oFibos.mqh>;
void Witch_Is_Grater(double a, double b, double &Grater, double &Little)
{         if(a > b)
          {         Little = b;
                    Grater = a;//
                    //
          }
          else
          {         //
                    Little = a;
                    Grater = b;//
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sg_Point
{         double      Price;
          datetime    Time;
          int         Shift;

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

struct Sg_Line
{         string                _Name;
          Sc_Dev_math           Dev_Math;
          Sg_Point              _Point_A;
          Sg_Point              _Point_B;
          double                Slope;
          double                Slope_Per_Bar;
          color                 _Color;
          int                   _Width;
          bool                  _Ray;
          ENUM_LINE_STYLE       _STYLE;
          double                _Distance_Bid;
          double                _Distance_Ask;

};
struct Sg_Line_Data
{         datetime      Line_t1;//         = s_FIBO_EXPANSION.TIME1;
          double        Line_p1;//         = s_FIBO_EXPANSION.PRICE1;
          datetime      Line_t2;//         = s_FIBO_EXPANSION.TIME2;
          double        Line_p2;//         = s_FIBO_EXPANSION.PRICE2;
          datetime      Line_t3;//         = s_FIBO_EXPANSION.TIME3;
          double        Line_p3;//         = s_FIBO_EXPANSION.PRICE3;
          bool          Is_Bullish;//      = s_FIBO_EXPANSION.Is_Bulish;
//
          int           WhichMode;// = MODE_CREATE;
          bool          IsKey;//     = true;
          color         c;//         = clrYellow;
          int           w ;//        = 1;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define  ChannelNavigation_Upper_UP      "ChannelNavigation_Upper_UP"           //      1
#define  ChannelNavigation_Upper_Down    "ChannelNavigation_Upper_Down"         //      2
#define  ChannelNavigation_Middle_UP     "ChannelNavigation_Middle_UP"          //      3
#define  ChannelNavigation_Middle_Midle  "ChannelNavigation_Middle_Midle"       //      4
#define  ChannelNavigation_Middle_Down   "ChannelNavigation_Middle_Down"        //      4
#define  ChannelNavigation_Lower_UP      "ChannelNavigation_Lower_UP"           //      5
#define  ChannelNavigation_Lower_Down    "ChannelNavigation_Lower_Down"         //      6
//***************************************
struct C_Channels_Extention_base
{

          void          C_Channels_Extention_base() {}
          void           C_Channels_Extention_base(string n, ENUM_TIMEFRAMES tf ) {}

          void          ~C_Channels_Extention_base() {}
          void          Draw_Channels( bool IsKey,  S_FIBO_EXPANSION & s_FIBO_EXPANSION);

          Sg_Line       LineA;
          Sg_Line       LineB;
          Sg_Line       LineC;
          Sg_Line       Line_Lower;
          Sg_Line       Line_Upper;
          Sg_Line       Line_Lower_Middle;
          Sg_Line       Line_Upper_Middle;
          //*******************************
          double        highth_p1_p2;//       = MathAbs(_data.Line_p1 - _data.Line_p2);
          double        highth_p2_p3;//       = MathAbs(_data.Line_p2 - _data.Line_p3);
          bool          Is_Leg_One_Larger;//
          double        Channel_Size;          // lineA.Price - LineB.Price
          void          Clac_ChannelSize(Sg_Line_Data &_data) { Channel_Size = MathAbs(ObjectGetValueByTime(0, "Lines.Trend " + "FiboExpantion-TrendLine1", _data.Line_t2) - _data.Line_p2); Channel_Size = NormalizeDouble(Channel_Size, Digits + 1); /*Alert("Channel_Size: ", Channel_Size);*/}
          string        ChannelNavigation_Desc;             // 6 limit + 2 extra //
          int           ChannelNavigation_Value;
          //********************************

          C_Lines       _Lines;
          //Cgs_DevObjectPack          Object_Pack;
          void       Draw_Channel_Line_A(Sg_Line_Data &_data);
          void       Draw_Channel_Line_B(Sg_Line_Data & _data);
          void       Draw_Channel_Line_B_By_Slope(Sg_Line_Data & _data);
          void       Draw_Channel_Line_Middle(Sg_Line_Data &_data);
          void       Draw_Channel_Line_LowerBand(Sg_Line_Data &_data);
          void       Draw_Channel_Line_UpperBand(Sg_Line_Data &_data);
          //
          void C_Channels_Extention_base::Draw_Channel_Line_LowerBand_Middle(Sg_Line_Data & _data);
          void C_Channels_Extention_base::Draw_Channel_Line_UpperBand_Middle(Sg_Line_Data & _data);
          //

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Channels_Extention_base:: Draw_Channels( bool IsKey,  S_FIBO_EXPANSION & s_FIBO_EXPANSION)
{         //---draw the channel for fibo expantion
//---draw the channel for fibo expantion
//---push***
          Sg_Line_Data  _data_;
          _data_.Line_t1         = s_FIBO_EXPANSION.TIME1;
          _data_.Line_p1         = s_FIBO_EXPANSION.PRICE1;
          _data_.Line_t2         = s_FIBO_EXPANSION.TIME2;
          _data_.Line_p2         = s_FIBO_EXPANSION.PRICE2;
          _data_.Line_t3         = s_FIBO_EXPANSION.TIME3;
          _data_.Line_p3         = s_FIBO_EXPANSION.PRICE3;
          _data_.Is_Bullish      = s_FIBO_EXPANSION.Is_Bulish;
//
          _data_.WhichMode = MODE_CREATE;
          _data_.IsKey     = IsKey;
          _data_.c         = clrYellow;
          _data_.w         = 1;
//*************************************************************
          if(true)
          {         /*
                    calc slope of line frist
                    define price2 of line2
                    */
                    Draw_Channel_Line_A(_data_);          Clac_ChannelSize(_data_);
                    Draw_Channel_Line_B(_data_);
                    Draw_Channel_Line_Middle(_data_);
                    Draw_Channel_Line_LowerBand(_data_);
                    Draw_Channel_Line_UpperBand(_data_);
                    Draw_Channel_Line_LowerBand_Middle(_data_);
                    Draw_Channel_Line_UpperBand_Middle(_data_);
                    /*************************************
                    Define data Lines
                    **************************************/
                    for(int i = 0; i < 501; i++)
                    {         double    Line_Trend_price_By_Shift       = ObjectGetValueByShift("Lines.Trend " + "FiboExpantion-TrendLine1", i); // bar index
                              int       Line_Trend_shift_By_Price       = ObjectGetShiftByValue("Lines.Trend " + "FiboExpantion-TrendLine1", 1746.85);
                              datetime  Line_Trend_Time_By_Price        = ObjectGetTimeByValue( 0, "Lines.Trend " + "FiboExpantion-TrendLine1", 1746.85, 0 );//--int line_id = 0
                              double    Line_Trend_Price_By_Time        = ObjectGetValueByTime( 0, "Lines.Trend " + "FiboExpantion-TrendLine1", Line_Trend_Time_By_Price, 0 );
                              //Alert("Line_Trend_price_By_Shift: ", Line_Trend_price_By_Shift);//
                              //
                    }
                    LineA._Distance_Bid                 =  MathAbs( ObjectGetValueByShift(LineA._Name,                  0)  - Bid); LineA._Distance_Bid                 = NormalizeDouble(LineA._Distance_Bid,                  Digits + 1); //Alert("LineA._Distance_Bid:",                      LineA._Distance_Bid );
                    LineB._Distance_Bid                 =  MathAbs( ObjectGetValueByShift(LineB._Name,                  0)  - Bid); LineB._Distance_Bid                 = NormalizeDouble(LineB._Distance_Bid,                  Digits + 1); //Alert("LineB._Distance_Bid:",                      LineB._Distance_Bid );
                    LineC._Distance_Bid                 =  MathAbs( ObjectGetValueByShift(LineC._Name,                  0)  - Bid); LineC._Distance_Bid                 = NormalizeDouble(LineC._Distance_Bid,                  Digits + 1); //Alert("LineC._Distance_Bid:",                      LineC._Distance_Bid );
                    Line_Lower._Distance_Bid            =  MathAbs( ObjectGetValueByShift(Line_Lower._Name,             0)  - Bid); Line_Lower._Distance_Bid            = NormalizeDouble(Line_Lower._Distance_Bid,             Digits + 1); //Alert("Line_Lower._Distance_Bid:",                 Line_Lower._Distance_Bid );
                    Line_Lower_Middle._Distance_Bid     =  MathAbs( ObjectGetValueByShift(Line_Lower_Middle._Name,      0)  - Bid); Line_Lower_Middle._Distance_Bid     = NormalizeDouble(Line_Lower_Middle._Distance_Bid,      Digits + 1); //Alert("Line_Lower_Middle._Distance_Bid:",          Line_Lower_Middle._Distance_Bid );
                    Line_Upper._Distance_Bid            =  MathAbs( ObjectGetValueByShift(Line_Upper._Name,             0)  - Bid); Line_Upper._Distance_Bid            = NormalizeDouble(Line_Upper._Distance_Bid,             Digits + 1); //Alert("Line_Upper._Distance_Bid:",                 Line_Upper._Distance_Bid );
                    Line_Upper_Middle._Distance_Bid     =  MathAbs( ObjectGetValueByShift(Line_Upper_Middle._Name,      0)  - Bid); Line_Upper_Middle._Distance_Bid     = NormalizeDouble(Line_Upper_Middle._Distance_Bid,      Digits + 1); //Alert("Line_Upper_Middle._Distance_Bid:",          Line_Upper_Middle._Distance_Bid );
                    //---
                    /*************************
                    define ChannelNavigation
                    *************************/
                    {         //------which is litle
                              double Little = 0;
                              //------
                              //---a b c d e f
                              {         double n1, n2, n3, n4, n5, n6, n7;
                                        n1 = LineA._Distance_Bid;
                                        n2 = LineB._Distance_Bid;
                                        n3 = LineC._Distance_Bid;
                                        n4 = Line_Lower._Distance_Bid;
                                        n5 = Line_Lower_Middle._Distance_Bid;
                                        n6 = Line_Upper._Distance_Bid;
                                        n7 = Line_Upper_Middle._Distance_Bid;//
                                        // if n1 is greater than both n2 and n3, n1 is the largest
                                        if (n1 < n2 && n1 < n3 && n1 < n4 && n1 < n5 && n1 < n6 && n1 < n7) {Little = n1;        ChannelNavigation_Desc = ChannelNavigation_Middle_Down;}
                                        //the largest number.", n1
                                        //
                                        // if n2 is greater than both n1 and n3, n2 is the largest
                                        if (n2 < n1 && n2 < n3 && n2 < n4 && n2 < n5 && n2 < n6 && n2 < n7) {Little = n2;        ChannelNavigation_Desc = ChannelNavigation_Middle_UP;}
                                        //the largest number.", n2
                                        //
                                        // if n3 is greater than both n1 and n2, n3 is the largest
                                        if (n3 < n1 && n3 < n2 && n3 < n4 && n3 < n5 && n3 < n6 && n3 < n7) {Little = n3;        ChannelNavigation_Desc = ChannelNavigation_Middle_Midle;}
                                        //the largest number.", n3
                                        // if n1 is greater than both n2 and n3, n1 is the largest
                                        if (n4 < n1 && n4 < n2 && n4 < n3 && n4 < n5 && n4 < n6 && n4 < n7) {Little = n4;        ChannelNavigation_Desc = ChannelNavigation_Lower_Down;}
                                        //the largest number.", n1
                                        //
                                        // if n2 is greater than both n1 and n3, n2 is the largest
                                        if (n5 < n1 && n5 < n2 && n5 < n3 && n5 < n4 && n5 < n6 && n5 < n7) {Little = n5;        ChannelNavigation_Desc = ChannelNavigation_Lower_UP;}
                                        //the largest number.", n2
                                        //
                                        // if n3 is greater than both n1 and n2, n3 is the largest
                                        if (n6 < n1 && n6 < n2 && n6 < n3 && n6 < n4 && n6 < n5 && n6 < n7) {Little = n6;        ChannelNavigation_Desc = ChannelNavigation_Upper_Down;}
                                        //the largest number.", n3
                                        //
                                        // if n3 is greater than both n1 and n2, n3 is the largest
                                        if (n7 < n1 && n7 < n2 && n7 < n3 && n7 < n4 && n7 < n5 && n7 < n6) {Little = n7;        ChannelNavigation_Desc = ChannelNavigation_Upper_UP;}
                                        //the largest number.", n3
                              }
                              /**********************************************************************
                              ***********************************************************************/
                              //
                              //Alert("Little: ", Little, "     ChannelNavigation: ", ChannelNavigation_Desc  );
                              //
                    }
                    /*************************************
                    Is Touched Lines
                    **************************************/
                    {         bool Is_Cross = ObjectGetValueByShift("Lines.Trend " + "FiboExpantionTrendLine1", 0) <= Ask;
                              if(!_data_.Is_Bullish && Is_Cross)
                              {         //Alert("Is_Cross" + "Lines.Trend " + "FiboExpantion-TrendLine1 : ", Is_Cross); //
                                        bool   Is_Trend_Line_Touched_DownSide_Downwarding_Price = (!_data_.Is_Bullish && Is_Cross) ? true : false; //
                              } //
                              if(_data_.Is_Bullish && !Is_Cross)
                              {         //Alert("Is_Cross" + "Lines.Trend " + "FiboExpantion-TrendLine1 : ", Is_Cross); //
                                        bool  Is_Trend_Line_Touched_UpSide_Forwarding_Price = (_data_.Is_Bullish && !Is_Cross) ? true : false; //
                              }//
                    }
                    //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Channels_Extention_base::Draw_Channel_Line_A(Sg_Line_Data &_data)
{         highth_p1_p2       = MathAbs(_data.Line_p1 - _data.Line_p2);
          highth_p2_p3       = MathAbs(_data.Line_p2 - _data.Line_p3);
          Is_Leg_One_Larger    = highth_p1_p2 > highth_p2_p3;
//*************
//----some new FiboExpantionTrendLine1
//*************
          LineA._Point_A.Time  = _data.Line_t1;
          LineA._Point_A.Price = _data.Line_p1;
          LineA._Point_B.Time  = _data.Line_t3;
          LineA._Point_B.Price = _data.Line_p3;
          LineA._Name   = "Lines.Trend " + "FiboExpantion-TrendLine1";
          LineA._Color  = _data.c;
          LineA._Width  = _data.w;
          LineA._Ray    = true;
          LineA._STYLE  = STYLE_DOT;
          _Lines.Trend.Draw_GDS_Lines(_data.WhichMode, _data.IsKey, "FiboExpantion-TrendLine1","", LineA._Point_A.Time, LineA._Point_A.Price, LineA._Point_B.Time, LineA._Point_B.Price, LineA._Color, LineA._Width, LineA._Ray, LineA._STYLE, FALSE);     // ---------------------------------------------------------------OK
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Channels_Extention_base::Draw_Channel_Line_B_By_Slope(Sg_Line_Data & _data)
{
          {         // y = mx+b;  m = (y2-y1) / (x2-x1)     y = mx + b == y = mx + b
                    LineA.Slope           = 0;  ///t1 is larger   //--p1 is higher bulish
                    LineA.Slope_Per_Bar   = 0;
                    LineA._Point_A.Shift  = iBarShift(NULL, 0, _data.Line_t1);
                    LineA._Point_B.Shift  = iBarShift(NULL, 0, _data.Line_t2);
                    //------------------------------------------------------------------
                    //---- price bar
                    if(_data.Is_Bullish)  { LineA.Slope = LineA.Dev_Math.calcSlope(LineA._Point_B.Price, LineA._Point_A.Price, LineA._Point_A.Shift, LineA._Point_B.Shift);} //---nok
                    else                  { LineA.Slope = LineA.Dev_Math.calcSlope(LineA._Point_A.Price, LineA._Point_B.Price, LineA._Point_A.Shift, LineA._Point_B.Shift);} //---nok
                    //---- time pric
                    if(_data.Is_Bullish)  { LineA.Slope = LineA.Dev_Math.calcSlope(LineA._Point_B.Price, LineA._Point_A.Price, LineA._Point_B.Time, LineA._Point_A.Time);} //---nok
                    else                  { LineA.Slope = LineA.Dev_Math.calcSlope(LineA._Point_B.Price, LineA._Point_A.Price, LineA._Point_B.Time, LineA._Point_A.Time);} //---nok //---make negative slope
                    //------------------------------------------------------------------
                    //LineA.Slope = NormalizeDouble(LineA.Slope, Digits);
                    //---Alert("LineA.Slope: ",  LineA.Slope );// * Point;  //--very well
                    //*****************************************************************************************
                    int BarCount_t1_t2 = 0; // = (t1 - t2) / Period();
                    int BarCount_t2_t3 = 0; // = (t1 - t2) / Period();
                    //
                    BarCount_t1_t2 = (iBarShift(NULL, 0, _data.Line_t1) - iBarShift(NULL, 0, _data.Line_t2)) + 1;
                    BarCount_t2_t3 = (iBarShift(NULL, 0, _data.Line_t2) - iBarShift(NULL, 0, _data.Line_t3)) + 1;  //--fibo extention
                    int BarCount_Pixel_t1_t2 = BarCount_t1_t2 * 2;
                    double BarCount_Pixel_Price_t1_t2 =  BarCount_Pixel_t1_t2;//--- Alert("BarCount_Pixel_Price_t1_t2:", BarCount_Pixel_Price_t1_t2);// * Point;  //--very well
                    //
                    int BarCount_Pixel_t2_t3 = BarCount_t2_t3 * 2;
                    double BarCount_Pixel_Price_t2_t3 =  BarCount_Pixel_t2_t3;//--- Alert("BarCount_Pixel_Price_t2_t3:", BarCount_Pixel_Price_t2_t3);// * Point;  //--very well
                    //---
                    LineA.Slope_Per_Bar = (LineA.Slope * BarCount_t1_t2 ) / Period() * Point;        //--- Alert("LineA.Slope_Per_Bar:", LineA.Slope_Per_Bar, "  Period(): ", Period()); // * Point;  //--very well
          }//
          {         LineB._Point_A.Time  = _data.Line_t2;
                    LineB._Point_A.Price = _data.Line_p2;// - Diff_P3_P2; //ok
                    LineB._Point_B.Time  = _data.Line_t3;
                    LineB._Point_B.Price = 0;
                    LineB._Point_B.Price = (_data.Is_Bullish) ? _data.Line_p3 + Channel_Size : _data.Line_p3 - Channel_Size ; //--???  "YASHA AZERBAYCAN"////
                    //**************************
                    if(false) //--using channel size too do ..
                    {         if(true)
                              {         double      Diff_Price =  LineB._Point_A.Price * LineA.Slope_Per_Bar  ; //---Alert("Diff_Price:", Diff_Price); //--200
                                        if(_data.Is_Bullish)        {LineB._Point_B.Price = LineB._Point_A.Price + Diff_Price; }//+ BarCount_Pixel_Price_t2_t3;
                                        else                        {LineB._Point_B.Price = LineB._Point_A.Price - Diff_Price; }//+ BarCount_Pixel_Price_t2_t3; //y = mx + b /// b= y-mx
                              }
                              //**************************
                              if(true)          //--linr formul is acheved **~**~**~**
                              {         if(_data.Is_Bullish)
                                        {         double   B_Diff = LineA.Dev_Math.GetB_LineFormule(LineA.Slope, LineB._Point_A.Time, LineB._Point_A.Price);      //---Alert("-----  B_Diff: ",  B_Diff );// * Point;  //--very well  the B_Diff are the same but the time and price change...
                                                  LineB._Point_B.Price        = LineA.Dev_Math.GetY_LineFormule(LineA.Slope, _data.Line_t3, B_Diff);//
                                        }
                                        else
                                        {         double   B_Diff = LineA.Dev_Math.GetB_LineFormule(LineA.Slope, LineB._Point_A.Time, LineB._Point_A.Price);      //--- Alert("-----  B_Diff: ",  B_Diff );  // * Point;  //--very well  the B_Diff are the same but the time and price change...
                                                  LineB._Point_B.Price        = LineA.Dev_Math.GetY_LineFormule(LineA.Slope, _data.Line_t3, B_Diff - 0) ;    //--- Alert("-----  LineB._Point_B.Price: ",  LineB._Point_B.Price ); //---*****errorr******  On Test   "B_Diff - 2.05" work
                                        }//
                              } //
                    }//
          } //
          {         //--highth not work...
          }//
          LineB._Name   = "Lines.Trend " + "FiboExpantion-TrendLine2";
          LineB._Color  = _data.c;
          LineB._Width  = _data.w;
          LineB._Ray    = true;
          LineB._STYLE  = STYLE_DOT;
          _Lines.Trend.Draw_GDS_Lines(_data.WhichMode, _data.IsKey, "FiboExpantion-TrendLine2","", LineB._Point_A.Time, LineB._Point_A.Price, LineB._Point_B.Time, LineB._Point_B.Price, LineB._Color, LineB._Width, LineB._Ray, LineB._STYLE, FALSE);   ///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Channels_Extention_base::Draw_Channel_Line_B(Sg_Line_Data & _data)
{         //
          LineB._Point_A.Time  = _data.Line_t1;// _data.Line_t1 -- not confirmed
          LineB._Point_A.Price = _data.Line_p2;// - Diff_P3_P2; //ok
          LineB._Point_B.Time  = _data.Line_t3;
          LineB._Point_B.Price = 0;
          //
          LineB._Point_A.Time  = _data.Line_t1;// _data.Line_t1 -- not confirmed
          LineB._Point_A.Price = (_data.Is_Bullish) ? _data.Line_p1 + Channel_Size : _data.Line_p1 - Channel_Size ; //--???  "YASHA AZERBAYCAN"////
          //
          LineB._Point_B.Time  = _data.Line_t3;
          LineB._Point_B.Price = (_data.Is_Bullish) ? _data.Line_p3 + Channel_Size : _data.Line_p3 - Channel_Size ; //--???  "YASHA AZERBAYCAN"////
//---
          LineB._Name   = "Lines.Trend " + "FiboExpantion-TrendLine2";
          LineB._Color  = _data.c;
          LineB._Width  = _data.w;
          LineB._Ray    = true;
          LineB._STYLE  = STYLE_DOT;
          _Lines.Trend.Draw_GDS_Lines(_data.WhichMode, _data.IsKey, "FiboExpantion-TrendLine2","", LineB._Point_A.Time, LineB._Point_A.Price, LineB._Point_B.Time, LineB._Point_B.Price, LineB._Color, LineB._Width, LineB._Ray, LineB._STYLE, FALSE);    //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Channels_Extention_base::Draw_Channel_Line_Middle(Sg_Line_Data &_data)
{         LineC._Point_A.Time  = _data.Line_t1;;
          LineC._Point_A.Price = 0;
          LineC._Point_B.Time  = _data.Line_t3;
          LineC._Point_B.Price = 0;
          if(_data.Is_Bullish)
          {         LineC._Point_A.Price = LineA._Point_A.Price + Channel_Size / 2;
                    LineC._Point_B.Price = LineA._Point_B.Price + Channel_Size / 2;
                    //
          }
          else
          {         LineC._Point_A.Price = LineA._Point_A.Price  - Channel_Size / 2;
                    LineC._Point_B.Price = LineA._Point_B.Price  - Channel_Size / 2;//
          }
          if(false) //--linr formul is acheved **~**~**~**
          {         if(_data.Is_Bullish)
                    {         double   B_Diff           =  LineA.Dev_Math.GetB_LineFormule(LineA.Slope, LineC._Point_B.Time, LineC._Point_B.Price);  //---Alert("-----  B_Diff: ",  B_Diff );// * Point;  //--very well  the B_Diff are the same but the time and price change...
                              LineC._Point_A.Price      =  LineA.Dev_Math.GetY_LineFormule(LineA.Slope, LineC._Point_A.Time, B_Diff);//
                    }
                    else
                    {         double   B_Diff           =  LineA.Dev_Math.GetB_LineFormule(LineA.Slope, LineC._Point_B.Time, LineC._Point_B.Price);  //---Alert("-----  B_Diff: ",  B_Diff );// * Point;  //--very well  the B_Diff are the same but the time and price change...
                              LineC._Point_A.Price      =  LineA.Dev_Math.GetY_LineFormule(LineA.Slope, LineC._Point_A.Time, B_Diff);//
                    }//
          }
          LineC._Name   = "Lines.Trend " + "FiboExpantion-TrendLine3";
          LineC._Color  = _data.c;
          LineC._Width  = _data.w;
          LineC._Ray    = true;
          LineC._STYLE  = STYLE_DOT;
          _Lines.Trend.Draw_GDS_Lines(_data.WhichMode, _data.IsKey, "FiboExpantion-TrendLine3","", LineC._Point_A.Time, LineC._Point_A.Price, LineC._Point_B.Time, LineC._Point_B.Price, LineC._Color, LineC._Width, LineC._Ray, LineC._STYLE, FALSE);    //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Channels_Extention_base::Draw_Channel_Line_LowerBand(Sg_Line_Data & _data)
{         //
//
          Line_Lower._Point_A.Time      = _data.Line_t1;;
          Line_Lower._Point_A.Price     = 0;
          Line_Lower._Point_B.Time      = _data.Line_t3;
          Line_Lower._Point_B.Price     = 0;
          if(_data.Is_Bullish)
          {         Line_Lower._Point_A.Price = LineA._Point_A.Price - Channel_Size;
                    Line_Lower._Point_B.Price = LineA._Point_B.Price - Channel_Size;
                    //
          }
          else
          {         Line_Lower._Point_A.Price = LineA._Point_A.Price  + Channel_Size;
                    Line_Lower._Point_B.Price = LineA._Point_B.Price  + Channel_Size;//
          }
//**************************************************************************************
          Line_Lower._Name   = "Lines.Trend " + "FiboExpantion-TrendLine_Lower";
          Line_Lower._Color  = _data.c;
          Line_Lower._Width  = _data.w = 2;;
          Line_Lower._Ray    = true;
          Line_Lower._STYLE  = STYLE_DOT;
          _Lines.Trend.Draw_GDS_Lines(_data.WhichMode, _data.IsKey, "FiboExpantion-TrendLine_Lower","", Line_Lower._Point_A.Time, Line_Lower._Point_A.Price, Line_Lower._Point_B.Time, Line_Lower._Point_B.Price, Line_Lower._Color, Line_Lower._Width, Line_Lower._Ray, Line_Lower._STYLE, FALSE); //
//**************************************************************************************
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Channels_Extention_base::Draw_Channel_Line_LowerBand_Middle(Sg_Line_Data & _data)
{         //
//
          Line_Lower_Middle._Point_A.Time      = _data.Line_t1;;
          Line_Lower_Middle._Point_A.Price     = 0;
          Line_Lower_Middle._Point_B.Time      = _data.Line_t3;
          Line_Lower_Middle._Point_B.Price     = 0;
          if(_data.Is_Bullish)
          {         Line_Lower_Middle._Point_A.Price = LineA._Point_A.Price - Channel_Size / 2;
                    Line_Lower_Middle._Point_B.Price = LineA._Point_B.Price - Channel_Size / 2;
                    //
          }
          else
          {         Line_Lower_Middle._Point_A.Price = LineA._Point_A.Price  + Channel_Size / 2;
                    Line_Lower_Middle._Point_B.Price = LineA._Point_B.Price  + Channel_Size / 2; //
          }
//**************************************************************************************
          Line_Lower_Middle._Name   = "Lines.Trend " + "FiboExpantion-TrendLine_Line_Lower_Middle";
          Line_Lower_Middle._Color  = _data.c = clrRed;;
          Line_Lower_Middle._Width  = _data.w = 2;;
          Line_Lower_Middle._Ray    = true;
          Line_Lower_Middle._STYLE  = STYLE_DOT;
          _Lines.Trend.Draw_GDS_Lines(_data.WhichMode, _data.IsKey, "FiboExpantion-TrendLine_Line_Lower_Middle","", Line_Lower_Middle._Point_A.Time, Line_Lower_Middle._Point_A.Price, Line_Lower_Middle._Point_B.Time, Line_Lower_Middle._Point_B.Price, Line_Lower_Middle._Color, Line_Lower_Middle._Width, Line_Lower_Middle._Ray, Line_Lower_Middle._STYLE, FALSE); //
//**************************************************************************************
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Channels_Extention_base::Draw_Channel_Line_UpperBand(Sg_Line_Data &_data)
{         //
//
          Line_Upper._Point_A.Time   = _data.Line_t1;;
          Line_Upper._Point_A.Price  = 0;
          Line_Upper._Point_B.Time   = _data.Line_t3;
          Line_Upper._Point_B.Price  = 0;
          if(_data.Is_Bullish)
          {         Line_Upper._Point_A.Price = LineA._Point_A.Price + Channel_Size * 2;
                    Line_Upper._Point_B.Price = LineA._Point_B.Price + Channel_Size * 2;
                    //
          }
          else
          {         Line_Upper._Point_A.Price = LineA._Point_A.Price - Channel_Size * 2;
                    Line_Upper._Point_B.Price = LineA._Point_B.Price - Channel_Size * 2; //
          }
//**************************************************************************************
          Line_Upper._Name   = "Lines.Trend " + "FiboExpantion-TrendLine_Line_Upper";
          Line_Upper._Color  = _data.c;
          Line_Upper._Width  = _data.w = 2;
          Line_Upper._Ray    = true;
          Line_Upper._STYLE  = STYLE_DOT;
          _Lines.Trend.Draw_GDS_Lines(_data.WhichMode, _data.IsKey, "FiboExpantion-TrendLine_Line_Upper","", Line_Upper._Point_A.Time, Line_Upper._Point_A.Price, Line_Upper._Point_B.Time, Line_Upper._Point_B.Price, Line_Upper._Color, Line_Upper._Width, Line_Upper._Ray, Line_Upper._STYLE, FALSE); //
//**************************************************************************************
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Channels_Extention_base::Draw_Channel_Line_UpperBand_Middle(Sg_Line_Data & _data)
{         //
//
          Line_Upper_Middle._Point_A.Time      = _data.Line_t1;;
          Line_Upper_Middle._Point_A.Price     = 0;
          Line_Upper_Middle._Point_B.Time      = _data.Line_t3;
          Line_Upper_Middle._Point_B.Price     = 0;
          if(_data.Is_Bullish)
          {         Line_Upper_Middle._Point_A.Price = LineB._Point_A.Price + Channel_Size / 2 ; //Alert("Line_Upper_Middle._Point_A.Price: ", Line_Upper_Middle._Point_A.Price, "   Line_Upper_Middle._Point_A.Time: ", Line_Upper_Middle._Point_A.Time); //
                    Line_Upper_Middle._Point_B.Price = LineB._Point_B.Price + Channel_Size / 2; //Alert("Line_Upper_Middle._Point_B.Price: ", Line_Upper_Middle._Point_B.Price, "   Line_Upper_Middle._Point_B.Time: ", Line_Upper_Middle._Point_B.Time); //
                    //
          }
          else
          {         Line_Upper_Middle._Point_A.Price = LineB._Point_A.Price  - Channel_Size / 2; //Alert("Line_Upper_Middle._Point_A.Price: ", Line_Upper_Middle._Point_A.Price, "   Line_Upper_Middle._Point_A.Time: ", Line_Upper_Middle._Point_A.Time); //
                    Line_Upper_Middle._Point_B.Price = LineB._Point_B.Price  - Channel_Size / 2; //Alert("Line_Upper_Middle._Point_B.Price: ", Line_Upper_Middle._Point_B.Price, "   Line_Upper_Middle._Point_B.Time: ", Line_Upper_Middle._Point_B.Time); //
          }
//**************************************************************************************
          Line_Upper_Middle._Name   = "Lines.Trend " + "FiboExpantion-TrendLine_Line_Upper_Middle";
          Line_Upper_Middle._Color  = _data.c = clrRed;
          Line_Upper_Middle._Width  = _data.w = 2;;
          Line_Upper_Middle._Ray    = true;
          Line_Upper_Middle._STYLE  = STYLE_DOT;
          _Lines.Trend.Draw_GDS_Lines(_data.WhichMode, _data.IsKey, "FiboExpantion-TrendLine_Line_Upper_Middle","", Line_Upper_Middle._Point_A.Time, Line_Upper_Middle._Point_A.Price, Line_Upper_Middle._Point_B.Time, Line_Upper_Middle._Point_B.Price, Line_Upper_Middle._Color, Line_Upper_Middle._Width, Line_Upper_Middle._Ray, Line_Upper_Middle._STYLE, FALSE); //
//**************************************************************************************
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

struct C_Channels_Extention: public C_Channels_Extention_base
{         void C_Channels_Extention();
          void      ~C_Channels_Extention() {}

          C_Channels_Extention_base Channels_Extention_Current;
          C_Channels_Extention_base Channels_Extention_MN;
          C_Channels_Extention_base Channels_Extention_W1;
          C_Channels_Extention_base Channels_Extention_D1;
          C_Channels_Extention_base Channels_Extention_H4;
          C_Channels_Extention_base Channels_Extention_H1;
          C_Channels_Extention_base Channels_Extention_M30;
          C_Channels_Extention_base Channels_Extention_M15;
          C_Channels_Extention_base Channels_Extention_M5;
          C_Channels_Extention_base Channels_Extention_M1;
          //Cgs_DevObjectPack          Object_Pack;


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Channels_Extention::C_Channels_Extention()
{
//
          C_Channels_Extention_base _Current("", PERIOD_CURRENT);  Channels_Extention_Current = _Current;
//
//
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
