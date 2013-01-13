# ===Class Git
#
# Maintains a dummy git repo for reporting purposes 
#
# ===Requires
#
# Packages: git, gnuplot, httpd (all installed in the class)
#
# Misc:     SSL certificates for apache (if you will be using SSL)
#
# ===Parameters
#
# None
#
# ===Actions
#
# Gathers gitstats on all git repos in a specified directory
#
# ===Usage
#
# Include class in host or hostgruop definitions

class gitstats 
(
  $admin_email             = $gitstats::params::admin_email,
  $apache_owner            = $gitstats::params::apache_owner,
  $apache_group            = $gitstats::params::apache_group,
  $apache_mode             = $gitstats::params::apache_mode,
  $document_root           = $gitstats::params::document_root,
  $git_all_repos           = $gitstats::params::git_all_repos,
  $git_apache_config       = $gitstats::params::git_apache_config,
  $git_document_root       = $gitstats::params::git_document_root,
  $git_repos_dir           = $gitstats::params::git_repos_dir,
  $gitstats_script         = $gitstats::params::gitstats_script,
  $ipaddr                  = $gitstats::params::ipaddr,
  $port                    = $gitstats::params::port,
  $server_name             = $gitstats::params::server_name,
  $ssl_cert                = $gitstats::params::ssl_cert,
  $ssl_interm              = $gitstats::params::ssl_interm,
  $ssl_key                 = $gitstats::params::ssl_key,
)

inherits gitstats::params
{
  include gitstats::config
}
