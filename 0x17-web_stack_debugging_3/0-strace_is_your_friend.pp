# Fixes apace 5xx err

exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/ /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/',
}
