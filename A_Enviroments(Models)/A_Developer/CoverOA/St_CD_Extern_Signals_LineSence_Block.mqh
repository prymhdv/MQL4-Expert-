//+------------------------------------------------------------------+
//||   ||||||||||            tDevConductor.mqh                      ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\B_MQL\CoverOT\iEt_ENUMs_.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct Std_LineSence_Block_Data
{
//public:
          int           LineID;
          ushort           p_BuyCount ;
          ushort           p_SellCount ;
          ushort           np_BuyCount ;
          ushort           np_SellCount ;
          //
          Std_LineSence_Block_Data(): LineID(0), p_BuyCount(0) {LineID = 0; p_BuyCount = 0; p_SellCount = 0;  np_BuyCount = 0;  np_SellCount = 0; }
          ~Std_LineSence_Block_Data() {};
          //
};
enum E_Block_Licence {EBlock_VOID = -1,
                      EBlock_StableWIN,
                      EBlock_StableLOSS,
                      EBlock_StableLossMINOR,
                      EBlock_StableLossHALF,
                      EBlock_StableLossMAX,
                      EBlock_StableUNDEFINE,
                      EBlock_Stable,
                      EBlock_UnStable,
                      EBlock_VERIFIED,
                      EBlock_TEST,
                      EBlock_OFFEN, EBlock_HALF,
                      EBlock_UNDEFINE


                      //
                      //
                     }; //UNDEFINE AND OVER 9 SAW
