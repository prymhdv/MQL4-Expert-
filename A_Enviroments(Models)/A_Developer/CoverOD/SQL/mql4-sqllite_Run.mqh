//+------------------------------------------------------------------+
//||   ||||||||||                 Graphical_Object_Base.mqh         || ===Model====== Data Logic Members
//|||  ||||||  ||     Copyright © 2020-2022, Oprymhdv@Gmail.com    ||| ===View======= Functions Set Get
//|||  ||   |||||             Email: @prymhdvgmail.com             ||| ===Contrler=== Function Handel Request
//||   ||||||||||             HTTPS: www.Oprymhdv.com               ||
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
#include <.RTL_Prymhdv\QuartsExperts\A_Enviroments(Models)\A_Developer\CoverOD\SQL\sqlite.mqh>
//+------------------------------------------------------------------+
//  Dependency_Assambles  Dependency_Assambles  Dependency_Assambles |
//+------------------------------------------------------------------+
class Cd_SQLLite
{
public:
          Cd_SQLLite() {Init();};

          ~Cd_SQLLite() {Deinit(0);};

          bool  do_check_table_exists(string db, string table);
          void  do_exec(string db, string exp);
          int    Init();
          void   Deinit(const int reason);
          void   Main();
          //
          //
};
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Cd_SQLLite::do_check_table_exists (string db, string table)
{         int res = sqlite_table_exists (db, table + "");
          if (res < 0)
          {         PrintFormat ("Check for table existence failed with code %d", res);
                    return (false);//
          }
          return (res > 0); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cd_SQLLite::do_exec(string db, string exp)
{         int res = sqlite_exec (db, exp + "");
          if (res != 0)
                    PrintFormat ("Expression '%s' failed with code %d", exp, res); //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int Cd_SQLLite::Init()
{         if (!sqlite_init())
          {         return INIT_FAILED; }
          return INIT_SUCCEEDED; //
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cd_SQLLite::Deinit(const int reason) { sqlite_finalize(); }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Cd_SQLLite::Main()
{         string db = "test.db";
          string path = sqlite_get_fname (db);
          Print ("Dest DB path: " + path);
          if (!do_check_table_exists (db, "test"))
          {         Print ("DB not exists, create schema");
                    do_exec (db, "create table test (name text)");
                    do_exec (db, "insert into test (name) values ('test1')");
                    do_exec (db, "insert into test (name) values ('test2')");
                    do_exec (db, "insert into test (name) values ('test3')");
                    do_exec (db, "insert into test (name) values ('test4')"); }
          int cols[1];
          int handle = sqlite_query (db, "select * from test", cols);
          while (sqlite_next_row (handle) == 1)
          {         for (int i = 0; i < cols[0]; i++)
                              Print (sqlite_get_col (handle, i)); }
          sqlite_free_query (handle);
          return; //
}
//+------------------------------------------------------------------+
