//+------------------------------------------------------------------+
//||   ||||||||||                 C_ShapesRectangle.mqh             || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Shapes\Sg_RECTANGLE.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\BasicChartObj\__COBFA__.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsShapes.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
/*
 ////--- nonGeneric RAngl_X ---///
                    {         RAngl_Candel.GDS.Set_Action_2(MODE_CREATE, Is_Create);
                              RAngl_Candel.GDS.Set_Desc_1(UseRectangleName);
                              RAngl_Candel.GDS.Set_Cordinate_4( XCordinate, YCordinate, X2Cordinate, Y2Cordinate);
                              RAngl_Candel.GDS.Set_Style_Width_Fill_Color(STYLE_SOLID, 2,false,ClrRed);
                              RAngl_Candel.GDS.Set_Common_6(false, 50, false, false, false, LabelDEF_tooltip + "");
                              RAngl_Candel.GDS.Set_Chart_6();
                              RAngl_Candel.Action(RAngl_Candel);//
                              //---  RAngl_Candel.Create(UseRectangleName, Description[index], XCordinate, YCordinate, X2Cordinate, Y2Cordinate, Fill, Background, ShapeColor, style, Width);
                    }


*/
class C_ShapesRectangle : public __COBFA__<S_RECTANGLE> 
{
//====================================================================
private:
//====================================================================
public:
          void                          C_ShapesRectangle() {};
          void                          ~C_ShapesRectangle() {};
//====================================================================
          S_RECTANGLE                   GDS;
          CChartObjectRectangle         GAC;
       
          void                          SetupSignal() {}
//====================================================================
          int                           UseCount ;
          int                           UseStart ;
//====================================================================
          bool                          Create(int                   mode            = MODE_CREATE,
                                               bool                  IsKey          = false,
                                               string                Name            = "ShapeRectangle",
                                               datetime              XCordinate      = 120,
                                               double                YCordinate      = 160,
                                               datetime              X2Cordinate     = 120,
                                               double                Y2Cordinate     = 40,
                                               bool                  Fill            = true,
                                               bool                  Background      = false,
                                               color                 ShapeColor      = clrYellow,
                                               ENUM_LINE_STYLE       style           = STYLE_SOLID,
                                               int                   Width           = 1);  // RectLabel
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          void                Move(const string ShapeRectangleName = "ShapeRectangle",
                                   const datetime XCordinate = 120, const double YCordinate = 160, const datetime X2Cordinate = 120, const double Y2Cordinate = 40 ); // RectLabel

          void Draw_GDS(int WhichMode, bool IsKey, string n,string nt, bool Is_Delete, datetime t1, double p1, datetime t2, double p2, color c,bool f);
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ShapesRectangle::Draw_GDS(int WhichMode, bool IsKey, string n,string nt, bool Is_Delete, datetime t1, double p1, datetime t2, double p2, color c,bool f)
{         //
          GDS.Set_Action_2(WhichMode, IsKey);
          GDS.Set_Desc_1(n);//"Shape.Rectangle" +
          GDS.Set_Cordinate_4( t1, p1, t2, p2);
          GDS.Set_Style_Width_Fill_Color(STYLE_SOLID, 2, f, c);
          GDS.Set_Common_6(true, 50, false, false, true,  nt);//"Shape.Rectangle" +
          GDS.Set_Chart_6();
          Action(this);//
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_ShapesRectangle::Create(int                   mode            = MODE_CREATE,
                               bool                  IsKey          = false,
                               string                Name            = "ShapeRectangle",
                               datetime              XCordinate      = 120,
                               double                YCordinate      = 160,
                               datetime              X2Cordinate     = 120,
                               double                Y2Cordinate     = 40,
                               bool                  Fill            = true,
                               bool                  Background      = false,
                               color                 ShapeColor      = clrYellow,
                               ENUM_LINE_STYLE       style           = STYLE_SOLID,
                               int                   Width           = 1)  // RectLabel
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //
//=========================================================
          bool returnResult = false;
          if(ObjectFind(ChartData_ChartInfo.ID, Name) < 0)
          {         returnResult = GAC.Create(ChartData_ChartInfo.ID, Name, ChartData_ChartInfo.SubWindow, 0, 0, 0, 0);
                    if(!returnResult)Alert(__FUNCTION__, __LINE__);//
          }
          if(ObjectFind(ChartData_ChartInfo.ID, Name) >= 0)
          {         //
                    GAC.Width(Width);
                    GAC.Style(style);
                    GAC.Color(ShapeColor);
                    GAC.Description(Name); // UseLabel.Angle(Angle + 5);
                    GAC.Fill(Fill);
                    //
                    GAC.SetInteger(OBJPROP_TIME1, XCordinate); //
                    GAC.SetDouble(OBJPROP_PRICE1, YCordinate);
                    GAC.SetInteger(OBJPROP_TIME2, X2Cordinate); //
                    GAC.SetDouble(OBJPROP_PRICE2, Y2Cordinate);
                    //
                    GAC.Selectable(false);
                    GAC.Selected(false);                 // highlight to move
                    GAC.Hidden(true);                                              // hidden in the object list
                    GAC.Z_Order(0);                                                  // priority for mouse click
                    GAC.Background(Background);                                           // in the background
                    GAC.Tooltip(Name);                                       // tooltip for mouse hover
                    //
                    const bool                    tester = true  ;///we now can make static variable aof any class...s
                    // border type
                    //
          }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          return returnResult;//
}
//========================================================================================================================================================
void C_ShapesRectangle::Move(const string ShapeRectangleName = "ShapeRectangle",
                             const datetime XCordinate = 120, const double YCordinate = 160, const datetime X2Cordinate = 120, const double Y2Cordinate = 40 ) // RectLabel
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //|
//=========================================================|
          if(ObjectFind(ChartData_ChartInfo.ID, ShapeRectangleName) >= 0)
          {         GAC.SetInteger(OBJPROP_TIME1, XCordinate); //
                    GAC.SetDouble(OBJPROP_PRICE1, YCordinate);
                    GAC.SetInteger(OBJPROP_TIME2, X2Cordinate); //
                    GAC.SetDouble(OBJPROP_PRICE2, Y2Cordinate);
                    //  UseRectLabel.Anchor(Anchor);                                              // hidden in the object list
                    /// UseRectLabel.Corner(Corner);// UseRectLabel.SetInteger(OBJPROP_STYLE, 3); //
          }//
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_TOOLS Error",  __LINE__, __FUNCTION__); //]
//=========================================================]
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//||   ||||||||||                 C_ShapesRectangle.mqh             || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
