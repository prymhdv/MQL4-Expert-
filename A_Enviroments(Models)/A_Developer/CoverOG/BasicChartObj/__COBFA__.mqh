//+------------------------------------------------------------------+
//||   ||||||||||       St_CondicatorData_Indicators_MA.mqh         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\gDefinesEnumsStracts.mqh>;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOG\Sg_MqlObject.mqh>
//+------------------------------------------------------------------+__COBFA__ as structControler _u_ as class
//|             Class GraphicalChartObj(DataAction)      BEGIN       |__COBFA__     ---windows+ ChartObjectBaseFrameAction  ---
//+------------------------------------------------------------------+WindowsChartGOActionFrame(W.C.G.O.A.F)  __COBFA__
template < typename _IGO_>
class __COBFA__  : public Sg_MqlObjectData  //SOLID Base //--Proxy--// GraphicalChartObj(DataAction) C_ObjectFrame ///Win_Chart_Data_Action_   ---   WinChart_DataAction
{         ///WinChart_DataForm  ///coWorker
//+-------------------------------------------------------------------------------------+
//|     C_ObjectFrame Base Claas Of GraphicalChartObj(DataAction)                      ||
//|     C_ObjectFrame Handel DataAction GraphicalChartObj (Create,Move,Delete,Modify)  ||
//|                                                                                    ||
//|     Formulator:                                                                    ||
//|                                                                                    ||
//|     Relation:  'Coming data'                                                       ||
//|        ChartObj Handel DataAction Of GraphicalChartObj (Create,Move,Delete,Modify) ||
//|        Drived Public Class <C_ShapesTriangle    : public C_ObjectFrame>            ||
//|        Drived Public Class <C_ShapesRectangle   : public C_ObjectFrame>            ||
//|        Drived Public Class <C_ShapesEllipse     : public C_ObjectFrame>            ||
//|        -----------------------------------------------------------                 ||
//|        Drived Public Class <C_LinesVertical     : public C_ObjectFrame>            ||
//|        Drived Public Class <C_LinesHorizontal   : public C_ObjectFrame>            ||
//|        Drived Public Class <C_LinesTrend        : public C_ObjectFrame>            ||
//|        Drived Public Class <C_LinesTrendByAngle : public C_ObjectFrame>            ||
//|        Drived Public Class <C_LinesCycles       : public C_ObjectFrame>            ||
//|        -----------------------------------------------------------                 ||
//|        Drived Public Class <Cg_TextsLabel: public C_ObjectFrame>                   ||
//|        -----------------------------------------------------------                 ||
//|     Connection:  'Containing'  -> Cg_TextsLabel                                    ||
//|         GraphicalActionClass DataBase (set,get,Change)                             ||
//|         GraphicalDataStruct  DataBase (set,get,Change)                             ||
//+-------------------------------------------------------------------------------------+
public:
          //--- Constructors
          void                          __COBFA__()   {};
          void                          ~__COBFA__();// {};
          //--- Realtime
          bool                          Update()   {return true;};
          bool                          UPDATED;
          //--- reset
          void                          Clear() {/*_GDS_ = new _IGO_(); delete _IGO_;*/};
          //--- Propertise
          bool                          Is_Objective;
          Sg_MqlObject                  MQL;

