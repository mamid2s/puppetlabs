class base::motd {
	$author = "anthony"

	file {'/etc/motd':
	ensure => file,
	owner => "root",
	group => "root",
	content => template('base/motd.erb'),
	mode => "0644",
	}


}
