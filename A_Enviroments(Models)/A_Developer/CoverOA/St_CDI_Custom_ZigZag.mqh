//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Custom.mqh     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Base.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

struct ZigZag_Point
{         double       _Price;
          datetime     _Time; ///
          int          _Shift; //
};
struct ZigZag_Point_2
{         double       _Price[];
          datetime     _Time[]; ///
          int          _Shift[]; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_CDI_CZZ : public St_CDI_Base   //--update outer,,,
{
private:
          int Depth;
          int Deviation;
          int Backstep;
          int LineIndex;
          int Zigzag_Cordinate_Count;
          int Zigzag_Want_Count;
          int BarCount;
          int Multipy;
          int Zigzag_Start_Bar; //--place or shift
          int Zigzag_Range_Bars;

          int Inx;


          ENUM_TIMEFRAMES TF;
          string          symbol;

public:   void          St_CDI_CZZ();
          void          ~St_CDI_CZZ() {};
          void          St_CDI_CZZ(bool isKey, string pfname, int depth, int deviation, int backstep, ENUM_TIMEFRAMES tf, string s, int Z_S_B, int Z_R_Bs, int ZW_C, int MULL); //--, /*int Z_C,  int B_C*/



          bool           isCustom;
          //---------------------------------------------------------
          void           iZigZags(string pfname, bool IsKey);
          ZigZag_Point   _CZZ_Point[];//<<<<<<<<<<<<<<<<<<<<<<<<
          ZigZag_Point_2 _CZZ_Point_2;
          int            ZigzagIndex;
          //---------------------------------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_CZZ::St_CDI_CZZ()
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          Depth                         = 12;
          Deviation                     = 5;
          Backstep                      = 3;
          LineIndex                     = 0;
          TF                            = PERIOD_CURRENT;
          symbol                        = NULL;
          Zigzag_Want_Count             = 6;
          Multipy                       = 1;
          Zigzag_Start_Bar              = 0;
          Zigzag_Range_Bars             = 1000;
          /*
          Zigzag_Cordinate_Count        = 20;
          BarCount                      = 200;
          //
          ArrayResize(ZigZags, Zigzag_Cordinate_Count);
          ArrayResize(_CZZ_2._Shift, Zigzag_Cordinate_Count);
          ArrayResize(_CZZ_2._Time,  Zigzag_Cordinate_Count);
          ArrayResize(_CZZ_2._Price, Zigzag_Cordinate_Count);
          */
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_CZZ::St_CDI_CZZ(bool isKey, string pfname, int depth, int deviation, int backstep, ENUM_TIMEFRAMES tf, string s, int Z_S_B, int Z_R_Bs, int ZW_C, int MULL) //--, /*int Z_C,*/ int B_C
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
//
          Depth                         = depth;
          Deviation                     = deviation;
          Backstep                      = backstep;
          LineIndex                     = 0;
          TF                            = tf;
          symbol                        = s;
          Zigzag_Want_Count             = ZW_C + 1;
          Multipy                       = MULL;
          Zigzag_Start_Bar              = Z_S_B;
          Zigzag_Range_Bars             = Z_R_Bs;
          ///*
          //*/
          ///*
          ArrayResize(_CZZ_Point,          Zigzag_Want_Count);
          ArrayResize(_CZZ_Point_2._Shift, Zigzag_Want_Count);
          ArrayResize(_CZZ_Point_2._Time,  Zigzag_Want_Count);
          ArrayResize(_CZZ_Point_2._Price, Zigzag_Want_Count);
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //*/
          //--set zigzag when crated
          iZigZags(pfname, isKey);
          //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void St_CDI_CZZ::iZigZags(string pfname, bool IsKey)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //if(!Detect_NewBar._M1.CBT__HalfMinute.Is_NewBar)return;
          //-----------------------------------------------------
          ObjectsDeleteAll(0, pfname); //
          //-----------------------------------------------------
          {         //
                    double      ZigzagValue  = 0;
                    ZigzagIndex              = 0;
                    BarCount                 = Zigzag_Start_Bar + 1;
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    for(int BarNum = Zigzag_Start_Bar; BarNum < BarCount; BarNum++)
                    {         ZigzagValue = iCustom(symbol, TF, "ZigZag", Depth * Multipy, Deviation * Multipy, Backstep * Multipy, LineIndex, BarNum);
                              //------------
                              bool Is_ZIGZAG = (ZigzagValue > 0);   //---Alert("ZigzagValue: ", ZigzagValue,"   BarNum: ", BarNum); //
                              //------------
                              if(Zigzag_Range_Bars > 0) {BarCount = Zigzag_Range_Bars;}
                              else if(ZigzagIndex < Zigzag_Want_Count)
                              {         int cntBars = iBars(NULL, TF);
                                        if(cntBars > BarCount - 1) {BarCount++;}//
                              } //--auto update bar count until find five point...
                              //
                              ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                              if(Is_ZIGZAG)
                              {         if(0)//bypass zigzag zero
                                        {         //if(ZigzagIndex == 0) {ZigzagIndex++; continue;}
                                                  //if(ZigzagIndex == 1) {ZigzagIndex--;} //
                                        }
                                        //
                                        //--off-- ++Inx;
                                        //--off-- ArrayResize(ZigZags,          Inx);
                                        //--off-- ArrayResize(_CZZ_2._Shift, Inx);
                                        //--off-- ArrayResize(_CZZ_2._Time,  Inx);
                                        //--off-- ArrayResize(_CZZ_2._Price, Inx);
                                        if(
                                                  (ZigzagIndex > ArraySize(_CZZ_Point) - 1) ||
                                                  (ZigzagIndex > ArraySize(_CZZ_Point_2._Price) - 1) ||
                                                  (ZigzagIndex > ArraySize(_CZZ_Point_2._Time) - 1) ||
                                                  (ZigzagIndex > ArraySize(_CZZ_Point_2._Shift) - 1) )
                                        {         //
                                                  //---Alert("--------------");
                                                  ArrayResize(_CZZ_Point,          ZigzagIndex + 2);
                                                  ArrayResize(_CZZ_Point_2._Shift, ZigzagIndex + 2);
                                                  ArrayResize(_CZZ_Point_2._Time,  ZigzagIndex + 2);
                                                  ArrayResize(_CZZ_Point_2._Price, ZigzagIndex + 2);
                                                  //
                                        }
                                        //--ZigzagIndex == 0;
                                        _CZZ_Point[ZigzagIndex]._Price = ZigzagValue ;
                                        _CZZ_Point[ZigzagIndex]._Time  = iTime(symbol, TF, BarNum);
                                        //_CZZ_Point[ZigzagIndex]._Time  = Time[BarNum];
                                        _CZZ_Point[ZigzagIndex]._Shift = BarNum;
                                        //
                                        _CZZ_Point_2._Price[ZigzagIndex] = ZigzagValue ;
                                        _CZZ_Point_2._Time[ZigzagIndex]  = iTime(symbol, TF, BarNum);
                                        //_CZZ_Point_2._Time[ZigzagIndex]  = Time[BarNum];
                                        _CZZ_Point_2._Shift[ZigzagIndex] = BarNum;
                                        //
                                        ZigzagIndex++;
                                        //if(ZigzagIndex == 6)Alert("--------ZigzagValue: ", ZigzagValue, "   BarNum: ", BarNum, "   time: ", Time[BarNum], "------"); //
                                        //--*** if rangeView not dedect zigzag then wave frist not inited value..
                                        //---just wanted point need
                                        if(Zigzag_Want_Count < ZigzagIndex) { break;} //
                              } //
                    }
                    //---!! after stablizer points then draw them
                    //ObjectsDeleteAll(0,pfname);//
                    for(int i = ArraySize(_CZZ_Point) - 1; i > 0; i--)//lesser than the zero make out of range
                    {
                              {         if(_CZZ_Point[i]._Price > _CZZ_Point[i - 1]._Price)
                                        {         //-----------------------------------------------
                                                  string namezz = pfname + EnumToString(TF) + "Arrow.ZZDown" + (string)_CZZ_Point[i]._Shift;
                                                  ObjectDelete(0, namezz); //
                                                  if(IsKey)
                                                  {         if(!ObjectCreate(0, namezz, OBJ_ARROW_DOWN, 0, iTime(_Symbol, TF, _CZZ_Point[i]._Shift), _CZZ_Point[i]._Price)) {/* Print(namezz + ": not created "+__FUNCSIG__, ErrorDescription(_LastError));*/} //
                                                            //ObjectSetInteger(0, namezz, OBJPROP_ARROWCODE, 91);
                                                            //_CZZ_Point[i]._Price > _CZZ_Point[i - 1]._Price ?
                                                            //ObjectSetInteger(0, namezz, OBJPROP_ARROWCODE, 90) : ObjectSetInteger(0, namezz, OBJPROP_ARROWCODE, 91);
                                                            //_CZZ_Point[i]._Price > _CZZ_Point[i - 1]._Price ?
                                                            //ObjectSetInteger(0, namezz, OBJPROP_ANCHOR, ANCHOR_TOP) :
                                                            ObjectSetInteger(0, namezz, OBJPROP_ANCHOR, ANCHOR_BOTTOM);
                                                            ObjectSetInteger(0, namezz, OBJPROP_WIDTH, 5); //
                                                            ObjectSetInteger(0, namezz, OBJPROP_COLOR, clrYellow); //
                                                  }
                                                  //-----------------------------------------------
                                        }
                                        else
                                        {         //-----------------------------------------------
                                                  string namezz = pfname + EnumToString(TF) + "Arrow.ZZUp" + (string)_CZZ_Point[i]._Shift;
                                                  ObjectDelete(0, namezz); //
                                                  if(IsKey)
                                                  {         if(!ObjectCreate(0, namezz, OBJ_ARROW_UP, 0, iTime(_Symbol, TF, _CZZ_Point[i]._Shift), _CZZ_Point[i]._Price)) { /*Print(namezz + ": not created "+__FUNCSIG__, ErrorDescription(_LastError));*/} //
                                                            //ObjectSetInteger(0, namezz, OBJPROP_ARROWCODE, 91);
                                                            //_CZZ_Point[i]._Price > _CZZ_Point[i - 1]._Price ?
                                                            //ObjectSetInteger(0, namezz, OBJPROP_ARROWCODE, 90) : ObjectSetInteger(0, namezz, OBJPROP_ARROWCODE, 91);
                                                            //_CZZ_Point[i]._Price > _CZZ_Point[i - 1]._Price ?
                                                            ObjectSetInteger(0, namezz, OBJPROP_ANCHOR, ANCHOR_TOP);
                                                            //: ObjectSetInteger(0, namezz, OBJPROP_ANCHOR, ANCHOR_BOTTOM) ;
                                                            ObjectSetInteger(0, namezz, OBJPROP_WIDTH, 5); //
                                                            ObjectSetInteger(0, namezz, OBJPROP_COLOR, clrYellow); //
                                                  }
                                                  //-----------------------------------------------
                                        } //
                              } //
                    }//
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //--for finding 2 cordinate of zig zag
          if(false)
          {         int ZigZagIndex = 0, BarNum = 0;
                    double zag = 0, zig = 0;
                    BarNum = 0;
                    while(ZigZagIndex < 2)///--for fine last zigzag cordinate
                    {         //--- any zig ;;keep throw loop as zag...
                              if(zig > 0) zag = zig;
                              //---call custom indicator
                              zig = iCustom(symbol, TF, "ZigZag", Depth, Deviation, Backstep, BarNum);
                              //--detecting any zig
                              if(zig > 0) ZigZagIndex++;
                              BarNum++; //
                    } ///
                    //if(zag < zig) indicator shows down
                    // if(zig < zag) indicator shows up
                    //
          } //
          ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          //if(!IsShow)ObjectsDeleteAll(0, pfname);  //
          if(!ct_Drive.TDD.ct_Configs.IsShow_Channel_Shapes && Initer.IsBasic_Done) {ObjectsDeleteAll(0, pfname);}
          return;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define PrefixCZZ "CZZ"
class St_CDI_CZZ_Periods
{
public:
          St_CDI_CZZ _CZZ_12_5_3_Current_;
          St_CDI_CZZ _CZZ_12_5_3_MN1_;
          St_CDI_CZZ _CZZ_12_5_3_W1_;
          St_CDI_CZZ _CZZ_12_5_3_D1_;
          St_CDI_CZZ _CZZ_12_5_3_H4_;
          St_CDI_CZZ _CZZ_12_5_3_H1_;
          St_CDI_CZZ _CZZ_12_5_3_M30_;
          St_CDI_CZZ _CZZ_12_5_3_M15_;
          St_CDI_CZZ _CZZ_12_5_3_M5_;
          St_CDI_CZZ _CZZ_12_5_3_M1_;//
          void Update_CZZ( )
          {         bool IsKey = true;
                    if(!ct_Drive.TDD.ct_Configs.IsShow_Channel_Shapes && Initer.IsBasic_Done) {IsKey = false;}
                    St_CDI_CZZ _CZZ_12_5_3_Current(  IsKey,PrefixCZZ + "_CZZ_12_5_3_Current",      12, 5, 3, PERIOD_CURRENT,       NULL, 0, 0, 5, 3);;     _CZZ_12_5_3_Current_    = _CZZ_12_5_3_Current;
                    St_CDI_CZZ _CZZ_12_5_3_MN1(      IsKey,PrefixCZZ + "_CZZ_12_5_3_MN1",      12, 5, 3, PERIOD_MN1,           NULL, 0, 0, 5, 3);;     _CZZ_12_5_3_MN1_        = _CZZ_12_5_3_MN1;
                    St_CDI_CZZ _CZZ_12_5_3_W1(       IsKey,PrefixCZZ + "_CZZ_12_5_3_W1",      12, 5, 3, PERIOD_W1,            NULL, 0, 0, 5, 3);;     _CZZ_12_5_3_W1_         = _CZZ_12_5_3_W1;
                    St_CDI_CZZ _CZZ_12_5_3_D1(       IsKey,PrefixCZZ + "_CZZ_12_5_3_D1",      12, 5, 3, PERIOD_D1,            NULL, 0, 0, 5, 3);;     _CZZ_12_5_3_D1_         = _CZZ_12_5_3_D1;
                    St_CDI_CZZ _CZZ_12_5_3_H4(       IsKey,PrefixCZZ + "_CZZ_12_5_3_H4",      12, 5, 3, PERIOD_H4,            NULL, 0, 0, 5, 3);;     _CZZ_12_5_3_H4_         = _CZZ_12_5_3_H4;
                    St_CDI_CZZ _CZZ_12_5_3_H1(       IsKey,PrefixCZZ + "_CZZ_12_5_3_H1",      12, 5, 3, PERIOD_H1,            NULL, 0, 0, 5, 3);;     _CZZ_12_5_3_H1_         = _CZZ_12_5_3_H1;
                    St_CDI_CZZ _CZZ_12_5_3_M30(      IsKey,PrefixCZZ + "_CZZ_12_5_3_M30",      12, 5, 3, PERIOD_M30,           NULL, 0, 0, 5, 3);;     _CZZ_12_5_3_M30_        = _CZZ_12_5_3_M30;
                    St_CDI_CZZ _CZZ_12_5_3_M15(      IsKey,PrefixCZZ + "_CZZ_12_5_3_M15",      12, 5, 3, PERIOD_M15,           NULL, 0, 0, 5, 3);;     _CZZ_12_5_3_M15_        = _CZZ_12_5_3_M15;
                    St_CDI_CZZ _CZZ_12_5_3_M5(       IsKey,PrefixCZZ + "_CZZ_12_5_3_M5",      12, 5, 3, PERIOD_M5,            NULL, 0, 0, 5, 3);;     _CZZ_12_5_3_M5_         = _CZZ_12_5_3_M5;
                    St_CDI_CZZ _CZZ_12_5_3_M1(       IsKey,PrefixCZZ + "_CZZ_12_5_3_M1",      12, 5, 3, PERIOD_M1,            NULL, 0, 0, 5, 3);;     _CZZ_12_5_3_M1_         = _CZZ_12_5_3_M1;          //
          }//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
;// //its class
//+------------------------------------------------------------------+
//||   ||||||||||       St_CDI_Custom.mqh     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
