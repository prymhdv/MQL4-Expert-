//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOF\.CoverOF.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| This software is being issued under the GNU license. Please      |
//| refer to the online description of the license terms or find a   |
//| copy in the project files' resource text file, in MetaEditor5    |
//| public project > ULTIMATE_AI Project <                           |
//+------------------------------------------------------------------+
//|           First written by: Nelson Wanyama                       |
//|                           : ngaira14nelson@gmail.com             |
//|                           : https://www.mql5.com/en/users/_nelson|
//|           Discussion link : https://www.mql5.com/en/forum/338341 |
//+------------------------------------------------------------------+
#include "NetComplex.mqh"
//---
enum Enum_Targets
{         BuyDirection,
          BuyCorrection,
          SellDirection,
          SellCorrection
          //
          //
};
struct S_Targets
{         double vHigh;
          double vLow;

};

struct S_Targets_DirectionWard
{         S_Targets Direction;
          S_Targets Correction;

};
struct S_TargetsTrades
{         S_Targets_DirectionWard BUY;
          S_Targets_DirectionWard SELL;

};
struct CAI_NeuralNetwork_Vtrade
{
//
          bool          IsOnTrade;
          float         Profit;
          datetime      Time_start;
          datetime      Time_End;
          datetime      Time_Durr;
          float         Price_start;
          float         Price_End;
          float         Price_Durr;
          uchar         BUY1SELL2VOID3;
          ushort        Bw, Sw, Bl, Sl;
          void Reset()
          {         IsOnTrade = 0;
                    Profit = 0;
                    Time_start = 0;
                    Time_End = 0;
                    Time_Durr = 0;
                    Price_start = 0;
                    Price_End = 0;
                    Price_Durr = 0;
                    BUY1SELL2VOID3 = 0;
                    //Bw = 0; Sw = 0; Bl = 0; Sl = 0; //
          }
//
};
struct CAI_NeuralNetwork_DATAS
{         string SignalCommand;
          string SignalInfoAH, SignalInfoAL;;
          string SignalInfoBH, SignalInfoBL;; //
          string SignalInfoCH, SignalInfoCL;;
          string SignalInfoDH, SignalInfoDL;; //

          string SignalInfo_InputsPatern;
          string VtradeDesc;
          //----------------------------
          CAI_NeuralNetwork_Vtrade  _Vtrade; };
