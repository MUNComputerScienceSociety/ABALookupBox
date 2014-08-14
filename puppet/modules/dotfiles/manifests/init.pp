class dotfiles {
	# dotfiles/manifests/init.pp

	file { "/home/vagrant/.bash_profile":
		mode => 644,
		source => "puppet:///modules/dotfiles/.bash_profile",
	}

	file { "/home/vagrant/.hushlogin":
		ensure => file
	}
}