          //==================================================================================================
          //---01 call out
          //--- ACT By OBJ Configurated in GraphicalDataStruct Uper Consumer
          //--- template<typename GraphicalDataStruct, typename GraphicalActionClass> bool Action(GraphicalDataStruct &_GDS_, GraphicalActionClass &_GDS_, bool Is_Obj = true, int WhichMode = MODE_CREATE, bool IsKey = false, bool Seted = false);
          ///---SOLID Complex TASK
          _IGO_                                  _GDS_;
          template< typename GO >
          bool                                  Action(GO &go) ;
          //---bool                             Action();
          bool                                  Action_NoObj( int WhichMode = MODE_CREATE, bool IsKey = false, bool Seted = false);
          //==================================================================================================
          bool                                  Attribe_NoObj( bool IsSet, string name = "") {         return true;}
          //==================================================================================================
          //--- Actions by Self fields
          bool                                  Mode_NoObj(int WhichMode = MODE_CREATE, bool IsKey = false, int XDISTANCE = 0, int YDISTANCE = 0, int SizeX = 0, int SizeY = 0);
          //--- Actions by Obj Com      //---   gFlowPad.LBL_R2.Action(gFlowPad.LBL_R2.GraphicalDataStruct, gFlowPad.LBL_R2.GraphicalActionClass); //
private:
          template<typename GO >bool            Select_Mode_Object(GO &go);
          //==================================================================================================
          //--- SOLID Simple TASK
public:         void                            Delete(string name) { bool Is_Done = (ObjectFind(ChartData_ChartInfo.ID, name) >= 0) ? ObjectDelete(ChartData_ChartInfo.ID, name) : false;   } //
          //--- Actions by MoveAssign API
          void                                  MoveAssign(const string _Name = "_Name", const int MoveX = 10, const int MoveY = 10);
          //--                                  ObjectMove(0, NAME, 0, TIME1, PRICE1); /
          //==================================================================================================
          //--- On Function Call
          bool                                  Set_Init(ENUM_OBJECT OBJ_TYPE, string Name, int PointX, int PointY, int SizeX, int SizeY, color Color, color bgColor = clrNONE);
private:
          template<typename T >   bool           CreateByTypeInject(T &t);
          template<typename T >   bool           GetSet_ToAttribe(T &Obj, bool IsSet);
          template<typename T >   bool           SetSet_ToAttribe(T &t);
          //
          //==================================================================================================
          template<typename GO >bool             CALL_Create(  GO      &go);
          template<typename GO >bool             CALL_Move(    GO      &go);
          template<typename GO >bool             CALL_Delete(  GO      &go);
          //==================================================================================================
          //--- SetGetAttribe By API Or Name
          template<typename GO >bool             Set_ToAttribe(GO &go, bool IsSet); //-- SetGetAttribeBy Objects//-- SetGetAttribeBY ObjectsAPI_Name
          //==================================================================================================
          template<typename GO >void             Set_Attribe_Global(  GO      &go, bool Is_Obj);
          template<typename GO >void             Set_Attribe_Line(    GO      &go, bool Is_Obj);
          template<typename GO >void             Set_Attribe_Channel( GO      &go, bool Is_Obj);
          template<typename GO >void             Set_Attribe_Gann(    GO      &go, bool Is_Obj);
          template<typename GO >void             Set_Attribe_Fibo(    GO      &go, bool Is_Obj);
          template<typename GO >void             Set_Attribe_Shape(   GO      &go, bool Is_Obj);
          template<typename GO >bool             Set_Attribe_Arrow(   GO      &go, bool Is_Obj);
          template<typename GO >void             Set_Attribe_Text(    GO      &go, bool Is_Obj);
          template<typename GO >void             Set_Attribe_Bitmap(  GO      &go, bool Is_Obj);
          template<typename GO >void             Set_Attribe_Event(   GO      &go, bool Is_Obj);
          //==================================================================================================
          template<typename GO >
          void                                  Create__By__Deefrene(GO &go);
protected:   virtual  void                      SetupSignal() { Alert("__COBFA__SetUpSiognal():------ not defined,, "  );}; //--if any drived hasnt overrghit this function then  "__COBFA__SetUpSiognal():------ "  ruun.. //--if all drived has function then  run dived function if define here.. virtual or not //--private or public
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//template < typename _IGO_>
//void __COBFA__::__COBFA__() {};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template < typename _IGO_>
void __COBFA__::~__COBFA__() {};
//+------------------------------------------------------------------+int WhichMode = MODE_CREATE, bool IsKey = false,
//|                                                                  |//--API--//
//+------------------------------------------------------------------+//--Proxy--//
///---SOLID Complex TASK Handel all ChartObject types template<typename _IGO_, typename GO >
template<typename _IGO_>  ////--for class
template<typename GO >    ////-- for funcion
bool __COBFA__  ::Action(GO &go) //--Proxy--//
{         //----Act by Mode
          _GDS_ = go.GDS;  //--assigned///!!*!!///
          //---Alert(typename(go.GDS), " -- ", typename(_GDS_));
          if(Select_Mode_Object(go))
          {         //---     else                  { Alert("cant do Action for ObjectCom", __FUNCSIG__, __LINE__); return false;} //
                    if(_GDS_.Is_Set_Signal) { go.SetupSignal(); };
                    if(_GDS_.Is_Delete)     { Delete(_GDS_.NAME_A_01); } //
                    go.GDS = _GDS_; //---returned refrensed///** (GO &go) **
                    Clear();
                    return true;//
          }
          return false; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
bool __COBFA__ :: Action_NoObj ( int WhichMode = MODE_CREATE, bool IsKey = false, bool Seted = false)
{         //--prevent calling others
          if(WhichMode == MODE_CREATE) if(Mode_NoObj(MODE_CREATE, IsKey, 0, 0, 0, 0)) {return Attribe_NoObj( true );}
          if(WhichMode == MODE_MOVE)   if(Mode_NoObj(MODE_MOVE,   IsKey, 0, 0, 0, 0)) {return true;};
          if(WhichMode == MODE_MODIFY) if(Mode_NoObj(MODE_MODIFY, IsKey, 0, 0, 0, 0)) {return true;};//
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
bool __COBFA__::Mode_NoObj(int WhichMode = MODE_CREATE, bool IsKey = false, int xdistance = 0, int ydistance = 0, int xsize = 0, int ysize = 0)
{         //
//  if(WhichMode == MODE_CREATE && !IsKey && ObjectFind(ChartData_ChartInfo.ID, NAME) >= 0 )   MODE_DELETE_This();
//  if(WhichMode == MODE_CREATE &&  IsKey && ObjectFind(ChartData_ChartInfo.ID, NAME) <  0 )   MODE_CREATE_This(IsKey);
//  if(WhichMode == MODE_MOVE   &&  IsKey && ObjectFind(ChartData_ChartInfo.ID, NAME) >= 0 )   MODE_MOVE_This();
//
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO>
bool __COBFA__::Select_Mode_Object(GO &go)
{         //---
          bool IsDelete         = _GDS_.MODE_I_00 == MODE_CREATE && !_GDS_.IsKey_I_00 && ObjectFind(ChartData_ChartInfo.ID, _GDS_.NAME_A_01) >= 0;
          bool IsCreate         = _GDS_.MODE_I_00 == MODE_CREATE &&  _GDS_.IsKey_I_00 && ObjectFind(ChartData_ChartInfo.ID, _GDS_.NAME_A_01) < 0;
          bool IsMove           = _GDS_.MODE_I_00 == MODE_MOVE   &&  _GDS_.IsKey_I_00 && ObjectFind(ChartData_ChartInfo.ID, _GDS_.NAME_A_01) >= 0;
          //---
          if(IsDelete) return CALL_Delete(go);
          if(IsCreate) return CALL_Create(go); //--just create
          if(IsMove)   return CALL_Move(go);
//------------------------------------------------------------------------------------------------------------------------------------------
//--- Convert - Copy to Control obj
          {         //---
                    //--- CChartObjectLabel     Cg_TextsLabel::oLabel;  // --- Object  chart API
                    //--- CLabel                Cg_TextsLabel::cLabel;  // --- Control chart      ///bether to set Controler...
                    //--- FlowPad.LBL_C2.oLabel = FlowPad.LBL_C2.sLabel;   //--- un matched type and fields It Must convert in Frame Action
                    {         //---
                              //--- _GDS_.CLabel.m_label.Type() = _GDS_.TYPE_O_00;  not to prossessing
                              //---
                    }//---
          }
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
void __COBFA__::MoveAssign(const string _Name = "_Name", const int MoveX = 10, const int MoveY = 10)
{         if(ObjectFind(ChartData_ChartInfo.ID, _Name) >= 0)
          {         ObjectSetInteger(ChartData_ChartInfo.ID, _Name, OBJPROP_XDISTANCE, MoveX);
                    ObjectSetInteger(ChartData_ChartInfo.ID, _Name, OBJPROP_YDISTANCE, MoveY); //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TextLabel Error",  __LINE__, __FUNCTION__); //|
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO>
bool __COBFA__::Set_ToAttribe(GO &go, bool IsSet) //-- SetObjects
{         if(ObjectFind(ChartData_ChartInfo.ID, _GDS_.NAME_A_01) >= 0)//ALL //--_GDS_.NAME_A_01 //--- name ///---NAME
          {         //---
                    //--- if(ObjectFind(ChartData_ChartInfo.ID, _GDS_.NAME_A_01) >= 0) {ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TYPE, _GDS_.TYPE_O_00);}
                    //---
                    Set_Attribe_Global( go, false);      //| Globl
                    Set_Attribe_Line(   go, false);      //| Line       OBJ_VLINE          || OBJ_HLINE            || OBJ_TREND           || OBJ_TRENDBYANGLE || OBJ_CYCLES
                    Set_Attribe_Channel(go, false);      //| Channel    OBJ_CHANNEL        || OBJ_STDDEVCHANNEL    || OBJ_REGRESSION      || OBJ_PITCHFORK
                    Set_Attribe_Gann(   go, true);      //| Gann       OBJ_GANNLINE       || OBJ_GANNFAN          || OBJ_GANNGRID
                    Set_Attribe_Fibo(   go, false);      //| Fibo       OBJ_FIBO           || OBJ_FIBOTIMES        || OBJ_FIBOFAN         || OBJ_FIBOARC     || OBJ_FIBOCHANNEL || OBJ_EXPANSION
                    Set_Attribe_Shape(  go, false);      //| Shape      OBJ_RECTANGLE      || OBJ_TRIANGLE         || OBJ_ELLIPSE
                    Set_Attribe_Arrow(  go, true);      //| Arrow      OBJ_ARROW_THUMB_UP || OBJ_ARROW_THUMB_DOWN || OBJ_ARROW_UP        ||  OBJ_ARROW_DOWN || OBJ_ARROW_STOP  || OBJ_ARROW_CHECK || OBJ_ARROW_LEFT_PRICE ||  OBJ_ARROW_RIGHT_PRICE || OBJ_ARROW_BUY      ||   OBJ_ARROW_SELL       ||   OBJ_ARROW
                    Set_Attribe_Text(   go, false);     //| Text       OBJ_TEXT           || OBJ_LABEL            || OBJ_RECTANGLE_LABEL ||  OBJ_BUTTON     ||   OBJ_EDIT
                    Set_Attribe_Bitmap( go, false);      //| Bitmap     OBJ_BITMAP         || OBJ_BITMAP_LABEL
                    Set_Attribe_Event(  go, true);      //| Event      OBJ_EVENT
          }//
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//bool __COBFA__::Attribe_NoObj( bool IsSet, string name = "")
//{         return true;//
//}
//+------------------------------------------------------------------+JustCreate(JustGetSet_ToAttribe())
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename T >
bool __COBFA__::CreateByTypeInject(T &t)
{         if(t.ByOBJECT)  {return ObjClass.Create(t.chart, t.name, t.x, t.y);}
          else            {return ObjectCreate(t.chart, t.name, t.type, t.subwin, 0, 0);} //
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename T >
bool __COBFA__::GetSet_ToAttribe(T &Obj, bool IsSet)
{         if(!IsSet)
          {         //T Obj;
                    Obj.Name;
                    Obj.X;
                    Obj.Y;
                    Obj.SizeX;
                    Obj.SizeY;
                    Obj.ColorDesc//
                    return true;//
          }
          else
          {         if(MODE_OBJECT) {return ObjClass.SetAttribeByObject(t.cgart, t.name, t.x, t.y);}
                    else            {return SetAttribeByName();}//
                    return false;//
          }
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename T >
bool __COBFA__::SetSet_ToAttribe(T &t)
{         if(MODE_OBJECT) {return ObjClass.SetAttribeByObject(t.cgart, t.name, t.x, t.y);}
          else            {return SetAttribeByName();}//
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO >
bool __COBFA__::CALL_Create(GO &go/*string __FUNCTION__*/)
{         //====================================================================
          //====================================================================
          {         //TextDescription.FRAME.Action(MODE_MOVE,true,Set_Init("Name",movex,movey,sizex,sizey,clrRed));
          }
          //--- Creating Objective Or API(name)
          bool IsDone = false;
          //-----------------------------------------------------------------------------------------------------------------------------
          //IsDone = go.GAC.Create(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow, 0, 0); //---MQL Access by type requested
          //-----------------------------------------------------------------------------------------------------------------------------
          ResetLastError();
          if(true)
          {         IsDone = go.GAC.CreateCall(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow); //
                    //
                    //--Create__By__Deefrene(GO);//
          } //
          _GDS_.IsCreated = IsDone;
          if(!IsDone && true) { Print("Creating Object Not IsDone!  ", _GDS_.NAME_A_01, " The Error:", ErrorDescription(_LastError), " : ", (string)_LastError);}
          //>>>>>> if(IsDone && _GDS_.TYPE_O_00 == OBJ_TRENDBYANGLE) {Print("Creating Object IsDone !  ", _GDS_.NAME_A_01, " The Error:", ErrorDescription(_LastError), " : ", (string)_LastError);}
          //--------------------------------------------------------------------------
          //**************
          //return IsDone ?  _GDS_.Setup()           : false; //IsSet  solo attribut
          return IsDone ?  Set_ToAttribe(go, true) : false; //IsSet
          //--------------------------------------------------------------------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO >
void __COBFA__::Create__By__Deefrene(GO &go)
{         bool IsDone = false;
          if(false)
          {
                    {         //--- Dev_Object_Pack.Lines.Vertical.oLineV //--- member
                              //---if(_GDS_.TYPE_O_00 == OBJ_VLINE)                 ObjectCreate(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJ_VLINE, ChartData_ChartInfo.SubWindow, 0, 0);
                              //---if(_GDS_.TYPE_O_00 == OBJ_VLINE)            Dev_Object_Pack.Lines.Vertical.Create(MODE_CREATE, IsKey, NAME); //
                              if(_GDS_.TYPE_O_00 == OBJ_VLINE)                  IsDone = go.GAC.CreateCall(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow); //
                    }
                    //          //-------------------------------------------------------------------------------------------------------
                    {         //
                              // if(_GDS_.TYPE_O_00 == OBJ_HLINE && !Is_Objective)         ObjectCreate(ChartData_ChartInfo.ID, NAME, OBJ_HLINE, ChartData_ChartInfo.SubWindow, 0, PRICE);
                              // if(_GDS_.TYPE_O_00 == OBJ_HLINE && Is_Objective)          Dev_Object_Pack.Lines.Horizontal.Create(MODE_CREATE, IsKey, NAME);//
                    }
                    //          //-------------------------------------------------------------------------------------------------------
                    //          if(_GDS_.TYPE_O_00 == OBJ_TREND)                Dev_Object_Pack.Lines.Trend.Create(MODE_CREATE, IsKey, NAME);
                    //          //-------------------------------------------------------------------------------------------------------
                    //          if(_GDS_.TYPE_O_00 == OBJ_TRENDBYANGLE)         Dev_Object_Pack.Lines.TrendByAngle.Create(MODE_CREATE, IsKey, NAME);
                    //          //---Dev_Object_Pack.Lines.TrendByAngle.LineTA
                    //          //-------------------------------------------------------------------------------------------------------
                    //          if(_GDS_.TYPE_O_00 == OBJ_CYCLES)               Dev_Object_Pack.Lines.Cycles.Create(MODE_CREATE, IsKey, NAME);
                    //          //====================================================================
                    //          if(_GDS_.TYPE_O_00 == OBJ_CHANNEL)              Dev_Object_Pack.Channels.Equidistant.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_STDDEVCHANNEL)        Dev_Object_Pack.Channels.StandardDeviation.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_REGRESSION)           Dev_Object_Pack.Channels.Regression.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_PITCHFORK)            Dev_Object_Pack.Channels.Pitchfork.Create(MODE_CREATE, IsKey, NAME);
                    //          //====================================================================
                    //          if(_GDS_.TYPE_O_00 == OBJ_GANNLINE)             Dev_Object_Pack.Ganns.Line.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_GANNFAN)              Dev_Object_Pack.Ganns.Fan.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_GANNGRID)             Dev_Object_Pack.Ganns.Grid.Create(MODE_CREATE, IsKey, NAME);
                    //          //====================================================================
                    //          if(_GDS_.TYPE_O_00 == OBJ_FIBO)                 Dev_Object_Pack.Fibos.Retracement.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_FIBOTIMES)            Dev_Object_Pack.Fibos.TimeZone.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_FIBOFAN)              Dev_Object_Pack.Fibos.Fan.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_FIBOARC)              Dev_Object_Pack.Fibos.Arc.Create(MODE_CREATE, IsKey, NAME);//
                    //          if(_GDS_.TYPE_O_00 == OBJ_FIBOCHANNEL)          Dev_Object_Pack.Fibos.Channel.Create(MODE_CREATE, IsKey, NAME);//
                    //          if(_GDS_.TYPE_O_00 == OBJ_EXPANSION)            Dev_Object_Pack.Fibos.Expansion.Create(MODE_CREATE, IsKey, NAME);//
                    //          //====================================================================
                    // if(_GDS_.TYPE_O_00 == OBJ_RECTANGLE)            IsDone = Dev_Object_Pack.Shapes.Rectangle.Create(MODE_CREATE, IsKey, NAME);
                    if(_GDS_.TYPE_O_00 == OBJ_TEXT)                  IsDone = go.GAC.CreateCall(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow); //
                    // if(_GDS_.TYPE_O_00 == OBJ_TRIANGLE)             IsDone = Dev_Object_Pack.Shapes.Triangle.Create(MODE_CREATE, IsKey, NAME);
                    if(_GDS_.TYPE_O_00 == OBJ_TEXT)                  IsDone = go.GAC.CreateCall(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow); //
                    // if(_GDS_.TYPE_O_00 == OBJ_ELLIPSE)              IsDone = Dev_Object_Pack.Shapes.Ellipse.Create(MODE_CREATE, IsKey, NAME);
                    if(_GDS_.TYPE_O_00 == OBJ_TEXT)                  IsDone = go.GAC.CreateCall(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow); //
                    //          //====================================================================
                    //          if(_GDS_.TYPE_O_00 == OBJ_ARROW_THUMB_UP)       Dev_Object_Pack.Arrows.ThumbUp.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_ARROW_THUMB_DOWN)     Dev_Object_Pack.Arrows.ThumbDown.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_ARROW_UP)             Dev_Object_Pack.Arrows.Up.Create(MODE_CREATE, IsKey, NAME);//
                    //          if(_GDS_.TYPE_O_00 == OBJ_ARROW_DOWN)           Dev_Object_Pack.Arrows.Down.Create(MODE_CREATE, IsKey, NAME);//
                    //          if(_GDS_.TYPE_O_00 == OBJ_ARROW_STOP)           Dev_Object_Pack.Arrows.Stop.Create(MODE_CREATE, IsKey, NAME);//
                    //          if(_GDS_.TYPE_O_00 == OBJ_ARROW_CHECK)          Dev_Object_Pack.Arrows.Check.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_ARROW_LEFT_PRICE)     Dev_Object_Pack.Arrows.LeftPrice.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_ARROW_RIGHT_PRICE)    Dev_Object_Pack.Arrows.RightPrice.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_ARROW_BUY)            Dev_Object_Pack.Arrows.Buy.Create(MODE_CREATE, IsKey, NAME);//
                    //          if(_GDS_.TYPE_O_00 == OBJ_ARROW_SELL)           Dev_Object_Pack.Arrows.Sell.Create(MODE_CREATE, IsKey, NAME);//
                    //          if(_GDS_.TYPE_O_00 == OBJ_ARROW)                Dev_Object_Pack.Arrows.Arrow.Create(MODE_CREATE, IsKey, NAME);//
                    //          //====================================================================
                    //---[OBJ_TEXT  ||  OBJ_LABEL  ||  OBJ_RECTANGLE_LABEL   ||  OBJ_BUTTON  ||  OBJ_EDIT ]
                    {
                              {         //---if(_GDS_.TYPE_O_00 == OBJ_TEXT)                  IsDone = Dev_Object_Pack.Texts.Description.Create(MODE_CREATE, IsKey, NAME);//
                                        if(_GDS_.TYPE_O_00 == OBJ_TEXT)                  IsDone = go.GAC.CreateCall(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow); //
                              }
                              //-----------------------------------------------------------------------------------------------------------------------------
                              {         //---if(_GDS_.TYPE_O_00 == OBJ_LABEL)            IsDone = ObjectCreate(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJ_LABEL, ChartData_ChartInfo.SubWindow, 0, 0); //
                                        //---if(_GDS_.TYPE_O_00 == OBJ_LABEL)            IsDone = Dev_Object_Pack.Texts.Label.Action(MODE_CREATE, IsKey, _GDS_.NAME_A_01);//
                                        //---if(_GDS_.TYPE_O_00 == OBJ_LABEL)            IsDone = go.GAC.Create(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow, 0, 0); //
                                        if(_GDS_.TYPE_O_00 == OBJ_LABEL)                 IsDone = go.GAC.CreateCall(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow); //
                              }
                              //-----------------------------------------------------------------------------------------------------------------------------
                              {         //---if(_GDS_.TYPE_O_00 == OBJ_RECTANGLE_LABEL)  IsDone = ObjectCreate(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJ_RECTANGLE_LABEL, ChartData_ChartInfo.SubWindow, 0, 0); //
                                        //---if(_GDS_.TYPE_O_00 == OBJ_RECTANGLE_LABEL)  IsDone = Dev_Object_Pack.Texts.RectLabel.Create(MODE_CREATE, IsKey, NAME);//
                                        //---if(_GDS_.TYPE_O_00 == OBJ_RECTANGLE_LABEL)  IsDone = go.GAC.Create(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow, 0, 0, 0, 0); //
                                        if(_GDS_.TYPE_O_00 == OBJ_RECTANGLE_LABEL)       IsDone = go.GAC.CreateCall(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow); //
                              }
                              //-----------------------------------------------------------------------------------------------------------------------------
                              {         //---if(_GDS_.TYPE_O_00 == OBJ_BUTTON)           IsDone = ObjectCreate(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJ_BUTTON, ChartData_ChartInfo.SubWindow, 0, 0);//
                                        //---if(_GDS_.TYPE_O_00 == OBJ_BUTTON)           IsDone = Dev_Object_Pack.Texts.Button.Create(MODE_CREATE, IsKey, NAME);//
                                        //---if(_GDS_.TYPE_O_00 == OBJ_BUTTON)           IsDone = go.GAC.Create(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow, 0, 0); //
                                        if(_GDS_.TYPE_O_00 == OBJ_BUTTON)                IsDone = go.GAC.CreateCall(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow); //
                              }
                              //-----------------------------------------------------------------------------------------------------------------------------
                              {         //---if(_GDS_.TYPE_O_00 == OBJ_EDIT)             IsDone = ObjectCreate(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJ_EDIT, ChartData_ChartInfo.SubWindow, 0, 0);//
                                        //---if(_GDS_.TYPE_O_00 == OBJ_EDIT)             IsDone = Dev_Object_Pack.Texts.Edit.Create(MODE_CREATE, IsKey, NAME);
                                        //---if(_GDS_.TYPE_O_00 == OBJ_EDIT)             IsDone = go.GAC.Create(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow, 0, 0); //
                                        if(_GDS_.TYPE_O_00 == OBJ_EDIT)                  IsDone = go.GAC.CreateCall(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, ChartData_ChartInfo.SubWindow); //
                                        //
                              }//
                    }
                    //          //====================================================================
                    //          if(_GDS_.TYPE_O_00 == OBJ_BITMAP)               Dev_Object_Pack.Bitmaps.Label.Create(MODE_CREATE, IsKey, NAME);
                    //          if(_GDS_.TYPE_O_00 == OBJ_BITMAP_LABEL)         Dev_Object_Pack.Bitmaps.Bar.Create(MODE_CREATE, IsKey, NAME);
                    //          //====================================================================
                    //          if(_GDS_.TYPE_O_00 == OBJ_EVENT)                Dev_Object_Pack.Events.Event.Create(MODE_CREATE, IsKey, NAME);//
                    //          //====================================================================
                    //
          }   //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO >bool __COBFA__::CALL_Delete(GO &go)
{         return ObjectDelete(ChartData_ChartInfo.ID, _GDS_.NAME_A_01);}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO >
bool __COBFA__::CALL_Move(GO &go)
{         //if(TYPE == OBJ_EVENT || TYPE == OBJ_TEXT || TYPE == OBJ_BITMAP || TYPE == OBJ_ARROW || TYPE == OBJ_ARROW_SELL || TYPE == OBJ_ARROW_BUY || TYPE == OBJ_ARROW_RIGHT_PRICE || TYPE == OBJ_ARROW_LEFT_PRICE || TYPE == OBJ_ARROW_CHECK || TYPE == OBJ_ARROW_STOP || TYPE == OBJ_ARROW_DOWN || TYPE == OBJ_ARROW_UP || TYPE == OBJ_ARROW_THUMB_DOWN || TYPE == OBJ_ARROW_THUMB_UP)
          if(
                    _GDS_.TYPE_O_00 == OBJ_LABEL ||
                    _GDS_.TYPE_O_00 == OBJ_RECTANGLE_LABEL ||
                    _GDS_.TYPE_O_00 == OBJ_BUTTON ||
                    _GDS_.TYPE_O_00 == OBJ_EDIT ||
                    _GDS_.TYPE_O_00 == OBJ_BITMAP_LABEL
          )
          {         //---------------------------------------------------------------------------------------------------
                    //Print(_GDS_.NAME_A_01, "  -if-  ", _GDS_.XDISTANCE_L_02);
                    //Alert( "_GDS_.YDISTANCE_L_03:", _GDS_.XDISTANCE_L_02, "   ObjectType:", ObjectType( _GDS_.NAME_A_01));
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XDISTANCE, _GDS_.XDISTANCE_L_02);               //go.GAC.X_Distance(_GDS_.XDISTANCE_L_02);
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YDISTANCE, _GDS_.YDISTANCE_L_03); return true;  //go.GAC.Y_Distance(_GDS_.YDISTANCE_L_03);
                    //---------------------------------------------------------------------------------------------------
          } //Label_.X_Distance(XCordinate);//Label_.Y_Distance(YCordinate); //
          else
          {         //
                    //Alert(_GDS_.NAME_A_01, "  -else-  ", _GDS_.XDISTANCE_L_02);
                    if(_GDS_.TYPE_O_00  == OBJ_TEXT && _GDS_.TYPE_O_00  == OBJ_BITMAP)
                    {         ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME,  _GDS_.TIME_6);
                              ObjectSetDouble( 0, _GDS_.NAME_A_01, OBJPROP_PRICE, _GDS_.PRICE_7);  return true; //
                    }
                    //
                    if(_GDS_.TYPE_O_00 == OBJ_EVENT )
                    {         ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME, _GDS_.TIME_6);    return true;}
                    //
                    if(
                              _GDS_.TYPE_O_00 == OBJ_CYCLES ||
                              _GDS_.TYPE_O_00  == OBJ_TREND ||
                              _GDS_.TYPE_O_00  == OBJ_TRENDBYANGLE ||
                              _GDS_.TYPE_O_00  == OBJ_HLINE ||
                              _GDS_.TYPE_O_00  == OBJ_VLINE
                    )
                    {         if(_GDS_.TYPE_O_00  == OBJ_VLINE )    {return ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME,  _GDS_.TIME_6);}
                              if(_GDS_.TYPE_O_00  == OBJ_HLINE )    {return ObjectSetDouble( 0, _GDS_.NAME_A_01, OBJPROP_PRICE, _GDS_.PRICE_7);}
                              if(
                                        _GDS_.TYPE_O_00  == OBJ_CYCLES ||
                                        _GDS_.TYPE_O_00  == OBJ_TREND ||
                                        _GDS_.TYPE_O_00  == OBJ_TRENDBYANGLE
                              )
                              {         ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME1,       _GDS_.TIME1);
                                        ObjectSetDouble( 0, _GDS_.NAME_A_01, OBJPROP_PRICE1,      _GDS_.PRICE1);
                                        ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME2,       _GDS_.TIME2);
                                        ObjectSetDouble( 0, _GDS_.NAME_A_01, OBJPROP_PRICE2,      _GDS_.PRICE2); return true; ////
                              }//
                    }
                    if(
                              _GDS_.TYPE_O_00  == OBJ_REGRESSION  ||
                              _GDS_.TYPE_O_00  == OBJ_STDDEVCHANNEL ||
                              _GDS_.TYPE_O_00  == OBJ_CHANNEL ||
                              _GDS_.TYPE_O_00  == OBJ_PITCHFORK
                    )
                    {         //
                              if(_GDS_.TYPE_O_00  == OBJ_REGRESSION  || _GDS_.TYPE_O_00  == OBJ_STDDEVCHANNEL)
                              {         ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME1,      _GDS_.TIME1);
                                        ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME2,      _GDS_.TIME2);    return true; ////
                              }//
                              if(_GDS_.TYPE_O_00  == OBJ_CHANNEL || _GDS_.TYPE_O_00  == OBJ_PITCHFORK)
                              {         ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME1,  _GDS_.TIME1 );
                                        ObjectSetDouble( 0, _GDS_.NAME_A_01, OBJPROP_PRICE1, _GDS_.PRICE1);
                                        ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME2,  _GDS_.TIME2);
                                        ObjectSetDouble(0,  _GDS_.NAME_A_01, OBJPROP_PRICE2, _GDS_.PRICE2 );
                                        ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME3,  _GDS_.TIME3 );
                                        ObjectSetDouble(0,  _GDS_.NAME_A_01, OBJPROP_PRICE3, _GDS_.PRICE3); return true; ////
                              }//
                    }
                    if(_GDS_.TYPE_O_00 == OBJ_GANNLINE || _GDS_.TYPE_O_00 == OBJ_GANNFAN || _GDS_.TYPE_O_00 == OBJ_GANNGRID)
                    {         ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME1,   _GDS_.TIME1 );
                              ObjectSetDouble( 0, _GDS_.NAME_A_01, OBJPROP_PRICE1,  _GDS_.PRICE1);
                              ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME2,   _GDS_.TIME2);
                              //ObjectSetDouble(0, _GDS_.NAME_A_01, OBJPROP_PRICE2, _GDS_.PRICE2 ); //
                              //ObjectMove(0, _GDS_.NAME_A_01, point_index, TIME1,  _GDS_.PRICE1); //
                              ObjectMove(0, _GDS_.NAME_A_01, 0, _GDS_.TIME1, _GDS_.PRICE1); //
                              //
                    }//
                    if(
                              _GDS_.TYPE_O_00 == OBJ_FIBO ||
                              _GDS_.TYPE_O_00 == OBJ_FIBOTIMES ||
                              _GDS_.TYPE_O_00 == OBJ_FIBOFAN ||
                              _GDS_.TYPE_O_00 == OBJ_FIBOARC ||
                              _GDS_.TYPE_O_00 == OBJ_FIBOCHANNEL ||
                              _GDS_.TYPE_O_00 == OBJ_EXPANSION
                    )
                    {         //
                              ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME1,        _GDS_.TIME1);
                              ObjectSetDouble(0,  _GDS_.NAME_A_01, OBJPROP_PRICE1,       _GDS_.PRICE1);
                              ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME2,        _GDS_.TIME2);
                              ObjectSetDouble(0,  _GDS_.NAME_A_01, OBJPROP_PRICE2,       _GDS_.PRICE2);
                              if( _GDS_.TYPE_O_00 == OBJ_FIBOCHANNEL || _GDS_.TYPE_O_00 == OBJ_EXPANSION )
                              {         ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME3,       _GDS_.TIME3);
                                        ObjectSetDouble(0, _GDS_.NAME_A_01, OBJPROP_PRICE3,       _GDS_.PRICE3); } //
                              return true; ////
                    }//
                    if( _GDS_.TYPE_O_00 == OBJ_RECTANGLE || _GDS_.TYPE_O_00 == OBJ_TRIANGLE || _GDS_.TYPE_O_00 == OBJ_ELLIPSE)
                    {         ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME1,         _GDS_.TIME1);
                              ObjectSetDouble( 0, _GDS_.NAME_A_01, OBJPROP_PRICE1,        _GDS_.PRICE1);
                              ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME2,         _GDS_.TIME2);
                              ObjectSetDouble( 0, _GDS_.NAME_A_01, OBJPROP_PRICE2,        _GDS_.PRICE2); return true; ////
                              if( _GDS_.TYPE_O_00 == OBJ_TRIANGLE )
                              {         ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME3,  _GDS_.TIME3);
                                        ObjectSetDouble( 0, _GDS_.NAME_A_01, OBJPROP_PRICE3, _GDS_.PRICE3); //
                              } //
                              return true; ////
                    }//
                    if(
                              _GDS_.TYPE_O_00 == OBJ_ARROW_THUMB_UP || _GDS_.TYPE_O_00 == OBJ_ARROW_THUMB_DOWN ||
                              _GDS_.TYPE_O_00 == OBJ_ARROW_UP       || _GDS_.TYPE_O_00 == OBJ_ARROW_DOWN       || _GDS_.TYPE_O_00 == OBJ_ARROW_STOP ||
                              _GDS_.TYPE_O_00 == OBJ_ARROW_CHECK    || _GDS_.TYPE_O_00 == OBJ_ARROW_LEFT_PRICE || _GDS_.TYPE_O_00 == OBJ_ARROW_RIGHT_PRICE ||
                              _GDS_.TYPE_O_00 == OBJ_ARROW_BUY      || _GDS_.TYPE_O_00 == OBJ_ARROW_SELL       || _GDS_.TYPE_O_00 == OBJ_ARROW
                    )
                    {         //
                              ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_TIME1,   _GDS_.TIME1);
                              ObjectSetDouble(0, _GDS_.NAME_A_01, OBJPROP_PRICE1,   _GDS_.PRICE1);//
                    }
                    //
          } //
          return false;//
} //
//+------------------------------------------------------------------+
//|                                                                  |//--- unknowen
//+------------------------------------------------------------------+
template<typename _IGO_>
bool __COBFA__::Set_Init(ENUM_OBJECT OBJ_TYPE, string Name, int PointX, int PointY, int SizeX, int SizeY, color Color, color bgColor = clrNONE)
{         long          chart_ID        = 0;             //--- chart's ID
          int           sub_window      = 0;             //--- subwindow index
          bool          selection       = false;         //--- highlight to move
          bool          hidden          = true;          //--- hidden in the object list
          long          z_order         = 0;             //--- priority for mouse click
          string        tooltip         = "\n";
          string        name            = "Edit_" ;
          string        Desc            = name;
//===================================================================
          CHART                         = chart_ID;
          NAME                          = name;
          TYPE                          = OBJ_TYPE;
          SUBWINDOW                     = sub_window;
//
          bool result = false; //
          if(false)
          {         if(TYPE == OBJ_VLINE)              result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_HLINE)              result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_TREND)              result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_TRENDBYANGLE)       result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_CYCLES)             result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    //====================================================================
                    if(TYPE == OBJ_CHANNEL)            result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_STDDEVCHANNEL)      result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_REGRESSION)         result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_PITCHFORK)          result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    //====================================================================
                    if(TYPE == OBJ_GANNLINE)           result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_GANNFAN)            result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_GANNGRID)           result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    //====================================================================
                    if(TYPE == OBJ_FIBO)               result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_FIBOTIMES)          result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_FIBOFAN)            result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_FIBOARC)            result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_FIBOCHANNEL)        result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_EXPANSION)          result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    //====================================================================
                    if(TYPE == OBJ_RECTANGLE)          result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_TRIANGLE)           result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_ELLIPSE)            result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    //====================================================================
                    if(TYPE == OBJ_ARROW_THUMB_UP)     result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_ARROW_THUMB_DOWN)   result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_ARROW_UP)           result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_ARROW_DOWN)         result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_ARROW_STOP)         result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_ARROW_CHECK)        result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_ARROW_LEFT_PRICE)   result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_ARROW_RIGHT_PRICE)  result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_ARROW_BUY)          result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_ARROW_SELL)         result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_ARROW)              result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    //====================================================================
                    if(TYPE == OBJ_TEXT)               result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_LABEL)              result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_RECTANGLE_LABEL)    result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_BUTTON)             result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_EDIT)               result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    //====================================================================
                    if(TYPE == OBJ_BITMAP)             result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    if(TYPE == OBJ_BITMAP_LABEL)       result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    //====================================================================
                    if(TYPE == OBJ_EVENT)              result = Dev_Object_Pack.Texts.RectLabel._GDS_.INIT(Desc, PointX, PointY, SizeX, SizeY, Color, bgColor); //
                    //====================================================================
          }
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO >
void __COBFA__::Set_Attribe_Global(GO &go, bool Is_Obj)
{
          {         //any type
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BACK,                    _GDS_.BACK_G_00); //Sleep(1);
                    bool Is_Set = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_HIDDEN,    _GDS_.HIDDEN_G_00);
                    //--Alert( " ---- _GDS_.HIDDEN_G_00: ", _GDS_.HIDDEN_G_00, "  ----ChartData_ChartInfo.ID: ", ChartData_ChartInfo.ID,"   ",Is_Set, "  ", _GDS_.NAME_A_01, "   ", ErrorDescription(_LastError));
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTABLE,      _GDS_.SELECTABLE_G_00);
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTED,        _GDS_.SELECTED_G_00);
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ZORDER,          _GDS_.ZORDER_G_00);
                    ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TOOLTIP,         _GDS_.TOOLTIP_G_00);//
          }
          if(true)          //any type
          {         go.GAC.Background(_GDS_.BACK_G_00);          //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_BACK, BACK);
                    go.GAC.Selectable(_GDS_.SELECTABLE_G_00);    //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_SELECTABLE, SELECTABLE);
                    go.GAC.Selected(_GDS_.SELECTED_G_00);        //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_SELECTED, SELECTED);
                    go.GAC.Hidden(_GDS_.HIDDEN_G_00);            //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_HIDDEN, HIDDEN);
                    go.GAC.Z_Order(_GDS_.ZORDER_G_00);           //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_ZORDER, ZORDER);
                    go.GAC.Tooltip(_GDS_.TOOLTIP_G_00);          //ObjectSetString(ChartData_ChartInfo.ID,  NAME, OBJPROP_TOOLTIP, TOOLTIP);//
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO >
void __COBFA__::Set_Attribe_Line(GO &go, bool Is_Obj)
{         bool IsType = (_GDS_.TYPE_O_00 == OBJ_VLINE) || (_GDS_.TYPE_O_00 == OBJ_HLINE) || (_GDS_.TYPE_O_00 == OBJ_TREND) || (_GDS_.TYPE_O_00 == OBJ_TRENDBYANGLE) || (_GDS_.TYPE_O_00 == OBJ_CYCLES);
          if(!IsType) return;
          if(!Is_Obj)
          {         //any type Line
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR, _GDS_.COLOR_C_00);
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE, _GDS_.STYLE_9);
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH, _GDS_.WIDTH_10);
                    if(_GDS_.TYPE_O_00 == OBJ_VLINE)
                              ObjectSetInteger        (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME,    _GDS_.TIME1);
                    if(_GDS_.TYPE_O_00 == OBJ_HLINE)
                              ObjectSetDouble         (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE,   _GDS_.PRICE1);
                    //
                    if(_GDS_.TYPE_O_00 == OBJ_TREND || _GDS_.TYPE_O_00 == OBJ_TRENDBYANGLE)
                    {         ObjectSetInteger        (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME1,    _GDS_.TIME1);
                              ObjectSetDouble         (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE1,   _GDS_.PRICE1);
                              ObjectSetInteger        (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME2,    _GDS_.TIME2);
                              ObjectSetDouble         (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE2,   _GDS_.PRICE2); //
                    }
                    //---
                    if(_GDS_.TYPE_O_00 == OBJ_TREND || _GDS_.TYPE_O_00 == OBJ_TRENDBYANGLE)
                    {         ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_RAY_RIGHT, _GDS_.RAY_RIGHT_11);}
                    if(_GDS_.TYPE_O_00 == OBJ_TRENDBYANGLE)
                    {         ObjectSetInteger        (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME1,    _GDS_.TIME1);
                              ObjectSetDouble         (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE1,   _GDS_.PRICE1);
                              ObjectSetInteger        (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME2,    _GDS_.TIME2 = 0);
                              ObjectSetDouble         (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE2,   _GDS_.PRICE2 = 0); //
                              ObjectSetDouble         (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANGLE,    _GDS_.ALIGN_13);//
                    }
                    //
          }
