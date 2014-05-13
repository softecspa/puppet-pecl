# == Define: pecl::pecl_module_install
#
# this class manage php extension through pecl
#
# === Parameters
#
# [*ensure*]
#   if "present" php extension will be installed
#   if "absent" php extension will be uninstalled
#
# === Examples
#
# Provide some examples on how to use this type:
#
#   pecl::pecl_module_install {"apc":
#     ensure => "present"
#   }
#
# === Authors
#
# Felice Pizzurro <felice.pizzurro@softecspa.it>
#
define pecl::pecl_module_install($ensure="present") {

    include pecl

    Exec {
      require => [ Class['pecl'], Package['php5-dev'] ]
    }

    if $ensure == present {
        exec { "pecl-install-${name}":
            command => "/bin/echo yes | pecl install ${name}",
            unless  => "/usr/bin/pecl info ${name}",
            require => Package['php5-dev'],
        }
    }
    else {
        exec { "pecl-uninstall-${name}":
            command => "/usr/bin/pecl uninstall ${name}",
            onlyif  => "/usr/bin/pecl info ${name}",
        }
    }
}
