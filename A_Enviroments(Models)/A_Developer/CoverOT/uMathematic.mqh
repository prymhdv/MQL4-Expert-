//+------------------------------------------------------------------+
//|                                                   Mathematic.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             |
//+------------------------------------------------------------------+
class Mathematic
{
private:
//==========================================================
public:
          void Mathematic() {};
          void ~Mathematic() {};
//==========================================================
          long MathFactorial(int f_number); // numer elementu silni
          long MathFibonacci(int f_number);// numer elementu ciągu Fibonacciego
//==========================================================
//==========================================================
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+MathFactorial(8);
long Mathematic::MathFactorial(int f_number) // numer elementu silni
{         if(f_number < 0) return -1;
          if(f_number > 1) return f_number * MathFactorial(f_number - 1);//(8*Factorial(7))//(8*7*6*5*4*3*2*1)
          else return 1; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+MathFibonacci(8);
long Mathematic::MathFibonacci(int f_number) // numer elementu calc Fibonacciego
{         //---
          int  a = 0;
          int  b = 0;
          int  i = 1;
          int result = 0;
          //---
          if(f_number < 0)  return -1;
          if(f_number == 0) return 0;
          //---
          if(f_number == 1) return 1;
          //---
          if(f_number > 1)
          {         result = 1;
                    while(i < f_number) //(1<x)(2<x)(3<x)(4<x)(5<x)(6<x)(7<x)//>(8<x)//1 2 3 5 8 13 21 34 56 89
                    {         i++;
                              a = b;
                              b = result;
                              result = a + b; //
                    } // (0+1)+(1+1)+(1+2)+(2+3)+(3+5)+(5+8)+(8+13)+(13+21)+(21+34)+(34+55)+(55+89)+(89+144)+(144+233)+(233+377)+/610/(377+610)/987/
          }
          return result; //
}
//+------------------------------------------------------------------+
//|             Class C_BANK::     BEGIN                             |
//+------------------------------------------------------------------+
