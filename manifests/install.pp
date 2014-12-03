class pecl::install {

  include devutils

  if !defined(Softec_php::Extension['dev']) {
    softec_php::extension { 'dev':}
  }

  softec_php::extension {'php-pear':
    package => 'php-pear',
    require => Class["devutils"]
  }
}
