#include "sqlite3.h"
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <clocale>
#include <Windows.h>

int main(void){
	/*SetConsoleCP(1251);
	SetConsoleOutputCP(1251);*/
	setlocale(LC_ALL, "rus");
	int err_nr;
	sqlite3 *db;
	const char *sql_text = "SELECT Teams.name, Players.name, Players.surname, Players.amplua \
							FROM Players\
								 INNER JOIN Teams on Players.team_ID = Teams.team_ID\
								 INNER JOIN Plays on Teams.team_ID = Plays.host_team_ID \
							WHERE Plays.result = 'IN PROGRESS'\
							UNION\
							SELECT Teams.name, Players.name, Players.surname, Players.amplua \
							FROM Players\
								 INNER JOIN Teams on Players.team_ID = Teams.team_ID\
								 INNER JOIN Plays on Teams.team_ID = Plays.guest_team_ID \
							WHERE Plays.result = 'IN PROGRESS'; ";
	const char *sql_pos;
	sqlite3_stmt *st;
	//const char *pTail;
	int col_cnt;

	err_nr = sqlite3_open("MyDataBase", &db);
	if (err_nr != SQLITE_OK)DebugBreak();

	sql_pos = sql_text;
	for (;;) {
		err_nr = sqlite3_prepare(
			db,
			sql_pos,
			-1,
			&st,
			&sql_pos
		);

		if (err_nr != SQLITE_OK)
            {
                printf("Compilation Error");
                return 1;
            }

		if (!st) break;

		if (err_nr != SQLITE_OK) return 2;

		col_cnt = sqlite3_column_count(st);

		while ((err_nr = sqlite3_step(st)) == SQLITE_ROW) {
			for (int i = 0; i < col_cnt; ++i) {
				if (i) printf("\t");
				printf("%s", sqlite3_column_text(st, i));
			}
			printf("\n");
		}

		if (err_nr != SQLITE_DONE)DebugBreak();

		err_nr = sqlite3_finalize(st);

		if (err_nr != SQLITE_OK)
        {
            printf("Final Error");
            DebugBreak();
        }
	}

	return 0;
}
