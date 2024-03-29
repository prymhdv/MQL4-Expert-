//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\VectorZ.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionXObj\VectorZObj.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\MatrixArray.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(DataType)\CollectionX\Matrix2.mqh>
#include<.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL4)ALGLIB\mql4\Include\Math\Alglib\.Main.mqh>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
typedef double (*MyFunctionCMatirx_Vector)(double);
#define  IsDebug_MATRIX_Print 0
//-----------------------------------
template<typename t>
class CMatirx_Vector: public CMatirx_Array_Base<t>
{
public:
          uint       _rows; uint _cols; uint curr_idx;
          //CVector<double> _vals1;
          VectorZ<t>    _vals;
          t             Data[];
          //--------------------------------------------------------------------------------------------
          CMatirx_Vector(uint rows, uint cols):  _rows(rows), _cols(cols) //, _vals({ })
          {         _vals.resizer(rows * cols, 0.0); };
          CMatirx_Vector( uint rows, uint cols, t val):  _rows(rows), _cols(cols) //, _vals({ })
          {         _vals.resizer(rows * cols, val); };
          CMatirx_Vector(): _rows(0), _cols(0) //, _vals({ })
          {         _vals.resizer(_rows * _cols, 0.0); };
          ~CMatirx_Vector(void) {};
          CMatirx_Vector(const CMatirx_Vector& that)
          {         this = that;}
          CMatirx_Vector(string s, uint rows, uint cols):  _rows(rows), _cols(cols)
          {         //MatrLoadIdentity(identity, target._rows, target._cols);
                    //void MatrLoadIdentity(double & matr[], int numRows, int numCols)
                    // if matrix is not square - don't modify it
                    if (_rows != _cols) {Print("Not Identifed Size"); return; }
                    _vals.resizer(rows * cols, 0.0);
                    // reinitialize all elements of matrix
                    for (uint row = 0; row < _rows; row++)
                    {         for (uint col = 0; col < _cols; col++)
                              {         // default element value is zero
                                        t elemValue = 0.0;
                                        // if element is on main diagonal - the value is one
                                        if (MatrIsElemOnMainDiagonal(row, col)) { elemValue = 1.0; }
                                        if(IsDebug_MATRIX_Print)Print("MatrIndiciesToOffset(row, col, _rows, _cols):     ", MatrIndiciesToOffset(row, col, _rows, _cols));
                                        //matr[MatrIndiciesToOffset(row, col, _rows, _cols)] = elemValue; //
                                        _vals.set(MatrIndiciesToOffset(row, col, _rows, _cols), elemValue); //
                                        //_vals << elemValue; //
                              } //
                    }
                    return;//
          }
          CMatirx_Vector(string s, uint rows, uint cols, double NewMin, double NewMax):  _rows(rows), _cols(cols)
          {         //MatrLoadIdentity(identity, target._rows, target._cols);
                    //void MatrLoadIdentity(double & matr[], int numRows, int numCols)
                    // if matrix is not square - don't modify it
                    if(s == "Rand")
                    {         _vals.resizer(rows * cols, 0.0);
                              for (uint row = 0; row < rows; row++)
                              {         for (uint col = 0; col < cols; col++)
                                        {         t val = InRange_(0, RAND_MAX, NewMin, NewMax, MathRand()); //
                                                  setAt(row, col, val); //
                                        }//
                              }//
                              return;//
                    }//
          }
          CMatirx_Vector zeros(uint rows, uint cols)
          {         CMatirx_Vector<t> output(rows, cols);
                    if(IsDebug_MATRIX_Print)Print("zeros");
                    return output;//
          }
          CMatirx_Vector eye(uint Dim)
          {         CMatirx_Vector<t> output("I", Dim, Dim);
                    if(IsDebug_MATRIX_Print)Print("eye");
                    return output;//
          }
          CMatirx_Vector Rand(uint rows, uint cols, double NewMin, double NewMax)
          {         CMatirx_Vector<t> output("Rand", rows, cols, NewMin, NewMax);
                    if(IsDebug_MATRIX_Print)Print("Rand");
                    return output; //
          }
          //--------------------------------------------------------------------------------------------
          void       ConvertVectorToArray()
          {         ArrayFree(Data); ArrayResize(Data, _vals.Total());
                    for(int i = 0; i < _vals.Total(); i++) { Data[i] = (t)_vals[i]; } //
          }
          CMatirx_Vector ConvertArrayToVectorM(t & resultTemp[])
          {         CMatirx_Vector<t> output(_rows, _cols); output._vals.clear();
                    for(int i = 0; i < ArraySize(resultTemp); i++) { output._vals << resultTemp[i];  }
                    ArrayFree(Data); ArrayFree(resultTemp);
                    return output; //
          }
          void Printer(string s, uint time, bool IsDim)
          {         if(IsDim) {Print(s + " (", _rows, ",", _cols, ")");  Sleep(time); return; }
                    for(uint y = 0; y < _rows; y++)
                    {         string soz = "";
                              for(uint x = 0; x < _cols; x++)
                              {         //this
                                        soz += "((" + (string)y + "," + (string)x + ": " + DoubleToStr(getAt(y, x), 16) + ")__"; //
                                        ////
                              }//
                              Print(s + " (", _rows, ",", _cols, ")", soz); //
                              //Sleep(time);//
                    } //
                    return ;//
          }
          //--------------------------------------------------------------------------------------------
          void       Insert( t val) {    _vals << val; }
          void       insert( t val) {    _vals << val; }
          void       add( t val)    {    _vals << val; }
          void       Add( t val)    {    _vals << val; }
          //
          //void Insert( CMatirx_Vector<t> val) {    setAt(curr_col_idx, 0, val); curr_col_idx++;   }
          //void insert( CMatirx_Vector<t> val) {    setAt(curr_col_idx, 0, val); curr_col_idx++;   }
          //void add( CMatirx_Vector<t> val) {       setAt(curr_col_idx, 0, val); curr_col_idx++;   }
          //void Add( CMatirx_Vector<t> val) {       setAt(curr_col_idx, 0, val); curr_col_idx++;   }
          //--------------------------------------------------------------------------------------------
          CMatirx_Vector operator[] (uint idx)
          {         CMatirx_Vector<t> output(1, _cols);
                    for(uint col = 0; col < _cols; col++)
                    {         output.setAt(0, col, getAt(idx, col)); //
                    }//
                    return output;//the selected row return
                    //
          }
          CMatirx_Vector  operator/ (t val)
          {         CMatirx_Vector<t> output(1, _cols);
                    for(uint row = 0; row < _rows; row++)
                              for(uint col = 0; col < _cols; col++)
                              {         output.setAt(row, col, getAt(row * _rows + col, col) / val); //
                              }//
                    return output;//the selected row return
                    //
          }

