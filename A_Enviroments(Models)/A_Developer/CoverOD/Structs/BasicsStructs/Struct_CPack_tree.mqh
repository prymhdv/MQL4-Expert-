//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
class C_TND;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CPack_tree
{
public:
          CPack_tree(void) {};
          ~CPack_tree(void)
          {         //--may caused stack over flow
                    //DeleteSub();
                    //
          };

          //-------------------
          /*define pointr obj*/
          //-------------------
          C_TND *ptr_TND_Root                ;//= newNode(10);
          C_TND *ptr_TND_SubLevel_1          ;//= new C_TND();
          C_TND *ptr_TND_SubLevel_2          ;//= new C_TND();
          C_TND *ptr_TND_SubLevel_3          ;//= new C_TND();
          C_TND *ptr_TND_SubLevel_4          ;//= new C_TND();
          C_TND *ptr_TND_SubLevel_5          ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_6          ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_7          ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_8          ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_9          ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_10         ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_11         ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_12         ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_13         ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_14         ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_15         ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_16         ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_17         ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_18         ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_19         ;//= new C_TND(); //
          C_TND *ptr_TND_SubLevel_20         ;//= new C_TND(); //
          //---------------------------------------------------------------------------------------------------------
          string     desc[];
          int        descCount;
          //---------------------------------------------------------------------------------------------------------
          //ulong  Node_Total;
          //--------------------------
          //St_LineSence_Block BLOCK_TREE_SENCE[100000];
          //--------------------------

