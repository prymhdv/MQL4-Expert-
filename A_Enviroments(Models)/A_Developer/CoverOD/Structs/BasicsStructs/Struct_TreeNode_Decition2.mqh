//+------------------------------------------------------------------+
//||   ||||||||||                 BaseDoor.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    |||
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+pre define clases
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOF\.CoverOF.mqh>              /*STORE DATA-Files*/
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |reduse traverse make faster!
//+------------------------------------------------------------------+
class C_TND;
class CTree_Traverse_LevelOrder;
 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_File_Decition2.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_Data_Decition2.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_CPack_tree.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+MainProgress
//C_TND  * ptr_Node_Keep_last_FromRootToSave_Runtime;//no need by merge and copy tree
//C_TND  * ptr_Node_Choosen;
//C_TND  * ptr_Node_Choosen_Root;
class C_TND  //: public CDSTree
{
public:   /*member variable*/
          /*C_TND             Right;//undefined class 'C_TND' cannot be used Advanced_TreeNode_Decition2.mqh         19        43*/ //left right binary
          C_TND           * ptr_Backup;
          C_TND           * ptr_BackupRootSave;
          C_TND           * ptr_BackupRootLoad;
          C_TND           * ptr_Parent;    //                                                                                   |
          C_TND           * ptr_Branch_1;   //---branches        /               /               /               /               |               \               \               \               \            
          C_TND           * ptr_Branch_2;   //               ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\          
          C_TND           * ptr_Branch_3;   //               ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\  
          C_TND           * ptr_Branch_4;   //
          C_TND           * ptr_Branch_5;   //
          C_TND           * ptr_Branch_6;   //
          C_TND           * ptr_Branch_7;   //
          C_TND           * ptr_Branch_8;   //
          C_TND           * ptr_Branch_9;   //
          C_TND           * ptr_Branch_10;  //
          //---------------------------------------------
          C_TNSD            obj_Self_Pocket;  //---variables   2023.03.07 15:39:06.915     QUARTS_AF1 XAUUSD.F,M1: invalid pointer access in 'Advanced_TreeNode_Decition2.mqh' (115,24)
          //---------------------------------------------
          int               data;
          bool              IsLeaf;
          bool              getIsLeaf(C_TND *ptrNode);
          bool              IsActive;
          //string            Saying;
          ulong             Level_Curr;
          //-------------------------------Info Of root
          ulong  Node_Total;
          //---------------------------------------------
          string            Name;
          int               ID;
          static int        TOTAL_One;
          bool              Is_TOTAL_One;
          //---------------------------------------------
public:    /*constractor*/
          C_TND()                       {initing(); };  //---solve invaliade pointer accecc not created//--has 20 obj not delited
          C_TND(const C_TND &)          {initing2();};   //' not found        Advanced_Queue_List.mqh       92        28
          C_TND(int Num, string name)   {initing2();};
          C_TND(int _data);                                             //---solve invaliade pointer accecc not created
          ~C_TND();                                             /*delete ptr_Backup;*/
          void initing();
          void initing2();
          static void initObj(C_TND *& ref_ptr_n) { ref_ptr_n = new C_TND( 0, "test"); }
          //---------------------------------------------
          template<typename t>
          C_TND *       newNode_X( string _name, t _Keyvalue );
          void          ChooseAnswer_NodeID(); //2023.03.07 15:37:55.069     QUARTS_AF1 XAUUSD.F,M1: invalid pointer access in 'Advanced_TreeNode_Decition2.mqh' (120,49)
          void          Select_Answer_Traverse();
          ulong         TraverseTree_Leafs_TradeOFF(C_TND *& ptr_Node);
          //void ActAtLeafs(C_TND * ptr_Node, C_TND * ptr_NodeSafe,int LeafCount,int totalNodesCount)
          /// if(!CheckPointer(ptr_Node) || ptr_Node == NULL || !CheckPointer(ptr_NodeSafe) || ptr_NodeSafe == NULL) { return;}
          void          ActAtLeafs(C_TND * ptr_Node,/* const C_TND * ptr_NodeSafe,*/ ulong LeafCount, ulong totalNodesCount, string names); ///--!!! cant handel safe root hanging
public:
          //--- method for creating an instance of class
          virtual C_TND         *CreateSample(string n, bool b)      { C_TND *sample = new C_TND(); return(sample);/*return(NULL);*/ /* the method must implant --called in LoadNode*/  } ///beacse of virtual... must set by drived class
          //--- methods for working with files
          virtual bool          Save(const int file_handle);              /*WORDKED*/          //{ /*return(true);*/ /* the method must implant --called in SaveNode*/  }
          virtual bool          Load(const int file_handle);              /*WORDKED*/           //{ /*return(true);*/ /* the method must implant --called in LoadNode*/  }//
          bool                  SaveNode_InOrder(const int file_handle);
          bool                  LoadNode_InOrder(const int file_handle);
          bool                  SaveNode_PreOrder(const int file_handle); /*WORDKED*/
          bool                  LoadNode_PreOrder(const int file_handle); /*WORDKED*/
          string                data_String;
public:
          void          Traverse_PostOrder_Delete(C_TND * main);
          void          Traverse_PostOrder_Numbering( ulong &Sum);
          C_TND *       Traverse_Merge_Both(C_TND* ptr_Node_Created, C_TND* ptr_Node_Loaded);
          C_TND *       MergeTrees(C_TND * t1, C_TND * t2);
          C_TND *       Traverse_Copy(C_TND* ptr_root);
          C_TND *       Traverse_Move(C_TND* ptr_root);
          bool          Traverse_Equal(C_TND* ptr_Node_Created, C_TND* ptr_Node_Loaded);
//
};
int C_TND::TOTAL_One = 0;

