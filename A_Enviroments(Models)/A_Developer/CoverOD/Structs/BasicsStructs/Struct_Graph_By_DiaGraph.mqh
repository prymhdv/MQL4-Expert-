//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_Graph_By_AdjListNode.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//Vertex: Each node of the graph is called a vertex. In the above graph, A, B, C, and D are the vertices of the graph.

//Edge: The link or path between two vertices is called an edge. It connects two or more vertices. The different Edges in the above graph are AB, BC, AD, and DC.

//Adjacent node: In a graph, if two nodes are connected by an edge then they are called adjacent nodes or neighbors. In the above graph, vertices A and B are connected by edge AB. Thus A and B are adjacent nodes.

//Degree of the node: The number of Edges that are connected to a particular node is called the degree of the node. In the above graph, node A has a degree 2.

//Path: The sequence of nodes that we need to follow when we have to travel from one vertex to another in a graph is called the path. In our example graph, if we need to go from node A to C, then the path would be A.B.C.

//Closed path: If the initial node is the same as a terminal node, then that path is termed as the closed path.

//Simple path: A closed path in which all the other nodes are distinct is called a simple path.

//Cycle: A path in which there are no repeated Edges or vertices and the first and last vertices are the same is called a cycle. In the above graph, A.B.C.D.A is a cycle.

//Connected Graph: A connected graph is the one in which there is a path between each of the vertices. This means that there is not a single vertex which is isolated or without a connecting edge. The graph shown above is a connected graph.

//Complete Graph: A graph in which each node is connected to another is called the Complete graph. If N is the total number of nodes in a graph then the complete graph contains N(N - 1) / 2 number of Edges.

//Weighted graph: A positive value assigned to each edge indicating its length (distance between the vertices connected by an edge) is called weight. The graph containing weighted Edges is called a weighted graph. The weight of an edge e is denoted by w(e) and it indicates the cost of traversing an edge.

//Diagraph: A digraph is a graph in which every edge is associated with a specific direction and the traversal can be done in specified direction only.
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CDSGraph_By_DiaGraph//not directed 
{         // insert new nodes into adjacency list from given graph
          CDSGraph_By_AdjListNode* getAdjListNode(int value, int weight, CDSGraph_By_AdjListNode* _head)
          {         CDSGraph_By_AdjListNode* newNode = new CDSGraph_By_AdjListNode;
                    newNode.val = value;
                    newNode.cost = weight;
                    newNode.ptr_next = _head;   // point new node to current head
                    return newNode; //
          } //
          //----------------------------------------------------------------------------------
          int Nnum;  // number of nodes in the graph
public:
          //CDSGraph_By_AdjListNode **head;                //adjacency list as array of pointers   //'*' - pointer to pointer is illegal  Advanced_Graph.mqh  55        20
          CDSGraph_By_AdjListNode   *head[];
          // Constructor
          void CDSGraph_By_DiaGraph() {};
          void CDSGraph_By_DiaGraph(CDSGraph_Edge &Edges[], int n, int _N)
          {         // allocate new node
                    //--head = new CDSGraph_By_AdjListNode*[N](); noo need just resize
                    ArrayResize(head, _N);
                    this.Nnum = _N;
                    // initialize head pointer for all vertices
                    for (int idx = 0; idx < _N; ++idx) {  /*--[defaultly are null]--ArrayInitialize(head, NULL);*/ /*head[i] = nullptr;*/} //reset array
                    // construct directed graph by adding Edges to it
                    for (unsigned _i = 0; _i < (unsigned)n; _i++)
                    {         int start_ver  = Edges[_i].start_ver;
                              int end_ver    = Edges[_i].end_ver;
                              int weight     = Edges[_i].weight;
                              // insert in the beginning
                              CDSGraph_By_AdjListNode* newNode = getAdjListNode(end_ver, weight, head[start_ver]);
                              // point head pointer to new node
                              head[start_ver] = newNode; //
                    } //
          }//---------------------------------------------------------------------------------
          // Destructor
          void ~CDSGraph_By_DiaGraph()
          {         //---for (int i = 0; i < N; i++) {delete head;} //{delete[] head[i];}
                    //---delete[] head; //
                    for (int i = 0; i < Nnum; i++) {delete head[i];}//
          } //
          //--------------------------------
          // print all adjacent vertices of given vertex
          void display_AdjList(CDSGraph_By_AdjListNode* ptr, int i)
          {         string Desc;
                    while (ptr != NULL)
                    {         //---cout << "(" << i << ", " << ptr.val << ", " << ptr.cost << ") ";
                              Desc = "(" + (string)i + ", " + (string)ptr.val + ", " + (string)ptr.cost + ") ";
                              Print(Desc);
                              ptr = ptr.ptr_next; //
                    } //
                    //--cout << endl; //
          } //
          //-------------------------------------
          // graph implementation
          int main()//---Array to adjList
          {         // graph Edges array.
                    CDSGraph_Edge Edges[] = {{0, 1, 2 }, {0, 2, 4 }, {1, 4, 3 }, {2, 3, 2 }, {3, 1, 4 }, {4, 3, 3 }};   ///*(x, y, w) . edge from x to y with weight w*/ 
                    int Vertexs = 6;                                                                                    // Number of vertices in the graph
                    int n = sizeof(Edges) / sizeof(Edges[0]);                                                           // calculate number of Edges
                    CDSGraph_By_DiaGraph diagraph(Edges, n, Vertexs);                                            // construct graph
                    // print adjacency list representation of graph
                    //---cout << "Graph adjacency list " << endl << "(start_vertex, end_vertex, weight):" << endl;
                    Print("Graph adjacency list ", "(start_vertex, end_vertex, weight):");//
                    for (int i = 0; i < Vertexs; i++) { display_AdjList(diagraph.head[i], i); }                         // display adjacent vertices of vertex i
                    return 0;//
          }//
};
//Output:
//
//Output:
//
//Graph adjacency list
//
//(start_vertex, end_vertex, weight):
//
//(0, 2, 4) (0, 1, 2)
//
//(1, 4, 3)
//
//(2, 3, 2)
//
//(3, 1, 4)
//
//(4, 3, 3)
