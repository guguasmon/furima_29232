function itemprice() {
  const price = document.getElementById("item-price");
   price.addEventListener("input", (e) => {
    let add_tax_price = document.getElementById("add-tax-price");
    let profit = document.getElementById("profit");
    add_tax_price.innerHTML = e.target.value * 0.1;
    profit.innerHTML = e.target.value - add_tax_price.innerHTML;
  });
};
window.addEventListener("load", itemprice);