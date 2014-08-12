
# git install plus checkout the aba project
include git
vcsrepo { '/vagrant/ABALookup':
	ensure   => latest,
	provider => git,
	source   => 'https://github.com/MUNComputerScienceSociety/ABALookup.git',
}
