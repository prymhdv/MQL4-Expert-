//+------------------------------------------------------------------+
//||   ||||||||||                 A_Developer.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
/*
 As Tree Node Can Handel Save Load SingleNode Documention
 As Tree Node Can Handel Access Branches
 As Tree Node Can Handel Oprate Any Request implanted

*/
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
class CDS_NODE_ARRAY_POINTER_ARRAY_DATA
{
private:
          int BrachSize;
public:
          CDS_NODE_ARRAY_POINTER_ARRAY_DATA(void) {BrachSize = 0;};
          CDS_NODE_ARRAY_POINTER_ARRAY_DATA(int s, int di, int dis, string ds, int dss)
          {         BrachSize = s;
                    ArrayResize(BRANCHS, BrachSize);
                    ArrayResize(Data_int, dis);
                    Data_int[0] = di; 
                    ArrayResize(Data_string, dss);
                    Data_string[0] = ds; 
                    //
          };
          ~CDS_NODE_ARRAY_POINTER_ARRAY_DATA(void)
          {         for(int i = 0; i < ArraySize(BRANCHS); i++)
                    {         if(BRANCHS[i])
                                        delete BRANCHS[i]; //
                    } //
          }; //
          //-----------------------access public
          CDS_NODE_ARRAY_POINTER_ARRAY_DATA *BRANCHS[];
          //-----------------------
          int    Data_int[];
          string Data_string[];
          //-----------------------
};
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
