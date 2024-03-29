//+------------------------------------------------------------------+
//|                                               ProjectManager.mqh |
//|                                                    A pourya 2021 |
//|                                               @prymhdv@gmail.com |
//+------------------------------------------------------------------+

//========================================================================================================================Index
//|    Project QUARTS:  (16_line)       inform-KeyWords                                                         BEGIN-END|
//|    Project QUARTS:  (51_line)       inform-Interfaces                                                       BEGIN-END|
//|    Project QUARTS:  (72_line)       inform-Interfaces-Component                                             BEGIN-END|
//|    Project QUARTS:  (112_line)      inform-Interfaces-Component-Algo                                        BEGIN-END|
//|    Project QUARTS:  (132_line)      inform-SOLID Concepts Standart                                          BEGIN-END|
//|    Project QUARTS:  (295_line)      inform-SOLID Architecture                                               BEGIN-END|
//|    Project QUARTS:  (736_line)      inform-SOLID Architecture Layers                                        BEGIN-END|
//|    Project QUARTS:  (736_line)      inform-SOLID Architecture Generic-Faild (not support inner attribe)     BEGIN-END|
//|    Project QUARTS:  (800_line)      inform-Issues                                                           BEGIN-END|
//|    Project QUARTS:  (800_line)      inform-Issues Architecture (Monolic(solidRock))                         BEGIN-END|
//|    Project QUARTS:  (800_line)      inform-Issues Architecture (MCVII(ModelViewControl))                    BEGIN-END|
//|    Project QUARTS:  (800_line)      inform-Issues Architecture (MCVII(DataBase,Methods,Runtime,Extention))  BEGIN-END|
//|    Project QUARTS:  (800_line)      inform-Issues Architecture (HibrideI(Monolic+MCV))                      BEGIN-END|
//|    Project QUARTS:  (800_line)      inform-Issues Architecture (HibrideII(Monolic+MCV+Extention))           BEGIN-END|
//|    Project QUARTS:  (836_line)      Capitan(moniliced)-Issues                                               BEGIN-END|
//========================================================================================================================
//+------------------------------------------------------------------+
//|                                                                  |
//|    Project QUARTS:  (16_line)inform-KeyWords            BEGIN-END|
//|                                                                  |
//+------------------------------------------------------------------+
//>>52 KeyWords reserved by MQL
/*Reserved Words        The following identifiers are recorded as reserved words,
each of them corresponds to a certain action, and cannot be used in another meaning:
Data Types>>====================================================================================
                        bool            enum            struct          char            float           uchar
                        class           int             uint            color           long            ulong
                        datetime        short           ushort          double          string
Access Specificators>>==========================================================================
                        const           private         protected       public          virtual
Memory Classes>>================================================================================
                        extern          input           static
Operators>>=====================================================================================
                        break           dynamic_cast    return          case            else
                        sizeof          continue        for             switch          default
                        if              while           delete          new             do              operator
Other>>=========================================================================================
                        false           #define         #property       this            #import
                        template        true            #include        typename        strict
Abstract>>======================================================================================
                        abstract        interface       final
                        #pragma pack(1)
>>==============================================================================================*/
//+------------------------------------------------------------------+
//|                                                                  |
//|    Project QUARTS:  (16_line)inform-KeyWords            BEGIN-END|
//|                                                                  |
//+------------------------------------------------------------------+
//
//
//
//+------------------------------------------------------------------+
//|                                                                  |
//|    Project QUARTS:  (51_line)inform-Interfaces          BEGIN-END|
//|                                                                  |
//+------------------------------------------------------------------+
//Interfaces
//An interface allows determining specific functionality, which a class can then implement. In fact,
//an interface is a class that cannot contain any members, and may not have a constructor and/or a destructor.
//All methods declared in an interface are purely virtual, even without an explicit definition.
//An interface is defined using the "interface" keyword. Example:
//============================================================
/*/// Header The TradeExpert Describe /// The Algoritm of SOLID Job
//============================================================
//+------------------------------------------------------------------+
//|                                                                  |
//|    Project QUARTS:(51_line)inform-Interfaces            BEGIN-END|
//|                                                                  |
//+------------------------------------------------------------------+
//
//
//
//+------------------------------------------------------------------+
//|                                                                  |
//| Project QUARTS: (72_line)inform-Interfaces-Component    BEGIN-END|
//|                                                                  |
//+------------------------------------------------------------------+
//============================================================
// Component Roll(Game) Interface(sth body Win) Abstract(logicWin) Implanation(OnNeed)
//============================================================
Acts I   {Component } [One Year]
Start Desgin                            Time 2021-01-10 12: 00: 00
#1 OnPlaying Field                      >>>//GetMoney
#2 OnPlaying Method                     >>>//Trading
#3 Where Play Enviroment                >>>//1D__2DChart__3D_
#4 The Gola                             >>>//Money Is +50% of LastDay
#5 Trade Conditions                     >>>//After There Round Trade
#6 Who wining                           >>>//#5 isDone
End One Hour                            Time 2021-01-10 12:00: 00 <Runing>
//============================================================
Acts II  {InterFace } [One Hour]
Start Desgin                                      Time 2022 01 01 14: 00: 00


End One Hour                                      Time 2022 01 01 15: 00: 00
//============================================================
Acts III {Abstract } [One Hour]
Start Desgin                                      Time 2022 01 01 16: 00: 00
End One Hour                                      Time 2022 01 01 17: 00: 00
//============================================================
Acts IV  {Implanation } [One Hour + One Month]
Start Desgin                                      Time 2022 01 01 18: 00: 00
End One Hour                                      Time 2022 02 01 17: 00: 00
//============================================================*/
//+------------------------------------------------------------------+
//|                                                                  |
//| Project QUARTS: (72_line)inform-Interfaces-Component    BEGIN-END|
//|                                                                  |
//+------------------------------------------------------------------+
//
//
//
//+----------------------------------------------------------------------+
//|                                                                      |
//| Project QUARTS: (112_line)inform-Interfaces-Component-Algo  BEGIN-END|
//|                 (132_line)inform-SOLID Concepts Standart    Next     |
//+----------------------------------------------------------------------+
//===========================================================================Programs Steps//
/*A Start>>> Panels ^ cheackUps ^ Account Information ^ State Checking,                   //StartPoints Init of Classes objects and                       int     OnInit()//
 *B "Control" Candels series ^ Indicators series ^ Bank Profits,App Status                //StartPoints by Classes Self updater//                                 Update()
 *C "Start" Ordering Positions by future movements, puting positions,                     //StartPoints of Puting Cuting TradeManager                     void    OnTimer()Timer.Run())
 *D Cals Positions Profity ^ modify Orders by StopLosses ^ Take Profits ^ Pendig Orders   //StartPoints of Modyfiyer and conductors and Bank classes//            Update()
 *E save program statics for next runs..export..                                          //StartPoints Classes deinit and Update or exiting command//            Update()
=============================================================================
//+----------------------------------------------------------------------+
//|                                                                      |
//| Project QUARTS: (112_line)inform-Interfaces-Component-Algo  BEGIN-END|
//|                                                                      |
//+----------------------------------------------------------------------+
//
//
//
//+----------------------------------------------------------------------+Methodoly
//|                                                                      |
//| Project QUARTS: (132_line)inform-SOLID Concepts Standart    BEGIN-END|
//|                 (295_line)inform-SOLID Architecture         Next     |
//+----------------------------------------------------------------------+WrongWare
// formal parameter instead of some definite data type
// There is a convenient solution. If similar operations should be executed for each data type,
// it is possible to use function templates. In this case, a programmer needs to write only one function template description.
// When describing the template in such a way, we should specify only some formal parameter instead of some definite data type
// the function should work with. The compiler will automatically generate various functions
// for the appropriate handling of each type based on the types of the arguments used when calling the function.
//
// Function template definition starts with the template keyword followed by the list of formal parameters
// in angle brackets. Each formal parameter is preceded by the typename keyword.
// Formal parameter types are built-in or user-defined types. They are used:
//
//•to specify the types of function arguments, 'typename(param)'
//•to specify the types of function's return value,
//•to declare the variables inside the function definition
//
// 'Number of template parameters cannot exceed eight'.
//  Each formal parameter in the template definition should appear in the list of function parameters at least once.
//  Each name of the formal parameter should be unique.

// Use the typename keyword to get the argument type as a string in order to
// create general purpose methods of working with various data types.
// Let's consider a specific example of the function that returns data type as a string:
////+------------------------------------------------------------------+
////| Type is returned as a line                                       |
////+------------------------------------------------------------------+
 */
