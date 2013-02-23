source $(dirname $0)/../../conf/granagile-env.sh

while true; do
  if [ "$1" = --pid-path ]; then
    pid_path_option="$1 $2"
    shift 2
  else
    break
  fi
done

irc_channels_option=""

for id_project in $(sh $SCRIPT_DIR/select-from-projects.sh id,identifier | awk '{print $1"/"$2}'); do
  id=${id_project%/*}
  project=${id_project#*/}
  irc_channels_option="$irc_channels_option --irc-channels {\"#$project\"=>{project_id=>$id}}"
done

$PERL_CMD -I$LIB_DIR/Redmine-Chan/lib $SCRIPT_DIR/minechan/minechan.pl \
  $pid_path_option $irc_channels_option --redmine-api-key $REDMINE_API_KEY