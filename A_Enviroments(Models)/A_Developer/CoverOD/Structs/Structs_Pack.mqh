//+------------------------------------------------------------------+
//||   ||||||||||                 A_DeveloperLib.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ---(((--No Dependency any--)))---
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BasePlane.mqh> //---Check Dependency--(Varibles)
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Bases\.BaseWall.mqh> //---Check Dependency--(ErrorsManager)
//----------------------------------------------------//---Check Dependency--(Medium)
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Object.mqh>               //[USE >>[ BASE OBJECT KNOW PREV NEXT IN MEM ]//StructC_Object _StructC_Object_;          //---base obj
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Node_List.mqh>            //[USE >>[ BASE OBJECT KNOW NEXT IN MEM , KEEP ONE DATA ]  sample+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Node_List_Double.mqh>     //[USE >[ >BASE OBJECT KNOW PREV NEXT IN MEM , KEEP ONE DATA ]  sample+
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_List.mqh>                 //[USE >>BASE STRUCT CAN KEEP AS LIST IN MEM , KEEP ONE OBJECT]//---from base obj
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Stack.mqh>                //[USE >>BASE STRUCT CAN KEEP AS STACK(FILO)(LIFO) IN MEM , KEEP ONE OBJECT]//---from base obj
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Stack_By_Array.mqh>          //[USE >>BASE STRUCT CAN KEEP AS STACK(FILO)(LIFO) IN MEM , KEEP ONE ARRAY]////---from base obj 
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Stack_By_List.mqh>           //[USE >>BASE STRUCT CAN KEEP AS STACK(FILO)(LIFO) IN MEM , KEEP ONE LIST]////---from base obj
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Queue_By_List_Node.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Queue_By_Array.mqh>          //[USE >>BASE STRUCT CAN KEEP AS QUEUE(FIFO)(LILO) IN MEM , KEEP ONE OBJECT]//---from base obj
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Queue_By_List.mqh>           //[USE >>BASE STRUCT CAN KEEP AS QUEUE(FIFO)(LILO) IN MEM , KEEP ONE Node]//---from base obj
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Queue_By_List_Primal.mqh>           //[USE >>BASE STRUCT CAN KEEP AS QUEUE(FIFO)(LILO) IN MEM , KEEP ONE Node]//---from base obj
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Queue_Double_By_List_Node.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Queue_Double_By_List_Primal_Node.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Queue_Double_By_Array.mqh>    //[USE >>BASE STRUCT CAN KEEP AS QUEUE(FIFO)(LILO) IN MEM , KEEP ONE ARRAY]//---from base obj
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Queue_Double_By_List.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Queue_Double_By_List_Primal.mqh>    //[USE >>BASE STRUCT CAN KEEP AS QUEUE(FIFO)(LILO) IN MEM , KEEP ONE ARRAY]//---from base obj
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Array.mqh>                //---from base obj
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_ChartObject.mqh>          //---from base obj            !not data struct
//#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_ChartObjectText.mqh>      //---from base ChartObject    !not data struct
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\struct_NODE_ARRAY_POINTER_ARRAY_DATA.mqh> 
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode.mqh>             //[USE >>BASE STRUCT CAN KEEP AS TreeNode(PARRENT,LEFT,RIGHT) IN MEM , KEEP ONE SELF]//--base tree from base obj
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Tree.mqh>                 //[USE >>BASE STRUCT CAN KEEP AS TreeNode(PARRENT,LEFT,RIGHT) IN MEM , KEEP ONE TreeNode AS ROOT]
//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_Generic.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Tree_Generic.mqh>
//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_ExtendNode.mqh>            // can save load file successfuly as binary file
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_ExtendNode_Generic.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Tree_Generic_Extend.mqh>                 //[USE >>BASE STRUCT CAN KEEP AS TreeNode(PARRENT,LEFT,RIGHT) IN MEM , KEEP ONE TreeNode AS ROOT]
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_Decition.mqh>             //[USE >>BASE STRUCT CAN KEEP AS TreeNode(PARRENT,LEFT,RIGHT) IN MEM , KEEP ONE SELF]//--base tree from base obj
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Tree_Decition.mqh>                 //[USE >>BASE STRUCT CAN KEEP AS TreeNode(PARRENT,LEFT,RIGHT) IN MEM , KEEP ONE TreeNode AS ROOT]
//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_Decition2.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Tree_Decition2.mqh>
//
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_Decition_Micro.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Tree_Decition_Micro.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Tree_Decition_Micro_User-ProtoType.mqh>
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_Decition_Micro_User.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Tree_Decition_Micro_User.mqh>
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Graph_By_AdjListNode.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Graph_By_List.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Graph_By_Matrix.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Graph_By_DiaGraph.mqh>
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\Collection\Struct_Map.mqh>                              //[USE >>BASE STRUCT CAN KEEP AS MAP(KEY,VALUE) IN MEM , KEEP ONE SEVERAL KEYS]//---base objMap
//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\Structs_MQL5_Extend\Struct_SortedMap.mqh>

