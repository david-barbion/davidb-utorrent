# == Class: utorrent
#
# Full description of class utorrent here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'utorrent':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class utorrent(
$ensure              = 'present',
$bin_dir            = $::utorrent::params::bin_dir,
$pid_dir            = $::utorrent::params::pid_dir,
$config_dir         = $::utorrent::params::config_dir,
$log_dir            = $::utorrent::params::log_dir,
$settings_dir       = $::utorrent::params::settings_dir,
$bin_file           = $::utorrent::params::bin_file,
$pid_file           = $::utorrent::params::pid_file,
$config_file        = $::utorrent::params::config_file,
$log_file           = $::utorrent::params::log_file,
$run_as             = $::utorrent::params::run_as,
$package_name       = $::utorrent::params::package_name,
$package_version    = $::utorrent::params::package_version,
$download_url       = $::utorrent::params::download_url,
$download_extension = $::utorrent::params::download_extension,
$download_target    = $::utorrent::params::download_target,
$download_md5sum    = $::utorrent::params::download_md5sum,
$service_provider   = $::utorrent::params::service_provider,
) inherits utorrent::params{

  class { 'utorrent::install': }
  ~>
  class { 'utorrent::service': }

}
