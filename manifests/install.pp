class pecl::install {

  include devutils

  if !defined(Softec_php::Extension['dev']) {
    softec_php::extension { 'dev':}
  }

  include softec_php::pear
}
