//+------------------------------------------------------------------+
//||   ||||||||||            Cg_DevObject.mqh                       ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\.B_MQL.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\Cg_DevObject_FiboService.mqh> 
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cg_DevObject
{
//===================================================================
public:
          void                          Cg_DevObject() { /*Alert("Deinit: ", __FUNCSIG__);*/};
          //void                          ~Cg_DevObject() {return;}
          bool                          Update() { Dev_Checkup_Mql.Update(); return true;};
          bool                          UPDATED;
          Sg_MqlObject                  Mql;
          string                        FindObjectByPostfix(const string postfix, const ENUM_OBJECT object_type);//
//===================================================================
          Cg_DevObject_FiboService      FiboService;
//===================================================================
}; ///Cg_DevObject Dev_Object;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string Cg_DevObject::FindObjectByPostfix(const string postfix, const ENUM_OBJECT object_type)
{         int obj_total = ObjectsTotal(0, 0, object_type);
          string name = "";
          bool found = false;
          for (int i = 0; i < obj_total; i++)
          {         name = ObjectName(0, i, 0, object_type);
                    string pattern = StringSubstr(name, StringLen(name) - StringLen(postfix));
                    if (StringCompare(pattern, postfix) == 0) return name; //
          }
          return "";//
}

//+------------------------------------------------------------------+
//||   ||||||||||                Cg_DevObject.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
