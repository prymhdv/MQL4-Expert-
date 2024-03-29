//+------------------------------------------------------------------+
//||   ||||||||||                 BaseDoor.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    |||
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+pre define clases
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
class C_TNSD;
class C_TND;

//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
struct C_TNSD_File
{         //bool       Branchs_bool[];   //--not accepted array for binary saving
          //bool       Branchs_Enum1[];
public:          //bool       Branchs_Enum2[];.
          void C_TNSD_File()  {    TOTAL++; /*Id = TOTAL;*/ Id = TOTAL; };
          void ~C_TNSD_File() {   --TOTAL; /*Id = TOTAL; no need*/      };
          //---------------------------------------------
          //static int Answers[10][10][10][10];///WinBuy WinSell LossBuy LossSell
          //---------------------------------------------
          static uint    TOTAL;        //--accepted static for binary saving
          uint             Id;
          //string      name;           //--not accepted array for binary saving any array based variable  class type expected, pointer to type 'C_TNSD_File' is not allowed   Advanced_TreeNode_Decition2.mqh         64        22\
          int           IDPath;
          //
          bool          IsLeaf;
          bool          IsTrade_Activated;
          //CAnswerAddressNode AnswerAddressNodes; //--not accepted array for binary saving
          //int           BranchCount; //
          //ulong        NODE_Number;
          //ulong        NODE_LEAF_Number;
          //ulong        NODE_Number_Sum;
          //----------------------------------------------------------
          int           WinBuy, WinSell;//, LossBuy, LossSell;
          float         TreeProfitedTotal_on_node;
          //----------------------------------------------------------
          float         ProfitedTotal_Node;
          bool          IsAlowed_Profited_Trader_Node;
          ushort        IsAlowed_Profited_Trader_Count;
          //----------------------------------------------------------
          float         Price_Start;
          float         Price_Curr;
          datetime      Time_Start;
          datetime      Time_Curr;
          datetime      Time_Durr;
          float         Profit;
          bool          Is_Started;
          uchar         BUY1SELL2VOID3;
          //----------------------------------------------------------
          void          SetInfo ( ushort _WinBuy, ushort _WinSell, ushort _LossBuy, ushort _LossSell)  { WinBuy = _WinBuy; WinSell = _WinSell; /*LossBuy = _LossBuy; LossSell = _LossSell;*/ }
          void          Reset() {         Price_Start = 0; Price_Curr = 0; Time_Start = 0; Time_Curr = 0; Profit = 0;  Time_Durr = 0; BUY1SELL2VOID3 = -1;}

