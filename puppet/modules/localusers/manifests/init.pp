class localusers {
	user {'admin':
		ensure    => present,
		shell     => '/bin/bash',
		home      => '/home/admin',
		gid       => 'wheel',
		managehome=> true,  
		password  => '$6$zF1gnIEY$JLga.KS/WIUDXmmAV/WZQw8A.4SgVZrbF5TtmsYvK6IifwGd7Pw06SimW3qhhMNh9KXJAAC0u5WQtZJ5O.jTk1',
	     }
	user {'jeff':
		ensure => present,
		shell     => '/bin/bash',
                home      => '/home/jeff',
                groups    => ['wheel','finance'],
                managehome=> true,
             }

}
