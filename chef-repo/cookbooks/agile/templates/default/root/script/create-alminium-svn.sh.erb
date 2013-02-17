svn_dir=/var/opt/alminium/svn

mysql_cmd="mysql -u alminium -palminium -D alminium -s"

svn_create_alminium_record ()
{
  id=$1
  svn_repo_dir=$2
  project=${svn_repo_dir##*/}
  
  svn_repo_url="file://$svn_repo_dir"
  svn_count=$(echo "select count(*) from alminium.repositories where project_id = $id and url = '$svn_repo_url'" | $mysql_cmd)
  if [ "$svn_count" = "0" ]; then
    echo "
      insert into alminium.repositories(project_id, url, login, password, root_url, type, extra_info, identifier, is_default, created_with_scm)
      values ($id, '$svn_repo_url', '', '', '$svn_repo_url', 'Repository::Subversion', '---\n...', '${project}-svn', 0, 0);
    " | $mysql_cmd
    echo "inserted $svn_repo_dir into alminium repositories" >&2
  fi
}

for id_project in $(echo "select id,identifier from alminium.projects;" | $mysql_cmd | awk '{print $1"/"$2}'); do
  id=${id_project%/*}
  project=${id_project#*/}
  
  svn_repo_dir=$svn_dir/$project
  
  if [ ! -d $svn_repo_dir ]; then
    svnadmin create $svn_repo_dir
    echo "created svn repository $svn_repo_dir" >&2
  fi
  chown -R apache:apache $svn_repo_dir
  
  svn_create_alminium_record $id $svn_repo_dir
done
