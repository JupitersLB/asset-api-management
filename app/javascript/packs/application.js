// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { fetchBitcoinTicker } from '../components/bitcoinTicker';
import { coincapTicker } from '../components/assetTicker';

// import { fetchCoinCapData } from '../components/coinCap';
import { initBitcoinCable } from '../channels/bitcoinChannel';
import { initAccountCable } from '../channels/accountChannel';
import { initBitflyerCable } from '../channels/bitflyerChannel';
import { initKrakenCable } from '../channels/kraken_channel';



document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  fetchBitcoinTicker();
  coincapTicker();
  // fetchCoinCapData();
  initBitcoinCable();
  initAccountCable();
  initBitflyerCable();
  initKrakenCable();

  });
