const fetchBitcoinTicker = () => {
  const w = new WebSocket('wss://api-pub.bitfinex.com/ws/2');
  w.onmessage = (msg) => {
    let response = JSON.parse(msg.data);
    if (response) {
      try {
        const ticker = document.getElementById('bitcoin-ticker');
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

export { fetchBitcoinTicker };
