//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*--------------------------------------------------------------------------------------
//-----Depth-First Search Implementation
#include <stdio.h>
#include "graph.h"
#include "stack"
//-----------------
#define A 0
#define B 1
#define C 2
#define D 3
#define E 4
#define F 5
#define G 6
#define H 7
int init_graph(graph_t *g_P)
  {
   addEdge(g_p,A,B,1);
   addEdge(g_p,A,C,1);
   addEdge(g_p,B,D,1);
   addEdge(g_p,C,E,1);
   addEdge(g_p,C,F,1);
   addEdge(g_p,D,G,1);
   addEdge(g_p,D,H,1);
   return 0;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void DFS(graph_t * g_p,int root,int goal)
  {
   int node, to;
   stackj_t *s_p;
   s_p = createStack(10);
   pushStack(s_p,root);
   while(!isEmptyStack(s_p)
  {
   node = popStack(s_p);
      printf("%d\n",node);
      if(node == goal)
         break;
      for(to=g_p-> node-1; to>0; to--)
        {
         if(getEdge(g_p,node,to))
           {
            pushStack(s_p,to);  //
           }
        }
     }
   destroyStack(s_p); return;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int main()
  {
   graph_t *g_p;
   g_p = createGraph(8);
   init_graph(g_p);
   dfs(g_p,0,5);
   destroyGraph(g_p);
   return 0;//
  }

--------------------------------------------------------------------------------------*/

/******************************************************************Depth-First Search Implementation
#include <iostream>
#include <list>
using namespace std;
//graph class for DFS travesal
class DFSGraph
{         int V;    // No. of vertices
          list<int> *adjList;    // adjacency list
          void DFS_util(int v, bool visited[]) // A function used by DFS
          {         // current node v is visited
                    visited[v] = true;
                    cout << v << " ";
                    // recursively process all the adjacent vertices of the node
                    list<int>::iterator i;
                    for(i = adjList[v].begin(); i != adjList[v].end(); ++i)
                              if(!visited[*i])
                                        DFS_util(*i, visited); //
          }
public:
          // class Constructor
          DFSGraph(int V)
          {         this->V = V;
                    adjList = new list<int>[V]; }
          // function to add an edge to graph
          void addEdge(int v, int w)
          {         adjList[v].push_back(w); // Add w to v’s list.
          }

          void DFS()    // DFS traversal function]
          {         // initially none of the vertices are visited
                    bool *visited = new bool[V];
                    for (int i = 0; i < V; i++)
                              visited[i] = false;
                    // explore the vertices one by one by recursively calling  DFS_util
                    for (int i = 0; i < V; i++)
                              if (visited[i] == false)
                                        DFS_util(i, visited); //
          } //
          int main()
          {         // Create a graph
                    DFSGraph gdfs(5);
                    gdfs.addEdge(0, 1);
                    gdfs.addEdge(0, 2);
                    gdfs.addEdge(0, 3);
                    gdfs.addEdge(1, 2);
                    gdfs.addEdge(2, 4);
                    gdfs.addEdge(3, 3);
                    gdfs.addEdge(4, 4);
                    cout << "Depth-first traversal for the given graph:" << endl;
                    gdfs.DFS();
                    return 0; //
          }//
};
*********************************************************************/
//+------------------------------------------------------------------+
/*
// C++ program to print DFS traversal from
// a given vertex in a  given graph
#include <bits/stdc++.h>
using namespace std;

// Graph class represents a directed graph
// using adjacency list representation
class Graph {
public:
    map<int, bool> visited;
    map<int, list<int> > adj;

    // function to add an edge to graph
    void addEdge(int v, int w);

    // DFS traversal of the vertices
    // reachable from v
    void DFS(int v);
};

void Graph::addEdge(int v, int w)
{
    adj[v].push_back(w); // Add w to v’s list.
}

void Graph::DFS(int v)
{
    // Mark the current node as visited and
    // print it
    visited[v] = true;
    cout << v << " ";

    // Recur for all the vertices adjacent
    // to this vertex
    list<int>::iterator i;
    for (i = adj[v].begin(); i != adj[v].end(); ++i)
        if (!visited[*i])
            DFS(*i);
}

// Driver's code
int main()
{
    // Create a graph given in the above diagram
    Graph g;
    g.addEdge(0, 1);
    g.addEdge(0, 2);
    g.addEdge(1, 2);
    g.addEdge(2, 0);
    g.addEdge(2, 3);
    g.addEdge(3, 3);

    cout << "Following is Depth First Traversal"
            " (starting from vertex 2) \n";

    // Function call
    g.DFS(2);

    return 0;
}

// improved by Vishnudev C
*/
