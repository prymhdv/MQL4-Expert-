//+------------------------------------------------------------------+
//||   ||||||||||       Sd_DATA_FILES_FOLDERS_DISK.mqh              ||
//|||  ||||||PO||     Copyright © 2020-2023, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||URY|||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
//#define mtype  float
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\VectorZ.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionXObj\VectorZObj.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\MatrixVector.mqh>
//typedef float typer;
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#define __IsDEBUG__NNS_Neurons_Matrix_YX_Run 1
#property  strict

//enum LossMethod_ {         _SUM_SQUARED_ERROR, _MEAN_SQUARED_ERROR, _NORMALIZED_SQUARED_ERROR, _MINKOWSKI_ERROR, _WEIGHTED_SQUARED_ERROR, _CROSS_ENTROPY_ERROR };
//enum OptimizationMethod_ { _GRADIENT_DESCENT, _GRADIENT_DESCENT_MOMENTOM, _CONJUGATE_GRADIENT, _QUASI_NEWTON_METHOD, _LEVENBERG_MARQUARDT_ALGORITHM, _STOCHASTIC_GRADIENT_DESCENT, _ADAPTIVE_MOMENT_ESTIMATION, _CONVOLUTIONAL };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Sampler_InRange( double OldMin, double OldMax, double NewMin, double NewMax, double OldValue)
{         //return  (                                                                     * (( max - min) + min));
          double OldRange = (OldMax - OldMin);  double NewRange = (NewMax - NewMin);
          double NewValue = 0.0;
          return NewValue = (((OldValue - OldMin) * NewRange) / OldRange) + NewMin; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
t Sampler_InRange2(double val, double Min, double Max) { return (t)(val * (Max - Min) + Min); } /* val in range [0,1] */
//==============================================================================================================================
template<typename t>
VectorZ<t> Sampler_DataNormilizer_Standardize_Z_Score(VectorZ<t> &Series)//--  -X mean 0 +X
{         VectorZ<t> SeriesTemp;//
          t VMean = Series.Mean();
          for(int i = 0; i < Series.Total(); i++)
          {         if(Series.SD() == 0) {Print("Sampler Sampler_DataNormilizer_Standardize_Z_Score Series.SD() == 0  ", Series.SD() == 0, "  Series.Total():", Series.Total()); return SeriesTemp;}
                    SeriesTemp << ((Series[i] - VMean) / Series.SD()); //
          }
          return SeriesTemp;//
}
template<typename t>
VectorZ<t> Sampler_DataNormilizer_Max_Min (VectorZ<t> &Series)
{         VectorZ<t> SeriesTemp;//
          for(int i = 0; i < Series.Total(); i++)
          {         t DataDiffMin = (Series[i] ) - (Series.GetMin());
                    t DataRange = Series.GetMax() - Series.GetMin();
                    if(DataRange == 0) {Print("Sampler DataRange == 0  ", DataRange == 0); return SeriesTemp;} //  ___WHEN ONE SAMPLE EXISTEX EERROR___
                    t NormilazeData = DataDiffMin / DataRange;                       //  ___TTTT___USING ARRAY MAXIMUM GET INDEX BUT NEAD INDEX VALUE___________
                    //{Print("  NormilazeDataTime: ", NormilazeDataTime, "       DataDiffMin: ", DataDiffMin, "        Diff: ", Diff,  "        i: ", i);  } //
                    if(NormilazeData > 1.0 || NormilazeData < 0.0) { Print("*******************NormilazeDataTime  ", NormilazeData, "*********************", " Not NORMALIZED " );}
                    SeriesTemp << NormilazeData; //
          }
          return SeriesTemp;//
}
template<typename t>
VectorZ<t> Sampler_DataNormilizer_Ranger(VectorZ<t> &Series, double OldMin, double OldMax, double NewMin, double NewMax)
{         VectorZ<t> SeriesTemp;//
          for(int i = 0; i < Series.Total(); i++)
          {         SeriesTemp << (t)Sampler_InRange(OldMin, OldMax, NewMin, NewMax, Series[i]); //__ACTIVATION SIGMOID IS 1.0___ALLOW -4 TO 4___
                    //___________WHEN MAKE RANGE 0 +1 ____ITS NOT OVER SATURATED_________________
          }
          return SeriesTemp;//
}
//==============================================================================================================================
template<typename t>
VectorZ<t> Sampler_DataNormilizer( VectorZ<t> &Series)
{         //--------------------------------------------------------------
          VectorZ<t> Normilizer_Z_Score            = Sampler_DataNormilizer_Standardize_Z_Score(Series);
          VectorZ<t> Normilizer_Max_Min_Z_Score    = Sampler_DataNormilizer_Max_Min (Normilizer_Z_Score);
          VectorZ<t> Normilizer_Max_MinSeries      = Sampler_DataNormilizer_Max_Min (Series);//not effected line
          VectorZ<t> Normilizer_RangedZ_Score      = Sampler_DataNormilizer_Ranger(Normilizer_Z_Score, 1960, 1995, -2, 2);
          //------------------
          return Normilizer_Max_Min_Z_Score;//
}
//==============================================================================================================================
template<typename t>
void Sampler_SampleShuffel(VectorZObj<VectorZ<t>> &inp, VectorZObj<VectorZ<t>> &tar, VectorZObj<VectorZ<t>> &tartime)
{         if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]DataSet Sample-Shuffel __START_0_");
          VectorZ<uint>  SeriesTempShuffels;
          for(uint i = 0; i < inp.Total(); i++) { SeriesTempShuffels << (MathRand() % (inp.Total() - 1)); }
          //return;//__No Memory leak___________
          VectorZObj<VectorZ<t>> inpTemp ;  VectorZObj<VectorZ<t>> tarTemp ; VectorZObj<VectorZ<t>> tarTimeTemp ;
          //return;//__No Memory leak___________
          inpTemp = inp;                tarTemp = tar;          tarTimeTemp = tartime;
          //ZeroMemory(inpTemp);ZeroMemory(tarTemp);ZeroMemory(tarTimeTemp);
          //Print("inpTemp.countelement", inpTemp.countelement, "   inpTemp[0].countelement", inpTemp[0].countelement, "   inpTemp[0].size()", inpTemp[0].size(), "   inpTemp.size()", inpTemp.size());
          //Print("inp.countelement", inp.countelement, "   inp[0].countelement", inp[0].countelement, "   inp[0].size()", inp[0].size(), "   inp.size()", inp.size());
          //return;//__No Memory leak___________
          inp.clear(); tar.clear(); tartime.clear();
          if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]DataSet Sample-Shuffel __START_1_", "   inpTemp.Total():", inpTemp.Total());
          //return;//__No Memory leak___________
          if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]DataSet Sample-Shuffel __START_2_", "   inpTemp.Total():", inpTemp.Total());
          for(uint j = 0; j < inpTemp.Total(); j++)
          {         //if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]DataSet Sampler_SampleShuffel __START_2.1_", "   inpTemp.Total():", inpTemp.Total(), "   j:", j);
                    inp         << inpTemp[SeriesTempShuffels[j]] ; //
                    tar         << tarTemp[SeriesTempShuffels[j]] ; //
                    tartime     << tarTimeTemp[SeriesTempShuffels[j]] ; //
                    //if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]DataSet Sample-Shuffel __START_2.2_", "   inpTemp.Total():", inpTemp.Total(), "   j:", j); //
          }
          if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]DataSet Sample-Shuffel __START_3_", "   inpTemp.Total():", inpTemp.Total());
          if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]DataSet Sample-Shuffel __END__");
          return;//__No Memory leak___________
}
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOAINN\NN_Neurons_Matrix769_YX_SamplerOk\NN_Neurons_Matrix_YX_SamplerOk_Net.mqh>
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
//namespace NN_Neurons_Matrix_YX_Sampler_Run {}

