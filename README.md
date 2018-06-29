# crypto trading bot analysis platform based on gekko

## Installation
This project is designed to be run in docker and on multiple machines, but it is not necessary to operate it that way. If you choose not to use docker the basic workflows are as follows:
gekko:
	`cd gekko`
	`npm i`
	`npm run start`
api:
	`cd backend`
	`npm i`
	`npm run start`
ui:
	`cd ui`
	`npm i`
	`npm run start`

otherwise all projects can be built by running
	`docker-compose build`
and executed with
	`docker-compose up`


## Collecting results
The previous three projects exist to support the main backtest runner, gekkoga. It is not designed to run in docker and must be run directly from the command line #todo #fixme

### test-runner:
#### Run on bare metal:
	`cd test-runner`
	It can be configured with:
		`npm run configure`
		which will prompt with the available coin data to set up the run script
	It is run with:
		`npm run backtest-now`
	Both commands are executed by:
		`npm run backtest`

#### Run in docker
	The basic run command looks like this
		`ASSET={asset} CURRENCY={currency} EXCHANGE={exchange} TIME={time} docker-compose up -d test-runner`
		where time is in hours and all data matches existing gekkoga backtest data
	If you are sure, for example, that the asset only has one currency pair on one exchange you can do this:
		`ASSET=BTC TIME=24 docker-compose up -d test-runner`
	If you'd prefer to be prompted based on the available coins the `configure` portion can be run on the bare metal before running the container:
		`cd test-runner`
		`npm run configure`
			^ answer the interactive prompt
		`docker-compose up -d test-runner`
	A script for running backtests exists at `./run-backtests.sh`. It will run `npm run configure` after setting `GEKKO_HOST` to `crypto` and prompt you for these values before running `docker-compose up -d test-runner`


If you'd like to run an individual backtest you don't need to start docker, just run the following:
gekkoga:
	`cd gekko/gekkoga`
	`node ./run -c {path to}/{strategy}.js` where `strategy` is the name of the configuration file for the strategy to be tested


The gekko UI will be available at `localhost:3000` and the main UI will be available as `localhost:3001`. The backend api will be available at `localhost:8000`.

If you just want to run backtests you only need to run:
	`docker-compose up -d gekko`
If you only need to examine results you can run:
	`docker compose up -d ui`
