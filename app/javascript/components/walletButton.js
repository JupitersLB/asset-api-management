const fetchWallet = () => {
  var CryptoJS = require('crypto-js') // Standard JavaScript cryptography library
  var fetch = require('node-fetch') // "Fetch" HTTP req library

  var apiKey = gon.key;
  var apiSecret = gon.secret;
  var baseUrl = gon.url
  var apiPath = '/v2/auth/r/wallets'
  var nonce = (Date.now() * 1000).toString() // Standard nonce generator. Timestamp * 1000
  const body = {} // Field you may change depending on endpoint

  let signature = `/api/${apiPath}${nonce}${JSON.stringify(body)}`
  // Consists of the complete url, nonce, and request body

  const sig = CryptoJS.HmacSHA384(signature, apiSecret).toString()

  var walletButton = document.getElementById('wallet-button');
  var walletDisplay = document.getElementById('wallet-display');

  walletButton.addEventListener('click', () => {
    fetch(`${baseUrl}${apiPath}`, {
      method: 'POST',
      body: JSON.stringify(body),
      headers: {
        'Content-Type': 'application/json',
        'bfx-nonce': nonce,
        'bfx-apikey': apiKey,
        'bfx-signature': sig
      }
    })
    .then(res => res.json())
    .then(json => console.log(json)) //Logs the response body
    .catch(err => {
        console.log(err)
    })
  })

}

export { fetchWallet };
