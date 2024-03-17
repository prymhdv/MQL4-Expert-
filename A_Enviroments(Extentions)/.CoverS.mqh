//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                             Copyright © 2012-2021, EarnForex.com |
//|                                     Based on panel by qubbit.com |
//|                                       https://www.earnforex.com/ |
//+------------------------------------------------------------------+
////+----------------------------------------------------------------+
////|       Module ~~ Some ~~ Solo        BEGIN-END                  |
////+----------------------------------------------------------------+ >>used Chart
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Extentions)\wZigzag.mqh>           C_ZIGZAG        Zigo;           ///>>OKEY 16 >>>>by ordering calll class.
/*                                                                                         */C_ZIGZAGX       ZIGZAGX;        //==>>used Chart
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Extentions)\uAutoRSI.mqh>                                          ///>>OKEY 17 >>>>by ordering calll class.
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Extentions)\sExport.mqh>                                           ///>>OKEY 18 >>>>by ordering calll class.
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Extentions)\uParwaz.mqh>                                           ///>>OKEY 20 >>>>by ordering calll class.
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Extentions)\oPivotLines.mqh>       C_PivotLines    PivotLines;//   ///>>OKEY 21 >>>>by ordering calll class.
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Extentions)\tTradingFatherUpdated.mqh>                             ///>>OKEY 22 >>>>by ordering calll class.
//+------------------------------------------------------------------+
//|               Extention some code trade                          |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Script execution function.                                       |
//+------------------------------------------------------------------+
/*
This script works with Position Size Calculator indicator:
https://www.earnforex.com/metatrader-indicators/Position-Size-Calculator/
It works both with the new version (graphical panel) and legacy version (text labels).
It can open pending or instant orders using the position size calculated by PSC.
Works with Market Execution (ECN) too - first opens the order, then sets SL/TP.
You can control script settings via Position Size Calculator panel (Script tab).
*/
bool    DisableTradingWhenLinesAreHidden, DoNotApplyStopLoss, DoNotApplyTakeProfit, AskForConfirmation;
int     MaxSlippage = 0, MaxSpread, MaxEntrySLDistance, MinEntrySLDistance, MagicNumber = 0;
double  MaxPositionSize;
string  Commentary = "PSC-Trader";
//---------------------------------------
void OnStart__()//trading  block run
{         string ps = ""; // Position size string.
          double el = 0, sl = 0, tp = 0; // Entry level, stop-loss, and take-profit.
          int ot; // ct_Order type.
          ENUM_ENTRY_TYPE entry_type;
//====================================================================
          if (!TerminalInfoInteger(TERMINAL_TRADE_ALLOWED)) {         Alert("AutoTrading disabled! Please enable AutoTrading."); return; }
          // WindowFind() is very poor at finding indicators by their short name in MT4. Using ChartIndicatorName comparison instead.
//====================================================================
          bool psc_found = false;
          int chart_indicators_total = ChartIndicatorsTotal(0, 0);
          for (int i = 0; i < chart_indicators_total; i++)
          {         if (ChartIndicatorName(0, 0, i) == "Position Size Calculator" + IntegerToString(ChartID()))
                    {         psc_found = true; break; } //
          }
          if (!psc_found)
          {         Alert("Position Size Calculator not found!"); return; }
//====================================================================
          // Trying to find the position size object.
          ps = Dev_Object.FindObjectByPostfix("m_EdtPosSize", OBJ_EDIT);
          ps = ObjectGetString(0, ps, OBJPROP_TEXT);
          if (StringLen(ps) == 0) {         Alert("Position Size object not found!"); return; }
//====================================================================
          // Replace thousand separaptors.
          StringReplace(ps, ",", "");
          double PositionSize = StringToDouble(ps);
          int ps_decimals = Utilities.CountDecimalPlaces(PositionSize);
          Print("Detected position size: ", DoubleToString(PositionSize, ps_decimals), ".");
          double MinLot = MarketInfo(Symbol(), MODE_MINLOT);
          double MaxLot = MarketInfo(Symbol(), MODE_MAXLOT);
          double LotStep = MarketInfo(Symbol(), MODE_LOTSTEP);
          if (PositionSize <= 0) {         Print("Wrong position size value!"); return; }
//====================================================================
          string ObjectPrefix = ""; // To be found.
          string el_name = Dev_Object.FindObjectByPostfix("EntryLine", OBJ_HLINE);
          int el_name_starts_at = StringFind(el_name, "EntryLine");
          if (el_name_starts_at > 0) ObjectPrefix = StringSubstr(el_name, 0, el_name_starts_at);
          el = ObjectGetDouble(0, ObjectPrefix + "EntryLine", OBJPROP_PRICE);
          if (el <= 0) {         Alert("Entry Line not found!"); return; }
//====================================================================
          el = NormalizeDouble(el, Digits);
          Print("Detected entry level: ", DoubleToString(el, Digits), ".");
          if ((el == Ask) || (el == Bid)) entry_type = Instant;
          else entry_type = Pending;
          Print("Detected entry type: ", EnumToString(entry_type), ".");
          sl = ObjectGetDouble(0, ObjectPrefix + "StopLossLine", OBJPROP_PRICE);
//====================================================================
          if (sl <= 0)
          {         Alert("Stop-Loss Line not found!");
                    return; }
          sl = NormalizeDouble(sl, Digits);
          Print("Detected stop-loss level: ", DoubleToString(sl, Digits), ".");
          tp = ObjectGetDouble(0, ObjectPrefix + "TakeProfitLine", OBJPROP_PRICE);
//====================================================================
          if (tp > 0)
          {         tp = NormalizeDouble(tp, Digits);
                    Print("Detected take-profit level: ", DoubleToString(tp, Digits), "."); }
          else Print("No take-profit detected.");
          // Try reading multiple TP levels.
          int n = 0;
          double ScriptTPValue[];
          int ScriptTPShareValue[];
          double volume_share_sum = 0;
//====================================================================
          while (true)
          {         ArrayResize(ScriptTPValue, n + 1);
                    ArrayResize(ScriptTPShareValue, n + 1);
                    ScriptTPValue[n] = 0;
                    string ScriptTPObjectName = Dev_Object.FindObjectByPostfix("m_EdtScriptTPEdit" + IntegerToString(n + 1), OBJ_EDIT);
                    if (ScriptTPObjectName != "") ScriptTPValue[n] = NormalizeDouble(StringToDouble(ObjectGetString(0, ScriptTPObjectName, OBJPROP_TEXT)), _Digits);
                    else break;
                    Print("Detected Multiple TP #", n + 1, " = ", ScriptTPValue[n]);
                    ScriptTPShareValue[n] = 0;
                    string ScriptTPShareObjectName = Dev_Object.FindObjectByPostfix("m_EdtScriptTPShareEdit" + IntegerToString(n + 1), OBJ_EDIT);
                    if (ScriptTPShareObjectName != "") ScriptTPShareValue[n] = (int)StringToInteger(ObjectGetString(0, ScriptTPShareObjectName, OBJPROP_TEXT));
                    else break;
                    Print("Detected Multiple TP Share #", n + 1, " = ", ScriptTPShareValue[n]);
                    volume_share_sum += ScriptTPShareValue[n];
                    n++; //
          }
          if (n > 0)
          {         Print("Multiple TP volume share sum = ", volume_share_sum, ".");
                    if ((volume_share_sum < 99) || (volume_share_sum > 100))
                    {         Print("Incorrect volume sum for multiple TPs - not taking any trades.");
                              return; }//
          }
          else
          {         // No multiple TPs, use single TP for 100% of volume.
                    n = 1;
                    ScriptTPValue[0] = tp;
                    ScriptTPShareValue[0] = 100; //
          }
//====================================================================
          // Magic number
          string EdtMagicNumber = Dev_Object.FindObjectByPostfix("m_EdtMagicNumber", OBJ_EDIT);
          if (EdtMagicNumber != "") MagicNumber = (int)StringToInteger(ObjectGetString(0, EdtMagicNumber, OBJPROP_TEXT));
          Print("Magic number = ", MagicNumber);
          // ct_Order commentary
          string EdtScriptCommentary = Dev_Object.FindObjectByPostfix("m_EdtScriptCommentary", OBJ_EDIT);
          if (EdtScriptCommentary != "") Commentary = ObjectGetString(0, EdtScriptCommentary, OBJPROP_TEXT);
          Print("ct_Order commentary = ", Commentary);
          // Checkbox for disabling trading when hidden lines
          string ChkDisableTradingWhenLinesAreHidden = Dev_Object.FindObjectByPostfix("m_ChkDisableTradingWhenLinesAreHiddenButton", OBJ_BITMAP_LABEL);
          if (ChkDisableTradingWhenLinesAreHidden != "") DisableTradingWhenLinesAreHidden = ObjectGetInteger(0, ChkDisableTradingWhenLinesAreHidden, OBJPROP_STATE);
          Print("Disable trading when lines are hidden = ", DisableTradingWhenLinesAreHidden);
          // Entry line
          bool EntryLineHidden = false;
          int EL_Hidden = (int)ObjectGetInteger(0, ObjectPrefix + "EntryLine", OBJPROP_TIMEFRAMES);
          if (EL_Hidden == OBJ_NO_PERIODS) EntryLineHidden = true;
          Print("Entry line hidden = ", EntryLineHidden);
          if ((DisableTradingWhenLinesAreHidden) && (EntryLineHidden))
          {         Print("Not taking a trade - lines are hidden, and indicator says not to trade when they are hidden."); return; }
//====================================================================
          // Other fuses
          string EdtMaxSlippage = Dev_Object.FindObjectByPostfix("m_EdtMaxSlippage", OBJ_EDIT);
          if (EdtMaxSlippage != "") MaxSlippage = (int)StringToInteger(ObjectGetString(0, EdtMaxSlippage, OBJPROP_TEXT));
          Print("Max slippage = ", MaxSlippage);
          string EdtMaxSpread = Dev_Object.FindObjectByPostfix("m_EdtMaxSpread", OBJ_EDIT);
          if (EdtMaxSpread != "") MaxSpread = (int)StringToInteger(ObjectGetString(0, EdtMaxSpread, OBJPROP_TEXT));
          Print("Max spread = ", MaxSpread);
          if (MaxSpread > 0)
          {         int spread = (int)((Ask - Bid) / Point);
                    if (spread > MaxSpread)
                    {         Print("Not taking a trade - current spread (", spread, ") > maximum spread (", MaxSpread, ").");
                              return; } //
          }
//====================================================================
          string EdtMaxEntrySLDistance = Dev_Object.FindObjectByPostfix("m_EdtMaxEntrySLDistance", OBJ_EDIT);
          if (EdtMaxEntrySLDistance != "") MaxEntrySLDistance = (int)StringToInteger(ObjectGetString(0, EdtMaxEntrySLDistance, OBJPROP_TEXT));
          Print("Max Entry/SL distance = ", MaxEntrySLDistance);
          if (MaxEntrySLDistance > 0)
          {         int CurrentEntrySLDistance = (int)(MathAbs(sl - el) / Point);
                    if (CurrentEntrySLDistance > MaxEntrySLDistance)
                    {         Print("Not taking a trade - current Entry/SL distance (", CurrentEntrySLDistance, ") > maximum Entry/SL distance (", MaxEntrySLDistance, ").");
                              return; }//
          }
//====================================================================
          string EdtMinEntrySLDistance = Dev_Object.FindObjectByPostfix("m_EdtMinEntrySLDistance", OBJ_EDIT);
          if (EdtMinEntrySLDistance != "") MinEntrySLDistance = (int)StringToInteger(ObjectGetString(0, EdtMinEntrySLDistance, OBJPROP_TEXT));
          Print("Min Entry/SL distance = ", MinEntrySLDistance);
          if (MinEntrySLDistance > 0)
          {         int CurrentEntrySLDistance = (int)(MathAbs(sl - el) / Point);
                    if (CurrentEntrySLDistance < MinEntrySLDistance)
                    {         Print("Not taking a trade - current Entry/SL distance (", CurrentEntrySLDistance, ") < minimum Entry/SL distance (", MinEntrySLDistance, ").");
                              return; } //
          }
//====================================================================
          string EdtMaxPositionSize = Dev_Object.FindObjectByPostfix("m_EdtMaxPositionSize", OBJ_EDIT);
          if (EdtMaxPositionSize != "") MaxPositionSize = StringToDouble(ObjectGetString(0, EdtMaxPositionSize, OBJPROP_TEXT));
          Print("Max position size = ", DoubleToString(MaxPositionSize, ps_decimals));
          // Checkbox for subtracting open positions volume from the position size.
          string ChkSubtractPositions = Dev_Object.FindObjectByPostfix("m_ChkSubtractPositionsButton", OBJ_BITMAP_LABEL);
          if (ChkSubtractPositions != "") PositionData.SubtractPositions = ObjectGetInteger(0, ChkSubtractPositions, OBJPROP_STATE);
          Print("Subtract open positions volume = ", PositionData.SubtractPositions);
          // Checkbox for subtracting pending orders volume from the position size.
          string ChkSubtractPendingOrders = Dev_Object.FindObjectByPostfix("m_ChkSubtractPendingOrdersButton", OBJ_BITMAP_LABEL);
          if (ChkSubtractPendingOrders != "") PositionData.SubtractPendingOrders = ObjectGetInteger(0, ChkSubtractPendingOrders, OBJPROP_STATE);
          Print("Subtract pending orders volume = ", PositionData.SubtractPendingOrders);
          // Checkbox for not applying stop-loss to the position.
          string ChkDoNotApplyStopLoss = Dev_Object.FindObjectByPostfix("m_ChkDoNotApplyStopLossButton", OBJ_BITMAP_LABEL);
          if (ChkDoNotApplyStopLoss != "") DoNotApplyStopLoss = ObjectGetInteger(0, ChkDoNotApplyStopLoss, OBJPROP_STATE);
          Print("Do not apply stop-loss = ", DoNotApplyStopLoss);
          // Checkbox for not applying take-profit to the position.
          string ChkDoNotApplyTakeProfit = Dev_Object.FindObjectByPostfix("m_ChkDoNotApplyTakeProfitButton", OBJ_BITMAP_LABEL);
          if (ChkDoNotApplyTakeProfit != "") DoNotApplyTakeProfit = ObjectGetInteger(0, ChkDoNotApplyTakeProfit, OBJPROP_STATE);
          Print("Do not apply take-profit = ", DoNotApplyTakeProfit);
          // Checkbox for asking for confirmation.
          string ChkAskForConfirmation = Dev_Object.FindObjectByPostfix("m_ChkAskForConfirmationButton", OBJ_BITMAP_LABEL);
          if (ChkAskForConfirmation != "") AskForConfirmation = ObjectGetInteger(0, ChkAskForConfirmation, OBJPROP_STATE);
          Print("Ask for confirmation = ", AskForConfirmation);
//====================================================================
          ENUM_SYMBOL_TRADE_EXECUTION Execution_Mode = (ENUM_SYMBOL_TRADE_EXECUTION)SymbolInfoInteger(Symbol(), SYMBOL_TRADE_EXEMODE);
          Print("Execution mode: ", EnumToString(Execution_Mode));
          if (entry_type == Pending)
          {         // Sell
                    if (sl > el)
                    {         // Stop
                              if (el < Bid) ot = OP_SELLSTOP;
                              // Limit
                              else ot = OP_SELLLIMIT; }
                    // Buy
                    else
                    {         // Stop
                              if (el > Ask) ot = OP_BUYSTOP;
                              // Limit
                              else ot = OP_BUYLIMIT; }//
          }
          // Instant
          else
          {         // Sell
                    if (sl > el) ot = OP_SELL;
                    // Buy
                    else ot = OP_BUY; //
          }
//====================================================================
          if ((PositionData.SubtractPendingOrders) || (PositionData.SubtractPositions))
          {         double existing_volume_buy = 0, existing_volume_sell = 0;
                     ct_Drive.TDD.ct_Bank.CalculateOpenVolume(existing_volume_buy, existing_volume_sell);
                    Print("Found existing buy volume = ", DoubleToString(existing_volume_buy, ps_decimals));
                    Print("Found existing sell volume = ", DoubleToString(existing_volume_sell, ps_decimals));
                    if ((ot == OP_BUY) || (ot == OP_BUYLIMIT) || (ot == OP_BUYSTOP)) PositionSize -= existing_volume_buy;
                    else PositionSize -= existing_volume_sell;
                    Print("Adjusted position size = ", DoubleToString(PositionSize, ps_decimals));
                    if (PositionSize < 0)
                    {         Print("Adjusted position size is less than zero. Not executing any trade.");
                              return; } //
          }
//====================================================================
          if (MaxPositionSize > 0)
          {         if (PositionSize > MaxPositionSize)
                    {         Print("Position size (", DoubleToString(PositionSize, ps_decimals), ") > maximum position size (", DoubleToString(MaxPositionSize, ps_decimals), "). Setting position size to ", DoubleToString(MaxPositionSize, ps_decimals), ".");
                              PositionSize = MaxPositionSize; } //
          }
//====================================================================
          if (AskForConfirmation)
          {         // Evoke confirmation modal window.
                    string caption = "Execute the trade?";
                    string message;
                    string order_type_text = "";
                    string currency = AccountInfoString(ACCOUNT_CURRENCY);
                    switch(ot)
                    {         case OP_BUY:
                                        order_type_text = "Buy";
                                        break;
                              case OP_BUYSTOP:
                                        order_type_text = "Buy Stop";
                                        break;
                              case OP_BUYLIMIT:
                                        order_type_text = "Buy Limit";
                                        break;
                              case OP_SELL:
                                        order_type_text = "Sell";
                                        break;
                              case OP_SELLSTOP:
                                        order_type_text = "Sell Stop";
                                        break;
                              case OP_SELLLIMIT:
                                        order_type_text = "Sell Limit";
                                        break;
                              default:
                                        break; //
                    }
                    message = "ct_Order: " + order_type_text + "\n";
                    message += "Size: " + DoubleToString(PositionSize, ps_decimals);
                    if (n > 1) message += " (multiple)";
                    message += "\n";
                    // Find Account Size button and edit.
                    string account_button = Dev_Object.FindObjectByPostfix("m_BtnAccount", OBJ_BUTTON);
                    account_button = ObjectGetString(0, account_button, OBJPROP_TEXT);
                    message += account_button;
                    string account_value = Dev_Object.FindObjectByPostfix("m_EdtAccount", OBJ_EDIT);
                    account_value = ObjectGetString(0, account_value, OBJPROP_TEXT);
                    message += ": " + account_value + " " + currency + "\n";
                    string risk = Dev_Object.FindObjectByPostfix("m_EdtRiskMRes", OBJ_EDIT);
                    risk = ObjectGetString(0, risk, OBJPROP_TEXT);
                    message += "Risk: " + risk + " " + currency + "\n";
                    message += "Entry: " + DoubleToString(el, _Digits) + "\n";
                    if (!DoNotApplyStopLoss) message += "Stop-loss: " + DoubleToString(sl, _Digits) + "\n";
                    if ((tp > 0) && (!DoNotApplyTakeProfit)) message += "Take-profit: " + DoubleToString(tp, _Digits);
                    if (n > 1) message += " (multiple)";
                    message += "\n";
                    int ret = MessageBox(message, caption, MB_OKCANCEL | MB_ICONWARNING);
                    if (ret == IDCANCEL)
                    {         Print("Trade canceled.");
                              return; //
                    }//
          }
//====================================================================
          double AccumulatedPositionSize = 0; // Total PS used by additional TPs.
          double ArrayPositionSize[]; // PS for each trade.
          ArrayResize(ArrayPositionSize, n);
          // Cycle to calculate volume for each partial trade.
          // The goal is to use normal rounded down values for additional TPs and then throw the remainder to the main TP.
          for (int j = n - 1; j >= 0; j--)
          {         double position_size = PositionSize * ScriptTPShareValue[j] / 100.0;
                    if (position_size < MinLot)         {         Print("Position size ", position_size, " < broker's minimum position size. Not executing the trade."); continue; }
                    else if (position_size > MaxLot)    {         Print("Position size ", position_size, " > broker's maximum position size. Reducing it."); position_size = MaxLot; }
                    double steps = 0;
                    if (LotStep != 0) steps = position_size / LotStep;
                    if (MathAbs(MathRound(steps) - steps) < 0.00000001) steps = MathRound(steps);
                    if (MathFloor(steps) < steps)
                    {         position_size = MathFloor(steps) * LotStep;
                              Print("Adjusting position size to the broker's Lot Step parameter."); }
                    // If this is one of the additional TPs, then count its PS towards total PS that will be open for additional TPs.
                    if (j > 0) {         AccumulatedPositionSize += position_size; }
                    else // For the main TP, use the remaining part of the total PS.
                    {         position_size = PositionSize - AccumulatedPositionSize; }
                    ArrayPositionSize[j] = position_size;//
          }
//====================================================================
          bool isOrderPlacementFailing = false;  // Track if any of the order-operations fail.
          int LotStep_digits = Utilities.CountDecimalPlaces(LotStep); // Required for proper volume normalization.
          // Going through a cycle to execute multiple TP trades.
          for (int j = 0; j < n; j++)
          {         double order_sl = sl;
                    double order_tp = NormalizeDouble(ScriptTPValue[j], _Digits);
                    double position_size = NormalizeDouble(ArrayPositionSize[j], LotStep_digits);
                    // Market execution mode - preparation.
                    if ((Execution_Mode == SYMBOL_TRADE_EXECUTION_MARKET) && (entry_type == Instant))
                    {         // No SL/TP allowed on instant orders.
                              order_sl = 0;
                              order_tp = 0; }
                    if (DoNotApplyStopLoss)
                    {         sl = 0;
                              order_sl = 0; }
                    if (DoNotApplyTakeProfit)
                    {         tp = 0;
                              order_tp = 0; }
                    int ticket = OrderSend(Symbol(), ot, position_size, el, MaxSlippage, order_sl, order_tp, Commentary, MagicNumber);
                    if (ticket == -1)
                    {         int error = GetLastError();
                              Print("Execution failed. Error: ", IntegerToString(error), " - ", ErrorDescription(error), ".");
                              isOrderPlacementFailing = true; }
                    else
                    {         if (n == 1) Print("ct_Order executed. ct_Ticket: ", ticket, ".");
                              else Print("ct_Order #", j, " executed. ct_Ticket: ", ticket, "."); }
                    if (!DoNotApplyTakeProfit) tp = ScriptTPValue[j];
                    // Market execution mode - applying SL/TP.
                    if ((Execution_Mode == SYMBOL_TRADE_EXECUTION_MARKET) && (entry_type == Instant) && (ticket != -1) && ((sl != 0) || (tp != 0)))
                    {         if (!OrderSelect(ticket, SELECT_BY_TICKET))
                              {         Print("Failed to find the order to apply SL/TP.");
                                        isOrderPlacementFailing = true;
                                        break; }
                              for (int i = 0; i < 10; i++)
                              {         bool result = OrderModify(ticket, OrderOpenPrice(), sl, tp, OrderExpiration());
                                        if (result)
                                        {         break; }
                                        else
                                        {         Print("Error modifying the order: ", GetLastError());
                                                  isOrderPlacementFailing = true; } //
                              }//
                    } //
          }
//====================================================================
          if (n > 0) PlaySound(isOrderPlacementFailing ? "timeout.wav" : "ok.wav");//
//====================================================================
}//
//+------------------------------------------------------------------+
//|       Module ~~ Some ~~ Solo          BEGIN-END                  |
//+------------------------------------------------------------------+
