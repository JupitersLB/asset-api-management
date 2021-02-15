const positionChecker = data => {
  console.log('hello from positionChecker');
  console.log(data);
  const positionContainer = document.getElementById('postions');
  positionContainer.innerHTML = data[2]
}

export { positionChecker };
