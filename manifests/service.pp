class utorrent::service inherits utorrent {
  if $ensure == 'present' {
    $service_ensure = 'running'
    $service_enable = true
  }else {
    $service_ensure = 'stopped'
    $service_enable = false
  }
  service { 'utorrent':
    ensure   => $service_ensure,
    enable   => $service_enable,
    provider => $service_provider,
  }
}
