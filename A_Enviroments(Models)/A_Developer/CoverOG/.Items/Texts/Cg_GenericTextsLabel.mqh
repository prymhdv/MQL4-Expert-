//+------------------------------------------------------------------+
//|                        Cg_GenericTextsdata.mqh                  |
//+------------------------------------------------------------------+
//||   ||||||||||               Cg_DevObjectPack.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsTxtControls.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Controls\Label.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\oTextsLabel.mqh>; 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cg_GenericTextsLabel
{

public:
//===================================================================
          ///---ProxyGlobal
          CLabel                cLabel;//ClasSg_LABEL     // --- class CLabel : public CWndObj                     // --- Control chart
          CLabel                MQL_cAPI;

          ///---ProxyGlobal  non-generic access by every class member ///--- generic access by generic member or drived genericMember of parent
          // --- class CChartObjectLabel : public CChartObjectText // --- Object  chart API  Function GetLive Data FromChart
          CChartObjectLabel     GAC; //--- oLabel ProxyGlobal  non-generic access by every class member ///--- generic access by generic member or drived genericMember of parent

          ///---ProxyGlobal
          Sg_LABEL               GSD;//Struct_Label    // --- struct Sg_LABEL : public STRUCT_OBJECT             // --- Struct  chart Mine Function
           //--- when generic is ok

          ///---ProxyGlobal __LINE__295
          ///---off---[as drived no need]__COBFA__     Frame; //--Proxy--//     // --- class C_ObjectFrame //SOLID Base //--Proxy--//    // --- Proxy   chart Mine Function Parent
//===================================================================


};


//+------------------------------------------------------------------+
//|                        Cg_GenericTextsdata.mqh                  |
//+------------------------------------------------------------------+
//||   ||||||||||               Cg_DevObjectPack.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
