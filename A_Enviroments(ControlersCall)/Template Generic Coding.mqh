//===================================================
//===============Template Generic Coding=============
//===================================================


//==============================================================================
class floorX     { int X; int Y;};       //Abstract_Obj_Enviromentic_floor
class Wall      { int X; int Y;};       //Abstract_Obj_Enviromentic_floor
class Player    { int X; int Y;};       //Abstract_Obj_Enviromentic_floor
//==============================================================================
template<typename Enviromentic> class Enviroment        { Enviromentic ComType; };                               //Abstract_Obj_Enviromentic
template<typename Actoric>      class Actor             {public: Actoric ComType;  Actor(Player & Objs);  int X; int Y;};                                                      //Abstract_Obj_Actoric
//==============================================================================
class Abstract_Obj
{         Enviroment<floorX>     *Ring;                         //= new Enviroment<floor>();          //Accepted pointer...
          Enviroment<Wall>      *Metal;                        //= new Enviroment<Wall>();
          Actor<Player>         *PouryaShother;      //= new Actor<Player>();            //
};
//==============================================================================
//===================================================
//===============Template Generic Coding=============
//===================================================
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CLICK_TYPE { public: CLICK_TYPE(CLICK_TYPE &obj); };
//------------------------
class cls_time   { public: cls_time(); };
//------------------------
template<typename T>
class M_List
{
public:
          cls_time      time2;
          MqlRates      time;
          void          get(int index)        {};
          unsigned int  size()          {return 0;}; //
};
//====================================================================
//====================================================================
//====================================================================
//====================================================================
class ClickDatapoint
{
private:
          // const MqlRates *priceData;           ///class type expected, pointer to type 'MqlRates' is not allowed      Template Generic Coding.mqh   23        26
          const MqlRates        priceData;
          const CLICK_TYPE      clickType;
public:
          void  ClickDatapoint(const MqlRates &price_data,   CLICK_TYPE &click_type);
          void  ~ClickDatapoint();
          const MqlRates        getPriceData() const;
          const CLICK_TYPE      getClickType() const; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//0//: priceData(price_data)>>> 'priceData' - constructor not defined(<<MqlRates not allowed>>) Template Generic Coding.mqh   34        91
//0// 'CLICK_TYPE::CLICK_TYPE' - cannot access private member function          Template Generic Coding.mqh   36        120
//0// 'click_type' - constant variable cannot be passed as reference  Template Generic Coding.mqh   37        130
//0//  ClickDatapoint::ClickDatapoint(const MqlRates &price_data, const CLICK_TYPE &click_type):  /*priceData(price_data),*/  clickType(click_type) {}
ClickDatapoint::ClickDatapoint(const MqlRates &price_data,   CLICK_TYPE &click_type):  /*priceData(price_data),*/  clickType(click_type) {}
//====================================================================
//CArrayRing<S_BUFFER> *buffer;
struct sclickDatapoint
{         datetime time;
          int x;
          int y;
          CLICK_TYPE click_type; //
};
//====================================================================
datetime minimum(M_List<ClickDatapoint> &data)
{         datetime      res = 0;
          //Off//>>>    res = data.get(0).time;
          //0//  <<<FuC>>data.get(0).time; >>>'get' - function not defined    Template Generic Coding.mqh   50        31
          //0//  datetime res = data.get(0).time;   >>>'time' - struct or class type expected         Template Generic Coding.mqh   54        38
          for(unsigned int i = 1; i < (unsigned int)data.size(); ++i)
          {         //Off//>>>if(data.get(i).time < res) res = data.get(i).time;
          }
          return res; //
}
//====================================================================
//====================================================================
//====================================================================
//====================================================================
//+------------------------------------------------------------------+Class and function templates allow you to define multiple comma-separated formal parameters, for example, Map collection for storing "key – value" pairs:
//|             Class SoundController     BEGIN                      |Template parameters and template arguments - cppreference .
//+------------------------------------------------------------------+
//0//template<typename GFrame_ArrayType, typename INTIGER_Size >        >>>     'class' - unexpected token   Objects.mqh  35  10'
//0//template<typename GFrame, int sizert >                             >>>     int' - unexpected token  Objects.mqh  32  27)
//0//template<typename Key, template Value>                             >>>     'template' - unexpected token Template Generic Coding.mqh
//0//template<typename Key = int, template Value>                       >>>     not accept default type..
//0//template<typename Key = int>                                       >>>     '=' - syntax error Objects.mqh         33        23//
//0//template<typename Key, template Value>                             >>>     'template' - unexpected token Template Generic Coding.mqh
//0//template<typename Key, class Value>                                >>>     'class' - unexpected token    Template Generic Coding.mqh
template<typename Key, typename Value>
class GArray_FRAME
{
//===================================================================
private:
          Key           Sizer2;
          const int     Sizer;
          //typedef void  C;  typedef type new_name;
          //typename(GFrame_ArrayType) Data;//'typename' - name expected        Objects.mqh         38        11
          //typename(GFrame_ArrayType) a[Data];
          //===

