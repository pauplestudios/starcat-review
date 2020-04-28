curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose -f docker-compose.yml up -d
chmod +x ./bin/wait-for-it.sh
./bin/wait-for-it.sh http://localhost:81
ls /usr/bin/