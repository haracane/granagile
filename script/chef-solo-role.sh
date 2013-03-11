cwd=$(cd $(dirname $0)/..; pwd)
cd $cwd

while true; do
  if [ "$1" = --list ]; then
    for role in $(cd $cwd/chef-repo/roles; ls | sed "s/\\.json\$//g"); do
      echo $role
    done
    exit 0
  else
    break
  fi
done

role=$1

role_path=$cwd/chef-repo/roles/$role.json

if [ ! -f $role_path ]; then
  echo "(ERROR) $role_path does not exist" >&2
  exit 1
fi

solorb=$(mktemp /tmp/solorb.XXXXXX)

sh ./script/print-solo-rb.sh > $solorb

chef-solo -c $solorb -o role[$role]
if [ $? != 0 ]; then exit 1; fi

rm $solorb