template<typename T> string GetTypeName(const T &t)
{         //--- return the type as a line
          return(typename(T));
          //---
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
//---------------------------------------------------------------------
// {SDK}Language(Concepts)
// {}Concepts(Language,Enviroment)        //{Cake}Concepts(int,double)
// Every Language Every Enviroment(WebSDK-WinSDK-AndroidSDK)
// Strategy Patern act by How What >> every thing have Mechanical Algo
// OOP >> BluePrint(Class)    Instance(Object)           //--UpToDown--
// Abstract >> Modeling
// Emploeyee<::Person>                                  Manager<::Emploeyee>                    Staff<::Emploeyee>
// Emploeyee::Person::Name; (ByUpcast)                  Emploeyee:Name  (BySelfCast)           (Person)Emploeyee:Name<< Existed
// Emploeyee::Person::Eat();(ByUpcast)                  Emploeyee:Eat() (BySelfCast)           (Person)Emploeyee:Eat()<< Existed
// Manager::Emploeyee::Person::Eat();(BySelfCast)       Manager::Emploeyee:Eat()(BySelfCast)   (Emploeyee)Manager<::Emploeyee:Eat()>  << Existed
// Manager<::Emploeyee<::Person<::Eat()>>>;(BySelfCast) Manager<::Emploeyee:Eat()>(BySelfCast) (Emploeyee)Manager<::Emploeyee:Eat()>  << Existed
//===================================================================
// Rulla >> BluePrint(Class)    Instance(Object)        //--DownToUp--
// Manager<Emploeyee<Person>> ManagerPerson = new Manager<Emploeyee<Person>>(--Some Param--)
// Manager<Emploeyee<Item>>   ManagerItem   = new Manager<Emploeyee<Item>>(--Some Param--)
// Person<Body<Brain<Item>>>  PersonItem    = new Person<Body<Brain<Item>>>(--Some Param--)
// Body<Brain<Item>>          BodyItem      = new Body<Brain<Item>>(--Some Param--)
//-------------------------------------------------------------------
// GenericObj<GenericObjParam1<GenericObjParam1Param1>,GenericObjParam2>  GenericObj_1_Param1_Param1Param1_Param2;
// GenericObj_1 = new GenericObj<GenericObjParam1<GenericObjParam1Param1>,GenericObjParam2>(--Some Param--)
//-------------------------------------------------------------------
// HostObj<HostObjGuest1<HostObjGuest1Guest1>,HostObjGuest2>              HostObj_1_Guest1_Guest1Guest1_Guest2;
// HostObj_1    = new HostObj<HostObjGuest1<HostObjGuest1Guest1>,HostObjGuest2>(--Some Param--)
//-------------------------------------------------------------------
//
// G_ShelterAnimals<Animals,Dog>                        { Animals ComAnimals; Dog ComDog; }
// G_ShelterAnimals<Cat,Dog>                            { Cat ComCat; Dog ComDog; }      .
// G_ShelterAnimals<Cat,Dog>                            ShelterAnimals_Cat_Dog                  = new G_ShelterAnimals<Cat,Dog>();
// G_ShelterAnimals<int,bool>                           ShelterAnimals_Int_Bool                 = new G_ShelterAnimals<int,bool>();
//
// G_ActionerGraphicObject<C_Lines,C_LinesVertical>     { C_Lines ComLines; C_LinesVertical ComLinesVertical; }.
// G_ActionerGraphicObject<C_Lines,C_Shapes>            { C_Lines ComLines; C_Shapes ComShapes; }
// G_ActionerGraphicObject<C_Lines,C_Shapes>            ActionerGraphicObject_C_Lines_C_Shapes  = new G_ActionerGraphicObject<C_Lines,C_Shapes>();
// G_ActionerGraphicObject<int,bool>                    ActionerGraphicObject_int_bool          = new G_ActionerGraphicObject<int,bool>();
//------------------------------------------------------------------- Polymorth up caster
// G_ActionerGraphicObject<T>                           { T ComT; G_ActionerGraphicObject(T GetT){ComT=GetT} }
// G_ActionerGraphicObject<T>                           ActionerGraphicObject_T                 = new G_ActionerGraphicObject<T>(new T());
// ActionerGraphicObject_T::ComT::
// ActionerGraphicObject_T::ComT::Action(x &sOBJ);
//-------------------------------------------------------------------
// G_ActionerGraphicObject<T>                           { T ComT; G_ActionerGraphicObject(){ ComT = new T();} }
// G_ActionerGraphicObject<T>                           ActionerGraphicObject_T                 = new G_ActionerGraphicObject<T>();
// ActionerGraphicObject_T::ComT::
// ActionerGraphicObject_T::ComT::Action(x &sOBJ);
////-------------------------------
// G_ActionerGraphicObject<C_Lines>                     { C_Lines ComLines;  G_ActionerGraphicObject(){ ComLines = new C_Lines();} }
// G_ActionerGraphicObject<C_Lines>                     ActionerGraphicObject_C_Lines           = new G_ActionerGraphicObject<C_Lines>();
// ActionerGraphicObject_C_Lines::ComLines::
// ActionerGraphicObject_C_Lines::ComLines::Action(x &sOBJ);
////-------------------------------
// G_ActionerGraphicObject<C_Shapes>                    { C_Shapes ComShapes; G_ActionerGraphicObject(){ ComShapes = new C_Shapes();} }
// G_ActionerGraphicObject<C_Shapes>                    ActionerGraphicObject_C_Shapes          = new G_ActionerGraphicObject<C_Shapes>();
// ActionerGraphicObject_C_Shapes::ComShapes::
// ActionerGraphicObject_C_Shapes::ComShapes::Action(x &sOBJ);
//-------------------------------
// G_ActionerGraphicObject<Cg_Texts>                     { Cg_Texts ComTexts; G_ActionerGraphicObject(){ ComTexts = new Cg_Texts();} }
// G_ActionerGraphicObject<Cg_Texts>                     ActionerGraphicObject_Cg_Texts           = new G_ActionerGraphicObject<Cg_Texts>();
// ActionerGraphicObject_Cg_Texts::ComTexts::
// ActionerGraphicObject_Cg_Texts::ComTexts::Action(x &sOBJ);
//-------------------------------
// G_ActionerGraphicObject<int>                         { int Comint; G_ActionerGraphicObject(){ Comint = new int();} }
// G_ActionerGraphicObject<int>                         ActionerGraphicObject_int               = new G_ActionerGraphicObject<int>();
// ActionerGraphicObject_int::Comint::
// ActionerGraphicObject_int::Comint::Action(x &sOBJ);
//------------------------------------------------------------------- Polymorth in caster
// T<t> TtGuest = new  T<t>();
// G_ActionerGraphicObject<T<t>>                        { T<t> ComTt; /--HasMemberGeneric --/  G_ActionerGraphicObject(T<t> GetTt){ComTt=GetTt;}}
// G_ActionerGraphicObject<T<t>>                        ActionerGraphicObject_Tt                = new G_ActionerGraphicObject<T<t>>(TtGuest);
// ActionerGraphicObject_Tt::ComTt::
// ActionerGraphicObject_Tt::ComTt::Action(x &sOBJ);
//-------------------------------
// C_Lines<C_LinesVertical> LinesVerticalGuest = new  C_Lines<C_LinesVertical>();
// G_ActionerGraphicObject<C_Lines<C_LinesVertical>>    { C_Lines<C_LinesVertical> ComLinesVertical; G_ActionerGraphicObject(C_Lines<C_LinesVertical> GetLinesVertical){ComLinesVertical=GetLinesVertical;}} }
// G_ActionerGraphicObject<C_Lines<C_LinesVertical>>    ActionerGraphicObject_C_LinesVertical   = new G_ActionerGraphicObject<C_Lines<C_LinesVertical>>(LinesVerticalGuest);
// ActionerGraphicObject_C_LinesVertical::ComLinesVertical::--Drived(sLineV_C_ObjectFrame)--::Action(T &sOBJ)
// ActionerGraphicObject_C_LinesVertical::ComLinesVertical::Action(x &sOBJ); //make securite of typing
// GAGO_C_LinesVertical == G_LV_X.Action(LabelX.sLabel)                         --derive from C_ObjectFrame--
// GAGO_C_LinesVertical == G_LV_X.Frame.Action(G_LV_X)                   --Contain ProxyMember from C_ObjectFrame in itself--
// GAGO_C_LinesVertical == G_LV_UpperPivot200.Frame.Action(G_LV_UpperPivot200)                   --Contain ProxyMember from C_ObjectFrame in itself--
// GAGO_C_LinesVertical == G_LV_UpperPivot200.Frame.Action(G_LV_UpperPivot200)                   --Handel by GenrrticProxyOBJ to Generator--
////LabelX.Action(LabelX.sLabel);// --bism allah alrahman alrahim--
//-------------------------------------------------------------------
//------------------------------------------------------------------- Polymorth in caster with two member guest
// T<t> TtGuest = new  T<t>();    P<p> PpGuest = new  P<p>();
// G_ActionerGraphicObject<T<t>,P<p>>                   { T<t> ComTt;  P<p> ComPp;
//                                                        void G_ActionerGraphicObject(T<t> GetTt,P<p> GetPp)  {ComTt=GetTt; ComPp=GetPp; }
//                                                        T<t> G_ActionerGraphicObject_ReleaseTt(string name)  {if(ComTt.Name==name) return ComTt ;}
//                                                        P<p> G_ActionerGraphicObject_ReleasePp(string name)  {if(ComPp.Name==name) return ComPp ;}
//                                                        bool G_ActionerGraphicObjectReleaseTt_Pp(T<t> &GetTt,P<p> &GetPp)
//                                                              { GetTt = G_ActionerGraphicObject_ReleaseTt(GetTt.name); GetPp=G_ActionerGraphicObject_ReleasePp(GetPp.name)
//                                                                return true;//
//                                                              }
//                                                      }
// G_ActionerGraphicObject<T<t>,P<p>>                   ActionerGraphicObject_Tt_Pp             = new G_ActionerGraphicObject<T<t>,P<p>>(TtGuest,PpGuest);
// G_ActionerGraphicObject<T<t>,P<p>>                   ActionerGraphicObject_Tt_Pp             = new G_ActionerGraphicObject<T<t>,P<p>>( new T<t>(),new P<p>());
// ActionerGraphicObject_Tt_Pp::ComTt::
// ActionerGraphicObject_Tt_Pp::ComPp::
//
//--compiler error --------------------------------- Programming by Capacity of host guest / ClassGeneric / HasMemberGeneric
// G_ActionerGraphicObject<T>                           { T ComT; G_ActionerGraphicObject(){ ComT = new T();} }
// G_ActionerGraphicObject<T>                           ActionerGraphicObject_T                 = new G_ActionerGraphicObject<T>();
//
// G_ActionerGraphicObject<Cg_Texts>                     { Cg_Texts ComTexts; G_ActionerGraphicObject(){ ComTexts = new Cg_Texts();} }
// G_ActionerGraphicObject<Cg_Texts>                     ActionerGraphicObject_Cg_Texts           = new G_ActionerGraphicObject<C_Lines>();
//C_Lines Not Support for ActionerGraphicObject_Cg_Texts
//--compiler error ---------------------------------
// calling method generic compiler do ad overrided methd detecting ad param to whitch block run..
// normal and Static metods and fields can be typified (generic) but but Constructor and Prpertise not can typified (generic)//
// in overlapping method generic with class generic error cs0693 that un defined//
// C# instade of null for refrencial obj nedd to use default(T) to handell error...
// Generic make Reusable - Performance - Security - unreadble by higher level abstract from others //
// Good to add T in begining of descripted name to recognise it is generic type  TCg_Texts  TAnimal Tcat Tint TSometype T:Template (parametrised / generic type)
// >>--parametrised Classes--<<
//-------------------------------------------------------------------
//+-----------------------------------------------------------------------------+
//|                                                                             |
//| Project QUARTS: (287_line)inform-SOLID Concepts Standart     BEGIN-END      |
//|                                                                             |
//+-----------------------------------------------------------------------------+
//
//
//
//+-----------------------------------------------------------------------------+
//|                                                                             |
//| Project QUARTS: (295_line)inform-SOLID Architecture          BEGIN-END      |
//|                 (734_line)      inform-Issues                Next           |
//+-----------------------------------------------------------------------------+
// {Resusable-Extesionable}Architecture(SOLID)     {RedVihecle}Car(Red)
// Loose coupling usually correlates with strong cohesion
//---Generic type models define by gFunction() , gObject,
//---error--CObject passer = (CObject)gLBL_ConnectionPing; //---cannot cast 'ChartObj<Sg_LABEL,CChartObjectLabel,Cg_TextsLabel>' to 'CObject'   pTradePanel.mqh
//---error--CObject *passer = dynamic_cast< ChartObj< Sg_LABEL,  CChartObjectLabel,  Cg_TextsLabel> *> (&gLBL_ConnectionPing);//-- '=' - type mismatch
//---error--CObject  passer = dynamic_cast< ChartObj< Sg_LABEL,  CChartObjectLabel, Cg_TextsLabel> *> (&gLBL_ConnectionPing); 'dynamic_cast' - parameter conversion not allowed
//---error--CObject *passer =  (CObject)gLBL_ConnectionPing ; ///---generic not alowed converting//'poly morphic oop'
//=============================================================================
//Best Practices with Cohesion
//Strong cohesion is quite logically the "good" way of writing code. The
//concept is associated with simpler and clearer source code – code that is
//easier to maintain and reuse (because of the fewer tasks it has to perform).
//Contrarily, with weak cohesion each change is a ticking time bomb, because
//it could affect other functionality. Sometimes a logical task is spread out to
//several different modules and thus changing it is more labor intensive. Code
//reuse is also difficult, because a component does several unrelated tasks and
//to reuse it the exact same conditions must be met which is hard to achieve.
//=============================================================================
// Contrarily, with weak cohesion each change is a ticking time bomb, because  it could affect other functionality.
// Sometimes a logical task is spread out to  several different modules and thus changing it is more labor intensive.
// Code  reuse is also difficult, because a component does several unrelated tasks and  to reuse it the exact same conditions must be met which is hard to achieve.
//============================================================================
// Code reuse is also difficult, because a component does several unrelated tasks and
// to reuse it the exact same conditions must be met which is hard to achieve.
///============================================================================
//Coupling mostly describes the extent to which components / classes depend
//on one another. It is broken down into loose coupling and tight coupling.
//Loose coupling usually correlates with strong cohesion and vice versa.
/============================================================================
*A'pends        int     OnInit()//
*B'orders       Update()>>>class needs sorces
*C'ontrols      OnTimer()Timer.Run())<<<========risked lot size ok. -- next step>>> define SL TP PP >>>-- Next OpenPossitions >>
*D'onate        Update()
*E'xite         Update()
//============================================================================
//              --Choosing Date filling mode--
*   Architecture SoloFunctional  MultiPrametric         OneLine    Column247
*   Architecture MultiFunctional Multi-SoloObjPrametric SevenLine  Column165
*   Architecture OOP MultiAssaining And Multi-SoloFunctional  MultiPrametric
*   Architecture OOP MultiAssaining And MultiFunctional Multi-SoloObjPrametric
/**===========================================================================
//                                                                            ||
//                                                                            ||
*   Architecture SoloFunctional  MultiPrametric         OneLine    Column247  ||
//                                                                            ||
//                                                                            ||
*----------------------------------------------------------------------------
*      Implanation:    PadFlowOBJ.LBL_PadFlowL2_R.Create(Is_Create,  Is_Move, "PadFlowOBJ.LBL_PadFlowL2_R", "n", (int)(408.2) +  independX + FixPadFlowX, (int)(200) + FixPadFlowY + independY, CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 10, "Webdings");
**===========================================================================
*   Architecture MultiFunctional Multi-SoloObjPrametric SevenLine  Column165
*----------------------------------------------------------------------------
*      Implanation:
*              Cg_TextsLabel
*              LBL_PadFlowDL
*              Cg_TextsLabel::sLabel
*              Cg_TextsLabel::sLabel::Set_Action_2
*              Cg_TextsLabel::sLabel::Set_Desc_4
*              Cg_TextsLabel::sLabel::Set_Color_1
*              Cg_TextsLabel::sLabel::Set_Location_5
*              Cg_TextsLabel::sLabel::Set_Common_6
*              Cg_TextsLabel::sLabel::Set_Chart_6
*
*              Cg_TextsLabel::Action
*                            {  LBL_PadFlowBase.sdata.Set_Action_2(WhichMode, IsKey);
*                               LBL_PadFlowBase.sdata.Set_Desc_4(LabelDEF_NAME, LabelDEF_TEXT, LabelDEF_FONT, LabelDEF_FONTSIZE);
*                               LBL_PadFlowBase.sdata.Set_Color_1(LabelDEF_COLOR);
*                               LBL_PadFlowBase.sdata.Set_Location_5(LabelDEF_XDISTANCE, LabelDEF_YDISTANCE, LabelDEF_ANGLE, LabelDEF_CORNER, LabelDEF_ANCHOR_POINT);
*                               LBL_PadFlowBase.sdata.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "");
*                               LBL_PadFlowBase.sdata.Set_Chart_6();
*                               LBL_PadFlowBase.Action(LBL_PadFlowBase.sLabel);
*                            }
*===========================================================================
//                                                                            ||
//                                                                            ||
*   Architecture OOP MultiAssaining And Multi-SoloFunctional  MultiPrametric  ||
//                                                                            ||
//                                                                            ||
*---------------------------------------------------------------------------
*      Implanation:    C#    .net
*                      #inclide <Controls\Button.mqh>;
*                      class m_CButton:CButton
*                      { "Some Thing Add to button"
*                             bool OnMover(int x, int y )
*                                                        {
*                                                        this.m_rect.left = x;   ///Its move CloseExpert; m_rect left
*                                                        this.m_rect.top  = y;
*                                                        this.OnMove();
*                                                        };
*                              template<typename SobjType>
*                             bool OnAction(int WhichMode, SobjType sobj)
*                                                        {
*                                                              if(Mode==Move)OnMover(sobj.x,sobj.y)
*                                                              if(Mode==Create)OnCreater(sobj.name,sobj.x,sobj.y)
*                                                              if(Mode==Delete)OnDeleter(sobj.name);
*                                                        };
*                      }
*                       m_CButton CloseExpert;
*                       CloseExpert.m_text             = "CloseExpert";
*                       CloseExpert.m_color            = clrRed;
*                       CloseExpert.m_color_background = clrWhite;
*                       CloseExpert.m_color_border     = clrNone;
*                       CloseExpert.m_font             = "Arial";
*                       CloseExpert.m_font_size        = 7;
*                       CloseExpert.Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2);
*                       CloseExpert.Pressed(false);
*                       -----------------------------------------------------
*                       m_CButton::CButton::CWndObj:CWnd:CObject|
*                       CWnd::CRect                    ///START TO SHARE
*                       CWndObj::CRect                 ///KEEP  TO SHARE
*                       CButton::m_rect;               ///KEEP  TO SHARE
*                       CloseExpert::m_rect;           ///END   TO SHARE
*                       CloseExpert.m_rect.left = 5;   ///Its move CloseExpert; m_rect left
*                       CloseExpert.m_rect.top  = 4;
*                       CloseExpert.OnMove();
*
*                       -----------------------------------------------------
*                       CloseExpert.m_button.m_name;
*                       -----------------------------------------------------
*                       CButton sobj;
*                            {sobj.sButton.Set_Desc_4(LabelDEF_NAME, LabelDEF_TEXT, LabelDEF_FONT, LabelDEF_FONTSIZE);
*                             sobj.sButton.Set_Color_1(LabelDEF_COLOR);
*                             sobj.sButton.Set_Location_5(LabelDEF_XDISTANCE, LabelDEF_YDISTANCE, LabelDEF_ANGLE, LabelDEF_CORNER, LabelDEF_ANCHOR_POINT);
*                             sobj.sButton.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "");
*                             sobj.sButton.Set_Chart_6();
*                             sobj.sButton.Set_Action_2(WhichMode, IsKey);
*                             sobj.Action(sobj.sButton);
*                            }
*                       CloseExpert.OnAction<CButton>(Move,sobj.sButton);
*                       ---------------------------
*                        CloseExpert.sobj.sButton.Set_Location_5(XCom,YCom);
*                        CloseExpert.sobj.sButton.Set_Action_2(Move,true);
*                        CloseExpert.OnAction<CButton>(Move,sobj.sButton);
*                       ---------------------------
*
*
*----------------------------------------------
*   Default generic member predefined..
*----------------------------------------------
*       ///---!!! Attention to define memberGeneric fields name same you can... its not show where happen yu must know self which are nor coorect... asss shape to compile pre start program..
*       ///--- we need members of object pass... memberName must be globalGeneric Name.. as GDS in all class to act.
*       ///--- template<typename ChartObjX,typename GraphicalDataStruct, typename GraphicalActionClass>
*       ///--- ? not good ---/// bool C_ObjectFrame::Action(GraphicalDataStruct &GDS, GraphicalActionClass &GDS, bool IsObj = true, int WhichMode = MODE_CREATE, bool IsKey = false, bool Seted = false) //--Proxy--//
*
*       ///--- What is this? >>. "this.===C_ObjectFrame"  but without keyword this caller refrence is child... child member not define in parent class
*       ///---  if(this.GDS.MODE_I_00 == MODE_CREATE) if(Mode(MODE_CREATE, GDS.IsKey_I_00, 0, 0, 0, 0)) {return this.Attribe();}
*       ///--- 'GDS' - undeclared identifier          ObjectFrame.mqh     161       24 >>>. parent cant access childs member not defined must be generic member to do that..
*       ///--- cant specify by type of any childs have member... to do that  need to build them generic to generic member access..
*       ///--- virtual not help undefined member to access...
*       ///--- or get childs as generic type param of action function... frist method..
*       ///--- Generic not help if  base class 'C_ObjectFrame' not defined that generic member.. must pass by param
*       ///--- as solution for it need generic function action or generic base class... or pass obj sel in there to access obj member,
*---------------------------------------------------------
*        LBL_CycleBotton.Action(LBL_CycleBotton);         /// LBL_CycleBotton.sLabel, LBL_CycleBotton.oLabel
*        LBL_CycleBotton.sLabel, LBL_CycleBotton.oLabel
*---------------------------------------------------------
*        template < typename ChartObjX>
*        bool C_ObjectFrame::Action(ChartObjX &chartObj, bool IsObj = true, int WhichMode = MODE_CREATE, bool IsKey = false, bool Seted = false) //--Proxy--//
*        {///---///       chartObj.sLabel;    chartObj.oLabel;     chartObj.GDS;    chartObj.GAC;    ///---///}
*-------------------------------------------------------------------------------------------------------------------------------------
*
*
*
*
*    Must "T &objCom" Generic kind to know whats have... who has template members / generic member... pass throw member type param  type<param>;  "Functional Class" "ParametricClass"
*   LabelX.Action(LabelX.sLabel, LabelX.sLabel); //---
*   LabelX.Action(LabelX);
*  Action(T &objCom)                      //--- in Action function  can get by>>  string ParentTypename = typename(objCom.Parent)  Runtime programing...
*   {
*    string ParentTypename = typename(objCom.Parent)
*
*   ParentTypename ParentObj;
*   ParentTypename *pParentObj = new ParentTypename();
*   -----------
*   MemberLog(ParentObj);???????.... How do access Parent or Object Members? To Do some unProgramed Act?
*   }
*   //LabelX.Action(LabelX.sLabel, LabelX.sLabel); // #351Line ProjectManager_Architecture_Architecture OOP MultiAssaining And Multi-SoloFunctional  MultiPrametric
*
*
*
*===========================================================================
//                                                                             ||
//                                                                             ||
*   Architecture OOP MultiAssaining And MultiFunctional Multi-SoloObjPrametric ||
//                                                                             ||
//                                                                             ||
*---------------------------------------------------------------------------
*      Implanation:    Java# .AWT
*===========================================================================
*   Architecture Generic        //OnCreation So diffcult to know what member support Acts.
*                               //OnModify   So Easy to know what member support Acts(by GenericType).
*
*   Generic Members:            ChartObj<Sg_BUTTON, Cg_TextsButton>     gCS_FLOWPANEL::BTN_Crosshair;
*   non-Generic Members:        Cg_TextsButton                          CS_FLOWPANEL::BTN_Crosshair;
*
*   ///--- Helps
*   //               FlowPad.BTN_Mover.oButton.Color(DescColorPressIN = clrWhite);///Cant inject in self function//
*   //              gFlowPad.BTN_Mover.oAPI.Color(DescColorPressIN = clrWhite);///Can inject in self function//      //Cool
*
*---------------------------------------------------------------------- -
*
* template<typename sobj, typename oobj>
* class Factory : public C_ObjectFrame
     *           //----
{         *           //---- Factory::sobj::Set_Desc_4();)
     *           //---- Factory::sobj::Set_Color_1(clrDarkCyan);
     *           //---- Factory::sobj::Set_Location_5((int)(397.8) +  independX + FixPadFlowX, (int)(201.6) + FixPadFlowY + independY, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
     *           //---- Factory::sobj::Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "FlowPad.LBL_L");
     *           //---- Factory::sobj::Set_Chart_6();
     *           //---- Factory::sobj::Set_Action_2(WhichMode, IsKey);
    *           //---- Factory::Action(Factory.sobj);
    *           //----
    *           static uint           Factory::Total;
    *           string                Factory::m_name;
    *           //----
* public:
    *           void                  Factory::Factory()  {};
    *           void                  Factory::~Factory() {};
    *           //----
    *           sobj                  Factory::sIAPI;         //--- mine build structure of obj API
    *           oobj                  Factory::oAPI;          //--- API
    *           C_ObjectFrame         Factory::Frame;         //--- Parent //---Maynot Drived it can used as Proxy Parted //when Drived then no need to be member
    *           //----
    *
    *
    * };
* template<typename sobj, typename oobj>  //---Error 'Total' - template mismatch
* uint Factory::Total = 0;
*
*                   //---
*                   //---
*                   //---
*                   //Magic// FlowPad<LBL_Base_lable> *LBL_Base = new FlowPad<LBL_Base_lable>(Sobj);
*                   //template<typename sobj, typename oobj>
*                   //class Factory : public C_ObjectFrame
*                   //{         //----
*                   //---- Factory::sobj::Set_Desc_4();)
*                   //---- Factory::sobj::Set_Color_1(clrDarkCyan);
*                   //---- Factory::sobj::Set_Location_5((int)(397.8) +  independX + FixPadFlowX, (int)(201.6) + FixPadFlowY + independY, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
*                   //---- Factory::sobj::Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "FlowPad.LBL_L");
*                   //---- Factory::sobj::Set_Chart_6();
*                   //---- Factory::sobj::Set_Action_2(WhichMode, IsKey);
*                   //---- Factory::Action(Factory.sobj);
*                   //---
*                   //---
*                   //---
*                   //--- LBL_Base Generic ---// ---ChartObj===Factory---
*                   {         Factory<Sg_LABEL, CChartObjectLabel>  *GLBL_Base = new Factory<Sg_LABEL, CChartObjectLabel>();   ///--- Pointer
    *                             Factory<Sg_LABEL, CChartObjectLabel>  GLBL_Base2;                                               ///--- Real
    *                             //---Error 'Factory<Sg_LABEL,CChartObjectLab…' - parameter passed as reference, variable expected   //--- Need Class type of Sg_LABEL for Refcency heap
    *                             //---
    *                             GLBL_Base.sAPI.Set_Action_2(WhichMode, IsKey);
    *                             GLBL_Base.sAPI.Set_Desc_4("FlowPad.LBL_Base", "n", "Webdings",  55); ///Segoe MDL2 Assets
    *                             GLBL_Base.sAPI.Set_Color_1(clrDarkCyan);
    *                             GLBL_Base.sAPI.Set_Location_5((int)(429) +  independX + FixPadFlowX, (int)(201.6) - 1 + FixPadFlowY + independY, 0, CORNER_LEFT_UPPER, ANCHOR_CENTER);
    *                             GLBL_Base.sAPI.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "FlowPad.LBL_Base");
    *                             GLBL_Base.sAPI.Set_Chart_6();
    *                             GLBL_Base.Action(GLBL_Base.sAPI); //
    *                             //0// FlowPad.LBL_Base.Create(Is_Create,  Is_Move, "FlowPad.LBL_Base", "n",
    *                             //0// (int)(429) +  independX + FixPadFlowX,      (int)(201.6) - 1 + FixPadFlowY + independY,
    *                             //0// CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 55, "Webdings");   ///Segoe MDL2 Assets
    *                  }
*                   //---
*                   //---
*                   //---
*---------------------------------------------------------------------- -
*      Implanation:
*                             List<Medya<Image<jpg, jpg>, Picture<jpg> > >  *List_Image_jpg;
*                             List_Image_jpg = new List<Medya<Image<jpg, jpg >, Picture<jpg> > >();
*                             List::add() {Medya::Image::rect(5, 4); Medya::Image::jpg::Name("MyjpgPhoto");};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
*                             List::add(string name) {Medya::Image::rect(5, 4); Medya::Image::jpg::Name(name = "MyjpgPhoto");};
*                             List::remove();
*                             List::sort();
*                             List::search();
*                             List::Copy();
*                             List::Move();
*                             List::Action("sort" + "search");
*                             List::Action(List.sList);
*---------------------------------------------------------------------- -
*      Implanation:
*                              m_CButton::CButton::CWndObj: CWnd: CObject |
*                             ------------------------------------------------------------------------ -
*                             template<typename sthTypeReserveMember> class Object     {  sthTypeReserveMember sth; }
*                             template<typename sthTypeReserveMember> class Graphical  {  sthTypeReserveMember sth; }
*                             template<typename sthTypeReserveMember> class Text       {  sthTypeReserveMember sth; }
*                             template<typename sthTypeReserveMember> class Lable      {  sthTypeReserveMember sth; }
*                             ObjectGraphicalTextLable
*                             Object<Graphical<Text<Lable>>>   LableTextGraphicalObject_1;
*                             LableTextGraphicalObject_1       = new Object<Graphical<Text<Lable>>>();
*                             Object::CREATIONAL
*                             Object::Name(void);           //get
*                             Object::Name(string name);    //set
*                             Graphical::CREATIONAL
*                             Graphical::Name(void);           //get
*                             Graphical::Name(string name);    //set
*                             == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == Upcating
*                             Text::Lable                         Reservemember
*                             Graphical::Text::Lable              Reservemember
*                             Object::Graphical::Text::Lable      Reservemember
*                             Object::Graphical::Text             Reservemember
*                             Object::Graphical::Line             Reservemember
*                             Graphical::Line                     Reservemember
*                             Line::Vertical                      Reservemember
*                             == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
*                             == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
*                             #Actor Has Body
*                             #Actor Has Body Hand
*                             #Actor Has Body Hand Left
*                             #Actor Has Body Hand Right
*                             #Actor Has Body Foot
*                             #Actor Has Body Head
*                             #Actor Has Score
*                             #Actor Has Score Shoot
*                             #Actor Has Score Defence
*                             #Actor Has Score Speed
*                             #Actor Has Acts
*                             #Actor Has Acts Shoot
*                             #Actor Has Acts Defence
*                             #Actor Has Acts Runing
*                             #Actor Has Acts Runing Fast
*                             #Actor Has Acts Runing Slow
*                             #Actor Has Language
*                             #Actor Has Language Turkish
*                             #Actor Has Language English
*                             #Actor Has Wants Runing
*                             #Actor Has Sex
*                             #Actor Has Sex Mail
*                             #Actor Has Sex Femail
*                             #Actor Has Event
*                             #Actor Has Event Accident
*                             #Actor Has Event Goal
*                             #Actor Has Event Winning
*                             #Actor Has Cordinate
*                             #Actor Has Cordinate X
*                             #Actor Has Cordinate Y

*                             template<typename sthTypeReserveMember> class Actor
{         sthTypeReserveMember  sthGUESTReserveMember;
    *                                                                                        CSize                 Size;
    *                                                                                        CLocation             Location;
    *                                                                                        bool                  Action(sthTypeReserveMember sth);
    *                                                                                     }
*                             Actor<Button>  Actor_Button1 =  new Actor<Button>(m_CButton);
*                             Actor_FiboExpantios1::Actor(sthTypeReserveMember _sth) {  sthGUESTReserveMember = _sth; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
*                             Actor_Button1::sthGUESTReserveMember.Size.Set(Xsize, Ysize);
*                             Actor_Button1::sthGUESTReserveMember.Location.Set(X, Y );
*                             Actor_Button1::sthGUESTReserveMember.Color.Set(clrRed);
*                             Actor_Button1::Action(sthGUESTReserveMember); Action(this);
*                             Actor_Button1_PadFlowBase::Action(sthGUESTReserveMember); Action(this);
*                             Actor_Player1_Forward::Action(sthGUESTReserveMember); Action(this);
*                             == = ----------------------------------------------------------------------
                             *                             Actor<FiboExpantios>  Actor_FiboExpantios1 =  new Actor<FiboExpantios>(m_FiboExpantios);
*                             Actor_FiboExpantios1::Actor(sthTypeReserveMember _sth) {  sthGUESTReserveMember = _sth; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
*                             Actor_FiboExpantios1::sthGUESTReserveMember.Size.Set(Xsize, Ysize);
*                             Actor_FiboExpantios1::sthGUESTReserveMember.Location.Set(X, Y );
*                             Actor_FiboExpantios1::sthGUESTReserveMember.Color.Set(clrRed);
*                             Actor_FiboExpantios1::Action(sthGUESTReserveMember); Action(this);
*                             ------------------------------------------------------------------------ -
*                             GraphicalTextLableFont
*                             Graphical<Text<Lable<Font>>>     *FontLableTextGraphical_1;
*                             FontLableTextGraphical_1         = new Graphical<Text<Lable<Font>>>();
*                             Graphical::CREATIONAL
*                             Graphical::Name(void);           //get
*                             Graphical::Name(string name);    //set
*                             Graphical::Color(string color);  //set
*                             Graphical::Xcordinate(int x);    //set
*                             Graphical::Ycordinate(int y);    //set
*                             Graphical::Zcordinate(int z);    //set
*                             Graphical::EVENTS Mouse
*                             Graphical::IsClick(bool isclick);//set
*                             Graphical::IsClick(void);        //get
*                             Graphical::IsDobleClick(void);   //get
*                             Graphical::IsRightClick(void);         //get
*                             Graphical::EVENTS ExpressingOnScreen
*                             Graphical::IsShow(void);         //get
*                             Graphical::IsDrag(void);         //get
*= == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
*---------------------------------------------------------------------- -
*   Architecture Generic Type [        {News } SuperSystem(Data, Info, InfoVision)         [Exsist][Kill][Modify]]
*---------------------------------------------------------------------- -
*   Architecture Generic Type [#4#6    {Alert } Enviroment(System, Data)                  [Exsist][Kill][Modify]]
*---------------------------------------------------------------------- -
*   Architecture Generic Type [#1#6    {Event } Character(Data)                          [Exsist][Kill][Modify]]
*---------------------------------------------------------------------- -
*   Architecture Generic Type [#3#7    {Task } System(Act)                               [Exsist][Kill][Modify]]
*---------------------------------------------------------------------- -
*   Architecture Generic Type [#5      {Data } DataBase(Comput)                          [Exsist][Kill][Modify]]
*---------------------------------------------------------------------- -
*   Architecture Generic Type [#6      {Vision } Graphics(Data)                          [Create][Delete][Modify]]
*---------------------------------------------------------------------- -
*   Architecture Generic Type [        Traders(Data, Events, ChartAnalise)               [Open][Close][Modify]]
*---------------------------------------------------------------------- -
*   Architecture Generic Type [#2      {Act } Events(Character)                          [Register][UnRegister][Modify]]
*---------------------------------------------------------------------- -
*   Architecture Generic Type [#7      {InfoVision } ChartAnalise(Vision)                [Start][End][Modify]] //GraphicsAnalise
*---------------------------------------------------------------------- -
*   Architecture Generic Type [#4#8    {Comput } Programe(Task)                          [Start][End][Modify]]
*---------------------------------------------------------------------- -
*   Architecture Generic Type [#6      {Info } Chef(Programe, Data, Events)                [Start][End][Modify]] //infoHandler
*---------------------------------------------------------------------- -
*   Architecture Generic Type [#2#6    {Actp } Police((*Info, InfoVision)Character, EnviromentAlert)  [Start][End][Modify]]
*---------------------------------------------------------------------- -
*   Architecture Generic Type [#4#7#8  {Data } Computer(EnviromentAlert, SystemTask)      [Start][End][Modify]] //DataHandler
*= == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
*= == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == == ==
   *   Architecture NestedGeneric Not coupling
   * --------------------------------------------------------------------------- Polymorth in caster with two member guest
   * T<t> TtGuest = new  T<t>();    P<p> PpGuest = new  P<p>();
* G_ActionerGraphicObject<T<t>, P<p>>                   { T<t> ComTt;  P<p> ComPp; G_ActionerGraphicObject(T<t> GetTt, P<p> GetPp) {ComTt = GetTt; ComPp = GetPp; } }
* G_ActionerGraphicObject<T<t>, P<p>>                   ActionerGraphicObject_Tt_Pp             = new G_ActionerGraphicObject<T<t>, P<p>>(TtGuest, PpGuest);
* ActionerGraphicObject_Tt_Pp::ComTt::
* ActionerGraphicObject_Tt_Pp::ComPp::
*-------------------------------------------------------------------------------
*
*-------------------------------------------------------------------------------
//                                                                            ||
//                                                                            ||
*   Architecture NestedClass   very coupling                                  ||
//                                                                            ||
//                                                                            ||
*-------------------------------------------------------------------------------
*
*
*
*
*
*
* /
//+-----------------------------------------------------------------------------+
//|                                                                             |
//| Project QUARTS: (295_line)inform-SOLID Architecture          BEGIN-END      |///Some bad issuu is    in template 'bool __COBFA__::Action(GraphicalObject&)' specified with [GraphicalObject=Sg_BUTTON]        __COBFA__.mqh       101       17
//|                                                                             |///cant know where is used to refrence its location in IDE
//+-----------------------------------------------------------------------------+
//
//
//
//+-----------------------------------------------------------------------------+
//|                                                                             |User Interface, Data, and Business Logic.
//| Project QUARTS:  (734_line)  inform-SOLID Architecture Layers    BEGIN-END  |Model–view–controller is a software design pattern
//|                                                                             |
//+-----------------------------------------------------------------------------+
#1 mobility vs immobility
#2 City ReSources vs Hood Resourse (UI seprate Logic)  (iş mantığı GUI'ye bağlı değildir)
#3 Shell(gui) vs Kernel(bussinessLogic)         //--all business logic classes assembly.     //-- the business logic is not tied to the GUI.
//-------------------------------------------------------------------------------how to connect gui to logic? Gui (the form)
//====================================================================================================================================================
Use in web applications   (Server-Client)
Although originally developed for desktop computing,
MVC has been widely adopted as a design for World Wide Web applications in major programming languages.
Several web frameworks have been created that enforce the pattern.
These software frameworks vary in their interpretations,
 mainly in the way that the MVC responsibilities are divided between the client and server.[16]

Some web MVC frameworks take a thin client approach that places almost the entire model,
view and controller logic on the server. In this approach,
the client sends either hyperlink requests or form submissions to the controller and
then receives a complete and updated web page (or other document) from the view;
the model exists entirely on the server.
//====================================================================================================================================================
A three-tier architecture is typically composed of a presentation tier, a logic tier, and a data tier.
*--------------------------------------------------------------------------------
*       What is the best method (pattern) for separating Logic from GUI?
*       I have main form of the application that works with various objects (logic classes),
*       I want to have the minimum data connection between them.
//-------------------------------------------------------------------------------------------
                What OmegaMan is describing is layers or tiers.
                The generally accepted design is an application has at least three tiers: (User Interface, Data, and Business Logic.)
                ------------------------------------------------------------------------------------------------------------------------------
                The simplest method is to simply have these tiers in logical layers--where the source code is all within one project/assembly.
                The drawback of that is that it's easy to get at the internal details of each layer.
                This increases coupling and reduces cohesiveness.
                -------------------------------------------------
                The next level of abstraction is to make each layer physical, or in it's own project/assembly.
                This increases an layer's abilities to keep its internal information private and keep coupling to a minimum.
                This method still leaves the two layers coupled, i.e.
                the UI layer must know about the Business Logic Layer in order to instantiate it and interface with it.
                -------------------------------------------------------------------------------------------------------
                The next level of abstraction is what is called interface-oriented design.
                This means interaction between two classes is always done via an interface.
                 The UI layer would not be directly coupled to the Business Logic Layer,
                it would be directly coupled to one or more interfaces that the Business Logic layer implements.
                The benefits of decoupling the layers like this are many.
                One is that a layer can be swapped out for another layer (Mocking is a common use for this) and the other layer need no recompilation.
                Another other benefit is that more layers can be added without another layer really caring--just as long as something is implementing the interfaces it uses.
                E.g. the simplest case would be a layer would implement all interfaces the GUI layer uses.
                The most complex would be that each interface is implemented by a different sub-layer,
                each in their own assembly.  All these benefits stem from the lack of direct coupling.
                -------------------------------------------------------------------------------------------------------------------------------------------------------------
                Communication between the layers would always be done through method/property calls,
                if the layers are physically designed, the project that needs to use those layers will need to add a reference to that assembly/project.
                --------------------------------
                Wednesday, June 13, 2007 5:10 PM
//+-----------------------------------------------------------------------------+
//|                                                                             |
//| Project QUARTS:  (734_line)  inform-SOLID Architecture Layers    BEGIN-END  |
//|                                                                             |
//+-----------------------------------------------------------------------------+
//
//
//
//+-----------------------------------------------------------------------------+
//|                                                                             |
//| Project QUARTS: (800_line)inform-Issues                      BEGIN-END      |
//|                                                                             |
//+-----------------------------------------------------------------------------+
//=============================================================================
//namespace  ProjectManager{}  //namespaces is not supported yet      ProjectManager.mqh  6         3
//No Internet connection found! Please check your network connection and try again.
// in complex class constract calling un definde class function >>>FlowPanel.PadFlowCreate(true);
//////Solutin...if any object of UNdefined (declared) caling then the object created are loose there name....
/*
WRONG_VALUE     The constant can be implicitly cast to any enumeration type  -1
NULL            Zero for any types. Also indicates empty state of the string  0
*/
//ct_Series.IsRefreshRate  using is help to fasster not laghh. controled reflesh..
//=============================================================================
//+-----------------------------------------------------------------------------+
//|                                                                             |
//| Project QUARTS: (734_line)inform-Issues                      BEGIN-END      |
//|                                                                             |
//+-----------------------------------------------------------------------------+
//+-----------------------------------------------------------------------------+
//|                                                                             |
//| Project QUARTS: (836_line) Capitan(moniliced)-Issues         BEGIN-END      |
//|                                                                             |
//+-----------------------------------------------------------------------------+
//+------------------------------------------------------------------+ ProjectName - CompanyName - Copyright - WebSite
//||   ||||||||||                 Capitan.mqh                       || Hello world-cout.mq4
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| MyRoboTrader V00-build FC-2021-01-10
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| MyRoboTrader V06-build FC-2021-04-10
//||   ||||||||||             HTTPS: www.Oprymhdv.com               || MyRoboTrader V08-build FC-2022-01-13
//+------------------------------------------------------------------+
/*
A three-tier architecture is typically composed of a presentation tier, a logic tier, and a data tier.
While a monolithic application is a single unified unit,
a microservices architecture breaks it down into a collection of smaller independent units.
These units carry out every application process as a separate service.
So all the services have their own logic and the database as well as perform the specific functions.
Microservice Architecture – a variant of the Service-Oriented Architecture (SOA) structural style
*/
//===============================================//|
//Layer one   Global Varibles set Auto Ordered   //|
//Layer two   Global Class initing constract     //|
//Layer there Global Module runnung machine      //|
//===============================================//|
//collection of loosely-coupled services (بسیار دقیق fine-grained ) (services are fine-grained and the protocols are lightweight.)(nobug))
//The goal is that teams can bring their services to life independent of others.
//Loose coupling reduces all types of dependencies and the complexities around it,
//Service-Oriented Architecture (SOA) Interface-Oriented Design(IOD))
//Resource-Oriented Architecture(ROA) Web-Oriented Architecture (WOA)  //---Service Mesh (Errorr)(Utilities)
//*****************************************************************************************************************************************************************
// --SOA---(Service Orianted Architecture))///--OOA---(Object Orianted Architecture))///--Multics---(SolidRock)) ///---Microservices (module over app)            *
// --IOSOA---(Inpyt Output Service Orianted Architecture))  // --RWIOSOA---(REF(InputOutput) Service Orianted Architecture))                                      *
// --Service BUS Layer -DeviceOut  Graphics                                                                                                                       *
// --Service BUS Layer -DeviceIn   Graphics                                                                                                                       *
// --Service BUS Layer -DeviceRef  Graphics                                                                                                                       *
//                                                                                                                                                                *
// --Service BUS Layer -DeviceOut  Sounds                                                                                                                         *
// --Service BUS Layer -DeviceIn   Sounds                                                                                                                         *
// --Service BUS Layer -DeviceRef  Sounds                                                                                                                         *
//                                                                                                                                                                *
// --Service BUS Layer -DeviceOut  Networks                                                                                                                       *
// --Service BUS Layer -DeviceIn   Networks                                                                                                                       *
// --Service BUS Layer -DeviceRef  Networks                                                                                                                       *
//                                                                                                                                                                *
//Common layers - Presentation layer (a.k.a. UI layer, view layer, presentation tier in multitier architecture)                                                   *
//Common layers - Application layer (a.k.a. service layer[6][7] or GRASP Controller Layer [8])                                                                    *
//Common layers - Business layer (a.k.a. business logic layer (BLL), domain logic layer)                                                                          *
//Common layers - Data access layer (a.k.a. persistence layer, logging, networking, and other services which are required to support a particular business layer) *
//*****************************************************************************************************************************************************************
//===================================================
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//===================================================
/* Alert("LotsInp: ", LotsInp);*/
//OBJECT OF CLASS DEFINING???
//MelCore//"\0xffff"
//+------------------------------------------------------------------+ ProjectName - CompanyName - Copyright - WebSite
//||   ||||||||||                 Capitan.mqh                       || Hello world-cout.mq4
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| MyRoboTrader V00-build FC-2021-01-10
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| MyRoboTrader V06-build FC-2021-04-10
//||   ||||||||||             HTTPS: www.Oprymhdv.com               || MyRoboTrader V08-build FC-2022-01-13
//+------------------------------------------------------------------+
//+-----------------------------------------------------------------------------+
//|                                                                             |.1397.01.25.52.10.7931.
//| Project QUARTS: (836_line) Capitan(moniliced)-Issues         BEGIN-END      |.1397.01.25.52.10.7931.
//|                                                                             |.1397.01.25.52.10.7931.
//+-----------------------------------------------------------------------------+
//=======================================================================================================
//	POWERCert Animated Videos , if this video has been helpful to you, please like the video and subscribe. Iappreciate it??				        //
//======================================================================================================= 
ct_Conductor.Indicators_MA.ÖWA;

--https://www.youtube.com/watch?v=3tBk7ONm95Q--

==https://twitter.com/intent/tweet?url=https%3A//youtu.be/n1xp50ZM_wk&text=Eminem%2C%20J.Fla%20%26%20Selected%20Of%20God%20Choir%20-%20Lose%20Yourself%20%282020%29&via=YouTube&related=YouTube,YouTubeTrends,YTCreators==

--/https://twitter.com/sparklexscrewy/status/1510559627964002314/photo/1/--
//=======================================================================================================
//=======================================================================================================
.TC(Tele Communications)//--HTTPAZ--//
.CN(Computers Networks) (Topo+logical Graphs)(Topo+logcall Graphs)
.QCN(Quantumizde Computers Networks) ((Quantumizde Topo+logical Graphs) (as unlimite fast , as unlimite Storage , as unlimite CPU ,as unlimite RAM , as unlimite GPU ,as unlimite BUS ,as unlimite Topo+logical Graphs  )
.RMC(Referncial Machines as Computers)
.TC CN Topologies Network (Data flow)
.TC CN Topologies Network STAR (central server) (Client may inter counected by router)
.TC CN Topologies Network BUS (central Line server) (over to T-.-.-.-T) ((T-.-.-.-.) error) (over to T-C-C-C-T) ((T-C-C-C-C-) error)  (Client inter counected by router & PoP)
.TC CN Topologies Network RING (central Line server RING) (over to T-.-.-.-&T) (depend cable and pcs) (C-C-C-C-C-C-C-&C)  (Client inter counected by router ^ PoP)
.TC CN Topologies Network MESH (RING with cross conncetion) (C-*C-C-C-*C-C-*C-C-&C)  (depend overall servie based and roads)  (Client may inter counected fully  by no router)
.TC CN Topologies Network Hybrid (mixed)
.TC CN Topologies Network Hybrid - STAR BUS NETWORK   (who is the bus)    (routers are BUS)
.TC CN Topologies Network Hybrid - STAR RING NETWORK  (who is the STAR) (routers are RING)
.TC CN Topologies Network Point to Point (two host directly connected each other) (C-C) (single cable)
.TC CN Topologies Network Client to Server ( by noRouter & by Server)
.TC CN Topologies Network Client to Server ( by noRouter & by Server)
.TC CN Topologies Network Point to MultiPoint  (wireless out door) (access point, base station (broadcation by ref))   (over to &C-&C-&C-&T-&C-&C-&C)
.TC CN Topologies Network Peer to Peer  (share resources with each other) (bilgi)(logestic)(device) (printer)
.TC CN Topologies Network Peer to MultiPeer 
.TC CN Topologies ATOMS   Peer to MultiPeer 
.TC CN Topologies Organic   Peer to MultiPeer  (*&Game former.txt)
//------------------------------------------------------------------------
.TC CN Device - FSB Speed  - gigatransfers per second (GTs)
.TC CN Device - FSB Speed  - megatransfers per second (MTs)
.TC CN Device - FSB Speed  - transfers per second (Ts)
.TC CN Device - FSB Speed (Front-side bus)  (computer communication interface (bus)) ( about the time) (MTs)
//------------------------------------------------------------------------
.TC CN Device 1986 FireWire IEEE 1394 physically  Connection pc board (400 MBs)
//------------------------------------------------------------------------
.TC CN Device 2008 USB 3.0  (625 MBs)
.TC CN Device 2011 Thunderbolt (40 Gbits)
.TC CN Device 2017 USB 3.2 (≤2.2 GBs) (USB-C)
.TC CN Device 2019 USB 4.0  40 Gbits (5 GBs)
//------------------------------------------------------------------------
.TC CN Device Motherboard Fornt Panel (IO-case) (PWR(powerbutton), POWER LED(PLED)) (SPEAKER) ()
//------------------------------------------------------------------------
.TC CN Device BIOS (BASIC INPUT OUTPUT SYSTEM)(software) (initialise the computers perihpherals) (keyboards, mouse , videocard, optical devices,..)
.TC CN Device BIOS (after initialise ) Searching for a boot devices (HDD,SSD,OD,USB,Floppy..) (Fill Memory)
.TC CN Device BIOS Chip (keep BIOS (software) & setting)
.TC CN Device BIOS Chip - CMOS Chip 
.TC CN Device BIOS Chip - CMOS Chip  Battry to keep setting
.TC CN Device BIOS BOOT POST (Power on Self Test) ( BIOS  Step one ) ( BIOS  Step Two)
.TC CN Device BIOS BOOT Priority
.TC CN Device BIOS BOOT Data and time (OS ref from bios)
.TC CN Device BIOS BOOT CPU Clock speed define
.TC CN Device BIOS BOOT Virtualization Technology  (Enable to  Run multiple OS in diffrent portions )
.TC CN Device BIOS BOOT  Passwords 
.TC CN Device LoJack (locate where is it) (labtops) (GPS)
//------------------------------------------------------------------------
.TC CN Device BIOS (UEFI)(Unified extensible Firmware interface) (+mose,graphical animed,more hard capacity)
//------------------------------------------------------------------------
.TC CN Device Storage RAID  (backuping data) (event of disk failiure)
.TC CN Device Storage RAID  1 (same copy) (2 disk)
.TC CN Device Storage RAID  5 (same copy) (3,5 disk) (huge data)
.TC CN Device Storage RAID  1+0 (combined)
//------------------------------------------------------------------------
.TC CN Device Network Connector RJ-11  (register Jack) (telephone jack)
.TC CN Device Network Connector RJ-45 (network Connector)
.TC CN Device Network Connector IEEE 1394 firewaire (D shape)  multimedia devices 
.TC CN Device Network Connector BNC (Common type of RF ) (analog digital video transmition , audio)
.TC CN Device Network Connector F-Type 
.TC CN Device Network Connector USB
.TC CN Device Network Connector USB TYPE A
.TC CN Device Network Connector USB TYPE B
.TC CN Device Network Connector USB TYPE MINI
.TC CN Device Network Connector USB TYPE MICRO
.TC CN Device Network Connector Thunderbolt high speed for PCI
.TC CN Device Network Connector Thunderbolt 1 & 2
.TC CN Device Network Connector Thunderbolt 3
.TC CN Device Network Connector RCA (video audio signals) (red white)(audio)  yellow(video) 
.TC CN Device Network Connector ST (strit tip)(fibre optic cable connector) (single-mode fiber optic cable)
.TC CN Device Network Connector LC (local connector) floors an building
.TC CN Device Network Connector SC  betwin floors on building 
//------------------------------------------------------------------------
.TC CN Device Network Equipments Ethernet (over powerline) (use for Lan network type connect together)
.TC CN Device Network Equipments Cable 568 Wiring (UTP)
.TC CN Device Network Equipments Cable Straight
.TC CN Device Network Equipments Cable Cross-over
.TC CN Device Network Equipments Cable Rollover
.TC CN Device Network Equipments Cable Loopback
.TC CN Device Network Equipments Cable UTP    (unshielded twisted-pair) (4 pair) (electromagnetic interference(crosstalk))
.TC CN Device Network Equipments Cable STP  (with Metal Shielding)(protect against electromagnetic interference(EMI))
.TC CN Device Network Equipments Cable Coaxial (LNB cable)
.TC CN Device Network Equipments Cable SMF (Single mode fibre) light conncetion (SMF)
.TC CN Device Network Equipments Cable SMF (Single mode fibre) light conncetion (SMF) Cable MMF (MULTI mode fibre) light conncetion (SMF) (multiray)
//------------------------------------------------------------------------
.TC CN Device Network Equipments Cable Category 3 	10Mbps
.TC CN Device Network Equipments Cable Category 5	100Mbps
.TC CN Device Network Equipments Cable Category 5e	100Mbps
.TC CN Device Network Equipments Cable Category 6	1000Mbps
.TC CN Device Network Equipments Cable Category 6a	10000Mbps
.TC CN Device Network Equipments Cable Category 7	10000Mbps (shield)	
//------------------------------------------------------------------------
.TC CN Device Network Equipments Wiring Distribution (02:45:27)(CompTIA Network Certification video Coures)
.TC CN Device Network Equipments Wiring Distribution -Punchdown block 66 Block (Punchdown block where wires are inserted )
.TC CN Device Network Equipments Wiring Distribution -Punchdown block 66 Block (Wires are inserted using a punchdown tool)
.TC CN Device Network Equipments Wiring Distribution -Punchdown block 66 Block (out-dated and are not used much anymore)
.TC CN Device Network Equipments Wiring Distribution -Punchdown block 110 Block (modern day punch down block)
.TC CN Device Network Equipments Wiring Distribution -Punchdown block 110 Block (supports higher frequencies and uses less space)
.TC CN Device Network Equipments Wiring Distribution -Punchdown block 110 Block (meets the standard that is needed for Category 5 UTP Cable)
.TC CN Device Network Equipments Wiring Distribution -Patch Panel (a panel that has multiple cable connection and connect incoming and outgoing patch cables in a local area network)
.TC CN Device Network Equipments Wiring Distribution -Patch Panel (several UTP attached)
.TC CN Device Network Equipments Wiring Distribution -Demarc (the point where a custumer's network equpment meet with the service provider's network equipment)
.TC CN Device Network Equipments Wiring Distribution -Demarc (it defines where the service provider's responsiblity for their equipment ends and where the custumers's responbility for their equipments begins)
.TC CN Device Network Equipments Wiring Distribution -Demarc (ISP service domain localy districts are support home door)
.TC CN Device Network Equipments Wiring Distribution -Demarc (if the demarc needs to be extended further inside the custumer's building, then this is known as a demarc extention)
.TC CN Device Network Equipments Wiring Distribution -Smart Jack (known as a network interface unit or NID(Network interface device))
.TC CN Device Network Equipments Wiring Distribution -Smart Jack (terminate the T Carrier service wirese at the custumer's building)
.TC CN Device Network Equipments Wiring Distribution -Smart Jack (monitoring a network for errors and connectivity issues)
.TC CN Device Network Equipments Wiring Distribution -Smart Jack (have LEDs that indicate errors to a network technician)
.TC CN Device Network Equipments Wiring Distribution -Vertical & Horizintal (cross connection)
.TC CN Device Network Equipments Wiring Distribution -Vertical & Horizintal (cross- connection refers to points in abuilding where cables and wires connect together)
.TC CN Device Network Equipments Wiring Distribution -Vertical & Horizintal (Vertical cross connect is a main rout )
.TC CN Device Network Equipments Wiring Distribution -Vertical & Horizintal (Horizintal cross connect is a sub rout for every vertical node ) in that design system 2Demintion
.TC CN Device Network Equipments Wiring Distribution - Cable - 25 PAIR (has 25 pairs of smaller wires inside)
.TC CN Device Network Equipments Wiring Distribution - Cable - 25 PAIR (wires are colore coded to identify the individual conductors)
.TC CN Device Network Equipments Wiring Distribution - Cable - 25 PAIR (Each pair is uniquely colored)
.TC CN Device Network Equipments Wiring Distribution - Cable - 100 PAIR(has 100 pairs of smaller wires inside)
.TC CN Device Network Equipments Wiring Distribution - Cable - 100 PAIR (used for larger industrial jobs)
.TC CN Device Network Equipments Wiring Distribution - Cable - 100 PAIR (each pair is uniquely colored)
.TC CN Device Network Equipments Wiring Distribution - Frame - MDF (main distrbiution frame)
.TC CN Device Network Equipments Wiring Distribution - Frame - MDF (the main wiring frame that is used as a distrbuting point for all the wiring in a building)
.TC CN Device Network Equipments Wiring Distribution - Frame - MDF (multi pannel to connect each unit to main cables)
.TC CN Device Network Equipments Wiring Distribution - Frame - IDF (intermadiate distrbiution Frame)
.TC CN Device Network Equipments Wiring Distribution - Frame - IDF (smaller better flexibility to distirbute wires to the main distribuation frame)
//------------------------------------------------------------------------
.TC CN Device Network Equipments Wired Less technology
.TC CN Device Network Equipments Wired Modem Cable  (data over cable service) (10Gb)(downstream)(1Gb)(upstream) Clang (incoming out coming sata signals) (talking)
.TC CN Device Network Equipments Wired Hub  (no inteligent (dont know))(Passive(nopower), Active(pawer)) 
.TC CN Device Network Equipments Wired Switch  (with inteligent (know learn phicial adderese connected)) (point to point) (reduce un nessesery teraphics of network)
.TC CN Device Network Equipments Wired Bridges (devide network to seprte domains) (couping,cohensive )(sort address) (filter data depend mac addressess of destination) (block by mac)
.TC CN Device Network Equipments Wired Routers (Routes or forward data(packet) from one netword to another baised on IP address)  (esentialy gatewaye for networks)
.TC CN Device Network Equipments Wired Routers (red network)  (bulue network)  (switched Traffic by Network_ID)
.TC CN Device Network Equipments Wired PoE (POWER OVER EHERNET) get power & data from other EHERNET) 
.TC CN Device Network Equipments Wired NICs (NETWORK INTERFACE CARD) (serialDATA(analog signal)to ParallelDATA(01)) (analog to digital) (every nic own unic MAC address)
.TC CN Device Network Equipments Wired WPAs (WIRELESS ACCESS POINT) ( wireless Hub) (wireless labtop know Network) comunicate
.TC CN Device Network Equipments Wired Modem (analog to digital) (telephine Line to pc) (56Kbps) (dial-up)
.TC CN Device Network Equipments Wired Patch Panel (multy cble manager)
//------------------------------------------------------------------------
.TC CN Device Network WireLess technology
.TC CN Device Network WireLess 802.11 technology - 802.11(project)  (02:50 video)
.TC CN Device Network WireLess 802.11 Standrds (802.11 (A,B,G,N,AC)Standrds )
.TC CN Device Network WireLess 802.11 Standrds (802.11a) Speed 54Mbps        		Frequency 5 Ghz		Released 1999
.TC CN Device Network WireLess 802.11 Standrds (802.11b) Speed 11Mbps 	     		Frequency 2.4 Ghz		Released 1999
.TC CN Device Network WireLess 802.11 Standrds (802.11g) Speed 54Mbps       		Frequency 2.4 Ghz		Released 2003
.TC CN Device Network WireLess 802.11 Standrds (802.11n) Speed 600Mbps     		Frequency 2.4 or 5 Ghz	Released 2009
.TC CN Device Network WireLess 802.11 Standrds (802.11ac)Speed 6.933Mbps (6.9Gbps)  	Frequency 5Ghz  		Released 2014
.TC CN Device Network WireLess InfraRed technology (rays of light transmition) (by direct line of sight)
.TC CN Device Network WireLess Bluetooth (short range radio oprating at 2.4 Ghz) (voice and data transmiting) (speed 24 Mbps) (Range approx. 100 Meters)
//------------------------------------------------------------------------(softwared protocols)
.TC CN Device Network Address Software - MAC (media Access Control) (00-04-5A-63-A1-66) (uniquely identifies each device on a networks) (6 Byte -- hexadecimal  number)
.TC CN Device Network Address Software - MAC (burned into every NIC By its Manudacturer) (--phisicaly identified--)(*.TC CN Device Network Models -1- PHYSICA)
.TC CN Device Network Address Software - MAC (contain number and alphabet from A-F only) 
.TC CN Device Network Address Software - MAC (00-04-5A-00-00-00) Frist three Byte identify manufactured NIC (Linksys)
.TC CN Device Network Address Software - MAC (00-00-00-63-A1-66) last Three Byte a unique number from that manufactores to idenfiy each devide sepratly
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - IP (intenet Protocol) Address (numeric address) (identifying computer or device on network)
.TC CN Device Network Address Software - IP (every device on a network needs to have IP address to communicate)
.TC CN Device Network Address Software - IP (consist two part : Anetwork address and a Host Address) 
.TC CN Device Network Address Software - IP -Host              (173.16.0.0)   --- 10101101.00010000.00000000.00000000 (binary form)
.TC CN Device Network Address Software - IP -Network        (255.255.0.0) 
.TC CN Device Network Address Software - IP (two type: IPv4 & IPv6)
.TC CN Device Network Address Software - IP - IPv4 (current version of IP address) (32-bit numeric(decimal(0-9) adddress written ad four(4) numbers seprated by periods)
.TC CN Device Network Address Software - IP - IPv4  66.94.234.13 Octed (0-255)(2^8)(a character code) (4.294.967.296) posible unique addresses
.TC CN Device Network Address Software - IP - IPv4  (each grupe of numbers are seprated by Periods its call OCTET) (Octet.Octet.Octet.Octet) 
.TC CN Device Network Address Software - IP - IPv4  (66.94.234.13) (octet rang 0-255 (2^8bit)(BYTE)(all 32bit)(a intiger))
.TC CN Device Network Address Software - IP - IPv4 |---------	|------------	|------------	|------------	|------------	|------------	|------------	|------------	| 8 Bit - Octet Chart (set) 8*8=64 bit
.TC CN Device Network Address Software - IP - IPv4 |  128	|    64 	|    32	|    16	|     8	|     4	|     2    	|     1	| (2^8bit)		 
.TC CN Device Network Address Software - IP - IPv4 |---------	|------------	|------------	|------------	|------------	|------------	|------------	|------------	|
.TC CN Device Network Address Software - IP - IPv4 |  0	|    1	|    0	|    0	|     0	|     0	|     1    	|     0	| 64+2=66 
.TC CN Device Network Address Software - IP - IPv4 |---------	|------------	|------------	|------------	|------------	|------------	|------------	|------------	|  
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
.TC CN Device Network Address Software - IP - IPv4 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|
.TC CN Device Network Address Software - IP - IPv4 |     01000010	|       01011110	|       00011101	|       00001101 	| 66+94+29+13=202 
.TC CN Device Network Address Software - IP - IPv4 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|  
.TC CN Device Network Address Software - IP - IPv4 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|
.TC CN Device Network Address Software - IP - IPv4 |  	66	|             94	|     	29	|     	13	| 66+94+29+13=202 
.TC CN Device Network Address Software - IP - IPv4 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|  
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
.TC CN Device Network Address Software - IP - IPv6 (Next-generation of IP addresses) (128-bit Hexadecimal address) (hexadecimal use both nubers and alphabets ABDCE only 16 element ----(each character)(2^4Bit))-----
.TC CN Device Network Address Software - IP - IPv6 (76DC : 4F59 : 34CF : 71CD : 9DC6 : 89CD : 45D6 : 67A2) (340 undecilion addresses capable produce) 3*e38
.TC CN Device Network Address Software - IP - IPv6 (340,282,366,920,938,463,463,374,607,431,768,211,456) (more than enough)  
.TC CN Device Network Address Software - IP - IPv6 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	| 16 Bit - Octet Chart (set) 16*8=128
.TC CN Device Network Address Software - IP - IPv6 |        128	|            64 	|            32	|           16	|             8	|            4	|            2    	|            1	| (2^16bit)		 
.TC CN Device Network Address Software - IP - IPv6 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |          0	|    	0	|    	0	|    	0	|     	0	|     	0	|     	0    	|     	0	|  16,376+8=16,384
.TC CN Device Network Address Software - IP - IPv6 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|  
.TC CN Device Network Address Software - IP - IPv6 |      32,752	|         16,376 	|          8,188	|         4096	|          2048	|          1024	|           512  	|           256	|  	 
.TC CN Device Network Address Software - IP - IPv6 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |  	0	|    	0	|    	0	|    	0	|     	0	|     	0	|     	0    	|     	0	| 
.TC CN Device Network Address Software - IP - IPv6 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	----------------------------------------------------------------------------------------------------------------|
.TC CN Device Network Address Software - IP - IPv6 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|  F-F-F-F	
.TC CN Device Network Address Software - IP - IPv6 |          8	|            4	|            2    	|            1	|   0100	 
.TC CN Device Network Address Software - IP - IPv6 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|   
.TC CN Device Network Address Software - IP - IPv6 |          0	|    	0	|    	1	|    	0	| (2^4bit)	  
.TC CN Device Network Address Software - IP - IPv6 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |-------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |            - - - - 		:	   - - - - 		:	   - - - - 		:	   - - - - 		:	   - - - - 		:	   - - - - 		:	   - - - - 		:	   - - - - 		|
.TC CN Device Network Address Software - IP - IPv6 |-------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |-------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |            F-F-F-F		:	   F-F-F-F 		:	   F-F-F-F 		:	   F-F-F-F 		:	   F-F-F-F 		:	   F-F-F-F 		:	   F-F-F-F 		:	   F-F-F-F 		|
.TC CN Device Network Address Software - IP - IPv6 |------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |          15-15-15-15 	|            15-15-15-15 	|             15-15-15-15 	|            15-15-15-15 	|             15-15-15-15 	|             15-15-15-15 	|            15-15-15-15 	|             15-15-15-15 	|	 
.TC CN Device Network Address Software - IP - IPv6 |-------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |-------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |   0100-0010-0100-0010 	|     0100-0010-0100-0010 	|     0100-0010-0100-0010 	|     0100-0010-0100-0010 	|     0100-0010-0100-0010 	|     0100-0010-0100-0010 	|     0100-0010-0100-0010 	|     0100-0010-0100-0010 	|	 
.TC CN Device Network Address Software - IP - IPv6 |-------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |-------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |    0100001001000010 	|      0100001001000010 	|       0100001001000010 	|      0100001001000010 	|       0100001001000010 	|       0100001001000010 	|       0100001001000010 	|       0100001001000010 	|	 
.TC CN Device Network Address Software - IP - IPv6 |-------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|
.TC CN Device Network Address Software - IP - IPv6 |                66EE  	|            94EE		|     	      29EE	    	|     	      13EE	      	|	      66EE	         	|                   94EE	              |                 29EE	  	|     	     13EE	      	| 66+94+29+13=202 
.TC CN Device Network Address Software - IP - IPv6 |-------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|
//-----------------------------------------------------------------------==================================================================================================
.TC CN Device Network Address Software - IP - IPv9 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	| 32 Bit - Octet Chart (set) 32*8=256
.TC CN Device Network Address Software - IP - IPv9 |        128	|            64 	|            32	|           16	|             8	|            4	|            2    	|            1	| (2^16bit)		 
.TC CN Device Network Address Software - IP - IPv9 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|
.TC CN Device Network Address Software - IP - IPv9 |          0	|    	0	|    	0	|    	0	|     	0	|     	0	|     	0    	|     	0	|   8,384,512+8= 8,384,520
.TC CN Device Network Address Software - IP - IPv9 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|
.TC CN Device Network Address Software - IP - IPv9 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|  
.TC CN Device Network Address Software - IP - IPv9 |      32,752	|         16,376 	|          8,188	|         4096	|          2048	|          1024	|           512  	|           256	|  	 
.TC CN Device Network Address Software - IP - IPv9 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|
.TC CN Device Network Address Software - IP - IPv9 |  	0	|    	0	|    	0	|    	0	|     	0	|     	0	|     	0    	|     	0	| 
.TC CN Device Network Address Software - IP - IPv9 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|
.TC CN Device Network Address Software - IP - IPv9 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|  
.TC CN Device Network Address Software - IP - IPv9 |     8,384,512	|      4,192,256	|      2,096,128	|      1,048,064	|       524,032	|       262,016	|       131,008  	|        65,504	|  	 
.TC CN Device Network Address Software - IP - IPv9 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|
.TC CN Device Network Address Software - IP - IPv9 |  	0	|    	0	|    	0	|    	0	|     	0	|     	0	|     	0    	|     	0	| 
.TC CN Device Network Address Software - IP - IPv9 |-----------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|--------------------------	|
.TC CN Device Network Address Software - IP - IPv9 |-------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|
.TC CN Device Network Address Software - IP - IPv9 |        66EE-94EE-94EE  	|            94EE-29EE-29EE      |         29EE-13EE-13EE	|       13EE-66EE-66EE  	|         66EE-94EE-94EE	|        94EE-29EE-29EE 	|    	29EE-13EE-13EE 	|         13EE-FFFF-FFFF  	|  
.TC CN Device Network Address Software - IP - IPv9 |-------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|----------------------------------------	|
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - IP -Subnet Mask  (255.255.0.0)  --- 11111111.11111111.00000000.00000000
.TC CN Device Network Address Software - IP -Subnet Mask                       ---    NETWORK.NETWORK.HOST.HOST
.TC CN Device Network Address Software - IP -Subnet Mask		     Network_Portion.Host_Portion
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------(127 is reserved for internal loopback functions testing)
.TC CN Device Network Address Software - IP -Subnet Mask    Supported 	Hosts on networks			organiztion 		Class     	Subnet_Mask        	      (default subnet mask classes)                        	frist Octed address                         
.TC CN Device Network Address Software - IP -Subnet Mask   60 million	Hosts on 126 networks       		Larg organiztion 		A     	255.0.0.0          	--- NNNNNNNN.hhhhhhhh.hhhhhhhh.hhhhhhhh		1-126    (127 is reserved for loopback testing)
.TC CN Device Network Address Software - IP -Subnet Mask   65.000   	Hosts  on 16,000 networks  		medium organiztion  	B      	255.255.0.0     	--- NNNNNNNN.NNNNNNNN.hhhhhhhh.hhhhhhhh.		128-191
.TC CN Device Network Address Software - IP -Subnet Mask   254       	Hosts   on 2,000,000 networks      	small organiztion		C     	255.255.255.0   	--- NNNNNNNN.NNNNNNNN.NNNNNNNN.hhhhhhhh.	192-223
.TC CN Device Network Address Software - IP -Subnet Mask   ---- 		---				---		 	D     
.TC CN Device Network Address Software - IP -Subnet Mask   ----		--- 				--- 	  		E     
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - IP -Subnetting  (dived huge network) (formula)(2^n-2)(n equal to number of bit) (class B  255.255.0.0 )		 
.TC CN Device Network Address Software - IP -Subnetting  (2*2*2)-2=6 (n==3) (3 bits)	 (255.255.224.0) => (11111111.11111111.11100000.00000000)       (3 subnet)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - IP -Private (notPublicly registered on the internet) (cant directly access internet) (10 pc need 10 Public from ISP) (rfc.1518) (private to public) ((private IP for school)
.TC CN Device Network Address Software - IP -Private   Class     IP Range start  --- end			Subnet_Mask        	              
.TC CN Device Network Address Software - IP -Private    A        10.0.0.0	--10.255.255.255 		255.0.0.0          	 
.TC CN Device Network Address Software - IP -Private    B        172.16.0.0	--172.31.255.255 	 	255.255.0.0     	 
.TC CN Device Network Address Software - IP -Private    C        192.168.0.0	--192.198.255.255 		255.255.255.0 
.TC CN Device Network Address Software - IP -Public   (Publicly registered on the internet) (you have acceed to internet)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - IP -Conflict (alrady used)  ( have twodhcp server)
.TC CN Device Network Address Software - IP -Leased Expired (not have dhcp server)
.TC CN Device Network Address Software - IP -Self-assigned (APIPA (Automatic Private IP Address Assignment))  (169.254.0.0) (camunicate same network by microsoft)
.TC CN Device Network Address Software - IP -Static         			---change if user decide
.TC CN Device Network Address Software - IP  DHCP Server- Dynamic   	--- DHCP Server   (IP address,DNS,Gateway,Subnet mask)
.TC CN Device Network Address Software - IP  DHCP - Scope (IP range (10-230))
.TC CN Device Network Address Software - IP  DHCP - Reservation (alwayse same address by dhcp--- ensure x computer or device identify by mac address )(network printer and servers)
.TC CN Device Network Address Software - IP -DHCP - Leased (how much time its own the ip address)
.TC CN Device Network Address Software - IP -DHCP - Relay (same subnet) (may dhcp not on the same network 255.255.255.0 !=255.255.0.0) (broadcast canot go out of its subnet to get other dhcp)
.TC CN Device Network Address Software - IP -DHCP - Relay (ip helper) Enabled on Router can relay dhcp broadcasts recives and forwards it (external dhcp getback ip address to pc)
.TC CN Device Network Address Software - IP -IP address   		--- 10.10.0.1
.TC CN Device Network Address Software - IP -DNS		--- 8.8.4.4 (google dns server)	
.TC CN Device Network Address Software - IP -Gateway		--- 10.10.0.9
.TC CN Device Network Address Software - IP -Subnet mask	--- 255.255.255.0
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - TCP (transmission control protocol)  --granti delivery data
.TC CN Device Network Address Software - TCP COP(connection orianted Protocol)
.TC CN Device Network Address Software - TCP #1 ---  SYN Send     	(signal 0)
.TC CN Device Network Address Software - TCP #2 ---  SYN ACK	(signal 1)   (BACK -ACK)
.TC CN Device Network Address Software - TCP #3 --- ACK RECIVED	(signal 3)
.TC CN Device Network Address Software - TCP #1 --- 
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - UDP (User Datagram protocol) sending reciving data ()  --not granti delivery data (similare to TCP)
.TC CN Device Network Address Software - UDP (not stablish stations (connection less) ) (broadcast)  (faster than tcp)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - DNS (Domain Name System) (unic IP num to unic Name) (over net) (like phone book)
.TC CN Device Network Address Software - DNS (Domain Name to IP address)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - NAT (Network Address Translation) (Private to Public)(Public to Private )   (Router (public IP Address)(67.168.212.121))
.TC CN Device Network Address Software - NAT (private IP Address need to connect to Internet ned to translete to Public Ip Address) and Versace 
.TC CN Device Network Address Software - NAT(10.10.0.0 to 67.158.212.121) (67.158.212.121 to 10.10.0.0 )(for same router)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - PAT (Port Address Translation) (Port to IP address) (4001 to 10.10.0.1)
.TC CN Device Network Address Software - PAT (67.158.212.121:4001) to (4001 is 10.10.0.1 computer) (Router switch IP by Port)
.TC CN Device Network Address Software - PAT (outside sent sth by knowing the port who is)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - SNAT (static network address Translation) (link public IP addreess with a private IP address permenetly)
.TC CN Device Network Address Software - SNAT (67.158.212.12 : 10.10.0.1) (mail server)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - Proxy Service (similar to web browser)((no need download agane)cached web page database on PROXY Server)
.TC CN Device Network Address Software - Proxy Service (keep beforly viewed pages content in cash to not download agane by proxy server) (more speed to load - save BandWidth - Securty)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - RDP(Remote desktop Protcol) (from microsoft) (access remote compter desktops)
.TC CN Device Network Address Software - RDP (based on microsoft terminal services) (by IP address)(desktop display and control pc)
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- Access metod
.TC CN Device Network Address Software - CSMA/CD (carrier sense multiple acess with collison detection) (used wired networks)
.TC CN Device Network Address Software - CSMA/CA (carrier sense multiple acess with collison Avoidance)(used wireless networks)
.TC CN Device Network Address Software - CSMA/CA (small data packet send to make sure chanel is clear to send main data packets)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - FTP (file transfer )COP(connection orianted Protocol)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - SFTP (secure file transfer )COP(connection orianted Protocol) (encrypted)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - TFTP (Trivial file transfer protocol) (in same network ) (use UDP)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - SMTP (Simple Mail transfrom protocol) (sending email) (sending mail to people) ) (use TCP) COP(connection orianted Protocol)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - POP3 (Post Office Protocol ver.3) (mail server)(receiving mail) (directly downlod email to your computer (stringed signal data)) (moved) (microsoft outlook)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - IMAP4 (internet message access protocol ver.4) (mail server)(receiving mail) (keep on server and copy (syncs email)) (Ref)(microsoft outlook)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - HTTP (hypertext transfer protocol) (as text) (http://www,google.com) webServer to Web Browser
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - HTTPS (Secure hypertext transfer protocol)  (encrypt text data for transform)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - Telnet (terminal emulation program) (not secure all command sent in clear text) (access device in local not internet)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - SSH (secure shell) (alternative to Telnet) (protect steal and attack data) (as secure tunnel)(shild conncection)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - ARP (address Resolution Protocol) (used to resolve Ip addressess to MAC addresses) (need mac address to communicate)
.TC CN Device Network Address Software - ARP (computers search thier ARP cache frist to finde the targer mac address)(if mac address not in the ARP cache coumputer broadcast message to assking for it)
.TC CN Device Network Address Software - ARP (take place betwin two) A(i need to communicate with 192.168.1.2) A(who is 192.168.1.2) B(answer i am 192.168.1.2) A(tell me your MAC address)(ok i'm sending it now)
.TC CN Device Network Address Software - ARP (mac base communicates)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - RARP (Reverse address Resolution Protocol) (mac to ip address)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - NTP (network time protocol) (identifiy time is in sync or same place)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - SCP (Secure copy protocol) (identifiy time is in sync or same place) (use secure shell SSH to safeguard data as its being transferred over network )
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - SNMP (simple network managment protocol) (use to network mangments)(collect data from various network devices such as ()
.TC CN Device Network Address Software - SNMP (Routers,printers,and servers) --- access to printing 
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - WINS (Windows internt name service) (similar to DNS) (same network)
.TC CN Device Network Address Software - WINS (NetBios name to IP Address)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software - Routing Protcols
.TC CN Device Network Address Software - Routing Protcols - Loopback (interface) (a fake or virtual interface is created on a router)
.TC CN Device Network Address Software - Routing Protcols - Loopback (assine IP address you choose)
.TC CN Device Network Address Software - Routing Protcols - Loopback (testing and administration purposes)
.TC CN Device Network Address Software - Routing Protcols - Loopback -Sisco router
//--------------------------------------------------------------------------------------------------------------------- 
.TC CN Device Network Address Software - Routing Protcols - Routing Table (switching destination) (best path to it destination)
.TC CN Device Network Address Software - Routing Protcols - Routing Table - (a network destination (final place))
.TC CN Device Network Address Software - Routing Protcols - Routing Table - (Subnet Mask (where is HOST and NETWORK partitions))
.TC CN Device Network Address Software - Routing Protcols - Routing Table - (Gateway) (tell router which IP address data packet should be forward to)
.TC CN Device Network Address Software - Routing Protcols - Routing Table - (Interface) (outgoing IP of device ID or IP that sending data)
.TC CN Device Network Address Software - Routing Protcols - Routing Table - (Next hop) (IP Address to whitch IP is frowarded to)
.TC CN Device Network Address Software - Routing Protcols - Routing Table - (Metric) (determine the best route among multiple destination)
//-------------------------------------------------------------------------------------------------------------- 
.TC CN Device Network Address Software - Routing Protcols - (collect information about current network status and map out the best path for data packets to take thire spescific destination )
.TC CN Device Network Address Software - Routing Protcols - (Distance Vector) (factor in distination betwin how many hops exist) 
.TC CN Device Network Address Software - Routing Protcols - (Link State)
.TC CN Device Network Address Software - Routing Protcols - (Hybrid)
//-------------------------------------------------------------------------------------------------------------- 
.TC CN Device Network Address Software - Routing Protcols - (Distance Vector) -RIP (Router information Protocol) (oldest routing protocol)
.TC CN Device Network Address Software - Routing Protcols - (Distance Vector) -RIP (broadcast routing information to other routers every 30 secounds if the routing information changed)
.TC CN Device Network Address Software - Routing Protcols - (Distance Vector) -RIP (make unneddery trafic on network by larging)
//-------------------------------------------------------------------------------------------------------------- 
.TC CN Device Network Address Software - Routing Protcols - (Distance Vector) -RIPv2 (faster)
//-------------------------------------------------------------------------------------------------------------- 
.TC CN Device Network Address Software - Routing Protcols - BGP (border Gateway Protocol) (a distination vector protocol)
.TC CN Device Network Address Software - Routing Protcols - BGP (standrd routing protocol of internet)
.TC CN Device Network Address Software - Routing Protcols - BGP (Determines routing direction that based on path and Policies)
//-------------------------------------------------------------------------------------------------------------- 
.TC CN Device Network Address Software - Routing Protcols - (Link State) (is used by routers to share information and independently map out the best path on a network)
.TC CN Device Network Address Software - Routing Protcols - (Link State) - OSPF (open shortest path frist) (is used to determine correct rout for data packets to talke thier destination)
.TC CN Device Network Address Software - Routing Protcols - (Link State) - OSPF (collect information from other routers ----using IP---)
.TC CN Device Network Address Software - Routing Protcols - (Link State) - OSPF (create a ----topology map------ of the network)
.TC CN Device Network Address Software - Routing Protcols - (Link State) - IS-IS (intermediate system to intermediate system)
.TC CN Device Network Address Software - Routing Protcols - (Link State) - IS-IS (routers are orgnized into a domain or groups)
.TC CN Device Network Address Software - Routing Protcols - (Link State) - IS-IS (is primarily function wothin theses domain)
.TC CN Device Network Address Software - Routing Protcols - (Link State) - IS-IS (is ---used CLNS---- to communicate to other routers)  
.TC CN Device Network Address Software - Routing Protcols - (Link State) - IS-IS - CLNS (connectionLess Network Service)
//-------------------------------------------------------------------------------------------------------------- 
.TC CN Device Network Address Software - Routing Protcols - (Hybrid) - EIGRP (Enhanced interior Gateway routing Protocol)
.TC CN Device Network Address Software - Routing Protcols - (Hybrid) - (combination od distance vector and link state protocols)
.TC CN Device Network Address Software - Routing Protcols - (Hybrid) - (Runs on Cisco Routers)
.TC CN Device Network Address Software - Routing Protcols - (Fast,Less overHead, And -----Can Support---- many ---network layer Protocols-----)
//-------------------------------------------------------------------------------------------------------------- 
.TC CN Device Network Address Software - Routing Protcols (OSI)- SIP (Session initiation Protocol) (for Establishes communication session over the internet)
.TC CN Device Network Address Software - Routing Protcols (OSI)- SIP - VoiP (Voice over Internet Protocol) (term is used for Voice CN over IP Networks)
.TC CN Device Network Address Software - Routing Protcols (OSI)- SIP - VoiP (instance messeginf and confernecing services)
.TC CN Device Network Address Software - Routing Protcols (OSI)- SIP - VoiP (Oprate at the ---application layer--- of the OSI modell)
//-------------------------------------------------------------------------------------------------------------- 
.TC CN Device Network Address Software - Routing Protcols (OSI)- RTP (Real-Time Transport Protocol)
.TC CN Device Network Address Software - Routing Protcols (OSI)- RTP (internet standard for transporting realTime data such as streaming audio and video)
.TC CN Device Network Address Software - Routing Protcols (OSI)- RTP (used over UDP - does not guarante data delivery)(reflect by other fast tcp manualy accepted)
.TC CN Device Network Address Software - Routing Protcols (OSI)- RTP (RTCP((Real-Time Transport Control Protocol)))
.TC CN Device Network Address Software - Routing Protcols (OSI)- RTP (Enables you to monitor the quality of the data being delivered)
.TC CN Device Network Address Software - Routing Protcols (OSI)- RTP (used for Unicast and Multicast)
//==============================================================================
.TC CN Device Network Address Software Ports  (need to know how to accepted) (categories by two protocols)
.TC CN Device Network Address Software Ports (a logical connection used by programs to exchange information)
.TC CN Device Network Address Software Ports (unic number to identifying)
.TC CN Device Network Address Software Ports (range  to 65535) (16-bit 65,536)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Address Software Ports Chart
Port Number	Service		Port Number	Service 
      80		HTTP		 20,21		FTP
      443		HTTPS		 161		SNMP		443(login and password)
      137-139          NetBIOS		 22		SSH
      110		POP3		 23		TELNET
      143		IMAP		 53		DNS
      25		SMTP		 67,68		DHCP		25 outlook app
      5060/5061       SIP		 69		TFTP
      3389		RDP		 445		SMB
      1720		H.323		 5004/5005	RTP
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Authentication Protocols PAP (password authenicatin Protocol)
.TC CN Device Network Authentication Protocols PAP (Login && Password) (ADMINROOT) (archiveAuthentication) (not very safe)(all sent in clear text)
.TC CN Device Network Authentication Protocols CHAP (challenge hackshake protocol)(challenge handshake protocol)  (bether alternative of PAP)
.TC CN Device Network Authentication Protocols CHAP (encrypt username and passwords) (server asking or challenging client to validate it self by using 3way handsheke )
.TC CN Device Network Authentication Protocols CHAP (after connection has been made)(the server challange to client by send "please HASH the password for scot)
.TC CN Device Network Authentication Protocols CHAP (then client response by sending ONE WAY HASH function "#R@O%O&T")
.TC CN Device Network Authentication Protocols CHAP (then server response byown calculation to seed currect pass "ROOT") (password is currect)
.TC CN Device Network Authentication Protocols CHAP (in value matches the autherication pass)
.TC CN Device Network Authentication Protocols MS-CHAP (microsoft challange HandShake protocol) (ms-Chap is microsoft's version of CHAP)
.TC CN Device Network Authentication Protocols MS-CHAP (Bassiclly CHAP )(only verify clients)
.TC CN Device Network Authentication Protocols MS-CHAP2 (both the client and the server are authoricated) (more secure)
.TC CN Device Network Authentication Protocols Radius (Remote Authenication dial-in service)
.TC CN Device Network Authentication Protocols Radius (*.TC CN Device Network - soho routers- wireless setting - Security - RADIUS )
.TC CN Device Network Authentication Protocols Radius (enables a single server, such as a domain controller to handle all authenication)
.TC CN Device Network Authentication Protocols Radius (allow company to store user access data in a central location)
.TC CN Device Network Authentication Protocols Radius (a Radius server makes the request on the user's behalf after authenticating)
.TC CN Device Network Authentication Protocols Kerberos (authenication)(Kerberos server) (developer mit) (authenicates by using tickets)
.TC CN Device Network Authentication Protocols Kerberos (to client access network resorces) (frist it authenication with Kerberos server)
.TC CN Device Network Authentication Protocols Kerberos (after authenication client get ticket to access network resorces) (each resorce need to get tickets)
.TC CN Device Network Authentication Protocols EAP (extensible authenication protcol) (extention to PPP) (.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPP (Point to point Protocol))
.TC CN Device Network Authentication Protocols EAP (suport many methods(technic)(function) of authentication ) (associated smart cards to use)
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Technology Remote Access Protocols & Services Technology - (Remote access Home to your Job)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - RAS (Remote access service) (service that enables you to connect to a computer from a remote location)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - RAS (Home to your Job)(access over dialup connection)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - RAS (originally developed by microsoft and build into their windows NT Line of service software)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - RAS (works with major network protocols such as TCP-IP, NetBeui and IPX-SPX)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - SLIP (Serial Line Internet Protocol)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - SLIP (designed to data can transmit over serial ports and modem connection (phone lines))(not secure protocol)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - SLIP (All iformation is sent in clear text) (does not provide any error checking and is limited to using only the TCP-IP protocol)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - SLIP (PPP)(solve SLIP issues)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPP (Point to point Protocol)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPP (standart remote access protocol used today)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPP (supports encryption or authenication)(is a secure protocol)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPP (most ISPs use this protocol for their custumers who want to access the internet through a dialUp connection)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPPoE (point to point protocol over Ethernet)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPPoE (use PPP over Ethernet)(used for encapsulating PPP frames in Ethernet Frames)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPPoE (developed for DSL, Cable modem, or wireless Connection to the internets)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPPoE (used for connecting multiple users on a LAN to a Remote site sharing a Common device)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPTP (point to point Tunneling Protocol)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPTP (used for creating VPNs(Virtual Private Networks))
.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPTP (default protocol associated with VPNs) (ensures data transfer is secure by creating a secure tunnel)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - PPTP (create secured tunnel between two Points (shielded cover))       
.TC CN Device Network Technology Remote Access Protocols & Services Technology - GRE (generic Route encapsulation)(used with PPTP in creation of VPN Network)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - GRE (create tunnel in PPTP )(encapulated data in secure manner)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN (Virtual Private Network)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN (a private communications network)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN (that uses a public network (such as the internet) to establish a remote connection)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN (the data encripted when sending and decryptts data when receving)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN (provides a dedicated link between two points over internet-based tunnels)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN Concentrator (is a device that creates the vpn connections and manages  the delivery of)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN Concentrator (of the messages betwen the vpn computers and devices)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN Concentrator (authenticate users , encrypt the data, and assigns tunnel / IP address to users)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN Concentrator(not allwayse nedded to create VPNs. Mostly used in organizations that are )
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN Concentrator(are going to use a lot of vpn connections) (need device handle the heavy traffic)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN Concentrator (for small vpn connection network --- just use VPN software build in router or firewall rather than vpn concentractor)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN connection Site To Site (deffrent Geo location HOSTs) (for networking and share data with each other throw over public internet global)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN connection Site To Site (need vpn to encript data in base and decript data in destination host to make private network over internet)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN connection Site To Site (much cheaper to do) (many to many)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN connection Host To Site (one to many)(no need any device just software that do vpn connection)( oprating system to connect office vpn connector)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN connection Host To Site (host get data from vpn site encripted bu site is not encripted can read data) (anyoffice or site site)
.TC CN Device Network Technology Remote Access Protocols & Services Technology - VPN connection Host To Host (one to one) (just nedd software to create host to host connection)(no need any device)(crypto on sorce and destination and broadcast to internet)
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network  Define Multicast  (data packets sent multi destination at the same time)
.TC CN Device Network  Define singlecast (single destination)
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Technology VLAN, Internet & Extranet  (02:49:45)(CompTIA Network Certification video Coures)
.TC CN Device Network Technology VLAN, Internet & Extranet - VLAN (virtual Local Area Network)
.TC CN Device Network Technology VLAN, Internet & Extranet - VLAN (logical area network (controls ...)
.TC CN Device Network Technology VLAN, Internet & Extranet - VLAN (controls network traffic reardless of their physicalites of the location)
.TC CN Device Network Technology VLAN, Internet & Extranet - VLAN (departments connecting)(accounting--suporting--shiping) (soport to shiping connect (subnet connecting))
.TC CN Device Network Technology VLAN, Internet & Extranet - VLAN Switch (for connect the other subnets to gether not phsicaly move ther your pc)
.TC CN Device Network Technology VLAN, Internet & Extranet - VLAN Switch (logicly create several virtual networks to seprate network broadcast traffic)(now any department (cant)not see the traffic of others departments ) (see own traffics)
.TC CN Device Network Technology VLAN, Internet & Extranet - VLAN Switch (ways to vlan can be created by ports in vlan switch or that can be created using mac address of other computers)
.TC CN Device Network Technology VLAN, Internet & Extranet - Intranet (02:51:30)(CompTIA Network Certification video Coures)
.TC CN Device Network Technology VLAN, Internet & Extranet - Intranet(Private network its blog to an organization) (intrnal web site)(shoping Center) (that organization can access)
.TC CN Device Network Technology VLAN, Internet & Extranet - Intranet (contain information about company -- sales --- inventory --history-- etc.)
.TC CN Device Network Technology VLAN, Internet & Extranet - Intranet (this web site is behinde firewall) (no one cannot access from outside of copany devices)
.TC CN Device Network Technology VLAN, Internet & Extranet - Extranet (similar to --- internet---)(a privatie network that can be accessible form out side the organization on a restricted biasis (firewled devices or ips to thickets))
.TC CN Device Network Technology VLAN, Internet & Extranet - Extranet (company a and company b partnerships) (can access setain information)(for bussiness)
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Technology Internet access technology - DSL( Digital Subscriber Line) home and busses  (voice and data at same time)  (DSL modems faster than dialup modems) (common telefoe line to caryy data )
.TC CN Device Network Technology Internet access technology - ADSL(Asymetric Digital Subscriber Line) ((60KB)upload slow --download faster) use in homes (cheaper than DSL) (not miror) (clients)
.TC CN Device Network Technology Internet access technology - SDSL( symetric Digital Subscriber Line)  (upload  -- download same ) (Is_miror) (used businesses) (servers)
.TC CN Device Network Technology Internet access technology - VDSL( very high BIT rate Digital Subscriber Line(DSL)) (upload  -- download over 50Mbps (6.25MBs)) (Is_miror) (cuper wire) (short distances) (used businesses) (servers)
.TC CN Device Network Technology Internet access technology - VDSL (long distances - fiber cable ).
.TC CN Device Network Technology Internet access technology - BroadBand cable (many homse to access internet)  ver fst 50 Mbps or more (television to clints)
.TC CN Device Network Technology Internet access technology - POST/PSTN (public telephones) (slowe speed) (dial-up -56 Kbps)
.TC CN Device Network Technology Internet access technology - ISDN (integrated services digitals networks) -- 128 Kbps -dial-up -56 Kbps (over telephone lines without ISP)
.TC CN Device Network Technology Internet access technology - Satellite communications (expensive) - (cable-phone-adsl) (max 15 MBs) (fraction uploade speed)
.TC CN Device Network Technology Internet access technology - Mobile Hotspot -- (13 MBs)(cellular Tower) (portable devices)(seprate or in mobile cell phone) (30 feet -- 9.144 meters) (mobile HotSpot) (wireless device(cellphone) to internet) over simcards (verison-ATT Nt - T-mobile)
.TC CN Device Network Technology Internet access technology - BroadBand WIMAX (Home wireless) (cover much largare are) (a super wireless network cover entire cities or ountries) (directly conncet (ISP(internet service provider)) using a T3 Line ( (speed is 43 Mbps) (5.375 Mbyte per secound))) (like sell phone tower)(replase by DSL and Cables service cant reached)
.TC CN Device Network Technology Internet access technology - Metro Ethernet (MAN)(bulding of cities) (Ethernet  connectivity's)
.TC CN Device Network Technology Internet access technology - SCADA / ICS (supervisory Control and Data Acquisition) (control and monitoring equipment used in industrial faciliteies ad power Plants, Water Treatment Plants, Or refineries (super Systems))
.TC CN Device Network Technology Internet access technology - SCADA / ICS (SCADA communicates with--- sensors ---and---- Systems ---in ---real time---)
.TC CN Device Network Technology Internet access technology - SCADA / ICS (synchronous with all elemetst of system (on timer(protocols (method(functions(loop every mili secounds or nano secounds resolution))))))
.TC CN Device Network Technology Internet access technology - SCADA / ICS ( send PLCs (Programmable Logic Controllers) and RTUs (Remote terminal Uits) which then sends it to the SCADA computers to be Analyzed)
.TC CN Device Network Technology Internet access technology - SCADA / ICS (developing system ) (refered to ICS (industrial control system)) (general term)
.TC CN Device Network Technology Internet access technology - GSM & CDMA ((GSM)Globlal System for Mobiles)(CellPhone -Internet access -) (its the lagest radio system that is being used around the world(work enviroment))
.TC CN Device Network Technology Internet access technology - GSM & CDMA (GSM(used by carriers AT&T and T-Mobile))(widely used in Europe)
.TC CN Device Network Technology Internet access technology - GSM & CDMA (GSM(works by changinge voice into a digital form and assigned a time slot (data recived other hand  assigned a time back together ))
.TC CN Device Network Technology Internet access technology - GSM & CDMA (CDMA (code division multiple Access) (radio technology) (not as widely used as GSM) (used by carriers Verizon and Sprint)
.TC CN Device Network Technology Internet access technology - GSM & CDMA ( CDMA (works by data being Encoded woth a unique key)
.TC CN Device Network Technology Internet access technology - 4G LTE / 3G / Edge
.TC CN Device Network Technology Internet access technology - 4G LTE / 3G / Edge -  (Edge (Enhanced Data Rate For GSM Evolution)(starting at 75Kbps---9.375KBs) (very slowe technology) (Slow wireless communication speed) (looks same dialup modem (56Kbps))
.TC CN Device Network Technology Internet access technology - 4G LTE / 3G / Edge -  (3G (Speed anywhere from 384 Kbps to 2 Mbps (48 KBs to 0.25 MBs (250 KBs))) (mediom wireless communication speed)
.TC CN Device Network Technology Internet access technology - 4G LTE / 3G / Edge -  (4G LTE (forth Generation Long Term Evolution)) (is technology-based development by the 3rd Generation Partnership Project)
.TC CN Device Network Technology Internet access technology - 4G LTE / 3G / Edge -  (4G LTE (fastes wireless communication)(currectly is the fastes wireless comunnication speed available))
.TC CN Device Network Technology Internet access technology - 4G LTE / 3G / Edge -  (4G LTE (Speed of over 100 Mbps (12.5 MBs))(fastes wireless communication speed)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Type - PAN (Persinal area network) (personal levels)(small network) (mobilephone-labtops-PDA-printers- over bluetooth) transfer small files
.TC CN Device Network Type - LAN (Local area network) (group of device) (computers - servers- printers ) (locate same building) (enclose each other) ()
.TC CN Device Network Type - LAN - LAN Ethernet - Ethernet LAN (same cble) 
.TC CN Device Network Type - MAN (Metropolition area network)(over several building in city ) (banks) (high speed connction - fibre cable)
.TC CN Device Network Type - MAN -Metro Ethernet (MAN)(bulding of cities) (Ethernet  connectivity's)
.TC CN Device Network Type - WAN (Wide area network)  (largest network) (Contry-continent-Globe)
.TC CN Device Network Type - sWAN (Wide area network) (interStar) (throw planet over a sun system area)
//-----------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Type - WAN (Wide area network) Technology
.TC CN Device Network Type - WAN Technology
.TC CN Device Network Type - WAN Technology - Switching (data dvided smaler pies as Data Packets send individually (singled) )
.TC CN Device Network Type - WAN Technology - Switching Method- Packet  -- (take diffrent routes to their destination) 
.TC CN Device Network Type - WAN Technology - Switching Method- Packet  -- (once all data package rich destination they are recompile into orignal pakage)
.TC CN Device Network Type - WAN Technology - Switching Method- Packet  -- (this method known connection less) (internet use Packet Switching Method) (internet use Packet Switching Technology)
.TC CN Device Network Type - WAN Technology - Switching Method- Circuit   -- (Data Packets send individually (singled))
.TC CN Device Network Type - WAN Technology - Switching Method- Circuit   -- (take Same routes to their destination) 
.TC CN Device Network Type - WAN Technology - Switching Method- Circuit   -- (goo example Telephone lines) 
//-----------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Type - WAN Technology - ISDN (integrated services digtal networks)
.TC CN Device Network Type - WAN Technology - ISDN (.TC CN Device Network Internet access technology - ISDN )
.TC CN Device Network Type - WAN Technology - ISDN (international standrd for digital transmisions over ordinary telephone lines)
.TC CN Device Network Type - WAN Technology - ISDN (users have to instal ISDN modems)
.TC CN Device Network Type - WAN Technology - ISDN (standard modems speed is 56Kbps (analog) --- ISDN faster)
.TC CN Device Network Type - WAN Technology - ISDN (ISDN send data speed is 128Kbps)
.TC CN Device Network Type - WAN Technology - ISDN (never cut on -for fast speed of DSL on cable)
//-----------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Type - WAN Technology - Line T1 (T Carrier Level 1)
.TC CN Device Network Type - WAN Technology - Line T1 (commonly used internet service for bussinessess today) (servers)
.TC CN Device Network Type - WAN Technology - Line T1 (speed is 1.4Mbps)
.TC CN Device Network Type - WAN Technology - Line T1 (consists of 24 invidual channels that carries a rate of 64 Kbps Each one (24*64=1,536 Kbps))
.TC CN Device Network Type - WAN Technology - Line T1 (each of channels can carries data or voice traffic at same time )
//--------------------------------------------------------------------------------------
.TC CN Device Network Type - WAN Technology - Line T3 (T Carrier Level 3)
.TC CN Device Network Type - WAN Technology - Line T3 (high speed internet connection)
.TC CN Device Network Type - WAN Technology - Line T3 (speed is 43 Mbps) (5.375 Mbyte per secound)
.TC CN Device Network Type - WAN Technology - Line T3 (consists of 672 invidual channels tha carries a rate of 64 Kbps each one)(672*64=43,008 Kbps))
.TC CN Device Network Type - WAN Technology - Line T3 (mainly used by ISPs That connect directly to the ----Backbone of the internet----)
//--------------------------------------------------------------------------------------
.TC CN Device Network Type - WAN Technology - Line E1  (similara to T1 Line)
.TC CN Device Network Type - WAN Technology - Line E1 (Format that is used in Europe)
.TC CN Device Network Type - WAN Technology - Line E1 (speed is 2 Mbps)
.TC CN Device Network Type - WAN Technology - Line E1 (Consists of 32 channels that carry 64 Kbps of Data each one) (32*64=2,048 Kbps))
//--------------------------------------------------------------------------------------
.TC CN Device Network Type - WAN Technology - Line E3  (European Equivalent of a T3 Line)
.TC CN Device Network Type - WAN Technology - Line E3 (speed is 34 Mbps)(4.25 Mbyte per secound)
.TC CN Device Network Type - WAN Technology - Line E3 (has fewer channel than a T3)
//--------------------------------------------------------------------------------------
.TC CN Device Network Type - WAN Technology - OCx (optical carrier) (01:59:36)
.TC CN Device Network Type - WAN Technology - OCx (describes the speed of networks that can be carried o= on SONET(Synchronous Optical Network)
.TC CN Device Network Type - WAN Technology - OCx (Fiber-Optic technology(method) that delivers Voice,data,and video at high speed) 
.TC CN Device Network Type - WAN Technology - OCx (the OC level Are calculated by multiples of 51.84 Mbps) (6 Mbyte per secound )
.TC CN Device Network Type - WAN Technology - OCx Level  OC-1		Speed   51.84 Mbps
.TC CN Device Network Type - WAN Technology - OCx Level  OC-3	*51.84=	Speed   155.52 Mbps (19.375 MByte per secound)
.TC CN Device Network Type - WAN Technology - OCx Level  OC-12	*51.84=	Speed   622.08 Mbps (77.75 MByte per secound)
.TC CN Device Network Type - WAN Technology - OCx Level  OC-24	*51.84=	Speed   1.244 Gbps
.TC CN Device Network Type - WAN Technology - OCx Level  OC-48	*51.84=	Speed   2.488 Gbps
.TC CN Device Network Type - WAN Technology - OCx Level  OC-192	*51.84=	Speed   9.953 Gbps (1.244125 GByte per secound)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Security FireWall 
.TC CN Device Network Security FireWall (filtere data signals) (keep network safe) (*autorised actions,un authorities)(block unwanted trafiic)(permits wanted trafiic)
.TC CN Device Network Security FireWall (software,Hardware)
.TC CN Device Network Security FireWall (software) Host Based
.TC CN Device Network Security FireWall Hardware
.TC CN Device Network Security FireWall software Host Based
.TC CN Device Network Security FireWall (software,Hardware) Network Based (entire network)
.TC CN Device Network Security FireWall ACL (Access Control List) (IP list) (IP 165.253.262.25 Allow) (Port List)(Port 80 Allow)
.TC CN Device Network Security FireWall StateFul (monitor all connection & data stream) (passing throw) keep records (by data packets) (dynamicly)
.TC CN Device Network Security FireWall StateLess (use ACL) (not keep records) (not do thrw job)
.TC CN Device Network Security FireWall Content filtering (email) (filtered data on their content) (email spam)
.TC CN Device Network Security FireWall Signiture identifications (used to detect virus that has well know behavior pattern) (program to spot behavior)
.TC CN Device Network Security FireWall IDS/IPS (alert outside attacks) (viruses , malware , hackers) (look to suspisious patterns for danger)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Security Protocols  (03:03:45)(CompTIA Network Certification video Coures) (Network+ Certification) (NIO-006)
.TC CN Device Network Security Protocols - IPSec (internet protocol security) (set of protocols for security)
.TC CN Device Network Security Protocols - IPSec (encrypts the data with communication happen computers (functions-calsses-modules))
.TC CN Device Network Security Protocols - IPSec (OSI Model network Layer ) (*.TC CN Device Network Models OSI-3- NETWORK)
.TC CN Device Network Security Protocols - IPSec (bsed on public key) (lock and unlock data betwin networks or softwared)
.TC CN Device Network Security Protocols - IPSec (make sure data recived is what exacty is dataSent)(unmanipuled)
.TC CN Device Network Security Protocols - IPSec (encrypts the data public key locks and unlocks data Prevents a data tampering)
.TC CN Device Network Security Protocols - IPSec (Transport mode - message portion is encrypted)
.TC CN Device Network Security Protocols - IPSec (tunnel mode - entire packets is encrypted)
.TC CN Device Network Security Protocols - L2TP (layer 2 tunneling protocol)
.TC CN Device Network Security Protocols - L2TP (combintion of Cisco's layer 2 forwarding and PPTP) (using digital certificates)
.TC CN Device Network Security Protocols - L2TP (authenicates both the computer and user) (Prevents a data tampering during authenicates  process)
.TC CN Device Network Security Protocols - L2TP (prevents 'man-in-the-middke' attack)
.TC CN Device Network Security Protocols - SSL   (Secure Sockets layer) (protocol that provides security on the internet)
.TC CN Device Network Security Protocols - SSL   (use public key encryption) (commonly associated with HTTP:80)
.TC CN Device Network Security Protocols - SSL   (https://www.shopping.com) (on web browser)
.TC CN Device Network Security Protocols - SSL - 3way - Authenticates the server
.TC CN Device Network Security Protocols - SSL - 3way - Authenticates the client
.TC CN Device Network Security Protocols - SSL - 3way - Encrypts the data
.TC CN Device Network Security Protocols - TSL  (transport layer securoty)
.TC CN Device Network Security Protocols - TSL  (the lastes industry standurd SSL protocol - its the successor to SSL)
.TC CN Device Network Security Protocols - TSL  (Authenticates the server -- Authenticates the client -- Encrypts the data)
.TC CN Device Network Security Protocols - TSL (made up of 2 layers) (TLS Record Protocol) (provides connection security by making sure the connection is private and reliable)
.TC CN Device Network Security Protocols - TSL (made up of 2 layers) (TLS HandShake Protocol) (allows the server and client to authenicatione each other and negotiate an encryption algortim ..)
.TC CN Device Network Security Protocols - TSL (made up of 2 layers) (TLS HandShake Protocol) (and cryptographic keys before data is sent)
.TC CN Device Network Security Protocols - TSL (more safer and secured from SSL)
.TC CN Device Network Security Protocols - TSL 802.1x (used for both wired and wireless networks)
.TC CN Device Network Security Protocols - TSL 802.1x (controls network access by ports)
.TC CN Device Network Security Protocols - TSL 802.1x (Port based authentication) (control network access by Ports)
.TC CN Device Network Security Protocols - TSL 802.1x (port open or close to client)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Security tunneling protocol - PPTP
.TC CN Device Network Security tunneling protocol - L2TP
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network cryptographic protocol TLS (Transport Layer Security) (IP_TCP model not OSI model)
.TC CN Device Network Handshake protocols.
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Media Converter (convert in Network) (fibre to internet)
.TC CN Device Network Modem DOCSIS (handle incoming out coming data signals(internet video voice))
.TC CN Device Network Protocols Spanning tree (prevent unnessery trafic over net) (loops happen in network?) (ping*)
.TC CN Device Network Gateway (join two networks together) (with diffrent or imcompatible comunication protocols) (not change data,onyu changes format of data)(simple singal to diffrent one)(wave format)
.TC CN Device Network CSU/DSU (channel service unit / data service unit) (about size of modem) (lan to wan) (data format from lan to wan data format) (signals)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network - soho routers- ('Small Office / Home Office' router)
.TC CN Device Network - soho routers, wifi encryption
.TC CN Device Network - soho routers- easy to setup to network (router setting webBrowser) (192.168.2.1) (router configuration)
.TC CN Device Network - soho routers- DHCP server build in --
.TC CN Device Network - soho routers- wireless setting - SSID - (visble to other wireless conncetors)
.TC CN Device Network - soho routers- wireless setting - Chanel (specifie to signal chanels-over masking)
.TC CN Device Network - soho routers- wireless setting - Security - WEP (Wired Equivalent privacy) (tunel) (40 bit encription) (not secure easable hacable)
.TC CN Device Network - soho routers- wireless setting - Security - WPA (WI_FI Protected Access)(bether security than WEP) (strong encription using TKIP(Terminal key integrity Protocol))
.TC CN Device Network - soho routers- wireless setting - Security - WPA (use EAP (extensible Authentiocation protocol) verify authority password to connect)
*.TC CN Device Network - soho routers- wireless setting - Security - WPA2  (WI_FI Protected Access) (stronger than WPA) (bether encription method) 
.TC CN Device Network - soho routers- wireless setting - Security - WPA2 (uses CCMP(counter cipher mods w. block chaining message authenication code protocol) for encription)
.TC CN Device Network - soho routers- wireless setting - Security - WPA2 (CCMP encapsulation crypto graphic mechanism)
.TC CN Device Network - soho routers- wireless setting - Security - WPA2 2006 -- all certifed Wi-Fi hardware since 2006
.TC CN Device Network - soho routers- wireless setting - Security - WPA2 -personal    
.TC CN Device Network - soho routers- wireless setting - Security - WPA2 -enterprise 
.TC CN Device Network - soho routers- wireless setting - Security - RADIUS (Remote Authenication dial-in service)(*.TC CN Device Network Authentication Protocols Radius) 
.TC CN Device Network - soho routers- wireless setting - Security - WPA2 Mixes  
.TC CN Device Network - soho routers- wireless setting - Security - WPS  --- (wi-fi protected setup) button on modem or mothem web page - or pin number of modem,
.TC CN Device Network - soho routers- wireless setting - Security - MAC Filter - MAC Address on (mac filter) (hexadecimal)(every device has mac address) (block to join or allow to join)
.TC CN Device Network - soho routers- wireless setting - Security - DMZ (DeMilitarized Zone) (allows a designated computer exposed to internet) (out side firewall)(NOT PROTECTED)(testing purposes)
.TC CN Device Network - soho routers- wireless setting - Security - DMZ (test firewall setting) (static ip address must nor dhcp)
.TC CN Device Network - soho routers- wireless setting - Security - Port (forwarding) cutumise port sevices for certain application
.TC CN Device Network - soho routers- wireless setting - Security - Port (RDP:3389)( remote access) (eanable Per to per (PEP) conncetion) (allow to witch connect)
.TC CN Device Network - soho routers- wireless setting - Security - Guest (Guest Network) (seprate wireless network that guest can access network that built into a wireless router)
.TC CN Device Network - soho routers- wireless setting - Security - Guest (use host SSID but the password is diffrent and limited to add)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network- Utilites - Ping (send 4 data packet to destination)(reply 4 data packet to sender) (time to reply speed) 
.TC CN Device Network- Utilites - Ping 	reply 	from 	host ip    	bytes = 32 	time=22ms   	ttl = 47
.TC CN Device Network- Utilites - Ping 	reply 	from 	host ip    	bytes = 32 	time=22ms   	ttl = 47
.TC CN Device Network- Utilites - Ping 	reply 	from 	host ip    	bytes = 32 	time=22ms   	ttl = 47
.TC CN Device Network- Utilites - Ping 	reply 	from 	host ip    	bytes = 32 	time=22ms   	ttl = 47
.TC CN Device Network- Utilites - Ping 		Packets sent =4  	recived = 4 , lost = 0
.TC CN Device Network- Utilites - Ping --- resust time out (no conncetion - or block)
.TC CN Device Network- Utilites - Ping --- destionation host inreachable
.TC CN Device Network- Utilites - Ping --- test dns 
.TC CN Device Network- Utilites - Ping --- Ping /? ---parameters.
.TC CN Device Network- Utilites - PathPing ---(combines the fuctionality of the ping and tracert) (show detiles of path a data packet takes between to devices)(and ping like statistics)
.TC CN Device Network- Utilites - PathPing =======================================================
.TC CN Device Network- Utilites - PathPing 	www.google.com   (0 to destination packet go)
.TC CN Device Network- Utilites - PathPing 	Microsoft Windows [Version 10.0.19044.1466]
.TC CN Device Network- Utilites - PathPing 	(c) Microsoft Corporation. All rights reserved.
.TC CN Device Network- Utilites - PathPing 	C:\WINDOWS\system32>pathping www.google.com 
.TC CN Device Network- Utilites - PathPing 	Tracing route to www.google.com [142.250.185.36] ISP	Google Cloud Network class	Class B Address type Public
.TC CN Device Network- Utilites - PathPing 	over a maximum of 30 hops:
.TC CN Device Network- Utilites - PathPing 	  0  DESKTOP-mine [192.168.38.140] Address type Private 	Network class Class C
.TC CN Device Network- Utilites - PathPing 	  1  192.168.38.219
.TC CN Device Network- Utilites - PathPing 	  2     *        *        *     (ifirewall block PathPing command)
.TC CN Device Network- Utilites - PathPing 	Computing statistics for 25 seconds...
.TC CN Device Network- Utilites - PathPing		    Source to Here   This Node/Link
.TC CN Device Network- Utilites - PathPing 	Hop  RTT    Lost/Sent = Pct  Lost/Sent = Pct  	Address
.TC CN Device Network- Utilites - PathPing 	 0                                          		 DESKTOP-mine  [192.168.38.36]
.TC CN Device Network- Utilites - PathPing 	                 0/ 100 =  0%   			|
.TC CN Device Network- Utilites - PathPing 	 1    4ms     0/ 100 =  0%     0/ 100 =  0%  	192.168.38.199
.TC CN Device Network- Utilites - PathPing	Trace complete.
.TC CN Device Network- Utilites - PathPing =======================================================
.TC CN Device Network- Utilites - ARP PING (if firewall block all Ping command request)(you can use it instead)
.TC CN Device Network- Utilites - ARP PING (the ARP Ping command uses ARP data Packets to ping network devices)
.TC CN Device Network- Utilites - ARP PING (firewalls will not block any ARP data. because ARP data is never blocked or should be never blocked on a LAN(hardwarly))
.TC CN Device Network- Utilites - ARP PING (never block)
.TC CN Device Network- Utilites - ARP PING (cannot be used on the internet because the data is not routable, so it only works on a LAN)
.TC CN Device Network- Utilites - TraceRoute --- (tracert)  (when ping fail can trace to know where it brock) (find out exact path data gone thrwo network)
.TC CN Device Network- Utilites - TraceRoute --- (tracert)  --- ther staion router to by pass (to finde data packt latly reach in destination)
.TC CN Device Network- Utilites - TraceRoute --- (tracert) (if ping comment faild to know where its stopped)
.TC CN Device Network- Utilites - TraceRoute --- (tracert)   	  Latitude: 35.1161---- Longitude: 51.2331 ----City: -----Region: ----Country Code: IR -----Country: Iran, Islamic Republic of----- Host name: 10.71.72.5--- IP Information - 10.71.72.5
.TC CN Device Network- Utilites - TraceRoute --- (tracert) (tracert www.googel.com)
.TC CN Device Network- Utilites - TraceRoute --- (tracert)======================================================= 83.121.170.241
.TC CN Device Network- Utilites - TraceRoute --- (tracert)	Tracing route to www.google.com [142.250.185.36]
.TC CN Device Network- Utilites - TraceRoute --- (tracert)	over a maximum of 30 hops:
.TC CN Device Network- Utilites - TraceRoute --- (tracert)  	 1     6 ms     6 ms     2 ms  192.168.38.36				(Start)				Address type-Private 	Network class-Class C ---
.TC CN Device Network- Utilites - TraceRoute --- (tracert)  	 2     *        *        *     Request timed out.				(iran)				Address type-Private 	Network class-Class B	
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	 3   119 ms    44 ms    32 ms  10.71.72.21     			 	(iran)				Address type-Private 	Network class-Class A
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	 4    61 ms    26 ms    52 ms  10.71.72.5	 			(iran)				Address type-Private 	Network class-Class A
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	 5    79 ms    34 ms    42 ms  10.71.73.37	 			(iran)				Address type-Private 	Network class-Class A
.TC CN Device Network- Utilites - TraceRoute --- (tracert)  	 6    71 ms    47 ms    93 ms  10.71.69.65	 			(iran)				Address type-Private 	Network class-Class A
.TC CN Device Network- Utilites - TraceRoute --- (tracert)  	 7    61 ms   113 ms    97 ms  10.71.69.98	 			(iran)				Address type-Private 	Network class-Class A
.TC CN Device Network- Utilites - TraceRoute --- (tracert)  	 8    50 ms   124 ms    43 ms  10.0.251.202	 			(iran)				Address type-Reserved	Network class-Class A	
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	 9    42 ms    35 ms    48 ms  10.0.60.75	 			(iran)				Address type-Private 	Network class-Class A
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	10    80 ms    37 ms    71 ms  10.180.68.196	 			(iran)				Address type-Private 	Network class-Class A
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	11    47 ms    34 ms    39 ms  10.180.68.131	 			(iran)				Address type-Private 	Network class-Class A
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	12    64 ms    38 ms    39 ms  10.0.90.1	 				(iran)				Address type-Private 	Network class-Class A
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	13    32 ms    53 ms    77 ms  10.202.6.66	 			(iran)				Address type-Private 	Network class-Class A
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	14    87 ms    41 ms    36 ms  10.21.41.12	 			(iran)				Address type-Private 	Network class-Class A
.TC CN Device Network- Utilites - TraceRoute --- (tracert)	15    67 ms    76 ms    73 ms  10.41.111.20	 			(iran)				Address type-Private 	Network class-Class A
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	16    93 ms    90 ms   271 ms  134.0.220.186	 			(Oman 	 ISP Omantel)  		Address type-Public		Network class-Class B   
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	17    77 ms    81 ms    78 ms  213.202.5.239	 			(Oman 	 ISP Omantel)		Address type-Public		Network class-Class C
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	18    75 ms    77 ms    80 ms  216.239.48.87	 			(The United States Google)    	Address type-Public		Network class-Class C
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	19    88 ms    86 ms    76 ms  142.251.48.1	 			(The United States Google)		Address type-Public	 	Network class-Class B
.TC CN Device Network- Utilites - TraceRoute --- (tracert) 	20   107 ms    61 ms    78 ms  mct01s19-in-f4.1e100.net [142.250.185.36]	(The United States Google Cloud)	Address type-Public	 	Network class-Class B
.TC CN Device Network- Utilites - TraceRoute --- (tracert)	Trace complete.
.TC CN Device Network- Utilites - TraceRoute --- (tracert)=======================================================
.TC CN Device Network- Utilites - Nbtstat (resolve Netbios names to IP address you where uset on the network)	
.TC CN Device Network- Utilites - Nbtstat  (Nbtstat -s) (show IP address of nodes)
.TC CN Device Network- //----------------------------------------------------------------
.TC CN Device Network- Utilites - ARP (address resolution protocol) (over CMD (convert IP to Mac address))
.TC CN Device Network- Utilites - ARP  Interface: 172.27.144.1 --- 0x1a     Internet Address      Physical Address      Type     
.TC CN Device Network- Utilites - ARP (show wi thch ip address match mac address in cash)	      172.27.159.255        ff-ff-ff-ff-ff-ff         static
.TC CN Device Network- Utilites - ARP (ARP -a)
.TC CN Device Network- //----------------------------------------------------------------
.TC CN Device Network- Utilites - NetStat - (show net information) (curent network connection)
.TC CN Device Network- Utilites - NetStat  (NetStat -a) (active connection who is stablish or lisning by which port)
.TC CN Device Network- //----------------------------------------------------------------
.TC CN Device Network- Utilites - Ipconfig   (IP address ,Subnet mask ,Default Gateway) (Gateway means router IP)
.TC CN Device Network- Utilites - Ipconfig (Ipconfig /all) (switch) (display full TCP/IP configuration)
.TC CN Device Network- Utilites - Ipconfig /renew(switch) (relase and renew IP address lease)
.TC CN Device Network- Utilites - Ipconfig /relaese (just release ip address)
.TC CN Device Network- Utilites - Ifconfig /relaese (just release ip address)      (unix and linux)
.TC CN Device Network- //----------------------------------------------------------------
.TC CN Device Network- Utilites - Nslookup /dig  (dig for unix)
.TC CN Device Network- Utilites - Nslookup - DNS  (name server Lookup)
.TC CN Device Network- Utilites - Nslookup www.yahoo.com //-- dns information
.TC CN Device Network- Utilites - Physical Address (mac address) 
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network- Networking - Issues
.TC CN Device Network- Networking - Issues -Wired
.TC CN Device Network- Networking - Issues -Wirless
.TC CN Device Network- Networking - Issues -Wired -Media (pysical-linking-networking) layers copper cables (can become worn out or damaged)
.TC CN Device Network- Networking - Issues -Wired -Enviroments --- some efective device to copper wire signal
.TC CN Device Network- Networking - Issues -Wired -Media - lenght of cable to distance signal send
.TC CN Device Network- Networking - Issues -Wirless - factors - antenna type - Omni-directinal antenna (normal anten)
.TC CN Device Network- Networking - Issues -Wirless - factors - antenna type - directinal antenna (direct signal in one direction like diches)
.TC CN Device Network- Networking - Issues -Wirless - factors - interference (wire less mouse keyboard microware same channeling signal)
.TC CN Device Network- Networking - Issues -Wirless - factors - interference-building struct efect wireless signals (concrere walls - windows frame - metal studs)
.TC CN Device Network- Networking - Issues -Wirless - factors - Wrong Encryption - WPA2 (not suport older device to decrept as pysical decrypt signa;s)
.TC CN Device Network- Networking - Issues - Fiber Optic - (signal loss - wrongtype cabe - dirty connection - wavelenghth mismatches - fiber type mismatchaes -- connector missmatches -- exceeding bending limit -- exceeding cable lenght limitinf)
.TC CN Device Network- Networking - Issues - DHCP - (cant renew IP when chcp removed configuration - static or dynamics IP)
.TC CN Device Network- Networking - Issues - DHCP - (adding two dhcp to network) (ununiq IP issue)
.TC CN Device Network- Networking - Issues - DNS (resolve domain name to IP addrees) (if not have dns must type the IP address number instade of IP name)
.TC CN Device Network- Networking - Issues - Link LEDs (Light Emitting diode)(indicate that are used to tell us bace information about a network device)
.TC CN Device Network- Networking - Issues - Link LEDs  (green led (success connection blinking (goz chirpmak)))
.TC CN Device Network- Networking - Issues - Connectivity - Physical (link LEDs turn on)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network- Troubleshooting - Strategy - (Identify the symptoms and potential causes, gather information about the problem(what is the problem))
.TC CN Device Network- Troubleshooting - Strategy - (when did the problem occur, any specific error messages,does the problem happen all the time or intermittenntly?)
.TC CN Device Network- Troubleshooting - Strategy - (identify the affected area (is the problem isolated or spread across sevrall location ()stack problem basic and roads))
.TC CN Device Network- Troubleshooting - Strategy - (architectural problem) (if the problem affects everyone) (check the switch)
.TC CN Device Network- Troubleshooting - Strategy - (if the problem is isolated?) (check the invidual cable) (save alot of time rebuilding)
.TC CN Device Network- Troubleshooting - Strategy - (establish wat has changed) (dis any thing change just prior to the problem happening?)
.TC CN Device Network- Troubleshooting - Strategy - (establish wat has changed)(was there any hardware removed or added?)
.TC CN Device Network- Troubleshooting - Strategy - (establish wat has changed)(was there any software installed or unistalled?)
.TC CN Device Network- Troubleshooting - Strategy - (was anything downloaded from the internet (users-applications))
.TC CN Device Network- Troubleshooting - Strategy - (select the most probable cause)(look for simple solutions frist)
.TC CN Device Network- Troubleshooting - Strategy - (does the device have power?)
.TC CN Device Network- Troubleshooting - Strategy - (Are the cables plugged in?)
.TC CN Device Network- Troubleshooting - Strategy - (Check the LEDs)
.TC CN Device Network- Troubleshooting - Strategy - (implent an acction plan and solution including potential effects)
.TC CN Device Network- Troubleshooting - Strategy - (the caution phase) (must know what effect the action will have on the network)
.TC CN Device Network- Troubleshooting - Strategy - (will it affect the entire network or be isolated at one area?)
.TC CN Device Network- Troubleshooting - Strategy - (test the result) (where you take action to solve the problem)
.TC CN Device Network- Troubleshooting - Strategy - (test the result)(where you will know if your plan of acction will solve the problem or not)
.TC CN Device Network- Troubleshooting - Strategy - (identify the results and effects of the solution)(hasyour plant of acction solved the problem or not)
.TC CN Device Network- Troubleshooting - Strategy - (identify the results and effects of the solution)(what effect did it have on everyone elese ()by scope of model and layers)
.TC CN Device Network- Troubleshooting - Strategy - (identify the results and effects of the solution)(do the results show a temprorary fix or a permanent one?)
.TC CN Device Network- Troubleshooting - Strategy - (document the solution and process)(save solution to do again if happen) (document the problem )
.TC CN Device Network- Troubleshooting - Strategy - (document the solution and process)(document what caused the problem)
.TC CN Device Network- Troubleshooting - Strategy - (document the solution and process) (document the solution and process)(document how the problem was fixed)
.TC CN Device Network- Troubleshooting - Strategy - (document the solution and process)(dignosed and solve the problems as Network Administrator)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Tools & Safety 
.TC CN Device Network Tools - Wire Crimper tool (cables connect sockets)
.TC CN Device Network Tools - Punch down tool (wire to punchdown block)
.TC CN Device Network Tools - Media tester (test networking cables) (noise controling)
.TC CN Device Network Tools - Cable Striper (remove plasticshild cover)
.TC CN Device Network Tools - TDR (time-domain reflector) (peas of electronic equipment used ---to test cables---, such as unshielded twisted pair and coaxial cable)
.TC CN Device Network Tools - TDR (test done--- transmits a signal throgh the cable and then the signal through the cable and then the signal is reflected back) (IOOI)
.TC CN Device Network Tools - TDR (analised cables)(pinpoints if there are any problem)( conductor,loose connectors,shorts,crimps,bends,,and so on)
.TC CN Device Network Tools - OTDR (Optical time-domain reflector) (same fuction as TDR) (used on fiber-optic cable) (stand for transmits light through the cable)
.TC CN Device Network Tools - OTDR (to detect problems of conncetion (lights signals chain))
.TC CN Device Network Tools - Multimeter (test electricl circuit)(madars) (--voltage - resisdence -- current-- ) (VRI) (analog digital version)
.TC CN Device Network Tools - Butt Set (device resemble telephone to minitore telephone lines) (conversation throw the telephone lines topology) (such as nse or somsing simpler)(dialTone)
.TC CN Device Network Tools - Voltage Event Recorder (device that is used to collect data about the quality of electrical power)
.TC CN Device Network Tools - Voltage Event Recorder (insert to line sockets to checks)(electrical sages,swales,variation,frequency)
.TC CN Device Network Tools - Voltage Event Recorder (comse with software to install and monitore data power quality downloaded and analyzed)
.TC CN Device Network Tools - Tone Generator  (fax and hund) (loacte cable to onehand to other)(over long distance) (detect over long)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Tools & Safety - Protocol Analyzer (software or hardware tool)
.TC CN Device Network Tools & Safety - Protocol Analyzer (also known as a packet Sniffer)
.TC CN Device Network Tools & Safety - Protocol Analyzer (software or hardware tool that is used to troubleshoot and analyze traffic on a network)
.TC CN Device Network Tools & Safety - Protocol Analyzer (LOGS,DATA PACKETS,BROADCASTS,..)
.TC CN Device Network Tools & Safety - Protocol Analyzer (detects network problems, intrusion attemps, and monitores networking issues)
.TC CN Device Network Tools & Safety - Protocol Analyzer (acommon protocol analyzer is called WireShark, available at wireshark.org )
.TC CN Device Network Tools & Safety - AntiVirus (software) (a virus is harmful program writen to all to the computer oprators)(users dont kno viurus)
.TC CN Device Network Tools & Safety - AntiVirus (transferes over internet)(websites,downloadble programs,Emails)
.TC CN Device Network Tools & Safety - AntiVirus (not detected and not remove caused ciruous damage in a network)
.TC CN Device Network Tools & Safety - AntiVirus (guard your pc and need update) (scan requlare time)  
.TC CN Device Network Tools & Safety - ESD (ElectroStatic Discharge) (damage to device) (to object with oposite charge)
.TC CN Device Network Tools & Safety - ESD (waer an ESD wrist Strap to prevent electrostatic discharge)
.TC CN Device Network Tools & Safety - ESD mat (ESD mat removes any electrical charge from the components that are placed on it)
.TC CN Device Network Tools & Safety - MSDS (material safety data sheet) (keep computer equipment contains lead and mercury that is harmful to the enviroments )
.TC CN Device Network Tools & Safety - TIPS (Safety) (power of and un plug device)
.TC CN Device Network Tools & Safety - TIPS (Safety) (ring metals electric sharge)
.TC CN Device Network Tools & Safety - TIPS (Safety) (fire water)
.TC CN Device Network Tools & Safety - TIPS (Safety) (cable managment) (channal in ducts) (not every where)
.TC CN Device Network Tools & Safety - TIPS (Safety) (heavy lifting not by body)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Cloude & Virtualization - Virtualization (03:46:50)(compTIA Network Certification video coures)
.TC CN Device Network Cloude & Virtualization - (virtual Servers)(use other OS in one OS) (traditional way a bussinerss operates) (expensive)
.TC CN Device Network Cloude & Virtualization - (virtual Servers)(one server) (diffrent OS ande service on on server) (WEB Server, Email Server, Databases)
.TC CN Device Network Cloude & Virtualization - (virtual Servers)(one server) (run side by side on one server) (save money) (easy maintance and managements)
.TC CN Device Network Cloude & Virtualization - (virtual Servers)(one server) (virtual Servers)
.TC CN Device Network Cloude & Virtualization - (virtual Switch)(software switch) ((virtual Servers) communicate each other)
.TC CN Device Network Cloude & Virtualization - (virtual Router))(software)(just like phisical router)(handel to create network over routers to test) (there is two connection and two time pass in) (virtual Router)(to detect it is virtual or not)
.TC CN Device Network Cloude & Virtualization - (virtual Firewall))(software)(monitor trafic)
.TC CN Device Network Cloude & Virtualization - Cloude Computing (refers to data and applications being stored and run on remote servers rather than being on your lockal computer)
.TC CN Device Network Cloude & Virtualization - Cloude (back in "the old days" Example Email) (need to own your phisical email server to recive emails and Oprator System and email software like microsoft exchange)
.TC CN Device Network Cloude & Virtualization - Cloude (maintance is hard to keep alwayse run)
.TC CN Device Network Cloude & Virtualization - Cloude Computing Email  (gmail,hotmail) (software)
.TC CN Device Network Cloude & Virtualization - Cloude Computing Productivity Software (git hub) (software)
.TC CN Device Network Cloude & Virtualization - Cloude Computing Web Servers (software)
.TC CN Device Network Cloude & Virtualization - Cloude Computing Databases (software)
.TC CN Device Network Cloude & Virtualization - Cloude Computing (3 diffrent Type of  Cloude Computing )
.TC CN Device Network Cloude & Virtualization - Cloude Computing -Type IAAS   (Infrastructure as a service)
.TC CN Device Network Cloude & Virtualization - Cloude Computing -Type PAAS  (Platform as a Service)
.TC CN Device Network Cloude & Virtualization - Cloude Computing -Type SAAS  (Software as a Service) (get data and back it)(like any other devices)
.TC CN Device Network Cloude & Virtualization - Cloude Computing -Type IAAS   (3rd Party do as server (Servers,Storage,Networking,Virtualization))
.TC CN Device Network Cloude & Virtualization - Cloude Computing -Type IAAS   (do as you Application , Data, OpratingSystem,MiddleWare,Runtime)
.TC CN Device Network Cloude & Virtualization - Cloude Computing -Type IAAS   (Amazone web services) (WEB 1)
.TC CN Device Network Cloude & Virtualization - Cloude Computing -Type PAAS  ((has more control)3rd Party do as server(Servers,Storage,Networking,Virtualization)+(OpratingSystem,MiddleWare,Runtime))
.TC CN Device Network Cloude & Virtualization - Cloude Computing -Type PAAS  (do as you Application , Data)
.TC CN Device Network Cloude & Virtualization - Cloude Computing -Type PAAS  (microsoft Asure) (as WEB 3 )
.TC CN Device Network Cloude & Virtualization - Cloude Computing -Type SAAS (all gone 3rd Party do as server) (if you connected internet can access the enviroments) 
.TC CN Device Network Cloude & Virtualization - Cloude Computing -Type PAAS  ((has Full control)3rd Party do as server(Servers,Storage,Networking,Virtualization)+(Application , Data,OpratingSystem,MiddleWare,Runtime))
.TC CN Device Network Cloude & Virtualization - Cloude Computing -Type PAAS  (google apps) (WEB 2) (GMAIL,TRANSLATE,Google MAP ,...)
.TC CN Device Network Cloude & Virtualization - NAS (Network Attached Storage) (storage device) (strictly store data) (centralized storage devce for storing data on a network)
.TC CN Device Network Cloude & Virtualization - NAS (will have multiple hard derives in a RAID configuration)
.TC CN Device Network Cloude & Virtualization - NAS (Directly attaches to a switch or reouter on a network) (4share.com)(google storage)
.TC CN Device Network Cloude & Virtualization - NAS (data accesed over network)
.TC CN Device Network Cloude & Virtualization - NAS (can be accessed from network devices thrpough a shared folder) (SMB service of router USB to connect Storage on router)
.TC CN Device Network Cloude & Virtualization - SAN (storage area network)
.TC CN Device Network Cloude & Virtualization - SAN (a special,high speed network that stores and proviced access to large ampunt of data)
.TC CN Device Network Cloude & Virtualization - SAN (servers access this data as of ot was alocal hard drive)
.TC CN Device Network Cloude & Virtualization - SAN (SAN is independly from servers - Os detect SAN)
.TC CN Device Network Cloude & Virtualization - SAN (store multiple area) (use raid system to back up)
.TC CN Device Network Cloude & Virtualization - SAN (high speed network) (any devices are interconnected with fiber channel(speed starting at 2000 Mbits)(250MBs))
.TC CN Device Network Cloude & Virtualization - SAN (alternative to fiber channel is (iSCSI(internet Small Computer System Interface)))
.TC CN Device Network Cloude & Virtualization - SAN iSCSI(which as an alternate to using Fibre Channel) (data storage protocol that transport iscsi request over standard TCP-IP) 
.TC CN Device Network Cloude & Virtualization - TRANSPORT vs TRANSFORM (use Transform to know is real copy or not then transport to enviroments)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->-
.TC CN Device Network Models OSI (Open Systems InterConnect) (set of standards) (send:get)
.TC CN Device Network Models OSI  (how information from softwares in o ne Computer Moves throw aNework to rich software in next or another computer)
.TC CN Device Network Models OSI Test to communication is available by 7 layer (dose the huge task of data communication)
.TC CN Device Network Models OSI giving control of data bing set, from one layer to another (start from physicals)
.TC CN Device Network Models OSI ((convert from base HOST source) 	    (Binaries__DataFrom__Sent)__APPLICATION_to_PHYSICAL__(analog signal_|_digital signal__DataFrom__Sent)
.TC CN Device Network Models OSI ((convert from Destination HOSTsource)   (analog signal_|_digital signal__DataFrom__Get)__PHYSICAL _to_APPLICATION__ (Binaries__DataFrom__Get)
.TC CN Device Network Models OSI ====>>>>+===============================+(data idecreased in set by each layer) (APPLICATION_==_1KB_)_>_(PHYSICAL_==_7KB_==_1KB+6KB_)
.TC CN Device Network Models OSI ====>>>>| ReturnType	FuncName(FuncParam);	|(data increased in set by each layer)  (PHYSICAL_==_7KB_==_1KB+6KB_)_>_(APPLICATION_==_1KB__==7KB-6KB_)
.TC CN Device Network Models OSI ====>>>>| PHYSICAL 	OSI_Sent(APPLICATION);++	|7Layer pass
.TC CN Device Network Models OSI ====>>>>| APPLICATION	OSI_Get(PHYSICAL);--	|Data Flows  over OSI
.TC CN Device Network Models OSI ====>>>>+===============================+(stack order) (Topological-ninity(45~=4+5~=9)(45deg,90deg,180deg,360deg,...))
.TC CN Device Network Models OSI-1- PHYSICAL   		(machine type_6Bit_)   (deal with 9 (goBack(Sevenity)-goForward(Sevenity),puseBack(Sevenity)-puse(Sevenity)-puseForward(Sevenity),StopBack(Sevenity)-StopForward(Sevenity)))    	(ninity)(dokuz logic)				                            (8,7,6,5,4,3,2,1,0)~=(-4,-3,-2,-1,0,1,2,3,4)
.TC CN Device Network Models OSI-1- PHYSICAL   		(machine type_3Bit_)   (deal with 7 (goBack-goForward,puseBack-puse-puseForward,StopBack-StopForward))    								(Sevenity)(yetti logic)				              (6,5,4,3,2,1,0)~=(-3,-2,-1,0,1,2,3)
.TC CN Device Network Models OSI-1- PHYSICAL   		(machine type_3Bit_)   (deal with 5 (goBack-goForward -puse-StopBack-StopForward))    											(Finary)(Fuzzy logic)						(4,3,2,1,0)~=(-2,-1,0,1,2)
.TC CN Device Network Models OSI-1- PHYSICAL   		(machine type_2Bit_)   (deal with 3 (go-puse-Stop))            													(trinity) 			 				(2,1,0)~=(-1,0,1)
.TC CN Device Network Models OSI-1- PHYSICAL   		(machine type_1Bit_)   (deal with 2) (go-stop)															(Binary)(Bit) 			 	 (2^1bit	(0bF)	(1,0)~=(-1,1)         (layer define the network standards and physical characteristics of network) (such as connectors, media type, cables,voltages,etc) (define the topology of network) (star,bus,Ring,Mesh(over baseServices))
.TC CN Device Network Models OSI-2- DATA LINK  		(machine type_1Bit_)   (deal with Packets_to_Binaries) 														((2)(DoubleElementbit)anybitFormToSingleBit)  	 (2^2bit)	(0qF)	(a[4])		(responsble to sending data to physical layer)(casting and sending)(voide,bool,int,long,double,string,complext type(struct and classes)) (data packets are encoded and decoded into bits) (handle flow control and frame synchronization)(divided into two sub-layer. the medi access (MAC) control layer and the Logical Link control (LLC)layer)
.TC CN Device Network Models OSI-3- NETWORK		(machine type_2Bit_)   (deal with Device_address)															((4)QuadElementbit)  		 	(2^3bit)	(0oFFFF)	(a[8]a[8]a[8]a[8])	(layer responsible for routing the data packets based on its logical IP address) (fragments and reAssembles the Packets) (instruct data on how to find its ultimate destination)
.TC CN Device Network Models OSI-4-TRANSPORT		(machine type_3Bit_)   (deal with Packets_destination)														((8)OctElementbit) 		 		(2^3bit)	(0oF)	(a[8])		(provide transfer of data between end users)(responsible for resending any packets that do not received an acknowledgement from ther destination)	(layer canguruntee that packets are resived)			
.TC CN Device Network Models OSI-5-SESSION		(machine type_4Bit_)   (deal with Traffic_dialogs)															((16)HexElementbit)		 	(2^4bit)	(0xF)	(a[16])           	(octed IP address) (control dialog during communication) (hand to speek) (establishes,manage,terminate the connection (who on the roll of sense)))(betweenin(||) local and remote application)(Traffic Cop (police))(direct network traffic)	
.TC CN Device Network Models OSI-6-PRESENTATION 	(machine type_8Bit_)   (deal with Data_form_for_Network)														((256)DoubleHexElementbit)	 		(2^8bit) (0xFF)	(a[256])      	(can be sent over a network) (car-bus-)(on road) (generics convert data form)(layer manage data Form to can be sent over network) ((DATA)compresed and decompressed)(decrypt or encrypted) (translation layer)
.TC CN Device Network Models OSI-7-APPLICATION		(machine type_16Bit_) (deal with application) 															((65,536)QuadHexElementbit)	 	(2^16bit) (0xFFFF)	(a[65,536])   	(manage communication) (Email_HTTP_FTP)(protocols)((higher level _dataForm_)(machines)(humans)people can read) broadcasted thwo systems  
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Network Optimization & Fault tolerance - (02:52:30)(CompTIA Network Certification video Coures)
.TC CN Device Network Optimization & Fault tolerance - BandWidth Shaper ABC *--- ___________________*---*---*--- 	A
.TC CN Device Network Optimization & Fault tolerance - BandWidth Shaper ABC *--  ---------------------------------*--*--*--    	B  filtering by priory 
.TC CN Device Network Optimization & Fault tolerance - BandWidth Shaper ABC *-   ___________________*-*-*-	C
.TC CN Device Network Optimization & Fault tolerance - BandWidth Shaper (used to control network traffic) (high priority) (Medium priority) (Low priority) (control transmition levels)
.TC CN Device Network Optimization & Fault tolerance - BandWidth Shaper (high priority) 		(Upload-Download limites  	import data)	(small BandWidth)		(OSI-1- PHYSICAL )
.TC CN Device Network Optimization & Fault tolerance - BandWidth Shaper (high priority) 		(Upload-Download limite) 	import data	(small BandWidth)		(OSI-2- DATA LINK)
.TC CN Device Network Optimization & Fault tolerance - BandWidth Shaper (high priority) 		(Upload-Download limite) 	import data	(small BandWidth)		(OSI-3- NETWORK)
.TC CN Device Network Optimization & Fault tolerance - BandWidth Shaper (Medium priority)	(Upload-Download limite) On lessimport data	(medium BandWidth)	(OSI-4- TRANSPORT)
.TC CN Device Network Optimization & Fault tolerance - BandWidth Shaper (Medium priority)	(Upload-Download limite) On lessimport data	(medium BandWidth)	(OSI-5- SESSION)
.TC CN Device Network Optimization & Fault tolerance - BandWidth Shaper (Low priority) 		(Upload-Download limite) On lessimport data	(Large BandWidth)		(OSI-6- PRESENTATION)
.TC CN Device Network Optimization & Fault tolerance - BandWidth Shaper (Low priority) 		(Upload-Download limite) On lessimport data	(Large BandWidth)		(OSI-7- APPLICATION)
.TC CN Device Network Optimization & Fault tolerance - Traffic Shaper (simmilar to what a BandWidth Shaperdoes)
.TC CN Device Network Optimization & Fault tolerance - Traffic Shaper (Prioritizes applications and guarantees bandwidth for more important services)
.TC CN Device Network Optimization & Fault tolerance - Traffic Shaper (garranties more BandWidth for more important services)
.TC CN Device Network Optimization & Fault tolerance - Load Balancer (peas of hardware or software) (used to distribute data activities coross a network)
.TC CN Device Network Optimization & Fault tolerance - Load Balancer (no single server or computer becomes overround with workload)
.TC CN Device Network Optimization & Fault tolerance - Load Balancer (if one of server get more network activities from others to resolve this need to add load balancers (both servers are sharing the network activity evently (by event handler)))
.TC CN Device Network Optimization & Fault tolerance - QoS (quality of service) (in computer networking, this is a term that is used to provide a guarantee of data delivery within a certain period of time)
.TC CN Device Network Optimization & Fault tolerance - Port Blocking (way to security to a network)(done on the firewall as network mainistrate manages ports depending on application)(http:80)(FTP:20)(email:110)(grate way to safe network - becarefut to not error or mistakley close port)
.TC CN Device Network Optimization & Fault tolerance - High Availability (term that used to guarantee a period of uptime of continual opration)
.TC CN Device Network Optimization & Fault tolerance - Fault tolerance - Power (storms and blackouts)
.TC CN Device Network Optimization & Fault tolerance - Fault tolerance - Power - UPS (uninterrupted Power Supply)(battry backup to make On) (runing battry power is electric is off)
.TC CN Device Network Optimization & Fault tolerance - Fault tolerance - Power - UPS (protect against searches and spikes (kivilcim)) 
.TC CN Device Network Optimization & Fault tolerance - Redundancy - Link  (having a continuous connection to the network in the event of a failure)
.TC CN Device Network Optimization & Fault tolerance - Redundancy - Link - ISDN (if you used broadband connection)(ISDN line as a backp)(if the broadband line gone faile)
.TC CN Device Network Optimization & Fault tolerance - Redundancy - Link - NIC(network interface card))(secondry NIC as a Backup)(stiil have connection)
.TC CN Device Network Optimization & Fault tolerance - services  - Backup - Standby server (a astandby server is secondry server with the exact cinfiguration as the primary)
.TC CN Device Network Optimization & Fault tolerance - services  - Backup - Standby server (backup server) (exact configuration of main server)(update from primary server )
.TC CN Device Network Optimization & Fault tolerance - services  - Backup - Server Clustering (server clustering is when a group of servers work together for load balancing and fault tolerance)
.TC CN Device Network Optimization & Fault tolerance - services  - Backup - Server Clustering (Fault tolerance & Load Balancing)
.TC CN Device Network Optimization & Fault tolerance - services  - Backup - Server Clustering (works best when servers are in diffrent geographical location)
.TC CN Device Network Optimization & Fault tolerance - services  - Backup - Server Clustering (one location faile not effect all system)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Disaster (fault tolerance can be defined as the perevention of data loss if a network component fails)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Disaster  by contnent
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Disaster  by contry
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Disaster  by language
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Disaster by nearby domain
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Disaster (DisasterRecovery is the process of rebuilding an organizations data after a disaster has happenn, such ass data loss )(recovery repaire line)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  Full
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  Incremental (increased)(last change copy data)(witch file has been changed)(cleare same when back up done)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  diffrential (diffrence of data from sorce sync)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  Full (copy to one tape) (not efficent for huge data amount)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  Incremental (includes all the data that has been changed since the last full or incremental backup)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  Incremental (every day backup tincreased)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  Incremental (every secound backup tincreased)(ethereum)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  Incremental - restore (need to do (FULL + Incrementals)data package) (nedd same order backuped nor noise)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  Incremental - restore (by time order changed)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  diffrential (includes all the data that has been changed since the last full backup) (every day off week)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  diffrential (backuped every day linked to last one) (vectore data)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  diffrential (diffrential backup does not clear the archive bit)
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  diffrential - restore  ((FULL + (the last)Diffrential))=Restored
.TC CN Device Network Optimization & Fault tolerance - services  - Recover - Type-  diffrential -(one base Full + One last diffrential) (even some delete or rename just apply last change to OneBaseFull backup)
.TC CN Device Network Optimization & Fault tolerance - services  - Storage - OffSite - (multi contry - negburehood location storage )
.TC CN Device Network Optimization & Fault tolerance - services  - Storage - SPARES - HOT - (as equipment that can be swapped out without the need of turning off the power)
.TC CN Device Network Optimization & Fault tolerance - services  - Storage - SPARES - HOT - (no need turnoff server to change hard drive)
.TC CN Device Network Optimization & Fault tolerance - services  - Storage - SPARES - COLD - (must turn off server to change devices like hard drive)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
.TC CN Device Chips (many Controler item)
.TC CN Device Chipset (centrilised) (BUS)(PathWay) bitwinElements (south bridge)to(north bridge) 66MHz (SendData Milion cycle per Secound) meanfaster
.TC CN Device Chipset (centrilised) (Fornt side BUS)(PathWay) (CPU to (north bridge))
.TC CN Device Chipset (centrilised)(control data flow)(cpu,bus slots,memory) (north bridge(cpu,memory,bus(PCI-E(AGP))))
.TC CN Device Chipset (centrilised)(control data flow)(cpu,bus slots,memory) (south bridge)(IDE,USB,SATA,PCI)
//------------------------------------------------------------------------
.TC CN Device Chipset BUS -  (BUS)(PathWay) bitwinElements (south bridge)to(north bridge) 66MHz (SendData Milion cycle per Secound) meanfaster
.TC CN Device Chipset BUS -  (Fornt side BUS)(PathWay) (CPU to (north bridge))
.TC CN Device Chipset BUS Slots - (locate Buttom of mother board) (expantion slots)
.TC CN Device Chipset BUS Slots - PCI (Peripheral Component InterConnect) 1993 (mothern bus type)
.TC CN Device Chipset BUS Slots - PCI (133-533 MBs)
.TC CN Device Chipset BUS Slots - PCI (32,64 bit data path)
.TC CN Device Chipset BUS Slots - PCIe (PCI Express)  (faster than PCI) (Up to 4GBs) (transfer data in serial)(succeder all other bus slots)(not backward compatible)
.TC CN Device Chipset BUS Slots - PCIe (PCI Express) (artichecture very diffrent)
.TC CN Device Chipset BUS Slots - PCIe (PCI Express) (x1 - one lane for data )(x4)(x8)(x16 (succeded for AGP video card))
.TC CN Device Chipset BUS Slots - miniPCI(Labtops)(with PCI converter)(32 bit ,33 MHz bus)
.TC CN Device Chipset BUS Slots - PCI-X (Extended) (64 bit bus) (backward compatible with standard PCI) (server & high speed compitures)
.TC CN Device Chipset BUS Slots - AGP (Accelerated Graphocs Port)(3D Computer Graphics) (faster than PCI)(only video card)(own pathway)
.TC CN Device Chipset BUS Slots - Sound Card
.TC CN Device Chipset BUS Slots - Grapgic Card
.TC CN Device Chipset BUS Slots - Tv uner Card
.TC CN Device Chipset BUS Slots - Network Card
//------------------------------------------------------------------------
.TC CN Device CPU - CPU Type (2bit,4bit,8bit,16bit,32bit,64bit) handle memory capsity
.TC CN Device CPU - CPU Type 32bit 4GB memory
.TC CN Device CPU - CPU Type 64bit 16ExaBytes memory
//------------------------------------------------------------------------
.TC CN Device CPU - CPU - 1968 Intel
.TC CN Device CPU - CPU - 1968 Intel 1970- 8086 (DIP(dual inline pakage))(40)pins
.TC CN Device CPU - CPU - 1968 Intel 1970- 80186 (PLCC) (68 to 132)pins
.TC CN Device CPU - CPU - 1968 Intel 1970 80486 (PGA) 168pins
.TC CN Device CPU - CPU - 1968 Intel 2004 Pentium 4 (LGA 775pins)(Max3.8 GHz)(188M 65 nm transistor)(FSB speed 1066 MTs)for Socket T
.TC CN Device CPU - CPU - 1969 AMD
.TC CN Device CPU - CPU - 1969 AMD 2019 Ryzen Threadripper (3000 series)
.TC CN Device CPU - CPU - 1969 AMD Ryzen 3000
.TC CN Device CPU - CPU - 1969 AMD Ryzen™ Threadripper™ PRO 3995WX Workstation Processors
//------------------------------------------------------------------------
.TC CN Device CPU - CPU Cashe
//------------------------------------------------------------------------
.TC CN Device CPU - CPU SOCKET - AMD 2009 SOCKET  AM3 (LGA 941)pins- 0x3AD hex () (Pin pitch; (mm) 2.5)
.TC CN Device CPU - CPU SOCKET - AMD 2014 SOCKET  FM2+(LGA 906)pins- 0xFFE hex
.TC CN Device CPU - CPU SOCKET - AMD 2017 SOCKET  sTRX4, SP3r3(LGA 4094)pins- 0x38A hex (Server)
.TC CN Device CPU - CPU SOCKET - AMD 2019 SOCKET  SP3r3(LGA 4094)pins- 0x38A hex (desktop)(-AMD Ryzen Threadripper (3000 series)-)
.TC CN Device CPU - CPU SOCKET - Intel 2004 SOCKET  T (LGA 775)pins- 0x307 hex (pentium4)
.TC CN Device CPU - CPU SOCKET - Intel 2008 SOCKET  B (LGA 1366)pins- 0x556 hex (corei7,xeon)
.TC CN Device CPU - CPU SOCKET - Intel 2009 SOCKET  H.H1 (LGA 1156)pins- 0x484 hex (corei3,corei5)
.TC CN Device CPU - CPU SOCKET - Intel 2011 SOCKET  R (LGA 2011)pins- 0x7DB hex (corei7,corei9)(sandy bridge.ivy bridge)
.TC CN Device CPU - CPU SOCKET - Intel 2011 SOCKET rPGA 988B (G2) (988)pins- 0x3DC hex (corei7)(ivy bridge) (2.5 GTs, 4.8 GTs)
//------------------------------------------------------------------------

//------------------------------------------------------------------------
.TC CN Device RAM 1998  nonDDR^-.-^_-_-_-
.TC CN Device RAM 1998 DDR (10ns) Double data rate   -^-_^-_
.TC CN Device RAM 1998 QDR Quad data rate
.TC CN Device RAM 1998 SDR Single data rate
.TC CN Device RAM 2001 DDR2 (Time 1.25ns - 5 ns per cycle)
.TC CN Device RAM 2001 DDR3 (12.8GBs by cpu speed) (5ns)(800MHz) Y580
.TC CN Device RAM 2020 DDR5 (2.5ns)(51.2 GBs per module)
.TC CN Device RAM -Buffer Ram (registerRAM)
.TC CN Device RAM -DIMM (Dual Inline Memory Module) desktops
.TC CN Device RAM -SODIMM (Small OutLine Dual Inline Memory Module) labtops
//------------------------------------------------------------------------
.TC CN Device Graphical RAM 2017 GDDR6 (19–21 Gbit.s)
.TC CN Device Graphical Displaying 1950s (Printing on paper) (every calculation steps over paper representing) (slower) 
.TC CN Device Graphical Displaying Technology Screen (properties)(Renderings  --- resolution ----- values  & register   --- Contrasts)
.TC CN Device Graphical Displaying Technology 1960s (CRTs (CATHODE RAY TUBES)) (in glass tube)(work by shots electrons at outer of inter cover screen(phosphor coating screen) by elecron gun) 
.TC CN Device Graphical Displaying Technology 1960s (CRTs (CATHODE RAY TUBES)) (the electrons hit the cover to glows for fraction in a secound )(electron charge particle )
.TC CN Device Graphical Displaying Technology 1960s (CRTs (CATHODE RAY TUBES)) (LeftToRight)(topTodown) in milli secound (the electron beams charge manipulate electro Magnetic fields) (stair electron to desire position (both left-right up-down))
.TC CN Device Graphical Displaying Technology 1960s (CRTs (CATHODE RAY TUBES)) Scanning Controler (ControlGraphic) - Vector Scanning(rendering)(driven the electron beams trace a shapes)
.TC CN Device Graphical Displaying Technology 1960s (CRTs (CATHODE RAY TUBES)) Scanning Controler (ControlGraphic) - Vector Scanning(rendering)(becaused the glope consisted for little bit)(frame)
.TC CN Device Graphical Displaying Technology 1960s (CRTs (CATHODE RAY TUBES)) Scanning Controler (ControlGraphic) - Vector Scanning(rendering)(if repeat path quicly enough to create shape glow (make solid image)) 
.TC CN Device Graphical Displaying Technology 1960s (CRTs (CATHODE RAY TUBES)) Scanning Controler (ControlGraphic) - Vector Scanning(rendering)(controler moved in vector position speedly)
.TC CN Device Graphical Displaying Technology 1960s (CRTs (CATHODE RAY TUBES)) Scanning Controler (ControlGraphic) - Vector Scanning(rendering)(in loop reportedly frame by frame)  30fps
.TC CN Device Graphical Displaying Technology 1980s (CRTs (CATHODE RAY TUBES)) Scanning Controler (ControlGraphic) - Raster Scanning(rendering)(scanning line by line)(solo frames)(repeatedly folowed fix path)
.TC CN Device Graphical Displaying Technology 1980s (CRTs (CATHODE RAY TUBES)) Scanning Controler (ControlGraphic) - Raster Scanning(rendering)(scanning line by line)(TopLeftToButtomRight)(looped over over again)(repeatedly_fllower_fixed_path)
.TC CN Device Graphical Displaying Technology 1980s (CRTs (CATHODE RAY TUBES)) Scanning Controler (ControlGraphic) - Raster Scanning(rendering)(return only electron beams to certain piont to create graphics)(this is call rast scanning)(little line segments)
.TC CN Device Graphical Displaying Technology 1980s (CRTs (CATHODE RAY TUBES)) Scanning Controler (ControlGraphic) - Raster Scanning(rendering)(this can display Shapes and even texts in little line segments) (LED Banner)
.TC CN Device Graphical Displaying Technology 1990s (LCDs (Liquid Crystal Displays) Scanning Controler (ControlGraphic) - Pixel Scanning(rendering)(use Raster Scanning for render RGBcrystal to update brightness of RGBpixels glow)(many time in secounds)
.TC CN Device Graphical Displaying Technology 1990s (LCDs (Liquid Crystal Displays) Scanning Controler (ControlGraphic) - Pixel Scanning(rendering)(render crystal(show RGB type by frequency charge) on the screen know pixels) (diffrent technology)
.TC CN Device Graphical Displaying Technology 1990s (LCDs (Liquid Crystal Displays) Scanning Controler (ControlGraphic) - Pixel Scanning(rendering) (Update RGB Element(pixels) (many time in secounds))
.TC CN Device Graphical Displaying Technology 1990s (LCDs (Liquid Crystal Displays) Scanning Controler (ControlGraphic) - Pixel Scanning(rendering) (CRTs Vector & Raster(not use pixels just use (phosphor coating screen)))(no need much memory)
.TC CN Device Graphical Displaying Technology 1990s (LCDs (Liquid Crystal Displays) Scanning Controler (ControlGraphic) - Pixel Scanning(rendering) (its physically use more memoirs space and speed to display graphic) DPI(FHD)
.TC CN Device Graphical Displaying Technology 1990s (LCDs (Liquid Crystal Displays) Scanning Controler (ControlGraphic) - Pixel Scanning(rendering) (200*200 Pixelimages need 40,000 Pixels crystals)
.TC CN Device Graphical Displaying Technology 1990s (LCDs (Liquid Crystal Displays) Scanning Controler (ControlGraphic) - Pixel Scanning(rendering) (even use one bit for each pixel that black or white (not grayscale)
.TC CN Device Graphical Displaying Technology 1990s (LCDs (Liquid Crystal Displays) Scanning Controler (ControlGraphic) - Pixel Scanning(rendering) (need 40,000 bits memory (5,000 byte)(5MB every frame)))
.TC CN Device Graphical Displaying Technology 1990s (LCDs (Liquid Crystal Displays) Scanning Controler (ControlGraphic) - Pixel Scanning(rendering) (for 1366*768 == 1,049,088pixels -- 131.136 MBf (blackwhite) (393.408 MBf)colored) 
.TC CN Device Graphical Displaying Technology 1990s (LCDs (Liquid Crystal Displays) Scanning Controler (ControlGraphic) - Pixel Scanning(rendering) (need claver trick to hndle ever memory)()
.TC CN Device Graphical Servers (cards) Render Technology 1990s  Graphical Character Generator - (Read-only memory)(ROM)(stroe eache character in ROM) (save moemory not to handle shaped)
.TC CN Device Graphical Servers (cards) Render Technology 1990s  Graphical ScreenBuffer
.TC CN Device Graphical Servers (cards) Render Technology 1990s  Graphical Line Generator - (orgine(uperleft))
.TC CN Device Graphical Servers (cards) Render Technology 1962s  Graphical CAD-Software(computer-aided design) (complite graphical application) (pen detect screen ferlesh rate to dynamicly work)
.TC CN Device Graphical Servers (cards) Render Technology 1990s  Graphical BitMap -(bits in memory directly 'mapped' to pixels on screen. bitmapped diplays (with full control))
.TC CN Device Graphical Servers (cards) Render Technology 1990s  Graphical BitMap -(totally arbitray graphics were possible)
.TC CN Device Graphical Servers (cards) Render Technology 1990s  Graphical FrameBuffer -
.TC CN Device Graphical Servers (cards) Render Technology 1990s  Graphical VRAM(video RAM (high speed memmory access)) -
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES))================================================================================================================================
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -----/==========\  
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ----/============\--------------------/=+=+=+=+=1=+=+=+=+=+=+=\   /=+=+=+=+=9=+=+=+=+=+=+=\
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ---/===-+-+-+-+-+-\=============\						-.--.-.-.-.--.--.-.-.-.-							
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ***-+-+--+--+---+---+----+----+ .--.-.-.-.--.-.-.-.-            -.--.-.-.-.--.--.-.-.-.-
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ---\===-+-+-+-+-+-/=============/		-.--.-.-.-.--.--.-.-.-.-
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ----\============/--------------------\=+=+=+=+=9=+=+=+=+=+=+=/   \=+=+=+=+=1=+=+=+=+=+=+=/	 
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -----\==========/  
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ======================================================================================================================================================================================================
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------/======\ 		 	             /IOns\                           /F/	=	-		=		-	=		(377ns)-.--.-.-.-.--.--.-.-.-.-		==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------/======\ 		 	             /IOns\                          /E/	=	-		=		-	=		(233ns)-.--.-.-.-.--.--.-.-.-.-		==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------/======\ 		 	             /IOns\                         /D/		=	-		=		-	=		(144ns)-.--.-.-.-.--.--.-.-.-.-		==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------/======\ 		 	             /IOns\                        /C/		=	-		=		-	=		(89ns)-.--.-.-.-.--.--.-.-.-.-		==Higs Electron 
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/ 		 	            /=+=0+=\                      /B/		=	-		=		-	=	(55ns)-.--.-.-.-.--.--.-.-.-.-			==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/ 		 	           /=+=+1+=+\		         /A/		=	-		=		-	=(34ns)-.--.-.-.-.--.--.-.-.-.-				==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/ 		 	          /=+=+=2+=+=\		        /9/		=	-		=		-(21ns)-.--.-.-.-.--.--.-.-.-.-					==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/ 		 	         /=+=+=+3+=+=+\		       /8/		=	-		=	(13ns)-.--.-.-.-.--.--.-.-.-.-						==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/ 		 	        /=+=+=+=5+=+=+=\	      /7/		=	-		=(8ns)-.--.-.-.-.--.--.-.-.-.-							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/ 		 	       /=+=+=+=+8+=+=+=+\            /6/		=	-	(5ns)-.--.-.-.-.--.--.-.-.-.-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/ 		 	      /=+=+=+=+13+=+=+=+=\          /5/			=	-(3ns)-.--.-.-.-.--.--.-.-.-.-	-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/ 		 	     /=+=+=+=+=21+=+=+=+=+\	   /4/			=(2ns)-.--.-.-.-.--.--.-.-.-.-  	-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ------/========\ 		 	    /=+=+=+=+=+34=+=+=+=+=+\      /3/		(1ns)-.--.-.-.-.--.--.-.-.-.-  	=		-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -----/==========\  			   /=+=+=+=+=+=55+=+=+=+=+=+\    /2/        (0ns)-.--.-.-.-.--.--.-.-.-.-    	=		-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ----/============\--------------------/=+=+=+=+=+=+89+=+=+=+=+=+=\  /1/  (IOns)-.--.-.-.-.--.--.-.-.-.-  		=		-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ----/============\-------------------/=+=+=+=+=+=+144+=+=+=+=+=+=+\/0/  (IOns)-.--.-.-.-.--.--.-.-.-.-  		=		-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ---/===-+-+-+-+===\=============//\\			 -.--.-.-.-.--.--.-.-.-.-       =	-		=		-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ***-+-+--+--+---+---+----+----+ .--.-.-.-.--.-.-.-.-(233)R(red)      		        =	-		=		-	=							==Higs NeutronA++ 
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ***-+-+--+--+---+---+----+----+ .--.-.-.-.--.-.-.-.-(233)G(green)           	        =	-		=		-	=							==Higs NeutronA++ 
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ***-+-+--+--+---+---+----+----+ .--.-.-.-.--.-.-.-.-(233)V(VELVET)           	        =	-		=		-	=							==Higs NeutronA++ 
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ***-+-+--+--+---+---+----+----+ .--.-.-.-.--.-.-.-.-(233)v(velvet)           	        =	-		=		-	=							==Higs NeutronA++ 
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ***-+-+--+--+---+---+----+----+ .--.-.-.-.--.-.-.-.-(233)V(VELVET)           	        =	-		=		-	=							==Higs NeutronA++ 
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ***-+-+--+--+---+---+----+----+ .--.-.-.-.--.-.-.-.-(233)G(green)           	        =	-		=		-	=							==Higs NeutronA++ 
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ***-+-+--+--+---+---+----+----+ .--.-.-.-.--.-.-.-.-(233)B(blue)           			=	-		=		-	=							==Higs NeutronA++ 
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ---\===-+-+-+-+===/=============\\//			 -.--.-.-.-.--.--.-.-.-.-       =	-		=		-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ----\============/-------------------\=+=+=+=+=+=+144=+=+=+=+=+=+=/\0\  (IOsn)-.--.-.-.-.--.--.-.-.-.-              =               -   	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ----\============/--------------------\=+=+=+=+=+=+89=+=+=+=+=+=+/  \1\  (IOsn)-.--.-.-.-.--.--.-.-.-.-             =               -   	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -----\==========/  		           \=+=+=+=+=+=55+=+=+=+=+=+/    \2\	    (0sn)-.--.-.-.-.--.--.-.-.-.-  	=		-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ------\========/   			    \=+=+=+=+=+34+=+=+=+=+=/      \3\		(1sn)-.--.-.-.-.--.--.-.-.-.-  	=		-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/   			     \=+=+=+=+=21=+=+=+=+=/	   \4\			=(2sn)-.--.-.-.-.--.--.-.-.-.-  	-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------/======\			      \=+=+=+=+13=+=+=+=+/ 	    \5\			=	-(3ns)-.--.-.-.-.--.--.-.-.-.-	-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------/======\			       \=+=+=+=+8=+=+=+=/            \6\		=	-	(5ns)-.--.-.-.-.--.--.-.-.-.-	=							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------/======\			        \=+=+=+=5+=+=+=/              \7\		=	-		=(8ns)-.--.-.-.-.--.--.-.-.-.-							==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------/======\			         \=+=+=+3=+=+=/                \8\		=	-		=	(13ns)-.--.-.-.-.--.--.-.-.-.-						==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------/======\			          \=+=+=2=+=+/                  \9\		=	-		=		-(21ns)-.--.-.-.-.--.--.-.-.-.-					==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------/======\			           \=+=+1=+=/                    \A\		=	-		=		-	=(34ns)-.--.-.-.-.--.--.-.-.-.-				==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------/======\			            \=+=0+=/                      \B\		=	-		=		-	=	(55ns)-.--.-.-.-.--.--.-.-.-.-			==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/ 		 	             \IOsn/                        \C\		=	-		=		-	=		(89ns)-.--.-.-.-.--.--.-.-.-.-		==Higs Positron 
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/ 		 	             \IOsn/                         \D\		=	-		=		-	=		(144ns)-.--.-.-.-.--.--.-.-.-.-		==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/ 		 	             \IOsn/                          \E\	=	-		=		-	=		(233ns)-.--.-.-.-.--.--.-.-.-.-		==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) -------\======/ 		 	             \IOsn/                           \F\	=	-		=		-	=		(377ns)-.--.-.-.-.--.--.-.-.-.-		==Higs
.TC CN Device Graphical Displaying 1960s (CRTs (CATHODE RAY TUBES)) ======================================================================================================================================================================================================
.TC CN Device Graphical Displaying 1990s //////
.TC CN Device Graphical Displaying 2000s ///////
.TC CN Device Graphical Displaying 2022s ////////
//=======================================================================================================
//=======================================================================================================
//=======================================================================================================
//	POWERCert Animated Videos , if this video has been helpful to you, please like the video and subscribe. Iappreciate it??				        //
//======================================================================================================= 
//+-----------------------------------------------------------------------------+
//|                                                                             |
//| Project QUARTS: (836_line) Capitan(moniliced)-Issues         BEGIN-END      |
//|                                                                             |
//+-----------------------------------------------------------------------------+




//+------------------------------------------------------------------+
//             P L E A S E   -   D O    N O T    D E L E T E    A N Y T H I N G ! ! !
// -------------------------------------------------------------------------------------------------
//                                   XMT-Scalper v. 2.46
//
//                                                                      by Capella
//                             http://www.worldwide-invest.org
//                                  Copyright 2011 - 2014
//
//--------------------------------------------------------------------------------------------------
//   THIS EA IS SHAREWARE, WHICH MEANS THAT IT'S NOT A COMMERCIAL PRODUCT, BUT STILL COPYRIGHTED
// -------------------------------------------------------------------------------------------------
//
// About Capella:
//
// I'm a professional system analyst / computer programmer + fund manager and fx trader living
// in Sweden, with a background as a teacher in computer science, programming and mathematics, etc.
// I can be reached at the above financial forum.
//
// Editing:
//
// Note: For readability in MetaEditor, set Tools > Options > General, Tab size = 3 spaces and
// Font = Courier New 10. BTW, I use Notepad++ as the editor (highly recommended).
//
// Your suggestions:
//
// If you're a programmer and have suggestions for improvements, then please have the courtesy to
// share this and upload the new mq4-file to the above forum. Add a letter "a", "b", etc. to the
// version number to distinguish it from the official releases. Be sure to comment every line of
// code, and add your version comment at the end of the version list. Your contribution will be
// honored. All further releases will be posted on the above forum, as well as all feedback from
// users. All block code should have { and } in own lines without other code, this to enhance readability.
//
// Origin:
//
// The EA was originally based on the EA MillionDollarPips - but now totally rewritten from scratch.
// Not much remains from the original, except the core idea of the trading strategy.
//
//--------------------------------------------------------------------------------------------------
//
// Version history:
//
// Someone at a russian forum fixed a Stack Overflow problem, added NDD-mode (ECN-mode)
// and moved the DLL-functions in the mql4-code, and uploaded "MillionDollarPips -
// (ANY PAIR + NO DLL) - ver 1.1.0".
//
// Sept-2011 by Capella by at http://www.worldwide-invest.org
// - Cleaned code from unused code, proper variable names and sub-names.
//
// Ver. 1.0 - 2011-09-24 by Capella at http://www.worldwide-invest.org
// - Added Print lines for STOPLEVEL when errors (for debugging purposes)
// - Removed unused externals and variables
// - Moved dynamic TP/SL and trading signals constants to externals,
//   as VolatilityLimit and Scalpfactor.
// - Forced TrailingStop
//
// Ver. 2.0 - 2011-10-19  by Capella
// - Fixing bugs, and removed unused code.
// - Forced Trailing, as no-trailing cannot generate profit
// - Forced HighSpeed, as false mode cannot give good result
// - Added additional settings for scalping - UseMovingAverage,
//   UseBollingerBands, and OrderExpireSeconds
// - Automatic adjusted to broker STOPLEVEL, to avoid OrderSend error 130
// Ver 2.1 - 2011-11-91 by Capella
// - Added Indicatorperiod as external
// - Modified calculation of variable that triggers trade (pricedirection)
// - Removed Distance as an external, and automatically adjust Distance to be the same as stoplevel
// - Removed call for sub_moveandfillarrays as it doesn't make any difference
// Ver 2.1.1 - 2011-11-05 by Capella
// - Fixed a bug in the calculation of highest and lowest that caused wrong call for
//   OrderModify.
// - Changed the calculation of STOPLEVEL to also consider FREEZELEVEL
// Ver 2.1.2 - 2011-11-06 by Capella
// - Changed default settings according to optimized backtests
// - Added external parameter Deviation for iBands, default 0
// Ver 2.1.3 - 2011-11-07 by Capella
// - Fixed a bug for calculation of isbidgreaterthanindy
// Ver 2.1.4 - 2011-11-09 by Capella
// - Fixed a bug that only made the robot trade on SELL and SELLSTOP
// - Put back the call for the sub "sub_moveandfillarrays" except the last nonsense part of it.
// - Changed the default settings and re-ordered the global variables
// Ver 2.1.5 - 2011-11-10 by Capella
// - Fixed a bug that caused the robot to not trade for some brokers (if variable "scalpsize"
//   was 0.0)
// - Fixed a bug that could cause the lot-size to be calculated wrongly
// - Better output of debug information (more information)
// - Moved a fixed internal Max Spread to an external. The default internal value was 40 (4 pips),
//   which is too high IMHI
// - Renamed some local variables to more proper names in order to make the code more readable
// - Cleaaned code further by removing unused code, etc.
// Ver 2.1.5a - 2011-11-15 by blueprint1972
// - Added Execution time in log files, to measure how fast orders are executed at the broker server
// Ver 2.2 - 2011-11-17 by Capella
// - An option to calculate VelocityLimit dynamically based on the spread
// - Removed parameter Scalpfactor as it had no impact on the trading conditions, only on lotsize
// - Better lot calculation, now entirely based on FreeMargin, Risk and StopLoss
// - A new scalp factor called VolatilityPercentageLimit based on the difference between
//   VolatilityLimit and iHigh / iLow for triggering trades
// - Can now trade automatically on all currency pairs within spread limit from one single chart
// - Works on 4-digit brokers as well. Note: Performance on 4-digit brokers is worse than on
//   5-digit brokers, and there are much less trades
// Ver 2.2.1 - 2011-11-18 by Capella
// - Fixed a bug for calculation of Commission. The variables "commissionpips" and
//   "commissionfactor" moved from locals to globals.
// Ver 2.2.1.2 - 2011-11-18 by Sonik
// - Added Screenshot Functionality (Tested and Working So Far)
// Ver 2.2.2 - 2011-11-19 by Capella
// - Added automatic calculation of MagicNumber as an option
// - Adjust MinLot to broker minimum
// - Correction of lotsize calculation according to broker lotstep
// Ver 2.2.3 - 2011-11-21 by Capella
// - Fixed bug for calculation of lotsize calculation according to broker lotstep
// - Added broker Comission as an external parameter, and corected the calculation
// - Re-arrranged some code - moving parts to subroutines
// Ver 2.2.4 - 2011-11-23 by Capella
// - Improved performance for higher spreads
// - Cleaned code further and moved parts of code to subroutines
// Ver 2.2.4a - 2011-11-24 by blueprint
// - Added execution control
// Ver 2.2.4b - 2011-11-24 by Pannik
// - Added possibility to use manual fixed lots
// Ver 2.2.5 - 2011-11-25 by Capella
// - Fixed bug for too small lotsize and wrong Risk settings
// - Changed randomized execution time for backtests to be within 0 and MaxExecution
// - Cleaned the code further
// Ver 2.2.6 - 2011-11-25 by Capella
// - Fixed bug for too large lotsize.
// - Fixed the bug for TradeALLCurrencyPairs
// - Moved broker suffix from external parameter to automatically calculated in a subroutine
// - Removed unnecessary program code, cleaned and organized the code further
// Ver 2.2.7 - 2011-11-30 by Capella
// - Fixed a bug for the broker Commission
// Ver 2.3 - 2011-12-08 by Capella
// - Changed name of the EA (from MDP-Plus) as the thread in the forum once again was deleted.
//   This EA is now a copyrighted shareware – a non-commercial product free to use.
// - Removed TradeALLCurrencyPairs as it was too buggy and could not cope with the fast trades,
//   better attach on separate charts
// - Fixed bug where iMA was used instead of either/or iMA/iBands for modifying BUYSTOP and SELLSTOP
//   orders
// - Rewrote some of the code to make it easier to follow and understand.
// - Rewrote subs to check lotsize and risk settings, and adjust them accordingly
// - Added more comments to program code
// - Added time for how often fake orders should be sent in order to calculate execution speed
// - Removed unused variables and code
// - Added check so no trading can start before we have gathered enough of Bar-data
// - Moved Slippage to an external parameter so it can be changed
// - Added summation of broker error codes
// Ver 2.3.1 - 2011-12-08 by Capella
// - Fixed a bug that could cause lotsize to be greater than MaxLots
// Ver 2.3.2 - 2011-12-09 by blueprint1972
// - Added option for simulated latency during backtests
// Ver 2.3.2b - 2011-12-09 by derox
// - Added iEnvelopes and iATR as indicators
// Ver 2.3.2c - 2011-12-10 by Pannik
// - Added "UseIndicatorSwitch" for choosing indicator to use
// Ver 2.3.2d - 2011-12-12 by derox
// - Added AllAverages as indicator. Note: This requires external indicator
// Ver 2.3.3 - 2011-12-12 by Capella
// - Added AddPriceGap as an external parameter to increase SL and TP in order to decrease number of error 130
// - Replaced iMA with AllAverages
// - Removed iMA AND iBands combination
// - Fixed minor bugs
// - Cleaned up the code further
// Ver 2.3.4 - 2011-12-13 by Capella
// - Removed AllAverages as it didn't make any difference compared to standard Moving Average
// - Fixed bug for iATR indicator.
// - Added dual-trade as an option for iATR
// Ver 2.4 - 2012-09-06 by Capella
// - Removed some external settings incl. ATR and its settings
// - Added external setting MinumumUseStopLevel
// - Fixed bugs, so it works better with different brokers withhout error 130
// Ver 2.4.1 - 2012-10-23 by Capella
// - Added check for when ECN_Mode == TRUE and BUY/SELL orders have not yet been modified, to
//   prevent running orders without SL. Wait 1 second and then modify the order with a SL
//   that is 3 pip from current price.
// - Changed default settings after extensive backtests using 99% tick-data
// Ver 2.4.2 - 2013-07 by Capella
// - Added lot-size re-calculation if Account Currency is not USD but either EUR, GBP, CHF or JPY
// - Added ReverseTrade as an option
// - Changed algorithm for automatically calculation of magicnumber
// - Added printout info if there was no errors reported from the broker server
// -------------------------------------------------------------------------------------------------
// Ver 2.4.3 - 2014-05 by Capella
// - Fixed bug - BBDeviation is INT not Double (wrong fix, see 2.461 below)
// - Moved IndicatorPeriod to externals
// - Minor bugs fixed
// - Compilation test on both MT4 Build 509 as well as on latest MT4 Build (currently 670)
// - Changed calculations from Balance to Equity (2014-08-05)
// --------------------------------------------------------------------------------------------------
// Ver 2.44 - 2014-08/09 by Capella
// - Changed version presentation to only one point ( . ), i.e. 2.4.4. becomes 2.44
// - Added control of stray trades (trades without SL and TP).
//   If it finds a stray order it will try to add a SL 10 points from current price.
// - Changed how MinimumUseStopLevel is calculated and used. Now the StopLevel is the highest value of
//   either this value or the Broker StopLevel. This StopLevel is then added/substracted from the current
//   price for BuyStop and SellStop orders. The value expressed in Points.
// - Added spaces around ( and ) and after commas , to enhance readability
// - Added AUD and NZD as possible account currencies for calculation of multiplicator (used to correct lotsize),
//   and moved it to a subroutine.
//---------------------------------------------------------------------------------------------------
// Ver 2.45 - 2014-09-30 by Capella
// - Fixed a bug for OrderExpireSeconds
//---------------------------------------------------------------------------------------------------
// Ver 2.451 - 2014-11-14 by Capella
// - Fixed a bug for printout of BBands in Debug mode
//---------------------------------------------------------------------------------------------------
// Ver 2.452 - 2014-11-15 by Capella
// - Fixed a bug for Magic (did not return a calculated value)
//---------------------------------------------------------------------------------------------------
// Ver 2.46 - 2014-11-24 by Capella
// - Added the setting MinMarginLevel. No trading is allowed if free margin is below this percentage.
// - Added graphic trading presentation
// - Renamed variables names (globals starting with upper case, locals in lower case)
// - Adding spaced within parenthesis ( ... ) to enhance readability
//---------------------------------------------------------------------------------------------------
// Ver 2.461 - 2015-01-09 by Capella
// - Fixed bug for BBDeviation, which is a double and not int
//---------------------------------------------------------------------------------------------------

//#property copyright     "Copyright 2011-2014 by Capella at http://www.worldwide-invest.org"
//#property version       "2.46"
//#property link          "http://www.worldwide-invest.org"
//#property description   "This is a FREE Shareware Expert Advisor for MetaTrader 4."
//#property description   "Please do not remove the property section and version history."
//#property description   "XMT-Scalper is a Tick Scalper for EURUSD M1, but can also work on other pairs, Gold and CFD's"
//#property description   "It's extremely broker sensitive and requires tight spread."
//#property description   "Read the PDF-file for explanations and settings."







































