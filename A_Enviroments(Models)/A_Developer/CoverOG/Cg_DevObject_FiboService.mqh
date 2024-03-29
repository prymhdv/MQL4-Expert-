//+------------------------------------------------------------------+
//||   ||||||||||           Cg_DevObject_FiboService.mqh            || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               || 0 errors, 0 warnings, 137-141 msec elapsed
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cg_DevObject_FiboService
{
public:
          void                  Cg_DevObject_FiboService(){};
          void                  ~Cg_DevObject_FiboService(){};
          template<typename T>
          void                  FiboLeveler(T &ObjCom, string UseName = "None", int Width = 1, ENUM_LINE_STYLE STYLE = STYLE_DASHDOTDOT, color DescColorIN =  C'36, 52, 69', color DescColorNeg = clrRed, bool FGradient = false);



};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
///===========================, string UseFiboTimes = "None" when name in parameters efect  ///when default param beginig error
template<typename T>
void Cg_DevObject_FiboService::FiboLeveler(T &ObjCom, string UseName = "None", int Width = 1, ENUM_LINE_STYLE STYLE = STYLE_DASHDOTDOT, color DescColorIN =  C'36, 52, 69', color DescColorNeg = clrRed, bool FGradient = false)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, UseName) >= 0)
          {         ///////////////////////////////////////////
                    //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
                    ObjCom.LevelsCount(29); ObjCom.LevelStyle(STYLE); ObjCom.LevelWidth(Width);
                    for(int i = 0; i < 29 ; i++)ObjCom.LevelWidth(i, Width);
                    //===========================
                    for(int i = 0; i < 29 ; i++)ObjCom.LevelStyle(i, STYLE);
                    /////==========================================
                    ObjCom.LevelValue(0, 0.000);        ObjCom.LevelValue(1, 0.236);    ObjCom.LevelValue(2, 0.328);
                    ObjCom.LevelValue(3, 0.50);         ObjCom.LevelValue(4, 0.618);    ObjCom.LevelValue(5, 0.786);
                    ObjCom.LevelValue(6, 0.88);         ObjCom.LevelValue(7, 1.00);     ObjCom.LevelValue(8, 1.236);
                    ObjCom.LevelValue(9, 1.382);        ObjCom.LevelValue(10, 1.50);    ObjCom.LevelValue(11, 1.618);
                    ObjCom.LevelValue(12, 2.000);       ObjCom.LevelValue(13, 2.618);   ObjCom.LevelValue(14, 3.000);
                    /////////////////////////////////////////////
                    ObjCom.LevelValue(15, -0.236);      ObjCom.LevelValue(16, -0.328);  ObjCom.LevelValue(17, -0.50);
                    ObjCom.LevelValue(18, -0.618);      ObjCom.LevelValue(19, -0.786);  ObjCom.LevelValue(20, -0.88);
                    ObjCom.LevelValue(21, -1.00);       ObjCom.LevelValue(22, -1.236);  ObjCom.LevelValue(23, -1.382);
                    ObjCom.LevelValue(24, -1.50);       ObjCom.LevelValue(25, -1.618);  ObjCom.LevelValue(26, -2.000);
                    ObjCom.LevelValue(27, -2.618);      ObjCom.LevelValue(28, -3.000);
                    ///////==============================================
                    ObjCom.LevelDescription(0, "0.000" + " - %$");      ObjCom.LevelDescription(1, "0.236" + " - %$");  ObjCom.LevelDescription(2, "0.328" + " - %$");
                    ObjCom.LevelDescription(3, "0.50" + " - %$");       ObjCom.LevelDescription(4, "0.618" + " - %$");  ObjCom.LevelDescription(5, "0.786" + " - %$");
                    ObjCom.LevelDescription(6, "0.88" + " - %$");       ObjCom.LevelDescription(7, "1.00" + " - %$");   ObjCom.LevelDescription(8, "1.236" + " - %$");
                    ObjCom.LevelDescription(9, "1.382" + " - %$");      ObjCom.LevelDescription(10, "1.50" + " - %$");  ObjCom.LevelDescription(11, "1.618" + " - %$");
                    ObjCom.LevelDescription(12, "2.000" + " - %$");     ObjCom.LevelDescription(13, "2.618" + " - %$"); ObjCom.LevelDescription(14, "3.000" + " - %$");
                    //////////////////////////////////////////
                    ObjCom.LevelDescription(15, "-0.236" + " - %$");    ObjCom.LevelDescription(16, "-0.328" + " - %$"); ObjCom.LevelDescription(17, "-0.50" + " - %$");
                    ObjCom.LevelDescription(18, "-0.618" + " - %$");    ObjCom.LevelDescription(19, "-0.786" + " - %$"); ObjCom.LevelDescription(20, "-0.88" + " - %$");
                    ObjCom.LevelDescription(21, "-1.00" + " - %$");     ObjCom.LevelDescription(22, "-1.236" + " - %$"); ObjCom.LevelDescription(23, "-1.382" + " - %$");
                    ObjCom.LevelDescription(24, "-1.50" + " - %$");     ObjCom.LevelDescription(25, "-1.618" + " - %$"); ObjCom.LevelDescription(26, "-2.000" + " - %$");
                    ObjCom.LevelDescription(27, "-2.618" + " - %$");    ObjCom.LevelDescription(28, "-3.000" + " - %$");
                    ////==================================================
                    (FGradient) ? ObjCom.LevelColor(0, DescColorIN) : ObjCom.LevelColor(0, DescColorNeg);
                    //must create trend line that diffrent lines..
                    //ObjCom.LevelColor(0, DescColor);  ObjCom.LevelColor(1, DescColor);        ObjCom.LevelColor(2, DescColor);
                    //ObjCom.LevelColor(3, DescColor);  ObjCom.LevelColor(4, DescColor);        ObjCom.LevelColor(5, DescColor);
                    //ObjCom.LevelColor(6, DescColor);  ObjCom.LevelColor(7, DescColor);        ObjCom.LevelColor(8, DescColor);
                    //ObjCom.LevelColor(9, DescColor);  ObjCom.LevelColor(10, DescColor);       ObjCom.LevelColor(11, DescColor);
                    //ObjCom.LevelColor(12, DescColor); ObjCom.LevelColor(13, DescColor);       ObjCom.LevelColor(14, DescColor);
                    ////////////////////////////////////////////
                    //ObjCom.LevelColor(15, DescColorNeg);      ObjCom.LevelColor(16, DescColorNeg);    ObjCom.LevelColor(17, DescColorNeg);
                    //ObjCom.LevelColor(18, DescColorNeg);      ObjCom.LevelColor(19, DescColorNeg);    ObjCom.LevelColor(20, DescColorNeg);
                    //ObjCom.LevelColor(21, DescColorNeg);      ObjCom.LevelColor(22, DescColorNeg);    ObjCom.LevelColor(23, DescColorNeg);
                    //ObjCom.LevelColor(24, DescColorNeg);      ObjCom.LevelColor(25, DescColorNeg);    ObjCom.LevelColor(26, DescColorNeg);
                    //ObjCom.LevelColor(27, clrBlue);           ObjCom.LevelColor(28, clrBlue);
                    // ObjectSetInteger(ChartData_ChartInfo.ID, UseFiboName, OBJPROP_LEVELCOLOR, 25, DescColorNeg);
                    //////////////////////////////////////////
                    //============================================
                    //============================//============================
                    ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //
                    //============================//============================
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_Fibo Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
}
//+------------------------------------------------------------------+
//||   ||||||||||           Cg_DevObject_FiboService.mqh            || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               || 0 errors, 0 warnings, 137-141 msec elapsed
//+------------------------------------------------------------------+//--- Object pass NULL , primitive  pass 0 //---Error , '0' - parameter passed as reference, variable expected
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
