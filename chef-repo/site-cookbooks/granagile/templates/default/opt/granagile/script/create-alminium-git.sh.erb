git_dir=/var/opt/alminium/git

mysql_cmd="mysql -u alminium -palminium -D alminium -s"

git_create_repo ()
{
  git_repo_dir=$1
  
  mkdir -p $git_repo_dir
  cd $git_repo_dir
  git init --bare --shared=true
  if [ $? != 0 ]; then return 1; fi
  cp hooks/post-update.sample hooks/post-update
  git update-server-info
  git config http.receivepack true
  echo "created git repository $git_repo_dir" >&2
}

git_first_commit ()
{
  git_repo_dir=$1
  project_git=${git_repo_dir##*/}
  project=${project_git%.git}
  
  tmpdir=$(mktemp -d /tmp/git.XXXXXX)
  cd $tmpdir
  mkdir $project
  cd $project
  git init
  git remote add origin $git_repo_dir
  touch README.md
  git add .
  git commit -m "Initial commit"
  if [ $? != 0 ]; then return 1; fi
  git push origin master
  if [ $? != 0 ]; then return 1; fi
  cd ..
  rm -rf $tmpdir
}

git_create_alminium_record ()
{
  id=$1
  git_repo_dir=$2
  project_git=${git_repo_dir##*/}
  project=${project_git%.git}
  
  git_count=$(echo "select count(*) from alminium.repositories where project_id = $id and url = '$git_repo_dir'" | $mysql_cmd)
  
  if [ "$git_count" = "0" ]; then
    is_default_count=$(echo "select count(*) from alminium.repositories where project_id = $id and is_default = 1" | $mysql_cmd)
    if [ "$is_default_count" = 0 ]; then
      is_default=1
    else
      is_default=0
    fi
  
    echo "
      insert into alminium.repositories(project_id, url, login, password, root_url, type, extra_info, identifier, is_default, created_with_scm)
      values ($id, '$git_repo_dir', '', '', '$git_repo_dir', 'Repository::Git', '---\nextra_report_last_commit: \\'0\\'', '${project}-git', $is_default, 0);
    " | $mysql_cmd
    echo "inserted $git_repo_dir into alminium repositories" >&2
  fi
}

for id_project in $(echo "select id,identifier from alminium.projects;" | $mysql_cmd | awk '{print $1"/"$2}'); do
  id=${id_project%/*}
  project=${id_project#*/}
  
  git_repo_dir=$git_dir/$project.git

  if [ ! -d $git_repo_dir ]; then
    git_create_repo $git_repo_dir
    if [ $? != 0 ]; then exit 1; fi
    git_first_commit $git_repo_dir
    if [ $? != 0 ]; then exit 1; fi
  fi
  chown -R apache:apache $git_repo_dir
  
  git_create_alminium_record $id $git_repo_dir
done
