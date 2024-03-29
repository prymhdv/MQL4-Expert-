//+------------------------------------------------------------------+
//||   ||||||||||                 Graphical_Object_Base.mqh         || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOA\St_CDI_Custom_ZigZag.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename T_PointCount>
struct Sg_Shape_
{         string name;
          int           PointCount;
          int           WaveCount;
          Sg_Wave_      _Wave_[];
          St_CDI_CZZ    _ZigZags_12_5_3_Current;
//
          Sg_Shape_() {};
          Sg_Shape_(int pc, ENUM_TIMEFRAMES f)
          {         ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
                    St_CDI_CZZ         _ZigZags_(false,"_ZZ_sahpe" + EnumToString(f), 12, 5, 3, f, NULL, 0, 0, 5, 3);   _ZigZags_12_5_3_Current = _ZigZags_; //   , 10, 200
                    PointCount = pc;   WaveCount = PointCount - 1;
                    ArrayResize(_Wave_, WaveCount);
                    for(int i = 0; i < WaveCount; i++)
                    {         _Wave_[i].SetUp(f, _ZigZags_12_5_3_Current._CZZ_Point[i + 1]._Shift, _ZigZags_12_5_3_Current._CZZ_Point[i + 1]._Price, _ZigZags_12_5_3_Current._CZZ_Point[i + 1]._Time, _ZigZags_12_5_3_Current._CZZ_Point[i]._Shift, _ZigZags_12_5_3_Current._CZZ_Point[i]._Price, _ZigZags_12_5_3_Current._CZZ_Point[i]._Time, _Wave_[i + 0], _Wave_[i]);
                              //
                    }
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "Ct_DevCondicator Error",  __LINE__, __FUNCTION__); //|
          }


};
Sg_Shape_<int> g_Shape_Com;
//+------------------------------------------------------------------+
