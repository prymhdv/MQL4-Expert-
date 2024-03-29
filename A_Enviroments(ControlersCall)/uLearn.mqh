//+------------------------------------------------------------------+
//|                                                        Learn.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

#include <.RTL_Prymhdv\QuartsExperts\Cover\Template Generic Coding.mqh>
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
class Learn
{
private:

public:
          Learn::Learn() {}
          Learn::~Learn() {}
          //if(dayclose != 0)//-- AvoidZeroDivide

};
//+------------------------------------------------------------------+
//|             Class InheritanceVisibility     BEGIN-END            |
//+------------------------------------------------------------------+
//+-----------------------------------------------------------------------------+
//|  Step 1//Visibility of private and protected to the consuming application   |
//+-----------------------------------------------------------------------------+
class CParent1
{

private:
          string     ParentPrivate()                        {  return(__FUNCSIG__);  }
protected:
          string     ParentProtected()            {  return(__FUNCSIG__);  }
public:
          string     ParentPublic()                         {  return(__FUNCSIG__);  }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CChild1 : public CParent1
{

public:
          string     ChildPublic()                          {  return(__FUNCSIG__);  }

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart1()
{         CParent1             *parent   =         new CParent1();
          CChild1              *child    =         new CChild1();
          //Print(parent.ParentPrivate());                    //        Error// 'CParent1::ParentPrivate' - cannot access private member function     InheritanceVisibility.mq4     55        24
          //Print(parent.ParentProtected());                  //        Error// 'CParent1::ParentProtected' - cannot access protected member function InheritanceVisibility.mq4     56        24
          Print(parent.ParentPublic());//                     // Success
          //============
          delete parent;
          delete child;//
          //
}
//+-----------------------------------------------------------------------------+
//|  Step 2//Visibility of parent functions via a child class                   |
//+-----------------------------------------------------------------------------+
class CParent2
{

private:
          string     ParentPrivate()              {  return(__FUNCSIG__);  }
protected:
          string     ParentProtected()            {  return(__FUNCSIG__);  }
public:
          string     ParentPublic()               {  return(__FUNCSIG__);  }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CChild2 : public CParent2
{

public:
          string     ChildPublic()                {  return(__FUNCSIG__);  }
          void OnStart2()
          {         CParent2             *parent   =         new CParent2();
                    CChild2              *child    =         new CChild2();
                    Print(parent.ParentPublic());                     //        All of these work
                    Print(child.ChildPublic());                       //
                    Print(child.ParentPublic());                      //
                    //============
                    delete parent;
                    delete child;//
                    //
          }

};
//+-----------------------------------------------------------------------------+
//|  Step 3//Visibility of inherited parent functions inside a child class      |
//+-----------------------------------------------------------------------------+
class CParent3
{

private:
          string     ParentPrivate()                        {  return(__FUNCSIG__);  }
protected:
          string     ParentProtected()            {  return(__FUNCSIG__);  }
public:
          string     ParentPublic()                         {  return(__FUNCSIG__);  }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CChild3 : public CParent3
{

public:
          string     ChildPublic()                          {  return(__FUNCSIG__);  }
          void                          Test()
          {         //ParentPrivate();                       //Error // 'CParent3::ParentPrivate' - cannot access private member function     InheritanceVisibility.mq4     130       21
                    ParentProtected();                       // Success
                    ParentPublic();                          // Success
                    //
          }
          void OnStart3()
          {         CParent3             *parent   =         new CParent3();
                    CChild3              *child    =         new CChild3();
                    Print(parent.ParentPublic());                     //All work// Success
                    Print(child.ChildPublic());                       //        // Success
                    Print(child.ParentPublic());                      //        // Success   //child access to parent publics..
                    //============
                    delete parent;
                    delete child;//
                    //
          }

};
//+-----------------------------------------------------------------------------------------+
//|  Step 4//Visibility of parent functions inside a child class containing the parent      |
//+-----------------------------------------------------------------------------------------+
class CParent4
{

private:
          string     ParentPrivate()              {  return(__FUNCSIG__);  }
protected:
          string     ParentProtected()            {  return(__FUNCSIG__);  }
public:
          string     ParentPublic()               {  return(__FUNCSIG__);  }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CChild4 : public CParent4
{

public:
          string     ChildPublic()                          {  return(__FUNCSIG__);  }
          void                          Test()
          {         ParentProtected();
                    ParentPublic();
                    CParent4   *parent   =         new CParent4();
                    //parent.ParentPrivate();                    // Error // 'CParent4::ParentPrivate' - cannot access private member function       InheritanceVisibility.mq4     152       28
                    //parent.ParentProtected();                    // Error // 'CParent4::ParentProtected' - cannot access protected member function InheritanceVisibility.mq4     158       28
                    parent.ParentPublic();                       // Success
                    //
                    //============
                    delete parent;
                    //
          }
          void OnStart41()
          {         CParent4             *parent   =         new CParent4();
                    CChild4              *child    =         new CChild4();
                    Print(parent.ParentPublic());                     //        All work
                    Print(child.ChildPublic());                       //
                    Print(child.ParentPublic());                      //
                    //============
                    delete parent;
                    delete child;//
                    //
          }

};
//+-----------------------------------------------------------------------------------------+
//|  Step 5//Visibility of parent inherited functions through a sub class                   |
//+-----------------------------------------------------------------------------------------+
class CParent5
{

private:
          string     ParentPrivate()              {  return(__FUNCSIG__);  }
protected:
          string     ParentProtected()            {  return(__FUNCSIG__);  ParentPrivate();}
public:
          string     ParentPublic()               {  return(__FUNCSIG__);  ParentPrivate();}

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CChild5 : protected CParent5
{


private:
          string     ChildPrivate()                   {  return(__FUNCSIG__);  }
          void       ChildTestPrivate(string)
          {         //==============
                    //ParentPrivate() ;                   // Error// 'CParent5::ParentPrivate' - cannot access private member function      Learn.mqh 273       21
                    ParentProtected();
                    ParentPublic();//
                    //===================
                    ChildPrivate();                       // Success// SELF CLASS//
                    ChildProtected4("ParentProtected()");//
                    //
          }//
protected:
          string     ChildProtected()                   {  return(__FUNCSIG__); ChildPrivate(); }
          string     ChildProtected2(string)            {  return(__FUNCSIG__); ChildPrivate(); } //            // Success// SELF CLASS//  UNCOMMON
          //string     ChildProtected3(string)            {  return(__FUNCSIG__); ChildPrivate(); ParentPublic(); ParentProtected(); ParentPrivate(); } //            // Success// SELF CLASS//  UNCOMMON 'CParent5::ParentPrivate' - cannot access private member function   Learn.mqh 260       129
          string     ChildProtected4(string)            {  return(__FUNCSIG__); ChildPrivate(); ParentPublic(); ParentProtected();  } //            // Success// SELF CLASS//  UNCOMMON
          void       ChildTestProtected(string)
          {         //==============
                    //ParentPrivate() ;                   // Error// 'CParent5::ParentPrivate' - cannot access private member function        Learn.mqh 274       21
                    ParentProtected();
                    ParentPublic();//
                    //====================
                    ChildPrivate();
                    ChildProtected4("ParentProtected()");//
                    //
          }//

public:
          string     ChildPublic()                {  return(__FUNCSIG__);  }
          void       ChildTestPublic(string)
          {         //==============
                    //ParentPrivate() ;                   // Error// 'CParent5::ParentPrivate' - cannot access private member function      Learn.mqh 273       21
                    ParentProtected();
                    ParentPublic();//
                    //===================
                    ChildPrivate();                       // Success// SELF CLASS//
                    ChildProtected4("ParentProtected()");//
                    //
          }//

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CSub5 : public CChild5
{
private:
          string     SubPrivate()                   {  return(__FUNCSIG__);  }
          void       SubTestPrivate()
          {         //ParentPrivate();              // Error// 'CParent5::ParentPrivate' - cannot access private member function    Learn.mqh 281       21
                    ParentProtected();              // Success// father Protected//
                    ParentPublic();
                    //===============
                    //ChildPrivate(); //            // Error// 'CChild5::ChildPrivate' - cannot access private member function    Learn.mqh 285       21
                    ChildProtected(); //            // Success// SELF CLASS//  UNCOMMON
                    ChildPublic(); //               // Success// SELF CLASS//  COMMON...
                    //ChildProtected2(ChildPrivate());// Success// SELF CLASS//  UNCOMMON //'CChild5::ChildPrivate' - cannot access private member function   Learn.mqh 289       37
                    //=================
                    SubPrivate(); //                // Success//  SELF CLASS//
                    SubProtected(); //              // Success// SELF CLASS//
                    SubPublic(); //                 // Success// SELF CLASS//
                    //SubProtected2();                // Error// // 'SubProtected' - function not defined   Learn.mqh 290       21
                    //=================
          }//
protected:
          string     SubProtected()                   {  return(__FUNCSIG__);  }
          //string     SubProtected2()                   {  return(__FUNCSIG__);  }

          void       SubTestProtected()
          {         //ParentPrivate();              // Error// 'CParent5::ParentPrivate' - cannot access private member function    Learn.mqh 281       21
                    ParentProtected();              // Success// father Protected//
                    ParentPublic();
                    //===============
                    //ChildPrivate(); //            // Error// 'CChild5::ChildPrivate' - cannot access private member function    Learn.mqh 285       21
                    ChildProtected(); //            // Success// SELF CLASS//  UNCOMMON
                    ChildPublic(); //               // Success// SELF CLASS//  COMMON...
                    //ChildProtected2(ChildPrivate());// Success// SELF CLASS//  UNCOMMON //'CChild5::ChildPrivate' - cannot access private member function   Learn.mqh 289       37
                    //=================
                    SubPrivate(); //                // Success//  SELF CLASS//
                    SubProtected(); //              // Success// SELF CLASS//
                    SubPublic(); //                 // Success// SELF CLASS//
                    //SubProtected2();                // Error// // 'SubProtected' - function not defined   Learn.mqh 290       21
                    //=================
          }//



public:
          string     SubPublic()                   {  return(__FUNCSIG__);  }
          void      SubTestPublic()
          {         //ParentPrivate();              // Error// 'CParent5::ParentPrivate' - cannot access private member function    Learn.mqh 281       21
                    ParentProtected();              // Success// father Protected//
                    ParentPublic();
                    //===============
                    //ChildPrivate(); //            // Error// 'CChild5::ChildPrivate' - cannot access private member function    Learn.mqh 285       21
                    ChildProtected(); //            // Success// SELF CLASS//
                    ChildPublic(); //               // Success// SELF CLASS//
                    //=================
                    SubPrivate(); //                // Success//  SELF CLASS//
                    SubProtected(); //              // Success// SELF CLASS//
                    SubPublic(); //                 // Success// SELF CLASS//
                    //SubProtected2();                // Error// // 'SubProtected' - function not defined   Learn.mqh 290       21
                    //SubTestPublic();                ///recal self? must stop// stac over floow
                    //=================
          }//


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+InheritanceVisibility
void OnStart5()
{         CParent5             *parent   =         new CParent5();
          CChild5              *child    =         new CChild5();
          CSub5                *sub      =         new CSub5();
          //==========================//===================================================================================================
          //Print(parent.ParentPrivate());                     // Error//  class self : protected CParent5//'CParent5::ParentPrivate' - cannot access private member function    Learn.mqh 293       24
          //Print(parent.ParentProtected());                   // Error//  class self : protected CParent5//'CParent5::ParentProtected' - cannot access protected member function        Learn.mqh 294       24
          Print(parent.ParentPublic());                        // Success//  class self : protected CParent5
          //===============================================================================================================================
          //Print(child.ChildPrivate());                       // *Error*// 'CParent5::ParentPublic'//'CChild5::ChildPrivate' - cannot access private member function      Learn.mqh 301       23
          //Print(child.ChildProtected());                     // *Error*// 'CParent5::ParentPublic' - cannot access protected member function  InheritanceVisibility.mq4     233       23
          Print(child.ChildPublic());                          // Success// self public//
          //===============================================================================================================================
          //Print(child.ParentProtected());                       // Error// 'CParent5::ParentProtected' - cannot access protected member function      Learn.mqh 305       23
          //===============================================================================================================================
          //Print(sub.SubPrivate());                           // *Error*// 'CParent5::ParentPublic'//'CChild5::ChildPrivate' - cannot access private member function      Learn.mqh 301       23
          //Print(sub.SubProtected());                         // *Error*// 'CParent5::ParentPublic' - cannot access protected member function  InheritanceVisibility.mq4     233       23
          Print(sub.SubPublic());                              // Success// self public//
          //===============================================================================================================================
          Print(sub.ChildPublic());                            // Success// class CSub5 : public CChild5//class CChild5 : protected CParent5//
          //Print(sub.ParentPublic());                         // *Error*// 'CParent5::ParentPublic' - cannot access protected member function   InheritanceVisibility.mq4     236       21
          //===============================================================================================================================
          //Print(sub.ChildProtected());                       // Success// 'CChild5::ChildProtected' - cannot access protected member function       Learn.mqh 295       21
          //Print(sub.ParentProtected());                      // Error // 'CParent5::ParentProtected' - cannot access protected member function     Learn.mqh 294       21
          //===============================================================================================================================
          //Print(sub.ParentPrivate());                        // Error // 'CParent5::ParentPrivate' - cannot access private member function         Learn.mqh 295       21
          //===============================================================================================================================
          //
          sub.ChildTestPublic("ParentProtected()");//          // Success//
          //sub.SubTestProtected();//                          // Error // 'CSub5::TestProtected' - cannot access protected member function      Learn.mqh 357       15
          //sub.ChildTestProtected("ParentProtected()");//       // Error //'CChild5::ChildTestProtected' - cannot access protected member function    Learn.mqh 367       15
          //===============================================================================================================================
          delete parent;
          delete child;//
          delete sub;//
          //
}
//+-----------------------------------------------------------------------------------------+
//|  Step 6///Visibility of parent private inherited functions through a sub class          |
//+-----------------------------------------------------------------------------------------+
class CParent6
{

private:
          string     ParentPrivate()              {  return(__FUNCSIG__);  }
protected:
          string     ParentProtected()            {  return(__FUNCSIG__);  }
public:
          string     ParentPublic()               {  return(__FUNCSIG__);  }

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CChild6 : CParent6
{         string    NamePrivate;//
          string    GetNamePrivate() {return(NamePrivate);}
          bool      SetNamePrivate(string Name) { NamePrivate = Name; return (NamePrivate == Name); }

public:

          //CSub6*     sub;                       //        Error // 'CSub6' - unexpected token, probably type is missing?    Learn.mqh 300       11
          string     ChildPublic()                {  return(__FUNCSIG__);  }
          void                          Test()
          {         ParentProtected();
                    ParentPublic(); }

          string GetNamePublic() {return(NamePrivate = GetNamePrivate());}
          bool SetNamePublic(string Name) { NamePrivate = Name; SetNamePrivate(Name); return (GetNamePrivate() == Name); }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CSub6 : public CChild6
{
private:
          string    NamePrivate;//
          string    GetNamePrivate() {return(NamePrivate);}
          bool      SetNamePrivate(string Name) { NamePrivate = Name; return (NamePrivate == Name); }
          string    SubPrivate()                 {  return(__FUNCSIG__);  }

public:
          string    SubPublic()                 {  return(__FUNCSIG__);  }
          void      Test()
          {         //ParentProtected();              //        Error // 'CParent6::ParentProtected' - cannot access private member function  InheritanceVisibility.mq4     280       21
                    //ParentPublic();                 //        Error // 'CParent6::ParentPublic' - cannot access private member function     InheritanceVisibility.mq4     281       21
                    ChildPublic(); //                // Success///// class CChild6 : CParent6>>>privet access
                    //
          }
          string GetNamePublic() {return(NamePrivate = GetNamePrivate());}
          bool SetNamePublic(string Name) { NamePrivate = Name; SetNamePrivate(Name); return (GetNamePrivate() == Name); }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart6()
{         CParent6             *parent   =         new CParent6();
          CChild6              *child    =         new CChild6();
          CSub6                *sub      =         new CSub6();
          //---------------------------
          Print(parent.ParentPublic());                    // Success
          Print(child.ChildPublic());                      // Success///// class CChild6 : CParent6>>>privet access
          //Print(child.ParentPublic());                   // Error // 'CParent6::ParentPublic' - cannot access private member function     InheritanceVisibility.mq4     297       23
          //---------------------------
          Print(sub.SubPublic());                          // Success// class CChild6 : CParent6>>>privet access
          Print(sub.ChildPublic());                        // Success// class CChild6 : CParent6>>>privet access
          //Print(sub.ParentPublic());                     // Error // 'CParent6::ParentPublic' - cannot access private member function     InheritanceVisibility.mq4     300       21
          //Print(sub.SubPrivate());                       // Error// 'CSub6::SubPrivate' - cannot access private member function        Learn.mqh 339       21
          Print(sub.GetNamePublic());                      // Success//
          Print(sub.SetNamePublic("P"));                   // Success//
          //Print(sub.SetNamePrivate("O"));                  // Error // 'CSub6::SetNamePrivate' - cannot access private member function  Learn.mqh 347       21
          //Print(child.sub.SetNamePublic("P"));             //wrong direction...
          //Print(sub.child.SetNamePublic("P"));              // Error //  'child' - struct member undefined  Learn.mqh 360       21
          //---------------------------
//
}
//+-----------------------------------------------------------------------------------------+
//|  Step 7///Visibility of parent private inherited functions through a sub class          |
//+-----------------------------------------------------------------------------------------+
class CStar7
{

private:  string    NamePrivate;//
          string    GetNamePrivate() {return(NamePrivate);}
          bool      SetNamePrivate(string Name) { NamePrivate = Name; return (NamePrivate == Name); }
          string     StarPrivate()              {  return(__FUNCSIG__);  }
protected:
          string     StarProtected()            {  return(__FUNCSIG__);  }
public:
          string     StarPublic()               {  return(__FUNCSIG__);  }

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CParent7
{

private:
          string     ParentPrivate()              {  return(__FUNCSIG__);  }
protected:
          string     ParentProtected()            {  return(__FUNCSIG__);  }
public:
          string     ParentPublic()               {  return(__FUNCSIG__);  }

};
CStar7      *star2;//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CChild7 : protected CParent7  //   public can access to protected.. //  protected can accecc ptotected      Error // ///private cant accecc ptotected
{         string    NamePrivate;//
          string    GetNamePrivate() {return(NamePrivate);}
          bool      SetNamePrivate(string Name) { NamePrivate = Name; return (NamePrivate == Name); }

public:

          //CSub6*     sub;                       //        Error // 'CSub6' - unexpected token, probably type is missing?    Learn.mqh 300       11

          CStar7      *star;//

          string     ChildPublic()                {  return(__FUNCSIG__);  }
          void Test()
          {         //ParentPrivate();    //        Error // ////'CParent7::ParentPrivate' - cannot access private member function  Learn.mqh 548       21
                    ParentProtected();
                    ParentPublic(); }

          string GetNamePublic() {return(NamePrivate = GetNamePrivate());}
          bool SetNamePublic(string Name) { NamePrivate = Name; SetNamePrivate(Name); return (GetNamePrivate() == Name); }

};
CChild7      *child2;//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CChild7b : protected CParent7  //   public can access to protected.. //  protected can accecc ptotected      Error // ///private cant accecc ptotected
{         string    NamePrivate;//
          string    GetNamePrivate() {return(NamePrivate);}
          bool      SetNamePrivate(string Name) { NamePrivate = Name; return (NamePrivate == Name); }

public:

          //CSub6*     sub;                       //        Error // 'CSub6' - unexpected token, probably type is missing?    Learn.mqh 300       11

          CStar7      *star;//

          string     ChildPublic()                {  return(__FUNCSIG__);  }
          void Test()
          {         //ParentPrivate();    //        Error // ////'CParent7::ParentPrivate' - cannot access private member function  Learn.mqh 548       21
                    ParentProtected();
                    ParentPublic(); }

          string GetNamePublic() {return(NamePrivate = GetNamePrivate());}
          bool SetNamePublic(string Name) { NamePrivate = Name; SetNamePrivate(Name); return (GetNamePrivate() == Name); }

};
CChild7b      *childb2;//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CSub7 : public CChild7
{
private:
          string    NamePrivate;//
          string    GetNamePrivate() {return(NamePrivate);}
          bool      SetNamePrivate(string Name) { NamePrivate = Name; return (NamePrivate == Name); }
          string    SubPrivate()                 {  return(__FUNCSIG__);  }

public:
          string    SubPublic()                 {  return(__FUNCSIG__);  }
          void      Test()
          {         //if(public||protcted class access)//
                    {         ParentProtected();               // Success///// class CChild6 : CParent6>>>public||protcted class access
                              ParentPublic();                  // Success///// class CChild6 : CParent6>>>public||protcted class access
                              ChildPublic(); //                // Success///// class CChild6 : CParent6>>>privet access
                    }//
                    {         //if(private class access)//        Error // 'CParent6::ParentProtected' - cannot access private member function  InheritanceVisibility.mq4
                              //ParentProtected();              //        Error // 'CParent6::ParentProtected' - cannot access private member function  InheritanceVisibility.mq4     280       21
                              //ParentPublic();                 //        Error // 'CParent6::ParentPublic' - cannot access private member function     InheritanceVisibility.mq4
                    }
                    //
          }
          string GetNamePublic() {return(NamePrivate = GetNamePrivate());}
          bool SetNamePublic(string Name) { NamePrivate = Name; SetNamePrivate(Name); return (GetNamePrivate() == Name); }

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart7()
{         //star                           =         new CStar7(); //                            //   ERROR // CChild7::star 'Star' - undeclared identifier  Learn.mqh 450       11
          star2                          =         new CStar7();
          child2                         =         new CChild7();
          //---
          CParent7             *parent   =         new CParent7();
          CChild7              *child    =         new CChild7();
          CSub7                *sub      =         new CSub7();
          //---------------------------
          Print(parent.ParentPublic());                    // Success
          Print(child.ChildPublic());                      // Success///// class CChild6 : CParent6>>>privet access
          //Print(child.ParentPublic());                   // Error // 'CParent6::ParentPublic' - cannot access private member function     InheritanceVisibility.mq4     297       23
          //---------------------------
          Print(sub.SubPublic());                           // Success// class CChild6 : CParent6>>>privet access
          Print(sub.ChildPublic());                         // Success// class CChild6 : CParent6>>>privet access
          //Print(sub.ParentPublic());                      // Error // 'CParent6::ParentPublic' - cannot access private member function     InheritanceVisibility.mq4     300       21
          //Print(sub.SubPrivate());                        // Error// 'CSub6::SubPrivate' - cannot access private member function        Learn.mqh 339       21
          Print(sub.GetNamePublic());                       // Success//
          Print(sub.SetNamePublic("P"));                    // Success//
          //Print(sub.SetNamePrivate("O"));                 // Error // 'CSub6::SetNamePrivate' - cannot access private member function  Learn.mqh 347       21
          //Print(child.sub.SetNamePublic("P"));            //wrong direction...
          //---------
          //Star2 = child;                                  //ERROR // '=' - type mismatch          Learn.mqh 470       17
          //Star2 = (CStar7)child;                          //ERROR // 'child' - object required  Learn.mqh 473       27
          child2 = child;
          //Print(sub.child.SetNamePublic("P"));            //ERROR // 'Child2' - struct member undefined Learn.mqh 475       21
          //Print(sub.child2.SetNamePublic("P"));           //ERROR // 'Child2' - struct member undefined       Learn.mqh 475       21
          //---
          //Print(sub.child2.SetNamePublic("P"));           //ERROR // 'Child2' - struct member undefined       Learn.mqh 475       21
          // Print(child2.sub.SetNamePublic("P"));          //ERROR // 'sub' - struct member undefined      Learn.mqh 479       24
          //Print(child.star.SetNamePublic("P"));           //ERROR //'SetNamePublic' - function not defined          Learn.mqh 480       28
          //Print(child.star.StarProtected());                //ERROR //'CStar7::StarProtected' - cannot access protected member function        Learn.mqh 481       28
          Print(child.star.StarPublic());//                 // Success//
          //---------------------------
          //====================
          delete star2;//                          =         new CStar7();
          delete child2;//                         =         new CChild7();
          //---
          delete parent;//             *parent   =         new CParent7();
          delete child;//              *child    =         new CChild7();
          delete sub;//               *sub      =         new CSub7();
          //====================
//
}
///*/
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|             Class InheritanceVisibility     BEGIN-END            |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class VirtualFunctions     BEGIN-END                 |//father can acceess childe func when declare constract by childe constractor...
//+------------------------------------------------------------------+
class CParent
{
private:
          virtual string    ParentVirtualPrivate()           {  return(__FUNCSIG__);  }
protected:
          virtual string    ParentVirtualProtected()         {  return(__FUNCSIG__);  }
public:
          string            Function1()                     {  return(__FUNCSIG__);  }
          virtual string    Function2()                     {  return(__FUNCSIG__);  }
          virtual string    ParentVirtualPublic()           {  return(__FUNCSIG__);  }
          //
          //
          //
          //

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CChild : public CParent
{
private:
          string            name;
          string            ParentVirtualPrivate()           {  return(__FUNCSIG__);  }
          virtual string    ChildVirtualPrivate()            {  return(__FUNCSIG__);  }
protected:
          string            ParentVirtualProtected()         {  return(__FUNCSIG__);  }
          virtual string    ChildVirtualProtected()          {  return(__FUNCSIG__);  }
public:
          string            Function1()                      {  return(__FUNCSIG__);  }
          string            Function2()                      {  return(__FUNCSIG__);  }
          virtual string    ChildVirtualPublic()             {  return(__FUNCSIG__);  }

          void   CChild();
          void   CChild(string n) {name = n;}

          //
          //
          //
          //

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart_()
{         CParent   *parent   =         new CParent();
          CChild    *child    =         new CChild();
          CParent   *parent2  =         new CChild("David");    //---the  parent2 used memory location reserved for  CChild  mean the type of parent2 is the same as  CChild. that parent2 can act like CChild....not self
          Print("parent.Function1()="   + parent.Function1());  //-- CParent::Function1()       ..out
          Print("child.Function1()="    + child.Function1());   //-- CChild::Function1()        ..out
          Print("parent2.Function1()="  + parent2.Function1()); //-- CChild::Function1()        ..out 
          Print("parent.Function2()="   + parent.Function2());  //-- CParent::Function2()       ..out
          Print("child.Function2()="    + child.Function2());   //-- CChild::Function2()        ..out 
          Print("parent2.Function2()="  + parent2.Function2()); //-- CChild::Function2()        ..out
          delete    child;              //---clean memory stack reserved for child
          delete    parent;             //---clean memory stack
          delete    parent2;            //---clean memory stack
}

//+------------------------------------------------------------------+
//|             Class VirtualFunctions     BEGIN-END                 |
//+------------------------------------------------------------------+
Looping()
{
//---
          for(int i = 0; i < 6; i++)
          {         if(i == 0)continue; // gone next itiration ...  one next looping
                    //Comment("hello" + (string)i);
                    if(i == 4)break; /// faster than loop end last itiration.
                    //
          }
          while(true)
          {         if (OrderSend(NULL, OP_BUY, 1.0, Ask, 5, 0, 0) > 0)
                              break; }
          ////////
          do
          {         int ticket = OrderSend(NULL, OP_BUY, 0.01, Ask, 5, 0, 0);
                    if (ticket <= 0) Print("failed " + (string)GetLastError()); }
          while (OrdersTotal() < 6);
          ////////////////////
          //////////
          for (int i = 0; i < 6; i++)
          {         double price = 0;
                    double pending_add = 0;
                    //get bid or ask, depending on type of order
                    if (i == OP_BUY || i == OP_BUYLIMIT || i == OP_BUYSTOP)
                              price = Ask;
                    else if (i == OP_SELL || i == OP_SELLLIMIT || i == OP_SELLSTOP)
                              price = Bid;
                    //get the offset value from current price, if pending order
                    if (i == OP_BUYSTOP || i == OP_SELLLIMIT)
                              price = price + 500 * Point;
                    else if (i == OP_BUYLIMIT || i == OP_SELLSTOP)
                              price = price - 500 * Point;
                    //send the order and get the ticket
                    int ticket = OrderSend(NULL, i, 0.01, price, 1000, 0, 0);
                    /*optional: use for checking for errors; uncomment to use*/
                    //if (ticket<=0) Print("failed "+GetLastError());
          } //
}
///>>>>>>>>>>>>>>>__LINDE:1413..END Debuging///Reserved ten object to deleted by destructor off toolscontroller...
//C:\Users\mito\AppData\Roaming\MetaQuotes\Terminal\63603D13555081059CD774AC70BBC63B\MQL4\Include\0srcCapitan\QuartsExperts\ChartController.mqh
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//OnTimerRedrewLinesTechnicalController
//bool KeyCreate = false,
// if(KeyCreate){
//???>>>, "--line:" ,__LINE__
//Alert(KeyX,",,,",__LINE__);
//#property indicator_separate_window
//#property indicator_color1     clrDodgerBlue
//#property indicator_chart_window
//#property indicator_buffers 1
//////////////////////////////////////// "-Line:",__LINE__
//////
//#property icon "pppp"
//#resource "Resource\\map.bmp"           // resource name - Resource\map.bmp
//#resource "\\Files\\Pictures\\good.bmp" // resource name - Files\Pictures\good.bmp
//#resource "\\Files\\Demo.wav";          // resource name - Files\Demo.wav"
//#resource "\\Sounds\\thrill.wav";       // resource name - Sounds\thrill.wav"
//namespace STD
//====
//#pragma pack(push,1)
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
struct MqlString
{
#define LPWSTR string

          int      size;       // 32 bit integer, contains the size of the buffer allocated for the string
          LPWSTR     buffer;     // 32 bit address of the buffer that contains the string
          int        reserved;   // 32 bit integer, reserved, do not use
};
//#pragma pack(pop,1)
//=====
// 1-st change - add share flags
string c_symbol = "c_symbol", i_period = "i_period";
int ExtHandle = FileOpenHistory(c_symbol + i_period + ".hst", FILE_BIN | FILE_WRITE | FILE_SHARE_WRITE | FILE_SHARE_READ);
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

//////////////#include <
//////////////
//////////////// TraderA1.
//////////////// informerOne.
//////////////// E.
//////////////// U
//void TimerController::EventContriler();
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//#import  "user32.dll"
//void     keybd_event(int bVk, int bScan, int dwFlags, int dwExtraInfo);
//void     mouse_event(int dwFlags, int dx, int dy, int dwData, int dwExtraInfo);
//#import
///
////
/// if(ObjectFind(0, nameC3) >= 0);
//StaticFunctions::DeleteObject(nameC3, __LINE__);
//StaticFunctions::DeleteAllObject(string nameCOM = "StaticFunctions::DeleteObject", int LineCOM = 0);
//StaticFunctions::DeleteObject(string nameCOM = "StaticFunctions::DeleteObject", int LineCOM = 0);
///StaticFunctions::DeleteObject("LabelMenuPadsLeftO1-" + DescNaming, __LINE__);
///MyObject* hobject= new MyObject();///
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

//#import "cfunctions.dll"
//string   MT4_cfunctions_version();
//int      MT4_time();
//int      MT4_GetCursorPos(int& iX[]);
//int      MT4_ScreenToClient(int hWnd, int& iX[]);
//#import
//The problem you have is for sure a pointer that is null.
//The 0x0000000c is the address of a member relatively to the start address of an object.
//(probably COL, if you give us the header for Object)
//Make sure the elements you add to the map are not null.

//======================================================================================================PreNeedBasedClassOrder-One
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//======================================================================================================
//public://Constructors Member
//public://Data Member
//public://Data Key Member
//public://Data Key Member ClickingCount
//public://Functions Member
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>........func(Expression1?Expression2:Expression3);
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

//#include <Canvas\Canvas.mqh>
//CCanvas UseCanvas;
/////////////////////////////////////////////////////////////////////
//StaticKeys::ClassObjects = true;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//void testFUNC(int test)
//{         try
//          {throw test }
//          catch()
//          {} //
//}
//static string (string)__LINE__ = "(" + (string)(string)__LINE__ + ")-";
/////=======================
////========================
//const int SONargTicket = 0;
//const double SONargStopLoss = 0;
//const double SONargTakeProfit = 0;
////===========================Daystart = Time[40];//if(RefreshRates())Daystart = iTime(NULL, PERIOD_D1, 0);
//static int erorrCounting = 0;
//================================================
//typedef type new_name;
//typedef function_result_type (*Function_name_type)(list_of_input_parameters_types);
////--- declare a pointer to a function that accepts two int parameters
//typedef int (*TFunc)(int, int);
////--- TFunc is a type, and it is possible to declare the variable pointer to the function
//TFunc func_ptr; // pointer to the function
////--- declare the functions corresponding to the TFunc description
//int sub(int x, int y) { return(x - y); } // subtract one number from another
//int add(int x, int y) { return(x + y); } // addition of two numbers
//int neg(int x)       { return(~x);  }  // invert bits in the variable
////--- the func_ptr variable may store the function address to declare it later
//func_ptr = sub;
//Print(func_ptr(10, 5));
//func_ptr = add;
//Print(func_ptr(10, 5));
//func_ptr = neg;         // error: neg does not have int (int,int) type
//Print(func_ptr(10));    // error: two parameters needed

//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//#include <WinUser32.mqh>
//#include <Controls\Dialog.mqh>
//#include <Controls\Button.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//class Windows10
//{
////#property description "The panel with several CButton buttons"
//
////+------------------------------------------------------------------+
////| defines                                                          |
////+------------------------------------------------------------------+
////--- indents and gaps
//#define INDENT_LEFT                         (11)      // indent from left (with allowance for border width)
//#define INDENT_TOP                          (11)      // indent from top (with allowance for border width)
//#define CONTROLS_GAP_X                      (5)       // gap by X coordinate
//#define CONTROLS_GAP_Y                      (5)       // gap by Y coordinate
////--- for buttons
//#define BUTTON_WIDTH                        (100)     // size by X coordinate
//#define BUTTON_HEIGHT                       (20)      // size by Y coordinate
////--- for the indication area
//#define EDIT_HEIGHT                         (20)      // size by Y coordinate
//
////--- create the custom function type
//          typedef int(*TAction)(string, int);
////+------------------------------------------------------------------+
////|  Open the file                                                  |
////+------------------------------------------------------------------+
//          int Open1(string name, int id)
//          {         PrintFormat("%s function called (name=%s id=%d)", __FUNCTION__, name, id);
//                    return(1); }
////+------------------------------------------------------------------+
////|  Save the file                                                  |
////+------------------------------------------------------------------+
//          int Save1(string name, int id)
//          {         PrintFormat("%s function called (name=%s id=%d)", __FUNCTION__, name, id);
//                    return(2); }
////+------------------------------------------------------------------+
////|  Close the file                                                  |
////+------------------------------------------------------------------+
//          int Close1(string name, int id)
//          {         PrintFormat("%s function called (name=%s id=%d)", __FUNCTION__, name, id);
//                    return(3); }
////+------------------------------------------------------------------+
////| Create the button class with the events processing function      |
////+------------------------------------------------------------------+
//          class MyButton: public CButton
//          {
//          private:
//                    TAction           m_action;                    // chart events handler
//          public:
//                    MyButton(void) {}
//                    ~MyButton(void) {}
//                    //--- constructor specifying the button text and the pointer to the events handling function
//                    MyButton(string text, TAction act)
//                    {         Text(text);
//                              m_action = act; }
//                    //--- set the custom function called from the OnEvent() events handler
//                    void              SetAction(TAction act) {m_action = act;}
//                    //--- standard chart events handler
//                    virtual bool      OnEvent(const int id, const long &lparam, const double &dparam, const string &sparam) override
//                    {         if(m_action != NULL && lparam == Id())
//                              {         //--- call the custom handler
//                                        m_action(sparam, (int)lparam);
//                                        return(true); }
//                              else
//                                        //--- return the result of calling the handler from the CButton parent class
//                                        return(CButton::OnEvent(id, lparam, dparam, sparam)); } };
////+------------------------------------------------------------------+
////| CControlsDialog class                                            |
////| Objective: graphical panel for managing the application       |
////+------------------------------------------------------------------+
//          class CControlsDialog : public CAppDialog
//          {
//          private:
//                    CArrayObj         m_buttons;                     // button array
//          public:
//                    CControlsDialog(void) {};
//                    ~CControlsDialog(void) {};
//                    //--- create
//                    virtual bool      Create(const long chart, const string name, const int subwin, const int x1, const int y1, const int x2, const int y2) override;
//                    //--- add the button
//                    bool              AddButton(MyButton &button) {return(m_buttons.Add(GetPointer(button))); m_buttons.Sort();};
//          protected:
//                    //--- create the buttons
//                    bool              CreateButtons(void); };
////+------------------------------------------------------------------+
////| Create the CControlsDialog object on the chart                   |
////+------------------------------------------------------------------+
//          bool  CreateWindows10(const long chart, const string name, const int subwin, const int x1, const int y1, const int x2, const int y2)
//          {         CAppDialog z1;
//                    if(!z1.Create(chart, name, subwin, x1, y1, x2, y2))
//                              return(false);
//                    return(CreateButtonsWindows10());
////---
//          }
////+------------------------------------------------------------------+
////| Create and add buttons to the CControlsDialog panel           |
////+------------------------------------------------------------------+
//          bool CreateButtonsWindows10(void) ///CControlsDialog::
//          {
////--- calculate buttons coordinates
//                    int x1 = INDENT_LEFT;
//                    int y1 = INDENT_TOP + (EDIT_HEIGHT + CONTROLS_GAP_Y);
//                    int x2;
//                    int y2 = y1 + BUTTON_HEIGHT;
////--- add buttons objects together with pointers to functions
//                    MyButton  *Pooh =  new MyButton("Open", Open1)  ;
//                    AddButton(    Pooh  );
//                    MyButton  *Pooh2 =   new  MyButton("Save", Save1)  ;
//                    AddButton( Pooh2);
//                    MyButton  *Pooh3 = new MyButton("Close", Close1)  ;
//                    AddButton( Pooh3);
////--- create the buttons graphically
//                    for(int i = 0; i < m_buttons.Total(); i++)
//                    {         MyButton *b = (MyButton*)m_buttons.At(i);
//                              x1 = INDENT_LEFT + i * (BUTTON_WIDTH + CONTROLS_GAP_X);
//                              x2 = x1 + BUTTON_WIDTH;
//                              if(!b.Create(m_chart_id, m_name + "bt" + b.Text(), m_subwin, x1, y1, x2, y2))
//                              {         PrintFormat("Failed to create button %s %d", b.Text(), i);
//                                        return(false); }
//                              //--- add each button to the CControlsDialog container
//                              if(!Add(b))
//                                        return(false); }
////--- succeed
//                    return(true); }
////--- declare the object on the global level to automatically create it when launching the program
//          CControlsDialog MyDialog;
////+------------------------------------------------------------------+
////| Expert initialization function                                   |
////+------------------------------------------------------------------+
//          int OnInitWindows10()
//          {
////--- now, create the object on the chart
//                    if(!MyDialog.Create(0, "Controls", 0, 40, 40, 380, 344))
//                              return(INIT_FAILED);
////--- launch the application
//                    MyDialog.Run();
////--- application successfully initialized
//                    return(INIT_SUCCEEDED); }
////+------------------------------------------------------------------+
////| Expert deinitialization function                                 |
////+------------------------------------------------------------------+
//          void OnDeinitWindows10(const int reason)
//          {
////--- clear comments when the application shuts down
//
////--- destroy dialog
//                    MyDialog.Destroy(reason); }
////+------------------------------------------------------------------+
////| Expert chart event function                                      |
////+------------------------------------------------------------------+
//          void OnChartEventWindows10(const int id,         // event ID
//                                     const long& lparam,   // event parameter of the long type
//                                     const double& dparam, // event parameter of the double type
//                                     const string& sparam) // event parameter of the string type
//          {
////--- call the handler from the parent class (here it is CAppDialog) for the chart events
//                    MyDialog.ChartEvent(id, lparam, dparam, sparam); }
////+------------------------------------------------------------------+
////| Expert tick function                                             |
////+------------------------------------------------------------------+
//          void OnTickWindows10()
//          {
////---
//          }
////+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

//typedef void* (*Func)(FooClass*, FooClass*, int);
//Func func_ptr = (Func)GetProcAddress(GetModuleHandleW(dll32), "memcpy");

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

/*
Control Character Explanation
StringConcatenate()   ,,, working
%c a single character
%d a decimal integer   ///.2d
%i an integer
%e scientific notation, with a lowercase "e"
%E scientific notation, with an uppercase "E"
%f a floating-point number   %.2f
%g use %e or %f, whichever is shorter
%G use %E or %f, whichever is shorter
%o an octal number
%x unsigned hexadecimal, with lowercase letters
%X unsigned hexadecimal, with uppercase letters
%u an unsigned integer
%s a string     .... %.s   is wrong
%x a hexadecimal number
%p a pointer
%n the argument shall be a pointer to an integer into which is placed the number of characters written so far
%% a percent sign
*/
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
////+------------------------------------------------------------------+
//void C_UTILITIES ::CheckPointerX4(C_TOOLS * c_items, C_TOOLS & c_items_Array[])   //Typer2 * m_items,
////============================================
//{         if(CheckPointer(c_items) == POINTER_INVALID)
//          {         //Print("POINTER_INVALID object<<<<< ", "item.Identifier(c_items)", " to be deleted -is Incorrect pointer - If an incorrect pointer is used, the program execution will be immediately terminated.");
//                    Alert("POINTER_INVALID object<<<<< ", "item.Identifier(c_items)", " to be deleted -is Incorrect pointer -If an incorrect pointer is used, the program execution will be immediately terminated.");
//                    // delete (item);//
//          }
//          else
//          {         //Print("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not Incorrect pointer");//
//                    Alert("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not Incorrect pointer");//
//          }//
//          //============================================
//          if(CheckPointer(c_items) == POINTER_DYNAMIC)///need Pointer type of any objects
//          {         //
//                    //The delete() operator can and should be used only for such pointers.
//                    //Print("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
//                    Alert("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
//                    // delete (item);//
//          }
//          else
//          {         //
//                    //The delete() operator can and should be used only for such pointers.
//                    //Print("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
//                    Alert("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
//          }//
//          //============================================
//          if(CheckPointer(c_items) == POINTER_AUTOMATIC)
//          {         //
//                    //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
//                    //Print("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
//                    Alert("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
//                    // delete (item);//
//          }
//          else
//          {         //
//                    //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
//                    //Print("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
//                    Alert("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
//          }//
//          //---------------------------------------------------------------------------------------------
//          for(int i = 0;  ArraySize(c_items_Array) >= i; i++)
//          {         //if(CheckPointer(c_items_Array[i]) == POINTER_INVALID)///c_items_Array[i]
//                    {         //Print("POINTER_INVALID object<<<<< ", "item.Identifier(c_items):",i, " to be deleted -is Incorrect pointer - If an incorrect pointer is used, the program execution will be immediately terminated.");
//                              Alert("POINTER_INVALID object<<<<< ", "item.Identifier(c_items):", i, " to be deleted -is Incorrect pointer -If an incorrect pointer is used, the program execution will be immediately terminated.");
//                              // delete (item);//
//                    }
//                    //else
//                    {         //Print("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items):",i, " cannot be deleted -not Incorrect pointer");//
//                              Alert("Non-POINTER_INVALID object<<<<< ", "item.Identifier(c_items):", i, " cannot be deleted -not Incorrect pointer"); //
//                    }//
//                    //============================================
//                    //if(CheckPointer(c_items_Array[i]) == POINTER_DYNAMIC)///need Pointer type of any objects
//                    {         //
//                              //The delete() operator can and should be used only for such pointers.
//                              //Print("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
//                              Alert("POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");
//                              // delete (item);//
//                    }
//                    // else
//                    {         //
//                              //The delete() operator can and should be used only for such pointers.
//                              //Print("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
//                              Alert("Non-POINTER_DYNAMIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created by the new() operator -Objects created by the new() operator are of POINTER_DYNAMIC type.");//
//                    }//
//                    //============================================
//                    //if(CheckPointer(c_items_Array[i]) == POINTER_AUTOMATIC)
//                    //if(CheckPointer(c_items_Array) == POINTER_AUTOMATIC)
//                    {         //
//                              //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
//                              //Print("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
//                              Alert("POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " to be deleted By delete (item); -is created automatically (not using new())");
//                              // delete (item);//
//                    }
//                    ///else
//                    {         //
//                              //All other pointers are of POINTER_AUTOMATIC type, which means that this object has been created automatically by the mql4 program environment. Such objects are deleted automatically after being used.
//                              //Print("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
//                              Alert("Non-POINTER_AUTOMATIC object<<<<< ", "item.Identifier(c_items)", " cannot be deleted By delete (item); -not created automatically (not using new())");//
//                    }//
//                    //
//          }//
//}//
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

//Virtual Functions - Object-Oriented Programming//can use///
//class AbsBase {...};//
//class AbsInit: public virtual AbsBase {...};//
//class AbsWork: public virtual AbsBase {...};//
//class NotAbsTotal: public AbsInit, public AbsWork {...};//
///-------------
//struct AbsBase {virtual void init() = 0; virtual void work() = 0; };
//struct AbsInit : virtual public AbsBase {void init() {  } };
//struct AbsWork : virtual public AbsBase {void work() { } };
//struct NotAbsTotal : virtual public AbsInit, virtual public AbsWork {};
//--------------------
//class AbsBase {virtual void init() = 0; virtual void work() = 0; };//
//class AbsInit : public virtual AbsBase {void init() {  } }; //
//class AbsWork : public virtual AbsBase {void work() { } }; //
//class NotAbsTotal :public virtual AbsInit, virtual public AbsWork {void f(NotAbsTotal *p){p->init(); }};NotAbsTotal x;//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CAnimal
{
public:
          virtual void       Sound() = NULL; // PURE method, should be overridden in the derived class, CAnimal is now abstract and cannot be created
};
//--- Derived from an abstract class
class CCat : public CAnimal
{
public:
          virtual void        Sound() { Print("Myau"); } // PURE is overridden, CCat is not abstract and can be created
};
////--- Examples of wrong use
//new CAnimal;         // Error of 'CAnimal' - the compiler returns the "cannot instantiate abstract class" error
//CAnimal some_animal; // Error of 'CAnimal' - the compiler returns the "cannot instantiate abstract class" error
//
////--- Examples of proper use
//new CCat;  // No error - the CCat class is not abstract
//CCat cat;  // No error - the CCat class is not abstract
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//C_COMPLEXTOOLS C_COMPLEXTOOLS::test;    ///error//  undefined class 'C_COMPLEXTOOLS' cannot be used         ComplexTools.mqh    110       42
//C_COMPLEXTOOLS C_COMPLEXTOOLS::*test;    ///error// '*' - name expected         ComplexTools.mqh    111       42
//C_COMPLEXTOOLS C_COMPLEXTOOLS::C_COMPLEXTOOLS::*testXx;    ///error// '*' - name expected         ComplexTools.mqh    111       42
///C_COMPLEXTOOLS *testXx;    ///success//
///C_COMPLEXTOOLS* C_COMPLEXTOOLS::testX;    ///success// and accsessing with out any instanve of base class..
//fore new oprator need to go some block sopported by class. to kno acceccing...
//testX.C_TOOLSpublic();///error///'testX' - unexpected token, probably type is missing?  ComplexTools.mqh    116       11
//========================
//C_TOOLS// cant access sidly// use drived class C_COMPLEXTOOLS//not work..again,,//just can access C_COMPLEXTOOLS members not up side//
//C_COMPLEXTOOLS     C_FLOWPANEL::KeyPadFlowBar, KeyPadFlowCandel, KeyPadFlowLine,
//=============================================//static but name is NULL...!!!//even this. nothelp...//static not help...//after created obj not hep..
//int x;       // x will be initialized with 0
// MyClass1 *y; // y will be initialized with NULL
//C_TOOLS KeyPadFlowMover2;///de defining not access in cass scope.. self
//------------
//new = C_TOOLS("KeyPadFlowMover2"); //KeyPadFlowMover2

//C_TOOLS KeyPadFlowMover2 new C_TOOLS;
//C_TOOLS P2;
//__LINE__:843>> new C_TOOLS;///call default constructor//at self class ok
//P2 new C_TOOLS("new obj")
//C_TOOLS KeyPadFlowMover2; KeyPadFlowMover2.C_TOOLS("next obj");//
//--------------------------------------//jafar nejad gomi book c++ page 118//

//C_TOOLS KeyPadFlowMover22("KeyPadFlowMover2");//>>>why not allowed??>>class objname("");
//C_TOOLS KeyPadFlowMover22;

//KeyPadFlowMover22.C_TOOLS("KeyPadFlowMover2");//>>>why not allowed??>>

//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//this exception occurred when the program access the memory space that must not be accessed
//(Not Allocated OR is not belong to the process) several times or when the memory is corrupted (several read-write though bad pointers).
//If you want to know more about the cause of this exception see System.AccessViolationException.
//and if you just want to handle it, see this answer How to Handle Access Violation Exception
//--------------
//Looks like you're dereferencing a NULL (i.e., a zero pointer) somewhere.
//While a NULL isn't formally a zero, it is in practice.
//(It's not an actual dereference of a zero pointer
//because the code is assuming there's a struct starting there and is accessing the 4th word of that struct.)
//
//Check for anywhere where you're calling the code with a null or zero parameter.
//Also consider making all calls into the low-level API private and wrap them with safe versions that guard all the arguments.
//I can't diagnose much more than that; you don't provide quite enough info yet
//(well, for me to do so at least; someone more experienced may be able to help).

//I think you are passing invalid values (like pointers) to zmq lib functions. But I can not pin down the exact
//function based on current information. Have you tried to run the EA in Debug mode and check the exact line that caused this error?

//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Invaliade_POINTER
{         //Invaliade POINTER>,<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
          //---two class must in same file//////////
          Invaliade_POINTER* ButtonX;
          Invaliade_POINTER* ButtonY;
          Invaliade_POINTER* BarTimer;
          Invaliade_POINTER* StartTimeX;
          Invaliade_POINTER* StartTimeY;//must class declared

          Invaliade_POINTER()
          {         Invaliade_POINTER* pButtonX      = new Invaliade_POINTER();
                    Invaliade_POINTER* pButtonY      = new Invaliade_POINTER();
                    Invaliade_POINTER* pBarTimer     = new Invaliade_POINTER();
                    Invaliade_POINTER* pStartTimeX   = new Invaliade_POINTER();//
          }
          // !!!!!!!!!!FINDAFTER ALL //in detruction  destructor kill all variable of class..
};
//
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//--- void &operator++() { return; /*its so dengeures  to all over app operators damaged all line after*/ }
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| A structure for operations with complex numbers                  |
//+------------------------------------------------------------------+
struct ComplexNumbers
{         //+------------------------------------------------------------------+
          //| A structure for operations with complex numbers                  |
          //+------------------------------------------------------------------+
          // Operation Overloading
          // For ease of code reading and writing, overloading of some operations is allowed.
          // Overloading operator is written using the keyword operator. The following operators can be overloaded:
          //
          // binary +,-,/,*,%,<<,>>,==,!=,<,>,<=,>=,=,+=,-=,/=,*=,%=,&=,|=,^=,<<=,>>=,&&,||,&,|,^
          // unary +,-,++,--,!,~
          // assignment operator =
          // indexing operator []
          //+------------------------------------------------------------------+
          ////Those are member initializers.
          ////When the object is created with that constructor, the members are initialized according to those.
          ////So re gets set to r. And im gets set to i.
          //This syntax can also be used to pass parameters to the constructors of a superclass.
          ///derived sub object member  .... initialize the members of a class. ((Updating))
          //If you do not initialize your members in this way,
          //they will get default-initialized.
          //+------------------------------------------------------------------+
          //| A structure for operations with complex numbers                  |
          //+------------------------------------------------------------------+
          //==========================================================================================
          //==========================================================================================
          //==========================================================================================
          //--- Pure Variables
          double            re; // Real part
          double            im; // Imaginary part
          //==========================================================================================
          //==========================================================================================
          //==========================================================================================
          //--- Constructors functions Got parameters                           ///all constructors are function
          ComplexNumbers(): re(0.0), im(0.0) {  }                               ///non parameter/// init zerooo
          ComplexNumbers(const double r): re(r), im(0.0) {  }                   ///one param /// in it frist by sending normal r (not&))///by one basic variables build
          ComplexNumbers(const double r, const double i): re(r), im(i) {  }     ///two param ///by basic variables build
          ComplexNumbers(const ComplexNumbers &o): re(o.re), im(o.im) { }       ///one param by oject member build////(o.re) //object has  all data member ,method member
          //--- ComplexNumbers(const typename(this) &o): re(o.re), im(o.im) { }       ///one param by oject member build////(o.re) //object has  all data member ,method member
          //==========================================================================================
          //==========================================================================================
          //==========================================================================================
          //--- Binary operations
          ComplexNumbers operator+(const ComplexNumbers &r) const { return(Add(this, r)); } //'this' - parameter conversion not allowed     Learn.mqh 1555      70
          ComplexNumbers operator-(const ComplexNumbers &r) const { return(Sub(this, r)); } ////complex complex::Sub(const complex &l, const complex &r) const
          ComplexNumbers operator*(const ComplexNumbers &r) const { return(Mul(this, r)); }
          ComplexNumbers operator/(const ComplexNumbers &r) const { return(Div(this, r)); }

          //---- Overloading the "unary minus" operator
          ComplexNumbers        operator-() const  { ComplexNumbers res; res.re = -re; res.im = -im; return res; } //--Overloading the "unary minus" operator

          //--- Overloading the "logical negation" operator
          bool                  operator!() const { return (re != 0 && im != 0);} // Negation   ///return non class type///>>.

          //--- Are the real and imaginary parts of the complex number equal to zero?
          //---Now we can check the value of a complex number for zero and get a negative value :

          //==========================================================================================
          //==========================================================================================
          //==========================================================================================
          //--- Unary operators
          //--- Binary operations Overloding


          //complex &operator++(const complex &r) const { return(Div(this, r)); }'&' - reference cannot used  Learn.mqh 1438      19
          //--- Arithmetic operations          ///for real calculation use & for parameters of functions send and returnvalue in self parameter
          ComplexNumbers        Add_(const ComplexNumbers &l, const ComplexNumbers &r) const; // Addition///'const' - const modifier not allowed for static functions   Learn.mqh 1428      76
          ComplexNumbers        Sub_(const ComplexNumbers &l, const ComplexNumbers &r) const; // Subtraction
          ComplexNumbers        Mul_(const ComplexNumbers &l, const ComplexNumbers &r) const; // Multiplication
          ComplexNumbers        Div_(const ComplexNumbers &l, const ComplexNumbers &r) const; // Division
          //------------------------------------------------------------------------------
          ComplexNumbers        Add(const ComplexNumbers &l, const ComplexNumbers &r) const { ComplexNumbers res; res.re = l.re + r.re; res.im = l.im + r.im; return res; }  // Addition
          ComplexNumbers        Sub(const ComplexNumbers &l, const ComplexNumbers &r) const { ComplexNumbers res; res.re = l.re - r.re; res.im = l.im - r.im; return res; }  // Subtraction
          ComplexNumbers        Mul(const ComplexNumbers &l, const ComplexNumbers &r) const { ComplexNumbers res; res.re = l.re * r.re - l.im * r.im; res.im = l.re * r.im + l.im * r.re; return res; }
          ComplexNumbers        Div(const ComplexNumbers &l, const ComplexNumbers &r) const
          {         //--- Empty complex number
                    ComplexNumbers res(EMPTY_VALUE, EMPTY_VALUE);
                    //--- Check for zero
                    if(r.re == 0 && r.im == 0)
                    {         Print(__FUNCTION__ + ": number is zero");
                              return(res); }
                    //--- Auxiliary variables
                    double e;
                    double f;
                    //--- Selecting calculation variant
                    if(MathAbs(r.im) < MathAbs(r.re))
                    {         e = r.im / r.re;
                              f = r.re + r.im * e;
                              res.re = (l.re + l.im * e) / f;
                              res.im = (l.im - l.re * e) / f; }
                    else
                    {         e = r.re / r.im;
                              f = r.im + r.re * e;
                              res.re = (l.im + l.re * e) / f;
                              res.im = (-l.re + l.im * e) / f; }
                    //--- Result
                    return res; //
          }
          //==========================================================================================
          //==========================================================================================
          //==========================================================================================
          void OnStartx2()
          {         //--- Declare and initialize variables of type complex
                    ComplexNumbers a(2, 4), b(-4, -2);
                    PrintFormat("a=%.2f+i*%.2f,   b=%.2f+i*%.2f", a.re, a.im, b.re, b.im);
                    //--- Divide the two numbers
                    ComplexNumbers z = a / b;
                    PrintFormat("a/b=%.2f+i*%.2f", z.re, z.im);
                    //--- A complex number is equal to zero by default (in the default constructor re==0 and im==0)
                    ComplexNumbers zero;
                    Print("!zero=", !zero);
                    //--- Assign a negative value
                    zero = -z;
                    PrintFormat("z=%.2f+i*%.2f,  zero=%.2f+i*%.2f", z.re, z.im, zero.re, zero.im);
                    PrintFormat("-zero=%.2f+i*%.2f", -zero.re, -zero.im);
                    //--- Check for zero once again
                    Print("!zero=", !zero);
                    //---
                    //--- Declare and initialize variables of type complex
                    ComplexNumbers a_(2, 4), b_(-4, -2);
                    PrintFormat("a=%.2f+i*%.2f,   b=%.2f+i*%.2f", a_.re, a_.im, b_.re, b_.im);
                    //a.re=5;
                    //a.im=1;
                    //b.re=-1;
                    //b.im=-5;
                    //--- Sum up two numbers
                    z = a + b;
                    PrintFormat("a+b=%.2f+i*%.2f", z.re, z.im);
                    //--- Multiply two numbers
                    z = a * b;
                    PrintFormat("a*b=%.2f+i*%.2f", z.re, z.im);
                    //--- Divide two numbers
                    z = a / b;
                    PrintFormat("a/b=%.2f+i*%.2f", z.re, z.im);
                    //---
                    {         //PrintFormat("a=%.2f+i*%.2f,   b=%.2f+i*%.2f", a.re, a.im, b.re, b.im);
                              //--- Sum up two numbers
                              z = a.Add(a, b);
                              //PrintFormat("a+b=%.2f+i*%.2f", z.re, z.im);
                              //--- Multiply two numbers
                              z = a.Mul(a, b);
                              //PrintFormat("a*b=%.2f+i*%.2f", z.re, z.im);
                              //--- Divide two numbers
                              z = a.Div(a, b);
                              //PrintFormat("a/b=%.2f+i*%.2f", z.re, z.im);
                              //---
                    }//
                    {         //a.re=5;
                              //a.im=1;
                              //b.re=-1;
                              //b.im=-5;
                              //--- Sum up two numbers
                              z = a + b;
                              PrintFormat("a+b=%.2f+i*%.2f", z.re, z.im);
                              //--- Multiply two numbers
                              z = a * b;
                              PrintFormat("a*b=%.2f+i*%.2f", z.re, z.im);
                              //--- Divide two numbers
                              z = a / b;
                              PrintFormat("a/b=%.2f+i*%.2f", z.re, z.im);
                              //---
                    }//
                    {         //--- Sum up two numbers
                              z = a.Add(a, b);
                              PrintFormat("a+b=%.2f+i*%.2f", z.re, z.im);
                              //--- Multiply two numbers
                              z = a.Mul(a, b);
                              PrintFormat("a*b=%.2f+i*%.2f", z.re, z.im);
                              //--- Divide two numbers
                              z = a.Div(a, b);
                              PrintFormat("a/b=%.2f+i*%.2f", z.re, z.im);
                              //---
                    }//
                    {         PrintFormat("a=%.2f+i*%.2f,   b=%.2f+i*%.2f", a.re, a.im, b.re, b.im);
                              //--- Divide the two numbers
                              z = a / b;///////////////////////////////>>>>>>>>>>>rError??/// its are object or instance of class cant use simple operators...
                              PrintFormat("a/b=%.2f+i*%.2f", z.re, z.im);
                              //--- A complex number is equal to zero by default (in the default constructor re==0 and im==0)
                              Print("!zero=", !zero);
                              //--- Assign a negative value
                              zero = -z;
                              PrintFormat("z=%.2f+i*%.2f,  zero=%.2f+i*%.2f", z.re, z.im, zero.re, zero.im);
                              PrintFormat("-zero=%.2f+i*%.2f", -zero.re, -zero.im);
                              //--- Check for zero once again
                              Print("!zero=", !zero);
//----------------------------------------------------------------
                    }//
          }//

          ///Most unary operations for classes can be overloaded as ordinary functions that accept
          //a single class object argument or a pointer to it. Add overloading of unary operations "-" and "!".
};
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void _OnStartCRowCMatrix()
{
//--- Operations of addition and multiplication of matrices
          CMatrix A(3), B(3), C();
//--- Prepare an array for rows
          double a1[3] = {1, 2, 3 }, a2[3] = {2, 3, 1 }, a3[3] = {3, 1, 2 };
          double b1[3] = {3, 2, 1 }, b2[3] = {1, 3, 2 }, b3[3] = {2, 1, 3 };
//--- Fill the matrices
          A[0] = a1; A[1] = a2; A[2] = a3;
          B[0] = b1; B[1] = b2; B[2] = b3;
//--- Output the matrices in the Experts log
          Print("---- Elements of matrix A");
          Print(A.String());
          Print("---- Elements of matrix B");
          Print(B.String());
//--- Addition of matrices
          Print("---- Addition of matrices A and B");
          C = A + B;
//--- Output the formatted string representation
          Print(C.String());
//--- Multiplication of matrices
          Print("---- Multiplication of matrices A and B");
          C = A * B;
          Print(C.String());
//--- Now we show how to get values in the style of dynamic arrays matrix[i][j]
          Print("Output the values of matrix C elementwise");
//--- Go through the matrix rows - CRow objects - in a loop
          for(int i = 0; i < 3; i++)
          {         string com = "| ";
                    //--- Form rows from the matrix for the value
                    for(int j = 0; j < 3; j++)
                    {         //--- Get the matrix element by the number of the row and column
                              double element = C[i][j]; // [i] - Access to CRow in the array m_rows[] ,
                              // [j] - Overloaded operator of indexing in CRow
                              com = com + StringFormat("a(%d,%d)=%G ; ", i, j, element); }
                    com += "|";
                    //--- Output the values of the row
                    Print(com); } }
//+------------------------------------------------------------------+
//| Class "Row"                                                      |
//+------------------------------------------------------------------+
class CRow
{
private:
          double            m_array[];
public:
          //--- Constructors and a destructor
          CRow(void)          { ArrayResize(m_array, 0);    }
          CRow(const CRow &r) { this = r;                    }
          CRow(const double &array[]);
          ~CRow(void) {};
          //--- Number of elements in the row
          int               Size(void) const    { return(ArraySize(m_array));}
          //--- Returns a string with values
          string            String(void) const;
          //--- Indexing operator
          double            operator[](int i) const  { return(m_array[i]);   }
          //--- Assignment operators
          void              operator=(const double  &array[]); // An array
          void              operator=(const CRow & r);         // Another CRow object
          double            operator*(const CRow &o);          // CRow object for multiplication
};
//+------------------------------------------------------------------+
//| Constructor for initializing a row with an array                 |
//+------------------------------------------------------------------+
void  CRow::CRow(const double &array[])
{         int size = ArraySize(array);
//--- If the array is not empty
          if(size > 0)
          {         ArrayResize(m_array, size);
                    //--- Fill with values
                    for(int i = 0; i < size; i++)
                              m_array[i] = array[i]; }
//---
}
//+------------------------------------------------------------------+
//| Assignment operation for the array                               |
//+------------------------------------------------------------------+
void CRow::operator=(const double &array[])
{         int size = ArraySize(array);
          if(size == 0) return;
//--- Fill the array with values
          ArrayResize(m_array, size);
          for(int i = 0; i < size; i++) m_array[i] = array[i];
//---
}
//+------------------------------------------------------------------+
//| Assignment operation for CRow                                    |
//+------------------------------------------------------------------+
void CRow::operator=(const CRow  &r)
{         int size = r.Size();
          if(size == 0) return;
//--- Fill the array with values
          ArrayResize(m_array, size);
          for(int i = 0; i < size; i++) m_array[i] = r[i];
//---
}
//+------------------------------------------------------------------+
//| Operator of multiplication by another row                        |
//+------------------------------------------------------------------+
double CRow::operator*(const CRow &o)
{         double res = 0;
//--- Verifications
          int size = Size();
          if(size != o.Size() || size == 0)
          {         Print(__FUNCSIG__, ": Failed to multiply two matrices, their sizes are different");
                    return(res); }
//--- Multiply arrays elementwise and add the products
          for(int i = 0; i < size; i++)
                    res += m_array[i] * o[i];
//--- Result
          return(res); }
//+------------------------------------------------------------------+
//| Returns a formatted string representation                        |
//+------------------------------------------------------------------+
string CRow::String(void) const
{         string out = "";
//--- If the size of the array is greater than zero
          int size = ArraySize(m_array);
//--- We work only with a non-zero number of array elements
          if(size > 0)
          {         out = "{";
                    for(int i = 0; i < size; i++)
                    {         //--- Collect the values to a string
                              out += StringFormat(" %G;", m_array[i]); }
                    out += " }"; }
//--- Result
          return(out); }
//+------------------------------------------------------------------+
//| Class "Matrix"                                                   |
//+------------------------------------------------------------------+
class CMatrix
{
private:
          CRow              m_rows[];

public:
          //--- Constructors and a destructor
          CMatrix(void);
          CMatrix(int rows)  { ArrayResize(m_rows, rows);             }
          ~CMatrix(void) {};
          void CMatrix::CMatrix(const CMatrix &o ) {};
          //-------------------------------------------------------------
          int               Rows()       const { return(ArraySize(m_rows));            }//--- Get the matrix sizes
          int               Cols()       const { return(Rows() > 0 ? m_rows[0].Size() : 0); }//--- Get the matrix sizes
          CRow              GetColumnAsRow(const int col_index) const;//--- Returns the value of the column in the form of a CRow row
          string            String(void) const;          //--- Returns a string with the matrix values
          CRow             *operator[](int i) const        { return(GetPointer(m_rows[i]));        }//--- The indexing operator returns a string by its number
          CMatrix           operator+(const CMatrix &m); //--- Addition operator
          CMatrix           operator*(const CMatrix &m);  //--- Multiplication operator
          CMatrix          *operator=(const CMatrix &m); //--- Assignment operator
};
//+------------------------------------------------------------------+
//| Default constructor, create and array of rows of zero size       |
//+------------------------------------------------------------------+
CMatrix::CMatrix(void)
{
//--- The zero number of rows in the matrix
          ArrayResize(m_rows, 0);
//---
}
//+------------------------------------------------------------------+
//| Returns the column value in the form of CRow                     |
//+------------------------------------------------------------------+
CRow  CMatrix::GetColumnAsRow(const int col_index) const
{
//--- A variable to get the values from the column
          CRow row();
//--- The number of rows in the matrix
          int rows = Rows();
//--- If the number of rows is greater than zero, execute the operation
          if(rows > 0)
          {         //--- An array to receive the values of the column with index col_index
                    double array[];
                    ArrayResize(array, rows);
                    //--- Filling the array
                    for(int i = 0; i < rows; i++)
                    {         //--- Check the number of the column for row i - it may exceed the boundaries of the array
                              if(col_index >= this[i].Size())
                              {         Print(__FUNCSIG__, ": Error! Column number ", col_index, "> row size ", i);
                                        break; // row will be uninitialized object
                              }
                              array[i] = this[i][col_index]; }
                    //--- Create a CRow row based on the array values
                    row = array; }
//--- Result
          return(row); }
//+------------------------------------------------------------------+
//| Addition of two matrices                                         |
//+------------------------------------------------------------------+
CMatrix CMatrix::operator+(const CMatrix &m)
{
//--- The number of rows and columns in the passed matrix
          int cols = m.Cols();
          int rows = m.Rows();
//--- The matrix to receive the addition results
          CMatrix res(rows);
//--- The sizes of the matrix must match
          if(cols != Cols() || rows != Rows())
          {         //--- Addition impossible
                    Print(__FUNCSIG__, ": Failed to add two matrices, their sizes are different");
                    return(res); //
          }
//--- Auxiliary array
          double CMatrix_arr[];
          ArrayResize(CMatrix_arr, cols);
//--- Go through rows to add
          for(int i = 0; i < rows; i++)
          {         //--- Write the results of addition of matrix strings in the array
                    for(int k = 0; k < cols; k++)
                    {         CMatrix_arr[k] = this[i][k] + m[i][k]; }
                    //--- Place the array to the matrix row
                    res[i] = CMatrix_arr; }
//--- return the result of addition of matrices
          return(res);//
}
//+------------------------------------------------------------------+
//| Multiplication of two matrices                                   |
//+------------------------------------------------------------------+
CMatrix CMatrix::operator*(const CMatrix &m)
{
//--- Number of columns of the first matrix, number of rows passed in the matrix
          int cols1 = Cols();
          int rows2 = m.Rows();
          int rows1 = Rows();
          int cols2 = m.Cols();
//--- Matrix to receive the addition result
          CMatrix res(rows1);
//--- Matrices should be coordinated
          if(cols1 != rows2)
          {         //--- Multiplication impossible
                    Print(__FUNCSIG__, ": Failed to multiply two matrices, format is not compatible "
                          "- number of columns in the first factor should be equal to the number of rows in the second");
                    return(res); }
//--- Auxiliary array
          double CMatrix_arr[];
          ArrayResize(CMatrix_arr, cols1);
//--- Fill the rows in the multiplication matrix
          for(int i = 0; i < rows1; i++) // Go through rows
          {         //--- Reset the receiving array
                    ArrayInitialize(CMatrix_arr, 0);
                    //--- Go through elements in the row
                    for(int k = 0; k < cols1; k++)
                    {         //--- Take values of column k of the matrix m in the for of CRow
                              CRow column = m.GetColumnAsRow(k);
                              //--- Multiply two rows and write the result of scalar multiplication of vectors in the i-th element
                              CMatrix_arr[k] = this[i] * column; }
                    //--- place array arr[] in the i-th row of the matrix
                    res[i] = CMatrix_arr; }
//--- Return the product of two matrices
          return(res);//
}
//+------------------------------------------------------------------+
//| Assignment operation                                             |
//+------------------------------------------------------------------+
CMatrix *CMatrix::operator=(const CMatrix &m)
{
//--- Find and set the number of rows
          int rows = m.Rows();
          ArrayResize(m_rows, rows);
//--- Fill our rows with the values of rows of  the passed matrix
          for(int i = 0; i < rows; i++) this[i] = m[i];
//---
          return(GetPointer(this));//
}
//+------------------------------------------------------------------+
//| String representation of the matrix                              |
//+------------------------------------------------------------------+
string CMatrix::String(void) const
{         string out = "";
          int rows = Rows();
//--- Form string by string
          for(int i = 0; i < rows; i++)
          {         out = out + this[i].String() + "\r\n"; }
//--- Result
          return(out); //
}
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Class to access symbols in string as in array of symbols         |
//+------------------------------------------------------------------+
class CString
{         string            m_string;

public:
          CString(string str = NULL): m_string(str) { }
          ushort operator[] (int x) { return(StringGetCharacter(m_string, x)); }

          void OnStart_CString()
          {
//--- An array for receiving symbols from a string
                    int     x[] = { 19, 4, 18, 19, 27, 14, 15, 4, 17, 0, 19, 14, 17, 27, 26, 28, 27, 5, 14,
                                    17, 27, 2, 11, 0, 18, 18, 27, 29, 30, 19, 17, 8, 13, 6 };
                    CString str("abcdefghijklmnopqrstuvwxyz[ ]CS");
                    string  res;
//--- Make up a phrase using symbols from the str variable
                    for(int i = 0, n = ArraySize(x); i < n; i++)
                    {         res += ShortToString(str[x[i]]); }
//--- Show the result
                    Print(res);//
          }



};

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//ASCII Printable Characters
//Char    Number    Description
//        0 - 31    Control characters (see below)
//        32        space
//!       33        exclamation mark
//"       34        quotation mark
//#       35        number sign
//$       36        dollar sign
//%       37        percent sign
//&       38        ampersand
//'       39        apostrophe
//(       40        left parenthesis
//)       41        right parenthesis
//*       42        asterisk
//+       43        plus sign
//,       44        comma
//-       45        hyphen
//.       46        period
///       47        slash
//0       48        digit 0
//1       49        digit 1
//2       50        digit 2
//3       51        digit 3
//4       52        digit 4
//5       53        digit 5
//6       54        digit 6
//7       55        digit 7
//8       56        digit 8
//9       57        digit 9
//:       58        colon
//;       59        semicolon
//<       60        less-than
//=       61        equals-to
//>       62        greater-than
//?       63        question mark
//@       64        at sign
//A       65        uppercase A
//B       66        uppercase B
//C       67        uppercase C
//D       68        uppercase D
//E       69        uppercase E
//F       70        uppercase F
//G       71        uppercase G
//H       72        uppercase H
//I       73        uppercase I
//J       74        uppercase J
//K       75        uppercase K
//L       76        uppercase L
//M       77        uppercase M
//N       78        uppercase N
//O       79        uppercase O
//P       80        uppercase P
//Q       81        uppercase Q
//R       82        uppercase R
//S       83        uppercase S
//T       84        uppercase T
//U       85        uppercase U
//V       86        uppercase V
//W       87        uppercase W
//X       88        uppercase X
//Y       89        uppercase Y
//Z       90        uppercase Z
//[       91        left square bracket
//\       92        backslash
//]       93        right square bracket
//^       94        caret
//_       95        underscore
//`       96        grave accent
//a       97        lowercase a
//b       98        lowercase b
//c       99        lowercase c
//d       100       lowercase d
//e       101       lowercase e
//f       102       lowercase f
//g       103       lowercase g
//h       104       lowercase h
//i       105       lowercase i
//j       106       lowercase j
//k       107       lowercase k
//l       108       lowercase l
//m       109       lowercase m
//n       110       lowercase n
//o       111       lowercase o
//p       112       lowercase p
//q       113       lowercase q
//r       114       lowercase r
//s       115       lowercase s
//t       116       lowercase t
//u       117       lowercase u
//v       118       lowercase v
//w       119       lowercase w
//x       120       lowercase x
//y       121       lowercase y
//z       122       lowercase z
//{       123       left curly brace
//|       124       vertical bar
//}       125       right curly brace
//~       126       tilde
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
////#include <orderfunctions.mqh>
//#include <eafunctions.mqh>
////#include <expiration.mqh>
////#include <moneymanagement.mqh>
////#include <strfunctions.mqh>
//
//extern double lotsize = 0.1;
//extern double lotsize2 = 0.1;
//
//
///*extern int money_management = 0; // 1=from stoploss, 2=only from account size
//extern double mm1_riskpercent = 3;
//extern double mm2_ref_balance = 10000;
//extern double mm2_ref_lot = 3;*/
//
//extern double _slippage_open = 3;
//extern double _slippage_close = 5;
//extern double stoploss = 20;
//extern double takeprofit = 40;
//extern double takeprofit2 = 60;
//
//
//extern double breakevenat = 20;
//extern double trailingstop_activate = 20;
//extern double trailingstop = 20;
//extern double trailingstop_step = 1;
//
///*
//extern int starthour = 0;
//extern int startminute = 0;
//extern int endhour = 24;
//extern int endminute = 0;
//*/
//
//
//extern int ma_period = 35;
//extern int ma_method = 1;
//extern int ma_shift = 0;
//
//extern int macd_fast_ema_period = 6;
//extern int macd_slow_ema_period = 13;
//extern int macd_signal_period = 5;
//extern int macd_applied_price = 0;
//
//extern int stoch_k_period = 5;
//extern int stoch_d_period = 3;
//extern int stoch_slowing = 3;
//extern int stoch_ma_method = 0;
//extern int stoch_price_field = 0;
//extern double stoch_oversold_level = 20;
//extern double stoch_overbought_level = 80;
//
//
//
////extern bool signal_enabled;
//extern int bar = 1;
//extern int timeframe = 0;
//
//extern bool signal_ma_enabled = true;
//extern bool signal_macd_enabled = true;
//extern bool signal_stoch_enabled = true;
//extern bool signal_momentum_candle_enabled = true;
////extern bool closesignal_color_enabled = true;
//
//extern string indicator_name = "";
//extern int arrow_barsback = 0;
//
//extern bool long_enabled = true;
//extern bool short_enabled = true;
//extern bool reverse_strategy = false;
//extern bool oneperbar = true;
//extern bool trade_only_signal_change = true;
//extern bool trade_on_start = false;
//extern bool enableclose = true;
//extern bool openafterclose = true;
//extern int maxorders = 1;
//
//extern bool _orderbymarket = false;
//
//extern int _stealth_sl = 0;
//extern int _stealth_tp = 0;
//
//extern int _magic = 1234;
//extern int _sleepok = 500;
//extern int _sleeperr = 1000;
//
//#include <gow_inc_for_ea.mqh>
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int init()
//{         variables_init();
//          variables_priceinit();
//          if (isfractional())
//          {         fractd(breakevenat);
//                    fractd(trailingstop_activate);
//                    fractd(trailingstop);
//                    fractd(trailingstop_step);
//                    fractd(takeprofit2); }
//          initalize_first();
//          /*if (money_management)
//          {
//          addaccountbalance = _addaccountbalance;
//          addfixbalance = _addfixbalance;
//          }*/
//          save_variables();
//          return(0); }
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int deinit()
//{         return(0); }
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int signal_samplearrow()
//{         int signal = SIGNAL_NO;
//          for (int i = 0; i <= arrow_barsback; i++)
//          {         double up = iCustom(symbol, timeframe, indicator_name, 0, bar);
//                    double dn = iCustom(symbol, timeframe, indicator_name, 1, bar);
//                    signal = signal_arrow(up, dn);
//                    if (signal != SIGNAL_NO) break; }
//          addcomment("arrow signal: ", signaltext(signal), "\n");
//          return(signal); }
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int signal_ma()
//{         int signal = SIGNAL_NO;
//          double close = iClose(symbol, timeframe, bar);
//          double open = iOpen(symbol, timeframe, bar);
//          double ema_h1 = iMA(symbol, timeframe, ma_period, ma_shift, ma_method, PRICE_HIGH, bar);
//          double ema_l1 = iMA(symbol, timeframe, ma_period, ma_shift, ma_method, PRICE_LOW, bar);
//          double ema_c1 = iMA(symbol, timeframe, ma_period, ma_shift, ma_method, PRICE_CLOSE, bar);
//          double ema_h2 = iMA(symbol, timeframe, ma_period, ma_shift, ma_method, PRICE_HIGH, bar + 1);
//          double ema_l2 = iMA(symbol, timeframe, ma_period, ma_shift, ma_method, PRICE_LOW, bar + 1);
//          double ema_c2 = iMA(symbol, timeframe, ma_period, ma_shift, ma_method, PRICE_CLOSE, bar + 1);
//          addcomment("ma signal: ", signaltext(signal), "\n");
//          return(signal); }
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int signal_macd()
//{         int signal = SIGNAL_NO;
//          double macd_main1 = iMACD(symbol, timeframe, macd_fast_ema_period, macd_slow_ema_period, macd_signal_period, macd_applied_price, MODE_MAIN, bar);
//          double macd_main2 = iMACD(symbol, timeframe, macd_fast_ema_period, macd_slow_ema_period, macd_signal_period, macd_applied_price, MODE_MAIN, bar + 1);
//          double macd_sig1 = iMACD(symbol, timeframe, macd_fast_ema_period, macd_slow_ema_period, macd_signal_period, macd_applied_price, MODE_SIGNAL, bar);
//          double macd_sig2 = iMACD(symbol, timeframe, macd_fast_ema_period, macd_slow_ema_period, macd_signal_period, macd_applied_price, MODE_SIGNAL, bar + 1);
//          if( (macd_sig2 >= 0 && macd_sig1 < 0) || (macd_sig2 <= 0 && macd_sig1 > 0)) signal = SIGNAL_BOTH;
//          addcomment("macd signal: ", signaltext(signal), "\n");
//          return(signal); }
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int signal_stoch()
//{         int signal = SIGNAL_NO;
//          double stoch_main1 = iStochastic(symbol, timeframe, stoch_k_period, stoch_d_period, stoch_slowing, stoch_ma_method, stoch_price_field, MODE_MAIN, bar);
//          double stoch_main2 = iStochastic(symbol, timeframe, stoch_k_period, stoch_d_period, stoch_slowing, stoch_ma_method, stoch_price_field, MODE_MAIN, bar + 1);
//          double stoch_sig1 = iStochastic(symbol, timeframe, stoch_k_period, stoch_d_period, stoch_slowing, stoch_ma_method, stoch_price_field, MODE_SIGNAL, bar);
//          double stoch_sig2 = iStochastic(symbol, timeframe, stoch_k_period, stoch_d_period, stoch_slowing, stoch_ma_method, stoch_price_field, MODE_SIGNAL, bar + 1);
//          if(stoch_main1 <= stoch_oversold_level) signal = SIGNAL_BUY;
//          if(stoch_main1 >= stoch_overbought_level) signal = SIGNAL_SELL;
//          addcomment("stochastic signal: ", signaltext(signal), "\n");
//          return(signal); }
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int signal_momentum_candle()
//{         int signal = SIGNAL_NO;
//          double close = iClose(symbol, timeframe, bar);
//          double open = iOpen(symbol, timeframe, bar);
//          double ema_h1 = iMA(symbol, timeframe, ma_period, ma_shift, ma_method, PRICE_HIGH, bar);
//          double ema_l1 = iMA(symbol, timeframe, ma_period, ma_shift, ma_method, PRICE_LOW, bar);
//          if(close > open && close > ema_h1) signal = SIGNAL_BUY;
//          if(close < open && close < ema_l1) signal = SIGNAL_SELL;
//          addcomment("momentum candle signal: ", signaltext(signal), "\n");
//          return(signal); }
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int signal()
//{         int signal = -1;
//          if (signal_ma_enabled) signal = signaladd(signal, signal_ma());
//          if (signal_macd_enabled) signal = signaladd(signal, signal_macd());
//          if (signal_stoch_enabled) signal = signaladd(signal, signal_stoch());
//          if (signal_momentum_candle_enabled) signal = signaladd(signal, signal_momentum_candle());
//          return(signal); }
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int closesignal()
//{         int signal = SIGNAL_NO;
////if (closesignal_color_enabled) signal = signaladd_or(signal,signal_samplecolor());
//          return(signal); }
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int start()
//{         addcomment("www.metatraderprogrammer.com\n");
//          /*if (realalert("Run this software on demo account only!\n"))
//          {
//          return(0);
//          }*/
//          realalert();
//          variables_priceinit();
//          isfirsttick(timeframe);
//          bool enableopen = true;
//          int signal = signal();
//          int closesignal = closesignal();
//          /*if (isexpired(1000,01,01))
//          {
//          signal = 0;
//          enableopen = false;
//          }*/
//          /*if (!istradinghours(starthour,endhour,startminute,endminute))
//          {
//          enableopen = false;
//          addcomment("out of trading hours\n");
//          }*/
//          signalhandler (
//                    signal,
//                    closesignal,
//                    enableopen,
//                    /*trade_only_at_firsttick*/ (bar == 1),
//                    trade_only_signal_change,
//                    oneperbar,
//                    trade_on_start,
//                    timeframe,
//                    /*comments*/ true,
//                    reverse_strategy,
//                    1);
//          if (signal != 0)
//          {         if (enableopen)
//                    {         /*if (money_management == 1)
//                              {
//                              moneymanagement_init();
//                              lotsize = mmgetlot_stoploss(stoploss, mm1_riskpercent);
//                              }*/
//                              /*if (money_management == 2)
//                              {
//                              moneymanagement_init();
//                              lotsize = mmgetlot_ref_balance(mm2_ref_lot, mm2_ref_balance);
//                              }*/
//                              addcomment("signal happened\n");
//                              if (IsTesting())
//                                        Alert(commentstring); }
//                    int cnt;
//                    if (signal == SIGNAL_BUY)
//                    {         if (!openafterclose) cnt = cnt_orders(ORDERSELECT_ANY);
//                              if (enableclose) close_all(ORDERSELECT_SHORT);
//                              if (openafterclose) cnt = cnt_orders(ORDERSELECT_ANY);
//                              if (enableopen && cnt < maxorders && long_enabled)
//                              {         marketorder(OP_BUY, lotsize, stoploss, takeprofit);
//                                        marketorder(OP_BUY, lotsize2, stoploss, takeprofit2); } }
//                    if (signal == SIGNAL_SELL)
//                    {         if (!openafterclose) cnt = cnt_orders(ORDERSELECT_ANY);
//                              if (enableclose) close_all(ORDERSELECT_LONG);
//                              if (openafterclose) cnt = cnt_orders(ORDERSELECT_ANY);
//                              if (enableopen && cnt < maxorders && short_enabled)
//                              {         marketorder(OP_SELL, lotsize, stoploss, takeprofit);
//                                        marketorder(OP_SELL, lotsize2, stoploss, takeprofit2); } } }
//          if (closesignal == SIGNAL_BUY)
//          {         close_all(ORDERSELECT_SHORT); }
//          if (closesignal == SIGNAL_SELL)
//          {         close_all(ORDERSELECT_LONG); }
//          if (closesignal == SIGNAL_BOTH)
//          {         close_all(ORDERSELECT_ANY); }
//          if (!IsTesting())
//          {         save_variables();
//                    variables_priceinit();
//                    run(); }
////trailingstop(breakevenat,trailingstop,trailingstop_activate,trailingstop_step);
////if (!IsTesting()) move_line_to_sl();
//          stealth_run();
//          if (IsTesting() && isfirsttick)
//                    Alert(commentstring[0]);
//          writecomment();
//          delcomment();
//          return(0); }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//if(0)
//          for(int i = 0; i < 500; i++)
//          {         ///ShortToString  ///converts the symbol code (unicode) into one-symbol string and returns resulting string.
//                    ///
//                    string Ab = ShortToString((uchar)(0x0000) + (uchar)(i) );
//                    string Ac = ShortToString((uchar)(0xAAAA) + (uchar)(i) );
//                    string Ad = ShortToString((uchar)(0x0999) + (uchar)(i) );
//                    string d  = ShortToString((uchar)(0x23AE) + (uchar)(i) );
//                    string xd = ShortToString((uchar)(0xEB5E) + (uchar)(i) );
//                    string AAxd = ShortToString( 0xF10A);
//                    uchar  array[] = { 'o', 'o', 'd', ' ', 'm', 'o', 'r', 'n', 'i', 'n', 'g' }; ///accept const onlyy
//                    string AAxdX = CharArrayToString( array, 2, -1, CP_UTF8 );
//                    string xsd = "  ? ☏  ☕  ♔       ♹ ? U +\xE11D \x007a - 4  \x6B  \x2660 1";
//                    LBL_Test.Create("LBL_Test", AAxdX + AAxd + Ab + Ac + Ad + d + xd,    (int)(530.4), (int) (153.6),                                                                       CORNER_RIGHT_LOWER, ANCHOR_CENTER, false, clrWhite, 0, 33, "Webdings"); //"Segoe UI Emoji"); ///"Verdana"); ////"Segoe  MDL2 Assets"); //"Segoe UI Emoji");// "Tampico Curr_Symbol");
//                    Sleep(100);
//                    LBL_Test.Label_.Delete(); }
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//template<typename T1, typename _T1_, typename T2, typename T3, typename _T3_, typename T4>
//class MDL_Condition: public BlockCalls
//{
//public: /* Input Parameters */
//          T1         Lo; virtual _T1_ _Lo_() {return(_T1_)0;}
//          T2         compare;
//          T3         Ro; virtual _T3_ _Ro_() {return(_T3_)0;}
//          T4         crosswidth;
//          virtual void _callback_(int r) {return;} //
//} //
//==========================================================================================================================================
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//===================================================================================================Very nice!
//You really use the language to its fullest capacity
//Pointer to the function
//A pointer to a function is generally defined in the following format
//typedef function_result_type (*Function_name_type)(list_of_input_parameters_types);
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||Accepted///>>><<<
#include <arrays/arrayobj.mqh>
typedef bool (*FilterFunc)(CObject*);///>>>>????define as pointer!!!!!!!
template <typename T>
class objvector : public CArrayObj
{
protected:
          CArrayObj   m_garbage_collector;
public:
          T          operator[](const int index)const {return this.At(index);}
          objvector<T>* filter(FilterFunc func)
          {         objvector<T>* new_vector = new objvector<T>();
                    m_garbage_collector.Add(new_vector);
                    new_vector.FreeMode(false);
                    int size = this.Total();
                    for (int i = 0; i < size; i++)
                              if (func(this[i]))new_vector.Add(this[i]);
                    return new_vector; //
          } //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class XTrade : public CObject
{
public:
          int        ticket;
          double     profit;
          XTrade(int _ticket)
          {         if (OrderSelect(_ticket, SELECT_BY_TICKET))
                    {         ticket = _ticket;
                              profit = OrderProfit(); //
                    }//
          } //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool fWin(CObject *obj) {return ((XTrade*)obj).profit > 0;  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool fWin2(XTrade *obj) {return ((XTrade*)obj).profit > 0;  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool fLose(CObject *obj) {return ((XTrade*)obj).profit < 0; }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool fSymbol(CObject *obj)  //>>!!!!!!!!!!!bongoo///obj pass by pointer
{         return (OrderSelect(((XTrade*)obj).ticket, SELECT_BY_TICKET) && OrderSymbol() == _Symbol); //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart3ClassNested()
{         objvector<XTrade*> all, *winners, *losers, *my_symbol_losers;
          for (int i = 0; OrderSelect(i, SELECT_BY_POS, MODE_HISTORY); i++)all.Add(new XTrade(OrderTicket()));
          winners = all.filter(fWin);
          losers = all.filter(fLose);
          my_symbol_losers = losers.filter(fSymbol);
          printf("winners=%d, losers=%d, all=%d", winners.Total(), losers.Total(), all.Total()); //
}
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//==========================================================================================================================================
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Script program start function      Class Nested                  |
//+------------------------------------------------------------------+
class outer
{
public:
          string     Name;
          outer       *Super;
          //  static outer      *Super;
          //private  class iner
          //=================================================================
          class iner
          {
          public:
                    string Color;
                    //outer  Parent;  //ERROR//undefined class 'outer' cannot be used        Class Nested.mq4    36        27
                    //outer  &Parent;   //'&' - reference cannot used   Class Nested.mq4    26        28
                    outer  *Parent;   //'&' - reference cannot used         Class Nested.mq4    26        28

                    iner(outer &ClasOuter, string name)
                    {         ClasOuter.Name = name; //
                              //outer parent = outer::Super = ClasOuter; //  //'Super' - undeclared identifier  Class Nested.mq4    28        46
                              outer parent = ClasOuter; //
                              ClasOuter.Name = name; //
//===============================================
                              Parent = new outer(); ///mean tha on program runed and classes are constructed,, >>> adding place in memory for Parent one
                              // Super.Name = Parent.Name = name;  //'Super' - undeclared identifier          Class Nested.mq4    35        31
                              Parent.Name = name; ////2021.12.07 19:56:06.193    Class Nested EURUSD,H4: invalid pointer access in 'Class Nested.mq4' (37,31)
                              //     Alert("ok" + __FUNCSIG__ + (string)__LINE__); //
                    }

          };
          void OnStartClassNested()
          {
//---
                    outer OutObj;  //ok
///=============================
                    //Alert("ok_52 " + (string)__LINE__ );
                    iner InObj(OutObj, "grandFather");  //2021.12.07 19:53:18.283   <<<<<<<<<<  Class Nested EURUSD,H4: invalid pointer access in 'Class Nested.mq4' (34,31)
                    // Alert("ok_54 " + (string)__LINE__ );
//======================
                    Alert("In.Parent.Name: " + InObj.Parent.Name);///<<<<solved by new operator... line 35
                    Alert("Out.Name: " + OutObj.Name); ///<<<<solved by new operator... line 35
                    Alert("ok" + (string)__LINE__ + "OnStart");
//
                    //try {}                  //'try' - undeclared identifier   Class Nested.mq4    61        1
//OnInit2();//
//
//
          }
          //=================================================================

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|           function calling  methodf                              |
//+------------------------------------------------------------------+
void somefunc(double init,
              double sec = 0.0001, //set default values
              int level = 10)

{         int error_code = 0;    ErrorDescription(error_code); }

;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void minu()
{         //...
//somefunc();                      // Wrong call. The first parameter must be presented.
          somefunc(3.14);                  // Correct call
          somefunc(3.14, 0.0002);          // Correct call
          somefunc(3.14, 0.0002, 10);      // Correct call
// When calling a function, one may not skip parameters, even those having default values:
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/// somefunc(3.14,, 10);            // Wrong call -> the second parameter was skipped.     return; }
}


//+------------------------------------------------------------------+
//|                    Passing parameters by value                   |
//+------------------------------------------------------------------+
double FirstMethod(int i, int j)   //////difrreent name....difrrent memory addrees block  cant got value given just
{         double res;
//---
          i *= 2;
          j /= 2;
          res = i + j;
//---
          return(res); }
//////////////////////////
double FirstMethod2()
{
//---
          int a = 14, b = 8;
          Print("a and b before call:", a, " ", b);
          double d = FirstMethod(a, b); //////difrreent name....difrrent memory addrees block  cant got value given just
          Print("a and b after call:", a, " ", b); return d ; }
//--- Result of script execution
//  a and b before call: 14 8   !!!!!!!!!
//  a and b after call: 14 8    !!!!!!!!!!    no change happen  because adress not abtained...and writen by last runing

//+------------------------------------------------------------------+
//| Passing parameters by reference                                  |
//+------------------------------------------------------------------+
double SecondMethod(int &i, int &j)   ///in defining & means send values in parameter ..the return give res just or executble of block
{         double res;
//---
          i *= 2;            ///difrreent name....same memory addrees block
          j /= 2;   ///not return but it has value  ending algoritm... memory block value...
          res = i + j;    ///initialising res
//---
          return(res); }
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStarts()
{
//---
          int a = 14, b = 8;
          Print("a and b before call:", a, " ", b);
          double d = SecondMethod(a, b);   ///by & it change value of variables
          Print("a and b after call:", a, " ", b); }
//+------------------------------------------------------------------+
//--- result of script execution
//  a and b before call: 14 8  !!!!!!!!!!!!!!
//  a and b after call: 28 4   !!!!!!!!!!!!!    the value of parameter in the memory address of block parameter sended  or addres copy in the  memory adress in function parameters



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart4()
{
//---
          int a[] = {0, 1, 2 };
          int i = 0;
          func5(a[i], a[i++], "First call (i = " + string(i) + ")");
          func5(a[i++], a[i], "Second call (i = " + string(i) + ")");
// Result:
// First call (i = 0) : par1 = 1     par2 = 0
// Second call (i = 1) : par1 = 1     par2 = 1
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void func5(int par1, int par2, string comment)
{         Print(comment, ": par1 = ", par1, "    par2 = ", par2); }

//+------------------------------------------------------------------+
//| Passing parameters by value                                      |
//+------------------------------------------------------------------+
////MQL4 uses both methods, with one exception: arrays, structure type variables and class objects are always passed by reference.
//// In order to avoid changes in actual parameters (arguments passed at function call) use the access specifier const. When trying
////to change the contents of a variable declared with the const specifier, the compiler will generate an error.
//////void ma(void)
//////{         int x3;
//////          int *p;  // * is used in the declaration:
//////          int x;
//////          x3(void): p(NULL)
//////// p is a pointer to an integer, since (after dereferencing),
//////// *p is an integer
//////                    x = 0;
//////// now x == 0
//////          p = &x;  // & takes the address of x
//////// now *p == 0, since p == &x and therefore *p == x
//////          *p = 1;  // equivalent to x = 1, since p == &x
//////// now *p == 1 and x == 1
//////          const {  return(p); } };
/////////////////////////////////////
//+------------------------------------------------------------------+
//|                                                       Object.mqh |
//|                   Copyright 2009-2013, MetaQuotes Software Corp. |
//|                                              http://www.mql4.com |
//+------------------------------------------------------------------+
//#include "StdLibErr.mqh"
//+------------------------------------------------------------------+
//| Class CObject.                                                   |
//| Purpose: Base class for storing elements.                        |
//+------------------------------------------------------------------+
class CObject1
{
private:
          CObject1          *m_prev2;   ///by pouryaa   ///declaring   ///the clas not defined yeet object crated after }braket
          CObject1          *m_next2;    ///by pouryaa
          CObject1          *m_prev;               // previous item of list
          CObject1          *m_next;               // next item of list
          ///int              bar6 ;                  ////THE OBJECT OF CLASS DEFINING IN CLASS BY *BEFOR

public:
//--- The principal base class for the Microsoft Foundation Class Library.   CObject(void):
//--- Inheritance Hierarchy      CObject   Requirements {Header: afx.h }
//--- defining Object name..... class has owning  by constractor initilasing
          CObject1(void): m_prev(NULL), m_next(NULL), m_prev2(NULL), m_next2(NULL) {};   ///;  cause stop defining of constuctor   ////for acceesssing object
          ~CObject1(void)                                                                {                 }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          //--- methods to access protected data
          CObject1          *Prev(void)                                    const { return(m_prev); }
          void              Prev(CObject1 *node)                                 { m_prev = node;    }
          ///////
          CObject1          *Next(void)                                    const { return(m_next); }
          void              Next(CObject1 *node)                                 { m_next = node;    }
          /////
          CObject1          *prev2(void)                                    const { return(m_prev2); }   ////use return declared ubject
          void              prev2(CObject1 *node)                                 { m_prev2 = node;    }
          /////
          CObject1          *next2(void)                                    const { return(m_next2); }   ////use return declared ubject    ///declaring function next  to catch data member  ///must not be data memberr!
          void              next2(CObject1 *node)                                 { m_next2 = node;    }  //  puting value node  for object sellecter  //  m_next2(CObject *node)     must not data member... in declaring

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
          //--- methods for working with files
          virtual bool      Save(const int file_handle)                         { return(true);   }
          virtual bool      Load(const int file_handle)                         { return(true);   }
          //--- method of identifying the object
          virtual int       Type(void)                                    const { return(0);      }
          //--- method of comparing the objects
          virtual int       Compare(const CObject *node, const int mode = 0) const { return(0);      }

};   //return 0 mean working currectly
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class bar_bar
{
public:
          int bar6 ;
          bar_bar    *fff;   ///beacuse fff not have any thing value its null
          void       bar_bar(void);   ///constructor must be void  type  //   int  bar_bar(void);
          ~bar_bar(void);  ///semiclon after class end   ///cant initialising in inter face just in costractor can
          void static geter() {};

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bar_bar::  bar_bar(void)  ///void bar_bar::  bar_bar(void)   initialition class
{         int  bar4 = 5; int bar44 = 5;  bar6 = 5; } ////constructor has not any type ,,,   BUT  the publick not need  its wrong
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//virtual CRuntimeClass* GetRuntimeClass() const;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bar_bar* fff ;
////int * fsff;///>>>>isnt Class or structor Object///
void functon4()
{         // bar_bar::geter();
          bar_bar oo;
          ; ////return vaue of fff
//   int newbar = bar_bar * fff
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void functon7(int &bar44 )  ///void functon7(int &bar44, int,  bar_bar * fff )
{         bar_bar vonline, vonline2;
          bar_bar bar33, violer, bar44w;
          if( false)
          {         ///////////CFile and CObList CObject
                    violer = vonline2  ;
                    bar_bar          * m_next3 = dynamic_cast<bar_bar *>(&vonline); } };
//////bar_bar          * m_next77 = dynamic_cast<bar_bar *>(&vonline); } };
//////bar_bar          * m_next7 = dynamic_cast<bar_bar *>(&vonline); } };
///this got v object by data member has initialising  int   bar6 = 5;
////////////////////////////////////////////////////
////virtual CRuntimeClass* GetRuntimeClass() const;
////Return Value
////A pointer to the CRuntimeClass structure corresponding to this object's class; never NULL.
////////////////////////////////////////////////////
//+------------------------------------------------------------------+
//////////////////void mca(void)
//////////////////{
////////////////////--- Gravitational acceleration
//////////////////          double g = 9.8;
//////////////////          double round_g = (int)g;
//////////////////          double math_round_g = MathRound(g);
//////////////////          Print("round_g = ", round_g);
//////////////////          Print("math_round_g = ", math_round_g);
//////////////////          /*
//////////////////             Result:
//////////////////             round_g = 9
//////////////////             math_round_g = 10
//////////////////          */
//////////////////          {         char   c1 = 3;
////////////////////--- First example
//////////////////                    double d2 = c1 / 2 + 0.3;
//////////////////                    Print("c1/2 + 0.3 = ", d2);
//////////////////// Result:   c1/2+0.3 = 1.3
////////////////////--- Second example
//////////////////                    d2 = c1 / 2.0 + 0.3;
//////////////////                    Print("c1/2.0 + 0.3 = ", d2);
//////////////////// Result:   c1/2.0+0.3 = 1.8
//////////////////          } }
//////////////////
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
////Typecasting of Numeric Types
////
////In the expressions of the MQL4 language both explicit and implicit typecasting can be used. The explicit typecasting is written as follows:
////
////
////
////var_1 = (type)var_2;
////
////
////An expression or function execution result can be used as the var_2 variable. The function style notation of the explicit typecasting is also possible:
////
////
////
////var_1 = type(var_2);
////
////
////Let's consider an explicit typecasting on the basis of the first example.
////
////
////
//////--- Third example
////   double d2=(double)c1/2+0.3;
////   Print("(double)c1/2 + 0.3 = ",d2);
////// Result:   (double)c1/2+0.3 = 1.80000000
////
////
////Before the division operation is performed, the c1 variable is explicitly cast to the double type. Now the integer constant 2 is cast to the value 2.0 of the double type, because as a result of converting the first operand has taken the double type. In fact, the explicit typecasting is a unary operation.
////
////Besides, when trying to cast types, the result may go beyond the permissible range. In this case, the truncation occurs. For example:
////
////
////
////   char c;
////   uchar u;
////   c=400;
////   u=400;
////   Print("c = ",c); // Result c=-112
////   Print("u = ",u); // Result u=144
////
////
////Before operations (except for the assignment ones) are performed, the data are converted into the maximum priority type. Before assignment operations are performed, the data are cast into the target type.
////
////Examples:
////
////
////
////   int    i=1/2;        // no types casting, the result is 0
////   Print("i = 1/2  ",i);
////
////   int k=1/2.0;         // the expression is cast to the double type,
////   Print("k = 1/2  ",k);  // then is to the target type of int, the result is 0
////
////   double d=1.0/2.0;    // no types casting, the result is 0.5
////   Print("d = 1/2.0; ",d);
////
////   double e=1/2.0;      // the expression is cast to the double type,
////   Print("e = 1/2.0; ",e);// that is the same as the target type, the result is 0.5
////
////   double x=1/2;        // the expression of the int type is cast to the double target typr,
////   Print("x = 1/2; ",x);  // the result is 0.0
////
////
////When converting  long/ulong type into double, precision may be lost in case the integer value is greater than 9223372036854774784 or less than -9223372036854774784.
////
////
////
////void OnStart()
////  {
////   long l_max=LONG_MAX;
////   long l_min=LONG_MIN+1;
//////--- define the highest integer value, which does not lose accuracy when being cast to double
////   while(l_max!=long((double)l_max))
////      l_max--;
//////--- define the lowest integer value, which does not lose accuracy when being cast to double
////   while(l_min!=long((double)l_min))
////      l_min++;
//////--- derive the found interval for integer values
////   PrintFormat("When casting an integer value to double, it must be "
////               "within [%I64d, %I64d] interval",l_min,l_max);
//////--- now, let's see what happens if the value falls out of this interval
////   PrintFormat("l_max+1=%I64d, double(l_max+1)=%.f, ulong(double(l_max+1))=%I64d",
////               l_max+1,double(l_max+1),long(double(l_max+1)));
////   PrintFormat("l_min-1=%I64d, double(l_min-1)=%.f, ulong(double(l_min-1))=%I64d",
////               l_min-1,double(l_min-1),long(double(l_min-1)));
//////--- receive the following result
////// When casting an integer value to double, it should be within [-9223372036854774784, 9223372036854774784] interval
////// l_max+1=9223372036854774785, double(l_max+1)=9223372036854774800, ulong(double(l_max+1))=9223372036854774784
////// l_min-1=-9223372036854774785, double(l_min-1)=-9223372036854774800, ulong(double(l_min-1))=-9223372036854774784
////  }
////
//+------------------------------------------------------------------+
//Typecasting for the String Type
//
//The string type has the highest priority among simple types. Therefore, if one of operands of an operation is of the string type, the second operand will be cast to a string automatically. Note that for a string, a single dyadic two - place operation of addition is possible. The explicit casting of string to any numeric type is allowed.
//
//Examples :
//
//
//
//                    string s1 = 1.0 / 8;        // the expression is cast to the double type,
//Print("s1 = 1.0/8; ", s1);    //  then is to the target type of string,
//// result is "0.12500000" (a string containing 10 characters)
//
//string s2 = NULL;           // string deinitialization
//Print("s2 = NULL; ", s2);     // the result is an empty string
//string s3 = "ct_Ticket N" + 12345; // the expression is cast to the string type
//Print("s3 = \"ct_Ticket N\"+12345", s3);
//
//string str1 = "true";
//string str2 = "0,255,0";
//string str3 = "2009.06.01";
//string str4 = "1.2345e2";
//Print(bool(str1));
//Print(color(str2));
//Print(datetime(str3));
//Print(double(str4));
//+------------------------------------------------------------------+
////Typecasting of Simple Structure Types            Simple Structure Types
////
////Data of the simple structures type can be assigned to each other only if all the members of both structures are of numeric types.
////In this case both operands of the assignment operation (left and right) must be of the structures type.
////The member-wise casting is not performed, a simple copying is done. If the structures are of different sizes,
////the number of bytes of the smaller size is copied. Thus the absence of union in MQL4 is compensated.
////
////                              Examples:
////
////
////
////struct str1
////{         double  d; };                // double  x; string name; string last_name; dataType attrebiut;
//////---
////struct str2
////{         long    l; };
//////---
////struct str3
////{         int     low_part;
////          int     high_part; };
//////---
////struct str4
////{         string  s; };
//////+------------------------------------------------------------------+
////void OnStart()
////{         str1 s1;                //str ali;   //str1 student;
////          str2 s2;
////          str3 s3;
////          str4 s4;
//////---
////          s1.d = MathArcsin(2.0);      // get the invalid number -1. # IND    /// s1.name = "ali"; s1.last_name = "rasuli"; dataType attrebiut;
////          s2 = s1;                                      /it meannn st1 parameters can used by s2
////          printf("1.  %f    %I64X", s1.d, s2.l);
//////---
////          s3 = s2;
////          printf("2.  high part of long %.8X   low part of long %.8X",
////                 s3.high_part, s3.low_part);
//////---
////          s4.s = "some constant string";
////          s3 = s4;
////          printf("3.  buffer len is %d   constant string address is 0x%.8X",
////                 s3.low_part, s3.high_part); }
////
//////////+------------------------------------------------------------------+
////Another example illustrates the method of organizing a custom function for receiving RGB (Red, Green, Blue) representation from the color type.
////Create two structures of the same size but with different contents. For convenience, let's add a function returning the RGB representation of a color as a string.
////
////
////
////#property script_show_inputs
////          input color          testColor = clrBlue; // set color for testing
//////--- structure for representing color as RGB
////struct RGB
////{         uchar             blue;          // blue component of color
////          uchar             green;         // green component of color
////          uchar             red;           // red component of color
////          uchar             empty;         // this byte is not used
////          string            toString();    // function for receiving a string         ////////////toString();    // function for receiving a string
////};
//////--- function for showing color as a string
////string RGB::toString(void)                 ///structure Fanction implaning.........
////{         string out = "(" + (string)red + ":" + (string)green + ":" + (string)blue + ")";          /conver  uchar value to string representing
////          return out; }
//////--- structure for storing of the built-in color type
////struct builtColor
////{         color             c; };
//////+------------------------------------------------------------------+
//////| Script program start function                                    |
//////+------------------------------------------------------------------+
////void OnStart()
////{
//////--- a variable for storing in RGB
////          RGB colorRGB;
//////--- variable for storing the color type
////          builtColor test;
////          test.c = testColor;           //////#property script_show_inputs
//////--- casting two structures by copying contents
////          colorRGB = test;                                     ///  object assining///
////          Print("color ", test.c, "=", colorRGB.toString());         /the value of colorRBG set from test object of BuiltColor
//////---
////}

//==============================================================================================================
//==============================================================================================================
//==============================================================================================================
//==============================================================================================================
//+------------------------------------------------------------------+
//This means that the compiler does not check the data type applied    /// if wrong mean  pointer NULL
//+------------------------------------------------------------------+
////Typecasting of Base Class Pointers to Pointers of Derivative Classes
////
////Objects of the open generated class can also be viewed as objects of the corresponding base class.
//This leads to some interesting consequences. For example, despite the fact that objects of different classes,
//generated by a single base class, may differ significantly from each other, we can create a linked list (List) of them,
//as we view them as objects of the base type. But the converse is not true: the base class objects are not automatically objects of a derived class.
////
//// You can use the explicit casting to convert the base class pointers to the pointers of a derived class.
//But you must be fully confident in the admissibility of such a transformation, because otherwise a critical runtime error
//will occur and the mql4 program will be stopped.
////
////Dynamic typecasting using dynamic_cast operator
////
////Dynamic typecasting is performed using dynamic_cast operator that can be applied only to pointers to classes.
//Type validation is performed at runtime. This means that the compiler does not check the data type applied
//for typecasting when dynamic_cast operator is used. If a pointer is converted to a data type which is not the actual type of an object, the result is NULL.
////
////dynamic_cast < type - id > ( expression )
////
////The type - id parameter in angle brackets should point to a previously defined class type. Unlike C++, expression operand type can be of any value except for void.
////
//Example :
////
class CBar { };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CFoo : public CBar { };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart1s()
{         CBar bar;
//--- dynamic casting of *bar pointer type to *foo pointer is allowed
          CFoo *foo = dynamic_cast<CFoo *>(&bar); // no critical error
          Print(foo);                             // foo=NULL
//--- an attempt to explicitly cast a Bar type object reference to a Foo type object is forbidden
          foo = (CFoo *)&bar;                     // critical runtime error
          Print(foo);                             // this string is not executed
}
//==============================================================================================================
//==============================================================================================================
//==============================================================================================================
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| The calculation of average for an array of double type           |
//+------------------------------------------------------------------+
double AverageFromArray(const double &array[], int size)
{         if(size <= 0) return 0.0;
          double sum = 0.0;
          double aver;
//---
          for(int i = 0; i < size; i++)
          {         sum += array[i];  // Summation for the double
          }
          aver = sum / size;   // Just divide the sum by the number
//---
          Print("Calculation of the average for an array of double type");
          return aver; }
//+------------------------------------------------------------------+
//| The calculation of average for an array of int type              |
//+------------------------------------------------------------------+
double AverageFromArray(const int &array[], int size)
{         if(size <= 0) return 0.0;
          double aver = 0.0;
          int sum = 0;
//---
          for(int i = 0; i < size; i++)
          {         sum += array[i];   // Summation for the int
          }
          aver = (double)sum / size; // Give the amount of type double, and divide
//---
          Print("Calculation of the average for an array of int type");
          return aver; }

//Each function contains the message output via the Print() function;

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart21()
{
//---
          int    a[5] = {1, 2, 3, 4, 5 };
          double b[5] = {1.1, 2.2, 3.3, 4.4, 5.5 };
          double int_aver = AverageFromArray(a, 5);
          double double_aver = AverageFromArray(b, 5);
          Print("int_aver = ", int_aver, "   double_aver = ", double_aver);//
}
//--- Result of the script
// Calculate the average for an array of int type
// Calculate the average for an array of double type
// int_aver= 3.00000000    double_aver= 3.30000000

//Algorithm of Choosing an Overloaded Function
//Use strict matching (if possible).
//Try standard type increase.
//Try standard typecasting.
//+------------------------------------------------------------------+
//|  Function overloading rules apply to overload of class methods.  |
//+------------------------------------------------------------------+
class Overloading
{         //Overloading of system functions is allowed, but it should be observed that the compiler
          //is able to accurately select the necessary function. For example,
          // we can overload the system function MathMax() in 4 different ways, but only two variants are correct.

          //Example:

          // 1. overload is allowed - function differs from built-in MathMax() function in the number of parameters
          double MathMax(double a, double b, double c) {return c;};

          // 2. overload is not allowed!
          // number of parameters is different, but the last has a default value
          // this leads to the concealment of the system function when calling, which is unacceptable
          //--- double MathMax(double a, double b, double c = DBL_MIN) {};

          // 3. overload is allowed - normal overload by type of parameters a and b
          double MathMax(int a, int b) {return b;};

          // 4. overload is not allowed!
          // the number and types of parameters are the same as in original double MathMax(double a,double b)
          int MathMax(double a, double b) {return (int)b;};//
};





//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnStart31()
{
//--- Operations of addition and multiplication of matrices
          CMatrix A(3), B(3), C();
//--- Prepare an array for rows
          double a1[3] = {1, 2, 3 }, a2[3] = {2, 3, 1 }, a3[3] = {3, 1, 2 };
          double b1[3] = {3, 2, 1 }, b2[3] = {1, 3, 2 }, b3[3] = {2, 1, 3 };
//--- Fill the matrices
          A[0] = a1; A[1] = a2; A[2] = a3;
          B[0] = b1; B[1] = b2; B[2] = b3;
//--- Output the matrices in the Experts log
          Print("---- Elements of matrix A");
          Print(A.String());
          Print("---- Elements of matrix B");
          Print(B.String());
//--- Addition of matrices
          Print("---- Addition of matrices A and B");
          C = A + B;
//--- Output the formatted string representation
          Print(C.String());
//--- Multiplication of matrices
          Print("---- Multiplication of matrices A and B");
          C = A * B;
          Print(C.String());
//--- Now we show how to get values in the style of dynamic arrays matrix[i][j]
          Print("Output the values of matrix C elementwise");
//--- Go through the matrix rows - CRow objects - in a loop
          for(int i = 0; i < 3; i++)
          {         string com = "| ";
                    //--- Form rows from the matrix for the value
                    for(int j = 0; j < 3; j++)
                    {         //--- Get the matrix element by the number of the row and column
                              double element = C[i][j]; // [i] - Access to CRow in the array m_rows[] ,
                              // [j] - Overloaded operator of indexing in CRow
                              com = com + StringFormat("a(%d,%d)=%G ; ", i, j, element); }
                    com += "|";
                    //--- Output the values of the row
                    Print(com); }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//Description of External Functions
//External functions defined in another module must be explicitly described. The description includes returned type,
//function name and series of input parameters with their types. The absence of such a description can lead to errors when
//compiling, building, or executing a program. When describing an external object, use the keyword #import indicating the module.
//
//Examples:

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CFoo_
{
public:
          int            GetLastError() { return(12345); }
          void           func()
          {         Print(GetLastError());           // call of the class method
                    Print(::GetLastError());         // call of the MQL5 function
                    Print(kernel32::GetLastError()); // call of the DLL library function from kernel32.dll/////!!!!
                    Print(lib::GetLastError());      // call of the EX4 library function from lib.ex4
          }//
          void OnStart6()
          {         CFoo_ foo;
                    foo.func(); //
          } //
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//Exporting Functions
//A function declared in a mql4 program with the export postmodifier can be used in another mql4 program. Such a function is called exportable, and it can be called from other programs after compilation.

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void FunctionExport() export
{ }

//This modifier orders the compiler to add the function into the table of EX4 functions exported by this ex4 file.
// Only function with such a modifier are accessible ("visible") from other mql4 programs.
//
//The library property tells the compiler that the EX4-file will be a library, and the compiler will show it in the header of EX4.
//
//All functions that are planned as exportable ones must be marked with the export modifier.
//
//When compiling libraries in the strict mode, the export modifier should be added for each exported function,
//otherwise the function will not be accessible from outside.
//---
//---
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
///tick counter.... by the returen of value in the end of block...ontick functions


////////////////////////////////////
////void OnInit();
//// return
////INIT_SUCCEEDED
////INIT_FAILED
////INIT_PARAMETERS_INCORRECT
////////////////////////////////////
//void OnDeinit(const int reason);
////////////////////////////////////
////+------------------------------------------------------------------+
//OnTick
//The NewTick event is generated for Expert Advisors only when a new tick for a symbol is received, to the chart of which the Expert Advisor is attached. It's useless to define the OnTick() function in a custom indicator or script, because the NewTick event is not generated for them.
//
//The Tick event is generated only for Expert Advisors, but this does not mean that Expert Advisors required the OnTick() function, since not only NewTick events are generated for Expert Advisors, but also events of Timer, BookEvent and ChartEvent are generated. It must be declared as the void type, with no parameters:
//
//void OnTick();
////+------------------------------------------------------------------+
//Event Handling Functions
//The MQL4 language provides processing of some predefined events. Functions for handling these events must be defined in a MQL4 program; function name, return type, composition of parameters (if there are any) and their types must strictly conform to the description of the event handler function.
//
//The event handler of the client terminal identifies functions, handling this or that event, by the type of return value and type of parameters. If other parameters, not corresponding to below descriptions, are specified for a corresponding function, or another return type is indicated for it, such a function will not be used as an event handler.

//OnStart
//The OnStart() function is the Start event handler, which is automatically generated only for running scripts. It must be of void type, with no parameters:
//
//void OnStart();
//
//For the OnStart() function, the int return type can be specified.
//
//OnInit
//The OnInit() function is the Init event handler. It must be of void or int type, with no parameters:
//
//void OnInit();
//
//The Init event is generated immediately after an Expert Advisor or an indicator is downloaded; The OnInit() function is used for initialization. If OnInit() has the int type of the return value, the non-zero return code means unsuccessful initialization, and it generates the Deinit event with the code of deinitialization reason REASON_INITFAILED.
//
//OnInit() function execution result is analyzed by the terminal's runtime subsystem only if the program has been compiled using #property strict.
//
//To optimize input parameters of an Expert Advisor, it is recommended to use values of the ENUM_INIT_RETCODE enumeration as the return code.. During initialization of an Expert Advisor before the start of testing you can request information about the configuration and resources using the TerminalInfoInteger() function.
//
//ENUM_INIT_RETCODE
//
//Identifier
//
//Description
//
//INIT_SUCCEEDED
//
//Successful initialization, testing of the Expert Advisor can be continued.
//
//This code means the same as a null value — the Expert Advisor has been successfully initialized in the tester.
//
//INIT_FAILED
//
//Initialization failed; there is no point in continuing testing because of fatal errors. For example, failed to create an indicator that is required for the work of the Expert Advisor.
//
//This return value means the same as a value other than zero - initialization of the Expert Advisor in the tester failed.
//
//INIT_PARAMETERS_INCORRECT
//
//This value means the incorrect set of input parameters. The result string containing this return code is highlighted in red in the general optimization table.
//
//Testing for the given set of parameters of the Expert Advisor will not be executed
//
//The OnInit() function of the void type always denotes successful initialization.
//
//OnDeinit
//The OnDeinit() function is called during deinitialization and is the Deinit event handler. It must be declared as the void type and should have one parameter of the const int type, which contains the code of deinitialization reason. If a different type is declared, the compiler will generate a warning, but the function will not be called.
//
//void OnDeinit(const int reason);
//
//The Deinit event is generated for Expert Advisors and indicators in the following cases:
//
//before reinitialization due to the change of a symbol or chart period, to which the mql4 program is attached;
//before reinitialization due to the change of input parameters;
//before unloading the mql4 program.
//OnTick
//The NewTick event is generated for Expert Advisors only when a new tick for a symbol is received, to the chart of which the Expert Advisor is attached. It's useless to define the OnTick() function in a custom indicator or script, because the NewTick event is not generated for them.
//
//The Tick event is generated only for Expert Advisors, but this does not mean that Expert Advisors required the OnTick() function, since not only NewTick events are generated for Expert Advisors, but also events of Timer, BookEvent and ChartEvent are generated. It must be declared as the void type, with no parameters:
//
//void OnTick();
//
//OnTimer
//The OnTimer() function is called when the Timer event occurs, which is generated by the system timer only for Expert Advisors and indicators - it can't be used in scripts. The frequency of the event occurrence is set when subscribing to notifications about this event to be received by the EventSetTimer() function.
//
//You can unsubscribe from receiving timer events for a particular Expert Advisor using the EventKillTimer() function. The function must be defined with the void type, with no parameters:
//
//void OnTimer();
//
//It is recommended to call the EventSetTimer() function once in the OnInit() function, and the EventKillTimer() function should be called once in OnDeinit().
//
//Every Expert Advisor, as well as every indicator works with its own timer and receives events only from it. As soon as the mql4 program stops operating, the timer is destroyed forcibly, if it was created but hasn't been disabled by the EventKillTimer() function.
//
//OnTester
//The OnTester() function is the handler of the Tester event that is automatically generated after a history testing of an Expert Advisor on the chosen interval is over. The function must be defined with the double type, with no parameters:
//
//double OnTester();
//
//The function is called right before the call of OnDeinit() and has the same type of the return value - double. OnTester() can be used only in the testing of Expert Advisors. Its main purpose is to calculate a certain value that is used as the Custom max criterion in the genetic optimization of input parameters.
//
//In the genetic optimization descending sorting is applied to results within one generation. I.e. from the point of view of the optimization criterion, the best results are those with largest values (for the Custom max optimization criterion values returned by the OnTester function are taken into account). In such a sorting, the worst values are positioned at the end and further thrown off and do not participate in the forming of the next generation.
//
//OnChartEvent
//OnChartEvent() is the handler of a group of ChartEvent events:
//
//CHARTEVENT_KEYDOWN  event of a keystroke, when the chart window is focused;
//CHARTEVENT_MOUSE_MOVE  mouse move events and mouse click events (if CHART_EVENT_MOUSE_MOVE=true is set for the chart);
//CHARTEVENT_OBJECT_CREATE  event of graphical object creation (if CHART_EVENT_OBJECT_CREATE=true is set for the chart);
//CHARTEVENT_OBJECT_CHANGE  event of change of an object property via the properties dialog;
//CHARTEVENT_OBJECT_DELETE  event of graphical object deletion (if CHART_EVENT_OBJECT_DELETE=true is set for the chart);
//CHARTEVENT_CLICK  event of a mouse click on the chart;
//CHARTEVENT_OBJECT_CLICK  event of a mouse click in a graphical object belonging to the chart;
//CHARTEVENT_OBJECT_DRAG  event of a graphical object move using the mouse;
//CHARTEVENT_OBJECT_ENDEDIT  event of the finished text editing in the entry box of the LabelEdit graphical object;
//CHARTEVENT_CHART_CHANGE   event of chart changes;
//CHARTEVENT_CUSTOM+n  ID of the user event, where n is in the range from 0 to 65535.
//CHARTEVENT_CUSTOM_LAST  the last acceptable ID of a custom event (CHARTEVENT_CUSTOM +65535).
//The function can be called only in Expert Advisors and indicators. The function should be of void type with 4 parameters:
//
//void OnChartEvent(const int id,         // Event ID
//                  const long& lparam,   // Parameter of type long event
//                  const double& dparam, // Parameter of type double event
//                  const string& sparam  // Parameter of type string events
//  );
//
//For each type of event, the input parameters of the OnChartEvent() function have definite values that are required for the processing of this event. The events and values passed through these parameters are listed in the table below.
//
//Event
//Value of the id parameter
//Value of the lparam parameter
//Value of the dparam parameter
//Value of the sparam parameter
//
//Event of a keystroke
//CHARTEVENT_KEYDOWN
//code of a pressed key
//Repeat count (the number of times the keystroke is repeated as a result of the user holding down the key)
//The string value of a bit mask describing the status of keyboard buttons
//Mouse events (if property CHART_EVENT_MOUSE_MOVE=true is set for the chart)
//CHARTEVENT_MOUSE_MOVE
//the X coordinate
//the Y coordinate
//The string value of a bit mask describing the status of mouse buttons
//Event of graphical object creation (if CHART_EVENT_OBJECT_CREATE=true is set for the chart)
//CHARTEVENT_OBJECT_CREATE
//Name of the created graphical object
//Event of change of an object property via the properties dialog
//CHARTEVENT_OBJECT_CHANGE
//Name of the modified graphical object
//Event of graphical object deletion (if CHART_EVENT_OBJECT_DELETE=true is set for the chart)
//CHARTEVENT_OBJECT_DELETE
//
//
//
//Name of the deleted graphical object
//Event of a mouse click on the chart
//CHARTEVENT_CLICK
//the X coordinate
//the Y coordinate
//
//Event of a mouse click in a graphical object belonging to the chart
//CHARTEVENT_OBJECT_CLICK
//the X coordinate
//the Y coordinate
//Name of the graphical object, on which the event occurred
//
//Event of a graphical object dragging using the mouse
//CHARTEVENT_OBJECT_DRAG
//Name of the moved graphical object
//Event of the finished text editing in the entry box of the LabelEdit graphical object
//CHARTEVENT_OBJECT_ENDEDIT
//
//Name of the LabelEdit graphical object, in which text editing has completed
//Event of chart Changes
//CHARTEVENT_CHART_CHANGE
//ID of the user event under the N number
//
//CHARTEVENT_CUSTOM+N
//Value set by the EventChartCustom() function
//Value set by the EventChartCustom() function
//Value set by the EventChartCustom() function
//
//==============================================================================================================
class OnCalculate_
{         //OnCalculate
          //The OnCalculate() function is called only in custom indicators when it's necessary to calculate
          //the indicator values by the Calculate event. This usually happens when a new tick is received for the symbol,
          // for which the indicator is calculated. This indicator is not required to be attached to any price chart of this symbol.

          //The OnCalculate() function must have a return type int.
          int OnCalculate_1 (const int rates_total,      // size of input time series
                             const int prev_calculated,  // bars handled in previous call
                             const datetime& time[],     // Time
                             const double& open[],       // Open
                             const double& high[],       // High
                             const double& low[],        // Low
                             const double& close[],      // Close
                             const long& tick_volume[],  // Tick Volume
                             const long& volume[],       // Real Volume
                             const int& spread[]         // Spread
                            );

          //Parameters of open[], high[], low[] and close[] contain arrays with open prices,
          //high and low prices and close prices of the current time frame.
          // The time[] parameter contains an array with open time values,
          // the spread[] parameter has an array containing the history of spreads
          //(if any spread is provided for the traded security).
          //The parameters of volume[] and tick_volume[] contain the history of trade and tick volume, respectively.

          //To determine the indexing direction of
          // time[], open[], high[], low[], close[], tick_volume[], volume[] and spread[],
          // call ArrayGetAsSeries(). In order not to depend on default values,
          // you should unconditionally call the ArraySetAsSeries() function for those arrays, which are expected to work with.

          //The first rates_total parameter contains the number of bars,//
          // available to the indicator for calculation, and corresponds to the number of bars available in the chart.
          //
          //We should note the connection between the return value of OnCalculate() //
          //and the second input parameter prev_calculated. During the function call, //
          //the prev_calculated parameter contains a value returned by OnCalculate() during previous call.
          //This allows for economical algorithms for calculating the custom indicator in order to avoid repeated calculations for those bars that haven't changed since the previous run of this function.

          //For this, it is usually enough to return the value of the rates_total parameter,
          //which contains the number of bars in the current function call.
          //If since the last call of OnCalculate() price data has changed
          //(a deeper history downloaded or history blanks filled), the value of the input parameter prev_calculated will be set to zero by the terminal.
          //
          //To understand it better, it would be useful to start the indicator, which code is attached below.
          //
          //Indicator Example:
          //
          //#property indicator_chart_window
          //#property indicator_buffers 1
          ////---- plot Line
          //#property indicator_label1  "Line"
          //#property indicator_type1   DRAW_LINE
          //#property indicator_color1  clrDarkBlue
          //#property indicator_style1  STYLE_SOLID
          //#property indicator_width1  1
          ////--- indicator buffers
          double         LineBuffer[];
          //+------------------------------------------------------------------+
          //| Custom indicator initialization function                         |
          //+------------------------------------------------------------------+
          int OnInit__()
          {         //--- indicator buffers mapping
                    SetIndexBuffer(0, LineBuffer, INDICATOR_DATA);
                    //---
                    return(INIT_SUCCEEDED);//
          }
          //+------------------------------------------------------------------ +
          //| Custom indicator iteration function                              |
          //+------------------------------------------------------------------ +
          int OnCalculate__3(const int rates_total,
                             const int prev_calculated,
                             const datetime& time[],
                             const double& open[],
                             const double& high[],
                             const double& low[],
                             const double& close[],
                             const long& tick_volume[],
                             const long& volume[],
                             const int& spread[])
          {         //--- Get the number of bars available for the current symbol and chart period
                    int bars = Bars(Symbol(), 0);
                    Print("Bars = ", bars, ", rates_total = ", rates_total, ",  prev_calculated = ", prev_calculated);
                    Print("time[0] = ", time[0], " time[rates_total-1] = ", time[rates_total - 1]);
                    //--- return value of prev_calculated for next call
                    return(rates_total); //
          }
          //+------------------------------------------------------------------+
          //| Custom indicator iteration function                              |
          //+------------------------------------------------------------------+
          int OnCalculate_2(const int rates_total,
                            const int prev_calculated,
                            const datetime& time[],
                            const double& open[],
                            const double& high[],
                            const double& low[],
                            const double& close[],
                            const long& tick_volume[],
                            const long& volume[],
                            const int& spread[])
          {         //--- Get the number of bars available for the current symbol and chart period
                    int bars = Bars(Symbol(), 0);
                    Print("Bars = ", bars, ", rates_total = ", rates_total, ",  prev_calculated = ", prev_calculated);
                    Print("time[0] = ", time[0], " time[rates_total-1] = ", time[rates_total - 1]);
                    //--- return value of prev_calculated for next call
                    return(rates_total);//
          } //
          int OnInit0()
          {         //--- indicator buffers mapping
                    SetIndexBuffer(0, LineBuffer, INDICATOR_DATA);
                    //---
                    return(INIT_SUCCEEDED); //
          }//

};
//==============================================================================================================


//+------------------------------------------------------------------+
struct MqlRates_
{         datetime time;         // Period start time
          double   open;         // Open price
          double   high;         // The highest price of the period
          double   low;          // The lowest price of the period
          double   close;        // Close price
          long     tick_volume;  // Tick volume
          int      spread;       // Spread
          long     real_volume;  // Trade volume
          //---
          bool OnReporter(MqlRates_ &reporter[] )
          {         double last_trend = reporter[1].close - reporter[3].close;
                    const bool closed = ((reporter[0].close > reporter[3].close) || false);
                    bool TrendDown;
                    //bool TrendUp;
                    switch (closed)
                    {         case false : TrendDown = true; return (true); break;
                              case true  : TrendDown  = true; return (true); break; //
                    }
                    return true;//
          }///
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

struct RateInfo/////old remnall.
{         unsigned int      ctm;   // bar open date
          double            open;  // Open price
          double            low;   // Low price
          double            high;  // High price
          double            close; // Close price
          double            vol;   // volume.
          //----------------------------------
#ifndef INT64
#define INT64 long
#endif
#ifndef UINT64
#define UINT64 ulong
#endif

#ifndef INT32
#define INT32 int
#endif
          ////--- Standard quote presentation in the ///new terminal version
          INT64             ctm_;               // open date and time
          double            open_;              // Open price (absolute value)
          double            high_;              // Low price
          double            low_;               // High price
          double            close_;             // Close price
          UINT64            vol_;               // tick volume
          INT32             spread_;            // spread
          UINT64            real_;              // trade volume
          //----------------------------------
#undef INT64
#undef UINT64
#undef INT32
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//
//Virtually any variable names (except for the reserved words) are possible, including special characters and points
//
//Variable names cannot have special characters and points.
//
//The list of the reserved words has been expanded. Thus, such widespread words as short, long, const, etc. cannot be used as names

struct _Name_
{
////This approach offers several advantages. First, by function name we can understand what it does - sets or gets the value of a class member.
////Secondly, perhaps in the future we will need to change the type of the m_name variable in the CPerson class or in any of its derivative classes.
          string            first_name;                 // name
          string            last_name;                  // last name
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CPerson
{
//In this case, we'll need just to change the implementation of functions SetName() and GetName(), while objects of the CPerson class will be
//available for using in a program without any code changes because the user will not even know that the data type of m_name has changed.
protected:   /////////////////user will not even know that the data type of m_name has changed.
          _Name_              m_name;       ///m "member"          // name   ////structure object m_name data member of class
public:
          void              SetName(string n) {         m_name.first_name = GetFirstName(n); m_name.last_name = GetLastName(n); };
          string            GetName() {return(m_name.first_name + " " + m_name.last_name);}
private:
          string            GetFirstName(string full_name)
          {         int pos = StringFind(full_name, " ");
                    if(pos > 0) StringSetCharacter(full_name, pos, 0);
                    return(full_name);//
          };
          string            GetLastName(string full_name)
          {         string ret_string;
                    int pos = StringFind(full_name, " ");
                    if(pos > 0) ret_string = StringSubstr(full_name, pos + 1);
                    else      ret_string = full_name;
                    return(ret_string); //.
          }; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Out2
{
//
class In2 { public: int i;};
          In2         out[2];
          //==============================
          void       Out2()
          {         out[1].i = 1;} //
          int OnInit2()
          {         In2 a; // Private Definition of In is visible here.
                    return(INIT_SUCCEEDED); //
          }
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Out
{         //MT4 has no concept of inner classes. It is the same as if you wrote them separately.
class In { public: int i;};
          In out[2];
          Out() {out[1].i = 1;}//
};
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
//|                  BEGIN-END                    |
//+------------------------------------------------------------------+
/*
         //***Simple mono if  else  0-nested
         {         if(condition1)
                   {         //******
                   }
                   else
                   {         //*********
                   }//
         }
         //***Simple mono if  else if 0-nested
         {         if(condition1)
                   {         //******
                   }
                   else if(condition2)   ///---if condition1 its never run block
                   {         //*********
                   }//
         }
          //***Simple mono if  double else if  0-nested///---  double else ont work,,, or triple.. mut else if need
         {         if(condition1)
                   {         //******
                   }
                   else if(condition2)   ///---if condition1 its never run block
                   {         //*********
                   }//
                  else if(condition3)   ///---if condition2 its never run block
                   {         //*********
                   }
         }
         //***Simple mono if  tripl else if  0-nested///---  double else ont work,,, or triple.. mut else if need
         {         if(condition1)
                   {         //******
                   }
                   else if(condition2)   ///---if condition1  is true its never run block
                   {         //*********
                   }//
                  else if(condition3)   ///---if condition2  is true its never run block
                   {         //*********
                   }
                   else if(condition4)   ///---if condition3 is true its never run block
                   {         //*********
                   }
         }

         //***Simple mono if  N else if 0-nested///---  double else ont work,,, or triple.. mut else if need
         {         if(condition1)
                   {         //******
                   }
                   else if(condition2)   ///---if condition1  is true its never run block
                   {         //*********
                   }//
                  else if(condition3)   ///---if condition2  is true its never run block
                   {         //*********
                   }
                   else if(condition4)   ///---if condition3 is true its never run block
                   {         //*********
                   }
                   N else if(conditionN)   ///---if condition3 is true its never run block
                   {         //*********
                   }
         }
           //***Simple mono if  else 6-nested
         {         if(condition1)
                   {         //******
                            if(condition2)
                           {         //******
                                       if(condition3)
                                           {         //******
                                               if(condition4)
                                                {         //******
                                                       if(condition5)
                                                        {         //******
                                                                 if(condition6)
                                                                {         //******
                                                                }
                                                               else
                                                               {         //*********
                                                               }//
                                                       }
                                                       else
                                                       {         //*********
                                                       }//
                                               }
                                               else
                                               {         //*********
                                               }//
                                       }
                                       else
                                       {         //*********
                                       }//
                           }
                           else
                           {         //*********
                           }//
                   }
                   else
                   {         //*********
                   }//
         }

         //***Simple double if else
         {         if(condition)
                   {         //******
                             if(condition2)
                             {         //******
                             }
                             else
                             {         //*********
                             }//
                   }
                   else
                   {         //*********
                             if(condition)
                             {         //******
                             }
                             else
                             {         //*********
                             }//
                   }//
         }
         //***Simple mono if else 3-nested both mono if els
         {         if(condition)
                   {         //******
                             if(condition)
                             {         //******
                                       if(condition)
                                       {         //******
                                       }
                                       else
                                       {         //*********
                                       }//
                             }
                             else
                             {         //******
                                       if(condition)
                                       {         //******
                                       }
                                       else
                                       {         //*********
                                       }//
                             }//
                   }
                   else
                   {         //*********
                             if(condition)
                             {         //******
                                       if(condition)
                                       {         //******
                                       }
                                       else
                                       {         //*********
                                       }//
                             }
                             else
                             {         //******
                                       if(condition)
                                       {         //******
                                       }
                                       else
                                       {         //*********
                                       }//
                             }//
                   }//
         }
         */

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
typedef int (*TFuncSolid)(int, int );
typedef int (*TFunc)(int a, int b);  //--- declare a pointer to a function that accepts two int parameters
//****** !typedef int int;//INTIGER;
//**********************************
//**********************************
const int Capacity2 = 10;
#define Capacity 10
int   xtr[Capacity];
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
/*
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class typer3_base
{
public:
                     typer3_base(void) {};
                    ~typer3_base(void) {}; //
          int        a; };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename typer2>
class Typer_Test
{
public:
                     Typer_Test(void) {};
                    ~Typer_Test(void) {};
          typer2     typer3__member;;
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename typer3>
class Typer_Test_2
{
public:
                     Typer_Test_2(void) {};
                    ~Typer_Test_2(void) {};
          typer3     typer3__member;;
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename typer_Demo>
class DemoTyper: public Typer_Test<typer_Demo>
{
public:
                     DemoTyper(void) {};
                    ~DemoTyper(void) {};
          typer_Demo typer_Demo_member;

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename typer_Demo>
class DemoTyper_2: public Typer_Test<typer_Demo>
{
public:
                     DemoTyper(void);
                    ~DemoTyper(void);
          typer_Demo typer_Demo_member;

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename typer_Demo_A>
class DemoTyper_3: public typer3_base//Typer_Test_2<Typer_Test<string>>   //-- 'Typer_Test' - template mismatch      MCV_Data_Model.mqh  154       27

{
public:
          template<typename typer_Demo_A>
                     DemoTyper_3<typer_Demo_A>::DemoTyper_3(void) ;
                    ~DemoTyper_3(void) {};

          DemoTyper<string> typer_Demo_member;
          Typer_Test<string> alfa;
          template<typename typer_Demo_A>
          bool  Action_NoObj ( int WhichMode, bool IsKey = false, bool Seted = false);

};
template<typename typer_Demo_A>
void DemoTyper_3<typer_Demo_A>::DemoTyper_3(void) {}
{}
//--
template<typename typer_Demo_A>
bool DemoTyper_3::Action_NoObj ( int WhichMode, bool IsKey = false, bool Seted = false)
{         return false;//
}
//
DemoTyper_3< string >  beta;
//+------------------------------------------------------------------+
*/
//+------------------------------------------------------------------+
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