struct Std_LineSence_Block_VTrade_data
{         // Block_VTrade data
          enum E_TradeMode { E_VOID, E_BUY, E_SELL };
          uint                  Vtrade_LineID;
          float                 Vtrade_Profit;
          float                 Vtrade_Lots;
          float                 Vtrade_PriceStart;
          datetime              Vtrade_TimeStart;
          float                 Vtrade_PriceCurr;
          datetime              Vtrade_TimeCurr;
          datetime              Vtrade_TimeDuation;
          bool                  Vtrade_OnTrading;
          E_TradeMode           Vtrade_TradeMode;
          uchar                 Vtrade_OPType;
          E_Block_Licence       Vtrade_Block_Licence;
          //-----------------------------------------
          ushort                Vtrade_p_BuyCount;
          ushort                Vtrade_p_SellCount;
          ushort                Vtrade_np_BuyCount;
          ushort                Vtrade_np_SellCount;    //
          ushort                Vtrade_SawCount;        //
          //------------------------------------------
          E_OFFER_Type          Vtrade_BlockOffer;//
          //------------------------------------------
          float                 Vtrade_Val_ProfitAll;
          float                 Vtrade_Val_ProfitElement;
          //------------------------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class St_LineSence_Block
{

public:
          // constructors
          St_LineSence_Block()
          {         BlockID = gcBlocks++;
                    //LineSence_Block_Data.LineID = 0; LineSence_Block_Data.p_BuyCount = 0; LineSence_Block_Data.p_SellCount = 0;
                    //LineSence_Block_Data.np_BuyCount = 0; LineSence_Block_Data.np_SellCount = 0;
                    /*LineSence_Block_Data = new Std_LineSence_Block_Data();*//*make data by inited value not random*/
                    VTrade_data.Vtrade_Lots = (float)ct_Drive.TDD.st_Size.Curr_Lots; //
                    Is_Auto_Manage = false; //
          };
          St_LineSence_Block(bool _Is_Auto_Manage, int _LineID, uchar _CurrntOP_type, ushort _p_BuyCount, ushort _p_SellCount, ushort _np_BuyCount, ushort _np_SellCount, ushort _SawCount, string _SawText)
          {         BlockID = gcBlocks++;
                    //LineID              = _LineID;
                    CurrntOP_type       = _CurrntOP_type;
                    p_BuyCount   = _p_BuyCount;
                    p_SellCount  = _p_SellCount;
                    np_BuyCount  = _np_BuyCount;
                    np_SellCount = _np_SellCount; //
                    SawCount            = _SawCount;
                    SawText             = _SawText; //
                    Is_Auto_Manage = false; //
          }
          ~St_LineSence_Block() { /*delete LineSence_Block_Data;*/  };
          void Initer(bool b) {Is_Auto_Manage = b; }; //
          //-------------------------------------------------------------------------------------------
          // data structs
          //Std_LineSence_Block_Data *_Ptr_LineSence_Block_Data;
          Std_LineSence_Block_Data  LineSence_Block_Data;
          //----------------------
          //global class blocks count address
          //not logical to set 25000 number !! instate use line number of blocks // int _BlockID,  _LineSence_Blocks[400].SET_INFO(400, __LINE__, OP_VOID, 0, 0, 0, 0, 0, "XL-XW"); //
          static uint            gcBlocks;        //blockCount class understand count of block or block adress
          static uint            gcBlock_Curr;
          static uint            gcBloc_FristCall;
          static uint            gcBloc_FristCall_TickCount;
          static uint            gcBloc_TwiceCall;
          static uint            gcBloc_TwiceCall_TickCount;
          //--------------------------------------------------------------------------------------
          bool          IsVERIFIED_Sell, IsVERIFIED_Buy;
          //--------------------------------------------------------------------------------------
          uint           BlockID;       //--- same as LineID ,blocks address
          uint           LineID;        //---not same as LineID
          uint           LineID_prev;
          bool          IsBlockOnLine, IsBlockOffLine;  //---same as Detected //IsBlockOff;  //private when power of bloc is negative  its never trade more in auto training

          ushort           p_BuyCount,      p_BuyCount__SAVED;
          ushort           p_SellCount,     p_SellCount__SAVED;
          ushort           np_BuyCount,     np_BuyCount__SAVED;
          ushort           np_SellCount,    np_SellCount__SAVED;
          uchar           CurrntOP_type;                                                  //OP_SELL
          string        CommandTesxt;                                                   //"OFFER(SELL)"
          // Block_Superviser saw data
          ushort           TryVoidCount;
          ushort           SawCount,               SawCount__SAVED, RepeatCount; //---same as SawCount count how much runed
          string        SawText;
          // Block_Activation data
          ulong         Block_Spot_Count;
          datetime      Block_Spot_Duration;
          datetime      Block_Spot_Time;
          float         Block_Spot_Price;
          // Block_Trade data
          float        BlockPower,  BlockPowerSell, BlockPowerBuy;     //+ buy,  - sell   //posetive mean buy  // negativ mean sell
          float        LinePower,   LinePowerSell, LinePowerBuy;     //+ buy,  - sell   //posetive mean buy  // negativ mean sell
          bool          Detected,  ActivationBuy, ActivationSell; // = false; IsSell IsBuy//
          //string        BlockOffer;
          E_OFFER_Type  BlockOffer;
          // Block_Learn data
          float         LearningRate;
          // Block_VTrade data
          Std_LineSence_Block_VTrade_data VTrade_data;
          E_OFFER_Type  VTrade_data_Vtrade_BlockOffer; //--cant add string for binary call of file
          bool         Is_Auto_Manage;
          //----------------------------------------- EVERY BLOCK CALL SET INFO FOR CATCHING OFFER
          void          SET_INFO( St_LineSence_Block &LineSence_Block[], const int _LineID, const uchar _CurrntOP_type, ushort _p_BuyCount, ushort _p_SellCount, ushort _np_BuyCount, ushort _np_SellCount, ushort _SawCount, const string _SawText, const E_Block_Licence Block_Licence)
          {         /***************/
                    // out is offer
                    /****************/
                    //******************************
                    //  SET INPUT SPARSE ARRAY FROM  LineSence_Block[X].VTrade_data
                    //******************************
                    if(Is_Auto_Manage)
                    {         _p_BuyCount         = LineSence_Block[_LineID].VTrade_data.Vtrade_p_BuyCount;
                              _p_SellCount        = LineSence_Block[_LineID].VTrade_data.Vtrade_p_SellCount;
                              _np_BuyCount        = LineSence_Block[_LineID].VTrade_data.Vtrade_np_BuyCount;
                              _np_SellCount       = LineSence_Block[_LineID].VTrade_data.Vtrade_np_SellCount;
                              _SawCount           = LineSence_Block[_LineID].VTrade_data.Vtrade_SawCount;         //
                    }
                    //------------------------------------- DEFINE VARIABLE ASSAGNMENT
                    LineID              = LineSence_Block_Data.LineID                   = _LineID;
                    gcBlock_Curr        = _LineID;
                    CurrntOP_type       = _CurrntOP_type;
                    p_BuyCount   = LineSence_Block_Data.p_BuyCount        = _p_BuyCount;
                    p_SellCount  = LineSence_Block_Data.p_SellCount       = _p_SellCount;
                    np_BuyCount  = LineSence_Block_Data.np_BuyCount       = _np_BuyCount;
                    np_SellCount = LineSence_Block_Data.np_SellCount      = _np_SellCount; //
                    SawCount            = _SawCount;
                    SawText             = _SawText; //
                    //
                    VTrade_data.Vtrade_OPType        = _CurrntOP_type;
                    VTrade_data.Vtrade_Block_Licence = Block_Licence;
                    //---!Block_Activation_Spot_Count++; //all prvius block incrise
                    //--------------------------------
                    IsVERIFIED_Sell = _p_SellCount >= _SawCount;
                    IsVERIFIED_Buy  = _p_BuyCount  >= _SawCount;
                    //--------------------------------
                    GetCurrBlock(LineSence_Block);
                    OptimizeOFFER(/*LineSence_Block,*/ Block_Licence, "A", BlockOffer); ///---#1 global
                    //--------------------------------
                    //static curr_block =0;
                    //curr_block=_LineID-curr_block; //random line not correct !
                    //------------------------------------------------------------------  Comment data base trainer //----ERRORRED TURNED OFF
                    if(false )//&& _CurrntOP_type == OP_VOID && TryVoidCount < 11
                    {         TryVoidCount++;
                              p_BuyCount         =  p_BuyCounter();/*from comments*/
                              p_SellCount        =  p_SellCounter();
                              np_BuyCount        =  np_BuyCounter();
                              np_SellCount       =  np_SellCounter();
                              SawCount           =  SAWCounter();//
                              OptimizeOFFER(/*LineSence_Block,*/ Block_Licence, "B", BlockOffer); //---opt by calced values   ///---#2 JUST COMMENT AUTO
                    }
                    //------------------------------------------------------------------ OFFER OPT BY DATA LEARNED VTRADE  programig trainer
                    if(!Is_Auto_Manage && _CurrntOP_type == OP_MANUEL)
                    {         p_BuyCount         =  _p_BuyCount;
                              p_SellCount        =  _p_SellCount;
                              np_BuyCount        =  _np_BuyCount;
                              np_SellCount       =  _np_SellCount;
                              SawCount           =  _SawCount;
                              OptimizeOFFER(/*LineSence_Block,*/ Block_Licence, "D", BlockOffer); ///---#4
                              //
                    }
                    //------------------------------------------------------------------ OFFER OPT BY DATA LEARNED VTRADE  self training
                    if(false && VTrade_data.Vtrade_OnTrading)
                    {         p_BuyCount         =  VTrade_data.Vtrade_p_BuyCount;
                              p_SellCount        =  VTrade_data.Vtrade_p_SellCount;
                              np_BuyCount        =  VTrade_data.Vtrade_np_BuyCount;
                              np_SellCount       =  VTrade_data.Vtrade_np_SellCount;
                              SawCount           =  VTrade_data.Vtrade_SawCount;
                              OptimizeOFFER(/*LineSence_Block,*/ Block_Licence, "C", BlockOffer); ///---#3  JUST VTRADE
                              //
                    }
                    if(!Is_Auto_Manage && _CurrntOP_type == OP_Tree)
                    {         p_BuyCount        = LineSence_Block[_LineID].VTrade_data.Vtrade_p_BuyCount      = _p_BuyCount;
                              p_SellCount       = LineSence_Block[_LineID].VTrade_data.Vtrade_p_SellCount     = _p_SellCount;
                              np_BuyCount       = LineSence_Block[_LineID].VTrade_data.Vtrade_np_BuyCount     = _np_BuyCount;
                              np_SellCount      = LineSence_Block[_LineID].VTrade_data.Vtrade_np_SellCount    = _np_SellCount;
                              SawCount          = LineSence_Block[_LineID].VTrade_data.Vtrade_SawCount        = _SawCount; //
                              OptimizeOFFER(/*LineSence_Block,*/ Block_Licence, "E", LineSence_Block[_LineID].VTrade_data.Vtrade_BlockOffer); ///---#4
                    }
                    //--------------------------------
                    //--- Whitch Active of Oprating
                    {         if(SawCount > 5 && p_BuyCount > SawCount / 2)        {ActivationSell = true; ActivationBuy = false;}
                              else if(SawCount > 5 && p_SellCount > SawCount / 2)  {ActivationBuy = true;  ActivationSell = false;}//
                              else {ActivationBuy = ActivationSell = false;} //
                    }
                    //--------------------------------
          }//

          //*****************************************************************************************************************************************************************
          void ResetVtrade(St_LineSence_Block &LineSence_Block[])
          {         //LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_LineID               = -1;
                    LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_OnTrading              = false;//
                    LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_TimeStart              = -1;//
                    LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_PriceStart             = -1;//
                    LineSence_Block[gcBlock_Curr].Detected                                  = false;//
                    LineSence_Block[gcBlock_Curr].Block_Spot_Duration                       = -1;
                    LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_TimeDuation            = -1;
                    LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_Profit                 = 0;//
                    LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_TradeMode              = E_VOID;
                    //LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_SawCount             = 0; //
          }
          //*****************************************************************************************************************************************************************
          void          GetCurrBlock(St_LineSence_Block &LineSence_Block[])
          {         //
                    for(int i = 0; i < ArraySize(LineSence_Block); i++)
                    {         LineSence_Block[i].Detected = false;//  all blocks off before
                              //LineSence_Block[i].Vtrade_TimeStart = 0;//
                              //LineSence_Block[i].Vtrade_PriceStart = 0;//
                    }
                    LineSence_Block[gcBlock_Curr].Detected = true;// befor every block line call  active
                    //
          }
          //*****************************************************************************************************************************************************************
          //--call on timer after spoted block
          static void Update_VirtualTrade(St_LineSence_Block &LineSence_Block[], float &ref_ProfitTotal, float &ref_BlocksProfitTotalCurr) ///gcBlock is stable
          {         //--------------------------
                    /* force to trade virtual */  // when block active Command Trade
                    //--------------------------
                    {         //-------------------------------------
                              /* Starter [Vtrade_OnTrading] Set Params*/ /* time and price and spot */
                              //-------------------------------------
                              if( LineSence_Block[gcBlock_Curr].Detected && !LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_OnTrading /*&& IsTargetConjection*/) // befor every block line call  active
                              {         LineSence_Block[gcBlock_Curr].Block_Spot_Time             = TimeLocal(); //
                                        LineSence_Block[gcBlock_Curr].Block_Spot_Price            = (float)Ask; //;
                                        LineSence_Block[gcBlock_Curr].Block_Spot_Duration         = 0;
                                        LineSence_Block[gcBlock_Curr].Block_Spot_Count++;     //all prvius block not incrise
                                        //
                                        LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_OnTrading          = true;//
                                        LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_TimeStart          = TimeLocal();//
                                        LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_PriceStart         = (float)Ask;//
                                        LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_TimeDuation        = 0;
                                        LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_Profit             = 0;//
                                        //
                                        LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_Lots               = (float)ct_Drive.TDD.st_Size.Curr_Lots;
                                        LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_LineID             = LineSence_Block[gcBlock_Curr].LineID;//
                                        LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_SawCount++;
                                        //
                                        if(LineSence_Block[gcBlock_Curr].VTrade_data_Vtrade_BlockOffer == E_OFFER_BUY)          { LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_TradeMode = E_BUY; }
                                        else if(LineSence_Block[gcBlock_Curr].VTrade_data_Vtrade_BlockOffer == E_OFFER_SELL)    { LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_TradeMode = E_SELL; }
                                        else                                                                                    { LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_TradeMode = E_VOID; } //
                              } //
                              //----------------------------------------------------
                              /*when on trade*/ /* as time tick tack block Vtrade */ // LOGICAL ERROR  LineSence_Block[gcBlock_Curr].Block_Activation_Time != TimeLocal() &&
                              //----------------------------------------------------
                              for(int i = 0; i < ArraySize(LineSence_Block); i++)
                              {         if(LineSence_Block[i].VTrade_data.Vtrade_OnTrading)
                                        {         LineSence_Block[i].Block_Spot_Duration                      =  TimeLocal() - LineSence_Block[i].Block_Spot_Time;//  repative var
                                                  LineSence_Block[i].VTrade_data.Vtrade_TimeDuation           =  TimeLocal() - LineSence_Block[i].VTrade_data.Vtrade_TimeStart;//
                                                  LineSence_Block[i].VTrade_data.Vtrade_TimeCurr              =  TimeLocal();//
                                                  LineSence_Block[i].VTrade_data.Vtrade_PriceCurr             =  (float)Ask;//
                                                  //-------------------------------------
                                                  /*net profit of block [gcBlock_Curr] */ //--sellbuy calc diff  //---when no trade
                                                  //-------------------------------------
                                                  {         if(LineSence_Block[i].VTrade_data.Vtrade_TradeMode == E_BUY)              { LineSence_Block[i].VTrade_data.Vtrade_Profit = (float)(  (LineSence_Block[i].VTrade_data.Vtrade_PriceCurr - LineSence_Block[i].VTrade_data.Vtrade_PriceStart) - (Ask - Bid)) * LineSence_Block[i].VTrade_data.Vtrade_Lots * 130; }
                                                            else if(LineSence_Block[i].VTrade_data.Vtrade_TradeMode == E_SELL) /*ok*/ { LineSence_Block[i].VTrade_data.Vtrade_Profit = (float)( -(LineSence_Block[i].VTrade_data.Vtrade_PriceCurr - LineSence_Block[i].VTrade_data.Vtrade_PriceStart) - (Ask - Bid)) * LineSence_Block[i].VTrade_data.Vtrade_Lots * 130; }
                                                            else                                                                      { /*LineSence_Block[i].ResetVtrade(LineSence_Block);*/ }//--some error
                                                            LineSence_Block[i].VTrade_data.Vtrade_Profit = (float)NormalizeDouble(LineSence_Block[i].VTrade_data.Vtrade_Profit, Digits); //(LineSence_Block[i].VTrade_data.Vtrade_PriceStart - LineSence_Block[i].VTrade_data.Vtrade_PriceCurr)!! reverseal
                                                  }//
                                        }//--else error because next is dissturbute data
                              } //
                    } //
                    // when profited LineSence_Block[gcBlock_Curr]-- turn off block vtrde //--when any block vtrade active and  profite range detected  turn of
                    //-----------------------
                    /* cheack end of trade */
                    //-----------------------
                    for(int i = 0; i < ArraySize(LineSence_Block); i++)
                    {         //
                              ref_ProfitTotal                                       = LineSence_Block[0].VTrade_data.Vtrade_Val_ProfitAll; //remember what stored file at element zero
                              //
                              if(LineSence_Block[i].VTrade_data.Vtrade_OnTrading)
                              {         //Print("LineSence_Block[" + (string)i + "].VTrade_data.Vtrade_Profit: ", LineSence_Block[i].VTrade_data.Vtrade_Profit);
                                        //Print("LineSence_Block[" + (string)i + "].VTrade_data.Vtrade_PriceCurr: ", LineSence_Block[i].VTrade_data.Vtrade_PriceCurr);
                                        //Print("LineSence_Block[" + (string)i + "].VTrade_data.Vtrade_PriceStart: ", LineSence_Block[i].VTrade_data.Vtrade_PriceStart);
                                        //--------------------------------------------------------------------------------
                                        //ref_ProfitTotal                                      += LineSence_Block[i].VTrade_data.Vtrade_Profit; //  at printing sum buy all like tree
                                        //LineSence_Block[i].VTrade_data.Vtrade_Val_ProfitAll   = ref_ProfitTotal;//                            //  at printing sum buy all like tree
                                        ref_BlocksProfitTotalCurr += LineSence_Block[i].VTrade_data.Vtrade_Profit;
                                        //
                                        //
                                        //--------------------------------------------------------------------------------
                                        if(LineSence_Block[i].VTrade_data.Vtrade_Profit > INP_Vtrade_Profit)//--when win
                                        {         //---end vtrade
                                                  if(LineSence_Block[i].VTrade_data.Vtrade_TradeMode == E_BUY)         { LineSence_Block[i].VTrade_data.Vtrade_p_BuyCount++; }
                                                  else if(LineSence_Block[i].VTrade_data.Vtrade_TradeMode == E_SELL)   { LineSence_Block[i].VTrade_data.Vtrade_p_SellCount++; } //
                                                  else                                                                 {Print("LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_Profit > 4");} //
                                                  //---------------------------------
                                                  //00ref_ProfitTotal                                       = LineSence_Block[0].VTrade_data.Vtrade_Val_ProfitAll; //remember what stored file
                                                  ref_ProfitTotal                                         += LineSence_Block[i].VTrade_data.Vtrade_Profit;  // its posetive value
                                                  LineSence_Block[0].VTrade_data.Vtrade_Val_ProfitAll      = ref_ProfitTotal;//
                                                  LineSence_Block[i].VTrade_data.Vtrade_Val_ProfitElement += LineSence_Block[i].VTrade_data.Vtrade_Profit;
                                                  //---------------------------------
                                                  //LineSence_Block[i].VTrade_data.Vtrade_LineID        = -1;
                                                  LineSence_Block[i].VTrade_data.Vtrade_OnTrading       = false;//
                                                  LineSence_Block[i].VTrade_data.Vtrade_TimeStart       = -1;//
                                                  LineSence_Block[i].VTrade_data.Vtrade_PriceStart      = -1;//
                                                  /*error*///LineSence_Block[i].Detected                = false;//
                                                  LineSence_Block[i].Block_Spot_Duration                = 0;
                                                  LineSence_Block[i].VTrade_data.Vtrade_TimeDuation     = -1;
                                                  LineSence_Block[i].VTrade_data.Vtrade_Profit          = 0;//
                                                  LineSence_Block[i].VTrade_data.Vtrade_TradeMode       = E_VOID;
                                                  //LineSence_Block[i].VTrade_data.Vtrade_SawCount      = 0; //
                                                  //---------------------------------
                                        } //
                                        else if(LineSence_Block[i].VTrade_data.Vtrade_Profit < -INP_Vtrade_Profit)//--when loss
                                        {         //---end vtrade
                                                  if(LineSence_Block[i].VTrade_data.Vtrade_TradeMode == E_BUY)         { LineSence_Block[i].VTrade_data.Vtrade_np_BuyCount++;}
                                                  else if(LineSence_Block[i].VTrade_data.Vtrade_TradeMode == E_SELL)   { LineSence_Block[i].VTrade_data.Vtrade_np_SellCount++;}//
                                                  else                                                                 {Print("LineSence_Block[gcBlock_Curr].VTrade_data.Vtrade_Profit < -4");} //
                                                  //----------------------------------
                                                  //00ref_ProfitTotal                                       = LineSence_Block[0].VTrade_data.Vtrade_Val_ProfitAll; //remember what stored file
                                                  ref_ProfitTotal                                               += LineSence_Block[i].VTrade_data.Vtrade_Profit; // its negative value
                                                  LineSence_Block[0].VTrade_data.Vtrade_Val_ProfitAll            = ref_ProfitTotal; //
                                                  LineSence_Block[i].VTrade_data.Vtrade_Val_ProfitElement       += LineSence_Block[i].VTrade_data.Vtrade_Profit;
                                                  //----------------------------------
                                                  //LineSence_Block[i].VTrade_data.Vtrade_LineID        = -1;
                                                  LineSence_Block[i].VTrade_data.Vtrade_OnTrading       = false;//
                                                  LineSence_Block[i].VTrade_data.Vtrade_TimeStart       = -1;//
                                                  LineSence_Block[i].VTrade_data.Vtrade_PriceStart      = -1;//
                                                  /*error*///LineSence_Block[i].Detected                = false;//
                                                  LineSence_Block[i].Block_Spot_Duration                = -1;
                                                  LineSence_Block[i].VTrade_data.Vtrade_Profit          = 0;//
                                                  LineSence_Block[i].VTrade_data.Vtrade_TradeMode       = E_VOID;
                                                  //LineSence_Block[i].VTrade_data.Vtrade_SawCount      = 0; //
                                                  //----------------------------------
                                        } //
                              } //
                    } //
          }
          //*****************************************************************************************************************************************************************
          void        OptimizeOFFER(/*const St_LineSence_Block &LineSence_Block[],*/ const E_Block_Licence Block_Licence, string place, E_OFFER_Type  &_BlockOffer)
          {
                    {         //LinePower = ((p_BuyCount - np_BuyCount) / 2) + ((p_SellCount - np_SellCount) / 2)  ; //
                              //LinePower = ((p_BuyCount + p_SellCount) / 2) - ((np_BuyCount - np_SellCount) / 2)  ; //
                              //return p_BuyCount > p_SellCount  ?  "OFFER(BUY)" : "OFFER(SELL)"; //
                              //return np_BuyCount > np_SellCount ? "OFFER(SELL)" : "OFFER(BUY)"; //
                              //
                              //return (p_BuyCount > p_SellCount) || (np_BuyCount < np_SellCount)  ?  "OFFER(BUY)" : "OFFER(SELL)"; //
                              //return CommandTesxt = LinePower > 0 ? "OFFER(BUY)" : "OFFER(SELL)"; //
                    }
                    //---input=> static line data
                    {         //-----------------------------------------------reset properties
                              BlockOffer                    = E_OFFER_VOID;//"OFFER(VOID)";
                              VTrade_data_Vtrade_BlockOffer = E_OFFER_VOID;//"OFFER(VOID)";//
                              ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_Offer      = "OFFER(VOID)";
                              ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Enum_BlockOffer = E_OFFER_VOID;
                              /*-----------------------------------------------------------------*/
                              /* CALC BUY SELL PROFITED NON PROFITED SENSITIVITY GONE MINOR LOSS */
                              /*-----------------------------------------------------------------*/
                              {         if(p_BuyCount > p_SellCount)// zone profit buy
                                        {         /*-------------------------------*/
                                                  /* BUY PROFITED HUGE [2X,0x,Y,Y] */
                                                  /*-------------------------------*/
                                                  BlockOffer =  E_OFFER_BUY; //permenet
                                                  if(np_BuyCount > np_SellCount)//zone loss_buy grater=>make sell
                                                  {         /*-------------------------------------*/
                                                            /* BUY NON PROFITED HUGE [2X,0x,4Y,0y] */
                                                            /*-------------------------------------*/
                                                            //  BlockOffer =  "OFFER(SELL)"; // permenet
                                                            if(p_BuyCount > np_BuyCount)//SELL   [4,0,1,0]   //----PRIORITY BY BURNED SELL    // victory sell
                                                            {         /*-----------------------------------------------------------*/
                                                                      /* BUY PROFITED HUGE && BUY NON PROFITED HUGE [2XX,0x,4Yy,0y] */
                                                                      /*-----------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_BUY; // permenet  [2,0,1,0] -> BUY //"OFFER(BUY)"
                                                            }
                                                            else if(p_BuyCount == np_BuyCount)
                                                            {         /*------------------------------------------------------------*/
                                                                      /* BUY PROFITED HUGE && BUY NON PROFITED HUGE [2XX,0x,4YY,0y] */
                                                                      /*------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_BUY; //permenet   [2,0,2,0] -> SELL SECOUND CHANCE GONE SELL
                                                            }//
                                                            else if(p_BuyCount < np_BuyCount)//BUY
                                                            {         /*------------------------------------------------------------*/
                                                                      /* BUY PROFITED HUGE && BUY NON PROFITED HUGE [2Xx,0x,4YY,0y] */
                                                                      /*------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_VOID; //permenet  [2,0,3,0] -> SELL
                                                            } //
                                                  }
                                                  else if(np_BuyCount == np_SellCount)
                                                  {         /*-------------------------------------------*/
                                                            /* BUY sell NON PROFITED EQUAL [2X,0x,4Y,4Y] */
                                                            /*-------------------------------------------*/
                                                            //BlockOffer =  "OFFER(BUY)"; //
                                                            if(p_BuyCount > np_BuyCount)//  [1,0,0,0] [3,1,2,2]  //SELL      //----PRIORITY BY BURNED SELL    // victory sell
                                                            {         /*-----------------------------------------------------------------*/
                                                                      /* BUY PROFITED HUGE && BUY sell NON PROFITED EQUAL [2XX,0x,4Yy,4Y] */
                                                                      /*-----------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_BUY; // permenet [2, 0, 0, 0]
                                                            }
                                                            else if(p_BuyCount == np_BuyCount)
                                                            {         /*------------------------------------------------------------------*/
                                                                      /* BUY PROFITED HUGE && BUY sell NON PROFITED EQUAL [2XX,0x,4YY,4Y] */
                                                                      /*------------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_BUY; //permenet
                                                            }//
                                                            else if(p_BuyCount < np_BuyCount)//BUY
                                                            {         /*------------------------------------------------------------------*/
                                                                      /* BUY PROFITED HUGE && BUY sell NON PROFITED EQUAL [2Xx,0x,4YY,4Y] */
                                                                      /*------------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_VOID; //permenet
                                                            } //
                                                  }//
                                                  else if(np_BuyCount < np_SellCount)///zone loss_sell grater =>make buy
                                                  {         /*--------------------------------------*/
                                                            /* SELL NON PROFITED HUGE [2X,0x,0y,4Y] */
                                                            /*--------------------------------------*/
                                                            //BlockOffer =  "OFFER(BUY)"; // permenet
                                                            if(p_BuyCount > np_BuyCount)//SELL      //----PRIORITY BY BURNED SELL    // victory sell
                                                            {         /*-------------------------------------------------------------*/
                                                                      /* BUY PROFITED HUGE && SELL NON PROFITED HUGE [2XX,0x,0yy,4Y] */
                                                                      /*-------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_BUY; // permenet //[1, 0, 0, 4]
                                                            }
                                                            else if(p_BuyCount == np_BuyCount)
                                                            {         /*-------------------------------------------------------------*/
                                                                      /* BUY PROFITED HUGE && SELL NON PROFITED HUGE [2XX,0x,0yX,4Y] */
                                                                      /*-------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_BUY; //permenet
                                                            }//
                                                            else if(p_BuyCount < np_BuyCount)//BUY
                                                            {         /*-------------------------------------------------------------*/
                                                                      /* BUY PROFITED HUGE && SELL NON PROFITED HUGE [2Xx,0x,0yY,4Y] *///[1, 0, 7, 0]
                                                                      /*-------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_VOID; //permenet
                                                            } //
                                                  } //
                                        } //
                                        else if(p_BuyCount == p_SellCount)//
                                        {         /*-------------------------------------*/
                                                  /* SELL BUY PROFITED EQUAL [2X,2X,Y,Y] */ //RESET
                                                  /*-------------------------------------*/
                                                  BlockOffer =  E_OFFER_BUY; //permenet
                                                  if(np_BuyCount > np_SellCount)//fbuy //grater
                                                  {         /*-------------------------------------*/
                                                            /* BUY NON PROFITED HUGE [2X,2X,4Y,0y] */
                                                            /*-------------------------------------*/
                                                            BlockOffer =  E_OFFER_SELL; // permenet
                                                            if(p_SellCount > np_SellCount)//buy
                                                            {         /*------------------------------------------------------------------*/
                                                                      /* SELL BUY PROFITED EQUAL && BUY NON PROFITED HUGE [2X,2XX,4Y,0yy] */
                                                                      /*------------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_SELL; // permenet
                                                            }
                                                            else if(p_SellCount == np_SellCount) //[0, 0, 2, 0] ! WHY FORCED TO BUY [0,0,2,0]
                                                            {         /*------------------------------------------------------------------*/
                                                                      /* SELL BUY PROFITED EQUAL && BUY NON PROFITED HUGE [2X,2XX,4Y,0yX] */ //[0, 0, 3, 0] VERIFIED
                                                                      /*------------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_SELL; // permenet [0,0,2,0] == [0,0,1,0]
                                                            }
                                                            else if(p_SellCount < np_SellCount)//sell
                                                            {         /*------------------------------------------------------------------*/
                                                                      /* SELL BUY PROFITED EQUAL && BUY NON PROFITED HUGE [2X,2Xx,4Y,0yY] */
                                                                      /*------------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_VOID; //permenet BUY [0,0,2,1] [0,0,4,1]        [10, 10, 15, 10][10, 10, 8, 1] VVV SENSITIVITY GONE MINOR LOSS
                                                            } //
                                                  }//
                                                  else if(np_BuyCount == np_SellCount)//equal RESET
                                                  {         /*-------------------------------------------*/
                                                            /* BUY sell NON PROFITED EQUAL [2X,2X,4Y,4Y] */
                                                            /*-------------------------------------------*/
                                                            BlockOffer =  E_OFFER_BUY; // permenet force bye frist
                                                            if(p_BuyCount > np_BuyCount)//SELL
                                                            {         /*------------------------------------------------------------------------*/
                                                                      /* SELL BUY PROFITED EQUAL && BUY sell NON PROFITED EQUAL [2XX,2X,4Yy,4Y] */
                                                                      /*------------------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_BUY; // permenet
                                                            }
                                                            else if(p_BuyCount == np_BuyCount)
                                                            {         /*------------------------------------------------------------------------*/
                                                                      /* SELL BUY PROFITED EQUAL && BUY sell NON PROFITED EQUAL [2XX,2X,4YY,4Y] *///RE4SET
                                                                      /*------------------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_BUY; //permenet
                                                            }//
                                                            else if(p_BuyCount < np_BuyCount)//BUY RESET
                                                            {         /*------------------------------------------------------------------------*/
                                                                      /* SELL BUY PROFITED EQUAL && BUY sell NON PROFITED EQUAL [2Xx,2X,4YY,4Y] */
                                                                      /*------------------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_SELL; //permenet RESET [0,0,1,1] [10, 10, 10, 10][10, 10, 1, 1] VVV SENSITIVITY GONE MINOR LOSS
                                                            } //
                                                  }//
                                                  else if(np_BuyCount < np_SellCount)//lower  //---BUY WIN MOST //permenet[0, 0, 1, 3][10, 10, 1, 3] WEITH GONE TO BUY
                                                  {         /*--------------------------------------*/
                                                            /* SELL NON PROFITED HUGE [2X,2X,0y,4Y] */
                                                            /*--------------------------------------*/
                                                            //BlockOffer =  "OFFER(BUY)"; // permenet
                                                            if(p_SellCount > np_SellCount)//buy------EXTRA
                                                            {         /*-------------------------------------------------------------------*/
                                                                      /* SELL BUY PROFITED EQUAL && SELL NON PROFITED HUGE [2X,2XX,0y,4Yy] */
                                                                      /*-------------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_VOID; // permenet
                                                            }
                                                            else if(p_SellCount == np_SellCount) //[0, 0, 2, 0] ! WHY FORCED TO BUY [0,0,2,0][10, 10, 1, 10]
                                                            {         /*-------------------------------------------------------------------*/
                                                                      /* SELL BUY PROFITED EQUAL && SELL NON PROFITED HUGE [2X,2XX,0y,4YY] */
                                                                      /*-------------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_BUY; // permenet RESETED
                                                            }
                                                            else if(p_SellCount < np_SellCount)//sell
                                                            {         /*-------------------------------------------------------------------*/
                                                                      /* SELL BUY PROFITED EQUAL && SELL NON PROFITED HUGE [2X,2Xx,0y,4YY] */ //[0, 0, 1, 3] //[0, 0, 0, 2] //[0, 0, 0, 2]VERIFIED
                                                                      /*-------------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_BUY; //permenet BUY [0, 0, 1, 3] [10, 10, 1, 3] VVV SENSITIVITY GONE MINOR LOSS
                                                            } //-
                                                  }//
                                        }
                                        else if(p_BuyCount < p_SellCount)//WIN SELL zone profited sell grater
                                        {         /*--------------------------------*/
                                                  /* SELL PROFITED HUGE [0x,2X,Y,Y] */
                                                  /*--------------------------------*/
                                                  BlockOffer =  E_OFFER_SELL;
                                                  if(np_BuyCount > np_SellCount)//sell  loss_trade_buy_grater
                                                  {         /*-------------------------------------*/
                                                            /* BUY NON PROFITED HUGE [0x,2X,4Y,0y] */
                                                            /*-------------------------------------*/
                                                            BlockOffer =  E_OFFER_SELL; //permenet
                                                            if(p_SellCount > np_SellCount)// [0,4,2,0] [0,3,1,0]  trade_sell_profit_grater_loss
                                                            {         /*-------------------------------------------------------------*/
                                                                      /* SELL PROFITED HUGE && BUY NON PROFITED HUGE [0x,2XX,4Y,0yy] */
                                                                      /*-------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_SELL; // permenet        [5, 26, 25, 20]  [5, 27, 18, 11] ->[0, 22, 13, 6] VVV SENSITIVITY GONE MINOR LOSS
                                                            }
                                                            else if(p_SellCount == np_SellCount)
                                                            {         //
                                                                      /*-------------------------------------------------------------*/
                                                                      /* SELL PROFITED HUGE && BUY NON PROFITED HUGE [0x,2XX,4Y,0yY] */
                                                                      /*-------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_SELL; // permenet        [5, 20, 25, 20]  [5, 11, 18, 11] ->[0, 6, 13, 6] VVV SENSITIVITY GONE MINOR LOSS  RESET
                                                            }
                                                            else if(p_SellCount < np_SellCount)//sell
                                                            {         /*-------------------------------------------------------------*/
                                                                      /* SELL PROFITED HUGE && BUY NON PROFITED HUGE [0x,2Xx,4Y,0yY] */
                                                                      /*-------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_VOID; //permenet         [5, 15, 25, 20]  [5, 8, 18, 11]  ->[0, 3, 13, 6] VVV SENSITIVITY GONE MINOR LOSS
                                                            } //
                                                  }
                                                  else if(np_BuyCount == np_SellCount)//loss_trade_buy_equal
                                                  {         /*-----------------------------------------*/
                                                            /* BUY sell NON PROFITED EQUAL [0x,2X,Y,Y] */
                                                            /*-----------------------------------------*/
                                                            BlockOffer =  E_OFFER_SELL; //
                                                            if(p_SellCount > np_SellCount)//  trade_sell_profit_grater_loss
                                                            {         /*-----------------------------------------------------------------*/
                                                                      /* SELL PROFITED HUGE && BUY sell NON PROFITED EQUAL [0x,2XX,Y,Yy] */
                                                                      /*-----------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_SELL; // permenet  [1,4,1,1]   [15, 26, 25, 25] ->[0, 4, 0, 0] VVV SENSITIVITY GONE MINOR LOSS
                                                            }
                                                            else if(p_SellCount == np_SellCount)
                                                            {         /*-----------------------------------------------------------------*/
                                                                      /* SELL PROFITED HUGE && BUY sell NON PROFITED EQUAL [0x,2XX,Y,YY] */ //RESET
                                                                      /*-----------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_SELL; // permenet              [15, 25, 25, 25] ->[0, 0, 0, 0] VVV SENSITIVITY GONE MINOR LOSS
                                                            }
                                                            else if(p_SellCount < np_SellCount)//sell
                                                            {         /*-----------------------------------------------------------------*/
                                                                      /* SELL PROFITED HUGE && BUY sell NON PROFITED EQUAL [0x,2Xx,Y,YY] */
                                                                      /*-----------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_VOID; //permenet                [15, 24, 25, 25] ->[0, 3, 4, 4] VVV SENSITIVITY GONE MINOR LOSS  //--GONE VOID BETHER
                                                            } //
                                                  }//
                                                  else if(np_BuyCount < np_SellCount)//  loss_trade_sell_grater
                                                  {         /*--------------------------------------*/
                                                            /* SELL NON PROFITED HUGE [0x,2X,0y,4Y] */
                                                            /*--------------------------------------*/
                                                            BlockOffer =  E_OFFER_BUY; //permenet
                                                            if(p_SellCount > np_SellCount)//  trade_sell_profit_grater_loss
                                                            {         /*-----------------------------------------------------------------*/
                                                                      /* SELL PROFITED HUGE && BUY sell NON PROFITED HUGE [0x,2XX,0y,4Yy] */
                                                                      /*-----------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_SELL; // permenet  [1,4,1,1]   [15, 26, 25, 25] ->[0, 4, 0, 0] VVV SENSITIVITY GONE MINOR LOSS
                                                            }
                                                            else if(p_SellCount == np_SellCount)
                                                            {         /*-----------------------------------------------------------------*/
                                                                      /* SELL PROFITED HUGE && BUY sell NON PROFITED HUGE [0x,2Xx,0y,4YY] */ //RESET
                                                                      /*-----------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_VOID; // permenet              [15, 25, 25, 25] ->[0, 0, 0, 0] VVV SENSITIVITY GONE MINOR LOSS
                                                            }
                                                            else if(p_SellCount < np_SellCount)//sell
                                                            {         /*-----------------------------------------------------------------*/
                                                                      /* SELL PROFITED HUGE && BUY sell NON PROFITED HUGE [0x,2Xx,0y,4YY] */
                                                                      /*-----------------------------------------------------------------*/
                                                                      BlockOffer =  E_OFFER_VOID; //permenet                [15, 24, 25, 25] ->[0, 3, 4, 4] VVV SENSITIVITY GONE MINOR LOSS  //--GONE VOID BETHER
                                                            } //
                                                  } //
                                        } //
                                        _BlockOffer = VTrade_data_Vtrade_BlockOffer = BlockOffer; //
                              }//
                              //Sleep(0);
                              //-----------------------------------------------------------------------------------------------------------------------OUT CHANGE OF FUNCTION
                              string whenVerified = "";
                              if(VTrade_data.Vtrade_Val_ProfitElement > 10)
                              {         ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_Offer      = EnumToString(BlockOffer);
                                        ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Enum_BlockOffer = BlockOffer;//
                                        //
                                        //
                                        if(!Is_Auto_Manage)
                                        {         if( Block_Licence == EBlock_StableWIN)                                               {ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_Offer = EnumToString(BlockOffer); ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Enum_BlockOffer = BlockOffer;;}
                                                  else  /* Block_Licence == EBlock_VERIFIED || Block_Licence == EBlock_Stable || */    {ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_Offer = EnumToString(BlockOffer); ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Enum_BlockOffer = E_OFFER_VOID;} //--!!WHY NOT WORK
                                                  if(Block_Licence == EBlock_VOID)          { ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_Offer = "OFFER(VOID)"; }
                                                  if(Block_Licence == EBlock_UNDEFINE)      { ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_Offer = "OFFER(VOID)"; }
                                                  if(Block_Licence == EBlock_HALF)          { ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_Offer = "OFFER(VOID)"; }
                                                  if(Block_Licence == EBlock_OFFEN)         { ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_Offer = "OFFER(VOID)"; }
                                                  if(Block_Licence == EBlock_TEST)          { ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_Offer = "OFFER(VOID)"; } //
                                        }
                                        //-----------------------------------------------------------------------------------------------------------------------
                                        if(Block_Licence == EBlock_StableWIN)     { whenVerified = place + "sw."; }
                                        if(Block_Licence == EBlock_VERIFIED)      { whenVerified = place + "v."; }
                                        if(Block_Licence == EBlock_Stable)        { whenVerified = place + "s."; }
                                        if(Block_Licence == EBlock_VOID)          { whenVerified = place + "vo."; }
                                        if(Block_Licence == EBlock_UNDEFINE)      { whenVerified = place + "u."; }
                                        if(Block_Licence == EBlock_HALF)          { whenVerified = place + "h."; }
                                        if(Block_Licence == EBlock_OFFEN)         { whenVerified = place + "o."; }
                                        if(Block_Licence == EBlock_TEST)          { whenVerified = place + "t."; } //
                              }
                              else
                              {         ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_Offer      = "OFFER(VOID)";
                                        ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Enum_BlockOffer = E_OFFER_VOID;//
                              }
                              //ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_Out_SAW = "B:" + (string)BlockID + "_" + (string)LineID + "_" + "SAW:" + (string)SawCount + "(" + SawText + ")" + " PBC:" + (string)p_BuyCount + " PSC:" + (string)p_SellCount + " NPBC:" + (string)np_BuyCount + " NPSC:" + (string)np_SellCount ; //BUY[] SELL[+]
                              ct_Drive.TDD.ct_Signals.DATAS.Decition_Array_SignalEstimateOut.Desc_SAW = whenVerified + (string)LineID + "." + "S" + (string)SawCount + "" + "" + "" + "B" + (string)p_BuyCount + "S" + (string)p_SellCount + "b" + (string)np_BuyCount + "s" + (string)np_SellCount ; //BUY[] SELL[+]
                    }//
          }//
          //*****************************************************************************************************************************************************************
          ushort        p_BuyCounter()
          {         ushort count = 0;
                    for(int i = 0; i < OrdersHistoryTotal(); i++) //The history list size depends on the current settings of the "Account history" tab of the terminal.
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY ) && OrderType() == OP_BUY && OrderProfit() > 1  ) // (closed and canceled order).
                              {         if(StringFind(OrderComment(), "B:" + (string)BlockID) > 0) { count++; } //when finf
                                        else                                               { continue; } //
                              } //
                    }//
                    return count; //
          };
          //*****************************************************************************************************************************************************************
          ushort        p_SellCounter()
          {         ushort count = 0;
                    for(int i = 0; i < OrdersHistoryTotal(); i++) //The history list size depends on the current settings of the "Account history" tab of the terminal.
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY ) && OrderType() == OP_SELL && OrderProfit() > 1  ) // (closed and canceled order).
                              {         if(StringFind(OrderComment(), "B:" + (string)BlockID) > 0) { count++; } //when finf
                                        else                                               { continue; } //
                              } //
                    }//
                    return count; //
          };
          //*****************************************************************************************************************************************************************
          ushort        np_BuyCounter()
          {         ushort count = 0;
                    for(int i = 0; i < OrdersHistoryTotal(); i++) //The history list size depends on the current settings of the "Account history" tab of the terminal.
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY ) && OrderType() == OP_BUY && OrderProfit() < 1  ) // (closed and canceled order).
                              {         if(StringFind(OrderComment(), "B:" + (string)BlockID) > 0) { count++; } //when finf
                                        else                                               { continue; } //
                              } //
                    }//
                    return count; //
          };
          //*****************************************************************************************************************************************************************
          ushort        np_SellCounter()
          {         ushort count = 0;
                    for(int i = 0; i < OrdersHistoryTotal(); i++) //The history list size depends on the current settings of the "Account history" tab of the terminal.
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY ) && OrderType() == OP_SELL && OrderProfit() < 1  ) // (closed and canceled order).
                              {         if(StringFind(OrderComment(), "B:" + (string)BlockID) > 0) { count++; } //when finf
                                        else                                               { continue; } //
                              } //
                    }//
                    return count; //
          };
          //*****************************************************************************************************************************************************************
          ushort        SAWCounter()
          {         ushort count = 0;
                    for(int i = 0; i < OrdersHistoryTotal(); i++) //The history list size depends on the current settings of the "Account history" tab of the terminal.
                    {         if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY ) ) // (closed and canceled order).
                              {         if(StringFind(OrderComment(), "B:" + (string)BlockID) > 0) { count++; } //when finf
                                        else                                               { continue; } //
                              } //
                    }//
                    return count; //
          };
          //*****************************************************************************************************************************************************************
          //
};
uint St_LineSence_Block::gcBlocks = 0;
uint St_LineSence_Block::gcBlock_Curr = 0;
uint St_LineSence_Block::gcBloc_FristCall = 0;
uint St_LineSence_Block::gcBloc_TwiceCall = 0;
uint St_LineSence_Block::gcBloc_FristCall_TickCount = 0;
uint St_LineSence_Block::gcBloc_TwiceCall_TickCount = 0;
//+------------------------------------------------------------------+
