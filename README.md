<h1 align="center">Directional Scalper Multi Exchange</h1>
<p align="center">
A hedge scalping strategy based on directional analysis using a quantitative approach<br>
</p>
<p align="center">
<img alt="GitHub Pipenv locked Python version" src="https://img.shields.io/github/pipenv/locked/python-version/donewiththedollar/directionalscalper"> 
<a href="https://github.com/donewiththedollar/directionalscalper/blob/main/LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg">
<a href="https://github.com/psf/black"><img alt="Code style: black" src="https://img.shields.io/badge/code%20style-black-000000.svg"></a>
</p>

>  Working exchanges: Bybit, Bitget, Huobi
 
>  Exchanges that are WIP: Binance, MEXC, Phemex
 
>  Minor bugs: Possible rate limiting issue with Bitget that may cause bot to stop
 
>  Huobi is attempting to place TP when TP is already placed (order IDs are resolved properly but maybe not interpreted correctly)

### Links
* Dashboard: https://tradesimple.xyz
* API: http://api.tradesimple.xyz/data/quantdata.json
* APIv2: http://api.tradesimple.xyz/data/quantdatav2.json

Directional Scalper        |  API Scraper
:-------------------------:|:-------------------------:
![](https://github.com/donewiththedollar/directional-scalper/blob/main/directional-scalper.gif)  |  ![](https://github.com/donewiththedollar/directional-scalper/blob/main/scraper.gif)

## Quickstart
- Clone the repo `git clone https://github.com/donewiththedollar/directionalscalper.git`
- Install requirements `pip3.11 install -r requirements.txt`
 
### Install Instructions
Steps to set up bot-multiexchange

- `sudo apt-get update`
- `sudo apt-get upgrade -y`
- `git clone https://github.com/donewiththedollar/directionalscalper.git —branch bot-multiexchange`

Now you have the bot, but need to set up python correctly.


Now install Python 3.11

All of these commands one by one copy and pasted into terminal: 
`wget https://www.python.org/ftp/python/3.11.0/Python-3.11.0.tgz`
`tar -xvf Python-3.11.0.tgz`

`cd Python-3.11.0`

- `sudo apt-get update`
- `sudo apt-get install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev libbz2-dev`

- `/configure --enable-optimizations`
- `make`
- `sudo make altinstall`

- `python3.11 --version`

> After typing python3.11 —version, it should display that you have python3.11 installed 

> Now install PIP

- `curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11`

- `pip3.11 -V`

This pip3.11 -V should show you have pip3.11 installed, no error.


Starting the bot for the first time making sure it works

Make sure you are in the directory bot-multiexchange

- `so cd ~/bot-multiexchange should bring you there if you are not already there.`

> Run these:

- `pip3.11 install -r requirements.txt`

> Modify your config_example.json file with your bitget API keys and then run this:
- `python3.11 bot.py --exchange bitget --symbol OPUSDT_UMCBL --strategy bitget_hedge_dynamic --config config_example.json`

 
### Setting up the bot
 1. Create `config.json` from `config.example.json` in /configs directory
 2. Enter exchange_api_key and exchange_api_secret
 3. Check/fill all other options. For telegram see below

 ### Setting up Telegram alerts
 1. Get token from botfather after creating new bot, send a message to your new bot
 2. Go to https://api.telegram.org/bot<bot_token>/getUpdates
 3. Replacing <bot_token> with your token from the botfather after creating new bot
 4. Look for chat id and copy the chat id into config.json
 
### Starting the bot
* Hedge strategy is recommended, but you can of course use the other strategies as well. Low entry size is recommended.

> python3.11 bot.py --exchange bitget --symbol XRPUSDT_UMCBL --amount 15 --strategy bitget_hedge --config config_main.json

> python3.11 bot.py --exchange bybit --symbol XRPUSDT --amount 1 --strategy bybit_hedge --config config_sub1.json
 
> python3.11 bot.py --exchange huobi --symbol XRPUSDT --amount 1 --strategy huobi_hedge --config config_whatever.json
 
* Example of starting a different strategy. In this example amount is not needed, as it is dynamic based on minimum required by Bitget.
 
> python3.11 bot.py --exchange bitget --symbol XRPUSDT_UMCBL --strategy bitget_hedge_dynamic --config config_main.json

 
# Current strategies
## Bybit
* bybit_hedge
* bybit_longonly
* bybit_shortonly
 
## Bitget 
* bitget_hedge
* bitget_hedge_dynamic
* bitget_longonly_dynamic
* bitget_shortonly_dynamic
 
## Huobi
* huobi_hedge
 
 
### Parameters
> --config', type=str, default='config.json', help='Path to the configuration file')

> --exchange', type=str, help='The name of the exchange to use')

> --strategy', type=str, help='The name of the strategy to use')

> --symbol', type=str, help='The trading symbol to use')

> --amount', type=str, help='The size to use')

### Docker
To run the bot inside docker container use the following command:
> docker-compose run directional-scalper python3 bot.py --mode hedge --symbol GALAUSDT --iqty 1 --tg off

### Proxy
If you need to use a proxy to access the Exchange API, you can set the environment variables as shown in the following example:
```bash
$ export HTTP_PROXY="http://10.10.1.10:3128"  # these proxies won't work for you, they are here for example
$ export HTTPS_PROXY="http://10.10.1.10:1080"
```

### Developer instructions
- Install developer requirements from pipenv `pipenv install --dev` (to keep requirements in a virtual environment)
- Install pre-commit hooks `pre-commit install` (if you intend to commit code to the repo)
- Run pytest `pytest -vv` (if you have written any tests to make sure the code works as expected)


### To do:
* Instance manager
* Auto calculation for violent parameters (violent_multiplier and wallet_exposure are key)
* Auto calculation for lot size so the user does not have to determine size
* Take over all exchanges


### Donations
If you would like to show your appreciation for this project through donations, there are a few addresses here to choose from
* **BTC**: bc1q9hyvvtcsm0k39svz59hjgz4f6dr6c2k4wlrxmc
