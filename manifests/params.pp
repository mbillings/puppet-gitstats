# ===Class: gitstats::params.pp
#
# Modify variables as necessary

class gitstats::params
{
  $admin_email             = 'linux@host.com'
  $apache_owner            = 'apache'
  $apache_group            = 'apache'
  $apache_mode             = '0664'
  $document_root           = '/var/www/html/gitstats'
  $git_all_repos           = '/home/git/repositories/all-repos'
  $git_apache_config       = '/etc/httpd/conf.d/gitstats.conf'
  $git_document_root       = '/home/git/repositories/gitstats'
  $git_repos_dir           = '/home/git/repositories'
  $gitstats_script         = '/usr/local/sbin/gitstats.sh'
  $ipaddr                  = '192.168.10.10'
  $port                    = '9001'
  $server_name             = 'gitstats.host.com'
  $ssl_cert                = 'gitstats_host_com_cert.cer'
  $ssl_interm              = 'gitstats_host_com_interm.cer'
  $ssl_key                 = 'gitstats_host_com.key'
}

