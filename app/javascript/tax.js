function post (){
const price = document.getElementById("item-price");
price.addEventListener("keyup",() => {
  const addtaxprice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  const tax = Math.floor(price.value*0.1);
  addtaxprice.innerHTML = tax;
  profit.innerHTML = price.value-tax;
});
};

window.addEventListener('load',post);