//+------------------------------------------------------------------+
//|                                                                  |, double LearningRate = 0.15, double Momentom = 0.5
//+------------------------------------------------------------------+
template<typename t>
class NN_Neurons_Matrix_YX_Sampler_Run
{
public:
          NN_Neurons_Matrix_YX_Sampler_Run(double fBias, double fLearningRate, double fMomentom, double fRASF)
          {         IsTrained = false; isTarget2 = 1; Bias = fBias;   LearningRate = fLearningRate  ;   Momentom = fMomentom;  RASF = fRASF;
                    //myNet = NNS_Neurons_Matrix_YX_CNet(topology, NNNMS_YX_Sigmoid, NNNMS_ReLU, LearningRate = 0.05, Momentom = 0.9, RASF = 6);//
                    //
          };
          NN_Neurons_Matrix_YX_Sampler_Run(void)  { IsTrained = false; isTarget2 = 1; };
          ~NN_Neurons_Matrix_YX_Sampler_Run(void) {   delete myNet; };//delete myNet2;
          //----------------------------------------------------------
          uint       show_time;// = 50; // Chart display time (seconds)
          bool       IsTrained;
          bool       isTarget2;

          //performance index is mean square error
          //----------------------------------------------------------
          NNS_Neurons_Matrix_YX_CNet<t> *myNet;//class variables need pointer mode init
          double     Bias;
          uint       BatchSize;
          uint       Epochs;                // = 10;
          bool       IsRanomSample;
          double     LearningRate;          // = 0.15;
          double     Momentom;              // = 0.5
          double     RASF    ;              //= 100
          double     MinRMSE;
          bool       IsLimRMSE;
          double     MinRMSE_MeanLim;
          double     MinRMSE_SpeedLim;
          //----------------------------------------------------------
          int           MainProgress(bool b);
          void          __MainRun__();//>...........................................................................................................
          void          fillInputsTraining(VectorZObj<VectorZ<t>> &inp, VectorZObj<VectorZ<t>> &tar);
          void          fillInputsValidation(VectorZObj<VectorZ<t>> &inp, VectorZObj<VectorZ<t>> &tar);