//else
//{         //any type Line
//          go.GAC.Color(COLOR); //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR, COLOR);
//          go.GAC.Style(STYLE); //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE, STYLE);
//          go.GAC.Width(WIDTH); //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH, WIDTH);
//          if(TYPE == OBJ_TREND || TYPE == OBJ_TRENDBYANGLE) { go.GAC.RayRight(RAY_RIGHT);   /*ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_RAY_RIGHT, RAY_RIGHT);*/}
//          if(TYPE == OBJ_TRENDBYANGLE)                      { go.GAC.Angle(ANGLE);          /*ObjectSetDouble(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANGLE, ANGLE);*/}
//          //
//}//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO >
void __COBFA__::Set_Attribe_Channel(GO &go, bool Is_Obj)
{         bool IsChannel = _GDS_.TYPE_O_00 == OBJ_CHANNEL || _GDS_.TYPE_O_00 == OBJ_STDDEVCHANNEL || _GDS_.TYPE_O_00 == OBJ_REGRESSION || _GDS_.TYPE_O_00 == OBJ_PITCHFORK;
          if(!IsChannel)return;
          if(!Is_Obj)
          {         //any type
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,           _GDS_.COLOR_C_00);
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE,           _GDS_.STYLE_9);
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH,           _GDS_.WIDTH_10);
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_RAY_RIGHT,       _GDS_.RAY_RIGHT_11);//
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BACK,            _GDS_.BACK_G_00);//
                    //---
                    if(_GDS_.TYPE_O_00 == OBJ_CHANNEL || _GDS_.TYPE_O_00 == OBJ_PITCHFORK)
                    {         ObjectSetInteger        (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME1,         _GDS_.TIME1);
                              ObjectSetDouble         (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE1,        _GDS_.PRICE1);
                              ObjectSetInteger        (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME2,         _GDS_.TIME2);
                              ObjectSetDouble         (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE2,        _GDS_.PRICE2); //
                              ObjectSetInteger        (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME3,         _GDS_.TIME3);
                              ObjectSetDouble         (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE3,        _GDS_.PRICE3); //
                    }
                    if( _GDS_.TYPE_O_00 == OBJ_REGRESSION)
                    {         ObjectSetInteger        (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME1,         _GDS_.TIME1);
                              ObjectSetInteger        (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME2,         _GDS_.TIME2);//
                    }
                    if(_GDS_.TYPE_O_00 == OBJ_STDDEVCHANNEL)
                    {         ObjectSetInteger          (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME1,       _GDS_.TIME1);
                              ObjectSetInteger          (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME2,       _GDS_.TIME2);//
                              ObjectSetDouble           (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_DEVIATION,   _GDS_.DEVIATION); //
                    } //
          }
