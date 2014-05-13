class pecl::install {

  if !defined(Class['devutils']) {
    include devutils
  }
  if !defined(Php5::Module['dev']) {
    php5::module { 'dev': 
      ensure  => 'pin'
    }
  }

  php5::module {'php-pear':
    ensure      => 'pin',
    modulename  => 'php-pear',
    require     => [ Class["php5::common"], Class["devutils"] ]
  }
}
