window.addEventListener('turbo:load', () => {
  
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    // 販売手数料
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    
    // 販売利益
    const addProfDom = document.getElementById("profit");
    addProfDom.innerHTML = Math.floor(inputValue * 0.9)

  })

});

