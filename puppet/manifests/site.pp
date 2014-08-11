# bring in per file setups
import 'nodes/*.pp'

# make sure we have /var/www
file { '/var/www/':
	ensure => 'directory',
}

# make sure that locale is set
class { 'locales':
	locales   => ['en_CA.UTF-8 UTF-8'],
}

package { ['sass']:
	ensure => 'installed',
	provider => 'gem',
}

# git install plus checkout the aba project
include git
vcsrepo { '/vagrant/ABALookup':
	ensure   => latest,
	provider => git,
	source   => 'https://github.com/MUNComputerScienceSociety/ABALookup.git',
}

# node.js
class { 'nodejs':
	version      => 'stable',
	make_install => false,
}

package { ['grunt-cli', 'bower']:
	provider => npm,
	require => Class['nodejs']
}
