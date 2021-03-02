window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  // console.log(priceInput);
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  // })

  const addTaxPrice = document.getElementById("add-tax-price");
  console.log(addTaxPrice);
  
  // const Profit = document.getElementById("profit");
  // console.log(Profit);

  // priceInput.addEventListener("input", () => {
  //   const inputValue = priceInput.value;
  //   console.log(inputValue);
  // })

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
  //  console.log(value_result)
  //   profitNumber.innerHTML = (Math.floor(inputValue - value_result));
  //     console.log(profitNumber);
  //  const profitDom = document.getElementById("profit");
  //  profitDom.innerHTML = Math.floor((inputValue - addTaxDom ))

  const profitNumber = document.getElementById("profit")
  const value_result = inputValue * 0.1
    console.log(value_result)
  profitNumber.innerHTML = (Math.floor(inputValue - value_result));
    console.log(profitNumber);


 }) 
})