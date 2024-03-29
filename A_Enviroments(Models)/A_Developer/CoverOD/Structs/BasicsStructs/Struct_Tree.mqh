//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//|                                                         Tree.mqh |
//|                   Copyright 2009-2013, MetaQuotes Software Corp. |
//|                                              http://www.mql4.com |
//+------------------------------------------------------------------+
//#include  "TreeNodeAdvanced.mqh"
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode.mqh>
//+---------------------------------------------------------------------------+
//| Class CDSTree.                                                     |
//| Purpose: Building a binary tree of instances of CDSTreeNode class  |
//|          and its derviatives.                                             |
//|          Derives from class CDSTreeNode.                           |
//+---------------------------------------------------------------------------+
class CDSTree : public CDSTreeNode
{
protected:
          CDSTreeNode        *m_root_node;        // root node of the tree

public:
          //Constructor
          CDSTree(void) {};
          ~CDSTree(void) { Clear(); };

          //--- methods of access to protected data
          CDSTreeNode        *Root(void) const { return(m_root_node); }
          //--- method of identifying the object
          virtual int       Type() const { return(0x9999); }
          //--- method of filling the tree
          virtual CDSTreeNode        *Insert(CDSTreeNode *new_node);
          //--- methods of removing tree nodes
          bool Detach(CDSTreeNode *node);
          bool Delete(CDSTreeNode *node) /*Method of removing a node from the tree*/
          {         if(!CheckPointer(node)) return(false);                                //--- check
                    if(Detach(node) && CheckPointer(node) == POINTER_DYNAMIC) delete node;//--- delete
                    return(true);                                                         //--- successful
          };
          void Clear(void) /* Method of cleaning the tree*/
          {         if(CheckPointer(m_root_node) == POINTER_DYNAMIC) delete m_root_node;
                    m_root_node = NULL;//
          }
          ;
          //--- method of searching data in the tree
          CDSTreeNode        *Find(const CDSTreeNode *node);//---traverse
          //--- method to create elements in the tree
          virtual CDSTreeNode *CreateElement() { return(NULL); }
          //--- methods for working with files
          //virtual bool      Save(const int file_handle)
          virtual bool Save(const int file_handle)
          {         //--- check
                    if(file_handle == INVALID_HANDLE)   return(false);
                    if(m_root_node == NULL)             return(true);
                    //--- result
                    return(m_root_node.SaveNode(file_handle)); //
          }
          //virtual bool      Load(const int file_handle);
          virtual bool Load(const int file_handle)
          {         //--- check
                    if(file_handle == INVALID_HANDLE)   return(false);
                    //--- create root node only
                    Clear();
                    Insert(CreateElement());
                    //--- result
                    return(m_root_node.LoadNode(file_handle, m_root_node));//
          }

protected:
          void              Balance(CDSTreeNode *node); //
};
//+------------------------------------------------------------------+
//| Method of adding a node to the tree                              |
//+------------------------------------------------------------------+
CDSTreeNode *CDSTree::Insert(CDSTreeNode *new_node)
{         CDSTreeNode *p_node;
          CDSTreeNode *result = m_root_node;
          //--- check
          if(!CheckPointer(new_node))
                    return(NULL);
          //--- add
          if(result != NULL)
          {         p_node = NULL;
                    result = m_root_node;
                    while(result != NULL && result.Compare(new_node) != 0)
                    {         p_node = result;
                              result = result.GetNext(new_node); }
                    if(result != NULL)
                              return(result);
                    if(p_node.Compare(new_node) > 0)
                              p_node.Left(new_node);
                    else
                              p_node.Right(new_node);
                    new_node.Parent(p_node);
                    Balance(p_node); }
          else
                    m_root_node = new_node;
          //--- result
          return(result);//
}
//+------------------------------------------------------------------+
//| Method of detaching node from the tree                           |
//+------------------------------------------------------------------+
bool CDSTree::Detach(CDSTreeNode *node)
{         CDSTreeNode *curr_node, *tmp_node;
          CDSTreeNode *nodeA, *nodeB;
          //--- check
          curr_node = node;
          if(!CheckPointer(curr_node))
                    return(false);
          //--- detach
          if(curr_node.BalanceL() > curr_node.BalanceR())
          {         nodeA = curr_node.Left();
                    while(nodeA.Right() != NULL)
                              nodeA = nodeA.Right();
                    nodeB = nodeA.Parent();
                    if(nodeB != curr_node)
                    {         nodeB.Right(nodeA.Left());
                              tmp_node = nodeB.Right();
                              if(tmp_node != NULL)
                                        tmp_node.Parent(nodeB);
                              tmp_node = curr_node.Left();
                              nodeA.Left(tmp_node);
                              tmp_node.Parent(nodeA); }
                    //--- left link of curr_node is already installed as it should be
                    curr_node.Left(NULL);
                    //--- transferring the right link of curr_node to nodeA
                    nodeA.Right(curr_node.Right());
                    tmp_node = curr_node.Right();
                    if(tmp_node != NULL)
                              tmp_node.Parent(nodeA);
                    curr_node.Right(NULL);
                    //--- transferring the root link of curr_node to nodeA
                    tmp_node = curr_node.Parent();
                    nodeA.Parent(tmp_node);
                    if(tmp_node != NULL)
                    {         if(tmp_node.Left() == curr_node)
                                        tmp_node.Left(nodeA);
                              else
                                        tmp_node.Right(nodeA);//
                    }
                    else
                    {         curr_node.Parent(NULL);
                              m_root_node = nodeA;
                              tmp_node = nodeA; }
                    Balance(tmp_node); }
          else
          {         if(curr_node.BalanceR() > 0)
                    {         nodeA = curr_node.Right();
                              while(nodeA.Left() != NULL)
                                        nodeA = nodeA.Left();
                              nodeB = nodeA.Parent();
                              if(nodeB != curr_node)
                              {         nodeB.Left(nodeA.Right());
                                        tmp_node = nodeB.Left();
                                        if(tmp_node != NULL)
                                                  tmp_node.Parent(nodeB);
                                        tmp_node = curr_node.Right();
                                        nodeA.Right(tmp_node);
                                        tmp_node.Parent(nodeA); //
                              }
                              //--- right link of curr_node is already installed as it should be
                              curr_node.Right(NULL);
                              //--- transferring the left link of curr_node to nodeA
                              nodeA.Left(curr_node.Left());
                              tmp_node = curr_node.Left();
                              if(tmp_node != NULL)
                                        tmp_node.Parent(nodeA);
                              curr_node.Left(NULL);
                              //--- transferring the root link of curr_node to nodeA
                              tmp_node = curr_node.Parent();
                              nodeA.Parent(tmp_node);
                              if(tmp_node != NULL)
                              {         if(tmp_node.Left() == curr_node)
                                                  tmp_node.Left(nodeA);
                                        else
                                                  tmp_node.Right(nodeA);//
                              }
                              else
                              {         curr_node.Parent(NULL);
                                        m_root_node = nodeA;
                                        tmp_node = nodeA; }
                              Balance(tmp_node); }
                    else
                    {         //--- node list
                              if(curr_node.Parent() == NULL)
                                        m_root_node = NULL;
                              else
                              {         tmp_node = curr_node.Parent();
                                        if(tmp_node.Left() == curr_node)
                                                  tmp_node.Left(NULL);
                                        else
                                                  tmp_node.Right(NULL);
                                        curr_node.Parent(NULL); //
                              }
                              Balance(curr_node.Parent()); //
                    }//
          }
          //--- successful
          return(true); //
}
//+------------------------------------------------------------------+
//| Method of searching for a node in the tree                       |
//+------------------------------------------------------------------+
CDSTreeNode *CDSTree::Find(const CDSTreeNode *node)
{         CDSTreeNode *result = m_root_node;
          /* find*/while(result != NULL && result.Compare(node) != 0)result = result.GetNext(node);
          /*result*/return(result); //
}
//+------------------------------------------------------------------+
//| Method of balancing the tree                                     |
//+------------------------------------------------------------------+
void CDSTree::Balance(CDSTreeNode *node)
{         CDSTreeNode *nodeA, *nodeB, *nodeC, *curr_node, *tmp_node;
          //---
          curr_node = node;
          while(curr_node != NULL)
          {         curr_node.RefreshBalance();
                    if(MathAbs(curr_node.BalanceL() - curr_node.BalanceR()) <= 1)
                              curr_node = curr_node.Parent();
                    else
                    {         if(curr_node.BalanceR() > curr_node.BalanceL())
                              {         //--- rotation to the right
                                        tmp_node = curr_node.Right();
                                        if(tmp_node.BalanceL() > tmp_node.BalanceR())
                                        {         //--- great rotation to the right
                                                  nodeA = curr_node;
                                                  nodeB = nodeA.Right();
                                                  nodeC = nodeB.Left();
                                                  nodeC.Parent(nodeA.Parent());
                                                  tmp_node = nodeC.Parent();
                                                  if(tmp_node != NULL)
                                                  {         if(tmp_node.Right() == nodeA)
                                                                      tmp_node.Right(nodeC);
                                                            else
                                                                      tmp_node.Left(nodeC); }
                                                  else
                                                            m_root_node = nodeC;
                                                  nodeA.Parent(nodeC);
                                                  nodeB.Parent(nodeC);
                                                  nodeA.Right(nodeC.Left());
                                                  tmp_node = nodeA.Right();
                                                  if(tmp_node != NULL)
                                                            tmp_node.Parent(nodeA);
                                                  nodeC.Left(nodeA);
                                                  nodeB.Left(nodeC.Right());
                                                  tmp_node = nodeB.Left();
                                                  if(tmp_node != NULL)
                                                            tmp_node.Parent(nodeB);
                                                  nodeC.Right(nodeB);
                                                  if(m_root_node == nodeA)
                                                            m_root_node = nodeC;
                                                  curr_node = nodeC.Parent(); }
                                        else
                                        {         //--- slight rotation to the right
                                                  nodeA = curr_node;
                                                  nodeB = nodeA.Right();
                                                  nodeB.Parent(nodeA.Parent());
                                                  tmp_node = nodeB.Parent();
                                                  if(tmp_node != NULL)
                                                  {         if(tmp_node.Right() == nodeA)
                                                                      tmp_node.Right(nodeB);
                                                            else
                                                                      tmp_node.Left(nodeB); }
                                                  else
                                                            m_root_node = nodeB;
                                                  nodeA.Parent(nodeB);
                                                  nodeA.Right(nodeB.Left());
                                                  tmp_node = nodeA.Right();
                                                  if(tmp_node != NULL)
                                                            tmp_node.Parent(nodeA);
                                                  nodeB.Left(nodeA);
                                                  if(m_root_node == nodeA)
                                                            m_root_node = nodeB;
                                                  curr_node = nodeB.Parent(); } }
                              else
                              {         //--- rotation to the left
                                        tmp_node = curr_node.Left();
                                        if(tmp_node.BalanceR() > tmp_node.BalanceL())
                                        {         //--- great rotation to the left
                                                  nodeA = curr_node;
                                                  nodeB = nodeA.Left();
                                                  nodeC = nodeB.Right();
                                                  nodeC.Parent(nodeA.Parent());
                                                  tmp_node = nodeC.Parent();
                                                  if(tmp_node != NULL)
                                                  {         if(tmp_node.Right() == nodeA)
                                                                      tmp_node.Right(nodeC);
                                                            else
                                                                      tmp_node.Left(nodeC); }
                                                  else
                                                            m_root_node = nodeC;
                                                  nodeA.Parent(nodeC);
                                                  nodeB.Parent(nodeC);
                                                  nodeA.Left(nodeC.Right());
                                                  tmp_node = nodeA.Left();
                                                  if(tmp_node != NULL)
                                                            tmp_node.Parent(nodeA);
                                                  nodeC.Right(nodeA);
                                                  nodeB.Right(nodeC.Left());
                                                  tmp_node = nodeB.Right();
                                                  if(tmp_node != NULL)
                                                            tmp_node.Parent(nodeB);
                                                  nodeC.Left(nodeB);
                                                  if(m_root_node == nodeA)
                                                            m_root_node = nodeC;
                                                  curr_node = nodeC.Parent(); }
                                        else
                                        {         //--- small rotation to the left
                                                  nodeA = curr_node;
                                                  nodeB = nodeA.Left();
                                                  nodeB.Parent(nodeA.Parent());
                                                  tmp_node = nodeB.Parent();
                                                  if(tmp_node != NULL)
                                                  {         if(tmp_node.Right() == nodeA)
                                                                      tmp_node.Right(nodeB);
                                                            else
                                                                      tmp_node.Left(nodeB); }
                                                  else
                                                            m_root_node = nodeB;
                                                  nodeA.Parent(nodeB);
                                                  nodeA.Left(nodeB.Right());
                                                  tmp_node = nodeA.Left();
                                                  if(tmp_node != NULL)
                                                            tmp_node.Parent(nodeA);
                                                  nodeB.Right(nodeA);
                                                  if(m_root_node == nodeA)
                                                            m_root_node = nodeB;
                                                  curr_node = nodeB.Parent(); //
                                        } //
                              } //
                    } //
          } //
}
//+------------------------------------------------------------------+
