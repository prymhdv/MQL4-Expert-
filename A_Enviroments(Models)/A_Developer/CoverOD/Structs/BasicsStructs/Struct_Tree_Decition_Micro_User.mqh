//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOF\CFileServer.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_Decition_Micro_User.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
class CDS_Tree_Decition_Micro_User: public CDS_TreeNode_Decition_Micro_User
{
public:
          CDS_Tree_Decition_Micro_User()                            //--- drived has parameter                 'CDS_TreeNode_Decition_Micro_User' - wrong parameters count         Struct_Tree_Decition_Micro_User.mqh     190       11
          {         //Print("___STACK OVER FLOW___", __FUNCSIG__);
                    CFileServer             _FileServer("Struct_Tree_Decition_Micro_User"); FileServer = _FileServer;
                    //Print("___STACK OVER FLOW2___", __FUNCSIG__); //  //--stack over flow!! not depend
          };
          CDS_Tree_Decition_Micro_User(string n): CDS_TreeNode_Decition_Micro_User(n,false) /*how parrent int*/// 'data_String' - parent member initialization not allowed Struct_Tree_Decition_Micro_User.mqh  //--- drived has parameter 'CDS_TreeNode_Decition_Micro_User' - wrong parameters count         Struct_Tree_Decition_Micro_User.mqh     190       11
          {         //Print("___STACK OVER FLOW___", __FUNCSIG__);
                    CFileServer             _FileServer("Struct_Tree_Decition_Micro_User"); FileServer = _FileServer;
                    //Print("___STACK OVER FLOW2___", __FUNCSIG__); //  //--stack over flow!! not depend
          };
          ~CDS_Tree_Decition_Micro_User(void)
          {         //Print("___STACK OVER FLOW___", __FUNCSIG__);
                    delete ROOT;
                    //Print("___STACK OVER FLOW___", __FUNCSIG__);//
          };

          // contain root any NodeType the type is important may
          CDS_TreeNode_Decition_Micro_User *ROOT;
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
                              ROOT = new CDS_TreeNode_Decition_Micro_User("--R--",false);
                              //Print("___BEFORE LOAD___", ROOT.data_String + "_BEFORE LOAD", "______");
                              if(!ROOT.LoadNode(FileServer.FileBin.Handle(), ROOT)) {Print("___LOAD ROOT FAILED___");}//--------------
                              //Print("___AFTER LOAD___", ROOT.Branch_L1.Branch_L3.data_String, "______");
                              /* END Load */
                              FileServer.FileBin.Close();//
                    }
                    else
                    {         /* Start Build Root */
                              if(!BuildRoot(ROOT)) {Print("___BUILD ROOT FAILED___");} //
                              if(!SetupRoot(ROOT)) {Print("___SETUP ROOT FAILED___");} //
                    }
                    //-----------------------------------------------------
                    /* at middle Progress root for define Score of leafs */
                    //-----------------------------------------------------
                    {         if(ROOT)
                              {         // WATING ---
                                        ROOT.Branch_L1            = new CDS_TreeNode_Decition_Micro_User("--L1--",false);
                                        ROOT.Branch_L1            = new CDS_TreeNode_Decition_Micro_User("--L3--",false);
                                        ROOT.Branch_L2            = new CDS_TreeNode_Decition_Micro_User("--L2--",false);
                                        ROOT.Branch_L3            = new CDS_TreeNode_Decition_Micro_User("--L3--",false);
                                        ROOT.Branch_R1            = new CDS_TreeNode_Decition_Micro_User("--R1--",false);
                                        ROOT.Branch_R2            = new CDS_TreeNode_Decition_Micro_User("--R2--",false);
                                        ROOT.Branch_R3            = new CDS_TreeNode_Decition_Micro_User("--R3--",false);
                                        //
                              }
                              else  {  Print("___NOT FIND ROOT, PROGRESS ROOT FAILED___");   }//
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
                              //Print("___SAVE___", ROOT.Branch_L1.Branch_L3.data_String, "______");
                              //Print("___RESET___", ROOT.Branch_L1.Branch_L3.data_String = "--1--", "______");
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
          bool BuildRoot(CDS_TreeNode_Decition_Micro_User *& root)
          {         bool res = false;
                    if(!root)  { root = new CDS_TreeNode_Decition_Micro_User("--R--",false);  res = true;}
                    return res;        //
          }
          bool SetupRoot(CDS_TreeNode_Decition_Micro_User *& root)
          {         bool res = false;
                    if(!root)  { root = new CDS_TreeNode_Decition_Micro_User("--R--",false); }
                    else
                    {         //
                              //
                              root.Branch_L1            = new CDS_TreeNode_Decition_Micro_User("--L1--",false);
                              root.Branch_L1.Branch_L3  = new CDS_TreeNode_Decition_Micro_User("--L3--",false);
                              root.Branch_L2            = new CDS_TreeNode_Decition_Micro_User("--L2--",false);
                              root.Branch_L3            = new CDS_TreeNode_Decition_Micro_User("--L3--",false);
                              root.Branch_R1            = new CDS_TreeNode_Decition_Micro_User("--R1--",false);
                              root.Branch_R2            = new CDS_TreeNode_Decition_Micro_User("--R2--",false);
                              root.Branch_R3            = new CDS_TreeNode_Decition_Micro_User("--R3--",false);
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
