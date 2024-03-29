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
//|                                                Graph_AdjList.mqh |
//|                   Copyright 2009-2013, MetaQuotes Software Corp. |
//|                                              http://www.mql4.com |
//+------------------------------------------------------------------+
// A C Program to demonstrate adjacency list // representation of graphs
// A structure to represent an adjacency list node
class SD_Graph_AdjListNode
{
public:
          int dest; double Cost;
          SD_Graph_AdjListNode* ptr_next;// class type expected, pointer to type 'SD_Graph_AdjListNode' is not allowed  Advanced_Graph.mqh  20        31  not alow struct

};

// A structure to represent an adjacency list
class SD_Graph_AdjList
{
public:
          SD_Graph_AdjListNode* ptr_head;//
};

// A structure to represent a graph. A graph
// is an ptr_array of adjacency lists.
// Size of ptr_array will be V (number of vertices
// in graph)
class CDSGraph_By_List
{
public:
          int Vertexs;
          //--! SD_Graph_AdjList* ptr_array[];//
          SD_Graph_AdjList  ptr_array[];//

          // A utility function to create a new adjacency list node
          SD_Graph_AdjListNode* newAdjListNode(int dest)
          {         SD_Graph_AdjListNode* ptr_newNode   = new SD_Graph_AdjListNode();
                    ptr_newNode.dest                    = dest;
                    ptr_newNode.ptr_next                = NULL;
                    return ptr_newNode;//
          }//-------------------------------------------------------------------------------------------------------------------------
          // A utility function that creates a graph of V vertices
          CDSGraph_By_List* createGraph(int _V) //class type expected, pointer to type 'CDSGraph_By_List' is not allowed       Advanced_Graph.mqh  47        9
          {         CDSGraph_By_List* graph  = (CDSGraph_By_List*) new  CDSGraph_By_List();//--casting
                    graph.Vertexs = _V;
                    // Create an ptr_array of adjacency lists.  Size of ptr_array will be V
                    //graph.ptr_array =ArrayCopy(SD_Graph_AdjList*)( _V * sizeof(SD_Graph_AdjList));
                    //
                    ArrayResize(graph.ptr_array, _V);
                    // Initialize each adjacency list as empty by making ptr_head as NULL
                    for (int i = 0; i < _V; ++i)
                    {         // if(!CheckPointer(graph.ptr_array[i])) continue;
                              graph.ptr_array[i].ptr_head = NULL;  //--defaultly null
                              //
                    }
                    return graph;//
          }
          //-------------------------------------------------------------------------------------------------------------------------
          // Adds an edge to an undirected graph
          void addEdge( CDSGraph_By_List* graph, int src, int dest)//'Graph' - struct cannot be defined in parameters list          Advanced_Graph.mqh  64        21
          {         // Add an edge from src to dest.  A new node is added to the adjacency list of src.  The node is added at the beginning
                    SD_Graph_AdjListNode* ptr_check   = NULL;
                    SD_Graph_AdjListNode* ptr_newNode = NULL;//------------------------------------------------
                    ptr_newNode = newAdjListNode(dest);
                    //
                    // if(!CheckPointer(graph.ptr_array[src])) return;
                    if (graph.ptr_array[src].ptr_head == NULL) //--is empty
                    {         ptr_newNode.ptr_next = graph.ptr_array[src].ptr_head;
                              graph.ptr_array[src].ptr_head = ptr_newNode; //
                    } //
                    else
                    {         ptr_check = graph.ptr_array[src].ptr_head;
                              while (ptr_check.ptr_next != NULL)        { ptr_check = ptr_check.ptr_next; } //
                              // graph.ptr_array[src].ptr_head = newNode;
                              ptr_check.ptr_next = ptr_newNode; //
                    } //
                    // Since graph is undirected, add an edge from // dest to src also
                    ptr_newNode = newAdjListNode(src);//-------------------------------------------------------------
                    // if(!CheckPointer(graph.ptr_array[dest])) return;
                    if (graph.ptr_array[dest].ptr_head == NULL)//--is empty
                    {         ptr_newNode.ptr_next = graph.ptr_array[dest].ptr_head;
                              graph.ptr_array[dest].ptr_head = ptr_newNode; //
                    }
                    else
                    {         ptr_check = graph.ptr_array[dest].ptr_head;
                              while (ptr_check.ptr_next != NULL)  { ptr_check = ptr_check.ptr_next; } //
                              ptr_check.ptr_next = ptr_newNode; //
                    }
                    // newNode = newAdjListNode(src);
                    // newNode.ptr_next = graph.ptr_array[dest].ptr_head;
                    // graph.ptr_array[dest].ptr_head = newNode;
          }//-------------------------------------------------------------------------------------------------------------------------
          // A utility function to print the adjacency list representation of graph
          void printGraph(CDSGraph_By_List* graph)
          {         string Desc;
                    for (int v = 0; v < graph.Vertexs; ++v)
                    {         // if(!CheckPointer(graph.ptr_array[v])) continue;
                              SD_Graph_AdjListNode* ptr_pCrawl = graph.ptr_array[v].ptr_head;
                              //Print("Adjacency list of vertex %d\n ptr_head ", v);
                              Desc = "";
                              while (ptr_pCrawl)
                              {         //Print(". %d", ptr_pCrawl.dest);
                                        //Print(  (string)ptr_pCrawl.dest);
                                        Desc += (string)ptr_pCrawl.dest + "->"; //
                                        ptr_pCrawl = ptr_pCrawl.ptr_next; //
                              } //
                              Print("Adjacency list of vertex: ", (string)v, " ", "ptr_head-> ", Desc);
                              //--Print("\n"); //
                    } //
          }//-------------------------------------------------------------------------------------------------------------------------
          // Driver program to test above functions
          int main()
          {         // create the graph given in above figure
                    int _Vertexs = 5;
                    CDSGraph_By_List* ptr_graph = createGraph(_Vertexs);
                    addEdge(ptr_graph, 0, 1);
                    addEdge(ptr_graph, 0, 4);
                    addEdge(ptr_graph, 1, 2);
                    addEdge(ptr_graph, 1, 3);
                    addEdge(ptr_graph, 1, 4);
                    addEdge(ptr_graph, 2, 3);
                    addEdge(ptr_graph, 3, 4);
                    // print the adjacency list representation of the above  graph
                    printGraph(ptr_graph);
                    return 0;//
          }//
          //-------------------------------------------------------------------------------------------------------------------------
};


//Output
// Adjacency list of vertex 0
// head -> 1-> 4                  ////!!! head is vertex 0
//
// Adjacency list of vertex 1
// head -> 0-> 2-> 3-> 4          ////!!! head is vertex 1
//
// Adjacency list of vertex 2
// head -> 1-> 3                  ////!!! head is vertex 2
//
// Adjacency list of vertex 3
// head -> 1-> 2-> 4              ////!!! head is vertex 3 
//
// Adjacency list of vertex 4
// head -> 0-> 1-> 3              ////!!! head is vertex 4







//+------------------------------------------------------------------+