//+--------------------------------------------------------------------------------------------------+
//| Module ~~ Enviroment ~~ DeveloperLib ~~ Collection Terminal ~~ Mql ~~ Client ~~ Chart            |
//+--------------------------------------------------------------------------------------------------+
class CD_DataStructPack
{
public:
          CD_DataStructPack(void) {};
          ~CD_DataStructPack(void) {};
          //--------------------------------------------------------------------
          //----Developer--------
          CDSObject                             Object;        ///ass node
          CDSList                               List;
          //
          CDSStack_By_Array<int>                Stack_Array;
          CDSStack_By_List_StackNode<int>       Stack_List;
          //
          CDSQueue_By_List<C_TND>               Queue_By_List_obj;
          CDSQueue_By_List_Primal<int>          Queue_By_List_P_int;
          CDSQueue_Double_By_List<C_TND>        Queue_Double_By_List_obj;
          CDSQueue_Double_By_List_Primal<int>   Queue_Double_By_P_int;
          //
          CDSArray                              Array;
          //
          CDSTree                               Tree;
          //
          CDSGraph_By_DiaGraph                  Graph_DiaGraph;
          CDSGraph_By_Matrix                    Graph_Matrix;
          CDSGraph_By_List                      Graph_List;
          //
          CDSMapIter<int, int>                  MapIter(IMap2<int, int> *ptr_map);
          //----MQL5--------
          CDSSortedMap<int, int>                 CD_CSortedMap_int_int;

};
CD_DataStructPack DataStructPack;
//+------------------------------------------------------------------+
//||   ||||||||||                 A_DeveloperLib.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
////+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//      Stacks                                                                                                          Queues
//      Uses LIFO (Last in, First out) approach.                                                                        Uses FIFO (First in, First out) approach.
//      Items are added or deleted from only one end called “Top” of the stack.                                         Items are added from “Rear” end of the queue and are removed from the “front” of the queue.
//      The basic operations for the stack are “push” and “Pop”.                                                        The basic operations for a queue are “enqueue” and “dequeue”.
//      We can do all operations on the stack by maintaining only one pointer to access the top of the stack.           In queues, we need to maintain two pointers, one to access the front of the queue and the second one to access the rear of the queue.
//      The stack is mostly used to solve recursive problems.                                                           Queues are used to solve problems related to ordered processing.
//
//        Applications Of Queue
//        Let us discuss the various applications of the queue data structure below.
//
//        The queue data structure is used in various CPU and disk scheduling. Here we have multiple tasks requiring CPU or disk at the same time. The CPU or disk time is scheduled for each task using a queue.
//        The queue can also be used for print spooling wherein the number of print jobs is placed in a queue.
//        Handling of interrupts in real-time systems is done by using a queue data structure. The interrupts are handled in the order they arrive.
//        Breadth-first search in which the neighboring nodes of a tree are traversed before moving on to next level uses a queue for implementation.
//        Call center phone systems use queues to hold the calls until they are answered by the service representatives.
//        In general, we can say that the queue data structure is used whenever we require the resources or items to be serviced in the order they arrive i.e. First in, First Out.
////+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
