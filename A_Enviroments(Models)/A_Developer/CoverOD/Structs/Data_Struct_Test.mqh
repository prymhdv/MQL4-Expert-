//+------------------------------------------------------------------+
//||   ||||||||||                 A_DeveloperLib.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ---(((--No Dependency any--)))---
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\Structs_Pack.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

class CDS_Test
{
public:
          CDS_Test(void) {};
          ~CDS_Test(void) {};
          CDSList  gCDSList;
          void    MainTest_List()
          {
//
                    CDSObject           *ptrCDSObject;     ptrCDSObject       = new CDSObject();
                    CDSObject           *ptrCDSObject_1;   ptrCDSObject_1     = new CDSObject();
                    CDSObject           *ptrCDSObject_2;   ptrCDSObject_2     = new CDSObject();
//
                    CDSList              objCDSList;        //--create
//
                    objCDSList.Add(ptrCDSObject);               //---add
                    objCDSList.Add(ptrCDSObject_1);
                    objCDSList.Add(ptrCDSObject_2);
//
                    objCDSList.GetNextNode();
//
                    objCDSList.Delete(1);                            //--delete idx 1
//
                    objCDSList.DeleteCurrent();                      //--delete Current idx last
//
                    objCDSList.Clear();                              //--clear
//
                    delete ptrCDSObject; delete ptrCDSObject_1;  delete ptrCDSObject_2;
//
          }
          CDSArray  gCDSArray;  //---not have array obj
          void    MainTest_Array()
          {
//
                    CDSObject           *ptrCDSObject;     ptrCDSObject       = new CDSObject();
                    CDSObject           *ptrCDSObject_1;   ptrCDSObject_1     = new CDSObject();
                    CDSObject           *ptrCDSObject_2;   ptrCDSObject_2     = new CDSObject();
//
                    CDSArray             objCDSArray;        //--create
//
//
                    int Tot = objCDSArray.Total();                     //--Total
//
//
//
                    objCDSArray.Clear();                              //--clear
//
                    delete ptrCDSObject; delete ptrCDSObject_1; delete ptrCDSObject_2;//
          }
          CDSTreeNode  gCDSTreeNode;
          void    MainTest_TreeNode()
          {
//
                    CDSObject           *ptrCDSObject;     ptrCDSObject       = new CDSObject();
                    CDSObject           *ptrCDSObject_1;   ptrCDSObject_1     = new CDSObject();
                    CDSObject           *ptrCDSObject_2;   ptrCDSObject_2     = new CDSObject();
//
                    CDSTreeNode   objCDSTreeNode;        //--create
//
                    int               Balance  = objCDSTreeNode.Balance();
                    int               BalanceL = objCDSTreeNode.BalanceL();
                    int               BalanceR = objCDSTreeNode.BalanceR();
//
                    delete ptrCDSObject;  delete ptrCDSObject_1;  delete ptrCDSObject_2;
//
          }
          CDSTree  gCDSTree;
          void    MainTest_Tree()
          {
//
                    CDSObject           *ptrCDSObject;     ptrCDSObject       = new CDSObject();
                    CDSObject           *ptrCDSObject_1;   ptrCDSObject_1     = new CDSObject();
                    CDSObject           *ptrCDSObject_2;   ptrCDSObject_2     = new CDSObject();
//
                    CDSTreeNode         *ptrCDSTreeNode;   ptrCDSTreeNode     = new CDSTreeNode();
                    CDSTree   objCDSTree;        //--create
//
                    objCDSTree.Balance();
                    objCDSTree.BalanceL();
                    objCDSTree.BalanceR();
//
                    ptrCDSTreeNode = objCDSTree.Root();
                    objCDSTree.Delete(ptrCDSTreeNode);
                    objCDSTree.Clear();
                    delete ptrCDSObject; delete ptrCDSObject_1; delete ptrCDSObject_2;
                    delete ptrCDSTreeNode;
//
          }
          //
          void testC_Tree_decition(bool b)
          {         if(!b)   { return; }
                    Tree_decition = new CDSTree_decition<bool, bool>(false, false); //Tree_decition = NULL;
                    //===================================================
                    CDSTreeNode_decition<E_Key3, bool>      *TND__A = new CDSTreeNode_decition<E_Key3, bool>(E_Void); //--function ned as pointer
                    TND__A.set(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0);   //TND_.Balance=10;/*set data value off self */ //error
                    TND__A.Left(NULL);//--base root is null
                    //-----------------------------------------------------string kk=typename(E_Key3);
                    //Tree_decition.Insert(TND__A); //
                    //===================================================
                    CDSTreeNode_decition<bool, bool>      *TND__B = new CDSTreeNode_decition<bool, bool>(false); //--function ned as pointer
                    TND__B.set(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle);   //TND_.Balance=10;/*set data value off self */ //error
                    //Tree_decition.Insert(TND__B); //
                    //===================================================
                    CDSTreeNode_decition<E_Place_Thirden, bool>      *TND__C = new CDSTreeNode_decition<E_Place_Thirden, bool>(E_Place_Thirden_Void); //--function ned as pointer
                    TND__C.set(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Thirden);   //TND_.Balance=10;/*set data value off self */ //error
                    //Tree_decition.Insert(TND__C); //
                    //===================================================
                    CDSTreeNode_decition<bool, bool>      *TND__D = new CDSTreeNode_decition<bool, bool>(false); //--function ned as pointer
                    TND__D.set(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_Bulish);   //TND_.Balance=10;/*set data value off self */ //error
                    //Tree_decition.Insert(TND__D); //
                    //===================================================
                    CDSTreeNode_decition<bool, bool>      *TND__E = new CDSTreeNode_decition<bool, bool>(false); //--function ned as pointer
                    TND__E.set(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Grater_m20);   //TND_.Balance=10;/*set data value off self */ //error
                    //Tree_decition.Insert(TND__E); //
                    // link nodes
                    TND__D.Left(TND__E);
                    TND__C.Left(TND__D);
                    TND__B.Left(TND__C);
                    TND__A.Left(TND__B);//TND__A.Left(TND__B.Left(TND__C.Left(TND__D.Left(TND__E))) /*error*/
                    //
                    TND__D.Right(TND__E);
                    TND__C.Right(TND__D);
                    TND__B.Right(TND__C);
                    TND__A.Right(TND__B);//TND__A.Right(TND__B.Right(TND__C.Right(TND__D.Right(TND__E))));
                    //===================================================
                    Tree_decition.Insert(TND__A); //
                    string SignalDesc = Tree_decition.Define_Signal(); Alert("SignalDesc:", SignalDesc);
                    //===================================================
                    //===================================================
                    delete TND__A;
                    delete TND__B; //
                    delete TND__C;
                    delete TND__D; //
                    delete TND__E; //
                    delete Tree_decition; //
          } //