//+------------------------------------------------------------------+
//| Writing node data to file                                        | traverse based inorder
//+------------------------------------------------------------------+
C_TND::C_TND(int _data):
          data(_data),            /* can init data by constract obj*/
          ptr_Backup(NULL /*use some function on init*/),       /*defaultly are null*/
          ptr_BackupRootSave(NULL),   /*defaultly are null*/
          ptr_Parent(NULL),       /*defaultly are null*/      //                                                                                   |
          ptr_Branch_1(NULL),     /*defaultly are null*/      //---branches        /               /               /               /               |               \               \               \               \            
          ptr_Branch_2(NULL),     /*defaultly are null*/      //               ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\          
          ptr_Branch_3(NULL),     /*defaultly are null*/      //               ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\       ////|\\\\  
          ptr_Branch_4(NULL),     /*defaultly are null*/      //
          ptr_Branch_5(NULL),     /*defaultly are null*/      //
          ptr_Branch_6(NULL),     /*defaultly are null*/      //
          ptr_Branch_7(NULL),     /*defaultly are null*/      //
          ptr_Branch_8(NULL),     /*defaultly are null*/      //
          ptr_Branch_9(NULL),     /*defaultly are null*/      //
          ptr_Branch_10(NULL)     /*defaultly are null*/      //
          //obj_Self_Pocket()          /*defaultly are null*/      //
{         initing2(); };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TND::~C_TND()  /*delete ptr_Backup;*/
{         //auto deleted sub tree
          //delete ptr_Parent;    delete ptr_Branch_1;
          //delete ptr_Branch_2;  delete ptr_Branch_3;
          //delete ptr_Branch_4;  delete ptr_Branch_5;
          //delete ptr_Branch_6;  delete ptr_Branch_7;
          //delete ptr_Branch_8;  delete ptr_Branch_9;
          //delete ptr_Branch_10; delete ptr_Backup;
          //delete ptr_BackupRootSave; delete ptr_BackupRootLoad;
          //--- stack over floww...
          //if(ptr_Parent)delete ptr_Parent;            if(ptr_Branch_1)delete ptr_Branch_1;    if(ptr_Branch_2)delete ptr_Branch_2;
          //if(ptr_Branch_3)delete ptr_Branch_3;        if(ptr_Branch_4)delete ptr_Branch_4;    if(ptr_Branch_5)delete ptr_Branch_5;
          //if(ptr_Branch_6)delete ptr_Branch_6;        if(ptr_Branch_7)delete ptr_Branch_7;    if(ptr_Branch_8)delete ptr_Branch_8;
          //if(ptr_Branch_9)delete ptr_Branch_9;        if(ptr_Branch_10)delete ptr_Branch_10;  if(ptr_BackupRootSave)delete ptr_BackupRootSave;
          //if(ptr_BackupRootLoad)delete ptr_BackupRootLoad;
          //0000 may caused stack over flow
          //delete  obj_Self_Pocket; //must delete
          //
          if(Is_TOTAL_One) {--TOTAL_One; Is_TOTAL_One = false;} //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TND::initing()
{         ID = TOTAL_One++; Is_TOTAL_One = true; //
          //obj_Self_Pocket = new C_TNSD(ID);
          ArrayResize(obj_Self_Pocket.Branchs_bool, 10); //ArrayResize(obj_Self_Pocket.Branchs_Enum1, 10); ArrayResize(obj_Self_Pocket.Branchs_Enum2, 10);//
          //NODE_LEAF_Number++;//--make undefine out off nodes
          //NODE_LEAF_Number = TOTAL; //--make undefine 20 20 inc
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TND::initing2()
{         //obj_Self_Pocket = new C_TNSD(ID);
          ArrayResize(obj_Self_Pocket.Branchs_bool, 10); //ArrayResize(obj_Self_Pocket.Branchs_Enum1, 10); ArrayResize(obj_Self_Pocket.Branchs_Enum2, 10);//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
C_TND * C_TND::newNode_X( string _name, t _Keyvalue )
{         C_TND * ptr_node = new C_TND();
          //
          if(sizeof(bool) == sizeof(t))
          {         ptr_node.obj_Self_Pocket.Branchs_bool[0] = _Keyvalue;//  //---its again seted  downlerr
                    //Print("sizeof(bool): ", sizeof(bool)); //
          }
          else if(sizeof(E_Place_Ninth) == sizeof(t))
          {         //ptr_node.obj_Self_Pocket.Branchs_Enum1[0] = _Keyvalue;//
                    //Print("sizeof(E_Place_Thirden): ", sizeof(E_Place_Thirden)); //
          }
          else if(sizeof(E_Key3) == sizeof(t))
          {         //ptr_node.obj_Self_Pocket.Branchs_Enum2[0] = _Keyvalue;//
                    //Print("sizeof(E_Key3): ", sizeof(E_Key3)); //
          }
          ptr_node.obj_Self_Pocket.name = _name;
          //------------------------------------------
          /*  !! all are null no need set again
          ptr_node.ptr_BackupRootSave     = NULL;
          ptr_node.ptr_Parent         = NULL;
          ptr_node.ptr_Branch_1        = NULL;
          ptr_node.ptr_Branch_2        = NULL;
          ptr_node.ptr_Branch_3        = NULL;
          ptr_node.ptr_Branch_4        = NULL;
          ptr_node.ptr_Branch_5        = NULL;
          ptr_node.ptr_Branch_6        = NULL;
          ptr_node.ptr_Branch_7        = NULL;
          ptr_node.ptr_Branch_8        = NULL;
          ptr_node.ptr_Branch_9        = NULL;
          ptr_node.ptr_Branch_10       = NULL;
          */
          return ptr_node;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
static double GlobalPathNumChoosen = 0;
void C_TND::ChooseAnswer_NodeID() //2023.03.07 15:37:55.069     QUARTS_AF1 XAUUSD.F,M1: invalid pointer access in 'Advanced_TreeNode_Decition2.mqh' (120,49)
{         //Print("_________recover to choosen of Pramid_______",(string)IsExport, __FUNCTION__, "___________________"); //
          /* empty node exite */
          /*whose branch runner!!!*///C_TND *ptr_root_Choosen = new C_TND;/*for main proggress*///'=' ptr_root_Choosen = new C_TND- parameter passed as reference, variable expected
          /*not run! */ //Traverse_XOrder_TradeOff();//Pack_tree.ptr_TND_Root. runner  !!!GetPointer(this)parameter passed as reference , variable expected     !!!  Traverse_XOrder_TradeOff(this);'this' - parameter conversion not allowed
          Select_Answer_Traverse(/*ptr_root_Choosen nuul mean*/);//!!Pack_tree.ptr_TND_Root. runner
          //Traverse_XOrder_TradeOff();//how is after choose// laged not run//-------------------------!!!  its runed in answer    obj_Self_Pocket.TNSD_File.RunTrade(this, true); //
          //delete ptr_root_Choosen;
          //
}
//+------------------------------------------------------------------+
//|                                                                  |the leaf level is 122
//+------------------------------------------------------------------+
ulong C_TND::TraverseTree_Leafs_TradeOFF(C_TND *& ptr_Node)
{         ulong Count;
          if(!CheckPointer(ptr_Node)) { return Count = 0;}
          //
          if(!CheckPointer(ptr_Node.ptr_Branch_1) && !CheckPointer(ptr_Node.ptr_Branch_2)  && !CheckPointer(ptr_Node.ptr_Branch_3) && !CheckPointer(ptr_Node.ptr_Branch_4) && !CheckPointer(ptr_Node.ptr_Branch_5)
                              && !CheckPointer(ptr_Node.ptr_Branch_6)  && !CheckPointer(ptr_Node.ptr_Branch_7) && !CheckPointer(ptr_Node.ptr_Branch_8) && !CheckPointer(ptr_Node.ptr_Branch_9)  && !CheckPointer(ptr_Node.ptr_Branch_10)
                              //&& !CheckPointer(ptr_Node.ptr_Parent)   && !CheckPointer(ptr_Node.ptr_Backup)  && !CheckPointer(ptr_Node.ptr_BackupRootSave) && !CheckPointer(ptr_Node.ptr_BackupRootLoad)//
            )
          {         ptr_Node.obj_Self_Pocket.TNSD_File.RunTrade(this, true);
                    return Count = 1;
                    //
                    //
          } //WHERE DETECTED LEAF // the leaf level
          {         return Count = TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_Branch_1)
                                   + TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_Branch_2)
                                   + TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_Branch_3)
                                   + TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_Branch_4)
                                   + TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_Branch_5)
                                   + TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_Branch_6)
                                   + TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_Branch_7)
                                   + TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_Branch_8)
                                   + TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_Branch_9)
                                   + TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_Branch_10)
                                   //+ TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_Parent)
                                   //+ TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_Backup)
                                   //+ TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_BackupRootSave)
                                   //+ TraverseTree_Leafs_TradeOFF(ptr_Node.ptr_BackupRootLoad)
                                   ;//
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |bool IsExport
//+------------------------------------------------------------------+C_TND *& ptr_Nodex_Fetch,
void C_TND::Select_Answer_Traverse()
{         static string         SuperName       = "";
          static ulong          SuperID         = 0;
          static string         SuperIDName     = "";
          //if(!CheckPointer(ptr_Nodex_Fetch)) { return;/*thereis no ptr how print ? Print("name1:" + "ptr_Nodex_Fetch:", ptr_Nodex_Fetch.obj_Self_Pocket.name, " ptr_Nodex_Return:", ptr_Nodex_Return.obj_Self_Pocket.name);*/}
          //!!Pack_tree.ptr_TND_Root. runner
          //obj_Self_Pocket.TNSD_File.RunTrade(this);
          //obj_Self_Pocket.TNSD_File.RunPub(this); //---trade at leafs not leafs self run//--one level upper if if else
          //obj_Self_Pocket.TNSD_File.RunTrade(this, true); // cheack every node for is profited or not!  id not traverse leafs it not gone leaf level
          if(!ptr_Branch_1 && !ptr_Branch_2  && !ptr_Branch_3 && !ptr_Branch_4 && !ptr_Branch_5 && !ptr_Branch_6  && !ptr_Branch_7 && !ptr_Branch_8 && !ptr_Branch_9  && !ptr_Branch_10 && !ptr_Parent   && !ptr_Backup  && !ptr_BackupRootSave && !ptr_BackupRootLoad )
          {         ///////////\\\\\\\\\\\\\-----------
                    //WHERE LAST NAME COME\\ when leaf//-------@@@@-----Last Leaf acting if(obj_Self_Pocket.Branchs_bool[0])
                    //\\\\\\\\\/////////////-----------
                    /*must Run to not skip ths tree all //not ruuned at noised run *///Print(  "_______RUN TREE ANSWER LEAF ?OR NOT BUILDED ROOT___" );
                    //
                    if(obj_Self_Pocket.Branchs_bool[0])
                    {         //Print("name1: ", obj_Self_Pocket.name);
                              SuperIDName += "1";
                              SuperName += obj_Self_Pocket.name + "1" + "_"; //wprs2
                              obj_Self_Pocket.OPRATE(SuperName, SuperIDName); SuperIDName = "";       SuperName = "";  /*ptr_Node_Choosen = ptr_Nodex_Fetch;*/ /*not error return to it */ /*if(IsExport) {ptr_Nodex_Fetch = ptr_Node_Choosen;*/
                              //obj_Self_Pocket.Trade_Choosen( GlobalPathNumChoosen); // /*ptr_Node_Choosen run self.... then its path id is seted*/ /*when delete address of pack tree its not acceccible for this choosen by pack tree */
                              //
                              obj_Self_Pocket.TNSD_File.RunTrade(this);
                              //
                              return; //ptr_Nodex_Fetch.
                    }
                    else if(obj_Self_Pocket.Branchs_bool[1])
                    {         //Print("name2: ", obj_Self_Pocket.name);
                              SuperIDName += "2";
                              SuperName += obj_Self_Pocket.name + "2" + "_";
                              obj_Self_Pocket.OPRATE(SuperName, SuperIDName); SuperIDName = "";       SuperName = "";  /*ptr_Node_Choosen = ptr_Nodex_Fetch;*/ /*not error return to it */ /*if(IsExport) {ptr_Nodex_Fetch = ptr_Node_Choosen;*/
                              // obj_Self_Pocket.Trade_Choosen( GlobalPathNumChoosen); // /*ptr_Node_Choosen run self.... then its path id is seted*/ /*when delete address of pack tree its not acceccible for this choosen by pack tree */
                              //
                              obj_Self_Pocket.TNSD_File.RunTrade(this);
                              return; //
                    }
                    else if(obj_Self_Pocket.Branchs_bool[2])
                    {         //Print("name3: ", obj_Self_Pocket.name);
                              SuperIDName += "3";
                              SuperName += obj_Self_Pocket.name + "3" + "_";
                              obj_Self_Pocket.OPRATE(SuperName, SuperIDName); SuperIDName = "";       SuperName = "";  /*ptr_Node_Choosen = ptr_Nodex_Fetch;*/ /*not error return to it */ /*if(IsExport) {ptr_Nodex_Fetch = ptr_Node_Choosen;*/
                              // obj_Self_Pocket.Trade_Choosen( GlobalPathNumChoosen); // /*ptr_Node_Choosen run self.... then its path id is seted*/ /*when delete address of pack tree its not acceccible for this choosen by pack tree */
                              //
                              obj_Self_Pocket.TNSD_File.RunTrade(this);
                              return; //
                    }
                    else if(obj_Self_Pocket.Branchs_bool[3])
                    {         //Print("name4: ", obj_Self_Pocket.name);
                              SuperIDName += "4";
                              SuperName += obj_Self_Pocket.name + "4" + "_";
                              obj_Self_Pocket.OPRATE(SuperName, SuperIDName); SuperIDName = "";       SuperName = "";  /*ptr_Node_Choosen = ptr_Nodex_Fetch;*/ /*not error return to it */ /*if(IsExport) {ptr_Nodex_Fetch = ptr_Node_Choosen;*/
                              // obj_Self_Pocket.Trade_Choosen( GlobalPathNumChoosen); // /*ptr_Node_Choosen run self.... then its path id is seted*/ /*when delete address of pack tree its not acceccible for this choosen by pack tree */
                              //
                              obj_Self_Pocket.TNSD_File.RunTrade(this);
                              return; //
                    }
                    else if(obj_Self_Pocket.Branchs_bool[4])
                    {         //Print("name5: ", obj_Self_Pocket.name);
                              SuperIDName += "5";
                              SuperName += obj_Self_Pocket.name + "5" + "_";
                              obj_Self_Pocket.OPRATE(SuperName, SuperIDName); SuperIDName = "";       SuperName = "";  /*ptr_Node_Choosen = ptr_Nodex_Fetch;*/ /*not error return to it */ /*if(IsExport) {ptr_Nodex_Fetch = ptr_Node_Choosen;*/
                              // obj_Self_Pocket.Trade_Choosen( GlobalPathNumChoosen); // /*ptr_Node_Choosen run self.... then its path id is seted*/ /*when delete address of pack tree its not acceccible for this choosen by pack tree */
                              //
                              obj_Self_Pocket.TNSD_File.RunTrade(this);
                              return; //
                    }
                    else if(obj_Self_Pocket.Branchs_bool[5])
                    {         //Print("name6: ", obj_Self_Pocket.name);
                              SuperIDName += "6";
                              SuperName += obj_Self_Pocket.name + "6" + "_";
                              obj_Self_Pocket.OPRATE(SuperName, SuperIDName); SuperIDName = "";       SuperName = "";  /*ptr_Node_Choosen = ptr_Nodex_Fetch;*/ /*not error return to it */ /*if(IsExport) {ptr_Nodex_Fetch = ptr_Node_Choosen;*/
                              // obj_Self_Pocket.Trade_Choosen( GlobalPathNumChoosen); // /*ptr_Node_Choosen run self.... then its path id is seted*/ /*when delete address of pack tree its not acceccible for this choosen by pack tree */
                              //
                              obj_Self_Pocket.TNSD_File.RunTrade(this);
                              return; //
                    }
                    else if(obj_Self_Pocket.Branchs_bool[6])
                    {         //Print("name7: ", obj_Self_Pocket.name);
                              SuperIDName += "7";
                              SuperName += obj_Self_Pocket.name + "7" + "_";
                              obj_Self_Pocket.OPRATE(SuperName, SuperIDName); SuperIDName = "";       SuperName = "";  /*ptr_Node_Choosen = ptr_Nodex_Fetch;*/ /*not error return to it */ /*if(IsExport) {ptr_Nodex_Fetch = ptr_Node_Choosen;*/
                              // obj_Self_Pocket.Trade_Choosen( GlobalPathNumChoosen); // /*ptr_Node_Choosen run self.... then its path id is seted*/ /*when delete address of pack tree its not acceccible for this choosen by pack tree */
                              //
                              obj_Self_Pocket.TNSD_File.RunTrade(this);
                              return; //
                    }
                    else if(obj_Self_Pocket.Branchs_bool[7])
                    {         //Print("name8: ", obj_Self_Pocket.name);
                              SuperIDName += "8";
                              SuperName += obj_Self_Pocket.name + "8" + "_";
                              obj_Self_Pocket.OPRATE(SuperName, SuperIDName); SuperIDName = "";       SuperName = "";  /*ptr_Node_Choosen = ptr_Nodex_Fetch;*/ /*not error return to it */ /*if(IsExport) {ptr_Nodex_Fetch = ptr_Node_Choosen;*/
                              //obj_Self_Pocket.Trade_Choosen( GlobalPathNumChoosen); // /*ptr_Node_Choosen run self.... then its path id is seted*/ /*when delete address of pack tree its not acceccible for this choosen by pack tree */
                              //
                              obj_Self_Pocket.TNSD_File.RunTrade(this);
                              return; //
                    }
                    else if(obj_Self_Pocket.Branchs_bool[8])
                    {         //Print("name9: ", obj_Self_Pocket.name);
                              SuperIDName += "9";
                              SuperName += obj_Self_Pocket.name + "9" + "_";
                              obj_Self_Pocket.OPRATE(SuperName, SuperIDName); SuperIDName = "";       SuperName = "";  /*ptr_Node_Choosen = ptr_Nodex_Fetch;*/ /*not error return to it */ /*if(IsExport) {ptr_Nodex_Fetch = ptr_Node_Choosen;*/
                              // obj_Self_Pocket.Trade_Choosen( GlobalPathNumChoosen); // /*ptr_Node_Choosen run self.... then its path id is seted*/ /*when delete address of pack tree its not acceccible for this choosen by pack tree */
                              //
                              obj_Self_Pocket.TNSD_File.RunTrade(this);
                              return; //
                    }
                    else if(obj_Self_Pocket.Branchs_bool[9])//-------@@@@-----Last Leaf acting
                    {         //Print("name10: ", obj_Self_Pocket.name);
                              SuperIDName += "0";
                              SuperName += obj_Self_Pocket.name + "10" + "_";
                              obj_Self_Pocket.OPRATE(SuperName, SuperIDName); SuperIDName = "";       SuperName = "";  /*ptr_Node_Choosen = ptr_Nodex_Fetch;*/ /*not error return to it */ /*if(IsExport) {ptr_Nodex_Fetch = ptr_Node_Choosen;*/
                              //  obj_Self_Pocket.Trade_Choosen( GlobalPathNumChoosen); // /*ptr_Node_Choosen run self.... then its path id is seted*/ /*when delete address of pack tree its not acceccible for this choosen by pack tree */
                              //
                              obj_Self_Pocket.TNSD_File.RunTrade(this);
                              return; //
                    }
                    else                              { SuperIDName = "";    SuperName = ""; return;                                          }
                    //if run ptr_Node_Chooen mean not define and gone forall leafs//must run to wprm leaf controll
                    return;// /*frist layer return Pree Order*/
          }//
          //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          {         if(obj_Self_Pocket.Branchs_bool[0]/*Pack_tree.ptr_TND_Root.obj_Self_Pocket.Branchs_bool[0]*/)
                    {         //Print("name1: ", obj_Self_Pocket.name);
                              SuperIDName += "1";    SuperName += obj_Self_Pocket.name + "1" + "_";
                              if(CheckPointer(ptr_Branch_1)/*Pack_tree.ptr_TND_Root.ptr_Branch_1*/)ptr_Branch_1.Select_Answer_Traverse();/*from runner*/
                              //if(!ptr_Branch_1 && !ptr_Branch_2  && !ptr_Branch_3 && !ptr_Branch_4 && !ptr_Branch_5 && !ptr_Branch_6  && !ptr_Branch_7 && !ptr_Branch_8 && !ptr_Branch_9  && !ptr_Branch_10 && !ptr_Parent   && !ptr_Backup  && !ptr_BackupRootSave )
                              //{         //
                              //          obj_Self_Pocket.OPRATE(SuperName, SuperIDName); //
                              //}//
                              return; //
                    }
                    else if(obj_Self_Pocket.Branchs_bool[1])
                    {         //Print("name2: ", obj_Self_Pocket.name);
                              SuperIDName += "2";    SuperName += obj_Self_Pocket.name + "2" + "_";
                              if(CheckPointer(ptr_Branch_2))ptr_Branch_2.Select_Answer_Traverse();
                              return;//
                    }
                    else if(obj_Self_Pocket.Branchs_bool[2])
                    {         //Print("name3: ", obj_Self_Pocket.name);
                              SuperIDName += "3";    SuperName += obj_Self_Pocket.name + "3" + "_";
                              if(CheckPointer(ptr_Branch_3))ptr_Branch_3.Select_Answer_Traverse();
                              return;//
                    }
                    else if(obj_Self_Pocket.Branchs_bool[3])
                    {         //Print("name4: ", obj_Self_Pocket.name);
                              SuperIDName += "4";    SuperName += obj_Self_Pocket.name + "4" + "_";
                              if(CheckPointer(ptr_Branch_4))ptr_Branch_4.Select_Answer_Traverse();
                              return;//
                    }
                    else if(obj_Self_Pocket.Branchs_bool[4])
                    {         //Print("name5: ", obj_Self_Pocket.name);
                              SuperIDName += "5";    SuperName += obj_Self_Pocket.name + "5" + "_";
                              if(CheckPointer(ptr_Branch_5))ptr_Branch_5.Select_Answer_Traverse();
                              return;//
                    }
                    else if(obj_Self_Pocket.Branchs_bool[5])
                    {         //Print("name6: ", obj_Self_Pocket.name);
                              SuperIDName += "6";    SuperName += obj_Self_Pocket.name + "6" + "_";
                              if(CheckPointer(ptr_Branch_6))ptr_Branch_6.Select_Answer_Traverse();
                              return;//
                    }
                    else if(obj_Self_Pocket.Branchs_bool[6])
                    {         //Print("name7: ", obj_Self_Pocket.name);
                              SuperIDName += "7";    SuperName += obj_Self_Pocket.name + "7" + "_";
                              if(CheckPointer(ptr_Branch_7))ptr_Branch_7.Select_Answer_Traverse();
                              return;//
                    }
                    else if(obj_Self_Pocket.Branchs_bool[7])
                    {         //Print("name8: ", obj_Self_Pocket.name);
                              SuperIDName += "8";    SuperName += obj_Self_Pocket.name + "8" + "_";
                              if(CheckPointer(ptr_Branch_8))ptr_Branch_8.Select_Answer_Traverse();
                              return;//
                    }
                    else if(obj_Self_Pocket.Branchs_bool[8])
                    {         //Print("name9: ", obj_Self_Pocket.name);
                              SuperIDName += "9";    SuperName += obj_Self_Pocket.name + "9" + "_";
                              if(CheckPointer(ptr_Branch_9))ptr_Branch_9.Select_Answer_Traverse();
                              return;//
                    }
                    else if(obj_Self_Pocket.Branchs_bool[9])
                    {         //Print("name10: ", obj_Self_Pocket.name);
                              SuperIDName += "0";    SuperName += obj_Self_Pocket.name + "10" + "_";
                              if(CheckPointer(ptr_Branch_10))ptr_Branch_10.Select_Answer_Traverse();
                              return;//
                    }
                    else
                    {         return;//
                    }
                    //
                    return; //
          }//
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TND::ActAtLeafs(C_TND * ptr_Node,/* const C_TND * ptr_NodeSafe,*/ ulong LeafCount, ulong totalNodesCount, string names) ///--!!! cant handel safe root hanging
{         if(!CheckPointer(ptr_Node) || ptr_Node == NULL || !ptr_Node ) { return;}
          //Alert("stack over flow", __FUNCSIG__); ///
          //C_TND * ptr_NodeSafe = ptr_Node;//--changed every call
          //---------------------------------------------------------------------------------------------------------------
          if(1)///not depending null hanging ptr_Node.ptr_Branch_5==NULL "This function can be used for checking pointer validity. A non-zero value warranties that the pointer can be used for accessing."
          {         static int counter;
                    if( !CheckPointer(ptr_Node.ptr_Branch_1) && !CheckPointer(ptr_Node.ptr_Branch_2)  && !CheckPointer(ptr_Node.ptr_Branch_3) && !CheckPointer(ptr_Node.ptr_Branch_4)
                                        && !CheckPointer(ptr_Node.ptr_Branch_5)  && !CheckPointer(ptr_Node.ptr_Branch_6)  && !CheckPointer(ptr_Node.ptr_Branch_7) && !CheckPointer(ptr_Node.ptr_Branch_8)
                                        && !CheckPointer(ptr_Node.ptr_Branch_9)  && !CheckPointer(ptr_Node.ptr_Branch_10) && !CheckPointer(ptr_Node.ptr_Parent)   && !CheckPointer(ptr_Node.ptr_Backup)
                                        && !CheckPointer(ptr_Node.ptr_BackupRootSave) //
                      )
                    {         //
                              if(ptr_Node.obj_Self_Pocket.Activated)
                              {         counter++;
                                        //Saying = ("Active Leaf:" + (string)ptr_Node.obj_Self_Pocket.Id + "/" + (string)counter + " --  Leaf Count:" + (string)LeafCount + " -- Node Count:" + (string)totalNodesCount + " -- Leaf Cond:" + ptr_Node.obj_Self_Pocket.name + " -- pLeaf Cond:"  +  names ); /// ptr_Node.ptr_Parent.obj_Self_Pocket.name///  when not need pointer node it keep in class variable
                              }
                              else   { counter = 0; }
                              return;//
                              //
                    }//WHERE DETECTED LEAF SOME OPRATE
                    else //--not leaf have brance
                    {         ActAtLeafs(ptr_Node.ptr_Branch_1, LeafCount, totalNodesCount, names );  ActAtLeafs(ptr_Node.ptr_Branch_2, LeafCount, totalNodesCount, names );
                              ActAtLeafs(ptr_Node.ptr_Branch_3, LeafCount, totalNodesCount, names );  ActAtLeafs(ptr_Node.ptr_Branch_4, LeafCount, totalNodesCount, names );
                              ActAtLeafs(ptr_Node.ptr_Branch_5, LeafCount, totalNodesCount, names );  ActAtLeafs(ptr_Node.ptr_Branch_6, LeafCount, totalNodesCount, names );
                              ActAtLeafs(ptr_Node.ptr_Branch_7, LeafCount, totalNodesCount, names );  ActAtLeafs(ptr_Node.ptr_Branch_8, LeafCount, totalNodesCount, names );
                              ActAtLeafs(ptr_Node.ptr_Branch_9, LeafCount, totalNodesCount, names );  ActAtLeafs(ptr_Node.ptr_Branch_10, LeafCount, totalNodesCount, names );
                              ActAtLeafs(ptr_Node.ptr_Parent, LeafCount, totalNodesCount, names );    ActAtLeafs(ptr_Node.ptr_Backup,  LeafCount, totalNodesCount, names );
                              ActAtLeafs(ptr_Node.ptr_BackupRootSave, LeafCount, totalNodesCount, names );
                              ;//
                              return; //
                    } //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TND::Traverse_PostOrder_Delete(C_TND * main)
{         if(!CheckPointer(main)) return;
          Traverse_PostOrder_Delete(main.ptr_Branch_1);
          Traverse_PostOrder_Delete(main.ptr_Branch_2);
          Traverse_PostOrder_Delete(main.ptr_Branch_3);
          Traverse_PostOrder_Delete(main.ptr_Branch_4);
          Traverse_PostOrder_Delete(main.ptr_Branch_5);
          Traverse_PostOrder_Delete(main.ptr_Branch_6);
          Traverse_PostOrder_Delete(main.ptr_Branch_7);
          Traverse_PostOrder_Delete(main.ptr_Branch_8);
          Traverse_PostOrder_Delete(main.ptr_Branch_9);
          Traverse_PostOrder_Delete(main.ptr_Branch_10);
          Traverse_PostOrder_Delete(main.ptr_Parent);
          Traverse_PostOrder_Delete(main.ptr_Backup);
          Traverse_PostOrder_Delete(main.ptr_BackupRootLoad);
          Traverse_PostOrder_Delete(main.ptr_BackupRootSave);
          //------------------------------------------------
          delete main;  if(CheckPointer(main)) {Print("main Is existed", __FUNCSIG__);}
          return;//post order deleted node
          //
          ///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TND::Traverse_PostOrder_Numbering( ulong &Sum)
{         //if(!CheckPointer(ptr_Branch_1)) return;
          if(CheckPointer(ptr_Branch_1))      ptr_Branch_1.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_Branch_2))      ptr_Branch_2.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_Branch_3))      ptr_Branch_3.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_Branch_4))      ptr_Branch_4.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_Branch_5))      ptr_Branch_5.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_Branch_6))      ptr_Branch_6.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_Branch_7))      ptr_Branch_7.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_Branch_8))      ptr_Branch_8.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_Branch_9))      ptr_Branch_9.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_Branch_10))     ptr_Branch_10.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_Parent))        ptr_Parent.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_Backup))        ptr_Backup.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_BackupRootLoad))ptr_BackupRootLoad.Traverse_PostOrder_Numbering(Sum);
          if(CheckPointer(ptr_BackupRootSave))ptr_BackupRootSave.Traverse_PostOrder_Numbering(Sum);
          Sum += 1;
          //obj_Self_Pocket.TNSD_File.NODE_Number_Sum = Sum;
          return; //post order deleted node
          //
          ///
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TND * C_TND::Traverse_Merge_Both(C_TND* ptr_Node_Created, C_TND* ptr_Node_Loaded)
{         //------------------------------------------------------------------------------------------------------------------
          if (!CheckPointer(ptr_Node_Created)) { return ptr_Node_Loaded; }
          if (!CheckPointer(ptr_Node_Loaded))  { return ptr_Node_Created;}
          {         /*when both existed*/ ptr_Node_Created.obj_Self_Pocket.TNSD_File = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File;  }
          //------------------------------------------------------------------------------------------------------------------
          if(false)//----exmained no need init pointer node..node are existed
          {         if (!CheckPointer(ptr_Node_Created))
                    {         if (!CheckPointer(ptr_Node_Loaded))  return ptr_Node_Loaded;
                              else {C_TND* ptr_temp = new C_TND;  ptr_temp.obj_Self_Pocket.TNSD_File = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File;  ptr_Node_Loaded = ptr_temp; return ptr_Node_Loaded;}
                              //
                    }
                    if (!CheckPointer(ptr_Node_Loaded))   return ptr_Node_Created;
                    {         /*when both existed*/
                              //ptr_Node_Created.obj_Self_Pocket.TNSD_File = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File;
                              if (CheckPointer(ptr_Node_Created))      {ptr_Node_Created.obj_Self_Pocket.TNSD_File = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File;}
                              else if (CheckPointer(ptr_Node_Loaded)) { C_TND* ptr_temp = new C_TND;  ptr_temp.obj_Self_Pocket.TNSD_File = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File;  ptr_Node_Loaded = ptr_temp; }
                              //
                    }//
          }
          ptr_Node_Created.ptr_Branch_1              = Traverse_Merge_Both(ptr_Node_Created.ptr_Branch_1,           ptr_Node_Loaded.ptr_Branch_1);
          ptr_Node_Created.ptr_Branch_2              = Traverse_Merge_Both(ptr_Node_Created.ptr_Branch_2,           ptr_Node_Loaded.ptr_Branch_2);
          ptr_Node_Created.ptr_Branch_3              = Traverse_Merge_Both(ptr_Node_Created.ptr_Branch_3,           ptr_Node_Loaded.ptr_Branch_3);
          ptr_Node_Created.ptr_Branch_4              = Traverse_Merge_Both(ptr_Node_Created.ptr_Branch_4,           ptr_Node_Loaded.ptr_Branch_4);
          ptr_Node_Created.ptr_Branch_5              = Traverse_Merge_Both(ptr_Node_Created.ptr_Branch_5,           ptr_Node_Loaded.ptr_Branch_5);
          ptr_Node_Created.ptr_Branch_6              = Traverse_Merge_Both(ptr_Node_Created.ptr_Branch_6,           ptr_Node_Loaded.ptr_Branch_6);
          ptr_Node_Created.ptr_Branch_7              = Traverse_Merge_Both(ptr_Node_Created.ptr_Branch_7,           ptr_Node_Loaded.ptr_Branch_7);
          ptr_Node_Created.ptr_Branch_8              = Traverse_Merge_Both(ptr_Node_Created.ptr_Branch_8,           ptr_Node_Loaded.ptr_Branch_8);
          ptr_Node_Created.ptr_Branch_9              = Traverse_Merge_Both(ptr_Node_Created.ptr_Branch_9,           ptr_Node_Loaded.ptr_Branch_9);
          ptr_Node_Created.ptr_Branch_10             = Traverse_Merge_Both(ptr_Node_Created.ptr_Branch_10,          ptr_Node_Loaded.ptr_Branch_10);
          ptr_Node_Created.ptr_Parent                = Traverse_Merge_Both(ptr_Node_Created.ptr_Parent,             ptr_Node_Loaded.ptr_Parent);
          ptr_Node_Created.ptr_Backup                = Traverse_Merge_Both(ptr_Node_Created.ptr_Backup,             ptr_Node_Loaded.ptr_Backup);
          ptr_Node_Created.ptr_BackupRootLoad        = Traverse_Merge_Both(ptr_Node_Created.ptr_BackupRootLoad,     ptr_Node_Loaded.ptr_BackupRootLoad);
          ptr_Node_Created.ptr_BackupRootSave        = Traverse_Merge_Both(ptr_Node_Created.ptr_BackupRootSave,     ptr_Node_Loaded.ptr_BackupRootSave);
          return ptr_Node_Created;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TND *C_TND::MergeTrees(C_TND * t1, C_TND * t2)
{         //if (!t1)   return t2;
          //if (!t2)   return t1;
          //t1.data += t2.data;
          //t1.left = MergeTrees(t1.left, t2.left);
          //t1.right = MergeTrees(t1.right, t2.right);
          //return t1;//
          return NULL;///i seted
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TND * C_TND::Traverse_Copy(C_TND* ptr_root)
{         C_TND* ptr_temp;
          if(!CheckPointer(ptr_root))return NULL; //
          if(CheckPointer(ptr_root))
          {         ptr_temp = new C_TND;///----There is error That cant delete pointer by copying
                    //ptr_temp.obj_Self_Pocket.TNSD_File     = ptr_root.obj_Self_Pocket.TNSD_File;//copy just saved data
                    ptr_temp.obj_Self_Pocket                 = ptr_root.obj_Self_Pocket;;;//copy just saved data
                    //ptr_temp = ptr_root;//--errorr set refrence
                    //------------------------------------------------------------------
                    ptr_temp.ptr_Branch_1       = Traverse_Copy(ptr_root.ptr_Branch_1);
                    ptr_temp.ptr_Branch_2       = Traverse_Copy(ptr_root.ptr_Branch_2);
                    ptr_temp.ptr_Branch_3       = Traverse_Copy(ptr_root.ptr_Branch_3);
                    ptr_temp.ptr_Branch_4       = Traverse_Copy(ptr_root.ptr_Branch_4);
                    ptr_temp.ptr_Branch_5       = Traverse_Copy(ptr_root.ptr_Branch_5);
                    ptr_temp.ptr_Branch_6       = Traverse_Copy(ptr_root.ptr_Branch_6);
                    ptr_temp.ptr_Branch_7       = Traverse_Copy(ptr_root.ptr_Branch_7);
                    ptr_temp.ptr_Branch_8       = Traverse_Copy(ptr_root.ptr_Branch_8);
                    ptr_temp.ptr_Branch_9       = Traverse_Copy(ptr_root.ptr_Branch_9);
                    ptr_temp.ptr_Branch_10      = Traverse_Copy(ptr_root.ptr_Branch_10);
                    ptr_temp.ptr_Parent         = Traverse_Copy(ptr_root.ptr_Parent);
                    ptr_temp.ptr_Backup         = Traverse_Copy(ptr_root.ptr_Backup);
                    ptr_temp.ptr_BackupRootLoad = Traverse_Copy(ptr_root.ptr_BackupRootLoad);
                    ptr_temp.ptr_BackupRootSave = Traverse_Copy(ptr_root.ptr_BackupRootSave);//
                    return ptr_temp;//
          }
          return NULL; //
          //--------------------------------------------------------------------------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_TND * C_TND::Traverse_Move(C_TND* ptr_root)
{         C_TND* ptr_temp;
          if(!CheckPointer(ptr_root))return NULL; //
          if(CheckPointer(ptr_root))
          {         ptr_temp = new C_TND;
                    //ptr_temp.obj_Self_Pocket.TNSD_File     = ptr_root.obj_Self_Pocket.TNSD_File;//copy just saved data
                    ptr_temp.obj_Self_Pocket                 = ptr_root.obj_Self_Pocket;;;//copy object just or variable not pointer just saved data
                    //ptr_temp = ptr_root;//--errorr set refrence
                    //------------------------------------------------------------------
                    ptr_temp.ptr_Branch_1       = Traverse_Move(ptr_root.ptr_Branch_1);
                    ptr_temp.ptr_Branch_2       = Traverse_Move(ptr_root.ptr_Branch_2);
                    ptr_temp.ptr_Branch_3       = Traverse_Move(ptr_root.ptr_Branch_3);
                    ptr_temp.ptr_Branch_4       = Traverse_Move(ptr_root.ptr_Branch_4);
                    ptr_temp.ptr_Branch_5       = Traverse_Move(ptr_root.ptr_Branch_5);
                    ptr_temp.ptr_Branch_6       = Traverse_Move(ptr_root.ptr_Branch_6);
                    ptr_temp.ptr_Branch_7       = Traverse_Move(ptr_root.ptr_Branch_7);
                    ptr_temp.ptr_Branch_8       = Traverse_Move(ptr_root.ptr_Branch_8);
                    ptr_temp.ptr_Branch_9       = Traverse_Move(ptr_root.ptr_Branch_9);
                    ptr_temp.ptr_Branch_10      = Traverse_Move(ptr_root.ptr_Branch_10);
                    ptr_temp.ptr_Parent         = Traverse_Move(ptr_root.ptr_Parent);
                    ptr_temp.ptr_Backup         = Traverse_Move(ptr_root.ptr_Backup);
                    ptr_temp.ptr_BackupRootLoad = Traverse_Move(ptr_root.ptr_BackupRootLoad);
                    ptr_temp.ptr_BackupRootSave = Traverse_Move(ptr_root.ptr_BackupRootSave);//
                    delete ptr_root; return ptr_temp;//
          }
          return NULL; //
          //--------------------------------------------------------------------------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_TND::Traverse_Equal(C_TND* ptr_Node_Created, C_TND* ptr_Node_Loaded)
{         if(!CheckPointer(ptr_Node_Created) && !CheckPointer(ptr_Node_Loaded) ) return true; //
          if(CheckPointer(ptr_Node_Created) && CheckPointer(ptr_Node_Loaded) && (ptr_Node_Created.obj_Self_Pocket.name == ptr_Node_Loaded.obj_Self_Pocket.name) &&
                              Traverse_Equal(ptr_Node_Created.ptr_Branch_1,          ptr_Node_Loaded.ptr_Branch_1) &&
                              Traverse_Equal(ptr_Node_Created.ptr_Branch_2,          ptr_Node_Loaded.ptr_Branch_2) &&
                              Traverse_Equal(ptr_Node_Created.ptr_Branch_3,          ptr_Node_Loaded.ptr_Branch_3) &&
                              Traverse_Equal(ptr_Node_Created.ptr_Branch_4,          ptr_Node_Loaded.ptr_Branch_4) &&
                              Traverse_Equal(ptr_Node_Created.ptr_Branch_5,          ptr_Node_Loaded.ptr_Branch_5) &&
                              Traverse_Equal(ptr_Node_Created.ptr_Branch_6,          ptr_Node_Loaded.ptr_Branch_6) &&
                              Traverse_Equal(ptr_Node_Created.ptr_Branch_7,          ptr_Node_Loaded.ptr_Branch_7) &&
                              Traverse_Equal(ptr_Node_Created.ptr_Branch_8,          ptr_Node_Loaded.ptr_Branch_8) &&
                              Traverse_Equal(ptr_Node_Created.ptr_Branch_9,          ptr_Node_Loaded.ptr_Branch_9) &&
                              Traverse_Equal(ptr_Node_Created.ptr_Branch_10,         ptr_Node_Loaded.ptr_Branch_10) &&
                              Traverse_Equal(ptr_Node_Created.ptr_Parent,            ptr_Node_Loaded.ptr_Parent) &&
                              Traverse_Equal(ptr_Node_Created.ptr_Backup,            ptr_Node_Loaded.ptr_Backup) &&
                              Traverse_Equal(ptr_Node_Created.ptr_BackupRootLoad,    ptr_Node_Loaded.ptr_BackupRootLoad) &&
                              Traverse_Equal(ptr_Node_Created.ptr_BackupRootSave,    ptr_Node_Loaded.ptr_BackupRootSave)
            ) return true;
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_TND::SaveNode_InOrder(const int file_handle)
{         bool result = true;
          //--- check
          if(file_handle == INVALID_HANDLE) return(false);
          //if(!CheckPointer(main)) {return(false);}
          //--- write left node (if it is available)
          if(ptr_Branch_1)
          {         FileWriteInteger(file_handle, 'L', SHORT_VALUE);
                    result &=  ptr_Branch_1.SaveNode_InOrder(file_handle); //
          }
          //else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(ptr_Branch_2)
          {         FileWriteInteger(file_handle, 'K', SHORT_VALUE);
                    result &=  ptr_Branch_2.SaveNode_InOrder(file_handle); //
          }
          //else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(ptr_Branch_3)
          {         FileWriteInteger(file_handle, 'J', SHORT_VALUE);
                    result &=  ptr_Branch_3.SaveNode_InOrder(file_handle); //
          }
          if(!ptr_Branch_1 && !ptr_Branch_2 && !ptr_Branch_3)      FileWriteInteger(file_handle, 'X', SHORT_VALUE); //---x mean none null character ''   Capture by 'x' 'x' any leaf   ///WHEN NO NODE LEFT SIDE
          //------------------------------------------------------------inorder save
          //--- write data of current node
          result &= Save(file_handle); //--------------------------------------------------is virtual mean drived last class save load act
          //------------------------------------------------------------
          //--- write right node (if it is available)
          if(ptr_Branch_4)
          {         FileWriteInteger(file_handle, 'R', SHORT_VALUE);
                    result &=  ptr_Branch_4.SaveNode_InOrder(file_handle); //
          }
          //else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);
          if(ptr_Branch_5)
          {         FileWriteInteger(file_handle, 'T', SHORT_VALUE);
                    result &=  ptr_Branch_5.SaveNode_InOrder(file_handle); //
          }
          //else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);     //---x mean none null character ''
          if(ptr_Branch_6)
          {         FileWriteInteger(file_handle, 'Y', SHORT_VALUE);
                    result &=  ptr_Branch_6.SaveNode_InOrder(file_handle); //
          }
          if(!ptr_Branch_4 && !ptr_Branch_5 && !ptr_Branch_6)      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          //--- successful
          return(true); //
}
//+------------------------------------------------------------------+
//| Reading node data from file                                      |///when 'x' read node else gone throw deep
//+------------------------------------------------------------------+NOT COMPLETED
bool C_TND::LoadNode_InOrder(const int file_handle)//--need return by &
{         bool       result = true; //---------------------its true because result of load depending
          short      s_val;
          C_TND *node;
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!when main isnt & ref its may handel stackoverflow just mem link  C_TND *&main  >>>> stiil stack over flow
          //--- check
          if(file_handle == INVALID_HANDLE) return(false);
          //--- read directions----------------------------------------detect left or right on file
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE); //----read character 'x' or 'r' or 'l'
          if(s_val == 'L')//-----------------------------------------------------------------------------------must read frist branch
          {         //--- read left node (if there is data)
                    node = CreateSample("--L1--", false);  //---with out file depndency naimng file ///file just save tree schema
                    if(!CheckPointer(node))  return(false);
                    //ptr_Branch_1 = node;
                    //main = new C_TND();
                    ptr_Branch_1 = node;    //----------------      link to root
                    //node.ptr_Parent = main;//----------------------------not set com node//--linking node to parent before read
                    //result &= node.LoadNode(file_handle, node); //
                    result &=  ptr_Branch_1.LoadNode_InOrder(file_handle); //
          }
          if(s_val == 'K')
          {         //--- read left node (if there is data)
                    node = CreateSample("--L2--", false);
                    if(!CheckPointer(node))  return(false);
                    //ptr_Branch_2 = node;
                    //main = new C_TND();
                    ptr_Branch_2 = node;    //----------------      link to root
                    //node.ptr_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &=  ptr_Branch_2.LoadNode_InOrder(file_handle); //
          }
          if(s_val == 'J')
          {         //--- read left node (if there is data)
                    node = CreateSample("--L3--", false);
                    if(!CheckPointer(node))  return(false);
                    //ptr_Branch_3 = node;              //----------------      exist of node
                    ptr_Branch_3 = node;    //----------------      link to root
                    //main = new C_TND();
                    //node.ptr_Parent = main;     //----------------      link root as Parent
                    //ptr_Branch_3.ptr_Parent = main;//----------------      link root as Parent
                    //result &= node.LoadNode(file_handle, node); //
                    result &=  ptr_Branch_3.LoadNode_InOrder(file_handle); //
          }
          //-------------------------------- Inorder load
          //--- read data of current node
          result &= Load(file_handle);     ///when left branch free get root data
          //--linking nodes
          //=main;linking node to parent before read
          //--------------------------------
          //--- read directions
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE);
          if(s_val == 'R')//-----------------------------------------------------------------------------------must read frist branch
          {         //--- read right node (if there is data)
                    node = CreateSample("--R1--", false);
                    if(!CheckPointer(node))   return(false);
                    //ptr_Branch_4 = node;
                    //main = new C_TND();
                    ptr_Branch_4 = node;    //----------------      link to root
                    //node.ptr_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &=  ptr_Branch_4.LoadNode_InOrder(file_handle);//
          }
          if(s_val == 'T')
          {         //--- read right node (if there is data)
                    node = CreateSample("--R2--", false);
                    if(!CheckPointer(node))   return(false);
                    //ptr_Branch_5 = node;
                    //main = new C_TND();
                    ptr_Branch_5 = node;    //----------------      link to root
                    //node.ptr_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &=  ptr_Branch_5.LoadNode_InOrder(file_handle); //
          }
          if(s_val == 'Y')
          {         //--- read right node (if there is data)
                    node = CreateSample("--R3--", false);
                    if(!CheckPointer(node))   return(false);
                    //ptr_Branch_6 = node;
                    //main = new C_TND();
                    ptr_Branch_6 = node;    //----------------      link to root
                    //node.ptr_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &=  ptr_Branch_6.LoadNode_InOrder(file_handle); //
          }
          //--- result
          return(result);//
}

//+------------------------------------------------------------------+
//| Writing node data to file                                        | traverse based inorder
//+------------------------------------------------------------------+WORDKED
bool C_TND::SaveNode_PreOrder(const int file_handle)//--main is root
{         bool result = true;
          //--- check
          if(file_handle == INVALID_HANDLE) return(false);
          if(false)
          {         //------------------------------------------------------------Preorder save
                    //--- write data of current node
                    result &= Save(file_handle); /*ptr_root.Save(file_handle);*///--------------------------------------------------is virtual mean drived last class save load act
                    //------------------------------------------------------------
          }
          //--- write left node (if it is available)
          if(CheckPointer(ptr_Branch_1))
          {         FileWriteInteger(file_handle, 'Q', SHORT_VALUE);
                    result &= ptr_Branch_1.SaveNode_PreOrder(file_handle); //
          }
          else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(CheckPointer(ptr_Branch_2))
          {         FileWriteInteger(file_handle, 'W', SHORT_VALUE);
                    result &= ptr_Branch_2.SaveNode_PreOrder(file_handle); //
          }
          else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(CheckPointer(ptr_Branch_3))
          {         FileWriteInteger(file_handle, 'E', SHORT_VALUE);
                    result &= ptr_Branch_3.SaveNode_PreOrder(file_handle); //
          }
          else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          //--- write right node (if it is available)
          if(CheckPointer(ptr_Branch_4))
          {         FileWriteInteger(file_handle, 'R', SHORT_VALUE);
                    result &= ptr_Branch_4.SaveNode_PreOrder(file_handle); //
          }
          else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);
          if(CheckPointer(ptr_Branch_5))
          {         FileWriteInteger(file_handle, 'T', SHORT_VALUE);
                    result &= ptr_Branch_5.SaveNode_PreOrder(file_handle); //
          }
          else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(true)
          {         //------------------------------------------------------------Inorder save
                    //--- write data of current node
                    result &= Save(file_handle); //--------------------------------------------------is virtual mean drived last class save load act
                    //------------------------------------------------------------
          }
          if(CheckPointer(ptr_Branch_6))
          {         FileWriteInteger(file_handle, 'Y', SHORT_VALUE);
                    result &= ptr_Branch_6.SaveNode_PreOrder(file_handle); //
          }
          else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(CheckPointer(ptr_Branch_7))
          {         FileWriteInteger(file_handle, 'U', SHORT_VALUE);
                    result &= ptr_Branch_7.SaveNode_PreOrder(file_handle); //
          }
          else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(CheckPointer(ptr_Branch_8))
          {         FileWriteInteger(file_handle, 'I', SHORT_VALUE);
                    result &= ptr_Branch_8.SaveNode_PreOrder(file_handle); //
          }
          else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(CheckPointer(ptr_Branch_9))
          {         FileWriteInteger(file_handle, 'O', SHORT_VALUE);
                    result &= ptr_Branch_9.SaveNode_PreOrder(file_handle); //
          }
          else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(CheckPointer(ptr_Branch_10))
          {         FileWriteInteger(file_handle, 'P', SHORT_VALUE);
                    result &= ptr_Branch_10.SaveNode_PreOrder(file_handle); //
          }
          else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(false)
          {         //------------------------------------------------------------Postorder save
                    //--- write data of current node
                    result &= Save(file_handle); //--------------------------------------------------is virtual mean drived last class save load act
                    //------------------------------------------------------------
          }
          //if(!CheckPointer(main.ptr_Branch_1) && !CheckPointer(main.ptr_Branch_2) && !CheckPointer(main.ptr_Branch_3) && !CheckPointer(main.ptr_Branch_4) && !CheckPointer(main.ptr_Branch_5) && !CheckPointer(main.ptr_Branch_6) && !CheckPointer(main.ptr_Branch_7) && !CheckPointer(main.ptr_Branch_8) && !CheckPointer(main.ptr_Branch_9) && !CheckPointer(main.ptr_Branch_10))      FileWriteInteger(file_handle, 'X', SHORT_VALUE); //---x mean none null character ''//--preorder its leaf
          //--- successful
          return(true); //
}
//+------------------------------------------------------------------+
//| Reading node data from file                                      |///when 'x' read node else gone throw deep
//+------------------------------------------------------------------+WORDKED
bool C_TND::LoadNode_PreOrder(const int file_handle)
{         bool       result = true; //---------------------its true because result of load depending
          short      s_val;
          C_TND *node;
          //--- check
          if(file_handle == INVALID_HANDLE) return(false);
          if(false)
          {         //-------------------------------- Preorder load
                    //--- read data of current node
                    result &= Load(file_handle);     ///when left branch free get root data
                    //--linking nodes
                    //=main;linking node to parent before read
                    //--------------------------------
          }
          //--- read directions----------------------------------------detect left or right on file
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE); //----read character 'x' or 'r' or 'l'
          if(s_val == 'Q')//-----------------------------------------------------------------------------------must read frist branch
          {         //--- read left node (if there is data)
                    node = CreateSample("--L1--", false);  //---with out file depndency naimng file ///file just save tree schema
                    if(!CheckPointer(node))  return(false);
                    //ptr_Branch_1 = node;
                    ptr_Branch_1 = node;    //----------------      link to root
                    //node.ptr_Parent = main;//----------------------------not set com node//--linking node to parent before read
                    //result &= node.LoadNode(file_handle, node); //
                    result &= ptr_Branch_1.LoadNode_PreOrder(file_handle); //
          }
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE); //----read character 'x' or 'r' or 'l'/*must read*/
          if(s_val == 'W')
          {         //--- read left node (if there is data)
                    node = CreateSample("--L2--", false);
                    if(!CheckPointer(node))  return(false);
                    //ptr_Branch_2 = node;
                    ptr_Branch_2 = node;    //----------------      link to root
                    //node.ptr_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &= ptr_Branch_2.LoadNode_PreOrder(file_handle); //
          }
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE); //----read character 'x' or 'r' or 'l'/*must read*/
          if(s_val == 'E')
          {         //--- read left node (if there is data)
                    node = CreateSample("--L3--", false);
                    if(!CheckPointer(node))  return(false);
                    //ptr_Branch_3 = node;              //----------------      exist of node
                    ptr_Branch_3 = node;    //----------------      link to root
                    //node.ptr_Parent = main;     //----------------      link root as Parent
                    //ptr_Branch_3.ptr_Parent = main;//----------------      link root as Parent
                    //result &= node.LoadNode(file_handle, node); //
                    result &= ptr_Branch_3.LoadNode_PreOrder(file_handle); //
          }
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE); //----read character 'x' or 'r' or 'l'/*must read*/
          if(s_val == 'R')//-----------------------------------------------------------------------------------must read frist branch
          {         //--- read right node (if there is data)
                    node = CreateSample("--R1--", false);
                    if(!CheckPointer(node))   return(false);
                    //ptr_Branch_4 = node;
                    ptr_Branch_4 = node;    //----------------      link to root
                    //node.ptr_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &= ptr_Branch_4.LoadNode_PreOrder(file_handle);//
          }
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE); //----read character 'x' or 'r' or 'l'/*must read*/
          if(s_val == 'T')
          {         //--- read right node (if there is data)
                    node = CreateSample("--R2--", false);
                    if(!CheckPointer(node))   return(false);
                    //ptr_Branch_5 = node;
                    ptr_Branch_5 = node;    //----------------      link to root
                    //node.ptr_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &= ptr_Branch_5.LoadNode_PreOrder(file_handle); //
          }
          if(true)
          {         //-------------------------------- Inorder load
                    //--- read data of current node
                    result &= Load(file_handle);     ///when left branch free get root data
                    //--linking nodes
                    //=main;linking node to parent before read
                    //--------------------------------
          }
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE); //----read character 'x' or 'r' or 'l'/*must read*/
          if(s_val == 'Y')
          {         //--- read right node (if there is data)
                    node = CreateSample("--R3--", false);
                    if(!CheckPointer(node))   return(false);
                    //ptr_Branch_6 = node;
                    ptr_Branch_6 = node;    //----------------      link to root
                    //node.ptr_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &= ptr_Branch_6.LoadNode_PreOrder(file_handle); //
          }
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE); //----read character 'x' or 'r' or 'l'/*must read*/
          if(s_val == 'U')
          {         //--- read right node (if there is data)
                    node = CreateSample("--R3--", false);
                    if(!CheckPointer(node))   return(false);
                    //ptr_Branch_6 = node;
                    ptr_Branch_7 = node;    //----------------      link to root
                    //node.ptr_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &= ptr_Branch_7.LoadNode_PreOrder(file_handle); //
          }
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE); //----read character 'x' or 'r' or 'l'/*must read*/
          if(s_val == 'I')
          {         //--- read right node (if there is data)
                    node = CreateSample("--R3--", false);
                    if(!CheckPointer(node))   return(false);
                    //ptr_Branch_6 = node;
                    ptr_Branch_8 = node;    //----------------      link to root
                    //node.ptr_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &= ptr_Branch_8.LoadNode_PreOrder(file_handle); //
          }
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE); //----read character 'x' or 'r' or 'l'/*must read*/
          if(s_val == 'O')
          {         //--- read right node (if there is data)
                    node = CreateSample("--R3--", false);
                    if(!CheckPointer(node))   return(false);
                    //ptr_Branch_6 = node;
                    ptr_Branch_9 = node;    //----------------      link to root
                    //node.ptr_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &= ptr_Branch_9.LoadNode_PreOrder(file_handle); //
          }
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE); //----read character 'x' or 'r' or 'l'/*must read*/
          if(s_val == 'P')
          {         //--- read right node (if there is data)
                    node = CreateSample("--R3--", false);
                    if(!CheckPointer(node))   return(false);
                    //ptr_Branch_6 = node;
                    ptr_Branch_10 = node;    //----------------      link to root
                    //node.ptr_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &= ptr_Branch_10.LoadNode_PreOrder(file_handle); //
          }
          if(false)
          {         //-------------------------------- Postorder load
                    //--- read data of current node
                    result &= Load(file_handle);     ///when left branch free get root data
                    //--linking nodes
                    //=main;linking node to parent before read
                    //--------------------------------
          }
          //--- result
          return(result);//
}