//else
//{         //any type
//          go.GAC.Color(COLOR);                      //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR, COLOR);
//          go.GAC.Style(STYLE);                      //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE, STYLE);
//          go.GAC.Width(WIDTH);                      //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH, WIDTH);//
//          //---   go.GAC.RayRight(RAY_RIGHT);       //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_RAY_RIGHT, RAY_RIGHT);//
//          //---   if(TYPE == OBJ_STDDEVCHANNEL) { go.GAC.Deviations(DEVIATION);/*ObjectSetDouble(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_DEVIATION, DEVIATION);*/} //
//}//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO >
void __COBFA__::Set_Attribe_Gann(GO &go, bool Is_Obj)
{         bool IsType = _GDS_.TYPE_O_00 == OBJ_GANNLINE || _GDS_.TYPE_O_00 == OBJ_GANNFAN || _GDS_.TYPE_O_00 == OBJ_GANNGRID;
          if(!IsType)return;
          if( Is_Obj)
          {
                    {         //any type
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,   COLOR);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE,   STYLE);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH,   WIDTH);//
                              ObjectSetDouble(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SCALE,    SCALE); //
                    }
                    if(TYPE == OBJ_GANNLINE)
                    {         ObjectSetDouble(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANGLE, ANGLE);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_RAY_RIGHT, RAY_RIGHT); //
                    }
                    if(TYPE == OBJ_GANNFAN || TYPE == OBJ_GANNGRID) {ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_DIRECTION, DIRECTION);} //
          }
