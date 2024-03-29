//+------------------------------------------------------------------+
//||   ||||||||||                 struct.mqh                        ||Ctp_TRADER
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


struct St_Ticket_Modifier
{         uint                  TrailStop;    //      = 10
          uint                  TrailStopDef; //      = 10
          uint                  TrailStopInp; //      = 10
          uint                  NewTrailStop; //                      Is_TrailStop;        //= TrailStop > 0;//Defined
          //---
          uint                  TrailStopStep; //      = 1;
          uint                  TrailStopStepInp; //      = 1;
          uint                  TrailStopStepDef; //      = 1;
          //---
          uint                  MinProfit;
          uint                  MinProfitStep;//      = 1;
          uint                  MinProfitInp;
          uint                  MinProfitDef; //                      Is_MinProfit    = MinProfit > 0;//Defined
          //---
          uint                  MaxProfit;    //      = 100 + 50;
          uint                  MaxProfitStep;//      = 100 + 5;
          uint                  MaxProfitInp; //
          uint                  MaxProfitDef; //      = 100 + 150;    Is_MaxProfit                  = MaxProfit > 0;//Defined
        
          //---_Check
          bool                  Is_TrailStop;                   //= TrailStop > 0;//Defined
          bool                  Is_MinProfit;                   //= MinProfit > 0;//Defined
          bool                  Is_MaxProfit;                   //= MaxProfit > 0;//Defined
          //---
          bool                  Is_Modifybles;                  //= false;//OrderTakeProfit() == 0;//




};

//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