          Key Data;//'typename' - name expected        Objects.mqh         38        11
          Key a[Sizer];

public:
          //void GFRAME(GFrame OneData);        //'Cg_TextsLabel' - objects are passed by reference only   Objects.mqh         41        23
          //void GArray_FRAME(GFrame_ArrayType &OneOBJ);        //'Cg_TextsLabel' - objects are passed by reference only   Objects.mqh         41        23
          //void GFRAMEO(int a, GFrame &OneOBJ);
          //void GFRAMEOO(GFrame OneData, GFrame &OneOBJ, int a = 0);   //when its onj changed to obj type not basedata type
          void Show();                   //template member must have template form in implanting...
//===================================================================
          GFrame_ArrayType &operator[](int i);
          arrayGFrame();//  ///c++ accepted...//constructor
          GArray_FRAME(Key typert, Value sizeval) //GFrame_ArrayType , ,INTIGER_Size sizer
          {         string typedesc = typename(typert);
                    Sizer           = sizeval; //
          }
//===================================================================
};
template<typename Key, typename Value>
GArray_FRAME::arrayGFrame()//  ///c++ accepted... without void  //void GArray_FRAME<GFrame>:: 'GArray_FRAME' - identifier already used    Objects.mqh         50        6
{         for(register int i = 0; i < 5; i++)a[i] = 0; //accepted  register int i = 0;
// Sizer= INTIGER_Size
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void testGArray_FRAME()
{         const int intSize = 7;
          const int doubleSize = 7;
          //GArray_FRAME<int,    intSize >       intgframe_int;     intgframe_int.Show(); //
          //GArray_FRAME<double, doubleSize>    doublegframe_int;  doublegframe_int.Show(); //
          // GArray_FRAME<int,    int>       intgframe_int(0, 10);     intgframe_int.Show(); //
          //  GArray_FRAME<double, int>    doublegframe_int(0, 10);  doublegframe_int.Show(); //
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
template<typename GFrame>   ///'class' - unexpected token   Objects.mqh         35        10
class GFRAME
{
//===================================================================
private:   GFrame Data;
public:
          //void GFRAME(GFrame OneData);        //'Cg_TextsLabel' - objects are passed by reference only   Objects.mqh         41        23
          void GFRAME(GFrame &OneOBJ);        //'Cg_TextsLabel' - objects are passed by reference only   Objects.mqh         41        23
          //void GFRAMEO(int a, GFrame &OneOBJ);
          //void GFRAMEOO(GFrame OneData, GFrame &OneOBJ, int a = 0);   //when its onj changed to obj type not basedata type
          void Show();                   //template member must have template form in implanting...
//===================================================================
};
//+------------------------------------------------------------------+'GFRAME' - template mismatch  Objects.mqh         48        14
//|                                                                  |'GFrame' - declaration without type     Objects.mqh         48        21
//+------------------------------------------------------------------+'One' - comma expected        Objects.mqh         48        28   'Data' - undeclared identifier     Objects.mqh         49        11
//template<typename GFrame>///not dec logo in func member declare... but in class declare it existed,,,
//void GFRAME::GFRAME(GFrame OneData)///its with out <GFrame> work just in mql   //'GFRAME' - identifier already used      Objects.mqh         49        6//   see previous declaration of 'GFRAME'          Objects.mqh         36        7
//{         Data = OneData; //
//}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename GFrame>///not dec logo in func member declare... but in class declare it existed,,,
void GFRAME::GFRAME(GFrame &OneOBJ)///its with out <GFrame> work just in mql   //'GFRAME' - identifier already used      Objects.mqh         49        6//   see previous declaration of 'GFRAME'          Objects.mqh         36        7
{         Data = OneOBJ; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//template<typename GFrame>///not dec logo in func member declare... but in class declare it existed,,,
//void GFRAME::GFRAMEO(int a, GFrame &OneOBJ) ///its with out <GFrame> work just in mql   //'GFRAME' - identifier already used      Objects.mqh         49        6//   see previous declaration of 'GFRAME'          Objects.mqh         36        7
//{         Data = One; //
//}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//template<typename GFrame>///not dec logo in func member declare... but in class declare it existed,,,
//void GFRAME::GFRAMEOO(GFrame OneData, GFrame &OneOBJ, int a = 0) ///its with out <GFrame> work just in mql   //'GFRAME' - identifier already used      Objects.mqh         49        6//   see previous declaration of 'GFRAME'          Objects.mqh         36        7
//{         Data = One; //
//}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename GFrame>               //'Show' - template mismatch Objects.mqh         55        15
void GFRAME::Show()                    //'GFRAME' - identifier already used    Objects.mqh         55        6
{         Alert((string)Data);//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
///---
#define TOSTR(x) #x+" "
// macro for displaying an object name
// double_array  (double:10) //[double_array]
//)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
template<typename T>
string rArrayTypeSize(T &m_array[])
{         return(
                          typename(m_array[0]) +
                          ":" +
                          (string)ArraySize(m_array)
                );//
          ///--- rArrayTypeSize(double_array)=>>  (double:10) <<//
          Alert(TOSTR(m_array));
          ///---
};
//)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
template<typename T>   ///typename(T) simpler...
string GetTypeNameT(const T &t) { return(typename(T));/*/--- return the type as a line */}
//)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
template<typename T>
T ArrayMaxValueElementValue(T &array[])
{         if(ArraySize() == 0) return(0);
          uint max_index = ArrayMaximum(array); ///---The function searches a maximal element in a one-dimension numeric array.
          return(array[max_index]); //
          //=======================
          //          double      high[]; double     max_high        =       ArrayMax(high);
          //          datetime    time[]; datetime   lasttime        =       ArrayMax(time);
          //          ///---....
          //=======================
}
//)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void testGFRAME()
{         //GFRAME<int>           gframe_int(25);               gframe_int.Show(); //
          //GFRAME<string>        gframe_string("good");        gframe_string.Show(); //
          //GFRAME<double>        gframe_double(25.6);          gframe_double.Show(); //
          //off// GFRAME<Cg_TextsLabel>    gframe_TextsLabel(LabelX);    gframe_Textsdata.Show();
          //0// global func access to all global calls.. //'Cg_TextsLabel' - objects are passed by reference only   Objects.mqh         41        23
          //off//  string typenamedesc = typename(LabelX); //
          //==================
          Actor<Player>         *PouryaShother ;
          Player s;
          //Actor<Player>          actor_Player = new Actor<Player>(s);    actor_Player.X;
          //0//'Actor<Player>' - wrong parameters count    Template Generic Coding.mqh   232       34
          //0//'Actor<Player>' - parameter passed as reference, variable expected         Template Generic Coding.mqh   232       53
          Actor<Player>          *actor_Player = new Actor<Player>(s);    actor_Player.X = PouryaShother.X = 0;   //0// Ok
          string typenamedesc = typename(actor_Player); //
//
}; //
//For example, you can create a class template that does not allow accessing an element outside the array, thus avoiding the "out of range" critical error.
//====================================================================
//====================================================================
//====================================================================
//====================================================================
//+------------------------------------------------------------------+
//|             Class Cgp_ElliotWavePAD     BEGIN-END                    |
//+------------------------------------------------------------------+
//===================================================
//===============Template Generic Coding=============
//===================================================
