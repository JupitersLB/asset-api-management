import consumer from "./consumer";

const initBitcoinCable = () => {
  const tickerContainer = document.getElementById('websocket-display');
  if (tickerContainer) {
    const channel = consumer.subscriptions.create({ channel: "BitfinexChannel" }, {
      connected: () => { console.log('connected')},
      received: data => {
        let response = JSON.parse(data)[1][6];
        tickerContainer.innerHTML = `$${Math.round(response * 100) / 100}`;
      },
    });
  }
}

export { initBitcoinCable };
