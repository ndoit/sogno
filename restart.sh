sudo service iptables stop
sudo cp /vagrant/apps/sogno/config/sogno_nginx /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/sogno_nginx /etc/nginx/sites-enabled

kill -9 $(cat /vagrant/apps/sogno/tmp/pid/unicorn.pid)
sudo /usr/sbin/nginx -s stop
cd /vagrant/apps/sogno
bundle
bundle exec unicorn -E development -c /vagrant/apps/sogno/config/unicorn.rb.vagrant -D
sudo /usr/sbin/nginx
