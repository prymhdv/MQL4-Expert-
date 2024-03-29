//+------------------------------------------------------------------+
//||   ||||||||||             Graphical_Item_Solid.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Arrows\oArrowsCheck.mqh>;                 //C_ArrowsCheck                 Check_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Arrows\oArrowsUp.mqh>;                    //C_ArrowsUp                    Up_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Arrows\oArrowsDown.mqh>;                  //C_ArrowsDown                  Down_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Arrows\oArrowsStop.mqh>;                  //C_ArrowsStop                  Stop_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Arrows\oArrowsThumbDown.mqh>;             //C_ArrowsThumbDown             ThumbDown_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Arrows\oArrowsThumbUp.mqh>;               //C_ArrowsThumbUp               ThumbUp_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Arrows\oArrowsRightPrice.mqh>;            //C_RightPrice                  RightPrices_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Arrows\oArrowsLeftPrice.mqh>;             //C_LeftPrice                   LeftPrice_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Arrows\oArrowsBuy.mqh>;                   //C_ArrowBuy                    ArrowBuy_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Arrows\oArrowsSell.mqh>;                  //C_ArrowSell                   ArrowSell_;
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOG\.Items\Arrows\oArrowsArrow.mqh>;                 C_ArrowsArrow                   ArrowX;
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
class C_Arrows
{
private:
//============================================================
public:
          void                          C_Arrows()  {};
          void                          ~C_Arrows() {};
//============================================================
          C_ArrowsCheck                 Check;
          C_ArrowsUp                    Up;
          C_ArrowsDown                  Down;
          C_ArrowsStop                  Stop;
          C_ArrowsThumbDown             ThumbDown;
          C_ArrowsThumbUp               ThumbUp;
          C_ArrowsRightPrice            RightPrice;
          C_ArrowsLeftPrice             LeftPrice;
          C_ArrowsSell                  Sell;
          C_ArrowsBuy                   Buy;
          C_ArrowsArrow                 Arrow;
          //
 
//============================================================
};
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
