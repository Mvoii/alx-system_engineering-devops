# add a stable version of nginx
exec { 'add nginx stable repo':
  command => 'add-apt-repository -y ppa:nginx/stable',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

# update the package list
exec { 'update package list':
  command => 'apt-get update',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

# install nginx
package { 'nginx':
  ensure  => 'installed',
}

# allow HTTP
exec { 'allow HTTP':
  command => "ufw allow 'Nginx HTTP'",
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  onlyif  => '! dpkg -l nginx | egrep \'ii.*nginx\' > /dev/null 2>&1',
}

# change folder permissions
exec { 'chmod www folder':
  command => 'chmod -R 755 /var/www',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

# create a index file
file { '/var/www/html/index.html':
  content => "Hello World!\n",
}

# create index file
file { '/var/www/html/404.html':
  content => "Ceci n'est pas une page\n",
}

# add redirection and error page
file { 'Nginx default config file':
  ensure  => 'file',
  path    => '/etc/nginx/sites-enabled/default',
  content =>
"server {
        listen 80 default_server;
        listen [::]:80 default_server;
               root /var/www/html;
        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;
        server_name _;
        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files \$uri \$uri/ =404;
        }
        error_page 404 /404.html;
        location = /404.html {
                root /var/www/html;
                internal;
        }
        if (\$request_filename ~ redirect_me) {
                rewrite ^ http://www.youtube.com/watch?v=QH2-TGUIwu4 permanent;
        }
}
",
}

# restart nginx
exec { 'restart service':
  command => 'service nginx restart',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

# start nginx
service { 'nginx':
  ensure  => 'running',
  enable  => 'true',
  require => Package['nginx'],
}
