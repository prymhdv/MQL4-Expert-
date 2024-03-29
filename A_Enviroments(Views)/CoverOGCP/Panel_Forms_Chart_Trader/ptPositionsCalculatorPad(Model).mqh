//+------------------------------------------------------------------+
//||   ||||||||||          ptPositionsCalculatorPad(Model).mqh      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQLLib\.B_MQLLib.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

struct Stp_CalculatorPad_OrderTP
{         CLabel        ScriptTPLabels[];
          CEdit         ScriptTPEdits[];
          CEdit         ScriptTPShareEdits[];
          // Extra TP fields for the Main tab.
          CLabel        AdditionalTPLabels[], AdditionalTPWarnings[];
          CEdit         AdditionalTPEdits[];

//===================================================================
          CLabel        m_LblScriptTP,  m_LblScriptTPShare;
//===================================================================
          double        tTakeProfitLevel;
          string        WarningTP;              //  WarningTP = "";
          string        AdditionalWarningTP[];
//--------------------------------------------------------
};      Stp_CalculatorPad_OrderTP               CalculatorPad_OrderTP;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Stp_CalculatorPad_OrderEntry
{         //---for orders level
          double        tEntryLevel;
          string        WarningEntry;           //  WarningEntry = "";
          //--------------------------------------------------------
};      Stp_CalculatorPad_OrderEntry            CalculatorPad_OrderEntry;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Stp_CalculatorPad_OrderStopLoss
{         //---for orders level
          //--------------------------------------------------------
          double        tStopLossLevel;
          string        WarningSL;              //  WarningSL = "";
          //--------------------------------------------------------
};      Stp_CalculatorPad_OrderStopLoss         CalculatorPad_OrderStopLoss;
//+------------------------------------------------------------------+
//||   ||||||||||          ptPositionsCalculatorPad(Model).mqh      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
