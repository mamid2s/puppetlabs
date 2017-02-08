class base::ssh {
#	$ssh_name = $osfamily ? {
#		'RedHat' => 'sshd',
#		'Debian' => 'ssh',
#		'default' => 'value',
#	}
#     	case $osfamily {
#		'RedHat': {$ssh_name ='sshd'},
#		'Debian': {$ssh_name = 'ssh' },
#		'default': { warning('OS not support by puppet module SSH')},
#	}

	package {'openssh-package':
		name => 'openssh-server',
		ensure => present,
		before => File['/etc/ssh/sshd_config'],
	}
	file {'/etc/ssh/sshd_config':
		ensure => file,
		owner => 'root',
		group => 'root',
		source => 'puppet:///modules/base/sshd_config',
		require => Package['openssh-package'],
		notify => Service['ssh-service'],		

	}
	service {'ssh-service':
		name => $base::params::ssh_name,
		alias => ssh-service-name2,
		ensure => running,
		enable => true,

}

}
