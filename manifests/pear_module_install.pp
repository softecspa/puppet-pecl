# == Define: pecl::pear_module_install
#
# this class manage php extension through pear
#
# === Parameters
#
# Document parameters here
#
# [*namevar*]
#   php extension name 
#
# [*ensure*]
#   if "present" php extension will be installed
#   if "absent" php extension will be uninstalled
#
# === Examples
#
# Provide some examples on how to use this type:
#
#   pecl::pear_module_install {"HTTP_Request": 
#     ensure => "present"
#   }
#
# === Authors
#
# Felice Pizzurro <felice.pizzurro@softecspa.it>
#


define pecl::pear_module_install($ensure="present") {

    include pecl

    #$php5confd = "/etc/php5/conf.d"

    if $ensure == present {

        exec { "pear-install-${name}":
            command => "pear install ${name}",
            unless  => "pear info ${name}",
            require => Class["pecl::install"],
        }
    }
    else {

        exec { "pear-uninstall-${name}":
            command => "pear uninstall ${name}",
            onlyif  => "pear info ${name}",
            require => Class["pecl:install"],
        }
    }
}
