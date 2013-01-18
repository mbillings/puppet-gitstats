# ===Class: gitstats::config.pp
#
# Modify variables as necessary

class gitstats::config
{
  $packages = ["git", "gnuplot", "httpd"]
  
  package { $packages: ensure => installed }

  # Ensure Apache service is running
  service { 'httpd':
            enable    => true,
            ensure    => running,
            hasstatus => true,
		  }

  # Auto-pull from our git repos
  file { "Conglomerate gitstats reporting":
	     path	 => $gitstats::params::gitstats_script,
	     owner	 => "root", group => "root", mode => "0700",
	     content => template("gitstats/gitstats.sh.erb");
	   }

  # Dummy repo to collect git info
  file { "Dummy repo to report on all repos":
         path   => $gitstats::params::git_all_repos,
         ensure => directory;
       }

  # Place to dump compiled gitstat html info
  file { "Output directory for gitstats":
         path   => $gitstats::params::document_root,
         ensure => directory;
       }

  # Clone gitstats to this directory
  file { "Gitstats directory":
         path  => $gitstats::params::git_document_root,
         ensure  => directory;
       }

  # Gitstats apache config
  file { "Gitstats apache config":
         path    => $gitstats::params::git_apache_config,
         owner   => $gitstats::params::apache_owner, 
         group   => $gitstats::params::apache_group, 
         mode    => $gitstats::params::apache_mode,
         content => template("gitstats/gitstats-apache.conf.erb");
       }

  # Schedule gitstats to pull once an hour during working hours of working days
  cron { "Run gitstats once per hour":
         ensure  => present,
         command => "nice -10 /usr/local/sbin/gitstats.sh",
         user    => "root",
         minute  => "57",
         hour    => "7-16",
         weekday => "1-5",
       }

  # Order of operations (top to bottom)
  File["Conglomerate gitstats reporting"] -> 
  File["Dummy repo to report on all repos"] -> 
  File["Output directory for gitstats"] -> 
  File["Gitstats directory"] ->
  File["Gitstats apache config"] ->
  Cron["Run gitstats once per hour"]
}