          uchar         OptimizeOFFER( int BuyWin, int SellWin/*, ushort BuyLoss, ushort SellLoss*/);
          void          RunTrade(C_TND &TND, bool IsTraverse_all = false);
          void          RunPub(C_TND &TND);
          //
          //
};
uint C_TNSD_File::TOTAL = 0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+double &ref_TreeProfitedTotal_on_node
void C_TNSD_File::RunTrade(C_TND &TND, bool IsTraverse_all = false) /*run at chossen leaf frist  and then all leafs*/
{         //
          //----------------------------------------------------------------------- frist cycle every leaf >> frist leaf data gone tree>> then other leaf seted, next cycle all leaf seted and its ok ..
          //10 0.02   >>  0.91 >  0.91 >  0.91 >>>   0.00  ?? why  change file ! change value
          //11 0.02   >> -0.16 > -0.12 > -0.12 >>>> -0.00  ?? why  change file ! change value
          // save repeate ok  save random  ok      ! any anomaly from change in file caused by the assign s cheack them..TreeProfitedTotal_on_node
          //11 0.03   >> -0.56 >>> -0.56 >>> -0.56 >>>> -0.56 >>>>> -0.56    ok
          //10 0.03   >> 0.74  >>> 0.74  >>>> 0.94 >>>>> 0.94 >>>>> -0.94    ok         ----------/*every file remmeber tree profite all */
          //14 0.03    > 0.00  ok
          //10 0.01  > 0.44 >  0.52  >>> 0.49 <<< 0.49       not depended new node add  //--WORKED.... Make reduce recuresive cals in every node and active leaf sets(not activated)
          //11 0.01  > 0.11 >> 0.11  >>> 0.11 <<<  -1.27  <<< -1.27        unchange open >> 0.16
          if(!C_TD2::IsUptadedTreeProfitedTotal) { C_TD2::TreeProfitedTotal = TreeProfitedTotal_on_node; C_TD2::IsUptadedTreeProfitedTotal = 1;} /*init it is false   -- remember  from file selected!*/
          /*  save every node leafs // when restart remember from load file   )((work wel ata restart and change chossen node remmebered) */
          double ProfitEstimated = 5;
          IsAlowed_Profited_Trader_Node = (ProfitedTotal_Node > 10); //10$ profited node
          //-----------------------------------------------------------------------
          if(!IsTraverse_all)          //if(!IsLeaf)return;  //selected node leaf trade
          {         /* start trade if not started*/
                    /*win chance cheack*/
                    //Print("__Cheak is Run A_________", __FUNCTION__);
                    //-------------------------------------------------------------------
                    ulong SawCount = WinBuy + WinSell ;/*+ LossBuy + LossSell;*/
                    //if(BUY1SELL2VOID3 == 3) {RunPub(TND); return;}/*Errorr*/
                    //Print("__Cheak is Run B_________", __FUNCTION__);
                    //-----------------------------------------------------------------------&& IsAlowed_Profited_Trader_Count < 10
                    // virtual trade
                    if(!IsAlowed_Profited_Trader_Node )/*test range*/
                    {         if(!IsTrade_Activated )
                              {
                                        {         Price_Start             = (float)Close[0];
                                                  Time_Start              = Time[0];//
                                                  //Is_Started  = true; //
                                                  BUY1SELL2VOID3          = OptimizeOFFER(WinBuy, WinSell/*, LossBuy, LossSell*/);; //
                                                  IsTrade_Activated       = true;//
                                                  //
                                        } //
                              } //
                              else
                              {
                                        {         Price_Curr                     = (float)Close[0];
                                                  Time_Curr                      = Time[0]; //
                                                  Time_Durr                      = TimeCurrent() - Time_Start; //TNSD_File.Time_Curr - TNSD_File.Time_Start; candel den candele //time local 1:30 is diff  TimeCurrent()   TimeLocal()
                                        }
                                        //----------------------------------------------------------------------------------------
                                        if(BUY1SELL2VOID3 == 1) {Profit = Price_Curr - Price_Start;} //
                                        if(BUY1SELL2VOID3 == 2) {Profit = -(Price_Curr - Price_Start);} //
                                        //----------------------------------------------------------------------------------------
                                        C_TD2::AllTreeProfitingEver += Profit;//--here not cheaked before and not resetd
                                        //----------------------------------------------------------------------------------------
                                        if(Profit > ProfitEstimated)
                                        {         //
                                                  if(BUY1SELL2VOID3 == 1) WinBuy++;
                                                  if(BUY1SELL2VOID3 == 2) WinSell++; //
                                                  IsTrade_Activated = false; //
                                                  ProfitedTotal_Node      += Profit; ///remember node
                                                  C_TD2::TreeProfitedTotal += Profit;
                                                  //Is_Started  = false; //
                                                  Reset();
                                                  //
                                        }
                                        if(Profit < -ProfitEstimated)
                                        {         //
                                                  if(BUY1SELL2VOID3 == 1) WinBuy--;
                                                  if(BUY1SELL2VOID3 == 2) WinSell--; //
                                                  IsTrade_Activated = false; //
                                                  ProfitedTotal_Node      += Profit;  ///remember node
                                                  C_TD2::TreeProfitedTotal += Profit;
                                                  //Is_Started  = false; //
                                                  Reset();
                                                  //
                                        } //
                                        if(BUY1SELL2VOID3 == 3) {IsTrade_Activated = false;  Reset();  }//
                              } //
                    }//
                    //------------------------------------------------------------------- secound control
                    if(IsAlowed_Profited_Trader_Node)
                    {         if(!IsTrade_Activated )
                              {
                                        {         Price_Start             = (float)Close[0];
                                                  Time_Start              = Time[0];//
                                                  //Is_Started  = true; //
                                                  BUY1SELL2VOID3          = OptimizeOFFER(WinBuy, WinSell/*, LossBuy, LossSell*/);; //
                                                  IsTrade_Activated       = true;//
                                                  //
                                        } //
                              } //
                              else
                              {
                                        {         Price_Curr                     = (float)Close[0];
                                                  Time_Curr                      = Time[0]; //
                                                  Time_Durr                      = TimeCurrent() - Time_Start; //TNSD_File.Time_Curr - TNSD_File.Time_Start; candel den candele //time local 1:30 is diff  TimeCurrent()   TimeLocal()
                                        }
                                        //Print("TimeCurrent()",TimeToString(TimeCurrent(),TIME_SECONDS),"   TNSD_File.Time_Durr:", TimeToString(TNSD_File.Time_Durr,TIME_SECONDS),"   TNSD_File.Time_Start:", TimeToString(TNSD_File.Time_Start,TIME_SECONDS));
                                        {         /*WORKED*/
                                                  //TNSD_File.LossBuy++;//////remmembered saved value
                                                  //if(TNSD_File.IDPath == 11823211211 )   { TNSD_File.LossBuy++; }
                                                  //if(TNSD_File.IDPath == 11223211211 )   { TNSD_File.WinBuy--; }      /*Worked well as Wanted*/
                                                  //static bool switcher2 = 0;  TNSD_File.IsTrade_Activated = switcher2 = switcher2 ? 0 : 1;
                                        }
                                        //----------------------------------------------------------------------------------------
                                        if(BUY1SELL2VOID3 == 1) {Profit = Price_Curr - Price_Start;} //
                                        if(BUY1SELL2VOID3 == 2) {Profit = -(Price_Curr - Price_Start);} //
                                        //----------------------------------------------------------------------------------------
                                        C_TD2::AllTreeProfitingEver += Profit;//--here not cheaked before and not resetd
                                        //----------------------------------------------------------------------------------------
                                        if(Profit > ProfitEstimated)
                                        {         //
                                                  if(BUY1SELL2VOID3 == 1) WinBuy++;//as  same as TND.obj_Self_Pocket.TNSD_File.
                                                  if(BUY1SELL2VOID3 == 2) WinSell++; //
                                                  IsTrade_Activated = false; //
                                                  ProfitedTotal_Node      += Profit; ///remember node
                                                  C_TD2::TreeProfitedTotal += Profit;
                                                  //Is_Started  = false; //
                                                  Reset();
                                                  //
                                        }
                                        if(Profit < -ProfitEstimated)
                                        {         //
                                                  if(BUY1SELL2VOID3 == 1) WinBuy--;
                                                  if(BUY1SELL2VOID3 == 2) WinSell--; //
                                                  IsTrade_Activated = false; //
                                                  ProfitedTotal_Node      += Profit; ///remember node
                                                  C_TD2::TreeProfitedTotal += Profit;
                                                  //Is_Started  = false; //
                                                  Reset();
                                                  //
                                        } //
                                        if(BUY1SELL2VOID3 == 3) {IsTrade_Activated = false;  Reset();  }//
                              } //
                    }//
          }//
          if(IsTraverse_all)//--all leafs trade rersult
          {         if(IsTrade_Activated)//--onfile
                    {
                              {         Price_Curr                     = (float)Close[0];
                                        Time_Curr                      = Time[0]; //
                                        Time_Durr                      = TimeCurrent() - Time_Start; //TNSD_File.Time_Curr - TNSD_File.Time_Start; candel den candele //time local 1:30 is diff  TimeCurrent()   TimeLocal()
                              }
                              //Print("TimeCurrent()",TimeToString(TimeCurrent(),TIME_SECONDS),"   TNSD_File.Time_Durr:", TimeToString(TNSD_File.Time_Durr,TIME_SECONDS),"   TNSD_File.Time_Start:", TimeToString(TNSD_File.Time_Start,TIME_SECONDS));
                              {         /*WORKED*/
                                        //TNSD_File.LossBuy++;//////remmembered saved value
                                        //if(TNSD_File.IDPath == 11823211211 )   { TNSD_File.LossBuy++; }
                                        //if(TNSD_File.IDPath == 11223211211 )   { TNSD_File.WinBuy--; }      /*Worked well as Wanted*/
                                        //static bool switcher2 = 0;  TNSD_File.IsTrade_Activated = switcher2 = switcher2 ? 0 : 1;
                              }
                              //----------------------------------------------------------------------------------------
                              if(BUY1SELL2VOID3 == 1) {Profit = Price_Curr - Price_Start;} //
                              if(BUY1SELL2VOID3 == 2) {Profit = -(Price_Curr - Price_Start);} //
                              //----------------------------------------------------------------------------------------
                              //C_TD2::AllTreeProfitingEver += Profit;//--here cheaked before and resetd
                              //----------------------------------------------------------------------------------------
                              if(Profit > ProfitEstimated)
                              {         //
                                        if(BUY1SELL2VOID3 == 1) WinBuy++;
                                        if(BUY1SELL2VOID3 == 2) WinSell++; //
                                        IsTrade_Activated = false; //
                                        ProfitedTotal_Node      += Profit; ///remember node
                                        C_TD2::TreeProfitedTotal += Profit;
                                        //Is_Started  = false; //
                                        Reset();
                                        //
                              }
                              if(Profit < -ProfitEstimated)
                              {         //
                                        if(BUY1SELL2VOID3 == 1) WinBuy--;
                                        if(BUY1SELL2VOID3 == 2) WinSell--; //
                                        IsTrade_Activated = false; //
                                        ProfitedTotal_Node      += Profit; ///remember node
                                        C_TD2::TreeProfitedTotal += Profit;
                                        //Is_Started  = false; //
                                        Reset();
                                        //
                              } //
                              if(BUY1SELL2VOID3 == 3) {IsTrade_Activated = false;  Reset();  }//
                    } //
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          //Print("__Cheak is Run C_________", __FUNCTION__);
          if(C_TD2::IsUptadedTreeProfitedTotal) {  TreeProfitedTotal_on_node = C_TD2::TreeProfitedTotal; }//ref_TreeProfitedTotal_on_node =
          if(IsAlowed_Profited_Trader_Node)
          {         /*exter signal for trade*/
                    BUY1SELL2VOID3 = OptimizeOFFER(WinBuy, WinSell  /*,LossBuy, LossSell*/); //
                    if           (BUY1SELL2VOID3 == 1)  {ct_Drive.TDD.ct_Signals.TICC.Final_TREE_BUY_Condition_Signal   =  true;}
                    else if      (BUY1SELL2VOID3 == 2)  {ct_Drive.TDD.ct_Signals.TICC.Final_TREE_SELL_Condition_Signal   =  true;}
                    else if      (BUY1SELL2VOID3 == 3)  {ct_Drive.TDD.ct_Signals.TICC.Final_TREE_SELL_Condition_Signal  = ct_Drive.TDD.ct_Signals.TICC.Final_TREE_BUY_Condition_Signal  =  false;} ///
                    /*exter signal for trade*/
          }
          RunPub(TND); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string descTreeProfitedTotal;
string descAllTreeProfitingEver;
string descProfit;
string descTime_Durr;
//
void C_TNSD_File::RunPub(C_TND &TND)
{         //-------------------------------------------------
          /*  Real trade info and optimation when is leaf  */
          //-------------------------------------------------
          //if(!IsLeaf)return;
          //Print("__Cheak is Run A_________", __FUNCTION__);
          if(ct_Drive.IS_TREE_SCALP_ACTIVE_Pub)
          {
                    {         /*Export*/
                              ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Enum_Offer_Type = E_OFFER_VOID;
                              uchar optimizeOFFER = OptimizeOFFER(WinBuy, WinSell/*, LossBuy, LossSell*/);
                              if     (optimizeOFFER == 1) {ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Enum_Offer_Type = E_OFFER_BUY;} //--yet not assign for trader signal just trainning
                              else if(optimizeOFFER == 2) {ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Enum_Offer_Type = E_OFFER_SELL;}
                              else if(optimizeOFFER == 3) {ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Enum_Offer_Type = E_OFFER_VOID;} //
                    }
                    {         //Print("__Cheak is Run B_________", __FUNCTION__);
                              /*Print info of leaf node*/
                              {         int SolidunifiedNum = 0;
                                        if(Pack_tree.ptr_TND_Root.Node_Total != 0)  { SolidunifiedNum = (int)(IDPath / Pack_tree.ptr_TND_Root.Node_Total); }
                                        //-----------------------------------------------------------------
                                        ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Desc_Offer_SuperNameNode = TND.obj_Self_Pocket.namePath;
                                        //---------------------------------------------------------------------------------------------------TNSD_File.IDPath==ptr_Node_Chooen.obj_Self_Pocket.TNSD_File.IDPath ---are the same//--noneed
                                        ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Desc_Offer_NameNode =
                                                  TND.obj_Self_Pocket.name + "_IDPath: "
                                                  + (string)TND.obj_Self_Pocket.namePathID + " / " + (string)Pack_tree.ptr_TND_Root.Node_Total /*  running more recureciv make lagging*/
                                                  + "  Sid:" + (string)SolidunifiedNum
                                                  + " <<<";//
                              }
                              //---------------------------------------------------------------------------------------------------++ " IsTA:" + (string)IsTrade_Activated// "IDPath" + "("  + (string)IDPath // same as >>> 13>>>TNSD_File.Id:(" + (string)TNSD_File.Id + ")" + "ptr_Node_Chooen.obj_Self_Pocket.TNSD_File.Id" + "("  + (string)ptr_Node_Chooen.obj_Self_Pocket.TNSD_File.Id + ")"
                              descTreeProfitedTotal      = DoubleToStr(C_TD2::TreeProfitedTotal, 2);
                              descAllTreeProfitingEver   = DoubleToStr(C_TD2::AllTreeProfitingEver/*selected leaf*/, 2);
                              ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Desc_Offer_InfoNode2 =
                                        /*are static*/ // "Id:(" + (string)Id + ")" + " Self.ID(" + (string)TND.obj_Self_Pocket.Id + ") TND.Tot1(" + (string)TND.TOTAL_One  + ")"
                                        " PT:("  + DoubleToStr(C_TD2::TreeProfitedTotal, 2) + ")"
                                        + " PD:(" + DoubleToStr(C_TD2::AllTreeProfitingEver/*selected leaf*/, 2) + ")"
                                        + " PTN(" + DoubleToStr(ProfitedTotal_Node, 2) + ")"
                                        + " <<<";
                              //---------------------------------------------------------------------------------------------------"TNSD_File.IDPath" + "("  + (string)TNSD_File.IDPath  === "_IDPath: " + (string)ptr_Node_Chooen.obj_Self_Pocket.TNSD_File.IDPath
                              descProfit         = DoubleToStr(Profit, 3);
                              descTime_Durr      = TimeToString(Time_Durr, TIME_SECONDS);
                              ct_Drive.TDD.ct_Signals.DATAS.Decition_Tree_SignalEstimateOut.Desc_Offer_InfoNode =
                                        "P:("  + DoubleToStr(Profit, 3) + ") WB(" + (string)WinBuy + ")WS(" + (string)WinSell + ")"/*LB(" + (string)LossBuy + ")LS(" + (string)LossSell */ + ")"
                                        + " D:" + TimeToString(Time_Durr, TIME_SECONDS)
                                        + " <<<"; //TND.obj_Self_Pocket.TNSD_File. no need
                              //Print( "Offer tree node ", name, ": ", (string)Id, "  ", EnumToString(ct_Drive.TDD.ct_Signals.Decition_Tree_SignalEstimateOut.Enum_Offer_Type), " => Profit(" + DoubleToStr(TNSD_File.Profit, 2), " LN: ", (string)TNSD_File.NODE_LEAF_Number); //
                              //Print(__FUNCTION__, "", (string)TND.obj_Self_Pocket.namePath, Desc2); //Pack_tree.ptr_TND_Root.ptr_Branch_1.obj_Self_Pocket.TNSD_File.IDPath);//gTD2.ptr_root
                              //---------------------------------------------------------------------------------------------------obj_Self_Pocket.name  gTD2.ptr_root.ptr_Branch_1.obj_Self_Pocket.TNSD_File.IDPath:
                              //------------
                              /* where not know self TNSD_File*/
                              //Sleep(1000);//
                    }//
                    //!!Print("____ct_Drive.IS_TREE_SCALP_ACTIVE_Pub__: ", ct_Drive.IS_TREE_SCALP_ACTIVE_Pub);
          }
          else
          {         //Print("____ct_Drive.IS_TREE_SCALP_ACTIVE_Pub__: ", ct_Drive.IS_TREE_SCALP_ACTIVE_Pub);
          }
          //
          //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
uchar C_TNSD_File::OptimizeOFFER(  int BuyWin, int SellWin/*, ushort BuyLoss, ushort SellLoss*/)
{         uchar offer = 0;
          /*-----------------------------------------------------------------*/
          /* CALC BUY SELL PROFITED NON PROFITED SENSITIVITY GONE MINOR LOSS */
          /*-----------------------------------------------------------------*/
          if(1)          //--do simple
          {         if(BuyWin == 0 && SellWin == 0 /*&& BuyLoss == 0 && SellLoss == 0*/) {return 1;}
                    if(BuyWin > SellWin)   { offer =  1; if(0)Print("offer =  1;", "BuyWin:", (string)BuyWin, "  SellWin:", (string)SellWin);}
                    if(BuyWin == SellWin)  { offer =  3; if(0)Print("offer =  3;", "BuyWin:", (string)BuyWin, "  SellWin:", (string)SellWin);}
                    if(BuyWin < SellWin)   { offer =  2; if(0)Print("offer =  2;", "BuyWin:", (string)BuyWin, "  SellWin:", (string)SellWin);}
                    //
                    return offer; //
          }
          //-----------------------------------------------------------------
          {         //
                    //if(BuyWin > SellWin)// zone profit buy
                    //{         /*-------------------------------*/
                    //          /* BUY PROFITED HUGE [2X,0x,Y,Y] */
                    //          /*-------------------------------*/
                    //          //offer =  1; //permenet
                    //          if(BuyLoss > SellLoss)//zone loss_buy grater=>make sell
                    //          {         /*-------------------------------------*/
                    //                    /* BUY NON PROFITED HUGE [2X,0x,4Y,0y] */
                    //                    /*-------------------------------------*/
                    //                    //  offer =  "OFFER(SELL)"; // permenet
                    //                    if(BuyWin > BuyLoss)//SELL   [4,0,1,0]   //----PRIORITY BY BURNED SELL    // victory sell
                    //                    {         /*-----------------------------------------------------------*/
                    //                              /* BUY PROFITED HUGE && BUY NON PROFITED HUGE [2XX,0x,4Yy,0y] */
                    //                              /*-----------------------------------------------------------*/
                    //                              offer =  1; // permenet  [2,0,1,0] -> BUY //"OFFER(BUY)"
                    //                    }
                    //                    else if(BuyWin == BuyLoss)
                    //                    {         /*------------------------------------------------------------*/
                    //                              /* BUY PROFITED HUGE && BUY NON PROFITED HUGE [2XX,0x,4YY,0y] */
                    //                              /*------------------------------------------------------------*/
                    //                              offer =  3; //permenet   [2,0,2,0] -> SELL SECOUND CHANCE GONE SELL
                    //                    }//
                    //                    else if(BuyWin < BuyLoss)//BUY
                    //                    {         /*------------------------------------------------------------*/
                    //                              /* BUY PROFITED HUGE && BUY NON PROFITED HUGE [2Xx,0x,4YY,0y] */
                    //                              /*------------------------------------------------------------*/
                    //                              offer =  2; //permenet  [2,0,3,0] -> SELL
                    //                    } //
                    //          }
                    //          else if(BuyLoss == SellLoss)
                    //          {         /*-------------------------------------------*/
                    //                    /* BUY sell NON PROFITED EQUAL [2X,0x,4Y,4Y] */
                    //                    /*-------------------------------------------*/
                    //                    //offer =  "OFFER(BUY)"; //
                    //                    if(BuyWin > BuyLoss)//  [1,0,0,0] [3,1,2,2]  //SELL      //----PRIORITY BY BURNED SELL    // victory sell
                    //                    {         /*-----------------------------------------------------------------*/
                    //                              /* BUY PROFITED HUGE && BUY sell NON PROFITED EQUAL [2XX,0x,4Yy,4Y] */
                    //                              /*-----------------------------------------------------------------*/
                    //                              offer =  1; // permenet [2, 0, 0, 0]
                    //                    }
                    //                    else if(BuyWin == BuyLoss)
                    //                    {         /*------------------------------------------------------------------*/
                    //                              /* BUY PROFITED HUGE && BUY sell NON PROFITED EQUAL [2XX,0x,4YY,4Y] */
                    //                              /*------------------------------------------------------------------*/
                    //                              offer =  1; //permenet
                    //                    }//
                    //                    else if(BuyWin < BuyLoss)//BUY
                    //                    {         /*------------------------------------------------------------------*/
                    //                              /* BUY PROFITED HUGE && BUY sell NON PROFITED EQUAL [2Xx,0x,4YY,4Y] */
                    //                              /*------------------------------------------------------------------*/
                    //                              offer =  2; //permenet
                    //                    } //
                    //          }//
                    //          else if(BuyLoss < SellLoss)///zone loss_sell grater =>make buy
                    //          {         /*--------------------------------------*/
                    //                    /* SELL NON PROFITED HUGE [2X,0x,0y,4Y] */
                    //                    /*--------------------------------------*/
                    //                    //offer =  "OFFER(BUY)"; // permenet
                    //                    if(BuyWin > BuyLoss)//SELL      //----PRIORITY BY BURNED SELL    // victory sell
                    //                    {         /*-------------------------------------------------------------*/
                    //                              /* BUY PROFITED HUGE && SELL NON PROFITED HUGE [2XX,0x,0yy,4Y] */
                    //                              /*-------------------------------------------------------------*/
                    //                              offer =  1; // permenet //[1, 0, 0, 4]
                    //                    }
                    //                    else if(BuyWin == BuyLoss)
                    //                    {         /*-------------------------------------------------------------*/
                    //                              /* BUY PROFITED HUGE && SELL NON PROFITED HUGE [2XX,0x,0yX,4Y] */
                    //                              /*-------------------------------------------------------------*/
                    //                              offer =  1; //permenet
                    //                    }//
                    //                    else if(BuyWin < BuyLoss)//BUY
                    //                    {         /*-------------------------------------------------------------*/
                    //                              /* BUY PROFITED HUGE && SELL NON PROFITED HUGE [2Xx,0x,0yY,4Y] *///[1, 0, 7, 0]
                    //                              /*-------------------------------------------------------------*/
                    //                              offer =  2; //permenet
                    //                    } //
                    //          } //
                    //} //
                    //else if(BuyWin == SellWin)//
                    //{         /*-------------------------------------*/
                    //          /* SELL BUY PROFITED EQUAL [2X,2X,Y,Y] */ //RESET
                    //          /*-------------------------------------*/
                    //          //offer =  1; //permenet
                    //          if(BuyLoss > SellLoss)//fbuy //grater
                    //          {         /*-------------------------------------*/
                    //                    /* BUY NON PROFITED HUGE [2X,2X,4Y,0y] */
                    //                    /*-------------------------------------*/
                    //                    //offer =  2; // permenet
                    //                    if(SellWin > SellLoss)//buy
                    //                    {         /*------------------------------------------------------------------*/
                    //                              /* SELL BUY PROFITED EQUAL && BUY NON PROFITED HUGE [2X,2XX,4Y,0yy] */
                    //                              /*------------------------------------------------------------------*/
                    //                              offer =  2; // permenet
                    //                    }
                    //                    else if(SellWin == SellLoss) //[0, 0, 2, 0] ! WHY FORCED TO BUY [0,0,2,0]
                    //                    {         /*------------------------------------------------------------------*/
                    //                              /* SELL BUY PROFITED EQUAL && BUY NON PROFITED HUGE [2X,2XX,4Y,0yX] */ //[0, 0, 3, 0] VERIFIED
                    //                              /*------------------------------------------------------------------*/
                    //                              offer =  2; // permenet [0,0,2,0] == [0,0,1,0]
                    //                    }
                    //                    else if(SellWin < SellLoss)//sell
                    //                    {         /*------------------------------------------------------------------*/
                    //                              /* SELL BUY PROFITED EQUAL && BUY NON PROFITED HUGE [2X,2Xx,4Y,0yY] */
                    //                              /*------------------------------------------------------------------*/
                    //                              offer =  3; //permenet BUY [0,0,2,1] [0,0,4,1]        [10, 10, 15, 10][10, 10, 8, 1] VVV SENSITIVITY GONE MINOR LOSS
                    //                    } //
                    //          }//
                    //          else if(BuyLoss == SellLoss)//equal RESET
                    //          {         /*-------------------------------------------*/
                    //                    /* BUY sell NON PROFITED EQUAL [2X,2X,4Y,4Y] */
                    //                    /*-------------------------------------------*/
                    //                    //offer =  1; // permenet force bye frist
                    //                    if(BuyWin > BuyLoss)//SELL
                    //                    {         /*------------------------------------------------------------------------*/
                    //                              /* SELL BUY PROFITED EQUAL && BUY sell NON PROFITED EQUAL [2XX,2X,4Yy,4Y] */
                    //                              /*------------------------------------------------------------------------*/
                    //                              offer =  1; // permenet
                    //                    }
                    //                    else if(BuyWin == BuyLoss)
                    //                    {         /*------------------------------------------------------------------------*/
                    //                              /* SELL BUY PROFITED EQUAL && BUY sell NON PROFITED EQUAL [2XX,2X,4YY,4Y] *///RE4SET
                    //                              /*------------------------------------------------------------------------*/
                    //                              offer =  1; //permenet//--start tree node trade
                    //                    }//
                    //                    else if(BuyWin < BuyLoss)//BUY RESET
                    //                    {         /*------------------------------------------------------------------------*/
                    //                              /* SELL BUY PROFITED EQUAL && BUY sell NON PROFITED EQUAL [2Xx,2X,4YY,4Y] */
                    //                              /*------------------------------------------------------------------------*/
                    //                              offer =  2; //permenet RESET [0,0,1,1] [10, 10, 10, 10][10, 10, 1, 1] VVV SENSITIVITY GONE MINOR LOSS
                    //                    } //
                    //          }//
                    //          else if(BuyLoss < SellLoss)//lower  //---BUY WIN MOST //permenet[0, 0, 1, 3][10, 10, 1, 3] WEITH GONE TO BUY
                    //          {         /*--------------------------------------*/
                    //                    /* SELL NON PROFITED HUGE [2X,2X,0y,4Y] */
                    //                    /*--------------------------------------*/
                    //                    //offer =  "OFFER(BUY)"; // permenet
                    //                    if(SellWin > SellLoss)//buy------EXTRA
                    //                    {         /*-------------------------------------------------------------------*/
                    //                              /* SELL BUY PROFITED EQUAL && SELL NON PROFITED HUGE [2X,2XX,0y,4Yy] */
                    //                              /*-------------------------------------------------------------------*/
                    //                              offer =  3; // permenet
                    //                    }
                    //                    else if(SellWin == SellLoss) //[0, 0, 2, 0] ! WHY FORCED TO BUY [0,0,2,0][10, 10, 1, 10]
                    //                    {         /*-------------------------------------------------------------------*/
                    //                              /* SELL BUY PROFITED EQUAL && SELL NON PROFITED HUGE [2X,2XX,0y,4YY] */
                    //                              /*-------------------------------------------------------------------*/
                    //                              offer =  1; // permenet RESETED
                    //                    }
                    //                    else if(SellWin < SellLoss)//sell
                    //                    {         /*-------------------------------------------------------------------*/
                    //                              /* SELL BUY PROFITED EQUAL && SELL NON PROFITED HUGE [2X,2Xx,0y,4YY] */ //[0, 0, 1, 3] //[0, 0, 0, 2] //[0, 0, 0, 2]VERIFIED
                    //                              /*-------------------------------------------------------------------*/
                    //                              offer =  1; //permenet BUY [0, 0, 1, 3] [10, 10, 1, 3] VVV SENSITIVITY GONE MINOR LOSS
                    //                    } //-
                    //          }//
                    //}
                    //else if(BuyWin < SellWin)//WIN SELL zone profited sell grater
                    //{         /*--------------------------------*/
                    //          /* SELL PROFITED HUGE [0x,2X,Y,Y] */
                    //          /*--------------------------------*/
                    //          //offer =  2;
                    //          if(BuyLoss > SellLoss)//sell  loss_trade_buy_grater
                    //          {         /*-------------------------------------*/
                    //                    /* BUY NON PROFITED HUGE [0x,2X,4Y,0y] */
                    //                    /*-------------------------------------*/
                    //                    //offer =  2; //permenet
                    //                    if(SellWin > SellLoss)// [0,4,2,0] [0,3,1,0]  trade_sell_profit_grater_loss
                    //                    {         /*-------------------------------------------------------------*/
                    //                              /* SELL PROFITED HUGE && BUY NON PROFITED HUGE [0x,2XX,4Y,0yy] */
                    //                              /*-------------------------------------------------------------*/
                    //                              offer =  2; // permenet        [5, 26, 25, 20]  [5, 27, 18, 11] ->[0, 22, 13, 6] VVV SENSITIVITY GONE MINOR LOSS
                    //                    }
                    //                    else if(SellWin == SellLoss)
                    //                    {         //
                    //                              /*-------------------------------------------------------------*/
                    //                              /* SELL PROFITED HUGE && BUY NON PROFITED HUGE [0x,2XX,4Y,0yY] */
                    //                              /*-------------------------------------------------------------*/
                    //                              offer =  2; // permenet        [5, 20, 25, 20]  [5, 11, 18, 11] ->[0, 6, 13, 6] VVV SENSITIVITY GONE MINOR LOSS  RESET
                    //                    }
                    //                    else if(SellWin < SellLoss)//sell
                    //                    {         /*-------------------------------------------------------------*/
                    //                              /* SELL PROFITED HUGE && BUY NON PROFITED HUGE [0x,2Xx,4Y,0yY] */
                    //                              /*-------------------------------------------------------------*/
                    //                              offer =  3; //permenet         [5, 15, 25, 20]  [5, 8, 18, 11]  ->[0, 3, 13, 6] VVV SENSITIVITY GONE MINOR LOSS
                    //                    } //
                    //          }
                    //          else if(BuyLoss == SellLoss)//loss_trade_buy_equal
                    //          {         /*-----------------------------------------*/
                    //                    /* BUY sell NON PROFITED EQUAL [0x,2X,Y,Y] */
                    //                    /*-----------------------------------------*/
                    //                    //offer =  2; //
                    //                    if(SellWin > SellLoss)//  trade_sell_profit_grater_loss
                    //                    {         /*-----------------------------------------------------------------*/
                    //                              /* SELL PROFITED HUGE && BUY sell NON PROFITED EQUAL [0x,2XX,Y,Yy] */
                    //                              /*-----------------------------------------------------------------*/
                    //                              offer =  2; // permenet  [1,4,1,1]   [15, 26, 25, 25] ->[0, 4, 0, 0] VVV SENSITIVITY GONE MINOR LOSS
                    //                    }
                    //                    else if(SellWin == SellLoss)
                    //                    {         /*-----------------------------------------------------------------*/
                    //                              /* SELL PROFITED HUGE && BUY sell NON PROFITED EQUAL [0x,2XX,Y,YY] */ //RESET
                    //                              /*-----------------------------------------------------------------*/
                    //                              offer =  2; // permenet              [15, 25, 25, 25] ->[0, 0, 0, 0] VVV SENSITIVITY GONE MINOR LOSS
                    //                    }
                    //                    else if(SellWin < SellLoss)//sell
                    //                    {         /*-----------------------------------------------------------------*/
                    //                              /* SELL PROFITED HUGE && BUY sell NON PROFITED EQUAL [0x,2Xx,Y,YY] */
                    //                              /*-----------------------------------------------------------------*/
                    //                              offer =  3; //permenet                [15, 24, 25, 25] ->[0, 3, 4, 4] VVV SENSITIVITY GONE MINOR LOSS  //--GONE VOID BETHER
                    //                    } //
                    //          }//
                    //          else if(BuyLoss < SellLoss)//  loss_trade_sell_grater
                    //          {         /*--------------------------------------*/
                    //                    /* SELL NON PROFITED HUGE [0x,2X,0y,4Y] */
                    //                    /*--------------------------------------*/
                    //                    //offer =  1; //permenet
                    //                    if(SellWin > SellLoss)//  trade_sell_profit_grater_loss
                    //                    {         /*-----------------------------------------------------------------*/
                    //                              /* SELL PROFITED HUGE && BUY sell NON PROFITED HUGE [0x,2XX,0y,4Yy] */
                    //                              /*-----------------------------------------------------------------*/
                    //                              offer =  2; // permenet  [1,4,1,1]   [15, 26, 25, 25] ->[0, 4, 0, 0] VVV SENSITIVITY GONE MINOR LOSS
                    //                    }
                    //                    else if(SellWin == SellLoss)
                    //                    {         /*-----------------------------------------------------------------*/
                    //                              /* SELL PROFITED HUGE && BUY sell NON PROFITED HUGE [0x,2Xx,0y,4YY] */ //RESET
                    //                              /*-----------------------------------------------------------------*/
                    //                              offer =  3; // permenet              [15, 25, 25, 25] ->[0, 0, 0, 0] VVV SENSITIVITY GONE MINOR LOSS
                    //                    }
                    //                    else if(SellWin < SellLoss)//sell
                    //                    {         /*-----------------------------------------------------------------*/
                    //                              /* SELL PROFITED HUGE && BUY sell NON PROFITED HUGE [0x,2Xx,0y,4YY] */
                    //                              /*-----------------------------------------------------------------*/
                    //                              offer =  3; //permenet                [15, 24, 25, 25] ->[0, 3, 4, 4] VVV SENSITIVITY GONE MINOR LOSS  //--GONE VOID BETHER
                    //                    } //
                    //          } //
                    //} //
          }//
          return offer; //
}//
