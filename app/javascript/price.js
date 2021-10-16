window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(priceInput.value * 0.1));
    console.log(addTaxDom);
  const Benefit = document.getElementById("profit");
    Benefit.innerHTML = (Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1)));
    console.log(Benefit);
})
});
