//+------------------------------------------------------------------+
//|                                                CalculatorPad.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+QCPositionSizeCalculator
//|                                       PositionSizeCalculator.mqh |PositionSize
//|                             Copyright © 2012-2021, EarnForex.com |
//|                                     Based on panel by qubbit.com |
//|                                       https://www.earnforex.com/ |
//+------------------------------------------------------------------+
//#include "A_Defines.mqh"

//+------------------------------------------------------------------+
//|             Class MyRoboTrader     BEGIN                         |OrderLevels
//+------------------------------------------------------------------+
//#property copyright "EarnForex.com" Based on panel by qubbit.com
//#property link      "https://www.earnforex.com/metatrader-indicators/Position-Size-Calculator/"
//#property version   "2.40"
//string    Version = "2.40";
//====================================================================
//#property description "Calculates position size based on account balance/equity,"
//#property description "currency, currency pair, given entry level, stop-loss level,"
//#property description "and risk tolerance (set either in percentage points or in base currency)."
//#property description "Displays reward/risk ratio based on take-profit."
//#property description "Shows total portfolio risk based on open trades and pending orders."
//#property description "Calculates margin required for new position, allows custom leverage.\r\n"
//#property description "WARNING: There is no guarantee that the output of this indicator is correct. Use at your own risk."
//====================================================================
//#property indicator_chart_window
//#property indicator_plots 0
//====================================================================
//#include "PositionSizeCalculator.mqh";

//+------------------------------------------------------------------+
//|             Class C_CalculatorPad     BEGIN                      |OrderLevels
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+PositionSizeCalculator Frames
class C_CalculatorPad : public CAppDialog
{
//=======================================================================
public:
          bool                  IsPadPress_Calculator;
//input group "Compactness"
          bool                  ShowLineLabels            ;// = true; // ShowLineLabels: Show pip distance for TP/SL near lines?
          bool                  ShowAdditionalSLLabel     ;// = false; // ShowAdditionalSLLabel: Show SL $/% label?
          bool                  ShowAdditionalTPLabel     ;// = false; // ShowAdditionalTPLabel: Show TP $/% + R/R label?
          bool                  DrawTextAsBackground      ;// = false; // DrawTextAsBackground: Draw label objects as background?
          bool                  PanelOnTopOfChart         ;// = true; // PanelOnTopOfChart: Draw chart as background?
          bool                  HideAccSize               ;// = false; // HideAccSize: Hide account size?
          bool                  ShowPipValue              ;// = false; // ShowPipValue: Show pip value?
          bool                  ShowMaxPSButton           ;// = false; // ShowMaxPSButton: Show Max Position Size button?
          //input group "Fonts"
          color                 sl_label_font_color       ;// = clrLime; // SL Label  Color
          color                 tp_label_font_color       ;// = clrYellow; // TP Label Font Color
          uint                  font_size                 ;// = 13; // Labels Font Size
          string                font_face   ;// = "Courier"; // Labels Font Face
          //input group "Lines"
          color                 entry_line_color          ;// = clrBlue; // Entry Line Color
          color                 stoploss_line_color       ;// = clrLime; // Stop-Loss Line Color
          color                 takeprofit_line_color     ;// = clrYellow; // Take-Profit Line Color
          ENUM_LINE_STYLE       entry_line_style          ;// = STYLE_SOLID; // Entry Line Style
          ENUM_LINE_STYLE       stoploss_line_style       ;// = STYLE_SOLID; // Stop-Loss Line Style
          ENUM_LINE_STYLE       takeprofit_line_style     ;// = STYLE_SOLID; // Take-Profit Line Style
          uint                  entry_line_width          ;// = 1; // Entry Line Width
          uint                  stoploss_line_width       ;// = 1; // Stop-Loss Line Width
          uint                  takeprofit_line_width     ;// = 1; // Take-Profit Line Width
          //=======================================================================
          //input group "Defaults"
          ENUM_TRADE_DIRECTION  DefaultTradeDirection     ;// = Long; // TradeDirection: Default trade direction.
          int                   DefaultSL                 ;// = 0; // SL: Default stop-loss value, in broker's pips.
          int                   DefaultTP                 ;// = 0; // TP: Default take-profit value, in broker's pips.
          ENUM_ENTRY_TYPE       DefaultEntryType          ;// = Instant; // EntryType: Instant or Pending.
          bool                  DefaultShowLines          ;// = true; // ShowLines: Show the lines by default?
          bool                  DefaultLinesSelected      ;// = true; // LinesSelected: SL/TP (Entry in Pending) lines selected.
          int                   DefaultATRPeriod          ;// = 14; // ATRPeriod: Default ATR period.
          double                DefaultATRMultiplierSL    ;// = 0; // ATRMultiplierSL: Default ATR multiplier for SL.
          double                DefaultATRMultiplierTP    ;// = 0; // ATRMultiplierTP: Default ATR multiplier for TP.
          ENUM_TIMEFRAMES       DefaultATRTimeframe       ;// = PERIOD_CURRENT; // ATRTimeframe: Default timeframe for ATR.
          double                DefaultCommission         ;// = 0; // Commission: Default one-way commission per 1 lot.
          ENUM_ACCOUNT_BUTTON   DefaultAccountButton      ;// = Balance; // AccountButton: Balance/Equity/Balance-CPR
          double                DefaultRisk                               ;// = 1; // Risk: Initial risk tolerance in percentage points
          double                DefaultMoneyRisk                          ;// = 0; // MoneyRisk: If > 0, money risk tolerance in currency.
          bool                  DefaultCountPendingOrders                 ;// = false; // CountPendingOrders: Count pending orders for portfolio risk.
          bool                  DefaultIgnoreOrdersWithoutStopLoss        ;// = false; // IgnoreOrdersWithoutStopLoss: Ignore orders w/o SL in portfolio risk.
          bool                  DefaultIgnoreOtherSymbols                 ;// = false; // IgnoreOtherSymbols: Ignore other symbols' orders in portfolio risk.
          int                   DefaultCustomLeverage                     ;// = 0; // CustomLeverage: Default custom leverage for Margin tab.
          int                   DefaultMagicNumber                        ;// = 0; // MagicNumber: Default magic number for Script tab.
          string                DefaultCommentary                         ;// = ""; // Commentary: Default order comment for Script tab.
          bool                  DefaultDisableTradingWhenLinesAreHidden   ;// = false; // DisableTradingWhenLinesAreHidden: for Script tab.
          int                   DefaultMaxSlippage                        ;// = 0; // MaxSlippage: Maximum slippage for Script tab.
          int                   DefaultMaxSpread                          ;// = 0; // MaxSpread: Maximum spread for Script tab.
          int                   DefaultMaxEntrySLDistance                 ;// = 0; // MaxEntrySLDistance: Maximum entry/SL distance for Script tab.
          int                   DefaultMinEntrySLDistance                 ;// = 0; // MinEntrySLDistance: Minimum entry/SL distance for Script tab.
          double                DefaultMaxPositionSize                    ;// = 0; // MaxPositionSize: Maximum position size for Script tab.
          bool                  DefaultSubtractOPV                        ;// = false; // SubtractOPV: Subtract open positions volume (Script tab).
          bool                  DefaultSubtractPOV                        ;// = false; // SubtractPOV: Subtract pending orders volume (Script tab).
          bool                  DefaultDoNotApplyStopLoss                 ;// = false; // DoNotApplyStopLoss: Don't apply SL for Script tab.
          bool                  DefaultDoNotApplyTakeProfit               ;// = false; // DoNotApplyTakeProfit: Don't apply TP for Script tab.
          bool                  DefaultAskForConfirmation                 ;// = false; // AskForConfirmation: Ask for confirmation for Script tab.
          int                   DefaultPanelPositionX                     ;// = 0; // PanelPositionX: Panel's X coordinate.
          int                   DefaultPanelPositionY                     ;//= 15; // PanelPositionY: Panel's Y coordinate.
          ENUM_BASE_CORNER      DefaultPanelPositionCorner                ;// = CORNER_LEFT_UPPER; // PanelPositionCorner: Panel's corner.
          bool                  DefaultTPLockedOnSL                       ;// = false; // TPLockedOnSL: Lock TP to (multiplied) SL distance.
          //====================================================================
          //input group "Miscellaneous"
          double                TP_Multiplier                     ;// = 1; // TP Multiplier for SL value, appears in Take-profit button.
          bool                  UseCommissionToSet_TPDistance      ;// = false; // UseCommissionToSet_TPDistance: For TP button.
          bool                  ShowSpread                        ;// = false; // ShowSpread: If true, shows current spread in window caption.
          double                AdditionalFunds                   ;// = 0; // AdditionalFunds: Added to account balance for risk calculation.
          double                CustomBalance                     ;// = 0; // CustomBalance: Overrides AdditionalFunds value.
          bool                  UseFixedSLDistance                ;// = false; // UseFixedSLDistance: SL distance in points instead of a level.
          bool                  UseFixedTPDistance                ;// = false; // UseFixedTPDistance: TP distance in points instead of a level.
          bool                  ShowATROptions                    ;// = false; // ShowATROptions: If true, SL and TP can be set via ATR.
          int                   ScriptTakePorfitsNumber           ;// = 1; // ScriptTakePorfitsNumber: More than 1 target for script to split trades.
          bool                  CalculateUnadjustedPositionSize   ;// = false; // CalculateUnadjustedPositionSize: Ignore broker's restrictions.
          bool                  RoundDown                         ;// = true; // RoundDown: Position size and potential reward are rounded down.
          double                QuickRisk1                        ;// = 0; // QuickRisk1: First quick risk button, in percentage points.
          double                QuickRisk2                        ;// = 0; // QuickRisk2: Second quick risk button, in percentage points.
          string                ObjectPrefix                      ;// = "PSC_"; // ObjectPrefix: To prevent confusion with other indicators/EAs.
//=======================================================================
private:
          CButton               m_BtnTabMain,   m_BtnTabRisk,           m_BtnTabMargin,         m_BtnTabSwaps,
                                m_BtnTabScript, m_BtnOrderType,         m_BtnAccount,           m_BtnLines,
                                m_BtnStopLoss,  m_BtnTakeProfit,        m_BtnEntry,             m_BtnATRTimeframe,
                                m_BtnMaxPS,     m_BtnTPsInward,         m_BtnTPsOutward,        m_BtnQuickRisk1,        m_BtnQuickRisk2;
          //
          CCheckBox             m_ChkCountPendings,             m_ChkIgnoreOrders,              m_ChkIgnoreOtherSymbols,        m_ChkDisableTradingWhenLinesAreHidden,
                                m_ChkSubtractPositions,         m_ChkSubtractPendingOrders,     m_ChkDoNotApplyStopLoss,        m_ChkDoNotApplyTakeProfit,              m_ChkAskForConfirmation;
          //
          CEdit                 m_EdtEntryLevel,                m_EdtSL,                        m_EdtTP,                        m_EdtAccount,
                                m_EdtCommissionSize,            m_EdtRiskPIn,                   m_EdtRiskPRes,                  m_EdtRiskMIn,
                                m_EdtRiskMRes,                  m_EdtReward1,                   m_EdtReward2,                   m_EdtRR1,
                                m_EdtRR2,                       m_EdtPosSize,                   m_EdtPipValue,                  m_EdtATRPeriod,
                                m_EdtATRMultiplierSL,           m_EdtATRMultiplierTP,           m_EdtCurRiskM,                  m_EdtCurRiskP,
                                m_EdtPotRiskM,                  m_EdtPotRiskP,                  m_EdtCurProfitM,                m_EdtCurProfitP,
                                m_EdtPotProfitM,                m_EdtPotProfitP,                m_EdtCurL,                      m_EdtPotL,
                                m_EdtPosMargin,                 m_EdtUsedMargin,                m_EdtFreeMargin,                m_EdtCustomLeverage,
                                m_EdtMaxPositionSizeByMargin,   m_EdtSwapsType,                 m_EdtSwapsTripleDay,            m_EdtSwapsNominalLong,
                                m_EdtSwapsNominalShort,         m_EdtSwapsDailyLongLot,         m_EdtSwapsDailyShortLot,        m_EdtSwapsDailyLongPS,
                                m_EdtSwapsDailyShortPS,         m_EdtSwapsYearlyLongLot,        m_EdtSwapsYearlyShortLot,       m_EdtSwapsYearlyLongPS,
                                m_EdtSwapsYearlyShortPS,        m_EdtMagicNumber,               m_EdtScriptCommentary,          m_EdtMaxSlippage,
                                m_EdtMaxSpread,                 m_EdtMaxEntrySLDistance,        m_EdtMinEntrySLDistance,        m_EdtMaxPositionSize;
          //-----------------------------------------
          CLabel                m_LblEntryLevel,                m_LblEntryWarning,              m_LblSL,                        m_LblSLWarning,                 m_LblTPWarning,
                                m_LblOrderType,                 m_LblCommissionSize,            m_LblFundsAsterisk,             m_LblInput,                     m_LblResult,
                                m_LblRisk,                      m_LblRiskM, m_LblReward,        m_LblRR,                        m_LblPosSize,                   m_LblPipValue,
                                m_LblATRPeriod,                 m_LblATRMultiplierSL,           m_LblATRMultiplierTP,           m_LblATRValue,                  m_LblATRTimeframe,
                                m_LblCurrentRiskMoney,          m_LblCurrentRiskPerc,           m_LblCurrentProfitMoney,        m_LblCurrentProfitPerc,         m_LblPotentialRiskMoney,
                                m_LblPotentialRiskPerc,         m_LblPotentialProfitMoney,      m_LblPotentialProfitPerc,       m_LblCurrentLots,               m_LblPotentialLots,
                                m_LblCurrentPortfolio,          m_LblPotentialPortfolio,        m_LblPosMargin,                 m_LblUsedMargin,                m_LblFreeMargin,
                                m_LblCustomLeverage,            m_LblAccLeverage,               m_LblSymbolLeverage,            m_LblMaxPositionSizeByMargin,   m_LblSwapsType,
                                m_LblSwapsTripleDay,            m_LblSwapsLong,                 m_LblSwapsShort,                m_LblSwapsNominal,              m_LblSwapsDaily,
                                m_LblSwapsYearly,               m_LblSwapsPerLotDaily,          m_LblSwapsPerPSDaily,           m_LblSwapsPerLotYearly,         m_LblSwapsPerPSYearly,
                                m_LblMagicNumber,               m_LblScriptCommentary,          m_LblScriptExplanation,         m_LblScriptPips,                m_LblMaxSlippage,
                                m_LblMaxSpread,                 m_LblMaxEntrySLDistance,        m_LblMinEntrySLDistance,        m_LblScriptLots,                m_LblMaxPositionSize,
                                m_LblURL;
          //-------------------------------------------
          string                m_FileName, m_IniFileName;
          double                m_DPIScale;
          bool                  NoPanelMaximization; // Crutch variable to prevent panel maximization when Maximize() is called at the indicator's initialization.



public:
          void                  C_CalculatorPad(void);
          void                  ~C_CalculatorPad(void) {};

          virtual bool          Create(const long chart, const string name, const int subwin, const int x1, const int y1);
          virtual bool          OnEvent(const int id, const long& lparam, const double& dparam, const string& sparam);//come From parents
          //====================================================================
          int                   OnInitX(bool KeyCom = false);
          void                  OnDeinitX(const int reason = 10);
          int                   OnCalculateX(const int rates_total, const int prev_calculated, const datetime &time[], const double &open[], const double &high[], const double &low[], const double &close[], const long &tick_volume[], const long &volume[], const int &spread[]);
          void                  OnChartEvents(Sg_OnChartEvent &event);
          void                  OnTradeX();
          void                  OnTimerX();
//====================================================================
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          bool                  Uninitialized;///  Uninitialized = true;
          void                  Initialization();//
          int                   LinesSelectedStatus; // 0 - no change, 1 - flip to selected, 2 - flip to unselected.
          bool                  Update();//checking & Set_ting Lots
          void                  DrawLineLabel(const string label, const string text, const double price, const color col, bool above = false);
          //===================================================================
          //---for market data of symbol
          double                StopLevel;// = 0;                                   // Broker StopLevel // StopLevel = 0;       // Broker StopLevel
          //===================================================================
          //use by calulator
          void                  RecalculatePositionSize();
          void                  CalculateRiskAndPositionSize();
          void                  CalculateMargin();
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+

//====================================================================
          // Gets values from lines, recalculates position size, and updates values in the panel.
          virtual void          RefreshValues();
          virtual bool          SaveSet_tingsOnDisk();
          virtual bool          LoadSet_tingsFromDisk();
          virtual bool          DeleteSet_tingsFile();
          virtual bool          Run()                               { SeekAndDestroyDuplicatePanels(); return(CAppDialog::Run()); }
          virtual void          HideShowMaximize();
          virtual void          IniFileNameSet_(string filename)     { m_IniFileName = filename; }
          virtual void          IniFileSave();
          virtual void          IniFileLoad();
          string                IniFileName(void) const;
          virtual void          UpdateFixedSL();
          virtual void          UpdateFixedTP();
          virtual void          UpdateAdditionalFixedTP(int i);
          virtual void          FixatePanelPosition()               { if (!m_minimized) m_norm_rect.SetBound(m_rect);    else m_min_rect.SetBound(m_rect); }// Used to fixate panel's position after calling Move(). Otherwise, unless the panel gets dragged by mouse, its position isn't remembered properly in the INI file.
          virtual void          UpdateScriptTPEdit(int i);
          virtual void          UpdateAdditionalTPEdit(int i);
          virtual void          ProcessLineObjectsAfterUpdatingMultipleTP(int i);
          virtual void          UpdateScriptTPShareEdit(int i);
          virtual void          CheckAndRestoreLines();

          // Remember the panel's location to have the same location for minimized and maximized states.
          int                   remember_top, remember_left;
private:

          virtual void          ShowMain();
          virtual void          ShowRisk();
          virtual void          ShowMargin();
          virtual void          ShowSwaps();
          virtual void          ShowScript();
          virtual void          HideMain();
          virtual void          HideRisk();
          virtual void          HideMargin();
          virtual void          HideSwaps();
          virtual void          HideScript();

          virtual bool          CreateObjects();
          virtual bool          InitObjects();
          // Arranges panel objects on the panel.
          virtual void          MoveAndResize();
          virtual bool          DisplayValues();
          virtual void          SeekAndDestroyDuplicatePanels();
          virtual void          ProcessTPChange(const bool tp_button_click);

          virtual bool          ButtonCreate    (CButton&    Btn, int X1, int Y1, int X2, int Y2, string Name, string Text, string Tooltip = "\n");
          virtual bool          CheckBoxCreate  (CCheckBox&  Chk, int X1, int Y1, int X2, int Y2, string Name, string Text, string Tooltip = "\n");
          virtual bool          EditCreate      (CEdit&      Edt, int X1, int Y1, int X2, int Y2, string Name, string Text, string Tooltip = "\n");
          virtual bool          LabelCreate     (CLabel&     Lbl, int X1, int Y1, int X2, int Y2, string Name, string Text, string Tooltip = "\n");
          virtual void          Maximize();
          virtual void          Minimize();

