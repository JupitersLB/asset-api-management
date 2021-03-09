const market = {
  base: 'ethereum',
  quote: 'bitcoin'
}

// only works for gdax(coinbase) and binance
const coincapTicker = () => {
  const tradeWs = new WebSocket('wss://ws.coincap.io/trades/binance')
  const tickerContainer = document.getElementById('nav-ticker');
  tradeWs.onmessage = function(msg) {
    let response = JSON.parse(msg.data)
    // console.log(market.base)
    // console.log(msg.data.base)
    if (response.base === market.base && response.quote === market.quote) {
      tickerContainer.innerHTML = response.price;
    }
    // console.log(JSON.parse(msg.data));
  }
}

const bitfinexTicker = () => {
  const w = new WebSocket('wss://api-pub.bitfinex.com/ws/2');
  w.onmessage = (msg) => {
    let response = JSON.parse(msg.data);
    if (response) {
      try {
        const ticker = document.getElementById('nav-ticker');
        ticker.innerHTML = `$${Math.round(response[1][6] * 100) / 100}`;
      }
      catch(err) {
        console.log(err);
      }
    }
  };

  let msg = JSON.stringify({
    event: 'subscribe',
    channel: 'ticker',
    symbol: 'tBTCUSD'
  });

  w.onopen = () => w.send(msg);
}

export { coincapTicker };
