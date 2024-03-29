//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#property  strict
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Matrix456\NN_Neurons_Matrix456_Net.mqh>
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
//+------------------------------------------------------------------+
//|                                                                  |, double LearningRate = 0.15, double Momentom = 0.5
//+------------------------------------------------------------------+
class NN_Neurons_Matrix_Run456
{
public:
          NN_Neurons_Matrix_Run456(double fBias, double fLearningRate, double fMomentom, double fRASF)
          {         IsTrained = false; isTarget2 = 1; Bias = fBias;   LearningRate = fLearningRate  ;   Momentom = fMomentom;  RASF = fRASF;
                    //myNet = NN_Neurons_Matrix456_CNet(topology, NNNM456_Sigmoid, NNNM456_ReLU, LearningRate = 0.05, Momentom = 0.9, RASF = 6);//
          };
          NN_Neurons_Matrix_Run456(void)  { IsTrained = false; isTarget2 = 1; };
          ~NN_Neurons_Matrix_Run456(void) { delete myNet; };//delete myNet2;
          //----------------------------------------------------------
          uint       show_time;// = 50; // Chart display time (seconds)
          bool       IsTrained;
          bool       isTarget2;

          uint        m_totalInputSample;
          //----------------------------------------------------------
          NN_Neurons_Matrix456_CNet *myNet;//class variables need pointer mode init
          double Bias;
          double LearningRate;          // = 0.15;
          double Momentom;              // = 0.5
          double RASF    ;              //= 100
          double calculateMSE_Sample(const CArrayDouble_MQL4 & predicted[], const CArrayDouble_MQL4 & actual[]);
          //----------------------------------------------------------
          int           MainProgress(bool b);
          void          _MainRun_();//>...........................................................................................................
          void          fillInputsTraining(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &target[]);
          void          fillInputsValidation(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &inpMine[], CArrayDouble_MQL4 &tar[]);
          void          fillInputsPerdiction(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &finalseries[], int idx);
          //--
          bool          Load(bool IsKey, CArrayInt_MQL4 &fTopology);
          bool          Save(bool IsKey);
          //--
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
int NN_Neurons_Matrix_Run456::MainProgress(bool b)
{         //
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
uint DayoutX456 = (uint)((Time[0] + PeriodSeconds(PERIOD_D1) * 1) + Time[0]);
#define NN456_PeriodWork PERIOD_M1
#define NN456_ValidationRange 100
#define NN456_DataSamples 2000/10
#define NN456_DataElementInp 20/1
#define NN456_DataElementOut 20/1
#define NN456_Trainingepochs 10
#define NN456_NetworkSaveLoad 0
#define NN456_IsMine 0
void NN_Neurons_Matrix_Run456::_MainRun_()
{         //********************************************************* Build Network *********************************************************
          uint layerInputNeurons = NN456_DataElementInp;
          uint layerHiddenNeurons1 = 4;//5    //--for more node back zero mse get more
          uint layerHiddenNeurons2 = 2;//5
          uint layerOutNeurons = NN456_DataElementOut;
          m_totalInputSample   = NN456_DataSamples;
          //--- create our neural network
          CArrayInt_MQL4 topology;    topology.Clear();                                  //--- add the configuration [2,2,1] //---!!
          topology.Add(layerInputNeurons);               //Input - frist  layer>>>>>//---adding element n to array elements form end//dependet number of element you want to input
          //-----------------------------
          topology.Add(layerHiddenNeurons1);
          topology.Add(layerHiddenNeurons2);            //middle layer>>>>> //--resulation gunaguni //topology.Add(3 * m_totalInputSample / 2);
          //topology.Add(layerHiddenNeurons / 2);  topologySize++;
          topology.Add(layerOutNeurons);               //output layer>>>>>
          /*-------------------------------------------------*///(MathRand() % 10)/10//
          //__Learnin_Rate__ important other not effected  LearningRate 0.001= [1985.52 : 69] [LearningRate 0.19= 1985.52 :1400][LearningRate 0.039] [LearningRate = 0.039, Momentom = 0.051, RASF = 10>>1985.52 :1400]
          //--- Initialize the network with our configuration ///when not pointer 2023.10.20 12:14:50.106     QUARTS_AF1 XAUUSD,M1: invalid pointer access in 'NN_Neurons_Matrix_Net.mqh' (98,106)
          //topology, NNNM456_Sigmoid, NNNM456_ReLU,Bias = 1.0,  LearningRate = 0.039, Momentom = 0.051, RASF = 1000[notefected]
          myNet = new NN_Neurons_Matrix456_CNet(topology, NNNM456_Sigmoid, NNNM456_ReLU, Bias = 1.0,  LearningRate = 0.1500*6, Momentom = 0.5000, RASF = 100.0);
          if( !Load(NN456_NetworkSaveLoad, topology)) {}//no need before seted, myNet = NN_Neurons_Matrix456_CNet(topology, NNNM456_Sigmoid, NNNM456_ReLU, LearningRate = 0.05, Momentom = 0.9, RASF = 6);
          //********************************************************* Prapare Data Sample *********************************************************
          //--- create data containers
          CArrayDouble_MQL4 Training_inputVals_Vector[],   Training_targetVals_Vector[];     ///--{0.0,     0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0}
          CArrayDouble_MQL4 Validation_inputVals_Vector[], Validation_inputValsMine_Vector[], Validation_targetVals_Vector[], Validation_resultVals_Vector[];/*outputsVals_Vector*/;
          CArrayDouble_MQL4 Perdiction_inputVals_Vector[], Perdiction_resultVals_Vector[], Perdiction_resultVals_VectorFinal[];/*outputsVals_Vector*/;
          ArrayResize(Training_inputVals_Vector,  NN456_DataSamples);    ArrayResize(Training_targetVals_Vector, NN456_DataSamples);
          ArrayResize(Validation_inputVals_Vector,  NN456_DataSamples) ; ArrayResize(Validation_inputValsMine_Vector, NN456_DataSamples); ArrayResize(Validation_targetVals_Vector, NN456_DataSamples); ArrayResize(Validation_resultVals_Vector, NN456_DataSamples);
          ArrayResize(Perdiction_inputVals_Vector,  NN456_DataSamples) ; ArrayResize(Perdiction_resultVals_Vector, NN456_DataSamples); ArrayResize(Perdiction_resultVals_VectorFinal, NN456_DataSamples);
          /*-------------------------------------------------*/
          int TrainingDataSize    = 5;//700-300fixed targets
          uint ValidationDataSize = m_totalInputSample * 30 / 100;
          //******************************************************************************
          //--- create training data and check compatibility with the network
          //--- number of inputs MUST be equal to number of input neurons in your network
          fillInputsTraining(Training_inputVals_Vector, Training_targetVals_Vector);
          //********************************************************* Start Triaining *********************************************************
          {         //double        rms[NN456_DataSamples][];   //---save netErrors every epoche reserve epochs count
                    double        rms[NN456_DataSamples];
                    uint          epochs = NN456_Trainingepochs;          //--any cycle//700-300fixed targets
                    ArrayResize(rms, 0, (int)epochs);
                    for(int i = 0; i < ArraySize(Training_inputVals_Vector); i++)//---wrong--must sample perform in every epoch----!!!!
                    {         uint index = MathRand() % NN456_DataSamples;  //??---------------evey epoch provided one set of four set----------------------------
                              index = i;
                              //******************************************************************************
                              for(uint j = 0; j < epochs; j++)
                              {         if(Training_inputVals_Vector[index].Total() != topology.At(0)) { Print("Incompatible inputs!"); break; }
                                        //******************************************************************************
                                        //--- make the network predict the result
                                        myNet.feedForward_Net(Training_inputVals_Vector[index], "OnTraining");
                                        //******************************************************************************
                                        //--- check compatibility of target values and number of output neurons
                                        //--- target values must be equal to the number of output neurons
                                        if(Training_targetVals_Vector[index].Total() != topology.At(topology.Total() - 1)) { Print("Incompatible targetVals"); break; }
                                        //******************************************************************************
                                        //--- make the network learn
                                        myNet.backProp_Net(Training_targetVals_Vector[index]);
                                        //******************************************************************************
                                        uint indexrms = ArraySize(rms);
                                        ArrayResize(rms, indexrms + 1);
                                        //rms[index][indexrms] = myNet.getRecentAverageError();
                                        rms[indexrms] = myNet.getRecentAverageError();
                                        //******************************************************************************
                              }//
                    }//
          }//
          if( Save(NN456_NetworkSaveLoad)) {}
          //********************************************************* Start Validation feedForward_Net *********************************************************
          {         fillInputsValidation(Validation_inputVals_Vector, Validation_inputValsMine_Vector, Validation_targetVals_Vector);
                    for(int i = 0; i < ArraySize(Validation_resultVals_Vector); i++)
                    {         //--- training complete. Get prediction of unseen data and plot
                              myNet.feedForward_Net(Validation_inputVals_Vector[i], "OnValidation");
                              myNet.getResults(Validation_resultVals_Vector[i]); //
                    }//
                    //********************************************************* Start Validation Show *********************************************************
                    if(!NN456_IsMine)
                    {         int range = NN456_ValidationRange;
                              for(int j = range; j < Validation_inputVals_Vector[0].Total() + range; j++) //ArraySize(Training_resultVals_Vector)-1
                              {         string name =  "Fit Point.NN-Validation-Input" + (string)(j - range) + "  " + string(Validation_inputVals_Vector[0].Total());
                                        ObjectDelete(0,         name);
                                        ObjectCreate(0,         name, OBJ_TEXT, 0, iTime(_Symbol, NN456_PeriodWork, j), Validation_inputVals_Vector[0].At(j - range));
                                        ObjectSetString(0,      name, OBJPROP_TEXT, "*");
                                        ObjectSetString(0,      name, OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,     name, OBJPROP_FONTSIZE, 14);
                                        ObjectSetDouble(0,      name, OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,     name, OBJPROP_ANCHOR, 0);
                                        ObjectSetInteger(0,     name, OBJPROP_COLOR, clrYellow); //
                              }//
                              for(int j = range; j < Validation_resultVals_Vector[0].Total() + range; j++) //ArraySize(Training_resultVals_Vector)-1
                              {         string name =  "Fit Point.NN-Validation-Result" + (string)(j - range) + "  " + string(Validation_resultVals_Vector[0].Total());
                                        ObjectDelete(0,         name);
                                        ObjectCreate(0,         name, OBJ_TEXT, 0, iTime(_Symbol, NN456_PeriodWork, j), Validation_resultVals_Vector[0].At(j - range));
                                        ObjectSetString(0,      name, OBJPROP_TEXT, "*");
                                        ObjectSetString(0,      name, OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,     name, OBJPROP_FONTSIZE, 14);
                                        ObjectSetDouble(0,      name, OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,     name, OBJPROP_ANCHOR, 0);
                                        ObjectSetInteger(0,     name, OBJPROP_COLOR, clrYellowGreen); //
                              }//
                    }//
                    if(NN456_IsMine)//mine time based
                    {         int range = NN456_ValidationRange;
                              for(int j = range; j < Validation_inputValsMine_Vector[0].Total() + range; j++) //ArraySize(Training_resultVals_Vector)-1
                              {         string name =  "Fit Point.NN-Validation-Input" + (string)(j - range) + "  " + string(Validation_inputValsMine_Vector[0].Total());
                                        ObjectDelete(0,         name);
                                        ObjectCreate(0,         name, OBJ_TEXT, 0, iTime(_Symbol, NN456_PeriodWork, j), Validation_inputValsMine_Vector[0].At(j - range));
                                        ObjectSetString(0,      name, OBJPROP_TEXT, "*");
                                        ObjectSetString(0,      name, OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,     name, OBJPROP_FONTSIZE, 14);
                                        ObjectSetDouble(0,      name, OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,     name, OBJPROP_ANCHOR, 0);
                                        ObjectSetInteger(0,     name, OBJPROP_COLOR, clrYellow); //
                              }//
                              for(int j = range; j < Validation_resultVals_Vector[0].Total() + range; j++) //ArraySize(Training_resultVals_Vector)-1
                              {         string name =  "Fit Point.NN-Validation-Result" + (string)(j - range) + "  " + string(Validation_resultVals_Vector[0].Total());
                                        ObjectDelete(0,         name);
                                        ObjectCreate(0,         name, OBJ_TEXT, 0, iTime(_Symbol, NN456_PeriodWork, j), Validation_resultVals_Vector[0].At(j - range));
                                        ObjectSetString(0,      name, OBJPROP_TEXT, "*");
                                        ObjectSetString(0,      name, OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,     name, OBJPROP_FONTSIZE, 14);
                                        ObjectSetDouble(0,      name, OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,     name, OBJPROP_ANCHOR, 0);
                                        ObjectSetInteger(0,     name, OBJPROP_COLOR, clrYellowGreen); //
                              }//
                    }//
          }
          //********************************************************* Start Perdiction *********************************************************
          {
                    {         for(int i = 0; i < ArraySize(Perdiction_resultVals_VectorFinal); i++)
                              {         Perdiction_resultVals_VectorFinal[i].Clear(); Perdiction_resultVals_VectorFinal[i].Add(-2.0); }
                              //Print("Perdiction: Perdiction_resultVals_VectorFinal[0].At(0):", Perdiction_resultVals_VectorFinal[0].At(0));
                              fillInputsPerdiction(Perdiction_inputVals_Vector, Perdiction_resultVals_VectorFinal, 0);
                              for(int i = 0; i < ArraySize(Perdiction_resultVals_Vector); i++)
                              {         //--- training complete. Get prediction of unseen data and plot
                                        for(int j = 0; j < NN456_DataElementInp; j++)
                                        {         //if(i > 0)
                                                  fillInputsPerdiction(Perdiction_inputVals_Vector, Perdiction_resultVals_VectorFinal, i);
                                                  Perdiction_resultVals_VectorFinal[i].Clear();
                                                  myNet.feedForward_Net(Perdiction_inputVals_Vector[i], "OnPerdiction");
                                                  myNet.getResults(Perdiction_resultVals_Vector[i]); //
                                                  for(int n = 0; n < NN456_DataElementInp; n++)
                                                  {         Perdiction_resultVals_VectorFinal[i].Add(Perdiction_resultVals_Vector[i].At(n)); //
                                                  }//
                                        }//
                              } //
                    }//
                    //********************************************************* Start Perdiction Show *********************************************************
                    if(1)
                    {         for(int j = NN456_DataElementInp; j < Perdiction_resultVals_VectorFinal[0].Total() + NN456_DataElementInp; j++) //ArraySize(Training_resultVals_Vector)-1
                              {         string name = "Fit Point.NN-Perdiction" + (string)(j - NN456_DataElementInp) + "  " + string(Perdiction_resultVals_VectorFinal[0].Total());
                                        ObjectDelete(0,         name );
                                        //ObjectCreate(0,         name, OBJ_TEXT, 0, iTime(_Symbol, NN456_PeriodWork, j - NN456_DataElementInp) + PeriodSeconds(NN456_PeriodWork) * (j - 0), Perdiction_resultVals_Vector[0].At(j - NN456_DataElementInp));
                                        ObjectCreate(0,         name, OBJ_TEXT, 0, iTime(_Symbol, NN456_PeriodWork, 0) + PeriodSeconds(NN456_PeriodWork) * (j - NN456_DataElementInp), Perdiction_resultVals_VectorFinal[0].At(j - NN456_DataElementInp));
                                        ObjectSetString(0,      name, OBJPROP_TEXT, "*");
                                        ObjectSetString(0,      name, OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,     name, OBJPROP_FONTSIZE, 14);
                                        ObjectSetDouble(0,      name, OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,     name, OBJPROP_ANCHOR, 0);
                                        ObjectSetInteger(0,     name, OBJPROP_COLOR, clrWhite);  //
                              }//
                    }//
          }
          //--- print results
          double inp[];
          ArrayResize(inp, Training_inputVals_Vector[0].Total());
          for(int i = 0; i < Training_inputVals_Vector[0].Total() && !IsStopped(); ++i) inp[i] = Training_inputVals_Vector[0].At(i);
          //---
          //Print("\nInputs : ");ArrayPrint(inp);
          //---ACCURANCY VALIDATION
          {         double expected = 0;
                    double predicted = 0;
                    double error = 0;
                    double allresult = 0;
                    for(int i = 0; i < ArraySize(Validation_resultVals_Vector); i++)
                    {         for(int k = 0; k < Validation_resultVals_Vector[i].Total(); k++)
                              {         //--- check availability of results
                                        //Print("Result : ", DoubleToString(Training_resultVals_Vector[0].At(0), 4));
                                        //Print("Expected : ", DoubleToString(Training_resultVals_Vector[0].At(0), 4));
                                        //--- check accuracy
                                        expected = Validation_targetVals_Vector[i].At(k);
                                        predicted = Validation_resultVals_Vector[i].At(k);
                                        //---
                                        error += MathAbs(predicted - expected);//
                              }//
                    }//
                    error = error / (NN456_DataSamples * NN456_DataElementInp);
                    double accuracy = 100.0 - (((error) / (1 + 1)) * 100);//
                    double mse = calculateMSE_Sample(Validation_targetVals_Vector, Validation_resultVals_Vector);
                    Print("Validation_Accuracy : ", DoubleToString(accuracy, 2) + "%", "  Validation_MSE:", DoubleToStr(mse, 7)); //
                    //Print("Result       : ", TimeToStr(Training_resultVals_Vector[0].At(0)), "  ", "Result2      : ", DoubleToStr(Training_resultVals_Vector[0].At(1), 2));
                    //Print("Expected : ", TimeToStr(Training_targetVals_Vector[0].At(0)), "  ", "Expected2 : ", DoubleToStr(Training_targetVals_Vector[0].At(1), 2));        //
                    Print( "Validation_OneNeuronResult2      : ", DoubleToStr(Validation_resultVals_Vector[0].At(0), 2));
                    Print( "Validation_OneNeuronExpected2 : ", DoubleToStr(Validation_targetVals_Vector[0].At(0), 2));        //
                    //
          }
          //********************************************************* Validation Show *********************************************************
          {         Sleep(500); } //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double returnValue456(uint x, uint j, uint u)
{         if(x == 0) return (double)iTime(    _Symbol, NN456_PeriodWork,  j + NN456_DataElementInp * u); //
          if(x == 1) return (double)iClose(    _Symbol, NN456_PeriodWork,  j + NN456_DataElementInp * u); //
          if(x == 2) return (double)iVolume(    _Symbol, NN456_PeriodWork,  j + NN456_DataElementInp * u); //
          if(x == 3) return (double)iLow(    _Symbol, NN456_PeriodWork,  j + NN456_DataElementInp * u); //
          if(x == 4) return (double)iHigh(    _Symbol, NN456_PeriodWork,  j + NN456_DataElementInp * u); //
          if(x == 5) return (double)iOpen(    _Symbol, NN456_PeriodWork,  j + NN456_DataElementInp * u); //
          return 0;//
}
//+------------------------------------------------------------------+if(MathRand() % 2 == 0)
//|  generate training data and feed into input arrays               |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_Run456::fillInputsTraining(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &target[])
{         //******************************************** Input Elements *********************************************************NN456_DataSamples * NN456_DataElementInp % k==0  uint indexSeries = k * NN456_DataElementInp;
          double inpvalSeriesX[NN456_DataSamples][NN456_DataElementInp]; ArrayInitialize(inpvalSeriesX, 0.0);
          uint indexSeries = 0;//yesterday
          indexSeries = MathRand() % 3000; //yesterdays
          indexSeries = 1; //yesterdays
          for(int k = 0; k < NN456_DataSamples; k++)
          {         for(int j = 0; j < NN456_DataElementInp; j++)
                    {         if(NN456_IsMine)//mine idea
                              {         inpvalSeriesX[k][j] = (double)iTime(    _Symbol, NN456_PeriodWork,  indexSeries); //wrong
                              }
                              if(!NN456_IsMine)//profesor
                              {         inpvalSeriesX[k][j] = (double)iClose(    _Symbol, NN456_PeriodWork,  indexSeries); //
                                        //if(j % 1 == 0)inpvalSeriesX[k][j] = (double)iClose(    _Symbol, NN456_PeriodWork,  indexSeries); //
                                        //if(j % 2 == 0)inpvalSeriesX[k][j] = (double)iVolume(    _Symbol, NN456_PeriodWork,  indexSeries); //
                                        //if(j % 3 == 0)inpvalSeriesX[k][j] = (double)iOpen(    _Symbol, NN456_PeriodWork,  indexSeries); //
                                        //if(j % 4 == 0)inpvalSeriesX[k][j] = (double)iHigh(    _Symbol, NN456_PeriodWork,  indexSeries); //
                                        //if(j % 5 == 0)inpvalSeriesX[k][j] = (double)iLow(    _Symbol, NN456_PeriodWork,  indexSeries); //
                                        //Print("times ", TimeToStr(iTime(    _Symbol, NN456_PeriodWork,  j + NN456_DataElementInp * k))); //
                              }
                              //
                              //for(int o = 0; o < NN456_DataElementInp; o++)
                              //{         static uint c = 0;
                              //          if(c > 5)c = 0;
                              //          inpvalSeriesX[k][j] = returnValue(c, j, u); //
                              //          c++;//
                              //}  //
                              indexSeries++;//
                    } //
                    //Print("------");//
          }
          for(int k = 0; k < ArraySize(inp); k++)
          {         inp[k].Clear();
                    for( int j = 0; j < NN456_DataElementInp; j++)
                              inp[k].Add(inpvalSeriesX[k][j]);//
          }
          //******************************************** Target Elements *********************************************************
          double tarvalSeriesX[NN456_DataSamples][NN456_DataElementOut]; ArrayInitialize(tarvalSeriesX, 0.0);//{{1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }, {1, 1, 1, 1, 1, 1, 1, 1, 1, 1 } };
          uint indexSeries2 = 0;//today
          for(int k = 0; k < NN456_DataSamples; k++)
          {         for(int j = 0; j < NN456_DataElementOut; j++)
                    {         if(NN456_IsMine)//mine
                              {         tarvalSeriesX[k][j] = (double)iClose(    _Symbol, NN456_PeriodWork, indexSeries2);//
                              }
                              if(!NN456_IsMine)//profesor
                              {         if(1)//two neuron out
                                        {         //if(j % 2 == 0)   tarvalSeriesX[k][j] = (double)iTime(    _Symbol, NN456_PeriodWork, indexSeries2);
                                                  //if(j % 2 != 0)   tarvalSeriesX[k][j] = iClose(   _Symbol, NN456_PeriodWork,  indexSeries2); //
                                                  //if(j % 3 != 0)   tarvalSeriesX[k][j] = iVolume(   _Symbol, NN456_PeriodWork,  j + NN456_DataElementOut * k); //
                                        }
                                        if(1)//one neuron out
                                        {         //tarvalSeriesX[k][j] = iClose(   _Symbol, NN456_PeriodWork,  j + NN456_DataElementOut * k); //
                                                  tarvalSeriesX[k][j] = (double)iClose(    _Symbol, NN456_PeriodWork, indexSeries2);//
                                        } //
                              }
                              indexSeries2++;//
                    } //
          }
          for(int k = 0; k < ArraySize(target); k++)
          {         target[k].Clear();
                    for(int j = 0; j < NN456_DataElementOut; j++)
                    {         target[k].Add(tarvalSeriesX[k][j]);}//
          }
          //---
          return; //
}
//+------------------------------------------------------------------++ PeriodSeconds(NN456_PeriodWork) * 100
//|  generate Validating data and feed into input arrays             |+ PeriodSeconds(NN456_PeriodWork) * 300)
//+------------------------------------------------------------------++ PeriodSeconds(NN456_PeriodWork) * 10
void NN_Neurons_Matrix_Run456::fillInputsValidation(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &inpMine[], CArrayDouble_MQL4 &tar[])
{         //******************************************** Validation Input Elements *********************************************************
          //--- if we are here, unseen data is needed [1,1,0] answer [1] trained network
          double inpvalSeriesX[NN456_DataSamples][NN456_DataElementInp]; ArrayInitialize(inpvalSeriesX, 0.0);
          double inpvalSeriesY[NN456_DataSamples][NN456_DataElementInp]; ArrayInitialize(inpvalSeriesY, 0.0);
          uint indexSeries = NN456_ValidationRange;//validation no need jump back//--at time frame 1m its start 100 candel !
          uint indexSeriesB = NN456_ValidationRange;
          for(int k = 0; k < NN456_DataSamples; k++)
          {         for(int j = 0; j < NN456_DataElementInp; j++)
                    {         if(NN456_IsMine)//mine
                              {         inpvalSeriesY[k][j] = (double)iClose(    _Symbol, NN456_PeriodWork,  indexSeries);//
                                        inpvalSeriesX[k][j] = (double)iTime(    _Symbol, NN456_PeriodWork,  indexSeries);// //
                              }
                              if(!NN456_IsMine)//profesor
                              {         inpvalSeriesX[k][j] = (double)(iClose(    _Symbol, NN456_PeriodWork,  indexSeries) ); //
                                        int plus = 0;
                                        //inpvalSeriesX[k][plus] = (double)(iClose(    _Symbol, NN456_PeriodWork,  indexSeriesB) ); //
                                        //inpvalSeriesX[k][plus++] = (double)(iClose(    _Symbol, NN456_PeriodWork,  indexSeriesB) ); //
                                        //inpvalSeriesX[k][plus++] = (double)(iVolume(    _Symbol, NN456_PeriodWork,  indexSeriesB) ); //
                                        //inpvalSeriesX[k][plus++] = (double)(iOpen(    _Symbol, NN456_PeriodWork,  indexSeriesB) ); //
                                        //inpvalSeriesX[k][plus++] = (double)(iHigh(    _Symbol, NN456_PeriodWork,  indexSeriesB) ); //
                                        //inpvalSeriesX[k][plus++] = (double)(iLow(    _Symbol, NN456_PeriodWork,  indexSeriesB) ); //
                              }
                              indexSeries++;
                              //Print("times ",TimeToStr(iTime(    _Symbol, NN456_PeriodWork,  j + NN456_DataElementInp * k)));//
                    } //
                    indexSeriesB++;
                    //Print("------");//
          }
          for(int k = 0; k < ArraySize(inp); k++)
          {         inp[k].Clear();
                    for(int j = 0; j < NN456_DataElementInp; j++)//count neuron equal..there is no target
                              inp[k].Add(inpvalSeriesX[k][j]);//
          }
          for(int k = 0; k < ArraySize(inpMine); k++)
          {         inpMine[k].Clear();
                    for(int j = 0; j < NN456_DataElementInp; j++)//count neuron equal..there is no target
                              inpMine[k].Add(inpvalSeriesY[k][j]);//
          }
          //******************************************** Validation Target Elements *********************************************************
          double tarvalSeriesX[NN456_DataSamples][NN456_DataElementOut]; ArrayInitialize(tarvalSeriesX, 0.0);//{{1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }, {1, 1, 1, 1, 1, 1, 1, 1, 1, 1 } };
          uint indexSeries2 = NN456_ValidationRange - 1; //today
          for(int k = 0; k < NN456_DataSamples; k++)
          {         for(int j = 0; j < NN456_DataElementOut; j++)
                    {         if(1)//two neuron out
                              {         int plus = 0; //if(j % 2 == 0)   tarvalSeriesX[k][j] = (double)iTime(    _Symbol, NN456_PeriodWork, indexSeries2);
                                        //    tarvalSeriesX[k][plus] = iClose(   _Symbol, NN456_PeriodWork,  indexSeries2); //
                                        //    tarvalSeriesX[k][plus++] = iVolume(   _Symbol, NN456_PeriodWork,  j + NN456_DataElementOut * k); //
                              }
                              if(1)//one neuron out
                              {         //tarvalSeriesX[k][j] = iClose(   _Symbol, NN456_PeriodWork,  j + NN456_DataElementOut * k); //
                                        tarvalSeriesX[k][j] = (double)iClose(    _Symbol, NN456_PeriodWork, indexSeries2);//
                              } //
                              indexSeries2++;//
                    } //
          }
          for(int k = 0; k < ArraySize(tar); k++)
          {         tar[k].Clear();
                    for(int j = 0; j < NN456_DataElementOut; j++)
                    {         tar[k].Add(tarvalSeriesX[k][j]);}//
          }
          //
}
//+------------------------------------------------------------------++ PeriodSeconds(NN456_PeriodWork) * 100
//|  generate Validating data and feed into input arrays             |+ PeriodSeconds(NN456_PeriodWork) * 300)
//+------------------------------------------------------------------++ PeriodSeconds(NN456_PeriodWork) * 10
void NN_Neurons_Matrix_Run456::fillInputsPerdiction(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &finalseries[], int idx)
{         //******************************************** Input Elements *********************************************************
          //--- if we are here, unseen data is needed [1,1,0] answer [1] trained network
          double inpvalSeriesX[NN456_DataSamples][NN456_DataElementInp]; ArrayInitialize(inpvalSeriesX, 0.0);
          uint indexSeries = 0;//validation no need jump back  // -3000
          //Print("fillInputsPerdiction: finalseries.At(0):", finalseries.At(0));
          //for(int g = 0; g < ArraySize(finalseries); g++)
          {         if(finalseries[idx].At(0) > 0.000)
                    {         for(int k = 0; k < NN456_DataSamples; k++)
                              {         for(int j = 0; j < NN456_DataElementInp; j++)
                                        {         if(NN456_IsMine)//mine
                                                  {         inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));//
                                                  }
                                                  if(!NN456_IsMine)//profesor
                                                  {         //inpvalSeriesX[k][j] = (double)(iTime(    _Symbol, NN456_PeriodWork,  j) + PeriodSeconds(NN456_PeriodWork) * indexSeries ); //has coralation!!!
                                                            inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                            //if(j % 1 == 0)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                            //if(j % 2 == 0)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                            //if(j % 3 == 0)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                            //if(j % 4 == 0)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                            //if(j % 5 == 0)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                            //Print("times ",TimeToStr(iTime(    _Symbol, NN456_PeriodWork,  j + NN456_DataElementInp * k)));//
                                                  }//
                                                  indexSeries++; //
                                        } //
                                        //Print("------");//
                              }//
                    } //
                    else
                    {         for(int k = 0; k < NN456_DataSamples; k++)
                              {         for(int j = 0; j < NN456_DataElementInp; j++)
                                        {         if(NN456_IsMine)//mine
                                                  {         inpvalSeriesX[k][j] = (double)(iTime(    _Symbol, NN456_PeriodWork,  0) + PeriodSeconds(NN456_PeriodWork) * indexSeries); //
                                                  } //inpvalSeriesX[k][j] = (double)(iTime(    _Symbol, NN456_PeriodWork,  j) + PeriodSeconds(NN456_PeriodWork) * indexSeries ); //has coralation!!!
                                                  if(!NN456_IsMine)//profesor
                                                  {         inpvalSeriesX[k][j] = (double)(iClose(    _Symbol, NN456_PeriodWork,  indexSeries) );
                                                            //if(j % 1 == 0)inpvalSeriesX[k][j] = (double)(iClose(    _Symbol, NN456_PeriodWork,  indexSeries) );
                                                            //if(j % 2 == 0)inpvalSeriesX[k][j] = (double)(iVolume(    _Symbol, NN456_PeriodWork,  indexSeries) );
                                                            //if(j % 3 == 0)inpvalSeriesX[k][j] = (double)(iOpen(    _Symbol, NN456_PeriodWork,  indexSeries) );
                                                            //if(j % 4 == 0)inpvalSeriesX[k][j] = (double)(iHigh(    _Symbol, NN456_PeriodWork,  indexSeries) );
                                                            //if(j % 5 == 0)inpvalSeriesX[k][j] = (double)(iLow(    _Symbol, NN456_PeriodWork,  indexSeries) );
                                                            //Print("times ",TimeToStr(iTime(    _Symbol, NN456_PeriodWork,  j + NN456_DataElementInp * k)));//
                                                  }
                                                  indexSeries++; //
                                        } //
                                        //Print("------");//
                              }//
                    }//
          }
          for(int k = 0; k < ArraySize(inp); k++)
          {         inp[k].Clear();
                    for(int j = 0; j < NN456_DataElementInp; j++)//count neuron equal..there is no target
                              inp[k].Add(inpvalSeriesX[k][j]);//
          }
          //----------------------------------------------------------------------
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double NN_Neurons_Matrix_Run456:: calculateMSE_Sample(const CArrayDouble_MQL4 &predicted[], const CArrayDouble_MQL4 &actual[])
{         if (ArraySize(predicted) != ArraySize(actual))return -999.999;
          double mseall = 0;
          for(int j = 0; j < ArraySize(predicted); j++)
          {         if (predicted[j].Total() != actual[j].Total())
                    {         // Error handling for input size mismatch
                              //throw std::runtime_error("Input vectors must have the same size.");
                              Print("NN_Neurons_Matrix_Run456:: calculateMSE_Sample-> not same size predicted.Total() != actual.Total()"); return -999.999; //
                    }
                    double sumSquaredDiff = 0.0;
                    for (int i = 0; i < predicted[j].Total(); ++i)
                    {         double diffError = predicted[j].At(i) - actual[j].At(i);
                              sumSquaredDiff += diffError * diffError; //
                    }
                    double mse = sumSquaredDiff / predicted[j].Total();//
                    mseall += mse; //
          }
          mseall /= ArraySize(actual);
          return mseall; //
}
//+------------------------------------------------------------------+
//|                                                                  |_LastError, ErrorDescription(_LastError)
//+------------------------------------------------------------------+
bool NN_Neurons_Matrix_Run456:: Load(bool IsKey, CArrayInt_MQL4 &fTopology)
{         if(IsKey)
          {         int handle = -1;
                    handle = FileOpen("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run456.bin", FILE_READ | FILE_BIN);
                    //Cheack file not existed
                    if(INVALID_HANDLE == handle)
                    {         Print("**************************** Load: Cant Open NetWork File *************************");
                              FileClose(handle);
                              handle = FileOpen("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run456.bin", FILE_WRITE | FILE_READ | FILE_BIN);//
                    }
                    //Cheack file Is Empty Var
                    if(INVALID_HANDLE != handle)
                    {         if(FileSize(handle) == 0)    { myNet.IsEmptyFile = true; Print("**************************** NN_Neurons_Matrix_Run456::Load FILE_EMPTY ****************************");}
                              else                         { myNet.IsEmptyFile = false; }//
                    }
                    //Cheack file Load
                    if( 1 && myNet.IsEmptyFile == false) //IsFristTime
                    {         ResetLastError();// file must be opened with FILE_READ flag  5010
                              //Cheack file Load
                              if(!myNet.Load(handle, fTopology))
                              {         Print("**************************** Cant Load NN NET diffrent topology *************************");
                                        FileClose(handle); FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run456.bin"); Sleep(1000); //
                                        return false;//
                              } //
                              else { FileClose(handle); return true; }//
                    } //
                    else
                    {         FileClose(handle); Print("**************************** Cant Load NetWork File >> myNet.IsEmptyFile == true *************************"); } //
          }
          //Print("**************************** Cant Load Not Active ****************************");
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool NN_Neurons_Matrix_Run456:: Save(bool IsKey)
{         if(IsKey)
          {         ResetLastError(); int handle = FileOpen("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run456.bin", FILE_WRITE | FILE_BIN);
                    if(INVALID_HANDLE != handle)
                    {         //
                              if(!myNet.Save(handle))/*Worked successfuly*/
                              {         Print("**************************** Cant Save NetWork *************************");
                                        FileClose(handle); FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run456.bin"); Sleep(1000); } //
                              else {return true; /*IsFristTime = 1;*/} //
                    }//
                    else
                    {         Print("**************************** Cant Save invaliade file *************************", _LastError, ErrorDescription(_LastError));
                              FileClose(handle); Sleep(1000);  } //
          }//
          //Print("**************************** Cant Save Not Active ****************************");
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
