window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    const profitDom = document.getElementById("profit")
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    profitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML)
    
  })
});







// function price (){
//   const itemPrice = document.getElementById("item-price");

//   itemPrice.addEventListener("change",() => {
//     const tax = (itemPrice * 0.1);
//     const profit = (itemPrice - tax);

//     const taxComma = total.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY'});
//     itemTax.innerHTML = taxCommma;
//     const profitComma = total.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY'});
//     itemProfit.innerHTML = profitCommma;

//     const displayItemTax = itemTax.innerHTML;
//     const displayItemProfit = itemProfit.innerHTML;

//     document.getElementById("add-tax-price").value = displayItemTax;
//     document.getElementById("profit").value = displayItemProfit;
//   });
// };

// Window.addEventListener("load",price);