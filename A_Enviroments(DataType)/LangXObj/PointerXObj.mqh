//+------------------------------------------------------------------+
//| Module: Lang/Pointer.mqh                                         |
//| This file is part of the mql4-lib project:                       |
//|     https://github.com/dingmaotu/mql4-lib                        |
//|                                                                  |
//| Copyright 2016-2017 Li Ding <dingmaotu@126.com>                  |
//|                                                                  |
//| Licensed under the Apache License, Version 2.0 (the "License");  |
//| you may not use this file except in compliance with the License. |
//| You may obtain a copy of the License at                          |
//|                                                                  |
//|     http://www.apache.org/licenses/LICENSE-2.0                   |
//|                                                                  |
//| Unless required by applicable law or agreed to in writing,       |
//| software distributed under the License is distributed on an      |
//| "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,     |
//| either express or implied.                                       |
//| See the License for the specific language governing permissions  |
//| and limitations under the License.                               |
//+------------------------------------------------------------------+
#property strict
//+------------------------------------------------------------------+
//| Generic pointer check                                            |
//+------------------------------------------------------------------+
template<typename T>
bool IsValidXObj(T *pointer)
  {
   return CheckPointer(pointer)!=POINTER_INVALID;
  }
//+------------------------------------------------------------------+
//| Generic safe pointer delete                                      |
//+------------------------------------------------------------------+
template<typename T>
void SafeDeleteXObj(T *pointer)
  {
//--- only dynamically created value with `new` should be deleted
//--- automatic pointers from GetPointer (POINTER_AUTOMATIC) should not be deleted
   if(CheckPointer(pointer)==POINTER_DYNAMIC) delete pointer;
   delete pointer;//
  }
//+------------------------------------------------------------------+
//| If pointer is actually a value type                              |
//+------------------------------------------------------------------+
template<typename T>
void SafeDeleteXObj(T &pointer) {}
//+------------------------------------------------------------------+
//| Ensure dynamic global pointers be deleted after program exit     |
//| In global context, declare the following (p is some pointer):    |
//|     EnsureDeleteXObj ensureDeleteSomething(p);                       |
//+------------------------------------------------------------------+
class EnsureDeleteXObj
  {
private:
   const void       *m_pointer;
public:
                     EnsureDeleteXObj(const void *p):m_pointer(p){}
                    ~EnsureDeleteXObj() {if(CheckPointer(m_pointer)==POINTER_DYNAMIC) delete m_pointer;}
  };
//+------------------------------------------------------------------+
//| Get numerical value of a pointer                                 |
//| Mainly used by the Hash function on pointers                     |
//| According to official documentation, MQL4 pointer is a 8 byte    |
//| value, not the actual pointer address of objects.                |
//| But numeric values of different pointers have to be distinct.    |
//+------------------------------------------------------------------+
long GetAddressXObj(const void *pointer)
  {
   return long(StringFormat("%I64d",pointer));
  }
//+------------------------------------------------------------------+
//| Wraps a pointer that does not own the underlying resource        |
//+------------------------------------------------------------------+
template<typename T>
class RefXObj
  {
public:
   T                *r;
                     RefXObj(T *raw=NULL):r(raw) {}
                     RefXObj(const RefXObj<T>&other):r(other.r) {}
   virtual          ~RefXObj() {}

   bool              operator==(const RefXObj &other) const {return other.r==r;}
   bool              operator==(const T *other) const {return r==other;}
   bool              operator!=(const RefXObj &other) const {return other.r!=r;}
   bool              operator!=(const T *other) const {return r!=other;}

   virtual T        *operator=(RefXObj &other) {r=other.r;return r;}
   T                *operator=(T *other){ r=other;return r;}
  };
//+------------------------------------------------------------------+
//| Wraps a pointer that owns the underlying resource                |
//+------------------------------------------------------------------+
template<typename T>
class PtrXObj: public RefXObj<T>
  {
public:
                     PtrXObj(T *raw=NULL):RefXObj(raw) {}
                     PtrXObj(const PtrObj<T>&other):RefXObj(other) {}

   //--- responsible for delete the resource
                    ~PtrXObj() {SafeDeleteXObj(r);}
  };
//+------------------------------------------------------------------+