//else
//{
//          {         //any type
//                    go.GAC.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR, COLOR);
//                    go.GAC.Style(STYLE);            //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE, STYLE);
//                    //--- go.GAC.Width(Width);      //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH, WIDTH);//
//                    //---go.GAC.PipsPerBar(SCALE);  //ObjectSetDouble(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SCALE, SCALE); //
//          }
//          if(_GDS_.TYPE_O_00 == OBJ_GANNLINE)
//          {         go.GAC.Angle(ANGLE);                    // ObjectSetDouble(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANGLE, ANGLE);
//                    //---go.GAC.RayRight(RAY_RIGHT);        //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_RAY_RIGHT, RAY_RIGHT); //
//          }
//          //---if((_GDS_.TYPE_O_00 == OBJ_GANNFAN) || _GDS_.TYPE_O_00 == OBJ_GANNGRID) {go.GAC.Downtrend(DIRECTION) /*ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_DIRECTION, DIRECTION);*/} //
//}//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO >
void __COBFA__::Set_Attribe_Fibo(GO &go, bool Is_Obj)
{         bool IsType = _GDS_.TYPE_O_00 == OBJ_FIBO || _GDS_.TYPE_O_00 == OBJ_FIBOTIMES || _GDS_.TYPE_O_00 == OBJ_FIBOFAN || _GDS_.TYPE_O_00 == OBJ_FIBOARC || _GDS_.TYPE_O_00 == OBJ_FIBOCHANNEL || _GDS_.TYPE_O_00 == OBJ_EXPANSION;
          if(!IsType)return;
          if(!Is_Obj)
          {
                    {         //any type
                              ObjectSetInteger  (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,       _GDS_.COLOR_C_00);
                              ObjectSetInteger  (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE,       _GDS_.STYLE_9);
                              ObjectSetInteger  (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH,       _GDS_.WIDTH_10);//
                              ObjectSetInteger  (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_RAY_RIGHT,   _GDS_.RAY_RIGHT_11);//
                    }
                    {         ObjectSetInteger  (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME1,       _GDS_.TIME1);
                              ObjectSetDouble   (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE1,      _GDS_.PRICE1);
                              ObjectSetInteger  (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME2,       _GDS_.TIME2);
                              ObjectSetDouble   (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE2,      _GDS_.PRICE2); //
                    }
                    if(_GDS_.TYPE_O_00 == OBJ_EXPANSION)
                    {         ObjectSetInteger  (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME3,       _GDS_.TIME3);
                              ObjectSetDouble   (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE3,      _GDS_.PRICE3); //
                    }
                    if(_GDS_.TYPE_O_00 == OBJ_FIBOARC)
                    {         ObjectSetDouble   (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SCALE,       _GDS_.SCALE);
                              ObjectSetInteger  (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ELLIPSE,     _GDS_.ELLIPSE);//
                    }
                    if(_GDS_.TYPE_O_00 == OBJ_FIBOCHANNEL)
                    {         ObjectSetInteger  (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_RAY,         _GDS_.RAY); }
                    if(_GDS_.TYPE_O_00 == OBJ_EXPANSION || _GDS_.TYPE_O_00 == OBJ_FIBO)
                    {         ObjectSetInteger  (ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_RAY_RIGHT,   _GDS_.RAY_RIGHT_11); } //
          }
//else
//{
//          {         //any type
//                    go.GAC.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR, COLOR);
//                    go.GAC.Style(STYLE);            //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE, STYLE);
//                    //---go.GAC.Width(Width);            //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH, WIDTH);//
//          }
//          if(_GDS_.TYPE_O_00 == OBJ_FIBOARC)
//          {         //---go.GAC.Scale(SCALE);            //ObjectSetDouble(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SCALE, SCALE);
//                    //---go.GAC.Ellipse(ELLIPSE);        //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ELLIPSE, ELLIPSE);//
//          }
//          //---if(_GDS_.TYPE_O_00 == OBJ_FIBOCHANNEL)                          {go.GAC.RayRight(RAY); /*ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_RAY, RAY);*/}
//          //---if(_GDS_.TYPE_O_00 == OBJ_EXPANSION || _GDS_.TYPE_O_00 == OBJ_FIBO)   {go.GAC.RayRight(RAY_RIGHT);/*ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_RAY_RIGHT, RAY_RIGHT);*/} //
//}//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO >
void __COBFA__::Set_Attribe_Shape(GO &go, bool Is_Obj)
{         bool IsType = _GDS_.TYPE_O_00 == OBJ_RECTANGLE || _GDS_.TYPE_O_00 == OBJ_TRIANGLE || _GDS_.TYPE_O_00 == OBJ_ELLIPSE;
          if(!IsType)return;
          if(!Is_Obj)
          {
                    {         //any type
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,   _GDS_.COLOR_C_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE,   _GDS_.STYLE_9);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH,   _GDS_.WIDTH_10);//
                    }
                    {         ObjectSetInteger( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME1,               _GDS_.TIME1);
                              ObjectSetDouble(  ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE1,              _GDS_.PRICE1);//
                              ObjectSetInteger( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME2,               _GDS_.TIME2);
                              ObjectSetDouble(  ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE2,              _GDS_.PRICE2);//
                    }
                    if(_GDS_.TYPE_O_00 == OBJ_RECTANGLE) { ObjectSetInteger( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FILL, _GDS_.FILL); }
                    //
                    if(_GDS_.TYPE_O_00 == OBJ_ELLIPSE)   {ObjectSetDouble(ChartData_ChartInfo.ID,  _GDS_.NAME_A_01, OBJPROP_SCALE, _GDS_.SCALE);}//
                    if(_GDS_.TYPE_O_00 == OBJ_TRIANGLE)
                    {         ObjectSetInteger( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME3,               _GDS_.TIME3);
                              ObjectSetDouble(  ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE3,              _GDS_.PRICE3);//
                    } //
          }
