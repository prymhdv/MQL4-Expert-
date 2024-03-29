//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_OnChartEvent_base.mqh          ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
struct Sgpd_AutoCharterPanel
{         //----------------------------------------------------------
          Cg_TextsButton    BTN_AutoCharter,
                            BTN_StdDevChannelX,
                            BTN_ChannelX,
                            BTN_PitchforkX,
                            BTN_RegressionX,
                            BTN_HLineX,
                            BTN_VLineX,
                            BTN_TrendX,
                            BTN_TrendAngleX,
                            //----------------------------------------------------------
                            BTN_TextX,
                            BTN_CycleX,
                            BTN_EditX,
                            BTN_RectLabelX,
                            //----------------------------------------------------------
                            BTN_FiboX,
                            BTN_FiboTimesX,
                            BTN_FiboFanX,
                            BTN_FiboExpansionX,
                            BTN_FiboChannelX,
                            BTN_FiboArcX;
          //----------------------------------------------------------
          Cg_TextsLabel       LBL_Pad_AutoCharter_PoinExit,
                              LBL_Pad_AutoCharter_PointClear,
                              LBL_Pad_AutoCharter_PointMove;
          //----------------------------------------------------------
          Cg_TextsRectLabel   RLBL_Pad_AutoCharter;
          //----------------------------------------------------------
};//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sgpdg_AutoCharterPanel
{         //----------------------------------------------------------
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON, CChartObjectButton, Cg_TextsButton>
          BTN_AutoCharter,
          BTN_StdDevChannelX, BTN_ChannelX, BTN_PitchforkX, BTN_RegressionX, BTN_HLineX, BTN_VLineX, BTN_TrendX, BTN_TrendAngleX,
          BTN_TextX, BTN_CycleX, BTN_EditX,
          BTN_RectLabelX,
          BTN_FiboX,
          BTN_FiboTimesX,
          BTN_FiboFanX,
          BTN_FiboExpansionX,
          BTN_FiboChannelX,
          BTN_FiboArcX;
          //----------------------------------------------------------
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_LABEL, CChartObjectLabel, Cg_TextsLabel>
          LBL_Pad_AutoCharter_PoinExit,
          LBL_Pad_AutoCharter_PointClear,
          LBL_Pad_AutoCharter_PointMove;
          //----------------------------------------------------------
          Cg_GenericChartObj_API_MYs_MQLo_MYi<S_RECTANGLE_LABEL, CChartObjectRectLabel, Cg_TextsRectLabel>
          RLBL_Pad_AutoCharter;
          //----------------------------------------------------------
};//
//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_OnChartEvent_base.mqh          ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
