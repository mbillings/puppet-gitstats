puppet-gitstats
===============

A parameterized Puppet module for auto-deploying (https://github.com/hoxu/gitstats "gitstats") on a RHEL-based distro. 

## What does this module do?

- Auto-deploys gitstats
- Sets a cron job to run every hour and update
- Creates an Apache landing page linking to all your repos 
- Conglomerates statistics on your repos

## Landing page
![Gitstats auto-created landing page](https://raw.github.com/mbillings/puppet-gitstats/master/pics/gitstats_landing_page.jpg "Gitstats auto-created landing page")

## General info
![All repos overview](https://raw.github.com/mbillings/puppet-gitstats/master/pics/gitstats_all-puppet-modules_overview.jpg "All repos overview")

## Activity
![Gitstats activity for all repos](https://raw.github.com/mbillings/puppet-gitstats/master/pics/gitstats_activity.jpg "Gitstats activity for all repos")

## Requirements

* Apache (for now)
* git (and git repos)

## Caveats (to be fixed and modularized eventually)

- Assumes your repositories are all within the same directory
- Apache is your web server of choice