          //--
          bool          Load(bool IsKey);
          bool          Save(bool IsKey);
          //--
          //----------------------------------------------------------
          void       Vtrade();
          uchar      OptimizeOFFER( ushort bw, ushort sw, ushort bl, ushort sl);
          //---------------------------------------------------------


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename t>
int NN_Neurons_Matrix_YX_Sampler_Run::MainProgress(bool b)
{         //
          if(!b) {   return -1; }
          {         /*LOAD*///inner
                    /*PROGRESS*/ __MainRun__(); //Extract Trade Signal
                    /*PROGRESS*/ Vtrade();    //Trade Signal virtualy
                    /*SAVE*///inner
          }
          return 0;
          //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
uint Sampler_DayoutX_YX = (uint)((Time[0] + PeriodSeconds(PERIOD_D1) * 1) + Time[0]);
#define Sampler_PeriodWork PERIOD_M1
//__________-240_____+240________ trace
/* 3/10 not aloved 0.3*/ /* !! in XOR  Every Sample has one target */        /* one futer to 1000 sample or 1000futer in one sample */
#define Sampler_DataRangeStart 240
#define Sampler_DataSamples 10    //7000
#define Sampler_DataElementsPack 24    /* *2 */            //_______________NOT WORKED BARSERIES TO LEARN EACH ONE TARGET  NEED VECTOR NET______USE ONE PACKET_______
#define Sampler_DataElementInpSeries 4 /*not sample based//series based*/
#define Sampler_DataElementInp (Sampler_DataElementInpSeries * Sampler_DataElementsPack)   /*one candel just say its bulish or bearish*/
#define Sampler_DataElementOut    1  /* (Sampler_DataElementInpSeries * Sampler_DataElementsPack + Sampler_DataElementInpSeries * 0) */
#define Sampler_DataElementResult 1
#define Sampler_IsTimeInput 0
#define Sampler_IsSampler Sampler_DataElementsPack<2
#define Sampler_SampleRangeMin -2
#define Sampler_SampleRangeMax +2
//-----------------------------------------
#define Sampler_NetworkSaveLoad 0//if saved convergence to training set
//-----------------------------------------
template<typename t>
void NN_Neurons_Matrix_YX_Sampler_Run::__MainRun__()
{         if(0) {          } //
          //_____CHEAK ACTICVATION____
          if(0)
          {         for(int i = -15; i < 16; i++)
                    {         double Var = Sampler_InRange(-32, 32, -4, 4, i); Print(" valu:", (string)i, "  Var:", (string)Var,
                                                  "   sigmoid:", NN_Neurons_Matrix_YX_CNeuron::Activation_sigmoid(Var, 1.0))/*{4 -4}*/;   } return; }
          //********************************************************* Prapare Data Sample *********************************************************
          if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]Network TrainingDataSet Initilazing...!");
          VectorZObj<VectorZ<t>> TrainingDataSetMatrix_Inp(Sampler_DataSamples);    VectorZObj<VectorZ<t>> TrainingDataSetMatrix_InpTime(Sampler_DataSamples);
          VectorZObj<VectorZ<t>> TrainingDataSetMatrix_Target(Sampler_DataSamples); VectorZObj<VectorZ<t>> TrainingDataSetMatrix_TargetTime(Sampler_DataSamples); VectorZObj<VectorZ<t>> TrainingDataSetMatrix_TargetPrice(Sampler_DataSamples);
          VectorZObj<VectorZ<t>> TrainingDataSetMatrix_Res(Sampler_DataSamples);    VectorZObj<VectorZ<t>> TrainingDataSetMatrix_ResTemp(Sampler_DataSamples);
          VectorZObj<VectorZ<t>> TrainingErrors(Sampler_DataSamples);
          //VectorZ<VectorZ<double>> newSampleVector; //---blocked-- primal br refrence----5th time test---
          //return;//__No Memory leak___________
          if(Sampler_IsSampler)
          {         //******************************************** Inputs Define ******************************************
                    if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run) Print("[Training]DataSet samples data 0.1 Get Inputs Define");
                    VectorZ<t> PricesTime;   for(int v = Sampler_DataSamples; v >= 0; v--) { PricesTime    << (t)iTime(  _Symbol, Sampler_PeriodWork, v + 1 + Sampler_DataRangeStart);} ///240_+_7000
                    VectorZ<t> PricesClose;  for(int v = Sampler_DataSamples; v >= 0; v--) { PricesClose   << (t)iClose(  _Symbol, Sampler_PeriodWork, v + 1  + Sampler_DataRangeStart);}
                    VectorZ<t> PricesVolume; for(int v = Sampler_DataSamples; v >= 0; v--) { PricesVolume  << (t)iVolume(  _Symbol, Sampler_PeriodWork, v + 1  + Sampler_DataRangeStart);}
                    VectorZ<t> PricesOpen;   for(int v = Sampler_DataSamples; v >= 0; v--) { PricesOpen    << (t)iOpen(  _Symbol, Sampler_PeriodWork, v + 1  + Sampler_DataRangeStart);}
                    VectorZ<t> PricesMACD;   for(int v = Sampler_DataSamples; v >= 0; v--) { PricesMACD    << (t)iMACD(  _Symbol, Sampler_PeriodWork, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, v + 1  + Sampler_DataRangeStart);}
                    //return;//__No Memory leak___________
                    //******************************************** Inputs Define Normalizing******************************************
                    if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run) Print("[Training]DataSet samples data 0.2 Inputs Define Normalize");
                    PricesTime = Sampler_DataNormilizer(PricesTime); PricesClose = Sampler_DataNormilizer(PricesClose);  PricesVolume = Sampler_DataNormilizer(PricesVolume);  PricesOpen = Sampler_DataNormilizer(PricesOpen);
                    PricesMACD = Sampler_DataNormilizer(PricesMACD);
                    //return;//__No Memory leak___________
                    //******************************************** Inputs Define Normalized******************************************
                    if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run) Print("[Training]DataSet samples data 0.3 Set Inputs Define Normalize");
                    //return;//__No Memory leak___________
                    for(int i = 0; i < Sampler_DataSamples; i += 1)
                    {         //------------------------------------------------------TimeSeries Perdiction-----------------------------------------------------
                              if(Sampler_IsTimeInput)
                              {         TrainingDataSetMatrix_Inp[i] <<  PricesTime[i] ; //
                              }
                              //------------------------------------------------------TimeSeries Perdiction-----------------------------------------------------
                              else
                              {         //Pure
                                        TrainingDataSetMatrix_Inp[i] << PricesTime[i] ; //
                                        TrainingDataSetMatrix_Inp[i] << PricesClose[i]; //
                                        TrainingDataSetMatrix_Inp[i] << PricesVolume[i]; //
                                        //TrainingDataSetMatrix_Inp[i] << PricesOpen[i]; //
                                        //Technical
                                        TrainingDataSetMatrix_Inp[i] << PricesMACD[i]; //
                              }//
                    } //
                    //******************************************** Target Define ******************************************
                    if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run) Print("[Training]DataSet samples data 0.4 Set Target Define ");
                    //return;//__No Memory leak___________
                    for(int s = Sampler_DataSamples - 1/*max of array*/; s >= 0; s--)
                    {         //Fiting Susccessfuly
                              if(Sampler_IsTimeInput) {TrainingDataSetMatrix_Target[s]    << (t)(iClose(   _Symbol, Sampler_PeriodWork, s + 0  + 0 ));} //Sampler_DataRangeStart
                              //TimeSeries Perdiction
                              else {TrainingDataSetMatrix_Target[s]     << (t)(iClose(     _Symbol, Sampler_PeriodWork, s + 0  + 0 ));} //
                              TrainingDataSetMatrix_TargetTime[s]       << (t)iTime(       _Symbol, Sampler_PeriodWork,  s + 0  + 0 ); //
                    }
                    ////******************************************** Sampler_SampleShuffel Define ******************************************
                    if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run) Print("[Training]DataSet samples data 0.5 Set Data Sampler_SampleShuffel ");
                    //return;//__No Memory leak___________
                    Sampler_SampleShuffel(TrainingDataSetMatrix_Inp, TrainingDataSetMatrix_Target, TrainingDataSetMatrix_TargetTime);
                    //Print("after VectorZObj sizeof(TrainingDataSetMatrix_Inp):", sizeof(TrainingDataSetMatrix_Inp)); //
                    //Print("after VectorZObj sizeof(TrainingDataSetMatrix_Target):", sizeof(TrainingDataSetMatrix_Target)); //
                    //Print("after VectorZObj sizeof(TrainingDataSetMatrix_TargetTime):", sizeof(TrainingDataSetMatrix_TargetTime)); //
                    //return;//__No Memory leak___________
                    ////******************************************** Result Define ******************************************
                    if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run) Print("[Training]DataSet samples data 0.6 Set Data result ");
                    //return;//__No Memory leak___________
                    for(int s = 0; s < Sampler_DataSamples; s++)
                    {
                              {         TrainingDataSetMatrix_Res[s] << 0.0; //
                                        TrainingDataSetMatrix_ResTemp[s] << 0.0; //
                              }//
                    }//
          } //
          else
          {         for(int s = 0; s < Sampler_DataSamples; s++) //1*24*4
                    {         int sampleShift = s * Sampler_DataElementsPack;
                              //******************************************** Inputs Define ******************************************
                              VectorZ<t> PricesTime;   for(int v = Sampler_DataElementsPack; v >= 0; v--) { PricesTime    << (t)iTime(  _Symbol, Sampler_PeriodWork, sampleShift + v + 1 + Sampler_DataRangeStart);} ///240_+_7000
                              VectorZ<t> PricesClose;  for(int v = Sampler_DataElementsPack; v >= 0; v--) { PricesClose   << (t)iClose(  _Symbol, Sampler_PeriodWork, sampleShift + v + 1  + Sampler_DataRangeStart);}
                              VectorZ<t> PricesVolume; for(int v = Sampler_DataElementsPack; v >= 0; v--) { PricesVolume  << (t)iVolume(  _Symbol, Sampler_PeriodWork, sampleShift + v + 1  + Sampler_DataRangeStart);}
                              VectorZ<t> PricesOpen;   for(int v = Sampler_DataElementsPack; v >= 0; v--) { PricesOpen    << (t)iOpen(  _Symbol, Sampler_PeriodWork, sampleShift + v + 1  + Sampler_DataRangeStart);}
                              VectorZ<t> PricesMACD;   for(int v = Sampler_DataElementsPack; v >= 0; v--) { PricesMACD    << (t)iMACD(  _Symbol, Sampler_PeriodWork, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, sampleShift + v + 1  + Sampler_DataRangeStart);}
                              //******************************************** Inputs Define Normalizing******************************************
                              PricesTime          = Sampler_DataNormilizer(PricesTime);
                              PricesClose         = Sampler_DataNormilizer(PricesClose);
                              PricesVolume        = Sampler_DataNormilizer(PricesVolume);
                              PricesOpen          = Sampler_DataNormilizer(PricesOpen);
                              PricesMACD          = Sampler_DataNormilizer(PricesMACD);
                              //******************************************** Inputs Define Normalized******************************************
                              for(int v = 0; v < Sampler_DataElementsPack; v++)
                              {         //------------------------------------------------------TimeSeries Perdiction-----------------------------------------------------
                                        //Pure
                                        TrainingDataSetMatrix_Inp[s] << PricesTime[v] ; //
                                        TrainingDataSetMatrix_Inp[s] << PricesClose[v]; //
                                        TrainingDataSetMatrix_Inp[s] << PricesVolume[v]; //
                                        //TrainingDataSetMatrix_Inp[s] << PricesOpen[v]; //
                                        //Technical
                                        TrainingDataSetMatrix_Inp[s] << PricesMACD[v]; //
                              } //
                              //******************************************** Target Define ******************************************
                              for(int v = 0; v < Sampler_DataElementsPack; v++)
                              {         //Fiting Susccessfuly
                                        if(Sampler_IsTimeInput) {TrainingDataSetMatrix_Target[s]    << (t)(iClose(   _Symbol, Sampler_PeriodWork, sampleShift + v + 0  + 0 ));} //Sampler_DataRangeStart
                                        //TimeSeries Perdiction
                                        else {TrainingDataSetMatrix_Target[s]     << (t)(iClose(     _Symbol, Sampler_PeriodWork, sampleShift + v + 0  + 0 ));} //
                                        TrainingDataSetMatrix_TargetTime[s]       << (t)iTime(       _Symbol, Sampler_PeriodWork,  sampleShift + v + 0  + 0 ); //
                              }
                              ////******************************************** Sampler_SampleShuffel Define ******************************************
                              Sampler_SampleShuffel(TrainingDataSetMatrix_Inp, TrainingDataSetMatrix_Target, TrainingDataSetMatrix_TargetTime);
                              ////******************************************** Result Define ******************************************
                              for(int v = 0; v < Sampler_DataElementsPack; v++)
                              {         TrainingDataSetMatrix_Res[s] << 0.0; //
                              }//
                    } //
          }
          //return;//__No Memory leak___________
          //********************************************************* Build Network *********************************************************
          if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]Network topology Initilazing...!");
          CArrayInt_MQL4 topology;    topology.Clear();                                  //--- add the configuration [2,2,1] //---!!
          {         //-----------------------------
                    topology.Add(Sampler_DataElementInp);   //--- S0*1  s0=R
                    //-----------------------------
                    topology.Add(4); //_____good__45____10000 bar      ____DataSamples*4 for GDM Range -2 +2 ____
                    //topology.Add(2);  //--- S1*S0
                    //topology.Add(5);  //--- S1*S0
                    //topology.Add(10); //--- S1*S0
                    //topology.Add(5);  //--- S1*S0
                    //topology.Add(5);  //--- S1*S0
                    //topology.Add(1);  //--- S1*S0 deep learning
                    //-----------------------------
                    topology.Add(Sampler_DataElementOut);   //--- S2*S1
          }
          if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]Network Initilazing...!");//Epochs = Sampler_DataSamples * 1
          //Print("BatchSize: ", 5 % Sampler_DataSamples, " Sampler_DataSamples:", Sampler_DataSamples, " /5:", 5); return;
          //Print( "000Q1  TrainingDataSetMatrix_Res.Total():", TrainingDataSetMatrix_Res.Total(), "   TrainingDataSetMatrix_Res[0].Total():", TrainingDataSetMatrix_Res[0].Total(), "  TrainingDataSetMatrix_TargetTime.Total():", TrainingDataSetMatrix_TargetTime.Total(), "   TrainingDataSetMatrix_TargetTime[0].Total():", TrainingDataSetMatrix_TargetTime[0].Total());
          myNet = new NNS_Neurons_Matrix_YX_CNet<t>(); //
          myNet.Set_Topology(topology);
          myNet.Set_Methods(OptimizationMethod_::_LEVENBERG_MARQUARDT_ALGORITHM, LossMethod_::_MEAN_SQUARED_ERROR);
          myNet.Set_DataSet(Sampler_DataSamples,  TrainingDataSetMatrix_Inp,  TrainingDataSetMatrix_Target,  TrainingDataSetMatrix_Res, TrainingDataSetMatrix_TargetTime );
          myNet.Set_TrainParams(BatchSize = Sampler_DataSamples / 100, IsRanomSample, Epochs = 10, LearningRate = 0.50 + 0.0000 /* / Sampler_DataSamples*/, Momentom = 0.50 - 0.0000,
                                RASF = 100.0, MinRMSE = 0.0056, MinRMSE_MeanLim = 0.000001, MinRMSE_SpeedLim = 0.99001, IsLimRMSE = 1);
          myNet.Set_TrainActivations(NNNMS_YX_Sigmoid, NNNMS_YX_Purelim);
          myNet.Set_Build_Network();
          if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]Network Load...!");
          if(Sampler_NetworkSaveLoad)if(!Load(Sampler_NetworkSaveLoad)) {/*Print("Sampler_NetworkSaveLoad end failiure!");*/}//no need before seted, myNet = NNS_Neurons_Matrix_YX_CNet(topology, NNNMS_YX_Sigmoid, NNNMS_ReLU, LearningRate = 0.05, Momentom = 0.9, RASF = 6);
          //****************************************************************************** Start [Triaining] fillInputsTraining ******************************************************************************
          if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]Network myNet.Trainer...!");
          myNet.Trainer();
          if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]!Save(Network Save)...!");
          if(Sampler_NetworkSaveLoad)if(!Save(Sampler_NetworkSaveLoad)) {/*Print("!Save(Sampler_NetworkSaveLoad)");*/  return ; }
          //********************************************************* Start [Training] feedForward_Net  & show result *********************************************************
          if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]myNet.Simer...!");
          myNet.Simer(TrainingDataSetMatrix_Inp,  TrainingDataSetMatrix_Res, "[Training]");
          if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]show Data...!");
          //Print("[Training]show Data...!", "     TrainingDataSetMatrix_Res.Total()", TrainingDataSetMatrix_Res.Total());
          if(1 && 1) //mine time based
          {         //ObjectsDeleteAll(0, "Fit Point.NN");
                    for(int i = 0 ; i < Sampler_DataSamples; i++) //sample based
                    {         if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]show result...!");
                              for(int j = 0; j < Sampler_DataElementResult; j += 1)
                              {         //-----------------------------------------------------------
                                        datetime time = 0;
                                        if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]show result..0.!");
                                        time = (datetime)TrainingDataSetMatrix_TargetTime[i][j];
                                        //time = iTime(_Symbol, Sampler_PeriodWork, gapsamples  + j);
                                        //time = iTime(_Symbol, Sampler_PeriodWork, YX_Trainingtar_index_T0 + (i * Sampler_DataElementsPack) + (i * DataSamplePartsGap) - j);
                                        if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]show result..2.!");
                                        double price = TrainingDataSetMatrix_Res[i][j] + 0.0;
                                        string nameResult =  "Fit Point.NN-Training------Result:" + (string)(i) + ":" + (string)(j) + "  " + string(TrainingDataSetMatrix_Res[i].Total());
                                        ObjectDelete(0,         nameResult);
                                        ObjectCreate(0,         nameResult, OBJ_TEXT, 0, (datetime)time, price ); //
                                        ObjectSetString(0,      nameResult, OBJPROP_TEXT, "*");
                                        ObjectSetString(0,      nameResult, OBJPROP_FONT, "Arial");
                                        ObjectSetInteger(0,     nameResult, OBJPROP_FONTSIZE, 14);
                                        ObjectSetDouble(0,      nameResult, OBJPROP_ANGLE, 0);
                                        ObjectSetInteger(0,     nameResult, OBJPROP_ANCHOR, 0);
                                        ObjectSetInteger(0,     nameResult, OBJPROP_COLOR, clrDarkViolet); //
                              }//
                              if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print("[Training]show result..END.!");//
                    } //
          }//
          Print("[Training]show Data...END...!");
          //********************************************************* Start [Validation] feedForward_Net *********************************************************
