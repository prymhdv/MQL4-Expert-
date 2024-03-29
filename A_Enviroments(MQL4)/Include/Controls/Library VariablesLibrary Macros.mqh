//+------------------------------------------------------------------+
//|                              Library VariablesLibrary Macros.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property strict
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| C Library - <stdlib.h>/                                          |
//+------------------------------------------------------------------+
//Library Variables
//1       size_     This is the unsigned integral type and is the result of the sizeof keyword.
//2       wchar_t   This is an integer type of the size of a wide character constant.
//3       div_t     This is the structure returned by the div function.
//4       ldiv_t    This is the structure returned by the ldiv function.
//+------------------------------------------------------------------+
//Library Macros
//1       NULL      This macro is the value of a null pointer constant.
//2       EXIT_FAILURE        This is the value for the exit function to return in case of failure.     ///back test ////
//3       EXIT_SUCCESS        This is the value for the exit function to return in case of success.
//4       RAND_MAX            This macro is the maximum value returned by the rand function.   The rand() function is used in C/C++ to generate random numbers in the range [0, RAND_MAX). Note: If random numbers are generated with rand() without first calling srand(), your program will create the same sequence of numbers each time it runs.
//5       MB_CUR_MAX          This macro is the maximum number of bytes in a multi-byte character set which cannot be larger than MB_LEN_MAX.
//+------------------------------------------------------------------+
//Library Functions                functions defined in the header stlib.h −
//1       double atof(const char *str)                        //Converts the string pointed to, by the argument str to a floating-point number (type double).
//2       int atoi(const char *str)                           //Converts the string pointed to, by the argument str to an integer (type int).
//3       long int atol(const char *str)                      //Converts the string pointed to, by the argument str to a long integer (type long int).
//4       double strtod(const char *str, char **endptr)       //Converts the string pointed to, by the argument str to a floating-point number (type double).
//5       long int strtol(const char *str, char **endptr, int base)    //Converts the string pointed to, by the argument str to a long integer (type long int).
//6       unsigned long int strtoul(const char *str, char **endptr, int base)    //Converts the string pointed to, by the argument str to an unsigned long integer (type unsigned long int).
//7       void *calloc(size_t nitems, size_t size)            //Allocates the requested memory and returns a pointer to it.
//8       void free(void* *ptr)                               //Deallocates the memory previously allocated by a call to calloc, malloc, or realloc.
//9       void *malloc(size_t size)                           //Allocates the requested memory and returns a pointer to it.
//10      void *realloc(void *ptr, size_t size)               //Attempts to resize the memory block pointed to by ptr that was previously allocated with a call to malloc or calloc.
//11      void abort(void)                                    //Causes an abnormal program termination.
//12      int atexit(void (*func)(void))                      //Causes the specified function func to be called when the program terminates normally.
//13      void exit(int status)                               //Causes the program to terminate normally.
//14      char *getenv(const char *name)                      //Searches for the environment string pointed to by name and returns the associated value to the string.
//15      int system(const char *string)                      //The command specified by string is passed to the host environment to be executed by the command processor.
//16      void *bsearch(const void *key, const void *base, size_t nitems, size_t size, int (*compar)(const void *, const void *))  //Performs a binary search.   //#define  size_t size,  int nitems
//17      void qsort(void *base, size_t nitems, size_t size, int (*compar)(const void *, const void*))                   //Sorts an array.
//18      int abs(int x)                                         //Returns the absolute value of x.
//19      div_t div(int numer, int denom)                   //Divides numer (numerator) by denom (denominator).
//20      long int labs(long int x)                         //Returns the absolute value of x.
//21      ldiv_t ldiv(long int numer, long int denom)       //Divides numer (numerator) by denom (denominator).
//22      int rand(void)                                    //Returns a pseudo-random number in the range of 0 to RAND_MAX.
//23      void srand(unsigned int seed)                     //This function seeds the random number generator used by the function rand.
//24      int mblen(const char *str, size_t n)              //Returns the length of a multibyte character pointed to by the argument str.
//25      size_t mbstowcs(schar_t *pwcs, const char *str, size_t n)         //Converts the string of multibyte characters pointed to by the argument str to the array pointed to by pwcs.
//26      int mbtowc(whcar_t *pwc, const char *str, size_t n)               //Examines the multibyte character pointed to by the argument str.
//27      size_t wcstombs(char *str, const wchar_t *pwcs, size_t n)         //Converts the codes stored in the array pwcs to multibyte characters and stores them in the string str.
//28      int wctomb(char *str, wchar_t wchar)                              //Examines the code which corresponds to a multibyte character given by the argument wchar.
////+------------------------------------------------------------------+
//void free(void* ptr);
//void free(void* ptr) {};
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//free(void* ptr);
////+------------------------------------------------------------------+
//void inputer (int *, int *);
//void reciver (int, int, int *, int *);
//
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//void inputer (int *p1, int *p2)
//{       *p1 = 4;
//        *p2 = 6; }
//
//
//void reciver (int x, int y, int *a, int *p)
//
//
//{       *a  = x * y;
//        *p = 6 * (x + y); }
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
//int mmain()
//{       int len, width, area, perremeter;
//        inputer(&len, &width);
//        reciver(len, width, &area, &perremeter);
//        Alert( "len is ", len);
//        Print ("area is ", area);
//        return (0); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
