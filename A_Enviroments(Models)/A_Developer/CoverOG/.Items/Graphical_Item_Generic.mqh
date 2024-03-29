//+------------------------------------------------------------------+
//|                     Graphical_Item_Generic.mqh                   |
//+------------------------------------------------------------------+
//||   ||||||||||             Graphical_Item_Generic.mqh            ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.ItemsGeneric\Cg_GenericChartObj_API_MYs_MQLo_MYi.mqh> 
//+------------------------------------------------------------------+
//
//--- Generic Model Of Global Cover Graphical Object
//
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_RECTANGLE,           CChartObjectRectangle,          C_ShapesRectangle>              gRCTNGL_;   //---  construct 'XDISTANCE_L_02' - struct member undefined        Objects.mqh         355       42
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_TRIANGLE,            CChartObjectTriangle,           C_ShapesTriangle>               gTRNGL_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ELLIPSE,             CChartObjectEllipse,            C_ShapesEllipse>                gELPS_;
//======================================================================================================
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_VLINE,               CChartObjectVLine_MQL4,              C_LinesVertical>                gVerticalX;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_HLINE,               CChartObjectHLine_MQL4,              C_LinesHorizontal>              gHorizontalX;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_TREND,               CChartObjectTrend_MQL4,              C_LinesTrend>                   gLinesTrend;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_TRENDBYANGLE,        CChartObjectTrendByAngle_MQL4,       C_LinesTrendByAngle>            gTrendByAngle01;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_CYCLES,              CChartObjectCycles_MQL4,             C_LinesCycles>                  gLinesCycles ;
//======================================================================================================
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_PITCHFORK,           CChartObjectPitchfork_MQL4,          C_ChannelsPitchfork>            gPitchfork_G;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_REGRESSION,          CChartObjectRegression_MQL4,         C_ChannelsRegression>           gRegression_G;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_STDDEVCHANNEL,       CChartObjectStdDevChannel_MQL4,      C_ChannelsStandardDeviation>    gStandardDeviation_G;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_EQUIDISTANT,         CChartObjectChannel_MQL4,            C_ChannelsEquidistant>          gEquidistant_G;
//=======================================================================================================
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_GANN_LINE,           CChartObjectGannLine,           C_GannsLine>                    gGannLine_G;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_GANN_FAN,            CChartObjectGannFan,            C_GannsFan>                     gGannFan_G;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_GANN_GRID,           CChartObjectGannGrid,           C_GannsGrid>                    gGannGrid_G;
//======================================================================================================
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ElliotsWave3,        CChartObjectEllipse,            C_ElliotsWave3_Base>            gElliotWave3;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ElliotsWave5,        CChartObjectEllipse,            C_ElliotsWave5_Base>            gElliotWave5;
//======================================================================================================
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_FIBO_RETRACEMENT,    CChartObjectFibo,               C_FibosRetracement>             gFiboRetracement_G;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_FIBO_ARC,            CChartObjectFiboArc,            C_FibosArc>                     gFiboArc_G;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_FIBO_CHANNEL,        CChartObjectFiboChannel,        C_FibosChannel>                 gFiboChannel_G;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_FIBO_EXPANSION,      CChartObjectFiboExpansion,      C_FibosExpansion>               gFiboExpansion_G;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_FIBO_FAN,            CChartObjectFiboFan,            C_FibosFan>                     gFiboFan_G;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_FIBO_TIMESZONE,      CChartObjectFiboTimes,          C_FibosTimeZone>                gFiboTimeZone_G;
//======================================================================================================
Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_LABEL,               CChartObjectLabel,              Cg_TextsLabel>                 gLabelX;                                //Cg_TextsLabel    LBL_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_RECTANGLE_LABEL,     CChartObjectRectLabel,          Cg_TextsRectLabel>              gRectLabelX, gRLBL, gRLBL_Border;    //Cg_TextsRectLabel RLBL_,RLBL_Border;
Cg_GenericChartObj_API_MYs_MQLo_MYi<Sg_BUTTON,              CChartObjectButton,             Cg_TextsButton>                gButtonX, gBTN;                      Cg_TextsButton                BTN_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_EDIT,                CChartObjectEdit,               Cg_TextsEdit>                   gEditX;                                 //Cg_TextsEdit                  EDT_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_TEXTDescription,     CChartObjectText,               Cg_TextsDescription>            gDesc_;
//======================================================================================================
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_BITMAP_LABEL,        CChartObjectBmpLabel,           C_BitmapsLabel>                 gBitmapLabel_;   ///---'XDISTANCE_L_02' - struct member undefined  Objects.mqh         349       42
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_BITMAP,              CChartObjectBitmap,             C_BitmapsBar>                   gBitmapBar_;
////======================================================================================================
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ArrowsCheck,         CChartObjectArrowCheck,         C_ArrowsCheck>                  gCheck_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ArrowsUp,            CChartObjectArrowUp,            C_ArrowsUp>                     gUp_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ArrowsDown,          CChartObjectArrowDown,          C_ArrowsDown>                   gDown_;   ///---'XDISTANCE_L_02' - struct member undefined          ///---S_ArrowsDown not C_ArrowsDown
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ArrowsStop,          CChartObjectArrowStop,          C_ArrowsStop>                   gStop_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ArrowsThumbDown,     CChartObjectArrowThumbDown,     C_ArrowsThumbDown>              gThumbDown_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ArrowsThumbUp,       CChartObjectArrowThumbUp,       C_ArrowsThumbUp>                gThumbUp_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ArrowsRightPrice,    CChartObjectArrowRightPrice,    C_ArrowsRightPrice>             gRightPrices_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ArrowsLeftPrice,     CChartObjectArrowLeftPrice,     C_ArrowsLeftPrice>              gLeftPrice_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ArrowsBuy,           CChartObjectArrow,              C_ArrowsBuy>                    gArrowBuy_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ArrowsSell,          CChartObjectArrow,              C_ArrowsSell>                   gArrowSell_;
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_ArrowsArrow,         CChartObjectArrow,              C_ArrowsArrow>                  gArrowX;
//======================================================================================================
Cg_GenericChartObj_API_MYs_MQLo_MYi<S_EventsNews,          CChartObjectEventNews,          C_EventsNews>                   gEvent_;
//======================================================================================================
//+------------------------------------------------------------------+
//|             Class GraphicalChartObj(DataAction)      BEGIN       |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                     Graphical_Item_Generic.mqh                   |
//+------------------------------------------------------------------+
//||   ||||||||||             Graphical_Item_Generic.mqh            ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+