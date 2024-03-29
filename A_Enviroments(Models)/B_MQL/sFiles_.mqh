//+------------------------------------------------------------------+
//|                                                        Ss_MqlFiles.mqh |
//|                                                    A pourya 2021 |
//|                                                @prymhdvgmail.com |
//+------------------------------------------------------------------+
#property copyright "A pourya 2021"
#property link      "@prymhdvgmail.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//|             Class Ss_MqlFiles::     BEGIN                            |
//+------------------------------------------------------------------+
class Ss_MqlFiles
{

          /*
          MQL4 Reference / File Functions
          *========================================================================================================================================================
          * File Functions      /// Duty of class
          * This is a group of functions for working with files.
          * For security reasons, work with files is strictly controlled in the MQL4 language. Files with which file operations are conducted using MQL4 means cannot be outside the file sandbox.
          * There are two directories (with subdirectories) in which working files can be located:
          * •terminal_data_folder\MQL4\Files\ (in the terminal menu select to view "File" - "Open the data directory");
          * •the common folder for all the terminals installed on a computer - usually located in the directory C:\Documents and Settings\All Users\Application Data\MetaQuotes\Terminal\Common\Files.
          * There is a program method to obtain names of these catalogs using the TerminalInfoString() function, using the ENUM_TERMINAL_INFO_STRING enumeration:
          *========================================================================================================================================================
          * //--- Folder that stores the terminal data            string terminal_data_path       = TerminalInfoString(TERMINAL_DATA_PATH);
          * //--- Common folder for all client terminals          string common_data_path         = TerminalInfoString(TERMINAL_COMMONDATA_PATH);
          *========================================================================================================================================================
          * Work with files from other directories is prohibited.
          * File functions allow working with so-called "named pipes". To do this, simply call FileOpen() function with appropriate parameters.
          *========================================================================================================================================================
          *
          * Function            Action                                                                                                                    Calling
          *
          * FileFindFirst       Starts the search of files in a directory in accordance with the specified filter               long            FileFindFirst( const string file_filter, string& returned_filename, int common_flag=0) ;
          * FileFindNext        Continues the search started by the FileFindFirst() function                                    bool            FileFindNext(  long search_handle, string& returned_filename );
          * FileFindClose       Closes search handle                                                                            void            FileFindClose( long search_handle);
          * FileOpen            Opens a file with a specified name and flag                                                     int             FileOpen( string file_name, int open_flags, short delimiter=';', uint codepage=CP_ACP );
          * FileDelete          Deletes a specified file                                                                        bool            FileDelete( const string file_name, int common_flag=0 );
          * FileFlush           Writes to a disk all data remaining in the input/output file buffer                             void            FileFlush( int  file_handle );
          * FileGetInteger      Gets an integer property of a file                                                              long            FileGetInteger( int file_handle, ENUM_FILE_PROPERTY_INTEGER  property_id );
          * FileIsEnding        Defines the end of a file in the process of reading                                             bool            FileIsEnding( int file_handle );
          * FileIsLineEnding    Defines the end of a line in a text file in the process of reading                              bool            FileIsLineEnding( int file_handle );
          * FileClose           Closes a previously opened file                                                                 void            FileClose( int file_handle );
          * FileIsExist         Checks the existence of a file                                                                  bool            FileIsExist( const string file_name, int common_flag=0 );
          * FileCopy            Copies the original file from a local or shared folder to another file                          bool            FileCopy( const string  src_file_name, int common_flag, const string  dst_file_name, int mode_flags );
          * FileMove            Moves or renames a file                                                                         bool            FileMove( const string  src_file_name, int common_flag, const string  dst_file_name, int mode_flags  );
          * FileReadArray       Reads arrays of any type except for string from the file of the BIN type                        uint            FileReadArray( int file_handle, void& array[], int start=0, int count=WHOLE_ARRAY );
          * FileReadBool        Reads from the file of the CSV type a string from the current position till a delimiter         bool            FileReadBool( int file_handle );
                                (or till the end of a text line) and converts the read string to a value of bool type
          * FileReadDatetime    Reads from the file of the CSV type a string of one of the formats:                             datetime        FileReadDatetime( int file_handle );
                                "YYYY.MM.DD HH:MM:SS", "YYYY.MM.DD" or "HH:MM:SS" - and converts it into a datetime value
          * FileReadDouble      Reads a double value from the current position of the file pointer                              double          FileReadDouble( int file_handle, int  size=DOUBLE_VALUE );
          * FileReadFloat       Reads a float value from the current position of the file pointer                               float           FileReadFloat( int file_handle );
          * FileReadInteger     Reads int, short or char value from the current position of the file pointer                    int             FileReadInteger( int file_handle, int  size=INT_VALUE );
          * FileReadLong        Reads a long type value from the current position of the file pointer                           long            FileReadLong( int file_handle );
          * FileReadNumber      Reads from the file of the CSV type a string from the current position till                     double          FileReadNumber( int file_handle );
                                 a delimiter (or til the end of a text line) and converts the read string into double value
          * FileReadString      Reads a string from the current position of a file pointer from a file                          string          FileReadString( int  file_handle, int  length=0 );
          * FileReadStruct      Reads the contents from a binary file  into a structure passed as                               uint            FileReadStruct( int file_handle, const void&  struct_object, int size=-1 );
                                 a parameter, from the current position of the file pointer
          * FileSeek            Moves the position of the file pointer by a specified number of bytes                           bool            FileSeek( int file_handle, long offset, ENUM_FILE_POSITION origin );
                                 relative to the specified position
          * FileSize            Returns the size of a corresponding open file                                                   ulong           FileSize( int file_handle );
          * FileTell            Returns the current position of the file pointer of a corresponding open file                   ulong           FileTell( int file_handle );
          * FileWrite           Writes data to a file of CSV or TXT type                                                        uint            FileWrite( int file_handle,.. );  FileWrite(file_handle,time_buff[i],sign_buff[i]);
          * FileWriteArray      Writes arrays of any type except for string into a file of BIN type                             uint            FileWriteArray( int file_handle, const void&  array[], int start=0, int count=WHOLE_ARRAY );
          * FileWriteDouble     Writes value of the double type from the current position of a file pointer into a binary file  uint            FileWriteDouble( int file_handle, double value );
          * FileWriteFloat      Writes value of the float type from the current position of a file pointer into a binary file   uint            FileWriteDouble( int file_handle, double value );
          * FileWriteInteger    Writes value of the int type from the current position of a file pointer into a binary file     uint            FileWriteInteger( int file_handle, int  value, int  size=INT_VALUE );
          * FileWriteLong       Writes value of the long type from the current position of a file pointer into a binary file    uint            FileWriteLong( int file_handle, long value );
          * FileWriteString     Writes the value of a string parameter into a BIN or TXT                                        uint            FileWriteStruct( int file_handle, const void&  struct_object, int size=-1 );
                                file starting from the current position of the file pointer
          * FileWriteStruct     Writes the contents of a structure passed as a parameter into a binary file,                    uint            FileWriteStruct( int file_handle, const void&  struct_object, int size=-1 );
                                starting from the current position of the file pointer
          * FolderCreate        Creates a folder in the Files directory                                                         bool            FolderCreate( string folder_name, int common_flag=0 );
          * FolderDelete        Removes a selected directory. If the folder is not empty, then it can't be removed              bool            FolderDelete( string folder_name, int common_flag=0 );
          * FolderClean         Deletes all files in the specified folder                                                       bool            FolderClean( string folder_name, int common_flag=0 );
          * FileOpenHistory     Opens file in the current history directory or in its subfolders                                int             FileOpenHistory( int filename, int mode, int delimiter=';' );
          *
          *
          *
          *========================================================================================================================================================
          *If the file is opened for writing using FileOpen(), all subfolders specified in the path will be created if there are no such ones.
          *========================================================================================================================================================
          */



//=========================================================
private:
          string                        m_name;
          int                           m_index;
//=========================================================///F_ile_s("F_i_l_e");      // a_s Di_sk  ()) (not open file by this text))
public:
//=========================================================
          void                          Ss_MqlFiles();
          void                          Ss_MqlFiles(string name) { m_name = name + (string)++m_index;}; ///--- string name= "none" errorr in creating class obj
          void                          ~Ss_MqlFiles();
          //=========================================================
          double                        pointsPerPipFile();
          //=========================================================
          int   _FileOpen(              string file_name,       int open_flags,  short delimiter=';', uint codepage=CP_ACP ){return FileOpen( file_name, open_flags, delimiter , codepage );};
          bool  _FileClose(             int file_handle)                       { FileClose( file_handle ); return true;}
          bool  _FileDelete( const      string file_name,       int common_flag=0 ){return FileDelete(   file_name,     common_flag );};
          bool  _FileIsExist(const      string file_name,       int common_flag=0){ return FileIsExist(  file_name,     common_flag );}
          //
          bool  _FolderCreate(          string folder_name,     int common_flag=0 ){return FolderCreate( folder_name, common_flag );};
          bool  _FolderDelete(          string folder_name,     int common_flag=0 ){return FolderDelete( folder_name, common_flag );};
          //=========================================================
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ss_MqlFiles::Ss_MqlFiles() {RunCallFunction++; ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Ss_MqlFiles::~Ss_MqlFiles() {RunCallFunction--; ________________________________________________________Xerorr.SuperviserX(_LastError, "-C_ERROR-Error",  __LINE__, __FUNCTION__); }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Ss_MqlFiles::pointsPerPipFile() //double C_BANK::pointsPerPipFile()
{         ///double        C_BANK::pointsPerPipFile();double C_BANK::pointsPerPipFile()
          bool pointsPerPipFile = false; //
          int i;
          int digits;
          double ppp = 1;
          string _symbol;
          int f = FileOpenHistory("symbols.raw", FILE_BIN | FILE_READ);
          int count = (int)FileSize(f) / 1936;
          for (i = 0; i < count; i++)
          {         _symbol = FileReadString(f, 12);
                    if (StringFind(_symbol, "EURUSD") != -1)
                    {         digits = (int)MarketInfo(_symbol, MODE_DIGITS);
                              if (digits == 4) { ppp = 1;  }
                              else             { ppp = 10; }
                              break; //
                    } //
                    FileSeek(f, 1924, SEEK_CUR);//
          }
          FileClose(f);
          return (ppp);//
}//
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|             Class Ss_MqlFiles::     BEGIN                            |
//+------------------------------------------------------------------+
