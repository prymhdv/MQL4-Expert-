//+------------------------------------------------------------------+
//||   ||||||||||                 Sgpd_FlowPanel.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
struct Sgpd_FlowPanel
{
//==================================================
private:

//==================================================
public:
          void          Sgpd_FlowPanel() {};
          void          ~Sgpd_FlowPanel() {}; //

          //--States    Elements
          bool          IsMove_AutoCharter;// = false;
          bool          IsBTN_CommentPannel;// = false;
          //--States    Elements ItSelf
          bool          IsLBL_;
          bool          IsLBL_D2;  //--Key_LBL_PadFlowD2
          bool          IsLBL_U2;
//==================================================
          Cg_TextsRectLabel   RLBL_Border;
          //======================================
          Cg_TextsLabel       LBL_DL, LBL_DL2, LBL_Exit,
                              LBL_Base, LBL_Base2, LBL_Base3,
                              LBL_R, LBL_R2,
                              LBL_L, LBL_L2, LBL_L_R, LBL_L2_R, LBL_L_L, LBL_L2_L, LBL_L_U, LBL_L2_U, LBL_L_D, LBL_L2_D,
                              LBL_U, LBL_U2, LBL_U2_AutoCharter,
                              LBL_D, LBL_D2, LBL_D2ShowComment,
                              LBL_C, LBL_C2;
          //======================================
          Cg_TextsButton      BTN_AddChart, BTN_Mover, BTN_Mover2, BTN_CloseChart, BTN_MaximizeChart;
          Cg_TextsButton      BTN_Crosshair,BTN_AllShapes,BTN_OrderBook,BTN_MACDsignals,BTN_Pivotssignals,BTN_ChannelSignal,BTN_EventsSignal,BTN_CHSD,BTN_RRBoxs;
          Cg_TextsButton      BTN_Bar, BTN_Candel, BTN_Line;
          Cg_TextsButton      BTN_FiboExpTrade, BTN_TrendZ, BTN_PaternBox, BTN_Pivot;
          //======================================
          Cg_TextsLabel       LBL_ShowOrdHistory, LBL_ResetPadPos, LBL_Zigzag, chastic, LabelWiliamR;
          Cg_TextsButton      BTN_MovingAvrege, BTN_WiliamR, BTN_Fractals, BTN_Stochastic,BTN_MACD,BTN_MFI,BTN_OBV, BTN_Zigzag ;
          Cg_TextsLabel       LBL_MovingAvrege, LBL_WiliamR, LBL_Fractals, LBL_Stochastic;
          //==================================================
          void initOBJ() //--- Never run to gone error wrong pointer ---//
          {         //BTN_AddChart.ObjNumDesc = "BTN_AddChart";
                    new Cg_TextsButton("next obj") =  BTN_Mover2;                  //--- No Varible use it but existed in RAM>>  "need to pars in func or some obj to return or assign" ---//
                    //  C_TOOLS("next obj");                                             //--- calling the public constructor that needs 3 arguments."need to pars in func or some obj to return or assign" ---//
                    //  new Cg_TextsButton("next obj")                                    //--- is Obj that assign from Selftype Obj Constructor "need to pars in func or some obj to return or assign"---// //?????
                    Cg_TextsButton *  BTN_MoverX  = new Cg_TextsButton();           //--- declare Pointer and assign by Selftype Obj Constructor without param ---//
                    Cg_TextsButton *  BTN_MoverX2 = new Cg_TextsButton("next obj"); //--- declare Pointer and assign by Selftype Obj Constructor with param    ---//
                    delete BTN_MoverX2; delete BTN_MoverX; //
          } //
//==================================================
//==================================================
};
//+------------------------------------------------------------------+
// *   Architecture SoloFunctional  MultiPrametric         OneLine    Column247
//OBJ.LBL_Base.Create(Is_Create,  Is_Move, "OBJ.LBL_Base", "n",                              (int)(429) +  independX + FixX,      (int)(201.6) - 1 + FixY + independY,                                                                                                                CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 55, "Webdings");   ///Segoe MDL2 Assets
//OBJ.LBL_Base2.Create(Is_Create,  Is_Move, "OBJ.LBL_Base2", "n",                            (int)(429) +  independX + FixX,      (int)(201.6) - 2 + FixY + independY,                                                                                                            CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 45, "Webdings");   ///Segoe MDL2 Assets
//OBJ.LBL_Base3.Create(Is_Create,  Is_Move, "OBJ.LBL_Base3", "n",                            (int)(429) +  independX + FixX,      (int)(201.6) - 2 + FixY + independY,                                                                                                                CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 35, "Webdings");   ///Segoe MDL2 Assets
//OBJ.LBL_R.Create(Is_Create,  Is_Move, "OBJ.LBL_R", "n",                                    (int)(462.8) +  independX + FixX,      (int)(201.6) + FixY + independY,                                                                                                                CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 17, "Webdings");
//OBJ.LBL_R2.Create(Is_Create,  Is_Move, "OBJ.LBL_R2", "n",                                  (int)(462.8) +  independX + FixX,      (int)(201.6) - 1 + FixY + independY,                                                                                                            CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 14, "Webdings");
//OBJ.LBL_Zigzag.Create(Is_Create,  Is_Move, "OBJ.LBL_Zigzag", "7",                          (int)(459.68) +  independX + FixX,      (int)(201.6) - 1 + FixY + independY,                                                                                                           CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrRed, 0, 15, "Wingdings 3");
//OBJ.LBL_L.Create(Is_Create,  Is_Move, "OBJ.LBL_L", "n",                                    (int)(397.8) +  independX + FixX,      (int)(201.6) + FixY + independY,                                                                                                                CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 17, "Webdings");
//OBJ.LBL_L2.Create(Is_Create,  Is_Move, "OBJ.LBL_L2", "n",                                  (int)(397.8) +  independX + FixX,      (int)(201.6) - 1 + FixY + independY,                                                                                                            CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 14, "Webdings");
//OBJ.LBL_L_R.Create(Is_Create,  Is_Move, "OBJ.LBL_L_R", "n",                                (int)(408.2) +  independX + FixX,      (int)(201.6) + FixY + independY,                                                                                                                CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrDarkCyan, 0, 13, "Webdings");
//OBJ.LBL_L2_R.Create(Is_Create,  Is_Move, "OBJ.LBL_L2_R", "n",                              (int)(408.2) +  independX + FixX,      (int)(200) + FixY + independY,                                                                                                                CORNER_LEFT_UPPER, ANCHOR_CENTER, false, clrLavender, 0, 10, "Webdings");
//*   Architecture SoloFunctional  MultiPrametric         OneLine    Column247

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Sgpdg_FlowPanel
{
///--- Helps
//               FlowPad.BTN_Mover.oButton.Color(DescColorPressIN = clrWhite);///Cant inject in self function//
//              gFlowPad.BTN_Mover.oAPI.Color(DescColorPressIN = clrWhite);///Can inject in self function//      //cool
//==================================================
private:

//==================================================
public:
          void          Sgpdg_FlowPanel() {};
          void          ~Sgpdg_FlowPanel() {}; //

          //--States    Elements
          bool          IsMove_AutoCharter;// = false;
          bool          IsBTN_CommentPannel;// = false;
          //--States    Elements ItSelf
          bool          IsLBL_;
          bool          IsLBL_D2;
          bool          IsLBL_U2;
          ///---
          Cg_GenericChartObj_API_MYs_MQLo_MYi<S_RECTANGLE_LABEL, CChartObjectRectLabel, Cg_TextsRectLabel> RLBL_Border;
          ///--- Self
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_LABEL, CChartObjectLabel, Cg_TextsLabel>
          LBL_DL, LBL_DL2, LBL_Exit,
                  LBL_Base, LBL_Base2, LBL_Base3,
                  LBL_R, LBL_R2,
                  LBL_L, LBL_L2, LBL_L_R, LBL_L2_R, LBL_L_L, LBL_L2_L, LBL_L_U, LBL_L2_U, LBL_L_D, LBL_L2_D,
                  LBL_U, LBL_U2, LBL_U2_AutoCharter,
                  LBL_D, LBL_D2, LBL_D2ShowComment,
                  LBL_C, LBL_C2;
          ///---BTN for panel acts
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON, CChartObjectButton, Cg_TextsButton>     BTN_AddChart, BTN_Mover, BTN_Mover2, BTN_CloseChart, BTN_MaximizeChart;
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON, CChartObjectButton, Cg_TextsButton>     BTN_Crosshair,BTN_AllShapes,BTN_OrderBook,BTN_MACDsignals,BTN_Pivotssignals,BTN_ChannelSignal,BTN_EventsSignal,BTN_CHSD,BTN_RRBoxs;
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON, CChartObjectButton, Cg_TextsButton>     BTN_Bar, BTN_Candel, BTN_Line;
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON, CChartObjectButton, Cg_TextsButton>     BTN_FiboExpTrade, BTN_TrendZ, BTN_PaternBox, BTN_Pivot;
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON, CChartObjectButton, Cg_TextsButton>     BTN_RightUp_OfChart, BTN_RightDown_OfChart, BTN_LeftUp_OfChart, BTN_LeftDown_OfChart;
          ///---
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_LABEL, CChartObjectLabel, Cg_TextsLabel>       LBL_ShowOrdHistory, LBL_ResetPadPos, LBL_Zigzag, chastic, LabelWiliamR;
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON, CChartObjectButton, Cg_TextsButton>     BTN_MovingAvrege, BTN_WiliamR, BTN_Fractals, BTN_Stochastic,BTN_MACD,BTN_MFI,BTN_OBV, BTN_Zigzag ;
          Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_LABEL, CChartObjectLabel, Cg_TextsLabel>       LBL_MovingAvrege, LBL_WiliamR, LBL_Fractals, LBL_Stochastic;
          ///---

          ///=====================================================================================
          //C_TextEdit       EDT_;
          //--------------------------------------


//==================================================
};
//+------------------------------------------------------------------+
//||   ||||||||||                 Sgpd_FlowPanel.mqh                 ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