//else
//{
//          {         //any type
//                    go.GAC.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_COLOR, COLOR);
//                    go.GAC.Style(STYLE);            //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_STYLE, STYLE);
//                    //---go.GAC.Width(Width);            //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_WIDTH, WIDTH);//
//          }
//          if(TYPE == OBJ_RECTANGLE) {go.GAC.Fill(FILL); /*ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_FILL, FILL);*/}
//          if(TYPE == OBJ_ELLIPSE)   {/*go.GAC.SCALE(SCALE);*/ ObjectSetDouble(ChartData_ChartInfo.ID, NAME, OBJPROP_SCALE, SCALE);}//No Objective
//}//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO>
bool  __COBFA__::Set_Attribe_Arrow(GO &go, bool Is_Obj)
{         bool IsType = _GDS_.TYPE_O_00 == OBJ_ARROW_THUMB_UP || _GDS_.TYPE_O_00 == OBJ_ARROW_THUMB_DOWN ||
                        _GDS_.TYPE_O_00 == OBJ_ARROW_UP       || _GDS_.TYPE_O_00 == OBJ_ARROW_DOWN       || _GDS_.TYPE_O_00 == OBJ_ARROW_STOP ||
                        _GDS_.TYPE_O_00 == OBJ_ARROW_CHECK    || _GDS_.TYPE_O_00 == OBJ_ARROW_LEFT_PRICE || _GDS_.TYPE_O_00 == OBJ_ARROW_RIGHT_PRICE ||
                        _GDS_.TYPE_O_00 == OBJ_ARROW_BUY      || _GDS_.TYPE_O_00 == OBJ_ARROW_SELL       || _GDS_.TYPE_O_00 == OBJ_ARROW;
          return false;
          if(!IsType)return false;
          if(!Is_Obj)
          {         //
                    {         //any type
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,   COLOR);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE,   STYLE);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH,   WIDTH);//
                    }
                    if(_GDS_.TYPE_O_00 != OBJ_ARROW_BUY   || _GDS_.TYPE_O_00 != OBJ_ARROW_SELL  ) { ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANCHOR,      ANCHOR_ARROW);}
                    if(_GDS_.TYPE_O_00 == OBJ_ARROW)                                         { ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ARROWCODE,   ARROWCODE);} //
          }
