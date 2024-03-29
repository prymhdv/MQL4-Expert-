//+------------------------------------------------------------------+
//|                                                      C_ERROR.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict

//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ct_ERROR
{
public:
          int           Trade_Error(int Error); //
          int           ct_Inform(int Mess_Number, int Number = 0, double Value = 0.0);
          //


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_ERROR::Trade_Error(int Error)                        // Function of processing errors
{         if(_LastError != 0 && _LastError != 4000 && true)
          {         Alert(ErrorDescription(_LastError) + "-", _LastError, "-", "-Line:", __LINE__, "-", __FUNCTION__); } //
          bool Work = true;                  // EA will work.
          switch(Error)
          {         // Not crucial errors
                    case  4: Alert("Trade server is busy. Trying once again..");
                              Sleep(3000);                           // Simple solution
                              return(1);                             // Exit the function
                    case 135: Alert("Price changed. Trying once again..");
                              ct_Series_Base.RefreshRate();                          // Refresh rates
                              return(1);                             // Exit the function
                    case 136: Alert("No prices. Waiting for a new tick.."); ct_Series_Base.RefreshRate();
                              while(ct_Series_Base.IsRefreshRate == false) Sleep(1);           // Till a new tick   // Pause in the loop
                              return(1);                             // Exit the function
                    case 137: Alert("Broker is busy. Trying once again..");
                              Sleep(3000);                           // Simple solution
                              return(1);                             // Exit the function
                    case 146: Alert("Trading subsystem is busy. Trying once again..");
                              Sleep(500);    return(1);                          // Simple solution        // Exit the function    // Critical errors
                    case  2: Alert("Common error.");
                              return(0);                             // Exit the function
                    case  5: Alert("Old terminal version.");
                              Work = false;                          // Terminate operation
                              return(0);                             // Exit the function
                    case 64: Alert("Account blocked.");
                              Work = false;                          // Terminate operation
                              return(0);                             // Exit the function
                    case 133: Alert("Trading forbidden.");
                              return(0);                             // Exit the function
                    case 134: Alert("Not enough money to execute operation.");
                              return(0);                             // Exit the function
                    default: Alert("Error occurred: ", Error); // Other variants
                              return(0);                             // Exit the function
          }//
          if(_LastError != 0 && _LastError != 4000 && true)
          {         Alert(ErrorDescription(_LastError) + "-", _LastError, "-", "-Line:", __LINE__, "-", __FUNCTION__); } //
          return (-1);//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Ct_ERROR::ct_Inform(int Mess_Number, int Number = 0, double Value = 0.0)
{         ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|
          // int    Mess_Number               // Message number
          // int    Number                    // Integer to be passed
          // double Value                     // Real number to be passed
          int    Win_ind;                     // Indicator window number
          string Graf_Text;                   // Message line
          color  Color_GT;                    // Color of the message line
          static uint   Time_Mess;            // Last publication time of the message
          static int    Nom_Mess_Graf;        // Graphical messages counter
          static string Name_Grf_Txt[30];     // Array of graphical message names
//----------------------------------------------------------------------- 3 --
          Win_ind = WindowFind("ct_Inform");     // Searching for indicator window number
          if (Win_ind < 0)return 0;             // If there is no such a window, leave
//----------------------------------------------------------------------- 4 --
          if (Mess_Number == 0)               // This happens at every tick
          {         if (Time_Mess == 0) return 0;      // If it is gray already
                    if (GetTickCount() - Time_Mess > 15000) // The color has become updated within 15 sec
                    {         for(int i = 0; i <= 29; i++)  // Color lines with gray
                                        ObjectSet( Name_Grf_Txt[i], OBJPROP_COLOR, Gray);
                              Time_Mess = 0;                // Flag: All lines are gray
                    }
                    return 0;                          // Exit the function
          }
//----------------------------------------------------------------------- 5 --
          if (Mess_Number == -1)              // This happens at deinit()
          {         for(int i = 0; i <= 29; i++)         // By object indexes
                              C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, Name_Grf_Txt[i], __LINE__); // Deletion of object
                    return 0;                          // Exit the function
          }
//----------------------------------------------------------------------- 6 --
          Nom_Mess_Graf++;                    // Graphical messages counter
          Time_Mess = GetTickCount();         // Last publication time
          Color_GT = Lime;
//----------------------------------------------------------------------- 7 --
          switch(Mess_Number)                 // Going to message
          {         case 1:
                              Graf_Text = "Closed order Buy " + (string)Number;
                              PlaySound("Close_order.wav");                         break;
                    case 2:
                              Graf_Text = "Closed order Sell " + (string)Number;
                              PlaySound("Close_order.wav");                         break;
                    case 3:
                              Graf_Text = "Deleted pending order " + (string)Number;
                              PlaySound("Close_order.wav");                         break;
                    case 4:
                              Graf_Text = "Opened order Buy " + (string)Number;
                              PlaySound("Ok.wav");                                  break;
                    case 5:
                              Graf_Text = "Opened order Sell " + (string)Number;
                              PlaySound("Ok.wav");                                  break;
                    case 6:
                              Graf_Text = "Placed pending order " + (string)Number;
                              PlaySound("Ok.wav");                                  break;
                    case 7:
                              Graf_Text = "ct_Order " + (string)Number + " modified into the market one";
                              PlaySound("Transform.wav");                           break;
                    case 8:
                              Graf_Text = "Reopened order " + (string)Number;                  break;
                              PlaySound("Bulk.wav");
                    case 9:
                              Graf_Text = "Partly closed order " + (string)Number;
                              PlaySound("Close_order.wav");                         break;
                    case 10:
                              Graf_Text = "New minimum distance: " + (string)Number;
                              PlaySound("ct_Inform.wav");                              break;
                    case 11:
                              Graf_Text = " Not enough money for " +
                                          DoubleToStr(Value, 2) + " lots";
                              Color_GT = Red;
                              PlaySound("Oops.wav");                                break;
                    case 12:
                              Graf_Text = "Trying to close order " + (string)Number;
                              PlaySound("expert.wav");                              break;
                    case 13:
                              if (Number > 0)
                                        Graf_Text = "Trying to open order Sell..";
                              else
                                        Graf_Text = "Trying to open order Buy..";
                              PlaySound("expert.wav");                              break;
                    case 14:
                              Graf_Text = "Invalid password. EA doesn't function.";
                              Color_GT = Red;
                              PlaySound("Oops.wav");                                break;
                    case 15:
                              switch(Number)                 // Going to the error number
                              {         case 2:   Graf_Text = "Common error.";                    break;
                                        case 129: Graf_Text = "Wrong price. ";                    break;
                                        case 135: Graf_Text = "Price changed. ";                  break;
                                        case 136: Graf_Text = "No prices. Awaiting a new tick.."; break;
                                        case 146: Graf_Text = "Trading subsystem is busy";        break;
                                        case 5 :  Graf_Text = "Old version of the terminal.";     break;
                                        case 64:  Graf_Text = "Account is blocked.";              break;
                                        case 133: Graf_Text = "Trading is prohibited";            break;
                                        default:  Graf_Text = "Occurred error " + (string)Number; //Other errors
                              }
                              Color_GT = Red;
                              PlaySound("Error.wav");                                    break;
                    case 16:
                              Graf_Text = "Expert Advisor works only for EURUSD";
                              Color_GT = Red;
                              PlaySound("Oops.wav");                                     break;
                    default:
                              Graf_Text = "default " + (string)Mess_Number;
                              Color_GT = Red;
                              PlaySound("Bzrrr.wav"); }
//----------------------------------------------------------------------- 8 --
          C_STATICSUN::DeleteAnaliseAllObjectName(0, 0, 1, Name_Grf_Txt[29], __LINE__);  // Deleting 29th (upper) object
          for(int i = 29; i >= 1; i--)             // Cycle for array indexes ..
          {         // .. of graphical objects
                    Name_Grf_Txt[i] = Name_Grf_Txt[i - 1]; // Raising objects:
                    if(ObjectFind(0, Name_Grf_Txt[i]) >= 0) ObjectSet( Name_Grf_Txt[i], OBJPROP_YDISTANCE, 2 + 15 * i); //
          }
          Name_Grf_Txt[0] = "Inform_" + (string)Nom_Mess_Graf + "_" + Symbol(); // Object name
          if(ObjectFind(0, Name_Grf_Txt[0]) >= 0)
          {         ObjectCreate (Name_Grf_Txt[0], OBJ_LABEL, Win_ind, 0, 0); // Creating
                    ObjectSet    (Name_Grf_Txt[0], OBJPROP_CORNER, 3   ); // Corner
                    ObjectSet    (Name_Grf_Txt[0], OBJPROP_XDISTANCE, 450); // Axis Х
                    ObjectSet    (Name_Grf_Txt[0], OBJPROP_YDISTANCE, 2); // Axis Y
                    // Текстовое описание объекта
                    ObjectSetText(Name_Grf_Txt[0], Graf_Text, 10, "Courier New", Color_GT); //
          }
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ZIGZAG-Error",  __LINE__, __FUNCTION__); //|
          //=========================================================|                     // Redrawing all objects
          return 0; //
}
//+------------------------------------------------------------------+
//|             Class inform     BEGIN-END                           |
//+------------------------------------------------------------------+
