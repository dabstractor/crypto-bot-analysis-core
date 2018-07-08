cd test-runner
npm i
npm run select-strategies
GEKKO_HOST=gekko npm run configure
cd ..
docker-compose up -d test-runner