//else
//{         //
//          {         //any type
//                    go.GAC.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_COLOR, COLOR);
//                    go.GAC.Style(STYLE);            //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_STYLE, STYLE);
//                    go.GAC.Width(Width);            //ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_WIDTH, WIDTH);//
//          }
//          if(TYPE != OBJ_ARROW_BUY || TYPE != OBJ_ARROW_SELL ) { go.GAC.Anchor(ANCHOR_ARROW); /*ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_ANCHOR, ANCHOR_ARROW);*/}
//          if(TYPE == OBJ_ARROW)                                 { go.GAC.ArrowCode(ARROWCODE); /*ObjectSetInteger(ChartData_ChartInfo.ID, NAME, OBJPROP_ARROWCODE, ARROWCODE);*/} //
//}//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO>
void __COBFA__::Set_Attribe_Text(GO &go, bool Is_Obj)
{         bool IsType = _GDS_.TYPE_O_00 == OBJ_TEXT || _GDS_.TYPE_O_00 == OBJ_LABEL || _GDS_.TYPE_O_00 == OBJ_RECTANGLE_LABEL || _GDS_.TYPE_O_00 == OBJ_BUTTON || _GDS_.TYPE_O_00 == OBJ_EDIT;
          if(!IsType)return;
          //----
          if(!Is_Obj)
          {         //---[Common]-----
                    {         //
                              {         //any type
                                        ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,       _GDS_.COLOR_C_00);//
                              }
                              //+------------------------------------------------------------------+
                              //|                                                                  |
                              //+------------------------------------------------------------------+
                              if(_GDS_.TYPE_O_00 == OBJ_TEXT)
                              {         //-----------------
                                        ObjectSetInteger( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME,       _GDS_.TIME_6);
                                        ObjectSetDouble(  ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE,      _GDS_.PRICE_7);
                                        ObjectSetString(  ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TEXT,       _GDS_.TEXT_B_01);
                                        ObjectSetString(  ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONT,       _GDS_.FONT_B_02);
                                        ObjectSetInteger( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONTSIZE,   _GDS_.FONTSIZE_B_03);
                                        ObjectSetDouble(  ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANGLE,      _GDS_.ANGLE_8);
                                        ObjectSetInteger( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANCHOR,     _GDS_.ANCHOR_POINT_9); //
                              }
                              //+------------------------------------------------------------------+
                              //|                                                                  |
                              //+------------------------------------------------------------------+
                              if(
                                        _GDS_.TYPE_O_00 == OBJ_LABEL     ||
                                        _GDS_.TYPE_O_00 == OBJ_BUTTON    ||
                                        _GDS_.TYPE_O_00 == OBJ_EDIT      ||
                                        _GDS_.TYPE_O_00 == OBJ_RECTANGLE_LABEL
                              )
                              {
                                        {         //any type
                                                  ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XDISTANCE,   _GDS_.XDISTANCE_L_02);
                                                  ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YDISTANCE,   _GDS_.YDISTANCE_L_03);//
                                                  ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_CORNER,      _GDS_.CORNER_L_06); //
                                        }
                                        if(_GDS_.TYPE_O_00 != OBJ_RECTANGLE_LABEL)          //any type
                                        {         ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TEXT,        _GDS_.TEXT_B_01);
                                                  ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONT,        _GDS_.FONT_B_02);
                                                  ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONTSIZE,    _GDS_.FONTSIZE_B_03);//
                                        }
                                        if(_GDS_.TYPE_O_00 == OBJ_LABEL)
                                        {         ObjectSetDouble( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANGLE,       _GDS_.ANGLE_8);
                                                  ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANCHOR,      _GDS_.ANCHOR_POINT_9); //
                                        }
                                        if(_GDS_.TYPE_O_00 == OBJ_BUTTON || _GDS_.TYPE_O_00 == OBJ_EDIT || _GDS_.TYPE_O_00 == OBJ_RECTANGLE_LABEL)
                                        {
                                                  {         //any type
                                                            ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XSIZE,             _GDS_.XSIZE_L_04);
                                                            ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YSIZE,             _GDS_.YSIZE_L_05);
                                                            //
                                                            ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BGCOLOR,           _GDS_.COLOR_BackGround_C_01);
                                                            if(_GDS_.TYPE_O_00 != OBJ_RECTANGLE_LABEL )
                                                                      ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BORDER_COLOR, _GDS_.COLOR_Border_C_02);//
                                                  }
                                                  if(_GDS_.TYPE_O_00 == OBJ_BUTTON) {ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STATE, _GDS_.STATE_13);}
                                                  if(_GDS_.TYPE_O_00 == OBJ_EDIT)
                                                  {         ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ALIGN,       _GDS_.ALIGN_13);
                                                            ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_READONLY,    _GDS_.READONLY_14);//
                                                  }//
                                                  if(_GDS_.TYPE_O_00 == OBJ_RECTANGLE_LABEL)
                                                  {         ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE,       _GDS_.STYLE_9);
                                                            ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH,       _GDS_.WIDTH_10);//
                                                            //--- set label coordinates
                                                  }//
                                        }//
                              } //
                    } //---[OBJ_TEXT]-----
                    if(_GDS_.TYPE_O_00 == OBJ_TEXT)
                    {         //
                              ObjectSetInteger(0, _GDS_.NAME_A_01, OBJPROP_COLOR, clrNONE);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,         _GDS_.COLOR_C_00);//
                              //
                              ObjectSetInteger( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME,         _GDS_.TIME_6);
                              ObjectSetDouble(  ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE,        _GDS_.PRICE_7);
                              ObjectSetString(  ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TEXT,         _GDS_.TEXT_B_01);
                              ObjectSetString(  ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONT,         _GDS_.FONT_B_02);
                              ObjectSetInteger( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONTSIZE,     _GDS_.FONTSIZE_B_03);
                              ObjectSetDouble(  ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANGLE,        _GDS_.ANGLE_8);
                              ObjectSetInteger( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANCHOR,       _GDS_.ANCHOR_POINT_9); //
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BACK,          _GDS_.BACK_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTABLE,    _GDS_.SELECTABLE_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTED,      _GDS_.SELECTED_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_HIDDEN,        _GDS_.HIDDEN_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ZORDER,        _GDS_.ZORDER_G_00);
                              ObjectSetString(ChartData_ChartInfo.ID,  _GDS_.NAME_A_01, OBJPROP_TOOLTIP,       _GDS_.TOOLTIP_G_00);//
                              //
                    }//---[OBJ_LABEL]-----
                    if(_GDS_.TYPE_O_00 == OBJ_LABEL)
                    {         //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,         _GDS_.COLOR_C_00);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XDISTANCE,     _GDS_.XDISTANCE_L_02);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YDISTANCE,     _GDS_.YDISTANCE_L_03);//
                              //
                              if(true)
                              {         ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME,          _GDS_.TIME_6);//
                                        ObjectSetDouble( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE,         _GDS_.PRICE_7);//
                              }
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_CORNER,        _GDS_.CORNER_L_06); //
                              //
                              ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TEXT,          _GDS_.TEXT_B_01);
                              ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONT,          _GDS_.FONT_B_02);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONTSIZE,      _GDS_.FONTSIZE_B_03);//
                              //
                              ObjectSetDouble( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANGLE,         _GDS_.ANGLE_8);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANCHOR,        _GDS_.ANCHOR_POINT_9); //
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BACK,          _GDS_.BACK_G_00);      //--_GDS_.BACK_G_00 //--if true then candel cover on label
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTABLE,    _GDS_.SELECTABLE_G_00);//--_GDS_.SELECTABLE_G_00
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTED,      _GDS_.SELECTED_G_00);  //--_GDS_.SELECTED_G_00
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_HIDDEN,        _GDS_.HIDDEN_G_00);    //--_GDS_.HIDDEN_G_00
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ZORDER,        _GDS_.ZORDER_G_00);
                              ObjectSetString(ChartData_ChartInfo.ID,  _GDS_.NAME_A_01, OBJPROP_TOOLTIP,       _GDS_.TOOLTIP_G_00);//
                              //
                    }//---[OBJ_RECTANGLE_LABEL]-----
                    if(_GDS_.TYPE_O_00 == OBJ_RECTANGLE_LABEL)
                    {         //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,         _GDS_.COLOR_C_00);//
                              //---ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BGCOLOR,       _GDS_.COLOR_BackGround_C_01);
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XDISTANCE,     _GDS_.XDISTANCE_L_02);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YDISTANCE,     _GDS_.YDISTANCE_L_03);//
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_CORNER,        _GDS_.CORNER_L_06); //
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XSIZE,         _GDS_.XSIZE_L_04);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YSIZE,         _GDS_.YSIZE_L_05);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BGCOLOR,       _GDS_.COLOR_BackGround_C_01);
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE,         _GDS_.STYLE_9);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH,         _GDS_.WIDTH_10);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BACK,          _GDS_.BACK_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTABLE,    _GDS_.SELECTABLE_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTED,      _GDS_.SELECTED_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_HIDDEN,        _GDS_.HIDDEN_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ZORDER,        _GDS_.ZORDER_G_00);
                              ObjectSetString(ChartData_ChartInfo.ID,  _GDS_.NAME_A_01, OBJPROP_TOOLTIP,       _GDS_.TOOLTIP_G_00);//
                              //
                    }//---[OBJ_BUTTON]-----
                    if(_GDS_.TYPE_O_00 == OBJ_BUTTON)
                    {         //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,         _GDS_.COLOR_C_00);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XDISTANCE,     _GDS_.XDISTANCE_L_02);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YDISTANCE,     _GDS_.YDISTANCE_L_03);//
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_CORNER,        _GDS_.CORNER_L_06); //
                              //
                              ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TEXT,          _GDS_.TEXT_B_01);
                              ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONT,          _GDS_.FONT_B_02);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONTSIZE,      _GDS_.FONTSIZE_B_03);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XSIZE,         _GDS_.XSIZE_L_04);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YSIZE,         _GDS_.YSIZE_L_05);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BGCOLOR,       _GDS_.COLOR_BackGround_C_01);
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BORDER_COLOR,  _GDS_.COLOR_Border_C_02);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STATE,         _GDS_.STATE_13);
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BACK,          _GDS_.BACK_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTABLE,    _GDS_.SELECTABLE_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTED,      _GDS_.SELECTED_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_HIDDEN,        _GDS_.HIDDEN_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ZORDER,        _GDS_.ZORDER_G_00);
                              ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TOOLTIP,       _GDS_.TOOLTIP_G_00);//
                              //
                    }//---[OBJ_EDIT]-----
                    if(_GDS_.TYPE_O_00 == OBJ_EDIT)
                    {         //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,         _GDS_.COLOR_C_00);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XDISTANCE,     _GDS_.XDISTANCE_L_02);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YDISTANCE,     _GDS_.YDISTANCE_L_03);//
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_CORNER,        _GDS_.CORNER_L_06); //
                              //
                              ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TEXT,          _GDS_.TEXT_B_01);
                              ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONT,          _GDS_.FONT_B_02);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONTSIZE,      _GDS_.FONTSIZE_B_03);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XSIZE,         _GDS_.XSIZE_L_04);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YSIZE,         _GDS_.YSIZE_L_05);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BGCOLOR,       _GDS_.COLOR_BackGround_C_01);
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BORDER_COLOR,  _GDS_.COLOR_Border_C_02);//
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ALIGN,         _GDS_.ALIGN_13);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_READONLY,      _GDS_.READONLY_14);//
                              //
                              //
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BACK,          _GDS_.BACK_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTABLE,    _GDS_.SELECTABLE_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTED,      _GDS_.SELECTED_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_HIDDEN,        _GDS_.HIDDEN_G_00);
                              ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ZORDER,        _GDS_.ZORDER_G_00);
                              ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TOOLTIP,       _GDS_.TOOLTIP_G_00);//
                              //
                    }//
                    //
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//else
//{
//          {         //any type
//                    go.GAC.Color(COLOR);            //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR, COLOR);//
//          }
//          if(_GDS_.TYPE_O_00 == OBJ_TEXT)
//          {         //-----------------
//                    go.GAC.Time(TIME);                 //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TEXT, TIME);
//                    go.GAC.Price(PRICE);               //ObjectSetDouble( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TEXT, PRICE);
//                    go.GAC.Description(TEXT);        //ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TEXT, TEXT);
//                    go.GAC.Font(FONT);               //ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONT, FONT);
//                    go.GAC.FontSize(FONTSIZE);       //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONTSIZE, FONTSIZE);
//                    go.GAC.Angle(ANGLE);             //ObjectSetDouble( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANGLE, ANGLE);
//                    go.GAC.Anchor(ANCHOR_POINT);     //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANCHOR, ANCHOR_POINT); //
//                    //-----------------
//          }
//          if(_GDS_.TYPE_O_00 == OBJ_LABEL || _GDS_.TYPE_O_00 == OBJ_BUTTON || _GDS_.TYPE_O_00 == OBJ_EDIT || _GDS_.TYPE_O_00 == OBJ_RECTANGLE_LABEL )
//          {
//                    {         //any type
//                              go.GAC.X_Distance(XDISTANCE);  //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XDISTANCE, XDISTANCE);
//                              go.GAC.Y_Distance(YDISTANCE);  //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YDISTANCE, YDISTANCE);//
//                              go.GAC.Corner(CORNER);         //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_CORNER, CORNER); //
//                    }
//                    if(_GDS_.TYPE_O_00 != OBJ_RECTANGLE_LABEL)          //any type
//                    {         go.GAC.Description(TEXT);       //ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TEXT, TEXT);
//                              go.GAC.Font(FONT);              //ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONT, FONT);
//                              go.GAC.FontSize(FONTSIZE);      //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_FONTSIZE, FONTSIZE);//
//                    }
//                    if(_GDS_.TYPE_O_00 == OBJ_LABEL)
//                    {         go.GAC.Angle(ANGLE);            //ObjectSetDouble( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANGLE, ANGLE);
//                              go.GAC.Anchor(ANCHOR_POINT);    //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANCHOR, ANCHOR_POINT); //
//                    }
//                    if(_GDS_.TYPE_O_00 == OBJ_BUTTON || _GDS_.NAME_A_01 == OBJ_EDIT || _GDS_.NAME_A_01 == OBJ_RECTANGLE_LABEL)
//                    {
//                              {         //any type
//                                        //---go.GAC.X_Size(XSize);               //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XSIZE, XSIZE);
//                                        //---go.GAC.Y_Size(YSize);               //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YSIZE, YSIZE);
//                                        //---go.GAC.BackColor(BGCOLOR);          //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BGCOLOR, BGCOLOR);
//                                        //---go.GAC.BorderColor(BORDER_COLOR);   //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BORDER_COLOR, BORDER_COLOR);//
//                              }
//                              //---if(_GDS_.TYPE_O_00 == OBJ_BUTTON) {go.GAC.State(STATE);/*ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STATE, STATE);*/}
//                              if(_GDS_.TYPE_O_00 == OBJ_EDIT)
//                              {         go.GAC.TextAlign(ALIGN);            //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ALIGN, ALIGN);
//                                        go.GAC.ReadOnly(READONLY);          //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_READONLY, READONLY);//
//                              }//
//                              if(_GDS_.TYPE_O_00 == OBJ_RECTANGLE_LABEL)
//                              {         go.GAC.Style(STYLE);            //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE, STYLE);
//                                        go.GAC.Width(WIDTH);            //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH, WIDTH);//
//                              }//
//                    }//
//          } //
//}//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO>
void __COBFA__::Set_Attribe_Bitmap(GO &go, bool Is_Obj)
{         bool IsType = _GDS_.TYPE_O_00 == OBJ_BITMAP || _GDS_.TYPE_O_00 == OBJ_BITMAP_LABEL;
          if(!IsType)return;
          bool res = false;
          if(!Is_Obj)
          {         //--Alert("Set_Attribe_Bitmap is IsType ",IsType);
                    {         //any type
                              //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XOFFSET,         _GDS_.XOFFSET);
                              //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YOFFSET,         _GDS_.YOFFSET); //
                              //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,           _GDS_.COLOR);
                              //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE,           _GDS_.STYLE);
                              //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH,           _GDS_.WIDTH);
                              //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XSIZE,           _GDS_.XSIZE);
                              //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YSIZE,           _GDS_.YSIZE);//
                    }
                    //if(_GDS_.TYPE_O_00 == OBJ_BITMAP) {ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BMPFILE, _GDS_.BMPFILE);}
                    if(_GDS_.TYPE_O_00 == OBJ_BITMAP_LABEL)
                    {         //   ObjectSetString(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BMPFILE, 0,       BMPFILE_ON);
                              //   ObjectSetString(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BMPFILE, 1,       BMPFILE_OFF);
                              //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XDISTANCE,       _GDS_.XDISTANCE);
                              //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YDISTANCE,       _GDS_.YDISTANCE);
                              //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STATE,           _GDS_.STATE);
                              //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_CORNER,          _GDS_.CORNER);
                              //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANCHOR,          _GDS_.ANCHOR_POINT);//
                    }//
                    if(_GDS_.TYPE_O_00 == OBJ_BITMAP_LABEL)
                    {         res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_CORNER,            _GDS_.CORNER_L_06);    if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_CORNER ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XDISTANCE,         _GDS_.XDISTANCE_L_02); if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_XDISTANCE ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YDISTANCE,         _GDS_.YDISTANCE_L_03); if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_YDISTANCE ", res);
                              //
                              res = ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BMPFILE,  1,       _GDS_.File_ON_F_02);   if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_BMPFILE ", res);                    ////????? ned to adjust
                              res = ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BMPFILE,  0,       _GDS_.File_OFF_F_03);  if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_BMPFILE ", res);
                              //
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XSIZE,             _GDS_.WIDTH_10);       if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_XSIZE ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YSIZE,             _GDS_.HEIGHT_12);      if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_YSIZE ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XOFFSET,           _GDS_.XOFFSET_L_07);   if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_XOFFSET ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YOFFSET,           _GDS_.YOFFSET_L_08);   if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_YOFFSET ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STATE,             _GDS_.STATE_13);       if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_STATE ", res);
                              //
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ANCHOR,            _GDS_.ANCHOR_POINT_9); if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_ANCHOR ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,             _GDS_.COLOR_C_00);     if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_COLOR ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE,             _GDS_.STYLE_9);        if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_STYLE ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH,             _GDS_.POINT_WIDTH);    if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_WIDTH ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BACK,              _GDS_.BACK_G_00);      if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_BACK ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTABLE,        _GDS_.SELECTABLE_G_00); if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_SELECTABLE ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTED,          _GDS_.SELECTED_G_00);  if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_SELECTED ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_HIDDEN,            _GDS_.HIDDEN_G_00);    if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_HIDDEN", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ZORDER,            _GDS_.ZORDER_G_00);    if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_ZORDER ", res);
                              res = ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TOOLTIP,           _GDS_.TOOLTIP_G_00);   if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_TOOLTIP ", res);  //
                    }
                    //
                    if(_GDS_.TYPE_O_00 == OBJ_BITMAP)
                    {         //--- set the path to the image file
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TIME,                  _GDS_.TIME_6);             if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_TIME ", res);
                              res = ObjectSetDouble( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_PRICE,                 _GDS_.PRICE_7);            if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_PRICE ", res);
                              res = ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BMPFILE,               _GDS_.File_F_01);          if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_BMPFILE ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XSIZE,                 _GDS_.WIDTH_10);           if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_XSIZE ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YSIZE,                 _GDS_.HEIGHT_12);          if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_YSIZE ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_XOFFSET,               _GDS_.XOFFSET_L_07);       if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_XOFFSET", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_YOFFSET,               _GDS_.YOFFSET_L_08);       if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_YOFFSET ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,                 _GDS_.COLOR_C_00);         if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_COLOR ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_STYLE,                 _GDS_.STYLE_9);            if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_STYLE ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH,                 _GDS_.POINT_WIDTH);        if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_WIDTH ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_BACK,                  _GDS_.BACK_G_00);          if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_BACK ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTABLE,            _GDS_.SELECTABLE_G_00);    if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_SELECTABLE ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_SELECTED,              _GDS_.SELECTED_G_00);      if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_SELECTED ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_HIDDEN,                _GDS_.HIDDEN_G_00);        if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_HIDDEN ", res);
                              res = ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_ZORDER,                _GDS_.ZORDER_G_00);        if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_ZORDER ", res);
                              res = ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TOOLTIP,               _GDS_.TOOLTIP_G_00);       if(!res)Alert("Set_Attribe_Bitmap is OBJPROP_TOOLTIP ", res); //
                              //
                    }//
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename _IGO_>
template<typename GO>
void __COBFA__::Set_Attribe_Event(GO &go, bool Is_Obj)
{         bool IsType = _GDS_.TYPE_O_00 == OBJ_EVENT;
          if(!IsType)return;
          if(!Is_Obj)
          {         ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TEXT,      TEXT);
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR,     COLOR);
                    ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH,     WIDTH);//
          }
