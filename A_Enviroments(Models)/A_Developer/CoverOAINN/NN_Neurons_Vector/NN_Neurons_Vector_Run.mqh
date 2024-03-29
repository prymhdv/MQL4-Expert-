//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#property  strict
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Vector\NN_Neurons_Vector_Net.mqh>
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

//+------------------------------------------------------------------+
//|                                                                  |, double LearningRate = 0.15, double Momentom = 0.5
//+------------------------------------------------------------------+
class NN_Neurons_Vector_Run
{
public:
          NN_Neurons_Vector_Run(double fLearningRate, double fMomentom, double fRASF)  { IsTrained = false; isTarget2 = 1;    LearningRate = fLearningRate  ;   Momentom = fMomentom;  RASF = fRASF;};
          NN_Neurons_Vector_Run(void)  { IsTrained = false; isTarget2 = 1; };
          ~NN_Neurons_Vector_Run(void) {  };//delete myNet2;
          //----------------------------------------------------------
          uint       show_time;// = 50; // Chart display time (seconds)
          bool       IsTrained;
          bool       isTarget2;
          uint       m_totalInputRange;
          //----------------------------------------------------------
          double LearningRate;          // = 0.15;
          double Momentom;              // = 0.5
          double RASF    ;              //= 100
          double calculateMSE(const CArrayDouble_MQL4 & predicted, const CArrayDouble_MQL4 & actual);
          //----------------------------------------------------------
          int       MainProgress(bool b);
          void       _MainRun_();//>...........................................................................................................
          void       fillInputsTraining(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &target[], int totalinputRange);
          void       fillInputsVLD(CArrayDouble_MQL4 &inp[], int cycleVLD);
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

