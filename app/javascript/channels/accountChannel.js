import consumer from "./consumer";
import * as organizer from '../components/bitfinexSocketOrganizer/index.js';

const initAccountCable = () => {
  const BfxApiContainer = document.getElementById('bitfinex-api');
  if (BfxApiContainer) {
    const channel = consumer.subscriptions.create({ channel: "AccountChannel" }, {
      connected: () => { console.log('account connected')},
      received: data => {
        const response = JSON.parse(data);
        console.log(response)
        switch (response[1]) {
          case 'hb':
            console.log('it was case hb');
            break;
          case 'bu':
          console.log('it was case bu')
            organizer.balanceChecker(response);
            break;
          case 'os':
            console.log('it was case os')
            organizer.orderChecker(response);
            break;
          case 'ws':
            console.log('it was case ws')
            organizer.walletChecker(response);
            break;
          case 'ps':
            console.log('it was case ps')
            organizer.positionChecker(response);
        }

      },
    });
  }
}

export { initAccountCable };
