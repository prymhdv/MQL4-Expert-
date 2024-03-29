//+------------------------------------------------------------------+
//| Module: Lang/HashX.mqh                                            |
//| This file is part of the mql4-lib project:                       |
//|     https://github.com/dingmaotu/mql4-lib                        |
//|                                                                  |
//| Copyright 2017 Li Ding <dingmaotu@126.com>                       |
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
//| HashX functions for builtin types                                 |
//+------------------------------------------------------------------+
#include "CastX.mqh"
#include "PointerX.mqh"

//+------------------------------------------------------------------+
//| Murmur3 hash adapted from https://github.com/PeterScott/murmur3  |
//+------------------------------------------------------------------+

// uint32_t rotl32(uint32_t x,int8_t r)
#define   ROTL32X(x,r)         ((x << r) | (x >> (32 - r)))
//+------------------------------------------------------------------+
//| Murmur3 on bytes array                                           |
//+------------------------------------------------------------------+
uint MurmurHashX3_x86_32X(const char &data[], uint seed)
{         const int len = ArraySize(data);
          const int nblocks = len / 4;
          int i;
          uint h1 = seed;
          uint c1 = 0xcc9e2d51;
          uint c2 = 0x1b873593;
// body
          for(i = 0; i < nblocks; i++)
          {         // getblock (x86 little endian)
                    int k = i << 2;
                    uint k1 = 0;
                    for(int j = 3; j != 0; j--)
                    {         k1 |= data[k + j];
                              k1 <<= 8; }
                    k1 *= c1;
                    k1 = ROTL32X(k1, 15);
                    k1 *= c2;
                    h1 ^= k1;
                    h1 = ROTL32X(h1, 13);
                    h1 = h1 * 5 + 0xe6546b64; }
// tail
          const int tail = nblocks * 4;
          uint k1 = 0;
          switch(len & 3)
          {         case 3: k1 ^= data[tail + 2] << 16;
                    case 2: k1 ^= data[tail + 1] << 8;
                    case 1: k1 ^= data[tail];
                              k1 *= c1; k1 = ROTL32X(k1, 15); k1 *= c2; h1 ^= k1; };
// finalization
          h1 ^= len;
          h1 ^= h1 >> 16;
          h1 *= 0x85ebca6b;
          h1 ^= h1 >> 13;
          h1 *= 0xc2b2ae35;
          h1 ^= h1 >> 16;
          return h1; }
//+------------------------------------------------------------------+
//| Murmur3 on utf-16 characters                                     |
//+------------------------------------------------------------------+
uint MurmurHashX3_x86_32X(const ushort &data[], uint seed)
{         const int len = ArraySize(data);
          const int nblocks = len / 2;
          uint h1 = seed;
          uint c1 = 0xcc9e2d51;
          uint c2 = 0x1b873593;
// body
          for(int i = 0; i < nblocks; i++)
          {         // getblock
                    uint k1 = data[(i << 1) | 1];
                    k1 <<= 16;
                    k1 |= data[i << 1];
                    k1 *= c1;
                    k1 = ROTL32X(k1, 15);
                    k1 *= c2;
                    h1 ^= k1;
                    h1 = ROTL32X(h1, 13);
                    h1 = h1 * 5 + 0xe6546b64; }
// tail
          if((len & 1) == 1)
          {         uint k1 = data[len - 1];
                    k1 *= c1; k1 = ROTL32X(k1, 15); k1 *= c2; h1 ^= k1; }
// finalization
          h1 ^= (len << 1);
// fmix32
          h1 ^= h1 >> 16;
          h1 *= 0x85ebca6b;
          h1 ^= h1 >> 13;
          h1 *= 0xc2b2ae35;
          h1 ^= h1 >> 16;
          return h1; }