          //---------------------------------------------------------


};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int NN_Neurons_Vector_Run::MainProgress(bool b)
{
//
          if(!b) {   return -1; }
          {         /*LOAD*///inner
                    /*PROGRESS*/ _MainRun_(); //Extract Trade Signal
                    /*PROGRESS*/ //Vtrade();    //Trade Signal virtualy
                    /*SAVE*///inner
          }
          return 0;
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
#define RangeOfVector 3
void NN_Neurons_Vector_Run::_MainRun_()
{         //--- Print("Stack OverFlow!", __FUNCSIG__, (string)__LINE__); //
          /*------------------------------------------------*/
          uint layerOneNeurons = 3;
          uint layerTwoNeurons = 3;//5
          uint layerOutNeurons = 2;///when 10element input and need 20 element out
          m_totalInputRange = RangeOfVector; //YYYY
          //--- create our neural network
          CArrayInt_MQL4 topology;                      //--- add the configuration [2,2,1] //---!!
          topology.Add(layerOneNeurons);                //Input - frist  layer>>>>>//---adding element n to array elements form end//dependet number of element you want to input
          topology.Add(layerTwoNeurons);                //middle layer>>>>> //--resulation gunaguni //topology.Add(3 * m_totalInputRange / 2);
          topology.Add(layerOutNeurons);                //output layer>>>>>
          /*-------------------------------------------------*/
          //--- Initialize the network with our configuration
          NN_Neurons_Vector_CNet myNet(topology, m_totalInputRange, NNNV_Sigmoid, NNNV_Sigmoid, LearningRate, Momentom, RASF); //NNNV_ReLU
          /*-------------------------------------------------*/
          //--- create data containers
          CArrayDouble_MQL4 inputVals_Vector[], targetVals_Vector[], resultVals_Vector[]/*outputsVals_Vector*/;   ///--{0.0,     0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0}
          ArrayResize(inputVals_Vector, m_totalInputRange);
          ArrayResize(targetVals_Vector, m_totalInputRange);
          ArrayResize(resultVals_Vector, m_totalInputRange);
          /*-------------------------------------------------*/
          //if(Detect_NewBar._M1.CBT__5Seccound.Is_NewBar && IsTrained == false)
          int TrainingDataSize    = 5;//700-300fixed targets
          uint VLDDataSize = m_totalInputRange * 1;
          if(1)          //
          {         //for(int i = 0; i < ArraySize(targetVals_Vector); i++)  for(int i = 0; i < ArraySize(inputVals_Vector); i++)
                    for(int i = 0; i < ArraySize(inputVals_Vector); i++)
                    {         Print("-------------> training ", " inputVals_Vector[", i, "]");
                              /*-------------------------------------------------*/
                              //--- loop and train the network.
                              /*-------------------------------------------------*/
                              double        rms[]; //---reserve epochs count
                              uint          epochs = 1;//--any cycle//700-300fixed targets
                              ArrayResize(rms, 0, (int)epochs);
                              uint          trainingPass = 0;//count strart epoch
                              while(trainingPass < epochs)//every cycle adjusting weigth of network for input provided
                              {         ++trainingPass;
                                        double expected = 0, predicted = 0;
                                        /*-------------------------------------------------*/
                                        //--- create training data and check compatibility with the network, number of inputs MUST be equal to number of input neurons in your network
                                        //!!! totalinputRange SET MANUALY
                                        fillInputsTraining(inputVals_Vector, targetVals_Vector, m_totalInputRange); //, 0/*mustfixed until epoches end*/
                                        /*-------------------------------------------------*/
                                        {         //--assert that must topology inputlayer weights vector(contain inputs just) same as inputCounts vector
                                                  //number of element of each layer //--what's value at element 0  /// cheack number of elements are the same input and topology layers
                                                  //if(inputVals_Vector[i].Total() != ArraySize(myNet.getLayer(0).getNeuron(0, __FUNCTION__, __LINE__).getoutputWeights(0, __FUNCTION__, __LINE__).weight)) //topology.At(0)
                                                  if(inputVals_Vector[i].Total() != topology.At(0)) //
                                                  {         Print("berfore feedForward_Net: Incompatible inputs! S*R==R*1-->never run vector input and one neuron [weigtht is part of neuron]");
                                                            return;/*break;*/
                                                  }
                                                  //--- make the network predict the result
                                                  myNet.feedForward_Net(inputVals_Vector[i], __FUNCTION__, __LINE__, i); //--not recuresive call-----just recuresice in activation function
                                                  /*-------------------------------------------------*/
                                        }
                                        {         //--- assert check compatibility of target values and number of output neurons, target values must be equal to the number of output neurons
                                                  //if(ArraySize(targetVals_Vector) != topology.At(topology.Total() - 1))
                                                  //if(targetVals_Vector[i].Total() != myNet.getLayer(topology.Total() - 1).getNeuron(0, __FUNCTION__, __LINE__).getArraySizem_nodeVal()*layerOutNeurons)
                                                  //{         int val = (int)(myNet.getLayer(topology.Total() - 1).getNeuron(0, __FUNCTION__, __LINE__).getArraySizem_nodeVal() * layerOutNeurons);
                                                  //          Print("Incompatible targetVals_Vector   trainingPass:", (string)trainingPass,
                                                  //                "      targetVals_Vector.Total():", (string)targetVals_Vector[i].Total(),
                                                  //                "      ArraySizem_nodeVal*layerOutNeurons:", (string)val,
                                                  //                "      topology.At(topology.Total() - 1):", (string)topology.At(topology.Total() - 1)
                                                  //               ); break; //
                                                  //} //numberof element of each layer
                                                  if(inputVals_Vector[i].Total() != myNet.getLayer(topology.Total() - 1).getNeuron(0, __FUNCTION__, __LINE__).getArraySizem_nodeVal() * 1)
                                                  {         int val = (int)(myNet.getLayer(topology.Total() - 1).getNeuron(0, __FUNCTION__, __LINE__).getArraySizem_nodeVal() * 1);
                                                            Print("Incompatible targetVals_Vector   trainingPass:", (string)trainingPass,
                                                                  "      targetVals_Vector.Total():", (string)targetVals_Vector[i].Total(),
                                                                  "      ArraySizem_nodeVal*layerOutNeurons:", (string)val,
                                                                  "      topology.At(topology.Total() - 1):", (string)topology.At(topology.Total() - 1)
                                                                 ); return; //
                                                  } //numberof element of each layer
                                                  /*-------------------------------------------------*/
                                                  //--- make the network learn by adjusting weigth of network just one time for one set of data not series..nedd inputs as series.
                                                  myNet.backProp_Net(targetVals_Vector[i], i, ArraySize(inputVals_Vector)); //
                                        } //
                                        /*-------------------------------------------------*/
                                        uint index = ArraySize(rms);
                                        ArrayResize(rms, index + 1);
                                        rms[index] += myNet.getRecentAverageError(i); //
                                        /*-------------------------------------------------*/
                                        //--- check accuracy//not effect at end
                                        expected += targetVals_Vector[i].At(0);
                                        predicted += resultVals_Vector[i].At(0);
                                        double error = MathAbs(predicted - expected);
                                        double accuracy = 100.0 - ((error / (1 + 1)) * 100);//
                                        //if(accuracy < 95)break;
                                        Print("-------------> trainingPass:epochs->  ", (string)trainingPass, ":", (string)epochs, "  accuracy:", (string)accuracy); //
                              }//
                    }//
                    IsTrained = 0; //
                    //
                    //}
                    //
                    Print("-> Training End");//
          }
          //IsTrained = true;//
          if(1)
          {         uint VLDPassMatrix = 0;
                    uint VLDPassElements = 0;
                    uint VLDepochsMatrix = VLDDataSize;
                    uint VLDepochsElements = VLDDataSize;
                    CArrayDouble_MQL4 VLDInputVals_Vector[]; ArrayResize(VLDInputVals_Vector, VLDepochsMatrix + 0);
                    CArrayDouble_MQL4 VLDResultVals_Vector[]; ArrayResize(VLDResultVals_Vector, VLDepochsMatrix + 0);//arary must 10 element end index at 9
                    //--- training complete. Get prediction of unseen data inputs and plot (VALIDATIONS)
                    fillInputsVLD(VLDInputVals_Vector, VLDPassMatrix);    // the learning and wanted target must realative
                    for(int i = 0; i < ArraySize(VLDInputVals_Vector); i++)
                    {         Print("-------------> Validation ", " VLDInputVals_Vector[", i, "]");
                              myNet.feedForward_Net(VLDInputVals_Vector[i], __FUNCTION__, __LINE__, i);                   // there is no backProp_Net then no need targets
                              myNet.getResults(VLDResultVals_Vector[i], i); //
                    }//
                    // where result are assigned just return last layer neuron or neurons order---its vector-----------------///
                    //----------------------------------
                    //if((2500 > VLDResultVals_Vector[VLDPassMatrix].At(VLDPassElements)) && (1400 < VLDResultVals_Vector[VLDPassMatrix].At(VLDPassElements)))
                    for(int i = 0; i < ArraySize(VLDInputVals_Vector); i++)
                    {         Print("---------------");
                              for(int j = 0; j < VLDInputVals_Vector[i].Total(); j++)
                              {         Print("VLDPass:Elements >> ", (string)i, ":", (string)j, " output_result val of neuron0 : " +
                                              DoubleToString(VLDResultVals_Vector[i].At(j), 2),
                                              "  timeOfNeuron1 :", (datetime)VLDResultVals_Vector[i].At(j + 10));
                                        //
                                        ObjectDelete(0,     "Fit Point.NN" + (string)i + ":" + (string)j);
                                        ObjectCreate(0,     "Fit Point.NN" + (string)i + ":" + (string)j, OBJ_TEXT, 0, (datetime)VLDResultVals_Vector[i].At(j + 10),
                                                     VLDResultVals_Vector[i].At(j));
                                        //worked ObjectCreate(0,     "Fit Point.NN" + (string)VLDPass, OBJ_TEXT, 0, Time[VLDPass], Close[VLDPass]);
                                        ObjectSetString(0,  "Fit Point.NN" + (string)i + ":" + (string)j, OBJPROP_TEXT, "*");
                                        ObjectSetString(0,  "Fit Point.NN" + (string)i + ":" + (string)j, OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0, "Fit Point.NN" + (string)i + ":" + (string)j, OBJPROP_FONTSIZE, 24);
                                        ObjectSetDouble(0,  "Fit Point.NN" + (string)i + ":" + (string)j, OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0, "Fit Point.NN" + (string)i + ":" + (string)j, OBJPROP_ANCHOR, 0);
                                        ObjectSetInteger(0, "Fit Point.NN" + (string)i + ":" + (string)j, OBJPROP_COLOR, clrWhite); //
                              }//
                    }//
                    Print("-> Validation End");//
          }
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
void NN_Neurons_Vector_Run::fillInputsTraining(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &target[], int totalinputRange)
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
          const int dim2size = RangeOfVector; // XXXX
          double inpvalSeriesX[1][RangeOfVector];// XXXX
          ArrayResize(inpvalSeriesX, 6);  //
          //for(int k = 0; k < ArraySize(inpvalSeriesX); k++) {ArrayResize(inpvalSeriesX[k], cycleTraining);}
          for(int k = 0; k < dim1size; k++)
                    for(int j = 0; j < dim2size; j++)
                    {         if(k == 0)   inpvalSeriesX[k][j] = iClose(   _Symbol, PERIOD_M1,  j);//(double)iTime(    _Symbol, PERIOD_M1,  j);
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
          const int dim1Asize = 1;
          const int dim2Asize = RangeOfVector;// XXXX
          double tarvalSeriesX[1][RangeOfVector];ArrayInitialize(tarvalSeriesX,0);// = {{1 }, {1 } }; //{{1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }, {1, 1, 1, 1, 1, 1, 1, 1, 1, 1 } };// XXXX
          //ArrayResize(tarvalSeriesX, 2):  for(int k = 0; k < ArraySize(tarvalSeriesX); k++) {ArrayResize(tarvalSeriesX[k], cycleTraining);}
          for(int k = 0; k < dim1Asize; k++)
                    for(int j = 0; j < dim2Asize; j++)
                    {         if(k == 0)   tarvalSeriesX[k][j] = iClose(   _Symbol, PERIOD_M1,  j);//(double)iTime(    _Symbol, PERIOD_M1,  j + startBar);
                              if(k == 1)   tarvalSeriesX[k][j] = iClose(   _Symbol, PERIOD_M1,  j + startBar); //
                    }
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
void NN_Neurons_Vector_Run::fillInputsVLD(CArrayDouble_MQL4 &inp[], int cycleVLD)
{         //--- if we are here, unseen data is needed [1,1,0] answer [1] trained network
          uint indexlastBar = 0;
          uint startBar = indexlastBar + cycleVLD;
          const int dim1Bsize = 1;
          const int dim2Bsize = RangeOfVector;
          double inpvalSeriesX[1][RangeOfVector]; ArrayInitialize(inpvalSeriesX,0);
          //ArrayResize(inpvalSeriesX, 1):  for(int k = 0; k < ArraySize(inpvalSeriesX); k++) {ArrayResize(inpvalSeriesX[k], cycleVLD);}
          for(int k = 0; k < dim1Bsize; k++)
                    for(int j = 0; j < dim2Bsize; j++)
                    {         if(k == 0)   inpvalSeriesX[k][j] = iClose(   _Symbol, PERIOD_M1,  j);//(double)iTime(_Symbol, PERIOD_M1,  j) + PeriodSeconds(PERIOD_M1) * 100;
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
//|                                                                  |
//+------------------------------------------------------------------+
double NN_Neurons_Vector_Run:: calculateMSE(const CArrayDouble_MQL4 & predicted, const CArrayDouble_MQL4 & actual)
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
