const walletChecker = data => {
  const walletContainer = document.getElementById('wallet-balances');
  console.log('hello from wallet checker');
  console.log(data);
  walletContainer.innerHTML = data[2]
}

export { walletChecker };
