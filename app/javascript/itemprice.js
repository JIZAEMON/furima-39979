const item = () => {

  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    // 販売手数料
    const addTaxDom = document.getElementById("add-tax-price");
    const tax = Math.floor(inputValue * 0.1)
    addTaxDom.innerHTML = tax
    
    // 販売利益
    const addProfDom = document.getElementById("profit");
    const prof = inputValue - tax
    addProfDom.innerHTML = prof

  })
}

window.addEventListener("turbo:load", item);
window.addEventListener("turbo:render", item);

