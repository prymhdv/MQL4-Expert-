//+------------------------------------------------------------------+
//|                        Cg_DevTextsLabel.mqh                      |
//+------------------------------------------------------------------+
//||   ||||||||||             Cg_DevTextsLabel.mqh                  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
class Cg_DevTextsLabel : public Cg_TextsLabel
{
public:
          void  CLabelBoxCreate(int WhichMode = MODE_CREATE, bool IsKey = false, string NameCom = "", int independXCom = 0, int independYCom = 0, int FixPadXCom = 0, int FixPadYCom = 0);



};

//+------------------------------------------------------------------+
//|                                                                  |Is_Create,Is_Move
//+------------------------------------------------------------------+
void Cg_DevTextsLabel::CLabelBoxCreate(int WhichMode = MODE_CREATE, bool IsKey = false, string NameCom = "", int independXCom = 0, int independYCom = 0, int FixPadXCom = 0, int FixPadYCom = 0)
{         //=====================================
          int TextSizeX = 0;  int TextSizeY = 0;
          TextSizeX = StringLen(NameCom) * 7;
          TextSizeY = (int)(TextSizeX / 1.9);
          //=====================================
          {         Dev_Object_Pack.Texts.RectLabel.GDS.Set_Action_2(WhichMode, IsKey);
                    Dev_Object_Pack.Texts.RectLabel.GDS.Set_Desc_1("RectLabelMovingAvrege" + NameCom);
                    Dev_Object_Pack.Texts.RectLabel.GDS.Set_Location_5((int)(337.48) + FixPadXCom + independXCom, (int)(174.4) + FixPadYCom + independYCom, TextSizeX, TextSizeY, CORNER_LEFT_UPPER);
                    Dev_Object_Pack.Texts.RectLabel.GDS.Set_Color_2(clrChartreuse, clrChartreuse);
                    Dev_Object_Pack.Texts.RectLabel.GDS.Set_Tip_3(STYLE_SOLID, 1, BORDER_FLAT);
                    Dev_Object_Pack.Texts.RectLabel.GDS.Set_Common_6(false, 10, false, false, false, NameCom);
                    Dev_Object_Pack.Texts.RectLabel.GDS.Set_Chart_6();
                    Dev_Object_Pack.Texts.RectLabel.Action(Dev_Object_Pack.Texts.RectLabel);//
                    //Dev_Object_Pack.TextRectLabel.Create(Is_Create, Is_Move, "RectLabelMovingAvrege" + NameCom, NameCom, (int)(337.48) + FixPadXCom + independXCom, (int)(174.4) + FixPadYCom + independYCom, TextSizeX, TextSizeY, CORNER_LEFT_UPPER, ANCHOR_LEFT, false, BORDER_FLAT, clrChartreuse, clrChartreuse, 0, STYLE_SOLID, 1, 8, "Arial"); //
          }
          //
          {         Dev_Object_Pack.Texts.Label.GDS.Set_Action_2(WhichMode, IsKey);
                    Dev_Object_Pack.Texts.Label.GDS.Set_Desc_4("LabelMovingAvrege" + NameCom, NameCom, "Arial Bold", 7);
                    Dev_Object_Pack.Texts.Label.GDS.Set_Location_5((int)(338) + FixPadXCom + independXCom, (int)(179.2) + FixPadYCom + independYCom, 0, CORNER_LEFT_UPPER, ANCHOR_LEFT);
                    Dev_Object_Pack.Texts.Label.GDS.Set_Color_1(clrWhite);
                    Dev_Object_Pack.Texts.Label.GDS.Set_Common_6(false, 10, false, false, false, NameCom);
                    Dev_Object_Pack.Texts.Label.GDS.Set_Chart_6();
                    Dev_Object_Pack.Texts.Label/*Frame.*/.Action(Dev_Object_Pack.Texts.Label);//
                    //this.Action(Is_Create, Is_Move, "LabelMovingAvrege" + NameCom, NameCom, (int)(338) + FixPadXCom + independXCom,  (int)(179.2) + FixPadYCom + independYCom, CORNER_LEFT_UPPER, ANCHOR_LEFT, false, clrWhite, 0, 7, "Arial Bold"); //
          }
          //
}
//+------------------------------------------------------------------+
//|                        Cg_DevTextsLabel.mqh                      |
//+------------------------------------------------------------------+
//||   ||||||||||             Cg_DevTextsLabel.mqh                  ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
