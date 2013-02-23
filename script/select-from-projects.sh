source $(dirname $0)/../conf/granagile-env.sh

columns=$1

if [ "$columns" = "" ]; then columns=id,identifier; fi

echo "select $columns from alminium.projects;" | $MYSQL_CMD $MYSQL_OPTION -s