//else
//{         go.GAC.Description(TEXT);  // ObjectSetString( ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_TEXT, TEXT);
//          go.GAC.Color(COLOR);       //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_COLOR, COLOR);
//          go.GAC.Width(Width);       //ObjectSetInteger(ChartData_ChartInfo.ID, _GDS_.NAME_A_01, OBJPROP_WIDTH, WIDTH);//
//}
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//---bool __COBFA__::Action(GO &go)
//---END
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
///--- we need members of object pass... memberName must be globalGeneric Name.. as _GDS_ in all class to act.
///--- template<typename ChartObjX,typename GraphicalDataStruct, typename GraphicalActionClass>
///--- ? not good ---/// bool Action(GraphicalDataStruct &_GDS_, GraphicalActionClass &_GDS_, bool Is_Obj = true, int WhichMode = MODE_CREATE, bool IsKey = false, bool Seted = false) //--Proxy--//
///--- What is this? >>. "===C_ObjectFrame"  but without keyword this caller refrence is child... child member not define in parent class
///---  if(_GDS_.MODE_I_00 == MODE_CREATE) if(Mode(MODE_CREATE, _GDS_.IsKey_I_00, 0, 0, 0, 0)) {return Set_ToAttribe();}
///--- '_GDS_' - undeclared identifier          ObjectFrame.mqh     161       24 >>>. parent cant access childs member not defined must be generic member to do that..
///--- cant specify by type of any childs have member... to do that  need to build them generic to generic member access..
///--- virtual not help undefined member to access...
///--- or get childs as generic type param of action function... frist method..
///--- Generic not help if  base class 'C_ObjectFrame' not defined that generic member.. must pass by param
///--- as solution for it need generic function action or generic base class... or pass obj sel in there to access obj member,
//===========================================================================================================================================================
//*        LBL_CycleBotton.Action(LBL_CycleBotton);
//*        template < typename ChartObjX>
//*        bool Action(ChartObjX &chartObj, bool Is_Obj = true, int WhichMode = MODE_CREATE, bool IsKey = false, bool Seted = false) //--Proxy--//
//*        {///---///       chartObj.sLabel;    chartObj.oLabel;     chartObj._GDS_;    chartObj.GAC;    ///---///}
//===========================================================================================================================================================
//+------------------------------------------------------------------+
