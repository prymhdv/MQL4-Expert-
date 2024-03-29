//+------------------------------------------------------------------+
//||   ||||||||||                 MasterPanel.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(ControlersCall)\MCV_Data_Model.mqh>
//+------------------------------------------------------------------+
//|             Class C_MasterPanel     BEGIN                        |
//+------------------------------------------------------------------+
struct C_MasterPanel_Data
{         string        CObj_Name;
          bool          Is_PanelActive;
          bool          Obj_Is_Vertical;
//===================================================================
          bool          is__Delete;               //= false;
          bool          is__Create;               //= false;
          bool          is__Mini;                 //= false;
          bool          is__Move;                 //= false;
          bool          is__RePos;                //= false;
          bool          is__MoveClicked;          //= false;*******if static is false  else true******************//is__MoveActive = is__MoveActive ? false : true;
//===================================================================
          bool          CIs_Create;
          bool          CIs_CreateMini;
          bool          CIs_Move;

          bool          CMoveX;                   //= 0;
          bool          CMoveY;                   //= 0;

};
//--------------------------------------------------------------------
template<typename T>
struct Manage_KeysActions_Data
{         //
          T             ObjGetClassMember;
          string        NameCom;
          int           Type;
          bool          IsKey;                  // = false;
          bool          Is_CreateMini;          // = false;
          bool          Is_Move;                // = false;
          int           MoveX;                  // = 0;
          int           MoveY;                  // = 0;
          int           SizeX;                  // = 0;
          int           SizeY;                  // = 0;
          int           FontSize;               // = 0;//8
          color         clrBody;                // = clrWhite;
          color         clrBodyMargine;         // = clrFireBrick;
          color         clrBodyText;            // = clrFireBrick;
          color         clrBodyCyrcle;          // = clrRed;
          bool          Is_PanelActive;        // = false;
          bool          Is_Vertical;            // = false; //
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_MasterPanel
{
private:
//===================================================================
public:   /*Must Static to know before state or define in class scope*/

          void          C_MasterPanel();
          void          ~C_MasterPanel() {};

//===================================================================
          C_MasterPanel_Data    Data;
          bool          Check_KeysStatus(string NameCom, int Type, bool Is_Vertical, bool &Is_Create, bool &Is_CreateMini, bool &Is_Move, bool &Is_PanelActiveCom, int &MoveX, int &MoveY, int &SizeX, int &SizeY, int &FontSize );

//===================================================================
          template<typename T>
          bool           Manage_KeysActions(Manage_KeysActions_Data<T> &Client);
//===================================================================
          template<typename T>
          void           _OBJECT_CLICK(T &Obj);
//===================================================================
          template<typename T>
          bool          ON_MasterPanelByObj(T &ObjPass);
//===================================================================

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_MasterPanel::C_MasterPanel()
{
//===================================================================
          Data.Is_PanelActive        = false;
//===================================================================
          Data.is__Delete           = false;
          Data.is__Create           = false;
          Data.is__Mini             = false;
          Data.is__Move             = false;
          Data.is__RePos            = false;
          Data.is__MoveClicked      = false;//is__MoveActive = is__MoveActive ? false : true;
//===================================================================
          Data.CIs_Create            = false;
          Data.CIs_CreateMini        = false;
          Data.CIs_Move              = false;
          Data.CMoveX                = 0;
          Data.CMoveY                = 0;
//===================================================================
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_MasterPanel::Check_KeysStatus(string NameCom, int Type, bool Is_Vertical, bool &Is_Create, bool &Is_CreateMini, bool &Is_Move, bool &Is_PanelActiveCom, int &MoveX, int &MoveY, int &SizeX, int &SizeY, int &FontSize )
{         Data.CObj_Name = NameCom; Data.Obj_Is_Vertical = Is_Vertical;
//=====================================================================================================
          {         Data.is__Delete = false; Data.is__Create = false; Data.is__Mini = false; Data.is__Move = false; Data.is__RePos = false;
                    switch(Type)
                    {         case MODE_EXIT:    { /*if(Type == 0) /*Exite*/  {Data.is__Delete  = true; Data.Is_PanelActive = false;}} break; // Alert("IsPadPress_Mini: ", IsPadPress_Mini);
                              case MODE_CREATE:  { /*if(Type == 1) /*Create*/ {Data.is__Create  = true;}} break; //
                              case MODE_MINI:    { /*if(Type == -1)/*Mini*/   {Data.is__Mini    = true;}} break; //
                              case MODE_MOVE:    { /*if(Type == -2)/*Move*/   {Data.is__Move    = true;}} break; //
                              case MODE_REPOS:   { /*if(Type == 2) /*RePos*/  {Data.is__RePos   = true;}} break; ////
                    }; ///
                    //Alert("Data.is__Delete: ", Data.is__Delete, "___Data.is__Create: ", Data.is__Create, "___Data.is__Mini: ", Data.is__Mini, "___Data.is__Move: ", Data.is__Move, "___Data.is__RePos: ", Data.is__RePos); //
                    //Alert("is__Delete || is__Create || is__Mini || is__RePos", is__Delete || is__Create || is__Mini || is__RePos);
          }
          //---
          //---
          //---
          if(!Data.is__Move) {Data.CMoveX = MoveX; Data.CMoveY = MoveY; }          //SizeX = 0; SizeY = 0;//FontSize = -3;//
          else {Is_Create = true;}
          //---
          //---
          //---
//=====================================================================================================
          if(false)
          {         Data.is__Delete   = (!Is_Create && !Is_CreateMini) ? true : false;
                    Data.is__Create   = ( Is_Create && Is_CreateMini)  ? true : false;
                    Data.is__Mini     = (!Is_Create && Is_CreateMini)  ? true : false;//
          }//
//=====================================================================================================
          {         static int MiniCountPress = 0;//
                    if(Data.is__Mini)
                    {         if(MiniCountPress < 1)MiniCountPress++; else MiniCountPress = 0; //
                              //====================================
                              //if(MiniCountPress == 0)Is_Create = is__Mini ?  false : true;
                              //else if(MiniCountPress == 1)Is_Create = is__Mini ?  true : false;
                              //====================================
                              Is_Create = ((MiniCountPress == 1) && Data.is__Mini) ?  false : true;
                              //====================================
                              //Is_CreateMini = false;    ResultOut = 0;
                              //
                    }
                    if(Data.is__Delete || Data.is__Create || Data.is__Mini ) {Complex.BottumXAllMove(Is_Create, Data.is__MoveClicked, NameCom, Is_Vertical, Is_CreateMini, MoveX, MoveY ); } //
                    if(Data.is__Mini)
                    {         static color clrLeftO2 = clrRed; clrLeftO2 = clrLeftO2 == clrYellowGreen ? clrRed : clrYellowGreen;
                              ObjectSetInteger(0, "PadMiniMini_Mini_LeftO2", OBJPROP_COLOR, clrLeftO2); //Alert("is__Mini: ", is__Mini);//
                              Is_PanelActiveCom = Data.Is_PanelActive =  Is_PanelActiveCom ? false : true; //
                    } //CIs_Create,CIs_CreateMini,CIs_Move
                    if(!Data.is__Move) { Data.CMoveX = MoveX;     Data.CMoveY = MoveY;  if(!Data.is__Mini) {Data.Is_PanelActive = false; MiniCountPress = 0;}} //
          } //
//=====================================================================================================
          return true;//
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
template<typename T>
void C_MasterPanel::_OBJECT_CLICK(T &Obj)
{         //
          string Clicked = Event.sparam;
          string Obj_Name = "X";
          //------------------------------------------------------------------
          Manage_KeysActions_Data<T> KeysActions_Data_Mini;
          KeysActions_Data_Mini.ObjGetClassMember  = Obj;
          KeysActions_Data_Mini.NameCom            = Obj_Name;
          KeysActions_Data_Mini.Type               = MODE_MINI;
          KeysActions_Data_Mini.IsKey              = false;            // = false;
          KeysActions_Data_Mini.Is_CreateMini      = true;        // = false;
          KeysActions_Data_Mini.Is_Move            = false;      // = false;
          KeysActions_Data_Mini.MoveX              = 0;                // = 0;
          KeysActions_Data_Mini.MoveY              = 0;                // = 0;
          KeysActions_Data_Mini.SizeX              = 0;                    // = 0;
          KeysActions_Data_Mini.SizeY              = 0;                    // = 0;
          KeysActions_Data_Mini.FontSize           = 0;                    // = 0;//8
          KeysActions_Data_Mini.clrBody            = clrWhite;             // = clrWhite;
          KeysActions_Data_Mini.clrBodyMargine     = clrFireBrick;         // = clrFireBrick;
          KeysActions_Data_Mini.clrBodyText        = clrFireBrick;         // = clrFireBrick;
          KeysActions_Data_Mini.clrBodyCyrcle      = clrRed;               // = clrRed;
          KeysActions_Data_Mini.Is_PanelActive     = false;                // = false;
          KeysActions_Data_Mini.Is_Vertical        = false;                // = false; //
          if(Clicked == Obj_Name + "Mini_Mini_LeftO1"   || Clicked == Obj_Name + "Mini_Mini_Logo")        {Manage_KeysActions(KeysActions_Data_Mini);}
          //------------------------------------------------------------------
          //------------------------------------------------------------------
          Manage_KeysActions_Data<T> KeysActions_Data_Exit;
          KeysActions_Data_Exit.ObjGetClassMember  = Obj;
          KeysActions_Data_Exit.NameCom            = Obj_Name;
          KeysActions_Data_Exit.Type               = MODE_EXIT;
          KeysActions_Data_Exit.IsKey              = false;                     // = false;
          KeysActions_Data_Exit.Is_CreateMini      = false;                     // = false;
          KeysActions_Data_Exit.Is_Move            = false;                     // = false;
          KeysActions_Data_Exit.MoveX              = 0;                         // = 0;
          KeysActions_Data_Exit.MoveY              = 0;                         // = 0;
          KeysActions_Data_Exit.SizeX              = 0;                         // = 0;
          KeysActions_Data_Exit.SizeY              = 0;                         // = 0;
          KeysActions_Data_Exit.FontSize           = 0;                         // = 0;//8
          KeysActions_Data_Exit.clrBody            = clrWhite;                  // = clrWhite;
          KeysActions_Data_Exit.clrBodyMargine     = clrFireBrick;              // = clrFireBrick;
          KeysActions_Data_Exit.clrBodyText        = clrFireBrick;              // = clrFireBrick;
          KeysActions_Data_Exit.clrBodyCyrcle      = clrRed;                    // = clrRed;
          KeysActions_Data_Exit.Is_PanelActive    = false;                      // = false;
          KeysActions_Data_Exit.Is_Vertical        = false;                     // = false; //
          if(Clicked == Obj_Name + "Exit_Exit_LeftO1"   || Clicked == Obj_Name + "Exit_Exit_Logo")        {Manage_KeysActions(KeysActions_Data_Exit);}
          //------------------------------------------------------------------
          //------------------------------------------------------------------
          Manage_KeysActions_Data<T> KeysActions_Data_Move;
          KeysActions_Data_Move.ObjGetClassMember  = Obj;
          KeysActions_Data_Move.NameCom            = Obj_Name;
          KeysActions_Data_Move.Type               = MODE_MOVE;
          KeysActions_Data_Move.IsKey              = false;                     // = false;
          KeysActions_Data_Move.Is_CreateMini      = false;                     // = false;
          KeysActions_Data_Move.Is_Move            = true;                      // = false;
          KeysActions_Data_Move.MoveX              = 0;                         // = 0;
          KeysActions_Data_Move.MoveY              = 0;                         // = 0;
          KeysActions_Data_Move.SizeX              = 0;                         // = 0;
          KeysActions_Data_Move.SizeY              = 0;                         // = 0;
          KeysActions_Data_Move.FontSize           = 0;                         // = 0;//8
          KeysActions_Data_Move.clrBody            = clrWhite;                  // = clrWhite;
          KeysActions_Data_Move.clrBodyMargine     = clrFireBrick;              // = clrFireBrick;
          KeysActions_Data_Move.clrBodyText        = clrFireBrick;              // = clrFireBrick;
          KeysActions_Data_Move.clrBodyCyrcle      = clrRed;                    // = clrRed;
          KeysActions_Data_Move.Is_PanelActive     = false;                     // = false;
          KeysActions_Data_Move.Is_Vertical        = false;                     // = false; //
          if(Clicked == Obj_Name + "Move_Move_LeftO1"   || Clicked == Obj_Name + "Move_Move_Logo")        {Manage_KeysActions(KeysActions_Data_Move);}
          //------------------------------------------------------------------
          //------------------------------------------------------------------
          Manage_KeysActions_Data<T> KeysActions_Data_RePos;
          KeysActions_Data_RePos.ObjGetClassMember  = Obj;
          KeysActions_Data_RePos.NameCom            = Obj_Name;
          KeysActions_Data_RePos.Type               = MODE_REPOS;
          KeysActions_Data_RePos.IsKey              = false;                  // = false;
          KeysActions_Data_RePos.Is_CreateMini      = false;                  // = false;
          KeysActions_Data_RePos.Is_Move            = false;                  // = false;
          KeysActions_Data_RePos.MoveX              = 0;                      // = 0;
          KeysActions_Data_RePos.MoveY              = 0;                      // = 0;
          KeysActions_Data_RePos.SizeX              = 0;                      // = 0;
          KeysActions_Data_RePos.SizeY              = 0;                      // = 0;
          KeysActions_Data_RePos.FontSize           = 0;                      // = 0;//8
          KeysActions_Data_RePos.clrBody            = clrWhite;               // = clrWhite;
          KeysActions_Data_RePos.clrBodyMargine     = clrFireBrick;           // = clrFireBrick;
          KeysActions_Data_RePos.clrBodyText        = clrFireBrick;           // = clrFireBrick;
          KeysActions_Data_RePos.clrBodyCyrcle      = clrRed;                 // = clrRed;
          KeysActions_Data_RePos.Is_PanelActive     = false;                   // = false;
          KeysActions_Data_RePos.Is_Vertical        = false;                  // = false; //
          if(Clicked == Obj_Name + "RePos_RePos_LeftO1" || Clicked == Obj_Name + "RePos_RePos_Logo")      {Manage_KeysActions(KeysActions_Data_RePos);} //
          //------------------------------------------------------------------
          //------------------------------------------------------------------
          //
}
//+------------------------------------------------------------------+
//|                                                                  |year 1118...templars++.  assassin** ,Turks##,,a fraction of the whole,2008 page 73,,,,173,,,key,,,173,,,estive toltez,,, translate,,masume mahmudi,,, chap 1399 enteshara fereshte tabriz,,
//+------------------------------------------------------------------+C* C# C+ C:
template<typename T>
bool C_MasterPanel::Manage_KeysActions(Manage_KeysActions_Data<T> & Client)
{         //----------------------
          ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_RightMenuPad Error",  __LINE__, __FUNCTION__); //|
          //---
          //---
          //---
          if(Client.Type != MODE_MINI) {Client.MoveX = 15; Client.MoveY = 290;}
          Check_KeysStatus(Client.NameCom, Client.Type, Client.Is_Vertical, Client.IsKey, Client.Is_CreateMini, Client.Is_Move, Client.Is_PanelActive, Client.MoveX, Client.MoveY, Client.SizeX, Client.SizeY, Client.FontSize);
          //----------------------PadMiniMini-ExitLeftO1"  "PadMiniMove-ExitLeftO1"  "PadMiniExit-ExitLeftO1"
          /*Alert("CondicatorData_Status_PAD.Pad_MAmicro_TrendUp.Name: ", CondicatorData_Status_PAD.Pad_MAmicro_TrendUp.Name);*/
          //---
          //---
          //---
          if(Data.is__Delete ||  Data.is__Create ||  Data.is__Mini)  /*return ON_MasterPanelByObj(Obj);*/
          {         /*Alert("===+++++++++====+++++++++====+++++++"); */
                    bool res = false;
                    res = Client.ObjGetClassMember.ON_MasterPanel(MODE_CREATE, Client.IsKey, Client.MoveX, Client.MoveY, Client.SizeX, Client.SizeY, Client.FontSize); //
                    return res;//
                    //
          }
          //----------------------double true_range = (High==Low)?0:(Close-Open)/(High-Low);//
          //---
          //---
          //---
          if(Data.is__Move)//by function calling//
          {         //----------------------
                    if(Client.Is_Move) { Data.is__MoveClicked =  Data.is__MoveClicked ? false : true; }
                    // Alert(" Is_Move: ", Is_Move, " === ", "PadMini.is__MoveClicked: ", PadMini.is__MoveClicked, " Is_Create: ", Is_Create, " PadMini.is__Move: ", PadMini.is__Move); //
                    //----------------------
                    string Obj_Name = "fake";
                    if(!Data.is__MoveClicked) {return false;}
                    else if(Data.is__MoveClicked)
                    {         Complex.BottumXAllMove(MODE_MOVE, Data.is__MoveClicked, Obj_Name, Data.Obj_Is_Vertical, Client.Is_CreateMini, Client.MoveX, Client.MoveY );
                              Client.ObjGetClassMember.ON_MasterPanel(MODE_MOVE, Client.Is_Move, Client.MoveX, Client.MoveY, Client.SizeX, Client.SizeY, Client.FontSize); //////----MasterPanelCreate //----ON_MasterPanel
                    };
                    //----------------------
                    return true;//
                    //----------------------
          }
          //---
          //---
          //---
//=====================================================================================================
          if(Data.is__RePos)  //int &MoveX, int &MoveY, int &SizeX, int &SizeY, int &FontSize
          {         //Alert("is__RePos: ", is__RePos); T &Obj, string NameCom,
                    //------------------------------------------------------------------
                    Manage_KeysActions_Data<T> KeysActions_Data;
                    KeysActions_Data.ObjGetClassMember  = Client.ObjGetClassMember;
                    KeysActions_Data.NameCom            = Client.NameCom;
                    KeysActions_Data.Type               = 0;
                    KeysActions_Data.IsKey              = false;                // = false;
                    KeysActions_Data.Is_CreateMini      = false;                // = false;
                    KeysActions_Data.Is_Move            = Client.Is_Move;       // = false;
                    KeysActions_Data.MoveX              = Client.MoveX;         // = 0;
                    KeysActions_Data.MoveY              = Client.MoveY;         // = 0;
                    KeysActions_Data.SizeX              = Client.SizeX;         // = 0;
                    KeysActions_Data.SizeY              = Client.SizeY;         // = 0;
                    KeysActions_Data.FontSize           = Client.FontSize;      // = 0;//8
                    KeysActions_Data.clrBody            = clrWhite;             // = clrWhite;
                    KeysActions_Data.clrBodyMargine     = clrFireBrick;         // = clrFireBrick;
                    KeysActions_Data.clrBodyText        = clrFireBrick;         // = clrFireBrick;
                    KeysActions_Data.clrBodyCyrcle      = clrRed;               // = clrRed;
                    KeysActions_Data.Is_PanelActive    = false;                 // = false;
                    KeysActions_Data.Is_Vertical        = false;                // = false; //
                    Manage_KeysActions(KeysActions_Data);
                    //------------------------------------------------------------------
                    Manage_KeysActions_Data<T> KeysActions_DataA;
                    KeysActions_DataA.ObjGetClassMember  = Client.ObjGetClassMember;
                    KeysActions_DataA.NameCom            = Client.NameCom;
                    KeysActions_DataA.Type               = 1;
                    KeysActions_DataA.IsKey              = true;                 // = false;
                    KeysActions_DataA.Is_CreateMini      = true;                 // = false;
                    KeysActions_DataA.Is_Move            = Client.Is_Move;       // = false;
                    KeysActions_DataA.MoveX              = Client.MoveX;         // = 0;
                    KeysActions_DataA.MoveY              = Client.MoveY;         // = 0;
                    KeysActions_DataA.SizeX              = Client.SizeX;         // = 0;
                    KeysActions_DataA.SizeY              = Client.SizeY;         // = 0;
                    KeysActions_DataA.FontSize           = Client.FontSize;      // = 0;//8
                    KeysActions_DataA.clrBody            = clrWhite;             // = clrWhite;
                    KeysActions_DataA.clrBodyMargine     = clrFireBrick;         // = clrFireBrick;
                    KeysActions_DataA.clrBodyText        = clrFireBrick;         // = clrFireBrick;
                    KeysActions_DataA.clrBodyCyrcle      = clrRed;               // = clrRed;
                    KeysActions_DataA.Is_PanelActive     = false;                // = false;
                    KeysActions_DataA.Is_Vertical        = false;                // = false; //
                    return Manage_KeysActions(KeysActions_DataA); //
                    //------------------------------------------------------------------
          }
//==================================================================================================
          return false; //
}
//+------------------------------------------------------------------+, int mode, bool IsKey, int MoveX, int MoveY, int SizeX, int SizeY, int FontSize
//|                                                                  |// FIs_Create,  is__Move, MoveX, MoveY, SizeX, SizeY, FontSize = -3)
//+------------------------------------------------------------------+FIs_Create,  is__Move, MoveX, MoveY, SizeX, SizeY, FontSize
template<typename T>
bool C_MasterPanel::ON_MasterPanelByObj(T &ObjPass)
{
//
          return ObjPass.Action(ObjPass);
//
          return false;//
//
}
//+------------------------------------------------------------------+
//|             Class SoundController     BEGIN                      |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//||   ||||||||||                 MasterPanel.mqh                   ||
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| 0 errors, 0 warnings, 137-141 msec elapsed
//|||  ||   |||||             Email: @prymhdvgmail.com             |||
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
