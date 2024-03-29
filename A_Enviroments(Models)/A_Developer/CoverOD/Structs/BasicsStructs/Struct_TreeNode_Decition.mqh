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
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode.mqh>

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t, typename t2>
class CDSTreeNode_decition: public CDSTreeNode
{

private:
          CDSTreeNode_decition<t, t2>        *m_p_node;            // link to node up
          CDSTreeNode_decition<t, t2>        *m_l_node;            // link to node left
          CDSTreeNode_decition<t, t2>        *m_m_node;            // link to node middle
          CDSTreeNode_decition<t, t2>        *m_r_node;            // link to node right
          //------------------------------------------------
          CDSTreeNode_decition<t, t2>        *m_l2_node;            // link to node left2
          CDSTreeNode_decition<t, t2>        *m_r2_node;            // link to node right2
          CDSTreeNode_decition<t, t2>        *m_l3_node;            // link to node left3
          CDSTreeNode_decition<t, t2>        *m_r3_node;            // link to node right3
          CDSTreeNode_decition<t, t2>        *m_l4_node;            // link to node left4
          CDSTreeNode_decition               *m_r4_node;             // link to node right4  //--no diff  <t,t2>  say or not
          //------------------------------------------------
          CDSTreeNode_decition<t, t2>        *m_s_node;            // link to node self

public:
          CDSTreeNode_decition(t value): m_p_node(NULL), m_l_node(NULL), m_r_node(NULL), m_l2_node(NULL), m_r2_node(NULL), m_l3_node(NULL), m_r3_node(NULL), m_l4_node(NULL), m_r4_node(NULL) {Value = value; ID++;};
          CDSTreeNode_decition(void): m_p_node(NULL), m_l_node(NULL), m_r_node(NULL), m_l2_node(NULL), m_r2_node(NULL), m_l3_node(NULL), m_r3_node(NULL), m_l4_node(NULL), m_r4_node(NULL) {ID++;};
          ~ CDSTreeNode_decition(void) {ID--;}; //

          //--- methods of access to protected data
          CDSTreeNode_decition*               Parent(void)                                            const   { return(m_p_node); }
          void                                          Parent(CDSTreeNode_decition<t, t2> *node)                 { m_p_node = node;  }
          CDSTreeNode_decition<t, t2>*        Left(void)                                          /*const*/   { if(Left().Value) {m_l_node = Left();} else if(Right().Value) {m_l_node = Right();}  return(m_l_node); }
          void                                          Left(CDSTreeNode_decition<t, t2> *node)                  { m_l_node = node; /*return(m_l_node);*/} //--assign pointer to pointer  and return pointer
          CDSTreeNode_decition*               Middle(void)                            /* not depend const*/   { return(m_m_node); }
          void                                          Middle(CDSTreeNode_decition<t, t2> *node)                { m_m_node = node;  }
          //
          CDSTreeNode_decition*               Right(void)                                         /*const*/   { if(Left().Value) {m_r_node = Left();} else if(Right().Value) {m_r_node = Right();} return(m_r_node); }
          void                                          Right(CDSTreeNode_decition<t, t2> *node)                  { m_r_node = node;  }
          CDSTreeNode_decition*               Left2(void)                                             const   { return(m_l2_node);}
          void                                          Left2(CDSTreeNode_decition<t, t2> *node)                  { m_l2_node = node; }
          CDSTreeNode_decition*               Right2(void)                                            const   { return(m_r2_node);}
          void                                          Right2(CDSTreeNode_decition<t, t2> *node)                 { m_r2_node = node; }
          CDSTreeNode_decition*               Left3(void)                                             const   { return(m_l3_node);}
          void                                          Left3(CDSTreeNode_decition<t, t2> *node)                  { m_l3_node = node; }
          CDSTreeNode_decition*               Right3(void)                                            const   { return(m_r3_node);}
          void                                          Right3(CDSTreeNode_decition<t, t2> *node)                 { m_r3_node = node; }
          CDSTreeNode_decition*               Left4(void)                                             const   { return(m_l4_node);}
          void                                          Left4(CDSTreeNode_decition<t, t2> *node)                  { m_l4_node = node; }
          CDSTreeNode_decition*               Right4(void)                                            const   { return(m_r4_node);}
          void                                          Right4(CDSTreeNode_decition<t, t2> *node)                 { m_r4_node = node; }
          //------------------------------------------------
          CDSTreeNode_decition*               Self(void)                                            const      { return(m_s_node);}
          void                                          Self(CDSTreeNode_decition<t, t2> *node)                 { m_s_node = node; }
          //------------------------------------------------
          void set(t value) {Value = value;};
          t Value;//
          double valueDBL;///for casting//no need template sizeof()detect type
          string FristName;
          string LastName;
          string RaceName;
          string PhoneNumber;
          string FathrName;
          string MotherName;
          string FunctionalityName;

