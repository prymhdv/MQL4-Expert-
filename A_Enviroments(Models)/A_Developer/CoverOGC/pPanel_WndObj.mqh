//+------------------------------------------------------------------+
//|                                                        C_Panel_WndObj.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Controls\Panel.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectPanel.mqh>
class C_Panel_WndObj
{
private:
          string                        C_Panel_WndObj::m_name;
          int                           C_Panel_WndObj::m_index;
//===================================================================
private:        CChartObjectLabel       C_Panel_WndObj::Label_private;
protected:      CChartObjectLabel       C_Panel_WndObj::Label_protected;
public:         CChartObjectLabel       C_Panel_WndObj::Label_public;
//===================================================================
public:
//===================================================================
          CPanel                        C_Panel_WndObj::Panel_WndObj;
//===================================================================
          void                          C_Panel_WndObj::C_Panel_WndObj() {};
          void                          C_Panel_WndObj::~C_Panel_WndObj() {};
//===================================================================
          void                          C_Panel_WndObj::Create(const string Panel_Name = "Panel_Name",
                              const int X1Cordinate = 500, const int Y1Cordinate = 500, const int X2Size = 200, const int Y2Size = 100,
                              color BackColorC = C'36, 52, 69',   ENUM_BORDER_TYPE BorderType = BORDER_FLAT,   color  DescColorIN = clrYellow, const int FontSize = 7);   //regtangel

//===================================================================
//===================================================================
//===================================================================
//===================================================================
//===================================================================
//===================================================================
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_Panel_WndObj::Create(const string Panel_Name = "Panel_Name", const int X1Cordinate = 500, const int Y1Cordinate = 500, const int X2Size = 200, const int Y2Size = 100, color BackColorC = C'36, 52, 69',   ENUM_BORDER_TYPE BorderType = BORDER_FLAT,   color  DescColorIN = clrYellow, const int FontSize = 7)   //regtangel
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, Panel_Name) < 0)
                    Panel_WndObj.Create(ChartData_ChartInfo.ID, Panel_Name, ChartData_ChartInfo.SubWindow, X1Cordinate, Y1Cordinate, X2Size, Y2Size); //
          if(ObjectFind(ChartData_ChartInfo.ID, Panel_Name) >= 0) //
          {         //
                    Panel_WndObj.ColorBackground(BackColorC); Panel_WndObj.BorderType(BorderType);
                    Panel_WndObj.Color(DescColorIN );// Panel_WndObj.BorderColor(BorderColor );// Panel_WndObj.BackColor(BackColor); not use
                    Panel_WndObj.Alignment(0, 0, 0, 0, 0);
                    Panel_WndObj.Size(X2Size, X2Size);
                    Panel_WndObj.Width(0);
                    Panel_WndObj.Height(0);
                    Panel_WndObj.FontSize(FontSize);  Panel_WndObj.Font("Arial");  Panel_WndObj.Hide();
                    Panel_WndObj.IsActive()  ? Panel_WndObj.OnMouseEvent(1, 77, MOUSE_RIGHT) :  true;
                    int Useid = CHARTEVENT_OBJECT_CREATE ; long UseLong = 0 ; double Usedouble = 0;  string USesparam = Panel_Name;
                    Panel_WndObj.OnEvent(Useid, UseLong, Usedouble, USesparam);
                    ///Panel_WndObj.Corner(Corner);//CORNER_RIGHT_UPPER not use
                    //Panel_WndObj.X_Distance(X); Panel_WndObj.Y_Distance(Y);//not use
                    //Panel_WndObj.X_Size(XSize); Panel_WndObj.Y_Size(YSize);//not use
                    // Panel_WndObj.SetInteger(OBJPROP_STYLE, 0); Panel_WndObj.Style(0);//not use
                    ///Panel_WndObj.Description(Description)  no exist in cpanel from rectangel //ObjectSetString(0, Panel_Name, OBJPROP_FONT, "Arial");
                    ///
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return;//
}

//+------------------------------------------------------------------+
