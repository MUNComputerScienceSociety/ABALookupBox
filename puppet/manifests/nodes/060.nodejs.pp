
# node.js
class { 'nodejs':
	version      => 'stable',
	make_install => false,
}

package { ['grunt-cli', 'bower']:
	provider => npm,
	require => Class['nodejs']
}
