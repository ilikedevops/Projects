# adding repository and installing nginx		
apt update
apt install nginx -y
cat <<EOT > multitier
upstream multitier {

 server app01:8080;

}

server {

  listen 80;

location / {

  proxy_pass http://multitier;

}

}

EOT

mv multitier /etc/nginx/sites-available/multitier
rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/multitier /etc/nginx/sites-enabled/multitier

#starting nginx service and firewall
systemctl start nginx
systemctl enable nginx
systemctl restart nginx