          //--------------------------------------------------------------------------------------------
          //t      &at(uint row,uint col)const                {  return _vals[row * _cols + col];        } //cpp __VERTICAL :: col * _rows + row
          //t       operator[] (uint idx)                       {  return _vals[idx];                      }
          t          get(uint idx)                               {  return _vals[idx];                      }
          t          getAt(uint row, uint col)const              {  if(0) {Print("--getAt(--", _vals.Size());} return _vals[row * _cols + col];        } //cpp __HORIZONTAL :: row * _cols + col
          t          g(uint row, uint col)const                  {  return _vals[row * _cols + col];        }
          t          At(uint row, uint col)const                 {  return _vals[row * _cols + col];        }
          //t       At(uint idx)const                           {  return _vals[idx];                      } ambigus
          //-----------
          void       setAt(uint row, uint col, t val)       {  _vals.set(row * _cols + col, val); } //where C or R iz Zero +
          void       s(uint row, uint col, t val)           {  _vals.set(row * _cols + col, val); }
          void       set(int idx, t val)                    {  _vals.set(idx, val);               }
          //void    operator = (uint idx, t val)           {  _vals[idx]=val;                      }
          //t operator[][] (uint c) { return(getAt(c, c)); }
          uint       getColSize() { return _cols; }
          uint       getRowSize() { return _rows; } const
          //--------------------------------------------------------------------------------------------
          void       resize(uint frows, uint fcols, t val) { _rows = frows;  _cols = fcols; _vals.resizer(_rows * _cols, 0.0);}
          void       Clear() {_cols = 0; _rows = 0; _vals.Clear();}
          uint       SizeVector() const { return _vals.size();}
          uint       Size() const { return _rows * _cols;}
          uint       size() const { return _rows * _cols;}
          uint       Total()const { return _rows * _cols;}
          uint       total()const { return _rows * _cols;}
          //--------------------------------------------------------------------------------------------
          CMatirx_Vector invert1()
          {         ConvertVectorToArray();
                    t resultTemp[];
                    if(IsDebug_MATRIX_Print)Print("____rows__", _rows, "___cols__", _cols);
                    if(!MatrInvertUsingGJ(Data, _rows, _cols, resultTemp, DEFAULT_TOLERANCE)) { Print("invert1 __INVERT NOT Succsessfuly__"); return this;} //
                    return ConvertArrayToVectorM(resultTemp); //
          }
          CMatirx_Vector invert2()
          {         ConvertVectorToArray();
                    t resultTemp[];
                    if(!MatrInvertUsingMinors(Data, _rows, _cols, resultTemp, DEFAULT_TOLERANCE)) { Print("invert2 __INVERT NOT Succsessfuly__"); return this;} //
                    return ConvertArrayToVectorM(resultTemp); //
          }
          CMatirx_Vector invert3()
          {         ConvertVectorToArray();
                    t resultTemp[];
                    if(!MatrInvertUsingX(Data, _rows, _cols, resultTemp)) { Print("invert3 __INVERT NOT Succsessfuly__"); return this;} //
                    return ConvertArrayToVectorM(resultTemp); //
          }
          CMatirx_Vector invert4()
          {         ConvertVectorToArray();
                    t resultTemp[];
                    //if(!MatrInvertUsingX(Data, _rows, _cols, resultTemp)) { Print("invert3 __INVERT NOT Succsessfuly__"); return this;} //
                    //CMatInv::RMatrixInverse(CMatrixDouble &a,const int n,int &info,CMatInvReport &rep);
                    CMatrixDouble MatrixDouble(_rows, _cols, Data);
                    int info = 0;
                    int dim  = (int)_rows;
                    CMatInvReport MatInvReport;
                    CMatInv::RMatrixInverse(MatrixDouble, dim, info, MatInvReport);
                    if(info == -3) { Print("invert4 __INVERT NOT Succsessfuly__Singularity"); return this;} //
                    if(info == 1) { Print("invert4 __INVERT Succsessfuly__Solved");} //
                    MatrixDouble.getArray(resultTemp);
                    return ConvertArrayToVectorM(resultTemp); //
          }
          CMatirx_Vector diagflat(CMatirx_Vector & target, bool IsVertical)
          {         target.ConvertVectorToArray();//
                    t resultTemp[];
                    //Print("__target.Data[0]: ",target.Data[0]);
                    if(!DiagonalFlat(target.Data, resultTemp)) { Print("__Diagonal NOT Succsessfuly__");} //
                    //Print("__resultTemp[0]: ",resultTemp[0]);
                    CMatirx_Vector<t> output( 1, 1 ); // (uint)sqrt(ArraySize(resultTemp)  (uint)sqrt(ArraySize(resultTemp))
                    if(!IsVertical) {         output = CMatirx_Vector( target._cols, target._cols ); }  //target._cols>1
                    if(IsVertical) {         output = CMatirx_Vector( target._rows, target._rows ); } //target._rows>1
                    return output.ConvertArrayToVectorM(resultTemp); //
          }
          CMatirx_Vector Convert_VVtoMV(VectorZObj<VectorZ<t>> &c)
          {         if(c.total() == 0 || c[0].total() == 0 ) { Print("__c.total() == 0 || c[0].total() == 0__"); }
                    //Print("*------c.Total():", c.Total(), "   c[0].Total():", c[0].Total());
                    CMatirx_Vector<t> output(c.total(), c[0].total());
                    //Print("*------output._rows:", output._rows, "   output._cols:", output._cols);
                    for(uint row = 0; row < output._rows; row++)
                    {         for(uint col = 0; col < output._cols; col++)
                              {         //Print("*------row:", row, "   col:", col);
                                        output.setAt(row, col, c[row][col]); //
                              }//
                    } //
                    return output;//
          }
          CMatirx_Vector RandIn(double RangeMin, double RangeMax, double Percent)
          {         CMatirx_Vector<t> output(_rows, _cols);
                    for(uint row = 0; row < output._rows; row++)
                    {         for(uint col = 0; col < output._cols; col++)
                              {         t valRand = InRange2(MathRand() / 32767, RangeMin, RangeMax);//
                                        output.setAt(row, col, valRand * getAt(row, col) * (t)Percent  ); //
                              }//
                    } //
                    return output;//
          }
          t InRange2(double val, double Min, double Max) { return (t)(val * (Max - Min) + Min); }
          //--------------------------------------------------------------------------------------------
          //[ 1 2 ] [ 1 2 ]'
          CMatirx_Vector dot( CMatirx_Vector & Target)
          {         if(IsDebug_MATRIX_Print)Print("CMatirx_Vector dot");
                    return multiply(Target);//
          } //
          CMatirx_Vector dot( CMatirx_Vector & Base, CMatirx_Vector & Target)
          {         if(IsDebug_MATRIX_Print)Print("CMatirx_Vector dot");
                    return Base.multiply(Target);//
          } //
          CMatirx_Vector multiply( CMatirx_Vector & target)//&& (1 != target._cols * target._rows)
          {         if(1 == _cols * _rows) { return target * getAt(0, 0 ); }
                    if(1 == target._cols * target._rows) { return this * target.getAt(0, 0 ); }
                    if(_cols != target._rows)
                    {         Print("CMatirx_Vector multiply >>>>>>_cols != target._rows", "  this(", _rows, ",", _cols, ")   target(", target._rows, ",", target._cols, ")" ); return this; } //ExpertRemove();
                    CMatirx_Vector<t> output(_rows, target._cols);
                    for(uint row = 0; row < output._rows; row++)
                    {         for(uint col = 0; col < output._cols; col++)
                              {         t result = 0.0;
                                        //this
                                        for(uint k = 0; k < this._cols; k++)
                                        {         //Print("CMatirx_Vector   getAt(k, col ):", getAt(k, col )); //"
                                                  result += getAt(row, k ) * target.getAt(k, col); //
                                        }//
                                        output.setAt(row, col, result); //
                              }//
                    } //
                    return output;//
          } //
          CMatirx_Vector operator* (t s) { return(multiplyScaler(s)); }
          CMatirx_Vector multiplyScaler(t s)
          {         //CMatirx_Vector<t> output(_cols, _rows);
                    CMatirx_Vector<t> output(_rows, _cols);
                    if(output.size() != Size()) { Print("output.size() != Size()", "       output.size():", output.size(), "       Size():", Size()); }
                    if(IsDebug_MATRIX_Print)Print("       output.size():", output.size(), "       Size():", Size() );
                    for(uint y = 0; y < output._rows; y++)
                    {         for(uint x = 0; x < output._cols; x++)
                              {         if(IsDebug_MATRIX_Print)Print("----------       output.size():", output.size(), "       Size():", Size(), "  ", getAt(0, 0)); //
                                        output.setAt(y, x, getAt(y, x) * s); //
                                        if(IsDebug_MATRIX_Print)Print("       output.size():", output.size(), "       Size():", Size());//
                              }//
                    } //
                    return output;//
          } //
          CMatirx_Vector operator* (CMatirx_Vector & target) { return(MultiplyElement(target)); }
          CMatirx_Vector MultiplyElement(CMatirx_Vector & target)
          {         if(_rows != target._rows || _cols != target._cols)
                    {         Print("CMatirx_Vector MultiplyElement>>>>>>_rows != target._rows || _cols != target._cols", "  this(", _rows, ",", _cols, ")   target(", target._rows, ",", target._cols, ")");
                              return this; } //ExpertRemove();
                    //CMatirx_Vector<t> output(_cols, _rows);
                    CMatirx_Vector<t> output(_cols, _rows);
                    for(uint y = 0; y < output._rows; y++)
                    {         for(uint x = 0; x < output._cols; x++)
                              {         output.setAt(y, x, getAt(x, y) * target.getAt(y, x)); //
                              }//
                    } //
                    return output;//
          } //
          /*
          abstract:
          divides each element of matrix by scalar value
          restrictions:
          scalar should be non-zero
          */
          CMatirx_Vector  DivScalar(double scalar)
          {         CMatirx_Vector<t> output(_rows, _cols);
                    if(scalar == 0) {Print("scalar == 0"); return this;}
                    output = this.multiplyScaler((t)(ONE / scalar)); //
                    return output;//
          }
          CMatirx_Vector operator+=(CMatirx_Vector & target) { return(Plus(target)); }
          CMatirx_Vector operator+ (CMatirx_Vector & target) { return(Plus(target)); }
          CMatirx_Vector Plus( CMatirx_Vector & target)
          {         //same demision
                    if(_rows != target._rows || _cols != target._cols)
                    {         Print("CMatirx_Vector Plus>>>>>>_rows != target._rows || _cols != target._cols",  "  this(", _rows, ",", _cols, ")   target(", target._rows, ",", target._cols, ")");
                              return this; }//ExpertRemove();
                    //CMatirx_Vector<t> output(target._cols, _rows);
                    CMatirx_Vector<t> output( _rows, target._cols);
                    for(uint y = 0; y < output._rows; y++)
                    {         for(uint x = 0; x < output._cols; x++)
                              {         output.setAt(y, x, getAt(y, x) + target.getAt(y, x)); } //
                    }//
                    return output;//
          }
          CMatirx_Vector operator+ (t s) { return(PlusScaler(s)); }
          CMatirx_Vector PlusScaler(t s)
          {         //CMatirx_Vector<t> output(_cols, _rows);
                    CMatirx_Vector<t> output(_rows, _cols);
                    for(uint y = 0; y < output._rows; y++)
                    {         for(uint x = 0; x < output._cols; x++)
                              {         output.setAt(y, x, getAt(y, x) + s); //
                              }//
                    } //
                    return output;//
          } //
          CMatirx_Vector operator- (CMatirx_Vector & target) { return(Plus(target.negative())); }
          CMatirx_Vector negative()
          {         //CMatirx_Vector<t> output(_cols, _rows);
                    CMatirx_Vector<t> output(_rows, _cols);
                    for(uint y = 0; y < output._rows; y++)
                    {         for(uint x = 0; x < output._cols; x++)
                              {         output.setAt(y, x, -getAt(y, x)); //
                              }//
                    } //
                    return output;//
          } //
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          CMatirx_Vector T() {return transpose();};
          CMatirx_Vector transpose()
          {         //CMatirx_Vector<t> output(_rows, _cols);
                    CMatirx_Vector<t> output (_cols, _rows);
                    for(uint y = 0; y < _rows; y++)
                    {         for(uint x = 0; x < _cols; x++)
                              {         output.setAt(x, y, getAt(y, x)); //
                              }//
                    }//
                    return output;//
          }
          CMatirx_Vector V()//Vector Hortizonal Vertical
          {         CMatirx_Vector<t> output (_rows * _cols, 1);
                    for(uint y = 0; y < _rows; y++)
                    {         for(uint x = 0; x < _cols; x++)
                              {         output.setAt(y * _cols + x, 0, getAt(y, x)); //
                              }//
                    } //
                    return output;//
          }
          CMatirx_Vector H()//Vector Hortizonal Vertical
          {         CMatirx_Vector<t> output (1, _rows * _cols);
                    for(uint y = 0; y < _rows; y++)
                    {         for(uint x = 0; x < _cols; x++)
                              {         output.setAt(0, y * _cols + x, getAt(y, x)); //
                              }//
                    } //
                    return output;//
          }
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          CMatirx_Vector reshape(CMatirx_Vector & target, uint row = 1, uint col = 1)
          {         if(IsDebug_MATRIX_Print)Print("CMatirx_Vector reshape __Start 0__");//"
                    CMatirx_Vector<t> output(row, col);
                    VectorZ<t>    _valstemp; _valstemp.clear();
                    if(IsDebug_MATRIX_Print)Print("CMatirx_Vector reshape __Start 1__");//"
                    for(uint y = 0; y < target._rows; y++)
                    {         for(uint x = 0; x < target._cols; x++)
                              {         _valstemp << target.getAt(y, x); //
                              }//
                    } //
                    //--error---delete target;
                    if(IsDebug_MATRIX_Print)Print("CMatirx_Vector reshape __Start 2__");//"
                    for(uint y = 0; y < output._rows; y++)
                    {         for(uint x = 0; x < output._cols; x++)
                              {         output.setAt(y, x, _valstemp.forward()); //
                              }//
                    } //
                    if(IsDebug_MATRIX_Print)Print("CMatirx_Vector reshape __End__");//"
                    return output;//
          }
          CMatirx_Vector Seter(CMatirx_Vector & base, CMatirx_Vector & target2, uint Rstart = 0, uint Rend = 1, uint Cstart = 0, uint Cend = 1)
          {         VectorZ<t>    _valstemp; _valstemp.clear();
                    if(IsDebug_MATRIX_Print)Print("CMatirx_Vector Seter __Start 1__");//"
                    for(uint y = 0; y < target2._rows; y++)
                    {         for(uint x = 0; x < target2._cols; x++)
                              {         _valstemp << target2.getAt(y, x); //
                              }//
                    } //
                    for(uint y = Rstart; y < Rend; y++)
                    {         for(uint x = Cstart; x < Cend; x++)
                              {         base.setAt(y, x, _valstemp.forward()); //
                              }//
                    } //
                    return  base;//
          }
          CMatirx_Vector geter(CMatirx_Vector & base, uint Rstart = 0, uint Rend = 1, uint Cstart = 0, uint Cend = 1, uint Row = 0, uint Col = 0)
          {         CMatirx_Vector<t> output(Row, Col);
                    VectorZ<t>    _valstemp; _valstemp.clear();
                    //get base as array vector
                    for(uint y = Rstart; y < Rend; y++)
                    {         for(uint x = Cstart; x < Cend; x++)
                              {         _valstemp << base.getAt(y, x); //
                              }//
                    } //
                    //--error---delete base;
                    //set base as Matrix
                    for(uint y = 0; y < output._rows; y++)
                    {         for(uint x = 0; x < output._cols; x++)
                              {         output.setAt(y, x, _valstemp.forward()); //
                              }//
                    } //y
                    return output;//
          }
          //----------------------------------------------------------------------------------
          CMatirx_Vector  applyFunction(string funcname)//(MyFunctionCMatirx_Vector func)
          {         //if(_rows != target._rows && _cols != target._cols)ExpertRemove();
                    CMatirx_Vector<t> output(_cols, _rows);;
                    //MyFunctionCMatirx_Vector func;
                    //func = (MyFunctionCMatirx_Vector)HashX(funcname); //'(double(*MyFunctionCMatirx_Vect…' - invalid cast operation          MatrixVector.mqh    144       26
                    //if(funcname == "SigmodFnc") func = SigmodFnc;
                    //if(funcname == "SigmodFncD")func = SigmodFnc;
                    for(uint y = 0; y < output._rows; y++)
                    {         for(uint x = 0; x < output._cols; x++)
                              {         //output.setAt(x, y, func(getAt(x, y)));
                                        if(funcname == "SigmodFnc")    output.setAt(x, y, SigmodFnc(getAt(x, y)));
                                        if(funcname == "SigmodFncD")   output.setAt(x, y, SigmodFncD(getAt(x, y)));//
                              } //
                    }//
                    return output;//
          }
          t     SigmodFnc(double x) {return (t)(1.0 / (1.0 + exp(1 * (-(x)))));}
          t     SigmodFncD(double x) {return (t)(x * (1 - x));}
          //+------------------------------------------------------------------+
          //|                                                                  |
          //+------------------------------------------------------------------+
          t InRange_( double OldMin, double OldMax, double NewMin, double NewMax, double OldValue)
          {         //return  (                                                                                         * (( max - min) + min));
                    double OldRange = (OldMax - OldMin);  double NewRange = (NewMax - NewMin);
                    t NewValue = 0.0;
                    return NewValue = (t)((((OldValue - OldMin) * NewRange) / OldRange) + NewMin); //
          }
          t InRange2_(double val, double Min, double Max) { return (t)(val * (Max - Min) + Min); } /* val in range [0,1] */
//==============================================================================================================================
          CMatirx_Vector  DataNormilizer_Standardize_Z_Score_(CMatirx_Vector  & target) //--  -X mean 0 +X
          {         VectorZ<t> Series = target._vals;
                    VectorZ<t> SeriesTemp;// = new VectorZ<t>;//
                    t VMean = (t)Series.Mean();
                    for(int i = 0; i < Series.Total(); i++)
                    {         if(Series.SD() == 0) {Print("Sampler DataNormilizer_Standardize_Z_Score Series.SD() == 0  ", Series.SD() == 0, "  Series.Total():", Series.Total()); return target;}
                              SeriesTemp << (t)(((t)Series[i] - VMean) / (t)Series.SD()); //
                    }
                    target._vals = SeriesTemp; //
                    return target;//
          }
          CMatirx_Vector  DataNormilizer_Max_Min_(CMatirx_Vector & target)
          {         VectorZ<t> Series = target._vals;
                    VectorZ<t> SeriesTemp;// = new VectorZ<t>;//
                    for(int i = 0; i < Series.Total(); i++)
                    {         t DataDiffMin = (t)((Series[i] ) - (Series.GetMin()));
                              t DataRange = (t)(Series.GetMax() - Series.GetMin());
                              if(DataRange == 0) {Print("Sampler DataRange == 0  ", DataRange == 0); return target;} //  ___WHEN ONE SAMPLE EXISTEX EERROR___
                              t NormilazeData = DataDiffMin / DataRange;                       //  ___TTTT___USING ARRAY MAXIMUM GET INDEX BUT NEAD INDEX VALUE___________
                              //{Print("  NormilazeDataTime: ", NormilazeDataTime, "       DataDiffMin: ", DataDiffMin, "        Diff: ", Diff,  "        i: ", i); } //
                              if(NormilazeData > 1.0 || NormilazeData < 0.0) { Print("*******************NormilazeDataTime  ", NormilazeData, "*********************", " Not NORMALIZED " );}
                              SeriesTemp << NormilazeData; //
                    }
                    target._vals = SeriesTemp; //
                    return target;//
          }
          CMatirx_Vector  DataNormilizer_Ranger_(CMatirx_Vector & target, double OldMin, double OldMax, double NewMin, double NewMax)
          {         VectorZ<t> Series = target._vals;
                    VectorZ<t> SeriesTemp;// = new VectorZ<t>;//
                    for(int i = 0; i < Series.Total(); i++)
                    {         SeriesTemp << InRange_(OldMin, OldMax, NewMin, NewMax, Series[i]); //__ACTIVATION SIGMOID IS 1.0___ALLOW -4 TO 4___
                              //___________WHEN MAKE RANGE 0 +1 ____ITS NOT OVER SATURATED_________________
                    }
                    target._vals = SeriesTemp; //
                    return target;//
          }
//==============================================================================================================================
          CMatirx_Vector DataNormilizer( CMatirx_Vector & target, double OldMin, double OldMax, double NewMin, double NewMax)
          {         //--------------------------------------------------------------
                    CMatirx_Vector<t>  Normilizer_Z_Score = DataNormilizer_Standardize_Z_Score_(target);
                    CMatirx_Vector<t>  Normilizer_Max_Min = DataNormilizer_Max_Min_(Normilizer_Z_Score);
                    CMatirx_Vector<t>  Normilizer_Ranged  = DataNormilizer_Ranger_(Normilizer_Max_Min, OldMin, OldMax, NewMin, NewMax); //SHORT_MIN/1
                    //------------------
                    return Normilizer_Ranged;//
          }
          //
};// MAT2<double>
template<typename t>
CMatirx_Vector<t> operator* (CMatirx_Vector<t> & target) { return(MultiplyElement(target)); }
CMatirx_Vector<double> MAT;
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
