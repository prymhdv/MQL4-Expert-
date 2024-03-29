//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||PO||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||URY|||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#property  strict
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\MatrixVector.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Matrix769\NN_Neurons_Matrix_Net.mqh>
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
#define DataSamples 1000
#define  Validation_GapBar 300
bool IsMinError[Validation_GapBar];
//+------------------------------------------------------------------+
//|                                                                  |, double LearningRate = 0.15, double Momentom = 0.5
//+------------------------------------------------------------------+
class NN_Neurons_Matrix_Run769_VectorNet
{
public:
          NN_Neurons_Matrix_Run769_VectorNet(double fBias, double fLearningRate, double fMomentom, double fRASF)
          {         IsTrained = false; isTarget2 = 1; Bias = fBias;   LearningRate = fLearningRate  ;   Momentom = fMomentom;  RASF = fRASF;
                    //myNet[i] = NN_Neurons_Matrix_CNet(topology, NNNM_Sigmoid, NNNM_ReLU, LearningRate = 0.05, Momentom = 0.9, RASF = 6);//
                    ArrayResize(myNet, DataSamples); //
          };
          NN_Neurons_Matrix_Run769_VectorNet(void)  { IsTrained = false; isTarget2 = 1; };
          ~NN_Neurons_Matrix_Run769_VectorNet(void) {  for(int i = 0;  i < ArraySize(myNet) ; i++) delete myNet[i]; };//delete myNet2;
          //----------------------------------------------------------
          uint       show_time;// = 50; // Chart display time (seconds)
          bool       IsTrained;
          bool       isTarget2;

          //performance index is mean square error
          //----------------------------------------------------------
          NN_Neurons_Matrix_CNet *myNet[];//class variables need pointer mode init
          double     Bias;
          double     LearningRate;          // = 0.15;
          double     Momentom;              // = 0.5
          double RASF    ;              //= 100
          double     calculateRMSE_Samples(const CArrayDouble_MQL4 & predicted[], const CArrayDouble_MQL4 & actual[], string s);
          double     calculateRMSE_Sample(const CArrayDouble_MQL4 & predicted, const CArrayDouble_MQL4 & actual, string s);
          //----------------------------------------------------------
          int           MainProgress(bool b);
          void          _MainRun_();//>...........................................................................................................
          void          fillInputsTraining(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &tar[]);
          void          fillInputsValidation(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &tar[], int gap);

          void          fillInputsTraining2(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &tar[]);
          void          fillInputsValidation2(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &inpMine[], CArrayDouble_MQL4 &tar[], CArrayDouble_MQL4 &finalseries[], int idx);

          //--
          bool          Load(bool IsKey);
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
          void       Vtrade();
          uchar      OptimizeOFFER( ushort bw, ushort sw, ushort bl, ushort sl);
          //---------------------------------------------------------


};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int NN_Neurons_Matrix_Run769_VectorNet::MainProgress(bool b)
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
uint DayoutX = (uint)((Time[0] + PeriodSeconds(PERIOD_D1) * 1) + Time[0]);
#define PeriodWork PERIOD_M1

