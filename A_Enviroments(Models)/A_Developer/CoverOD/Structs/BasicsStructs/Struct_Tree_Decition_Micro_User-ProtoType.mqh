//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOF\CFileServer.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CDS_TreeNode_Decition_Micro_User_Proto
{
public:
          CDS_TreeNode_Decition_Micro_User_Proto(string n)
          {         //Print("___STACK OVER FLOW1___", __FUNCSIG__);
                    data_String = "[" + n + "]";
                    //Print("___STACK OVER FLOW2___", __FUNCSIG__); //
          };
          CDS_TreeNode_Decition_Micro_User_Proto() //----when driving base handel driven parameter
          {         //Print("___STACK OVER FLOW1___", __FUNCSIG__);
                    data_String = "[" + "" + "]";
                    //Print("___STACK OVER FLOW2___", __FUNCSIG__); //
          };
          ~CDS_TreeNode_Decition_Micro_User_Proto(void)
          {         //Print("___STACK OVER FLOW1___",__FUNCSIG__);
                    //delete Branch_Parent2; delete Branch_Parent;  delete Branch_L1;  delete Branch_L2; delete Branch_L3; delete Branch_R1;  delete Branch_R2; delete Branch_R3; //
                    //Print("___STACK OVER FLOW2___",__FUNCSIG__);
          };
          //
          CDS_TreeNode_Decition_Micro_User_Proto *Branch_Parent2;      //--as Graph 2 in refrence addres in mem
          CDS_TreeNode_Decition_Micro_User_Proto *Branch_Parent;      //--as parent refrence addres in mem
          CDS_TreeNode_Decition_Micro_User_Proto *Branch_L1;           //--as list or Graph 1 out
          CDS_TreeNode_Decition_Micro_User_Proto *Branch_L2;           //--as tree or Graph 2 out
          CDS_TreeNode_Decition_Micro_User_Proto *Branch_L3;           //--as tree or Graph 3 out
          //
          CDS_TreeNode_Decition_Micro_User_Proto *Branch_R1;           //--as list or Graph 1 out
          CDS_TreeNode_Decition_Micro_User_Proto *Branch_R2;           //--as tree or Graph 2 out
          CDS_TreeNode_Decition_Micro_User_Proto *Branch_R3;           //--as tree or Graph 3 out
          //
          //------------------------------------------------------------
          //  Contain Data
          string data_String;
          //------------------------------------------------------------
          bool SaveNode(const int file_handle);//--not base class self has it__>>> base class type of tree node prototype
          bool LoadNode(const int file_handle, CDS_TreeNode_Decition_Micro_User_Proto *&main);//--must return root
protected:
          //--- methods for working with files
          virtual bool Save0(const int file_handle)  {         return(true);  }  //---not write any thing of node! LJXXXXXXJXXRXXTXXYXX Access Specifiers Access specifiers define how the compiler can access variables, members of structures or classes
          virtual bool Load0(const int file_handle)  {         return(true);  }  //---cant know how it work but data on print is correct runtime///but file are not correct•   virtual – applies only to class methods (but not to methods of structures) and tells the compiler that this method should be placed in the table of virtual functions of the class.
          //The virtual keyword is the function specifier, which provides a mechanism to select dynamically at runtime an appropriate function-member among the functions of basic and derived classes
          //------------------------------------------------------------
          //--- method for creating an instance of class
          virtual CDS_TreeNode_Decition_Micro_User_Proto *CreateSample0(string n) { return(NULL);/*return(new CDS_TreeNode_Decition_Micro_User_Proto(n)); */}// why is null? if not null it create all//--its created obj by drived class  new is correct new CDS_TreeNode_Decition_Micro_User_Proto
protected:
          //--- method for creating an instance of class
          virtual CDS_TreeNode_Decition_Micro_User_Proto *CreateSample(string n)      { return(new CDS_TreeNode_Decition_Micro_User_Proto(n));/*return(NULL);*/ /* the method must implant --called in LoadNode*/  }///beacse of virtual... must set by drived class
          //--- methods for working with files
          virtual bool      Save(const int file_handle);                         //{ /*return(true);*/ /* the method must implant --called in SaveNode*/  }
          virtual bool      Load(const int file_handle);                         //{ /*return(true);*/ /* the method must implant --called in LoadNode*/  }//

};
//+------------------------------------------------------------------+
//| Writing node data to file                                        |
//+------------------------------------------------------------------+
bool CDS_TreeNode_Decition_Micro_User_Proto::SaveNode(const int file_handle)
{         bool result = true;
          //--- check
          if(file_handle == INVALID_HANDLE) return(false);
          //--- write left node (if it is available)
          if(Branch_L1 != NULL)
          {         FileWriteInteger(file_handle, 'L', SHORT_VALUE);
                    result &= Branch_L1.SaveNode(file_handle); //
          }
          //else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(Branch_L2 != NULL)
          {         FileWriteInteger(file_handle, 'K', SHORT_VALUE);
                    result &= Branch_L2.SaveNode(file_handle); //
          }
          //else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(Branch_L3 != NULL)
          {         FileWriteInteger(file_handle, 'J', SHORT_VALUE);
                    result &= Branch_L3.SaveNode(file_handle); //
          }
          if(!Branch_L1 && !Branch_L2 && !Branch_L3)      FileWriteInteger(file_handle, 'X', SHORT_VALUE); //---x mean none null character ''   Capture by 'x' 'x' any leaf
          //------------------------------------------------------------inorder save
          //--- write data of current node
          result &= Save(file_handle);//--------------------------------------------------is virtual mean drived last class save load act
          //------------------------------------------------------------
          //--- write right node (if it is available)
          if(Branch_R1 != NULL)
          {         FileWriteInteger(file_handle, 'R', SHORT_VALUE);
                    result &= Branch_R1.SaveNode(file_handle); //
          }
          //else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);
          if(Branch_R2 != NULL)
          {         FileWriteInteger(file_handle, 'T', SHORT_VALUE);
                    result &= Branch_R2.SaveNode(file_handle); //
          }
          //else      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          if(Branch_R3 != NULL)
          {         FileWriteInteger(file_handle, 'Y', SHORT_VALUE);
                    result &= Branch_R3.SaveNode(file_handle); //
          }
          if(!Branch_R1 && !Branch_R2 && !Branch_R3)      FileWriteInteger(file_handle, 'X', SHORT_VALUE);  //---x mean none null character ''
          //--- successful
          return(true); //
}
//+------------------------------------------------------------------+
//| Reading node data from file                                      |
//+------------------------------------------------------------------+
bool CDS_TreeNode_Decition_Micro_User_Proto::LoadNode(const int file_handle, CDS_TreeNode_Decition_Micro_User_Proto *&main)
{         bool       result = true; //---------------------its true because result of load depending
          short      s_val;
          CDS_TreeNode_Decition_Micro_User_Proto *node;
          //--- check
          if(file_handle == INVALID_HANDLE) return(false);
          //--- read directions----------------------------------------detect left or right on file
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE); //----read character 'x' or 'r' or 'l'
          if(s_val == 'L')//-----------------------------------------------------------------------------------must read frist branch
          {         //--- read left node (if there is data)
                    node = CreateSample("--L1--");   //---with out file depndency naimng file ///file just save tree schema
                    if(node == NULL)  return(false);
                    Branch_L1 = node;
                    main.Branch_L1 = Branch_L1;    //----------------      link to root
                    node.Branch_Parent = main;//----------------------------not set com node
                    //result &= node.LoadNode(file_handle, node); //
                    result &= main.Branch_L1.LoadNode(file_handle, main.Branch_L1); //
          }
          else if(s_val == 'K')
          {         //--- read left node (if there is data)
                    node = CreateSample("--L2--");
                    if(node == NULL)  return(false);
                    Branch_L2 = node;
                    main.Branch_L2 = Branch_L2;    //----------------      link to root
                    node.Branch_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &= main.Branch_L2.LoadNode(file_handle, main.Branch_L2); //
          }
          else if(s_val == 'J')
          {         //--- read left node (if there is data)
                    node = CreateSample("--L3--");
                    if(node == NULL)  return(false);
                    Branch_L3 = node;              //----------------      exist of node
                    main.Branch_L3 = Branch_L3;    //----------------      link to root
                    node.Branch_Parent = main;     //----------------      link root as Parent
                    Branch_L3.Branch_Parent = main;//----------------      link root as Parent
                    //result &= node.LoadNode(file_handle, node); //
                    result &= main.Branch_L3.LoadNode(file_handle, main.Branch_L3); //
          }
          //-------------------------------- Inorder load
          //--- read data of current node
          result &= Load(file_handle);      ///when left branch free get root data
          //--------------------------------
          //--- read directions
          s_val = (short)FileReadInteger(file_handle, SHORT_VALUE);
          if(s_val == 'R')//-----------------------------------------------------------------------------------must read frist branch
          {         //--- read right node (if there is data)
                    node = CreateSample("--R1--");
                    if(node == NULL)   return(false);
                    Branch_R1 = node;
                    main.Branch_R1 = Branch_R1;    //----------------      link to root
                    node.Branch_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &= main.Branch_R1.LoadNode(file_handle, main.Branch_R1);//
          }
          else if(s_val == 'T')
          {         //--- read right node (if there is data)
                    node = CreateSample("--R2--");
                    if(node == NULL)   return(false);
                    Branch_R2 = node;
                    main.Branch_R2 = Branch_R2;    //----------------      link to root
                    node.Branch_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &= main.Branch_R2.LoadNode(file_handle, main.Branch_R2); //
          }
          else if(s_val == 'Y')
          {         //--- read right node (if there is data)
                    node = CreateSample("--R3--");
                    if(node == NULL)   return(false);
                    Branch_R3 = node;
                    main.Branch_R3 = Branch_R3;    //----------------      link to root
                    node.Branch_Parent = main;
                    //result &= node.LoadNode(file_handle, node); //
                    result &= main.Branch_R3.LoadNode(file_handle, main.Branch_R3); //
          }
          //--- result
          return(result);//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CDS_TreeNode_Decition_Micro_User_Proto:: Save(const int file_handle)
{         uint i = 0, len;
          //--- checks
          if(file_handle < 0) return(false);
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
          /*---------------------------------------*/
          // writing custom variable of string type
          /*---------------------------------------*/
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
//|                                                                  |
//+------------------------------------------------------------------+
bool CDS_TreeNode_Decition_Micro_User_Proto::Load(const int file_handle) //--not write any thing of node... when virtual not defined or defined LJXXXXXXJXXRXXTXXYXX
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
          //-----------------------
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
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CDS_Tree_Decition_Micro_User_Proto: public CDS_TreeNode_Decition_Micro_User_Proto
{
public:
          CDS_Tree_Decition_Micro_User_Proto()                            //--- drived has parameter                 'CDS_TreeNode_Decition_Micro_User_Proto' - wrong parameters count         Struct_Tree_Decition_Micro_User.mqh     190       11
          {         //Print("___STACK OVER FLOW___", __FUNCSIG__);
                    CFileServer             _FileServer("Struct_Tree_Decition_Micro_User"); FileServer = _FileServer;
                    //Print("___STACK OVER FLOW2___", __FUNCSIG__); //  //--stack over flow!! not depend
          };
          CDS_Tree_Decition_Micro_User_Proto(string n): CDS_TreeNode_Decition_Micro_User_Proto(n) /*how parrent int*/// 'data_String' - parent member initialization not allowed Struct_Tree_Decition_Micro_User.mqh  //--- drived has parameter 'CDS_TreeNode_Decition_Micro_User_Proto' - wrong parameters count         Struct_Tree_Decition_Micro_User.mqh     190       11
          {         //Print("___STACK OVER FLOW___", __FUNCSIG__);
                    CFileServer             _FileServer("Struct_Tree_Decition_Micro_User"); FileServer = _FileServer;
                    //Print("___STACK OVER FLOW2___", __FUNCSIG__); //  //--stack over flow!! not depend
          };
          ~CDS_Tree_Decition_Micro_User_Proto(void)
          {         //Print("___STACK OVER FLOW___", __FUNCSIG__);
                    delete ROOT;
                    //Print("___STACK OVER FLOW___", __FUNCSIG__);//
          };

          // contain root any NodeType the type is important may
          CDS_TreeNode_Decition_Micro_User_Proto *ROOT;
          // contain file server
          CFileServer                       FileServer;
          //--------------------------------------------
          bool IsFileExist;
          bool IsRootExist;  //not NULL
          //--------------------------------------------
          void Main(bool b)
          {         if(!b)   { return; }
                    //----------------------------------------------------------------
                    /* Make Decition for variables that changed throw market change */
                    /* Reset Condition of Opration                                  */
                    //----------------------------------------------------------------
                    {         IsFileExist = 0;
                              IsRootExist = 0;
                              //
                    }
                    //------------------------------------------------------
                    /* at frist Load the root for remmeber score of leafs */
                    //------------------------------------------------------
                    if(IsFileExist = FileServer.FileBin.IsExist("QuArtsRoot\\TradeSignal_MapSence_Tree\\Tree_Decition_Micro_User\\" + "Decition_Micro_User_Data" + ".Bin"))
                    {         /* START Load */
                              FileServer.FileBin.Open("QuArtsRoot\\TradeSignal_MapSence_Tree\\Tree_Decition_Micro_User\\" + "Decition_Micro_User_Data" + ".Bin", FILE_READ | FILE_WRITE );///| FILE_BIN
                              ROOT = new CDS_TreeNode_Decition_Micro_User_Proto("--R--");
                              Print("___BEFORE LOAD___", ROOT.data_String + "_BEFORE LOAD", "______");
                              if(!ROOT.LoadNode(FileServer.FileBin.Handle(), ROOT)) {Print("___LOAD ROOT FAILED___");}//--------------
                              Print("___AFTER LOAD___", ROOT.Branch_L1.Branch_L3.data_String, "______");
                              /* END Load */
                              FileServer.FileBin.Close();//
                    }
                    else
                    {         /* Start Build Root */
                              if(!BuildRoot(ROOT)) {Print("___BUILD ROOT FAILED___");} //
                              if(!SetupRoot(ROOT)) {Print("___SETUP ROOT FAILED___");} //
                    }
                    //---------------------------------------------------
                    /* at exite Save the root for store Score of leafs */
                    //---------------------------------------------------
                    {         IsRootExist = ROOT ? true : false;}
                    if(IsRootExist)
                    {         FileServer.FileBin.Open("QuArtsRoot\\TradeSignal_MapSence_Tree\\Tree_Decition_Micro_User\\" + "Decition_Micro_User_Data" + ".Bin", FILE_READ | FILE_WRITE );//| FILE_BIN
                              //-----------------
                              /* Write To file */
                              //-----------------
                              if(!ROOT.SaveNode(FileServer.FileBin.Handle())) {Print("___SAVE ROOT FAILED___");}
                              Print("___SAVE___", ROOT.Branch_L1.Branch_L3.data_String, "______");
                              Print("___RESET___", ROOT.Branch_L1.Branch_L3.data_String = "--1--", "______");
                              if(ROOT.Branch_L1.Branch_L3) { delete ROOT.Branch_L1.Branch_L3;}
                              if(ROOT.Branch_L1) { delete ROOT.Branch_L1;}/////////////////////////////////////////---not before delete
                              if(ROOT.Branch_L2) { delete ROOT.Branch_L2;}
                              if(ROOT.Branch_L3) { delete ROOT.Branch_L3;}
                              if(ROOT.Branch_R1) { delete ROOT.Branch_R1;}
                              if(ROOT.Branch_R2) { delete ROOT.Branch_R2;}
                              if(ROOT.Branch_R3) { delete ROOT.Branch_R3;}
                              if(ROOT)           { delete ROOT;}
                              FileServer.FileBin.Close();//
                    }
                    else
                    {         Main(false);// repeate
                    }
                    //---------------------------------------------------
                    /* at exite                                        */
                    //---------------------------------------------------
          }
          bool BuildRoot(CDS_TreeNode_Decition_Micro_User_Proto *& root)
          {         bool res = false;
                    if(!root)  { root = new CDS_TreeNode_Decition_Micro_User_Proto("--R--");  res = true;}
                    return res;        //
          }
          bool SetupRoot(CDS_TreeNode_Decition_Micro_User_Proto *& root)
          {         bool res = false;
                    if(!root)  { root = new CDS_TreeNode_Decition_Micro_User_Proto("--R--"); }
                    else
                    {         //
                              //
                              root.Branch_L1            = new CDS_TreeNode_Decition_Micro_User_Proto("--L1--");
                              root.Branch_L1.Branch_L3  = new CDS_TreeNode_Decition_Micro_User_Proto("--L3--");
                              root.Branch_L2            = new CDS_TreeNode_Decition_Micro_User_Proto("--L2--");
                              root.Branch_L3            = new CDS_TreeNode_Decition_Micro_User_Proto("--L3--");
                              root.Branch_R1            = new CDS_TreeNode_Decition_Micro_User_Proto("--R1--");
                              root.Branch_R2            = new CDS_TreeNode_Decition_Micro_User_Proto("--R2--");
                              root.Branch_R3            = new CDS_TreeNode_Decition_Micro_User_Proto("--R3--");
                              //
                              res = true;
                              //
                    }
                    return res;        //
          }
          /*---------------------------------------------------------------*/
          // virtual exmain tree drive trenode not run save node error
          /*---------------------------------------------------------------*/






};
//+------------------------------------------------------------------+