          void BulidTree_decition(bool b)
          {         if(!b)   { return; }
                    Tree_decition = new CDSTree_decition<bool, bool>(false, false); //Tree_decition = NULL;
                    //---level [0]
                    CDSTreeNode_decition<E_Key3, bool >      *TND__ROOT = new CDSTreeNode_decition<E_Key3, bool>(E_Void); //--function ned as pointer
                    TND__ROOT.set(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0);
                    TND__ROOT.Left(CDSTreeNode_decition<E_Key3, bool>::newNode(E_True));
                    TND__ROOT.Middle(CDSTreeNode_decition<E_Key3, bool>::newNode(E_Void));
                    TND__ROOT.Right(CDSTreeNode_decition<E_Key3, bool>::newNode(E_False));
                    //-----level [1]
                    CDSTreeNode_decition<bool, bool>      *TND__A = new CDSTreeNode_decition<bool, bool>(false); //--function ned as pointer
                    TND__A.set(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle);
                    TND__A.Left(CDSTreeNode_decition<bool, bool>::newNode(true));
                    TND__A.Middle(CDSTreeNode_decition<bool, bool>::newNode(false));
                    TND__A.Right(CDSTreeNode_decition<bool, bool>::newNode(false));
                    //------Level [2]
                    CDSTreeNode_decition<E_Place_Thirden, bool>      *TND__B = new CDSTreeNode_decition<E_Place_Thirden, bool>(false); //--function ned as pointer
                    TND__B.set(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Thirden);
                    TND__B.Left(CDSTreeNode_decition<E_Place_Thirden, bool>::newNode(E_Place_Thirden_Upper));
                    TND__B.Middle(CDSTreeNode_decition<E_Place_Thirden, bool>::newNode(E_Place_Thirden_Middle));
                    TND__B.Right(CDSTreeNode_decition<E_Place_Thirden, bool>::newNode(E_Place_Thirden_Lower));
                    TND__B.Left2(CDSTreeNode_decition<E_Place_Thirden, bool>::newNode(E_Place_Thirden_Void));
                    //------Level [3]
                    CDSTreeNode_decition<bool, bool>      *TND__C = new CDSTreeNode_decition<bool, bool>(false); //--function ned as pointer
                    TND__C.set(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_Bulish);
                    TND__C.Left(CDSTreeNode_decition<bool, bool>::newNode(true));
                    TND__C.Middle(CDSTreeNode_decition<bool, bool>::newNode(false));
                    TND__C.Right(CDSTreeNode_decition<bool, bool>::newNode(false));
                    //------Level [4]
                    CDSTreeNode_decition<bool, bool>      *TND__D = new CDSTreeNode_decition<bool, bool>(false); //--function ned as pointer
                    TND__D.set(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Grater_m20);
                    TND__D.Left(CDSTreeNode_decition<bool, bool>::newNode(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Grater_m20));   //---grater m20
                    TND__D.Middle(CDSTreeNode_decition<bool, bool>::newNode(!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Grater_m20 || !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Lower_m80));//---middle m20 m80
                    TND__D.Right(CDSTreeNode_decition<bool, bool>::newNode(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Lower_m80)); //---lower  m80
                    //------Level [5]
                    CDSTreeNode_decition<bool, bool>      *TND__E = new CDSTreeNode_decition<bool, bool>(false); //--function ned as pointer
                    TND__D.set(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20);
                    TND__D.Left(CDSTreeNode_decition<bool, bool>::newNode(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20));   //---grater m20
                    TND__D.Middle(CDSTreeNode_decition<bool, bool>::newNode(!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 || !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80));//---middle m20 m80
                    TND__D.Right(CDSTreeNode_decition<bool, bool>::newNode(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80)); //---lower  m80
                    //-----link nodes method a
                    TND__C.Left(TND__D);
                    TND__B.Left(TND__C);
                    TND__A.Left(TND__B);
                    TND__ROOT.Left(TND__A);//TND__A.Left(TND__B.Left(TND__C.Left(TND__D.Left(TND__E))) /*error*/
                    //
                    //TND__C.Middle(TND__D);
                    //TND__B.Middle(TND__C);
                    //TND__A.Middle(TND__B);
                    //TND__ROOT.Middle(TND__A);
                    //
                    TND__C.Right(TND__D);
                    TND__B.Right(TND__C);
                    TND__A.Right(TND__B);
                    TND__ROOT.Right(TND__A);
                    //-----link nodes method b  some thing correct feeling
                    //
                    TND__E.Left(CDSTreeNode_decition<bool, bool>::newNode(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20));
                    TND__E.Middle(CDSTreeNode_decition<bool, bool>::newNode(!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 || !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80));
                    TND__E.Right(CDSTreeNode_decition<bool, bool>::newNode(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80));
                    //
                    TND__D.Left(TND__E);
                    TND__D.Middle(TND__E);
                    TND__D.Right(TND__E);
                    //
                    TND__C.Left(TND__D);
                    TND__C.Right(TND__D);
                    //
                    TND__B.Left(TND__C);
                    //TND__B.Middle(TND__C);
                    TND__B.Right(TND__C);
                    //
                    TND__A.Left(TND__B);
                    TND__A.Right(TND__B);
                    //
                    TND__ROOT.Left(TND__A);
                    //TND__ROOT.Middle(TND__A);//'Middle' - no one of the overloads can be applied to the function call   QUARTS_AF1.mq4      157       21
                    TND__ROOT.Right(TND__A);
                    //-----------------------------------------------------------------------------------------
                    CDSTreeNode_decition<E_Key3, bool>::Levelorder2(TND__ROOT, 0); //
                    //-----------------------------------------------------------------------------------------
                    E_Key3 values[]; ArrayResize(values, TND__ROOT.ID);
                    CDSStack_By_Array<E_Key3>   Stack_t;
                    CDSTreeNode_decition<E_Key3, bool>::Levelorder(TND__ROOT, values, Stack_t, 0); //
                    //-----------------
                    delete TND__A;
                    delete TND__B; //
                    delete TND__C;
                    delete TND__D; //
                    delete TND__E; //
                    delete TND__ROOT; //
                    delete Tree_decition; //
                    //
          }//
          void    DataStructPack_Test(bool b)
          {         if(!b)   { return; }
                    /*---------*/
                    //  CStack
                    /*---------*/
                    {         CStack<int> stack_int;//
                              stack_int.Main(false);//
                    }
                    /*------------*/
                    //  CSortedSet
                    /*------------*/
                    {         CSortedSet<int> SortedSet_int;//
                              SortedSet_int.Main(false);//
                    }
                    /*------------*/
                    //  CSortedMap
                    /*------------*/
                    {         CSortedMap<string, int> SortedMap_string_int; //
                              SortedMap_string_int.Main(false);//
                    }
                    /*------------*/
                    //  CSortedMap
                    /*------------*/
                    {         CSortedMap<string, E_Key3> SortedMap_string_int1; //
                              SortedMap_string_int1.Main2(false);//
                              //
                    }
                    /*---------------*/
                    //  CRedBlackTree
                    /*---------------*/
                    {         CRedBlackTree<int> RedBlackTree_int; //
                              RedBlackTree_int.Main(false);//
                    }
                    /*-----------------*/
                    //  CTreeNode_MQL4
                    /*-----------------*/
                    {         int handel = FileOpen("QuArtsRoot\\TreeSaveTest\\" + "test tree", FILE_READ | FILE_WRITE | FILE_BIN);
                              FileFlush(handel);
                              CTreeNode_MQL4 *TreeNode___Root = new CTreeNode_MQL4;
                              //TreeNode___Root.
                              TreeNode___Root.SaveNode(handel);
                              CTree_MQL4  Tree;
                              Tree.Insert(TreeNode___Root);
                              Tree.Insert(new CTreeNode_MQL4);
                              FileClose(handel);
                              //------------------------
                              //------------------------
                              /*save tree*/
                              int handel2 = FileOpen("QuArtsRoot\\TreeSaveTest\\" + "test tree 2", FILE_READ | FILE_WRITE | FILE_BIN);
                              FileFlush(handel2);
                              CDSTreeNode_ExtendNode  objTreeNode_ExtendNode_MQL4;
                              long theLong = (long)TimeCurrent();
                              objTreeNode_ExtendNode_MQL4.SetLong(10);//LONG_MAX
                              objTreeNode_ExtendNode_MQL4.SetDouble(11.22);
                              objTreeNode_ExtendNode_MQL4.SetDateTime(TimeCurrent());
                              objTreeNode_ExtendNode_MQL4.SetString("hello struct is objTree_MQL4");
                              //------------------------------------------------------
                              objTreeNode_ExtendNode_MQL4.SaveNode(handel2);
                              //Print(handel2, " ", objTree_MQL4.Save(handel2));//----save act innerr call by save node
                              FileClose(handel2);
                              //------------------------------------------------------
                              /*load saved tree*/
                              int handel3 = FileOpen("QuArtsRoot\\TreeSaveTest\\" + "test tree 2", FILE_READ | FILE_WRITE | FILE_BIN);
                              objTreeNode_ExtendNode_MQL4.SaveNode(handel3);//----load act innerr call by save node
                              //objTree_MQL4.Load(handel3);
                              Print(handel3, " ", objTreeNode_ExtendNode_MQL4.GetString());
                              FileClose(handel3);
                              //------------------------
                    }
                    /*----------------------------*/
                    //  CDSTreeNode_ExtendNode
                    /*----------------------------*/
                    {         int handel2 = FileOpen("QuArtsRoot\\TreeSaveTest\\" + "generic tree 2", FILE_READ | FILE_WRITE | FILE_BIN);
                              FileFlush(handel2);
                              CDSTreeNode_ExtendNode *RootExtendNode = new CDSTreeNode_ExtendNode;
                              RootExtendNode.SetLong(10);//LONG_MAX
                              RootExtendNode.SetDouble(11.22);
                              RootExtendNode.SetDateTime(TimeCurrent());
                              RootExtendNode.SetString("hello struct Root is objTree_MQL4");
                              //-------
                              CDSTreeNode_ExtendNode *leftExtendNode = new CDSTreeNode_ExtendNode;
                              leftExtendNode.SetLong(100);//LONG_MAX
                              leftExtendNode.SetDouble(110.22);
                              leftExtendNode.SetDateTime(TimeCurrent());
                              leftExtendNode.SetString("hello struct left is objTree_MQL4");
                              //-------
                              CDSTreeNode_ExtendNode *RightExtendNode = new CDSTreeNode_ExtendNode;
                              RightExtendNode.SetLong(100);//LONG_MAX
                              RightExtendNode.SetDouble(110.22);
                              RightExtendNode.SetDateTime(TimeCurrent());
                              RightExtendNode.SetString("hello struct Right is objTree_MQL4");
                              //-------
                              CDSTreeNode_ExtendNode *left2ExtendNode = new CDSTreeNode_ExtendNode;
                              left2ExtendNode.SetLong(100);//LONG_MAX
                              left2ExtendNode.SetDouble(110.22);
                              left2ExtendNode.SetDateTime(TimeCurrent());
                              left2ExtendNode.SetString("hello struct left(002) is objTree_MQL4");
                              //---------------------------------------------------
                              RightExtendNode.Left(left2ExtendNode);
                              leftExtendNode.Right(RightExtendNode);
                              RootExtendNode.Left(leftExtendNode);
                              //-------------------------------------------------------------------
                              CDSTree_Generic_Extend<CDSTreeNode_ExtendNode> objTree_Extend;
                              //objTree_Extend.Insert(new CDSTreeNode_ExtendNode);  //... cant save...
                              objTree_Extend.Insert(RootExtendNode);
                              /*save tree*/
                              objTree_Extend.Save(handel2);
                              objTree_Extend.Root().SetString("free");
                              FileClose(handel2);
                              //------------------ sussesfully
                              /*load saved tree*/
                              handel2 = FileOpen("QuArtsRoot\\TreeSaveTest\\" + "generic tree 2", FILE_READ | FILE_WRITE | FILE_BIN);
                              objTree_Extend.Load(handel2);
                              FileClose(handel2);
                              Print( objTree_Extend.Root().GetString());//--cant trace the leaf
                              //Print( objTree_Extend.Root().Left().GetString());//--cant trace the leaf  cant handel until generic solution
                              //
                    }
                    //------------------------
                    /*--------------------------------*/
                    //  CDSTreeNode_ExtendNode Generic--fail progress/////*have to implant the left right*/
                    /*--------------------------------*/
                    {         /*   int handel2 = FileOpen("QuArtsRoot\\TreeSaveTest\\" + "generic tree 2", FILE_READ | FILE_WRITE | FILE_BIN);
                                 FileFlush(handel2);
                                 CDSTreeNode_Generic_ExtendNode<CDSTree_Generic_Extend<CDSTreeNode_ExtendNode>>  *RootExtendNode = new CDSTreeNode_Generic_ExtendNode<CDSTree_Generic_Extend<CDSTreeNode_ExtendNode>>;
                                 RootExtendNode.SetLong(10);//LONG_MAX
                                 RootExtendNode.SetDouble(11.22);
                                 RootExtendNode.SetDateTime(TimeCurrent());
                                 RootExtendNode.SetString("hello struct Root is objTree_MQL4");
                                 //-------
                                 CDSTreeNode_Generic_ExtendNode<CDSTree_Generic_Extend<CDSTreeNode_ExtendNode>> *leftExtendNode = new CDSTreeNode_Generic_ExtendNode<CDSTree_Generic_Extend<CDSTreeNode_ExtendNode>>;
                                 leftExtendNode.SetLong(100);//LONG_MAX
                                 leftExtendNode.SetDouble(110.22);
                                 leftExtendNode.SetDateTime(TimeCurrent());
                                 leftExtendNode.SetString("hello struct left is objTree_MQL4");
                                 //-------
                                 CDSTreeNode_Generic_ExtendNode<CDSTree_Generic_Extend<CDSTreeNode_ExtendNode>> *RightExtendNode = new CDSTreeNode_Generic_ExtendNode<CDSTree_Generic_Extend<CDSTreeNode_ExtendNode>>;
                                 RightExtendNode.SetLong(100);//LONG_MAX
                                 RightExtendNode.SetDouble(110.22);
                                 RightExtendNode.SetDateTime(TimeCurrent());
                                 RightExtendNode.SetString("hello struct Right is objTree_MQL4");
                                 //-------
                                 CDSTreeNode_Generic_ExtendNode<CDSTree_Generic_Extend<CDSTreeNode_ExtendNode>> *left2ExtendNode = new CDSTreeNode_Generic_ExtendNode<CDSTree_Generic_Extend<CDSTreeNode_ExtendNode>>;
                                 left2ExtendNode.SetLong(100);//LONG_MAX
                                 left2ExtendNode.SetDouble(110.22);
                                 left2ExtendNode.SetDateTime(TimeCurrent());
                                 left2ExtendNode.SetString("hello struct left(002) is objTree_MQL4");
                                 //---------------------------------------------------
                                 RightExtendNode.Left(left2ExtendNode);
                                 leftExtendNode.Right(RightExtendNode);
                                 RootExtendNode.Left(leftExtendNode);
                                 //-------------------------------------------------------------------
                                 CDSTree_Generic_Extend<CDSTreeNode_ExtendNode> objTree_Extend;
                                 //objTree_Extend.Insert(new CDSTreeNode_ExtendNode);  //... cant save...
                                 objTree_Extend.Insert(RootExtendNode);
                                 /*save tree/
                                 objTree_Extend.Save(handel2);
                                 objTree_Extend.Root().SetString("free");
                                 FileClose(handel2);
                                 //------------------ sussesfully
                                 /*load saved tree/
                                 handel2 = FileOpen("QuArtsRoot\\TreeSaveTest\\" + "generic tree 2", FILE_READ | FILE_WRITE | FILE_BIN);
                                 objTree_Extend.Load(handel2);
                                 FileClose(handel2);
                                 Print( objTree_Extend.Root().GetString());//--cant trace the leaf
                                 //-----Print( objTree_Extend.Root().Left().GetString());//--cant trace the leaf  cant handel until generic solution/*have to implant the left right*/
                    }
                    //-------------------------------
          }//
          void C_GND_proto(bool b)
          {         if(!b)   { return; }
                    CD_DataStructPack DataStructPack2;
                    //DataStructPack2.Graph_DiaGraph.main();//
                    DataStructPack2.Graph_List.main();
                    //
                    //
          }//
          void  C_TND_proto(bool b)
          {         if(!b)   { return; }
                    //C_TND *TND = new C_TND();
                    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>gTD2.MainProgress(true);////*MAIN ERROR (When saving set same path to leafs) (Trace Solution)(Linking!)(the address at memmry are same for any branches any change make them same(must copy linking))()(THE ERROR IS WRITING ptr_Branch_2 WRONG )()*/
                    //delete TND;//
          };//
          void  testC_Tree_Micro_decition(bool b)
          {         if(!b)   { return; }
                    //------------------
                    CDS_Tree_Decition_Micro_User  Tree_Decition_Micro_User() ;
                    Tree_Decition_Micro_User.Main(true);//
          } };
//+------------------------------------------------------------------+
