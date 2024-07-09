# Update the package info
exec { 'apt-update':
  command => '/usr/bin/apt-get -y update',
  path    => ['/usr/bin', '/bin'],
}

# install nginx package
package { 'nginx':
  ensure => installed,
}

# create a basic index.html file
file { '/var/www/html/index.html':
  content => 'Hello World!',
}

# configure the nginx service to add custom http header
file_line { 'add custom header':
  ensure => present,
  path  => '/etc/nginx/sites-available/default',
  line  => '\tadd_header X-Service-By ${HOSTNAME};',
  after = > 'server_name _;',
}

# ensure nginx is running
service { 'nginx':
  ensure => running,
}
