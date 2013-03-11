cwd=$(cd $(dirname $0)/..; pwd)
cd $cwd

while true; do
  if [ "$1" = --list ]; then
    for cookbook in $(cd $cwd/chef-repo/cookbooks; ls); do
      for recipe in $(cd $cwd/chef-repo/cookbooks/$cookbook/recipes; ls | sed "s/\\.rb\$//g"); do
        echo "$cookbook::$recipe"
      done
    done

    for cookbook in $(cd $cwd/chef-repo/site-cookbooks; ls); do
      for recipe in $(cd $cwd/chef-repo/site-cookbooks/$cookbook/recipes; ls | sed "s/\\.rb\$//g"); do
        echo "$cookbook::$recipe"
      done
    done
    exit 0
  else
    break
  fi
done

recipe=$1

solorb=$(mktemp /tmp/solorb.XXXXXX)

sh ./script/print-solo-rb.sh > $solorb

chef-solo -c $solorb -o recipe[$recipe]
if [ $? != 0 ]; then exit 1; fi

rm $solorb
