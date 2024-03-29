//+------------------------------------------------------------------+
//||   ||||||||||                 Sg_OnChartEvent_base.mqh          ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
struct Sc_Mathematical
{         /*
           Mathematical Functions
           A set of mathematical and trigonometric functions.
           Function              Action

           MathAbs               Returns absolute value (modulus) of the specified numeric value
           MathArccos            Returns the arc cosine of x in radians
           MathArcsin            Returns the arc sine of x in radians
           MathArctan            Returns the arc tangent of x in radians
           MathCeil              Returns integer numeric value closest from above
           MathCos               Returns the cosine of a number
           MathExp               Returns exponent of a number
           MathFloor             Returns integer numeric value closest from below
           MathLog               Returns natural logarithm
           MathLog10             Returns the logarithm of a number by base 10
           MathMax               Returns the maximal value of the two numeric values
           MathMin               Returns the minimal value of the two numeric values
           MathMod               Returns the real remainder after the division of two numbers
           MathPow               Raises the base to the specified power
           MathRand              Returns a pseudorandom value within the range of 0 to 32767
           MathRound             Rounds of a value to the nearest integer
           MathSin               Returns the sine of a number
           MathSqrt              Returns a square root
           MathSrand             Sets the starting point for generating a series of pseudorandom integers
           MathTan               Returns the tangent of a number
           MathIsValidNumber     Checks the correctness of a real number

           What's new in MQL5
           Added hyperbolic trigonometric functions and the MathSwap function for changing the byte order in ushort, uint and ulong integer types. The need for such a transformation often arises when working with the Network functions.
           The Mathematics section contains the ready - made libraries for working with random distributions, fuzzy logic and neural networks. It also contains functions for solving differential equations, clustering, statistical analysis and optimization tasks.
           */
          //---void    Sc_Mathematical(){};
          int     XYZ;
          //---
          double  _MathAbs(double Value)                  {  return MathAbs( Value);}     //Returns absolute value (modulus) of the specified numeric value
          double  _MathArccos(double Value)               {  return MathArccos( Value);}     //Returns the arc cosine of x in radians
          double  _MathArcsin(double Value)               {  return MathArcsin( Value);}     //Returns the arc sine of x in radians
          double  _MathArctan(double Value)               {  return MathArctan( Value);}     //Returns the arc tangent of x in radians
          double  _MathCeil(double Value)                 {  return MathCeil( Value);}     //Returns integer numeric value closest from above
          double  _MathCos(double Value)                  {  return MathCos( Value);}     //Returns the cosine of a number
          double  _MathExp(double Value)                  {  return MathExp( Value);}     //Returns exponent of a number
          double  _MathFloor(double Value)                {  return MathFloor( Value);}     //Returns integer numeric value closest from below
          double  _MathLog(double Value)                  {  return MathLog( Value);}     //Returns natural logarithm
          double  _MathLog10(double Value)                {  return MathLog10( Value);}     //Returns the logarithm of a number by base 10
          double  _MathMax(double Value, double Value2)   {  return MathMax( Value, Value2);}   //Returns the maximal value of the two numeric values
          double  _MathMin(double Value, double Value2)   {  return MathMin( Value, Value2);}   //Returns the minimal value of the two numeric values
          double  _MathMod(double Value, double Value2)   {  return MathMod( Value, Value2);}   //Returns the real remainder after the division of two numbers
          double  _MathPow(double Value, double power)    {  return MathPow( Value, power);}   //Raises the base to the specified power
          int     _MathRand(void)                         {  return MathRand();}     //Returns a pseudorandom value within the range of 0 to 32767
          double  _MathRound(double Value)                {  return MathRound( Value);}     //Rounds of a value to the nearest integer
          double  _MathSin(double Value)                  {  return MathSin( Value);}     //Returns the sine of a number
          double  _MathSqrt(double Value)                 {  return MathSqrt( Value);}     //Returns a square root
          void    _MathSrand(uint Value)                  {  MathSrand( Value); return;}    //Sets the starting point for generating a series of pseudorandom integers   rand_index+=MathRand()%7;
          double  _MathTan(double Value)                  {  return MathTan( Value);}     //Returns the tangent of a number
          bool    _MathIsValidNumber(double Value)        {  return MathIsValidNumber( Value);}     //Checks the correctness of a real number

};
//+------------------------------------------------------------------+
