//+------------------------------------------------------------------+
//||   ||||||||||                 B_MQL.mqh                         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\.A_Developer.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cv_ViewComments
{
public:
          void       Cv_ViewComments() {/*Alert("Cv_ViewComments::Cv_ViewComments");*/};//Print("       Passd StackOverflow", __FUNCSIG__); return;
          void      ~Cv_ViewComments() {};
          bool       UPDATED;
          bool       Is_Updated;
          bool       Update()
          {         UPDATED = false;
                    //---Alert("ct_Conductor.IsConditionWatchEnd_DoComment: ", ct_Conductor.IsConditionWatchEnd_DoComment);
                    //*********************************************************************************************
                    //frist controll passage  one time                                                            *   void C_TIMER::CheackKeys(bool KeyRun = false)   cheackout
                    if(Is_Updated) //---evey new bar update but frist call achived ///controll all next calls     *
                              if(!Detect_NewBar._M1.CBT.Is_NewBar) return false;       //                             *
                    //*********************************************************************************************
                    if(ct_Drive.TDD.ct_Signals.DATAS.Is_DoComment)
                    {         //----------Alert(ct_Drive.TDD.ct_Conductor.TI_Curr.Comment_Desc);
                              ///---off---bool Pre_Comment_C_CONDUCTOR()//Pre_Comment_C_CONDUCTOR(); //
                              //---off--- Strung Coupling with {gFlow_Pad - ct_Inform}//---by pre declare Global function can pass model..
                              if(!gFlow_Pad.IsBTN_CommentPannel) {} //Comment(ct_Drive.TDD.ct_Conductor.TI_Curr.Comment_Desc + ct_Inform.CommentOx(false));
                              //--------------------------------Comment(TradeState_Current.Comment_Desc + ct_Inform.CommentOx(false)); //
                              //---error--- IPre_Comment_C_CONDUCTOR();//
                              Is_Updated = true;//
                              ct_Drive.TDD.ct_Signals.DATAS.Is_DoComment                  = false; } //
                    //
                    return UPDATED = true;
                    //
          }

};
//+------------------------------------------------------------------+
//||   ||||||||||                 B_MQL.mqh                         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
