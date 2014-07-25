# make sure we have /var/www
file { '/var/www/':
	ensure => 'directory',
}

# make sure that locale is set
class { "locales": 
	locales   => ['en_CA.UTF-8 UTF-8'],
}

# git install plus checkout the aba project
vcsrepo { "/vagrant/abaproject":
	ensure   => present,
	provider => git,
	source   => "https://github.com/MUNComputerScienceSociety/ABALookup.git",
}