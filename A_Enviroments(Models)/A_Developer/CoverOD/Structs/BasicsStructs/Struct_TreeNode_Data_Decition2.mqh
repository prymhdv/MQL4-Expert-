//+------------------------------------------------------------------+
//||   ||||||||||                 BaseDoor.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    |||
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+pre define clases
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\Structs\BasicsStructs\Struct_TreeNode_File_Decition2.mqh>
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
class C_TNSD//: public C_TNSD_File//'C_TNSD' - class cannot be inherited from struct      Struct_TreeNode_Data_Decition2.mqh      14        7
{
public:   /*member variable*/
          //C_TNSD * Branchs[];
          bool       Branchs_bool[];
          //bool       Branchs_Enum1[];
          //bool       Branchs_Enum2[];
          //---------------------------------------------
          //static int Answers[10][10][10][10];///WinBuy WinSell LossBuy LossSell
          //---------------------------------------------
          static int TOTAL;
          int        Id;
          string     name;
          string     namePath;
          string     namePathID;
          bool       Activated;
          //---------------------------------------------
          //C_TNSD_File * TNSD_File;  //class type expected, pointer to type 'C_TNSD_File' is not allowed       Struct_TreeNode_Data_Decition2.mqh      30        23
          C_TNSD_File   TNSD_File;
          //---------------------------------------------
          //St_LineSence_Block BLOCK_TREE_SENCE[10000];//--its afwful that each node has 10000 of nothing
          //St_LineSence_Block BLOCK_TREE_SENCE_Single;
          //---------------------------------------------
public:    /*constractor*/
          C_TNSD()              {/*TNSD_File = new C_TNSD_File;*/    TOTAL++; Id = TOTAL; }; //from param
          //C_TNSD(int id)        {/*TNSD_File = new C_TNSD_File;*/    TOTAL++; /*Id = Count++;*/  Id = id;  Id = TOTAL; TNSD_File.Id = TOTAL;/*TNSD_File.Id = id;*/   }; //from param
          ~C_TNSD()             {/*delete TNSD_File;*/             --TOTAL;  Id = TOTAL;  TNSD_File.Id = TOTAL;     /*Id = Count--;*/ };
          //
public:    /*Operation*/

          void OPRATE_Trade(C_TND &TND, double globalPathNumChoosen) //---by seprate data cant access runner data functions but same as tnsd2 data members //--can parameter C_TNSD *& obj_Self_Pocket
          {         //
                    //if(GlobalPathNumChoosen != TNSD_File.IDPath ) { Alert("Undefine path id calling");  }
                    //if(GlobalPathNumChoosen !=  IDPath ) { Alert("Undefine path id calling");  }error
                    {         //-------------------------------------------------
                              /* Virtual trade info and optimation when is leaf*/
                              //-------------------------------------------------
                              TNSD_File.RunTrade(TND, C_TD2::TreeProfitedTotal); //
                    } //
          }

          void OPRATE(string superName, string _IDPath)   { /*if(TNSD_File.IsLeaf)*/ { GlobalPathNumChoosen = TNSD_File.IDPath = (int)StringToInteger(_IDPath); namePathID = _IDPath;    namePath = superName; } } //
          void Trade_Choosen(C_TND &TND, double globalPathNumChoosen) { OPRATE_Trade(TND, globalPathNumChoosen); } //---by seprate data cant access runner data functions but same as tnsd2 data members //--can parameter self

          //
};
int C_TNSD::TOTAL = 0;

//+------------------------------------------------------------------+