//+------------------------------------------------------------------+
//|                                                                  |/*WORDKED*/
//+------------------------------------------------------------------+
bool C_TND:: Save(const int file_handle)
{         uint i = 0, len;
          //--- checks
          if(file_handle < 0) return(false); //>>>>>>>(SOLUTION NOT LINKING BY ASSIGN JUST COPY NODE FOR ADDRESS)>>>>>>>>>Alert("Its treenode Save ", __FUNCTION__, "  ", (string)obj_Self_Pocket.TNSD_File.IDPath, " Self_Pocket.name: ", (string)obj_Self_Pocket.name); //Sleep(3);/*ptr_root.Save(file_handle);*/////---WHy Every leaf hase same address?
          ////--- writing user data
          //----------------------------------------------------------------------------------------------------------------------------
          ////--- writing custom variable of long type
          //if( FileWriteLong(file_handle, m_long) != sizeof(long))             { Print("FileWriteLong m_long :"); return(false);}
          //----------------------------------------------------------------------------------------------------------------------------
          ////--- writing custom variable of double type
          //if(FileWriteDouble(file_handle, m_double) != sizeof(double))       { Print("FileWriteDouble m_double"); return(false);}
          //----------------------------------------------------------------------------------------------------------------------------
          ////--- writing custom variable of string type
          //len = StringLen(m_string);
          ////--- write string length
          //if(FileWriteInteger(file_handle, len, INT_VALUE) != INT_VALUE)     { Print("FileWriteInteger len"); return(false);}
          ////--- write the string
          //if(len != 0 && FileWriteString(file_handle, m_string, len) != len) { Print("FileWriteString m_string"); return(false);}
          //----------------------------------------------------------------------------------------------------------------------------
          ////--- writing custom variable of datetime type
          //if(FileWriteLong(file_handle, m_datetime) != sizeof(long))         { Print("FileWriteLong m_datetime"); return(false);}
          //---
          /*---------------------------------------------*/
          // writing custom variable of Struct Binary type
          /*----------------------------------------------*/
          {         FileWriteString(file_handle, "(TNSD_File)(", 8);
                    //--- writing custom variable of Struct Binary type
                    len = sizeof(obj_Self_Pocket.TNSD_File); //Print(sizeof(C_TNSD_File));/*C_TNSD_File >> main.obj_Self_Pocket.TNSD_File >> 87 byte*/
                    //--- write Struct length
                    if(FileWriteInteger(file_handle, len, INT_VALUE) != INT_VALUE)     { Print("FileWriteInteger len"); return(false);}
                    //--- write the Struct
                    if(FileWriteStruct(file_handle, obj_Self_Pocket.TNSD_File, len) != len)     { Print("FileWriteStruct len ", __FUNCSIG__); return(false);}
                    //Print((string)main.obj_Self_Pocket.TNSD_File.WinBuy);
                    FileWriteString(file_handle, ")", 1); //
          }
          /*---------------------------------------*/
          // writing custom variable of string type
          /*---------------------------------------*/
          if(false)
          {         FileWriteString(file_handle, "(", 1);
                    //--- writing custom variable of string type
                    len = StringLen(data_String);
                    //--- write string length
                    if(FileWriteInteger(file_handle, len, INT_VALUE) != INT_VALUE)     { Print("FileWriteInteger len"); return(false);}
                    //--- write the string
                    if(len != 0 && FileWriteString(file_handle, data_String, len) != len) { Print("FileWriteString m_string"); return(false);} //
                    FileWriteString(file_handle, ")", 1); //
          }
          return(true);//
}