#define Sampler_ValidationDataSamples 1 //_________VECTORX__OUT OF RANGE______
#define Sampler_ValidationDataElementsPack Sampler_DataElementsPack     /* *2 */
#define Sampler_ValidationDataElementInpSeries Sampler_DataElementInpSeries /*not sample based//series based*/
#define Sampler_ValidationDataElementInp (Sampler_ValidationDataElementInpSeries * Sampler_ValidationDataElementsPack)   /*one candel just say its bulish or bearish*/
#define Sampler_ValidationDataElementOut    Sampler_DataElementOut  /* (Sampler_DataElementInpSeries * Sampler_DataElementsPack + Sampler_DataElementInpSeries * 0) */
#define Sampler_ValidationDataElementResult Sampler_DataElementResult
          if(1)
          {         VectorZObj<VectorZ<t>> ValidationDataSetMatrix_Inp(Sampler_ValidationDataSamples);     VectorZObj<VectorZ<t>> ValidationDataSetMatrix_InpTime(Sampler_ValidationDataSamples);
                    VectorZObj<VectorZ<t>> ValidationDataSetMatrix_Target(Sampler_ValidationDataSamples);  VectorZObj<VectorZ<t>> ValidationDataSetMatrix_TargetTime(Sampler_ValidationDataSamples); VectorZObj<VectorZ<t>> ValidationDataSetMatrix_TargetPrice(Sampler_ValidationDataSamples);
                    VectorZObj<VectorZ<t>> ValidationDataSetMatrix_Res(Sampler_ValidationDataSamples);     VectorZObj<VectorZ<t>> ValidationDataSetMatrix_ResTemp(Sampler_ValidationDataSamples);
                    if(Sampler_IsSampler)
                    {         //******************************************** Inputs Define ******************************************
                              if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print(" validation DataSet normalize samples data 0");
                              //---------normalize data-------------
                              VectorZ<t> PricesTime;   for(int v = Sampler_ValidationDataSamples - 1; v >= 0; v--) { PricesTime         << (t)iTime(  _Symbol, Sampler_PeriodWork, v + 0);} ///240_+_7000
                              VectorZ<t> PricesClose;  for(int v = Sampler_ValidationDataSamples - 1; v >= 0; v--) { PricesClose        << (t)iClose(  _Symbol, Sampler_PeriodWork, v + 0);}
                              VectorZ<t> PricesVolume; for(int v = Sampler_ValidationDataSamples - 1; v >= 0; v--) { PricesVolume       << (t)iVolume(  _Symbol, Sampler_PeriodWork, v + 0);}
                              VectorZ<t> PricesOpen;   for(int v = Sampler_ValidationDataSamples - 1; v >= 0; v--) { PricesOpen         << (t)iOpen(  _Symbol, Sampler_PeriodWork, v + 0);}
                              VectorZ<t> PricesMACD;   for(int v = Sampler_ValidationDataSamples - 1; v >= 0; v--) { PricesMACD         << (t)iMACD(  _Symbol, Sampler_PeriodWork, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, v + 0);}
                              PricesTime = Sampler_DataNormilizer(PricesTime); PricesClose = Sampler_DataNormilizer(PricesClose);  PricesVolume = Sampler_DataNormilizer(PricesVolume); PricesOpen = Sampler_DataNormilizer(PricesOpen);
                              PricesMACD = Sampler_DataNormilizer(PricesMACD);
                              if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run) Print(" validation DataSet normalize input samples data 1");
                              for(int i = 0; i < Sampler_ValidationDataSamples; i++)
                              {         //------------------------------------------------------TimeSeries Perdiction-----------------------------------------------------
                                        if(Sampler_IsTimeInput)
                                        {         ValidationDataSetMatrix_Inp[i] << PricesTime[i]; //
                                        }
                                        //------------------------------------------------------TimeSeries Perdiction-----------------------------------------------------
                                        else
                                        {         //Pure
                                                  ValidationDataSetMatrix_Inp[i] << PricesTime[i]; //
                                                  ValidationDataSetMatrix_Inp[i] << PricesClose[i]; //
                                                  ValidationDataSetMatrix_Inp[i] << PricesVolume[i]; //
                                                  //ValidationDataSetMatrix_Inp[i] << PricesOpen[i]; //
                                                  //Technical
                                                  ValidationDataSetMatrix_Inp[i] << PricesMACD[i]; //
                                        }//
                              } //
                              //******************************************** Target Define ******************************************
                              if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print(" validation DataSet Target samples data 0");
                              for(int s = 0; s < Sampler_ValidationDataSamples; s++)
                              {         //Fiting Susccessfuly
                                        if(Sampler_IsTimeInput) {ValidationDataSetMatrix_Target[s]    << (t)(iClose(   _Symbol, Sampler_PeriodWork, s));} //
                                        //TimeSeries Perdiction
                                        else {ValidationDataSetMatrix_Target[s]     << (t)(iClose(     _Symbol, Sampler_PeriodWork, s));} //
                                        ValidationDataSetMatrix_TargetTime[s]       << (t)(iTime(       _Symbol, Sampler_PeriodWork,  0) + PeriodSeconds(Sampler_PeriodWork)*s); //
                              }
                              Sampler_SampleShuffel(ValidationDataSetMatrix_Inp, ValidationDataSetMatrix_Target, ValidationDataSetMatrix_TargetTime);
                              ////******************************************** Result Define ******************************************
                              if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print(" validation DataSet Result samples data 2");
                              for(int s = 0; s < Sampler_ValidationDataSamples; s++)
                              {         ValidationDataSetMatrix_Res[s] << 0.0; //
                                        ValidationDataSetMatrix_ResTemp[s] << 0.0; //
                              }//
                    } //
                    else
                    {         for(int s = 0; s < Sampler_ValidationDataSamples; s++) //1*24*4
                              {         int sampleShift = s * Sampler_ValidationDataElementsPack;
                                        //******************************************** Inputs Define ******************************************
                                        VectorZ<t> PricesTime;   for(int v = Sampler_ValidationDataElementsPack; v >= 0; v--) { PricesTime    << (t)iTime(  _Symbol, Sampler_PeriodWork, sampleShift + v + 1 + Sampler_DataRangeStart);} ///240_+_7000
                                        VectorZ<t> PricesClose;  for(int v = Sampler_ValidationDataElementsPack; v >= 0; v--) { PricesClose   << (t)iClose(  _Symbol, Sampler_PeriodWork, sampleShift + v + 1  + Sampler_DataRangeStart);}
                                        VectorZ<t> PricesVolume; for(int v = Sampler_ValidationDataElementsPack; v >= 0; v--) { PricesVolume  << (t)iVolume(  _Symbol, Sampler_PeriodWork, sampleShift + v + 1  + Sampler_DataRangeStart);}
                                        VectorZ<t> PricesOpen;   for(int v = Sampler_ValidationDataElementsPack; v >= 0; v--) { PricesOpen    << (t)iOpen(  _Symbol, Sampler_PeriodWork, sampleShift + v + 1  + Sampler_DataRangeStart);}
                                        VectorZ<t> PricesMACD;   for(int v = Sampler_ValidationDataElementsPack; v >= 0; v--) { PricesMACD    << (t)iMACD(  _Symbol, Sampler_PeriodWork, 12, 26, 9, PRICE_CLOSE, MODE_MAIN, sampleShift + v + 1  + Sampler_DataRangeStart);}
                                        //******************************************** Inputs Define Normalizing******************************************
                                        PricesTime          = Sampler_DataNormilizer(PricesTime);
                                        PricesClose         = Sampler_DataNormilizer(PricesClose);
                                        PricesVolume        = Sampler_DataNormilizer(PricesVolume);
                                        PricesOpen          = Sampler_DataNormilizer(PricesOpen);
                                        PricesMACD          = Sampler_DataNormilizer(PricesMACD);
                                        //******************************************** Inputs Define Normalized******************************************
                                        for(int v = 0; v < Sampler_ValidationDataElementsPack; v++)
                                        {         //------------------------------------------------------TimeSeries Perdiction-----------------------------------------------------
                                                  //Pure
                                                  ValidationDataSetMatrix_Inp[s] << PricesTime[v] ; //
                                                  ValidationDataSetMatrix_Inp[s] << PricesClose[v]; //
                                                  ValidationDataSetMatrix_Inp[s] << PricesVolume[v]; //
                                                  //TrainingDataSetMatrix_Inp[s] << PricesOpen[v]; //
                                                  //Technical
                                                  ValidationDataSetMatrix_Inp[s] << PricesMACD[v]; //
                                        } //
                                        //******************************************** Target Define ******************************************
                                        for(int v = 0; v < Sampler_ValidationDataElementsPack; v++)
                                        {         //Fiting Susccessfuly
                                                  if(Sampler_IsTimeInput) {ValidationDataSetMatrix_Target[s]    << (t)(iClose(   _Symbol, Sampler_PeriodWork, sampleShift + v + 0  + 0 ));} //Sampler_DataRangeStart
                                                  //TimeSeries Perdiction
                                                  else {ValidationDataSetMatrix_Target[s]     << (t)(iClose(     _Symbol, Sampler_PeriodWork, sampleShift + v + 0  + 0 ));} //
                                                  ValidationDataSetMatrix_TargetTime[s]       << (t)iTime(       _Symbol, Sampler_PeriodWork,  sampleShift + v + 0  + 0 ); //
                                        }
                                        ////******************************************** Sampler_SampleShuffel Define ******************************************
                                        Sampler_SampleShuffel(TrainingDataSetMatrix_Inp, TrainingDataSetMatrix_Target, TrainingDataSetMatrix_TargetTime);
                                        ////******************************************** Result Define ******************************************
                                        for(int v = 0; v < Sampler_ValidationDataElementsPack; v++)
                                        {         ValidationDataSetMatrix_Res[s] << 0.0; //
                                        }//
                              } //
                    }
                    if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print(" validation Sim_GradiantDecent_Momentom");
                    myNet.Simer( ValidationDataSetMatrix_Inp, ValidationDataSetMatrix_Res, "[Validation]");   //
                    //********************************************************* Start Validation Show *********************************************************ValidationDataSetMatrix_Inp[i].At(5 + scaler)
                    if(Sampler_IsSampler)//mine time based
                    {         if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print(" validation Show");
                              for(int i = 0; i < Sampler_ValidationDataSamples; i++)//sample based
                              {         for(int j = 0; j < Sampler_ValidationDataElementResult; j += Sampler_ValidationDataElementInpSeries)
                                        {         //-----------------------------------------------------------
                                                  datetime time = (datetime)ValidationDataSetMatrix_TargetTime[i][j];
                                                  //time = iTime(         _Symbol, Sampler_PeriodWork,  j) + PeriodSeconds(Sampler_PeriodWork) * 100;
                                                  double price = ValidationDataSetMatrix_Res[i][j] - 0;
                                                  string nameResult =  "Fit Point.NN-Validation-ResultPerdiction" /*+ (string)gap*/ + ":" + (string)(i) + ":" + (string)(j) + "  " + string(ValidationDataSetMatrix_Res[i].Total());
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
                    else
                    {         if(__IsDEBUG__NNS_Neurons_Matrix_YX_Run)Print(" validation Show");
                              for(int i = 0; i < Sampler_ValidationDataSamples; i++)//sample based
                              {         for(int j = 0; j < Sampler_ValidationDataElementResult; j += Sampler_ValidationDataElementInpSeries)
                                        {         //-----------------------------------------------------------
                                                  datetime time = (datetime)ValidationDataSetMatrix_TargetTime[i][j];
                                                  //time = iTime(         _Symbol, Sampler_PeriodWork,  j) + PeriodSeconds(Sampler_PeriodWork) * 100;
                                                  double price = ValidationDataSetMatrix_Res[i][j] - 0;
                                                  string nameResult =  "Fit Point.NN-Validation-ResultPerdiction" /*+ (string)gap*/ + ":" + (string)(i) + ":" + (string)(j) + "  " + string(ValidationDataSetMatrix_Res[i].Total());
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
          Print("[Validation]show Data...END...!");
          //********************************************************* Validation Show *********************************************************
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
 
//+------------------------------------------------------------------+if(MathRand() % 2 == 0)
//|  generate training data and feed into input arrays               |MathRand() % inp_index_T1  ///over training
//+------------------------------------------------------------------+
template<typename t>
void NN_Neurons_Matrix_YX_Sampler_Run::fillInputsTraining(VectorZObj<VectorZ<t>> &inp, VectorZObj<VectorZ<t>> &tar)
{         //---
          return; //
}
//+------------------------------------------------------------------++ PeriodSeconds(Sampler_PeriodWork) * 100
//|  generate Validating data and feed into input arrays             |+ PeriodSeconds(Sampler_PeriodWork) * 300)
//+------------------------------------------------------------------++ PeriodSeconds(Sampler_PeriodWork) * 10
template<typename t>
void NN_Neurons_Matrix_YX_Sampler_Run::fillInputsValidation(VectorZObj<VectorZ<t>> &inp, VectorZObj<VectorZ<t>> &tar)
{         //---
          return; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |_LastError, ErrorDescription(_LastError)
//+------------------------------------------------------------------+
template<typename t>
bool NN_Neurons_Matrix_YX_Sampler_Run:: Load(bool IsKey)
{         if(IsKey)
          {         int handle = -1;
                    handle = FileOpen("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_YX_Sampler_Run[].bin", FILE_READ | FILE_BIN);
                    //Cheack file not existed
                    if(INVALID_HANDLE == handle)
                    {         Print("****************************____NN_Neurons_Matrix____ Load: Cant Open NetWork File INVALID_HANDLE *************************");
                              //new file
                              handle = FileOpen("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_YX_Sampler_Run[].bin", FILE_WRITE | FILE_READ | FILE_BIN); //
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
                    {
                              {         //Cheack file Load
                                        if(!myNet.Load(handle, 0))
                                        {         Print("****************************____NN_Neurons_Matrix____ Cant Load NN NET diffrent topology ___NOT__READ__SUCCESSFULLY___DELETE FILE___*************************");
                                                  FileClose(handle);   FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_YX_Sampler_Run[].bin");   //
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
template<typename t>
bool NN_Neurons_Matrix_YX_Sampler_Run:: Save(bool IsKey)
{         if(IsKey)
          {         ResetLastError(); int handle = FileOpen("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_YX_Sampler_Run[].bin", FILE_WRITE | FILE_BIN);
                    FileFlush(handle);//
                    if(INVALID_HANDLE != handle) {/*FileFlush(handle);*/}
                    else
                    {         Print("**************************** Cant Save invaliade file *************************", _LastError, ErrorDescription(_LastError));
                              FileClose(handle);   return false; // //
                    } //
                    {         //
                              if(!myNet.Save(handle, 0)) /*Worked successfuly*/
                              {         Print("**************************** ___NN_Neurons_Matrix___Cant Save NetWork " + (string)0 + "*************************");
                                        //FileFlush(handle);
                                        FileClose(handle); //FileDelete("QuArtsRoot\\NN\\" + "NN_Neurons_Matrix_YX_Sampler_Run[].bin");
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
//Print(j, " j5:", j % 5);
//Print(j, " j6:", j % 6); //
//Print(j, "  ", j == (Sampler_DataElementInp % 1));
//Print(j, "  ", j == (Sampler_DataElementInp % 2));
//Print(j, "  ", j == (Sampler_DataElementInp % 3));
//Print(j, "  ", j == (Sampler_DataElementInp % 4));
//Print(j, "  ", j == (Sampler_DataElementInp % 5));
//Print(j, "  ", j == (Sampler_DataElementInp % 6));
//Print(j, "  ", j == (Sampler_DataElementInp % 7));   //

//if(j == 0)===if(j % Sampler_DataElementInp == 0)
//if(j == 1)===if(j % Sampler_DataElementInp == 1)
//if(j == 2)===if(j % Sampler_DataElementInp == 2)
//if(j == 3)===if(j % Sampler_DataElementInp == 3)
//if(j == 4)===if(j % Sampler_DataElementInp == 4)
//if(j == 5)===if(j % Sampler_DataElementInp == 5)
// not same as 123456--123456---need tyo set  if(j == 0)
// if(j % Sampler_DataElementInp == 0) Print(j);
//if(j % Sampler_DataElementInp == 1) Print(j);
//if(j % Sampler_DataElementInp == 2) Print(j);
//if(j % Sampler_DataElementInp == 3) Print(j);
//if(j % Sampler_DataElementInp == 4) Print(j);
//if(j % Sampler_DataElementInp == 5) Print(j);
//if(j % Sampler_DataElementInp == 6) Print(j);
//Print("--------");
//+------------------------------------------------------------------+if(MathRand() % 2 == 0)
//+------------------------------------------------------------------+
//if(i == 0) inp_index_StartTo0A = (inp_index_T1 * i) + inp_index_T1 + (i * DataSamplePartsGap);
//if(i == 1) inp_index_StartTo0A = (inp_index_T1 * 0) + inp_index_T1 + (0 * DataSamplePartsGap) + (i * ValidationRangeStartLR);
//if(i == 2) inp_index_StartTo0A = (inp_index_T1 * 0) + inp_index_T1 + (i * ValidationRangeStartLR);
//if(i == 0)inp_index_StartTo0A = (inp_index_T1 * i) + inp_index_T1 + (i * 10); //inp_index_T1 + 0; //
//if(i == 1)inp_index_StartTo0A = (inp_index_T1 * i) + inp_index_T1 + 10;
//if(i == 2)inp_index_StartTo0A = (inp_index_T1 * i) + inp_index_T1 + 20;
/*
 if(0)
                    {         for(int p = 0; p < Sampler_ValidationDataElementResult; p++)
                              {         //
                                        myNet.Sim_GradiantDecent_Momentom(GetPointer(ValidationDataSetMatrix_Inp), GetPointer(ValidationDataSetMatrix_Res));//
                                        ValidationDataSetMatrix_ResFinal[0] << ValidationDataSetMatrix_Res[0][0]; //
                                        ValidationDataSetMatrix_ResFinalTime[0] << ((double)(iTime( _Symbol, Sampler_PeriodWork,  0) + PeriodSeconds(Sampler_PeriodWork) * p));//
                                        //
                                        myNet.setData(GetPointer(ValidationDataSetMatrix_Res), GetPointer(ValidationDataSetMatrix_Target), GetPointer(ValidationDataSetMatrix_Res));
                                        myNet.Train_GradiantDecent_Momentom();
                                        //
                                        for(int s = 0; s < Sampler_ValidationDataSamples; s++)
                                        {         ValidationDataSetMatrix_InpTime[s].clear();
                                                  ValidationDataSetMatrix_Inp[s].clear();
                                                  ValidationDataSetMatrix_Target[s].clear();
                                                  ValidationDataSetMatrix_ResTime[s].clear();
                                                  int gapsamples = s * Sampler_DataElementInp ;
                                                  for(int i = 0; i < Sampler_ValidationDataElementInp; i++)
                                                  {         ValidationDataSetMatrix_InpTime[s] << ((double)(iTime(         _Symbol, Sampler_PeriodWork,  i) + PeriodSeconds(Sampler_PeriodWork) * 100));
                                                            //Fiting Susccessfuly
                                                            double DataDiffMin =
                                                                      (((double)(iTime(         _Symbol, Sampler_PeriodWork,  i) + PeriodSeconds(Sampler_PeriodWork) * 100)) -
                                                                       ((double)(iTime(         _Symbol, Sampler_PeriodWork,  Sampler_ValidationDataSamples) + PeriodSeconds(Sampler_PeriodWork) * 100)));
                                                            double Diff = (((double)(iTime(         _Symbol, Sampler_PeriodWork,  0) + PeriodSeconds(Sampler_PeriodWork) * 100)) -
                                                                           ((double)(iTime(         _Symbol, Sampler_PeriodWork,  Sampler_ValidationDataSamples) + PeriodSeconds(Sampler_PeriodWork) * 100)));
                                                            //TimeSeries Perdiction
                                                            VectorZ<double> Prices;
                                                            for(int v = 0; v < Sampler_ValidationDataElementInp; v++) { Prices << ValidationDataSetMatrix_Res[0][v]; }
                                                            //
                                                            DataDiffMin = (Prices[i] ) - (Prices.GetMin());
                                                            Diff = Prices.GetMax() - Prices.GetMin();
                                                            if(Diff == 0)return; //
                                                            double NormilazeData = DataDiffMin / Diff;
                                                            ValidationDataSetMatrix_Inp[s] << NormilazeData; //
                                                  }//
                                                  for(int o = 0; o < Sampler_ValidationDataElementOut; o++)
                                                  {         double target = ((double)iClose(        _Symbol, Sampler_PeriodWork,  o));
                                                            ValidationDataSetMatrix_Target[s] << target; //
                                                  } //
                                                  ValidationDataSetMatrix_Res[s].clear();
                                                  for(int r = 0; r < Sampler_ValidationDataElementResult; r++)
                                                  {         ValidationDataSetMatrix_Res[s] << 0.0; //
                                                            ValidationDataSetMatrix_ResTime[s] << ((double)(iTime( _Symbol, Sampler_PeriodWork,  r) + PeriodSeconds(Sampler_PeriodWork) * 100));//
                                                  } //
                                        } //
                              }//
                    }
*/
//+------------------------------------------------------------------+
