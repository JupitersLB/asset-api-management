import consumer from "./consumer";

const initWalletCable = () => {
  const walletContainer = document.getElementById('wallet-balances');
  console.log(walletContainer)
  if (walletContainer) {
    const channel = consumer.subscriptions.create({ channel: "AccountChannel" }, {
      connected: () => { console.log('wallet connected')},
      received: data => {
        console.log(data)
      },
    });
  }
}

export { initWalletCable };
