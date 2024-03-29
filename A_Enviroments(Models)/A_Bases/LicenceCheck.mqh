//+------------------------------------------------------------------+
//||   ||||||||||       LicenceCheck.mqh         ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#property strict
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//#define  LIC_TRADE_MODES      {  ACCOUNT_TRADE_MODE_CONTEST, ACCOUNT_TRADE_MODE_DEMO }
//#define  LIC_SYMBOLS          {  "GBPUSD" , "USDCAD", "XAUUSD.F","XAUUSD","EURUSD","EURUSD.F" }
#define  LIC_EXPIRES_DAYS  30
#define  LIC_EXPIRES_START __DATETIME__ //D'2023.03.01'
//#define  LIC_PRIVATE_KEY   "2023"
//

enum El_Mode
{         E_Void_Mode,
          E_Admin_Mode,
          E_User_Mode };
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_Licence
{
public:
          C_Licence(void) {_account = InpAccount; _privateKey = InpPrivateKey; MasterKey = "123321";};
          ~C_Licence(void) {};
          C_Licence(string account, string privateKey) {_account = account; _privateKey = privateKey; MasterKey = "123321";};
          //----------------------------
          string        _account;
          string        _privateKey;
          El_Mode       E_Mode;
          string        MasterKey;
          datetime      ExperiedTime;
          //----------------------------
          void          OnInit_Get_Key_(El_Mode e_mode)///--- Get_Key_(string account, string privateKey)string account, string privateKey
          {         Print("activing..  _Get_Key_");
                    string   key   =  KeyGen(InpAccount, InpPrivateKey);
                    Print("The key is " + key, "  Time: ", (string)__DATETIME__); //---Print("The Key is " + key); //
          }
          //---------------------------
          int           OnInit_LicenceCheck(El_Mode e_mode)
          {         Print("activing..  _LicenceCheck");
                    if (!LicenceCheck(InpLicence)) {Alert("key is wrong! try again"); ExpertRemove(); return(INIT_FAILED);}
                    else
                    {         Print("key is true!");
                              return(INIT_SUCCEEDED);//
                    } //
                    return 0;//
          }

          //---------------------------
          void Activation()
          {         //---Alert("activing.." + MasterKey + " == " + InpMaster);
                    if(MasterKey == InpMaster) OnInit_Get_Key_(E_Admin_Mode);
                    if(MasterKey != InpMaster) OnInit_LicenceCheck(E_User_Mode);//
          }
          //---------------------------
          string        KeyGen(string account, string privateKey)
          {         uchar accountChar[];
                    StringToCharArray(account + privateKey, accountChar);
                    uchar keyChar[];
                    StringToCharArray(privateKey, keyChar);
                    uchar resultChar[];
                    CryptEncode(CRYPT_HASH_SHA256, accountChar, keyChar, resultChar);
                    CryptEncode(CRYPT_BASE64, resultChar, resultChar, resultChar);
                    string result  =  CharArrayToString(resultChar);
                    return(result);//
          }
          //---------------------------
          bool          LicenceCheck(string licence = "")
          {         bool  valid =  true;
#ifdef LIC_TRADE_MODES
                    valid =  false;
                    int   validModes[]      =  LIC_TRADE_MODES;
                    long  accountTradeMode  =  AccountInfoInteger(ACCOUNT_TRADE_MODE);
                    for (int i = ArraySize(validModes) - 1; i >= 0; i--)
                    {         if (accountTradeMode == validModes[i]) { valid =  true; break;}}
                    if (!valid) { Print("This is a limited trial version, it will not work on this type of account"); return(false);      }
#endif
//
#ifdef LIC_SYMBOLS
                    valid =  false;
                    string   validSymbols[] =  LIC_SYMBOLS;
                    for (int i = ArraySize(validSymbols) - 1; i >= 0; i--)
                    {         if (Symbol() == validSymbols[i]) { valid =  true; break;    }}
                    if (!valid) { Print("This is a limited trial version, it will not work with symbol " + Symbol()); return(false);      }
#endif
//
#ifdef LIC_EXPIRES_DAYS
#ifndef LIC_EXPIRES_START
#define LIC_EXPIRES_START __DATETIME__
#endif
                    datetime expiredDate =  LIC_EXPIRES_START + (LIC_EXPIRES_DAYS * 86400);
                    PrintFormat("Time limited copy, licence to use expires at %s", TimeToString(expiredDate));
                    if (TimeCurrent() > expiredDate) { Print("Licence to use has expired"); return(false); }
#endif
//
#ifdef LIC_PRIVATE_KEY
                    long  account  =  AccountInfoInteger(ACCOUNT_LOGIN);
                    //
                    string result  =  KeyGen(IntegerToString(account), LIC_PRIVATE_KEY);
                    if (result != licence) { Print("Invalid licence"); Print("Should be " + result); return(false); }
#endif
                    return(true);//
          }
          //----------------------------
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
