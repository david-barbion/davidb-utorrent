class utorrent::params {
  $target_dir      = '/usr/share'
  $package_name    = 'utorrent-server'
  $bin_dir         = "${target_dir}/${package_name}"
  $package_version = 'alpha-v3_3'
  $bin_file        = 'utserver'
  $pid_dir         = '/var/run/utorrent'
  $pid_file        = 'utserver.pid'
  $run_as          = 'utorrent'
  $settings_dir    = '/var/lib/utorrent/'
  $config_dir      = '/etc/utorrent'
  $config_file     = 'utserver.conf'
  $log_dir         = '/var/log/utorrent'
  $log_file        = 'utserver.log'
  $download_extension = 'tgz'
  $download_target    = '/var/tmp'
  $service_provider   = 'systemd'
  case $operatingsystem {
    'redhat': {
      case $operatingsystemmajrelease {
        '7': {
          #$download_url    = 'http://download.ap.bittorrent.com/track/beta/endpoint/utserver/os/linux-x64-debian-6-0'
          #$download_md5sum    = '2b1cb8e78b0d1c9b5ae4a68ae84a48f8'
          $download_url    = 'http://download.ap.bittorrent.com/track/beta/endpoint/utserver/os/linux-x64-debian-7-0'
          $download_md5sum    = '2b79373a91bab17013348fb8ba6fe199'
          # hack for openssl libs
#          file { '/usr/lib64/libssl.so.1.0.0':
#            ensure => link,
#            target => '/usr/lib64/libssl.so.1.0.1e',
#          }
#          file { '/usr/lib64/libcrypto.so.1.0.0':
#            ensure => link,
#            target => '/usr/lib64/libcrypto.so.1.0.1e',
#          }
#          file { '/usr/lib64/libssl.so.0.9.8':
#            ensure => link,
#            target => '/usr/lib64/libssl.so.0.9.8e',
#          }
#          file { '/usr/lib64/libcrypto.so.0.9.8':
#            ensure => link,
#            target => '/usr/lib64/libcrypto.so.0.9.8e',
#          }
        }
      }
    }
    'debian': {
      case $operatingsystemmajrelease {
        '6': {
          $download_url    = 'http://download.ap.bittorrent.com/track/beta/endpoint/utserver/os/linux-x64-debian-6-0'
          $download_md5sum    = '2b1cb8e78b0d1c9b5ae4a68ae84a48f8'
        }
        '7': {
          $download_url    = 'http://download.ap.bittorrent.com/track/beta/endpoint/utserver/os/linux-x64-debian-7-0'
          $download_md5sum    = '2b79373a91bab17013348fb8ba6fe199'
        }
      }
    }
  }
}
