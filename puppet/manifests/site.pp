# make sure we have /var/www
file { '/var/www/':
	ensure => 'directory',
}

# make sure that locale is set
class { "locales": 
	locales   => ['en_CA.UTF-8 UTF-8'],
}

# git install
include git