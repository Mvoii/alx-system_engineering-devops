# create a file
file {'/tmp/school':
ensure  => present,
mode    => '0744',
content => 'Ilove Puppet',
owner   => 'www-data',
group   => 'www-data',
}
