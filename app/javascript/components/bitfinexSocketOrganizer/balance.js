const balanceChecker = data => {
  const balanceContainer = document.getElementById('total-balance');
  console.log('hello from balance checker');
  console.log(data);
  if (data[2]) balanceContainer.innerHTML = data[2][0]
}
export { balanceChecker };