          // Event handlers
          void                  OnEndEditEdtEntryLevel();
          void                  OnEndEditEdtSL();
          void                  OnEndEditEdtTP();
          //
          void                  OnClickBtnOrderType();
          void                  OnClickBtnLines();
          void                  OnClickBtnAccount();
          void                  OnClickBtnMaxPS();
          //
          void                  OnEndEditEdtCommissionSize();
          void                  OnEndEditEdtAccount();
          void                  OnEndEditEdtRiskPIn();
          void                  OnEndEditEdtRiskMIn();
          void                  OnEndEditEdtPosSize();
          void                  OnEndEditATRPeriod();
          void                  OnEndEditATRMultiplierSL();
          void                  OnEndEditATRMultiplierTP();
          //
          void                  OnChangeChkCountPendings();
          void                  OnChangeChkIgnoreOrders();
          void                  OnChangeChkIgnoreOtherSymbols();
          //
          void                  OnEndEditEdtCustomLeverage();
          void                  OnEndEditEdtMagicNumber();
          void                  OnEndEditEdtScriptCommentary();
          void                  OnChangeChkDisableTradingWhenLinesAreHidden();
          void                  OnEndEditEdtMaxSlippage();
          void                  OnEndEditEdtMaxSpread();
          void                  OnEndEditEdtMaxEntrySLDistance();
          void                  OnEndEditEdtMinEntrySLDistance();
          void                  OnEndEditEdtMaxPositionSize();
          //
          void                  OnChangeChkSubtractPositions();
          void                  OnChangeChkSubtractPendingOrders();
          void                  OnChangeChkDoNotApplyStopLoss();
          void                  OnChangeChkDoNotApplyTakeProfit();
          void                  OnChangeChkAskForConfirmation();
          //
          void                  OnClickBtnTabMain();
          void                  OnClickBtnTabRisk();
          void                  OnClickBtnTabMargin();
          void                  OnClickBtnTabSwaps();
          void                  OnClickBtnTabScript();
          void                  OnClickBtnStopLoss();
          void                  OnClickBtnTakeProfit();
          void                  OnClickBtnEntry();
          void                  OnClickBtnATRTimeframe();
          void                  OnClickBtnTPsInward();
          void                  OnClickBtnTPsOutward();
          void                  OnClickBtnQuickRisk1();
          void                  OnClickBtnQuickRisk2();//
          //==========================================================
public:        ///C_Calculator
          //====================================================================// Default values for settings:
          double                EntryLevel        ;//= 0;
          double                StopLossLevel     ;// = 0;
          double                TakeProfitLevel   ;// = 0;
          string                PanelCaption      ;// = "";
          //static C_CalculatorPad*       C_CalculatorPad::ExtDialog;
//====================================================================
// Global variables:
          bool                  Dont_Move_the_Panel_to_Default_Corner_X_Y;
          uint                  LastRecalculationTime;// = 0;

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//C_CalculatorPad       *ExtDialog = new C_CalculatorPad();

// Event Map
EVENT_MAP_BEGIN(C_CalculatorPad)
ON_EVENT(ON_END_EDIT, m_EdtEntryLevel, OnEndEditEdtEntryLevel)
ON_EVENT(ON_END_EDIT, m_EdtSL, OnEndEditEdtSL)
ON_EVENT(ON_END_EDIT, m_EdtTP, OnEndEditEdtTP)
ON_EVENT(ON_CLICK, m_BtnOrderType, OnClickBtnOrderType)
ON_EVENT(ON_CLICK, m_BtnLines, OnClickBtnLines)
ON_EVENT(ON_CLICK, m_BtnAccount, OnClickBtnAccount)
ON_EVENT(ON_CLICK, m_BtnMaxPS, OnClickBtnMaxPS)
ON_EVENT(ON_END_EDIT, m_EdtCommissionSize, OnEndEditEdtCommissionSize)
ON_EVENT(ON_END_EDIT, m_EdtAccount, OnEndEditEdtAccount)
ON_EVENT(ON_END_EDIT, m_EdtRiskPIn, OnEndEditEdtRiskPIn)
ON_EVENT(ON_END_EDIT, m_EdtRiskMIn, OnEndEditEdtRiskMIn)
ON_EVENT(ON_END_EDIT, m_EdtPosSize, OnEndEditEdtPosSize)
ON_EVENT(ON_END_EDIT, m_EdtATRPeriod, OnEndEditATRPeriod)
ON_EVENT(ON_END_EDIT, m_EdtATRMultiplierSL, OnEndEditATRMultiplierSL)
ON_EVENT(ON_END_EDIT, m_EdtATRMultiplierTP, OnEndEditATRMultiplierTP)
ON_EVENT(ON_CHANGE, m_ChkCountPendings, OnChangeChkCountPendings)
ON_EVENT(ON_CHANGE, m_ChkIgnoreOrders, OnChangeChkIgnoreOrders)
ON_EVENT(ON_CHANGE, m_ChkIgnoreOtherSymbols, OnChangeChkIgnoreOtherSymbols)
ON_EVENT(ON_END_EDIT, m_EdtCustomLeverage, OnEndEditEdtCustomLeverage)
ON_EVENT(ON_END_EDIT, m_EdtMagicNumber, OnEndEditEdtMagicNumber)
ON_EVENT(ON_END_EDIT, m_EdtScriptCommentary, OnEndEditEdtScriptCommentary)
ON_EVENT(ON_CHANGE, m_ChkDisableTradingWhenLinesAreHidden, OnChangeChkDisableTradingWhenLinesAreHidden)
ON_EVENT(ON_END_EDIT, m_EdtMaxSlippage, OnEndEditEdtMaxSlippage)
ON_EVENT(ON_END_EDIT, m_EdtMaxSpread, OnEndEditEdtMaxSpread)
ON_EVENT(ON_END_EDIT, m_EdtMaxEntrySLDistance, OnEndEditEdtMaxEntrySLDistance)
ON_EVENT(ON_END_EDIT, m_EdtMinEntrySLDistance, OnEndEditEdtMinEntrySLDistance)
ON_EVENT(ON_END_EDIT, m_EdtMaxPositionSize, OnEndEditEdtMaxPositionSize)
ON_EVENT(ON_CHANGE, m_ChkSubtractPositions, OnChangeChkSubtractPositions)
ON_EVENT(ON_CHANGE, m_ChkSubtractPendingOrders, OnChangeChkSubtractPendingOrders)
ON_EVENT(ON_CHANGE, m_ChkDoNotApplyStopLoss, OnChangeChkDoNotApplyStopLoss)
ON_EVENT(ON_CHANGE, m_ChkDoNotApplyTakeProfit, OnChangeChkDoNotApplyTakeProfit)
ON_EVENT(ON_CHANGE, m_ChkAskForConfirmation, OnChangeChkAskForConfirmation)
ON_EVENT(ON_CLICK, m_BtnTabMain, OnClickBtnTabMain)
ON_EVENT(ON_CLICK, m_BtnTabRisk, OnClickBtnTabRisk)
ON_EVENT(ON_CLICK, m_BtnTabMargin, OnClickBtnTabMargin)
ON_EVENT(ON_CLICK, m_BtnTabSwaps, OnClickBtnTabSwaps)
ON_EVENT(ON_CLICK, m_BtnTabScript, OnClickBtnTabScript)
ON_EVENT(ON_CLICK, m_BtnTakeProfit, OnClickBtnTakeProfit)
ON_EVENT(ON_CLICK, m_BtnStopLoss, OnClickBtnStopLoss)
ON_EVENT(ON_CLICK, m_BtnEntry, OnClickBtnEntry)
ON_EVENT(ON_CLICK, m_BtnATRTimeframe, OnClickBtnATRTimeframe)
ON_EVENT(ON_CLICK, m_BtnTPsInward, OnClickBtnTPsInward)
ON_EVENT(ON_CLICK, m_BtnTPsOutward, OnClickBtnTPsOutward)
ON_EVENT(ON_CLICK, m_BtnQuickRisk1, OnClickBtnQuickRisk1)
ON_EVENT(ON_CLICK, m_BtnQuickRisk2, OnClickBtnQuickRisk2)
EVENT_MAP_END(CAppDialog)

//+-------------------+
//| Class constructor |
//+-------------------+
C_CalculatorPad::C_CalculatorPad(void)
{         m_FileName = "PSC_" + Symbol() + IntegerToString(ChartID());
          StringReplace(m_FileName, ".", "_dot_");
          m_FileName += ".txt";
          m_IniFileName = "";
          NoPanelMaximization = false;
          LinesSelectedStatus = 0;
          remember_left = -1;
          remember_top = -1; //
//===============================================================
//input group "Compactness"
          ShowLineLabels = true; // ShowLineLabels: Show pip distance for TP/SL near lines?
          ShowAdditionalSLLabel = false; // ShowAdditionalSLLabel: Show SL $/% label?
          ShowAdditionalTPLabel = false; // ShowAdditionalTPLabel: Show TP $/% + R/R label?
          DrawTextAsBackground = false; // DrawTextAsBackground: Draw label objects as background?
          PanelOnTopOfChart = true; // PanelOnTopOfChart: Draw chart as background?
          HideAccSize = false; // HideAccSize: Hide account size?
          ShowPipValue = false; // ShowPipValue: Show pip value?
          ShowMaxPSButton = false; // ShowMaxPSButton: Show Max Position Size button?
          //input group "Fonts"
          sl_label_font_color = clrLime; // SL Label  Color
          tp_label_font_color = clrYellow; // TP Label Font Color
          font_size = 13; // Labels Font Size
          font_face = "Courier"; // Labels Font Face
          //input group "Lines"
          entry_line_color = clrBlue; // Entry Line Color
          stoploss_line_color = clrLime; // Stop-Loss Line Color
          takeprofit_line_color = clrYellow; // Take-Profit Line Color
          entry_line_style = STYLE_SOLID; // Entry Line Style
          stoploss_line_style = STYLE_SOLID; // Stop-Loss Line Style
          takeprofit_line_style = STYLE_SOLID; // Take-Profit Line Style
          entry_line_width = 1; // Entry Line Width
          stoploss_line_width = 1; // Stop-Loss Line Width
          takeprofit_line_width = 1; // Take-Profit Line Width
//===============================================================
          //input group "Defaults"
          DefaultTradeDirection = Long; // TradeDirection: Default trade direction.
          DefaultSL = 0; // SL: Default stop-loss value, in broker's pips.
          DefaultTP = 0; // TP: Default take-profit value, in broker's pips.
          DefaultEntryType = Instant; // EntryType: Instant or Pending.
          DefaultShowLines = true; // ShowLines: Show the lines by default?
          DefaultLinesSelected = true; // LinesSelected: SL/TP (Entry in Pending) lines selected.
          DefaultATRPeriod = 14; // ATRPeriod: Default ATR period.
          DefaultATRMultiplierSL = 0; // ATRMultiplierSL: Default ATR multiplier for SL.
          DefaultATRMultiplierTP = 0; // ATRMultiplierTP: Default ATR multiplier for TP.
          DefaultATRTimeframe = PERIOD_CURRENT; // ATRTimeframe: Default timeframe for ATR.
          DefaultCommission = 0; // Commission: Default one-way commission per 1 lot.
          DefaultAccountButton = Balance; // AccountButton: Balance/Equity/Balance-CPR
          DefaultRisk = 1; // Risk: Initial risk tolerance in percentage points
          DefaultMoneyRisk = 0; // MoneyRisk: If > 0, money risk tolerance in currency.
          DefaultCountPendingOrders = false; // CountPendingOrders: Count pending orders for portfolio risk.
          DefaultIgnoreOrdersWithoutStopLoss = false; // IgnoreOrdersWithoutStopLoss: Ignore orders w/o SL in portfolio risk.
          DefaultIgnoreOtherSymbols = false; // IgnoreOtherSymbols: Ignore other symbols' orders in portfolio risk.
          DefaultCustomLeverage = 0; // CustomLeverage: Default custom leverage for Margin tab.
          DefaultMagicNumber = 0; // MagicNumber: Default magic number for Script tab.
          DefaultCommentary = ""; // Commentary: Default order comment for Script tab.
          DefaultDisableTradingWhenLinesAreHidden = false; // DisableTradingWhenLinesAreHidden: for Script tab.
          DefaultMaxSlippage = 0; // MaxSlippage: Maximum slippage for Script tab.
          DefaultMaxSpread = 0; // MaxSpread: Maximum spread for Script tab.
          DefaultMaxEntrySLDistance = 0; // MaxEntrySLDistance: Maximum entry/SL distance for Script tab.
          DefaultMinEntrySLDistance = 0; // MinEntrySLDistance: Minimum entry/SL distance for Script tab.
          DefaultMaxPositionSize = 0; // MaxPositionSize: Maximum position size for Script tab.
          DefaultSubtractOPV = false; // SubtractOPV: Subtract open positions volume (Script tab).
          DefaultSubtractPOV = false; // SubtractPOV: Subtract pending orders volume (Script tab).
          DefaultDoNotApplyStopLoss = false; // DoNotApplyStopLoss: Don't apply SL for Script tab.
          DefaultDoNotApplyTakeProfit = false; // DoNotApplyTakeProfit: Don't apply TP for Script tab.
          DefaultAskForConfirmation = false; // AskForConfirmation: Ask for confirmation for Script tab.
          DefaultPanelPositionX = 0; // PanelPositionX: Panel's X coordinate.
          DefaultPanelPositionY = 15; // PanelPositionY: Panel's Y coordinate.
          DefaultPanelPositionCorner = CORNER_LEFT_UPPER; // PanelPositionCorner: Panel's corner.
          DefaultTPLockedOnSL = false; // TPLockedOnSL: Lock TP to (multiplied) SL distance.
//===============================================================
          //input group "Miscellaneous"
          TP_Multiplier = 1; // TP Multiplier for SL value, appears in Take-profit button.
          UseCommissionToSet_TPDistance = false; // UseCommissionToSet_TPDistance: For TP button.
          ShowSpread = false; // ShowSpread: If true, shows current spread in window caption.
          AdditionalFunds = 0; // AdditionalFunds: Added to account balance for risk calculation.
          CustomBalance = 0; // CustomBalance: Overrides AdditionalFunds value.
          UseFixedSLDistance = false; // UseFixedSLDistance: SL distance in points instead of a level.
          UseFixedTPDistance = false; // UseFixedTPDistance: TP distance in points instead of a level.
          ShowATROptions = false; // ShowATROptions: If true, SL and TP can be set via ATR.
          ScriptTakePorfitsNumber = 1; // ScriptTakePorfitsNumber: More than 1 target for script to split trades.
          CalculateUnadjustedPositionSize = false; // CalculateUnadjustedPositionSize: Ignore broker's restrictions.
          RoundDown = true; // RoundDown: Position size and potential reward are rounded down.
          QuickRisk1 = 0; // QuickRisk1: First quick risk button, in percentage points.
          QuickRisk2 = 0; // QuickRisk2: Second quick risk button, in percentage points.
          ObjectPrefix = "PSC_"; // ObjectPrefix: To prevent confusion with other indicators/EAs.
//====================================================================
          {         //C_Calculator::C_Calculator()
//====================================================================
                    EntryLevel            = 0;
                    StopLossLevel         = 0;
                    TakeProfitLevel       = 0;
                    PanelCaption          = "";
//====================================================================
                    LastRecalculationTime = 0;
//====================================================================
          }//
}

//+--------+
//| Button |
//+--------+
bool C_CalculatorPad::ButtonCreate(CButton &Btn, int X1, int Y1, int X2, int Y2, string Name, string Text, string Tooltip = "\n")
{         if (!Btn.Create(m_chart_id, m_name + Name, m_subwin, X1, Y1, X2, Y2))       return false;
          if (!Add(Btn))                                                              return false;
          if (!Btn.Text(Text))                                                        return false;
          ObjectSetString(ChartID(), m_name + Name, OBJPROP_TOOLTIP, Tooltip);
          return true; //
}

//+----------+
//| Checkbox |
//+----------+
bool C_CalculatorPad::CheckBoxCreate(CCheckBox &Chk, int X1, int Y1, int X2, int Y2, string Name, string Text, string Tooltip = "\n")
{         if (!Chk.Create(m_chart_id, m_name + Name, m_subwin, X1, Y1, X2, Y2))       return false;
          if (!Add(Chk))                                                              return false;
          if (!Chk.Text(Text))                                                        return false;
          ObjectSetString(ChartID(), m_name + Name + "Label", OBJPROP_TOOLTIP, Tooltip);
          return true; //
}

//+------+
//| Edit |
//+------+
bool C_CalculatorPad::EditCreate(CEdit &Edt, int X1, int Y1, int X2, int Y2, string Name, string Text, string Tooltip = "\n")
{         if (!Edt.Create(m_chart_id, m_name + Name, m_subwin, X1, Y1, X2, Y2))       return false;
          if (!Add(Edt))                                                              return false;
          if (!Edt.Text(Text))                                                        return false;
          ObjectSetString(ChartID(), m_name + Name, OBJPROP_TOOLTIP, Tooltip);
          return true; //
}

//+-------+
//| Label |
//+-------+
bool C_CalculatorPad::LabelCreate(CLabel &Lbl, int X1, int Y1, int X2, int Y2, string Name, string Text, string Tooltip = "\n")
{         if (!Lbl.Create(m_chart_id, m_name + Name, m_subwin, X1, Y1, X2, Y2))       return false;
          if (!Add(Lbl))                                                              return false;
          if (!Lbl.Text(Text))                                                        return false;
          ObjectSetString(ChartID(), m_name + Name, OBJPROP_TOOLTIP, Tooltip);
          return true; //
}

//+-----------------------+
//| Create a panel object |
//+-----------------------+
bool C_CalculatorPad::Create(const long chart, const string name, const int subwin, const int x1, const int y1)
{         double screen_dpi = (double)TerminalInfoInteger(TERMINAL_SCREEN_DPI);
          m_DPIScale = screen_dpi / 96.0;
          int x2 = x1 + (int)MathRound(350 * m_DPIScale);
          int y2 = y1 + (int)MathRound(570 * m_DPIScale);
          if (!CAppDialog::Create(chart, name, subwin, x1, y1, x2, y2))               return false;
          if (!CreateObjects())                                                       return false;
          return true; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_CalculatorPad::CreateObjects()
{         int row_start = (int)MathRound(10 * m_DPIScale);
          int element_height = (int)MathRound(20 * m_DPIScale);
          int v_spacing = (int)MathRound(4 * m_DPIScale);
          int tab_button_start = (int)MathRound(15 * m_DPIScale);
          int tab_button_width = (int)MathRound(50 * m_DPIScale);
          int tab_button_spacing = (int)MathRound(15 * m_DPIScale);
          int normal_label_width = (int)MathRound(108 * m_DPIScale);
          int normal_edit_width = (int)MathRound(85 * m_DPIScale);
          int narrow_label_width = (int)MathRound(85 * m_DPIScale);
          int narrow_edit_width = (int)MathRound(75 * m_DPIScale);
          int risk_perc_edit_width = (int)MathRound(65 * m_DPIScale);
          int narrowest_label_width = (int)MathRound(50 * m_DPIScale);
          int risk_lot_edit = narrowest_label_width;
          int commission_edit_width = (int)MathRound(50 * m_DPIScale);
          int max_psc_edit_width = (int)MathRound(90 * m_DPIScale);
          int leverage_edit_width = (int)MathRound(35 * m_DPIScale);
          int wide_edit_width = (int)MathRound(170 * m_DPIScale);
          int wide_label_width = (int)MathRound(193 * m_DPIScale);
          int swap_last_label_width = (int)MathRound(80 * m_DPIScale);
          int swap_type_edit_width = narrow_edit_width * 2 + (int)MathRound(5 * m_DPIScale);
          int swap_size_edit_width = narrow_edit_width;
          int atr_period_label_width = (int)MathRound(72 * m_DPIScale);
          int atr_period_edit_width = (int)MathRound(36 * m_DPIScale);
          int quick_risk_button_width = (int)MathRound(32 * m_DPIScale);
          int first_column_start = (int)MathRound(10 * m_DPIScale);
          int second_column_start = first_column_start + (int)MathRound(123 * m_DPIScale);
          int second_risk_column_start = first_column_start + (int)MathRound(114 * m_DPIScale);
          int second_margin_column_start = first_column_start + (int)MathRound(138 * m_DPIScale);
          int second_swaps_column_start = first_column_start + narrowest_label_width + (int)MathRound(5 * m_DPIScale);
          int second_script_column_start = second_margin_column_start + (int)MathRound(5 * m_DPIScale);
          int third_column_start = second_column_start + (int)MathRound(102 * m_DPIScale);
          int third_risk_column_start = second_risk_column_start + normal_edit_width + (int)MathRound(4 * m_DPIScale);
          int third_swaps_column_start = second_swaps_column_start + narrow_edit_width + (int)MathRound(5 * m_DPIScale);
          int third_script_column_start = second_script_column_start + normal_edit_width + (int)MathRound(5 * m_DPIScale);
          int fourth_risk_column_start = third_risk_column_start + risk_perc_edit_width + (int)MathRound(4 * m_DPIScale);
          int fourth_swaps_column_start = third_swaps_column_start + narrow_edit_width + (int)MathRound(5 * m_DPIScale);
          int max_psc_column_start = second_margin_column_start + normal_edit_width - (int)MathRound(5 * m_DPIScale);
          int multi_tp_column_start = first_column_start + normal_label_width;
          int multi_tp_label_width = (int)MathRound(70 * m_DPIScale);
          int multi_tp_button_start = second_script_column_start + (int)MathRound(11 * m_DPIScale);
          int panel_end = third_column_start + narrow_label_width;
          int y = (int)MathRound(8 * m_DPIScale);
// Tabs
          if (!ButtonCreate(m_BtnTabMain, tab_button_start, y, tab_button_start + tab_button_width, y + element_height, "m_BtnTabMain", "Main"))                                                                                                                    return false;
          if (!ButtonCreate(m_BtnTabRisk, tab_button_start + tab_button_width + tab_button_spacing, y, tab_button_start + tab_button_width * 2 + tab_button_spacing, y + element_height, "m_BtnTabRisk", "Risk"))                                                                                                                   return false;
          if (!ButtonCreate(m_BtnTabMargin, tab_button_start + tab_button_width * 2 + tab_button_spacing * 2, y, tab_button_start + tab_button_width * 3 + tab_button_spacing * 2, y + element_height, "m_BtnTabMargin", "Margin"))                                                                                                             return false;
          if (!ButtonCreate(m_BtnTabSwaps, tab_button_start + tab_button_width * 3 + tab_button_spacing * 3, y, tab_button_start + tab_button_width * 4 + tab_button_spacing * 3, y + element_height, "m_BtnTabSwaps", "Swaps"))                                                                                                                return false;
          if (!ButtonCreate(m_BtnTabScript, tab_button_start + tab_button_width * 4 + tab_button_spacing * 4, y, tab_button_start + tab_button_width * 5 + tab_button_spacing * 4, y + element_height, "m_BtnTabScript", "Script"))                                                                                                             return false;
// Main
          y = row_start + element_height + 3 * v_spacing;
          if (!LabelCreate(m_LblEntryLevel, first_column_start, y, first_column_start + narrowest_label_width, y + element_height, "m_LblEntryLevel", "Entry:"))                                        return false;
          // Button to quickly switch between Long/Short trade planning.
          if (!ButtonCreate(m_BtnEntry, first_column_start + narrowest_label_width + v_spacing, y, second_column_start - v_spacing, y + element_height, "m_BtnEntry", EnumToString(sets.TradeDirection), "Switch between Long and Short"))                    return false;
          if (!EditCreate(m_EdtEntryLevel, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_EdtEntryLevel", ""))                                                 return false;
          if (!LabelCreate(m_LblEntryWarning, third_column_start, y, third_column_start + narrow_label_width, y + element_height, "m_LblEntryWarning", ""))                                         return false;
          y += element_height + v_spacing;
          string stoplosSg_LABEL_text = "Stop-loss:         ";
          if (UseFixedSLDistance) stoplosSg_LABEL_text = "SL, points:        ";
          if (DefaultSL > 0) // Use button to quickly set SL.
          {         if (!ButtonCreate(m_BtnStopLoss, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_BtnStopLoss", stoplosSg_LABEL_text))                    return false; }
          else if (!LabelCreate(m_LblSL, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblSL", stoplosSg_LABEL_text))                                               return false;
          if (!EditCreate(m_EdtSL, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_EdtSL", ""))                                                                 return false;
          if (!LabelCreate(m_LblSLWarning, third_column_start, y, third_column_start + narrow_label_width, y + element_height, "m_LblSLWarning", ""))                                               return false;
          y += element_height + v_spacing;
          string takeprofit_label_text = "Take-profit:       ";
          if (UseFixedTPDistance) takeprofit_label_text = "TP, points:        ";
          if (!ButtonCreate(m_BtnTakeProfit, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_BtnTakeProfit", takeprofit_label_text, "Set_ TP based on SL or enable locked TP mode"))                    return false;
          if (!EditCreate(m_EdtTP, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_EdtTP", ""))                                                                 return false;
          if (!LabelCreate(m_LblTPWarning, third_column_start, y, third_column_start + narrow_label_width, y + element_height, "m_LblTPWarning", ""))                                               return false;
          // Multiple TP levels for the Main tab.
          if (ScriptTakePorfitsNumber > 1)
          {         // -1 because there is already one main TP level.
                    ArrayResize(CalculatorPad_OrderTP.AdditionalTPLabels, ScriptTakePorfitsNumber - 1);
                    ArrayResize(CalculatorPad_OrderTP.AdditionalTPEdits, ScriptTakePorfitsNumber - 1);
                    ArrayResize(CalculatorPad_OrderTP.AdditionalTPWarnings, ScriptTakePorfitsNumber - 1);
                    ArrayResize(CalculatorPad_OrderTP.AdditionalWarningTP, ScriptTakePorfitsNumber - 1); // String array.
                    ArrayResize(PositionData_RiskReward.AdditionalOutputRR, ScriptTakePorfitsNumber - 1); // String array.
                    ArrayResize(PositionData_RiskReward.AdditionalOutputReward, ScriptTakePorfitsNumber - 1); // Double array.
                    string additional_tp_label_beginning = "Take-profit ";
                    string additional_tp_label_end = ":";
                    if (UseFixedTPDistance)
                    {         additional_tp_label_beginning = "TP ";
                              additional_tp_label_end = ", points:"; }
                    for (int i = 0; i < ScriptTakePorfitsNumber - 1; i++)
                    {         y += element_height + v_spacing;
                              if (!LabelCreate(CalculatorPad_OrderTP.AdditionalTPLabels[i], first_column_start, y, first_column_start + normal_label_width, y + element_height, "CalculatorPad_OrderTP.AdditionalTPLabels" + IntegerToString(i + 2), additional_tp_label_beginning + IntegerToString(i + 2) + additional_tp_label_end))                                       return false;
                              if (!EditCreate(CalculatorPad_OrderTP.AdditionalTPEdits[i], second_column_start, y, second_column_start + normal_edit_width, y + element_height, "CalculatorPad_OrderTP.AdditionalTPEdits" + IntegerToString(i + 2), ""))                                               return false;
                              if (!LabelCreate(CalculatorPad_OrderTP.AdditionalTPWarnings[i], third_column_start, y, third_column_start + narrow_label_width, y + element_height, "CalculatorPad_OrderTP.AdditionalTPWarnings" + IntegerToString(i + 2), ""))                                                 return false; } }
          if (ShowATROptions)
          {         y += element_height + v_spacing;
                    if (!LabelCreate(m_LblATRPeriod, first_column_start, y, first_column_start + atr_period_label_width, y + element_height, "m_LblATRPeriod", "ATR period:"))                                                 return false;
                    if (!EditCreate(m_EdtATRPeriod, first_column_start + atr_period_label_width, y, first_column_start + atr_period_label_width + atr_period_edit_width, y + element_height, "m_EdtATRPeriod", ""))                                                                return false;
                    if (!LabelCreate(m_LblATRMultiplierSL, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_LblATRMultiplierSL", "SL multiplier:"))                                                 return false;
                    if (!EditCreate(m_EdtATRMultiplierSL, third_column_start, y, third_column_start + normal_edit_width / 2, y + element_height, "m_EdtATRMultiplierSL", ""))                                                              return false;
                    y += element_height + v_spacing;
                    if (!LabelCreate(m_LblATRValue, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblATRValue", "ATR = "))                                                return false;
                    if (!LabelCreate(m_LblATRMultiplierTP, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_LblATRMultiplierTP", "TP multiplier:"))                                                 return false;
                    if (!EditCreate(m_EdtATRMultiplierTP, third_column_start, y, third_column_start + normal_edit_width / 2, y + element_height, "m_EdtATRMultiplierTP", ""))                                                              return false;
                    y += element_height + v_spacing;
                    if (!LabelCreate(m_LblATRTimeframe, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblATRTimeframe", "ATR timeframe:"))                                                return false;
                    if (!ButtonCreate(m_BtnATRTimeframe, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_BtnATRTimeframe", EnumToString((ENUM_TIMEFRAMES)_Period)))                                                                return false; }
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblOrderType, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblOrderType", "ct_Order type:"))                                    return false;
          if (!ButtonCreate(m_BtnOrderType, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_BtnOrderType", "Instant", "Switch between Instant and Pending"))                                            return false;
          if (!ButtonCreate(m_BtnLines, third_column_start, y, third_column_start + normal_edit_width, y + element_height, "m_BtnLines", "Hide lines"))                                     return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblCommissionSize, first_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_LblCommissionSize", "Commission (one-way) per lot:", "In account currency, per 1 standard lot"))         return false;
          if (!EditCreate(m_EdtCommissionSize, third_column_start, y, third_column_start + normal_edit_width, y + element_height, "m_EdtCommissionSize", ""))                                       return false;
          y += element_height + v_spacing;
          if (!HideAccSize)
          {         if (!ButtonCreate(m_BtnAccount, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_BtnAccount", "Account balance", "Switch between balance, equity, and balance minus current portfolio risk"))                                       return false;
                    if (!EditCreate(m_EdtAccount, second_column_start, y, third_column_start + normal_edit_width, y + element_height, "m_EdtAccount", ""))                                                    return false;
                    string tooltip = "";
                    if (CustomBalance > 0) tooltip = "Custom balance set";
                    else if (AdditionalFunds > 0) tooltip = "+" + DoubleToString(AdditionalFunds, 2) + " additional funds";
                    else if (AdditionalFunds < 0) tooltip = DoubleToString(-AdditionalFunds, 2) + " funds subtracted";
                    if (!LabelCreate(m_LblFundsAsterisk, third_column_start + normal_edit_width + v_spacing, y, third_column_start + normal_edit_width + v_spacing * 2, y + element_height, "m_LblFundsAsterisk", "*", tooltip))       return false;
                    y += element_height + v_spacing; }
          if (!LabelCreate(m_LblInput, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_LblInput", "Input", "Fields in this column are calculated based on inputs"))                                                 return false;
          if (!LabelCreate(m_LblResult, third_column_start, y, third_column_start + normal_edit_width, y + element_height, "m_LblResult", "Result", "Fields in this column take into account broker's limitations"))                                            return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblRisk, first_column_start, y, first_column_start + tab_button_width - v_spacing, y + element_height, "m_LblRisk", "Risk, %:"))                                                   return false;
          if (QuickRisk1 > 0) if (!ButtonCreate(m_BtnQuickRisk1, first_column_start + tab_button_width, y, first_column_start + tab_button_width + quick_risk_button_width, y + element_height, "m_BtnQuickRisk1", "", "%"))                                                    return false;
          if (QuickRisk2 > 0) if (!ButtonCreate(m_BtnQuickRisk2, first_column_start + tab_button_width + quick_risk_button_width + v_spacing, y, first_column_start + tab_button_width + quick_risk_button_width * 2 + v_spacing, y + element_height, "m_BtnQuickRisk2", "", "%"))                                                  return false;
          if (!EditCreate(m_EdtRiskPIn, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_EdtRiskPIn", ""))                                                       return false;
          if (!EditCreate(m_EdtRiskPRes, third_column_start, y, third_column_start + normal_edit_width, y + element_height, "m_EdtRiskPRes", ""))                                                   return false;
          m_EdtRiskPRes.ReadOnly(true);
          m_EdtRiskPRes.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblRiskM, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblRiskM", "Risk, money:"))                                           return false;
          if (!EditCreate(m_EdtRiskMIn, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_EdtRiskMIn", ""))                                                       return false;
          if (!EditCreate(m_EdtRiskMRes, third_column_start, y, third_column_start + normal_edit_width, y + element_height, "m_EdtRiskMRes", ""))                                                   return false;
          m_EdtRiskMRes.ReadOnly(true);
          m_EdtRiskMRes.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblReward, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblReward", "Reward, money:"))                                           return false;
          if (!EditCreate(m_EdtReward1, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_EdtReward1", ""))                                                       return false;
          m_EdtReward1.ReadOnly(true);
          m_EdtReward1.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          if (!EditCreate(m_EdtReward2, third_column_start, y, third_column_start + normal_edit_width, y + element_height, "m_EdtReward2", ""))                                                     return false;
          m_EdtReward2.ReadOnly(true);
          m_EdtReward2.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblRR, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblRR", "Reward/risk:"))                                                 return false;
          if (!EditCreate(m_EdtRR1, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_EdtRR1", ""))                                                               return false;
          if (!EditCreate(m_EdtRR2, third_column_start, y, third_column_start + normal_edit_width, y + element_height, "m_EdtRR2", ""))                                                                 return false;
          m_EdtRR1.ReadOnly(true);
          m_EdtRR1.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          m_EdtRR2.ReadOnly(true);
          m_EdtRR2.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblPosSize, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblPosSize", "Position size:"))                                 return false;
          if (ShowMaxPSButton) if (!ButtonCreate(m_BtnMaxPS, second_column_start, y, second_column_start + normal_edit_width, y + element_height, "m_BtnMaxPS", "Max PS"))                                                               return false;
          if (!EditCreate(m_EdtPosSize, third_column_start, y, third_column_start + normal_edit_width, y + element_height, "m_EdtPosSize", "", "In lots"))                                                      return false;
          if (ShowPipValue)
          {         y += element_height + v_spacing;
                    if (!LabelCreate(m_LblPipValue, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblPipValue", "Pip value:", "Point value actually"))                                return false;
                    if (!EditCreate(m_EdtPipValue, third_column_start, y, third_column_start + normal_edit_width, y + element_height, "m_EdtPipValue", ""))                                                    return false;
                    m_EdtPipValue.ReadOnly(true);
                    m_EdtPipValue.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE); }
          y += element_height + v_spacing;
          // EarnForex URL
          if (!LabelCreate(m_LblURL, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblURL", "www.earnforex.com"))                                         return false;
          m_LblURL.FontSize(8);
          m_LblURL.Color(C'0,115,66'); // Green
// Portfolio Risk
          // Reset
          y = row_start + element_height + 3 * v_spacing;
          if (!CheckBoxCreate(m_ChkCountPendings, first_column_start, y, panel_end, y + element_height, "m_ChkCountPendings", "Count pending orders"))          return false;
          y += element_height + v_spacing;
          if (!CheckBoxCreate(m_ChkIgnoreOrders, first_column_start, y, panel_end, y + element_height, "m_ChkIgnoreOrders", "Ignore orders without stop-loss/take-profit")) return false;
          y += element_height + v_spacing;
          if (!CheckBoxCreate(m_ChkIgnoreOtherSymbols, first_column_start, y, panel_end, y + element_height, "m_ChkIgnoreOtherSymbols", "Ignore orders in other symbols")) return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblCurrentRiskMoney, second_risk_column_start, y, second_risk_column_start + narrow_label_width, y + element_height, "m_LblCurrentRiskMoney", "Risk $"))                                               return false;
          if (!LabelCreate(m_LblCurrentRiskPerc, third_risk_column_start, y, third_risk_column_start + narrowest_label_width, y + element_height, "m_LblCurrentRiskPerc", "Risk %"))                                                    return false;
          if (!LabelCreate(m_LblCurrentLots, fourth_risk_column_start, y, fourth_risk_column_start + narrowest_label_width, y + element_height, "m_LblCurrentLots", "Lots"))                                                    return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblCurrentPortfolio, first_column_start, y, second_risk_column_start, y + element_height, "m_LblCurrentPortfolio", "Current portfolio:", "Trades that are currently open"))                            return false;
          if (!EditCreate(m_EdtCurRiskM, second_risk_column_start, y, second_risk_column_start + normal_edit_width, y + element_height, "m_EdtCurRiskM", ""))                                                   return false;
          m_EdtCurRiskM.ReadOnly(true);
          m_EdtCurRiskM.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          if (!EditCreate(m_EdtCurRiskP, third_risk_column_start, y, third_risk_column_start + risk_perc_edit_width, y + element_height, "m_EdtCurRiskP", ""))                                                  return false;
          m_EdtCurRiskP.ReadOnly(true);
          m_EdtCurRiskP.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          if (!EditCreate(m_EdtCurL, fourth_risk_column_start, y, fourth_risk_column_start + risk_lot_edit, y + element_height, "m_EdtCurL", ""))                                                   return false;
          m_EdtCurL.ReadOnly(true);
          m_EdtCurL.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblCurrentProfitMoney, second_risk_column_start, y, second_risk_column_start + narrow_label_width, y + element_height, "m_LblCurrentProfitMoney", "Reward $"))                                                     return false;
          if (!LabelCreate(m_LblCurrentProfitPerc, third_risk_column_start, y, third_risk_column_start + narrowest_label_width, y + element_height, "m_LblCurrentProfitPerc", "Reward %"))                                                  return false;
          y += element_height + v_spacing;
          if (!EditCreate(m_EdtCurProfitM, second_risk_column_start, y, second_risk_column_start + normal_edit_width, y + element_height, "m_EdtCurProfitM", ""))                                                   return false;
          m_EdtCurProfitM.ReadOnly(true);
          m_EdtCurProfitM.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          if (!EditCreate(m_EdtCurProfitP, third_risk_column_start, y, third_risk_column_start + risk_perc_edit_width, y + element_height, "m_EdtCurProfitP", ""))                                                  return false;
          m_EdtCurProfitP.ReadOnly(true);
          m_EdtCurProfitP.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblPotentialRiskMoney, second_risk_column_start, y, second_risk_column_start + narrow_label_width, y + element_height, "m_LblPotentialRiskMoney", "Risk $"))                                               return false;
          if (!LabelCreate(m_LblPotentialRiskPerc, third_risk_column_start, y, third_risk_column_start + narrowest_label_width, y + element_height, "m_LblPotentialRiskPerc", "Risk %"))                                                    return false;
          if (!LabelCreate(m_LblPotentialLots, fourth_risk_column_start, y, fourth_risk_column_start + narrowest_label_width, y + element_height, "m_LblPotentialLots", "Lots"))                                                    return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblPotentialPortfolio, first_column_start, y, second_risk_column_start, y + element_height, "m_LblPotentialPortfolio", "Potential portfolio:", "Including the position being calculated"))                         return false;
          if (!EditCreate(m_EdtPotRiskM, second_risk_column_start, y, second_risk_column_start + normal_edit_width, y + element_height, "m_EdtPotRiskM", ""))                                                   return false;
          m_EdtPotRiskM.ReadOnly(true);
          m_EdtPotRiskM.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          if (!EditCreate(m_EdtPotRiskP, third_risk_column_start, y, third_risk_column_start + risk_perc_edit_width, y + element_height, "m_EdtPotRiskP", ""))                                                  return false;
          m_EdtPotRiskP.ReadOnly(true);
          m_EdtPotRiskP.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          if (!EditCreate(m_EdtPotL, fourth_risk_column_start, y, fourth_risk_column_start + risk_lot_edit, y + element_height, "m_EdtPotL", ""))                                                   return false;
          m_EdtPotL.ReadOnly(true);
          m_EdtPotL.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblPotentialProfitMoney, second_risk_column_start, y, second_risk_column_start + narrow_edit_width, y + element_height, "m_LblPotentialProfitMoney", "Reward $"))                                                  return false;
          if (!LabelCreate(m_LblPotentialProfitPerc, third_risk_column_start, y, third_risk_column_start + narrowest_label_width, y + element_height, "m_LblPotentialProfitPerc", "Reward %"))                                                  return false;
          y += element_height + v_spacing;
          if (!EditCreate(m_EdtPotProfitM, second_risk_column_start, y, second_risk_column_start + normal_edit_width, y + element_height, "m_EdtPotProfitM", ""))                                                   return false;
          m_EdtPotProfitM.ReadOnly(true);
          m_EdtPotProfitM.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          if (!EditCreate(m_EdtPotProfitP, third_risk_column_start, y, third_risk_column_start + risk_perc_edit_width, y + element_height, "m_EdtPotProfitP", ""))                                                  return false;
          m_EdtPotProfitP.ReadOnly(true);
          m_EdtPotProfitP.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
// Margin
          // Reset
          y = row_start + element_height + 3 * v_spacing;
          if (!LabelCreate(m_LblPosMargin, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblPosMargin", "Position margin:"))                               return false;
          if (!EditCreate(m_EdtPosMargin, second_margin_column_start, y, second_margin_column_start + wide_edit_width, y + element_height, "m_EdtPosMargin", ""))                                                   return false;
          m_EdtPosMargin.ReadOnly(true);
          m_EdtPosMargin.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblUsedMargin, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblUsedMargin", "Future used margin:"))                      return false;
          if (!EditCreate(m_EdtUsedMargin, second_margin_column_start, y, second_margin_column_start + wide_edit_width, y + element_height, "m_EdtUsedMargin", "            "))                              return false;
          m_EdtUsedMargin.ReadOnly(true);
          m_EdtUsedMargin.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblFreeMargin, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblFreeMargin", "Future free margin:"))                          return false;
          if (!EditCreate(m_EdtFreeMargin, second_margin_column_start, y, second_margin_column_start + wide_edit_width, y + element_height, "m_EdtFreeMargin", ""))                                                 return false;
          m_EdtFreeMargin.ReadOnly(true);
          m_EdtFreeMargin.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblCustomLeverage, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblCustomLeverage", "Custom leverage = 1:"))                         return false;
          if (!EditCreate(m_EdtCustomLeverage, second_margin_column_start - (int)MathRound(10 * m_DPIScale), y, second_margin_column_start + leverage_edit_width, y + element_height, "m_CustomLeverage", ""))                                              return false;
          if (!LabelCreate(m_LblAccLeverage, second_margin_column_start + leverage_edit_width + (int)MathRound(5 * m_DPIScale), y, second_margin_column_start + leverage_edit_width + (int)MathRound(5 * m_DPIScale) + wide_edit_width, y + element_height, "m_LblAccLeverage", ""))                        return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblSymbolLeverage, second_margin_column_start + leverage_edit_width + (int)MathRound(5 * m_DPIScale), y, second_margin_column_start + leverage_edit_width + (int)MathRound(5 * m_DPIScale) + wide_edit_width, y + element_height, "m_LblSymbolLeverage", "(Symbol = 1:?)"))                        return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblMaxPositionSizeByMargin, first_column_start, y, first_column_start + wide_label_width, y + element_height, "m_LblMaxPositionSizeByMargin", "Maximum position size by margin:"))                         return false;
          if (!EditCreate(m_EdtMaxPositionSizeByMargin, max_psc_column_start, y, max_psc_column_start + max_psc_edit_width, y + element_height, "m_EdtMaxPositionSizeByMargin", "", "In lots"))                                                 return false;
          m_EdtMaxPositionSizeByMargin.ReadOnly(true);
          m_EdtMaxPositionSizeByMargin.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
// Swaps
          // Reset
          y = row_start + element_height + 3 * v_spacing;
          if (!LabelCreate(m_LblSwapsType, first_column_start, y, first_column_start + narrow_edit_width, y + element_height, "m_LblSwapsType", "Type:"))                                       return false;
          if (!EditCreate(m_EdtSwapsType, first_column_start + narrow_edit_width, y, second_swaps_column_start + swap_type_edit_width, y + element_height, "m_EdtSwapsType", "Unknown"))                                                return false;
          m_EdtSwapsType.ReadOnly(true);
          m_EdtSwapsType.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblSwapsTripleDay, first_column_start, y, first_column_start + narrow_edit_width, y + element_height, "m_LblSwapsTripleDay", "Triple swap:"))                                          return false;
          if (!EditCreate(m_EdtSwapsTripleDay, first_column_start + narrow_edit_width, y, second_swaps_column_start + swap_type_edit_width, y + element_height, "m_EdtSwapsTripleDay", "?"))                                                return false;
          m_EdtSwapsTripleDay.ReadOnly(true);
          m_EdtSwapsTripleDay.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblSwapsLong, second_swaps_column_start, y, second_swaps_column_start + narrow_edit_width, y + element_height, "m_LblSwapsLong", "Long"))                                          return false;
          if (!LabelCreate(m_LblSwapsShort, third_swaps_column_start, y, third_swaps_column_start + narrow_edit_width, y + element_height, "m_LblSwapsShort", "Short"))                                         return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblSwapsNominal, first_column_start, y, first_column_start + narrowest_label_width, y + element_height, "m_LblSwapsNominal", "Nominal:"))                                          return false;
          if (!EditCreate(m_EdtSwapsNominalLong, second_swaps_column_start, y, second_swaps_column_start + swap_size_edit_width, y + element_height, "m_EdtSwapsNominalLong", "?"))                                                 return false;
          if (!EditCreate(m_EdtSwapsNominalShort, third_swaps_column_start, y, third_swaps_column_start + swap_size_edit_width, y + element_height, "m_EdtSwapsNominalShort", "?"))                                                 return false;
          m_EdtSwapsNominalLong.ReadOnly(true);
          m_EdtSwapsNominalLong.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          m_EdtSwapsNominalShort.ReadOnly(true);
          m_EdtSwapsNominalShort.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblSwapsDaily, first_column_start, y, first_column_start + narrowest_label_width, y + element_height, "m_LblSwapsDaily", "Daily:"))                                        return false;
          if (!EditCreate(m_EdtSwapsDailyLongLot, second_swaps_column_start, y, second_swaps_column_start + swap_size_edit_width, y + element_height, "m_EdtSwapsDailyLongLot", "?"))                                               return false;
          if (!EditCreate(m_EdtSwapsDailyShortLot, third_swaps_column_start, y, third_swaps_column_start + swap_size_edit_width, y + element_height, "m_EdtSwapsDailyShortLot", "?"))                                               return false;
          if (!LabelCreate(m_LblSwapsPerLotDaily, fourth_swaps_column_start, y, fourth_swaps_column_start + swap_last_label_width, y + element_height, "m_LblSwapsPerLotDaily", "USD per lot"))                                         return false;
          m_EdtSwapsDailyLongLot.ReadOnly(true);
          m_EdtSwapsDailyLongLot.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          m_EdtSwapsDailyShortLot.ReadOnly(true);
          m_EdtSwapsDailyShortLot.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!EditCreate(m_EdtSwapsDailyLongPS, second_swaps_column_start, y, second_swaps_column_start + swap_size_edit_width, y + element_height, "m_EdtSwapsDailyLongPS", "?"))                                                 return false;
          if (!EditCreate(m_EdtSwapsDailyShortPS, third_swaps_column_start, y, third_swaps_column_start + swap_size_edit_width, y + element_height, "m_EdtSwapsDailyShortPS", "?"))                                                 return false;
          if (!LabelCreate(m_LblSwapsPerPSDaily, fourth_swaps_column_start, y, fourth_swaps_column_start + swap_last_label_width, y + element_height, "m_LblSwapsPerPSDaily", "USD per PS ()"))                                         return false;
          m_EdtSwapsDailyLongPS.ReadOnly(true);
          m_EdtSwapsDailyLongPS.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          m_EdtSwapsDailyShortPS.ReadOnly(true);
          m_EdtSwapsDailyShortPS.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblSwapsYearly, first_column_start, y, first_column_start + narrowest_label_width, y + element_height, "m_LblSwapsYearly", "Yearly:"))                                         return false;
          if (!EditCreate(m_EdtSwapsYearlyLongLot, second_swaps_column_start, y, second_swaps_column_start + swap_size_edit_width, y + element_height, "m_EdtSwapsYearlyLongLot", "?"))                                                 return false;
          if (!EditCreate(m_EdtSwapsYearlyShortLot, third_swaps_column_start, y, third_swaps_column_start + swap_size_edit_width, y + element_height, "m_EdtSwapsYearlyShortLot", "?"))                                                 return false;
          if (!LabelCreate(m_LblSwapsPerLotYearly, fourth_swaps_column_start, y, fourth_swaps_column_start + swap_last_label_width, y + element_height, "m_LblSwapsPerLotYearly", "USD per lot"))                                       return false;
          m_EdtSwapsYearlyLongLot.ReadOnly(true);
          m_EdtSwapsYearlyLongLot.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          m_EdtSwapsYearlyShortLot.ReadOnly(true);
          m_EdtSwapsYearlyShortLot.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          y += element_height + v_spacing;
          if (!EditCreate(m_EdtSwapsYearlyLongPS, second_swaps_column_start, y, second_swaps_column_start + swap_size_edit_width, y + element_height, "m_EdtSwapsYearlyLongPS", "?"))                                               return false;
          if (!EditCreate(m_EdtSwapsYearlyShortPS, third_swaps_column_start, y, third_swaps_column_start + swap_size_edit_width, y + element_height, "m_EdtSwapsYearlyShortPS", "?"))                                               return false;
          if (!LabelCreate(m_LblSwapsPerPSYearly, fourth_swaps_column_start, y, fourth_swaps_column_start + swap_last_label_width, y + element_height, "m_LblSwapsPerPSYearly", "USD per PS ()"))                                       return false;
          m_EdtSwapsYearlyLongPS.ReadOnly(true);
          m_EdtSwapsYearlyLongPS.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
          m_EdtSwapsYearlyShortPS.ReadOnly(true);
          m_EdtSwapsYearlyShortPS.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
// Script
          // Reset
          y = row_start + element_height + 3 * v_spacing;
          if (!LabelCreate(m_LblScriptExplanation, first_column_start, y, panel_end, y + element_height, "m_LblScriptExplanation", "Set_tings for PSC-Trader script."))                                          return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblMagicNumber, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblMagicNumber", "Magic number:"))                                          return false;
          if (!EditCreate(m_EdtMagicNumber, second_script_column_start, y, second_script_column_start + normal_edit_width, y + element_height, "m_EdtMagicNumber", ""))                                                 return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblScriptCommentary, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblScriptCommentary", "ct_Order commentary:"))                                        return false;
          if (!EditCreate(m_EdtScriptCommentary, second_script_column_start, y, second_script_column_start + normal_edit_width, y + element_height, "m_EdtScriptCommentary", ""))                                               return false;
          y += element_height + v_spacing;
          if (!CheckBoxCreate(m_ChkDisableTradingWhenLinesAreHidden, first_column_start, y, panel_end, y + element_height, "m_ChkDisableTradingWhenLinesAreHidden", "Disable trading when lines are hidden"))           return false;
          y += element_height + v_spacing;
          // Need multiple TP targets.
          if (ScriptTakePorfitsNumber > 1)
          {         if (!LabelCreate(CalculatorPad_OrderTP.m_LblScriptTP, multi_tp_column_start, y, multi_tp_column_start + multi_tp_label_width, y + element_height, "CalculatorPad_OrderTP.m_LblScriptTP", "TP"))                                        return false;
                    if (!ButtonCreate(m_BtnTPsInward, multi_tp_button_start, y, multi_tp_button_start + leverage_edit_width, y + element_height, "m_BtnTPsInward", "<<", "Fill additional TPs equidistantly between Entry and Main TP."))                                          return false;
                    if (!ButtonCreate(m_BtnTPsOutward, multi_tp_button_start + leverage_edit_width + v_spacing, y, multi_tp_button_start + 2 * leverage_edit_width + v_spacing, y + element_height, "m_BtnTPsOutward", ">>", "Place additional TPs beyond the Main TP using the same distance."))                                          return false;
                    if (!LabelCreate(CalculatorPad_OrderTP.m_LblScriptTPShare, third_script_column_start, y, third_script_column_start + normal_edit_width, y + element_height, "CalculatorPad_OrderTP.m_LblScriptTPShare", "Share, %"))                                       return false;
                    y += element_height + v_spacing;
                    ArrayResize(CalculatorPad_OrderTP.ScriptTPLabels, ScriptTakePorfitsNumber);
                    ArrayResize(CalculatorPad_OrderTP.ScriptTPEdits, ScriptTakePorfitsNumber);
                    ArrayResize(CalculatorPad_OrderTP.ScriptTPShareEdits, ScriptTakePorfitsNumber);
                    for (int i = 0; i < ScriptTakePorfitsNumber; i++)
                    {         if (!LabelCreate(CalculatorPad_OrderTP.ScriptTPLabels[i], first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblScriptTPLabel" + IntegerToString(i + 1), "Take-profit " + IntegerToString(i + 1)))                                        return false;
                              if (!EditCreate(CalculatorPad_OrderTP.ScriptTPEdits[i], multi_tp_column_start, y, second_script_column_start + normal_edit_width, y + element_height, "m_EdtScriptTPEdit" + IntegerToString(i + 1), ""))                                              return false;
                              if (!EditCreate(CalculatorPad_OrderTP.ScriptTPShareEdits[i], third_script_column_start, y, third_script_column_start + leverage_edit_width, y + element_height, "m_EdtScriptTPShareEdit" + IntegerToString(i + 1), ""))                                               return false;
                              y += element_height + v_spacing; } }
          if (!LabelCreate(m_LblScriptPips, second_script_column_start, y, second_script_column_start + normal_edit_width, y + element_height, "m_LblScriptPips", "Pips", "Points actually"))                                       return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblMaxSlippage, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblMaxSlippage", "Max slippage:"))                                          return false;
          if (!EditCreate(m_EdtMaxSlippage, second_script_column_start, y, second_script_column_start + normal_edit_width, y + element_height, "m_EdtMaxSlippage", ""))                                                 return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblMaxSpread, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblMaxSpread", "Max spread:"))                                        return false;
          if (!EditCreate(m_EdtMaxSpread, second_script_column_start, y, second_script_column_start + normal_edit_width, y + element_height, "m_EdtMaxSpread", ""))                                                 return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblMaxEntrySLDistance, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblMaxEntrySLDistance", "Max Entry/SL distance:"))                                       return false;
          if (!EditCreate(m_EdtMaxEntrySLDistance, second_script_column_start, y, second_script_column_start + normal_edit_width, y + element_height, "m_EdtMaxEntrySLDistance", ""))                                               return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblMinEntrySLDistance, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblMinEntrySLDistance", "Min Entry/SL distance:"))                                       return false;
          if (!EditCreate(m_EdtMinEntrySLDistance, second_script_column_start, y, second_script_column_start + normal_edit_width, y + element_height, "m_EdtMinEntrySLDistance", ""))                                               return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblScriptLots, second_script_column_start, y, second_script_column_start + normal_edit_width, y + element_height, "m_LblScriptLots", "Lots"))                                          return false;
          y += element_height + v_spacing;
          if (!LabelCreate(m_LblMaxPositionSize, first_column_start, y, first_column_start + normal_label_width, y + element_height, "m_LblMaxPositionSize", "Max position size:"))                                         return false;
          if (!EditCreate(m_EdtMaxPositionSize, second_script_column_start, y, second_script_column_start + normal_edit_width, y + element_height, "m_EdtMaxPositionSize", ""))                                                 return false;
          y += element_height + v_spacing;
          if (!CheckBoxCreate(m_ChkSubtractPositions, first_column_start, y, panel_end, y + element_height, "m_ChkSubtractPositions", "Subtract open positions volume", "PSC-Trader will subtract currently open trades' volume from the calculated position size before opening a trade."))            return false;
          y += element_height + v_spacing;
          if (!CheckBoxCreate(m_ChkSubtractPendingOrders, first_column_start, y, panel_end, y + element_height, "m_ChkSubtractPendingOrders", "Subtract pending orders volume", "PSC-Trader will subtract pending orders' volume from the calculated position size before opening a trade."))           return false;
          y += element_height + v_spacing;
          if (!CheckBoxCreate(m_ChkDoNotApplyStopLoss, first_column_start, y, panel_end, y + element_height, "m_ChkDoNotApplyStopLoss", "Do not apply stop-loss", "PSC-Trader won't apply stop-loss to the trade it opens."))           return false;
          y += element_height + v_spacing;
          if (!CheckBoxCreate(m_ChkDoNotApplyTakeProfit, first_column_start, y, panel_end, y + element_height, "m_ChkDoNotApplyTakeProfit", "Do not apply take-profit", "PSC-Trader won't apply take-prfoit to the trade it opens."))           return false;
          y += element_height + v_spacing;
          if (!CheckBoxCreate(m_ChkAskForConfirmation, first_column_start, y, panel_end, y + element_height, "m_ChkAskForConfirmation", "Ask for confirmation", "PSC-Trader will ask for confirmation before opening a trade."))            return false;
          InitObjects();
          return true; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_CalculatorPad::InitObjects()
{         //+-------------------------------------+
          //| Align text in all objects.          |
          //+-------------------------------------+
          ENUM_ALIGN_MODE align = ALIGN_RIGHT;
          if (!m_EdtEntryLevel.TextAlign(align))                                   return false;
          if (!m_EdtSL.TextAlign(align))                                           return false;
          if (!m_EdtTP.TextAlign(align))                                           return false;
          if (ScriptTakePorfitsNumber > 1)
                    for (int i = 0; i < ScriptTakePorfitsNumber - 1; i++)
                              if (!CalculatorPad_OrderTP.AdditionalTPEdits[i].TextAlign(align))                      return false;
          if (!m_EdtCommissionSize.TextAlign(align))                               return false;
          if (!HideAccSize) if (!m_EdtAccount.TextAlign(align))                    return false;
          if (!m_EdtRiskPIn.TextAlign(align))                                      return false;
          if (!m_EdtRiskPRes.TextAlign(align))                                     return false;
          if (!m_EdtRiskMIn.TextAlign(align))                                      return false;
          if (!m_EdtRiskMRes.TextAlign(align))                                     return false;
          if (!m_EdtReward1.TextAlign(align))                                      return false;
          if (!m_EdtReward2.TextAlign(align))                                      return false;
          if (!m_EdtRR1.TextAlign(align))                                          return false;
          if (!m_EdtRR2.TextAlign(align))                                          return false;
          if (!m_EdtPosSize.TextAlign(align))                                      return false;
          if (ShowATROptions)
          {         if (!m_EdtATRPeriod.TextAlign(align))                                return false;
                    if (!m_EdtATRMultiplierSL.TextAlign(align))                          return false;
                    if (!m_EdtATRMultiplierTP.TextAlign(align))                          return false; }
          if (ShowPipValue) if (!m_EdtPipValue.TextAlign(align))                   return false;
          if (!m_EdtCurRiskM.TextAlign(align))                                     return false;
          if (!m_EdtCurRiskP.TextAlign(align))                                     return false;
          if (!m_EdtCurProfitM.TextAlign(align))                                   return false;
          if (!m_EdtCurProfitP.TextAlign(align))                                   return false;
          if (!m_EdtCurL.TextAlign(align))                                         return false;
          if (!m_EdtPotRiskM.TextAlign(align))                                     return false;
          if (!m_EdtPotRiskP.TextAlign(align))                                     return false;
          if (!m_EdtPotProfitM.TextAlign(align))                                   return false;
          if (!m_EdtPotProfitP.TextAlign(align))                                   return false;
          if (!m_EdtPotL.TextAlign(align))                                         return false;
          if (!m_EdtPosMargin.TextAlign(align))                                    return false;
          if (!m_EdtUsedMargin.TextAlign(align))                                   return false;
          if (!m_EdtFreeMargin.TextAlign(align))                                   return false;
          if (!m_EdtMaxPositionSizeByMargin.TextAlign(align))                      return false;
          if (!m_EdtSwapsNominalLong.TextAlign(align))                             return false;
          if (!m_EdtSwapsNominalShort.TextAlign(align))                            return false;
          if (!m_EdtSwapsDailyLongLot.TextAlign(align))                            return false;
          if (!m_EdtSwapsDailyShortLot.TextAlign(align))                           return false;
          if (!m_EdtSwapsDailyLongPS.TextAlign(align))                             return false;
          if (!m_EdtSwapsDailyShortPS.TextAlign(align))                            return false;
          if (!m_EdtSwapsYearlyLongLot.TextAlign(align))                           return false;
          if (!m_EdtSwapsYearlyShortLot.TextAlign(align))                          return false;
          if (!m_EdtSwapsYearlyLongPS.TextAlign(align))                            return false;
          if (!m_EdtSwapsYearlyShortPS.TextAlign(align))                           return false;
          if (!m_EdtMagicNumber.TextAlign(align))                                  return false;
          // Multiple TP targets.
          if (ScriptTakePorfitsNumber > 1)
          {         for (int i = 0; i < ScriptTakePorfitsNumber; i++)
                    {         if (!CalculatorPad_OrderTP.ScriptTPEdits[i].TextAlign(align))                          return false;
                              if (!CalculatorPad_OrderTP.ScriptTPShareEdits[i].TextAlign(align))                     return false; } }
          if (!m_EdtMaxSlippage.TextAlign(align))                                  return false;
          if (!m_EdtMaxSpread.TextAlign(align))                                    return false;
          if (!m_EdtMaxEntrySLDistance.TextAlign(align))                           return false;
          if (!m_EdtMinEntrySLDistance.TextAlign(align))                           return false;
          if (!m_EdtMaxPositionSize.TextAlign(align))                              return false;
          if (sets.TPLockedOnSL) m_BtnTakeProfit.ColorBackground(CONTROLSg_BUTTON_COLOR_ENABLE);
          else m_BtnTakeProfit.ColorBackground(CONTROLSg_BUTTON_COLOR_BG);
          //+-------------+
          //| Init values.|
          //+-------------+
          HideRisk();
          HideMargin();
          HideMain();
          HideSwaps();
          HideScript();
          if (sets.SelectedTab == MainTab) ShowMain();
          else if (sets.SelectedTab == RiskTab) ShowRisk();
          else if (sets.SelectedTab == MarginTab) ShowMargin();
          else if (sets.SelectedTab == SwapsTab) ShowSwaps();
          else if (sets.SelectedTab == ScriptTab) ShowScript();
          if ((TP_Multiplier < 0.999) || (TP_Multiplier > 1.001))
          {         if (!UseFixedTPDistance)
                    {         if (!m_BtnTakeProfit.Text("Take-profit x " + DoubleToString(TP_Multiplier, Utilities.CountDecimalPlaces(TP_Multiplier)) + ":")) return false; }
                    else if (!m_BtnTakeProfit.Text("TP x " + DoubleToString(TP_Multiplier, Utilities.CountDecimalPlaces(TP_Multiplier)) + ":")) return false; }
          if (sets.EntryType)
          {         if (!m_BtnOrderType.Text("Pending"))                                  return false; }
          else
          {         if (!m_BtnOrderType.Text("Instant"))                                  return false;
                    m_EdtEntryLevel.ReadOnly(true);
                    m_EdtEntryLevel.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE); }
          double acc_val;
          if (!HideAccSize)
          {         switch(sets.AccountButton)
          {                   default:
                              case Balance:
                                        if (!m_BtnAccount.Text("Account balance"))                                 return false;
                                        // Custom balance.
                                        if (CustomBalance > 0) acc_val = CustomBalance;
                                        else acc_val = AccountInfoDouble(ACCOUNT_BALANCE);
                                        // Account balance editable.
                                        m_EdtAccount.ReadOnly(false);
                                        m_EdtAccount.ColorBackground(CONTROLS_EDIT_COLOR_ENABLE);
                                        break;
                              case Equity:
                                        if (!m_BtnAccount.Text("Account equity"))                          return false;
                                        acc_val = AccountInfoDouble(ACCOUNT_EQUITY);
                                        // Account balance uneditable.
                                        m_EdtAccount.ReadOnly(true);
                                        m_EdtAccount.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
                                        break;
                              case Balance_minus_Risk:
                                        if (!m_BtnAccount.Text("Balance - CPR"))                               return false;
                                        // Custom balance.
                                        if (CustomBalance > 0) acc_val = CustomBalance;
                                        else acc_val = AccountInfoDouble(ACCOUNT_BALANCE);
                                        // Account balance uneditable.
                                        m_EdtAccount.ReadOnly(true);
                                        m_EdtAccount.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
                                        break; }
                    // Applying additional funds (e.g. bank balance or total net worth, etc.).
                    if (CustomBalance <= 0) acc_val += AdditionalFunds;
                    if (!m_EdtAccount.Text(DoubleToString(acc_val, 2)))                           return false;
                    // Star to show that it is not original account balance.
                    if ((AdditionalFunds >= 0.01) || (AdditionalFunds <= -0.01) || ((CustomBalance > 0) && (sets.AccountButton != Equity))) m_LblFundsAsterisk.Show();
                    else m_LblFundsAsterisk.Hide(); }
          if (QuickRisk1 > 0)
          {         int digits = 2;
                    if (QuickRisk1 >= 100) digits = 0;
                    else if (QuickRisk1 >= 10) digits = 1;
                    if (!m_BtnQuickRisk1.Text(DoubleToString(QuickRisk1, digits))) return false; }
          if (QuickRisk2 > 0)
          {         int digits = 2;
                    if (QuickRisk2 >= 100) digits = 0;
                    else if (QuickRisk2 >= 10) digits = 1;
                    if (!m_BtnQuickRisk2.Text(DoubleToString(QuickRisk2, digits))) return false; }
          if (!m_EdtRiskPIn.Text(DoubleToString(sets.Risk, 2)))                    return false;
          if (!m_EdtRiskMIn.Text(DoubleToString(sets.MoneyRisk, 2)))               return false;
          if (ShowATROptions)
          {         if (!m_EdtATRPeriod.Text(IntegerToString(sets.ATRPeriod)))               return false;
                    if (!m_EdtATRMultiplierSL.Text(DoubleToString(sets.ATRMultiplierSL, 2))) return false;
                    if (!m_EdtATRMultiplierTP.Text(DoubleToString(sets.ATRMultiplierTP, 2))) return false;
                    if (sets.ATRTimeframe != PERIOD_CURRENT) m_BtnATRTimeframe.Text(EnumToString(sets.ATRTimeframe));
                    else m_BtnATRTimeframe.Text("CURRENT"); }
          if (!m_ChkCountPendings.Checked(sets.CountPendingOrders))                return false;
          if (!m_ChkIgnoreOrders.Checked(sets.IgnoreOrdersWithoutStopLoss))        return false;
          if (!m_ChkIgnoreOtherSymbols.Checked(sets.IgnoreOtherSymbols))           return false;
          // Show/hide RiskReward
          if (sets.TakeProfitLevel == 0)
          {         if (!m_LblRR.Hide())                                                  return false;
                    if (!m_EdtRR1.Hide())                                                 return false;
                    if (!m_EdtRR2.Hide())                                                 return false;
                    if (!m_LblReward.Hide())                                              return false;
                    if (!m_EdtReward1.Hide())                                             return false;
                    if (!m_EdtReward2.Hide())                                             return false; }
          PositionData_Leverage.Leverage_Custom = sets.CustomLeverage;
          // Script
          if (!m_EdtMagicNumber.Text(IntegerToString(sets.MagicNumber)))                                return false;
          if (!m_EdtScriptCommentary.Text(sets.ScriptCommentary))                                       return false;
          if (!m_ChkDisableTradingWhenLinesAreHidden.Checked(sets.DisableTradingWhenLinesAreHidden)) return false;
          if (!m_EdtMaxSlippage.Text(IntegerToString(sets.MaxSlippage)))                                return false;
          if (!m_EdtMaxSpread.Text(IntegerToString(sets.MaxSpread)))                                    return false;
          if (!m_EdtMaxEntrySLDistance.Text(IntegerToString(sets.MaxEntrySLDistance)))               return false;
          if (!m_EdtMinEntrySLDistance.Text(IntegerToString(sets.MinEntrySLDistance)))               return false;
          if (!m_ChkSubtractPositions.Checked(sets.SubtractPositions))                               return false;
          if (!m_ChkSubtractPendingOrders.Checked(sets.SubtractPendingOrders))                       return false;
          if (!m_ChkDoNotApplyStopLoss.Checked(sets.DoNotApplyStopLoss))                             return false;
          if (!m_ChkDoNotApplyTakeProfit.Checked(sets.DoNotApplyTakeProfit))                         return false;
          if (!m_ChkAskForConfirmation.Checked(sets.AskForConfirmation))                             return false;
          MoveAndResize();
          DisplayValues();
          if (sets.ShowLines == false)
          {         ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS); } }
          else
          {         ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS); } }
          return true; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// Moves elements on the panel depending on the choice of showing TP-related stuff, risk, and margin.
// Adjusts panel's height accordingly.
void C_CalculatorPad::MoveAndResize()
{         int col_height = (int)MathRound(24 * m_DPIScale);
          int new_height = col_height;
          int ref_point;
          switch(sets.SelectedTab)
          {         case MainTab:
                              ref_point = m_LblRiskM.Top();
                              if (sets.TakeProfitLevel == 0)
                              {         m_LblPosSize.Move(m_LblPosSize.Left(), ref_point + 1 * col_height);
                                        m_BtnMaxPS.Move(m_BtnMaxPS.Left(), ref_point + 1 * col_height);
                                        m_EdtPosSize.Move(m_EdtPosSize.Left(), ref_point + 1 * col_height);
                                        ref_point = ref_point + 1 * col_height; }
                              else
                              {         m_LblReward.Move(m_LblReward.Left(), ref_point + 1 * col_height);
                                        m_EdtReward1.Move(m_EdtReward1.Left(), ref_point + 1 * col_height);
                                        m_EdtReward2.Move(m_EdtReward2.Left(), ref_point + 1 * col_height);
                                        m_LblRR.Move(m_LblRR.Left(), ref_point + 2 * col_height);
                                        m_EdtRR1.Move(m_EdtRR1.Left(), ref_point + 2 * col_height);
                                        m_EdtRR2.Move(m_EdtRR2.Left(), ref_point + 2 * col_height);
                                        m_LblPosSize.Move(m_LblPosSize.Left(), ref_point + 3 * col_height);
                                        m_BtnMaxPS.Move(m_BtnMaxPS.Left(), ref_point + 3 * col_height);
                                        m_EdtPosSize.Move(m_EdtPosSize.Left(), ref_point + 3 * col_height);
                                        ref_point = ref_point + 3 * col_height; }
                              if (ShowPipValue)
                              {         m_LblPipValue.Move(m_LblPipValue.Left(), ref_point + 1 * col_height);
                                        m_EdtPipValue.Move(m_EdtPipValue.Left(), ref_point + 1 * col_height);
                                        ref_point = ref_point + 1 * col_height; }
                              break;
                    case RiskTab:
                              ref_point = m_EdtPotProfitM.Top();
                              break;
                    case MarginTab:
                              ref_point = m_LblMaxPositionSizeByMargin.Top();
                              break;
                    case SwapsTab:
                              ref_point = m_LblSwapsPerPSYearly.Top();
                              break;
                    case ScriptTab:
                              ref_point = m_ChkAskForConfirmation.Top();
                              break;
                    default:
                              ref_point = m_LblRiskM.Top();
                              break; }
          m_LblURL.Move(m_LblURL.Left(), ref_point + col_height);
          new_height = m_LblURL.Top() + col_height - Top();
          if (!m_minimized)
          {         // Resize window.
                    Height(new_height);
                    // Needed only in case of initialization when actual panel maximization is avoided.
                    if (NoPanelMaximization) Width((int)MathRound(350 * m_DPIScale)); }
          NoPanelMaximization = false; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_CalculatorPad::DisplayValues()
{
//============================================
//setede valuse of varibels..
//============================================
          string acc_currency = AccountCurrency();
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          //=== Spread
          if (ShowSpread)      if (!Caption(PanelCaption + " Spread: " + IntegerToString(SymbolInfoInteger(Symbol(), SYMBOL_SPREAD)))) return false;
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          //=== Levels
          /* Entry Level    */ if (!m_EdtEntryLevel.Text(DoubleToString(sets.EntryLevel, _Digits)))                                  return false;
          if (!m_BtnEntry.Text(EnumToString(sets.TradeDirection)))                                          return false;
          /* Entry Warning  */ if (!m_LblEntryWarning.Text(CalculatorPad_OrderEntry.WarningEntry))                                                        return false;
          /* Stop-Loss      */ if (!UseFixedSLDistance)
          {         if (!m_EdtSL.Text(DoubleToString(sets.StopLossLevel, _Digits)))                                    return false; }
          else if (!m_EdtSL.Text(IntegerToString(sets.StopLoss)))                                   return false;
          /* SL Warning     */ if (!m_LblSLWarning.Text(CalculatorPad_OrderStopLoss.WarningSL))                                                              return false;
          /* Take Profit    */ if (!UseFixedTPDistance)
          {         if (!m_EdtTP.Text(DoubleToString(sets.TakeProfitLevel, _Digits)))                                  return false; }
          else if (!m_EdtTP.Text(IntegerToString(sets.TakeProfit)))                                     return false;
          for (int i = 1; i < ScriptTakePorfitsNumber; i++)
          {         if (!UseFixedTPDistance)
                    {         // Price level.
                              if (!CalculatorPad_OrderTP.AdditionalTPEdits[i - 1].Text(DoubleToString(sets.ScriptTP[i], _Digits)))               return false; }
                    else
                    {         // Points.
                              if (!CalculatorPad_OrderTP.AdditionalTPEdits[i - 1].Text(IntegerToString((int)MathRound(MathAbs(sets.ScriptTP[i] - sets.EntryLevel) / _Point))))               return false; } }
          /* TP Warning     */ if (!m_LblTPWarning.Text(CalculatorPad_OrderTP.WarningTP))                                                              return false;
          for (int i = 1; i < ScriptTakePorfitsNumber; i++)
          {         CalculatorPad_OrderTP.AdditionalTPWarnings[i - 1].Text(CalculatorPad_OrderTP.AdditionalWarningTP[i - 1]); }
          /* Account Value  */ if (!HideAccSize) if (!m_EdtAccount.Text(Utilities.FormatDouble(DoubleToString(ct_Drive.TDD.ct_Bank.ct_Positions.AccSize, 2))))                  return false;
          /* Account Asterisk */
          if (sets.SelectedTab == MainTab)
          {         switch(sets.AccountButton)
          {                   default:
                              case Balance:
                              case Balance_minus_Risk:
                                        if (sets.CustomBalance > 0)
                                        {         m_LblFundsAsterisk.Show();
                                                  ObjectSetString(ChartID(), m_name + "m_LblFundsAsterisk", OBJPROP_TOOLTIP, "Custom balance set"); }
                                        else
                                        {         m_LblFundsAsterisk.Hide(); }
                                        break;
                              case Equity:
                                        m_LblFundsAsterisk.Hide();
                                        break; }
                    if (sets.CustomBalance <= 0)
                    {         if (AdditionalFunds != 0)
                              {         m_LblFundsAsterisk.Show();
                                        string tooltip = "";
                                        if (AdditionalFunds > 0) tooltip = "+" + DoubleToString(AdditionalFunds, 2) + " additional funds";
                                        else if (AdditionalFunds < 0) tooltip = DoubleToString(-AdditionalFunds, 2) + " funds subtracted";
                                        ObjectSetString(ChartID(), m_name + "m_LblFundsAsterisk", OBJPROP_TOOLTIP, tooltip); } } }
          /* Lines */          if (sets.ShowLines)
          {         if (!m_BtnLines.Text("Hide lines"))                                                            return false; }
          else
          {         if (!m_BtnLines.Text("Show lines"))                                                            return false; }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          //=== ATR SL and TP
          if (ShowATROptions)
          {         double atr = iATR(_Symbol, sets.ATRTimeframe, sets.ATRPeriod, 0);
                    m_LblATRValue.Text("ATR = " + DoubleToString(atr, _Digits)); }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          //=== Commission, risk, position size
          /* Commission size*/ if (!m_EdtCommissionSize.Text(Utilities.FormatDouble(DoubleToString(sets.CommissionPerLot, 2))))            return false;
          /* Risk currency  */ if (acc_currency != "") if (!m_LblRiskM.Text("Risk, " + acc_currency + ":"))            return false;
          /* Risk In        */ if (!m_EdtRiskPIn.Text(Utilities.FormatDouble(DoubleToString(PositionData_RiskReward.DisplayRisk, 2))))                                 return false;
          /* Risk Money In  */ if (!m_EdtRiskMIn.Text(Utilities.FormatDouble(DoubleToString(PositionData_RiskReward.RiskMoney, 2))))                                   return false;
          /* Risk Money Out */ if (!m_EdtRiskMRes.Text(Utilities.FormatDouble(DoubleToString(PositionData_RiskReward.OutputRiskMoney))))                               return false;
          if ((PositionData_RiskReward.OutputRiskMoney != 0) && (ct_Drive.TDD.ct_Bank.ct_Positions.AccSize != 0))
          {         /* Risk Out       */ if (!m_EdtRiskPRes.Text(Utilities.FormatDouble(DoubleToString(Utilities.Round(PositionData_RiskReward.OutputRiskMoney / ct_Drive.TDD.ct_Bank.ct_Positions.AccSize * 100, 2), 2)))) return false; }
          else if (!m_EdtRiskPRes.Text("0")) return false;
          /* Reward currency*/ if (acc_currency != "") if (!m_LblReward.Text("Reward, " + acc_currency + ":"))         return false;
          /* Reward 1       */ if (!m_EdtReward1.Text(Utilities.FormatDouble(PositionData_RiskReward.InputReward)))                                                return false;
          /* Reward 2       */ if (!m_EdtReward2.Text(Utilities.FormatDouble(DoubleToString(PositionData_RiskReward.OutputReward, 2))))                            return false;
          /* Risk/Reward 1  */ if (!m_EdtRR1.Text(PositionData_RiskReward.InputRR))                                                                      return false;
          if (PositionData_RiskReward.InputRR == "Invalid TP") m_EdtRR1.Color(clrRed);
          else m_EdtRR1.Color(m_EdtTP.Color());
          if (StringToDouble(m_EdtTP.Text()) != 0)
          {         if (PositionData_RiskReward.InputRR == "") m_EdtRR1.Hide();
                    else if (m_EdtRR2.IsVisible()) m_EdtRR1.Show(); }
          /* Risk/Reward 2  */ if (!m_EdtRR2.Text(PositionData_RiskReward.OutputRR))                                                                         return false;
          if (PositionData_RiskReward.OutputRR == "Invalid TP") m_EdtRR2.Color(clrRed);
          else m_EdtRR2.Color(m_EdtTP.Color());
          /* Position size  */ if (!m_EdtPosSize.Text(Utilities.FormatDouble(DoubleToString(PositionData.OutputPositionSize, ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS), ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS)))                         return false;
          if (PositionData.OutputPositionSize > PositionData.OutputMaxPositionSize)
          {         m_EdtPosSize.Color(clrRed); // Calculated position size is greater than maximum position size by margin.
                    ObjectSetString(ChartID(), m_name + "m_EdtPosSize", OBJPROP_TOOLTIP, "Greater than maximum position size by margin!"); }
          else
          {         m_EdtPosSize.Color(m_EdtTP.Color());
                    ObjectSetString(ChartID(), m_name + "m_EdtPosSize", OBJPROP_TOOLTIP, "In lots"); }
          /* Pip value      */ if (ShowPipValue)
          {         if (acc_currency != "") if (!m_LblPipValue.Text("Pip value, " + acc_currency + ":")) return false;
                    if (!m_EdtPipValue.Text(PositionData.OutputPipValue))                                                        return false; }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          //=== Portfolio Risk
          /* Money label    */ if (acc_currency != "")
          {         if (!m_LblCurrentRiskMoney.Text("Risk " + acc_currency))                            return false;
                    if (!m_LblCurrentProfitMoney.Text("Reward " + acc_currency))                        return false;
                    if (!m_LblPotentialRiskMoney.Text("Risk " + acc_currency))                          return false;
                    if (!m_LblPotentialProfitMoney.Text("Reward " + acc_currency))                      return false; }
          /* Current Portfolio Risk $     */ if (!m_EdtCurRiskM.Text(PositionData_RiskReward.PLM))                                                       return false;
          /* Current Portfolio Risk %     */ if (!m_EdtCurRiskP.Text(PositionData_RiskReward.CPR))                                                       return false;
          /* Current Portfolio Lots       */ if (!m_EdtCurL.Text(PositionData_RiskReward.CPL))                                                           return false;
          /* Current Portfolio Profit $   */ if (!m_EdtCurProfitM.Text(PositionData_RiskReward.PRM))                                                     return false;
          /* Current Portfolio Profit %   */ if (!m_EdtCurProfitP.Text(PositionData_RiskReward.CPRew))                                                   return false;
          /* Potential Portfolio Risk $   */ if (!m_EdtPotRiskM.Text(PositionData_RiskReward.PPMR))                                                      return false;
          /* Potential Portfolio Risk %   */ if (!m_EdtPotRiskP.Text(PositionData_RiskReward.PPR))                                                       return false;
          /* Potential Portfolio Profit $ */ if (!m_EdtPotProfitM.Text(PositionData_RiskReward.PPMRew))                                                  return false;
          /* Potential Portfolio Profit % */ if (!m_EdtPotProfitP.Text(PositionData_RiskReward.PPRew))                                                   return false;
          /* Potential Portfolio Lots     */ if (!m_EdtPotL.Text(PositionData_RiskReward.PPL))                                                           return false;
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          //=== Margin
          /* Position Margin         */ if (!m_EdtPosMargin.Text(Utilities.FormatDouble(DoubleToString(PositionData_Margin.PositionMargin, 2))))           return false;
          /* Future Used Margin      */ if (!m_EdtUsedMargin.Text(Utilities.FormatDouble(DoubleToString(PositionData_Margin.UsedMargin, 2))))              return false;
          /* Future Free Margin      */ if (!m_EdtFreeMargin.Text(Utilities.FormatDouble(DoubleToString(PositionData_Margin.FutureMargin, 2))))                return false;
          /* Custom Leverage             */ if (!m_EdtCustomLeverage.Text(IntegerToString(sets.CustomLeverage)))                     return false;
          string acc_lev = IntegerToString(AccountInfoInteger(ACCOUNT_LEVERAGE));
          /* Account Leverage   */ if (acc_lev != "") if (!m_LblAccLeverage.Text("(Default = 1:" + acc_lev + ")"))                       return false;
          /* Symbol Leverage    */ if (PositionData_Leverage.Leverage_Symbol) if (!m_LblSymbolLeverage.Text("(Symbol = 1:" + DoubleToString(PositionData_Leverage.Leverage_Symbol, 0) + ")")) return false;
          /* Max Position size  */ if (!m_EdtMaxPositionSizeByMargin.Text(Utilities.FormatDouble(DoubleToString(PositionData.OutputMaxPositionSize, ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS), ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS)))          return false;
          if (!PositionData_Symbol.IsStopOut) // Black
          {         m_LblFreeMargin.Color(C'40,41,59');
                    m_EdtFreeMargin.Color(C'40,41,59'); }
          else // Red
          {         m_LblFreeMargin.Color(clrRed);
                    m_EdtFreeMargin.Color(clrRed); }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          //=== Swaps
          /* Swaps Type                  */ if (!m_EdtSwapsType.Text            (PositionData_Swap.OutputSwapsType))    return false;
          /* Swaps Triple Day            */ if (!m_EdtSwapsTripleDay.Text       (PositionData_Swap.SwapsTripleDay))     return false;
          double swap_long = SymbolInfoDouble(Symbol(), SYMBOL_SWAP_LONG);
          int swap_long_decimal_places = Utilities.CountDecimalPlaces(swap_long);
          double swap_short = SymbolInfoDouble(Symbol(), SYMBOL_SWAP_SHORT);
          int swap_short_decimal_places = Utilities.CountDecimalPlaces(swap_short);
          /* Swaps Nominal Long            */ if (!m_EdtSwapsNominalLong.Text(DoubleToString(swap_long, swap_long_decimal_places)))     return false;
          /* Swaps Nominal Short           */ if (!m_EdtSwapsNominalShort.Text(DoubleToString(swap_short, swap_short_decimal_places)))  return false;
          /* Swaps Daily Long Lot          */ if (!m_EdtSwapsDailyLongLot.Text  (PositionData_Swap.OutputSwapsDailyLongLot))            return false;
          /* Swaps Daily Short Lot         */ if (!m_EdtSwapsDailyShortLot.Text (PositionData_Swap.OutputSwapsDailyShortLot))           return false;
          /* Swaps Label Daily per Lot     */ if (!m_LblSwapsPerLotDaily.Text   (PositionData_Swap.OutputSwapsCurrencyDailyLot))        return false;
          /* Swaps Daily Long PS           */ if (!m_EdtSwapsDailyLongPS.Text   (PositionData_Swap.OutputSwapsDailyLongPS))             return false;
          /* Swaps Daily Short PS          */ if (!m_EdtSwapsDailyShortPS.Text  (PositionData_Swap.OutputSwapsDailyShortPS))            return false;
          /* Swaps Label Daily per PS  */ if (!m_LblSwapsPerPSDaily.Text        (PositionData_Swap.OutputSwapsCurrencyDailyPS))         return false;
          /* Swaps Yearly Long Lot         */ if (!m_EdtSwapsYearlyLongLot.Text (PositionData_Swap.OutputSwapsYearlyLongLot))           return false;
          /* Swaps Yearly Short Lot        */ if (!m_EdtSwapsYearlyShortLot.Text(PositionData_Swap.OutputSwapsYearlyShortLot))          return false;
          /* Swaps Label Yearly per Lot */ if (!m_LblSwapsPerLotYearly.Text     (PositionData_Swap.OutputSwapsCurrencyYearlyLot))       return false;
          /* Swaps Yearly Long PS          */ if (!m_EdtSwapsYearlyLongPS.Text  (PositionData_Swap.OutputSwapsYearlyLongPS))            return false;
          /* Swaps Yearly Short PS         */ if (!m_EdtSwapsYearlyShortPS.Text (PositionData_Swap.OutputSwapsYearlyShortPS))           return false;
          /* Swaps Label Yearly per PS     */ if (!m_LblSwapsPerPSYearly.Text   (PositionData_Swap.OutputSwapsCurrencyYearlyPS))        return false;
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          //=== Script
          /* Multiple TP levels         */
          if (ScriptTakePorfitsNumber > 1)
          {         sets.ScriptTP[0] = sets.TakeProfitLevel; // Always the main TP.
                    for (int i = 0; i < ScriptTakePorfitsNumber; i++)
                    {         if (!CalculatorPad_OrderTP.ScriptTPEdits[i].Text(DoubleToString(sets.ScriptTP[i], _Digits)))               return false;
                              if (!CalculatorPad_OrderTP.ScriptTPShareEdits[i].Text(IntegerToString(sets.ScriptTPShare[i])))             return false; } }
          /* Maximum Position Size      */ if (!m_EdtMaxPositionSize.Text(DoubleToString(sets.MaxPositionSize, ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS)))    return false;
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          return true; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::Minimize()
{         CAppDialog::Minimize();
          sets.IsPanelMinimized = true;
          if (remember_left != -1)
          {         Move(remember_left, remember_top);
                    m_min_rect.Move(remember_left, remember_top); }
          IniFileSave(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::Maximize()
{         if (!NoPanelMaximization)
          {         sets.IsPanelMinimized = false;
                    CAppDialog::Maximize(); }
          else if (m_minimized) CAppDialog::Minimize();
          HideRisk();
          HideMargin();
          HideMain();
          HideSwaps();
          HideScript();
          if (!m_minimized)
          {         if (sets.SelectedTab == MainTab) ShowMain();
                    else if (sets.SelectedTab == RiskTab) ShowRisk();
                    else if (sets.SelectedTab == MarginTab) ShowMargin();
                    else if (sets.SelectedTab == SwapsTab) ShowSwaps();
                    else if (sets.SelectedTab == ScriptTab) ShowScript(); }
          MoveAndResize();
          if (remember_left != -1) Move(remember_left, remember_top); }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+----------------------+
//| Will be called once. |
//+----------------------+
void C_CalculatorPad::Initialization()
{         if (Bars == 0) return; // Data not ready yet.
          if ((sets.EntryLevel <= 0) && (sets.StopLossLevel <= 0))
          {         if (sets.TradeDirection == Long)
                    {         sets.EntryLevel = High[0];
                              if (DefaultSL > 0) sets.StopLossLevel = sets.EntryLevel - DefaultSL * _Point;
                              else sets.StopLossLevel = Low[0];
                              if (DefaultTP > 0) sets.TakeProfitLevel = sets.EntryLevel + DefaultTP * _Point;
                              if (sets.EntryLevel == sets.StopLossLevel) sets.StopLossLevel -= Point; }
                    else
                    {         sets.EntryLevel = Low[0];
                              if (DefaultSL > 0) sets.StopLossLevel = sets.EntryLevel + DefaultSL * _Point;
                              else sets.StopLossLevel = High[0];
                              if (DefaultTP > 0) sets.TakeProfitLevel = sets.EntryLevel - DefaultTP * _Point;
                              if (sets.EntryLevel == sets.StopLossLevel) sets.StopLossLevel += Point; }
                    if ((UseFixedSLDistance) && (sets.StopLoss <= 0)) sets.StopLoss = (int)MathRound(MathAbs((sets.EntryLevel - sets.StopLossLevel) / _Point));
                    if ((UseFixedTPDistance) && (sets.TakeProfit <= 0) && (sets.TakeProfitLevel != 0)) sets.TakeProfit = (int)MathRound(MathAbs((sets.EntryLevel - sets.TakeProfitLevel) / _Point));//
          }
// Loaded template with TP line - delete the line.
          if ((sets.TakeProfit == 0) && (sets.TakeProfitLevel == 0) && (ObjectFind(0, ObjectPrefix + "TakeProfitLine") == 0))
          {         ObjectDelete(ChartID(), ObjectPrefix + "TakeProfitLine");
                    ObjectDelete(ChartID(), ObjectPrefix + "TakeProfitLabel");
                    ObjectDelete(ChartID(), ObjectPrefix + "TPAdditionalLabel");
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         ObjectDelete(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i));
                              ObjectDelete(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i));
                              ObjectDelete(ChartID(), ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i)); } //
          }
// Using TP distance in pips but just switched from the TP given as a level on an already attached indicator.
          if ((UseFixedTPDistance) && (sets.TakeProfit == 0) && (sets.TakeProfitLevel != 0)) sets.TakeProfit = (int)MathRound(MathAbs((sets.TakeProfitLevel - sets.EntryLevel) / _Point));
          if (sets.EntryLevel - sets.StopLossLevel == 0)
          {         Alert("Entry and Stop-Loss levels should be different and non-zero.");
                    return; //
          }
          if (sets.EntryType == Instant)
          {         ct_Series_Base.RefreshRate();
                    if ((Ask > 0) && (Bid > 0))
                    {         // SL got inside Ask/Bid range.
                              if ((sets.StopLossLevel >= Bid) && (sets.StopLossLevel <= Ask)) sets.StopLossLevel = Bid - Point;
                              // Long entry
                              if (sets.StopLossLevel < Bid) sets.EntryLevel = Ask;
                              // Short entry
                              else if (sets.StopLossLevel > Ask) sets.EntryLevel = Bid; }//
          }
// Has to be done for updates to default input parameters to work correctly.
          if (sets.TradeDirection == Long)
          {         if ((DefaultSL > 0) && (sets.StopLossLevel == 0))  sets.StopLossLevel = sets.EntryLevel - DefaultSL * _Point;
                    if ((DefaultTP > 0) && (sets.TakeProfitLevel == 0)) sets.TakeProfitLevel = sets.EntryLevel + DefaultTP * _Point; //
          }
          else
          {         if ((DefaultSL > 0) && (sets.StopLossLevel == 0)) sets.StopLossLevel = sets.EntryLevel + DefaultSL * _Point;
                    if ((DefaultTP > 0) && (sets.TakeProfitLevel == 0)) sets.TakeProfitLevel = sets.EntryLevel - DefaultTP * _Point; //
          }
          if ((UseFixedSLDistance) && (sets.StopLoss <= 0)) sets.StopLoss = (int)MathRound(MathAbs((sets.EntryLevel - sets.StopLossLevel) / _Point));
          if ((UseFixedTPDistance) && (sets.TakeProfit <= 0) && (sets.TakeProfitLevel != 0)) sets.TakeProfit = (int)MathRound(MathAbs((sets.EntryLevel - sets.TakeProfitLevel) / _Point));
          bool line_existed = false; // Will be used to preserve OBJPROP_SELECTED through timeframe changes and the like.
          if (ObjectFind(ChartID(), ObjectPrefix + "EntryLine") == -1) ObjectCreate(ChartID(), ObjectPrefix + "EntryLine", OBJ_HLINE, 0, TimeCurrent(), sets.EntryLevel);
          else
          {         line_existed = true;
                    ObjectSetDouble(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_PRICE, sets.EntryLevel); //
          }
          ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_STYLE, entry_line_style);
          ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_COLOR, entry_line_color);
          ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_WIDTH, entry_line_width);
          ObjectSetString(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_TOOLTIP, "Entry");
          if (sets.EntryType == Instant) ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTABLE, false);
          else
          {         ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTABLE, true);
                    if (!line_existed)
                    {         if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTED, true); // Only for new lines. Old lines retain their selected status unless default parameter value changed.
                    }
                    else
                    {         if (LinesSelectedStatus == 1) ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTED, true);
                              else if (LinesSelectedStatus == 2) ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTED, false);//
                    } //
          }
          line_existed = false;
          if (ObjectFind(ChartID(), ObjectPrefix + "StopLossLine") == -1) ObjectCreate(ChartID(), ObjectPrefix + "StopLossLine", OBJ_HLINE, 0, TimeCurrent(), sets.StopLossLevel);
          else
          {         line_existed = true;
                    ObjectSetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, sets.StopLossLevel);//
          }
          ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_STYLE, stoploss_line_style);
          ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_COLOR, stoploss_line_color);
          ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_WIDTH, stoploss_line_width);
          ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_SELECTABLE, true);
          ObjectSetString(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_TOOLTIP, "Stop-Loss");
          if (!line_existed)
          {         if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_SELECTED, true); // Only for new lines. Old lines retain their selected status unless default parameter value changed.
          }
          else
          {         if (LinesSelectedStatus == 1) ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_SELECTED, true);
                    else if (LinesSelectedStatus == 2) ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_SELECTED, false);//
          }
          ct_Drive.TDD.ct_Bank.ct_Positions.p_StopLoss = MathAbs(sets.EntryLevel - sets.StopLossLevel);
          if (ShowLineLabels)
          {         ObjectCreate(ChartID(), ObjectPrefix + "StopLossLabel", OBJ_LABEL, 0, 0, 0);
                    if (sets.ShowLines) ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                    else ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_COLOR, clrNONE);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_SELECTABLE, false);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_HIDDEN, false);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_CORNER, CORNER_LEFT_UPPER);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_BACK, DrawTextAsBackground);
                    ObjectSetString(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_TOOLTIP, "SL Distance, points");
                    if ((ShowAdditionalSLLabel) && (ObjectFind(0, ObjectPrefix + "SLAdditionalLabel") == -1))
                    {         ObjectCreate(ChartID(), ObjectPrefix + "SLAdditionalLabel", OBJ_LABEL, 0, 0, 0);
                              if (sets.ShowLines) ObjectSetInteger(ChartID(), ObjectPrefix + "SLAdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                              else ObjectSetInteger(ChartID(), ObjectPrefix + "SLAdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "SLAdditionalLabel", OBJPROP_COLOR, clrNONE);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "SLAdditionalLabel", OBJPROP_SELECTABLE, false);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "SLAdditionalLabel", OBJPROP_HIDDEN, false);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "SLAdditionalLabel", OBJPROP_CORNER, CORNER_LEFT_UPPER);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "SLAdditionalLabel", OBJPROP_BACK, DrawTextAsBackground);
                              ObjectSetString(ChartID(), ObjectPrefix + "SLAdditionalLabel", OBJPROP_TOOLTIP, "Risk, % ($)"); //
                    }//
          }
          if (ObjectFind(ChartID(), ObjectPrefix + "TakeProfitLine") == -1)
          {         line_existed = false;
                    ObjectCreate(ChartID(), ObjectPrefix + "TakeProfitLine", OBJ_HLINE, 0, TimeCurrent(), sets.TakeProfitLevel);
                    if ((sets.TakeProfitLevel > 0) || ((sets.ATRMultiplierTP > 0) && (ShowATROptions))) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                    else ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS); //
          }
          else
          {         line_existed = true;
                    ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE, sets.TakeProfitLevel); //
          }
          ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_STYLE, takeprofit_line_style);
          ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_COLOR, takeprofit_line_color);
          ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_WIDTH, takeprofit_line_width);
          ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_SELECTABLE, true);
          ObjectSetString(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TOOLTIP, "Take-Profit");
          if (!line_existed)
          {         if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_SELECTED, true); // Only for new lines. Old lines retain their selected status unless default parameter value changed.
          }
          else
          {         if (LinesSelectedStatus == 1) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_SELECTED, true);
                    else if (LinesSelectedStatus == 2) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_SELECTED, false);//
          }
          if (ShowLineLabels)
          {         if (ObjectFind(ChartID(), ObjectPrefix + "TakeProfitLabel") == -1)
                    {         ObjectCreate(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJ_LABEL, 0, 0, 0);
                              if ((sets.TakeProfitLevel > 0) && (sets.ShowLines)) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                              else ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_COLOR, clrNONE);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_SELECTABLE, false);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_HIDDEN, false);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_CORNER, CORNER_LEFT_UPPER);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_BACK, DrawTextAsBackground);
                              ObjectSetString(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_TOOLTIP, "TP Distance, points"); //
                    }
                    if ((ShowAdditionalTPLabel) && (ObjectFind(0, ObjectPrefix + "TPAdditionalLabel") == -1))
                    {         ObjectCreate(ChartID(), ObjectPrefix + "TPAdditionalLabel", OBJ_LABEL, 0, 0, 0);
                              if ((sets.TakeProfitLevel > 0) && (sets.ShowLines)) ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                              else ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel", OBJPROP_COLOR, clrNONE);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel", OBJPROP_SELECTABLE, false);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel", OBJPROP_HIDDEN, false);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel", OBJPROP_CORNER, CORNER_LEFT_UPPER);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel", OBJPROP_BACK, DrawTextAsBackground);
                              ObjectSetString(ChartID(), ObjectPrefix + "TPAdditionalLabel", OBJPROP_TOOLTIP, "Reward, % ($), R/R"); //
                    } //
          }
