//+------------------------------------------------------------------+
//||   ||||||||||                 Graphical_Object_Base.mqh         || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\SQL\mql4-mysql.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class Cd_SQL
{
public:
          Cd_SQL(void) {SetUp();};
          ~Cd_SQL(void) {};

          string  host;//     = "localhost";
          string  user;//     = "root";
          string  pass;//     = "123456";
          string  dbName;//   = "information_schema";

          int     port;//     = 3306;
          int     socket;//  = 0;
          int     client;//  = 0;

          int     dbConnectId;// = 0;
          bool    goodConnect;// = false;
          //
          int           Main();
          void          SetUp();

//
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cd_SQL::SetUp()
{         host     = "localhost";
          user     = "root";
          pass     = "123456";
          dbName   = "information_schema";
//
          port     = 3306;
          socket   = 0;
          client   = 0;
//
          dbConnectId = 0;
          goodConnect = false;
//
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Cd_SQL::Main()
{         goodConnect = init_MySQL(dbConnectId, host, user, pass, dbName, port, socket, client);
          if ( !goodConnect )
          {         return (1); // bad connect
          }
          //+-------------------------------------------------------------------
          //| Fetch multiple columns in multiple rows
          //+-------------------------------------------------------------------
          string query = StringConcatenate(
                                   "SELECT `TABLE_NAME`, `TABLE_ROWS`, `CREATE_TIME`, `CHECK_TIME` ",
                                   "FROM `TABLES` ",
                                   "WHERE `TABLE_SCHEMA` = \'mysql\'");
          string data[][4];   // important: second dimension size must be equal to the number of columns
          int result = MySQL_FetchArray(dbConnectId, query, data);
          if ( result == 0 )
          {         // Print("0 rows selected");
          }
          else if ( result == -1 )
          {         // Print("some error occured");
          }
          else
          {         // Print("Query was successful. Printing rows...");
                    int num_rows = ArrayRange(data, 0);
                    int num_fields = ArrayRange(data, 1);
                    for ( int i = 0; i < num_rows; i++)
                    {         string line = "";
                              for ( int j = 0; j < num_fields; j++ )
                              {         string value = data[i][j];
                                        line = StringConcatenate(line, value, ";"); }
                              Print(line); //
                    }//
          }
          //+-------------------------------------------------------------------
          //| Single row fetch
          //| Similar to array fetch
          //+-------------------------------------------------------------------
          string row[][4];   // important: second dimension size must be equal to the number of columns
          string rowQuery = StringConcatenate("SELECT `TABLE_NAME`, `TABLE_ROWS`, `CREATE_TIME`, `CHECK_TIME` ",
                                              "FROM `TABLES` ",
                                              "WHERE `TABLE_SCHEMA` = \'mysql\' ",
                                              "LIMIT 0,1");
          int row_result = MySQL_FetchArray(dbConnectId, rowQuery, row);
          string line2 = "One row query: ";
          for(int r = 0; r < ArrayRange(row, 1); r++)
          {         line2 = StringConcatenate(line2, row[0][r], ";"); }
          Print(line2);
          //+-------------------------------------------------------------------
          //| Sample INSERT
          //| It's just an example, nobody can insert into information_schema.
          //+-------------------------------------------------------------------
          /*string insertQuery  = StringConcatenate(
              "INSERT INTO `CHARACTER_SETS` VALUES (", "sometext"
                                              , "," , "oneMoreText"
                                              , "," , "andVarialbe"
                                              , "," , "nextWillBeNumber"
                                              , "," , 2
                                              , ")"
              );
          if ( MySQL_Query(dbConnectId, insertQuery) ) {
              Print("insert good");
          }*/
          //+-------------------------------------------------------------------
          deinit_MySQL(dbConnectId);
          return (0); //
}
//+------------------------------------------------------------------+
