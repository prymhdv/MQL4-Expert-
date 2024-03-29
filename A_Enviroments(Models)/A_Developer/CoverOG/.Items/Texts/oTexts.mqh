//+------------------------------------------------------------------+
//|                        C_GraphicalObjectFrame.mqh                |
//+------------------------------------------------------------------+
//||   ||||||||||               Cg_DevObjectPack.mqh                ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\oTextsDescription.mqh>;             Cg_TextsDescription              DescX;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\oTextsLabel.mqh>;                   Cg_TextsLabel                    LabelX;         //LBL_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\oTextsRectLabel.mqh>;               Cg_TextsRectLabel                RectLabelX;     //RLBL_,RLBL_Border;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\oTextsButton.mqh>;                  Cg_TextsButton                   ButtonX;        //C_TextButton                BTN_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Texts\oTextsEdit.mqh>;                    Cg_TextsEdit                     EditX;          //C_TextEdit                  EDT_;
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\ChartObjects\ChartObjectsTxtControls.mqh>
class Cg_Texts
{
private:
//====================================================================
public:
//====================================================================
public:
          void                  Cg_Texts() {};//Button_ = Button_ ;
          void                  ~Cg_Texts() {};
//====================================================================
          Cg_TextsLabel          Label;
          Cg_TextsRectLabel      RectLabel;
          Cg_TextsDescription    Description,Description1,Description2,Description3,Description4,DescriptionNews,DescriptionSessions;
          Cg_TextsEdit           Edit;
          Cg_TextsButton         Button;
//====================================================================
//#include <ChartObjects\ChartObjectsTxtControls.mqh>             CChartObjectButton Button_; //
         
//====================================================================
};
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