          static St_LineSence_Block    _LineSence_Blocks_Tree[40000];
          static int ID; //
          //------------------------------------------------
          static CDSTreeNode_decition *newNode(t value) //---set value and return the node
          {         CDSTreeNode_decition * node = new CDSTreeNode_decition<t, t2>();
                    node.Value = value;
                    node.m_l_node = node.m_m_node = node.m_r_node = node.m_l2_node = node.m_r2_node = node.m_l3_node = node.m_r3_node = node.m_l4_node = node.m_r4_node = NULL;
                    return(node);//
          } //
          static void Levelorder2(CDSTreeNode_decition<t, t2> *nodeInp, int level)
          {         //
                    if(nodeInp == NULL) { return; }
                    //---core node opration
                    {         //set[0]= node.Value;
                              //Stack_t.push(nodeInp.Value);
                              Update(nodeInp);//
                    }
                    if(level == 0) { return; }
                    if(level > 2)
                    {         Levelorder2(nodeInp.Left(),  level - 1);
                              Levelorder2(nodeInp.Right(),  level - 1);
                              return; //
                    }
                    //
                    return;//
          }
          static void Levelorder(CDSTreeNode_decition * nodeInp, t &set[], CDSStack_By_Array<t> &Stack_t, int level)
          {         //
                    if(nodeInp == NULL) { return; }
                    //---core node opration
                    {         //set[0]= node.Value;
                              Stack_t.push(nodeInp.Value);
                              Update(nodeInp);//
                    }
                    if(level == 0) { return; }
                    if(level > 2)
                    {         Levelorder(nodeInp.Left(), set, Stack_t, level - 1);
                              Levelorder(nodeInp.Right(), set, Stack_t, level - 1);
                              return; //
                    }
                    //
                    return;//
          }
          static void Inorder(CDSTreeNode_decition * node, t &set[], CDSStack_By_Array<t2> &Stack_t)
          {         //
                    if(node == NULL) { return; }
                    Inorder(node.Left(), set, Stack_t);
                    //---core node opration
                    {         //set[0]= node.Value;
                              Stack_t.push(node.Value);
                              Update(node);//
                    }
                    Inorder(node.Right(), set, Stack_t);
                    //
                    return;//
          }
          static void Postorder(CDSTreeNode_decition * node, t &set[], CDSStack_By_Array<t2> &Stack_t)
          {         //
                    if(node == NULL) { return; }
                    Postorder(node.Left(), set, Stack_t);
                    Postorder(node.Right(), set, Stack_t);
                    //---core node opration
                    {         //set[0]= node.Value;
                              Stack_t.push(node.Value);
                              Update(node);//
                    }
                    //
                    return;//
          }
          static void Preorder(CDSTreeNode_decition * node, t &set[], CDSStack_By_Array<t2> &Stack_t)
          {         //
                    if(node == NULL) { return; }
                    //---core node opration
                    {         //set[0]= node.Value;
                              Stack_t.push(node.Value);
                              Update(node);//
                    }
                    Preorder(node.Left(), set, Stack_t);
                    Preorder(node.Right(), set, Stack_t);
                    //
                    return;//
          }
          static void Update(CDSTreeNode_decition<t, t2> *nodeInp)
          {         _LineSence_Blocks_Tree[nodeInp.ID].SET_INFO(_LineSence_Blocks_Tree, __LINE__, OP_VOID, 0, 0, 0, 0, 0, "XL-XW", EBlock_VOID); //
          }

          //

};
template<typename t, typename t2>
int CDSTreeNode_decition::ID = 0;
template<typename t, typename t2>
St_LineSence_Block CDSTreeNode_decition::_LineSence_Blocks_Tree[40000];
//+------------------------------------------------------------------+
interface INode
{




};

//+------------------------------------------------------------------+
