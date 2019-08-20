SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

rm a.db

sqlite3 :memory: \
".open a.db" \
"create table T(C text);" \
"insert into T values('AAA');" \
"select sql from sqlite_master;" \
"select * from T;"

ls -1 | grep a.db

sqlite3 :memory: \
".open a.db" \
"select sql from sqlite_master;" \
"select * from T;"

