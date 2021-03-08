const exchangeIds = {
                      'bitfinex': [],
                      'kraken': [],
                      'binance': [],
                      'bitflyer': [],
                      'bitstamp': [],
                      'coinbasepro': [],
                    }
var requestOptions = {
  method: 'GET',
  redirect: 'follow'
};

const fetchCoinCapData = () => {
  Object.keys(exchangeIds).forEach(key => {

    fetch(`https://api.coincap.io/v2/markets?exchangeId=${key === 'coinbasepro' ? 'gdax' : key}&limit=2000`, requestOptions)
      .then(response => response.text())
      .then(result => {
        let obj = JSON.parse(result)
        obj.data.forEach(d => {
          exchangeIds[key].push(d)
        })
        console.log(exchangeIds)
        // obj.data.forEach(d => {
        //   if(d.exchangeId === 'bitfinex') console.log(d);
        // })
      })
      .catch(error => console.log('error', error));
  })
  // const fetchExchangeData = ex => {
  //   fetch(`https://api.coincap.io/v2/markets?exchangeId=${ex}limit=2000`, requestOptions)
  //     .then(response => response.text())
  //     .then(result => {
  //       let obj = JSON.parse(result)
  //       obj.data.forEach(d => {
  //         if(d.exchangeId === 'bitfinex') console.log(d);
  //       })
  //     })
  //     .catch(error => console.log('error', error));
  // }
}

export { fetchCoinCapData };