// Process multiple TP lines.
          for (int i = 1; i < ScriptTakePorfitsNumber; i++)
          {         if (ObjectFind(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i)) == -1)
                    {         line_existed = false;
                              ObjectCreate(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJ_HLINE, 0, TimeCurrent(), sets.ScriptTP[i]);
                              if (sets.ScriptTP[i] > 0) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                              else ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS); //
                    }
                    else
                    {         line_existed = true;
                              ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE, sets.ScriptTP[i]); //
                    }
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_STYLE, takeprofit_line_style);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_COLOR, takeprofit_line_color);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_WIDTH, takeprofit_line_width);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_SELECTABLE, true);
                    ObjectSetString(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TOOLTIP, "Take-Profit #" + IntegerToString(i + 1));
                    if (!line_existed)
                    {         if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_SELECTED, true); // Only for new lines. Old lines retain their selected status unless default parameter value changed.
                    }
                    else
                    {         if (LinesSelectedStatus == 1) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_SELECTED, true);
                              else if (LinesSelectedStatus == 2) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_SELECTED, false);//
                    }
                    if (ShowLineLabels)
                    {         if (ObjectFind(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i)) == -1)
                              {         ObjectCreate(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJ_LABEL, 0, 0, 0);
                                        if ((sets.ScriptTP[i] > 0) && (sets.ShowLines)) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                        else ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_COLOR, clrNONE);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_SELECTABLE, false);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_HIDDEN, false);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_CORNER, CORNER_LEFT_UPPER);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_BACK, DrawTextAsBackground);
                                        ObjectSetString(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_TOOLTIP, "TP #" + IntegerToString(i + 1) + " Distance, points");//
                              }
                              if ((ShowAdditionalTPLabel) && (ObjectFind(0, ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i)) == -1))
                              {         ObjectCreate(ChartID(), ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i), OBJ_LABEL, 0, 0, 0);
                                        if ((sets.ScriptTP[i] > 0) && (sets.ShowLines)) ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                        else ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i), OBJPROP_COLOR, clrNONE);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i), OBJPROP_SELECTABLE, false);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i), OBJPROP_HIDDEN, false);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i), OBJPROP_CORNER, CORNER_LEFT_UPPER);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i), OBJPROP_BACK, DrawTextAsBackground);
                                        ObjectSetString(ChartID(), ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i), OBJPROP_TOOLTIP, "Reward #" + IntegerToString(i + 1) + ", $ (%), R/R");//
                              } //
                    } //
          }
          switch(sets.AccountButton)
{                   default:
                    case Balance:
                              if (CustomBalance > 0) ct_Drive.TDD.ct_Bank.ct_Positions.AccSize = sets.CustomBalance;
                              else ct_Drive.TDD.ct_Bank.ct_Positions.AccSize = AccountBalance();
                              break;
                    case Equity:
                              ct_Drive.TDD.ct_Bank.ct_Positions.AccSize = AccountEquity();
                              break;
                    case Balance_minus_Risk:
                              if (CustomBalance > 0) ct_Drive.TDD.ct_Bank.ct_Positions.AccSize = sets.CustomBalance;
                              else ct_Drive.TDD.ct_Bank.ct_Positions.AccSize = AccountBalance();
                              if (PositionData_Portfolio.LossMoney != DBL_MAX) ct_Drive.TDD.ct_Bank.ct_Positions.AccSize = ct_Drive.TDD.ct_Bank.ct_Positions.AccSize - PositionData_Portfolio.LossMoney;
                              break; //
          }
          if (sets.CustomBalance <= 0) ct_Drive.TDD.ct_Bank.ct_Positions.AccSize += AdditionalFunds;
          ChartSetInteger(0, CHART_FOREGROUND, !PanelOnTopOfChart);
