# class mailcatcher::params
#
class mailcatcher::params {
  $smtp_ip          = '0.0.0.0'
  $smtp_port        = '1025'
  $http_ip          = '0.0.0.0'
  $http_port        = '1080'
  $mailcatcher_path = '/usr/local/bin'

  case $::osfamily {

    'Debian': {
      $packages = ['ruby-dev','sqlite3','libsqlite3-dev']
      $config_file = '/etc/init/mailcatcher.conf'
      $template = 'mailcatcher/etc/init/mailcatcher.conf.erb'
      $provider = 'upstart'
     }
    'Redhat': {
      $packages = ['ruby-devel', 'sqlite-devel']      
      $config_file = '/etc/init.d/mailcatcher'
      $template = 'mailcatcher/etc/init/mailcatcher.sysv.erb'
      $provider = 'redhat'
    }
    default: {
      fail("${::osfamily} is not supported.")
    }
  }
}
