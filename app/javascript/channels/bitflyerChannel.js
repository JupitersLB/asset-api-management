import consumer from "./consumer";

const initBitflyerCable = () => {
  const tickerContainer = document.getElementById('bitflyer-ticker');
  if (tickerContainer) {
    const channel = consumer.subscriptions.create({ channel: "BitflyerChannel" }, {
      connected: () => { console.log('connected')},
      received: data => {
        console.log(data.params.message.ltp);
        let response = data.params.message.ltp;
        tickerContainer.innerHTML = `¥${response}`;
      },
    });
  }
}

export { initBitflyerCable };