//+------------------------------------------------------------------+
//| Accept string directly                                           |
//+------------------------------------------------------------------+
uint MurmurHashX3_x86_32X(const string data, uint seed)
{         const int len = StringLen(data);
          const int nblocks = len / 2;
          uint h1 = seed;
          uint c1 = 0xcc9e2d51;
          uint c2 = 0x1b873593;
// body
          for(int i = 0; i < nblocks; i++)
          {         // getblock
                    uint k1 = StringGetCharacter(data, (i << 1) | 1);
                    k1 <<= 16;
                    k1 |= StringGetCharacter(data, i << 1);
                    k1 *= c1;
                    k1 = ROTL32X(k1, 15);
                    k1 *= c2;
                    h1 ^= k1;
                    h1 = ROTL32X(h1, 13);
                    h1 = h1 * 5 + 0xe6546b64; }
// tail
          if((len & 1) == 1)
          {         uint k1 = StringGetCharacter(data, len - 1);
                    k1 *= c1; k1 = ROTL32X(k1, 15); k1 *= c2; h1 ^= k1; }
// finalization
          h1 ^= (len << 1);
// fmix32
          h1 ^= h1 >> 16;
          h1 *= 0x85ebca6b;
          h1 ^= h1 >> 13;
          h1 *= 0xc2b2ae35;
          h1 ^= h1 >> 16;
          return h1; }
//+------------------------------------------------------------------+
//| Convert string to ushort array or directly use StringGetCharacter|
//| The performance is roughly the same, while the StringGetCharacter|
//| version is slightly better, it also reduces memory allaction     |
//+------------------------------------------------------------------+
int HashX(const string value)
{         return (int)MurmurHashX3_x86_32X(value, 0x7e34a273); }
//+------------------------------------------------------------------+
//| expand to int                                                    |
//+------------------------------------------------------------------+
int HashX(const char value)
{         return value; }
//+------------------------------------------------------------------+
//| expand to int                                                    |
//+------------------------------------------------------------------+
int HashX(const bool value)
{         return (int)value; }
//+------------------------------------------------------------------+
//| expand to int                                                    |
//+------------------------------------------------------------------+
int HashX(const uchar value)
{         return value; }
//+------------------------------------------------------------------+
//| expand to int                                                    |
//+------------------------------------------------------------------+
int HashX(const short value)
{         return value; }
//+------------------------------------------------------------------+
//| expand to int                                                    |
//+------------------------------------------------------------------+
int HashX(const ushort value)
{         return value; }
//+------------------------------------------------------------------+
//| identity                                                         |
//+------------------------------------------------------------------+
int HashX(const int value)
{         return value; }
//+------------------------------------------------------------------+
//| same as int                                                      |
//+------------------------------------------------------------------+
int HashX(const uint value)
{         return (int)value; }
//+------------------------------------------------------------------+
//| long value compacted to int                                      |
//+------------------------------------------------------------------+
int HashX(const long value)
{         if(value == 0 || value == -0)
          {         return (0); }
          return (((int)((long)value)) ^ (int)(value >> 32)); }
//+------------------------------------------------------------------+
//| long value compacted to int                                      |
//+------------------------------------------------------------------+
int HashX(const ulong value)
{         return (((int)((ulong)value)) ^ (int)(value >> 32)); }
//+------------------------------------------------------------------+
//| float converted to int                                           |
//+------------------------------------------------------------------+
int HashX(const float value)
{         if(value == 0.0f || value == -0.0f)
          {         return (0); }
          int n;
          reinterpret_castX(value, n);
          return n; }
//+------------------------------------------------------------------+
//| double converted to long                                         |
//+------------------------------------------------------------------+
int HashX(const double value)
{         if(value == 0.0 || value == -0.0f)
          {         return (0); }
          long n;
          reinterpret_castX(value, n);
          return HashX(n); }
//+------------------------------------------------------------------+
//| datetime is of same size with long                               |
//+------------------------------------------------------------------+
int HashX(const datetime value)
{         return HashX((long)value); }
//+------------------------------------------------------------------+
//| color is of same size with int                                   |
//+------------------------------------------------------------------+
int HashX(const color value)
{         return value; }
//+------------------------------------------------------------------+
//| Generic pointer hash                                             |
//+------------------------------------------------------------------+
template<typename T>
int HashX(T *value)
{         return (int)GetAddressX(value); }
//+------------------------------------------------------------------+
