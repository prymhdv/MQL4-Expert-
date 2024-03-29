//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#property  strict
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Scaler\NN_Neurons_Scaler_Net.mqh>
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

//---
struct NN_Neurons_Scaler_Vtrade
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
struct NN_Neurons_Scaler_Vtrade_DATAS
{         string SignalCommand;
          string SignalInfoAH, SignalInfoAL;;
          string SignalInfoBH, SignalInfoBL;; //
          string SignalInfoCH, SignalInfoCL;;
          string SignalInfoDH, SignalInfoDL;; //

          string SignalInfo_InputsPatern;
          string VtradeDesc;
          //----------------------------
          NN_Neurons_Scaler_Vtrade  _Vtrade;//
};
//---!sinput uint show_time = 50; // Chart display time (seconds)

//+------------------------------------------------------------------+
//|                                                                  |, double LearningRate = 0.15, double Momentom = 0.5
//+------------------------------------------------------------------+
class NN_Neurons_Scaler_Run
{
public:
          NN_Neurons_Scaler_Run(double fLearningRate, double fMomentom, double fRASF)  { IsTrained = false; isTarget2 = 1;    LearningRate = fLearningRate  ;   Momentom = fMomentom;  RASF = fRASF;};
          NN_Neurons_Scaler_Run(void)  { IsTrained = false; isTarget2 = 1; };
          ~NN_Neurons_Scaler_Run(void) {  };//delete myNet2;
          //----------------------------------------------------------
          uint       show_time;// = 50; // Chart display time (seconds)
          bool       IsTrained;
          bool       isTarget2;
          NN_Neurons_Scaler_Vtrade_DATAS  DATAS;
          uint        m_totalInputRange;
          //----------------------------------------------------------
          double LearningRate;          // = 0.15;
          double Momentom;              // = 0.5
          double RASF    ;              //= 100
          double calculateMSE(const CArrayDouble_MQL4 & predicted, const CArrayDouble_MQL4 & actual);
          //----------------------------------------------------------
          int       MainProgress(bool b);
          void       _MainRun_();//>...........................................................................................................
          void       fillInputsTraining(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &target[], int cycleTraining = 0);
          void       fillInputsValidation(CArrayDouble_MQL4 &inp[], int cycleValidation);
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
          //----------------------------------------------------------
          void      Vtrade();
          uchar     OptimizeOFFER( ushort bw, ushort sw, ushort bl, ushort sl);
          //---------------------------------------------------------


};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int NN_Neurons_Scaler_Run::MainProgress(bool b)
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
void NN_Neurons_Scaler_Run::Vtrade()
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
//# training rulls   1- series for training net by every epoche series_input_to_net
//# training for just one target neuron by  Sigmoid, ReLU LearningRate=0.45, Momentom 0.5
//# cheaking just put input. for forwarding no need target for balpropagation
//# define seting input targets by seen un seen key
//# packing 90 input ro 9 frame and then one frame out put path way
//# sence as input get priceclose and time of bar
void NN_Neurons_Scaler_Run::_MainRun_()
{         //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
          /*------------------------------------------------*/
          uint layerOneNeurons = 2;
          uint layerTwoNeurons = 1;//5
          uint layerOutNeurons = 1;
          m_totalInputRange = 10;
          //--- create our neural network
          CArrayInt_MQL4 topology;                      //--- add the configuration [2,2,1] //---!!
          topology.Add(layerOneNeurons);                //Input - frist  layer>>>>>//---adding element n to array elements form end//dependet number of element you want to input
          topology.Add(layerTwoNeurons);                //middle layer>>>>> //--resulation gunaguni //topology.Add(3 * m_totalInputRange / 2);
          topology.Add(layerOutNeurons);                //output layer>>>>>
          /*-------------------------------------------------*/
          //--- Initialize the network with our configuration
          NN_Neurons_Scaler_CNet myNet(topology, m_totalInputRange, NNNS_Sigmoid, NNNS_ReLU, LearningRate, Momentom, RASF);
          /*-------------------------------------------------*/
          //--- create data containers
          CArrayDouble_MQL4 inputVals_Vector[], targetVals_Vector[], resultVals_Vector[]/*outputsVals_Vector*/;   ///--{0.0,     0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0}
          ArrayResize(inputVals_Vector, m_totalInputRange);
          ArrayResize(targetVals_Vector, m_totalInputRange);
          ArrayResize(resultVals_Vector, m_totalInputRange);
          /*-------------------------------------------------*/
          //if(Detect_NewBar._M1.CBT__5Seccound.Is_NewBar && IsTrained == false)
          int TrainingDataSize    = 5;//700-300fixed targets
          uint ValidationDataSize = m_totalInputRange * 5;
          int Seriess             = 0;
          int trainingSeries      = 0;
          {         //
                    //while(trainingSeries <= Seriess)
                    //{         trainingSeries++;
                    /*-------------------------------------------------*/
                    //--- loop and train the network.
                    /*-------------------------------------------------*/
                    double        rms[]; //---reserve epochs count
                    uint          epochs = 63;//--any cycle//700-300fixed targets
                    ArrayResize(rms, 0, (int)epochs);
                    uint          trainingPass = 0;//count strart epoch
                    while(trainingPass < epochs)//every cycle adjusting weigth of network for input provided
                    {         ++trainingPass;
                              double expected = 0, predicted = 0;
                              /*-------------------------------------------------*/
                              //--- create training data and check compatibility with the network, number of inputs MUST be equal to number of input neurons in your network
                              fillInputsTraining(inputVals_Vector, targetVals_Vector, 0/*mustfixed until epoches end*/);
                              /*-------------------------------------------------*/
                              for(int i = 0; i < ArraySize(inputVals_Vector); i++)
                              {         //--assert that must topology inputlayer weights vector(contain inputs just) same as inputCounts vector
                                        //number of element of each layer //--what's value at element 0  /// cheack number of elements are the same input and topology layers
                                        if(inputVals_Vector[i].Total() != ArraySize(myNet.getLayer(0).getNeuron(0).getoutputWeights(0, __FUNCTION__, __LINE__).weight)) //topology.At(0)
                                        {         Print("berfore feedForward_Net: Incompatible inputs! S*R==R*1-->never run vector input and one neuron [weigtht is part of neuron]");
                                                  return;/*break;*/
                                        }
                                        //--- make the network predict the result
                                        myNet.feedForward_Net(inputVals_Vector[i], __FUNCTION__, __LINE__, i); //--not recuresive call-----just recuresice in activation function
                                        /*-------------------------------------------------*/
                              }
                              for(int i = 0; i < ArraySize(targetVals_Vector); i++)
                              {         //--- check compatibility of target values and number of output neurons, target values must be equal to the number of output neurons
                                        //if(ArraySize(targetVals_Vector) != topology.At(topology.Total() - 1))
                                        if(targetVals_Vector[i].Total() != myNet.getLayer(topology.Total() - 1).getNeuron(0).getArraySizem_nodeVal())
                                        {         Print("Incompatible targetVals_Vector   trainingPass:", (string)trainingPass,
                                                        "      targetVals_Vector.Total():", (string)targetVals_Vector[i].Total(),
                                                        "      topology.At(topology.Total() - 1):", (string)topology.At(topology.Total() - 1)
                                                       ); break; //
                                        } //numberof element of each layer
                                        /*-------------------------------------------------*/
                                        //--- make the network learn by adjusting weigth of network just one time for one set of data not series..nedd inputs as series.
                                        myNet.backProp_Net(targetVals_Vector[i], i);
                                        /*-------------------------------------------------*/
                                        uint index = ArraySize(rms);
                                        ArrayResize(rms, index + 1);
                                        rms[index] = myNet.getRecentAverageError(); //
                                        /*-------------------------------------------------*/
                                        //--- check accuracy//not effect at end
                                        expected += targetVals_Vector[i].At(0);
                                        predicted += resultVals_Vector[i].At(0);
                                        double error = MathAbs(predicted - expected);
                                        double accuracy = 100.0 - ((error / (1 + 1)) * 100);//
                                        //if(accuracy < 95)break;
                              }//
                    }//
                    IsTrained = 0; //
                    //
                    //}
                    //
          }
          //IsTrained = true;//
          if(0)
          {         uint ValidationPassMatrix = 0;
                    uint ValidationPassElements = 0;
                    uint ValidationepochsMatrix = ValidationDataSize;
                    uint ValidationepochsElements = ValidationDataSize;
                    CArrayDouble_MQL4 ValidationInputVals_Vector[]; ArrayResize(ValidationInputVals_Vector, ValidationepochsMatrix + 1);
                    CArrayDouble_MQL4 ValidationResultVals_Vector[]; ArrayResize(ValidationResultVals_Vector, ValidationepochsMatrix + 1);
                    while(ValidationPassMatrix < ValidationepochsMatrix)//--- training complete. Get prediction of unseen data inputs and plot (VALIDATIONS)
                    {         //Sleep(10);
                              ValidationPassMatrix++;
                              fillInputsValidation(ValidationInputVals_Vector, ValidationPassMatrix);    // the learning and wanted target must realative
                              for(int i = 0; i < ArraySize(ValidationInputVals_Vector); i++)
                              {         myNet.feedForward_Net(ValidationInputVals_Vector[i], __FUNCTION__, __LINE__, i);                   // there is no backProp_Net then no need targets
                                        myNet.getResults(ValidationResultVals_Vector[i], ValidationPassMatrix); //
                              }//
                    }                                             // where result are assigned just return last layer neuron or neurons order---its vector-----------------///
                    //----------------------------------
                    ValidationPassMatrix = 0;
                    while(ValidationPassMatrix < ValidationepochsMatrix)
                    {         //Sleep(10);
                              ValidationPassMatrix++;
                              //draw fit points
                              ValidationPassElements = 0;
                              while(ValidationPassElements < ValidationepochsElements)
                              {         ValidationPassElements++;
                                        if((2500 > ValidationResultVals_Vector[ValidationPassMatrix].At(ValidationPassElements)) && (1400 < ValidationResultVals_Vector[ValidationPassMatrix].At(ValidationPassElements)))
                                        {         Print("ValidationPass:Elements >> ", (string)ValidationPassMatrix, ":", (string)ValidationPassElements, " output_result val of neuron0 : " +
                                                        DoubleToString(ValidationResultVals_Vector[ValidationPassMatrix].At(ValidationPassElements), 2),
                                                        "  timeOfNeuron1 :", (datetime)ValidationResultVals_Vector[ValidationPassMatrix].At(ValidationPassElements + 1));
                                                  //
                                                  ObjectDelete(0,     "Fit Point.NN" + (string)ValidationPassMatrix + ":" + (string)ValidationPassElements);
                                                  ObjectCreate(0,     "Fit Point.NN" + (string)ValidationPassMatrix + ":" + (string)ValidationPassElements, OBJ_TEXT, 0,
                                                               (datetime)ValidationResultVals_Vector[ValidationPassMatrix].At(ValidationPassElements + 1),
                                                               ValidationResultVals_Vector[ValidationPassMatrix].At(ValidationPassElements));
                                                  //worked ObjectCreate(0,     "Fit Point.NN" + (string)ValidationPass, OBJ_TEXT, 0, Time[ValidationPass], Close[ValidationPass]);
                                                  ObjectSetString(0,  "Fit Point.NN" + (string)ValidationPassMatrix + ":" + (string)ValidationPassElements, OBJPROP_TEXT, "*");
                                                  ObjectSetString(0,  "Fit Point.NN" + (string)ValidationPassMatrix + ":" + (string)ValidationPassElements, OBJPROP_FONT, "Arial");
                                                  ObjectSetInteger(0, "Fit Point.NN" + (string)ValidationPassMatrix + ":" + (string)ValidationPassElements, OBJPROP_FONTSIZE, 24);
                                                  ObjectSetDouble(0,  "Fit Point.NN" + (string)ValidationPassMatrix + ":" + (string)ValidationPassElements, OBJPROP_ANGLE, 0);
                                                  ObjectSetInteger(0, "Fit Point.NN" + (string)ValidationPassMatrix + ":" + (string)ValidationPassElements, OBJPROP_ANCHOR, 0);
                                                  ObjectSetInteger(0, "Fit Point.NN" + (string)ValidationPassMatrix + ":" + (string)ValidationPassElements, OBJPROP_COLOR, clrWhite); //
                                        }//
                              }//
                    }//
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          /*-------------------------------------------------*/
          if(0)          // print inputs
          {         //ArrayPrint(inputVals_Vector.At(i));
                    string Desc = "";
                    for(int i = 0; i < inputVals_Vector[0].Total(); i++)  { Desc += (string)inputVals_Vector[0].At(i) + ""; }
                    //--show whats input
                    //DATAS.SignalInfo_InputsPatern += "Inputs : " + Desc ; //Print("\nInputs : ", Desc);//
                    //string InputsDesc[]; 2^48 not good for handeling 281,474,976,710,656
          }
          /*-------------------------------------------------*/
          //Print("------------------------------------------------------------");
          //Print("output result val of neuron0 : " + DoubleToString(resultVals_Vector.At(0), 2), "  timeOfNeuron1 :", (datetime)resultVals_Vector.At(1));
          if(0)//where not p[erdict
          {         //--- check availability of results
                    //--- check accuracy
                    double expected  = targetVals_Vector[0].At(0);
                    double predicted = resultVals_Vector[0].At(0);
                    double error = MathAbs(predicted - expected);
                    double accuracy = 100.0 - ((error / (1 + 1)) * 100);
                    Print("------------------------------------------------------------");
                    Print("Target val : " + DoubleToString(targetVals_Vector[0].At(0), 2));
                    Print("Result val : " + DoubleToString(resultVals_Vector[0].At(0), 2));
                    Print(" Ac: " + DoubleToString(accuracy, 2) + "% ");
                    Print(" MSE: " + DoubleToString(calculateMSE(targetVals_Vector[0], resultVals_Vector[0]), 2));
                    Print("------------------------------------------------------------");//
          }
          //-----------------------------------------------------
}
//+------------------------------------------------------------------+
//|  generate training data and feed into input arrays               |
//+------------------------------------------------------------------+
void NN_Neurons_Scaler_Run::fillInputsTraining(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &target[], int cycleTraining = 0)
{         //--- generate training samples
          //# when given place one target is one in training
          //# when given place one target mut be one in cheaking..
          //# not change outputs result!!
          //  in_training
          //  for(int i=0;i<total;i++){}
          //  int frist_place = 0; int secound_place = 0;  int Wanted_place = 0; ///! the cycle counter is is start by one// must return ask or bid
          //if(inp.Total() == 0) { inp.Add(0.0);}                                                       ///no input element in_training
          //if(inp.At(0) == 0.0) { inp.Clear();inp.Add(); target.Clear(); target.Add();  return; }      //where frist element is zero in_training first cycle
          //where filled input in_training secound cycle
          const int dim1size = 1;
          const int dim2size = 10;
          double inpvalSeriesX[1][10];
          ArrayResize(inpvalSeriesX, 6);  //
          //for(int k = 0; k < ArraySize(inpvalSeriesX); k++) {ArrayResize(inpvalSeriesX[k], cycleTraining);}
          for(int k = 0; k < dim1size; k++)
                    for(int j = 0; j < dim2size; j++)
                    {         if(k == 0)   inpvalSeriesX[k][j] = (double)iTime(    _Symbol, PERIOD_M1,  j);
                              if(k == 1)   inpvalSeriesX[k][j] = iClose(   _Symbol, PERIOD_M1,  j);
                              if(k == 2)   inpvalSeriesX[k][j] = iOpen(    _Symbol, PERIOD_M1,  j);
                              if(k == 3)   inpvalSeriesX[k][j] = iHigh(    _Symbol, PERIOD_M1,  j);
                              if(k == 4)   inpvalSeriesX[k][j] = iLow(     _Symbol, PERIOD_M1,  j);
                              if(k == 5)   inpvalSeriesX[k][j] = (double)iVolume(  _Symbol, PERIOD_M1,  j);//
                    }
          //double inpvalSeries1[]; ArrayResize(inpvalSeries1, cycleTraining): for(int k = 0; k < ArraySize(valSeries1); k++)valSeries1[k] = iClose(_Symbol, PERIOD_M1, k);
          //double inpvalSeries2[]; ArrayResize(inpvalSeries2, cycleTraining): for(int k = 0; k < ArraySize(valSeries2); k++)valSeries2[k] = iClose(_Symbol, PERIOD_M1, k);
          //double inpvalSeries3[]; ArrayResize(inpvalSeries3, cycleTraining): for(int k = 0; k < ArraySize(valSeries3); k++)valSeries3[k] = iOpen(_Symbol, PERIOD_M1, k);
          //double inpvalSeries4[]; ArrayResize(inpvalSeries4, cycleTraining): for(int k = 0; k < ArraySize(valSeries4); k++)valSeries4[k] = iHigh(_Symbol, PERIOD_M1,  k);
          //double inpvalSeries5[]; ArrayResize(inpvalSeries5, cycleTraining): for(int k = 0; k < ArraySize(valSeries5); k++)valSeries5[k] = iLow(_Symbol, PERIOD_M1,  k);
          //double inpvalSeries6[]; ArrayResize(inpvalSeries6, cycleTraining): for(int k = 0; k < ArraySize(valSeries6); k++)valSeries6[k] = iVolume(_Symbol, PERIOD_M1, k);
          //
          for(int j = 0; j < ArraySize(inp); j++)
          {         inp[j].Clear();
                    for( int i = 0; i < dim1size; i++)
                              for( int k = 0; k < dim2size; k++)
                                        inp[j].Add(inpvalSeriesX[i][k]);//
          }
          //==========================================================================================
          uint startBar = 0;
          const int dim1Asize = 2;
          const int dim2Asize = 10;
          double tarvalSeriesX[2][10] = {{1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }, {1, 1, 1, 1, 1, 1, 1, 1, 1, 1 } };
          //ArrayResize(tarvalSeriesX, 2):  for(int k = 0; k < ArraySize(tarvalSeriesX); k++) {ArrayResize(tarvalSeriesX[k], cycleTraining);}
          for(int k = 0; k < dim1Asize; k++)
                    for(int j = 0; j < dim2Asize; j++)
                    {         if(k == 0)   tarvalSeriesX[k][j] = (double)iTime(    _Symbol, PERIOD_M1,  j + startBar);
                              if(k == 1)   tarvalSeriesX[k][j] = iClose(   _Symbol, PERIOD_M1,  j + startBar); }
          for(int k = 0; k < ArraySize(target); k++)
          {         target[k].Clear();
                    for(int i = 0; i < dim1Asize; i++)
                              for(int j = 0; j < dim2Asize; j++)
                              {         target[k].Add(tarvalSeriesX[i][j]);}//
          }
          //---
          return; //
}
//+------------------------------------------------------------------++ PeriodSeconds(PERIOD_M1) * 100
//|  generate Validating data and feed into input arrays             |+ PeriodSeconds(PERIOD_M1) * 300)
//+------------------------------------------------------------------+
void NN_Neurons_Scaler_Run::fillInputsValidation(CArrayDouble_MQL4 &inp[], int cycleValidation)
{         //--- if we are here, unseen data is needed [1,1,0] answer [1] trained network
          uint indexlastBar = 0;
          uint startBar = indexlastBar + cycleValidation;
          const int dim1Bsize = 1;
          const int dim2Bsize = 10;
          double inpvalSeriesX[1][10] = {{0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
          //ArrayResize(inpvalSeriesX, 1):  for(int k = 0; k < ArraySize(inpvalSeriesX); k++) {ArrayResize(inpvalSeriesX[k], cycleValidation);}
          for(int k = 0; k < dim1Bsize; k++)
                    for(int j = 0; j < dim2Bsize; j++)
                    {         if(k == 0)   inpvalSeriesX[k][j] = (double)iTime(_Symbol, PERIOD_M1,  j) + PeriodSeconds(PERIOD_M1) * 100;
                              //if(k == 1)   inpvalSeriesX[k][j] = iClose(   _Symbol, PERIOD_M1,  j);
                              //if(k == 2)   inpvalSeriesX[k][j] = iOpen(    _Symbol, PERIOD_M1,  j);
                              //if(k == 3)   inpvalSeriesX[k][j] = iHigh(    _Symbol, PERIOD_M1,  j);
                              //if(k == 4)   inpvalSeriesX[k][j] = iLow(     _Symbol, PERIOD_M1,  j);
                              //if(k == 5)   inpvalSeriesX[k][j] = iVolume(  _Symbol, PERIOD_M1,  j);//
                    }
          for(int j = 0; j < ArraySize(inp); j++)
          {         inp[j].Clear();
                    for(int i = 0; i < dim1Bsize; i++)
                              for(int k = 0; k < dim2Bsize; k++)
                                        inp[j].Add(inpvalSeriesX[i][k]);//
          }
          //----------------------------------------------------------------------
}
//+------------------------------------------------------------------+
//|  generate training data and feed into input arrays               |
//+------------------------------------------------------------------+
void fillInputsVector(CArrayDouble_MQL4 &inp, CArrayDouble_MQL4 &target, bool unseen = false)
{         //--- generate training samples
          if(!unseen)
          {         if(inp.Total() == 0)
                              inp.Add(0.0);
                    //---
                    if(inp[0] == 0.0)
                    {         inp.Clear();
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 9));
                              //---
                              target.Clear();
                              target.Add(iClose(_Symbol, PERIOD_MN1, 9));
                              target.Add(iClose(_Symbol, PERIOD_MN1, 9));
                              //---
                              return; //
                    }
                    else
                    {         inp.Clear();
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 9));
                              inp.Add(iClose(_Symbol, PERIOD_MN1, 9));
                              //---
                              target.Clear();
                              target.Add(iClose(_Symbol, PERIOD_MN1, 9));
                              //---
                              return; //
                    } //
          }
          //--- if we are here, unseen data is needed [1,1,0] answer [1]
          inp.Clear();
          inp.Add(iClose(_Symbol, PERIOD_MN1, 9));
          inp.Add(iClose(_Symbol, PERIOD_MN1, 9));
          inp.Add(iClose(_Symbol, PERIOD_MN1, 9));
          //---
          target.Clear();
          target.Add(iClose(_Symbol, PERIOD_MN1, 9));
          //---
          return; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double NN_Neurons_Scaler_Run:: calculateMSE(const CArrayDouble_MQL4 & predicted, const CArrayDouble_MQL4 & actual)
{         if (predicted.Total() != actual.Total())
          {         // Error handling for input size mismatch
                    //throw std::runtime_error("Input vectors must have the same size.");
                    Print("not same size predicted.Total() != actual.Total()"); return -999; //
          }
          double sumSquaredDiff = 0.0;
          for (int i = 0; i < predicted.Total(); ++i)
          {         double diffError = predicted[i] - actual[i];
                    sumSquaredDiff += diffError * diffError; //
          }
          double mse = sumSquaredDiff / predicted.Total();
          return mse; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
uchar NN_Neurons_Scaler_Run::OptimizeOFFER( ushort bw, ushort sw, ushort bl, ushort sl)
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
/*

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

*/
//+------------------------------------------------------------------+
