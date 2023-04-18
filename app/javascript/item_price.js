window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById('add-tax-price');
    const addSalesCommission = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = addSalesCommission;

    const addGrossProfit = document.getElementById('profit');
    addGrossProfit.innerHTML = Math.floor(inputValue - addSalesCommission);
  })
});