// Used to store volume for each TP level. Without additional levels, there is only main TP level.
          ArrayResize(PositionData.ArrayPositionSize, ScriptTakePorfitsNumber);
          RecalculatePositionSize();
          Uninitialized = false; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::RefreshValues()
{         if (Uninitialized)
          {         Initialization(); // Helps with 'Waiting for data'. MT4 only solution. MT5 handles this differently.
                    if (Uninitialized) return; // Still uninitialized? Don't proceed further.
          }
          if ((ShowATROptions) && ((sets.ATRMultiplierSL > 0) || (sets.ATRMultiplierTP > 0)))
          {         double atr = iATR(_Symbol, sets.ATRTimeframe, sets.ATRPeriod, 0);
                    if (sets.ATRMultiplierSL > 0)
                    {         double sl = atr * sets.ATRMultiplierSL;
                              if (sets.TradeDirection == Long) sets.StopLossLevel = sets.EntryLevel - sl;
                              else sets.StopLossLevel = sets.EntryLevel + sl;
                              sets.StopLoss = (int)MathRound(MathAbs(sets.StopLossLevel - sets.EntryLevel) / _Point); }
                    if (sets.ATRMultiplierTP > 0)
                    {         double tp = atr * sets.ATRMultiplierTP;
                              // If no ATR SL multiplier is given, TradeType should be determined by Entry-SL difference.
                              if (sets.StopLossLevel < sets.EntryLevel) sets.TakeProfitLevel = sets.EntryLevel + tp;
                              else sets.TakeProfitLevel = sets.EntryLevel - tp;
                              sets.TakeProfit = (int)MathRound(MathAbs(sets.TakeProfitLevel - sets.EntryLevel) / _Point); } }
          if (sets.ShowLines)
          {         double read_value;
                    if ((sets.ATRMultiplierSL == 0) || (!ShowATROptions))
                    {         if (ObjectGetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, 0, read_value)) sets.StopLossLevel = read_value; // Rewrite value only if line exists.
                    }
                    if ((sets.ATRMultiplierTP == 0) || (!ShowATROptions))
                    {         if (ObjectGetDouble(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE, 0, read_value)) sets.TakeProfitLevel = read_value; // Rewrite value only if line exists.
                    }
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         if (ObjectGetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE, 0, read_value)) sets.ScriptTP[i] = read_value; // Rewrite value only if line exists.
                    }
                    // Check and adjust for ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE granularity.
                    if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0)
                    {         sets.StopLossLevel = NormalizeDouble(MathRound(sets.StopLossLevel / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, _Digits);
                              ObjectSetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, sets.StopLossLevel);
                              sets.TakeProfitLevel = NormalizeDouble(MathRound(sets.TakeProfitLevel / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, _Digits);
                              ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE, sets.TakeProfitLevel);
                              if (ScriptTakePorfitsNumber > 1)
                              {         for (int i = 0; i < ScriptTakePorfitsNumber; i++)
                                        {         sets.ScriptTP[i] = NormalizeDouble(MathRound(sets.ScriptTP[i] / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, _Digits); } } }
                    if (sets.EntryType == Instant)
                    {         if (!UseFixedSLDistance)
                              {         if (sets.StopLossLevel < SymbolInfoDouble(Symbol(), SYMBOL_ASK)) sets.EntryLevel = SymbolInfoDouble(Symbol(), SYMBOL_ASK);
                                        else sets.EntryLevel = SymbolInfoDouble(Symbol(), SYMBOL_BID); }
                              else
                              {         if (sets.TradeDirection == Long) sets.EntryLevel = SymbolInfoDouble(Symbol(), SYMBOL_ASK);
                                        else sets.EntryLevel = SymbolInfoDouble(Symbol(), SYMBOL_BID); } }
                    else // Pending
                    {         if (ObjectGetDouble(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_PRICE, 0, read_value)) sets.EntryLevel = read_value; // Rewrite value only if line exists.
                              // Check and adjust for ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE granularity.
                              if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0)
                              {         sets.EntryLevel = NormalizeDouble(MathRound(sets.EntryLevel / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, _Digits);
                                        ObjectSetDouble(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_PRICE, sets.EntryLevel); } }
                    // Set_ line based on the entered SL distance.
                    if (UseFixedSLDistance)
                    {         if (sets.TradeDirection == Long) sets.StopLossLevel = sets.EntryLevel - sets.StopLoss * _Point;
                              else sets.StopLossLevel = sets.EntryLevel + sets.StopLoss * _Point;
                              ObjectSetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, sets.StopLossLevel); }
                    // Set_ line based on the entered TP distance.
                    if (UseFixedTPDistance)
                    {         if (sets.TakeProfit > 0)
                              {         if (sets.TradeDirection == Long) sets.TakeProfitLevel = sets.EntryLevel + sets.TakeProfit * _Point;
                                        else sets.TakeProfitLevel = sets.EntryLevel - sets.TakeProfit * _Point;
                                        ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE, sets.TakeProfitLevel); }
                              // ct_Drive.TDD.ct_Bank.ct_Positions.Additional take-profits.
                              if (ScriptTakePorfitsNumber > 1)
                              {         for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                                        {         if (sets.TradeDirection == Long) sets.ScriptTP[i] = sets.EntryLevel + StringToDouble(CalculatorPad_OrderTP.AdditionalTPEdits[i - 1].Text()) * _Point;
                                                  else sets.ScriptTP[i] = sets.EntryLevel - StringToDouble(CalculatorPad_OrderTP.AdditionalTPEdits[i - 1].Text()) * _Point;
                                                  ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE, sets.ScriptTP[i]); } } } }
          sets.CustomLeverage = (int)StringToInteger(m_EdtCustomLeverage.Text());
          if (sets.EntryLevel < sets.StopLossLevel) sets.TradeDirection = Short;
          else if (sets.EntryLevel > sets.StopLossLevel) sets.TradeDirection = Long;
          if (sets.TPLockedOnSL)
          {         CalculatorPad_OrderEntry.tEntryLevel = sets.EntryLevel;
                    CalculatorPad_OrderStopLoss.tStopLossLevel = sets.StopLossLevel;
                    if (sets.TakeProfitLevel == 0) ProcessTPChange(true); // When TPLockedOnSL has been enabled via an input parameter.
                    else ProcessTPChange(false); }
          RecalculatePositionSize();
          DisplayValues();
          LastRecalculationTime = GetTickCount(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::HideMain()
{         m_BtnTabMain.ColorBackground(CONTROLSg_BUTTON_COLOR_DISABLE);
          m_LblEntryLevel.Hide();
          m_BtnEntry.Hide();
          m_EdtEntryLevel.Hide();
          m_LblEntryWarning.Hide();
          if (DefaultSL > 0) m_BtnStopLoss.Hide();
          else m_LblSL.Hide();
          m_EdtSL.Hide();
          m_LblSLWarning.Hide();
          m_BtnTakeProfit.Hide();
          m_EdtTP.Hide();
          m_LblTPWarning.Hide();
          if (ScriptTakePorfitsNumber > 1)
          {         for (int i = 0; i < ScriptTakePorfitsNumber - 1; i++)
                    {         CalculatorPad_OrderTP.AdditionalTPEdits[i].Hide();
                              CalculatorPad_OrderTP.AdditionalTPLabels[i].Hide();
                              CalculatorPad_OrderTP.AdditionalTPWarnings[i].Hide(); } }
          if (ShowATROptions)
          {         m_LblATRPeriod.Hide();
                    m_LblATRMultiplierSL.Hide();
                    m_LblATRMultiplierTP.Hide();
                    m_EdtATRPeriod.Hide();
                    m_EdtATRMultiplierSL.Hide();
                    m_EdtATRMultiplierTP.Hide();
                    m_LblATRValue.Hide();
                    m_LblATRTimeframe.Hide();
                    m_BtnATRTimeframe.Hide(); }
          m_LblOrderType.Hide();
          m_BtnOrderType.Hide();
          m_BtnLines.Hide();
          m_LblCommissionSize.Hide();
          m_EdtCommissionSize.Hide();
          if (!HideAccSize)
          {         m_BtnAccount.Hide();
                    m_EdtAccount.Hide();
                    m_LblFundsAsterisk.Hide(); }
          m_LblInput.Hide();
          m_LblResult.Hide();
          m_LblRisk.Hide();
          if (QuickRisk1 > 0) m_BtnQuickRisk1.Hide();
          if (QuickRisk2 > 0) m_BtnQuickRisk2.Hide();
          m_EdtRiskPIn.Hide();
          m_EdtRiskPRes.Hide();
          m_LblRiskM.Hide();
          m_EdtRiskMIn.Hide();
          m_EdtRiskMRes.Hide();
          m_LblReward.Hide();
          m_EdtReward1.Hide();
          m_EdtReward2.Hide();
          m_LblRR.Hide();
          m_EdtRR1.Hide();
          m_EdtRR2.Hide();
          m_LblPosSize.Hide();
          if (ShowMaxPSButton) m_BtnMaxPS.Hide();
          m_EdtPosSize.Hide();
          if (ShowPipValue)
          {         m_LblPipValue.Hide();
                    m_EdtPipValue.Hide(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::ShowMain()
{         m_BtnTabMain.ColorBackground(CONTROLSg_BUTTON_COLOR_ENABLE);
          m_LblEntryLevel.Show();
          m_BtnEntry.Show();
          m_EdtEntryLevel.Show();
          m_LblEntryWarning.Show();
          if (DefaultSL > 0) m_BtnStopLoss.Show();
          else m_LblSL.Show();
          m_EdtSL.Show();
          m_LblSLWarning.Show();
          m_BtnTakeProfit.Show();
          m_EdtTP.Show();
          m_LblTPWarning.Show();
          if (ScriptTakePorfitsNumber > 1)
          {         for (int i = 0; i < ScriptTakePorfitsNumber - 1; i++)
                    {         CalculatorPad_OrderTP.AdditionalTPEdits[i].Show();
                              CalculatorPad_OrderTP.AdditionalTPLabels[i].Show();
                              CalculatorPad_OrderTP.AdditionalTPWarnings[i].Show(); } }
          if (ShowATROptions)
          {         m_LblATRPeriod.Show();
                    m_LblATRMultiplierSL.Show();
                    m_LblATRMultiplierTP.Show();
                    m_EdtATRPeriod.Show();
                    m_EdtATRMultiplierSL.Show();
                    m_EdtATRMultiplierTP.Show();
                    m_LblATRValue.Show();
                    m_LblATRTimeframe.Show();
                    m_BtnATRTimeframe.Show(); }
          m_LblOrderType.Show();
          m_BtnOrderType.Show();
          m_BtnLines.Show();
          m_LblCommissionSize.Show();
          m_EdtCommissionSize.Show();
          if (!HideAccSize)
          {         m_BtnAccount.Show();
                    m_EdtAccount.Show();
                    if ((AdditionalFunds >= 0.01) || (AdditionalFunds <= -0.01) || ((sets.CustomBalance > 0) && (sets.AccountButton != Equity))) m_LblFundsAsterisk.Show(); }
          m_LblInput.Show();
          m_LblResult.Show();
          m_LblRisk.Show();
          if (QuickRisk1 > 0) m_BtnQuickRisk1.Show();
          if (QuickRisk2 > 0) m_BtnQuickRisk2.Show();
          m_EdtRiskPIn.Show();
          m_EdtRiskPRes.Show();
          m_LblRiskM.Show();
          m_EdtRiskMIn.Show();
          m_EdtRiskMRes.Show();
          if (sets.TakeProfitLevel != 0)
          {         m_LblReward.Show();
                    m_EdtReward1.Show();
                    m_EdtReward2.Show();
                    m_LblRR.Show();
                    if (PositionData_RiskReward.InputRR != "") m_EdtRR1.Show();
                    m_EdtRR2.Show(); }
          m_LblPosSize.Show();
          if (ShowMaxPSButton) m_BtnMaxPS.Show();
          m_EdtPosSize.Show();
          if (ShowPipValue)
          {         m_LblPipValue.Show();
                    m_EdtPipValue.Show(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::HideRisk()
{         m_BtnTabRisk.ColorBackground(CONTROLSg_BUTTON_COLOR_DISABLE);
          m_ChkCountPendings.Hide();
          m_ChkIgnoreOrders.Hide();
          m_ChkIgnoreOtherSymbols.Hide();
          m_LblCurrentPortfolio.Hide();
          m_LblPotentialPortfolio.Hide();
          m_LblCurrentRiskMoney.Hide();
          m_LblCurrentRiskPerc.Hide();
          m_LblCurrentProfitMoney.Hide();
          m_LblCurrentProfitPerc.Hide();
          m_LblPotentialRiskMoney.Hide();
          m_LblPotentialRiskPerc.Hide();
          m_LblPotentialProfitMoney.Hide();
          m_LblPotentialProfitPerc.Hide();
          m_LblCurrentLots.Hide();
          m_LblPotentialLots.Hide();
          m_EdtCurRiskM.Hide();
          m_EdtCurRiskP.Hide();
          m_EdtCurProfitM.Hide();
          m_EdtCurProfitP.Hide();
          m_EdtCurL.Hide();
          m_EdtPotRiskM.Hide();
          m_EdtPotRiskP.Hide();
          m_EdtPotProfitM.Hide();
          m_EdtPotProfitP.Hide();
          m_EdtPotL.Hide(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::ShowRisk()
{         m_BtnTabRisk.ColorBackground(CONTROLSg_BUTTON_COLOR_ENABLE);
          m_ChkCountPendings.Show();
          m_ChkIgnoreOrders.Show();
          m_ChkIgnoreOtherSymbols.Show();
          m_LblCurrentPortfolio.Show();
          m_LblPotentialPortfolio.Show();
          m_LblCurrentRiskMoney.Show();
          m_LblCurrentRiskPerc.Show();
          m_LblCurrentProfitMoney.Show();
          m_LblCurrentProfitPerc.Show();
          m_LblPotentialRiskMoney.Show();
          m_LblPotentialRiskPerc.Show();
          m_LblPotentialProfitMoney.Show();
          m_LblPotentialProfitPerc.Show();
          m_LblCurrentLots.Show();
          m_LblPotentialLots.Show();
          m_EdtCurRiskM.Show();
          m_EdtCurRiskP.Show();
          m_EdtCurProfitM.Show();
          m_EdtCurProfitP.Show();
          m_EdtCurL.Show();
          m_EdtPotRiskM.Show();
          m_EdtPotRiskP.Show();
          m_EdtPotProfitM.Show();
          m_EdtPotProfitP.Show();
          m_EdtPotL.Show(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::HideMargin()
{         m_BtnTabMargin.ColorBackground(CONTROLSg_BUTTON_COLOR_DISABLE);
          m_LblPosMargin.Hide();
          m_EdtPosMargin.Hide();
          m_LblUsedMargin.Hide();
          m_EdtUsedMargin.Hide();
          m_LblFreeMargin.Hide();
          m_EdtFreeMargin.Hide();
          m_LblCustomLeverage.Hide();
          m_EdtCustomLeverage.Hide();
          m_LblAccLeverage.Hide();
          m_LblSymbolLeverage.Hide();
          m_LblMaxPositionSizeByMargin.Hide();
          m_EdtMaxPositionSizeByMargin.Hide(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::ShowMargin()
{         m_BtnTabMargin.ColorBackground(CONTROLSg_BUTTON_COLOR_ENABLE);
          m_LblPosMargin.Show();
          m_EdtPosMargin.Show();
          m_LblUsedMargin.Show();
          m_EdtUsedMargin.Show();
          m_LblFreeMargin.Show();
          m_EdtFreeMargin.Show();
          m_LblCustomLeverage.Show();
          m_EdtCustomLeverage.Show();
          m_LblAccLeverage.Show();
          m_LblSymbolLeverage.Show();
          m_LblMaxPositionSizeByMargin.Show();
          m_EdtMaxPositionSizeByMargin.Show(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::HideSwaps()
{         m_BtnTabSwaps.ColorBackground(CONTROLSg_BUTTON_COLOR_DISABLE);
          m_LblSwapsType.Hide();
          m_EdtSwapsType.Hide();
          m_LblSwapsTripleDay.Hide();
          m_EdtSwapsTripleDay.Hide();
          m_LblSwapsLong.Hide();
          m_LblSwapsShort.Hide();
          m_LblSwapsNominal.Hide();
          m_EdtSwapsNominalLong.Hide();
          m_EdtSwapsNominalShort.Hide();
          m_LblSwapsDaily.Hide();
          m_EdtSwapsDailyLongLot.Hide();
          m_EdtSwapsDailyShortLot.Hide();
          m_LblSwapsPerLotDaily.Hide();
          m_EdtSwapsDailyLongPS.Hide();
          m_EdtSwapsDailyShortPS.Hide();
          m_LblSwapsPerPSDaily.Hide();
          m_LblSwapsYearly.Hide();
          m_EdtSwapsYearlyLongLot.Hide();
          m_EdtSwapsYearlyShortLot.Hide();
          m_LblSwapsPerLotYearly.Hide();
          m_EdtSwapsYearlyLongPS.Hide();
          m_EdtSwapsYearlyShortPS.Hide();
          m_LblSwapsPerPSYearly.Hide(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::ShowSwaps()
{         m_BtnTabSwaps.ColorBackground(CONTROLSg_BUTTON_COLOR_ENABLE);
          m_LblSwapsType.Show();
          m_EdtSwapsType.Show();
          m_LblSwapsTripleDay.Show();
          m_EdtSwapsTripleDay.Show();
          m_LblSwapsLong.Show();
          m_LblSwapsShort.Show();
          m_LblSwapsNominal.Show();
          m_EdtSwapsNominalLong.Show();
          m_EdtSwapsNominalShort.Show();
          m_LblSwapsDaily.Show();
          m_EdtSwapsDailyLongLot.Show();
          m_EdtSwapsDailyShortLot.Show();
          m_LblSwapsPerLotDaily.Show();
          m_EdtSwapsDailyLongPS.Show();
          m_EdtSwapsDailyShortPS.Show();
          m_LblSwapsPerPSDaily.Show();
          m_LblSwapsYearly.Show();
          m_EdtSwapsYearlyLongLot.Show();
          m_EdtSwapsYearlyShortLot.Show();
          m_LblSwapsPerLotYearly.Show();
          m_EdtSwapsYearlyLongPS.Show();
          m_EdtSwapsYearlyShortPS.Show();
          m_LblSwapsPerPSYearly.Show(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::HideScript()
{         m_BtnTabScript.ColorBackground(CONTROLSg_BUTTON_COLOR_DISABLE);
          m_LblScriptExplanation.Hide();
          m_LblMagicNumber.Hide();
          m_EdtMagicNumber.Hide();
          m_LblScriptCommentary.Hide();
          m_EdtScriptCommentary.Hide();
          m_ChkDisableTradingWhenLinesAreHidden.Hide();
          // Multiple TP targets.
          if (ScriptTakePorfitsNumber > 1)
          {         CalculatorPad_OrderTP.m_LblScriptTP.Hide();
                    m_BtnTPsInward.Hide();
                    m_BtnTPsOutward.Hide();
                    CalculatorPad_OrderTP.m_LblScriptTPShare.Hide();
                    for (int i = 0; i < ScriptTakePorfitsNumber; i++)
                    {         CalculatorPad_OrderTP.ScriptTPLabels[i].Hide();
                              CalculatorPad_OrderTP.ScriptTPEdits[i].Hide();
                              CalculatorPad_OrderTP.ScriptTPShareEdits[i].Hide(); } }
          m_LblScriptPips.Hide();
          m_LblMaxSlippage.Hide();
          m_EdtMaxSlippage.Hide();
          m_LblMaxSpread.Hide();
          m_EdtMaxSpread.Hide();
          m_LblMaxEntrySLDistance.Hide();
          m_EdtMaxEntrySLDistance.Hide();
          m_LblMinEntrySLDistance.Hide();
          m_EdtMinEntrySLDistance.Hide();
          m_LblScriptLots.Hide();
          m_LblMaxPositionSize.Hide();
          m_EdtMaxPositionSize.Hide();
          m_ChkSubtractPositions.Hide();
          m_ChkSubtractPendingOrders.Hide();
          m_ChkDoNotApplyStopLoss.Hide();
          m_ChkDoNotApplyTakeProfit.Hide();
          m_ChkAskForConfirmation.Hide(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::ShowScript()
{         m_BtnTabScript.ColorBackground(CONTROLSg_BUTTON_COLOR_ENABLE);
          m_LblScriptExplanation.Show();
          m_LblMagicNumber.Show();
          m_EdtMagicNumber.Show();
          m_LblScriptCommentary.Show();
          m_EdtScriptCommentary.Show();
          m_ChkDisableTradingWhenLinesAreHidden.Show();
          // Multiple TP targets.
          if (ScriptTakePorfitsNumber > 1)
          {         CalculatorPad_OrderTP.m_LblScriptTP.Show();
                    m_BtnTPsInward.Show();
                    m_BtnTPsOutward.Show();
                    CalculatorPad_OrderTP.m_LblScriptTPShare.Show();
                    for (int i = 0; i < ScriptTakePorfitsNumber; i++)
                    {         CalculatorPad_OrderTP.ScriptTPLabels[i].Show();
                              CalculatorPad_OrderTP.ScriptTPEdits[i].Show();
                              CalculatorPad_OrderTP.ScriptTPShareEdits[i].Show();//
                    }//
          }
          m_LblScriptPips.Show();
          m_LblMaxSlippage.Show();
          m_EdtMaxSlippage.Show();
          m_LblMaxSpread.Show();
          m_EdtMaxSpread.Show();
          m_LblMaxEntrySLDistance.Show();
          m_EdtMaxEntrySLDistance.Show();
          m_LblMinEntrySLDistance.Show();
          m_EdtMinEntrySLDistance.Show();
          m_LblScriptLots.Show();
          m_LblMaxPositionSize.Show();
          m_EdtMaxPositionSize.Show();
          m_ChkSubtractPositions.Show();
          m_ChkSubtractPendingOrders.Show();
          m_ChkDoNotApplyStopLoss.Show();
          m_ChkDoNotApplyTakeProfit.Show();
          m_ChkAskForConfirmation.Show(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::SeekAndDestroyDuplicatePanels()
{         int ot = ObjectsTotal(ChartID());
          for (int i = ot - 1; i >= 0; i--)
          {         string object_name = ObjectName(ChartID(), i);
                    if (ObjectGetInteger(ChartID(), object_name, OBJPROP_TYPE) != OBJ_LABEL) continue; // Only labels are saved into templates.
                    // Found m_LblPosSize object.
                    if (StringSubstr(object_name, StringLen(object_name) - 12) == "m_LblPosSize")
                    {         string prefix = StringSubstr(object_name, 0, StringLen(Name()));
                              // Found m_LblPosSize object with prefix different than current.
                              if (prefix != Name())
                              {         ObjectsDeleteAll(ChartID(), prefix);
                                        // Reset object counter.
                                        ot = ObjectsTotal(ChartID());
                                        i = ot;
                                        Print("Deleted duplicate panel objects with prefix = ", prefix, ".");
                                        continue; } } } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::ProcessTPChange(const bool tp_button_click)
{         double tp_distance = 0;
          if ((UseCommissionToSet_TPDistance) && (sets.CommissionPerLot != 0))
          {         // Calculate potential loss as SL + Commission * 2.
                    // Calculate potential profit as TP - Commission * 2.
                    // TP Distance = Profit / Pip_value.
                    // Profit = Risk * N + Commission * 2.
                    // TP distance =  (Risk * N + Commission * 2) / Pip_value.
                    if ((PositionData_Symbol.UnitCost_reward != 0) && (PositionData.OutputPositionSize != 0) && (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE != 0))
                              tp_distance = (PositionData_RiskReward.RiskMoney * TP_Multiplier + PositionData.OutputPositionSize * sets.CommissionPerLot * 2) / (PositionData.OutputPositionSize * PositionData_Symbol.UnitCost_reward / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE);
                    if (CalculatorPad_OrderEntry.tEntryLevel < CalculatorPad_OrderStopLoss.tStopLossLevel) tp_distance = -tp_distance; }
          else tp_distance = (CalculatorPad_OrderEntry.tEntryLevel - CalculatorPad_OrderStopLoss.tStopLossLevel) * TP_Multiplier;
          sets.TakeProfitLevel = NormalizeDouble(CalculatorPad_OrderEntry.tEntryLevel + tp_distance, _Digits);
          if (CalculatorPad_OrderTP.tTakeProfitLevel != sets.TakeProfitLevel)
          {         if ((ScriptTakePorfitsNumber > 1) && (CalculatorPad_OrderTP.tTakeProfitLevel == 0) && (sets.TakeProfitLevel != 0)) // Was zero, became non-zero.
                    {         for (int i = 0; i < ScriptTakePorfitsNumber; i++)
                              {         if (i == 0) sets.ScriptTP[i] = sets.TakeProfitLevel;
                                        else
                                        {         CalculatorPad_OrderTP.ScriptTPEdits[i].Text(DoubleToString(sets.EntryLevel + (sets.TakeProfitLevel - sets.EntryLevel) * double(ScriptTakePorfitsNumber - i) / double(ScriptTakePorfitsNumber)));
                                                  UpdateScriptTPEdit(i); } } }
                    CalculatorPad_OrderTP.tTakeProfitLevel = sets.TakeProfitLevel;
                    if (sets.ATRMultiplierSL > 0)
                    {         sets.ATRMultiplierTP = NormalizeDouble(sets.ATRMultiplierSL * TP_Multiplier, 2);
                              m_EdtATRMultiplierTP.Text(DoubleToString(sets.ATRMultiplierTP, 2)); }
                    if (!UseFixedTPDistance) m_EdtTP.Text(DoubleToString(CalculatorPad_OrderTP.tTakeProfitLevel, _Digits));
                    else
                    {         sets.TakeProfit = (int)MathRound(MathAbs(CalculatorPad_OrderTP.tTakeProfitLevel - CalculatorPad_OrderEntry.tEntryLevel) / _Point);
                              m_EdtTP.Text(IntegerToString(sets.TakeProfit)); }
                    if (ObjectFind(ChartID(), ObjectPrefix + "TakeProfitLine") == -1)
                    {         ObjectCreate(ChartID(), ObjectPrefix + "TakeProfitLine", OBJ_HLINE, 0, TimeCurrent(), sets.TakeProfitLevel);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_STYLE, takeprofit_line_style);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_COLOR, takeprofit_line_color);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_WIDTH, takeprofit_line_width);
                              ObjectSetString(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TOOLTIP, "Take-Profit");
                              // Create multiple TP lines.
                              for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                              {         ObjectCreate(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJ_HLINE, 0, TimeCurrent(), sets.ScriptTP[i]);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_STYLE, takeprofit_line_style);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_COLOR, takeprofit_line_color);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_WIDTH, takeprofit_line_width);
                                        ObjectSetString(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TOOLTIP, "Take-Profit #" + IntegerToString(i + 1)); } }
                    else
                    {         ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE, sets.TakeProfitLevel);
                              // Move multiple TP lines.
                              for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                              {         ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE, sets.ScriptTP[i]); } }
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_SELECTABLE, true);
                    if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_SELECTED, true);
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_SELECTABLE, true);
                              if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_SELECTED, true); }
                    if (StringToDouble(m_EdtTP.Text()) == 0) // Hide.
                    {         m_LblRR.Hide();
                              m_EdtRR1.Hide();
                              m_EdtRR2.Hide();
                              m_LblReward.Hide();
                              m_EdtReward1.Hide();
                              m_EdtReward2.Hide();
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                              for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                              {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS); }
                              MoveAndResize(); }
                    else // Show.
                    {         if (!m_minimized)
                              {         m_LblRR.Show();
                                        if (PositionData_RiskReward.InputRR != "") m_EdtRR1.Show();
                                        m_EdtRR2.Show();
                                        m_LblReward.Show();
                                        m_EdtReward1.Show();
                                        m_EdtReward2.Show(); }
                              if (sets.ShowLines)
                              {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_BACK, false);
                                        if (ShowLineLabels)
                                        {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                  ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_BACK, DrawTextAsBackground); }
                                        if (ShowAdditionalTPLabel)
                                        {         ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                  ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel", OBJPROP_BACK, DrawTextAsBackground); }
                                        for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                                        {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                  ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_BACK, false);
                                                  if (ShowLineLabels)
                                                  {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                            ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_BACK, DrawTextAsBackground); }
                                                  if (ShowAdditionalTPLabel)
                                                  {         ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                            ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel" + IntegerToString(i), OBJPROP_BACK, DrawTextAsBackground); } } }
                              HideShowMaximize();
                              MoveAndResize(); }
                    // Need to call RefreshValues() only if this function is invoked from TP Button click event handler. In all other cases it is called from within RefreshValues() itself.
                    if (tp_button_click)
                    {         RefreshValues(); } //
          } //
}

//+--------------------------------------------+
//|                                            |
//|                   EVENTS                   |
//|                                            |
//+--------------------------------------------+
void C_CalculatorPad::OnClickBtnTabMain()
{         if (sets.SelectedTab != MainTab)
          {         sets.SelectedTab = MainTab;
                    ShowMain();
                    HideRisk();
                    HideMargin();
                    HideSwaps();
                    HideScript();
                    MoveAndResize();
                    RefreshValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnTabRisk()
{         if (sets.SelectedTab != RiskTab)
          {         sets.SelectedTab = RiskTab;
                    HideMain();
                    ShowRisk();
                    HideMargin();
                    HideSwaps();
                    HideScript();
                    MoveAndResize();
                    RefreshValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnTabMargin()
{         if (sets.SelectedTab != MarginTab)
          {         sets.SelectedTab = MarginTab;
                    HideRisk();
                    HideMain();
                    ShowMargin();
                    HideSwaps();
                    HideScript();
                    MoveAndResize();
                    RefreshValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnTabSwaps()
{         if (sets.SelectedTab != SwapsTab)
          {         sets.SelectedTab = SwapsTab;
                    HideRisk();
                    HideMain();
                    HideMargin();
                    ShowSwaps();
                    HideScript();
                    MoveAndResize();
                    RefreshValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnTabScript()
{         if (sets.SelectedTab != ScriptTab)
          {         sets.SelectedTab = ScriptTab;
                    HideRisk();
                    HideMain();
                    HideMargin();
                    HideSwaps();
                    ShowScript();
                    MoveAndResize(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnOrderType()
{         sets.EntryType = (ENUM_ENTRY_TYPE)!((bool)sets.EntryType);
          if (sets.EntryType == Instant)
          {         sets.WasSelectedEntryLine = ObjectGetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTED);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTABLE, false);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTED, false);
                    if (!m_EdtEntryLevel.ReadOnly(true))                                    return;
                    if (!m_EdtEntryLevel.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE))      return;
                    m_BtnOrderType.Text("Instant"); }
          else // Pending
          {         ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTABLE, true);
                    if ((sets.WasSelectedEntryLine) || (DefaultLinesSelected)) ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTED, true);
                    if (!m_EdtEntryLevel.ReadOnly(false))                                   return;
                    if (!m_EdtEntryLevel.ColorBackground(CONTROLS_EDIT_COLOR_ENABLE))       return;
                    m_BtnOrderType.Text("Pending"); }
          RefreshValues(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnAccount()
{         switch(sets.AccountButton)
          {         case Balance:
                              // Switch to Equity.
                              sets.AccountButton = Equity;
                              m_BtnAccount.Text("Account equity");
                              // Account balance uneditable.
                              m_EdtAccount.ReadOnly(true);
                              m_EdtAccount.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
                              break;
                    case Equity:
                              // Switch to Balance minus Risk.
                              sets.AccountButton = Balance_minus_Risk;
                              m_BtnAccount.Text("Balance - CPR");
                              // Account balance uneditable.
                              m_EdtAccount.ReadOnly(true);
                              m_EdtAccount.ColorBackground(CONTROLS_EDIT_COLOR_DISABLE);
                              break;
                    default:
                    case Balance_minus_Risk:
                              // Switch to Balance.
                              sets.AccountButton = Balance;
                              m_BtnAccount.Text("Account balance");
                              // Account balance editable.
                              m_EdtAccount.ReadOnly(false);
                              m_EdtAccount.ColorBackground(CONTROLS_EDIT_COLOR_ENABLE);
                              break; }
          RefreshValues(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnLines()
{         sets.ShowLines = !sets.ShowLines;
          if (sets.ShowLines)
          {         m_BtnLines.Text("Hide lines"); }
          else
          {         m_BtnLines.Text("Show lines"); }
          if (sets.ShowLines)
          {         ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS); }
                    if (ShowLineLabels)
                    {         ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_BACK, DrawTextAsBackground);
                              if (ShowAdditionalSLLabel)
                              {         ObjectSetInteger(ChartID(), ObjectPrefix + "SLPositions.AdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "SLPositions.AdditionalLabel", OBJPROP_BACK, DrawTextAsBackground); }
                              if (StringToDouble(m_EdtTP.Text()) != 0)
                              {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_BACK, DrawTextAsBackground);
                                        if (ShowAdditionalTPLabel)
                                        {         ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                  ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel", OBJPROP_BACK, DrawTextAsBackground); }
                                        for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                                        {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                  ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_BACK, DrawTextAsBackground);
                                                  if (ShowAdditionalTPLabel)
                                                  {         ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                            ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel" + IntegerToString(i), OBJPROP_BACK, DrawTextAsBackground); } } } }
                    if ((sets.WasSelectedEntryLine) && (sets.EntryType != Instant)) ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTED, true);
                    if (sets.WasSelectedStopLossLine) ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_SELECTED, true);
                    if (sets.WasSelectedTakeProfitLine) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_SELECTED, true);
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         if (sets.WasSelectedAdditionalTakeProfitLine[i - 1]) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_SELECTED, true); }
                    HideShowMaximize(); }
          else
          {         sets.WasSelectedEntryLine = ObjectGetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTED);
                    sets.WasSelectedStopLossLine = ObjectGetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_SELECTED);
                    sets.WasSelectedTakeProfitLine = ObjectGetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_SELECTED);
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         sets.WasSelectedAdditionalTakeProfitLine[i - 1] = ObjectGetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_SELECTED); }
                    ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS); }
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "SLPositions.AdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnStopLoss()
{         if (sets.ATRMultiplierSL > 0) return;
          double sl_distance = DefaultSL * _Point;
          if (sets.TradeDirection == Long) sl_distance = -sl_distance;
          sets.StopLossLevel = NormalizeDouble(CalculatorPad_OrderEntry.tEntryLevel + sl_distance, _Digits);
          if (CalculatorPad_OrderStopLoss.tStopLossLevel != sets.StopLossLevel)
          {         CalculatorPad_OrderStopLoss.tStopLossLevel = sets.StopLossLevel;
                    if (!UseFixedSLDistance) m_EdtSL.Text(DoubleToString(CalculatorPad_OrderStopLoss.tStopLossLevel, _Digits));
                    else
                    {         sets.StopLoss = (int)MathRound(MathAbs(CalculatorPad_OrderStopLoss.tStopLossLevel - CalculatorPad_OrderEntry.tEntryLevel) / _Point);
                              m_EdtSL.Text(IntegerToString(sets.StopLoss)); }
                    ObjectSetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, sets.StopLossLevel); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnTakeProfit()
{         // If "TP locked on SL" mode was on, turn it off.
          if (sets.TPLockedOnSL)
          {         m_BtnTakeProfit.ColorBackground(CONTROLSg_BUTTON_COLOR_BG);
                    sets.TPLockedOnSL = false;
                    return; }
          // If already have some take-profit, switch to a locked mode - TP always follows SL when Entry-SL difference changes.
          else if (sets.TakeProfitLevel != 0)
          {         sets.TPLockedOnSL = true;
                    m_BtnTakeProfit.ColorBackground(CONTROLSg_BUTTON_COLOR_ENABLE); }
          ProcessTPChange(true); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnEntry()
{         // Switch trade type.
          if (sets.TradeDirection == Long)
          {         sets.TradeDirection = Short;
                    double old_tp_distance = 0;
                    if (sets.TakeProfitLevel > 0) old_tp_distance = sets.TakeProfitLevel - sets.EntryLevel;
                    double old_sl_distance = sets.EntryLevel - sets.StopLossLevel;
                    if (sets.EntryType == Instant) sets.EntryLevel = SymbolInfoDouble(Symbol(), SYMBOL_BID);
                    if ((ShowATROptions) && (sets.ATRMultiplierSL > 0))
                    {         sets.StopLossLevel = sets.EntryLevel + sets.StopLoss * _Point;
                              ObjectSetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, sets.EntryLevel + sets.StopLoss * _Point); // ATR stop-loss in use.
                    }
                    else
                    {         sets.StopLossLevel = sets.EntryLevel + old_sl_distance;
                              ObjectSetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, sets.EntryLevel + old_sl_distance); // Other cases.
                    }
                    if (sets.TakeProfitLevel > 0)
                    {         if (UseFixedTPDistance) sets.TakeProfitLevel = sets.EntryLevel - sets.TakeProfit * _Point;
                              else sets.TakeProfitLevel = sets.EntryLevel - old_tp_distance;
                              ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE, sets.TakeProfitLevel);
                              for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                              {         if (sets.ScriptTP[i] == 0) continue;
                                        old_tp_distance = sets.ScriptTP[i] - sets.EntryLevel;
                                        sets.ScriptTP[i] = sets.EntryLevel - old_tp_distance;
                                        ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE, sets.ScriptTP[i]); } } }
          else
          {         sets.TradeDirection = Long;
                    double old_tp_distance = 0;
                    if (sets.TakeProfitLevel > 0) old_tp_distance = sets.EntryLevel - sets.TakeProfitLevel;
                    double old_sl_distance = sets.StopLossLevel - sets.EntryLevel;
                    if (sets.EntryType == Instant) sets.EntryLevel = SymbolInfoDouble(Symbol(), SYMBOL_ASK);
                    if ((ShowATROptions) && (sets.ATRMultiplierSL > 0))
                    {         sets.StopLossLevel = CalculatorPad_OrderEntry.tEntryLevel - sets.StopLoss * _Point;
                              ObjectSetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, CalculatorPad_OrderEntry.tEntryLevel - sets.StopLoss * _Point); // ATR stop-loss in use.
                    }
                    else
                    {         sets.StopLossLevel = sets.EntryLevel - old_sl_distance;
                              ObjectSetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, sets.EntryLevel - old_sl_distance); // Other cases.
                    }
                    if (sets.TakeProfitLevel > 0)
                    {         if (UseFixedTPDistance) sets.TakeProfitLevel = sets.EntryLevel + sets.TakeProfitLevel * _Point;
                              else sets.TakeProfitLevel = sets.EntryLevel + old_tp_distance;
                              ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE, sets.TakeProfitLevel);
                              for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                              {         if (sets.ScriptTP[i] == 0) continue;
                                        old_tp_distance = sets.EntryLevel - sets.ScriptTP[i];
                                        sets.ScriptTP[i] = sets.EntryLevel + old_tp_distance;
                                        ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE, sets.ScriptTP[i]); } } }
          RefreshValues();//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnATRTimeframe()
{         switch(sets.ATRTimeframe)
          {         case PERIOD_CURRENT:
                              sets.ATRTimeframe = PERIOD_M1;
                              break;
                    case PERIOD_M1:
                              sets.ATRTimeframe = PERIOD_M5;
                              break;
                    case PERIOD_M5:
                              sets.ATRTimeframe = PERIOD_M15;
                              break;
                    case PERIOD_M15:
                              sets.ATRTimeframe = PERIOD_M30;
                              break;
                    case PERIOD_M30:
                              sets.ATRTimeframe = PERIOD_H1;
                              break;
                    case PERIOD_H1:
                              sets.ATRTimeframe = PERIOD_H4;
                              break;
                    case PERIOD_H4:
                              sets.ATRTimeframe = PERIOD_D1;
                              break;
                    case PERIOD_D1:
                              sets.ATRTimeframe = PERIOD_W1;
                              break;
                    case PERIOD_W1:
                              sets.ATRTimeframe = PERIOD_MN1;
                              break;
                    case PERIOD_MN1:
                              sets.ATRTimeframe = PERIOD_CURRENT;
                              break;
                    default:
                              sets.ATRTimeframe = (ENUM_TIMEFRAMES)_Period;
                              break; }
          if (sets.ATRTimeframe != PERIOD_CURRENT) m_BtnATRTimeframe.Text(EnumToString(sets.ATRTimeframe));
          else m_BtnATRTimeframe.Text("CURRENT");
          RefreshValues(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnMaxPS()
{         PositionData.OutputPositionSize = PositionData.OutputMaxPositionSize;
          sets.RiskFromPositionSize = true;
          double d_val = StringToDouble(m_EdtPosSize.Text());
          if (PositionData.OutputPositionSize != d_val)
          {         m_EdtPosSize.Text(Utilities.FormatDouble(DoubleToString(PositionData.OutputPositionSize, ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS), ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS));
                    sets.PositionSize = PositionData.OutputPositionSize;
                    CalculateRiskAndPositionSize();
                    DisplayValues(); } }

// Each TP is calculated to be equally spaced between main TP and Entry.
void C_CalculatorPad::OnClickBtnTPsInward()
{         if (sets.TakeProfitLevel == 0) ProcessTPChange(true); // True - for RefreshValues() call.
          for (int i = 0; i < ScriptTakePorfitsNumber; i++)
          {         CalculatorPad_OrderTP.ScriptTPEdits[i].Text(DoubleToString(sets.EntryLevel + (sets.TakeProfitLevel - sets.EntryLevel) * double(ScriptTakePorfitsNumber - i) / double(ScriptTakePorfitsNumber)));
                    UpdateScriptTPEdit(i); } }

// Each TP is calculated as the previous level + main TP size.
void C_CalculatorPad::OnClickBtnTPsOutward()
{         if (sets.TakeProfitLevel == 0) ProcessTPChange(true); // True - for RefreshValues() call.
          for (int i = 0; i < ScriptTakePorfitsNumber; i++)
          {         CalculatorPad_OrderTP.ScriptTPEdits[i].Text(DoubleToString(sets.EntryLevel + (sets.TakeProfitLevel - sets.EntryLevel) * (i + 1)));
                    UpdateScriptTPEdit(i); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnQuickRisk1()
{         sets.UseMoneyInsteadOfPercentage = false;
          sets.RiskFromPositionSize = false;
          if (sets.Risk != QuickRisk1)
          {         sets.Risk = QuickRisk1;
                    CalculateRiskAndPositionSize();
                    DisplayValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnClickBtnQuickRisk2()
{         sets.UseMoneyInsteadOfPercentage = false;
          sets.RiskFromPositionSize = false;
          if (sets.Risk != QuickRisk2)
          {         sets.Risk = QuickRisk2;
                    CalculateRiskAndPositionSize();
                    DisplayValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtEntryLevel()
{         sets.EntryLevel = StringToDouble(m_EdtEntryLevel.Text());
          if (CalculatorPad_OrderEntry.tEntryLevel != sets.EntryLevel)
          {         // Check and adjust for ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE granularity.
                    if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0) sets.EntryLevel = NormalizeDouble(MathRound(sets.EntryLevel / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, _Digits);
                    CalculatorPad_OrderEntry.tEntryLevel = sets.EntryLevel;
                    ObjectSetDouble(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_PRICE, sets.EntryLevel);
                    RefreshValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtSL()
{         if (!UseFixedSLDistance)
          {         // Check and adjust for ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE granularity.
                    if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0) sets.StopLossLevel = NormalizeDouble(MathRound(sets.StopLossLevel / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, _Digits);
                    sets.StopLossLevel = StringToDouble(m_EdtSL.Text()); }
          else
          {         if ((int)StringToInteger(m_EdtSL.Text()) <= 0)
                    {         Print("StopLoss should be positive.");
                              m_EdtSL.Text(IntegerToString(sets.StopLoss)); }
                    else
                    {         sets.StopLoss = (int)StringToInteger(m_EdtSL.Text());
                              // Check and adjust for ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE granularity.
                              if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0) sets.StopLoss = (int)MathRound(MathRound(sets.StopLoss * _Point / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE / _Point); }
                    if (sets.TradeDirection == Long)
                              sets.StopLossLevel = NormalizeDouble(sets.EntryLevel + sets.StopLoss * _Point, _Digits);
                    else
                              sets.StopLossLevel = NormalizeDouble(sets.EntryLevel - sets.StopLoss * _Point, _Digits); }
          if (CalculatorPad_OrderStopLoss.tStopLossLevel != sets.StopLossLevel)
          {         CalculatorPad_OrderStopLoss.tStopLossLevel = sets.StopLossLevel;
                    ObjectSetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, sets.StopLossLevel);
                    if (ShowATROptions) // Update ATR multiplier after the value was changed by the user.
                    {         double atr = iATR(_Symbol, sets.ATRTimeframe, sets.ATRPeriod, 0);
                              if (atr != 0) sets.ATRMultiplierSL = MathAbs(sets.StopLossLevel - sets.EntryLevel) / atr;
                              m_EdtATRMultiplierSL.Text(DoubleToString(sets.ATRMultiplierSL, 2)); }
                    RefreshValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtTP()
{         if (!UseFixedTPDistance)
          {         // Check and adjust for ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE granularity.
                    if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0) sets.TakeProfitLevel = NormalizeDouble(MathRound(sets.TakeProfitLevel / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, _Digits);
                    sets.TakeProfitLevel = StringToDouble(m_EdtTP.Text()); }
          else
          {         sets.TakeProfit = (int)StringToInteger(m_EdtTP.Text());
                    // Check and adjust for ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE granularity.
                    if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0) sets.TakeProfit = (int)MathRound(MathRound(sets.TakeProfit * _Point / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE / _Point);
                    if (sets.TakeProfit > 0)
                    {         if (sets.TradeDirection == Long)
                                        sets.TakeProfitLevel = NormalizeDouble(sets.EntryLevel - sets.TakeProfit * _Point, _Digits);
                              else
                                        sets.TakeProfitLevel = NormalizeDouble(sets.EntryLevel + sets.TakeProfit * _Point, _Digits); }
                    else sets.TakeProfitLevel = 0; }
          if (CalculatorPad_OrderTP.tTakeProfitLevel != sets.TakeProfitLevel)
          {         if ((ScriptTakePorfitsNumber > 1) && (CalculatorPad_OrderTP.tTakeProfitLevel == 0) && (sets.TakeProfitLevel != 0)) // Was zero, became non-zero.
                    {         for (int i = 0; i < ScriptTakePorfitsNumber; i++)
                              {         if (i == 0) sets.ScriptTP[i] = sets.TakeProfitLevel;
                                        else
                                        {         CalculatorPad_OrderTP.ScriptTPEdits[i].Text(DoubleToString(sets.EntryLevel + (sets.TakeProfitLevel - sets.EntryLevel) * double(ScriptTakePorfitsNumber - i) / double(ScriptTakePorfitsNumber)));
                                                  UpdateScriptTPEdit(i); } } }
                    CalculatorPad_OrderTP.tTakeProfitLevel = sets.TakeProfitLevel;
                    if (ObjectFind(ChartID(), ObjectPrefix + "TakeProfitLine") == -1)
                    {         ObjectCreate(ChartID(), ObjectPrefix + "TakeProfitLine", OBJ_HLINE, 0, TimeCurrent(), sets.TakeProfitLevel);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_STYLE, takeprofit_line_style);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_COLOR, takeprofit_line_color);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_WIDTH, takeprofit_line_width);
                              ObjectSetString(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TOOLTIP, "Take-Profit");
                              // Create multiple TP lines.
                              for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                              {         ObjectCreate(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJ_HLINE, 0, TimeCurrent(), sets.ScriptTP[i]);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_STYLE, takeprofit_line_style);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_COLOR, takeprofit_line_color);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_WIDTH, takeprofit_line_width);
                                        ObjectSetString(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TOOLTIP, "Take-Profit #" + IntegerToString(i + 1)); } }
                    else
                    {         ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE, sets.TakeProfitLevel);
                              // Move multiple TP lines.
                              for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                              {         ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE, sets.ScriptTP[i]); } }
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_SELECTABLE, true);
                    if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_SELECTED, true);
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_SELECTABLE, true);
                              if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_SELECTED, true); }
                    if (StringToDouble(m_EdtTP.Text()) == 0) // Hide.
                    {         m_LblRR.Hide();
                              m_EdtRR1.Hide();
                              m_EdtRR2.Hide();
                              m_LblReward.Hide();
                              m_EdtReward1.Hide();
                              m_EdtReward2.Hide();
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                              for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                              {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS); }
                              MoveAndResize(); }
                    else // Show.
                    {         m_LblRR.Show();
                              if (PositionData_RiskReward.InputRR != "") m_EdtRR1.Show();
                              m_EdtRR2.Show();
                              m_LblReward.Show();
                              m_EdtReward1.Show();
                              m_EdtReward2.Show();
                              if (sets.ShowLines)
                              {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_BACK, false);
                                        if (ShowLineLabels)
                                        {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                  ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_BACK, DrawTextAsBackground); }
                                        if (ShowAdditionalTPLabel)
                                        {         ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                  ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel", OBJPROP_BACK, DrawTextAsBackground); }
                                        for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                                        {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                  ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_BACK, false);
                                                  if (ShowLineLabels)
                                                  {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                            ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_BACK, DrawTextAsBackground); }
                                                  if (ShowAdditionalTPLabel)
                                                  {         ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                                            ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel" + IntegerToString(i), OBJPROP_BACK, DrawTextAsBackground); } } }
                              HideShowMaximize();
                              MoveAndResize(); }
                    if (ShowATROptions) // Update ATR multiplier after the line was moved by the user.
                    {         double atr = iATR(_Symbol, sets.ATRTimeframe, sets.ATRPeriod, 0);
                              if (atr != 0) sets.ATRMultiplierTP = MathAbs(sets.TakeProfitLevel - sets.EntryLevel) / atr;
                              m_EdtATRMultiplierTP.Text(DoubleToString(sets.ATRMultiplierTP, 2)); }
                    RefreshValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtCommissionSize()
{         if (sets.CommissionPerLot != StringToDouble(m_EdtCommissionSize.Text()))
          {         sets.CommissionPerLot = StringToDouble(m_EdtCommissionSize.Text());
                    CalculateRiskAndPositionSize();
                    DisplayValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtAccount()
{         double field_value = StringToDouble(m_EdtAccount.Text());
          if (sets.CustomBalance != field_value)
          {         if (field_value >= 0) sets.CustomBalance = field_value;
                    RecalculatePositionSize();
                    DisplayValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtRiskPIn()
{         sets.UseMoneyInsteadOfPercentage = false;
          sets.RiskFromPositionSize = false;
          if (sets.Risk != StringToDouble(m_EdtRiskPIn.Text()))
          {         sets.Risk = StringToDouble(m_EdtRiskPIn.Text());
                    CalculateRiskAndPositionSize();
                    DisplayValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtRiskMIn()
{         string s_val = m_EdtRiskMIn.Text();
          StringReplace(s_val, ",", "");
          sets.UseMoneyInsteadOfPercentage = true;
          sets.RiskFromPositionSize = false;
          if (sets.MoneyRisk != StringToDouble(s_val))
          {         sets.MoneyRisk = StringToDouble(s_val);
                    CalculateRiskAndPositionSize();
                    DisplayValues(); } }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtPosSize()
{         sets.RiskFromPositionSize = true;
          double d_val = StringToDouble(m_EdtPosSize.Text());
          if (d_val >= 0)
          {         if (PositionData.OutputPositionSize != d_val)
                    {         PositionData.OutputPositionSize = d_val;
                              sets.PositionSize = PositionData.OutputPositionSize;
                              CalculateRiskAndPositionSize();
                              DisplayValues(); } }
          else m_EdtPosSize.Text(Utilities.FormatDouble(DoubleToString(PositionData.OutputPositionSize, ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS), ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS)); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditATRPeriod()
{         int i_val = (int)StringToInteger(m_EdtATRPeriod.Text());
          if (i_val > 0)
          {         if (sets.ATRPeriod != i_val)
                    {         sets.ATRPeriod = i_val;
                              RefreshValues(); }
                    m_EdtATRPeriod.Text(IntegerToString(i_val)); }
          else m_EdtATRPeriod.Text(IntegerToString(sets.ATRPeriod)); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditATRMultiplierSL()
{         double d_val = StringToDouble(m_EdtATRMultiplierSL.Text());
          if (d_val >= 0)
          {         if (sets.ATRMultiplierSL != d_val)
                    {         sets.ATRMultiplierSL = d_val;
                              RefreshValues(); }
                    m_EdtATRMultiplierSL.Text(DoubleToString(d_val, 2)); }
          else m_EdtATRMultiplierSL.Text(DoubleToString(sets.ATRMultiplierSL, 2)); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditATRMultiplierTP()
{         double d_val = StringToDouble(m_EdtATRMultiplierTP.Text());
          if (d_val >= 0)
          {         if (sets.ShowLines) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                    if (sets.ATRMultiplierTP != d_val)
                    {         sets.ATRMultiplierTP = d_val;
                              RefreshValues(); }
                    m_EdtATRMultiplierTP.Text(DoubleToString(d_val, 2)); }
          else m_EdtATRMultiplierTP.Text(DoubleToString(sets.ATRMultiplierTP, 2)); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnChangeChkCountPendings()
{         if (sets.CountPendingOrders != m_ChkCountPendings.Checked())
          {         sets.CountPendingOrders = m_ChkCountPendings.Checked();
                    ct_Drive.TDD.ct_Market_Symbol.CalculatePortfolioRisk(StSymbol.Current, ct_Drive.TDD.ct_Account._Mql_.ACCOUNT_CURRENCY_string, ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_PROFIT);
                    DisplayValues(); }//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnChangeChkIgnoreOrders()
{         if (sets.IgnoreOrdersWithoutStopLoss != m_ChkIgnoreOrders.Checked())
          {         sets.IgnoreOrdersWithoutStopLoss = m_ChkIgnoreOrders.Checked();
                    ct_Drive.TDD.ct_Market_Symbol.CalculatePortfolioRisk(StSymbol.Current, ct_Drive.TDD.ct_Account._Mql_.ACCOUNT_CURRENCY_string, ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_PROFIT);
                    DisplayValues(); } //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnChangeChkIgnoreOtherSymbols()
{         if (sets.IgnoreOtherSymbols != m_ChkIgnoreOtherSymbols.Checked())
          {         sets.IgnoreOtherSymbols = m_ChkIgnoreOtherSymbols.Checked();
                    ct_Drive.TDD.ct_Market_Symbol.CalculatePortfolioRisk(StSymbol.Current, ct_Drive.TDD.ct_Account._Mql_.ACCOUNT_CURRENCY_string, ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_PROFIT);
                    DisplayValues(); } //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtCustomLeverage()
{         sets.CustomLeverage = (int)StringToInteger(m_EdtCustomLeverage.Text());
          if (PositionData_Leverage.Leverage_Custom != sets.CustomLeverage) { PositionData_Leverage.Leverage_Custom = sets.CustomLeverage; RefreshValues(); } //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtMagicNumber()
{         sets.MagicNumber = (int)StringToInteger(m_EdtMagicNumber.Text());
          if (sets.MagicNumber < 0)
          {         sets.MagicNumber = -sets.MagicNumber;
                    m_EdtMagicNumber.Text(IntegerToString(sets.MagicNumber)); } //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtScriptCommentary()
{         sets.ScriptCommentary = m_EdtScriptCommentary.Text(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnChangeChkDisableTradingWhenLinesAreHidden()
{         sets.DisableTradingWhenLinesAreHidden = m_ChkDisableTradingWhenLinesAreHidden.Checked(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtMaxSlippage()
{         sets.MaxSlippage = (int)StringToInteger(m_EdtMaxSlippage.Text()); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtMaxSpread()
{         sets.MaxSpread = (int)StringToInteger(m_EdtMaxSpread.Text()); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtMaxEntrySLDistance()
{         sets.MaxEntrySLDistance = (int)StringToInteger(m_EdtMaxEntrySLDistance.Text()); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtMinEntrySLDistance()
{         sets.MinEntrySLDistance = (int)StringToInteger(m_EdtMinEntrySLDistance.Text()); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnEndEditEdtMaxPositionSize()
{         sets.MaxPositionSize = (double)StringToDouble(m_EdtMaxPositionSize.Text());
          m_EdtMaxPositionSize.Text(DoubleToString(sets.MaxPositionSize, ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS)); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnChangeChkSubtractPositions()
{         sets.SubtractPositions = m_ChkSubtractPositions.Checked(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnChangeChkSubtractPendingOrders()
{         sets.SubtractPendingOrders = m_ChkSubtractPendingOrders.Checked(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnChangeChkDoNotApplyStopLoss()
{         sets.DoNotApplyStopLoss = m_ChkDoNotApplyStopLoss.Checked(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnChangeChkDoNotApplyTakeProfit()
{         sets.DoNotApplyTakeProfit = m_ChkDoNotApplyStopLoss.Checked(); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnChangeChkAskForConfirmation()
{         sets.AskForConfirmation = m_ChkAskForConfirmation.Checked(); }

//+-----------------------+
//| Working with settings |
//|+----------------------+
bool C_CalculatorPad::SaveSet_tingsOnDisk()
{         Print("Trying to save settings to file: " + m_FileName + ".");
          int fh;
          fh = FileOpen(m_FileName, FILE_CSV | FILE_WRITE);
          if (fh == INVALID_HANDLE)
          {         Print("Failed to open file for writing: " + m_FileName + ". Error: " + IntegerToString(GetLastError()));
                    return false; }
// ct_Order does not matter.
          FileWrite(fh, "EntryType");
          FileWrite(fh, IntegerToString(sets.EntryType));
          FileWrite(fh, "EntryLevel");
          FileWrite(fh, DoubleToString(sets.EntryLevel, _Digits));
          FileWrite(fh, "StopLossLevel");
          FileWrite(fh, DoubleToString(sets.StopLossLevel, _Digits));
          FileWrite(fh, "TakeProfitLevel");
          FileWrite(fh, DoubleToString(sets.TakeProfitLevel, _Digits));
          FileWrite(fh, "Risk");
          FileWrite(fh, DoubleToString(sets.Risk, 2));
          FileWrite(fh, "MoneyRisk");
          FileWrite(fh, DoubleToString(sets.MoneyRisk, 2));
          FileWrite(fh, "CommissionPerLot");
          FileWrite(fh, DoubleToString(sets.CommissionPerLot, 2));
          FileWrite(fh, "CustomBalance");
          FileWrite(fh, DoubleToString(sets.CustomBalance, 2));
          FileWrite(fh, "UseMoneyInsteadOfPercentage");
          FileWrite(fh, IntegerToString(sets.UseMoneyInsteadOfPercentage));
          FileWrite(fh, "RiskFromPositionSize");
          FileWrite(fh, IntegerToString(sets.RiskFromPositionSize));
          if (sets.RiskFromPositionSize)
          {         FileWrite(fh, "PositionSize");
                    FileWrite(fh, DoubleToString(sets.PositionSize, ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS)); }
          FileWrite(fh, "AccountButton");
          FileWrite(fh, IntegerToString(sets.AccountButton));
          FileWrite(fh, "CountPendingOrders");
          FileWrite(fh, IntegerToString(sets.CountPendingOrders));
          FileWrite(fh, "IgnoreOrdersWithoutStopLoss");
          FileWrite(fh, IntegerToString(sets.IgnoreOrdersWithoutStopLoss));
          FileWrite(fh, "IgnoreOtherSymbols");
          FileWrite(fh, IntegerToString(sets.IgnoreOtherSymbols));
          FileWrite(fh, "ShowLines");
          FileWrite(fh, IntegerToString(sets.ShowLines));
          FileWrite(fh, "SelectedTab");
          FileWrite(fh, IntegerToString(sets.SelectedTab));
          FileWrite(fh, "CustomLeverage");
          FileWrite(fh, IntegerToString(sets.CustomLeverage));
          FileWrite(fh, "MagicNumber");
          FileWrite(fh, IntegerToString(sets.MagicNumber));
          FileWrite(fh, "ScriptCommentary");
          FileWrite(fh, sets.ScriptCommentary);
          FileWrite(fh, "DisableTradingWhenLinesAreHidden");
          FileWrite(fh, IntegerToString(sets.DisableTradingWhenLinesAreHidden));
// Multiple TPs in use.
          if (ScriptTakePorfitsNumber > 1)
          {         for (int i = 0; i < ScriptTakePorfitsNumber; i++)
                    {         FileWrite(fh, "ScriptTP_" + IntegerToString(i));
                              FileWrite(fh, DoubleToString(sets.ScriptTP[i], _Digits));
                              FileWrite(fh, "ScriptTPShare_" + IntegerToString(i));
                              FileWrite(fh, IntegerToString(sets.ScriptTPShare[i])); } }
          FileWrite(fh, "MaxSlippage");
          FileWrite(fh, IntegerToString(sets.MaxSlippage));
          FileWrite(fh, "MaxSpread");
          FileWrite(fh, IntegerToString(sets.MaxSpread));
          FileWrite(fh, "MaxEntrySLDistance");
          FileWrite(fh, IntegerToString(sets.MaxEntrySLDistance));
          FileWrite(fh, "MinEntrySLDistance");
          FileWrite(fh, IntegerToString(sets.MinEntrySLDistance));
          FileWrite(fh, "MaxPositionSize");
          FileWrite(fh, DoubleToString(sets.MaxPositionSize, ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS));
          FileWrite(fh, "StopLoss");
          FileWrite(fh, IntegerToString(sets.StopLoss));
          FileWrite(fh, "TakeProfit");
          FileWrite(fh, IntegerToString(sets.TakeProfit));
          FileWrite(fh, "TradeDirection");
          FileWrite(fh, IntegerToString(sets.TradeDirection));
          FileWrite(fh, "SubtractPositions");
          FileWrite(fh, IntegerToString(sets.SubtractPositions));
          FileWrite(fh, "SubtractPendingOrders");
          FileWrite(fh, IntegerToString(sets.SubtractPendingOrders));
          FileWrite(fh, "ATRPeriod");
          FileWrite(fh, IntegerToString(sets.ATRPeriod));
          FileWrite(fh, "ATRMultiplierSL");
          FileWrite(fh, DoubleToString(sets.ATRMultiplierSL, 2));
          FileWrite(fh, "ATRMultiplierTP");
          FileWrite(fh, DoubleToString(sets.ATRMultiplierTP, 2));
          FileWrite(fh, "ATRTimeframe");
          FileWrite(fh, IntegerToString(sets.ATRTimeframe));
          FileWrite(fh, "WasSelectedEntryLine");
          FileWrite(fh, IntegerToString(sets.WasSelectedEntryLine));
          FileWrite(fh, "WasSelectedStopLossLine");
          FileWrite(fh, IntegerToString(sets.WasSelectedStopLossLine));
          FileWrite(fh, "WasSelectedTakeProfitLine");
          FileWrite(fh, IntegerToString(sets.WasSelectedTakeProfitLine));
// Multiple TPs in use.
          if (ScriptTakePorfitsNumber > 1)
          {         for (int i = 0; i < ScriptTakePorfitsNumber - 1; i++)
                    {         FileWrite(fh, "WasSelectedAdditionalTakeProfitLine_" + IntegerToString(i));
                              FileWrite(fh, IntegerToString(sets.WasSelectedAdditionalTakeProfitLine[i])); } }
          FileWrite(fh, "DoNotApplyStopLoss");
          FileWrite(fh, IntegerToString(sets.DoNotApplyStopLoss));
          FileWrite(fh, "DoNotApplyTakeProfit");
          FileWrite(fh, IntegerToString(sets.DoNotApplyTakeProfit));
          FileWrite(fh, "AskForConfirmation");
          FileWrite(fh, IntegerToString(sets.AskForConfirmation));
          FileWrite(fh, "IsPanelMinimized");
          FileWrite(fh, IntegerToString(sets.IsPanelMinimized));
          FileWrite(fh, "TPLockedOnSL");
          FileWrite(fh, IntegerToString(sets.TPLockedOnSL));
// These are not part of settings but are panel-related input parameters.
// When indicator is reloaded due to its input parameters change, these should be compared to the new values.
// If the value is changed, it should be updated in the panel too.
// Is indicator reloading due to the input parameters change?
          if (GlobalVariableGet("PSC-" + IntegerToString(ChartID()) + "-Parameters") > 0)
          {         FileWrite(fh, "Parameter_DefaultTradeDirection");
                    FileWrite(fh, IntegerToString(DefaultTradeDirection));
                    FileWrite(fh, "Parameter_DefaultSL");
                    FileWrite(fh, IntegerToString(DefaultSL));
                    FileWrite(fh, "Parameter_DefaultTP");
                    FileWrite(fh, IntegerToString(DefaultTP));
                    FileWrite(fh, "Parameter_DefaultShowLines");
                    FileWrite(fh, IntegerToString(DefaultShowLines));
                    FileWrite(fh, "Parameter_DefaultLinesSelected");
                    FileWrite(fh, IntegerToString(DefaultLinesSelected));
                    FileWrite(fh, "Parameter_DefaultATRPeriod");
                    FileWrite(fh, IntegerToString(DefaultATRPeriod));
                    FileWrite(fh, "Parameter_DefaultATRMultiplierSL");
                    FileWrite(fh, DoubleToString(DefaultATRMultiplierSL, 2));
                    FileWrite(fh, "Parameter_DefaultATRMultiplierTP");
                    FileWrite(fh, DoubleToString(DefaultATRMultiplierTP, 2));
                    FileWrite(fh, "Parameter_DefaultATRTimeframe");
                    FileWrite(fh, IntegerToString(DefaultATRTimeframe));
                    FileWrite(fh, "Parameter_DefaultEntryType");
                    FileWrite(fh, IntegerToString(DefaultEntryType));
                    FileWrite(fh, "Parameter_DefaultCommission");
                    FileWrite(fh, DoubleToString(DefaultCommission, 2));
                    FileWrite(fh, "Parameter_DefaultAccountButton");
                    FileWrite(fh, IntegerToString(DefaultAccountButton));
                    FileWrite(fh, "Parameter_CustomBalance");
                    FileWrite(fh, DoubleToString(CustomBalance));
                    FileWrite(fh, "Parameter_DefaultRisk");
                    FileWrite(fh, DoubleToString(DefaultRisk, 2));
                    FileWrite(fh, "Parameter_DefaultMoneyRisk");
                    FileWrite(fh, DoubleToString(DefaultMoneyRisk, 2));
                    FileWrite(fh, "Parameter_DefaultCountPendingOrders");
                    FileWrite(fh, IntegerToString(DefaultCountPendingOrders));
                    FileWrite(fh, "Parameter_DefaultIgnoreOrdersWithoutStopLoss");
                    FileWrite(fh, IntegerToString(DefaultIgnoreOrdersWithoutStopLoss));
                    FileWrite(fh, "Parameter_DefaultIgnoreOtherSymbols");
                    FileWrite(fh, IntegerToString(DefaultIgnoreOtherSymbols));
                    FileWrite(fh, "Parameter_DefaultCustomLeverage");
                    FileWrite(fh, IntegerToString(DefaultCustomLeverage));
                    FileWrite(fh, "Parameter_DefaultMagicNumber");
                    FileWrite(fh, IntegerToString(DefaultMagicNumber));
                    FileWrite(fh, "Parameter_DefaultCommentary");
                    FileWrite(fh, DefaultCommentary);
                    FileWrite(fh, "Parameter_DefaultDisableTradingWhenLinesAreHidden");
                    FileWrite(fh, IntegerToString(DefaultDisableTradingWhenLinesAreHidden));
                    FileWrite(fh, "Parameter_DefaultMaxSlippage");
                    FileWrite(fh, IntegerToString(DefaultMaxSlippage));
                    FileWrite(fh, "Parameter_DefaultMaxSpread");
                    FileWrite(fh, IntegerToString(DefaultMaxSpread));
                    FileWrite(fh, "Parameter_DefaultMaxEntrySLDistance");
                    FileWrite(fh, IntegerToString(DefaultMaxEntrySLDistance));
                    FileWrite(fh, "Parameter_DefaultMinEntrySLDistance");
                    FileWrite(fh, IntegerToString(DefaultMinEntrySLDistance));
                    FileWrite(fh, "Parameter_DefaultMaxPositionSize");
                    FileWrite(fh, DoubleToString(DefaultMaxPositionSize, 2));
                    FileWrite(fh, "Parameter_DefaultSubtractOPV");
                    FileWrite(fh, IntegerToString(DefaultSubtractOPV));
                    FileWrite(fh, "Parameter_DefaultSubtractPOV");
                    FileWrite(fh, IntegerToString(DefaultSubtractPOV));
                    FileWrite(fh, "Parameter_DefaultDoNotApplyStopLoss");
                    FileWrite(fh, IntegerToString(DefaultDoNotApplyStopLoss));
                    FileWrite(fh, "Parameter_DefaultDoNotApplyTakeProfit");
                    FileWrite(fh, IntegerToString(DefaultDoNotApplyTakeProfit));
                    FileWrite(fh, "Parameter_DefaultAskForConfirmation");
                    FileWrite(fh, IntegerToString(DefaultAskForConfirmation));
                    FileWrite(fh, "Parameter_DefaultPanelPositionCorner");
                    FileWrite(fh, IntegerToString(DefaultPanelPositionCorner));
                    FileWrite(fh, "Parameter_DefaultPanelPositionX");
                    FileWrite(fh, IntegerToString(DefaultPanelPositionX));
                    FileWrite(fh, "Parameter_DefaultPanelPositionY");
                    FileWrite(fh, IntegerToString(DefaultPanelPositionY));
                    FileWrite(fh, "Parameter_DefaultTPLockedOnSL");
                    FileWrite(fh, IntegerToString(DefaultTPLockedOnSL));
                    // Not a part of sets, but needed for proper deletion of unnecessary additional TP lines.
                    FileWrite(fh, "Parameter_ScriptTakePorfitsNumber");
                    FileWrite(fh, IntegerToString(ScriptTakePorfitsNumber)); }
          FileClose(fh);
          Print("Saved settings successfully.");
          return true; }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_CalculatorPad::LoadSet_tingsFromDisk()
{         Print("Trying to load settings from file.");
          if (!FileIsExist(m_FileName))
          {         Print("No settings file to load.");
                    return false; }
          int fh;
          fh = FileOpen(m_FileName, FILE_CSV | FILE_READ);
          if (fh == INVALID_HANDLE)
          {         Print("Failed to open file for reading: " + m_FileName + ". Error: " + IntegerToString(GetLastError()));
                    return false; }
          while (!FileIsEnding(fh))
          {         string var_name = FileReadString(fh);
                    string var_content = FileReadString(fh);
                    if (var_name == "EntryType")
                              sets.EntryType = (ENUM_ENTRY_TYPE)StringToInteger(var_content);
                    else if (var_name == "EntryLevel")
                              sets.EntryLevel = StringToDouble(var_content);
                    else if (var_name == "StopLossLevel")
                              sets.StopLossLevel = StringToDouble(var_content);
                    else if (var_name == "TakeProfitLevel")
                              sets.TakeProfitLevel = StringToDouble(var_content);
                    else if (var_name == "Risk")
                              sets.Risk = StringToDouble(var_content);
                    else if (var_name == "MoneyRisk")
                              sets.MoneyRisk = StringToDouble(var_content);
                    else if (var_name == "CommissionPerLot")
                              sets.CommissionPerLot = StringToDouble(var_content);
                    else if (var_name == "CustomBalance")
                              sets.CustomBalance = StringToDouble(var_content);
                    else if (var_name == "UseMoneyInsteadOfPercentage")
                              sets.UseMoneyInsteadOfPercentage = (bool)StringToInteger(var_content);
                    else if (var_name == "RiskFromPositionSize")
                              sets.RiskFromPositionSize = (bool)StringToInteger(var_content);
                    else if ((var_name == "PositionSize") && (sets.RiskFromPositionSize))
                    {         sets.PositionSize = StringToDouble(var_content);
                              PositionData.OutputPositionSize = sets.PositionSize; }
                    else if (var_name == "AccountButton")
                              sets.AccountButton = (ENUM_ACCOUNT_BUTTON)StringToInteger(var_content);
                    else if (var_name == "CountPendingOrders")
                              sets.CountPendingOrders = (bool)StringToInteger(var_content);
                    else if (var_name == "IgnoreOrdersWithoutStopLoss")
                              sets.IgnoreOrdersWithoutStopLoss = (bool)StringToInteger(var_content);
                    else if (var_name == "IgnoreOtherSymbols")
                              sets.IgnoreOtherSymbols = (bool)StringToInteger(var_content);
                    else if (var_name == "ShowLines")
                              sets.ShowLines = (bool)StringToInteger(var_content);
                    else if (var_name == "SelectedTab")
                              sets.SelectedTab = (ENUM_TABS)StringToInteger(var_content);
                    else if (var_name == "CustomLeverage")
                              sets.CustomLeverage = (int)StringToInteger(var_content);
                    else if (var_name == "MagicNumber")
                              sets.MagicNumber = (int)StringToInteger(var_content);
                    else if (var_name == "ScriptCommentary")
                              sets.ScriptCommentary = var_content;
                    else if (var_name == "DisableTradingWhenLinesAreHidden")
                              sets.DisableTradingWhenLinesAreHidden = (bool)StringToInteger(var_content);
                    // Multiple TPs.
                    else if ((ScriptTakePorfitsNumber > 1) && (StringSubstr(var_name, 0, 9) == "ScriptTP_"))
                    {         int i = (int)StringToInteger(StringSubstr(var_name, 9)); // This TP's number.
                              if (i > ScriptTakePorfitsNumber - 1) continue; // Cannot accommodate so many.
                              sets.ScriptTP[i] = StringToDouble(var_content); }
                    else if ((ScriptTakePorfitsNumber > 1) && (StringSubstr(var_name, 0, 14) == "ScriptTPShare_"))
                    {         int i = (int)StringToInteger(StringSubstr(var_name, 14)); // This TP Share's number.
                              if (i > ScriptTakePorfitsNumber - 1) continue; // Cannot accommodate so many.
                              sets.ScriptTPShare[i] = (int)StringToInteger(var_content); }
                    else if (var_name == "MaxSlippage")
                              sets.MaxSlippage = (int)StringToInteger(var_content);
                    else if (var_name == "MaxSpread")
                              sets.MaxSpread = (int)StringToInteger(var_content);
                    else if (var_name == "MaxEntrySLDistance")
                              sets.MaxEntrySLDistance = (int)StringToInteger(var_content);
                    else if (var_name == "MinEntrySLDistance")
                              sets.MinEntrySLDistance = (int)StringToInteger(var_content);
                    else if (var_name == "MaxPositionSize")
                              sets.MaxPositionSize = StringToDouble(var_content);
                    else if (var_name == "TradeDirection")
                              sets.TradeDirection = (ENUM_TRADE_DIRECTION)StringToInteger(var_content);
                    else if (var_name == "StopLoss")
                              sets.StopLoss = (int)StringToInteger(var_content);
                    else if (var_name == "TakeProfit")
                              sets.TakeProfit = (int)StringToInteger(var_content);
                    else if (var_name == "SubtractPositions")
                              sets.SubtractPositions = (bool)StringToInteger(var_content);
                    else if (var_name == "SubtractPendingOrders")
                              sets.SubtractPendingOrders = (bool)StringToInteger(var_content);
                    else if (var_name == "ATRPeriod")
                              sets.ATRPeriod = (int)StringToInteger(var_content);
                    else if (var_name == "ATRMultiplierSL")
                              sets.ATRMultiplierSL = StringToDouble(var_content);
                    else if (var_name == "ATRMultiplierTP")
                              sets.ATRMultiplierTP = StringToDouble(var_content);
                    else if (var_name == "ATRTimeframe")
                              sets.ATRTimeframe = (ENUM_TIMEFRAMES)StringToInteger(var_content);
                    else if (var_name == "WasSelectedEntryLine")
                              sets.WasSelectedEntryLine = (bool)StringToInteger(var_content);
                    else if (var_name == "WasSelectedStopLossLine")
                              sets.WasSelectedStopLossLine = (bool)StringToInteger(var_content);
                    else if (var_name == "WasSelectedTakeProfitLine")
                              sets.WasSelectedTakeProfitLine = (bool)StringToInteger(var_content);
                    // Multiple TPs.
                    else if ((ScriptTakePorfitsNumber > 1) && (StringSubstr(var_name, 0, 36) == "WasSelectedAdditionalTakeProfitLine_"))
                    {         int i = (int)StringToInteger(StringSubstr(var_name, 36)); // This TP's number.
                              if (i > ScriptTakePorfitsNumber - 2) continue; // Cannot accommodate so many.
                              sets.WasSelectedAdditionalTakeProfitLine[i] = StringToInteger(var_content); }
                    else if (var_name == "DoNotApplyStopLoss")
                              sets.DoNotApplyStopLoss = (bool)StringToInteger(var_content);
                    else if (var_name == "DoNotApplyTakeProfit")
                              sets.DoNotApplyTakeProfit = (bool)StringToInteger(var_content);
                    else if (var_name == "AskForConfirmation")
                              sets.AskForConfirmation = (bool)StringToInteger(var_content);
                    else if (var_name == "IsPanelMinimized")
                              sets.IsPanelMinimized = (bool)StringToInteger(var_content);
                    else if (var_name == "TPLockedOnSL")
                              sets.TPLockedOnSL = (bool)StringToInteger(var_content);
                    // Is indicator reloading due to the input parameters change?
                    if (GlobalVariableGet("PSC-" + IntegerToString(ChartID()) + "-Parameters") > 0)
                    {         // These are not part of settings but are panel-related input parameters.
                              // When indicator is reloaded due to its input parameters change, these should be compared to the new values.
                              // If the value is changed, it should be updated in the panel too.
                              if (var_name == "Parameter_DefaultTradeDirection")
                              {         if ((ENUM_TRADE_DIRECTION)StringToInteger(var_content) != DefaultTradeDirection) sets.TradeDirection = DefaultTradeDirection; }
                              else if (var_name == "Parameter_DefaultShowLines")
                              {         if ((bool)StringToInteger(var_content) != DefaultShowLines) sets.ShowLines = DefaultShowLines; }
                              else if (var_name == "Parameter_DefaultSL")
                              {         if (StringToInteger(var_content) != DefaultSL)
                                        {         // Will be set to actual value via Initialization().
                                                  sets.StopLossLevel = 0;
                                                  sets.StopLoss = 0; } }
                              else if (var_name == "Parameter_DefaultTP")
                              {         if (StringToInteger(var_content) != DefaultTP)
                                        {         // Will be set to actual value via Initialization().
                                                  sets.TakeProfitLevel = 0;
                                                  sets.TakeProfit = 0; } }
                              else if (var_name == "Parameter_DefaultLinesSelected")
                              {         if ((bool)StringToInteger(var_content) != DefaultLinesSelected)
                                        {         if (DefaultLinesSelected) LinesSelectedStatus = 1; // Flip lines to selected.
                                                  else LinesSelectedStatus = 2; // Flip lines to unselected.
                                                  // Actual flipping happens inside Initialization() function.
                                        }
                                        else LinesSelectedStatus = 0; // No change.
                              }
                              else if (var_name == "Parameter_DefaultATRPeriod")
                              {         if (StringToInteger(var_content) != DefaultATRPeriod) sets.ATRPeriod = DefaultATRPeriod; }
                              else if (var_name == "Parameter_DefaultATRMultiplierSL")
                              {         if (StringToDouble(var_content) != DefaultATRMultiplierSL) sets.ATRMultiplierSL = DefaultATRMultiplierSL; }
                              else if (var_name == "Parameter_DefaultATRMultiplierTP")
                              {         if (StringToDouble(var_content) != DefaultATRMultiplierTP) sets.ATRMultiplierTP = DefaultATRMultiplierTP; }
                              else if (var_name == "Parameter_DefaultATRTimeframe")
                              {         if ((ENUM_TIMEFRAMES)StringToInteger(var_content) != DefaultATRTimeframe) sets.ATRTimeframe = DefaultATRTimeframe; }
                              else if (var_name == "Parameter_DefaultEntryType")
                              {         if ((ENUM_ENTRY_TYPE)StringToInteger(var_content) != DefaultEntryType) sets.EntryType = DefaultEntryType; }
                              else if (var_name == "Parameter_DefaultCommission")
                              {         if (StringToDouble(var_content) != DefaultCommission) sets.CommissionPerLot = DefaultCommission; }
                              else if (var_name == "Parameter_DefaultAccountButton")
                              {         if ((ENUM_ACCOUNT_BUTTON)StringToInteger(var_content) != DefaultAccountButton) sets.AccountButton = DefaultAccountButton; }
                              else if (var_name == "Parameter_CustomBalance")
                              {         if (StringToDouble(var_content) != CustomBalance) sets.CustomBalance = CustomBalance; }
                              else if (var_name == "Parameter_DefaultRisk")
                              {         if (StringToDouble(var_content) != DefaultRisk) sets.Risk = DefaultRisk; }
                              else if (var_name == "Parameter_DefaultMoneyRisk")
                              {         if ((StringToDouble(var_content) != DefaultMoneyRisk) && (DefaultMoneyRisk > 0))
                                        {         sets.MoneyRisk = DefaultMoneyRisk;
                                                  sets.UseMoneyInsteadOfPercentage = true; }
                                        else sets.UseMoneyInsteadOfPercentage = false; }
                              else if (var_name == "Parameter_DefaultCountPendingOrders")
                              {         if ((bool)StringToInteger(var_content) != DefaultCountPendingOrders) sets.CountPendingOrders = DefaultCountPendingOrders; }
                              else if (var_name == "Parameter_DefaultIgnoreOrdersWithoutStopLoss")
                              {         if ((bool)StringToInteger(var_content) != DefaultIgnoreOrdersWithoutStopLoss) sets.IgnoreOrdersWithoutStopLoss = DefaultIgnoreOrdersWithoutStopLoss; }
                              else if (var_name == "Parameter_DefaultIgnoreOtherSymbols")
                              {         if ((bool)StringToInteger(var_content) != DefaultIgnoreOtherSymbols) sets.IgnoreOtherSymbols = DefaultIgnoreOtherSymbols; }
                              else if (var_name == "Parameter_DefaultCustomLeverage")
                              {         if (StringToInteger(var_content) != DefaultCustomLeverage) sets.CustomLeverage = DefaultCustomLeverage; }
                              else if (var_name == "Parameter_DefaultMagicNumber")
                              {         if (StringToInteger(var_content) != DefaultMagicNumber) sets.MagicNumber = DefaultMagicNumber; }
                              else if (var_name == "Parameter_DefaultCommentary")
                              {         if (var_content != DefaultCommentary) sets.ScriptCommentary = DefaultCommentary; }
                              else if (var_name == "Parameter_DefaultDisableTradingWhenLinesAreHidden")
                              {         if ((bool)StringToInteger(var_content) != DefaultDisableTradingWhenLinesAreHidden) sets.DisableTradingWhenLinesAreHidden = DefaultDisableTradingWhenLinesAreHidden; }
                              else if (var_name == "Parameter_DefaultMaxSlippage")
                              {         if (StringToInteger(var_content) != DefaultMaxSlippage) sets.MaxSlippage = DefaultMaxSlippage; }
                              else if (var_name == "Parameter_DefaultMaxSpread")
                              {         if (StringToInteger(var_content) != DefaultMaxSpread) sets.MaxSpread = DefaultMaxSpread; }
                              else if (var_name == "Parameter_DefaultMaxEntrySLDistance")
                              {         if (StringToInteger(var_content) != DefaultMaxEntrySLDistance) sets.MaxEntrySLDistance = DefaultMaxEntrySLDistance; }
                              else if (var_name == "Parameter_DefaultMinEntrySLDistance")
                              {         if (StringToInteger(var_content) != DefaultMinEntrySLDistance) sets.MinEntrySLDistance = DefaultMinEntrySLDistance; }
                              else if (var_name == "Parameter_DefaultMaxPositionSize")
                              {         if (StringToDouble(var_content) != DefaultMaxPositionSize) sets.MaxPositionSize = DefaultMaxPositionSize; }
                              else if (var_name == "Parameter_DefaultSubtractOPV")
                              {         if ((bool)StringToInteger(var_content) != DefaultSubtractOPV) sets.SubtractPositions = DefaultSubtractOPV; }
                              else if (var_name == "Parameter_DefaultSubtractPOV")
                              {         if ((bool)StringToInteger(var_content) != DefaultSubtractPOV) sets.SubtractPendingOrders = DefaultSubtractPOV; }
                              else if (var_name == "Parameter_DefaultDoNotApplyStopLoss")
                              {         if ((bool)StringToInteger(var_content) != DefaultDoNotApplyStopLoss) sets.DoNotApplyStopLoss = DefaultDoNotApplyStopLoss; }
                              else if (var_name == "Parameter_DefaultDoNotApplyTakeProfit")
                              {         if ((bool)StringToInteger(var_content) != DefaultDoNotApplyTakeProfit) sets.DoNotApplyTakeProfit = DefaultDoNotApplyTakeProfit; }
                              else if (var_name == "Parameter_DefaultAskForConfirmation")
                              {         if ((bool)StringToInteger(var_content) != DefaultAskForConfirmation) sets.AskForConfirmation = DefaultAskForConfirmation; }
                              // These three only trigger panel repositioning (default position changed via the input parameters deliberately).
                              else if (var_name == "Parameter_DefaultPanelPositionCorner")
                              {         if ((ENUM_BASE_CORNER)StringToInteger(var_content) != DefaultPanelPositionCorner) Dont_Move_the_Panel_to_Default_Corner_X_Y = false; }
                              else if (var_name == "Parameter_DefaultPanelPositionX")
                              {         if (StringToInteger(var_content) != DefaultPanelPositionX) Dont_Move_the_Panel_to_Default_Corner_X_Y = false; }
                              else if (var_name == "Parameter_DefaultPanelPositionY")
                              {         if (StringToInteger(var_content) != DefaultPanelPositionY) Dont_Move_the_Panel_to_Default_Corner_X_Y = false; }
                              else if (var_name == "Parameter_DefaultTPLockedOnSL")
                              {         if (StringToInteger(var_content) != DefaultTPLockedOnSL) sets.TPLockedOnSL = DefaultTPLockedOnSL; }
                              // Not a part of sets, but needed for proper deletion of unnecessary additional TP lines.
                              else if (var_name == "Parameter_ScriptTakePorfitsNumber")
                              {         if (StringToInteger(var_content) > ScriptTakePorfitsNumber) // Only if new input parameter value is lower, which means fewer TP lines.
                                        {         int old_STPN = (int)StringToInteger(var_content);
                                                  for (int i = old_STPN - 1; i >= ScriptTakePorfitsNumber; i--)
                                                            ObjectDelete(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i)); // Delete remaining additional TP lines.
                                        } } } }
          FileClose(fh);
          Print("Loaded settings successfully.");
// Is indicator reloading due to the input parameters change? Delete the flag variable.
          if (GlobalVariableGet("PSC-" + IntegerToString(ChartID()) + "-Parameters") > 0) GlobalVariableDel("PSC-" + IntegerToString(ChartID()) + "-Parameters");
          return true; }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_CalculatorPad::DeleteSet_tingsFile()
{         if (!FileIsExist(m_FileName))
          {         Print("No settings file to delete.");
                    return false; }
          Print("Trying to delete settings file.");
          if (!FileDelete(m_FileName))
          {         Print("Failed to delete file: " + m_FileName + ". Error: " + IntegerToString(GetLastError()));
                    return false; }
          Print("Deleted settings file successfully.");
          return true; //
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::HideShowMaximize()
{
// Remember the panel's location.
          remember_left = Left();
          remember_top = Top();
          Hide();
          Show();
          NoPanelMaximization = true;
          Maximize(); }

//+------------------------------------------------------------------+
//| Bypasses the bug in program name detection in Dialog.mqh.        |
//+------------------------------------------------------------------+
void C_CalculatorPad::IniFileSave()
{         int handle = FileOpen(m_IniFileName, FILE_WRITE | FILE_BIN | FILE_ANSI);
          if (handle != INVALID_HANDLE)
          {         Save(handle);
                    FileClose(handle); } }

//+------------------------------------------------------------------+
//| Bypasses the bug in program name detection in Dialog.mqh.        |
//+------------------------------------------------------------------+
void C_CalculatorPad::IniFileLoad(void)
{         int handle = FileOpen(m_IniFileName, FILE_READ | FILE_BIN | FILE_ANSI);
          if (handle != INVALID_HANDLE)
          {         Load(handle);
                    FileClose(handle); }
          InitObjects(); // Set_s panel elements that changed based on changes in input parameters, overwriting the INI settings.
}

//+-------------------------------------------------------------------+
//| Extends CAppDialog::IniFileName() to use our custom ini filename. |
//+-------------------------------------------------------------------+
string C_CalculatorPad::IniFileName(void) const
{         string name = m_IniFileName;
          StringReplace(name, ".dat", ""); // Remove extension from our IniFileName.
          return(name); }

//+------------------------------------------------------------------+
//| Update Fixed SL distance in pips if the line got moved.          |
//+------------------------------------------------------------------+
void C_CalculatorPad::UpdateFixedSL()
{         double read_value;
          if (!ObjectGetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, 0, read_value)) return; // Update only if line exists.
          else sets.StopLossLevel = read_value;
// Check and adjust for ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE granularity.
          if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0)
          {         sets.StopLossLevel = NormalizeDouble(MathRound(sets.StopLossLevel / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, _Digits);
                    ObjectSetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, sets.StopLossLevel); }
          sets.StopLoss = (int)MathRound(MathAbs(sets.StopLossLevel - sets.EntryLevel) / _Point);
          m_EdtSL.Text(IntegerToString(sets.StopLoss));
          if (ShowATROptions) // Update ATR multiplier after the line was moved by the user.
          {         double atr = iATR(_Symbol, sets.ATRTimeframe, sets.ATRPeriod, 0);
                    if (atr != 0) sets.ATRMultiplierSL = MathAbs(sets.StopLossLevel - sets.EntryLevel) / atr;
                    m_EdtATRMultiplierSL.Text(DoubleToString(sets.ATRMultiplierSL, 2)); }
          if (sets.StopLossLevel < sets.EntryLevel)
          {         sets.TradeDirection = Long; }
          else
          {         sets.TradeDirection = Short; } }

//+------------------------------------------------------------------+
//| Update Fixed TP distance in pips if the line got moved.          |
//+------------------------------------------------------------------+
void C_CalculatorPad::UpdateFixedTP()
{         double read_value;
          if (!ObjectGetDouble(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE, 0, read_value)) return; // Update only if line exists.
          else sets.TakeProfitLevel = read_value;
// Check and adjust for ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE granularity.
          if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0)
          {         sets.TakeProfitLevel = NormalizeDouble(MathRound(sets.TakeProfitLevel / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, _Digits);
                    ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE, sets.TakeProfitLevel); }
          sets.TakeProfit = (int)MathRound(MathAbs(sets.TakeProfitLevel - sets.EntryLevel) / _Point);
          m_EdtTP.Text(IntegerToString(sets.TakeProfit));
          if (ShowATROptions) // Update ATR multiplier after the line was moved by the user.
          {         double atr = iATR(_Symbol, sets.ATRTimeframe, sets.ATRPeriod, 0);
                    if (atr != 0) sets.ATRMultiplierTP = MathAbs(sets.TakeProfitLevel - sets.EntryLevel) / atr;
                    m_EdtATRMultiplierTP.Text(DoubleToString(sets.ATRMultiplierTP, 2)); } }

//+------------------------------------------------------------------+
//| Update ct_Drive.TDD.ct_Bank.ct_Positions.Additional Fixed TP distance in pips if the line got      |
//| moved. Used when multiple TPs are set.                           |
//+------------------------------------------------------------------+
void C_CalculatorPad::UpdateAdditionalFixedTP(int i)
{         double read_value;
          if (!ObjectGetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE, 0, read_value)) return; // Update only if line exists.
          else sets.ScriptTP[i] = read_value;
// Check and adjust for ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE granularity.
          if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0)
          {         sets.ScriptTP[i] = NormalizeDouble(MathRound(sets.ScriptTP[i] / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, _Digits);
                    ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE, sets.ScriptTP[i]); }
          CalculatorPad_OrderTP.AdditionalTPEdits[i - 1].Text(IntegerToString((int)MathRound(MathAbs(sets.ScriptTP[i] - sets.EntryLevel) / _Point))); //
}

//+------------------------------------------------------------------+
//| Update respective sets structure value after one of the multiple |
//| TP fields has been changed on the Script tab.                    |
//+------------------------------------------------------------------+
void C_CalculatorPad::UpdateScriptTPEdit(int i)
{
// First, do the formatting.
          double new_value = StringToDouble(CalculatorPad_OrderTP.ScriptTPEdits[i].Text());
// Adjust for tick size granularity.
          if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0) new_value = NormalizeDouble(MathRound(new_value / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, _Digits);
          string s = DoubleToString(new_value, _Digits);
          CalculatorPad_OrderTP.ScriptTPEdits[i].Text(s);
          if (i > 0)
          {         if (!UseFixedTPDistance) CalculatorPad_OrderTP.AdditionalTPEdits[i - 1].Text(s); // TP as level.
                    else CalculatorPad_OrderTP.AdditionalTPEdits[i - 1].Text(IntegerToString((int)MathRound(MathAbs(new_value - sets.EntryLevel) / _Point))); // TP as distance.
          }
// Remember the value.
          new_value = StringToDouble(s);
          sets.ScriptTP[i] = new_value;
// If it was the first TP field on the Script tab, and the TP field on the Main tab was empty - fill it and show the line.
          if ((i == 0) && (sets.TakeProfitLevel == 0) && (new_value > 0))
          {         if (UseFixedTPDistance)
                    {         if (sets.TradeDirection == Long)
                                        m_EdtTP.Text(IntegerToString((int)MathRound(MathAbs(new_value - sets.EntryLevel) / _Point)));
                              else
                                        m_EdtTP.Text(IntegerToString((int)MathRound(MathAbs(sets.EntryLevel - new_value) / _Point))); }
                    else
                    {         sets.TakeProfitLevel = new_value;
                              m_EdtTP.Text(s); } }
          ProcessLineObjectsAfterUpdatingMultipleTP(i); }

//+------------------------------------------------------------------+
//| Update respective sets structure value after one of the multiple |
//| TP fields has been changed on the Main tab.                      |
//+------------------------------------------------------------------+
void C_CalculatorPad::UpdateAdditionalTPEdit(int i)
{
// First, do the formatting.
          double new_value = StringToDouble(CalculatorPad_OrderTP.AdditionalTPEdits[i - 1].Text());
// TP as level.
          if (!UseFixedTPDistance)
          {         // Adjust for tick size granularity.
                    if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0) new_value = NormalizeDouble(MathRound(new_value / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE, _Digits);
                    string s = DoubleToString(new_value, _Digits);
                    CalculatorPad_OrderTP.AdditionalTPEdits[i - 1].Text(s);
                    CalculatorPad_OrderTP.ScriptTPEdits[i].Text(s);
                    // Remember the value.
                    new_value = StringToDouble(s);
                    sets.ScriptTP[i] = new_value; }
// TP as distance.
          else
          {         // Check and adjust for ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE granularity.
                    if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE > 0) new_value = MathRound(MathRound(new_value * _Point / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE / _Point);
                    double TP = 0;
                    if (new_value > 0)
                    {         if (sets.TradeDirection == Long)
                              {         TP = NormalizeDouble(sets.EntryLevel - new_value * _Point, _Digits); }
                              else
                              {         TP = NormalizeDouble(sets.EntryLevel + new_value * _Point, _Digits); } }
                    CalculatorPad_OrderTP.AdditionalTPEdits[i - 1].Text(DoubleToString(new_value, 0)); // Fixed granularity.
                    CalculatorPad_OrderTP.ScriptTPEdits[i].Text(DoubleToString(TP, _Digits));
                    sets.ScriptTP[i] = TP; }
          ProcessLineObjectsAfterUpdatingMultipleTP(i); }

//+-------------------------------------------------------------------+
//| Move TP line objects after updating one of the multiple TP fields.|
//+-------------------------------------------------------------------+
void C_CalculatorPad::ProcessLineObjectsAfterUpdatingMultipleTP(int i)
{         string postfix = IntegerToString(i);
          if (i == 0) postfix = "";
// Process objects.
          ObjectSetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + postfix, OBJPROP_PRICE, sets.ScriptTP[i]);
          if (sets.ScriptTP[i] == 0) // Hide.
          {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + postfix, OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + postfix, OBJPROP_SELECTED, false);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + postfix, OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel" + postfix, OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS); }
          else // Show.
          {         if (sets.ShowLines)
                    {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + postfix, OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                              if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + postfix, OBJPROP_SELECTED, true);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + postfix, OBJPROP_BACK, false);
                              if (ShowLineLabels)
                              {         ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + postfix, OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + postfix, OBJPROP_BACK, DrawTextAsBackground); }
                              if (ShowAdditionalTPLabel)
                              {         ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel" + postfix, OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                        ObjectSetInteger(ChartID(), ObjectPrefix + "TPPositions.AdditionalLabel" + postfix, OBJPROP_BACK, DrawTextAsBackground); } }
                    HideShowMaximize(); } }

//+------------------------------------------------------------------+
//| Update respective sets structure value after one of the multiple |
//| TP share fields has been changed.                                |
//+------------------------------------------------------------------+
void C_CalculatorPad::UpdateScriptTPShareEdit(int i)
{
// First, do the formatting.
          int new_value = (int)StringToInteger(CalculatorPad_OrderTP.ScriptTPShareEdits[i].Text());
          if (new_value > 100) new_value = 100;
          else if (new_value < 0) new_value = 0;
          CalculatorPad_OrderTP.ScriptTPShareEdits[i].Text(IntegerToString(new_value));
// Remember the value.
          sets.ScriptTPShare[i] = new_value; }

// Check if all required lines exist and restore them if they have been accidentally deleted.
void C_CalculatorPad::CheckAndRestoreLines()
{         bool RestoredSomething = false;
          if (ObjectFind(ChartID(), ObjectPrefix + "EntryLine") == -1)
          {         ObjectCreate(ChartID(), ObjectPrefix + "EntryLine", OBJ_HLINE, 0, TimeCurrent(), sets.EntryLevel);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_STYLE, entry_line_style);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_COLOR, entry_line_color);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_WIDTH, entry_line_width);
                    ObjectSetString(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_TOOLTIP, "Entry");
                    if (sets.EntryType == Instant) ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTABLE, false);
                    else
                    {         ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTABLE, true);
                              if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_SELECTED, true); }
                    if (!sets.ShowLines) ObjectSetInteger(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    RestoredSomething = true; //
          }
          if (ObjectFind(ChartID(), ObjectPrefix + "StopLossLine") == -1)
          {         ObjectCreate(ChartID(), ObjectPrefix + "StopLossLine", OBJ_HLINE, 0, TimeCurrent(), sets.StopLossLevel);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_STYLE, stoploss_line_style);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_COLOR, stoploss_line_color);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_WIDTH, stoploss_line_width);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_SELECTABLE, true);
                    ObjectSetString(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_TOOLTIP, "Stop-Loss");
                    if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_SELECTED, true);
                    if (!sets.ShowLines) ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    RestoredSomething = true;//
          }
          if (ObjectFind(ChartID(), ObjectPrefix + "TakeProfitLine") == -1)
          {         ObjectCreate(ChartID(), ObjectPrefix + "TakeProfitLine", OBJ_HLINE, 0, TimeCurrent(), sets.TakeProfitLevel);
                    if ((sets.ShowLines) && ((sets.TakeProfitLevel > 0) || ((sets.ATRMultiplierTP > 0) && (ShowATROptions)))) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                    else ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_STYLE, takeprofit_line_style);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_COLOR, takeprofit_line_color);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_WIDTH, takeprofit_line_width);
                    ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_SELECTABLE, true);
                    ObjectSetString(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_TOOLTIP, "Take-Profit");
                    if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_SELECTED, true); // Only for new lines. Old lines retain their selected status unless default parameter value changed.
                    RestoredSomething = true;//
          }
// Process multiple TP lines.
          for (int i = 1; i < ScriptTakePorfitsNumber; i++)
          {         if (ObjectFind(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i)) == -1)
                    {         ObjectCreate(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJ_HLINE, 0, TimeCurrent(), sets.ScriptTP[i]);
                              if ((sets.ShowLines) && (sets.ScriptTP[i] > 0)) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                              else ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_STYLE, takeprofit_line_style);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_COLOR, takeprofit_line_color);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_WIDTH, takeprofit_line_width);
                              ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_SELECTABLE, true);
                              ObjectSetString(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_TOOLTIP, "Take-Profit #" + IntegerToString(i + 1));
                              if (DefaultLinesSelected) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_SELECTED, true); // Only for new lines. Old lines retain their selected status unless default parameter value changed.
                              RestoredSomething = true;//
                    }//
          }
// Put panel on top of the lines that were created later.
          if (RestoredSomething) HideShowMaximize(); //
}

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int C_CalculatorPad::OnInitX(bool KeyCom = false)
{         IsPadPress_Calculator = KeyCom;
          if(IsPadPress_Calculator)
          {         string indicator_short_name = "Position Size Calculator" + IntegerToString(ChartID());
                    Dont_Move_the_Panel_to_Default_Corner_X_Y = true;
// Prevent attachment of second panel if it is not a timeframe/parameters change.
                    if (GlobalVariableGet("PSC-" + IntegerToString(ChartID()) + "-Flag") > 0)
                    {         GlobalVariableDel("PSC-" + IntegerToString(ChartID()) + "-Flag"); }
                    else
                    {         int indicators_total = ChartIndicatorsTotal(0, 0);
                              for (int i = 0; i < indicators_total; i++)
                              {         if (ChartIndicatorName(0, 0, i) == indicator_short_name)
                                        {         Print("Position Size Calculator is already attached.");
                                                  return INIT_FAILED; } //
                              } //
                    }
                    IndicatorSetString(INDICATOR_SHORTNAME, indicator_short_name);
                    PanelCaption = "Position Size Calculator (ver. " + Version + ")";
                    if (ScriptTakePorfitsNumber > 1)
                    {         ArrayResize(sets.ScriptTP, ScriptTakePorfitsNumber);
                              ArrayResize(sets.ScriptTPShare, ScriptTakePorfitsNumber);
                              ArrayInitialize(sets.ScriptTP, 0);
                              ArrayInitialize(sets.ScriptTPShare, 100 / ScriptTakePorfitsNumber);
                              ArrayResize(sets.WasSelectedAdditionalTakeProfitLine, ScriptTakePorfitsNumber - 1); // -1 because the flag for the main TP is saved elsewhere.
                    }
                    if (!LoadSet_tingsFromDisk())
                    {         sets.TradeDirection         = DefaultTradeDirection;
                              sets.EntryLevel             = EntryLevel;
                              sets.StopLossLevel          = StopLossLevel;
                              sets.TakeProfitLevel        = TakeProfitLevel; // Optional
                              sets.ATRPeriod              = DefaultATRPeriod;
                              sets.ATRMultiplierSL        = DefaultATRMultiplierSL;
                              sets.ATRMultiplierTP        = DefaultATRMultiplierTP;
                              sets.ATRTimeframe           = DefaultATRTimeframe;
                              sets.EntryType              = DefaultEntryType; // If Instant, Entry level will be updated to current Ask/Bid price automatically; if Pending, Entry level will remain intact and StopLevel warning will be issued if needed.
                              sets.Risk                   = DefaultRisk; // Risk tolerance in percentage points
                              sets.MoneyRisk              = DefaultMoneyRisk; // Risk tolerance in account currency
                              if (DefaultMoneyRisk > 0) sets.UseMoneyInsteadOfPercentage = true;
                              else sets.UseMoneyInsteadOfPercentage = false;
                              sets.CommissionPerLot       = DefaultCommission; // Commission charged per lot (one side) in account currency.
                              sets.CustomBalance          = CustomBalance;
                              sets.RiskFromPositionSize   = false;
                              sets.AccountButton          = DefaultAccountButton;
                              sets.CountPendingOrders     = DefaultCountPendingOrders; // If true, portfolio risk calculation will also involve pending orders.
                              sets.IgnoreOrdersWithoutStopLoss    = DefaultIgnoreOrdersWithoutStopLoss; // If true, portfolio risk calculation will skip orders without stop-loss.
                              sets.IgnoreOtherSymbols             = DefaultIgnoreOtherSymbols; // If true, portfolio risk calculation will skip orders in other symbols.
                              sets.HideAccSize                    = HideAccSize; // If true, account size line will not be shown.
                              sets.ShowLines                      = DefaultShowLines;
                              sets.SelectedTab                    = MainTab;
                              sets.CustomLeverage                 = DefaultCustomLeverage;
                              sets.MagicNumber                    = DefaultMagicNumber;
                              sets.ScriptCommentary               = DefaultCommentary;
                              sets.DisableTradingWhenLinesAreHidden       = DefaultDisableTradingWhenLinesAreHidden;
                              if (ScriptTakePorfitsNumber > 1)
                              {         for (int i = 0; i < ScriptTakePorfitsNumber; i++)
                                        {         sets.ScriptTP[i] = TakeProfitLevel;
                                                  sets.ScriptTPShare[i] = 100 / ScriptTakePorfitsNumber; } }
                              sets.MaxSlippage                    = DefaultMaxSlippage;
                              sets.MaxSpread                      = DefaultMaxSpread;
                              sets.MaxEntrySLDistance             = DefaultMaxEntrySLDistance;
                              sets.MinEntrySLDistance             = DefaultMinEntrySLDistance;
                              sets.MaxPositionSize                = DefaultMaxPositionSize;
                              sets.StopLoss                       = 0;
                              sets.TakeProfit                     = 0;
                              sets.SubtractPendingOrders          = DefaultSubtractPOV;
                              sets.SubtractPositions              = DefaultSubtractOPV;
                              sets.DoNotApplyStopLoss             = DefaultDoNotApplyStopLoss;
                              sets.DoNotApplyTakeProfit           = DefaultDoNotApplyTakeProfit;
                              sets.AskForConfirmation             = DefaultAskForConfirmation;
                              sets.WasSelectedEntryLine           = false;
                              sets.WasSelectedStopLossLine        = false;
                              sets.WasSelectedTakeProfitLine      = false;
                              sets.IsPanelMinimized               = false;
                              sets.TPLockedOnSL                   = DefaultTPLockedOnSL;
                              if ((int)sets.ATRTimeframe == 0) sets.ATRTimeframe = (ENUM_TIMEFRAMES)_Period; //
                    }
                    if (!Create(0, PanelCaption, 0,  DefaultPanelPositionX, DefaultPanelPositionY)) return INIT_FAILED;
// Prevent problems with trading instruments containing more than one dot in their name.
// Also, bypasses a bug in Dialog.mqh with indicator name detection.
                    string symbol                                 = Symbol();
                    StringReplace(symbol, ".", "_dot_");
                    string filename                               = indicator_short_name + "_" + symbol + "_Ini" + IniFileExt();
                    IniFileNameSet_(filename);
// No ini file - move the panel according to the inputs.
                    if (!FileIsExist(filename)) Dont_Move_the_Panel_to_Default_Corner_X_Y = false;
                    IniFileLoad();
                    Run();
                    Initialization();
// Brings panel on top of other objects without actual maximization of the panel.
                    HideShowMaximize();
                    if (!Dont_Move_the_Panel_to_Default_Corner_X_Y)
                    {         int new_x = DefaultPanelPositionX, new_y =  DefaultPanelPositionY;
                              int chart_width = (int)ChartGetInteger(0, CHART_WIDTH_IN_PIXELS);
                              int chart_height = (int)ChartGetInteger(0, CHART_HEIGHT_IN_PIXELS);
                              int panel_width = Width();
                              int panel_height = Height();
                              // Invert coordinate if necessary.
                              if ( DefaultPanelPositionCorner == CORNER_LEFT_LOWER)
                              {         new_y = chart_height - panel_height - new_y; }
                              else if (DefaultPanelPositionCorner == CORNER_RIGHT_UPPER)
                              {         new_x = chart_width - panel_width - new_x; }
                              else if (DefaultPanelPositionCorner == CORNER_RIGHT_LOWER)
                              {         new_x = chart_width - panel_width - new_x;
                                        new_y = chart_height - panel_height - new_y; }
                              remember_left = new_x;
                              remember_top = new_y;
                              Move(new_x, new_y);
                              FixatePanelPosition(); // Remember the panel's new position for the INI file.
                    }
                    return INIT_SUCCEEDED; //
          }//
          return INIT_FAILED; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnDeinitX(const int reason = 10)
{
//==============================================================================================================================
          if(false)
          {         //if (reason == REASON_INITFAILED) return;// If we tried to add a second indicator, do not delete objects.
                    if(ObjectFind(ObjectPrefix + "StopLossLabel") >= 0)ObjectDelete(0, ObjectPrefix + "StopLossLabel");
                    if(ObjectFind(ObjectPrefix + "TakeProfitLabel") >= 0)ObjectDelete(0, ObjectPrefix + "TakeProfitLabel");
                    if(ObjectFind(ObjectPrefix + "TPAdditionalLabel") >= 0)ObjectDelete(0, ObjectPrefix + "TPAdditionalLabel");
                    if(ObjectFind(ObjectPrefix + "SLAdditionalLabel") >= 0)ObjectDelete(0, ObjectPrefix + "SLAdditionalLabel");
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         if(ObjectFind(ObjectPrefix + "TakeProfitLabel"   + IntegerToString(i)) >= 0) ObjectDelete(0, ObjectPrefix + "TakeProfitLabel" + IntegerToString(i));
                              if(ObjectFind(ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i)) >= 0) ObjectDelete(0, ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i)); //
                    }//
          }
          if(false)
          {         if (reason == REASON_REMOVE)
                    {         DeleteSet_tingsFile();
                              ObjectsDeleteAll(0, ObjectPrefix);
                              if (!FileDelete(IniFileName() + IniFileExt())) Print("Failed to delete PSC panel's .ini file: ", GetLastError()); //
                    }
                    else
                    {         // It is deinitialization due to input parameters change - save current parameters values (that are also changed via panel) to global variables.
                              if (reason == REASON_PARAMETERS) GlobalVariableSet("PSC-" + IntegerToString(ChartID()) + "-Parameters", 1);
                              SaveSet_tingsOnDisk();
                              // Set_ temporary global variable, so that the indicator knows it is reinitializing because of timeframe/parameters change and should not prevent attachment.
                              if ((reason == REASON_CHARTCHANGE) || (reason == REASON_PARAMETERS) || (reason == REASON_RECOMPILE)) GlobalVariableSet("PSC-" + IntegerToString(ChartID()) + "-Flag", 1); //
                    }//
          }//
          if(false) { Destroy(reason); } //CAppDialog //EventKillTimer(); //
//==============================================================================================================================
}

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int C_CalculatorPad::OnCalculateX(const int rates_total, const int prev_calculated, const datetime &time[], const double &open[], const double &high[],
                                  const double &low[], const double &close[], const long &tick_volume[], const long &volume[], const int &spread[])
{         //==============================================================================================================================
          if(IsPadPress_Calculator)
          {         RefreshValues();
                    return rates_total; //
          }//
          //==============================================================================================================================
          return rates_total; //
}
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnChartEvents(Sg_OnChartEvent &event)
{         if(IsPadPress_Calculator)
          {         if ((event.id == CHARTEVENT_CUSTOM + ON_DRAG_END) && (event.lparam == -1))// Remember the panel's location to have the same location for minimized and maximized states.
                    {         remember_top = Top();
                              remember_left = Left(); //
                    }
//==============================================================================================================================
                    if (ScriptTakePorfitsNumber > 1)// Catch multiple TP fields.
                    {         //==============================================================================================================================
                              if (event.id == CHARTEVENT_CUSTOM + ON_END_EDIT)
                              {         // Additional take-profit field #N on Main tab.
                                        if (StringSubstr(event.sparam, 0, StringLen(Name() + "CalculatorPad_OrderTP.AdditionalTPEdits")) == Name() + "CalculatorPad_OrderTP.AdditionalTPEdits")
                                        {         int i = (int)StringToInteger(StringSubstr(event.sparam, StringLen(Name() + "CalculatorPad_OrderTP.AdditionalTPEdits"))) - 1;
                                                  UpdateAdditionalTPEdit(i); //
                                        }
                                        // Script take-profit field #N on Script tab.
                                        else if (StringSubstr(event.sparam, 0, StringLen(Name() + "m_EdtScriptTPEdit")) == Name() + "m_EdtScriptTPEdit")
                                        {         int i = (int)StringToInteger(StringSubstr(event.sparam, StringLen(Name() + "m_EdtScriptTPEdit"))) - 1;
                                                  UpdateScriptTPEdit(i); //
                                        }
                                        // Script take-profit share field #N on Script tab.
                                        else if (StringSubstr(event.sparam, 0, StringLen(Name() + "m_EdtScriptTPShareEdit")) == Name() + "m_EdtScriptTPShareEdit")
                                        {         int i = (int)StringToInteger(StringSubstr(event.sparam, StringLen(Name() + "m_EdtScriptTPShareEdit"))) - 1;
                                                  UpdateScriptTPShareEdit(i); //
                                        } //
                              } //
                    }
                    if(false)
                    {         if (event.id != CHARTEVENT_CHART_CHANGE) OnEvent(event.id, event.lparam, event.dparam, event.sparam);//mean while chart not change...
                              // Call Panel's event handler only if it is not a CHARTEVENT_CHART_CHANGE - workaround for minimization bug on chart switch.
                    }
//==============================================================================================================================
// Recalculate on chart changes, clicks, and certain object dragging.
                    if ((event.id == CHARTEVENT_CLICK) || (event.id == CHARTEVENT_CHART_CHANGE) || ((event.id == CHARTEVENT_OBJECT_DRAG) && ((event.sparam == ObjectPrefix + "EntryLine") || (event.sparam == ObjectPrefix + "StopLossLine") || (StringFind(event.sparam, ObjectPrefix + "TakeProfitLine") != -1))))
                    {         // Moving lines when fixed SL/TP distance is enabled. Should set a new fixed SL/TP distance.
                              //==============================================================================================================================
                              if ((event.id == CHARTEVENT_OBJECT_DRAG) && ((UseFixedSLDistance) || (UseFixedTPDistance) || (ShowATROptions)))
                              {         if (event.sparam == ObjectPrefix + "StopLossLine") UpdateFixedSL();
                                        else if (event.sparam == ObjectPrefix + "TakeProfitLine") UpdateFixedTP();
                                        else if (StringFind(event.sparam, ObjectPrefix + "TakeProfitLine") != -1)
                                        {         int len = StringLen(ObjectPrefix + "TakeProfitLine");
                                                  int i = (int)StringToInteger(StringSubstr(event.sparam, len));
                                                  UpdateAdditionalFixedTP(i); //
                                        } //
                              }
                              //==============================================================================================================================
                              if (event.id != CHARTEVENT_CHART_CHANGE) RefreshValues();
                              static bool prev_chart_on_top = false;
                              // If this is an active chart, make sure the panel is visible (not behind the chart's borders). For inactive chart, this will work poorly, because inactive charts get minimized by MetaTrader.
                              if (ChartGetInteger(ChartID(), CHART_BRING_TO_TOP))
                              {         if (Top() < 0) Move(Left(), 0);
                                        int chart_height = (int)ChartGetInteger(0, CHART_HEIGHT_IN_PIXELS);
                                        if (Top() > chart_height) Move(Left(), chart_height - Height());
                                        int chart_width = (int)ChartGetInteger(0, CHART_WIDTH_IN_PIXELS);
                                        if (Left() > chart_width) Move(chart_width - Width(), Top());
                                        // If chart was brought on top, refresh values to move labels.
                                        if ((prev_chart_on_top == false) && (ShowLineLabels )) RefreshValues(); //
                              }
                              //==============================================================================================================================
                              // Remember if the chart is on top or is minimized.
                              prev_chart_on_top = ChartGetInteger(ChartID(), CHART_BRING_TO_TOP); } //
//==============================================================================================================================
          }//
}

//+------------------------------------------------------------------+
//| Trade event handler                                              |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnTradeX()
{         if(IsPadPress_Calculator)
          {         RefreshValues(); } //
}

//+------------------------------------------------------------------+
//| Timer event handler                                              |
//+------------------------------------------------------------------+
void C_CalculatorPad::OnTimerX()
{         if(IsPadPress_Calculator)
          {         CheckAndRestoreLines(); // Check if any lines should be restored.
                    if (GetTickCount() - LastRecalculationTime < 1000) return; // Do not recalculate on timer if less than 1 second passed.
                    RefreshValues(); } //
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Draws a label for a line with a geiven text.                     |
//+------------------------------------------------------------------+
void C_CalculatorPad::DrawLineLabel(const string label, const string text, const double price, const color col, bool above = false)
{
// Data not loaded yet.
          if (Bars <= 0) return;
          int x, y;
          long real_x;
          uint w, h;
          ObjectSetText(label, text, font_size, font_face, col);
          real_x = ChartGetInteger(0, CHART_WIDTH_IN_PIXELS) - 2;
// Needed only for y, x is derived from the chart width.
          ChartTimePriceToXY(0, 0, Time[0], price, x, y);
// Get the width of the text based on font and its size. Negative because OS-dependent, *10 because set in 1/10 of pt.
          TextSetFont(font_face, font_size * -10);
          TextGetSize(text, w, h);
          ObjectSetInteger(0, label, OBJPROP_XDISTANCE, real_x - w);
          if (above) y -= int(h + 1);
          ObjectSetInteger(0, label, OBJPROP_YDISTANCE, y); //
}

//+------------------------------------------------------------------+
//| Main recalculation function used on every tick and on entry/SL   |
//| line drag.                                                       |
//+------------------------------------------------------------------+
void C_CalculatorPad::RecalculatePositionSize()
{
// Update Entry to Ask/Bid if needed.
          ct_Series_Base.RefreshRate();
          CalculatorPad_OrderEntry.WarningEntry = "";
          CalculatorPad_OrderStopLoss.WarningSL    = "";
          CalculatorPad_OrderTP.WarningTP    = "";
          for (int i = 1; i < ScriptTakePorfitsNumber; i++) CalculatorPad_OrderTP.AdditionalWarningTP[i - 1] = "";
          if (sets.EntryType == Instant)
          {         if ((Ask > 0) && (Bid > 0))
                    {         if (sets.ShowLines)
                              {         double read_tStopLossLevel;
                                        if (!ObjectGetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, 0, read_tStopLossLevel)) return; // Line was deleted, waiting for automatic restoration.
                                        CalculatorPad_OrderStopLoss.tStopLossLevel = Utilities.Round(read_tStopLossLevel, _Digits);//
                              }
                              else
                                        CalculatorPad_OrderStopLoss.tStopLossLevel = sets.StopLossLevel;
                              // Long entry
                              if (CalculatorPad_OrderStopLoss.tStopLossLevel < Bid) CalculatorPad_OrderEntry.tEntryLevel = Ask;
                              // Short entry
                              else if (CalculatorPad_OrderStopLoss.tStopLossLevel > Ask) CalculatorPad_OrderEntry.tEntryLevel = Bid;
                              // Undefined entry
                              else
                              {         // Move CalculatorPad_OrderEntry.tEntryLevel to the nearest line.
                                        if ((CalculatorPad_OrderEntry.tEntryLevel - Bid) < (CalculatorPad_OrderEntry.tEntryLevel - Ask)) CalculatorPad_OrderEntry.tEntryLevel = Bid;
                                        else CalculatorPad_OrderEntry.tEntryLevel = Ask; //
                              }
                              ObjectSetDouble(0, ObjectPrefix + "EntryLine", OBJPROP_PRICE, 0, CalculatorPad_OrderEntry.tEntryLevel);//
                    } //
          }
          if (sets.EntryLevel - sets.StopLossLevel == 0) return;
// If could not find account currency, probably not connected.
          if ((AccountCurrency() == "") || (!TerminalInfoInteger(TERMINAL_CONNECTED))) return;
          if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE == -1) // Run only once.
          {         ct_Drive.Get_Symbol_Account_Market_Data(); }
          double read_tEntryLevel, read_tStopLossLevel, read_tTakeProfitLevel;
          if (!ObjectGetDouble(ChartID(), ObjectPrefix + "EntryLine", OBJPROP_PRICE, 0, read_tEntryLevel)) return; // Line was deleted, waiting for automatic restoration.
          CalculatorPad_OrderEntry.tEntryLevel = Utilities.Round(read_tEntryLevel, _Digits);
          if (!ObjectGetDouble(ChartID(), ObjectPrefix + "StopLossLine", OBJPROP_PRICE, 0, read_tStopLossLevel)) return;
          CalculatorPad_OrderStopLoss.tStopLossLevel = Utilities.Round(read_tStopLossLevel, _Digits);
          if (!ObjectGetDouble(ChartID(), ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE, 0, read_tTakeProfitLevel)) return;
          CalculatorPad_OrderTP.tTakeProfitLevel = Utilities.Round(read_tTakeProfitLevel, _Digits);
          StopLevel = MarketInfo(Symbol(), MODE_STOPLEVEL) * _Point;
          double AskBid = 0;
          if (sets.EntryType == Instant)
          {         if ((CalculatorPad_OrderStopLoss.tStopLossLevel < Ask) && (CalculatorPad_OrderStopLoss.tStopLossLevel > Bid)) CalculatorPad_OrderStopLoss.WarningSL = "(Wrong value!)";
                    else if (CalculatorPad_OrderStopLoss.tStopLossLevel < Ask) AskBid = Ask;
                    else if (CalculatorPad_OrderStopLoss.tStopLossLevel > Bid) AskBid = Bid;//
          }
          else if (sets.EntryType == Pending)
          {         if (CalculatorPad_OrderStopLoss.tStopLossLevel < CalculatorPad_OrderEntry.tEntryLevel)  AskBid = Ask;
                    else if (CalculatorPad_OrderStopLoss.tStopLossLevel > CalculatorPad_OrderEntry.tEntryLevel) AskBid = Bid;
                    if (AskBid) {if (MathAbs(AskBid - CalculatorPad_OrderEntry.tEntryLevel) < StopLevel) CalculatorPad_OrderEntry.WarningEntry = "(Too close!)"; }
                    else CalculatorPad_OrderStopLoss.WarningSL = "(Wrong value!)"; //
          }
          if ((CalculatorPad_OrderStopLoss.WarningSL == "") && (MathAbs(CalculatorPad_OrderStopLoss.tStopLossLevel - CalculatorPad_OrderEntry.tEntryLevel) < StopLevel)) CalculatorPad_OrderStopLoss.WarningSL = "(Too close!)";
          if (CalculatorPad_OrderTP.tTakeProfitLevel > 0)
          {         if (MathAbs(CalculatorPad_OrderTP.tTakeProfitLevel - CalculatorPad_OrderEntry.tEntryLevel) < StopLevel) CalculatorPad_OrderTP.WarningTP = "(Too close!)"; }
          for (int i = 1; i < ScriptTakePorfitsNumber; i++)
          {         double add_tTakeProfitLevel;
                    if (!ObjectGetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE, 0, add_tTakeProfitLevel)) return;
                    add_tTakeProfitLevel = Utilities.Round(add_tTakeProfitLevel, _Digits);
                    if (add_tTakeProfitLevel > 0)
                    {         if (MathAbs(add_tTakeProfitLevel - CalculatorPad_OrderEntry.tEntryLevel) < StopLevel) CalculatorPad_OrderTP.AdditionalWarningTP[i - 1] = "(Too close!)"; } //
          }
          ct_Drive.TDD.ct_Bank.ct_Positions.p_StopLoss = MathAbs(CalculatorPad_OrderEntry.tEntryLevel - CalculatorPad_OrderStopLoss.tStopLossLevel);
          if (ct_Drive.TDD.ct_Bank.ct_Positions.p_StopLoss == 0) {         Print("Stop-loss should be different from Entry."); return; }
          switch(sets.AccountButton)
          {         case Balance:
                              if (sets.CustomBalance > 0) ct_Drive.TDD.ct_Bank.ct_Positions.AccSize = sets.CustomBalance;
                              else ct_Drive.TDD.ct_Bank.ct_Positions.AccSize = AccountBalance();
                              break;
                    case Equity:
                              ct_Drive.TDD.ct_Bank.ct_Positions.AccSize = AccountEquity();
                              break;
                    case Balance_minus_Risk:
                              if (sets.CustomBalance > 0) ct_Drive.TDD.ct_Bank.ct_Positions.AccSize = sets.CustomBalance;
                              else ct_Drive.TDD.ct_Bank.ct_Positions.AccSize = AccountBalance();
                              if (PositionData_Portfolio.LossMoney != DBL_MAX) ct_Drive.TDD.ct_Bank.ct_Positions.AccSize = ct_Drive.TDD.ct_Bank.ct_Positions.AccSize - PositionData_Portfolio.LossMoney;
                              break; //
                    default: {} break; //
          }
          if (sets.CustomBalance <= 0) ct_Drive.TDD.ct_Bank.ct_Positions.AccSize += AdditionalFunds;
          CalculateRiskAndPositionSize();
          if (ShowLineLabels)
          {         DrawLineLabel(ObjectPrefix + "StopLossLabel", IntegerToString((int)MathRound((MathAbs(CalculatorPad_OrderStopLoss.tStopLossLevel - CalculatorPad_OrderEntry.tEntryLevel) / _Point))), CalculatorPad_OrderStopLoss.tStopLossLevel, sl_label_font_color);
                    if (sets.ShowLines) ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                    else ObjectSetInteger(ChartID(), ObjectPrefix + "StopLossLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                    if ((ShowAdditionalSLLabel) && (ct_Drive.TDD.ct_Bank.ct_Positions.AccSize != 0))
                    {         string label_text;
                              if (CalculatorPad_OrderStopLoss.WarningSL == "") label_text = Utilities.FormatDouble(DoubleToString(Utilities.Round(PositionData_RiskReward.OutputRiskMoney / ct_Drive.TDD.ct_Bank.ct_Positions.AccSize * 100, 2, RoundDown), 2)) + "% (" + Utilities.FormatDouble(DoubleToString(PositionData_RiskReward.OutputRiskMoney, 2)) + " " + ct_Drive.TDD.ct_Account._Mql_.Currency + ")";
                              else label_text = CalculatorPad_OrderStopLoss.WarningSL;
                              DrawLineLabel(ObjectPrefix + "SLAdditionalLabel", label_text, CalculatorPad_OrderStopLoss.tStopLossLevel, sl_label_font_color, true);
                              if (sets.ShowLines) ObjectSetInteger(ChartID(), ObjectPrefix + "SLAdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                              else ObjectSetInteger(ChartID(), ObjectPrefix + "SLAdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS); //
                    }
                    if (CalculatorPad_OrderTP.tTakeProfitLevel > 0)
                    {         DrawLineLabel(ObjectPrefix + "TakeProfitLabel", IntegerToString((int)MathRound((MathAbs(CalculatorPad_OrderTP.tTakeProfitLevel - CalculatorPad_OrderEntry.tEntryLevel) / _Point))), CalculatorPad_OrderTP.tTakeProfitLevel, tp_label_font_color);
                              if (sets.ShowLines) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                              else ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                              if ((ShowAdditionalTPLabel) && (ct_Drive.TDD.ct_Bank.ct_Positions.AccSize != 0))
                              {         string label_text;
                                        if ((CalculatorPad_OrderTP.WarningTP == "") && (PositionData_RiskReward.MainOutputRR != "Invalid TP"))
                                        {         label_text = Utilities.FormatDouble(DoubleToString(Utilities.Round(PositionData_RiskReward.MainOutputReward / ct_Drive.TDD.ct_Bank.ct_Positions.AccSize * 100, 2, RoundDown), 2)) + "% (" + Utilities.FormatDouble(DoubleToString(PositionData_RiskReward.MainOutputReward, 2)) + " " + ct_Drive.TDD.ct_Account._Mql_.Currency + ") " + PositionData_RiskReward.MainOutputRR + "R";
                                                  // When multiple TPs are used, append correct lot volume for each TP at the beginning of the additional TP label:
                                                  if (ScriptTakePorfitsNumber > 1) label_text = Utilities.FormatDouble(DoubleToString(PositionData.ArrayPositionSize[0], ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS), ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS) + " Lots " + label_text; }
                                        else
                                        {         label_text = CalculatorPad_OrderTP.WarningTP;
                                                  if (PositionData_RiskReward.MainOutputRR == "Invalid TP") label_text += PositionData_RiskReward.MainOutputRR; }
                                        DrawLineLabel(ObjectPrefix + "TPAdditionalLabel", label_text, CalculatorPad_OrderTP.tTakeProfitLevel, tp_label_font_color, true);
                                        if (sets.ShowLines) ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                        else ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel", OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);//
                              } //
                    }
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         double add_tTakeProfitLevel = Utilities.Round(ObjectGetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE), _Digits);
                              DrawLineLabel(ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), IntegerToString((int)MathRound((MathAbs(add_tTakeProfitLevel - CalculatorPad_OrderEntry.tEntryLevel) / _Point))), add_tTakeProfitLevel, tp_label_font_color);
                              if (sets.ShowLines) ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                              else ObjectSetInteger(ChartID(), ObjectPrefix + "TakeProfitLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS);
                              if ((ShowAdditionalTPLabel) && (ct_Drive.TDD.ct_Bank.ct_Positions.AccSize != 0))
                              {         string label_text;
                                        if ((CalculatorPad_OrderTP.AdditionalWarningTP[i - 1] == "") && (PositionData_RiskReward.AdditionalOutputRR[i - 1] != "Invalid TP"))
                                        {         label_text = Utilities.FormatDouble(DoubleToString(PositionData.ArrayPositionSize[i], ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS), ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS) + " Lots " + Utilities.FormatDouble(DoubleToString(Utilities.Round(PositionData_RiskReward.AdditionalOutputReward[i - 1] / ct_Drive.TDD.ct_Bank.ct_Positions.AccSize * 100, 2, RoundDown), 2)) + "% (" + Utilities.FormatDouble(DoubleToString(PositionData_RiskReward.AdditionalOutputReward[i - 1], 2)) + " " + ct_Drive.TDD.ct_Account._Mql_.Currency + ") " + PositionData_RiskReward.AdditionalOutputRR[i - 1] + "R"; }
                                        else
                                        {         label_text = CalculatorPad_OrderTP.AdditionalWarningTP[i - 1];
                                                  if (PositionData_RiskReward.AdditionalOutputRR[i - 1] == "Invalid TP") label_text += PositionData_RiskReward.AdditionalOutputRR[i - 1]; //
                                        }
                                        DrawLineLabel(ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i), label_text, add_tTakeProfitLevel, tp_label_font_color, true);
                                        if (sets.ShowLines) ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_ALL_PERIODS);
                                        else ObjectSetInteger(ChartID(), ObjectPrefix + "TPAdditionalLabel" + IntegerToString(i), OBJPROP_TIMEFRAMES, OBJ_NO_PERIODS); }//
                    } //
          }
          if ((sets.SelectedTab == MarginTab) && (!sets.IsPanelMinimized)) ct_Drive.TDD.ct_Market_Symbol.CalculateSymbolLeverage(ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_PROFITCALCMODE,  ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE,  ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSIZE, ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_PROFIT, ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_TRADE_TICK_VALUE,  ct_Drive.TDD.ct_Account._Mql_.ACCOUNT_CURRENCY_string, PositionData_Leverage);
          if ((sets.SelectedTab == SwapsTab) && (!sets.IsPanelMinimized)) ct_Drive.TDD.ct_Market_Symbol.GetSwapData(StSymbol.Current,  ct_Drive.TDD.ct_Account._Mql_.ACCOUNT_CURRENCY_string, ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_PROFIT,  ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE,  ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSIZE);//
}

//+------------------------------------------------------------------+
//| Calculates Risk size and position size. Set_s object values.      |
//+------------------------------------------------------------------+
void C_CalculatorPad::CalculateRiskAndPositionSize()
{
//+---------------------------------------------------------------------+
//|      Name & Task            :       Calculate Risk And PositionSize |
//|                                                                     |
//|      Dependency Class       :      ExtDialog & sets & Positions     |
//|      Dependency Class       :      Utilities & ct_Account & ..      |
//|      Dependency Class       :      PositionData_RiskReward          |
//|                                                                     |
//|      Input                  :       None                            |
//|                                                                     |
//|      OutPut                 :       None                            |
//|                                                                     |
//|      Input\OutPut           :       Param From database             |
//|                                                                     |
//|      Return                 :       void                            |
//|                                                                     |
//+---------------------------------------------------------------------+
          double UnitCost;
          double PositionSize = 0;
          PositionData_Symbol.UnitCost_reward = 0; // Used also in OnClickBtnTakeProfit().
          PositionData_RiskReward.DisplayRisk = sets.Risk;
          if (!sets.UseMoneyInsteadOfPercentage) {         PositionData_RiskReward.RiskMoney = Utilities.Round(ct_Drive.TDD.ct_Bank.ct_Positions.AccSize * sets.Risk / 100, 2, RoundDown); }
          else
          {         PositionData_RiskReward.RiskMoney = sets.MoneyRisk;
                    if (ct_Drive.TDD.ct_Bank.ct_Positions.AccSize != 0) PositionData_RiskReward.DisplayRisk = Utilities.Round(sets.MoneyRisk / ct_Drive.TDD.ct_Bank.ct_Positions.AccSize * 100, 2);
                    else PositionData_RiskReward.DisplayRisk = 0;//
          }
          // If Symbol is CFD or futures but with different profit currency.
          if ((PositionData_Swap.ProfitCalcMode == 1) || ((PositionData_Swap.ProfitCalcMode == 2) && (ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_PROFIT != ct_Drive.TDD.ct_Account._Mql_.Currency)))
          {         if (PositionData_Swap.ProfitCalcMode == 2) UnitCost = MarketInfo(Symbol(), MODE_TICKVALUE); // Futures, but will still have to be adjusted by CCC.
                    else UnitCost = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSIZE; // Apparently, it is more accurate than taking TICKVALUE directly in some cases.
                    PositionData_Symbol.UnitCost_reward = UnitCost;
                    // If profit currency is different from account currency.
                    if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_PROFIT != ct_Drive.TDD.ct_Account._Mql_.Currency)
                    {         double CCC = ct_Drive.TDD.ct_Market_Symbol.CalculateAdjustment(ct_Drive.TDD.ct_Account._Mql_.ACCOUNT_CURRENCY_string,  ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_PROFIT, Loss); ///
                              // Adjust the unit cost.
                              double pre_unitcost = UnitCost;
                              UnitCost *= CCC;
                              CCC = ct_Drive.TDD.ct_Market_Symbol.CalculateAdjustment(ct_Drive.TDD.ct_Account._Mql_.ACCOUNT_CURRENCY_string,  ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_PROFIT, Profit);
                              // Adjust the unit cost.
                              PositionData_Symbol.UnitCost_reward = pre_unitcost * CCC; //
                    }//
          }
          else
          {         UnitCost = MarketInfo(Symbol(), MODE_TICKVALUE); // Futures or Forex.
                    PositionData_Symbol.UnitCost_reward = UnitCost; //
          }
          // If account currency == pair's base currency, adjust UnitCost to future rate (SL). Works only for Forex pairs.
          if ((ct_Drive.TDD.ct_Account._Mql_.Currency == ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_BASE) && (PositionData_Swap.ProfitCalcMode == 0) && (CalculatorPad_OrderStopLoss.tStopLossLevel != 0))
          {         double future_rate = CalculatorPad_OrderStopLoss.tStopLossLevel;
                    double current_rate = 1;
                    ct_Series_Base.RefreshRate();
                    if (CalculatorPad_OrderStopLoss.tStopLossLevel < CalculatorPad_OrderEntry.tEntryLevel)
                    {         current_rate = Ask; }
                    else if (CalculatorPad_OrderStopLoss.tStopLossLevel > CalculatorPad_OrderEntry.tEntryLevel)
                    {         current_rate = Bid; }
                    UnitCost *= (current_rate / future_rate);//
          }
          if ((ct_Drive.TDD.ct_Bank.ct_Positions.p_StopLoss != 0) && (UnitCost != 0) && (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE != 0))
          {         if (sets.RiskFromPositionSize)
                    {         PositionData_RiskReward.RiskMoney = Utilities.Round(PositionData.OutputPositionSize * (ct_Drive.TDD.ct_Bank.ct_Positions.p_StopLoss * UnitCost / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE + 2 * sets.CommissionPerLot), 2);
                              sets.MoneyRisk = PositionData_RiskReward.RiskMoney;
                              if (ct_Drive.TDD.ct_Bank.ct_Positions.AccSize != 0) PositionData_RiskReward.DisplayRisk = Utilities.Round(sets.MoneyRisk / ct_Drive.TDD.ct_Bank.ct_Positions.AccSize * 100, 2);
                              else PositionData_RiskReward.DisplayRisk = 0;
                              PositionSize = PositionData.OutputPositionSize; //
                    }
                    else
                    {         PositionSize = Utilities.Round(PositionData_RiskReward.RiskMoney / (ct_Drive.TDD.ct_Bank.ct_Positions.p_StopLoss * UnitCost / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE + 2 * sets.CommissionPerLot), 2, RoundDown);
                              PositionData.OutputPositionSize = PositionSize; //
                    }//
          }
          if (!CalculateUnadjustedPositionSize) // If need to adjust to broker's restrictions.
          {         if (PositionSize < ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT) PositionData.OutputPositionSize = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT;
                    else if (PositionSize > ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT) PositionData.OutputPositionSize = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT;
                    double steps = 0;
                    if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP != 0) steps = PositionData.OutputPositionSize / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP;
                    if (MathAbs(MathRound(steps) - steps) < 0.00000001) steps = MathRound(steps);
                    if (MathFloor(steps) < steps) PositionData.OutputPositionSize = MathFloor(steps) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP; //
          }
          if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE == 0) return;
          PositionData_RiskReward.OutputRiskMoney = Utilities.Round((ct_Drive.TDD.ct_Bank.ct_Positions.p_StopLoss * UnitCost / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE + 2 * sets.CommissionPerLot) * PositionData.OutputPositionSize, 2);
          if ((ShowPipValue) || ((UseCommissionToSet_TPDistance) && (sets.CommissionPerLot != 0)))
          {         PositionData.OutputPipValue = Utilities.FormatDouble(DoubleToString(PositionData.OutputPositionSize * UnitCost * (_Point / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE), 2)); }
          if (ct_Drive.TDD.ct_Bank.ct_Positions.p_StopLoss == 0) return;
          // Calculate adjusted position size shares for use here and in RecalculatePositionSize().
          double AccumulatedPositionSize = 0; // Total PS used by additional TPs.
          // Calculate volume for each partial trade.
          // The goal is to use normal rounded down values for additional TPs and then throw the remainder to the main TP.
          if (ScriptTakePorfitsNumber > 1)
          {         for (int i = ScriptTakePorfitsNumber - 1; i >= 0; i--)
                    {         double position_size = ct_Drive.TDD.ct_Size.BrokerizePositionSize(PositionData.OutputPositionSize * (double)sets.ScriptTPShare[i] / 100.0);
                              // If this is one of the additional TPs, then count its PS towards total PS that will be open for additional TPs.
                              if (i > 0)
                              {         AccumulatedPositionSize += position_size; }
                              else // For the main TP, use the remaining part of the total PS.
                              {         position_size = PositionData.OutputPositionSize - AccumulatedPositionSize; //
                              }
                              PositionData.ArrayPositionSize[i] = position_size; //
                    }//
          }
          else PositionData.ArrayPositionSize[0] = PositionData.OutputPositionSize;
          if (CalculatorPad_OrderTP.tTakeProfitLevel > 0)
          {         // If account currency == pair's base currency, adjust UnitCost to future rate (TP). Works only for Forex pairs.
                    if ((ct_Drive.TDD.ct_Account._Mql_.Currency == ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_BASE) && (PositionData_Swap.ProfitCalcMode == 0))
                    {         double future_rate = CalculatorPad_OrderTP.tTakeProfitLevel;
                              double current_rate = 1;
                              ct_Series_Base.RefreshRate();  ;
                              if (CalculatorPad_OrderStopLoss.tStopLossLevel < CalculatorPad_OrderEntry.tEntryLevel)
                              {         current_rate = Ask; }
                              else if (CalculatorPad_OrderStopLoss.tStopLossLevel > CalculatorPad_OrderEntry.tEntryLevel)
                              {         current_rate = Bid; }
                              PositionData_Symbol.UnitCost_reward = PositionData_Symbol.UnitCost_reward * (current_rate / future_rate); //
                    }
                    double PS_Multiplier = 1; // Position size multiplier for multiple TPs. When single TP is used, it is equal 1.
                    if (ScriptTakePorfitsNumber > 1) PS_Multiplier = (double)sets.ScriptTPShare[0] / 100.0; // Use respective position size share.
                    PositionData_RiskReward.MainOutputReward = NormalizeDouble((MathAbs((CalculatorPad_OrderTP.tTakeProfitLevel - CalculatorPad_OrderEntry.tEntryLevel) * PositionData_Symbol.UnitCost_reward / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) - 2 * sets.CommissionPerLot) * PositionData.ArrayPositionSize[0], 2);
                    // For zero share, just ignore this level.
                    if  ((PS_Multiplier == 0) || (PositionData.ArrayPositionSize[0] == 0))
                    {         PositionData_RiskReward.InputRR = "";
                              PositionData_RiskReward.MainOutputRR = "";//
                    }
                    // Have valid take-profit level that is above entry for SL below entry, or below entry for SL above entry.
                    else if ((((CalculatorPad_OrderTP.tTakeProfitLevel > CalculatorPad_OrderEntry.tEntryLevel) && (CalculatorPad_OrderEntry.tEntryLevel > CalculatorPad_OrderStopLoss.tStopLossLevel)) || ((CalculatorPad_OrderTP.tTakeProfitLevel < CalculatorPad_OrderEntry.tEntryLevel) && (CalculatorPad_OrderEntry.tEntryLevel < CalculatorPad_OrderStopLoss.tStopLossLevel))) && (PositionData_RiskReward.OutputRiskMoney != 0))
                    {         PositionData_RiskReward.InputRR = DoubleToString(Utilities.Round(MathAbs((CalculatorPad_OrderTP.tTakeProfitLevel - CalculatorPad_OrderEntry.tEntryLevel) / ct_Drive.TDD.ct_Bank.ct_Positions.p_StopLoss), 2, RoundDown), 2);
                              PositionData_RiskReward.MainOutputRR = DoubleToString(Utilities.Round(PositionData_RiskReward.MainOutputReward / (PositionData_RiskReward.OutputRiskMoney / PositionData.OutputPositionSize * PositionData.ArrayPositionSize[0]), 2, RoundDown), 2); //
                    }
                    else
                    {         PositionData_RiskReward.InputRR = "Invalid TP";
                              PositionData_RiskReward.MainOutputRR = PositionData_RiskReward.InputRR; }
                    if (PositionData_RiskReward.MainOutputRR == PositionData_RiskReward.InputRR) PositionData_RiskReward.InputRR = ""; //
          }
          else PositionData_RiskReward.MainOutputReward = 0;
          // Multiple TPs.
          for (int i = 1; i < ScriptTakePorfitsNumber; i++)
          {         double add_tTakeProfitLevel = Utilities.Round(ObjectGetDouble(ChartID(), ObjectPrefix + "TakeProfitLine" + IntegerToString(i), OBJPROP_PRICE), _Digits);
                    if (add_tTakeProfitLevel > 0)
                    {         // If account currency == pair's base currency, adjust UnitCost to future rate (TP). Works only for Forex pairs.
                              if ((ct_Drive.TDD.ct_Account._Mql_.Currency == ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_BASE) && (PositionData_Swap.ProfitCalcMode == 0))
                              {         double future_rate = add_tTakeProfitLevel;
                                        double current_rate = 1;
                                        ct_Series_Base.RefreshRate();
                                        if (CalculatorPad_OrderStopLoss.tStopLossLevel < CalculatorPad_OrderEntry.tEntryLevel)
                                        {         current_rate = Ask; }
                                        else if (CalculatorPad_OrderStopLoss.tStopLossLevel > CalculatorPad_OrderEntry.tEntryLevel)
                                        {         current_rate = Bid; }
                                        PositionData_Symbol.UnitCost_reward = PositionData_Symbol.UnitCost_reward * (current_rate / future_rate);//
                              }
                              PositionData_RiskReward.AdditionalOutputReward[i - 1] = NormalizeDouble((MathAbs((add_tTakeProfitLevel - CalculatorPad_OrderEntry.tEntryLevel) * PositionData_Symbol.UnitCost_reward / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE) - 2 * sets.CommissionPerLot) * PositionData.ArrayPositionSize[i], 2);
                              // For zero share, just ignore this level.
                              if ((sets.ScriptTPShare[i] == 0) || (PositionData.ArrayPositionSize[i] == 0))
                              {         PositionData_RiskReward.AdditionalOutputRR[i - 1] = ""; }
                              // Have valid take-profit level that is above entry for SL below entry, or below entry for SL above entry.
                              else if ((((add_tTakeProfitLevel > CalculatorPad_OrderEntry.tEntryLevel) && (CalculatorPad_OrderEntry.tEntryLevel > CalculatorPad_OrderStopLoss.tStopLossLevel)) || ((add_tTakeProfitLevel < CalculatorPad_OrderEntry.tEntryLevel) && (CalculatorPad_OrderEntry.tEntryLevel < CalculatorPad_OrderStopLoss.tStopLossLevel))) && (PositionData_RiskReward.OutputRiskMoney != 0))
                              {         PositionData_RiskReward.AdditionalOutputRR[i - 1] = DoubleToString(Utilities.Round(PositionData_RiskReward.AdditionalOutputReward[i - 1] / (PositionData_RiskReward.OutputRiskMoney / PositionData.OutputPositionSize * PositionData.ArrayPositionSize[i]), 2, RoundDown), 2); }
                              else
                              {         PositionData_RiskReward.AdditionalOutputRR[i - 1] = "Invalid TP"; } //
                    }
                    else PositionData_RiskReward.AdditionalOutputRR[i - 1] = ""; //
          }
          double PS_Multiplier = 1; // Position size multiplier for multiple TPs. When single TP is used, it is equal 1.
          if (ScriptTakePorfitsNumber > 1) PS_Multiplier = (double)sets.ScriptTPShare[0] / 100.0; // Use respective position size share.
          PositionData_RiskReward.InputReward = DoubleToString(Utilities.Round(PositionData_RiskReward.RiskMoney * PS_Multiplier * MathAbs(CalculatorPad_OrderTP.tTakeProfitLevel - CalculatorPad_OrderEntry.tEntryLevel) / ct_Drive.TDD.ct_Bank.ct_Positions.p_StopLoss, 2, RoundDown), 2);
          // Panel's fields start the same as for the main TP.
          PositionData_RiskReward.OutputReward = PositionData_RiskReward.MainOutputReward;
          PositionData_RiskReward.OutputRR = PositionData_RiskReward.MainOutputRR;
          // In case of multiple TPs:
          if (ScriptTakePorfitsNumber > 1)
          {         double TotalOutputRisk = 0;
                    if (PositionData.OutputPositionSize != 0) TotalOutputRisk = (PositionData_RiskReward.OutputRiskMoney / PositionData.OutputPositionSize * PositionData.ArrayPositionSize[0]); // Main TP output Risk money. If main TP share is zero, start with zero.
                    double TotalInputRisk = (PositionData_RiskReward.RiskMoney * (double)sets.ScriptTPShare[0] / 100.0); // Main TP input Risk money.
                    // Calculate cumulative weighted reward and R/R.
                    for (int i = 1; i < ScriptTakePorfitsNumber; i++)
                    {         PositionData_RiskReward.OutputReward += PositionData_RiskReward.AdditionalOutputReward[i - 1];
                              if ((PositionData_RiskReward.AdditionalOutputRR[i - 1] == "Invalid TP") || (PositionData_RiskReward.MainOutputRR == "Invalid TP")) PositionData_RiskReward.OutputRR = "Invalid TP"; // At least one Invalid TP means that total RR is also invalid.
                              if ((PositionData.OutputPositionSize > 0) && (PositionData.ArrayPositionSize[i] > 0)) TotalOutputRisk += (PositionData_RiskReward.OutputRiskMoney / PositionData.OutputPositionSize * PositionData.ArrayPositionSize[i]);
                              TotalInputRisk += (PositionData_RiskReward.RiskMoney * (double)sets.ScriptTPShare[i] / 100.0);
                              PositionData_RiskReward.InputReward = DoubleToString(StringToDouble(PositionData_RiskReward.InputReward) +  Utilities.Round(PositionData_RiskReward.RiskMoney * (double)sets.ScriptTPShare[i] / 100.0 * MathAbs(sets.ScriptTP[i] - CalculatorPad_OrderEntry.tEntryLevel) / ct_Drive.TDD.ct_Bank.ct_Positions.p_StopLoss, 2, RoundDown), 2); }
                    if (PositionData_RiskReward.OutputRR != "Invalid TP")
                    {         if (TotalOutputRisk != 0) PositionData_RiskReward.OutputRR = DoubleToString(Utilities.Round(PositionData_RiskReward.OutputReward / TotalOutputRisk, 2, RoundDown), 2);
                              else PositionData_RiskReward.OutputRR = "";
                              if (TotalInputRisk != 0) PositionData_RiskReward.InputRR = DoubleToString(Utilities.Round(StringToDouble(PositionData_RiskReward.InputReward) / TotalInputRisk, 2, RoundDown), 2);
                              else PositionData_RiskReward.InputRR = ""; //
                    }
                    if (PositionData_RiskReward.OutputRR == PositionData_RiskReward.InputRR) PositionData_RiskReward.InputRR = ""; // No need to display Input R/R if it is the same as Output R/R.
                    PositionData_RiskReward.OutputRiskMoney = TotalOutputRisk;
                    PositionData_RiskReward.RiskMoney = TotalInputRisk; //
          }
          if ((sets.SelectedTab == RiskTab) && (!sets.IsPanelMinimized)) ct_Drive.TDD.ct_Market_Symbol.CalculatePortfolioRisk(StSymbol.Current, ct_Drive.TDD.ct_Account._Mql_.ACCOUNT_CURRENCY_string, ct_Drive.TDD.ct_Market_Symbol._Mql_.Symbol_CURRENCY_PROFIT);
          // Should be done even on Main tab to calculate Maximum Position Size and change Main tab's position size field's color.
          if (((sets.SelectedTab == MarginTab) || (sets.SelectedTab == MainTab)) && (!sets.IsPanelMinimized)) CalculateMargin();//
}