          void DeleteSub()
          {         //-------------------
                    /*Delete pointr obj*/ //...when delete root others delete from memory
                    //-------------------
                    if(CheckPointer(ptr_TND_Root))              delete ptr_TND_Root;  //--Pointer in mmmemmory caused not existed entity
                    if(CheckPointer(ptr_TND_SubLevel_1))        delete ptr_TND_SubLevel_1;
                    if(CheckPointer(ptr_TND_SubLevel_2))        delete ptr_TND_SubLevel_2;
                    if(CheckPointer(ptr_TND_SubLevel_3))        delete ptr_TND_SubLevel_3;
                    if(CheckPointer(ptr_TND_SubLevel_4))        delete ptr_TND_SubLevel_4;
                    if(CheckPointer(ptr_TND_SubLevel_5))        delete ptr_TND_SubLevel_5;
                    if(CheckPointer(ptr_TND_SubLevel_6))        delete ptr_TND_SubLevel_6;
                    if(CheckPointer(ptr_TND_SubLevel_7))        delete ptr_TND_SubLevel_7;
                    if(CheckPointer(ptr_TND_SubLevel_8))        delete ptr_TND_SubLevel_8;
                    if(CheckPointer(ptr_TND_SubLevel_9))        delete ptr_TND_SubLevel_9;
                    if(CheckPointer(ptr_TND_SubLevel_10))       delete ptr_TND_SubLevel_10;
                    if(CheckPointer(ptr_TND_SubLevel_11))       delete ptr_TND_SubLevel_11;
                    if(CheckPointer(ptr_TND_SubLevel_12))       delete ptr_TND_SubLevel_12;
                    if(CheckPointer(ptr_TND_SubLevel_13))       delete ptr_TND_SubLevel_13;
                    if(CheckPointer(ptr_TND_SubLevel_14))       delete ptr_TND_SubLevel_14;
                    if(CheckPointer(ptr_TND_SubLevel_15))       delete ptr_TND_SubLevel_15;
                    if(CheckPointer(ptr_TND_SubLevel_16))       delete ptr_TND_SubLevel_16;
                    if(CheckPointer(ptr_TND_SubLevel_17))       delete ptr_TND_SubLevel_17;
                    if(CheckPointer(ptr_TND_SubLevel_18))       delete ptr_TND_SubLevel_18;
                    if(CheckPointer(ptr_TND_SubLevel_19))       delete ptr_TND_SubLevel_19;
                    if(CheckPointer(ptr_TND_SubLevel_20))       delete ptr_TND_SubLevel_20;//
          }
          void Traverse__Delete_ExeptRoot()
          {         Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_1);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_2);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_3);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_4);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_5);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_6);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_7);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_8);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_9);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_10);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_11);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_12);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_13);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_14);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_15);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_16);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_17);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_18);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_19);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_20);//Traverse_PostOrder_Delete(ptr_TND_Root);//
          }
          void Traverse__Delete()
          {         //-------------------------------------------------
                    Traverse_PostOrderReverse_Delete(ptr_TND_Root);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_1);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_2);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_3);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_4);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_5);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_6);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_7);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_8);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_9);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_10);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_11);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_12);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_13);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_14);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_15);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_16);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_17);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_18);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_19);//
                    Traverse_PostOrderReverse_Delete(ptr_TND_SubLevel_20);//Traverse_PostOrder_Delete(ptr_TND_Root);//
                    //-------------------------------------------------
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_1);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_2);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_3);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_4);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_5);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_6);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_7);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_8);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_9);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_10);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_11);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_12);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_13);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_14);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_15);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_16);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_17);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_18);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_19);//
                    Traverse_PostOrder_Delete(ptr_TND_SubLevel_20);//
                    //-------------------------------------------------
                    if(CheckPointer(ptr_TND_Root))            {Print("ptr_TND_Root Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_1))      {Print("ptr_TND_SubLevel_1 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_2))      {Print("ptr_TND_SubLevel_2 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_3))      {Print("ptr_TND_SubLevel_3 Is existed", __FUNCSIG__);} //well  not caused inc 20 20 over ids deleting coorrected code algo
                    if(CheckPointer(ptr_TND_SubLevel_4))      {Print("ptr_TND_SubLevel_4 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_5))      {Print("ptr_TND_SubLevel_5 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_6))      {Print("ptr_TND_SubLevel_6 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_7))      {Print("ptr_TND_SubLevel_7 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_8))      {Print("ptr_TND_SubLevel_8 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_9))      {Print("ptr_TND_SubLevel_9 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_10))    {Print("ptr_TND_SubLevel_10 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_11))    {Print("ptr_TND_SubLevel_11 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_12))    {Print("ptr_TND_SubLevel_12 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_13))    {Print("ptr_TND_SubLevel_13 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_14))    {Print("ptr_TND_SubLevel_14 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_15))    {Print("ptr_TND_SubLevel_15 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_16))    {Print("ptr_TND_SubLevel_16 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_17))    {Print("ptr_TND_SubLevel_17 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_18))    {Print("ptr_TND_SubLevel_18 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_19))    {Print("ptr_TND_SubLevel_19 Is existed", __FUNCSIG__);}
                    if(CheckPointer(ptr_TND_SubLevel_20))    {Print("ptr_TND_SubLevel_20 Is existed", __FUNCSIG__);}//
          }


          void Traverse_PostOrder_Delete(C_TND * main)
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
                    delete main;  if(CheckPointer(main)) {Print(" main Is existed NOT DELETED", __FUNCSIG__);}
                    return;//post order deleted node
                    //
                    ///
          }
          void Traverse_PostOrderReverse_Delete(C_TND * main)
          {         if(!CheckPointer(main)) return;
                    Traverse_PostOrder_Delete(main.ptr_BackupRootSave);
                    Traverse_PostOrder_Delete(main.ptr_Backup);
                    Traverse_PostOrder_Delete(main.ptr_Parent);
                    Traverse_PostOrder_Delete(main.ptr_Branch_10);
                    Traverse_PostOrder_Delete(main.ptr_Branch_9);
                    Traverse_PostOrder_Delete(main.ptr_Branch_8);
                    Traverse_PostOrder_Delete(main.ptr_Branch_7);
                    Traverse_PostOrder_Delete(main.ptr_Branch_6);
                    Traverse_PostOrder_Delete(main.ptr_Branch_5);
                    Traverse_PostOrder_Delete(main.ptr_Branch_4);
                    Traverse_PostOrder_Delete(main.ptr_Branch_3);
                    Traverse_PostOrder_Delete(main.ptr_Branch_2);
                    Traverse_PostOrder_Delete(main.ptr_Branch_1);
                    //------------------------------------------------
                    delete main; return;//post order deleted node
                    //
                    ///
          }

          template<typename t>
          static C_TND * newNode( string _name, t _Keyvalue)
          {         static C_TND * ptr_node = new C_TND();  return ptr_node;//
          }
          //---------------------------------------------------------------------------------------------------------
          void       PrintArray(int &ref_ints[], int len)
          {         ArrayResize(desc, 1000);
                    desc[0] = "";
                    int i;
                    //for(int j = 0; j < ArraySize(desc); j++)
                    //{         for( i = 0; i < len; i++)   {  desc[0] += (string)ref_ints[i]; desc[0] += " ";      }//
                    //}
                    //Print("Branch path : ", desc);
                    //Print("-----------------------");//
                    for( i = 0; i < len; i++)   {  desc[0] += (string)ref_ints[i]; desc[0] += "_";      }//
                    Print("Branch path : ", desc[0]); Sleep(0);//
                    //--------------------------------------------------------------------------------------------------
                    if(descCount + 1 > ArraySize(desc)) {descCount = 0;} //Print("descCount:", (string)descCount);
                    desc[descCount++] = desc[0]; //
          }//---------------------------------------------------------------------------------------------------------
          void       PrintPaths(C_TND *ptr_node, bool isRun)   { if(!isRun) {return;} int path[1000];  PrintPathsRecur(ptr_node, path, 0); }
          //---------------------------------------------------------------------------------------------------------
          void       PrintPathsRecur(C_TND *ptr_node, int &path[], int pathLen)
          {         if(!ptr_node) { return; }//--if(ptr_node == NULL) { return; }
                    //Print("_root_");
                    path[pathLen] = ptr_node.data; //--ptr_self name   //2023.03.10 13:46:37.391    QUARTS_AF1 XAUUSD.F,M1: invalid pointer access in 'Advanced_TreeNode_Decition2.mqh' (150,37)
                    pathLen++;
                    //-------------
                    /*detect leaf*/  // !ptr_node.ptr_Branch_2) mean s null
                    //------------- //---if(ptr_node.ptr_Branch_1 == NULL && ptr_node.ptr_Branch_2 == NULL) {PrintArray(path, pathLen);} not work with null
                    if( !ptr_node.ptr_Branch_1
                                        && !ptr_node.ptr_Branch_2
                                        && !ptr_node.ptr_Branch_3
                                        && !ptr_node.ptr_Branch_4
                                        && !ptr_node.ptr_Branch_5
                                        && !ptr_node.ptr_Branch_6
                                        && !ptr_node.ptr_Branch_7
                                        && !ptr_node.ptr_Branch_8
                                        && !ptr_node.ptr_Branch_9
                                        && !ptr_node.ptr_Branch_10
                                        && !ptr_node.ptr_Parent
                                        && !ptr_node.ptr_BackupRootSave
                                        && !ptr_node.ptr_BackupRootLoad
                                        && !ptr_node.ptr_Backup
                      )                      {PrintArray(path, pathLen);  ArrayInitialize(path, 0);   /*reset array*/ } //----where end  after detect/////
                    else
                    {         PrintPathsRecur(ptr_node.ptr_Branch_1,   path, pathLen);
                              PrintPathsRecur(ptr_node.ptr_Branch_2,   path, pathLen);
                              PrintPathsRecur(ptr_node.ptr_Branch_3,   path, pathLen);
                              PrintPathsRecur(ptr_node.ptr_Branch_4,   path, pathLen);
                              PrintPathsRecur(ptr_node.ptr_Branch_5,   path, pathLen);//
                              PrintPathsRecur(ptr_node.ptr_Branch_6,   path, pathLen);
                              PrintPathsRecur(ptr_node.ptr_Branch_7,   path, pathLen);
                              PrintPathsRecur(ptr_node.ptr_Branch_8,   path, pathLen);
                              PrintPathsRecur(ptr_node.ptr_Branch_9,   path, pathLen);
                              PrintPathsRecur(ptr_node.ptr_Branch_10,  path, pathLen);//
                              PrintPathsRecur(ptr_node.ptr_Parent,     path, pathLen);
                              PrintPathsRecur(ptr_node.ptr_Backup,     path, pathLen);
                              PrintPathsRecur(ptr_node.ptr_BackupRootSave, path, pathLen);//
                              PrintPathsRecur(ptr_node.ptr_BackupRootLoad, path, pathLen);//
                    } //
                    //----------
          }//---------------------------------------------------------------------------------------------------------
          void       LevelOrderTravers(C_TND *ptr_node)
          {}
          static ulong  getTree_Height(C_TND *ptr_node)//---levels count
          {         //if(!ptr_node) {return 0;}
                    if(!CheckPointer(ptr_node)) {return 0;}
                    else
                    {         ulong max;
                              max = MAX(getTree_Height(ptr_node.ptr_Branch_1), getTree_Height(ptr_node.ptr_Branch_2)) + 1; //
                              max = MAX(max, getTree_Height(ptr_node.ptr_Branch_4)) + 1;  //
                              max = MAX(max, getTree_Height(ptr_node.ptr_Branch_5)) + 1;  //
                              max = MAX(max, getTree_Height(ptr_node.ptr_Branch_6)) + 1;  //
                              max = MAX(max, getTree_Height(ptr_node.ptr_Branch_7)) + 1;  //
                              max = MAX(max, getTree_Height(ptr_node.ptr_Branch_8)) + 1;  //
                              max = MAX(max, getTree_Height(ptr_node.ptr_Branch_9)) + 1;  //
                              max = MAX(max, getTree_Height(ptr_node.ptr_Branch_10)) + 1; //
                              max = MAX(max, getTree_Height(ptr_node.ptr_Parent)) + 1;    //
                              max = MAX(max, getTree_Height(ptr_node.ptr_Backup)) + 1;    //
                              max = MAX(max, getTree_Height(ptr_node.ptr_BackupRootSave)) + 1;//
                              max = MAX(max, getTree_Height(ptr_node.ptr_BackupRootLoad)) + 1;//
                              //---------------------------------------------------------------
                              //ptr_node.Node_Height      = max;
                              return max;
                              //
                    } //
          }
          static int height(C_TND *ptr_node)
          {         if (!ptr_node) return 0;
                    else
                    {         /* compute the height of each subtree */
                              int lheight = height(ptr_node.ptr_Branch_1);
                              int rheight = height(ptr_node.ptr_Branch_2);
                              /* use the larger one */
                              if (lheight > rheight)
                              {         return (lheight + 1); }
                              else
                              {         return (rheight + 1); //
                              } //
                    } //
          }
          //---------------------------------------------------------------------------------------------------------
          //void getDepth(C_TND *node)
          //{         if (!node) return 0;
          //          else
          //          {         /* compute the depth of each subtree */
          //                    lDepth = maxDepth(node.left);
          //                    rDepth = maxDepth(node.right);
          //                    /* use the larger one */
          //                    if (lDepth > rDepth) return lDepth + 1;
          //                    else return rDepth + 1;//
          //          }//
          //};
          //void  leafNodeFirstLevelTraversal(C_TND *node)
          //{         maxDepth =  getDepth(node);
          //          for (let i = 0; i <= maxDepth; i++) { this.leafNodeFirstLevelTraversalSub(node, i) } //
          //}
          //void leafNodeFirstLevelTraversalSub(C_TND *node, int level)
          //{         if (!node) return;
          //          const childrenDepth = getDepth(node) - 1;
          //          if (childrenDepth == level)  { console.log(node.data) } //
          //          else
          //          {         this.leafNodeFirstLevelTraversalSub(node.left, level);
          //                    this.leafNodeFirstLevelTraversalSub(node.right, level); //
          //          } //
          //}
          //---------------------------------------------------------------------------------------------------------
          void populateNodesInArray(C_TND *ptr_node, int &arr1[], int pos)  ///:::TreeToArray
          {         if(!ptr_node) {return;}
                    arr1[pos] = ptr_node.data;
                    if(ptr_node.ptr_Branch_1)           {populateNodesInArray(ptr_node.ptr_Branch_1, arr1, 2 * pos + 1);}
                    if(ptr_node.ptr_Branch_2)           {populateNodesInArray(ptr_node.ptr_Branch_2, arr1, 2 * pos + 1);}
                    if(ptr_node.ptr_Branch_3)           {populateNodesInArray(ptr_node.ptr_Branch_3, arr1, 2 * pos + 1);}
                    if(ptr_node.ptr_Branch_4)           {populateNodesInArray(ptr_node.ptr_Branch_4, arr1, 2 * pos + 1);}
                    if(ptr_node.ptr_Branch_5)           {populateNodesInArray(ptr_node.ptr_Branch_5, arr1, 2 * pos + 1);}
                    if(ptr_node.ptr_Branch_6)           {populateNodesInArray(ptr_node.ptr_Branch_6, arr1, 2 * pos + 1);}
                    if(ptr_node.ptr_Branch_7)           {populateNodesInArray(ptr_node.ptr_Branch_7, arr1, 2 * pos + 1);}
                    if(ptr_node.ptr_Branch_8)           {populateNodesInArray(ptr_node.ptr_Branch_8, arr1, 2 * pos + 1);}
                    if(ptr_node.ptr_Branch_9)           {populateNodesInArray(ptr_node.ptr_Branch_9, arr1, 2 * pos + 1);}
                    if(ptr_node.ptr_Branch_10)          {populateNodesInArray(ptr_node.ptr_Branch_10, arr1, 2 * pos + 1);}
                    if(ptr_node.ptr_Parent)             {populateNodesInArray(ptr_node.ptr_Parent, arr1, 2 * pos + 1);}
                    if(ptr_node.ptr_Backup)             {populateNodesInArray(ptr_node.ptr_Backup, arr1, 2 * pos + 1);}
                    if(ptr_node.ptr_BackupRootSave)     {populateNodesInArray(ptr_node.ptr_BackupRootSave, arr1, 2 * pos + 1);}
                    //
          }
          //
          void populateTreeFromArray(C_TND *ptr_node_root, int &arr1[], int n, int pos )  ///:::ArrayToTree
          {         if(ptr_node_root == NULL ||  /*arr1 == NULL ||*/ n == 0)    { return; }
                    int newPos = 2 * pos + 1;
                    if(newPos < n && arr1[newPos] != EMPTY)
                    {         ptr_node_root.ptr_Branch_1 = new C_TND(arr1[newPos]);
                              populateTreeFromArray(ptr_node_root.ptr_Branch_1, arr1, n, newPos );//
                    } //
          }
          //---------------------------------------------------------------------------------------------------------
          void TreeToArray(C_TND *ptr_node, int &arr1[], int maxNodes)
          {         for(int i = 0; i < maxNodes; i++) {ArrayInitialize(arr1, -1);}
                    populateNodesInArray(ptr_node, arr1, 0); //
          }
          //---------------------------------------------------------------------------------------------------------
          C_TND *ArrayToTree( int &arr1[], int n )
          {         if(/*arr1 == NULL ||*/ arr1[0] == EMPTY_VALUE) {return NULL;}
                    C_TND *ptr_node_root = new C_TND(arr1[0]);
                    populateTreeFromArray(ptr_node_root, arr1, n, 0);
                    return ptr_node_root;//
          }
          //---------------------------------------------------------------------------------------------------------
          void printCurrentLevel(C_TND *ptr_node_root, ulong level, string &Desc )  //:::printLevelOrder
          {         //
                    if (ptr_node_root == NULL)  {  return;}
                    if (level == 1)
                    {         Desc += (string)ptr_node_root.data + " ";
                              //Print(Desc); ///
                    }
                    else if (level > 1)
                    {         printCurrentLevel(ptr_node_root.ptr_Branch_1, level - 1, Desc);
                              printCurrentLevel(ptr_node_root.ptr_Branch_2, level - 1, Desc); //
                              printCurrentLevel(ptr_node_root.ptr_Branch_3, level - 1, Desc); //
                              printCurrentLevel(ptr_node_root.ptr_Branch_4, level - 1, Desc); //
                              printCurrentLevel(ptr_node_root.ptr_Branch_5, level - 1, Desc); //
                              printCurrentLevel(ptr_node_root.ptr_Branch_6, level - 1, Desc); //
                              printCurrentLevel(ptr_node_root.ptr_Branch_7, level - 1, Desc); //
                              printCurrentLevel(ptr_node_root.ptr_Branch_8, level - 1, Desc); //
                              printCurrentLevel(ptr_node_root.ptr_Branch_9, level - 1, Desc); //
                              printCurrentLevel(ptr_node_root.ptr_Branch_10, level - 1, Desc); //
                              printCurrentLevel(ptr_node_root.ptr_Parent, level - 1, Desc); //
                              printCurrentLevel(ptr_node_root.ptr_Backup, level - 1, Desc); //
                              printCurrentLevel(ptr_node_root.ptr_BackupRootSave, level - 1, Desc); //
                              printCurrentLevel(ptr_node_root.ptr_BackupRootLoad, level - 1, Desc); //
                    }//
          }
          void printLevelOrder(C_TND *ptr_node_root)
          {         ulong h = getTree_Height(ptr_node_root);
                    ulong i; string Desc = "";
                    for (i = 1; i <= h; i++) printCurrentLevel(ptr_node_root, i, Desc); //
                    Print(Desc); ///
          }
          //---------------------------------------------------------------------------------------------------------

          static int CalcBranchCount(C_TND *& ref_Node)
          {         //Print("stack over flow ", __FUNCSIG__); ///
                    int _BranchCount = 0; //
                    Traverse_PreOrder_BranchCount(_BranchCount, ref_Node); //
                    return _BranchCount; //
          }
          static void Traverse_PreOrder_BranchCount(int &_BranchCount, C_TND * ptr_Node)
          {         //
                    _BranchCount++; //= CountBranchAll++;
                    if(!CheckPointer(ptr_Node))return;
                    //Print("stack over flow ",__FUNCSIG__);///
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_Branch_1);
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_Branch_2);
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_Branch_3);
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_Branch_4);
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_Branch_5);
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_Branch_6);
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_Branch_7);
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_Branch_8);
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_Branch_9);
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_Branch_10);
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_Parent);
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_Backup);
                    Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.ptr_BackupRootSave);
                    //---Traverse_PreOrder_BranchCount(_BranchCount, ptr_Node.obj_Self_Pocket);
                    //
          }
          static ulong getTree_Leafs(C_TND * ptr_Node)
          {         ulong Count;
                    if(!CheckPointer(ptr_Node)) { return Count = 0;}
                    //
                    if(!CheckPointer(ptr_Node.ptr_Branch_1) && !CheckPointer(ptr_Node.ptr_Branch_2)  && !CheckPointer(ptr_Node.ptr_Branch_3) && !CheckPointer(ptr_Node.ptr_Branch_4) && !CheckPointer(ptr_Node.ptr_Branch_5)
                                        && !CheckPointer(ptr_Node.ptr_Branch_6)  && !CheckPointer(ptr_Node.ptr_Branch_7) && !CheckPointer(ptr_Node.ptr_Branch_8) && !CheckPointer(ptr_Node.ptr_Branch_9)  && !CheckPointer(ptr_Node.ptr_Branch_10)
                                        && !CheckPointer(ptr_Node.ptr_Parent)   && !CheckPointer(ptr_Node.ptr_Backup)  && !CheckPointer(ptr_Node.ptr_BackupRootSave) )
                    {         return Count = 1;} //WHERE DETECTED LEAF
                    {         return Count = getTree_Leafs(ptr_Node.ptr_Branch_1)
                                             + getTree_Leafs(ptr_Node.ptr_Branch_2)
                                             + getTree_Leafs(ptr_Node.ptr_Branch_3)
                                             + getTree_Leafs(ptr_Node.ptr_Branch_4)
                                             + getTree_Leafs(ptr_Node.ptr_Branch_5)
                                             + getTree_Leafs(ptr_Node.ptr_Branch_6)
                                             + getTree_Leafs(ptr_Node.ptr_Branch_7)
                                             + getTree_Leafs(ptr_Node.ptr_Branch_8)
                                             + getTree_Leafs(ptr_Node.ptr_Branch_9)
                                             + getTree_Leafs(ptr_Node.ptr_Branch_10)
                                             + getTree_Leafs(ptr_Node.ptr_Parent)
                                             + getTree_Leafs(ptr_Node.ptr_Backup)
                                             + getTree_Leafs(ptr_Node.ptr_BackupRootSave)
                                             + getTree_Leafs(ptr_Node.ptr_BackupRootLoad)
                                             ;//
                    } //
          }
          static ulong getNode_Total(C_TND * ptr_Node)
          {         if ( !CheckPointer(ptr_Node)) return 0;
                    //unsigned l = getNode_Total(root->left);
                    //unsigned r = getNode_Total(root->right);
                    ulong tot = 1
                                + getNode_Total(ptr_Node.ptr_Branch_1)       + getNode_Total(ptr_Node.ptr_Branch_2)
                                + getNode_Total(ptr_Node.ptr_Branch_3)       + getNode_Total(ptr_Node.ptr_Branch_4)
                                + getNode_Total(ptr_Node.ptr_Branch_5)       + getNode_Total(ptr_Node.ptr_Branch_6)
                                + getNode_Total(ptr_Node.ptr_Branch_7)       + getNode_Total(ptr_Node.ptr_Branch_8)
                                + getNode_Total(ptr_Node.ptr_Branch_9)       + getNode_Total(ptr_Node.ptr_Branch_10)
                                + getNode_Total(ptr_Node.ptr_Parent)         + getNode_Total(ptr_Node.ptr_Backup)
                                + getNode_Total(ptr_Node.ptr_BackupRootSave) + getNode_Total(ptr_Node.ptr_BackupRootLoad);
                    return  tot;
                    //return 1 + l + r;//
          }//
          static bool AncestorsNodes( C_TND *ptr_root, string target, string &Desc)//'ptr_NodeSafe' - cannot convert from const pointer to nonconst pointer          Advanced_TreeNode_Decition2.mqh         981       91
          {         if (!ptr_root)  return false;
                    if (ptr_root.obj_Self_Pocket.name == target) return true;
                    if ( AncestorsNodes(ptr_root.ptr_Branch_1, target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_Branch_2,   target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_Branch_3,   target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_Branch_4,   target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_Branch_5,   target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_Branch_6,   target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_Branch_7,   target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_Branch_8,   target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_Branch_9,   target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_Branch_10,  target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_Parent,     target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_Backup,     target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_BackupRootSave, target, Desc)
                                        || AncestorsNodes(ptr_root.ptr_BackupRootLoad, target, Desc)
                       )  { Desc += (string)ptr_root.obj_Self_Pocket.name + " ";   return true; } //
                    return false;//
          }
          /*--Traverses--*/
          // In order Traversal
          // Pre Order Traversal
          // Post Order Traversal
          // Level Order Traversal
          //
          //template<typename Node> /* ! every type tree has own function example binary is  left right .. mway tree is self function */
          static void free_tree(C_TND* ptr_root)
          {         // Deallocates memory corresponding to every node in the tree.
                    /* or delete root make delete subs*/  ///!!!!!!!!!!!!!exmain!!!!!!!!!!
                    delete ptr_root; return;
                    //-----------------------------------
                    {         if (!ptr_root) return;
                              //------------------------------
                              free_tree(ptr_root.ptr_Branch_1);
                              free_tree(ptr_root.ptr_Branch_2);
                              free_tree(ptr_root.ptr_Branch_3);
                              free_tree(ptr_root.ptr_Branch_4);
                              free_tree(ptr_root.ptr_Branch_5);
                              free_tree(ptr_root.ptr_Branch_6);
                              free_tree(ptr_root.ptr_Branch_7);
                              free_tree(ptr_root.ptr_Branch_8);
                              free_tree(ptr_root.ptr_Branch_9);
                              free_tree(ptr_root.ptr_Branch_10);
                              free_tree(ptr_root.ptr_Parent);
                              free_tree(ptr_root.ptr_Backup);
                              free_tree(ptr_root.ptr_BackupRootSave);
                              free_tree(ptr_root.ptr_BackupRootLoad);
                              //This function can be used for checking pointer validity. A non-zero value warranties that the pointer can be used for accessing.
                              if (!ptr_root.ptr_Branch_1 && !ptr_root.ptr_Branch_2 &&   !ptr_root.ptr_Branch_3 && !ptr_root.ptr_Branch_4 &&
                                                  !ptr_root.ptr_Branch_5 && !ptr_root.ptr_Branch_6 &&   !ptr_root.ptr_Branch_7 && !ptr_root.ptr_Branch_8 &&
                                                  !ptr_root.ptr_Branch_9 && !ptr_root.ptr_Branch_10 &&   !ptr_root.ptr_Parent && !ptr_root.ptr_Backup &&
                                                  !ptr_root.ptr_BackupRootSave && !ptr_root.ptr_BackupRootLoad
                                 )   { /*free(ptr_temp);*/ delete ptr_root; return;  }//
                    }
                    //----------------
                    //delete ptr_temp;
                    //----------------
          }//
          static bool SaveTree(C_TND * ptr_root)
          {         if (ptr_root == NULL)  return false;
                    //
                    {         /* how to save in file */
                    }
                    SaveTree(ptr_root.ptr_Branch_1);
                    //
                    return true;
                    //
          }
          static bool LoadTree(C_TND * ptr_root)
          {         if (ptr_root == NULL)  return false;
                    LoadTree(ptr_root.ptr_Branch_1);
                    //
                    {         /* how to load in file */
                    }
                    //
                    return true;
                    //
          }
          //
};
CPack_tree   Pack_tree;
//+------------------------------------------------------------------+