/* 3/10 not aloved 0.3*/ /* !! in XOR  Every Sample has one target */        /* one futer to 1000 sample or 1000futer in one sample */
#define DataElementsPack 1     /* *2 */
#define DataElementInpSeries 1 /*not sample based//series based*/
#define DataElementInp (DataElementInpSeries * DataElementsPack)   /*one candel just say its bulish or bearish*/
#define DataElementOut 1  /* (DataElementInpSeries * DataElementsPack + DataElementInpSeries * 0) */
#define DataPaketGapInp 20
#define DataPaketGapTar 0
//-----------------------------------------
#define ValidationRangeStartLR  DataElementsPack*2+0
#define DataSamplePartsGap 1
//-----------------------------------------
#define WantedPerdicateRange 20
#define Trainingepochs DataSamples*10  //---350-400converge
//-----------------------------------------
#define NetworkSaveLoad 0//if saved convergence to training set
#define IsMine 1
//----------------------------------------- Last Trained Sample Convergenced By MSE ----------------------
#define IsRMSE 0
#define IsMSEBreake 0.001/DataSamples
#define RunTimeLimit 6//secound
datetime InitTime = TimeLocal();
datetime CurrTime = TimeLocal();
//-----------------------------------------
uint Traininginp_index_T1   = 0;
uint Trainingtar_index_T0   = 0;
uint Validationinp_index_T1 = 0;
uint Validationtar_index_T0 = 0;
uint Perdiction_index_T1    = 0;
//-----------------------------------------
void NN_Neurons_Matrix_Run769_VectorNet::_MainRun_()
{         {         Sleep(2000); } //
          //********************************************************* Build Network *********************************************************
          CMatirx_Vector<double> DataSetMatrix(DataSamples, DataElementInp + DataElementOut); DataSetMatrix.setAt(0, 0, 0.2); DataSetMatrix.setAt(0, 1, 0.6);
          //--- create our neural network
          CArrayInt_MQL4 topology;    topology.Clear();                                  //--- add the configuration [2,2,1] //---!!
          {         //-----------------------------
                    topology.Add(DataElementInp);  //Input layer>>>>>//---adding element n to array elements form end//dependet number of element you want to input - frist layer
                    //-----------------------------
                    topology.Add(DataElementInp * 4); //cos(x) n is sycle in cos(x) //1000D
                    //topology.Add(DataElementInp * 2);  //cos(x) n is sycle in cos(x) //500D
                    //topology.Add(2);                                              //2D
                    //topology.Add(1);                                              //1D
                    //-----------------------------
                    topology.Add(DataElementOut);  //output layer>>>>>
                    //more memory path in W,B If we want to approximate a function that has a large number of inflection points, we will need to have a large number of neurons in the hidden layer.
                    //the capabilities of the network were inherently limited by the number of hidden neurons it contained.
          }
          /*-------------------------------------------------*///(MathRand() % 10)/10//   + (float)rand() / (INT_MAX)
          //__Learnin_Rate__ important other not effected  LearningRate 0.001= [1985.52 : 69] [LearningRate 0.19= 1985.52 :1400][LearningRate 0.039] [LearningRate = 0.039, Momentom = 0.051, RASF = 10>>1985.52 :1400]
          //--- Initialize the network with our configuration ///when not pointer 2023.10.20 12:14:50.106     QUARTS_AF1 XAUUSD,M1: invalid pointer access in 'NN_Neurons_Matrix_Net.mqh' (98,106)
          //topology, NNNM_Sigmoid, NNNM_ReLU,Bias = 1.0,  LearningRate = 0.039, Momentom = 0.051, RASF = 1000[notefected]
          for(int i = 0; i < DataSamples; i++)
          {         myNet[i] = new NN_Neurons_Matrix_CNet(DataSamples, topology, NNNM_Sigmoid, NNNM_ReLU,
                                                          LearningRate = 0.3 + 0.0000 /*/ DataSamples*/, Momentom = 0.50 - 0.0000, RASF = 100.0);   //
          }
          if( !Load(NetworkSaveLoad)) {/*Print("NetworkSaveLoad end failiure!");*/}//no need before seted, myNet = NN_Neurons_Matrix_CNet(topology, NNNM_Sigmoid, NNNM_ReLU, LearningRate = 0.05, Momentom = 0.9, RASF = 6);
          //********************************************************* Prapare Data Sample *********************************************************
          //--- create data containers
          CArrayDouble_MQL4 Training_inputVals_Matrix[],   Training_targetVals_Matrix[], Training_resultVals_Matrix[];     ///--{0.0,     0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0,    0.0}
          CArrayDouble_MQL4 Validation_inputVals_Matrix[], Validation_resultVals_Matrix[], Validation_TargetVals_Matrix[]; /*outputsVals_Matrix*/;
          ArrayResize(Training_inputVals_Matrix,  DataSamples);    ArrayResize(Training_targetVals_Matrix, DataSamples);      ArrayResize(Training_resultVals_Matrix, DataSamples);
          ArrayResize(Validation_inputVals_Matrix,  DataSamples);  ArrayResize(Validation_resultVals_Matrix, DataSamples); ArrayResize(Validation_TargetVals_Matrix, DataSamples);
          /*-------------------------------------------------*/
          //Print("NetworkSaveLoad!");
          //****************************************************************************** Start [Triaining] fillInputsTraining //******************************************************************************
          {         uint epochs = 10;
                    //********************************************************* Start [Triaining] *********************************************************
                    {         //double        rms_ErrorLine[DataSamples][];   //---save netErrors every epoche reserve epochs count
                              double        rms_ErrorLine[DataSamples];
                              ArrayResize(rms_ErrorLine, 0, (int)Trainingepochs);
                              //******************************************************************************
                              double RMSE_Curr_Cheack = 10; double RMSE_Prev_Cheack = 0;
                              InitTime = TimeLocal();
                              fillInputsTraining(Training_inputVals_Matrix, Training_targetVals_Matrix);//every epoch sample Q*H Change issue
                              //********************************************************* Start [Triaining] Epoch : all sample used in training*********************************************************
                              //while(RMSE_Curr_Cheack > IsMSEBreake)
                              {         for(uint j = 0;  j < epochs ; j++)//(j < epochs*100000) &&( (CurrTime - InitTime) < RunTimeLimit )
                                        {         //--- create training data and check compatibility with the network
                                                  //--- number of inputs MUST be equal to number of input neurons in your network
                                                  uint index = MathRand() % DataSamples;  //??---------------evey epoch provided one set of four set to update net wieght vectors----------------------------
                                                  for(int i = 0; i < ArraySize(myNet); i++)
                                                  {         index = i;
                                                            //index = MathRand() % DataSamples;/* error configed for one sample make nosied neurons */
                                                            //Print("-----------------------""DataSamples:", (string)i, "  iepochs:", (string)epochs, "  ", "j:", (string)j, "  index:", (string)index); //
                                                            if(Training_inputVals_Matrix[index].Total() != topology.At(0))
                                                            {         Print("Incompatible inputs!",
                                                                            (string)Training_inputVals_Matrix[index].Total(), "  topology.At(topology.Total() - 1)", (string)topology.At(0)); break; }
                                                            //******************************************************************************
                                                            //--- make the network predict the result
                                                            myNet[i].feedForward_Net(Training_inputVals_Matrix[index], "OnTraining");
                                                            myNet[i].getResults(Training_resultVals_Matrix[index]); //
                                                            if(IsMSEBreake > calculateRMSE_Sample(Training_targetVals_Matrix[index], Training_resultVals_Matrix[index], "OnTraining calculateRMSE_Sample")) {continue;};
                                                            //******************************************************************************
                                                            //--- check compatibility of target values and number of output neurons
                                                            //--- target values must be equal to the number of output neurons
                                                            if(Training_targetVals_Matrix[index].Total() != topology.At(topology.Total() - 1))
                                                            {         Print("OnTraining->Incompatible targetVals", "  Training_targetVals_Matrix[index].Total():",
                                                                            (string)Training_targetVals_Matrix[index].Total(), "  topology.At(topology.Total() - 1)", (string)topology.At(topology.Total() - 1)); break; }
                                                            //******************************************************************************
                                                            //--- make the network learn
                                                            if(1)
                                                            {         if(i < ArraySize(IsMinError) && !IsMinError[i])myNet[i].backProp_Net(Training_targetVals_Matrix[index], epochs, j);
                                                                      else myNet[i].backProp_Net(Training_targetVals_Matrix[index], epochs, j);
                                                                      myNet[i].getResults(Training_resultVals_Matrix[index]); //
                                                            }
                                                            if(0)
                                                            {         if(i < ArraySize(IsMinError) && !IsMinError[i])myNet[i].backProp_Net_Levenberg_Marquardt_Algorithm(Training_targetVals_Matrix[index]);
                                                                      else myNet[i].backProp_Net_Levenberg_Marquardt_Algorithm(Training_targetVals_Matrix[index]);
                                                                      myNet[i].getResults(Training_resultVals_Matrix[index]); //
                                                                      //
                                                            }
                                                            //******************************************************************************
                                                            uint indexrms = ArraySize(rms_ErrorLine);
                                                            ArrayResize(rms_ErrorLine, indexrms + 1);
                                                            //rms_ErrorLine[index][indexrms] = myNet.getRecentAverageError();
                                                            rms_ErrorLine[indexrms] = myNet[i].getRecentAverageError(); //Print("myNet[i].getRecentAverageError():", (string)myNet[i].getRecentAverageError()); //
                                                            // Sleep(3000);
                                                            double RecentAverageError = myNet[i].getRecentAverageError();;
                                                            while(RecentAverageError > 100 && 0)
                                                            {         myNet[i].feedForward_Net(Training_inputVals_Matrix[index], "OnTraining");
                                                                      myNet[i].backProp_Net(Training_targetVals_Matrix[index], epochs, j);
                                                                      RecentAverageError = myNet[i].getRecentAverageError(); //
                                                                      Print("-----------------------epochs:", (string)epochs, "  ", "j:", (string)j,
                                                                            "   myNet[i].getRecentAverageError(): ", DoubleToStr(myNet[i].getRecentAverageError(), 2),
                                                                            "   myNet[i].getLastRMSError(): ", DoubleToStr(myNet[i].getLastRMSError(), 2)
                                                                           );//
                                                                      Sleep(10);//
                                                            }//
                                                  } //
                                                  //******************************************************************************
                                                  if(IsRMSE && 1)
                                                  {         RMSE_Curr_Cheack = calculateRMSE_Samples(Training_targetVals_Matrix, Training_resultVals_Matrix, "OnTraining calculateRMSE_Samples ");
                                                            if(0)Print("epochs:", (string)epochs, "  j:", (string)j, "  ", "RMSE_Curr_Cheack:", (string)RMSE_Curr_Cheack);
                                                            //Print("epochs:j  ", epochs, ":", j, "  RMSE_Curr_Cheack:", RMSE_Curr_Cheack); ///.
                                                            if(IsMSEBreake > RMSE_Curr_Cheack) {break;};
                                                            if(RMSE_Prev_Cheack == RMSE_Curr_Cheack && RMSE_Curr_Cheack < IsMSEBreake) {break;};
                                                            (RMSE_Curr_Cheack < IsMSEBreake) ? epochs -= 1 : epochs += 1 ;  //------200000000.1000 Effect: matched>> //
                                                            RMSE_Prev_Cheack = RMSE_Curr_Cheack;
                                                            //if(IsRMSE)(RMSE_Curr_Cheack < 200000000.1000) ? epochs -= 3 : epochs += 3 ;//------200000000.1000 Effect: matched>> //
                                                            //--best out--2023.10.21 17:20:11.041   QUARTS_AF1 XAUUSD,M1: epochs:136  RMSE_Curr_Cheack:4090.061513722014
                                                            //if(RMSE_Curr_Cheack < 20000.1000) ? myNet[i].m_layer[0].m_data[i].LearningRate=0
                                                            //if(IsRMSE)(RMSE_Curr_Cheack < 0.0010) ? epochs -= 3 : epochs += 3 ;//------off Effect:not matched>> //
                                                  }
                                                  //******************************************************************************
                                                  CurrTime = TimeLocal();
                                                  //Print("epochs:", (string)epochs, "  ", "j:", (string)j, "  ", (string)((double)(CurrTime - InitTime)), "  ", (datetime)InitTime, "  ", (datetime)CurrTime); //
                                                  //******************************************************************************
                                        }//
                                        Print( "  Training_MSE:", DoubleToStr(RMSE_Curr_Cheack, 7)); //
                              }//
                    }//
          }
          if( !Save(NetworkSaveLoad) && NetworkSaveLoad) {/*Print("!Save(NetworkSaveLoad)");*/  return ; }
          //****************************************************************************************************************************************************
          //by illustrate trained result get the Result same as Targets!!
          //********************************************************* Start [Training] feedForward_Net *********************************************************
          {
                    {         fillInputsTraining(Training_inputVals_Matrix, Training_targetVals_Matrix);
                              for(int k = 0; k < ArraySize(Training_inputVals_Matrix); k++)
                              {         //for(int i = 0; i < ArraySize(myNet); i++)
                                        {         myNet[k].feedForward_Net(Training_inputVals_Matrix[k],                    "OnTraining");
                                                  myNet[k].getResults(Training_resultVals_Matrix[k]); //
                                        }//
                              } //
                    }
                    if(IsMine)//mine time based
                    {         int nameCounterSampleInput = 0; int nameCounterSampleOutput = 0; int nameCounterSampleTarget = 0;
                              for(int i = 0 ; i < ArraySize(Training_inputVals_Matrix); i++) //sample based
                              {         int nameCounterElementInput = 0; int nameCounterElementOutPut = 0; int nameCounterElementTarget = 0;
                                        ++nameCounterSampleInput; ++nameCounterSampleOutput; ++nameCounterSampleTarget;
                                        //Print("Validation_inputVals_Matrix[i].Total():", Validation_inputVals_Matrix[i].Total());
                                        for(int j = 0; j < DataElementInp; j += DataElementInpSeries) //ArraySize(Training_resultVals_Matrix)-1
                                        {         datetime time = (datetime)Training_inputVals_Matrix[i].At(DataElementInpSeries - 1 + j); //5 + j
                                                  //if(DataElementInpSeries == 1)time = iTime(_Symbol, PeriodWork, Traininginp_index_T1 + (i * DataElementsPack) + (i * DataSamplePartsGap) - j);
                                                  time = iTime(_Symbol, PeriodWork, i);
                                                  double price = Training_targetVals_Matrix[i].At(j);//ArraySize(Training_targetVals_Matrix)-1 -
                                                  //if(DataElementInpSeries != 1)price        = Training_inputVals_Matrix[i].At(j);
                                                  string nameInput =  "Fit Point.NN-Training-Input:" + (string)(nameCounterSampleInput) + ":" + (string)(++nameCounterElementInput) + "  " + string(Training_inputVals_Matrix[i].Total());
                                                  ObjectDelete(0,         nameInput);
                                                  ObjectCreate(0,         nameInput, OBJ_TEXT, 0, (datetime)time, price ); //
                                                  ObjectSetString(0,      nameInput, OBJPROP_TEXT, "*");
                                                  ObjectSetString(0,      nameInput, OBJPROP_FONT, "Arial");
                                                  ObjectSetInteger(0,     nameInput, OBJPROP_FONTSIZE, 14);
                                                  ObjectSetDouble(0,      nameInput, OBJPROP_ANGLE, 0);
                                                  ObjectSetInteger(0,     nameInput, OBJPROP_ANCHOR, 0);
                                                  ObjectSetInteger(0,     nameInput, OBJPROP_COLOR, clrRed); //
                                                  //Print(Validation_inputVals_Matrix[i].At(0 + scaler));//
                                        }
                                        for(int j = 0; j < DataElementInp; j += DataElementInpSeries)
                                        {         //-----------------------------------------------------------
                                                  datetime time = (datetime)Training_resultVals_Matrix[i].At(DataElementInpSeries - 1 + j);
                                                  time = (datetime)Training_inputVals_Matrix[i].At(DataElementInpSeries - 1 + j);
                                                  time = (datetime)iTime(_Symbol, PeriodWork, Traininginp_index_T1 + (i * DataElementsPack) + (i * DataSamplePartsGap) - j);/*just for same place*/
                                                  //time = iTime(_Symbol, PeriodWork, Trainingtar_index_T0 + (i * DataElementsPack) + (i * DataSamplePartsGap) - j);
                                                  double price = Training_resultVals_Matrix[i].At(j) + 5;
                                                  string nameResult =  "Fit Point.NN-Training-Result:" + (string)(nameCounterSampleOutput) + ":" + (string)(++nameCounterElementOutPut) + "  " + string(Training_resultVals_Matrix[i].Total());
                                                  ObjectDelete(0,         nameResult);
                                                  ObjectCreate(0,         nameResult, OBJ_TEXT, 0, (datetime)time, price ); //
                                                  ObjectSetString(0,      nameResult, OBJPROP_TEXT, "*");
                                                  ObjectSetString(0,      nameResult, OBJPROP_FONT, "Arial");
                                                  ObjectSetInteger(0,     nameResult, OBJPROP_FONTSIZE, 14);
                                                  ObjectSetDouble(0,      nameResult, OBJPROP_ANGLE, 0);
                                                  ObjectSetInteger(0,     nameResult, OBJPROP_ANCHOR, 0);
                                                  ObjectSetInteger(0,     nameResult, OBJPROP_COLOR, clrOrange); //
                                        }//
                              }//
                    }//
          }
          //********************************************************* Start [Validation] feedForward_Net *********************************************************
          int gap = Validation_GapBar;
          //for(int p = 0; p < 5; p += 1)
          {         //gap -= 100;
                    fillInputsValidation(Validation_inputVals_Matrix, Validation_TargetVals_Matrix, gap);
                    for(int k = 0; k < DataSamples; k++)
                    {         //for(int i = 0; i < ArraySize(myNet); i++)
                              {         myNet[k].feedForward_Net(Validation_inputVals_Matrix[k], "OnValidation-Cheak");
                                        myNet[k].getResults(Validation_resultVals_Matrix[k]); //
                                        if(IsMSEBreake > calculateRMSE_Sample(Validation_TargetVals_Matrix[k], Validation_resultVals_Matrix[k], "OnTraining calculateRMSE_Sample")) //
                                                  if(k < 500)
                                                  {         Print("k:", k, " gap:", gap);
                                                            IsMinError[k] = true; }//
                                        gap--;//
                              } //
                    }
                    //********************************************************* Start Validation Show *********************************************************Validation_inputVals_Matrix[i].At(5 + scaler)
                    if(IsMine)//mine time based
                    {         int nameCounterSampleResultPerdiction = 0;
                              for(int i = 0; i < ArraySize(Validation_inputVals_Matrix); i++)//sample based
                              {         int nameCounterElementResultPerdiction = 0;
                                        ++nameCounterSampleResultPerdiction;
                                        for(int j = 0; j < DataElementInp; j += DataElementInpSeries)
                                        {         //-----------------------------------------------------------
                                                  datetime time = (datetime)Validation_inputVals_Matrix[i].At(DataElementInpSeries - 1 + j);
                                                  time = iTime(_Symbol, PeriodWork, Validationtar_index_T0 + (i * DataElementsPack) + (i * DataSamplePartsGap) - j);
                                                  time = iTime(_Symbol, PeriodWork, Validation_GapBar) + PeriodSeconds(PeriodWork) * i;
                                                  double price = Validation_resultVals_Matrix[i].At(j) - 0;
                                                  string nameResult =  "Fit Point.NN-Validation-ResultPerdiction" /*+ (string)gap*/ + ":" + (string)(nameCounterSampleResultPerdiction) + ":" + (string)(++nameCounterElementResultPerdiction) + "  " + string(Validation_resultVals_Matrix[i].Total());
                                                  ObjectDelete(0,         nameResult);
                                                  ObjectCreate(0,         nameResult, OBJ_TEXT, 0, (datetime)time, price ); //
                                                  ObjectSetString(0,      nameResult, OBJPROP_TEXT, "*");
                                                  ObjectSetString(0,      nameResult, OBJPROP_FONT, "Arial");
                                                  ObjectSetInteger(0,     nameResult, OBJPROP_FONTSIZE, 14);
                                                  ObjectSetDouble(0,      nameResult, OBJPROP_ANGLE, 0);
                                                  ObjectSetInteger(0,     nameResult, OBJPROP_ANCHOR, 0);
                                                  ObjectSetInteger(0,     nameResult, OBJPROP_COLOR, clrDeepSkyBlue); //
                                        }//
                              }//
                    }//
          }
          //-------------------------------------
          //Print("\nInputs : ");ArrayPrint(inp);
          //---ACCURANCY VALIDATION
          {         double expected = 0;
                    double predicted = 0;
                    double error = 0;
                    double allresult = 0;
                    for(int i = 0; i < ArraySize(Training_resultVals_Matrix); i++)
                    {         for(int k = 0; k < Training_resultVals_Matrix[i].Total(); k++)
                              {         //--- check availability of results
                                        //Print("Result : ", DoubleToString(Training_resultVals_Matrix[0].At(0), 4));
                                        //Print("Expected : ", DoubleToString(Training_resultVals_Matrix[0].At(0), 4));
                                        //--- check accuracy
                                        expected = Training_targetVals_Matrix[i].At(k);
                                        predicted = Training_resultVals_Matrix[i].At(k);
                                        //---
                                        error += MathAbs(predicted - expected);//
                              }//
                    }//
                    error = error / (DataSamples * DataElementInp);
                    double accuracy = 100.0 - (((error) / (1 + 1)) * 100);//
                    double mse = calculateRMSE_Samples(Training_targetVals_Matrix, Training_resultVals_Matrix, "OnValidation calculateRMSE_Samples");
                    Print("Training_Accuracy : ", DoubleToString(accuracy, 2) + "%", "  Training_MSE:", DoubleToStr(mse, 7)); //
                    //Print("Result       : ", TimeToStr(Training_resultVals_Matrix[0].At(0)), "  ", "Result2      : ", DoubleToStr(Training_resultVals_Matrix[0].At(1), 2));
                    //Print("Expected : ", TimeToStr(Training_targetVals_Matrix[0].At(0)), "  ", "Expected2 : ", DoubleToStr(Training_targetVals_Matrix[0].At(1), 2));        //
                    Print( "Training_OneNeuronResult2      : ", DoubleToStr(Training_resultVals_Matrix[0].At(0), 2));
                    Print( "Training_OneNeuronExpected2 : ", DoubleToStr(Training_targetVals_Matrix[0].At(0), 2));        //
                    //
          }
          //********************************************************* Validation Show *********************************************************
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double returnValue(uint x, uint j, uint u)
{         if(x == 0) return (double)iTime(      _Symbol, PeriodWork,  j + DataElementInp * u); //
          if(x == 1) return (double)iClose(     _Symbol, PeriodWork,  j + DataElementInp * u); //
          if(x == 2) return (double)iVolume(    _Symbol, PeriodWork,  j + DataElementInp * u); //
          if(x == 3) return (double)iLow(       _Symbol, PeriodWork,  j + DataElementInp * u); //
          if(x == 4) return (double)iHigh(      _Symbol, PeriodWork,  j + DataElementInp * u); //
          if(x == 5) return (double)iOpen(      _Symbol, PeriodWork,  j + DataElementInp * u); //
          return 0;//
}
//+------------------------------------------------------------------+if(MathRand() % 2 == 0)
//|  generate training data and feed into input arrays               |MathRand() % inp_index_T1  ///over training
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_Run769_VectorNet::fillInputsTraining(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &tar[])
{         //******************************************** Input Elements *********************************************************DataSamples * DataElementInp % k==0  uint indexSeries = k * DataElementInp;
          const uint inp_index_T1 = DataElementsPack  + DataPaketGapInp; //yesterday     //+ MathRand() % DataElementsPack///--depended where series start...to plot validation
          const uint tar_index_T0 = inp_index_T1 - DataPaketGapTar; //today     //inp_index_T1 - MathRand() % inp_index_T1 not work
          Traininginp_index_T1 = inp_index_T1;
          Trainingtar_index_T0 = tar_index_T0;
          //-------------------------------------------------
          int idxD = 0;//arrayneded
          //input
          //error must all sample provided change place not sample value//int RandomSampled = (MathRand() % DataSamples) + MathRand() % DataSamples; // RandomSampled = 0;
          uint inp_index_StartTo0A = 0;
          for(int i = 0; i < ArraySize(inp); i++)
          {         //inp_index_StartTo0A = (inp_index_T1 * i) + inp_index_T1 + (i * DataSamplePartsGap);
                    inp_index_StartTo0A = inp_index_T1 + (i * DataElementsPack) + (i * DataSamplePartsGap) /*+ RandomSampled*/;
                    inp[i].Clear();
                    for(int k = 0; k < (DataElementInp / DataElementInpSeries); k++)
                    {         uint  idxc = inp_index_StartTo0A; // MathRand() % inp_index_T1; idxD = idxc;
                              //inp[i].Add(((double)iClose(        _Symbol, PeriodWork,  i))); //
                              //inp[i].Add(((double)iVolume(       _Symbol, PeriodWork,  i))); //
                              //inp[i].Add(((double)iOpen(         _Symbol, PeriodWork,  i))); //
                              //inp[i].Add(((double)iHigh(         _Symbol, PeriodWork,  i))); //
                              //inp[i].Add(((double)iLow(          _Symbol, PeriodWork,  i))); //
                              inp[i].Add(MathLog(MathSqrt(MathLog(MathSqrt((double)iTime(         _Symbol, PeriodWork,  i))))) - 0); //
                              inp_index_StartTo0A--;//
                    } //
          }
          //target
          uint tar_index_StartTo0A = 0;
          //target modek 2
          for(int i = 0; i < ArraySize(tar); i++)
          {         //tar_index_StartTo0A = (tar_index_T0 * i) + tar_index_T0 + (i * DataSamplePartsGap);
                    tar_index_StartTo0A = tar_index_T0 + (i * DataElementsPack) + (i * DataSamplePartsGap) /*+ RandomSampled*/;
                    tar[i].Clear();
                    for(int k = 0; k < DataElementOut ; k++)
                    {         uint idxc = tar_index_StartTo0A; // MathRand() % tar_index_T0;
                              if(k > (DataElementOut / DataElementInpSeries))
                              {         //tar[i].Add((double)iClose(        _Symbol, PeriodWork,  indexF++)); //as example
                                        //tar[i].Add(0); //as example
                              }
                              else
                              {         tar[i].Add((double)iClose(        _Symbol, PeriodWork,  i)); //
                                        //tar[i].Add((double)iVolume(       _Symbol, PeriodWork,  idxc)); //
                                        //tar[i].Add((double)iOpen(         _Symbol, PeriodWork,  idxc)); //
                                        //tar[i].Add((double)iHigh(         _Symbol, PeriodWork,  idxc)); //
                                        //tar[i].Add((double)iLow(          _Symbol, PeriodWork,  idxc)); //
                                        //tar[i].Add((double)iTime(         _Symbol, PeriodWork,  idxc)); //
                              }
                              tar_index_StartTo0A--; //
                    }//
          } //
          //Print("tar.Total(): ",tar[0].Total(),"   ","inp.Total(): ",inp[0].Total()); Sleep(5000);//
          //---
          return; //
}
//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 100
//|  generate Validating data and feed into input arrays             |+ PeriodSeconds(PeriodWork) * 300)
//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 10
void NN_Neurons_Matrix_Run769_VectorNet::fillInputsValidation(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &tar[], int gap)
{         //******************************************** Validation Input Elements *********************************************************
          //--- if we are here, unseen data is needed [1,1,0] answer [1] trained network
          const uint inp_index_T1 = ValidationRangeStartLR + DataPaketGapInp; //yesterday
          const uint tar_index_T0 = inp_index_T1 - DataPaketGapTar; //today
          Validationinp_index_T1 = inp_index_T1;
          Validationtar_index_T0 = tar_index_T0;
          //-------------------------------------------------
          //input
          uint inp_index_StartTo0A = 0;
          for(int i = 0; i < ArraySize(inp); i++)
          {         inp_index_StartTo0A =  inp_index_T1 + (i * DataElementsPack) + (i * DataSamplePartsGap);
                    //inp_index_StartTo0A = (inp_index_T1 * i) + inp_index_T1 + (i * DataSamplePartsGap);
                    //if(i == 0)inp_index_StartTo0A =  inp_index_T1;
                    //else inp_index_StartTo0A =  inp_index_T1 + (i * DataElementsPack) + (i * DataSamplePartsGap);
                    inp[i].Clear();
                    for(int k = 0; k < (DataElementInp / DataElementInpSeries); k++)//
                    {         uint idxc = inp_index_StartTo0A;
                              //inp[i].Add(((double)iClose(        _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              //inp[i].Add(((double)iVolume(       _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              //inp[i].Add(((double)iOpen(         _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              //inp[i].Add(((double)iHigh(         _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              //inp[i].Add(((double)iLow(          _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              //inp[i].Add(((double)iTime(         _Symbol, PeriodWork,  inp_index_StartTo0A)+ PeriodSeconds(PeriodWork) * k)); //
                              //if(IsMine)
                              //>>multy sample one future inp[i].Add(((double)iTime(         _Symbol, PeriodWork,  0) + PeriodSeconds(PeriodWork) * k)); //
                              //inp[i].Add((double)iClose(        _Symbol, PeriodWork,  i)); //
                              //inp[i].Add((double)iVolume(       _Symbol, PeriodWork,  i)); //
                              //inp[i].Add((double)iOpen(         _Symbol, PeriodWork,  i)); //
                              //inp[i].Add((double)iHigh(         _Symbol, PeriodWork,  i)); //
                              //inp[i].Add((double)iLow(          _Symbol, PeriodWork,  i)); //
                              inp[i].Add((MathLog(MathSqrt(MathLog(MathSqrt((double)iTime(         _Symbol, PeriodWork,  0 + gap)  + PeriodSeconds(PeriodWork) * i)))))); //
                                         //Print("tar.Total(): ",tar[i].Total(),"   ","inp.Total(): ",inp[i].Total(),"  k: ",k);
                                         inp_index_StartTo0A--;//
                    } //
          }//
          //Target
          uint tar_index_StartTo0A = 0;
          for(int i = 0; i < ArraySize(tar); i++)
          {         tar_index_StartTo0A =  tar_index_T0 + (i * DataElementsPack) + (i * DataSamplePartsGap);
                    //inp_index_StartTo0A = (inp_index_T1 * i) + inp_index_T1 + (i * DataSamplePartsGap);
                    //if(i == 0)inp_index_StartTo0A =  inp_index_T1;
                    //else inp_index_StartTo0A =  inp_index_T1 + (i * DataElementsPack) + (i * DataSamplePartsGap);
                    tar[i].Clear();
                    for(int k = 0; k < (DataElementOut / DataElementInpSeries); k++)//
                    {         uint idxc = tar_index_StartTo0A; // MathRand() % tar_index_T0;
                              //tar[i].Add(((double)iClose(        _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              //tar[i].Add(((double)iVolume(       _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              //tar[i].Add(((double)iOpen(         _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              //tar[i].Add(((double)iHigh(         _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              //tar[i].Add(((double)iLow(          _Symbol, PeriodWork,  inp_index_StartTo0A))); //
                              //tar[i].Add(((double)iTime(         _Symbol, PeriodWork,  inp_index_StartTo0A)+ PeriodSeconds(PeriodWork) * k)); //
                              //if(IsMine)
                              //>>multy sample one future inp[i].Add(((double)iTime(         _Symbol, PeriodWork,  0) + PeriodSeconds(PeriodWork) * k)); //
                              //tar[i].Add((double)iClose(        _Symbol, PeriodWork,  i)); //
                              //tar[i].Add((double)iVolume(       _Symbol, PeriodWork,  i)); //
                              //tar[i].Add((double)iOpen(         _Symbol, PeriodWork,  i)); //
                              //tar[i].Add((double)iHigh(         _Symbol, PeriodWork,  i)); //
                              //tar[i].Add((double)iLow(          _Symbol, PeriodWork,  i)); //
                              //if(gap >= 0)
                              tar[i].Add((double)iClose(         _Symbol, PeriodWork,  0 + gap - i + idxc)); //
                              //Print("tar.Total(): ",tar[i].Total(),"   ","inp.Total(): ",inp[i].Total(),"  k: ",k);
                              tar_index_StartTo0A--;//
                    } //
          }//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double NN_Neurons_Matrix_Run769_VectorNet:: calculateRMSE_Samples(const CArrayDouble_MQL4 &predicted[], const CArrayDouble_MQL4 &actual[], string s)
{         if (ArraySize(predicted) != ArraySize(actual)) {Print("NN_Neurons_Matrix_Run769_VectorNet:: calculateRMSE_Sample-> ArraySize(predicted) != ArraySize(actual) ", ArraySize(predicted), " : ", ArraySize(actual), s); return 999999999.999;}
          double mseall = 0;
          double SumErrorPower2 = 0.0; //error^2+error^2
          for(int j = 0; j < ArraySize(predicted); j++)
          {         if (predicted[j].Total() != actual[j].Total())
                    {         // Error handling for input size mismatch
                              //throw std::runtime_error("Input vectors must have the same size.");
                              continue;
                              Print("NN_Neurons_Matrix_Run769_VectorNet:: calculateRMSE_Sample-> not same size predicted[", (string)j, "].Total() != actual[", (string)j, "].Total() ", ArraySize(predicted), " : ", ArraySize(actual), s); return 999999999.999;  //
                    }
                    double ErrorPower2 = 0.0; //error^2
                    for (int i = 0; i < predicted[j].Total(); ++i)//where series data com total is one
                    {         double diffError = predicted[j].At(i) - actual[j].At(i);
                              ErrorPower2 += diffError * diffError; //
                    }
                    SumErrorPower2 += ErrorPower2;//
          }
          double MeanSumErrorPower2 = 0.0;
          if(ArraySize(predicted) != 0) {MeanSumErrorPower2 = SumErrorPower2 / ArraySize(predicted);} //ArraySize(actual);
          else {Print("NN_Neurons_Matrix_Run769_VectorNet:: calculateRMSE_Sample count:zero ", ArraySize(predicted));} //
          double RootMeanSumErrorPower2 = sqrt(MeanSumErrorPower2);
          return RootMeanSumErrorPower2; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double NN_Neurons_Matrix_Run769_VectorNet:: calculateRMSE_Sample(const CArrayDouble_MQL4 &predicted, const CArrayDouble_MQL4 &actual, string s)
{         if (predicted.Total() != actual.Total()) {Print("NN_Neurons_Matrix_Run769_VectorNet:: calculateRMSE_Sample-> predicted.Total() != actual.Total() ", predicted.Total(), " : ", actual.Total()); return  999999999.999;}
          double mseall = 0;
          double SumErrorPower2 = 0.0; //error^2+error^2
          {         if (predicted.Total() != actual.Total())
                    {         // Error handling for input size mismatch
                              //throw std::runtime_error("Input vectors must have the same size.");
                              Print("NN_Neurons_Matrix_Run769_VectorNet:: calculateRMSE_Sample-> not same size predicted.Total() != actual.Total() ", predicted.Total(), " : ", actual.Total(), s); return  999999999.999; //
                              return 999999999; //
                    }
                    double ErrorPower2 = 0.0; //error^2
                    for (int i = 0; i < predicted.Total(); ++i)//where series data com total is one
                    {         double diffError = predicted.At(i) - actual.At(i);
                              ErrorPower2 += diffError * diffError; //
                    }
                    SumErrorPower2 += ErrorPower2;//
          }
          double MeanSumErrorPower2 = 0.0;
          if(predicted.Total() != 0) {MeanSumErrorPower2 = SumErrorPower2 / predicted.Total();} //ArraySize(actual);
          else {Print("NN_Neurons_Matrix_Run769_VectorNet:: calculateRMSE_Sample count:zero ", predicted.Total());} //
          double RootMeanSumErrorPower2 = sqrt(MeanSumErrorPower2);
          return RootMeanSumErrorPower2; //
}
//+------------------------------------------------------------------+
//|                                                                  |_LastError, ErrorDescription(_LastError)
//+------------------------------------------------------------------+
bool NN_Neurons_Matrix_Run769_VectorNet:: Load(bool IsKey)
{         if(IsKey)
          {         int handle = -1;
                    handle = FileOpen("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769_VectorNet[].bin", FILE_READ | FILE_BIN);
                    //Cheack file not existed
                    if(INVALID_HANDLE == handle)
                    {         Print("****************************____NN_Neurons_Matrix____ Load: Cant Open NetWork File INVALID_HANDLE *************************");
                              Sleep(10000);
                              //new file
                              handle = FileOpen("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769_VectorNet[].bin", FILE_WRITE | FILE_READ | FILE_BIN); //
                              //no need return and close file
                    }
                    //Cheack file Is Empty Var
                    bool IsEmptyFile = false;
                    if(INVALID_HANDLE != handle)
                    {         if(FileSize(handle) == 0)
                              {         IsEmptyFile = true;
                                        Print("****************************____NN_Neurons_Matrix____ Load FILE_EMPTY ****************************"); //
                              }
                              else   { IsEmptyFile = false; }//
                    }
                    //Cheack file Load
                    if( 1 && IsEmptyFile == true) //file empty
                    {         ResetLastError();// file must be opened with FILE_READ flag  5010
                              Print("****************************____NN_Neurons_Matrix____ Cant Load NetWork File >>  IsEmptyFile == true  GONE TO SAVE FIRST TIME*************************");//
                              FileClose(handle);
                              return false;//
                    } //
                    else//file not empty back
                    {         for(int i = 0; i < ArraySize(myNet); i++)
                              {         //Cheack file Load
                                        if(!myNet[i].Load(handle, i))
                                        {         Print("****************************____NN_Neurons_Matrix____ Cant Load NN NET diffrent topology ___NOT__READ__SUCCESSFULLY___DELETE FILE___*************************");
                                                  FileClose(handle); Sleep(4000); FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769_VectorNet[].bin"); Sleep(1000); //
                                                  return false;//
                                        } //
                                        //continus
                                        /*FileClose(handle);*/ /* go next sample */
                                        char end = 'a';
                                        //Print("FileTell(handle):",FileTell(handle));
                                        //FileSeek(handle, sizeof(Char), SEEK_CUR);//
                                        //bool isEndFileLine = FileIsLineEnding(handle); //
                                        //bool isEndFile =FileIsEnding(handle); //
                              }//
                              FileClose(handle);
                              return true;//
                    } //
          }
          //Print("**************************** Cant Load Not Active ****************************");
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool NN_Neurons_Matrix_Run769_VectorNet:: Save(bool IsKey)
{         if(IsKey)
          {         ResetLastError(); int handle = FileOpen("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769_VectorNet[].bin", FILE_WRITE | FILE_BIN);
                    FileFlush(handle);//
                    if(INVALID_HANDLE != handle) {/*FileFlush(handle);*/}
                    else
                    {         Print("**************************** Cant Save invaliade file *************************", _LastError, ErrorDescription(_LastError));
                              FileClose(handle); Sleep(1000); return false; // //
                    } //
                    for(int i = 0; i < ArraySize(myNet); i++)
                    {         //
                              if(!myNet[i].Save(handle, i)) /*Worked successfuly*/
                              {         Print("**************************** ___NN_Neurons_Matrix___Cant Save NetWork " + (string)i + "*************************");
                                        //FileFlush(handle);
                                        FileClose(handle); //FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_Run769_VectorNet[].bin"); Sleep(1000);
                                        return false;//
                              } //
                              else {/*FileClose(handle);*/  /*IsFristTime = 1;*/} //
                    }//
                    FileClose(handle);
                    //Print("**************************** Cant Save Not Active ****************************");
                    return true; //
          } //
          //Print("**************************** Cant Save Not Active ****************************");
          return false;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//Print(j, " j1:", j % 1 );; //
//Print(j, " j2:", j % 2);
//Print(j, " j3:", j % 3);
//Print(j, " j4:", j % 4);
//Print(j, " j5:", j % 5); Sleep(300);
//Print(j, " j6:", j % 6); //
//Print(j, "  ", j == (DataElementInp % 1));
//Print(j, "  ", j == (DataElementInp % 2));
//Print(j, "  ", j == (DataElementInp % 3));
//Print(j, "  ", j == (DataElementInp % 4));
//Print(j, "  ", j == (DataElementInp % 5));
//Print(j, "  ", j == (DataElementInp % 6));
//Print(j, "  ", j == (DataElementInp % 7)); Sleep(600); //

//if(j == 0)===if(j % DataElementInp == 0)
//if(j == 1)===if(j % DataElementInp == 1)
//if(j == 2)===if(j % DataElementInp == 2)
//if(j == 3)===if(j % DataElementInp == 3)
//if(j == 4)===if(j % DataElementInp == 4)
//if(j == 5)===if(j % DataElementInp == 5)
// not same as 123456--123456---need tyo set  if(j == 0)
// if(j % DataElementInp == 0) Print(j);
//if(j % DataElementInp == 1) Print(j);
//if(j % DataElementInp == 2) Print(j);
//if(j % DataElementInp == 3) Print(j);
//if(j % DataElementInp == 4) Print(j);
//if(j % DataElementInp == 5) Print(j);
//if(j % DataElementInp == 6) Print(j);
//Print("--------");
//+------------------------------------------------------------------+if(MathRand() % 2 == 0)
//|  generate training data and feed into input arrays               |
//+------------------------------------------------------------------+
void NN_Neurons_Matrix_Run769_VectorNet::fillInputsTraining2(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &target[])
{         //******************************************** Input Elements *********************************************************DataSamples * DataElementInp % k==0  uint indexSeries = k * DataElementInp;
          double inpvalSeriesX[DataSamples][DataElementInp]; ArrayInitialize(inpvalSeriesX, 0.0);
          uint indexSeries = 0;//yesterday
          uint indexSeriesB = 0;//yesterday
          indexSeries = MathRand() % 3000; //yesterdays
          indexSeries = 1; //yesterdays
          for(int k = 0; k < DataSamples; k++)
          {         for(int j = 0; j < DataElementInp; j++)
                    {         if(IsMine)//mine idea
                              {         //inpvalSeriesX[k][j] = (double)iTime(    _Symbol, PeriodWork,  indexSeries); //wrong
                                        int plus = 0;
                                        inpvalSeriesX[k][plus] = (double)iClose(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iVolume(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iOpen(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iHigh(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iLow(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iTime(    _Symbol, PeriodWork,  indexSeries); //
                              }
                              if(!IsMine)//profesor
                              {         inpvalSeriesX[k][j] = (double)iClose(    _Symbol, PeriodWork,  indexSeriesB); //
                                        //inpvalSeriesX[k][plus] = (double)iClose(    _Symbol, PeriodWork,  indexSeries); //
                                        //inpvalSeriesX[k][++plus] = (double)iVolume(    _Symbol, PeriodWork,  indexSeries); //
                                        //inpvalSeriesX[k][++plus] = (double)iOpen(    _Symbol, PeriodWork,  indexSeries); //
                                        //inpvalSeriesX[k][++plus] = (double)iHigh(    _Symbol, PeriodWork,  indexSeries); //
                                        //inpvalSeriesX[k][++plus] = (double)iLow(    _Symbol, PeriodWork,  indexSeries); //
                                        //Print("times ", TimeToStr(iTime(    _Symbol, PeriodWork,  j + DataElementInp * k))); //
                              }
                              //
                              //for(int o = 0; o < DataElementInp; o++)
                              //{         static uint c = 0;
                              //          if(c > 5)c = 0;
                              //          inpvalSeriesX[k][j] = returnValue(c, j, u); //
                              //          c++;//
                              //}  //
                              indexSeriesB++;//
                    } //
                    indexSeries++;//
                    //Print("------");//
          }
          for(int k = 0; k < ArraySize(inp); k++)
          {         inp[k].Clear();
                    for( int j = 0; j < DataElementInp; j++)
                              inp[k].Add(inpvalSeriesX[k][j]);//
          }
          //******************************************** Target Elements *********************************************************
          double tarvalSeriesX[DataSamples][DataElementOut]; ArrayInitialize(tarvalSeriesX, 0.0);//{{1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }, {1, 1, 1, 1, 1, 1, 1, 1, 1, 1 } };
          uint indexSeries2 = 0;//today
          uint indexSeriesBt = 0; //
          for(int k = 0; k < DataSamples; k++)
          {         for(int j = 0; j < DataElementOut; j++)
                    {         if(IsMine)//mine
                              {         tarvalSeriesX[k][j] = (double)iClose(    _Symbol, PeriodWork, indexSeriesBt);//
                              }
                              if(!IsMine)//profesor
                              {         if(1)//two neuron out
                                        {         int plus = 0;
                                                  //   tarvalSeriesX[k][plus] = (double)iTime(    _Symbol, PeriodWork, indexSeries2);
                                                  //    tarvalSeriesX[k][++plus] = iClose(   _Symbol, PeriodWork,  indexSeries2); //
                                                  //    tarvalSeriesX[k][++plus] = iVolume(   _Symbol, PeriodWork,  j + DataElementOut * k); //
                                        }
                                        if(1)//one neuron out
                                        {         //tarvalSeriesX[k][j] = iClose(   _Symbol, PeriodWork,  j + DataElementOut * k); //
                                                  tarvalSeriesX[k][j] = (double)iClose(    _Symbol, PeriodWork, indexSeriesBt);//
                                        } //
                              }//
                              indexSeriesBt++;//
                    } //
                    indexSeries2++;//
          }
          for(int k = 0; k < ArraySize(target); k++)
          {         target[k].Clear();
                    for(int j = 0; j < DataElementOut; j++)
                    {         target[k].Add(tarvalSeriesX[k][j]);}//
          }
          //---
          return; //
}

//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 100
//|  generate Validating data and feed into input arrays             |+ PeriodSeconds(PeriodWork) * 300)
//+------------------------------------------------------------------++ PeriodSeconds(PeriodWork) * 10
void NN_Neurons_Matrix_Run769_VectorNet::fillInputsValidation2(CArrayDouble_MQL4 &inp[], CArrayDouble_MQL4 &inpMine[], CArrayDouble_MQL4 &tar[], CArrayDouble_MQL4 &finalseries[], int idx)
{         //******************************************** Validation Input Elements *********************************************************
          //--- if we are here, unseen data is needed [1,1,0] answer [1] trained network
          double inpvalSeriesX[DataSamples][DataElementInp]; ArrayInitialize(inpvalSeriesX, 0.0);
          double inpvalSeriesY[DataSamples][DataElementInp]; ArrayInitialize(inpvalSeriesY, 0.0);
          uint indexSeries = ValidationRangeStartLR;//validation no need jump back//--at time frame 1m its start 100 candel !
          uint indexSeriesB = ValidationRangeStartLR;
          uint indexStartTo0 = ValidationRangeStartLR + DataSamples;
          //seriesfinal
          if(finalseries[idx].At(0) > 0.000)
          {         for(int k = 0; k < DataSamples; k++)
                    {         for(int j = 0; j < DataElementInp; j++)
                              {         if(IsMine)//mine
                                        {         int plus = 0;
                                                  inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));//
                                                  inpvalSeriesY[k][j] = (double)(finalseries[k].At(j));//
                                        }
                                        if(!IsMine)//profesor
                                        {         //inpvalSeriesX[k][j] = (double)(iTime(    _Symbol, PeriodWork,  j) + PeriodSeconds(PeriodWork) * indexSeries ); //has coralation!!!
                                                  inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                  int plus = 0;
                                                  //if(plus)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                  //if(++plus)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                  //if(++plus)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                  //if(++plus)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                  //if(++plus)inpvalSeriesX[k][j] = (double)(finalseries[k].At(j));
                                                  //Print("times ",TimeToStr(iTime(    _Symbol, PeriodWork,  j + DataElementInp * k)));//
                                        }//
                                        indexSeriesB++;//
                              } //
                              indexSeries++; //
                              //Print("------");//
                    }//
          } //
          else//frist time
          {         for(int k = 0; k < DataSamples; k++)
                    {         if(IsMine)
                              {         int plus = 0;
                                        inpvalSeriesX[k][plus]   = (double)iClose(    _Symbol, PeriodWork,  indexSeries);
                                        inpvalSeriesX[k][++plus] = (double)iVolume(    _Symbol, PeriodWork,  indexSeries);
                                        inpvalSeriesX[k][++plus] = (double)iOpen(    _Symbol, PeriodWork,  indexSeries);
                                        inpvalSeriesX[k][++plus] = (double)iHigh(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iLow(    _Symbol, PeriodWork,  indexSeries); //
                                        inpvalSeriesX[k][++plus] = (double)iTime(    _Symbol, PeriodWork,  indexSeries); //
                                        //
                                        int plus2 = 0; //Sleep(2000); ResetLastError();
                                        inpvalSeriesY[k][plus2]   = (double)iClose(    _Symbol, PeriodWork,  indexSeries); // Print("inpvalSeriesY[", k, "][", plus2, "]:", inpvalSeriesY[k][plus2],ErrorDescription(_LastError));ResetLastError();////
                                        inpvalSeriesY[k][++plus2] = (double)iVolume(    _Symbol, PeriodWork,  indexSeries);//Print("inpvalSeriesY[", k, "][", plus2, "]:", inpvalSeriesY[k][plus2],ErrorDescription(_LastError));ResetLastError();// //
                                        inpvalSeriesY[k][++plus2] = (double)iOpen(    _Symbol, PeriodWork,  indexSeries);  //Print("inpvalSeriesY[", k, "][", plus2, "]:", inpvalSeriesY[k][plus2],ErrorDescription(_LastError));ResetLastError();////
                                        inpvalSeriesY[k][++plus2] = (double)iHigh(    _Symbol, PeriodWork,  indexSeries);  //Print("inpvalSeriesY[", k, "][", plus2, "]:", inpvalSeriesY[k][plus2],ErrorDescription(_LastError));ResetLastError();////
                                        inpvalSeriesY[k][++plus2] = (double)iLow(    _Symbol, PeriodWork,  indexSeries);   //
                                        inpvalSeriesY[k][++plus2] = (double)iTime(    _Symbol, PeriodWork,  indexSeries);  //
                              }
                              indexSeries++;
                              for(int j = 0; j < DataElementInp; j++)
                              {         if(IsMine)//mine
                                        {         //inpvalSeriesY[k][j] = (double)iClose(    _Symbol, PeriodWork,  indexSeriesB);//
                                                  //inpvalSeriesX[k][j] = (double)iTime(    _Symbol, PeriodWork,  indexSeriesB);// //
                                                  //Print(j, "  ", j == (DataElementInp % 0));'0' - division by zero in the constant expression       NN_Neurons_Matrix_Run.mqh     449       89
                                                  //
                                        }
                                        if(!IsMine)//profesor
                                        {         inpvalSeriesX[k][j] = (double)(iClose(    _Symbol, PeriodWork,  indexSeries) ); //
                                                  //if(j % DataElementInp ==  0)inpvalSeriesX[k][j] = (double)(iClose(    _Symbol, PeriodWork,  indexSeries) ); //
                                                  //if(j % DataElementInp ==  0)inpvalSeriesX[k][j] = (double)(iVolume(    _Symbol, PeriodWork,  indexSeries) ); //
                                                  //if(j % DataElementInp ==  0)inpvalSeriesX[k][j] = (double)(iOpen(    _Symbol, PeriodWork,  indexSeries) ); //
                                                  //if(j % DataElementInp ==  0)inpvalSeriesX[k][j] = (double)(iHigh(    _Symbol, PeriodWork,  indexSeries) ); //
                                                  //if(j % DataElementInp ==  0)inpvalSeriesX[k][j] = (double)(iLow(    _Symbol, PeriodWork,  indexSeries) ); //
                                        }
                                        //Print("times ",TimeToStr(iTime(    _Symbol, PeriodWork,  j + DataElementInp * k)));//
                                        indexSeriesB++;//
                              } //
                              //Print("------");//
                    }//
          } //
          for(int k = 0; k < ArraySize(inp); k++)
          {         inp[k].Clear();
                    for(int j = 0; j < DataElementInp; j++)//count neuron equal..there is no target
                              inp[k].Add(inpvalSeriesX[k][j]);//
          }
          for(int k = 0; k < ArraySize(inpMine); k++)
          {         inpMine[k].Clear();
                    for(int j = 0; j < DataElementInp; j++)//count neuron equal..there is no target
                    {         //if(j == 0)Print("inpMine==inpvalSeriesY[", k, "][", 0, "]:", inpvalSeriesY[k][0]);
                              inpMine[k].Add(inpvalSeriesY[k][j]);//
                    }//
          }
          //******************************************** Validation Target Elements *********************************************************
          double tarvalSeriesX[DataSamples][DataElementOut]; ArrayInitialize(tarvalSeriesX, 0.0);//{{1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }, {1, 1, 1, 1, 1, 1, 1, 1, 1, 1 } };
          uint indexSeries2 = ValidationRangeStartLR - 1; //today
          for(int k = 0; k < DataSamples; k++)
          {         for(int j = 0; j < DataElementOut; j++)
                    {         if(1)//two neuron out
                              {         //if(j == 0)   tarvalSeriesX[k][j] = (double)iTime(    _Symbol, PeriodWork, indexSeries2);
                                        //if(j == 1)   tarvalSeriesX[k][j] = iClose(   _Symbol, PeriodWork,  indexSeries2); //
                                        //if(j == 2)   tarvalSeriesX[k][j] = iVolume(   _Symbol, PeriodWork,  j + DataElementOut * k); //
                              }
                              if(1)//one neuron out
                              {         //tarvalSeriesX[k][j] = iClose(   _Symbol, PeriodWork,  j + DataElementOut * k); //
                                        tarvalSeriesX[k][j] = (double)iClose(    _Symbol, PeriodWork, indexSeries2);//
                              } //
                              indexSeries2++;//
                    } //
          }
          for(int k = 0; k < ArraySize(tar); k++)
          {         tar[k].Clear();
                    for(int j = 0; j < DataElementOut; j++)
                    {         tar[k].Add(tarvalSeriesX[k][j]);}//
          }
          //
}

//+------------------------------------------------------------------+
//if(i == 0) inp_index_StartTo0A = (inp_index_T1 * i) + inp_index_T1 + (i * DataSamplePartsGap);
//if(i == 1) inp_index_StartTo0A = (inp_index_T1 * 0) + inp_index_T1 + (0 * DataSamplePartsGap) + (i * ValidationRangeStartLR);
//if(i == 2) inp_index_StartTo0A = (inp_index_T1 * 0) + inp_index_T1 + (i * ValidationRangeStartLR);
//if(i == 0)inp_index_StartTo0A = (inp_index_T1 * i) + inp_index_T1 + (i * 10); //inp_index_T1 + 0; //
//if(i == 1)inp_index_StartTo0A = (inp_index_T1 * i) + inp_index_T1 + 10;
//if(i == 2)inp_index_StartTo0A = (inp_index_T1 * i) + inp_index_T1 + 20;
