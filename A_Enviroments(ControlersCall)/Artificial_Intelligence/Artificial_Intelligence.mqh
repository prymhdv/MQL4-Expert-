//+----------------------------------------------------------------------+
//|   Artificial_Intelligence Basics                                     | 
//+----------------------------------------------------------------------+
//+----------------------------------------------------------------------+
//|   Artificial_Intelligence Basics Enviroment Type And Programming     | 
//+----------------------------------------------------------------------+
//---Fully observable vs Partially Observable
//---Static vs Dynamic
//---Discrete vs Continuous
//---Deterministic vs Stochastic
//---Single-agent vs Multi-agent
//---Episodic vs sequential
//---Known vs Unknown
//---Accessible vs Inaccessible
//---Complete vs. Incomplete
//---Deterministic vs Stochastic(random). 
//---Competitive(fight) vs Collaborative(working together).
//+----------------------------------------------------------------------+
//|   Artificial_Intelligence Basics Agent Actor Type And Programming    | 
//+----------------------------------------------------------------------+
//---Simple Reflex Agent
//---Model-based reflex agent
//---Goal-based agents
//---Utility-based agent
//---Learning agent
//+----------------------------------------------------------------------+
//|   Artificial_Intelligence Seek Solution for problem as Optimum Seek  |Search and Optimasing Algoritms
//+----------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_UIS_DFS.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_UIS_DLS.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_UIS_BFS.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_UIS_IDS.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_UIS_BDS.mqh>//---drived from BFS  two search both direction end home root and destination
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_UIS_UCS.mqh>//---drived from BFS ..---lowest deepness answare
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_IS_BFS.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_IS_BFS_8Knight.mqh>        //--constrain satisfinig
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_IS_Greedy_Search.mqh>      //--harisanee -- shortest node path to destination//--informed
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_IS_A_Star.mqh>             //--complex of UCS and Greedy_Search --   minimize all cost to now node with cost remain from now to destination//--informed
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_IS_Hill_Climbing.mqh>      //--the algoritm random access nodes -- can combinate with other//   --local optimum - global optimum
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_IS_Tabu.mqh>               //--the algoritm  change neighnure to set list of way to correct solution in memory space 
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_MHIS_.mqh>              //--the algoritm  meta informed search for solution
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Solution\AI_MHIS_Genetic_Algoritm.mqh>  //--evolotionary algoritms seek for optimum the problem solving.. for hard searchings    evolutionary algorithms (EA
//+-------------------------------------------------------------------------+
//|   Artificial_Intelligence Seek Solution for Lerning Acting as Optimum   |Machine Learning Algorithms
//+-------------------------------------------------------------------------+Machine learning (ML)       
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Learning\AI_MLS_.mqh>   
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Learning\AI_MLS_Supervised_learning.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Learning\AI_MLS_reinforcement_learning.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Learning\AI_MLS_unsupervised_learning.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\Artificial_Intelligence\Learning\AI_MLS_semi_supervised_learning.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
