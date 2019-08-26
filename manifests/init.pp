class puphpet  (
  $extra_config_files = []
) {

  class { '::puphpet::params':
    extra_config_files => $extra_config_files,
  }

  Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
  Vcsrepo { require => Package['git'] }

  # include ::puphpet::cron
  # include ::puphpet::firewall
  # include ::puphpet::locale
  # include ::puphpet::resolv
  # include ::puphpet::ruby
  # include ::puphpet::server
  # include ::puphpet::usersgroups

  if array_true($puphpet::params::hiera['apache'], 'install') {
    include ::puphpet::apache::install
  }

  if array_true($puphpet::params::hiera['mysql'], 'install') {
    include ::puphpet::mysql::install
  }

  # if array_true($puphpet::params::hiera['nodejs'], 'install') {
  #   include ::puphpet::nodejs::install
  # }

  # if array_true($puphpet::params::hiera['php'], 'install') {
  #   include ::puphpet::php::install
  # }

  # if array_true($puphpet::params::hiera['rabbitmq'], 'install') {
  #   include ::puphpet::rabbitmq::install
  # }

  if array_true($puphpet::params::hiera['letsencrypt'], 'install') {
    include ::puphpet::letsencrypt::install
  }

}
