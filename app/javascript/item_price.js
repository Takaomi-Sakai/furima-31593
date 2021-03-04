window.addEventListener('load', () => {


  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  

  const addTaxPrice = document.getElementById("add-tax-price");
  

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

  const profitNumber = document.getElementById("profit")
  const value_result = inputValue * 0.1
  
  profitNumber.innerHTML = (Math.floor(inputValue - value_result));
  


 }) 
})