//+------------------------------------------------------------------+
//| Calculates margin before and after position.                     |
//+------------------------------------------------------------------+
void C_CalculatorPad::CalculateMargin()
{         int dir;
          if (CalculatorPad_OrderStopLoss.tStopLossLevel < CalculatorPad_OrderEntry.tEntryLevel) dir = OP_BUY;
          else if (CalculatorPad_OrderStopLoss.tStopLossLevel > CalculatorPad_OrderEntry.tEntryLevel) dir = OP_SELL;
          else return;
          double Margin1Lot = MarketInfo(Symbol(), MODE_MARGINREQUIRED);
          double PreMargin1Lot = Margin1Lot; // Remember Margin1Lot that was before we applied CustomLeverage.
          double ContractSize = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSIZE;
          if (PositionData_Leverage.Leverage_Custom > 0)// If custom leverage is given via panel's input.
          {         double symbol_cost_1_lot;
                    if (sets.EntryType == Pending)      symbol_cost_1_lot = SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_VALUE) * sets.EntryLevel / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE;
                    else                                symbol_cost_1_lot = SymbolInfoDouble(Symbol(), SYMBOL_TRADE_TICK_VALUE) * SymbolInfoDouble(Symbol(), SYMBOL_ASK) / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_TICKSIZE;
                    Margin1Lot = symbol_cost_1_lot / PositionData_Leverage.Leverage_Custom; //
          }
          double HedgedRatio = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MarginHedging / ContractSize;
          PositionData_Margin.PositionMargin = PositionData.OutputPositionSize * Margin1Lot;
          double MaxPositionSizeByMargin = -1;                  // Maximum position size allowed by current margin.
          double MaxPositionMargin = AccountFreeMargin();       // Maximum position margin tolerable before stop-out.
          if (ct_Drive.TDD.ct_Account._Mql_.StopOutMode == 0)// Percentage mode.
          {         // Slightly above account stop-out level.
                    double ML = ct_Drive.TDD.ct_Account._Mql_.StopOutLevel + 0.01;
                    if (ML > 0) MaxPositionMargin = 100 * AccountEquity() / ML - AccountMargin(); //
          }
          else   // Absolute value mode.
          {         // Slightly above account stop-out level.
                    MaxPositionMargin = ct_Drive.TDD.ct_Account._Mql_.StopOutLevel + 0.01; }
          if (AccountFreeMargin() - MaxPositionMargin < 0) MaxPositionMargin = AccountFreeMargin();
          PositionData_Margin.PreHedgingPositionMargin = PositionData_Margin.PositionMargin;// Needed in another function to calculate symbol leverage.
          if (PositionData_Leverage.Leverage_Custom > 0) {          PositionData_Margin.OriginalPreHedgingPositionMargin = PositionData_Margin.PreHedgingPositionMargin / Margin1Lot * PreMargin1Lot; }// Restore original PositionData_Margin.PreHedgingPositionMargin.
          if (NormalizeDouble(HedgedRatio, 2) < 1.00)// Hedging on partial or no margin.
          {         // Cycle through all open orders on this Symbol to find directional volume.
                    double volume = 0;
                    int type = -1;
                    int total = OrdersTotal();
                    for (int i = 0; i < total; i++)
                    {         if (!OrderSelect(i, SELECT_BY_POS)) continue;
                              if (OrderSymbol() != Symbol()) continue;
                              if (OrderType() == OP_BUY)
                              {         if (type == OP_BUY) volume += OrderLots();
                                        else if (type == OP_SELL)
                                        {         volume -= OrderLots();
                                                  if (volume < 0) {         type = OP_BUY; volume = -volume; } //
                                        }
                                        else if (type == -1) {         volume = OrderLots(); type = OP_BUY; } //
                              }
                              else if (OrderType() == OP_SELL)
                              {         if (type == OP_SELL) volume += OrderLots();
                                        else if (type == OP_BUY)
                                        {         volume -= OrderLots();
                                                  if (volume < 0) {         type = OP_SELL; volume = -volume; } //
                                        }
                                        else if (type == -1) {         volume = OrderLots(); type = OP_SELL; } //
                              } //
                    }
                    // There is position to hedge and new position is in opposite direction.
                    if ((volume > 0) && (type != dir))
                    {         double calculated_volume;
                              if (PositionData.OutputPositionSize <= volume) calculated_volume = PositionData.OutputPositionSize * (HedgedRatio - 1);
                              else calculated_volume = volume * HedgedRatio + PositionData.OutputPositionSize - 2 * volume;
                              PositionData_Margin.PositionMargin = calculated_volume * Margin1Lot;
                              // Calculations for maximum position size:
                              // 1. Find maximum position size for a given maximum position margin if the size is kept less than or equal to existing opposite volume.
                              for (MaxPositionSizeByMargin = 0; MaxPositionSizeByMargin <= volume; MaxPositionSizeByMargin += ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP)
                              {         if ((HedgedRatio - 1) * MaxPositionSizeByMargin * Margin1Lot > MaxPositionMargin)
                                        {         MaxPositionSizeByMargin -= ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP; break; } //
                              }
                              // 2. Find maximum position size for a given maximum position margin if the size is greater than existing opposite volume.
                              double MPS_gv = 0;
                              if (Margin1Lot != 0) MPS_gv = MaxPositionMargin / Margin1Lot - volume * (HedgedRatio - 2);
                              if (MPS_gv > MaxPositionSizeByMargin) MaxPositionSizeByMargin = MPS_gv;//
                    } //
          }
