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
template<typename t>
class CDSQueue_Double_By_List_Node
{
public:
          t                                data;
          CDSQueue_Double_By_List_Node       *prev, *next; //---used as set fornt prev
          // Function to get a new node
          static CDSQueue_Double_By_List_Node<t>* getNode(t &data)
          {         CDSQueue_Double_By_List_Node<t>* newNode =  new CDSQueue_Double_By_List_Node; //(CDSQueue_Double_List_Node*)malloc(sizeof(CDSQueue_Double_List_Node));
                    newNode.data = data;
                    newNode.prev = newNode.next = NULL;
                    return newNode; //
          } //
};