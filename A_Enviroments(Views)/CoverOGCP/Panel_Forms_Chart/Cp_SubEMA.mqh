//+------------------------------------------------------------------+
//||   ||||||||||                 Cp_SubEMA.mqh                     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Method_View.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cp_SubEMAKey
{
public:
          //----------------------------------------------------------
          bool                  IsPadPress_20Band;
          bool                  IsPadPress_5Micro;
          bool                  IsPadPress_20EMA;
          bool                  IsPadPress_30EMA;
          bool                  IsPadPress_70EMA;
          bool                  IsPadPress_200EMA;
          bool                  IsPadPress_500EMA; //
          bool                  IsPadPress_1000EMA; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cp_SubEMA
{
public:
          Cp_SubEMAKey          Key;
          bool                  IsAnyPressed;
          //----------------------------------------------------------
          void                  _Call(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed);
          void                  _Show(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed);
          //--event
          void                  SubEMA_OBJECT_CLICK();
          //----------------------------------------------------------
          void                  IsActiveEMASubElements(); //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubEMA::_Call(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          _Show(WhichMode, IsKey, clrBody, clrBodyMargine, clrBodyText, clrBodyCyrcle);
          //======================================================================================================================================================
          if(1)//---  controlls
          {         //======================================================================================================================================================
                    IsAnyPressed = Key.IsPadPress_20Band || Key.IsPadPress_5Micro || Key.IsPadPress_20EMA ||  Key.IsPadPress_30EMA || Key.IsPadPress_200EMA ||  Key.IsPadPress_500EMA;
                    //----------------
                    if(IsAnyPressed)Complex.Menu_Button(MODE_COLOR, IsKey, "EMA", RightMenuPad_Color.CclrBodyCyrcleActive);
                    //else Complex.Menu_Button(MODE_COLOR, IsKey, "EMA", RightMenuPad_Color.CclrBodyCyrcleUnPress);
                    //Alert("IsAnyPressed: ", IsAnyPressed);
                    //======================================================================================================================================================
                    //--choosen by acive key and desc..
                    Complex.Menu_Button(MODE_MODIFY, Key.IsPadPress_20Band,  "20 Band",  clrBody, clrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                    Complex.Menu_Button(MODE_MODIFY, Key.IsPadPress_5Micro,  "5 Micro",  clrBody, clrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                    Complex.Menu_Button(MODE_MODIFY, Key.IsPadPress_20EMA,   "20 EMA",   clrBody, clrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                    Complex.Menu_Button(MODE_MODIFY, Key.IsPadPress_30EMA,   "30 EMA",   clrBody, clrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                    Complex.Menu_Button(MODE_MODIFY, Key.IsPadPress_70EMA,   "70 EMA",   clrBody, clrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                    Complex.Menu_Button(MODE_MODIFY, Key.IsPadPress_200EMA,  "200 EMA",  clrBody, clrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                    Complex.Menu_Button(MODE_MODIFY, Key.IsPadPress_500EMA,  "500 EMA",  clrBody, clrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                    Complex.Menu_Button(MODE_MODIFY, Key.IsPadPress_1000EMA, "1000 EMA", clrBody, clrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                    //======================================================================================================================================================CclrBodyCyrcleUnPress
                    RightMenu.IsPadPress_EMA = IsKey &  (WhichMode == MODE_CREATE);  ///
                    //===============================================================///
                    //-----------------------------------------------------------------------------------------
                    RightMenu.IsPadPress_EMA = IsKey & (WhichMode == MODE_CREATE) ; //
                    //===========================================================================================================================================================
                    {         //---coloring button
                              if(RightMenu.IsPadPress_EMA)
                              {         Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_EMA, "EMA", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);}
                              else  {Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_EMA, "EMA", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleUnPress);}//
                              //==================================================================================================================================================
                              IsAnyPressed = Key.IsPadPress_20Band || Key.IsPadPress_5Micro || Key.IsPadPress_20EMA ||  Key.IsPadPress_30EMA || Key.IsPadPress_200EMA ||  Key.IsPadPress_500EMA;
                              if (IsAnyPressed)///---at the end of knowing...
                              {         Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_EMA, "EMA", clrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive);}//
                    }//
          }
          //======================================================================================================================================================
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
}//
//+------------------------------------------------------------------+
//| void Cp_SubEMA:: SubEMA_OBJECT_CLICK()                           |
//+------------------------------------------------------------------+RLBL_Menu_ButtonBG2-
void Cp_SubEMA:: SubEMA_OBJECT_CLICK()
{         //==========================================================================================================================
          string Clicked                = Event.sparam; //Alert(Event.sparam);///
          //==========================================================================================================================
          {         bool Is_Sparam = false;  int Typer = 0;//
                    if(Clicked == "LBL_MenuPadsMainText-20 Band"  || Clicked == "RBL_MenuPadsBox2-20 Band"  || Clicked == "LBL_MenuPadsRight2-20 Band"    || Clicked == "RLBL_Menu_ButtonBG2-20 Band")       {Is_Sparam = true; Typer = 99;}
                    if(Clicked == "LBL_MenuPadsMainText-5 Micro"  || Clicked == "RBL_MenuPadsBox2-5 Micro"  || Clicked == "LBL_MenuPadsRight2-5 Micro"    || Clicked == "RLBL_Menu_ButtonBG2-5 Micro")       {Is_Sparam = true; Typer = 00;}
                    if(Clicked == "LBL_MenuPadsMainText-20 EMA"   || Clicked == "RBL_MenuPadsBox2-20 EMA"   || Clicked == "LBL_MenuPadsRight2-20 EMA"     || Clicked == "RLBL_Menu_ButtonBG2-20 EMA")        {Is_Sparam = true; Typer = 01;}
                    if(Clicked == "LBL_MenuPadsMainText-30 EMA"   || Clicked == "RBL_MenuPadsBox2-30 EMA"   || Clicked == "LBL_MenuPadsRight2-30 EMA"     || Clicked == "RLBL_Menu_ButtonBG2-30 EMA")        {Is_Sparam = true; Typer = 02;} //LBL_MenuPadsMainText-Close Buys
                    if(Clicked == "LBL_MenuPadsMainText-70 EMA"   || Clicked == "RBL_MenuPadsBox2-70 EMA"   || Clicked == "LBL_MenuPadsRight2-70 EMA"     || Clicked == "RLBL_Menu_ButtonBG2-70 EMA")        {Is_Sparam = true; Typer = 03;}
                    if(Clicked == "LBL_MenuPadsMainText-200 EMA"  || Clicked == "RBL_MenuPadsBox2-200 EMA"  || Clicked == "LBL_MenuPadsRight2-200 EMA"    || Clicked == "RLBL_Menu_ButtonBG2-200 EMA")       {Is_Sparam = true; Typer = 10;}
                    if(Clicked == "LBL_MenuPadsMainText-500 EMA"  || Clicked == "RBL_MenuPadsBox2-500 EMA"  || Clicked == "LBL_MenuPadsRight2-500 EMA"    || Clicked == "RLBL_Menu_ButtonBG2-500 EMA")       {Is_Sparam = true; Typer = 11;}
                    if(Clicked == "LBL_MenuPadsMainText-1000 EMA" || Clicked == "RBL_MenuPadsBox2-1000 EMA" || Clicked == "LBL_MenuPadsRight2-1000 EMA"   || Clicked == "RLBL_Menu_ButtonBG2-1000 EMA")      {Is_Sparam = true; Typer = 12;}
                    //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                    if(Is_Sparam)
                    {         bool TPX = false; string TPX_DESC = "";
                              //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                              switch(Typer)  ///-- if tpx_desc is uper lifetime no need switch...  (paran chok olsa))
                              {         case 99: {TPX = Key.IsPadPress_20Band;      TPX_DESC = "20 Band";} break; //
                                        case 00: {TPX = Key.IsPadPress_5Micro;      TPX_DESC = "5 Micro";} break; //
                                        case 01: {TPX = Key.IsPadPress_20EMA;       TPX_DESC = "20 EMA";} break; //
                                        case 02: {TPX = Key.IsPadPress_30EMA;       TPX_DESC = "30 EMA";} break; //
                                        case 03: {TPX = Key.IsPadPress_70EMA;       TPX_DESC = "70 EMA";} break; //
                                        case 10: {TPX = Key.IsPadPress_200EMA;      TPX_DESC = "200 EMA";} break; //
                                        case 11: {TPX = Key.IsPadPress_500EMA;      TPX_DESC = "500 EMA";} break; //
                                        case 12: {TPX = Key.IsPadPress_1000EMA;     TPX_DESC = "1000 EMA";} break; //
                              };//
                              //==========================================================================================================================
                              TPX = TPX ? false : true;//Alert(__FUNCSIG__, TPX); // Reverse key status
                              //--self sub button light
                              Complex.Menu_Button(MODE_MODIFY, TPX, TPX_DESC, RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                              //==========================================================================================================================
                              //--Calling on chart actions
                              if(true)///sorun...MODE_CREATE TechnicalO
                              {         if( TPX_DESC == "20 Band")          {TechnicalO.test.TechnicalXRun_EMA20_Levels(TPX, 200);} //
                                        //--------------------------------------------
                                        if( TPX_DESC == "5 Micro")
                                        {         TechnicalO._Ema5Micro_.MA_Create(TPX);//
                                                  TechnicalO._Sma5Micro_.MA_Create(TPX);//
                                        } //
                                        //--------------------------------------------
                                        if( TPX_DESC == "20 EMA")           {TechnicalO._Ema20_.MA_Create(TPX);}
                                        //--------------------------------------------
                                        if( TPX_DESC == "30 EMA")           {TechnicalO._Ema30_.MA_Create(TPX);}
                                        if( TPX_DESC == "70 EMA")           {TechnicalO._Ema70_.MA_Create(TPX);}
                                        //--------------------------------------------
                                        if( TPX_DESC == "200 EMA")
                                        {         TechnicalO._Ema200_.MA_Create(TPX);
                                                  TechnicalO._Ema200_200_.MA_Create(TPX);
                                                  TechnicalO._Ema200__200_.MA_Create(TPX);
                                                  TechnicalO._Ema200_400_.MA_Create(TPX);
                                                  TechnicalO._Ema200__400_.MA_Create(TPX);
                                                  //
                                                  //
                                                  TechnicalO._Ema200_800_.MA_Create(TPX); //
                                                  TechnicalO._Ema200__800_.MA_Create(TPX); //
                                                  TechnicalO._Ema200_1300_.MA_Create(TPX); //
                                                  TechnicalO._Ema200__1300_.MA_Create(TPX); //
                                                  //
                                        } //
                                        //--------------------------------------------
                                        if( TPX_DESC == "500 EMA")           {TechnicalO.TechnicalOMACreator(TPX);} /////need to adjusting///
                                        if( TPX_DESC == "1000 EMA")          {TechnicalO._Ema1000_.MA_Create(TPX);} /////need to adjusting///
                                        //--------------------------------------------
                              }//
                              //==========================================================================================================================
                              //-------------------------------------------------------------------------------------------------------------------------------------
                              switch(Typer) //rerun the keys to keeper of tpx
                              {         case 99: { Key.IsPadPress_20Band    = TPX;} break; //
                                        case 00: { Key.IsPadPress_5Micro    = TPX;} break; //
                                        case 01: { Key.IsPadPress_20EMA     = TPX;} break; //
                                        case 02: { Key.IsPadPress_30EMA     = TPX;} break; //
                                        case 03: { Key.IsPadPress_70EMA     = TPX;} break; //
                                        case 10: { Key.IsPadPress_200EMA    = TPX;} break; //
                                        case 11: { Key.IsPadPress_500EMA    = TPX;} break; //
                                        case 12: { Key.IsPadPress_1000EMA   = TPX;} break; //
                              };//
                              //-------------------------------------------------------------------------------------------------------------------------------------
                    }       //
          } //
          //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
          //---who will care the acction is done .. umbrella family action static safer...re6..
          //--------------------------------------------------------------------------------------
          //==================================================================================================================================================
          //=====================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubEMA::_Show(int WhichMode, bool IsKey, color clrBody = clrWhite, color clrBodyMargine = clrNavy, color clrBodyText = clrNavy, color clrBodyCyrcle = clrRed)
{         int stepaX    = 75;
          int stepaY    = -25;
          int SizeX     = 0;
          int movestep  = SizeX + (int)(SizeX * 1.6) + (SizeX * 7)  ;
          int MoveY     = -50;
          int MoveX     = +25 + 75 + 10;
          int FontSize  = -3;//
//movestep += movestep * stepa * 1
//if(0)
//{         Complex.Menu_ButtonX(Is_Create, "C" + "1", SizeX, 0, movestep * 1, 0);
//          Complex.Menu_ButtonX(Is_Create, "C" + "2", SizeX, 0, movestep * 2, 0);
//          Complex.Menu_ButtonX(Is_Create, "C" + "3", SizeX, 0, movestep * 3, 0);
//          Complex.Menu_ButtonX(Is_Create, "C" + "4", SizeX, 0, movestep * 4, 0);
//          Complex.Menu_ButtonX(Is_Create, "C" + "5", SizeX, 0, movestep * 5, 0); }
          if(0)
          {         Complex.Menu_ButtonX(WhichMode, IsKey,  "20 Band",  stepaX * 1, MoveY,  SizeX * 0, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey,  "5 Micro",  stepaX * 2, MoveY,  SizeX * 1, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey,  "20 EMA",   stepaX * 3, MoveY,  SizeX * 1, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey,  "30 EMA",   stepaX * 4, MoveY,  SizeX * 1, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey,  "200 EMA",  stepaX * 5, MoveY,  SizeX * 1, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey,  "500 EMA",  stepaX * 6, MoveY,  SizeX * 1, 0,  FontSize);    //
          }//
          if(1)
          {         Complex.Menu_ButtonX(WhichMode, IsKey,  "20 Band",  MoveX, MoveY + stepaY * -1,   SizeX * 0, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey,  "5 Micro",  MoveX, MoveY + stepaY * -2,   SizeX * 1, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey,  "20 EMA",   MoveX, MoveY + stepaY * -3,   SizeX * 1, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey,  "30 EMA",   MoveX, MoveY + stepaY * -4,   SizeX * 1, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey,  "70 EMA",   MoveX, MoveY + stepaY * -5,   SizeX * 1, 0, FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey,  "200 EMA",  MoveX, MoveY + stepaY * -6,   SizeX * 1, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey,  "500 EMA",  MoveX, MoveY + stepaY * -7,   SizeX * 1, 0,  FontSize);
                    Complex.Menu_ButtonX(WhichMode, IsKey,  "1000 EMA",  MoveX, MoveY + stepaY * -8,  SizeX * 1, 0,  FontSize);
                    //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cp_SubEMA::IsActiveEMASubElements()
{         IsAnyPressed = Key.IsPadPress_20Band || Key.IsPadPress_5Micro || Key.IsPadPress_20EMA ||  Key.IsPadPress_30EMA || Key.IsPadPress_200EMA ||  Key.IsPadPress_500EMA;
          if (IsAnyPressed)///---at the end of knowing...
          {         if( RightMenu.IsPadPress_EMA) Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_EMA, "EMA", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive);
                    else Complex.Menu_Button(MODE_MODIFY, !RightMenu.IsPadPress_EMA, "EMA", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleActive); //
          } //
          else
          {         if( RightMenu.IsPadPress_EMA) Complex.Menu_Button(MODE_MODIFY, RightMenu.IsPadPress_EMA, "EMA", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrclePress);
                    ///---fuuuup
                    //else  Complex.Menu_Button(MODE_MODIFY, !RightMenu.IsPadPress_EMA, "EMA", RightMenuPad_Color.CclrBody, RightMenuPad_Color.CclrBodyMargine, clrWhite, RightMenuPad_Color.CclrBodyCyrcleUnPress);//
          } //
          //Alert("Return of menu is: ", IsAnyPressed ); //
          //Alert("Return of menu _IsAnyPressed_ is: ", IsAnyPressed ); //
          //Alert("Return of menu _RightMenu.IsPadPress_EMA_ is: ", RightMenu.IsPadPress_EMA ); //
}
//+------------------------------------------------------------------+
//||   ||||||||||                 Cp_SubEMA.mqh                     ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//{         //--ema not changing efect
//          //RightMenu.SubEMA.SubEMA_KeysStatus();//
//          //SubEMA_KeysStatus();//
//          //=======================================================================================================================================================
//          if(true)
//          {         //Alert("7777777777");
//                    //bool IsAnyPressed = Key.IsPadPress_5Micro || Key.IsPadPress_20EMA ||  Key.IsPadPress_30EMA || Key.IsPadPress_200EMA ||  Key.IsPadPress_500EMA;
//                    //if (IsAnyPressed)///quantomic blackhole prossessing city personal computer graphs. CPCQ;;
//                      //--color orange
//                      //--color green
//                      ////=============================================================================================================================================
///quantomic blackhole prossessing city personal computer graphs. CPCQ;;
///---at the end of knowing... == its working..
//                      //----gone uper call difusing
//  {         //
//                              RightMenu.SubSide_MarketKeys_Loger._Call(MODE_CREATE, false);
//                              RightMenu.SubStatus._Call(MODE_CREATE, false);
//                              RightMenu.SubController._Show(MODE_CREATE, false); //
//                              bank_Pad.MM_Panel(MODE_CREATE, false); //
//                          }
//                        //=======================================================================================================================================================
//                          }

//+------------------------------------------------------------------+
