//+------------------------------------------------------------------+
//|                                      DefaultEqualityComparer.mqh |
//|                   Copyright 2016-2017, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(MQL5)\Include\Generic\Interfaces\IEqualityComparer.mqh>
#include "EqualFunction.mqh"
#include "HashFunction.mqh"
//+------------------------------------------------------------------+
//| Class CDefaultEqualityComparer<T>.                               |
//| Usage: Provides a default class for implementations of the       |
//|        IEqualityComparer<T> generic interface.                   |
//+------------------------------------------------------------------+
template<typename T>
class CDefaultEqualityComparer: public IEqualityComparer<T>
  {
public:
                     CDefaultEqualityComparer(void) {                           }
                    ~CDefaultEqualityComparer(void) {                           }
   //--- determines whether the specified values are equal
   bool              Equals(T x,T y)                { return ::Equals(x,y);     }
   //--- returns a hash code for the specified object
   int               HashCode(T value)              { return ::GetHashCode(value); }
  };
//+------------------------------------------------------------------+