//+------------------------------------------------------------------+
//|                                                                  |/*WORDKED*/
//+------------------------------------------------------------------+
bool C_TND::Load(const int file_handle) //--not write any thing of node... when virtual not defined or defined LJXXXXXXJXXRXXTXXYXX
{         uint i = 0, len = 0;
          //--- checks
          if(file_handle < 0) return(false);
          ////--- reading
          if(FileIsEnding(file_handle)) return(false);
          //----------------------------------------------------------------------------------------------------------------------------
          ////--- reading custom variable of char type
          ////--- reading custom variable of long type
          //m_long = FileReadLong(file_handle);
          //----------------------------------------------------------------------------------------------------------------------------
          ////--- reading custom variable of double type
          //m_double = FileReadDouble(file_handle);
          //----------------------------------------------------------------------------------------------------------------------------
          ////--- reading custom variable of string type
          ////--- read the string length
          //len = FileReadInteger(file_handle, INT_VALUE);
          ////--- read the string
          //if(len != 0) m_string = FileReadString(file_handle, len);
          //else       m_string = "";
          //----------------------------------------------------------------------------------------------------------------------------
          ////--- reading custom variable of datetime type
          //m_datetime = (datetime)FileReadLong(file_handle);
          //---
          /*------------------------------------------*/
          // Read custom variable of Struct Binary type
          /*-------------------------------------------*/
          {         uint readByte = 0;
                    FileReadString(file_handle, 8);
                    //--- writing custom variable of Struct Binary type
                    len = FileReadInteger(file_handle, INT_VALUE);//Print(len);/*C_TNSD_File >> main.obj_Self_Pocket.TNSD_File >> 87 byte*//*87 byte*/
                    if(len != 0) readByte = FileReadStruct(file_handle, obj_Self_Pocket.TNSD_File, len); //>>>>>>>(SOLUTION NOT LINKING BY ASSIGN JUST COPY NODE FOR ADDRESS)>>>>>>>>>Alert("Its treenode Load ", __FUNCTION__, "  ", (string)obj_Self_Pocket.TNSD_File.IDPath, " Self_Pocket.name: ", (string)obj_Self_Pocket.name); //Sleep(3);//
                    //else      { C_TNSD_File TNSD_File; TNSD_File.Id = ID; obj_Self_Pocket.TNSD_File = TNSD_File ;} //
                    if(readByte != len/*95*/ )Print(" wrong size for read struct ", readByte, __FUNCSIG__);
                    FileReadString(file_handle, 1); //
          }
          /*------------------------------------*/
          // Read custom variable of string type
          /*------------------------------------*/
          if(false)
          {         FileReadString(file_handle, 1);
                    //--- reading custom variable of string type
                    //--- read the string length
                    len = FileReadInteger(file_handle, INT_VALUE);
                    //--- read the string
                    if(len != 0) data_String = FileReadString(file_handle, len);
                    else       data_String = "";//
                    FileReadString(file_handle, 1); //
          }
          return(true);//
}
//C_TND C_TND::nLast= new C_TND();  /*static pointer not racceptd*/
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CTree_Traverse_LevelOrder
{
public:
          // A Binary Tree Node
          //struct Node
          //{         int data;
          //          struct Node *left, *right;//
          //};
          bool       IsFilesExisted;
          uint       seekbyte;
          CFileServer  *ptr_FileServer;
          CTree_Traverse_LevelOrder()
          {         ptr_FileServer = new CFileServer(); }
          ~CTree_Traverse_LevelOrder()
          {         delete  ptr_FileServer;//must delete
          }

          // Iterative method to find height of Binary Tree
          void       Save_Orders(C_TND* ptr_Node_Root)//----2 GB memory use
          {         /*--------------------------------------------------------------------*/
                    //   Opration on erorr that cant controll save of tree C_TND
                    /*--------------------------------------------------------------------*/
                    if (!ptr_Node_Root) {return;}
                    // Base Case
                    string Desc;
                    static ulong LevelCount = 0;
                    //----------------------------------------------------------------------------------------------------------------------------------------
                    ptr_FileServer.FileTxt.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder.txt", FILE_READ | FILE_WRITE);
                    ptr_FileServer.FileTxt.Flush();
                    ptr_FileServer.FileTxt.WriteString("------------tree_Root_LevelOrder------------" + "\n");
                    //----------------------------------------------------------------------------------------------------------------------------------------
                    ptr_FileServer.FileBin.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder.Bin", FILE_READ | FILE_WRITE);
                    ptr_FileServer.FileBin.Flush();
                    ptr_FileServer.FileBin.WriteString("------------tree_Root_LevelOrder------------" + "\n");
                    //---------------------------
                    unsigned int count = 0;
                    ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data"  + ".Bin", FILE_READ | FILE_WRITE);
                    ptr_FileServer.FileBin2.Flush();
                    //----------------------------------------------------------------------------------------------------------------------------------------
                    // Create an empty queue for level order traversal// Enqueue Root and initialize height
                    CDSQueue_By_List<C_TND*> QueueSaveCash("QueueSaveCash");  // CDSQueue_By_List<C_TND*> q;      //!!---CDSQueue_By_List<ptr_Node_Root*> q;  //--error object
                    QueueSaveCash.push(ptr_Node_Root);
                    /*------------------------------------------*/
                    //  fileBin WriteString
                    /*------------------------------------------*/
                    ptr_FileServer.FileBin2.WriteString("|R"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|b1|"*/);
                    while (!QueueSaveCash.empty())
                    {         // Print front of queue and remove it from queue
                              C_TND* ptr_Node = QueueSaveCash.front();
                              //---cheack fornt is not null continue
                              if (!QueueSaveCash.front()) continue;
                              /******************whare save node************************************/// [R,Rb1,Rb2] [b1,b2,b1b1,b1b2] [b2,b1b1,b1b2,b2b1,b2b2]
                              //!!--cout << ptr_Node.data << " ";
                              Desc += QueueSaveCash.front().obj_Self_Pocket.name + " | ";
                              /*------------------------------------------*/
                              //  Tree_Save_Load fileTxt WriteString
                              /*------------------------------------------*/
                              ptr_FileServer.FileTxt.WriteString("[" + QueueSaveCash.front().obj_Self_Pocket.name + "]" + "\t");
                              /*------------------------------------------*/
                              //  Tree_Save_Load fileBin WriteStruct
                              /*------------------------------------------*/
                              //ptr_FileServer.FileBin.WriteStruct(QueueSaveCash.front().obj_Self_Pocket.TNSD2_SAVE);
                              /*------------------------------------------*/
                              //  Tree_Save_Load fileBin WriteStruct
                              /*------------------------------------------*/
                              //ptr_FileServer.FileBin2.WriteStruct(QueueSaveCash.front().obj_Self_Pocket.TNSD2_SAVE);
                              //***************************************************************************************************************************************************
                              //if (QueueLoadCash.front())
                              QueueSaveCash.pop(); { LevelCount++;}
                              //
                              if (ptr_Node.ptr_Branch_1)        {QueueSaveCash.push(ptr_Node.ptr_Branch_1);        ptr_FileServer.FileBin2.WriteString("|b1"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|b1|"*/);} /* Enqueue left child */
                              if (ptr_Node.ptr_Branch_2)        {QueueSaveCash.push(ptr_Node.ptr_Branch_2);        ptr_FileServer.FileBin2.WriteString("|b2"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|b2|"*/);} //  /*Enqueue right child */
                              if (ptr_Node.ptr_Branch_3)        {QueueSaveCash.push(ptr_Node.ptr_Branch_3);        ptr_FileServer.FileBin2.WriteString("|b3"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|b3|"*/);} //
                              if (ptr_Node.ptr_Branch_4)        {QueueSaveCash.push(ptr_Node.ptr_Branch_4);        ptr_FileServer.FileBin2.WriteString("|b4"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|b4|"*/);} //
                              if (ptr_Node.ptr_Branch_5)        {QueueSaveCash.push(ptr_Node.ptr_Branch_5);        ptr_FileServer.FileBin2.WriteString("|b5"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|b5|"*/);} //
                              if (ptr_Node.ptr_Branch_6)        {QueueSaveCash.push(ptr_Node.ptr_Branch_6);        ptr_FileServer.FileBin2.WriteString("|b6"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|b6|"*/);} //
                              if (ptr_Node.ptr_Branch_7)        {QueueSaveCash.push(ptr_Node.ptr_Branch_7);        ptr_FileServer.FileBin2.WriteString("|b7"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|b7|"*/);} //
                              if (ptr_Node.ptr_Branch_8)        {QueueSaveCash.push(ptr_Node.ptr_Branch_8);        ptr_FileServer.FileBin2.WriteString("|b8"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|b8|"*/);} //
                              if (ptr_Node.ptr_Branch_9)        {QueueSaveCash.push(ptr_Node.ptr_Branch_9);        ptr_FileServer.FileBin2.WriteString("|b9"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|b9|"*/);} //
                              if (ptr_Node.ptr_Branch_10)       {QueueSaveCash.push(ptr_Node.ptr_Branch_10);       ptr_FileServer.FileBin2.WriteString("|b10"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|b10|"*/);} //
                              if (ptr_Node.ptr_Parent)          {QueueSaveCash.push(ptr_Node.ptr_Parent);          ptr_FileServer.FileBin2.WriteString("|bp"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|bp|"*/);} //
                              if (ptr_Node.ptr_BackupRootSave)  {QueueSaveCash.push(ptr_Node.ptr_BackupRootSave);      ptr_FileServer.FileBin2.WriteString("|bbr"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|bbr|"*/);} //
                              if (ptr_Node.ptr_Backup)          {QueueSaveCash.push(ptr_Node.ptr_Backup);          ptr_FileServer.FileBin2.WriteString("|bb"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|bb|"*/);} //
                              if (ptr_Node.ptr_BackupRootLoad)  {QueueSaveCash.push(ptr_Node.ptr_BackupRootLoad);  ptr_FileServer.FileBin2.WriteString("|bbrl"/*"|lc:" + (string)ptr_Node.Node_Leafs + "|hl:" + (string)ptr_Node.Node_Height + "|bb|"*/);} //
                              //delete ptr_Node;
                              //delete ptr_Node2;
                    } //
                    LevelCount = 0;
                    ptr_FileServer.FileTxt.Close();
                    ptr_FileServer.FileBin.Close();
                    ptr_FileServer.FileBin2.Close();
                    Print("-----Save_Orders:-----", Desc); //
          }//
          // Iterative method to find height of Binary Tree
          //=======================================================================================
          void       Load_LevelOrder_Rec_Call_X(C_TND *& ptr_Node_Root)
          {         Print("-------Load_Start_LevelOrder start-------", __FUNCSIG__);
                    int file_handleBinA = ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                    Print("-------Load_Start_LevelOrder opened file-------", __FUNCSIG__);
                    //--- print the file contents
                    Print("-------Load_Start_LevelOrder loading file-------", __FUNCSIG__);
                    delete ptr_Node_Root;
                    ptr_Node_Root = new C_TND; //--by pass out of memory
                    ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root);
                    //----close file---------------
                    ptr_FileServer.FileBin2.Close();
                    Print("-------Load_complete_LevelOrder closed file-------"); //
                    return;//
          }
          C_TND*     Load_LevelOrder_Rec(C_TND *& ptr_Node_Root)
          {         /*--------------------------------------------------------------------*/
                    //   Opration on erorr that cant controll represent of tree C_TND
                    /*--------------------------------------------------------------------*/
                    static ulong callcount = 0;
                    ulong File_Poss_curr = 0;
                    if(!ptr_Node_Root) { C_TND::initObj(ptr_Node_Root);}
                    // Create an empty queue for level order traversal// Enqueue Root and initialize height
                    CDSQueue_By_List<C_TND*> QueueLoadCash("QueueLoadCash" + (string)callcount); // CDSQueue_By_List<C_TND*> q;      //!!---CDSQueue_By_List<ptr_Node_Root*> q;  //--error object
                    CDSQueue_By_List<C_TND*> QueueLoadExit("QueueLoadExit" + (string)callcount);
                    QueueLoadCash.push(ptr_Node_Root);
                    Print("-------Out of mem trace start-------", __FUNCSIG__);
                    while(!FileIsEnding(ptr_FileServer.FileBin2.Handle()))
                    {         //#r--------------------------------------------------------------------------------------------------------------------
                              string Seprator_Perfix;
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 2);
                              uint bytRead = 0;
                              if( (Seprator_Perfix == "|R"))
                              {         //bytRead = ptr_FileServer.FileBin2.ReadStruct(ptr_Node_Root.obj_Self_Pocket.TNSD2_LOAD, sizeof(C_TNSD_File));
                                        //while(!ptr_FileServer.FileBin2.IsLineEnding())   { ptr_FileServer.FileBin2.Seek(1, SEEK_CUR); }//---forward file pointer to next line
                                        if(bytRead == 0) {    return ptr_Node_Root = QueueLoadExit.front(); }//Print(" bytRead == 0 ", __FUNCSIG__);
                              }
                              else
                              {         //Print("Seprator_Perfix == |b1", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        //ptr_FileServer.FileBin2.Seek(0, SEEK_SET);
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#b1--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 3);
                              if( (Seprator_Perfix == "|b1"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_Branch_1);        //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_Branch_1.obj_Self_Pocket.TNSD2_LOAD);//'ptr_Node_Root' - import not defined       Advanced_TreeNode_Decition2.mqh         892       31
                              }
                              else
                              {         //Print("Seprator_Perfix == |b1", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        //ptr_FileServer.FileBin2.Seek(0, SEEK_SET);
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#b2--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 3);
                              if( (Seprator_Perfix == "|b2"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_Branch_2);        //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_Branch_2.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |b2", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#b3--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 3);
                              if( (Seprator_Perfix == "|b3"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_Branch_3);        //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_Branch_3.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |b3", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#b4--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 3);
                              if( (Seprator_Perfix == "|b4"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_Branch_4);        //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_Branch_4.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |b4", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#b5--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 3);
                              if( (Seprator_Perfix == "|b5"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_Branch_5);        //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_Branch_5.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |b5", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#b6--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 3);
                              if( (Seprator_Perfix == "|b6"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_Branch_6);        //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_Branch_6.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |b6", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#b7--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 3);
                              if( (Seprator_Perfix == "|b7"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_Branch_7);        //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_Branch_7.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |b7", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#b8--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 3);
                              if( (Seprator_Perfix == "|b8"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_Branch_8);        //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_Branch_8.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |b8", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#b9--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 3);
                              if( (Seprator_Perfix == "|b9"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_Branch_9);        //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_Branch_9.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |b9", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#b10--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 4);
                              if( (Seprator_Perfix == "|b10"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_Branch_10);       //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_Branch_10.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |b10", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#bp--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 3);
                              if( (Seprator_Perfix == "|bp"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_Parent);          //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_Parent.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |bp", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#bbr--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 4);
                              if( (Seprator_Perfix == "|bbr"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_BackupRootSave);      //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_BackupRootSave.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |bbr", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#bb--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 3);
                              if( (Seprator_Perfix == "|bb"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_Backup);          //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_Backup.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |bb", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                              }
                              //#bbrl--------------------------------------------------------------------------------------------------------------------
                              File_Poss_curr = ptr_FileServer.FileBin2.Tell();
                              ptr_FileServer.FileBin2.ReadString(Seprator_Perfix, 5);
                              if( (Seprator_Perfix == "|bbrl"))
                              {         C_TND::initObj(QueueLoadCash.front().ptr_BackupRootLoad);  //bytRead = ptr_FileServer.FileBin2.ReadStruct(QueueLoadCash.front().ptr_BackupRootLoad.obj_Self_Pocket.TNSD2_LOAD);//
                              }
                              else
                              {         //Print("Seprator_Perfix == |bbrl", __FUNCSIG__);
                                        //ptr_FileServer.FileBin2.Close();
                                        //ptr_FileServer.FileBin2.Open("QuArtsRoot" + "\\" + "TradeSignal_MapSenceTree" + "\\" + "tree_Root_LevelOrder" + "\\" + "BinTree_Data" + ".Bin", FILE_READ | FILE_WRITE);// cause error out of memmory
                                        ptr_FileServer.FileBin2.Seek(File_Poss_curr, SEEK_SET); //--seek back
                                        continue;//
                              }
                              //
                              /* after set root branches Give the toot for queueExite kepper  to recuresive call */
                              C_TND * ptr_Node_Root_Cash = QueueLoadCash.popObj();
                              if(ptr_Node_Root_Cash) {Print("callcount:", callcount++);}
                              if(!ptr_Node_Root_Cash) {Print("QueueSaveCash.push(empty pointer)");}
                              QueueLoadExit.push(ptr_Node_Root_Cash); //--root poped mean deleted///error//'popObj' - parameter passed as reference, variable expected        Advanced_TreeNode_Decition2.mqh         958       56
                              //
                              C_TND * ptr_Node_Root_Exit = QueueLoadExit.front();
                              if(ptr_Node_Root_Exit) {Print("QueueLoadExit.front(not empty pointer)");}
                              if(!ptr_Node_Root_Exit) {Print("QueueLoadExit.front(    empty pointer)");}
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_Branch_1);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_Branch_2);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_Branch_3);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_Branch_4);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_Branch_5);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_Branch_6);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_Branch_7);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_Branch_8);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_Branch_9);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_Branch_10);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_Parent);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_BackupRootSave);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_Backup);
                              ptr_Node_Root = Load_LevelOrder_Rec(ptr_Node_Root_Exit.ptr_BackupRootLoad);
                              //
                    }
                    Print("-------Out of mem trace End-------", __FUNCSIG__);
                    return QueueLoadExit.front();
                    //
          }



          // Utility function to create a new tree node
          C_TND* newNode_test(int data)
          {         C_TND* ptr_temp = new C_TND;
                    ptr_temp.data = data;
                    //temp->left = temp->right = NULL;
                    return ptr_temp;//
          }

          // Driver program to test above functions
          int main_test()
          {         // Let us create binary tree shown in above diagram
                    C_TND* root = newNode_test(1);
                    //root->left = newNode(2);
                    //root->right = newNode(3);
                    //root->left->left = newNode(4);
                    //root->left->right = newNode(5);
                    //cout << "Level Order traversal of binary tree is \n";
                    //printLevelOrder(root);
                    return 0;//
          }//
          ///-----------------------------------------------------------------------------------
          //int saveTree(struct NODE *node, char filename[], int posInFile)
          //{         FILE *file;
          //          file = fopen(filename, "r+b"); //r+ so as to overwrite existing data instead of appending
          //          char c;
          //          char posStr[POS_LENGTH];
          //          fseek(file, posInFile, SEEK_SET);
          //          while((c = fgetc(file)) != EOF)
          //          {         if(node != NULL)
          //                    {         fseek(file, -1, SEEK_CUR);
          //                              fwrite(node->data.data, sizeof(char), DATA_LENGTH, file);
          //                              sprintf(posStr, "%d", node->data.filePos);
          //                              fwrite(posStr, sizeof(char), POS_LENGTH, file);
          //                              posInFile = ftell(file);
          //                              saveTree(node->left, filename, posInFile);
          //                              saveTree(node->right, filename, posInFile); //
          //                    }//
          //          }
          //          fclose(file);
          //          return 1; //
          //}

};
//+------------------------------------------------------------------+
