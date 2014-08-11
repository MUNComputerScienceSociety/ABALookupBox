
class { 'nginx': }

nginx::resource::vhost { 'abalookup.dev':
	server_name      => ['abalookup.dev'],
	www_root         => '/vagrant/ABALookup/public',
	listen_port      => 80,
	index_files      => ['index', 'index.html', 'index.htm', 'index.php'],
	try_files        => ['$uri', '$uri/', "/${try_files}\$is_args\$args"],
	ssl              => true,
	ssl_cert         => '/home/vagrant/abalookup_dev.crt',
	ssl_key          => '/home/vagrant/abalookup_dev.key',
	ssl_port         => 443,
	vhost_cfg_append => {
		'sendfile'             => 'off',
#		'ssl_certificate'      => '/home/vagrant/abalookup_dev.cert',
#		'ssl_certificate_key'  => '/home/vagrant/abalookup_dev.key',
	},
}


nginx::resource::location { "abalookup.dev-php":
	ensure              => present,
	vhost               => 'abalookup.dev',
	location            => '~ \.php$',
	proxy               => undef,
	try_files           => ['$uri', '$uri/', "/${try_files}\$is_args\$args", '=404'],
	ssl                 => true,
	www_root            => '/vagrant/ABALookup/public',
	location_cfg_append => {
		'fastcgi_split_path_info' => '^(.+\.php)(/.+)$',
		'fastcgi_param'           => 'SCRIPT_FILENAME $document_root$fastcgi_script_name',
		'fastcgi_index'           => 'index.php',
		'include'                 => 'fastcgi_params',
		'fastcgi_pass'            => 'unix:/var/run/php5-fpm.sock'
	  },
	notify              => Class['nginx::service'],
}