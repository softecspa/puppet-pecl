class pecl::varnish {

  pecl::pecl_module_install {'varnish' :
    require => Package['libvarnishapi-dev']
  }

  file {'/etc/php5/mods-available/varnish.ini':
    ensure  => present,
    mode    => 644,
    owner   => 'root',
    group   => 'root',
    content => "; GENERATED WITH PUPPET using modules/pecl/varnish\nextension=varnish.so",
  }

  file {'/etc/php5/conf.d/varnish.ini':
    ensure  => link,
    target  => '/etc/php5/mods-available/varnish.ini',
  }

  if defined(Exec['apache2-reload']) {
    File ['/etc/php5/mods-available/varnish.ini'] {
      notify  => Exec['apache2-reload'],
    }
  }

}