//---!sinput uint show_time = 50; // Chart display time (seconds)

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CAI_NeuralNetwork
{
public:
          CAI_NeuralNetwork(void)  { IsTrained = false; isTarget2 = 1; };
          ~CAI_NeuralNetwork(void) {  };//delete myNet2;
          //----------------------------------------------------------
          uint       show_time;// = 50; // Chart display time (seconds)
          bool       IsTrained;
          bool       isTarget2;
          CAI_NeuralNetwork_DATAS  DATAS;
          //----------------------------------------------------------
          int       MainProgress(bool b);
          void       _MainRun_();//>...........................................................................................................
          void       fillInputs(CArrayDouble_MQL4 &inp, CArrayDouble_MQL4 &target, S_TargetsTrades &s1_Targets, bool unseen = false);
          void       clear()
          {         //---! ChartSetInteger(0, CHART_SHOW, false);
                    //---! ChartSetInteger(0, CHART_CONTEXT_MENU, false);
                    //---! ChartSetInteger(0, CHART_SHOW_DATE_SCALE, false); //
          }
          void       restore()
          {         //---!ChartSetInteger(0, CHART_SHOW, true);
                    //---! ChartSetInteger(0, CHART_CONTEXT_MENU, true);
                    //---! ChartSetInteger(0, CHART_SHOW_DATE_SCALE, false); //
          }
          void      Set_Results_ByError(string descI, int idx, double & accuracy, string & signal_info, string desctype, CArrayDouble_MQL4 & targetVals, CArrayDouble_MQL4 & resultVals);
          //----------------------------------------------------------
          void      Vtrade();
          uchar     OptimizeOFFER( ushort bw, ushort sw, ushort bl, ushort sl);
          //---------------------------------------------------------


};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CAI_NeuralNetwork::MainProgress(bool b)
{
//
          if(!b) {   return -1; }
          {         /*LOAD*///inner
                    /*PROGRESS*/ _MainRun_(); //Extract Trade Signal
                    /*PROGRESS*/ Vtrade();    //Trade Signal virtualy
                    /*SAVE*///inner
          }
          return 0;
//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CAI_NeuralNetwork::Vtrade()
{         //
          DATAS.VtradeDesc = "";
          //DATAS._Vtrade.BUY1SELL2VOID3 = OptimizeOFFER(DATAS._Vtrade.Bw, DATAS._Vtrade.Sw, DATAS._Vtrade.Bl, DATAS._Vtrade.Sl); //
          if(           DATAS.SignalCommand == "BuyCorrectionL" || DATAS.SignalCommand == "BuyDirectionL" || DATAS.SignalCommand == "BuyCorrectionH"  )  {DATAS._Vtrade.BUY1SELL2VOID3 = 1;}
          else if(      DATAS.SignalCommand == "SellCorrectionH" || DATAS.SignalCommand == "SellDirectionH" || DATAS.SignalCommand == "SellCorrectionL"   ) {DATAS._Vtrade.BUY1SELL2VOID3 = 2;}
          else   {DATAS._Vtrade.BUY1SELL2VOID3 = 3;}
          //if      (accuracyAH > 90) { DATAS.SignalCommand = "BuyCorrectionH";  }
          //                    else if (accuracyAL > 90) { DATAS.SignalCommand = "BuyCorrectionL";  } //
          //                    else if (accuracyBH > 90) { DATAS.SignalCommand = "BuyDirectionH";  }
          //                    else if (accuracyBL > 90) { DATAS.SignalCommand = "BuyDirectionL";  } //
          //                    else if (accuracyCH > 90) { DATAS.SignalCommand = "SellCorrectionH";  }
          //                    else if (accuracyCL > 90) { DATAS.SignalCommand = "SellCorrectionL";  } //
          //                    else if (accuracyDH > 90) { DATAS.SignalCommand = "SellDirectionH";  }
          //                    else if (accuracyDL > 90) { DATAS.SignalCommand = "SellDirectionL";  } //
          if(!DATAS._Vtrade.IsOnTrade)
          {         DATAS._Vtrade.IsOnTrade = 1;
                    DATAS._Vtrade.Price_start = (float)Close[0];
                    DATAS._Vtrade.Time_start = Time[0]; //
          }
          else
          {         DATAS._Vtrade.Price_End = (float)Close[0];
                    DATAS._Vtrade.Time_End  =  Time[0];
                    if(DATAS._Vtrade.BUY1SELL2VOID3 == 1)          {DATAS._Vtrade.Profit = DATAS._Vtrade.Price_start - DATAS._Vtrade.Price_End;   } //
                    else if(DATAS._Vtrade.BUY1SELL2VOID3 == 2)     {DATAS._Vtrade.Profit = -(DATAS._Vtrade.Price_start - DATAS._Vtrade.Price_End);} //
                    else                                           {DATAS._Vtrade.Reset(); }//
                    //
                    if(DATAS._Vtrade.Profit > 0.52)
                    {         //
                              if(DATAS._Vtrade.BUY1SELL2VOID3 == 1)      { DATAS._Vtrade.Bw++;  } //
                              else if(DATAS._Vtrade.BUY1SELL2VOID3 == 2) { DATAS._Vtrade.Sw++;  } //
                              DATAS._Vtrade.Reset();
                              //
                    }
                    else if(DATAS._Vtrade.Profit < -0.52)
                    {         //
                              if(DATAS._Vtrade.BUY1SELL2VOID3 == 1)      { DATAS._Vtrade.Bl++;  } //
                              else if(DATAS._Vtrade.BUY1SELL2VOID3 == 2) { DATAS._Vtrade.Sl++;  } //
                              DATAS._Vtrade.Reset();
                              //
                    }
                    //
          }
          DATAS.VtradeDesc =   " Bw(" + (string)DATAS._Vtrade.Bw   + ")" + " Sw(" + (string)DATAS._Vtrade.Sw   + ")" + " Bl(" + (string)DATAS._Vtrade.Bl  + ")" + " Sl(" + (string)DATAS._Vtrade.Sl  + ")" ;
          //
//
}
//+------------------------------------------------------------------+
//|              Script main function                                |
//+------------------------------------------------------------------+
void CAI_NeuralNetwork::_MainRun_()
{         //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
          /*------------------------------------------------*/
          //--- create our neural network
          CArrayInt_MQL4 topology;
          /*------------------------------------------------*/
          //--- add the configuration [2,2,1] //---!!
          topology.Add(99);    //frist layer>>>>>//---adding element n to array elements form end//dependet number of element you want to input
          //-----------------------------------------------------------------
          //topology.Add(126);    //middle layer>>>>> //--resulation gunaguni
          //topology.Add(24);    //middle layer>>>>> //--resulation gunaguni
          topology.Add(int(99 * 1.5));  //middle layer>>>>> //--resulation gunaguni
          //topology.Add(6);    //middle layer>>>>> //--resulation gunaguni
          //-----------------------------------------------------------------
          //topology.Add(2);   //out layer>>>>> The Last thing you want out Extracting nearing to wanted
          //if(isTarget2) topology.Add(2);
          //else topology.Add(1);
          topology.Add(9);
          //
          //    /*\
          //    /*\
          //    /*\   
          //  *--*\       
          //  *--*--*\
          //  *--*--*--*
          //  *--*--*/
          //  *--*/
          //  *--*/
          //    \*/
          //    \*/
          //    \*/
          /*-------------------------------------------------*/
          //--- Initialize the network with our configuration
          CNet myNet(topology, Sigmoid, Sigmoid);
          /*-------------------------------------------------*/
          //--- create data containers
          CArrayDouble_MQL4 inputVals, targetVals, resultVals;   ///--{0.0,     0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0}
          /*-------------------------------------------------*/
          bool IsBulish5M       = (iClose(Symbol(), PERIOD_M5, 0) > iOpen(Symbol(), PERIOD_M5, 0));
          bool IsBulish30M      = (iClose(Symbol(), PERIOD_M30, 0) > iOpen(Symbol(), PERIOD_M30, 0));
          bool IsNearHighIsnLow =  (MathAbs(Close[0] - iHigh(Symbol(), PERIOD_M30, 0)) < MathAbs(Close[0] - iLow(Symbol(), PERIOD_M30, 0)) );
          //ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H4.MACD_Cross_Signal.eMACD_STATE[0]==UP_IN;
          /*-------------------------------------------------*/
          if(Detect_NewBar._M1.CBT__5Seccound.Is_NewBar && IsTrained == false)
          {         double        rms[]; //---reserve epochs count
                    uint          epochs = 1000;//--any cycle
                    ArrayResize(rms, 0, (int)epochs);
                    uint          trainingPass = 0;//count strart epoch
                    //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
                    /*-------------------------------------------------*/
                    //--- loop and train the network
                    while(trainingPass < epochs)
                    {         ++trainingPass;
                              //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
                              /*-------------------------------------------------*/
                              //--- create training data and check compatibility with the network
                              //--- number of inputs MUST be equal to number of input neurons in your network
                              S_TargetsTrades s1_Targets;
                              s1_Targets.BUY.Correction.vHigh  = !IsBulish5M &&  IsBulish30M && IsNearHighIsnLow  ? +0.10 : -1.00; //0.0;
                              s1_Targets.BUY.Correction.vLow   = !IsBulish5M &&  IsBulish30M && !IsNearHighIsnLow ? +0.20 : -1.00; //0.0;
                              //
                              s1_Targets.BUY.Direction.vHigh   =  IsBulish5M &&  IsBulish30M && IsNearHighIsnLow  ? +0.30 : -1.00; //0.0;
                              s1_Targets.BUY.Direction.vLow    =  IsBulish5M &&  IsBulish30M && !IsNearHighIsnLow ? +0.40 : -1.00; //0.0;
                              //
                              s1_Targets.SELL.Correction.vHigh =  IsBulish5M && !IsBulish30M && IsNearHighIsnLow  ? +0.50 : -1.00;
                              s1_Targets.SELL.Correction.vLow  =  IsBulish5M && !IsBulish30M && !IsNearHighIsnLow ? +0.60 : -1.00;
                              //
                              s1_Targets.SELL.Direction.vHigh  = !IsBulish5M && !IsBulish30M && IsNearHighIsnLow  ? +0.70 : -1.00;
                              s1_Targets.SELL.Direction.vLow   = !IsBulish5M && !IsBulish30M && !IsNearHighIsnLow ? +0.80 : -1.00;
                              //
                              fillInputs(inputVals, targetVals, s1_Targets);
                              /*-------------------------------------------------*/
                              if(inputVals.Total() != topology.At(0)) { Print("Incompatible inputs!"); break; } //numberof element of each layer //--what's value at element 0  /// cheack number of elements are the same input and topology layers
                              /*-------------------------------------------------*/
                              //--- make the network predict the result
                              myNet.feedForward(inputVals, __FUNCTION__, __LINE__); //--not recuresive call-----just recuresice in activation function
                              /*-------------------------------------------------*/
                              //--- check compatibility of target values and number of output neurons
                              //--- target values must be equal to the number of output neurons
                              if(targetVals.Total() != topology.At(topology.Total() - 1)) { Print("Incompatible targetVals"); break; }//numberof element of each layer
                              /*-------------------------------------------------*/
                              //--- make the network learn
                              myNet.backProp(targetVals);
                              //---
                              /*-------------------------------------------------*/
                              uint index = ArraySize(rms);
                              ArrayResize(rms, index + 1);
                              rms[index] = myNet.getRecentAverageError(); //
                              /*-------------------------------------------------*/
                    }//
                    IsTrained = 0; //
          }
          {         //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
                    /*-------------------------------------------------*/
                    //--- training complete. Get prediction of unseen data and plot
                    S_TargetsTrades s1_Targets; /*its sigmond then target must between -1.0 and 1.0*/  /*we had learn whats the value of expected target need to correct selection then need changed input && changed expected targets to dynamic decition*/
                    //0.22; //0.0;//return 0.7 by zero targets when trained target is 0.5 1.0 1.5 2.0 and not changed by change 0.0 0.0 0.0 0.0 ////result notcome by input comed by layer tipe
                    //0.45; //0.0; //expect change result is constant
                    //0.65; //0.0;
                    //0.84; //0.0;
                    s1_Targets.BUY.Correction.vHigh  = !IsBulish5M &&  IsBulish30M && IsNearHighIsnLow  ? +0.10 : -1.00; //0.0;
                    s1_Targets.BUY.Correction.vLow   = !IsBulish5M &&  IsBulish30M && !IsNearHighIsnLow ? +0.20 : -1.00; //0.0;
                    //
                    s1_Targets.BUY.Direction.vHigh   =  IsBulish5M &&  IsBulish30M && IsNearHighIsnLow  ? +0.30 : -1.00; //0.0;
                    s1_Targets.BUY.Direction.vLow    =  IsBulish5M &&  IsBulish30M && !IsNearHighIsnLow ? +0.40 : -1.00; //0.0;
                    //
                    s1_Targets.SELL.Correction.vHigh =  IsBulish5M && !IsBulish30M && IsNearHighIsnLow  ? +0.50 : -1.00;
                    s1_Targets.SELL.Correction.vLow  =  IsBulish5M && !IsBulish30M && !IsNearHighIsnLow ? +0.60 : -1.00;
                    //
                    s1_Targets.SELL.Direction.vHigh  = !IsBulish5M && !IsBulish30M && IsNearHighIsnLow  ? +0.70 : -1.00;
                    s1_Targets.SELL.Direction.vLow   = !IsBulish5M && !IsBulish30M && !IsNearHighIsnLow ? +0.80 : -1.00;
                    //
                    fillInputs(inputVals, targetVals, s1_Targets, true); ///the learning and wanted target must realative
                    myNet.feedForward(inputVals, __FUNCTION__, __LINE__);//
          }
          /*-------------------------------------------------*/
          //--- print results
          double inp[];
          {         myNet.getResults(resultVals);//--------------where result are assigned just return last layer neurons order-----------------///
                    //---
          }
          /*-------------------------------------------------*/
          DATAS.SignalInfo_InputsPatern = "";
          DATAS.SignalInfoAH = DATAS.SignalInfoAL = "";
          DATAS.SignalInfoBH = DATAS.SignalInfoBL = "";
          DATAS.SignalInfoCH = DATAS.SignalInfoCL = "";
          DATAS.SignalInfoDH = DATAS.SignalInfoDL = "";
          DATAS.SignalCommand = "";
          /*-------------------------------------------------*/
          {         ArrayResize(inp, inputVals.Total());
                    for(int i = 0; i < inputVals.Total() && !IsStopped(); ++i) inp[i] = inputVals.At(i);
                    //---
                    //ArrayPrint(inp);
                    string Desc = "";
                    for(int i = 0; i < inputVals.Total(); i++)  { Desc += (string)inp[i] + ""; }
                    DATAS.SignalInfo_InputsPatern += "Inputs : " + Desc ; //Print("\nInputs : ", Desc);//
                    //string InputsDesc[]; 2^48 not good for handeling 281,474,976,710,656
          }
          /*-------------------------------------------------*/
          double accuracyAH = 0;
          Set_Results_ByError("", 0, accuracyAH, DATAS.SignalInfoAH, "BCH", targetVals, resultVals);
          double accuracyAL = 0;
          Set_Results_ByError("", 1, accuracyAL, DATAS.SignalInfoAL, "BCL", targetVals, resultVals);
          double accuracyBH = 0;
          Set_Results_ByError("", 2, accuracyBH, DATAS.SignalInfoBH, "BDH", targetVals, resultVals);
          double accuracyBL = 0;
          Set_Results_ByError("", 3, accuracyBL, DATAS.SignalInfoBL, "BDL", targetVals, resultVals);
          double accuracyCH = 0;
          Set_Results_ByError("", 4, accuracyCH, DATAS.SignalInfoCH, "SCH", targetVals, resultVals);
          double accuracyCL = 0;
          Set_Results_ByError("", 5, accuracyCL, DATAS.SignalInfoCL, "SCL", targetVals, resultVals);
          double accuracyDH = 0;
          Set_Results_ByError("", 6, accuracyDH, DATAS.SignalInfoDH, "SDH", targetVals, resultVals);
          double accuracyDL = 0;
          Set_Results_ByError("", 7, accuracyDL, DATAS.SignalInfoDL, "SDL", targetVals, resultVals);
          /*-------------------------------------------------*/
          {         //---begin plotting procedures
                    //---int width  = (int)ChartGetInteger(0, CHART_WIDTH_IN_PIXELS);
                    //---int height = (int)ChartGetInteger(0, CHART_HEIGHT_IN_PIXELS);
                    //---!CGraphic graphic;
                    //---!graphic.Create(0, "Graphic", 0, 0, 0, width, height);
                    //CCurve *netError = graphic.CurveAdd(rms, CURVE_LINES, "AveNetError");
                    //netError.LinesWidth(1);
                    //---!graphic.CurvePlotAll();
                    //---!graphic.Update();
                    //---
                    //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
                    //---Sleep(show_time * 100);
                    //---restore();
                    //---!graphic.Destroy(); //
          }//
          /*-------------------------------------------------*/
          {         //
                    //if(isTarget2)
                    //    {         if(accuracyA > 90)       { DATAS.SignalCommand = "BUY";  }
                    //              else if(accuracyB > 90)  { DATAS.SignalCommand = "SELL"; } //
                    //    }
                    //    else
                    {         if      (accuracyAH > 90) { DATAS.SignalCommand = "BuyCorrectionH";  }
                              else if (accuracyAL > 90) { DATAS.SignalCommand = "BuyCorrectionL";  } //
                              else if (accuracyBH > 90) { DATAS.SignalCommand = "BuyDirectionH";  }
                              else if (accuracyBL > 90) { DATAS.SignalCommand = "BuyDirectionL";  } //
                              else if (accuracyCH > 90) { DATAS.SignalCommand = "SellCorrectionH";  }
                              else if (accuracyCL > 90) { DATAS.SignalCommand = "SellCorrectionL";  } //
                              else if (accuracyDH > 90) { DATAS.SignalCommand = "SellDirectionH";  }
                              else if (accuracyDL > 90) { DATAS.SignalCommand = "SellDirectionL";  } //
                    } //
          }
          //-----------------------------------------------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CAI_NeuralNetwork::Set_Results_ByError(string descI, int idx, double & accuracy, string & signal_info, string desctype, CArrayDouble_MQL4 & targetVals, CArrayDouble_MQL4 & resultVals)
{         //--- check availability of results
          signal_info += " " + descI + "R : " + DoubleToString(resultVals.At(idx), 1); // Print("Result_A : ", DoubleToString(resultVals.At(0), 4));
          signal_info += " E : " + DoubleToString(targetVals.At(idx), 1); //Print("Expected_A : ", DoubleToString(targetVals.At(0), 4));
          //--- check accuracy
          double expected  = targetVals.At(idx);
          double predicted = resultVals.At(idx);
          //---
          //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
          double error = MathAbs(predicted - expected);
          accuracy = 100.0 - ((error / (1 + 1)) * 100);
          signal_info += " Ac: " + DoubleToString(accuracy, 0) + "% " + desctype ; //Print("Accuracy_A : ", DoubleToString(accuracyA, 2) + "%"); //
}
//+------------------------------------------------------------------+
//|  generate training data and feed into input arrays               |
//+------------------------------------------------------------------+
void CAI_NeuralNetwork::fillInputs(CArrayDouble_MQL4 &inp, CArrayDouble_MQL4 &target, S_TargetsTrades &s1_Targets, bool unseen = false)
{         /*-------------------------------------------------------------*/
          /* change inputs value random not change outed result value!!  */
          /*-------------------------------------------------------------*/
          {         //if(Global_TREE_TEST_IS_RANDOM)
                    //         {         int m_randA = MathRand() % 3; //Print("m_rand: ",m_rand);
                    //                   if(m_randA == 1)        {ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M = true; ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M = false;} //
                    //                   else if(m_randA == 2)   {ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M = true; ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M = false;}//
                    //                   else if(m_randA == 3)   {ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M = false; ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M = false; } //
                    //         }
                    //         if(Global_TREE_TEST_IS_RANDOM)
                    //         {         int m_randA = MathRand() % 3; //Print("m_rand: ",m_rand);
                    //                   if(m_randA == 1)        {ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 = true; ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80 = false; } //
                    //                   else if(m_randA == 2)   {ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80 = true; ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 = false;}//
                    //                   else if(m_randA == 3)   {ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80 = false; ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 = false; } //
                    //         }
                    //         if(Global_TREE_TEST_IS_RANDOM)          // MathSrand(TimeLocal()% 19);
                    //         {         int m_rand = MathRand() % 9; //Print("m_rand: ",m_rand);
                    //                   if(m_rand == 1)        {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 1; } //
                    //                   else if(m_rand == 2)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 2; }//
                    //                   else if(m_rand == 3)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 3; }//
                    //                   else if(m_rand == 4)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 4; }//
                    //                   else if(m_rand == 5)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 5; }//
                    //                   else if(m_rand == 6)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 6; }//
                    //                   else if(m_rand == 7)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 7; }//
                    //                   else if(m_rand == 8)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 8; }//
                    //                   else if(m_rand == 9)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth = 9; }//
                    //         }
                    //         if(Global_TREE_TEST_IS_RANDOM)
                    //         {         int m_randA = MathRand() % 3; //Print("m_rand: ",m_rand);
                    //                   if(m_randA == 1)        {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0 = E_True; } //
                    //                   else if(m_randA == 2)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0 = E_False;}//
                    //                   else if(m_randA == 3)   {ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0 = E_Void; } //
                    //         }
                    //
                    //
          }
          //--- generate training samples
          if(!unseen)
          {         if(inp.Total() == 0) inp.Add(0.0);//---not inited
                    //---
                    if(inp.At(0) == 0.0)//---not inited before call this function
                    {         inp.Clear();
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 10));  inp.Add((double)iTime(_Symbol, PERIOD_MN1, 10)); inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 10));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 9));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 9));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 8));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 8));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 8));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 7));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 7));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 7));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 6));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 6));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 6));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 5));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 5));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 5));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 4));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 4));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 4));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 3));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 3));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 3));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 2));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 2));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 2));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 1));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 1));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 1));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 0));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 0));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 0));
                             //
                              inp.Add(iClose(_Symbol, PERIOD_W1, 10));   inp.Add((double)iTime(_Symbol, PERIOD_W1, 10));  inp.Add((double)iVolume(_Symbol, PERIOD_W1, 10));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 9));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 8));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 8));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 7));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 7));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 6));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 6));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 5));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 5));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 4));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 4));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 3));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 3));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 2));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 2));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 1));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 1));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 0));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_D1, 10));   inp.Add((double)iTime(_Symbol, PERIOD_D1, 10));  inp.Add((double)iVolume(_Symbol, PERIOD_D1, 10));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 9));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 9));  
                              inp.Add(iClose(_Symbol, PERIOD_D1, 8));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 8));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 7));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 7));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 6));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 6));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 5));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 5));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 4));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 4));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 3));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 3));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 2));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 2));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 1));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 1));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 0));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_H4, 10));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 10));  
                              inp.Add(iClose(_Symbol, PERIOD_H4, 9));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 9)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 8));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 8)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 7));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 7)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 6));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 6)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 5));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 5)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 4));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 4)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 3));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 3)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 2));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 2)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 1));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 1)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 0));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 0)); 
                              //
                              inp.Add(iClose(_Symbol, PERIOD_H1, 10));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 10));   
                              inp.Add(iClose(_Symbol, PERIOD_H1, 9));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 9)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 8));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 8)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 7));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 7)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 6));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 6)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 5));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 5)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 4));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 4)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 3));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 3)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 2));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 2)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 1));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 1)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 0));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 0)); 
                              //
                              inp.Add(iClose(_Symbol, PERIOD_M30, 10));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 10)); 
                              inp.Add(iClose(_Symbol, PERIOD_M30, 9));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 9));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 8));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 8));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 7));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 7));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 6));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 6));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 5));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 5));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 4));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 4));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 3));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 3));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 2));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 2));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 1));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 1));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 0));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_M15, 10));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 10));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 9));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 9));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 8));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 8));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 7));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 7));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 6));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 6));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 5));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 5));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 4));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 4));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 3));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 3));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 2));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 2));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 1));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 1));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 0));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_M5, 10));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 10));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 9));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 9));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 8));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 8));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 7));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 7));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 6));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 6));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 5));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 5));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 4));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 4));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 3));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 3));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 2));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 2));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 1));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 1));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 0));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_M1, 10));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 10));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 9));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 8));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 8));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 7));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 7));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 6));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 6));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 5));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 5));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 4));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 4));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 3));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 3));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 2));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 2));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 1));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 1));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 0));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 0));
                              //extra
                              //inp.Add(4.0);
                              //inp.Add(1.3);
                              //inp.Add(1.4);
                              //inp.Add(1.5);
                              //inp.Add(5.0);
                              //inp.Add(1.6);
                              //---
                              target.Clear();
                              //target.Add(Target);//answer [1]
                              //if(isTarget2)target.Add(Target2);
                              target.Add(iClose(_Symbol, PERIOD_MN1, 0));
                              target.Add(iClose(_Symbol, PERIOD_W1, 0));
                              target.Add(iClose(_Symbol, PERIOD_D1, 0));
                              target.Add(iClose(_Symbol, PERIOD_H4, 0));
                              target.Add(iClose(_Symbol, PERIOD_H1, 0));
                              target.Add(iClose(_Symbol, PERIOD_M30, 0));
                              target.Add(iClose(_Symbol, PERIOD_M15, 0));
                              target.Add(iClose(_Symbol, PERIOD_M5, 0));
                              target.Add(iClose(_Symbol, PERIOD_M1, 0));
                              //---
                              return;//
                    }
                    else
                    {         inp.Clear();
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 10));  inp.Add((double)iTime(_Symbol, PERIOD_MN1, 10)); inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 10));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 9));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 9));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 8));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 8));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 8));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 7));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 7));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 7));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 6));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 6));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 6));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 5));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 5));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 5));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 4));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 4));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 4));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 3));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 3));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 3));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 2));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 2));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 2));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 1));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 1));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 1));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 0));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 0));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 0));
                             //
                              inp.Add(iClose(_Symbol, PERIOD_W1, 10));   inp.Add((double)iTime(_Symbol, PERIOD_W1, 10));  inp.Add((double)iVolume(_Symbol, PERIOD_W1, 10));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 9));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 8));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 8));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 7));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 7));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 6));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 6));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 5));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 5));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 4));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 4));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 3));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 3));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 2));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 2));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 1));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 1));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 0));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_D1, 10));   inp.Add((double)iTime(_Symbol, PERIOD_D1, 10));  inp.Add((double)iVolume(_Symbol, PERIOD_D1, 10));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 9));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 9));  
                              inp.Add(iClose(_Symbol, PERIOD_D1, 8));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 8));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 7));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 7));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 6));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 6));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 5));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 5));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 4));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 4));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 3));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 3));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 2));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 2));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 1));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 1));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 0));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_H4, 10));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 10));  
                              inp.Add(iClose(_Symbol, PERIOD_H4, 9));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 9)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 8));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 8)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 7));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 7)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 6));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 6)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 5));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 5)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 4));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 4)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 3));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 3)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 2));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 2)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 1));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 1)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 0));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 0)); 
                              //
                              inp.Add(iClose(_Symbol, PERIOD_H1, 10));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 10));   
                              inp.Add(iClose(_Symbol, PERIOD_H1, 9));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 9)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 8));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 8)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 7));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 7)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 6));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 6)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 5));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 5)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 4));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 4)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 3));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 3)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 2));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 2)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 1));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 1)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 0));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 0)); 
                              //
                              inp.Add(iClose(_Symbol, PERIOD_M30, 10));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 10)); 
                              inp.Add(iClose(_Symbol, PERIOD_M30, 9));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 9));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 8));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 8));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 7));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 7));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 6));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 6));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 5));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 5));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 4));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 4));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 3));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 3));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 2));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 2));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 1));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 1));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 0));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_M15, 10));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 10));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 9));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 9));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 8));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 8));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 7));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 7));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 6));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 6));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 5));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 5));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 4));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 4));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 3));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 3));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 2));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 2));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 1));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 1));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 0));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_M5, 10));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 10));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 9));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 9));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 8));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 8));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 7));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 7));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 6));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 6));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 5));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 5));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 4));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 4));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 3));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 3));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 2));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 2));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 1));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 1));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 0));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_M1, 10));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 10));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 9));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 8));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 8));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 7));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 7));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 6));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 6));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 5));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 5));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 4));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 4));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 3));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 3));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 2));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 2));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 1));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 1));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 0));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 0));
                              //extra
                              //inp.Add(4.0);
                              //inp.Add(1.3);
                              //inp.Add(1.4);
                              //inp.Add(1.5);
                              //inp.Add(5.0);
                              //inp.Add(1.6);
                              //---
                              target.Clear();
                              //target.Add(Target);//answer [1]
                              //if(isTarget2)target.Add(Target2);
                              target.Add(iClose(_Symbol, PERIOD_MN1, 0));
                              target.Add(iClose(_Symbol, PERIOD_W1, 0));
                              target.Add(iClose(_Symbol, PERIOD_D1, 0));
                              target.Add(iClose(_Symbol, PERIOD_H4, 0));
                              target.Add(iClose(_Symbol, PERIOD_H1, 0));
                              target.Add(iClose(_Symbol, PERIOD_M30, 0));
                              target.Add(iClose(_Symbol, PERIOD_M15, 0));
                              target.Add(iClose(_Symbol, PERIOD_M5, 0));
                              target.Add(iClose(_Symbol, PERIOD_M1, 0));
                              //---
                              return; //
                    } //
          }
          //--- if we are here, unseen data is needed [1,1,0] answer [1]
          inp.Clear();
          inp.Add(iClose(_Symbol, PERIOD_MN1, 10));  inp.Add((double)iTime(_Symbol, PERIOD_MN1, 10)); inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 10));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 9));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 9));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 8));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 8));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 8));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 7));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 7));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 7));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 6));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 6));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 6));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 5));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 5));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 5));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 4));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 4));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 4));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 3));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 3));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 3));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 2));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 2));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 2));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 1));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 1));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 1));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 0));   inp.Add((double)iTime(_Symbol, PERIOD_MN1, 0));  inp.Add((double)iVolume(_Symbol, PERIOD_MN1, 0));
                             //
                              inp.Add(iClose(_Symbol, PERIOD_W1, 10));   inp.Add((double)iTime(_Symbol, PERIOD_W1, 10));  inp.Add((double)iVolume(_Symbol, PERIOD_W1, 10));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 9));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 8));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 8));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 7));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 7));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 6));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 6));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 5));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 5));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 4));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 4));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 3));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 3));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 2));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 2));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 1));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 1));
                              inp.Add(iClose(_Symbol, PERIOD_W1, 0));    inp.Add((double)iTime(_Symbol, PERIOD_W1, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_W1, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_D1, 10));   inp.Add((double)iTime(_Symbol, PERIOD_D1, 10));  inp.Add((double)iVolume(_Symbol, PERIOD_D1, 10));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 9));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 9));  
                              inp.Add(iClose(_Symbol, PERIOD_D1, 8));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 8));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 7));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 7));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 6));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 6));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 5));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 5));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 4));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 4));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 3));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 3));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 2));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 2));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 1));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 1));
                              inp.Add(iClose(_Symbol, PERIOD_D1, 0));    inp.Add((double)iTime(_Symbol, PERIOD_D1, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_D1, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_H4, 10));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 10));  
                              inp.Add(iClose(_Symbol, PERIOD_H4, 9));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 9)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 8));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 8)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 7));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 7)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 6));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 6)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 5));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 5)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 4));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 4)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 3));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 3)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 2));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 2)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 1));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 1)); 
                              inp.Add(iClose(_Symbol, PERIOD_H4, 0));    inp.Add((double)iTime(_Symbol, PERIOD_H4, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_H4, 0)); 
                              //
                              inp.Add(iClose(_Symbol, PERIOD_H1, 10));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 10));   
                              inp.Add(iClose(_Symbol, PERIOD_H1, 9));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 9)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 8));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 8)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 7));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 7)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 6));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 6)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 5));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 5)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 4));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 4)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 3));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 3)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 2));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 2)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 1));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 1)); 
                              inp.Add(iClose(_Symbol, PERIOD_H1, 0));   inp.Add((double)iTime(_Symbol, PERIOD_H1, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_H1, 0)); 
                              //
                              inp.Add(iClose(_Symbol, PERIOD_M30, 10));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 10)); 
                              inp.Add(iClose(_Symbol, PERIOD_M30, 9));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 9));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 8));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 8));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 7));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 7));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 6));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 6));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 5));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 5));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 4));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 4));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 3));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 3));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 2));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 2));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 1));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 1));
                              inp.Add(iClose(_Symbol, PERIOD_M30, 0));   inp.Add((double)iTime(_Symbol, PERIOD_M30, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_M30, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_M15, 10));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 10));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 9));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 9));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 8));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 8));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 7));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 7));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 6));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 6));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 5));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 5));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 4));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 4));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 3));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 3));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 2));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 2));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 1));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 1));
                              inp.Add(iClose(_Symbol, PERIOD_M15, 0));   inp.Add((double)iTime(_Symbol, PERIOD_M15, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_M15, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_M5, 10));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 10));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 9));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 9));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 8));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 8));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 7));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 7));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 6));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 6));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 5));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 5));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 4));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 4));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 3));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 3));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 2));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 2));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 1));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 1));
                              inp.Add(iClose(_Symbol, PERIOD_M5, 0));   inp.Add((double)iTime(_Symbol, PERIOD_M5, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_M5, 0));
                              //
                              inp.Add(iClose(_Symbol, PERIOD_M1, 10));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 10));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 10));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 9));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 9));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 8));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 8));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 8));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 7));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 7));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 7));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 6));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 6));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 6));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 5));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 5));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 5));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 4));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 4));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 4));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 3));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 3));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 3));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 2));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 2));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 2));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 1));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 1));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 1));
                              inp.Add(iClose(_Symbol, PERIOD_M1, 0));   inp.Add((double)iTime(_Symbol, PERIOD_M1, 0));   inp.Add((double)iVolume(_Symbol, PERIOD_M1, 0));
                              //extra
                              //inp.Add(4.0);
                              //inp.Add(1.3);
                              //inp.Add(1.4);
                              //inp.Add(1.5);
                              //inp.Add(5.0);
                              //inp.Add(1.6);
                              //---
                              target.Clear();
                              //target.Add(Target);//answer [1]
                              //if(isTarget2)target.Add(Target2);
                              target.Add(iClose(_Symbol, PERIOD_MN1, 0));
                              target.Add(iClose(_Symbol, PERIOD_W1, 0));
                              target.Add(iClose(_Symbol, PERIOD_D1, 0));
                              target.Add(iClose(_Symbol, PERIOD_H4, 0));
                              target.Add(iClose(_Symbol, PERIOD_H1, 0));
                              target.Add(iClose(_Symbol, PERIOD_M30, 0));
                              target.Add(iClose(_Symbol, PERIOD_M15, 0));
                              target.Add(iClose(_Symbol, PERIOD_M5, 0));
                              target.Add(iClose(_Symbol, PERIOD_M1, 0));
          //---
          return;//
          /*
          inputVals.Add(0.5);
          inputVals.Add(1.5);
          inputVals.Add(2.5);
          inputVals.Add(3.5);
          inputVals.Add(4.5);
          inputVals.Add(5.5);
          inputVals.Add(6.5);
          inputVals.Add(7.5);
          inputVals.Add(8.5);
          //
          targetVals.Add(1.5);
          targetVals.Add(2.5);
          targetVals.Add(3.5);
          targetVals.Add(4.5);
          targetVals.Add(5.5);
          targetVals.Add(6.5);
          targetVals.Add(7.5);
          targetVals.Add(8.5);
          targetVals.Add(9.5);

          */
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
uchar CAI_NeuralNetwork::OptimizeOFFER( ushort bw, ushort sw, ushort bl, ushort sl)
{         uchar offer = 0;
          /*-----------------------------------------------------------------*/
          /* CALC BUY SELL PROFITED NON PROFITED SENSITIVITY GONE MINOR LOSS */
          /*-----------------------------------------------------------------*/
          {         if(bw > sw)// zone profit buy
                    {         /*-------------------------------*/
                              /* BUY PROFITED HUGE [2X,0x,Y,Y] */
                              /*-------------------------------*/
                              offer =  1; //permenet
                              if(bl > sl)//zone loss_buy grater=>make sell
                              {         /*-------------------------------------*/
                                        /* BUY NON PROFITED HUGE [2X,0x,4Y,0y] */
                                        /*-------------------------------------*/
                                        //  offer =  "OFFER(SELL)"; // permenet
                                        if(bw > bl)//SELL   [4,0,1,0]   //----PRIORITY BY BURNED SELL    // victory sell
                                        {         /*-----------------------------------------------------------*/
                                                  /* BUY PROFITED HUGE && BUY NON PROFITED HUGE [2XX,0x,4Yy,0y] */
                                                  /*-----------------------------------------------------------*/
                                                  offer =  1; // permenet  [2,0,1,0] -> BUY //"OFFER(BUY)"
                                        }
                                        else if(bw == bl)
                                        {         /*------------------------------------------------------------*/
                                                  /* BUY PROFITED HUGE && BUY NON PROFITED HUGE [2XX,0x,4YY,0y] */
                                                  /*------------------------------------------------------------*/
                                                  offer =  1; //permenet   [2,0,2,0] -> SELL SECOUND CHANCE GONE SELL
                                        }//
                                        else if(bw < bl)//BUY
                                        {         /*------------------------------------------------------------*/
                                                  /* BUY PROFITED HUGE && BUY NON PROFITED HUGE [2Xx,0x,4YY,0y] */
                                                  /*------------------------------------------------------------*/
                                                  offer =  3; //permenet  [2,0,3,0] -> SELL
                                        } //
                              }
                              else if(bl == sl)
                              {         /*-------------------------------------------*/
                                        /* BUY sell NON PROFITED EQUAL [2X,0x,4Y,4Y] */
                                        /*-------------------------------------------*/
                                        //offer =  "OFFER(BUY)"; //
                                        if(bw > bl)//  [1,0,0,0] [3,1,2,2]  //SELL      //----PRIORITY BY BURNED SELL    // victory sell
                                        {         /*-----------------------------------------------------------------*/
                                                  /* BUY PROFITED HUGE && BUY sell NON PROFITED EQUAL [2XX,0x,4Yy,4Y] */
                                                  /*-----------------------------------------------------------------*/
                                                  offer =  1; // permenet [2, 0, 0, 0]
                                        }
                                        else if(bw == bl)
                                        {         /*------------------------------------------------------------------*/
                                                  /* BUY PROFITED HUGE && BUY sell NON PROFITED EQUAL [2XX,0x,4YY,4Y] */
                                                  /*------------------------------------------------------------------*/
                                                  offer =  1; //permenet
                                        }//
                                        else if(bw < bl)//BUY
                                        {         /*------------------------------------------------------------------*/
                                                  /* BUY PROFITED HUGE && BUY sell NON PROFITED EQUAL [2Xx,0x,4YY,4Y] */
                                                  /*------------------------------------------------------------------*/
                                                  offer =  3; //permenet
                                        } //
                              }//
                              else if(bl < sl)///zone loss_sell grater =>make buy
                              {         /*--------------------------------------*/
                                        /* SELL NON PROFITED HUGE [2X,0x,0y,4Y] */
                                        /*--------------------------------------*/
                                        //offer =  "OFFER(BUY)"; // permenet
                                        if(bw > bl)//SELL      //----PRIORITY BY BURNED SELL    // victory sell
                                        {         /*-------------------------------------------------------------*/
                                                  /* BUY PROFITED HUGE && SELL NON PROFITED HUGE [2XX,0x,0yy,4Y] */
                                                  /*-------------------------------------------------------------*/
                                                  offer =  1; // permenet //[1, 0, 0, 4]
                                        }
                                        else if(bw == bl)
                                        {         /*-------------------------------------------------------------*/
                                                  /* BUY PROFITED HUGE && SELL NON PROFITED HUGE [2XX,0x,0yX,4Y] */
                                                  /*-------------------------------------------------------------*/
                                                  offer =  1; //permenet
                                        }//
                                        else if(bw < bl)//BUY
                                        {         /*-------------------------------------------------------------*/
                                                  /* BUY PROFITED HUGE && SELL NON PROFITED HUGE [2Xx,0x,0yY,4Y] *///[1, 0, 7, 0]
                                                  /*-------------------------------------------------------------*/
                                                  offer =  3; //permenet
                                        } //
                              } //
                    } //
                    else if(bw == sw)//
                    {         /*-------------------------------------*/
                              /* SELL BUY PROFITED EQUAL [2X,2X,Y,Y] */ //RESET
                              /*-------------------------------------*/
                              offer =  1; //permenet
                              if(bl > sl)//fbuy //grater
                              {         /*-------------------------------------*/
                                        /* BUY NON PROFITED HUGE [2X,2X,4Y,0y] */
                                        /*-------------------------------------*/
                                        offer =  2; // permenet
                                        if(sw > sl)//buy
                                        {         /*------------------------------------------------------------------*/
                                                  /* SELL BUY PROFITED EQUAL && BUY NON PROFITED HUGE [2X,2XX,4Y,0yy] */
                                                  /*------------------------------------------------------------------*/
                                                  offer =  2; // permenet
                                        }
                                        else if(sw == sl) //[0, 0, 2, 0] ! WHY FORCED TO BUY [0,0,2,0]
                                        {         /*------------------------------------------------------------------*/
                                                  /* SELL BUY PROFITED EQUAL && BUY NON PROFITED HUGE [2X,2XX,4Y,0yX] */ //[0, 0, 3, 0] VERIFIED
                                                  /*------------------------------------------------------------------*/
                                                  offer =  2; // permenet [0,0,2,0] == [0,0,1,0]
                                        }
                                        else if(sw < sl)//sell
                                        {         /*------------------------------------------------------------------*/
                                                  /* SELL BUY PROFITED EQUAL && BUY NON PROFITED HUGE [2X,2Xx,4Y,0yY] */
                                                  /*------------------------------------------------------------------*/
                                                  offer =  3; //permenet BUY [0,0,2,1] [0,0,4,1]        [10, 10, 15, 10][10, 10, 8, 1] VVV SENSITIVITY GONE MINOR LOSS
                                        } //
                              }//
                              else if(bl == sl)//equal RESET
                              {         /*-------------------------------------------*/
                                        /* BUY sell NON PROFITED EQUAL [2X,2X,4Y,4Y] */
                                        /*-------------------------------------------*/
                                        offer =  1; // permenet force bye frist
                                        if(bw > bl)//SELL
                                        {         /*------------------------------------------------------------------------*/
                                                  /* SELL BUY PROFITED EQUAL && BUY sell NON PROFITED EQUAL [2XX,2X,4Yy,4Y] */
                                                  /*------------------------------------------------------------------------*/
                                                  offer =  1; // permenet
                                        }
                                        else if(bw == bl)
                                        {         /*------------------------------------------------------------------------*/
                                                  /* SELL BUY PROFITED EQUAL && BUY sell NON PROFITED EQUAL [2XX,2X,4YY,4Y] *///RE4SET
                                                  /*------------------------------------------------------------------------*/
                                                  offer =  1; //permenet
                                        }//
                                        else if(bw < bl)//BUY RESET
                                        {         /*------------------------------------------------------------------------*/
                                                  /* SELL BUY PROFITED EQUAL && BUY sell NON PROFITED EQUAL [2Xx,2X,4YY,4Y] */
                                                  /*------------------------------------------------------------------------*/
                                                  offer =  2; //permenet RESET [0,0,1,1] [10, 10, 10, 10][10, 10, 1, 1] VVV SENSITIVITY GONE MINOR LOSS
                                        } //
                              }//
                              else if(bl < sl)//lower  //---BUY WIN MOST //permenet[0, 0, 1, 3][10, 10, 1, 3] WEITH GONE TO BUY
                              {         /*--------------------------------------*/
                                        /* SELL NON PROFITED HUGE [2X,2X,0y,4Y] */
                                        /*--------------------------------------*/
                                        //offer =  "OFFER(BUY)"; // permenet
                                        if(sw > sl)//buy------EXTRA
                                        {         /*-------------------------------------------------------------------*/
                                                  /* SELL BUY PROFITED EQUAL && SELL NON PROFITED HUGE [2X,2XX,0y,4Yy] */
                                                  /*-------------------------------------------------------------------*/
                                                  offer =  3; // permenet
                                        }
                                        else if(sw == sl) //[0, 0, 2, 0] ! WHY FORCED TO BUY [0,0,2,0][10, 10, 1, 10]
                                        {         /*-------------------------------------------------------------------*/
                                                  /* SELL BUY PROFITED EQUAL && SELL NON PROFITED HUGE [2X,2XX,0y,4YY] */
                                                  /*-------------------------------------------------------------------*/
                                                  offer =  1; // permenet RESETED
                                        }
                                        else if(sw < sl)//sell
                                        {         /*-------------------------------------------------------------------*/
                                                  /* SELL BUY PROFITED EQUAL && SELL NON PROFITED HUGE [2X,2Xx,0y,4YY] */ //[0, 0, 1, 3] //[0, 0, 0, 2] //[0, 0, 0, 2]VERIFIED
                                                  /*-------------------------------------------------------------------*/
                                                  offer =  1; //permenet BUY [0, 0, 1, 3] [10, 10, 1, 3] VVV SENSITIVITY GONE MINOR LOSS
                                        } //-
                              }//
                    }
                    else if(bw < sw)//WIN SELL zone profited sell grater
                    {         /*--------------------------------*/
                              /* SELL PROFITED HUGE [0x,2X,Y,Y] */
                              /*--------------------------------*/
                              offer =  2;
                              if(bl > sl)//sell  loss_trade_buy_grater
                              {         /*-------------------------------------*/
                                        /* BUY NON PROFITED HUGE [0x,2X,4Y,0y] */
                                        /*-------------------------------------*/
                                        offer =  2; //permenet
                                        if(sw > sl)// [0,4,2,0] [0,3,1,0]  trade_sell_profit_grater_loss
                                        {         /*-------------------------------------------------------------*/
                                                  /* SELL PROFITED HUGE && BUY NON PROFITED HUGE [0x,2XX,4Y,0yy] */
                                                  /*-------------------------------------------------------------*/
                                                  offer =  2; // permenet        [5, 26, 25, 20]  [5, 27, 18, 11] ->[0, 22, 13, 6] VVV SENSITIVITY GONE MINOR LOSS
                                        }
                                        else if(sw == sl)
                                        {         //
                                                  /*-------------------------------------------------------------*/
                                                  /* SELL PROFITED HUGE && BUY NON PROFITED HUGE [0x,2XX,4Y,0yY] */
                                                  /*-------------------------------------------------------------*/
                                                  offer =  2; // permenet        [5, 20, 25, 20]  [5, 11, 18, 11] ->[0, 6, 13, 6] VVV SENSITIVITY GONE MINOR LOSS  RESET
                                        }
                                        else if(sw < sl)//sell
                                        {         /*-------------------------------------------------------------*/
                                                  /* SELL PROFITED HUGE && BUY NON PROFITED HUGE [0x,2Xx,4Y,0yY] */
                                                  /*-------------------------------------------------------------*/
                                                  offer =  3; //permenet         [5, 15, 25, 20]  [5, 8, 18, 11]  ->[0, 3, 13, 6] VVV SENSITIVITY GONE MINOR LOSS
                                        } //
                              }
                              else if(bl == sl)//loss_trade_buy_equal
                              {         /*-----------------------------------------*/
                                        /* BUY sell NON PROFITED EQUAL [0x,2X,Y,Y] */
                                        /*-----------------------------------------*/
                                        offer =  2; //
                                        if(sw > sl)//  trade_sell_profit_grater_loss
                                        {         /*-----------------------------------------------------------------*/
                                                  /* SELL PROFITED HUGE && BUY sell NON PROFITED EQUAL [0x,2XX,Y,Yy] */
                                                  /*-----------------------------------------------------------------*/
                                                  offer =  2; // permenet  [1,4,1,1]   [15, 26, 25, 25] ->[0, 4, 0, 0] VVV SENSITIVITY GONE MINOR LOSS
                                        }
                                        else if(sw == sl)
                                        {         /*-----------------------------------------------------------------*/
                                                  /* SELL PROFITED HUGE && BUY sell NON PROFITED EQUAL [0x,2XX,Y,YY] */ //RESET
                                                  /*-----------------------------------------------------------------*/
                                                  offer =  2; // permenet              [15, 25, 25, 25] ->[0, 0, 0, 0] VVV SENSITIVITY GONE MINOR LOSS
                                        }
                                        else if(sw < sl)//sell
                                        {         /*-----------------------------------------------------------------*/
                                                  /* SELL PROFITED HUGE && BUY sell NON PROFITED EQUAL [0x,2Xx,Y,YY] */
                                                  /*-----------------------------------------------------------------*/
                                                  offer =  3; //permenet                [15, 24, 25, 25] ->[0, 3, 4, 4] VVV SENSITIVITY GONE MINOR LOSS  //--GONE VOID BETHER
                                        } //
                              }//
                              else if(bl < sl)//  loss_trade_sell_grater
                              {         /*--------------------------------------*/
                                        /* SELL NON PROFITED HUGE [0x,2X,0y,4Y] */
                                        /*--------------------------------------*/
                                        offer =  1; //permenet
                                        if(sw > sl)//  trade_sell_profit_grater_loss
                                        {         /*-----------------------------------------------------------------*/
                                                  /* SELL PROFITED HUGE && BUY sell NON PROFITED HUGE [0x,2XX,0y,4Yy] */
                                                  /*-----------------------------------------------------------------*/
                                                  offer =  2; // permenet  [1,4,1,1]   [15, 26, 25, 25] ->[0, 4, 0, 0] VVV SENSITIVITY GONE MINOR LOSS
                                        }
                                        else if(sw == sl)
                                        {         /*-----------------------------------------------------------------*/
                                                  /* SELL PROFITED HUGE && BUY sell NON PROFITED HUGE [0x,2Xx,0y,4YY] */ //RESET
                                                  /*-----------------------------------------------------------------*/
                                                  offer =  3; // permenet              [15, 25, 25, 25] ->[0, 0, 0, 0] VVV SENSITIVITY GONE MINOR LOSS
                                        }
                                        else if(sw < sl)//sell
                                        {         /*-----------------------------------------------------------------*/
                                                  /* SELL PROFITED HUGE && BUY sell NON PROFITED HUGE [0x,2Xx,0y,4YY] */
                                                  /*-----------------------------------------------------------------*/
                                                  offer =  3; //permenet                [15, 24, 25, 25] ->[0, 3, 4, 4] VVV SENSITIVITY GONE MINOR LOSS  //--GONE VOID BETHER
                                        } //
                              } //
                    } //
          }//
          return offer; //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CAI_NeuralNetwork2
{
public:

          CAI_NeuralNetwork2(bool mode2, string test) {IsTrained = false; isTarget2 = 1;  SetInit_NETWORK_LAYERS(); ;  }; //--not inited at constraction  myNet200 = CNet(topology20, Sigmoid, Sigmoid);
          CAI_NeuralNetwork2(void) {  };
          ~CAI_NeuralNetwork2(void) {  };//delete myNet2;
          //----------------------------------------------------------
          uint       show_time;// = 50; // Chart display time (seconds)
          bool       IsTrained;
          bool       isTarget2;
          //----------------------------------------------------------
          int       MainProgress2(bool b);
          void      Set_Results_ByError(string descI, int idx, double & accuracy, string & signal_info, string desctype, CArrayDouble_MQL4 & targetVals, CArrayDouble_MQL4 & resultVals);
          //----------------------------------------------------------
          //---------------------------------------------------------
          CAI_NeuralNetwork_DATAS  DATAS2;
          void _MainRun_2();

          void Fill_Inputs2(CArrayDouble_MQL4 &inp, CArrayDouble_MQL4 &target, bool unseen = false);
          //---------------------------------------------------------
          //--- create our neural network
          CArrayInt_MQL4        topology20;
          //--- Initialize the network with our configuration
          //CNet                  myNet2009x;//--errorr internal
          //bool                  IsNetCreated;
          //--- create data containers
          CArrayDouble_MQL4     inputVals2, targetVals2, resultVals2;   ///--{0.0,     0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0}
          void SetInit_NETWORK_LAYERS();
          void TrainData(CArrayInt_MQL4 &topology2, CNet &myNet00);

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CAI_NeuralNetwork2::SetInit_NETWORK_LAYERS()          //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
{         /*------------------------------------------------*/
          //--- create our neural network
          //CArrayInt_MQL4 topology2;
          topology20.Shutdown();
          topology20.Add(8);    //frist layer>>>>>//---adding element n to array elements form end//dependet number of element you want to input
          topology20.Add(21);    //middle layer>>>>> //--resulation gunaguni
          topology20.Add(14);    //middle layer>>>>> //--resulation gunaguni
          topology20.Add(4);    //middle layer>>>>> //--resulation gunaguni
          //topology20.Add(12);    //middle layer>>>>> //--resulation gunaguni
          topology20.Add(9);
          /*-------------------------------------------------*/
          //--- create data containers
          //CArrayDouble_MQL4 inputVals, targetVals, resultVals;   ///--{0.0,     0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0}
          /*-------------------------------------------------*/
}
//+------------------------------------------------------------------+
int CAI_NeuralNetwork2::MainProgress2(bool b)
{
//
          if(!b) {   return -1; }
          {         /*LOAD*///inner
                    /*PROGRESS*/ _MainRun_2(); //Extract Trade Signal
                    /*PROGRESS*/ //Vtrade();    //Trade Signal virtualy
                    /*SAVE*///inner
          }
          return 0;
//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CAI_NeuralNetwork2::_MainRun_2()
{         /*-------------------------------------------------*/
          CNet myNet201(topology20, Sigmoid, Sigmoid);
          //--- Initialize the network with our configuration
          {         //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
                    //--- SetInit_NETWORK_LAYERS();
                    /*-------------------------------------------------*/
                    TrainData(topology20, myNet201);
                    //--- training complete. Get prediction of unseen data and plot
                    //
                    Fill_Inputs2(inputVals2, targetVals2, true); ///the learning and wanted target must realative
                    myNet201.feedForward(inputVals2, __FUNCTION__, __LINE__);//
          }
          /*-------------------------------------------------*/
          //--- print results
          double inp2[];
          {         myNet201.getResults(resultVals2);//--------------where result are assigned just return last layer neurons order-----------------///
                    //---
          }
          /*-------------------------------------------------*/
          DATAS2.SignalInfo_InputsPatern = "";
          DATAS2.SignalInfoAH = DATAS2.SignalInfoAL = "";
          DATAS2.SignalInfoBH = DATAS2.SignalInfoBL = "";
          DATAS2.SignalInfoCH = DATAS2.SignalInfoCL = "";
          DATAS2.SignalInfoDH = DATAS2.SignalInfoDL = "";
          DATAS2.SignalCommand = "";
          /*-------------------------------------------------*/
          {         ArrayResize(inp2, inputVals2.Total());
                    for(int i = 0; i < inputVals2.Total() && !IsStopped(); ++i) inp2[i] = inputVals2.At(i);
                    //---
                    //ArrayPrint(inp);
                    string Desc = "";
                    for(int i = 0; i < inputVals2.Total(); i++)  { Desc += (string)inp2[i] + ""; }
                    DATAS2.SignalInfo_InputsPatern += "Inputs : " + Desc ; //Print("\nInputs : ", Desc);//
                    //string InputsDesc[]; 2^48 not good for handeling 281,474,976,710,656
          }
          /*-------------------------------------------------*/
          double accuracyBuy1           = 0;      Set_Results_ByError("", 0, accuracyBuy1, DATAS2.SignalInfoAH, "BCH", targetVals2, resultVals2);
          double accuracyBuy7           = 0;      Set_Results_ByError("", 1, accuracyBuy7, DATAS2.SignalInfoAH, "BCH", targetVals2, resultVals2);
          double accuracyBuy5           = 0;      Set_Results_ByError("", 2, accuracyBuy5, DATAS2.SignalInfoAH, "BCH", targetVals2, resultVals2);
          double accuracyBuy2           = 0;      Set_Results_ByError("", 3, accuracyBuy2, DATAS2.SignalInfoAH, "BCH", targetVals2, resultVals2);
          double accuracyBuySell0       = 0;      Set_Results_ByError("", 4, accuracyBuySell0, DATAS2.SignalInfoAH, "BCH", targetVals2, resultVals2);
          double accuracySell2          = 0;      Set_Results_ByError("", 5, accuracySell2, DATAS2.SignalInfoAH, "BCH", targetVals2, resultVals2);
          double accuracySell5          = 0;      Set_Results_ByError("", 6, accuracySell5, DATAS2.SignalInfoAH, "BCH", targetVals2, resultVals2);
          double accuracySell7          = 0;      Set_Results_ByError("", 7, accuracySell7, DATAS2.SignalInfoAH, "BCH", targetVals2, resultVals2);
          double accuracySell1          = 0;      Set_Results_ByError("", 8, accuracySell1, DATAS2.SignalInfoAH, "BCH", targetVals2, resultVals2);
          /*-------------------------------------------------*/
          /*-------------------------------------------------*/
          {         //
                    //if(isTarget2)
                    //    {         if(accuracyA > 90)       { DATAS.SignalCommand = "BUY";  }
                    //              else if(accuracyB > 90)  { DATAS.SignalCommand = "SELL"; } //
                    //    }
                    //    else
                    {         if      (accuracyBuy2 > 95) { DATAS2.SignalCommand = "Buy";  }
                              else if (accuracySell2 > 95) { DATAS2.SignalCommand = "Sell";  } //
                    } //
          }
          //-----------------------------------------------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CAI_NeuralNetwork2::Set_Results_ByError(string descI, int idx, double & accuracy, string & signal_info, string desctype, CArrayDouble_MQL4 & targetVals, CArrayDouble_MQL4 & resultVals)
{         //--- check availability of results
          signal_info += " " + descI + "R : " + DoubleToString(resultVals.At(idx), 1); // Print("Result_A : ", DoubleToString(resultVals.At(0), 4));
          signal_info += " E : " + DoubleToString(targetVals.At(idx), 1); //Print("Expected_A : ", DoubleToString(targetVals.At(0), 4));
          //--- check accuracy
          double expected  = targetVals.At(idx);
          double predicted = resultVals.At(idx);
          //---
          //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
          double error = MathAbs(predicted - expected);
          accuracy = 100.0 - ((error / (1 + 1)) * 100);
          signal_info += " Ac: " + DoubleToString(accuracy, 0) + "% " + desctype ; //Print("Accuracy_A : ", DoubleToString(accuracyA, 2) + "%"); //
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CAI_NeuralNetwork2::TrainData(CArrayInt_MQL4 &topology2, CNet &myNet00)
{         if(IsTrained == false)
          {         double        rms[]; //---reserve epochs count
                    uint          epochs = 1000;//--any cycle
                    ArrayResize(rms, 0, (int)epochs);
                    uint          trainingPass = 0;
                    //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
                    /*-------------------------------------------------*/
                    //--- loop and train the network
                    while(trainingPass < epochs)
                    {         ++trainingPass;
                              //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
                              /*-------------------------------------------------*/
                              //--- create training data and check compatibility with the network
                              //--- number of inputs MUST be equal to number of input neurons in your network
                              //
                              Fill_Inputs2(inputVals2, targetVals2);
                              /*-------------------------------------------------*/
                              if(inputVals2.Total() != topology2.At(0)) { Print("Incompatible inputs!"); break; } //numberof element of each layer //--what's value at element 0  /// cheack number of elements are the same input and topology layers
                              /*-------------------------------------------------*/
                              //--- make the network predict the result
                              myNet00.feedForward(inputVals2, __FUNCTION__, __LINE__); //--not recuresive call-----just recuresice in activation function
                              /*-------------------------------------------------*/
                              //--- check compatibility of target values and number of output neurons
                              //--- target values must be equal to the number of output neurons
                              if(targetVals2.Total() != topology2.At(topology2.Total() - 1)) { Print("Incompatible targetVals"); break; }//numberof element of each layer
                              /*-------------------------------------------------*/
                              //--- make the network learn
                              myNet00.backProp(targetVals2);
                              //---
                              /*-------------------------------------------------*/
                              uint index = ArraySize(rms);
                              ArrayResize(rms, index + 1);
                              rms[index] = myNet00.getRecentAverageError(); //
                              /*-------------------------------------------------*/
                    }//
                    IsTrained = 0; //
          }//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CAI_NeuralNetwork2::Fill_Inputs2(CArrayDouble_MQL4 &inp, CArrayDouble_MQL4 &target, bool unseen = false)
{         /*-------------------------------------------------------------*/
          /* change inputs value random not change outed result value!!  */
          /*-------------------------------------------------------------*/
          /*-------------------------------------------------------------*/
          /* change inputs value random not change outed result value!!  */
          /*-------------------------------------------------------------*/
          //--- generate training samples
          if(!unseen)
          {         if(inp.Total() == 0) inp.Add(0.0);//---not inited
                    //---
                    if(inp.At(0) == 0.0)//---not inited before call this function
                    {         inp.Clear();
                              inp.Add(iStochastic( _Symbol, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, 1) > iStochastic( _Symbol, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, 1) ? +1.0 : -1.0);
                              inp.Add(iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 0) > iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 1) ? +1.0 : -1.0);
                              inp.Add(iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 0)       > iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 0) ? +1.0 : -1.0);
                              inp.Add(iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > -0.5 ? -1.0 : +1.0);
                              inp.Add(iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < 0.5 ? -1.0 : +1.0);
                              inp.Add(iOBV(_Symbol, PERIOD_M5, PRICE_CLOSE, 0) > iOBV(_Symbol, PERIOD_M5, PRICE_CLOSE, 14) ? +1.0 : -1.0);
                              inp.Add((iWPR(_Symbol, PERIOD_M1, 200, 0) > -20) ? +1.0 : -1.0);
                              inp.Add(iRSI(_Symbol, PERIOD_M30, 14, PRICE_CLOSE, 0) > iRSI(_Symbol, PERIOD_M30, 14, PRICE_CLOSE, 1) ? +1.0 : -1.0);
                              //extra
                              //---
                              target.Clear();
                              //target.Add(Target);//answer [1]
                              //if(isTarget2)target.Add(Target2);
                              //target.Add(iWPR(_Symbol, PERIOD_M1, 200, 1) > iWPR(_Symbol, PERIOD_M1, 200, 7) && iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 0) > iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 1) ? +0.8 : -0.5);//Ticker.Data.isBuySignal//Ticker.Data.isSellSignal
                              //target.Add(iWPR(_Symbol, PERIOD_M1, 200, 1) < iWPR(_Symbol, PERIOD_M1, 200, 7) && iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 0) < iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 1) ? -0.8 : +0.5);
                              target.Add(+1.0);
                              target.Add(+0.7);
                              target.Add(+0.5);
                              target.Add(+0.2);
                              target.Add(0.0);
                              target.Add(-0.2);
                              target.Add(-0.5);
                              target.Add(-0.7);
                              target.Add(-1.0);
                              //---
                              return;//
                    }
                    else
                    {         inp.Clear();
                              inp.Add(iStochastic( _Symbol, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, 1) > iStochastic( _Symbol, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, 1) ? +1.0 : -1.0);
                              inp.Add(iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 0) > iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 1) ? +1.0 : -1.0);
                              inp.Add(iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 0)       > iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 0) ? +1.0 : -1.0);
                              inp.Add(iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > -0.5 ? -1.0 : +1.0);
                              inp.Add(iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < 0.5 ? -1.0 : +1.0);
                              inp.Add(iOBV(_Symbol, PERIOD_M5, PRICE_CLOSE, 0) > iOBV(_Symbol, PERIOD_M5, PRICE_CLOSE, 14) ? +1.0 : -1.0);
                              inp.Add((iWPR(_Symbol, PERIOD_M1, 200, 0) > -20) ? +1.0 : -1.0);
                              inp.Add(iRSI(_Symbol, PERIOD_M30, 14, PRICE_CLOSE, 0) > iRSI(_Symbol, PERIOD_M30, 14, PRICE_CLOSE, 1) ? +1.0 : -1.0);
                              //extra
                              //---
                              target.Clear();
                              //target.Add(Target);
                              //if(isTarget2)target.Add(Target2);
                              //target.Add(iWPR(_Symbol, PERIOD_M1, 200, 1) > iWPR(_Symbol, PERIOD_M1, 200, 7) && iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 0) > iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 1) ? +0.8 : -0.5);//Ticker.Data.isBuySignal//Ticker.Data.isSellSignal
                              //target.Add(iWPR(_Symbol, PERIOD_M1, 200, 1) < iWPR(_Symbol, PERIOD_M1, 200, 7) && iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 0) < iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 1) ? -0.8 : +0.5);
                              target.Add(+1.0);
                              target.Add(+0.7);
                              target.Add(+0.5);
                              target.Add(+0.2);
                              target.Add(0.0);
                              target.Add(-0.2);
                              target.Add(-0.5);
                              target.Add(-0.7);
                              target.Add(-1.0);
                              //---
                              return; //
                    } //
          }
          //--- if we are here, unseen data is needed [1,1,0] answer [1]
          inp.Clear();
          inp.Add(iStochastic( _Symbol, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_MAIN, 1) > iStochastic( _Symbol, PERIOD_M5, 5, 3, 3, MODE_SMA, 0, MODE_SIGNAL, 1)         ? +1.0 : -1.0);
          inp.Add(iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 0) > iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 1)                                                           ? +1.0 : -1.0);
          inp.Add(iMA(_Symbol, PERIOD_M1, 20, 0, MODE_EMA, PRICE_CLOSE, 0)       > iMA(_Symbol, PERIOD_M1, 30, 0, MODE_SMA, PRICE_CLOSE, 0)                             ? +1.0 : -1.0);
          inp.Add(iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) > -0.5                                                                                ? -1.0 : +1.0);
          inp.Add(iMACD(_Symbol, PERIOD_M1, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, 0) < 0.5                                                                                 ? -1.0 : +1.0);
          inp.Add(iOBV(_Symbol, PERIOD_M5, PRICE_CLOSE, 0) > iOBV(_Symbol, PERIOD_M5, PRICE_CLOSE, 14)                                                                  ? +1.0 : -1.0);
          inp.Add((iWPR(_Symbol, PERIOD_M1, 200, 0) > -20)                                                                                                              ? +1.0 : -1.0);
          inp.Add(iRSI(_Symbol, PERIOD_M30, 14, PRICE_CLOSE, 0) > iRSI(_Symbol, PERIOD_M30, 14, PRICE_CLOSE, 1)                                                         ? +1.0 : -1.0);
          //inp.Add(UP_OUT    == Ticker.Data.GetMACD_State(PERIOD_M1) ? -1.0 : 0.0);
          //inp.Add(DOWN_OUT  == Ticker.Data.GetMACD_State(PERIOD_M1) ? +1.0 : 0.0);
          //inp.Add(UP_IN     == Ticker.Data.GetMACD_State(PERIOD_M1) ? +1.0 : 0.0);
          //inp.Add(DOWN_IN   == Ticker.Data.GetMACD_State(PERIOD_M1) ? -1.0 : 0.0);
          ////
          //inp.Add(UP_OUT    == Ticker.Data.GetMACD_State(PERIOD_M5) ? -1.0 : 0.0);
          //inp.Add(DOWN_OUT  == Ticker.Data.GetMACD_State(PERIOD_M5) ? +1.0 : 0.0);
          //inp.Add(UP_IN     == Ticker.Data.GetMACD_State(PERIOD_M5) ? +1.0 : 0.0);
          //inp.Add(DOWN_IN   == Ticker.Data.GetMACD_State(PERIOD_M5) ? -1.0 : 0.0);
          ////
          //inp.Add(UP_OUT    == Ticker.Data.GetMACD_State(PERIOD_M15) ? -1.0 : 0.0);
          //inp.Add(DOWN_OUT  == Ticker.Data.GetMACD_State(PERIOD_M15) ? +1.0 : 0.0);
          //inp.Add(UP_IN     == Ticker.Data.GetMACD_State(PERIOD_M15) ? +1.0 : 0.0);
          //inp.Add(DOWN_IN   == Ticker.Data.GetMACD_State(PERIOD_M15) ? -1.0 : 0.0);
          ////
          //inp.Add(UP_OUT    == Ticker.Data.GetMACD_State(PERIOD_M30) ? -1.0 : 0.0);
          //inp.Add(DOWN_OUT  == Ticker.Data.GetMACD_State(PERIOD_M30) ? +1.0 : 0.0);
          //inp.Add(UP_IN     == Ticker.Data.GetMACD_State(PERIOD_M30) ? +1.0 : 0.0);
          //inp.Add(DOWN_IN   == Ticker.Data.GetMACD_State(PERIOD_M30) ? -1.0 : 0.0);
          ////
          //inp.Add(UP_OUT    == Ticker.Data.GetMACD_State(PERIOD_H1) ? -1.0 : 0.0);
          //inp.Add(DOWN_OUT  == Ticker.Data.GetMACD_State(PERIOD_H1) ? +1.0 : 0.0);
          //inp.Add(UP_IN     == Ticker.Data.GetMACD_State(PERIOD_H1) ? +1.0 : 0.0);
          //inp.Add(DOWN_IN   == Ticker.Data.GetMACD_State(PERIOD_H1) ? -1.0 : 0.0);
          ////
          //inp.Add(UP_OUT    == Ticker.Data.GetMACD_State(PERIOD_H4) ? -1.0 : 0.0);
          //inp.Add(DOWN_OUT  == Ticker.Data.GetMACD_State(PERIOD_H4) ? +1.0 : 0.0);
          //inp.Add(UP_IN     == Ticker.Data.GetMACD_State(PERIOD_H4) ? +1.0 : 0.0);
          //inp.Add(DOWN_IN   == Ticker.Data.GetMACD_State(PERIOD_H4) ? -1.0 : 0.0);
          ////
          //inp.Add(UP_OUT    == Ticker.Data.GetMACD_State(PERIOD_D1) ? -1.0 : 0.0);
          //inp.Add(DOWN_OUT  == Ticker.Data.GetMACD_State(PERIOD_D1) ? +1.0 : 0.0);
          //inp.Add(UP_IN     == Ticker.Data.GetMACD_State(PERIOD_D1) ? +1.0 : 0.0);
          //inp.Add(DOWN_IN   == Ticker.Data.GetMACD_State(PERIOD_D1) ? -1.0 : 0.0);
          ////
          //inp.Add(UP_OUT    == Ticker.Data.GetMACD_State(PERIOD_W1) ? -1.0 : 0.0);
          //inp.Add(DOWN_OUT  == Ticker.Data.GetMACD_State(PERIOD_W1) ? +1.0 : 0.0);
          //inp.Add(UP_IN     == Ticker.Data.GetMACD_State(PERIOD_W1) ? +1.0 : 0.0);
          //inp.Add(DOWN_IN   == Ticker.Data.GetMACD_State(PERIOD_W1) ? -1.0 : 0.0);
          ////
          //inp.Add(UP_OUT    == Ticker.Data.GetMACD_State(PERIOD_MN1) ? -1.0 : 0.0);
          //inp.Add(DOWN_OUT  == Ticker.Data.GetMACD_State(PERIOD_MN1) ? +1.0 : 0.0);
          //inp.Add(UP_IN     == Ticker.Data.GetMACD_State(PERIOD_MN1) ? +1.0 : 0.0);
          //inp.Add(DOWN_IN   == Ticker.Data.GetMACD_State(PERIOD_MN1) ? -1.0 : 0.0);
          //extra
          //---
          target.Clear();
          //target.Add(Target);//answer [1]
          //if(isTarget2)target.Add(Target2);
          //target.Add(iWPR(_Symbol, PERIOD_M1, 200, 1) > iWPR(_Symbol, PERIOD_M1, 200, 7) && iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 0) > iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 1) ? +0.8 : -0.5);//Ticker.Data.isBuySignal//Ticker.Data.isSellSignal
          //target.Add(iWPR(_Symbol, PERIOD_M1, 200, 1) < iWPR(_Symbol, PERIOD_M1, 200, 7) && iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 0) < iRSI(_Symbol, PERIOD_M1, 14, PRICE_CLOSE, 1) ? -0.8 : +0.5);
          target.Add(+1.0);
          target.Add(+0.7);
          target.Add(+0.5);
          target.Add(+0.2);
          target.Add(0.0);
          target.Add(-0.2);
          target.Add(-0.5);
          target.Add(-0.7);
          target.Add(-1.0);
          //---
          return;//
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//inp.Clear();
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0 == E_True ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0 == E_False ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_InSide_Middle_Channel_Floor_Ceil_Bar0 == E_Void ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle == true ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Is_Bulish_All_Middle == false ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Upper_Upper ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Upper_Middle ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Upper_Lower ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Middle_Upper ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Middle_Middle ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Middle_Lower ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Lower_Upper ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Lower_Middle ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Lower_Lower ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.ChartAnalise.Object_Pack.Channels.ChannelsZigZag._Current.Place_Ninth == E_Place_Ninth_Void ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_Bulish == true ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsExpanding_20_Bulish == false ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Grater_m20 == true ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Lower_m80 == true ? 1.0 : -1);
//          inp.Add((!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Lower_m80 || !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Slow_Grater_m20 == true) ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 == true ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80 == true ? 1.0 : -1);
//          inp.Add((!ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Lower_m80 || !ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsBasic_Fast_Grater_m20 == true) ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_5_Above_3_Bearish == true ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators.MA_All__CURRENT_Modes_._EMA_._PRICE_CLOSE_.IsBasic_5_Above_3_Bearish == false ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.DATAS[0].Is_Signal_Grater_Main__Selling == true ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.DATAS[0].Is_Signal_Grater_Main__Selling == false ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M == true ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M == true ? 1.0 : -1);
//          inp.Add((!ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsBuyTriger_20_Grater_20_M || !ct_Drive.TDD.ct_Conductor.DC_data.Trigers.IsSellTriger_20_Lower_20_M == true) ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_[0] > ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_M[0]) == true ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_[0] > ct_Drive.TDD.ct_Conductor.DC_data.Trigers._500_M[0]) == false ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14) == true ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._WPR_Peroid._Current.IsExp_iWPR_200_iEMA200_iEMA200__iWPR_200_iEMA200___1_14) == false ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend) == true ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._RSI.IsRSI_14_UpTrend) == false ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Force.Is_Force_14_above_200_1_bulish) == true ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Force.Is_Force_14_above_200_1_bulish) == false ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MFI.Is_MFI_14_Above_200_1) == true ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MFI.Is_MFI_14_Above_200_1) == false ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._SAR.Is_SAR_ABOVE_CLOSE_1) == true ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._SAR.Is_SAR_ABOVE_CLOSE_1) == false ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic.IS_StochasticUpWard) == true ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic.IS_StochasticUpWard) == false ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic.IS_Bulish_200MUpS) == true ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.Indicators._Stochastic.IS_Bulish_200MUpS) == false ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Trend.IsTREND_BackWarding) == true ? 1.0 : -1);
//          inp.Add((ct_Drive.TDD.ct_Conductor.DC_data.CandleBars.Bars_Current[0].Bar_Trend.IsTREND_BackWarding) == false ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._MN.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._MN.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._MN.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._MN.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._W1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._W1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._W1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._W1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._D1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._D1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._D1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._D1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H4.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H4.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H4.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H4.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._H1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M30.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M30.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M30.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M15.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M15.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M15.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M15.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M5.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0] == UP_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0] == UP_OUT ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_IN ? 1.0 : -1);
//          inp.Add(ct_Drive.TDD.ct_Conductor.DC_data.Indicators._MACD_Peroid._M1.MACD_Cross_Signal.eMACD_STATE[0] == DOWN_OUT ? 1.0 : -1);
//          //extra