// Was not found using partial hedge method.
          if ((MaxPositionSizeByMargin == -1) && (Margin1Lot != 0)) MaxPositionSizeByMargin = MaxPositionMargin / Margin1Lot;
          MaxPositionSizeByMargin = Utilities.Round(MaxPositionSizeByMargin, ct_Drive.TDD.ct_Market_Symbol.Market_LOTSTEP_DIGITS, RoundDown);
          PositionData.OutputMaxPositionSize = MaxPositionSizeByMargin;
          if (!CalculateUnadjustedPositionSize) // If need to adjust to broker's restrictions.
          {         if (MaxPositionSizeByMargin < ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MINLOT) PositionData.OutputMaxPositionSize = 0; // Cannot open any position at all.
                    else if (MaxPositionSizeByMargin > ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT) PositionData.OutputMaxPositionSize = ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_MAXLOT;
                    double steps = 0;
                    if (ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP != 0) steps = PositionData.OutputMaxPositionSize / ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP;
                    if (MathAbs(MathRound(steps) - steps) < 0.00000001) steps = MathRound(steps);
                    if (MathFloor(steps) < steps) PositionData.OutputMaxPositionSize = MathFloor(steps) * ct_Drive.TDD.ct_Market_Symbol._Mql_.Market_LOTSTEP; //
          }
          PositionData_Margin.UsedMargin = AccountMargin() + PositionData_Margin.PositionMargin;
          PositionData_Symbol.IsStopOut = false;
          PositionData_Margin.FutureMargin = Utilities.Round(AccountFreeMargin() - PositionData_Margin.PositionMargin, 2, RoundDown);
// Percentage mode.
          if (ct_Drive.TDD.ct_Account._Mql_.StopOutMode == 0)
          {         double ML = 0;
                    if (PositionData_Margin.UsedMargin != 0) ML = AccountEquity() / PositionData_Margin.UsedMargin * 100;
                    if ((ML > 0) && (ML <= ct_Drive.TDD.ct_Account._Mql_.StopOutLevel)) PositionData_Symbol.IsStopOut = true;//
          }
// Absolute value mode.
          else {         if (PositionData_Margin.FutureMargin <= ct_Drive.TDD.ct_Account._Mql_.StopOutLevel) PositionData_Symbol.IsStopOut = true; }
          if (PositionData_Margin.FutureMargin < 0) PositionData_Symbol.IsStopOut = true;//
}
//+------------------------------------------------------------------+
//| Draws a label for a line with a geiven text.                     |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|             Class C_CalculatorPad::     BEGIN                    |OrderLevels
//+------------------------------------------------------------------+
