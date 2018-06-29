cd test-runner
npm i
GEKKO_HOST=gekko npm run configure
cd ..
docker-compose up -d test-runner