class { 'php':
	service => 'nginx'
}

php::module { "fpm": }
php::module { "curl": }
php::module { "sqlite": }
php::module { "intl": }


# Make sure php5-fpm is running
service { 'php5-fpm':
	ensure => running,
	require => Package['php5-fpm'],
}