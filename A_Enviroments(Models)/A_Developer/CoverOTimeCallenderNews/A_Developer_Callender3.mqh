//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2018, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CINetDownload
{

protected:
          string mPath;
          int    mTimeout;
          string mResponse;
          int    mError;
          //-----------------------------
public:
          CINetDownload()
          {         CINetDownload("", 10000); //
          };

          CINetDownload(string path, int timeout)
          {         Path(path); Timeout(timeout);//
          };
          ~CINetDownload() {};

          //Propertise
          void Path(string value)        {       mPath = value;         }
          string Path()                  {       return(mPath);         }

          void Timeout(int value)        {       mTimeout = value;      }
          int  Timeout()                 {       return(mTimeout);      }

          // Read Only Propertise
          int    Error()                 {       return(mError);        }
          string Response()              {       return(mResponse);     }

          //methods
          bool   Download(string url, string fileName)
          {         string        filePath = Path() + fileName;
                    string        cookie   = NULL;
                    string        referer  = NULL;
                    int           timeout  = Timeout();
                    char          data[];
                    char          response[];
                    string        headers;
                    //
                    mResponse = "";
                    //-----------------------------------------
                    ResetLastError();
                    //-----------------------------------------
                    int result = WebRequest("GET", url, cookie, referer, timeout, data, 0, response, headers); //
                    //-----------------------------------------
                    if(result < 0)
                    {         mError = GetLastError();
                              PrintFormat("%s error %i downloading from %s", __FUNCTION__, mError, url);
                              return(false); //
                    }
                    mResponse = CharArrayToString(response);
                    //-----------------------------------------
                    FileDelete(filePath);//
                    int handel = FileOpen(filePath, FILE_WRITE | FILE_BIN);
                    if(handel == INVALID_HANDLE)
                    {         mError = GetLastError();
                              PrintFormat("%s error %i opennig file %s", __FUNCTION__, mError, filePath);
                              return(false);//
                    }
                    //-----------------------------------------
                    FileWriteArray(handel, response, 0, ArraySize(response));
                    FileFlush(handel); FileClose(handel);//
                    //-----------------------------------------
                    return(true);//
          }
          string  LoadFile(string fileName)
          {         //-----------------------------------------
                    string filePath = Path() + fileName;
                    string responseFile2 = "";
                    //Print("LoadFile filePath:", filePath + "fn:" + fileName);
                    if(FileIsExist(filePath) )//&& !IsConnected()
                    {         //
                              // mResponse =
                              //Print("LoadFile filePath:", filePath);
                              char      responseFile[];
                              ResetLastError();
                              int       handel          = FileOpen(filePath, FILE_READ | FILE_BIN);
                              if(handel == INVALID_HANDLE)  { Print("Operation FileOpen failed, error ", ErrorDescription(GetLastError()));      }
                              ResetLastError();
                              uint size = FileReadArray(handel, responseFile, 0, WHOLE_ARRAY); //
                              if(size == 0) { Print("Operation FileReadArray failed, error ", ErrorDescription(GetLastError()));      }
                              responseFile2 = FileReadString(handel); //
                              FileClose(handel);//
                              //Print("-read file char---", CharArrayToString(responseFile), " hi ", responseFile2, " ", ErrorDescription(GetLastError()), "    ", filePath); //
                              return CharArrayToString(responseFile);//
                              //
                    } //
                    return NULL;//
          }


};
struct SDDEvent
{         string        title;
          string        country;
          datetime      time;
          string        impact;
          string        forecast;
          string        previous;//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CFFCalendarDownlaod : public CINetDownload
{
protected:
          void  ParseResponse(string TxtToParse)
          {         string lines[];
                    string   columns[];
                    int size = StringSplit(TxtToParse, '\n', lines);//TxtToParse==mResponse
                    //-----------------------------
                    Count = size - 1; // headerless
                    ArrayResize(Events, Count); //
                    string dateParts[];
                    string timeParts[];
                    for(int i = 0; i < Count; i++)
                    {         //
                              /**/#ifdef  __MQL4__ StringSplit(StringTrimLeft(StringTrimRight(lines[i + 1])), ',', columns); #endif
                              /**/#ifdef  __MQL5__ StringTrimRight(lines[i + 1]); StringTrimLeft(lines[i + 1]); StringSplit(lines[i + 1], ',', columns); #endif
                              //----------------------------- some items are simple strings
                              Events[i].title   = columns[0];
                              Events[i].country = columns[1];
                              Events[i].impact  = columns[4];
                              //-----------------------------
                              // Date and time are stored sepratly and not format // Easy to convert
                              // Togegether stored as MM-DD-YYYY HH:MM(am/pm)
                              // Who write dates with the month frist? What kind of order is that?
                              // Frist break up the date and time into parts
                              StringSplit(columns[2], '-', dateParts);
                              StringSplit(columns[3], ':', timeParts);
                              //Converting am/pm to 24h must deal with 12 witch should be 00
                              if(timeParts[0] == "12")
                              {         timeParts[0] = "00";        } //
                              //Now if pm just add 12 hours
                              if(StringSubstr(timeParts[1], 2, 1) == "p")
                              {         timeParts[0] =  IntegerToString(StringToInteger(timeParts[0]) + 12);} //
                              //Then take only the frist 2 characters from the minutes (remove the am/pm part)
                              timeParts[1] = StringSubstr(timeParts[1], 0, 2);
                              // Join it back together as YYYY.MM.DD HH:MM
                              string    timeString = dateParts[2] + "." + dateParts[0] + "." + dateParts[1] + " " + timeParts[0] + ":" + timeParts[1];
                              Events[i].time = StringToTime(timeString) + (TimeLocal() - TimeGMT() - PeriodSeconds(PERIOD_M1) * 30); //+3:30 diff ///+3:00 currect time place
                              //Print("TimeGMT(): ", TimeGMT(), "   ", "TimeLocal() - TimeGMT():  ", TimeLocal() - TimeGMT());// 12: 11: 30 + 3: 30 tehran time 15: 42
                              //-----------------------------
                              // Values in forecast and previous may be in diffrent formats
                              // %, K , M , B <x, <x, or even n-n-n for voting
                              // So I thought it best here to just save the string
                              Events[i].forecast = columns[5];
                              Events[i].previous = columns[6];//
                              //-----------------------------
                    }//
          }
public:

          CFFCalendarDownlaod()                         : CINetDownload() {};
          CFFCalendarDownlaod(string path, int timeout) : CINetDownload(path, timeout) {this.Path(path); };// + "\\calendar.csv"//not call parrent //when not say this it gone parent varible select
          ~CFFCalendarDownlaod() {};
          //-----------------------------
          //Propertise
          SDDEvent    Events[];
          int         Count;//
          //Methods
          //Download(url,fileName) from parent still works
          bool  Download(string fileName)
          {         ArrayResize(Events, 0); //reset
                    //-----------------------------
                    {         string url          = "https://nfs.faireconomy.media/ff_calendar_thisweek.csv";
                              bool   result       = CINetDownload::Download(url, fileName);
                              if(!result)                  { return(false);  }//
                              //-----------------------------
                              ParseResponse(CINetDownload::Response());
                              return true;//
                              //-----------------------------
                    }//
                    return false;//
          }
          bool LoadParse(string fileName)
          {         //Print("LoadParse filePath:", this.Path(), "  fileName: ", fileName);
                    if(FileIsExist(this.Path() + fileName))
                    {         ParseResponse(CINetDownload::LoadFile(fileName));
                              //Print("LoadParse File Existed: " + this.Path() + fileName, " Count: ", Count);
                              return true; //
                    } //
                    return false;//
          }
          //

};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Ctime_CallenderNews3
{
public:
          Ctime_CallenderNews3(void) {UpDateSecounds = 86400; IsFristrun = false;};
          ~Ctime_CallenderNews3(void) {};
          void Update(bool b)
          {         if(!b)return;
                    //------------
                    Initer2(b);//
          }
          //
          int UpDateSecounds;//= 86400;
          datetime LastUpDate;
          Cgs_DevObjectPack Object_Pack;
          void Initer()
          {         CINetDownload *downloader     = new CINetDownload("QuArtsRoot\\News\\3", 10000);
                    bool          success         = downloader.Download("https://nfs.faireconomy.media/ff_calendar_thisweek.csv", "calendar.csv");
                    string        response        = downloader.Response();
                    int           error           = 0;
                    //-------------------------------
                    if(!success)
                    {         PrintFormat("failed to download");
                              error = downloader.Error(); // Not doing anything with this, just demnonstration
                    }
                    else
                    {         string lines[];
                              string   columns[];
                              int size = StringSplit(response, '\n', lines);//count of   line in csv file  --- set lines by seprator every detected seprator
                              //-------------------------------
                              for(int i = 1; i < size; i++)//0 is heder line
                              {         //
                                        StringSplit(lines[i], ',', columns); //count of columns in one line of csv file
                                        PrintFormat("Title=%s, Country=%s, Date=%s , Time=%s, Impact=%s, Forecast=%s, Previous=%s",
                                                    columns[0], columns[1], columns[2], columns[3], columns[4], columns[5], columns[6]); //
                                        //-------------------------------
                              } ///
                    } //
                    delete downloader;//
          }//
          bool IsFristrun;// = false;
          int  Retdistance(int cr)
          {         double    BarScale;
                    bool      IsBarScale          = ChartGetDouble(0, CHART_POINTS_PER_BAR, 0, BarScale);
                    int       chartWithBars       = (int)ChartGetInteger(0, CHART_WIDTH_IN_BARS, 0) ;
                    int       chartWithPixel      = (int)ChartGetInteger(0, CHART_WIDTH_IN_PIXELS, 0);
                    double    ScalePeriodSecound  = BarScale / PeriodSeconds();
                    //--Print("ScalePeriodSecound: ", ScalePeriodSecound, "    BarScale:", BarScale, "     PeriodSecounds:", PeriodSecounds, "    chartWithBars:", chartWithBars, "    chartWithPixel:", chartWithPixel); //
                    return(cr * PeriodSecounds); //
          }
          int       PeriodSecounds;//  = 0;
          void Initer2(bool IsKey)
          {         //------------------------------
                    if(!ct_Drive.TDD.ct_Configs.IsShow_Events_Shapes&&Initer.IsBasic_Done) {IsKey = false;}//
                    //------------------------------
                    int       ZoomLevel       = (int)ChartGetInteger(0, CHART_SCALE, 0);
                    int       ScaleLevel      = 0;
                    int       ScalePercents   = 0;
                    PeriodSecounds = 0;
                    if(ZoomLevel == 0) {ScaleLevel = 1;         PeriodSecounds = (PeriodSeconds() * 16) / 2;    ScalePercents = 4;} //zoommin
                    if(ZoomLevel == 1) {ScaleLevel = 1;         PeriodSecounds = (PeriodSeconds() * 8)  / 2;    ScalePercents = 4;}
                    if(ZoomLevel == 2) {ScaleLevel = 1;         PeriodSecounds = (PeriodSeconds() * 6)  / 2;    ScalePercents = 3;}
                    if(ZoomLevel == 3) {ScaleLevel = 1;         PeriodSecounds = (PeriodSeconds() * 4)  / 2;    ScalePercents = 3;}
                    if(ZoomLevel == 4) {ScaleLevel = 1;         PeriodSecounds = (PeriodSeconds() * 2)  / 2;    ScalePercents = 2;}
                    if(ZoomLevel == 5) {ScaleLevel = 1;         PeriodSecounds = (PeriodSeconds() * 2)  / 2;    ScalePercents = 2;} //zoommax//stiky to gether [ok]
                    //------------------------------
                    string fileName = "calendar.csv";
                    string filePath = "QuArtsRoot\\News\\3\\";
                    CFFCalendarDownlaod *downloader     = new CFFCalendarDownlaod(filePath, 10000);
                    bool          success = false; //         = downloader.Download("calendar.csv");
                    int           error   = 0;
                    //FileDelete(downloader.Path());//
                    //-------------------------------
                    //Control every day secound.
                    if(TimeCurrent() - LastUpDate >= UpDateSecounds || !FileIsExist(downloader.Path() + fileName))
                    {         //Print("Investing.com News Loading...");
                              success         = downloader.Download(fileName); //or updateneded
                              LastUpDate = TimeCurrent();//
                    }
                    //-------------------------------
                    if(!success)
                    {         if(!FileIsExist(downloader.Path() + fileName) ) PrintFormat("failed to download from web And File Not Existed");
                              error = downloader.Error(); // Not doing anything with this, just demnonstration
                    }
                    else
                    {         //-------------------------------
                              datetime  prevTime        = 0;
                              int       CountRepeated   = 0;
                              double    MinPriceWin     = WindowPriceMin();
                              //-------------------------------
                              for(int i = 0; i < downloader.Count; i++)//0 is heder line
                              {         //
                                        if(prevTime == downloader.Events[i].time) { CountRepeated++;   }
                                        else {CountRepeated = 0;}
                                        //-------------------------------
                                        int StarCount = 0;
                                        datetime TimePlace      = downloader.Events[i].time + (PeriodSecounds * (ScaleLevel));
                                        if(CountRepeated > 0) {TimePlace      = downloader.Events[i].time + (Retdistance(CountRepeated)) + (PeriodSecounds * (ScaleLevel));}
                                        double   PricePlace     = MinPriceWin + 25 * Point();
                                        int      Font = 7;
                                        string   Fontdesc = "Arial"; //
                                        //
                                        int      FontStar = 8;
                                        string   FontdescStar = "Wingdings"; //
                                        datetime TimePlaceStar      = downloader.Events[i].time - (PeriodSecounds * (ScaleLevel));
                                        if(CountRepeated > 0) {TimePlaceStar      = downloader.Events[i].time - (Retdistance(CountRepeated)) - (PeriodSecounds * (ScaleLevel));}
                                        double   PricePlaceStar     = MinPriceWin + 25 * Point();
                                        color    Colors = clrGold;
                                        if(downloader.Events[i].time < iTime(Symbol(), PERIOD_M1, 0)) { Colors = clrLightSlateGray; } //C'74,74,74'
                                        //--------------------------------------------------------------------------------------------
                                        datetime TimePlaceForecast      = downloader.Events[i].time - (PeriodSecounds * (ScaleLevel));
                                        //if(CountRepeated > 0) {TimePlaceForecast      = downloader.Events[i].time - (ScalePercents * Retdistance(CountRepeated)) - (PeriodSecounds * (ScaleLevel));}
                                        double   PricePlaceForecast     = MinPriceWin + 165 * Point() ;
                                        if(CountRepeated > 0)  PricePlaceForecast     = PricePlaceForecast + (((CountRepeated * 100) + 0) * Point())  ; //MinPriceWin + 150 * Point() +
                                        //
                                        datetime TimePlacePrevious      = downloader.Events[i].time - (PeriodSecounds * (ScaleLevel));
                                        //if(CountRepeated > 0) {TimePlacePrevious      = downloader.Events[i].time - (ScalePercents * Retdistance(CountRepeated)) - (PeriodSecounds * (ScaleLevel));}
                                        double   PricePlacePrevious     = MinPriceWin + 130 * Point();
                                        if(CountRepeated > 0)  PricePlacePrevious     = PricePlacePrevious + (((CountRepeated * 100) + 0) * Point())  ; //MinPriceWin + 125 * Point() +
                                        //--------------------------------
                                        //.
                                        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastLow");        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastMedium");         ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastHigh");
                                        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousLow");        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousMedium");         ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousHigh");
                                        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starLow");            ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starMedium");             ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starHigh");
                                        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryLow");         ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryMedium");          ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryHigh");
                                        ObjectDelete("TLV" + "NEWS[i]." + (string)i + " " + downloader.Events[i].title + " " + downloader.Events[i].impact);
                                        //
                                        if(downloader.Events[i].impact == "Low")
                                        {         Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastLow", (string)downloader.Events[i].forecast, TimePlaceForecast, PricePlaceForecast, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousLow", (string)downloader.Events[i].previous, TimePlacePrevious, PricePlacePrevious, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starLow", "«", TimePlaceStar, PricePlaceStar, Colors, FontdescStar, FontStar, ANCHOR_RIGHT, 270, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryLow", downloader.Events[i].country, TimePlace, PricePlace, Colors, "Arial", Font, ANCHOR_LEFT, 90, false); //
                                                  StarCount = 1; //
                                        }
                                        if(downloader.Events[i].impact == "Medium")
                                        {         Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastMedium", (string)downloader.Events[i].forecast, TimePlaceForecast, PricePlaceForecast, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousMedium", (string)downloader.Events[i].previous, TimePlacePrevious, PricePlacePrevious, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starMedium", "««", TimePlaceStar, PricePlaceStar, Colors, FontdescStar, FontStar, ANCHOR_RIGHT, 270, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryMedium", downloader.Events[i].country, TimePlace, PricePlace, Colors, "Arial", Font, ANCHOR_LEFT, 90, false); //
                                                  StarCount = 2; //
                                        }
                                        if(downloader.Events[i].impact == "High")
                                        {         Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastHigh", (string)downloader.Events[i].forecast, TimePlaceForecast, PricePlaceForecast, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousHigh", (string)downloader.Events[i].previous, TimePlacePrevious, PricePlacePrevious, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starHigh", "«««", TimePlaceStar,  PricePlaceStar, Colors, FontdescStar, FontStar, ANCHOR_RIGHT, 270, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryHigh", downloader.Events[i].country, TimePlace,  PricePlace, Colors, Fontdesc, Font, ANCHOR_LEFT, 90, false); //
                                                  StarCount = 3; //
                                        }
                                        Object_Pack.Lines.Vertical.Draw_GDSVertical2(MODE_CREATE, IsKey, "TLV" + "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + downloader.Events[i].impact, downloader.Events[i].time, STYLE_DASH, 1, Colors);
                                        Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " +  downloader.Events[i].title + " " + "TimerLast", " " + TimeToString(downloader.Events[i].time - TimeCurrent(), TIME_SECONDS), TimePlace, PricePlace + 75 * Point(), Colors, Fontdesc, Font, ANCHOR_LEFT, 90, false); //
                                        //-------------------------------
                                        prevTime = downloader.Events[i].time;//
                              } ///
                    } //
                    //-------------------------------
                    if(TimeCurrent() - LastUpDate <= UpDateSecounds && FileIsExist(downloader.Path() + fileName))
                    {         //-------------------------------
                              //-------------------------------
                              //-------------------------------
                              datetime  prevTime        = 0;
                              int       CountRepeated   = 0;
                              double    MinPriceWin     = WindowPriceMin();
                              //-------------------------------
                              for(int i = 0; i < downloader.Count; i++)//0 is heder line
                              {         //
                                        if(prevTime == downloader.Events[i].time) { CountRepeated++;   }
                                        else {CountRepeated = 0;}
                                        //-------------------------------
                                        int StarCount = 0;
                                        datetime TimePlace      = downloader.Events[i].time + (PeriodSecounds * (ScaleLevel));
                                        if(CountRepeated > 0) {TimePlace      = downloader.Events[i].time + (Retdistance(CountRepeated)) + (PeriodSecounds * (ScaleLevel));}
                                        double   PricePlace     = MinPriceWin + 25 * Point();
                                        int      Font = 7;
                                        string   Fontdesc = "Arial"; //
                                        //
                                        int      FontStar = 8;
                                        string   FontdescStar = "Wingdings"; //
                                        datetime TimePlaceStar      = downloader.Events[i].time - (PeriodSecounds * (ScaleLevel));
                                        if(CountRepeated > 0) {TimePlaceStar      = downloader.Events[i].time - (Retdistance(CountRepeated)) - (PeriodSecounds * (ScaleLevel));}
                                        double   PricePlaceStar     = MinPriceWin + 25 * Point();
                                        color    Colors = clrGold;
                                        if(downloader.Events[i].time < iTime(Symbol(), PERIOD_M1, 0)) { Colors = clrLightSlateGray; } //C'74,74,74'
                                        //--------------------------------------------------------------------------------------------
                                        datetime TimePlaceForecast      = downloader.Events[i].time - (PeriodSecounds * (ScaleLevel));
                                        //if(CountRepeated > 0) {TimePlaceForecast      = downloader.Events[i].time - (ScalePercents * Retdistance(CountRepeated)) - (PeriodSecounds * (ScaleLevel));}
                                        double   PricePlaceForecast     = MinPriceWin + 165 * Point();
                                        if(CountRepeated > 0)  PricePlaceForecast     = PricePlaceForecast + (((CountRepeated * 100) + 0) * Point())  ; //MinPriceWin + 150 * Point() +
                                        //
                                        datetime TimePlacePrevious      = downloader.Events[i].time - (PeriodSecounds * (ScaleLevel));
                                        //if(CountRepeated > 0) {TimePlacePrevious      = downloader.Events[i].time - (ScalePercents * Retdistance(CountRepeated)) - (PeriodSecounds * (ScaleLevel));}
                                        double   PricePlacePrevious     = MinPriceWin + 130 * Point();
                                        if(CountRepeated > 0)  PricePlacePrevious     = PricePlacePrevious + (((CountRepeated * 100) + 0) * Point())  ; //MinPriceWin + 125 * Point() +
                                        //--------------------------------
                                        //.
                                        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastLow");        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastMedium");         ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastHigh");
                                        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousLow");        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousMedium");         ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousHigh");
                                        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starLow");            ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starMedium");             ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starHigh");
                                        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryLow");         ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryMedium");          ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryHigh");
                                        ObjectDelete("TLV" + "NEWS[i]." + (string)i + " " + downloader.Events[i].title + " " + downloader.Events[i].impact);
                                        //
                                        if(downloader.Events[i].impact == "Low")
                                        {         Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastLow", (string)downloader.Events[i].forecast, TimePlaceForecast, PricePlaceForecast, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousLow", (string)downloader.Events[i].previous, TimePlacePrevious, PricePlacePrevious, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starLow", "«", TimePlaceStar, PricePlaceStar, Colors, FontdescStar, FontStar, ANCHOR_RIGHT, 270, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryLow", downloader.Events[i].country, TimePlace, PricePlace, Colors, "Arial", Font, ANCHOR_LEFT, 90, false); //
                                                  StarCount = 1; //
                                        }
                                        if(downloader.Events[i].impact == "Medium")
                                        {         Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastMedium", (string)downloader.Events[i].forecast, TimePlaceForecast, PricePlaceForecast, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousMedium", (string)downloader.Events[i].previous, TimePlacePrevious, PricePlacePrevious, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starMedium", "««", TimePlaceStar, PricePlaceStar, Colors, FontdescStar, FontStar, ANCHOR_RIGHT, 270, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryMedium", downloader.Events[i].country, TimePlace, PricePlace, Colors, "Arial", Font, ANCHOR_LEFT, 90, false); //
                                                  StarCount = 2; //
                                        }
                                        if(downloader.Events[i].impact == "High")
                                        {         Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastHigh", (string)downloader.Events[i].forecast, TimePlaceForecast, PricePlaceForecast, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousHigh", (string)downloader.Events[i].previous, TimePlacePrevious, PricePlacePrevious, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starHigh", "«««", TimePlaceStar,  PricePlaceStar, Colors, FontdescStar, FontStar, ANCHOR_RIGHT, 270, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryHigh", downloader.Events[i].country, TimePlace,  PricePlace, Colors, Fontdesc, Font, ANCHOR_LEFT, 90, false); //
                                                  StarCount = 3; //
                                        }
                                        Object_Pack.Lines.Vertical.Draw_GDSVertical2(MODE_CREATE, IsKey, "TLV" + "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + downloader.Events[i].impact, downloader.Events[i].time, STYLE_DASH, 1, Colors);
                                        Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " +  downloader.Events[i].title + " " + "TimerLast", " " + TimeToString(downloader.Events[i].time - TimeCurrent(), TIME_SECONDS), TimePlace, PricePlace + 75 * Point(), Colors, Fontdesc, Font, ANCHOR_LEFT, 90, false); //
                                        //-------------------------------
                                        prevTime = downloader.Events[i].time;//
                              } ///
                              ///
                    }
                    //-------------------------------
                    if( FileIsExist(downloader.Path() + fileName) && !IsFristrun)
                    {         //-------------------------------
                              downloader.LoadParse(fileName);
                              //Print("--File Existed: " + downloader.Path() + fileName, " downloader.Count: ", downloader.Count);
                              //-------------------------------
                              //-------------------------------
                              datetime  prevTime        = 0;
                              int       CountRepeated   = 0;
                              double    MinPriceWin     = WindowPriceMin();
                              //-------------------------------
                              for(int i = 0; i < downloader.Count; i++)//0 is heder line
                              {         //
                                        if(prevTime == downloader.Events[i].time) { CountRepeated++;   }
                                        else {CountRepeated = 0;}
                                        //-------------------------------
                                        int StarCount = 0;
                                        datetime TimePlace      = downloader.Events[i].time + (PeriodSecounds * (ScaleLevel));
                                        if(CountRepeated > 0) {TimePlace      = downloader.Events[i].time + (Retdistance(CountRepeated)) + (PeriodSecounds * (ScaleLevel));}
                                        double   PricePlace     = MinPriceWin + 25 * Point();
                                        int      Font = 7;
                                        string   Fontdesc = "Arial"; //
                                        //
                                        int      FontStar = 8;
                                        string   FontdescStar = "Wingdings"; //
                                        datetime TimePlaceStar      = downloader.Events[i].time - (PeriodSecounds * (ScaleLevel));
                                        if(CountRepeated > 0) {TimePlaceStar      = downloader.Events[i].time - (Retdistance(CountRepeated)) - (PeriodSecounds * (ScaleLevel));}
                                        double   PricePlaceStar     = MinPriceWin + 25 * Point();
                                        color    Colors = clrGold;
                                        if(downloader.Events[i].time < iTime(Symbol(), PERIOD_M1, 0)) { Colors = clrLightSlateGray; } //C'74,74,74'
                                        //--------------------------------------------------------------------------------------------
                                        datetime TimePlaceForecast      = downloader.Events[i].time - (PeriodSecounds * (ScaleLevel));
                                        //if(CountRepeated > 0) {TimePlaceForecast      = downloader.Events[i].time - (ScalePercents * Retdistance(CountRepeated)) - (PeriodSecounds * (ScaleLevel));}
                                        double   PricePlaceForecast     = MinPriceWin + 165 * Point();
                                        if(CountRepeated > 0)  PricePlaceForecast     = PricePlaceForecast + (((CountRepeated * 100) + 0) * Point())  ; //MinPriceWin + 150 * Point() +
                                        //
                                        datetime TimePlacePrevious      = downloader.Events[i].time - (PeriodSecounds * (ScaleLevel));
                                        //if(CountRepeated > 0) {TimePlacePrevious      = downloader.Events[i].time - (ScalePercents * Retdistance(CountRepeated)) - (PeriodSecounds * (ScaleLevel));}
                                        double   PricePlacePrevious     = MinPriceWin + 130 * Point();
                                        if(CountRepeated > 0)  PricePlacePrevious     = PricePlacePrevious + (((CountRepeated * 100) + 0)  * Point())  ; //MinPriceWin + 125 * Point() +
                                        //--------------------------------
                                        //.
                                        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastLow");        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastMedium");         ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastHigh");
                                        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousLow");        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousMedium");         ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousHigh");
                                        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starLow");            ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starMedium");             ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starHigh");
                                        ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryLow");         ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryMedium");          ObjectDelete("NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryHigh");
                                        ObjectDelete("TLV" + "NEWS[i]." + (string)i + " " + downloader.Events[i].title + " " + downloader.Events[i].impact);
                                        //
                                        if(downloader.Events[i].impact == "Low")
                                        {         Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastLow", (string)downloader.Events[i].forecast, TimePlaceForecast, PricePlaceForecast, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousLow", (string)downloader.Events[i].previous, TimePlacePrevious, PricePlacePrevious, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starLow", "«", TimePlaceStar, PricePlaceStar, Colors, FontdescStar, FontStar, ANCHOR_RIGHT, 270, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryLow", downloader.Events[i].country, TimePlace, PricePlace, Colors, "Arial", Font, ANCHOR_LEFT, 90, false); //
                                                  StarCount = 1; //
                                        }
                                        if(downloader.Events[i].impact == "Medium")
                                        {         Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastMedium", (string)downloader.Events[i].forecast, TimePlaceForecast, PricePlaceForecast, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousMedium", (string)downloader.Events[i].previous, TimePlacePrevious, PricePlacePrevious, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starMedium", "««", TimePlaceStar, PricePlaceStar, Colors, FontdescStar, FontStar, ANCHOR_RIGHT, 270, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryMedium", downloader.Events[i].country, TimePlace, PricePlace, Colors, "Arial", Font, ANCHOR_LEFT, 90, false); //
                                                  StarCount = 2; //
                                        }
                                        if(downloader.Events[i].impact == "High")
                                        {         Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "ForecastHigh", (string)downloader.Events[i].forecast, TimePlaceForecast, PricePlaceForecast, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "PreviousHigh", (string)downloader.Events[i].previous, TimePlacePrevious, PricePlacePrevious, Colors, Fontdesc, Font, ANCHOR_CENTER, 0, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "starHigh", "«««", TimePlaceStar,  PricePlaceStar, Colors, FontdescStar, FontStar, ANCHOR_RIGHT, 270, false); //
                                                  Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + "countryHigh", downloader.Events[i].country, TimePlace,  PricePlace, Colors, Fontdesc, Font, ANCHOR_LEFT, 90, false); //
                                                  StarCount = 3; //
                                        }
                                        Object_Pack.Lines.Vertical.Draw_GDSVertical2(MODE_CREATE, IsKey, "TLV" + "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " + downloader.Events[i].title + " " + downloader.Events[i].impact, downloader.Events[i].time, STYLE_DASH, 1, Colors);
                                        Dev_Object_Pack.Texts.DescriptionNews.Draw_GDS_Text(MODE_CREATE, IsKey, "NEWS[i]." + (string)i + " " + downloader.Events[i].country + " " +  downloader.Events[i].title + " " + "TimerLast", " " + TimeToString(downloader.Events[i].time - TimeCurrent(), TIME_SECONDS), TimePlace, PricePlace + 75 * Point(), Colors, Fontdesc, Font, ANCHOR_LEFT, 90, false); //
                                        //-------------------------------
                                        prevTime = downloader.Events[i].time;//
                              } ///
                              ///
                    }
                    else if(!FileIsExist(downloader.Path() + fileName))
                    {         Print("File Not Existed: " + downloader.Path() + fileName); //
                    }//
                    delete downloader;//
          }//

};
//+------------------------------------------------------------------+
