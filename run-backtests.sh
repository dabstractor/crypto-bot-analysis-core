cd test-runner
npm i
GEKKO_HOST=crypto npm run configure
cd ..
docker-compose up -d test-runner