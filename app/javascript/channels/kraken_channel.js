import consumer from "./consumer";

const initKrakenCable = () => {
  const tickerContainer = document.getElementById('kraken-ticker');
  if (tickerContainer) {
    const channel = consumer.subscriptions.create({ channel: "KrakenChannel" }, {
      connected: () => { console.log('connected')},
      received: data => {
        if (data.length > 1) {
          let response = data[1].c[0]
          tickerContainer.innerHTML = `$${Math.round(response * 100) / 100}`;
        }
      },
    });
  }
}

export { initKrakenCable };
