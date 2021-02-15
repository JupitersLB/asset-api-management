const orderChecker = data => {
  const orderContainer = document.getElementById('orders');
  console.log('hello from order checker');
  console.log(data);
  orderContainer.innerHTML = data[2]
}

export { orderChecker };
