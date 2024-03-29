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
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_Decition2.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAC\Ticks\SignalDatas.mqh>
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
input uchar TreeDecitionDepthLevel = 5;  //TreeDecitionDepthLevel XLevel > 16
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_TD2: public C_TND
{
public:
          C_TND *ptr_root;
          //C_TND *ptr_root_Choosen;
          static uchar  XlevelDecition;

public:
          //C_TD2(void)                   {initing("");};
          C_TD2()      {initing();};
          ~C_TD2(void)
          {         delete  ptr_FileServer;//must delete
          };
          // contain file server
          CFileServer     *ptr_FileServer;
          void initing()  { FolderPath = "TradeSignals\\MapSenceTreeDecition\\"; ptr_FileServer = new CFileServer(); }
          void Save_Orders(bool b);
          bool Load_Orders();
          string FolderPath;
          static float  TreeProfitedTotal;;
          static double  AllTreeProfitingEver;
          static bool    IsUptadedTreeProfitedTotal;;//'TreeProfitedTotal' - access to non-static member or function    Struct_TreeNode_File_Decition2.mqh      74        59
          //-------------------------------
          SignalDatas_MovingAvrages             _MovingAvrages;
          SignalDatas_MACD                      _MACD;
          SignalDatas_RSI                       _RSI;
          SignalDatas_Stochastic                _Stochastic;
          SignalDatas_RVI                       _RVI;
          SignalDatas_Bollingrad_band           _Bollingrad_band;
          SignalDatas_ADX                       _ADX;
          SignalDatas_MFI                       _MFI;
          SignalDatas_OVB                       _OVB;
          SignalDatas_ATR                       _ATR;
          SignalDatas_Force                     _Force;
          SignalDatas_WPR                       _WPR;
          SignalDatas_SAR                       _SAR;  //----cooller
          SignalDatas_Ichmiko                   _Ichmiko;
          SignalDatas_AD                        _AD;
          SignalDatas_AliGator                  _AliGator;
          SignalDatas_STD                       _STD;
          SignalDatas_BWMFI                     _BWMFI;
          SignalDatas_TrendLineBoxFractal       _TrendLineBoxFractal;
          SignalDatas_TL_0_50_50_100_HL         _TL_0_50_50_100_HL;
          SignalDatas_TL_500_HL                 _TL_500_HL;
          SignalDatas_FE                        _FE_50, _FE_100, _FE_200;;
          SignalDatas_HL_50_100_150             _HL_50_100_150;
          SignalDatas_STD_Channel               _STD_Channel;
          //-------------------------------
          //int               CountBranchAll;
          //ulong             Node_Height;
          //ulong             Node_Leafs;
          //ulong             Node_Total;
          //ulong             r_LeafCount;
          //ulong             r_totalNodes;
          //ulong             NODE_Number;//
          //ulong             NODE_LEAF_Number;//.
          //---------------------------------------------
          /*Main test*/
          int MainProgress(bool b);
          bool Main_Path_Build_Marge_Exmain(bool IsUpdate);
          bool Biuld_Curr_Root(uchar Level);
          void Traverse_PostOrder_INIT_SELF_DATA_TNSD2(C_TND *&ptr_Node_New, C_TND *&ptr_Node_Loaded);//---out of memmory problem...
          void Main_INFOs(C_TND *& ref_ptr_Node);
          bool getIsLeaf(C_TND *ptrNode);
          //***************************************************************************************************************************
          /*must level order traverse used*/
          //ptr_Node_New.obj_Self_Pocket.TNSD_File.NODE_Number = NODE_Number++; if(getIsLeaf(ptr_Node_New)) {ptr_Node_New.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = NODE_LEAF_Number++;}
          //ptr_Node_New.obj_Self_Pocket.TNSD_File.NODE_Number = NODE_Number++; if(getIsLeaf(ptr_Node_New)) {ptr_Node_New.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = NODE_LEAF_Number++;}
          void Traverse_LEVELOrder_NODE_Numbering(C_TND *&ptr_Node);
          void LeafSum(C_TND *&ptr_Node, ulong & sum);//---set id by implusing every leaf
          void Traverse_LEVELOrder_NODE_Numbering2(C_TND *&ptr_Node);
          void TraverseLevelOrder(C_TND *&ptr_node_root);
          void NumberingCurrentLevel(C_TND *&ptr_node_root, ulong level);  //:::printLevelOrder
          ulong getNode_Leafs_Numbering(C_TND *&ptr_Node);
          //***************************************************************************************************************************
          void Root_Setup();
          //***************************************************************************************************************************
          virtual bool Save(const int file_handle)
          {         uint i = 0, len;
                    //--- checks
                    if(file_handle < 0) return(false); Print("Its tree Save ", __FUNCTION__, "  ", (string)obj_Self_Pocket.TNSD_File.IDPath);
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
                              len = sizeof(this.obj_Self_Pocket.TNSD_File); //Print(sizeof(C_TNSD_File));/*C_TNSD_File >> main.obj_Self_Pocket.TNSD_File >> 87 byte*/
                              //--- write Struct length
                              if(FileWriteInteger(file_handle, len, INT_VALUE) != INT_VALUE)     { Print("FileWriteInteger len"); return(false);}
                              //--- write the Struct
                              if(FileWriteStruct(file_handle, this.obj_Self_Pocket.TNSD_File, len) != len)     { Print("FileWriteStruct len ", __FUNCSIG__); return(false);}
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
          /*WORDKED*/
          virtual bool Load(const int file_handle) //--not write any thing of node... when virtual not defined or defined LJXXXXXXJXXRXXTXXYXX
          {         uint i = 0, len = 0;
                    //--- checks
                    if(file_handle < 0) return(false);
                    ////--- reading
                    if(FileIsEnding(file_handle)) return(false); Print("Its tree Load ", __FUNCTION__, "  ", (string)obj_Self_Pocket.TNSD_File.IDPath);
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
                              if(len != 0) readByte = FileReadStruct(file_handle, this.obj_Self_Pocket.TNSD_File, len);
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
          } //
};

float C_TD2::TreeProfitedTotal = 0;;
double C_TD2::AllTreeProfitingEver = 0;;
bool C_TD2::IsUptadedTreeProfitedTotal = 0;;
uchar C_TD2::XlevelDecition = TreeDecitionDepthLevel;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TD2::Save_Orders(bool b)
{         
          if(!b)return;
          /*open file*/
          ptr_FileServer.FileBin2.Open( MainRootPath + FolderPath + "BinData_TreeNodesDecition" + "_" + (string)XlevelDecition + ".Bin", FILE_READ | FILE_WRITE | FILE_BIN);
          //ptr_FileServer.FileBin2.Flush();///--write from bigining no need
          /*Write file*/
          //SaveNode_InOrder(ptr_FileServer.FileBin2.Handle(), root);
          ptr_root.SaveNode_PreOrder(ptr_FileServer.FileBin2.Handle());/*ptr_root.SaveNode_PreOrder(ptr_FileServer.FileBin2.Handle());*/ /*WORDKED*/ //Print("--------Save_Orders----------"); Sleep(1000); //
          //SaveNode_PreOrder(ptr_FileServer.FileBin2.Handle());/*gTD2.SaveNode_PreOrder(ptr_FileServer.FileBin2.Handle());*/
          /*open file*/
          /*close file*/
          ptr_FileServer.FileBin2.Close();
          //Print("__________Root Save End______", __FUNCTION__, "___________________"); //
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_TD2::Load_Orders()
{         //bool res = true; ; Sleep(10);
          /*open file*/
          //----------------------------------------------!!! when testing its saved loaded in tester direction.
          //Print("location: ", MainRootPath + FolderPath + "BinData_TreeNodesDecition" + "_" + (string)XlevelDecition + ".Bin");
          //if(FileIsExist(MainRootPath + FolderPath + "BinData_TreeNodesDecition" + "_" + (string)XlevelDecition + ".Bin", ~FILE_COMMON))
          //{         Print("location.trueCommon: ", MainRootPath + FolderPath + "BinData_TreeNodesDecition" + "_" + (string)XlevelDecition + ".Bin"); //
          //}
          //if(FileIsExist(MainRootPath + FolderPath + "BinData_TreeNodesDecition" + "_" + (string)XlevelDecition + ".Bin", 0))
          //{         Print("location.truelocal: ", MainRootPath + FolderPath + "BinData_TreeNodesDecition" + "_" + (string)XlevelDecition + ".Bin"); //
          //}
          //----------------------------------------------
          if(!ptr_FileServer.FileBin2.IsExist(MainRootPath + FolderPath + "BinData_TreeNodesDecition" + "_" + (string)XlevelDecition + ".Bin", 0))         {Print(" BinData_TreeNodesDecition" + "_" + (string)XlevelDecition + ".Bin __FILE NOT EXISTED__", __FUNCTION__); return false; }
          //if(!FileIsExist(MainRootPath + FolderPath + "BinData_TreeNodesDecition" + "_" + (string)XlevelDecition + ".Bin", 0))                               {Print(" BinData_TreeNodesDecition" + "_" + (string)XlevelDecition + ".Bin __FILE NOT EXISTED__", __FUNCTION__); return false; }
          else
          {         //Print(" BinData_TreeNodesDecition" + "_" + (string)XlevelDecition + ".Bin __FILE EXISTED__", __FUNCTION__);
                    //if(FileIsExist(file_name, common_flag)){}
                    ptr_FileServer.FileBin2.Open(MainRootPath + FolderPath + "BinData_TreeNodesDecition" + "_" + (string)XlevelDecition + ".Bin", FILE_READ | FILE_WRITE);
                    /*Read file*/
                    //LoadNode_InOrder(ptr_FileServer.FileBin2.Handle(), root);
                    ptr_root.LoadNode_PreOrder(ptr_FileServer.FileBin2.Handle()); //Print("---------Load_Orders---------"); Sleep(1000); // //res = /*WORDKED*/
                    //LoadNode_PreOrder(ptr_FileServer.FileBin2.Handle());/*gTD2.LoadNode_PreOrder(ptr_FileServer.FileBin2.Handle());*/
                    /*open file*/
                    /*close file*/
                    ptr_FileServer.FileBin2.Close();//
                    return true;//
          }
          //Print("__________Root Load End______", __FUNCTION__, "___________________"); //
          return false;
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TD2::Main_INFOs(C_TND *& ref_ptr_Node)
{         //-------------
          if(!CheckPointer(ref_ptr_Node) || ref_ptr_Node == NULL) { return; } // when is null
          //-------------
          //0000ref_ptr_Node.r_LeafCount  = CPack_tree::getNode_Leafs(ref_ptr_Node);
          ref_ptr_Node.Node_Total = CPack_tree::getNode_Total(ref_ptr_Node);
          //Print("_________Set NODES ID NUMBER Pramid_______", __FUNCTION__, "___________________"); //
          Traverse_LEVELOrder_NODE_Numbering(ref_ptr_Node);//---TNSD2numbering by sum
          //r_LeafCount  = getNode_Leafs(ref_ptr_Node); //class of main saving
          //r_totalNodes = getNode_Total(ref_ptr_Node);
          {         //Print("_________infograph Pramid_______", __FUNCTION__, "___________________"); //
                    //---------------------------------------
                    /*infograph root of Pramid of decition */
                    //---------------------------------------
                    //Node_Height      = CPack_tree::getNode_Height(Pack_tree.ptr_TND_Root);
                    //Node_Leaf        = CPack_tree::getNode_Leafs(Pack_tree.ptr_TND_Root);
                    //Node_Total       = CPack_tree::getNode_Total(Pack_tree.ptr_TND_Root);
                    //Main(ref_ptrNodeBackup_Saved_Root.ptr_Parent);//
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_TD2::Main_Path_Build_Marge_Exmain(bool IsUpdate)
{         //Print("__________START______", __FUNCTION__, "___________________"); //
          {         //--------------------------------------------------
                    /* BUILD CURRENT STATE FOR Pack_tree.ptr_TND_Root *//*START*/
                    //--------------------------------------------------
                    //Alert("A TND.Tot1(" + (string)C_TND::TOTAL_One); ///>>>(there is 2 that is runner and ptr_oot)
                    //if(!IsUpdate)
                    if(!Biuld_Curr_Root(XlevelDecition)) {Print("__BUILD_FAILED__", __FUNCSIG__);};     /*Define Pointers */ //by pack ////C_TND *ptr_TND_Root ;//= newNode(10);    ///>>>>>ERROR ADDING NODE NOT DELETED<<<<
                    //Print("_________Loaded Pramid_______", __FUNCTION__, "___________________"); //
                    //------------------------------------------------------------------------------
                    /* ROOT Data LOAD Need Traverse Decition Pramid For Init The Loaded Data Copy *///Pack_tree.ptr_TND_Root.obj_Self_Pocket.TNSD_File.Wb = 0;
                    //------------------------------------------------------------------------------
                    /*not load what happen?(choosen not selected) *///
                    if(true/*change other files! jut not create new node */)Traverse_PostOrder_INIT_SELF_DATA_TNSD2(Pack_tree.ptr_TND_Root, ptr_root);  //-- (root free not allowed) depended out of memmory problem...
                    /*controll after copy*//*make by choosernot woork chooser only choosen set not all */ /*not load what happen?(choosen not selected) evet notdelete root (depended too root choosen??why(root to chosen exited** worked))*/
                    Traverse_PostOrder_Delete(ptr_root); //
                    //0--Pack_tree.ptr_TND_Root = Traverse_Merge_Both(Pack_tree.ptr_TND_Root, ptr_root);//--builded merge by loaded//////its correct op<><><><><><> if correct it mean complex root availble with loaded root
                    {         //------------------------------------------------------------------
                              /* merge Pramid of decition by ptr_Node_Keep_last_FromRootToSave_Runtime  */
                              //------------------------------------------------------------------
                              //!!!!!!>>>Pack_tree.ptr_TND_Root = Traverse_Merge_Both(Pack_tree.ptr_TND_Root, ptr_Node_Keep_last_FromRootToSave_Runtime); //--builded merge by saved// same as uper merge
                              //!!!!!!>>>if(IsUpdate)Traverse_PostOrder_Delete(ptr_Node_Keep_last_FromRootToSave_Runtime); //2023.04.07 11:19:37.184 QUARTS_AF1 XAUUSD.F,M1: global initialization failed// when not find file
                    }
                    //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                    //if(ref_ptrNodeBackup_Loaded_Root)Print("----load data--------ref_ptrNodeBackup_Loaded_Root.obj_Self_Pocket.TNSD_File.Wb: ", ref_ptrNodeBackup_Loaded_Root.obj_Self_Pocket.TNSD_File.Wb);
                    //Print("----load data--------Pack_tree.ptr_TND_Root.obj_Self_Pocket.TNSD_File.Wb: ",       Pack_tree.ptr_TND_Root.obj_Self_Pocket.TNSD_File.Wb);//
          }
          //***********************************************************************************************************************************************************************************************************hard....to recover very nide data branches
          Main_INFOs(Pack_tree.ptr_TND_Root);
          {         //Print("_________Choosing answer of Pramid_______", __FUNCTION__, "___________________"); //
                    //---------------------------------------------------------
                    /* Choosing answer of Pramid of decition (selected node )*/
                    //---------------------------------------------------------
                    //ChooseAnswer_NodeID();//??????????????//---------Offer void just
                    //ptr_root.ChooseAnswer_NodeID();//??????????---------Offer void just
                    //
          }
          {         //Print("_________Trade for selected node of Pramid_______", __FUNCTION__, "___________________"); //
                    //---------------------------------------------------------
                    /* (Traverse all leaf every Cycle ) Trade for selected node              */ /* not other node trading...leafs */
                    //---------------------------------------------------------
                    {         if(!Pack_tree.ptr_TND_Root) {Print(  " ! _______ Pack_tree.ptr_TND_Root ARE NULL___", __FUNCTION__ );}///gorxudax set descs
                              //fail Pack_tree.ptr_TND_Root.Traverse_XOrder_TradeOff();///why late not run!
                              //fail Pack_tree.ptr_TND_Root.Traverse_LevelOrder(Pack_tree.ptr_TND_Root);//worked not recurecive???
                              C_TD2::AllTreeProfitingEver = 0;//--every cycle tree build need to know
                              //Print("_________Trade for leaf node of Pramid_______", __FUNCTION__, "___________________"); //
                              //Print("leaf count: ", (string)Pack_tree.ptr_TND_Root.TraverseTree_Leafs_TradeOFF(Pack_tree.ptr_TND_Root));//
                              Pack_tree.ptr_TND_Root.TraverseTree_Leafs_TradeOFF(Pack_tree.ptr_TND_Root); }
                    //---------------------------------------------------------
                    /* (selected node leaf every Cycle ) Trade for selected node              */ /* not other node trading...leafs */
                    //---------------------------------------------------------
                    //fail Pack_tree.ptr_TND_Root.Trade_Choosen( ptr_Node_Choosen);// /*root run self.... then its path id is zeroo*/
                    if(!Pack_tree.ptr_TND_Root) {Print(  " ! _______ Pack_tree.ptr_TND_Root ARE NULL___", __FUNCTION__ );}
                    Pack_tree.ptr_TND_Root.ChooseAnswer_NodeID();//Print(  "____RUN TREE ANSWER___" ); //???????????/*WORKED*/
                    //
          }
          //Print("_________recover to choosen of Pramid_______", __FUNCTION__, "___________________"); //
          {         //------------------------------------------------
                    /*recover to choosen too Pack_tree.ptr_TND_Root.*/
                    //------------------------------------------------
                    /*controll after copy*/Traverse_PostOrder_Delete(ptr_root); //
                    //Pack_tree.ptr_TND_Root = ptr_Node_Choosen_Root; //no need from runner
          }
          //---------------------------
          /* export AnswerAddressNode*/
          //---------------------------
          {         //---------------------
                    /* ROOT Store (Save) */    //Pack_tree.ptr_TND_Root.obj_Self_Pocket.TNSD_File.Wb = 1252520;
                    //---------------------
                    {         //!!!!!!>>>Traverse_PostOrder_Delete(ptr_root); //if not delete subs out of memmory
                              ptr_root = Traverse_Move(Pack_tree.ptr_TND_Root);;;;   // NOT LINKING !!! ADDRESS SETED  CAUTION !!
                              //Alert("B TND.Tot1(" + (string)C_TND::TOTAL_One); ///>>>(there is 2 that is runner and ptr_oot)
                              ///----move no nede delete Root but other levels need delete>>>
                              Pack_tree.Traverse__Delete();//---freee all//--- there is error not delete !!
                              //Alert("H TND.Tot1 2 + 11 + Subs? H-A (" + (string)C_TND::TOTAL_One); ///>>>(there is 2 that is runner and ptr_oot +11 ) (that 11 nevere deleting)
                              //!!!!!!>>>ptr_Node_Keep_last_FromRootToSave_Runtime = Traverse_Copy(ptr_root);
                    }
                    {         //ptr_root = Traverse_Copy(Pack_tree.ptr_TND_Root);//---out of mem
                              //ptr_root = Traverse_Merge_Both(Pack_tree.ptr_TND_Root, ptr_root);//---out of mem
                              //!!!!!!>>>root not deleted build copy to  root
                    } //
          }
          {         //-------------------
                    /* ROOT EXIT       */
                    //-------------------
          }
          {         //-------------------------------------------
                    /*Cheak out any other pointer live at build*/
                    //-------------------------------------------
                    //if(CheckPointer(ptr_root))                          {Print("ptr_root Is existed", __FUNCSIG__);}
                    //if(CheckPointer(Pack_tree.ptr_TND_Root))            {Print("Pack_tree.ptr_TND_Root Is existed", __FUNCSIG__);}
                    //if(CheckPointer(Pack_tree.ptr_TND_SubLevel_1))      {Print("Pack_tree.ptr_TND_SubLevel_1 Is existed", __FUNCSIG__);}
                    //if(CheckPointer(Pack_tree.ptr_TND_SubLevel_2))      {Print("Pack_tree.ptr_TND_SubLevel_2 Is existed", __FUNCSIG__);}
                    //if(CheckPointer(Pack_tree.ptr_TND_SubLevel_3))      {Print("Pack_tree.ptr_TND_SubLevel_3 Is existed", __FUNCSIG__);}
                    //if(CheckPointer(Pack_tree.ptr_TND_SubLevel_4))      {Print("Pack_tree.ptr_TND_SubLevel_4 Is existed", __FUNCSIG__);}
                    //if(CheckPointer(Pack_tree.ptr_TND_SubLevel_5))      {Print("Pack_tree.ptr_TND_SubLevel_5 Is existed", __FUNCSIG__);}
                    //if(CheckPointer(Pack_tree.ptr_TND_SubLevel_6))      {Print("Pack_tree.ptr_TND_SubLevel_6 Is existed", __FUNCSIG__);}
                    //if(CheckPointer(Pack_tree.ptr_TND_SubLevel_7))      {Print("Pack_tree.ptr_TND_SubLevel_7 Is existed", __FUNCSIG__);}
                    //if(CheckPointer(Pack_tree.ptr_TND_SubLevel_8))      {Print("Pack_tree.ptr_TND_SubLevel_8 Is existed", __FUNCSIG__);}
                    //if(CheckPointer(Pack_tree.ptr_TND_SubLevel_9))      {Print("Pack_tree.ptr_TND_SubLevel_9 Is existed", __FUNCSIG__);}
                    //if(CheckPointer(Pack_tree.ptr_TND_SubLevel_10))    {Print("Pack_tree.ptr_TND_SubLevel_10 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_11))    {Print("Pack_tree.ptr_TND_SubLevel_11 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_12))    {Print("Pack_tree.ptr_TND_SubLevel_12 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_13))    {Print("Pack_tree.ptr_TND_SubLevel_13 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_14))    {Print("Pack_tree.ptr_TND_SubLevel_14 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_15))    {Print("Pack_tree.ptr_TND_SubLevel_15 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_16))    {Print("Pack_tree.ptr_TND_SubLevel_16 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_17))    {Print("Pack_tree.ptr_TND_SubLevel_17 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_18))    {Print("Pack_tree.ptr_TND_SubLevel_18 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_19))    {Print("Pack_tree.ptr_TND_SubLevel_19 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_20))    {Print("Pack_tree.ptr_TND_SubLevel_20 Is existed", __FUNCSIG__);}
                    //if(CheckPointer(ptr_Node_Keep_last_FromRootToSave_Runtime)) {Print("ptr_Node_Keep_last_FromRootToSave_Runtime Is existed");}
                    //
          }
          //Print("_________END_______", __FUNCTION__, "___________________"); //
          //=============================================================
          //       /\           //  /\  \\             /\
          //      //\\         //  //\\  \\           //\\     
          //     //  \\       //  //  \\  \\         //  \\
          //    //    \\     //  //    \\  \\       //    \\
          //   ||      ||   ||  ||      ||  ||     ||      ||
          //    \\    //     \\  \\    //  //       \\    //
          //     \\  //       \\  \\  //  //         \\  //
          //      \\//         \\  \\//  //           \\//
          //       \/           \\  \/  //             \/
          //=============================================================
          return true;//
          /*END*/
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_TD2::Biuld_Curr_Root(uchar XLevel)
{         //Sleep(15000);
          {         //-------------------------------------------
                    /*Cheak out any other pointer live at build*/
                    //-------------------------------------------
                    //if(CheckPointer(ptr_root))                          {Print("ptr_root Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_Root))            {Print("Pack_tree.ptr_TND_Root Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_1))      {Print("Pack_tree.ptr_TND_SubLevel_1 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_2))      {Print("Pack_tree.ptr_TND_SubLevel_2 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_3))      {Print("Pack_tree.ptr_TND_SubLevel_3 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_4))      {Print("Pack_tree.ptr_TND_SubLevel_4 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_5))      {Print("Pack_tree.ptr_TND_SubLevel_5 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_6))      {Print("Pack_tree.ptr_TND_SubLevel_6 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_7))      {Print("Pack_tree.ptr_TND_SubLevel_7 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_8))      {Print("Pack_tree.ptr_TND_SubLevel_8 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_9))      {Print("Pack_tree.ptr_TND_SubLevel_9 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_10))    {Print("Pack_tree.ptr_TND_SubLevel_10 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_11))    {Print("Pack_tree.ptr_TND_SubLevel_11 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_12))    {Print("Pack_tree.ptr_TND_SubLevel_12 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_13))    {Print("Pack_tree.ptr_TND_SubLevel_13 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_14))    {Print("Pack_tree.ptr_TND_SubLevel_14 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_15))    {Print("Pack_tree.ptr_TND_SubLevel_15 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_16))    {Print("Pack_tree.ptr_TND_SubLevel_16 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_17))    {Print("Pack_tree.ptr_TND_SubLevel_17 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_18))    {Print("Pack_tree.ptr_TND_SubLevel_18 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_19))    {Print("Pack_tree.ptr_TND_SubLevel_19 Is existed", __FUNCSIG__);}
                    if(CheckPointer(Pack_tree.ptr_TND_SubLevel_20))    {Print("Pack_tree.ptr_TND_SubLevel_20 Is existed", __FUNCSIG__);}//NOT EXIST EVERY CALL SAWED
          }
          //{         //----------------------------------------------------------------------------------
          //          /*Define Pointers by pack 1 Decition varible*/ //  init and setting not efected   11 newnode come
          //          //-----------------------------------------------------------------------------------CAN DELETE By POSTORDER
          //          //Alert("D TND.Tot1(" + (string)C_TND::TOTAL_One); ///>>>(there is 2 that is runner and ptr_oot)
          //          {         Pack_tree.ptr_TND_Root                    = newNode_X("InCh",    ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0);
          //                    //Pack_tree.ptr_TND_Root.ptr_Branch_4       = newNode_X("ChB",     ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle         );/*Erooroing*/
          //                    //Pack_tree.ptr_TND_Root.ptr_Branch_5       = newNode_X("ChB",     ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle         );/*Erooroing*/
          //                    Pack_tree.ptr_TND_SubLevel_1              = newNode_X("ChB",     ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle         );
          //                    //Pack_tree.ptr_TND_SubLevel_1.ptr_Branch_4 = newNode_X("ChB",     ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle         );/*Erooroing*/
          //                    //Pack_tree.ptr_TND_SubLevel_1.ptr_Branch_5 = newNode_X("ChB",     ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle         );/*Erooroing*/
          //                    Pack_tree.ptr_TND_SubLevel_2              = newNode_X("PNTH",    ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth                  );
          //                    Pack_tree.ptr_TND_SubLevel_3              = newNode_X("TE20B",   ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_Bulish                                                           );
          //                    Pack_tree.ptr_TND_SubLevel_4              = newNode_X("WPRs",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Grater_m20                                 );
          //                    Pack_tree.ptr_TND_SubLevel_5              = newNode_X("WPRf",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20                                 );
          //                    Pack_tree.ptr_TND_SubLevel_6              = newNode_X("5EMA",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_5_Above_3_Bearish         );
          //                    Pack_tree.ptr_TND_SubLevel_7              = newNode_X("MACDs",   ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.DATAS[0].Is_Signal_Grater_Main__Selling                );
          //                    Pack_tree.ptr_TND_SubLevel_8              = newNode_X("TE20M",   ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M                                                      );
          //                    Pack_tree.ptr_TND_SubLevel_9              = newNode_X("TE500M",  (ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_[0] > ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_M[0])                );
          //                    Pack_tree.ptr_TND_SubLevel_10             = newNode_X("WPRm",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 );
          //                    //Pack_tree.ptr_TND_SubLevel_10.ptr_Branch_1 = newNode_X("WPRm",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 );
          //                    //Pack_tree.ptr_TND_SubLevel_10.ptr_Branch_2 = newNode_X("WPRm",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 );//
          //          }
          //          {         /*there  is no inc its controled by delet at end main progress */
          //                    Pack_tree.ptr_TND_SubLevel_11               = newNode_X("RSIut",                  ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend );
          //                    Pack_tree.ptr_TND_SubLevel_12               = newNode_X("Force14ut200",           ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Force.Is_Force_14_above_200_1_bulish );
          //                    Pack_tree.ptr_TND_SubLevel_13               = newNode_X("MFI4ut200",              ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MFI.Is_MFI_14_Above_200_1 );
          //                    Pack_tree.ptr_TND_SubLevel_14               = newNode_X("SARup1",                 ct_Drive.TDD.ct_Conductor.DC_data.Indicators._SAR.Is_SAR_ABOVE_CLOSE_1 );
          //                    Pack_tree.ptr_TND_SubLevel_15               = newNode_X("Stochasticuw",           ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic.IS_StochasticUpWard );
          //                    Pack_tree.ptr_TND_SubLevel_16               = newNode_X("Stochastic200MUpS",      ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic.IS_Bulish_200MUpS );
          //                    Pack_tree.ptr_TND_SubLevel_17               = newNode_X("TREND_BW",               ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Trend.IsTREND_BackWarding );
          //                    //Pack_tree.ptr_TND_SubLevel_18             = newNode_X("WPRm",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 );
          //                    //Pack_tree.ptr_TND_SubLevel_19             = newNode_X("WPRm",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 );
          //                    //Pack_tree.ptr_TND_SubLevel_20             = newNode_X("WPRm",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 ); //
          //          } //
          //          //Alert("D TND.Tot1 2 + 11 (" + (string)C_TND::TOTAL_One); ///>>>(there is 2 that is runner and ptr_oot +11) (that 11 nevere deleting)
          //}
          {         //----------------------------------------------------------------------------------
                    /*Define Pointers by pack 1 Decition varible*/ //  init and setting not efected   11 newnode come
                    //-----------------------------------------------------------------------------------CAN DELETE By POSTORDER
                    //Alert("D TND.Tot1(" + (string)C_TND::TOTAL_One); ///>>>(there is 2 that is runner and ptr_oot)
                    {         Pack_tree.ptr_TND_Root                    = newNode_X("InCh",    0);
                              //Pack_tree.ptr_TND_Root.ptr_Branch_4       = newNode_X("ChB",     ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle         );/*Erooroing*/
                              //Pack_tree.ptr_TND_Root.ptr_Branch_5       = newNode_X("ChB",     ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle         );/*Erooroing*/
                              Pack_tree.ptr_TND_SubLevel_1              = newNode_X("ChB",     0);
                              //Pack_tree.ptr_TND_SubLevel_1.ptr_Branch_4 = newNode_X("ChB",     ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle         );/*Erooroing*/
                              //Pack_tree.ptr_TND_SubLevel_1.ptr_Branch_5 = newNode_X("ChB",     ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle         );/*Erooroing*/
                              Pack_tree.ptr_TND_SubLevel_2              = newNode_X("PNTH",    0);
                              Pack_tree.ptr_TND_SubLevel_3              = newNode_X("TE20B",   0);
                              Pack_tree.ptr_TND_SubLevel_4              = newNode_X("WPRs",    0);
                              Pack_tree.ptr_TND_SubLevel_5              = newNode_X("WPRf",    0);
                              Pack_tree.ptr_TND_SubLevel_6              = newNode_X("5EMA",    0);
                              Pack_tree.ptr_TND_SubLevel_7              = newNode_X("MACDs",   0);
                              Pack_tree.ptr_TND_SubLevel_8              = newNode_X("TE20M",   0);
                              Pack_tree.ptr_TND_SubLevel_9              = newNode_X("TE500M",  0);
                              Pack_tree.ptr_TND_SubLevel_10             = newNode_X("WPRm",    0);
                              //Pack_tree.ptr_TND_SubLevel_10.ptr_Branch_1 = newNode_X("WPRm",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 );
                              //Pack_tree.ptr_TND_SubLevel_10.ptr_Branch_2 = newNode_X("WPRm",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 );//
                    }
                    {         /*there  is no inc its controled by delet at end main progress */
                              Pack_tree.ptr_TND_SubLevel_11               = newNode_X("RSIut",                  0 );
                              Pack_tree.ptr_TND_SubLevel_12               = newNode_X("Force14ut200",           0 );
                              Pack_tree.ptr_TND_SubLevel_13               = newNode_X("MFI4ut200",              0 );
                              Pack_tree.ptr_TND_SubLevel_14               = newNode_X("SARup1",                 0 );
                              Pack_tree.ptr_TND_SubLevel_15               = newNode_X("Stochasticuw",           0 );
                              Pack_tree.ptr_TND_SubLevel_16               = newNode_X("Stochastic200MUpS",      0 );
                              Pack_tree.ptr_TND_SubLevel_17               = newNode_X("TREND_BW",               0 );
                              //Pack_tree.ptr_TND_SubLevel_18             = newNode_X("WPRm",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 );
                              //Pack_tree.ptr_TND_SubLevel_19             = newNode_X("WPRm",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 );
                              //Pack_tree.ptr_TND_SubLevel_20             = newNode_X("WPRm",    ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14 ); //
                    } //
                    //Alert("D TND.Tot1 2 + 11 (" + (string)C_TND::TOTAL_One); ///>>>(there is 2 that is runner and ptr_oot +11) (that 11 nevere deleting)
          }
          ulong sum = 0; Pack_tree.ptr_TND_Root.Traverse_PostOrder_Numbering(sum);
          //{         //------------------------------------------------------
          //          /* setting Pramid of decition by branches down to up  */
          //          //------------------------------------------------------
          //          //Print("_________setting Pramid_______", __FUNCTION__, "___________________"); //
          //          //----------------------------------------------------------
          //          /* setting Leaf Pramid of decition by branches down to up */
          //          //----------------------------------------------------------
          //          //****************************************************************************************************************
          //          /* highly Laging highly memory out higly file 300MB   Tree Decition Limited  Lifting RunTime 2023 0 4 09 15:32  */
          //          //****************************************************************************************************************
          //          Pack_tree.ptr_TND_SubLevel_17.obj_Self_Pocket.Branchs_bool[0] = (ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Trend.IsTREND_BackWarding) == true;
          //          Pack_tree.ptr_TND_SubLevel_17.obj_Self_Pocket.Branchs_bool[1] = (ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Trend.IsTREND_BackWarding) == false;
          //          Pack_tree.ptr_TND_SubLevel_17.obj_Self_Pocket.name = "TREND_BW";
          //          Pack_tree.ptr_TND_SubLevel_17.obj_Self_Pocket.TNSD_File.IsLeaf = false;
          //          Pack_tree.ptr_TND_SubLevel_17.data = 17;
          //          Pack_tree.ptr_TND_SubLevel_17.IsLeaf = false;
          //          //
          //          Pack_tree.ptr_TND_SubLevel_16.obj_Self_Pocket.Branchs_bool[0] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic.IS_Bulish_200MUpS) == true;
          //          Pack_tree.ptr_TND_SubLevel_16.obj_Self_Pocket.Branchs_bool[1] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic.IS_Bulish_200MUpS) == false;
          //          Pack_tree.ptr_TND_SubLevel_16.obj_Self_Pocket.name = "Stochastic200MUpS";
          //          Pack_tree.ptr_TND_SubLevel_16.obj_Self_Pocket.TNSD_File.IsLeaf = false;
          //          Pack_tree.ptr_TND_SubLevel_16.data = 16;
          //          Pack_tree.ptr_TND_SubLevel_16.IsLeaf = false;
          //          //
          //          Pack_tree.ptr_TND_SubLevel_15.obj_Self_Pocket.Branchs_bool[0] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic.IS_StochasticUpWard) == true;
          //          Pack_tree.ptr_TND_SubLevel_15.obj_Self_Pocket.Branchs_bool[1] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic.IS_StochasticUpWard) == false;
          //          Pack_tree.ptr_TND_SubLevel_15.obj_Self_Pocket.name = "Stochasticuw";
          //          Pack_tree.ptr_TND_SubLevel_15.obj_Self_Pocket.TNSD_File.IsLeaf = false;
          //          Pack_tree.ptr_TND_SubLevel_15.data = 15;
          //          Pack_tree.ptr_TND_SubLevel_15.IsLeaf = false;
          //          //
          //          Pack_tree.ptr_TND_SubLevel_14.obj_Self_Pocket.Branchs_bool[0] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._SAR.Is_SAR_ABOVE_CLOSE_1) == true;
          //          Pack_tree.ptr_TND_SubLevel_14.obj_Self_Pocket.Branchs_bool[1] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._SAR.Is_SAR_ABOVE_CLOSE_1) == false;
          //          Pack_tree.ptr_TND_SubLevel_14.obj_Self_Pocket.name = "SARup1";
          //          Pack_tree.ptr_TND_SubLevel_14.obj_Self_Pocket.TNSD_File.IsLeaf = false;
          //          Pack_tree.ptr_TND_SubLevel_14.data = 14;
          //          Pack_tree.ptr_TND_SubLevel_14.IsLeaf = false;
          //          //
          //          Pack_tree.ptr_TND_SubLevel_13.obj_Self_Pocket.Branchs_bool[0] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MFI.Is_MFI_14_Above_200_1) == true;
          //          Pack_tree.ptr_TND_SubLevel_13.obj_Self_Pocket.Branchs_bool[1] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MFI.Is_MFI_14_Above_200_1) == false;
          //          Pack_tree.ptr_TND_SubLevel_13.obj_Self_Pocket.name = "MFI4ut200";
          //          Pack_tree.ptr_TND_SubLevel_13.obj_Self_Pocket.TNSD_File.IsLeaf = false;
          //          Pack_tree.ptr_TND_SubLevel_13.data = 13;
          //          Pack_tree.ptr_TND_SubLevel_13.IsLeaf = false;
          //          //
          //          Pack_tree.ptr_TND_SubLevel_12.obj_Self_Pocket.Branchs_bool[0] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Force.Is_Force_14_above_200_1_bulish) == true;
          //          Pack_tree.ptr_TND_SubLevel_12.obj_Self_Pocket.Branchs_bool[1] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Force.Is_Force_14_above_200_1_bulish) == false;
          //          Pack_tree.ptr_TND_SubLevel_12.obj_Self_Pocket.name = "Force14ut200";
          //          Pack_tree.ptr_TND_SubLevel_12.obj_Self_Pocket.TNSD_File.IsLeaf = false;
          //          Pack_tree.ptr_TND_SubLevel_12.data = 12;
          //          Pack_tree.ptr_TND_SubLevel_12.IsLeaf = false;
          //          //
          //          Pack_tree.ptr_TND_SubLevel_11.obj_Self_Pocket.Branchs_bool[0] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend) == true;
          //          Pack_tree.ptr_TND_SubLevel_11.obj_Self_Pocket.Branchs_bool[1] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend) == false;
          //          Pack_tree.ptr_TND_SubLevel_11.obj_Self_Pocket.name = "RSIut";
          //          Pack_tree.ptr_TND_SubLevel_11.obj_Self_Pocket.TNSD_File.IsLeaf = false;
          //          Pack_tree.ptr_TND_SubLevel_11.data = 11;
          //          Pack_tree.ptr_TND_SubLevel_11.IsLeaf = false;
          //          //
          //          Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket.Branchs_bool[0] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14) == true;
          //          Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket.Branchs_bool[1] = (ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14) == false;
          //          Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket.name = "WPRm";
          //          Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket.TNSD_File.IsLeaf = false;
          //          Pack_tree.ptr_TND_SubLevel_10.data = 10;
          //          Pack_tree.ptr_TND_SubLevel_10.IsLeaf = false;
          //          /*-------------------------------------------------------*/
          //          // RootTree Loaded Need Assagin every Node by file memory
          //          /*-------------------------------------------------------*/
          //          //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.obj_Self_Pocket;
          //          //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.obj_Self_Pocket;
          //          //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.obj_Self_Pocket;
          //          //
          //          Pack_tree.ptr_TND_SubLevel_9.obj_Self_Pocket.Branchs_bool[0] = (ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_[0] > ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_M[0]) == true;
          //          Pack_tree.ptr_TND_SubLevel_9.obj_Self_Pocket.Branchs_bool[1] = (ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_[0] > ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_M[0]) == false;
          //          Pack_tree.ptr_TND_SubLevel_9.obj_Self_Pocket.name = "TE500M";
          //          Pack_tree.ptr_TND_SubLevel_9.data = 9;
          //          //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_9.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
          //          //
          //          if(Global_TREE_TEST_IS_RANDOM)
          //          {         int m_randA = MathRand() % 3; //Print("m_rand: ",m_rand);
          //                    if(m_randA == 1)        {ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M = true; ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M = false;} //
          //                    else if(m_randA == 2)   {ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M = true; ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M = false;}//
          //                    else if(m_randA == 3)   {ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M = false; ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M = false; } //
          //          }
          //          Pack_tree.ptr_TND_SubLevel_8.obj_Self_Pocket.Branchs_bool[0] = ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M == true;
          //          Pack_tree.ptr_TND_SubLevel_8.obj_Self_Pocket.Branchs_bool[1] = ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M == true;
          //          Pack_tree.ptr_TND_SubLevel_8.obj_Self_Pocket.Branchs_bool[2] = !ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M || !ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M == true;
          //          Pack_tree.ptr_TND_SubLevel_8.obj_Self_Pocket.name = "TE20M";
          //          Pack_tree.ptr_TND_SubLevel_8.data = 8;
          //          //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_8.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
          //          //
          //          Pack_tree.ptr_TND_SubLevel_7.obj_Self_Pocket.Branchs_bool[0] = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.DATAS[0].Is_Signal_Grater_Main__Selling == true;
          //          Pack_tree.ptr_TND_SubLevel_7.obj_Self_Pocket.Branchs_bool[1] = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.DATAS[0].Is_Signal_Grater_Main__Selling == false;
          //          Pack_tree.ptr_TND_SubLevel_7.obj_Self_Pocket.name = "MACDs";
          //          Pack_tree.ptr_TND_SubLevel_7.data = 7;
          //          //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_7.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
          //          //
          //          Pack_tree.ptr_TND_SubLevel_6.obj_Self_Pocket.Branchs_bool[0] = ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_5_Above_3_Bearish == true;
          //          Pack_tree.ptr_TND_SubLevel_6.obj_Self_Pocket.Branchs_bool[1] = ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_5_Above_3_Bearish == false;
          //          Pack_tree.ptr_TND_SubLevel_6.obj_Self_Pocket.name = "5EMA";
          //          Pack_tree.ptr_TND_SubLevel_6.data = 6;
          //          //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_6.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
          //          //
          //          if(Global_TREE_TEST_IS_RANDOM)
          //          {         int m_randA = MathRand() % 3; //Print("m_rand: ",m_rand);
          //                    if(m_randA == 1)        {ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 = true; ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80 = false; } //
          //                    else if(m_randA == 2)   {ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80 = true; ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 = false;}//
          //                    else if(m_randA == 3)   {ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80 = false; ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 = false; } //
          //          }
          //          Pack_tree.ptr_TND_SubLevel_5.obj_Self_Pocket.Branchs_bool[0] = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 == true;
          //          Pack_tree.ptr_TND_SubLevel_5.obj_Self_Pocket.Branchs_bool[1] = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80 == true;
          //          Pack_tree.ptr_TND_SubLevel_5.obj_Self_Pocket.Branchs_bool[2] = !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80 || !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 == true;
          //          Pack_tree.ptr_TND_SubLevel_5.obj_Self_Pocket.name = "WPRf";
          //          Pack_tree.ptr_TND_SubLevel_5.data = 5;
          //          //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_5.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
          //          //
          //          Pack_tree.ptr_TND_SubLevel_4.obj_Self_Pocket.Branchs_bool[0] = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Grater_m20 == true;
          //          Pack_tree.ptr_TND_SubLevel_4.obj_Self_Pocket.Branchs_bool[1] = ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Lower_m80 == true;
          //          Pack_tree.ptr_TND_SubLevel_4.obj_Self_Pocket.Branchs_bool[2] = !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Lower_m80 || !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Grater_m20 == true;
          //          Pack_tree.ptr_TND_SubLevel_4.obj_Self_Pocket.name = "WPRs";
          //          Pack_tree.ptr_TND_SubLevel_4.data = 4;
          //          //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_4.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
          //          //
          //          Pack_tree.ptr_TND_SubLevel_3.obj_Self_Pocket.Branchs_bool[0] = ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_Bulish == true;
          //          Pack_tree.ptr_TND_SubLevel_3.obj_Self_Pocket.Branchs_bool[1] = ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_Bulish == false;
          //          Pack_tree.ptr_TND_SubLevel_3.obj_Self_Pocket.name = "TE20B";
          //          Pack_tree.ptr_TND_SubLevel_3.data = 3;
          //          //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_3.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
          //          //
          //          /*WORKED*/// % 9
          //          if(Global_TREE_TEST_IS_RANDOM)          // MathSrand(TimeLocal()% 19);
          //          {         int m_rand = MathRand() % 9; //Print("m_rand: ",m_rand);
          //                    if(m_rand == 1)        {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 1; } //
          //                    else if(m_rand == 2)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 2; }//
          //                    else if(m_rand == 3)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 3; }//
          //                    else if(m_rand == 4)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 4; }//
          //                    else if(m_rand == 5)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 5; }//
          //                    else if(m_rand == 6)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 6; }//
          //                    else if(m_rand == 7)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 7; }//
          //                    else if(m_rand == 8)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 8; }//
          //                    else if(m_rand == 9)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 9; }//
          //          }
          //          //------------------
          //          Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.Branchs_bool[0] = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Upper_Upper;
          //          Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.Branchs_bool[1] = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Upper_Middle;
          //          Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.Branchs_bool[2] = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Upper_Lower;
          //          Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.Branchs_bool[3] = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Middle_Upper;
          //          Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.Branchs_bool[4] = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Middle_Middle;
          //          Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.Branchs_bool[5] = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Middle_Lower;
          //          Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.Branchs_bool[6] = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Lower_Upper;
          //          Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.Branchs_bool[7] = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Lower_Middle;
          //          Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.Branchs_bool[8] = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Lower_Lower;
          //          Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.Branchs_bool[9] = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Void;
          //          Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.name = "PNTH";
          //          Pack_tree.ptr_TND_SubLevel_2.data = 2;
          //          //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
          //          //
          //          //Pack_tree.ptr_TND_SubLevel_1.obj_Self_Pocket = ptr_root.ptr_Branch_1.obj_Self_Pocket;
          //          Pack_tree.ptr_TND_SubLevel_1.obj_Self_Pocket.Branchs_bool[0]     = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle == true;
          //          Pack_tree.ptr_TND_SubLevel_1.obj_Self_Pocket.Branchs_bool[1]     = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle == false;
          //          Pack_tree.ptr_TND_SubLevel_1.obj_Self_Pocket.name                = "ChB";
          //          Pack_tree.ptr_TND_SubLevel_1.data                         = 1;
          //          //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_1.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.obj_Self_Pocket;
          //          //
          //          //Pack_tree.ptr_TND_Root.obj_Self_Pocket = ptr_root.obj_Self_Pocket;
          //          if(Global_TREE_TEST_IS_RANDOM)
          //          {         int m_randA = MathRand() % 3; //Print("m_rand: ",m_rand);
          //                    if(m_randA == 1)        {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0 = E_True; } //
          //                    else if(m_randA == 2)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0 = E_False;}//
          //                    else if(m_randA == 3)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0 = E_Void; } //
          //          }
          //          Pack_tree.ptr_TND_Root.obj_Self_Pocket.Branchs_bool[0]   = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0 == E_True;
          //          Pack_tree.ptr_TND_Root.obj_Self_Pocket.Branchs_bool[1]   = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0 == E_False;
          //          Pack_tree.ptr_TND_Root.obj_Self_Pocket.Branchs_bool[2]   = ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0 == E_Void;//
          //          Pack_tree.ptr_TND_Root.obj_Self_Pocket.name              = "InCh"; //
          //          Pack_tree.ptr_TND_Root.data                       = 0; //
          //          //if(IsUpdate)Pack_tree.ptr_TND_Root.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.obj_Self_Pocket;
          //}
          {
                    {         //------------------------------------------------------
                              /* setting Pramid of decition by branches down to up  */
                              //------------------------------------------------------
                              //Print("_________setting Pramid_______", __FUNCTION__, "___________________"); //
                              //----------------------------------------------------------
                              /* setting Leaf Pramid of decition by branches down to up */
                              //----------------------------------------------------------
                              ENUM_TIMEFRAMES tf = PERIOD_M1;
                              //****************************************************************************************************************
                              /* highly Laging highly memory out higly file 300MB   Tree Decition Limited  Lifting RunTime 2023 0 4 09 15:32  */
                              //****************************************************************************************************************
                              Pack_tree.ptr_TND_SubLevel_17.obj_Self_Pocket.Branchs_bool[0] = _MFI.IsMFI_BulishPS(tf, 8, 0, 1) == true;
                              Pack_tree.ptr_TND_SubLevel_17.obj_Self_Pocket.Branchs_bool[1] = _MFI.IsMFI_BulishPS(tf, 8, 0, 1) == false;
                              Pack_tree.ptr_TND_SubLevel_17.obj_Self_Pocket.name = "_MFIH4";
                              Pack_tree.ptr_TND_SubLevel_17.obj_Self_Pocket.TNSD_File.IsLeaf = false;
                              Pack_tree.ptr_TND_SubLevel_17.data = 17;
                              Pack_tree.ptr_TND_SubLevel_17.IsLeaf = false;
                              //
                              Pack_tree.ptr_TND_SubLevel_16.obj_Self_Pocket.Branchs_bool[0] = _MFI.IsMFI_BulishPS(tf, 8, 0, 1) == true;
                              Pack_tree.ptr_TND_SubLevel_16.obj_Self_Pocket.Branchs_bool[1] = _MFI.IsMFI_BulishPS(tf, 8, 0, 1) == false;
                              Pack_tree.ptr_TND_SubLevel_16.obj_Self_Pocket.name = "_MFIH1";
                              Pack_tree.ptr_TND_SubLevel_16.obj_Self_Pocket.TNSD_File.IsLeaf = false;
                              Pack_tree.ptr_TND_SubLevel_16.data = 16;
                              Pack_tree.ptr_TND_SubLevel_16.IsLeaf = false;
                              //
                              Pack_tree.ptr_TND_SubLevel_15.obj_Self_Pocket.Branchs_bool[0] = _MFI.IsMFI_BulishPS(tf, 8, 0, 1) == true;
                              Pack_tree.ptr_TND_SubLevel_15.obj_Self_Pocket.Branchs_bool[1] = _MFI.IsMFI_BulishPS(tf, 8, 0, 1) == false;
                              Pack_tree.ptr_TND_SubLevel_15.obj_Self_Pocket.name = "_MFIm30";
                              Pack_tree.ptr_TND_SubLevel_15.obj_Self_Pocket.TNSD_File.IsLeaf = false;
                              Pack_tree.ptr_TND_SubLevel_15.data = 15;
                              Pack_tree.ptr_TND_SubLevel_15.IsLeaf = false;
                              //
                              Pack_tree.ptr_TND_SubLevel_14.obj_Self_Pocket.Branchs_bool[0] = _MFI.IsMFI_BulishPS(tf, 8, 0, 1) == true;
                              Pack_tree.ptr_TND_SubLevel_14.obj_Self_Pocket.Branchs_bool[1] = _MFI.IsMFI_BulishPS(tf, 8, 0, 1) == false;
                              Pack_tree.ptr_TND_SubLevel_14.obj_Self_Pocket.name = "_MFIm15";
                              Pack_tree.ptr_TND_SubLevel_14.obj_Self_Pocket.TNSD_File.IsLeaf = false;
                              Pack_tree.ptr_TND_SubLevel_14.data = 14;
                              Pack_tree.ptr_TND_SubLevel_14.IsLeaf = false;
                              //
                              Pack_tree.ptr_TND_SubLevel_13.obj_Self_Pocket.Branchs_bool[0] = _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,tf, 200, MODE_EMA, 0, tf, 500, MODE_EMA, 0) == true;
                              Pack_tree.ptr_TND_SubLevel_13.obj_Self_Pocket.Branchs_bool[1] = _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,tf, 200, MODE_EMA, 0, tf, 500, MODE_EMA, 0) == false;
                              Pack_tree.ptr_TND_SubLevel_13.obj_Self_Pocket.name = "MA200_500m1";
                              Pack_tree.ptr_TND_SubLevel_13.obj_Self_Pocket.TNSD_File.IsLeaf = false;
                              Pack_tree.ptr_TND_SubLevel_13.data = 13;
                              Pack_tree.ptr_TND_SubLevel_13.IsLeaf = false;
                              //
                              Pack_tree.ptr_TND_SubLevel_12.obj_Self_Pocket.Branchs_bool[0] = _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,tf, 15, MODE_EMA, 0, tf, 30, MODE_EMA, 0) == true;
                              Pack_tree.ptr_TND_SubLevel_12.obj_Self_Pocket.Branchs_bool[1] = _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,tf, 15, MODE_EMA, 0, tf, 30, MODE_EMA, 0) == false;
                              Pack_tree.ptr_TND_SubLevel_12.obj_Self_Pocket.name = "MA15_30m1";
                              Pack_tree.ptr_TND_SubLevel_12.obj_Self_Pocket.TNSD_File.IsLeaf = false;
                              Pack_tree.ptr_TND_SubLevel_12.data = 12;
                              Pack_tree.ptr_TND_SubLevel_12.IsLeaf = false;
                              //
                              Pack_tree.ptr_TND_SubLevel_11.obj_Self_Pocket.Branchs_bool[0] = _Force.IsForce_Bulish(tf, 14, 28, 0, 0) == true;
                              Pack_tree.ptr_TND_SubLevel_11.obj_Self_Pocket.Branchs_bool[1] = _Force.IsForce_Bulish(tf, 14, 28, 0, 0) == false;
                              Pack_tree.ptr_TND_SubLevel_11.obj_Self_Pocket.name = "_Force";
                              Pack_tree.ptr_TND_SubLevel_11.obj_Self_Pocket.TNSD_File.IsLeaf = false;
                              Pack_tree.ptr_TND_SubLevel_11.data = 11;
                              Pack_tree.ptr_TND_SubLevel_11.IsLeaf = false;
                              //
                              Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket.Branchs_bool[0] = _WPR.Is_WPR_BulishPeriods(tf, 14, 200, 0) == true;
                              Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket.Branchs_bool[1] = _WPR.Is_WPR_BulishPeriods(tf, 14, 200, 0) == false;
                              Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket.name = "WPR14_200";
                              Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket.TNSD_File.IsLeaf = false;
                              Pack_tree.ptr_TND_SubLevel_10.data = 10;
                              Pack_tree.ptr_TND_SubLevel_10.IsLeaf = false;
                              /*-------------------------------------------------------*/
                              // RootTree Loaded Need Assagin every Node by file memory
                              /*-------------------------------------------------------*/
                              //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.obj_Self_Pocket;
                              //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.obj_Self_Pocket;
                              //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_10.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.obj_Self_Pocket;
                              //
                              Pack_tree.ptr_TND_SubLevel_9.obj_Self_Pocket.Branchs_bool[0] = _MovingAvrages.IsMA_BulishMAPrice(tf, 7, MODE_EMA, 0,Ask) == true;
                              Pack_tree.ptr_TND_SubLevel_9.obj_Self_Pocket.Branchs_bool[1] = _MovingAvrages.IsMA_BulishMAPrice(tf, 7, MODE_EMA, 0,Ask) == false;
                              Pack_tree.ptr_TND_SubLevel_9.obj_Self_Pocket.name = "_MovingAvragesB7";
                              Pack_tree.ptr_TND_SubLevel_9.data = 9;
                              //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_9.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
                              Pack_tree.ptr_TND_SubLevel_8.obj_Self_Pocket.Branchs_bool[0] = _SAR.Sar_Direction(tf, 0.01, 0.2, 0) == +1;
                              Pack_tree.ptr_TND_SubLevel_8.obj_Self_Pocket.Branchs_bool[1] = _SAR.Sar_Direction(tf, 0.01, 0.2, 0) == -1;
                              Pack_tree.ptr_TND_SubLevel_8.obj_Self_Pocket.name = "_SAR";
                              Pack_tree.ptr_TND_SubLevel_8.data = 8;
                              //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_8.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
                              //
                              Pack_tree.ptr_TND_SubLevel_7.obj_Self_Pocket.Branchs_bool[0] = _MovingAvrages.IsMA_Expaning1_Nearing0(tf, 14, MODE_EMA, 0, tf, 20, MODE_EMA, 0) == true;
                              Pack_tree.ptr_TND_SubLevel_7.obj_Self_Pocket.Branchs_bool[1] = _MovingAvrages.IsMA_Expaning1_Nearing0(tf, 14, MODE_EMA, 0, tf, 20, MODE_EMA, 0) == false;
                              Pack_tree.ptr_TND_SubLevel_7.obj_Self_Pocket.name = "_MovingAvragesEN";
                              Pack_tree.ptr_TND_SubLevel_7.data = 7;
                              //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_7.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
                              //
                              Pack_tree.ptr_TND_SubLevel_6.obj_Self_Pocket.Branchs_bool[0] = _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,tf, 5, MODE_EMA, 0, tf, 8, MODE_EMA, 0) == true;
                              Pack_tree.ptr_TND_SubLevel_6.obj_Self_Pocket.Branchs_bool[1] = _MovingAvrages.IsMA_bulishPeriodsFrames(_Symbol,tf, 5, MODE_EMA, 0, tf, 8, MODE_EMA, 0) == false;
                              Pack_tree.ptr_TND_SubLevel_6.obj_Self_Pocket.name = "_MovingAvragesBPF";
                              Pack_tree.ptr_TND_SubLevel_6.data = 6;
                              //
                              Pack_tree.ptr_TND_SubLevel_5.obj_Self_Pocket.Branchs_bool[0] = _MFI.IsMFI_BulishPS(tf, 8, 0, 1) == true;
                              Pack_tree.ptr_TND_SubLevel_5.obj_Self_Pocket.Branchs_bool[1] = _MFI.IsMFI_BulishPS(tf, 8, 0, 1) == false;
                              Pack_tree.ptr_TND_SubLevel_5.obj_Self_Pocket.name = "_MFI";
                              Pack_tree.ptr_TND_SubLevel_5.data = 5;
                              //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_5.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
                              //
                              Pack_tree.ptr_TND_SubLevel_4.obj_Self_Pocket.Branchs_bool[0] = _MovingAvrages.IsMA_BulishMAPrice(tf, 200, MODE_EMA, 0,Ask) == true;
                              Pack_tree.ptr_TND_SubLevel_4.obj_Self_Pocket.Branchs_bool[1] = _MovingAvrages.IsMA_BulishMAPrice(tf, 200, MODE_EMA, 0,Ask) == false;
                              Pack_tree.ptr_TND_SubLevel_4.obj_Self_Pocket.name = "_MovingAvrages";
                              Pack_tree.ptr_TND_SubLevel_4.data = 4;
                              //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_4.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
                              //
                              Pack_tree.ptr_TND_SubLevel_3.obj_Self_Pocket.Branchs_bool[0] = _OVB.IsOVB_Bulish(tf, 0, 8) == true;
                              Pack_tree.ptr_TND_SubLevel_3.obj_Self_Pocket.Branchs_bool[1] = _OVB.IsOVB_Bulish(tf, 0, 8) == false;
                              Pack_tree.ptr_TND_SubLevel_3.obj_Self_Pocket.name = "_OVBm5";
                              Pack_tree.ptr_TND_SubLevel_3.data = 3;
                              //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_3.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
                              //
                              //------------------
                              Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.Branchs_bool[0] = _Stochastic.Stoch_Bulish(_Symbol,tf, 1, 8) == true;
                              Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.Branchs_bool[1] = _Stochastic.Stoch_Bulish(_Symbol,tf, 1, 8) == false;
                              Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket.name = "_Stochastic";
                              Pack_tree.ptr_TND_SubLevel_2.data = 2;
                              //if(IsUpdate)Pack_tree.ptr_TND_SubLevel_2.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.ptr_Branch_1.ptr_Branch_1.obj_Self_Pocket;
                              //
                              //Pack_tree.ptr_TND_SubLevel_1.obj_Self_Pocket = ptr_root.ptr_Branch_1.obj_Self_Pocket;
                              Pack_tree.ptr_TND_SubLevel_1.obj_Self_Pocket.Branchs_bool[0]     = _RSI.Is_RSI_BulishPeriodsShift(_Symbol,tf, 5, 7, PRICE_CLOSE, 0, 0) == true;
                              Pack_tree.ptr_TND_SubLevel_1.obj_Self_Pocket.Branchs_bool[1]     = _RSI.Is_RSI_BulishPeriodsShift(_Symbol,tf, 5, 7, PRICE_CLOSE, 0, 0) == false;
                              Pack_tree.ptr_TND_SubLevel_1.obj_Self_Pocket.name                = "_RSI";
                              Pack_tree.ptr_TND_SubLevel_1.data                         = 1;
                              //_MACD.IsMacd_CrossBearish(tf, tf, 12, 26, 9, PRICE_CLOSE, 0) == false;
                              Pack_tree.ptr_TND_Root.obj_Self_Pocket.Branchs_bool[0]   = _MACD.IsMacd_CrossBulish(tf,0,0, 12, 26,1) == true;
                              Pack_tree.ptr_TND_Root.obj_Self_Pocket.Branchs_bool[1]   = _MACD.IsMacd_CrossBearish(tf,0,0, 12, 26,1) == true;
                              Pack_tree.ptr_TND_Root.obj_Self_Pocket.name              = "_MACD"; //
                              Pack_tree.ptr_TND_Root.data                       = 0; //
                              //if(IsUpdate)Pack_tree.ptr_TND_Root.obj_Self_Pocket = ref_ptrNodeBackup_Loaded_Root.obj_Self_Pocket;
                    }//
          }
          {         //Print("_________linking Pramid_______", __FUNCTION__, "___________________"); //
                    //----------------------------------------
                    /*linking Pramid of decition by branches*/  //!!!!!!clear data root to leaf//11 node progrssed
                    //----------------------------------------
                    //Alert("E TND.Tot1 2 + 11 (" + (string)C_TND::TOTAL_One); ///>>>(there is 2 that is runner and ptr_oot +11) (that 11 nevere deleting)
                    //****************************************************************************************************************
                    /* highly Laging highly memory out higly file 300MB   Tree Decition Limited  Lifting RunTime 2023 0 4 09 15:32>> */ ///error--same address isuuu Pack_tree.ptr_TND_SubLevel_16.ptr_Branch_1 = Pack_tree.ptr_TND_SubLevel_16.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_17);;;
                    //****************************************************************************************************************
                    //not handel over 4GB 32Bit
                    if(XLevel > 16)
                    {         Pack_tree.ptr_TND_SubLevel_16.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_17);;;
                              Pack_tree.ptr_TND_SubLevel_16.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_17);;;   Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_17); //
                    }
                    //3,140MB ram fuuly lag >>15 scound
                    if(XLevel > 15)
                    {         Pack_tree.ptr_TND_SubLevel_15.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_16);;;
                              Pack_tree.ptr_TND_SubLevel_15.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_16);;;   Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_16); //
                    }
                    //1,764MB ram fuuly lag 10secound >>
                    if(XLevel > 14)
                    {         Pack_tree.ptr_TND_SubLevel_14.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_15);;;
                              Pack_tree.ptr_TND_SubLevel_14.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_15);;;   Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_15);//
                    }
                    ////1,159MB ram fuuly lag 5secound >>  two secound lag by per 15 secound jump
                    if(XLevel > 13)
                    {         Pack_tree.ptr_TND_SubLevel_13.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_14);;;
                              Pack_tree.ptr_TND_SubLevel_13.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_14);;;   Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_14);//  //Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_10);
                    }
                    ////765MB ram fuuly lag 3secound >>(change interval rimer not effected 400ms)
                    if(XLevel > 12)
                    {         Pack_tree.ptr_TND_SubLevel_12.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_13);;;
                              Pack_tree.ptr_TND_SubLevel_12.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_13);;;   Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_13);// //Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_10);
                    }
                    ////765MB ram fuuly lag 3secound >> wooeking good !!!! CPU REAL TIME 25 >>>NORMAL 10-15  (timer Range400ms good? >> 2 second lag cpu 25-30)
                    if(XLevel > 11)
                    {         Pack_tree.ptr_TND_SubLevel_11.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_12);;;
                              Pack_tree.ptr_TND_SubLevel_11.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_12);;;   Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_12);// //Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_10);
                    }
                    ////--Wow Working-just one time run--765MB ram fuuly lag 1secound >> wooeking good !!!! CPU REAL TIME 25 >>>NORMAL 10-15 laging by cpu >> wooeking good (timer Range400ms good)
                    if(XLevel > 10)
                    {         Pack_tree.ptr_TND_SubLevel_10.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_11);;;
                              Pack_tree.ptr_TND_SubLevel_10.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_11);;;   Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_11);// //Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_10);
                    }
                    //
                    if(XLevel > 9)
                    {         Pack_tree.ptr_TND_SubLevel_9.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_10);;;
                              Pack_tree.ptr_TND_SubLevel_9.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_10);;;    Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_10);////Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_10);
                              //exmine root-1one brance-2one brance-3one brance-4one brance-5one brance-7LEVELone brance-8LEVELone brance-9LEVELone brance has two branch
                    }//
                    if(XLevel > 8)
                    {         Pack_tree.ptr_TND_SubLevel_8.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_9);;;
                              Pack_tree.ptr_TND_SubLevel_8.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_9);;;     Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_9);////Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_9);
                              //exmine root-1one brance-2one brance-3one brance-4one brance-5one brance-7LEVELone brance-8LEVELone brance has two branch
                    }//
                    if(XLevel > 7)
                    {         Pack_tree.ptr_TND_SubLevel_7.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_8);;;
                              Pack_tree.ptr_TND_SubLevel_7.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_8);;;     Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_8);////Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_8);
                              //exmine root-1one brance-2one brance-3one brance-4one brance-5one brance-7LEVELone brance has two branch
                    }//
                    if(XLevel > 6)
                    {         Pack_tree.ptr_TND_SubLevel_6.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_7);;;
                              Pack_tree.ptr_TND_SubLevel_6.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_7);;;     Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_7);////Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_7);
                              //exmine root-1one brance-2one brance-3one brance-4one brance-5one brance-6one brance has two branch
                    }//
                    if(XLevel > 5)
                    {         Pack_tree.ptr_TND_SubLevel_5.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_6);;;
                              Pack_tree.ptr_TND_SubLevel_5.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_6);;;     Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_6);////Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_6);
                              //exmine root-1one brance-2one brance-3one brance-4one brance-5one brance has there branch
                    }//
                    if(XLevel > 4)
                    {         Pack_tree.ptr_TND_SubLevel_4.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_5);;;
                              Pack_tree.ptr_TND_SubLevel_4.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_5);;;     Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_5);////Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_5);
                              //exmine root-1one brance-2one brance-3one brance-4one brance has there branch
                    }//
                    if(XLevel > 3)
                    {         Pack_tree.ptr_TND_SubLevel_3.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_4);;;
                              Pack_tree.ptr_TND_SubLevel_3.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_4);;;     Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_4);////Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_4);
                              //exmine root - 1one brance - 2one brance - 3one brance has two branch
                    }//
                    if(XLevel > 2)
                    {         Pack_tree.ptr_TND_SubLevel_2.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_3);;;
                              Pack_tree.ptr_TND_SubLevel_2.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_3);;;    Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_3);////Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_3);
                              //exmine root-1one brance-2one brance has eghit branch
                    }//
                    if(XLevel > 1)
                    {         Pack_tree.ptr_TND_SubLevel_1.ptr_Branch_1 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_2);;;
                              Pack_tree.ptr_TND_SubLevel_1.ptr_Branch_2 = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_2);;;    Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_2);////Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_2);
                              //exmine root-1one brance has two branch
                    }//
                    Pack_tree.ptr_TND_Root.ptr_Branch_1       = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_1);;;
                    Pack_tree.ptr_TND_Root.ptr_Branch_2       = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_1);;;
                    //Pack_tree.ptr_TND_Root.ptr_Branch_3       = Traverse_Copy(Pack_tree.ptr_TND_SubLevel_1);;;    Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_1);/*MOve make its min ram use*/  //()(THE ERROR IS WRITING ptr_Branch_2 WRONG )() //Pack_tree.Traverse_PostOrderReverse_Delete(Pack_tree.ptr_TND_SubLevel_1);
                    //exmine root has there branch
          }
          //Alert("F TND.Tot1 2 + 11 + Subs? (" + (string)C_TND::TOTAL_One); ///>>>(there is 2 that is runner and ptr_oot +11 ) (that 11 nevere deleting)
          //-------------------------------------------------------------------
          //Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_10);
          //Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_9);  Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_9.ptr_Branch_1);    Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_9.ptr_Branch_2);
          //Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_8);
          //Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_7);
          //Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_6);
          //Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_5);
          //Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_4);
          //Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_3);
          //Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_2);
          //Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_1.ptr_Branch_1);Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_1.ptr_Branch_2);Pack_tree.Traverse_PostOrder_Delete(Pack_tree.ptr_TND_SubLevel_1);//
          Pack_tree.Traverse__Delete_ExeptRoot();
          //Alert("G TND.Tot1 2 + 11 + Subs? (" + (string)C_TND::TOTAL_One); ///>>>(there is 2 that is runner and ptr_oot +11 ) (that 11 nevere deleting)
          //-------------------------------------------------------------------
          //
          //----------------------------------------
          /*000linking Pramid of decition by Parents  */  //caused stack over flow
          //-----------------------------------------
          //000Pack_tree.ptr_TND_SubLevel_1.ptr_Parent = Pack_tree.ptr_TND_Root;
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TD2::Traverse_LEVELOrder_NODE_Numbering(C_TND *&ptr_Node)
{         //TraverseLevelOrder(ptr_Node); //
          //Print(getNode_Leafs_Numbering(ptr_Node));//
          //getNode_Leafs_Numbering(ptr_Node);//
          //Traverse_LEVELOrder_NODE_Numbering2(ptr_Node);//
          ulong sum = 0;
          LeafSum(ptr_Node, sum);
          //
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TD2::LeafSum(C_TND *&ptr_Node, ulong & sum)//---set id by implusing every leaf
{         if(!ptr_Node)return;
          //------------------------------------------------------------------
          //if(!ptr_Node.ptr_Branch_1 && !ptr_Node.ptr_Branch_2  && !ptr_Node.ptr_Branch_3 && !ptr_Node.ptr_Branch_4 && !ptr_Node.ptr_Branch_5 && !ptr_Node.ptr_Branch_6  &&
          //                    !ptr_Node.ptr_Branch_7 && !ptr_Node.ptr_Branch_8 && !ptr_Node.ptr_Branch_9  && !ptr_Node.ptr_Branch_10 && !ptr_Node.ptr_Parent   && !ptr_Node.ptr_Backup  && !ptr_Node.ptr_BackupRootSave )
          //{         /////----when its leaf inc {ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = ptr_Node.NODE_LEAF_Number++;} maximum
          //          //ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number        =  NODE_LEAF_Number++;                  //XNum/25928                                     (A ptr parrent B Parent )
          //          //ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number        = ptr_Node.NODE_LEAF_Number++;          //25919/25928                                    (A ptr parrent B ptr) root //--mean i have X count root
          //          //obj_Self_Pocket.TNSD_File.NODE_LEAF_Number                 = ptr_Node.NODE_LEAF_Number++;          //0/25928                                        (A parrent B ptr)
          //          //obj_Self_Pocket.TNSD_File.NODE_LEAF_Number                 =  NODE_LEAF_Number++; //               //0/25928 runner number out of root node count   (A B parrent run both of them)
          //          //---by TOTAL Constructor inc 20 20
          //          ////------------------------------------------------------------------------------------------------------------------------------------
          //          //ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = ptr_Node.NODE_LEAF_Number++;          //25919/25928                                    (A ptr parrent B ptr) root //--mean i have X count root
          //          sum += ptr_Node.IDNumber_ForINC * 1;
          //          ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = sum;
          //          //
          //} //
          /*preorder*/
          if(!ptr_Node.ptr_Branch_1 && !ptr_Node.ptr_Branch_2  && !ptr_Node.ptr_Branch_3 && !ptr_Node.ptr_Branch_4 && !ptr_Node.ptr_Branch_5 && !ptr_Node.ptr_Branch_6  &&
                              !ptr_Node.ptr_Branch_7 && !ptr_Node.ptr_Branch_8 && !ptr_Node.ptr_Branch_9  && !ptr_Node.ptr_Branch_10 && !ptr_Node.ptr_Parent   && !ptr_Node.ptr_Backup  && !ptr_Node.ptr_BackupRootSave )
          {         /*preorder*/       sum += 1 * 1;
                    //ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = sum;//
          }//
          LeafSum(ptr_Node.ptr_Branch_1, sum);
          LeafSum(ptr_Node.ptr_Branch_2, sum);
          LeafSum(ptr_Node.ptr_Branch_3, sum);
          LeafSum(ptr_Node.ptr_Branch_4, sum);
          LeafSum(ptr_Node.ptr_Branch_5, sum);
          LeafSum(ptr_Node.ptr_Branch_6, sum);
          LeafSum(ptr_Node.ptr_Branch_7, sum);
          /*inorder*/
          //if(!ptr_Node.ptr_Branch_1 && !ptr_Node.ptr_Branch_2  && !ptr_Node.ptr_Branch_3 && !ptr_Node.ptr_Branch_4 && !ptr_Node.ptr_Branch_5 && !ptr_Node.ptr_Branch_6  &&
          //                    !ptr_Node.ptr_Branch_7 && !ptr_Node.ptr_Branch_8 && !ptr_Node.ptr_Branch_9  && !ptr_Node.ptr_Branch_10 && !ptr_Node.ptr_Parent   && !ptr_Node.ptr_Backup  && !ptr_Node.ptr_BackupRootSave )
          //{         /*inorder*/     sum += ptr_Node.IDNumber_ForINC * 1;
          //          ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = sum;//
          //}//
          LeafSum(ptr_Node.ptr_Branch_8, sum);
          LeafSum(ptr_Node.ptr_Branch_9, sum);
          LeafSum(ptr_Node.ptr_Branch_10, sum);
          LeafSum(ptr_Node.ptr_Parent, sum);
          LeafSum(ptr_Node.ptr_Backup, sum);
          LeafSum(ptr_Node.ptr_BackupRootLoad, sum);
          LeafSum(ptr_Node.ptr_BackupRootSave, sum); //
          /*postorder*/
          //if(!ptr_Node.ptr_Branch_1 && !ptr_Node.ptr_Branch_2  && !ptr_Node.ptr_Branch_3 && !ptr_Node.ptr_Branch_4 && !ptr_Node.ptr_Branch_5 && !ptr_Node.ptr_Branch_6  &&
          //                    !ptr_Node.ptr_Branch_7 && !ptr_Node.ptr_Branch_8 && !ptr_Node.ptr_Branch_9  && !ptr_Node.ptr_Branch_10 && !ptr_Node.ptr_Parent   && !ptr_Node.ptr_Backup  && !ptr_Node.ptr_BackupRootSave )
          //{         /*postorder*/     sum += ptr_Node.IDNumber_ForINC * 1;
          //          ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = sum;//
          //}//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_TD2::getIsLeaf(C_TND *ptrNode)
{         if(!ptrNode.ptr_Branch_1 && !ptrNode.ptr_Branch_2       && !ptrNode.ptr_Branch_3       && !ptrNode.ptr_Branch_4       && !ptrNode.ptr_Branch_5  && !ptrNode.ptr_Branch_6 &&
                              !ptrNode.ptr_Branch_7       && !ptrNode.ptr_Branch_8       && !ptrNode.ptr_Branch_9       && !ptrNode.ptr_Branch_10 && !ptrNode.ptr_Parent &&
                              !ptrNode.ptr_BackupRootLoad && !ptrNode.ptr_BackupRootSave && !ptrNode.ptr_Backup ) {return true;}
          else {return false;}
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TD2::Traverse_LEVELOrder_NODE_Numbering2(C_TND *&ptr_Node)
{         if(!ptr_Node)return;
          //------------------------------------------------------------------
          if(!ptr_Node.ptr_Branch_1 && !ptr_Node.ptr_Branch_2  && !ptr_Node.ptr_Branch_3 && !ptr_Node.ptr_Branch_4 && !ptr_Node.ptr_Branch_5 && !ptr_Node.ptr_Branch_6  &&
                              !ptr_Node.ptr_Branch_7 && !ptr_Node.ptr_Branch_8 && !ptr_Node.ptr_Branch_9  && !ptr_Node.ptr_Branch_10 && !ptr_Node.ptr_Parent   && !ptr_Node.ptr_Backup  && !ptr_Node.ptr_BackupRootSave )
          {         /////----when its leaf inc {ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = ptr_Node.NODE_LEAF_Number++;} maximum
                    //ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number        =  NODE_LEAF_Number++;                  //XNum/25928                                     (A ptr parrent B Parent )
                    //ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number        = ptr_Node.NODE_LEAF_Number++;          //25919/25928                                    (A ptr parrent B ptr) root //--mean i have X count root
                    //obj_Self_Pocket.TNSD_File.NODE_LEAF_Number                 = ptr_Node.NODE_LEAF_Number++;          //0/25928                                        (A parrent B ptr)
                    //obj_Self_Pocket.TNSD_File.NODE_LEAF_Number                 =  NODE_LEAF_Number++; //               //0/25928 runner number out of root node count   (A B parrent run both of them)
                    //---by TOTAL Constructor inc 20 20
                    ////------------------------------------------------------------------------------------------------------------------------------------
                    //ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number        = ptr_Node.NODE_LEAF_Number++;          //25919/25928                                    (A ptr parrent B ptr) root //--mean i have X count root
                    //
          } //
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_Branch_1);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_Branch_2);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_Branch_3);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_Branch_4);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_Branch_5);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_Branch_6);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_Branch_7);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_Branch_8);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_Branch_9);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_Branch_10);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_Parent);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_Backup);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_BackupRootLoad);
          Traverse_LEVELOrder_NODE_Numbering2(ptr_Node.ptr_BackupRootSave); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TD2::TraverseLevelOrder(C_TND *&ptr_node_root)
{         ulong h = CPack_tree::getTree_Height(ptr_node_root);
          for (ulong i = 1; i <= h; i++) { NumberingCurrentLevel(ptr_node_root, i);}
          //{         NumberingCurrentLevel(ptr_node_root, 1);}//--last level
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TD2::NumberingCurrentLevel(C_TND *&ptr_node_root, ulong level)  //:::printLevelOrder
{         //
          if (!ptr_node_root)  {return;}
          if (level == 1)
          {         /*operation on node*///Print(Desc); ///
                    //ptr_node_root.obj_Self_Pocket.TNSD_File.NODE_Number = NODE_Number++;
                    //if(getIsLeaf(ptr_node_root))  {         ptr_node_root.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = ptr_node_root.NODE_LEAF_Number++;}////error
                    //if(getIsLeaf(ptr_node_root))  {         ptr_node_root.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number++;}//   incresed only by file remember
                    //if(getIsLeaf(ptr_node_root))  {         ptr_node_root.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number =  NODE_LEAF_Number;}// ///constructor inc  un define number out of all node
                    //if(getIsLeaf(ptr_node_root))  {         ptr_node_root.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number =  ptr_node_root.NODE_LEAF_Number;}// ///constructor inc  un define number out of all node
          }
          else if (level > 1)
          {         NumberingCurrentLevel(ptr_node_root.ptr_Branch_1, level - 1);
                    NumberingCurrentLevel(ptr_node_root.ptr_Branch_2, level - 1); //
                    NumberingCurrentLevel(ptr_node_root.ptr_Branch_3, level - 1); //
                    NumberingCurrentLevel(ptr_node_root.ptr_Branch_4, level - 1); //
                    NumberingCurrentLevel(ptr_node_root.ptr_Branch_5, level - 1); //
                    NumberingCurrentLevel(ptr_node_root.ptr_Branch_6, level - 1); //
                    NumberingCurrentLevel(ptr_node_root.ptr_Branch_7, level - 1); //
                    NumberingCurrentLevel(ptr_node_root.ptr_Branch_8, level - 1); //
                    NumberingCurrentLevel(ptr_node_root.ptr_Branch_9, level - 1); //
                    NumberingCurrentLevel(ptr_node_root.ptr_Branch_10, level - 1); //
                    NumberingCurrentLevel(ptr_node_root.ptr_Parent, level - 1); //
                    NumberingCurrentLevel(ptr_node_root.ptr_Backup, level - 1); //
                    NumberingCurrentLevel(ptr_node_root.ptr_BackupRootSave, level - 1); //
                    NumberingCurrentLevel(ptr_node_root.ptr_BackupRootLoad, level - 1); //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong C_TD2::getNode_Leafs_Numbering(C_TND *&ptr_Node)
{         ulong Count;
          if(!ptr_Node) {  /* obj_Self_Pocket.TNSD_File.NODE_LEAF_Number =  NODE_LEAF_Number++; */ /* that run froom parrent (return zero)it its null mean are not exist */return Count = 0;}
          ///**where main root exite/
          if(!ptr_Node.ptr_Branch_1 && !ptr_Node.ptr_Branch_2  && !ptr_Node.ptr_Branch_3 && !ptr_Node.ptr_Branch_4 && !ptr_Node.ptr_Branch_5 && !ptr_Node.ptr_Branch_6  &&
                              !ptr_Node.ptr_Branch_7 && !ptr_Node.ptr_Branch_8 && !ptr_Node.ptr_Branch_9  && !ptr_Node.ptr_Branch_10 && !ptr_Node.ptr_Parent   && !ptr_Node.ptr_Backup  && !ptr_Node.ptr_BackupRootSave )
          {         //ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = ptr_Node.NODE_LEAF_Number++; ////---every node leaf node count mena frist one exite
                    //ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = NODE_LEAF_Number++; //         ////---All root leaf node count mena root one exite
                    //obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = NODE_LEAF_Number++;//---its zero that not defined
                    //obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = ptr_Node.NODE_LEAF_Number++;//---its zero that not defined
                    //
                    return Count = 1; } //WHERE DETECTED LEAF
          else
          {         Count = getNode_Leafs_Numbering(ptr_Node.ptr_Branch_1)  + getNode_Leafs_Numbering(ptr_Node.ptr_Branch_2)
                            + getNode_Leafs_Numbering(ptr_Node.ptr_Branch_3)        + getNode_Leafs_Numbering(ptr_Node.ptr_Branch_4)
                            + getNode_Leafs_Numbering(ptr_Node.ptr_Branch_5)        + getNode_Leafs_Numbering(ptr_Node.ptr_Branch_6)
                            + getNode_Leafs_Numbering(ptr_Node.ptr_Branch_7)        + getNode_Leafs_Numbering(ptr_Node.ptr_Branch_8)
                            + getNode_Leafs_Numbering(ptr_Node.ptr_Branch_9)        + getNode_Leafs_Numbering(ptr_Node.ptr_Branch_10)
                            + getNode_Leafs_Numbering(ptr_Node.ptr_Parent)          + getNode_Leafs_Numbering(ptr_Node.ptr_Backup)
                            + getNode_Leafs_Numbering(ptr_Node.ptr_BackupRootSave)  + getNode_Leafs_Numbering(ptr_Node.ptr_BackupRootLoad);
                    //obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = Count; //--every node has branch count return zero
                    //ptr_Node.obj_Self_Pocket.TNSD_File.NODE_LEAF_Number = Count; //--every root has branch count return zero
                    return Count; //
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TD2::Traverse_PostOrder_INIT_SELF_DATA_TNSD2(C_TND *&ptr_Node_New_Build, C_TND *&ptr_Node_Loaded)
{         //
          if(!CheckPointer(ptr_Node_Loaded))return;
          //---------------------------------------------------------------------------------------------------------------------
          {         //
                    if(true)          /*postorder*/
                    {         if(CheckPointer(ptr_Node_New_Build))
                              {         ptr_Node_New_Build.obj_Self_Pocket.TNSD_File     = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File;//--not have bool       Branchs_bool[];///mean not error// just info in file recovered
                                        //ptr_Node_New.obj_Self_Pocket.TNSD_File.WinBuy  = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File.WinBuy;
                                        //ptr_Node_New.obj_Self_Pocket.TNSD_File.WinBuy  = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File.WinBuy;
                                        //ptr_Node_New.obj_Self_Pocket.TNSD_File.WinBuy  = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File.WinBuy;
                                        //ptr_Node_New.obj_Self_Pocket.TNSD_File.WinBuy  = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File.WinBuy;
                                        //Print(" Builded Node Update From Loaded Node:", ptr_Node_New_Build.obj_Self_Pocket.name, "  ", __FUNCTION__); ///*Worked*/
                              }
                              if(!CheckPointer(ptr_Node_New_Build))/*loaded exist but bulded not exist*/
                              {         //00ptr_Node_New_Build  = new C_TND;
                                        //00ptr_Node_New_Build.obj_Self_Pocket.TNSD_File     = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File; //
                                        Print("New Node Added To Builded  ", __FUNCTION__);// /*Not Worked*/
                              } //
                    }//
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_Branch_1,      ptr_Node_Loaded.ptr_Branch_1);
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_Branch_2,      ptr_Node_Loaded.ptr_Branch_2);
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_Branch_3,      ptr_Node_Loaded.ptr_Branch_3);
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_Branch_4,      ptr_Node_Loaded.ptr_Branch_4);
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_Branch_5,      ptr_Node_Loaded.ptr_Branch_5);
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_Branch_6,      ptr_Node_Loaded.ptr_Branch_6);
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_Branch_7,      ptr_Node_Loaded.ptr_Branch_7);
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_Branch_8,      ptr_Node_Loaded.ptr_Branch_8);
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_Branch_9,      ptr_Node_Loaded.ptr_Branch_9);
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_Branch_10,     ptr_Node_Loaded.ptr_Branch_10);
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_Parent,        ptr_Node_Loaded.ptr_Parent);
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_Backup,        ptr_Node_Loaded.ptr_Backup);
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_BackupRootSave, ptr_Node_Loaded.ptr_BackupRootSave); //
                    Traverse_PostOrder_INIT_SELF_DATA_TNSD2(ptr_Node_New_Build.ptr_BackupRootLoad, ptr_Node_Loaded.ptr_BackupRootLoad); //
                    if(false)          /*postorder*/
                    {         if(CheckPointer(ptr_Node_New_Build))
                              {         ptr_Node_New_Build.obj_Self_Pocket.TNSD_File     = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File;//--not have bool       Branchs_bool[];///mean not error// just info in file recovered
                                        //ptr_Node_New.obj_Self_Pocket.TNSD_File.WinBuy  = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File.WinBuy;
                                        //ptr_Node_New.obj_Self_Pocket.TNSD_File.WinBuy  = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File.WinBuy;
                                        //ptr_Node_New.obj_Self_Pocket.TNSD_File.WinBuy  = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File.WinBuy;
                                        //ptr_Node_New.obj_Self_Pocket.TNSD_File.WinBuy  = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File.WinBuy;
                                        //Print(" Builded Node Update From Loaded Node:", ptr_Node_New_Build.obj_Self_Pocket.name, "  ", __FUNCTION__); ///*Worked*/
                              }
                              if(!CheckPointer(ptr_Node_New_Build))/*loaded exist but bulded not exist*/
                              {         ptr_Node_New_Build  = new C_TND;
                                        ptr_Node_New_Build.obj_Self_Pocket.TNSD_File     = ptr_Node_Loaded.obj_Self_Pocket.TNSD_File; //
                                        Print("New Node Added To Builded  ", __FUNCTION__);// /*Not Worked*/
                              } //
                    }//
          } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int C_TD2::MainProgress(bool b)
{         if(!b)   { ct_Drive.IS_TREE_SCALP_ACTIVE_Pub = false; return -1; }
          else     { ct_Drive.IS_TREE_SCALP_ACTIVE_Pub = true;             }
          //Print("__________Root init______", __FUNCTION__, "___________________"); //
          {         //--------------------
                    /* Root init        */    C_TD2::ptr_root = new C_TND; //Print(  "____RUN TREE___" );//Sleep(10); ///C_TD2  gTD2;/*no error deleted*/
                    //--------------------
                    XlevelDecition = TreeDecitionDepthLevel; //
          } //
          {         //----------------------------------
                    /* Root Load FIlE or Build PRAMID */
                    //----------------------------------
                    //Print("__________Root Load or Build______", __FUNCTION__, "___________________"); //
                    if(true && Load_Orders()/*gTD2.Load_Orders();*/)/*WORDKED*/ //NO PROBLEM AT LOAD (NEW POINTERS)
                    {         //
                              //Print( "---  aL  ----- getNode_Height : ",  (string)CPack_tree::getNode_Height(ptr_root));/*WORDKED*/
                              //Print( "---  aL  ----- AllLeafOfTree : ",   (string)CPack_tree::getNode_Leafs(ptr_root));/*WORDKED*/ //, " - ", ptr_root.ptr_Branch_1.obj_Self_Pocket.Id);
                              //Print( "---  aL  ----- AllNodeOfTree : ",   (string)CPack_tree::getNode_Total(ptr_root));/*WORDKED*/
                              if(!Main_Path_Build_Marge_Exmain(true)) {Print("___BUILD_TREE__FAIL __", __FUNCSIG__);}; //
                              //Print( "---aB----- getNode_Height : ",  (string)CPack_tree::getNode_Height(ptr_root));
                              //Print( "---aB----- AllLeafOfTree : ",   (string)CPack_tree::getNode_Leafs(ptr_root));
                              //Print( "---aB----- AllNodeOfTree : ",   (string)CPack_tree::getNode_Total(ptr_root));//
                    }
                    else if(true)
                    {         //
                              if(!Main_Path_Build_Marge_Exmain(false)) {Print("___BUILD_TREE__FAIL __", __FUNCSIG__);}; //   ///where out off memmory happen
                              Print( "---nLaB----- getNode_Height : ",  (string)CPack_tree::getTree_Height(ptr_BackupRootSave));
                              Print( "---nLaB----- AllLeafOfTree : ",   (string)CPack_tree::getTree_Leafs(ptr_BackupRootSave));
                              Print( "---nLaB----- AllNodeOfTree : ",   (string)CPack_tree::getNode_Total(ptr_BackupRootSave));//
                    }//
          }
          //----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
          //Print("__________Root Setup______", __FUNCTION__, "___________________"); //
          //Print("__________Root SAVE______", __FUNCTION__, "___________________"); //
          //--------------------
          /*  *Root SAVE FIlE */
          //--------------------
          //Print( "---bS----- getNode_Height : ",  (string)CPack_tree::getNode_Height(ptr_root));/*WORDKED*/
          //Print( "---bS----- AllLeafOfTree : ",   (string)CPack_tree::getNode_Leafs(ptr_root));/*WORDKED*/
          //Print( "---bS----- AllNodeOfTree : ",   (string)CPack_tree::getNode_Total(ptr_root));/*WORDKED*/
          //Sleep(10);
          //WHEN NOT SAVE AGAINE ITS ACT AS LEARNED TREE
          Save_Orders(1);/*gTD2.Save_Orders();*/
          //Print("__________Unlink pointers & Delete pointers______", __FUNCTION__, "___________________"); //
          //---------------------------------------
          /*  Unlink pointers & Delete Root subs */
          //---------------------------------------
          {         //--------------------   //--------------------     //-------------------------
                    /*  Unlink pointers */   /*  Delete pointers */     /* *Deinit Root pointers */
                    //--------------------   //--------------------     //-------------------------
                    Traverse_PostOrder_Delete(ptr_root); //not error  delete post order //root after save
                    //Alert("K TND.Tot1 2 + 11 + Subs? K-A (" + (string)C_TND::TOTAL_One);
                    //Traverse_PostOrder_Delete(ptr_root_Choosen);/*it has node address that is carry tradere node*/
                    //!!!!!!>>>Traverse_PostOrder_Delete(ptr_Node_Keep_last_FromRootToSave_Runtime);
          }
          {         //------------------------------------
                    /*Cheak out any poionte live at exit*/
                    //------------------------------------
                    if(CheckPointer(ptr_root))                          {Print("ptr_root Is existed", __FUNCSIG__);}
                    //if(CheckPointer(ptr_Node_Keep_last_FromRootToSave_Runtime)) {Print("ptr_Node_Keep_last_FromRootToSave_Runtime Is existed");}
                    //
          }
          return 0;
          //Print("__________END MainProgress______", __FUNCTION__, "___________________"); //
          //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_TD2::Root_Setup()
{         //--------------------
          /* Root Setup       */
          //--------------------
          if(0)
          {         //--------------------------
                    /* Root Print BranchCount */
                    //--------------------------
                    //-------------------------
                    /* Root Print Path       */
                    //-------------------------
                    Pack_tree.PrintPaths(ptr_root, false); //------- Print(Pack_tree.desc);//
                    if(0)
                    {         for(int i = 0; i < ArraySize(Pack_tree.desc); i++)
                              {         Print((string)i + " Branch path : ", Pack_tree.desc[i]); //2023.03.10 16:35:25.512      QUARTS_AF1 XAUUSD.F,M1: shutdown by timeout
                                        //Sleep(200);//
                              }//
                    }//
                    //-------------------------
                    /* Root Print Path root  */     /*  Print leaf count and getNode_Total */  /* ! hanging when safe root parameter for recucive*/
                    //-------------------------
                    //ptr_BackupRootSave.Node_Height = CPack_tree::getNode_Height(ptr_root); //
                    //Print( "-------- getNode_Height : ",  (string)CPack_tree::getNode_Height(ptr_root));
                    //Print( "-------- AllLeafOfTree : ",   (string)CPack_tree::getNode_Leafs(ptr_root));
                    //Print( "-------- AllNodeOfTree : ",   (string)CPack_tree::getNode_Total(ptr_root));
                    //--example   C_TND_Root_tree_BackUp.ActAtLeafs(ptr_BackupRootSave,ptr_BackupRootSave,CPack_tree::getNode_Leafs(ptr_NodeSafe),CPack_tree::getNode_Total(ptr_NodeSafe)); secound ius safe root for not recusively change
                    CPack_tree::AncestorsNodes(ptr_BackupRootSave, "WPRm", ptr_BackupRootSave.obj_Self_Pocket.name);
                    ActAtLeafs(ptr_BackupRootSave, CPack_tree::getTree_Leafs(ptr_BackupRootSave), CPack_tree::getNode_Total(ptr_BackupRootSave), ptr_BackupRootSave.obj_Self_Pocket.name );
                    //Print( "-------- SayingActiveLeaf : ",  Saying);
                    Pack_tree.printLevelOrder(ptr_BackupRootSave);//
          }//
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
