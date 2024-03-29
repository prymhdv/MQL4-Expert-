//+------------------------------------------------------------------+
//|                                   Trade EA Template for News.mq4 |
//|                                              Copyright 2017, Tor |
//|                                             http://einvestor.ru/ |
//+------------------------------------------------------------------+
//Attention! To work with this Expert Advisor you must add it to the trusted URL https://www.dailyfx.com/ and https://ec.forexprostools.com/
#property copyright "Copyright 2017, Tor"
#property link      "http://einvestor.ru/"
#property version   "1.00"
#property strict
class Ctime_CallenderNews2
{
public:
          Ctime_CallenderNews2(void)
          {         SourceNews = INVEST;
                    LowNews             = true;
                    LowIndentBefore     = 15;
                    LowIndentAfter      = 15;
                    MidleNews           = true;
                    MidleIndentBefore   = 30;
                    MidleIndentAfter    = 30;
                    HighNews            = true;
                    HighIndentBefore    = 60;
                    HighIndentAfter     = 60;
                    NFPNews             = true;
                    NFPIndentBefore     = 180;
                    NFPIndentAfter      = 180;
                    DrawNewsLines        = true;
                    LowColor             = clrGreen;
                    MidleColor           = clrBlue;
                    HighColor            = clrRed;
                    LineWidth            = 1;
                    LineStyle            = STYLE_DOT;
                    OnlySymbolNews       = true;
                    GMTplus              = 3;   // Your Time Zone, GMT (for news)
                    //-------------------------------------------------
                    NewsCount = 0; Now = 0; MinBefore = 0; MinAfter = 0;
                    //-------------------------------------------------
                    UpDateSecounds            = 86400;      // Period news updates in 'seconds every day'
                    Next           = false;      // Draw only the future of news line
                    Signal         = false;      // Signals on the upcoming news
                    //-------------------------------------------------
                    OnInitX();//
                    //-------------------------------------------------
          };
          ~Ctime_CallenderNews2(void) {};
          //--------------------------

          //--------------------------
          enum TypeNS
          {         INVEST = 0, // Investing.com
                    DAILYFX = 1, // Dailyfx.com
                    FOREXPROSTOOLS = 2,//forexprostools
          };

          //--------------------------
          //--- input parameters extern
          string                _comment1               ;// = " ----------- News settings ----------- ";
          TypeNS                SourceNews              ;// = INVEST;
          bool                  LowNews                 ;// = true;
          int                   LowIndentBefore         ;// = 15;
          int                   LowIndentAfter          ;// = 15;
          bool                  MidleNews               ;// = true;
          int                   MidleIndentBefore       ;// = 30;
          int                   MidleIndentAfter        ;// = 30;
          bool                  HighNews                ;// = true;
          int                   HighIndentBefore        ;// = 60;
          int                   HighIndentAfter         ;// = 60;
          bool                  NFPNews                 ;// = true;
          int                   NFPIndentBefore         ;// = 180;
          int                   NFPIndentAfter          ;// = 180;

