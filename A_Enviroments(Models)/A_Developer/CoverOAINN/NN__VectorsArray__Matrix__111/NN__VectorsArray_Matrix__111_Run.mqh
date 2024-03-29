//+------------------------------------------------------------------+
//|                        NN__Matrix__Run111.mqh                    |
//+------------------------------------------------------------------+
//||   ||||||||||               A_TIMER.mqh                         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    |||
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Arrays\ArrayObj(MQL4).mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Arrays\ArrayInt(MQL4).mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Arrays\ArrayDouble(MQL4).mqh>


#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)\Include\Math\Stat\Math.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionXObj\VectorXObj.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\VectorX.mqh>
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\MatrixArray.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\MatrixVector.mqh>

template<typename T>
class Tensor
{
public:
          Tensor(void) {};
          Tensor(int r) {};
          ~Tensor(void) {};
          T Value;
          void resize(int a) {};
          void setConstant(double) {};
          //

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum ProjectType {Approximation, Classification, Forecasting, ImageClassification, TextClassification, TextGeneration, AutoAssociation };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class NeuralNetwork
{
public:
          NeuralNetwork(void) {};
          NeuralNetwork(ProjectType pt, CMatirx_Vector<double> &topologyMatrix) {};
          ~NeuralNetwork(void) {};

          //

};
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
class NN__VectorsArray_Matrix__Run111;
class TrainingStrategy;
class TrainingResults;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class LossIndex
{
public:
          LossIndex(void) {};
          LossIndex(NeuralNetwork* fNeuralNetwork, CMatirx_Vector<double>* fdata /* DataSet* */) {set(fNeuralNetwork, fdata);};
          ~LossIndex(void) {};
          //-------------------------------------------------------------------
          void                          set(NeuralNetwork* new_neural_network_pointer, CMatirx_Vector<double>* new_data_set_pointer ) { neural_network_pointer = new_neural_network_pointer; data_set_pointer = new_data_set_pointer;}
          NeuralNetwork*                neural_network_pointer;
          void                          set_neural_network_pointer(NeuralNetwork* fNeuralNetwork) {neural_network_pointer = fNeuralNetwork;};
          NeuralNetwork*                get_neural_network_pointer() const {if(!neural_network_pointer) return NULL; return neural_network_pointer;}
          /// Pointer to a data set object.
          CMatirx_Vector<double>*       data_set_pointer;
          void                          set_data_set_pointer(CMatirx_Vector<double>* fdataset) {data_set_pointer = fdataset;};
          CMatirx_Vector<double>*       get_data_set_pointer() const {if(!data_set_pointer) return NULL; return data_set_pointer;}

          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum LearningRateMethod {GoldenSection, BrentMethod };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class LearningRateAlgorithm
{
public:
          LearningRateAlgorithm(void) {};
          LearningRateAlgorithm(LossIndex*);
          ~LearningRateAlgorithm(void) {};
          //
          const LearningRateMethod get_learning_rate_method() const;
          void set_learning_rate_method(const LearningRateMethod&);
          void set_learning_rate_method(const string&);
          //
          LossIndex* loss_index_pointer;
          void set_loss_index_pointer(LossIndex* new_loss_index_pointer) { loss_index_pointer = new_loss_index_pointer; }

          LossIndex* get_loss_index_pointer() const { if(!loss_index_pointer) return NULL; return loss_index_pointer; };
          bool has_loss_index() const { if(loss_index_pointer) { return true; } else { return false; } };
//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class errorSumSquaredError: public LossIndex
{
public:
          errorSumSquaredError(void) {};
          ~errorSumSquaredError(void) {};
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class errorMeanSquaredError: public LossIndex
{
public:
          errorMeanSquaredError(void) {};
          ~errorMeanSquaredError(void) {};
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class errorNormalizedSquaredError: public LossIndex
{
public:
          errorNormalizedSquaredError(void) {};
          ~errorNormalizedSquaredError(void) {};
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class errorMinkowskiError: public LossIndex
{
public:
          errorMinkowskiError(void) {};
          ~errorMinkowskiError(void) {};
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class errorCrossEntropyError: public LossIndex
{
public:
          errorCrossEntropyError(void) {};
          ~errorCrossEntropyError(void) {};
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class errorWeightedSquaredError: public LossIndex
{
public:
          errorWeightedSquaredError(void) {};
          ~errorWeightedSquaredError(void) {};
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class TrainingResults
{
public:
          TrainingResults(void) {};
          TrainingResults(const TrainingResults&) {};
          TrainingResults(const int epochs_number)
          {         training_error_history = new Tensor<double>(1);
                    selection_error_history = new Tensor<double>(1);
                    training_error_history.resize(1 + epochs_number);
                    training_error_history.setConstant(double(-1.0));
                    selection_error_history.resize(1 + epochs_number);
                    selection_error_history.setConstant(double(-1.0)); //
          }
          ~TrainingResults(void) {};
          Tensor<double> *training_error_history;
          Tensor<double> *selection_error_history;
          //

};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class OptimizationAlgorithm
{
public:
          OptimizationAlgorithm(void) {};
          OptimizationAlgorithm(LossIndex* new_loss_index_pointer): loss_index_pointer(new_loss_index_pointer) {};
          ~OptimizationAlgorithm(void) {};
          //
          uint maximum_epochs_number;
          /// Pointer to a loss index for a neural network object.

          LossIndex *loss_index_pointer;
          LossIndex* get_loss_index_pointer() const {if(!loss_index_pointer) return NULL; return loss_index_pointer;};
          //

          //
          bool display;
          void setdisplay(bool b) {display = b;}
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class trainingGRADIENT_DESCENT : public OptimizationAlgorithm
{
public:
          trainingGRADIENT_DESCENT(void) {};
          ~trainingGRADIENT_DESCENT(void) {};
          TrainingResults perform_training()
          {         TrainingResults results(maximum_epochs_number + 1);
                    {         //
                    }//
                    return results;
                    //
          }; //
          /// Learning rate algorithm object for one-dimensional minimization.

          LearningRateAlgorithm learning_rate_algorithm;
          const float first_learning_rate;// = static_cast<type>(0.01);
          void set_loss_index_pointer(LossIndex* new_loss_index_pointer) { loss_index_pointer = new_loss_index_pointer; learning_rate_algorithm.set_loss_index_pointer(new_loss_index_pointer); }

          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class trainingCONJUGATE_GRADIENT : public OptimizationAlgorithm
{
public:
          trainingCONJUGATE_GRADIENT(void) {};
          ~trainingCONJUGATE_GRADIENT(void) {};
          TrainingResults perform_training()
          {         TrainingResults results(maximum_epochs_number + 1);
                    {         //
                    }//
                    return results;
                    //
          }; //
          /// Learning rate algorithm object for one-dimensional minimization.

          LearningRateAlgorithm learning_rate_algorithm;
          void set_loss_index_pointer(LossIndex* new_loss_index_pointer) { loss_index_pointer = new_loss_index_pointer; learning_rate_algorithm.set_loss_index_pointer(new_loss_index_pointer); }

          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class trainingSTOCHASTIC_GRADIENT_DESCENT : public OptimizationAlgorithm
{
public:
          trainingSTOCHASTIC_GRADIENT_DESCENT(void) {};
          ~trainingSTOCHASTIC_GRADIENT_DESCENT(void) {};
          TrainingResults perform_training()
          {         TrainingResults results(maximum_epochs_number + 1);
                    {         //
                    }//
                    return results;
                    //
          }; //
          void set_loss_index_pointer(LossIndex* new_loss_index_pointer) { loss_index_pointer = new_loss_index_pointer; }
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class trainingADAPTIVE_MOMENT_ESTIMATION : public OptimizationAlgorithm
{
public:
          trainingADAPTIVE_MOMENT_ESTIMATION(void) {};
          ~trainingADAPTIVE_MOMENT_ESTIMATION(void) {};
          TrainingResults perform_training()
          {         TrainingResults results(maximum_epochs_number + 1);
                    {         //
                    }//
                    return results;
                    //
          }; //
          void set_loss_index_pointer(LossIndex* new_loss_index_pointer) { loss_index_pointer = new_loss_index_pointer; }
//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum InverseHessianApproximationMethod {DFP, BFGS };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class trainingQUASI_NEWTON_METHOD : public OptimizationAlgorithm
{
public:
          trainingQUASI_NEWTON_METHOD(void) {};
          ~trainingQUASI_NEWTON_METHOD(void) {};
          TrainingResults perform_training()
          {         TrainingResults results(maximum_epochs_number + 1);
                    {         //
                    }
                    return results;
                    //
          }; //
          /// Learning rate algorithm object.
          /// It calculates the step for a given training direction.
          LearningRateAlgorithm learning_rate_algorithm;
          /// Variable containing the actual method used to obtain a suitable learning rate.
          InverseHessianApproximationMethod inverse_hessian_approximation_method;

          void set_inverse_hessian_approximation_method(const InverseHessianApproximationMethod& new_inverse_hessian_approximation_method) { inverse_hessian_approximation_method = new_inverse_hessian_approximation_method; }
          float first_learning_rate;// = static_cast<type>(0.01);
          void set_loss_index_pointer(LossIndex* new_loss_index_pointer) { loss_index_pointer = new_loss_index_pointer; learning_rate_algorithm.set_loss_index_pointer(new_loss_index_pointer); }
//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class trainingLEVENBERG_MARQUARDT_ALGORITHM : public OptimizationAlgorithm
{
public:
          trainingLEVENBERG_MARQUARDT_ALGORITHM(void) {};
          ~trainingLEVENBERG_MARQUARDT_ALGORITHM(void) {};
          TrainingResults perform_training()
          {         TrainingResults results(maximum_epochs_number + 1);
                    {         //
                              // Start training
                              if(display) Print("Training with Levenberg-Marquardt algorithm...\n");
                              // Data set
                              CMatirx_Vector<double>* data_set_pointer             = loss_index_pointer.get_data_set_pointer();
                              // Neural network
                              NeuralNetwork* neural_network_pointer                = loss_index_pointer.get_neural_network_pointer();
                              // Loss index
                              // Training strategy stuff
                              // Main loop
                              {         for(uint epoch = 0; epoch <= maximum_epochs_number; epoch++)
                                        {         // Neural network
                                                  // Loss index
                                                  // Elapsed time
                                        }//
                              } //
                    } //
                    return results;
                    //
          }; //
          void set_loss_index_pointer(LossIndex* new_loss_index_pointer) { loss_index_pointer = new_loss_index_pointer; }
//
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class trainingCONVOLUTIONAL : public OptimizationAlgorithm
{
public:
          trainingCONVOLUTIONAL(void) {};
          ~trainingCONVOLUTIONAL(void) {};
          TrainingResults perform_training()
          {         TrainingResults results(maximum_epochs_number + 1);
                    {         //
                    }//
                    return results;
                    //
          }; //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum LossMethod
{         SUM_SQUARED_ERROR,
          MEAN_SQUARED_ERROR,
          NORMALIZED_SQUARED_ERROR,
          MINKOWSKI_ERROR,
          WEIGHTED_SQUARED_ERROR,
          CROSS_ENTROPY_ERROR };
enum OptimizationMethod
{         GRADIENT_DESCENT,
          CONJUGATE_GRADIENT,
          QUASI_NEWTON_METHOD,
          LEVENBERG_MARQUARDT_ALGORITHM,
          STOCHASTIC_GRADIENT_DESCENT,
          ADAPTIVE_MOMENT_ESTIMATION,
          CONVOLUTIONAL };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class TrainingStrategy
{
public:
          TrainingStrategy(void)
          {         set_loss_method(LossMethod::NORMALIZED_SQUARED_ERROR);
                    set_optimization_method(OptimizationMethod::QUASI_NEWTON_METHOD);
                    LossIndex* loss_index_pointer = get_loss_index_pointer();
                    set_loss_index_pointer(loss_index_pointer); //
          };
          TrainingStrategy(NeuralNetwork *new_neural_network_pointer, CMatirx_Vector<double> *new_data_set_pointer):
                    neural_network_pointer(new_neural_network_pointer),
                    data_set_pointer(new_data_set_pointer)
          {         set_loss_method(LossMethod::NORMALIZED_SQUARED_ERROR);
                    set_optimization_method(OptimizationMethod::QUASI_NEWTON_METHOD);
                    //
                    set_loss_index_neural_network_pointer(neural_network_pointer);
                    set_loss_index_data_set_pointer(data_set_pointer);//
          };
          ~TrainingStrategy(void) {};

          void set_loss_method(LossMethod lm)                 { loss_method         = lm; set_loss_index_pointer(get_loss_index_pointer()); }
          void set_optimization_method(OptimizationMethod om) { optimization_method = om; }

          TrainingResults  perform_training()
          {         switch(optimization_method)
                    {         case OptimizationMethod::GRADIENT_DESCENT:                  {         return gradient_descent.perform_training();                   }
                              case OptimizationMethod::CONJUGATE_GRADIENT:                {         return conjugate_gradient.perform_training();                 }
                              case OptimizationMethod::STOCHASTIC_GRADIENT_DESCENT:       {         return stochastic_gradient_descent.perform_training();        }
                              case OptimizationMethod::ADAPTIVE_MOMENT_ESTIMATION:        {         return adaptive_moment_estimation.perform_training();         }
                              case OptimizationMethod::QUASI_NEWTON_METHOD:               {         return quasi_Newton_method.perform_training();                }
                              case OptimizationMethod::LEVENBERG_MARQUARDT_ALGORITHM:     {         return Levenberg_Marquardt_algorithm.perform_training();      }
                              case OptimizationMethod::CONVOLUTIONAL:                     {         return convolutional.perform_training();         }
                              default:                                                              return TrainingResults(0); //
                    }//
          }
          //
          NeuralNetwork*                 neural_network_pointer;
          CMatirx_Vector<double>*        data_set_pointer;
          //---------------------------------------------------------------------------------------------------------------------------------------------------------
          /// Enumeration of the available error terms in OpenNN.
          LossMethod loss_method;
          LossIndex* TrainingStrategy::get_loss_index_pointer()
          {         switch(loss_method)
                    {         case LossMethod::SUM_SQUARED_ERROR:               return &sum_squared_error;
                              case LossMethod::MEAN_SQUARED_ERROR:              return &mean_squared_error;
                              case LossMethod::NORMALIZED_SQUARED_ERROR:        return &normalized_squared_error;
                              case LossMethod::MINKOWSKI_ERROR:                 return &Minkowski_error;
                              case LossMethod::WEIGHTED_SQUARED_ERROR:          return &weighted_squared_error;
                              case LossMethod::CROSS_ENTROPY_ERROR:             return &cross_entropy_error;
                              default: return NULL; } //
          }
          errorSumSquaredError          sum_squared_error;
          errorMeanSquaredError         mean_squared_error;
          errorNormalizedSquaredError   normalized_squared_error;
          errorMinkowskiError           Minkowski_error;
          errorCrossEntropyError        cross_entropy_error;
          errorWeightedSquaredError     weighted_squared_error;

          void set_loss_index_pointer(LossIndex* new_loss_index_pointer)
          {         gradient_descent.set_loss_index_pointer(new_loss_index_pointer);
                    conjugate_gradient.set_loss_index_pointer(new_loss_index_pointer);
                    stochastic_gradient_descent.set_loss_index_pointer(new_loss_index_pointer);
                    adaptive_moment_estimation.set_loss_index_pointer(new_loss_index_pointer);
                    quasi_Newton_method.set_loss_index_pointer(new_loss_index_pointer);
                    Levenberg_Marquardt_algorithm.set_loss_index_pointer(new_loss_index_pointer); //
          };
          void set_loss_index_data_set_pointer(CMatirx_Vector<double>* new_data_set_pointer)
          {         sum_squared_error.set_data_set_pointer(new_data_set_pointer);
                    mean_squared_error.set_data_set_pointer(new_data_set_pointer);
                    normalized_squared_error.set_data_set_pointer(new_data_set_pointer);
                    cross_entropy_error.set_data_set_pointer(new_data_set_pointer);
                    weighted_squared_error.set_data_set_pointer(new_data_set_pointer);
                    Minkowski_error.set_data_set_pointer(new_data_set_pointer); //
          };
          void set_loss_index_neural_network_pointer(NeuralNetwork* new_neural_network_pointer)
          {         sum_squared_error.set_neural_network_pointer(new_neural_network_pointer);
                    mean_squared_error.set_neural_network_pointer(new_neural_network_pointer);
                    normalized_squared_error.set_neural_network_pointer(new_neural_network_pointer);
                    cross_entropy_error.set_neural_network_pointer(new_neural_network_pointer);
                    weighted_squared_error.set_neural_network_pointer(new_neural_network_pointer);
                    Minkowski_error.set_neural_network_pointer(new_neural_network_pointer); //
          };


          /// Enumeration of all the available types of optimization algorithms.
          OptimizationMethod optimization_method;
          OptimizationAlgorithm* get_optimization_algorithm_pointer()
          {         switch(optimization_method)
                    {         case OptimizationMethod::GRADIENT_DESCENT:                return &gradient_descent;
                              case OptimizationMethod::CONJUGATE_GRADIENT:              return &conjugate_gradient;
                              case OptimizationMethod::STOCHASTIC_GRADIENT_DESCENT:     return &stochastic_gradient_descent;
                              case OptimizationMethod::ADAPTIVE_MOMENT_ESTIMATION:      return &adaptive_moment_estimation;
                              case OptimizationMethod::QUASI_NEWTON_METHOD:             return &quasi_Newton_method;
                              case OptimizationMethod::LEVENBERG_MARQUARDT_ALGORITHM:   return &Levenberg_Marquardt_algorithm;
                              default: return NULL; //
                    } //
          }

          //Optimization algorithm
          trainingGRADIENT_DESCENT              gradient_descent;
          trainingCONJUGATE_GRADIENT            conjugate_gradient;
          trainingQUASI_NEWTON_METHOD           quasi_Newton_method;
          trainingLEVENBERG_MARQUARDT_ALGORITHM Levenberg_Marquardt_algorithm;
          trainingSTOCHASTIC_GRADIENT_DESCENT   stochastic_gradient_descent;
          trainingADAPTIVE_MOMENT_ESTIMATION    adaptive_moment_estimation;
          trainingCONVOLUTIONAL                 convolutional;
          //





          //

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class NN__VectorsArray_Matrix__Run111
{
public:
          NN__VectorsArray_Matrix__Run111(void) {};
          ~NN__VectorsArray_Matrix__Run111(void) {};
          void __MainRun__();
          //------------------------------------

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void NN__VectorsArray_Matrix__Run111::__MainRun__()
{         // Define Topology Matrix
          CMatirx_Vector<double> topologyMatrix(3, 1); topologyMatrix.setAt(1, 1, 10); topologyMatrix.setAt(2, 1, 2); topologyMatrix.setAt(2, 1, 1);
          // Define Neural_Network
          NeuralNetwork *neural_network = new NeuralNetwork( ProjectType::Approximation, topologyMatrix );
          // Define Data Set
          uint totalSample = 100;
          CMatirx_Vector<double> *data_setMatrix = new CMatirx_Vector<double>(totalSample, 2);
          for(uint i = 0; i < totalSample; i++) { topologyMatrix.setAt(i, 1, 2023); topologyMatrix.setAt(i, 2, 1958); }
          // Define TrainingStrategy
          TrainingStrategy training_strategy(neural_network, data_setMatrix);
          training_strategy.set_loss_method(LossMethod::MEAN_SQUARED_ERROR);
          training_strategy.set_optimization_method(OptimizationMethod::LEVENBERG_MARQUARDT_ALGORITHM);
          training_strategy.perform_training();
          // Define TrainingRestlt
          //
}
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
