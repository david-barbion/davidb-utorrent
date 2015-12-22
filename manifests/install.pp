class utorrent::install inherits utorrent{

  archive { "${utorrent::package_name}":
    ensure           => $utorrent::ensure,
    url              => $utorrent::download_url,
    follow_redirects => true,
    extension        => $utorrent::download_extension,
    target           => $utorrent::bin_dir,
    root_dir         => '.',
    src_target       => $utorrent::download_target,
    digest_string    => $utorrent::download_md5sum,
    strip_components => '1',
  }
  
  group { $utorrent::run_as:
    ensure => $utorrent::ensure,
  }->
  user { $utorrent::run_as:
    ensure => $utorrent::ensure,
    gid    => $utorrent::run_as,
  }

  if $utorrent::ensure == 'present' {
    file { [$pid_dir, $config_dir, $log_dir, $settings_dir]:
      ensure  => directory,
      owner   => $utorrent::run_as,
      group   => $utorrent::run_as,
      mode    => '750',
      require => User[$utorrent::run_as],
    }

    file { "${utorrent::settings_dir}/webui.zip":
      ensure  => link,
      target  => "${bin_dir}/webui.zip",
      require => [Archive["${utorrent::package_name}"], File[$settings_dir]],
    }
    file { "${utorrent::config_dir}/${config_file}":
      ensure => present,
      owner  => $utorrent::run_as,
      group  => $utorrent::run_as,
    }
    # deploy service file
    if $utorrent::service_provider == 'systemd' {
      file { '/etc/systemd/system/utorrent.service':
        content => template('utorrent/utorrent.service.erb'),
      }
      file { '/etc/tmpfiles.d/utorrent.conf':
        content => template('utorrent/utorrent.tmpfiles.erb'),
      }
    }
  }
  # HACK for needed libraries on centos/rhel7
  if $::osfamily == 'redhat' and $::operatingsystemmajrelease == '7' {
    file { '/usr/lib64/libssl.so.1.0.0':
      source => 'puppet:///modules/utorrent/libssl.so.1.0.0',
      mode   => '0644',
    }
    file { '/usr/lib64/libcrypto.so.1.0.0':
      source => 'puppet:///modules/utorrent/libcrypto.so.1.0.0',
      mode   => '0644',
    }
  }
}