          bool                  DrawNewsLines           ;// = true;
          color                 LowColor                ;// = clrGreen;
          color                 MidleColor              ;// = clrBlue;
          color                 HighColor               ;// = clrRed;
          int                   LineWidth               ;// = 1;
          ENUM_LINE_STYLE       LineStyle               ;// = STYLE_DOT;
          bool                  OnlySymbolNews          ;// = true;
          int                   GMTplus                 ;// = 3;   // Your Time Zone, GMT (for news)
          //--------------------------
          int                   NewsCount, Now, MinBefore, MinAfter;
          string                NewsArr[4][1000];
          datetime              LastUpDate;
          string                 ValStr;
          int                   UpDateSecounds            ;//= 86400;      // Period news updates in seconds
          bool                  Next           ;//= false;      // Draw only the future of news line
          bool                  Signal         ;//= false;      // Signals on the upcoming news
          datetime              TimeNews[300];
          string                Valuta[300], News[300], Vazn[300];
          //--------------------------
          void  Update(bool b)
          {         if(!b) return;//
                    OnTickX();//
          }
          //--------------------------
          int OnInitX()
          {         //---
                    string v1 = StringSubstr(_Symbol, 0, 3); string v2 = StringSubstr(_Symbol, 3, 3);
                    ValStr = v1 + "," + v2;
                    //---
                    return(INIT_SUCCEEDED); //
          }
          void OnDeinitX(const int reason)
          {         //---
                    Comment("");
                    del("NS_"); //
          }
          //--------------------------
          void OnTickX()
          {         //---
                    string TextDisplay = "";
                    /*  Check News   */
                    bool trade = true;
                    string nstxt = "";
                    int NewsPWR = 0;
                    datetime nextSigTime = 0;
                    if(LowNews || MidleNews || HighNews || NFPNews)
                    {         if(SourceNews == 0)
                              {         // Investing
                                        if(Check_InvestingNews(NewsPWR, nextSigTime)) { trade = false; } // news time
                              }
                              if(SourceNews == 1)
                              {         //DailyFX
                                        if(Check_DailyFXNews(NewsPWR, nextSigTime)) { trade = false; } // news time
                              } //
                              if(SourceNews == 2)
                              {         //https://ec.forexprostools.com/
                                        if(Check_ForexProsToolsNews(NewsPWR, nextSigTime)) { trade = false; } // news time
                              } //
                    }
                    if(trade)
                    {         // No News, Trade enabled
                              nstxt = "No News";
                              if(ObjectFind(0, "NS_Label") != -1) { ObjectDelete(0, "NS_Label"); } //
                    }
                    else  // waiting news , check news power
                    {         color clrT = LowColor;
                              if(NewsPWR > 3)
                              {         nstxt = "Waiting Non-farm Payrolls News";
                                        clrT = HighColor;//
                              }
                              else
                              {         if(NewsPWR > 2)
                                        {         nstxt = "Waiting High News";
                                                  clrT = HighColor;//
                                        }
                                        else
                                        {         if(NewsPWR > 1)
                                                  {         nstxt = "Waiting Midle News";
                                                            clrT = MidleColor; //
                                                  }
                                                  else
                                                  {         nstxt = "Waiting Low News";
                                                            clrT = LowColor;//
                                                  }//
                                        } //
                              }
                              // Make Text Label
                              if(nextSigTime > 0) { nstxt = nstxt + " " + TimeToString(nextSigTime, TIME_MINUTES); }
                              if(ObjectFind(0, "NS_Label") == -1) { LabelCreate(StringConcatenate(nstxt), clrT); }
                              if(ObjectGetInteger(0, "NS_Label", OBJPROP_COLOR) != clrT)   { ObjectDelete(0, "NS_Label");  LabelCreate(StringConcatenate(nstxt), clrT); }//
                    }
                    nstxt = "\n" + nstxt;
                    /*  End Check News   */
                    if(false && IsTradeAllowed() && trade)
                    {         // No news and Trade Allowed
                              ManageTrade(); // Your trade functions
                    }
                    TextDisplay = TextDisplay + nstxt;
                    Comment(TextDisplay);
                    return;//
          }
          //--------------------------
          //--------------------------
          void ManageTrade()
          {         int tkt = 0;
                    if(iOpen(_Symbol, PERIOD_H1, 1) < iClose(_Symbol, PERIOD_H1, 0) && OrdersTotal() < 1)
                    {         tkt = OrderSend(Symbol(), OP_BUY, 0.01, Ask, 2, Ask - 100 * _Point, Ask + 100 * _Point, "", 0, 0, clrBlue); }
                    if(iOpen(_Symbol, PERIOD_H1, 1) > iClose(_Symbol, PERIOD_H1, 0) && OrdersTotal() < 1)
                    {         tkt = OrderSend(Symbol(), OP_SELL, 0.01, Bid, 2, Bid + 100 * _Point, Bid - 100 * _Point, "", 0, 0, clrRed); }
                    return; //
          }
          //--------------------------
          string ReadCBOE()
          {         string cookie = NULL, headers;
                    char post[], result[]; string TXT = "";
                    int res;
                    //--- to work with the server, you must add the URL "https://www.google.com/finance" the list of allowed URL (Main menu-> Tools-> Settings tab "Advisors"):
                    string google_url = "https://ec.forexprostools.com/?columns=exc_currency,exc_importance&importance=1,2,3&calType=week&timeZone=15&lang=1";
                    //---
                    ResetLastError();
                    //--- download html-pages
                    int timeout = 5000; //--- timeout less than 1,000 (1 sec.) is insufficient at a low speed of the Internet
                    res = WebRequest("GET", google_url, cookie, NULL, timeout, post, 0, result, headers);
                    //--- error checking
                    if(res == -1)
                    {         Print("WebRequest error, err.code  =", GetLastError());
                              ///MessageBox("You must add the address 'https://ec.forexprostools.com/' in the list of allowed URL tab 'Advisors' ", " Error ", MB_ICONINFORMATION);
                              Print("You must add the address 'https://ec.forexprostools.com/' in the list of allowed URL tab 'Advisors' ");
                              //--- You must add the address ' "+ google url"' in the list of allowed URL tab 'Advisors' "," Error "
                    }
                    else
                    {         //--- successful download
                              //PrintFormat("File successfully downloaded, the file size in bytes  =%d.",ArraySize(result));
                              //--- save the data in the file
                              int filehandle = FileOpen("QuArtsRoot\\News\\2\\" + "news-log.html", FILE_WRITE | FILE_BIN);
                              //--- проверка ошибки
                              if(filehandle != INVALID_HANDLE)
                              {         //---save the contents of the array result [] in file
                                        FileWriteArray(filehandle, result, 0, ArraySize(result));
                                        //--- close file
                                        FileClose(filehandle);
                                        int filehandle2 = FileOpen("QuArtsRoot\\News\\2\\" + "news-log.html", FILE_READ | FILE_BIN);
                                        TXT = FileReadString(filehandle2, ArraySize(result));
                                        FileClose(filehandle2); //
                              }
                              else
                              {         Print("Error in FileOpen. Error code =", GetLastError()); } //
                    }
                    return(TXT);//
          }
          //--------------------------
          datetime TimeNewsFunck(int nomf)
          {         string s = NewsArr[0][nomf];
                    string time = StringConcatenate(StringSubstr(s, 0, 4), ".", StringSubstr(s, 5, 2), ".", StringSubstr(s, 8, 2), " ", StringSubstr(s, 11, 2), ":", StringSubstr(s, 14, 4));
                    return((datetime)(StringToTime(time) + GMTplus * 3600));//
          }
          void UpdateNews()
          {         string TEXT = ReadCBOE();
                    int sh = StringFind(TEXT, "pageStartAt>") + 12;
                    int sh2 = StringFind(TEXT, "</tbody>");
                    TEXT = StringSubstr(TEXT, sh, sh2 - sh);
                    sh = 0;
                    while(!IsStopped())
                    {         sh = StringFind(TEXT, "event_timestamp", sh) + 17;
                              sh2 = StringFind(TEXT, "onclick", sh) - 2;
                              if(sh < 17 || sh2 < 0)break;
                              //
                              NewsArr[0][NewsCount] = StringSubstr(TEXT, sh, sh2 - sh);
                              sh = StringFind(TEXT, "flagCur", sh) + 10;
                              sh2 = sh + 3;
                              if(sh < 10 || sh2 < 3)break;
                              //
                              NewsArr[1][NewsCount] = StringSubstr(TEXT, sh, sh2 - sh);
                              if(OnlySymbolNews && StringFind(ValStr, NewsArr[1][NewsCount]) < 0)continue;
                              //
                              sh = StringFind(TEXT, "title", sh) + 7;
                              sh2 = StringFind(TEXT, "Volatility", sh) - 1;
                              if(sh < 7 || sh2 < 0)break;
                              //
                              NewsArr[2][NewsCount] = StringSubstr(TEXT, sh, sh2 - sh);
                              if(StringFind(NewsArr[2][NewsCount], "High") >= 0 && !HighNews)continue;
                              //
                              if(StringFind(NewsArr[2][NewsCount], "Moderate") >= 0 && !MidleNews)continue;
                              //
                              if(StringFind(NewsArr[2][NewsCount], "Low") >= 0 && !LowNews)continue;
                              //
                              sh = StringFind(TEXT, "left event", sh) + 12;
                              int sh1 = StringFind(TEXT, "Speaks", sh);
                              sh2 = StringFind(TEXT, "<", sh);
                              if(sh < 12 || sh2 < 0)break;
                              //
                              if(sh1 < 0 || sh1 > sh2)NewsArr[3][NewsCount] = StringSubstr(TEXT, sh, sh2 - sh);
                              else NewsArr[3][NewsCount] = StringSubstr(TEXT, sh, sh1 - sh);
                              NewsCount++;
                              if(NewsCount == 300)break;
                              //
                    } //
          }
          int del(string name) // Спец. ф-ия deinit()
          {         for(int n = ObjectsTotal() - 1; n >= 0; n--)
                    {         string Obj_Name = ObjectName(n);
                              if(StringFind(Obj_Name, name, 0) != -1)
                              {         ObjectDelete(Obj_Name); } }
                    return 0;                                      // Выход из deinit()
          }
          bool Check_InvestingNews(int &pwr, datetime &mintime)
          {         bool CheckNews = false; pwr = 0; int maxPower = 0;
                    if(LowNews || MidleNews || HighNews || NFPNews)
                    {         //Control every day secound
                              if(TimeCurrent() - LastUpDate >= UpDateSecounds)
                              {         Print("Investing.com News Loading...");
                                        UpdateNews();
                                        LastUpDate = TimeCurrent();
                                        Comment(""); //
                              }
                              //WindowRedraw();
                              //---Draw a line on the chart news--------------------------------------------
                              if(DrawNewsLines)
                              {         for(int i = 0; i < NewsCount; i++)
                                        {         string Name = StringSubstr("NS_" + TimeToStr(TimeNewsFunck(i), TIME_MINUTES) + "_" + NewsArr[1][i] + "_" + NewsArr[3][i], 0, 63);
                                                  if(NewsArr[3][i] != "")if(ObjectFind(Name) == 0)continue;
                                                  if(OnlySymbolNews && StringFind(ValStr, NewsArr[1][i]) < 0)continue;
                                                  if(TimeNewsFunck(i) < TimeCurrent() && Next)continue;
                                                  color clrf = clrNONE;
                                                  if(HighNews && StringFind(NewsArr[2][i], "High") >= 0)clrf = HighColor;
                                                  if(MidleNews && StringFind(NewsArr[2][i], "Moderate") >= 0)clrf = MidleColor;
                                                  if(LowNews && StringFind(NewsArr[2][i], "Low") >= 0)clrf = LowColor;
                                                  if(clrf == clrNONE)continue;
                                                  if(NewsArr[3][i] != "")
                                                  {         ObjectCreate(0, Name, OBJ_VLINE, 0, TimeNewsFunck(i), 0);
                                                            ObjectSet(Name, OBJPROP_COLOR, clrf);
                                                            ObjectSet(Name, OBJPROP_STYLE, LineStyle);
                                                            ObjectSetInteger(0, Name, OBJPROP_WIDTH, LineWidth);
                                                            ObjectSetInteger(0, Name, OBJPROP_BACK, true); //
                                                  }//
                                        } //
                              }
                              //---------------event Processing------------------------------------
                              int ii;
                              CheckNews = false;
                              for(ii = 0; ii < NewsCount; ii++)
                              {         int power = 0;
                                        if(HighNews && StringFind(NewsArr[2][ii], "High") >= 0) { power = 3; MinBefore = HighIndentBefore; MinAfter = HighIndentAfter; }
                                        if(MidleNews && StringFind(NewsArr[2][ii], "Moderate") >= 0) { power = 2; MinBefore = MidleIndentBefore; MinAfter = MidleIndentAfter; }
                                        if(LowNews && StringFind(NewsArr[2][ii], "Low") >= 0) { power = 1; MinBefore = LowIndentBefore; MinAfter = LowIndentAfter; }
                                        if(NFPNews && StringFind(NewsArr[3][ii], "Nonfarm Payrolls") >= 0) { power = 4; MinBefore = NFPIndentBefore; MinAfter = NFPIndentAfter; }
                                        if(power == 0)continue;
                                        if(TimeCurrent() + MinBefore * 60 > TimeNewsFunck(ii) && TimeCurrent() - MinAfter * 60 < TimeNewsFunck(ii) && (!OnlySymbolNews || (OnlySymbolNews && StringFind(ValStr, NewsArr[1][ii]) >= 0)))
                                        {         if(power > maxPower) {   maxPower = power; mintime = TimeNewsFunck(ii); } }
                                        else
                                        {         CheckNews = false; } }
                              if(maxPower > 0) { CheckNews = true; } }
                    pwr = maxPower;
                    return(CheckNews); //
          }
          bool LabelCreate(const string text = "Label", const color clr = clrRed)
          {         long x_distance;  long y_distance; long chart_ID = 0;  string name = "NS_Label"; int sub_window = 0;
                    ENUM_BASE_CORNER  corner = CORNER_LEFT_UPPER;
                    string font = "Arial"; int font_size = 28; double angle = 0.0; ENUM_ANCHOR_POINT anchor = ANCHOR_LEFT_UPPER;
                    bool back = false; bool selection = false;  bool hidden = true;  long z_order = 0;
                    //--- определим размеры окна
                    ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0, x_distance);
                    ChartGetInteger(0, CHART_HEIGHT_IN_PIXELS, 0, y_distance);
                    ResetLastError();
                    if(!ObjectCreate(chart_ID, name, OBJ_LABEL, sub_window, 0, 0))   { Print(__FUNCTION__, ": failed to create text label! Error code = ", GetLastError());   return(false); }
                    ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, (int)(x_distance / 2.7));
                    ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, (int)(y_distance / 1.5));
                    ObjectSetInteger(chart_ID, name, OBJPROP_CORNER, corner);
                    ObjectSetString(chart_ID, name, OBJPROP_TEXT, text);
                    ObjectSetString(chart_ID, name, OBJPROP_FONT, font);
                    ObjectSetInteger(chart_ID, name, OBJPROP_FONTSIZE, font_size);
                    ObjectSetDouble(chart_ID, name, OBJPROP_ANGLE, angle);
                    ObjectSetInteger(chart_ID, name, OBJPROP_ANCHOR, anchor);
                    ObjectSetInteger(chart_ID, name, OBJPROP_COLOR, clr);
                    ObjectSetInteger(chart_ID, name, OBJPROP_BACK, back);
                    ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, selection);
                    ObjectSetInteger(chart_ID, name, OBJPROP_SELECTED, selection);
                    ObjectSetInteger(chart_ID, name, OBJPROP_HIDDEN, hidden);
                    ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, z_order);
                    return(true);//
          }
          void UpdateDFX()
          {         //-------------------------------------------------------------------
                    string DF = ""; string MF = "";
                    int DeltaGMT = GMTplus; // 0 -(TimeGMTOffset()/60/60)-DeltaTime;
                    int ChasPoyasServera = DeltaGMT;
                    datetime NowTimeD1 = Time[0];
                    datetime LastSunday = NowTimeD1 - TimeDayOfWeek(NowTimeD1) * 86399;
                    int DayFile = TimeDay(LastSunday);
                    if(DayFile < 10) DF = "0" + (string)DayFile;
                    else DF = (string)DayFile;
                    int MonthFile = TimeMonth(LastSunday);
                    if(MonthFile < 10) MF = "0" + (string)MonthFile;
                    else MF = (string)MonthFile;
                    int YearFile = TimeYear(LastSunday);
                    string DateFile = MF + "-" + DF + "-" + (string)YearFile;
                    string FileName = DateFile + "_dfx.csv";
                    //-------------------------------------------------------------------
                    int handle;
                    if(!FileIsExist(FileName))
                    {         string url = "https://www.dailyfx.com/files/Calendar-" + DateFile + ".csv";//https://ec.forexprostools.com/
                              string cookie = NULL, headers;
                              char post[], result[];
                              string TXT = "";
                              int res;
                              string text = "";
                              ResetLastError();
                              int timeout = 5000;
                              res = WebRequest("GET", url, cookie, NULL, timeout, post, 0, result, headers);
                              if(res == -1)
                              {         Print("WebRequest error, err.code  =", GetLastError());
                                        MessageBox("You must add the address 'https://www.dailyfx.com/' in the list of allowed URL tab 'Advisors' ", " Error ", MB_ICONINFORMATION);//
                              }
                              else
                              {         int filehandle = FileOpen("QuArtsRoot\\News\\2\\" + FileName, FILE_WRITE | FILE_BIN);
                                        if(filehandle != INVALID_HANDLE)
                                        {         FileWriteArray(filehandle, result, 0, ArraySize(result));
                                                  FileClose(filehandle); //
                                        }
                                        else
                                        {         Print("Error in FileOpen. Error code =", GetLastError()); //
                                        } //
                              } //
                    }
                    handle = FileOpen("QuArtsRoot\\News\\2\\" + FileName, FILE_READ | FILE_CSV);
                    string data, time, month, valuta;
                    int startStr = 0;
                    if(handle != INVALID_HANDLE)
                    {         while(!FileIsEnding(handle))
                              {         int str_size = FileReadInteger(handle, INT_VALUE);
                                        string str = FileReadString(handle, str_size);
                                        string value[10];
                                        int k = StringSplit(str, StringGetCharacter(",", 0), value);
                                        data = value[0];
                                        time = value[1]; if(time == "") { continue; }
                                        month = StringSubstr(data, 4, 3);
                                        if(month == "Jan") month = "01";
                                        if(month == "Feb") month = "02";
                                        if(month == "Mar") month = "03";
                                        if(month == "Apr") month = "04";
                                        if(month == "May") month = "05";
                                        if(month == "Jun") month = "06";
                                        if(month == "Jul") month = "07";
                                        if(month == "Aug") month = "08";
                                        if(month == "Sep") month = "09";
                                        if(month == "Oct") month = "10";
                                        if(month == "Nov") month = "11";
                                        if(month == "Dec") month = "12";
                                        TimeNews[startStr] = StrToTime((string)YearFile + "." + month + "." + StringSubstr(data, 8, 2) + " " + time) + ChasPoyasServera * 3600;
                                        valuta = value[3];
                                        if(valuta == "eur" || valuta == "EUR")Valuta[startStr] = "EUR";
                                        if(valuta == "usd" || valuta == "USD")Valuta[startStr] = "USD";
                                        if(valuta == "jpy" || valuta == "JPY")Valuta[startStr] = "JPY";
                                        if(valuta == "gbp" || valuta == "GBP")Valuta[startStr] = "GBP";
                                        if(valuta == "chf" || valuta == "CHF")Valuta[startStr] = "CHF";
                                        if(valuta == "cad" || valuta == "CAD")Valuta[startStr] = "CAD";
                                        if(valuta == "aud" || valuta == "AUD")Valuta[startStr] = "AUD";
                                        if(valuta == "nzd" || valuta == "NZD")Valuta[startStr] = "NZD";
                                        News[startStr] = value[4];
                                        News[startStr] = StringSubstr(News[startStr], 0, 60);
                                        Vazn[startStr] = value[5];
                                        if(Vazn[startStr] != "High" && Vazn[startStr] != "HIGH" && Vazn[startStr] != "Medium" && Vazn[startStr] != "MEDIUM" && Vazn[startStr] != "MED" && Vazn[startStr] != "Low" && Vazn[startStr] != "LOW")Vazn[startStr] = FileReadString(handle);
                                        startStr++;//
                              } //
                    }
                    else
                    {         PrintFormat("Error in FileOpen = %s. Error code= %d", FileName, GetLastError()); }
                    NewsCount = startStr - 1;
                    FileClose(handle);//
          }
          bool Check_DailyFXNews(int &pwr, datetime &mintime)
          {         bool CheckNews = false; pwr = 0; int maxPower = 0; color clrf = clrNONE; mintime = 0;
                    //=====================================================================================
                    if(LowNews || MidleNews || HighNews || NFPNews)
                    {         if(Time[0] - LastUpDate >= UpDateSecounds)
                              {         Print("News DailyFX Loading...");
                                        UpdateDFX();
                                        LastUpDate = Time[0];//
                              }
                              //WindowRedraw();
                              //---Draw a line on the chart news--------------------------------------------
                              if(DrawNewsLines)
                              {         for(int i = 0; i < NewsCount; i++)
                                        {         string Lname = StringSubstr("NS_" + TimeToStr(TimeNews[i], TIME_MINUTES) + "_" + News[i], 0, 63);
                                                  if(News[i] != "")if(ObjectFind(0, Lname) == 0) {  continue; }
                                                  if(TimeNews[i] < TimeCurrent() && Next) { continue; }
                                                  if((Vazn[i] == "High" || Vazn[i] == "HIGH") && HighNews == false) { continue; }
                                                  if((Vazn[i] == "Medium" || Vazn[i] == "MEDIUM" || Vazn[i] == "MED") && MidleNews == false) { continue; }
                                                  if((Vazn[i] == "Low" || Vazn[i] == "LOW") && LowNews == false) { continue; }
                                                  if(Vazn[i] == "High" || Vazn[i] == "HIGH") { clrf = HighColor; }
                                                  if(Vazn[i] == "Medium" || Vazn[i] == "MEDIUM" || Vazn[i] == "MED") { clrf = MidleColor; }
                                                  if(Vazn[i] == "Low" || Vazn[i] == "LOW") { clrf = LowColor; }
                                                  if(News[i] != "" && ObjectFind(0, Lname) < 0)
                                                  {         if(OnlySymbolNews && (Valuta[i] != StringSubstr(_Symbol, 0, 3) && Valuta[i] != StringSubstr(_Symbol, 3, 3))) { continue; }
                                                            ObjectCreate(0, Lname, OBJ_VLINE, 0, TimeNews[i], 0);
                                                            ObjectSet(Lname, OBJPROP_COLOR, clrf);
                                                            ObjectSet(Lname, OBJPROP_STYLE, LineStyle);
                                                            ObjectSetInteger(0, Lname, OBJPROP_WIDTH, LineWidth);
                                                            ObjectSetInteger(0, Lname, OBJPROP_BACK, true); } //
                                        } //
                              }
                              //---------------event Processing------------------------------------
                              for(int i = 0; i < NewsCount; i++)
                              {         int power = 0;
                                        if(HighNews && (Vazn[i] == "High" || Vazn[i] == "HIGH")) { power = 3; MinBefore = HighIndentBefore; MinAfter = HighIndentAfter; }
                                        if(MidleNews && (Vazn[i] == "Medium" || Vazn[i] == "MEDIUM" || Vazn[i] == "MED")) { power = 2; MinBefore = MidleIndentBefore; MinAfter = MidleIndentAfter; }
                                        if(LowNews && (Vazn[i] == "Low" || Vazn[i] == "LOW")) { power = 1; MinBefore = LowIndentBefore; MinAfter = LowIndentAfter; }
                                        if(NFPNews && StringFind(News[i], "Non-farm Payrolls") >= 0) { power = 4; MinBefore = NFPIndentBefore; MinAfter = NFPIndentAfter; }
                                        if(power == 0)continue;
                                        if(TimeCurrent() + MinBefore * 60 > TimeNews[i] && TimeCurrent() - MinAfter * 60 < TimeNews[i] && (!OnlySymbolNews || (OnlySymbolNews && (StringSubstr(Symbol(), 0, 3) == Valuta[i] || StringSubstr(Symbol(), 3, 3) == Valuta[i]))))
                                        {         if(power > maxPower) { maxPower = power; mintime = TimeNews[i]; } }
                                        else
                                        {         CheckNews = false; } //
                              }
                              if(maxPower > 0) { CheckNews = true; } //
                    }
                    //=====================================================================================
                    pwr = maxPower;
                    return(CheckNews); //
          }
          void UpdateFPT()
          {         //-------------------------------------------------------------------
                    string DF = ""; string MF = "";
                    int DeltaGMT = GMTplus; // 0 -(TimeGMTOffset()/60/60)-DeltaTime;
                    int ChasPoyasServera = DeltaGMT;
                    datetime NowTimeD1 = Time[0];
                    datetime LastSunday = NowTimeD1 - TimeDayOfWeek(NowTimeD1) * 86399;
                    int DayFile = TimeDay(LastSunday);
                    if(DayFile < 10) DF = "0" + (string)DayFile;
                    else DF = (string)DayFile;
                    int MonthFile = TimeMonth(LastSunday);
                    if(MonthFile < 10) MF = "0" + (string)MonthFile;
                    else MF = (string)MonthFile;
                    int YearFile = TimeYear(LastSunday);
                    string DateFile = MF + "-" + DF + "-" + (string)YearFile;
                    string FileName = DateFile + "_dfx.csv";
                    //-------------------------------------------------------------------
                    {         string cookie = NULL, headers;
                              char post[], result[];
                              int res;
                              //--- to enable access to the server, you should add URL "https://www.google.com/finance"
                              //--- in the list of allowed URLs (Main Menu->Tools->Options, tab "Expert Advisors"):
                              string google_url = "https://www.google.com/finance";
                              //--- Reset the last error code
                              ResetLastError();
                              //--- Loading a html page from Google Finance
                              int timeout = 5000; //--- Timeout below 1000 (1 sec.) is not enough for slow Internet connection
                              res = WebRequest("GET", google_url, cookie, NULL, timeout, post, 0, result, headers);
                              //--- Checking errors
                              if(res == -1)
                              {         Print("Error in WebRequest. Error code  =", GetLastError());
                                        //--- Perhaps the URL is not listed, display a message about the necessity to add the address
                                        MessageBox("Add the address '" + google_url + "' in the list of allowed URLs on tab 'Expert Advisors'", "Error", MB_ICONINFORMATION); }
                              else
                              {         //--- Load successfully
                                        PrintFormat("The file has been successfully loaded, File size =%d bytes.", ArraySize(result));
                                        //--- Save the data to a file
                                        int filehandle = FileOpen("GoogleFinance.htm", FILE_WRITE | FILE_BIN);
                                        //--- Checking errors
                                        if(filehandle != INVALID_HANDLE)
                                        {         //--- Save the contents of the result[] array to a file
                                                  FileWriteArray(filehandle, result, 0, ArraySize(result));
                                                  //--- Close the file
                                                  FileClose(filehandle); }
                                        else Print("Error in FileOpen. Error code=", GetLastError()); } //
                    }
                    //-------------------------------------------------------------------
                    int handle;
                    if(!FileIsExist(FileName))
                    {         string url = "https://www.google.com/finance";//https://ec.forexprostools.com/
                              string cookie = NULL, headers;
                              char post[], result[];
                              string TXT = "";
                              int res;
                              string text = "";
                              ResetLastError();
                              int timeout = 5000;
                              res = WebRequest("GET", url, cookie, NULL, timeout, post, 0, result, headers);
                              if(res == -1)
                              {         Print("WebRequest error, err.code  =", GetLastError());
                                        MessageBox("You must add the address 'https://www.dailyfx.com/' in the list of allowed URL tab 'Advisors' ", " Error ", MB_ICONINFORMATION);//
                              }
                              else
                              {         int filehandle = FileOpen("QuArtsRoot\\News\\2\\" + FileName, FILE_WRITE | FILE_BIN);
                                        if(filehandle != INVALID_HANDLE)
                                        {         FileWriteArray(filehandle, result, 0, ArraySize(result));
                                                  FileClose(filehandle); //
                                        }
                                        else
                                        {         Print("Error in FileOpen. Error code =", GetLastError()); //
                                        } //
                              } //
                    }
                    handle = FileOpen("QuArtsRoot\\News\\2\\" + FileName, FILE_READ | FILE_CSV);
                    string data, time, month, valuta;
                    int startStr = 0;
                    if(handle != INVALID_HANDLE)
                    {         while(!FileIsEnding(handle))
                              {         int str_size = FileReadInteger(handle, INT_VALUE);
                                        string str = FileReadString(handle, str_size);
                                        string value[10];
                                        int k = StringSplit(str, StringGetCharacter(",", 0), value);
                                        data = value[0];
                                        time = value[1]; if(time == "") { continue; }
                                        month = StringSubstr(data, 4, 3);
                                        if(month == "Jan") month = "01";
                                        if(month == "Feb") month = "02";
                                        if(month == "Mar") month = "03";
                                        if(month == "Apr") month = "04";
                                        if(month == "May") month = "05";
                                        if(month == "Jun") month = "06";
                                        if(month == "Jul") month = "07";
                                        if(month == "Aug") month = "08";
                                        if(month == "Sep") month = "09";
                                        if(month == "Oct") month = "10";
                                        if(month == "Nov") month = "11";
                                        if(month == "Dec") month = "12";
                                        TimeNews[startStr] = StrToTime((string)YearFile + "." + month + "." + StringSubstr(data, 8, 2) + " " + time) + ChasPoyasServera * 3600;
                                        valuta = value[3];
                                        if(valuta == "eur" || valuta == "EUR")Valuta[startStr] = "EUR";
                                        if(valuta == "usd" || valuta == "USD")Valuta[startStr] = "USD";
                                        if(valuta == "jpy" || valuta == "JPY")Valuta[startStr] = "JPY";
                                        if(valuta == "gbp" || valuta == "GBP")Valuta[startStr] = "GBP";
                                        if(valuta == "chf" || valuta == "CHF")Valuta[startStr] = "CHF";
                                        if(valuta == "cad" || valuta == "CAD")Valuta[startStr] = "CAD";
                                        if(valuta == "aud" || valuta == "AUD")Valuta[startStr] = "AUD";
                                        if(valuta == "nzd" || valuta == "NZD")Valuta[startStr] = "NZD";
                                        News[startStr] = value[4];
                                        News[startStr] = StringSubstr(News[startStr], 0, 60);
                                        Vazn[startStr] = value[5];
                                        if(Vazn[startStr] != "High" && Vazn[startStr] != "HIGH" && Vazn[startStr] != "Medium" && Vazn[startStr] != "MEDIUM" && Vazn[startStr] != "MED" && Vazn[startStr] != "Low" && Vazn[startStr] != "LOW")Vazn[startStr] = FileReadString(handle);
                                        startStr++;//
                              } //
                    }
                    else
                    {         PrintFormat("Error in FileOpen = %s. Error code= %d", FileName, GetLastError()); }
                    NewsCount = startStr - 1;
                    FileClose(handle);//
          }
          bool Check_ForexProsToolsNews(int &pwr, datetime &mintime)
          {         //
                    bool CheckNews = false; pwr = 0; int maxPower = 0; color clrf = clrNONE; mintime = 0;
                    //=====================================================================================
                    if(LowNews || MidleNews || HighNews || NFPNews)
                    {         if(Time[0] - LastUpDate >= UpDateSecounds)
                              {         Print("News ForexProsTools Loading...");
                                        UpdateFPT();
                                        LastUpDate = Time[0];//
                              }
                              //WindowRedraw();
                              //---Draw a line on the chart news--------------------------------------------
                              if(DrawNewsLines)
                              {         for(int i = 0; i < NewsCount; i++)
                                        {         string Lname = StringSubstr("NS_" + TimeToStr(TimeNews[i], TIME_MINUTES) + "_" + News[i], 0, 63);
                                                  if(News[i] != "")if(ObjectFind(0, Lname) == 0) {  continue; }
                                                  if(TimeNews[i] < TimeCurrent() && Next) { continue; }
                                                  if((Vazn[i] == "High" || Vazn[i] == "HIGH") && HighNews == false) { continue; }
                                                  if((Vazn[i] == "Medium" || Vazn[i] == "MEDIUM" || Vazn[i] == "MED") && MidleNews == false) { continue; }
                                                  if((Vazn[i] == "Low" || Vazn[i] == "LOW") && LowNews == false) { continue; }
                                                  if(Vazn[i] == "High" || Vazn[i] == "HIGH") { clrf = HighColor; }
                                                  if(Vazn[i] == "Medium" || Vazn[i] == "MEDIUM" || Vazn[i] == "MED") { clrf = MidleColor; }
                                                  if(Vazn[i] == "Low" || Vazn[i] == "LOW") { clrf = LowColor; }
                                                  if(News[i] != "" && ObjectFind(0, Lname) < 0)
                                                  {         if(OnlySymbolNews && (Valuta[i] != StringSubstr(_Symbol, 0, 3) && Valuta[i] != StringSubstr(_Symbol, 3, 3))) { continue; }
                                                            ObjectCreate(0, Lname, OBJ_VLINE, 0, TimeNews[i], 0);
                                                            ObjectSet(Lname, OBJPROP_COLOR, clrf);
                                                            ObjectSet(Lname, OBJPROP_STYLE, LineStyle);
                                                            ObjectSetInteger(0, Lname, OBJPROP_WIDTH, LineWidth);
                                                            ObjectSetInteger(0, Lname, OBJPROP_BACK, true); } //
                                        } //
                              }
                              //---------------event Processing------------------------------------
                              for(int i = 0; i < NewsCount; i++)
                              {         int power = 0;
                                        if(HighNews && (Vazn[i] == "High" || Vazn[i] == "HIGH")) { power = 3; MinBefore = HighIndentBefore; MinAfter = HighIndentAfter; }
                                        if(MidleNews && (Vazn[i] == "Medium" || Vazn[i] == "MEDIUM" || Vazn[i] == "MED")) { power = 2; MinBefore = MidleIndentBefore; MinAfter = MidleIndentAfter; }
                                        if(LowNews && (Vazn[i] == "Low" || Vazn[i] == "LOW")) { power = 1; MinBefore = LowIndentBefore; MinAfter = LowIndentAfter; }
                                        if(NFPNews && StringFind(News[i], "Non-farm Payrolls") >= 0) { power = 4; MinBefore = NFPIndentBefore; MinAfter = NFPIndentAfter; }
                                        if(power == 0)continue;
                                        if(TimeCurrent() + MinBefore * 60 > TimeNews[i] && TimeCurrent() - MinAfter * 60 < TimeNews[i] && (!OnlySymbolNews || (OnlySymbolNews && (StringSubstr(Symbol(), 0, 3) == Valuta[i] || StringSubstr(Symbol(), 3, 3) == Valuta[i]))))
                                        {         if(power > maxPower) { maxPower = power; mintime = TimeNews[i]; } }
                                        else
                                        {         CheckNews = false; } //
                              }
                              if(maxPower > 0) { CheckNews = true; } //
                    }
                    //=====================================================================================
                    pwr = maxPower;
                    return(CheckNews); //
          }
          //--------------------------
};
//+------------------------------------------------------------------+
