//+------------------------------------------------------------------+
//|                                                      Defines.mqh |
//|                             Copyright © 2012-2021, EarnForex.com |
//|                                     Based on panel by qubbit.com |
//|                                       https://www.earnforex.com/ |
//+------------------------------------------------------------------+
//--

enum KeyboardKeys
{
//#define KEY_LEFT           37
//#define KEY_RIGHT          39
//#define KEY_UP             38
//#define KEY_DOWN           40
//-------------------------------
          KEY_LEFT           = 37,
          KEY_RIGHT          = 39,
          KEY_UP             = 38,
          KEY_DOWN           = 40
//-------------------------------
};

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_ChartPainting
{

public:   //---constructor is privet not to get varible of class
          void          C_ChartPainting::C_ChartPainting()
          {         //
                    if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                    //
          };
          void          C_ChartPainting::~C_ChartPainting() {   };
          //--------------------------------------------------------------
          //----Painting
          bool          C_ChartPainting::IS_Painting;//
          void          C_ChartPainting::EnablePainting();

          string        C_ChartPainting::BrushArrXpx[];
          string        C_ChartPainting::BrushArr[] ;
          color         C_ChartPainting::BrushClrArr[];
          int           C_ChartPainting::BrushClrIndex;
          int           C_ChartPainting::BrushIndex;
          int           C_ChartPainting::draw ;
          //----events
          void          C_ChartPainting::KEYDOWN( const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None");
          void          C_ChartPainting::MOUSE_MOVE(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None");

          //--------------------------------------------------------------


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChartPainting::EnablePainting()
{         if(!IS_Painting)
          {         //-- EnablePainting
                    IS_Painting = true;
                    //-- BlockMouseScroll
                    Dev_Chart_Window.Set_Chart_Mouse_Scroll(false);
                    //-- DisplayInfo
                    //---off--- gLBL_.OBJ.CreateL(0, OBJPREFIX + "ERASE", 0, 5, 15, CORNER_LEFT_LOWER, "Press down to erase", "Arial", 9, COLOR_RED, 0, ANCHOR_LEFT, false, false, true, 0, "\n");
                    //---off---gLBL_.OBJ.CreateL(0, OBJPREFIX + "BRUSHCOLOR", 0, Dev_Chart_Window.ChartMiddleX(), 15, CORNER_LEFT_LOWER, "Press up to change color / Press left to change brush", "Arial", 9, BrushClrArr[BrushClrIndex], 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                    //---off---gLBL_.OBJ.CreateL(0, OBJPREFIX + "BRUSHTYPE", 0, Dev_Chart_Window.ChartMiddleX() + 155, 15, CORNER_LEFT_LOWER, BrushArr[BrushIndex], "Wingdings", 9, BrushClrArr[BrushClrIndex], 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                    //---off---gLBL_.OBJ.CreateL(0, OBJPREFIX + "STOPPAINT", 0, 5, 15, CORNER_RIGHT_LOWER, "Press right to stop drawing", "Arial", 9, COLOR_GREEN, 0, ANCHOR_RIGHT, false, false, true, 0, "\n"); //
          } //
}//
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChartPainting:: KEYDOWN( const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None")
{         //-- BrushType
          if(lparam == KEY_LEFT)
          {         if(IS_Painting)
                    {         BrushIndex++;
                              if(BrushIndex >= ArraySize(BrushArr)) BrushIndex = 0; //---Reset
                              if(ObjectFind(0,  OBJPREFIX + "BRUSHTYPE") >= 0)
                                        ObjectSetString(0, OBJPREFIX + "BRUSHTYPE", OBJPROP_TEXT, 0, BrushArr[BrushIndex]); //Set_Object
                    } //
          }//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //-- StopPainting
          if(lparam == KEY_RIGHT)
          {         //
                    if(IsTesterDebug) {Print("__DEBUG__TESTER__", __FUNCTION__, " ", __LINE__);}
                    //
                    if(IS_Painting)
                    {         IS_Painting = false; //-- DisablePainting
                              //-- DeleteObjects
                              C_STATICSUN::DeleteAnaliseAllObjectName(Capitan_SuperKeyAnaliseAllObject, false, true, OBJPREFIX + "ERASE", __LINE__, FuncCome + __FUNCTION__);
                              C_STATICSUN::DeleteAnaliseAllObjectName(Capitan_SuperKeyAnaliseAllObject, false, true, OBJPREFIX + "BRUSHCOLOR", __LINE__, FuncCome + __FUNCTION__);
                              C_STATICSUN::DeleteAnaliseAllObjectName(Capitan_SuperKeyAnaliseAllObject, false, true, OBJPREFIX + "BRUSHTYPE", __LINE__, FuncCome + __FUNCTION__);
                              C_STATICSUN::DeleteAnaliseAllObjectName(Capitan_SuperKeyAnaliseAllObject, false, true, OBJPREFIX + "STOPPAINT", __LINE__, FuncCome + __FUNCTION__);
                              //-- UnblockMouseScroll
                              Dev_Chart_Window.Set_Chart_Mouse_Scroll(true);//
                    } //
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //-- BrushColor
          if(lparam == KEY_UP)
          {         if(IS_Painting)
                    {         BrushClrIndex++;
                              if(BrushClrIndex >= ArraySize(BrushClrArr))    BrushClrIndex = 0; //---Reset
                              //-- Set_Objects
                              if(ObjectFind(0,  OBJPREFIX + "BRUSHCOLOR") >= 0)
                                        ObjectSetInteger(0, OBJPREFIX + "BRUSHCOLOR", OBJPROP_COLOR, 0, BrushClrArr[BrushClrIndex]);
                              if(ObjectFind(0,  OBJPREFIX + "BRUSHTYPE") >= 0)
                                        ObjectSetInteger(0, OBJPREFIX + "BRUSHTYPE", OBJPROP_COLOR, 0, BrushClrArr[BrushClrIndex]); //
                    }//
          }
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII//
          //OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO//
          //-- DeleteDraws
          if(lparam == KEY_DOWN)
          {         if(IS_Painting)
                    {         if(ObjectsDeleteAll(0, "draw", 0, OBJ_TEXT) > 0)
                                        draw = 0; ///
                    } ///
          }
          //--
}//

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_ChartPainting::MOUSE_MOVE(string FuncCom, const int id, const long & lparam, const double & dparam, const string & sparam, int LineCOM = 0, string FuncCome = "None")
{         //-- UserIsHolding (Left-Click)
          if(sparam == "1")
          {         //-- MoveClient
                    //if(ObjectGetInteger(0, OBJPREFIX + "BCKGRND[]", OBJPROP_SELECTED) || ObjectFind(0, OBJPREFIX + "BCKGRND[]") != 0)
                    //{         //-- MoveObjects
                    //          GetSet_Coordinates();
                    //          ObjectsMoveAll(); //
                    //          }
                    //-- Paint
                    if(IS_Painting)
                    {         //-- GetMousePosition
                              Mouse.mouse_x = (int)lparam;
                              Mouse.mouse_y = (int)dparam;
                              //-- ConvertXYToDatePrice
                              ChartXYToTimePrice(0, Mouse.mouse_x, Mouse.mouse_y, Mouse.mouse_windowssub, Mouse.mouse_datetime, Mouse.mouse_price);
                              //-- CreateObjects
                              //--off--TXT_.OBJ.CreateT(0, "draw" + IntegerToString(draw), 0, Mouse.mouse_datetime, Mouse.mouse_price, BrushArr[BrushIndex], "Wingdings", 10, BrushClrArr[BrushClrIndex], 0, ANCHOR_CENTER, false, false, true, 0, "\n");
                              draw++; //
                    }
                    //--
          }//
}//
//+------------------------------------------------------------------+
//|     Module ~~ GUI ~~ Panels Complete                             |
//+------------------------------------------------------------------+
class C_ChartUTILITIES
{

public:   //---constructor is privet not to get varible of class
          void          C_ChartUTILITIES::C_ChartUTILITIES() {   };
          void          C_ChartUTILITIES::~C_ChartUTILITIES() {   };
          //--------------------------------------------------------------
          C_ChartPainting    C_ChartUTILITIES::ChartPainting;
          //--------------------------------------------------------------


};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|     Module ~~ GUI ~~ Panels Complete                             |
//+------------------------------------------------------------------+
