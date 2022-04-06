server {
    listen ${LISTEN_PORT};
    listen 443 ssl;

    server_name rakan.engineer www.rakan.engineer;
    ssl_certificate /etc/nginx/ssl.pem;
    ssl_certificate_key /etc/nginx/sslkey.pem;

    location /static{
        alias /vol/static;
    }

    location /{
        uwsgi_pass                  ${APP_HOST}:${APP_PORT};
        include                     /etc/nginx/uwsgi_params;
        client_max_body_size        10M; 
    }
}