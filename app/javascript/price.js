if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  function itemprice() {
    const price = document.getElementById("item-price");
    price.addEventListener("input", (e) => {
      let add_tax_price = document.getElementById("add-tax-price");
      let profit = document.getElementById("profit");
      add_tax_price.innerHTML = parseInt(e.target.value * 0.1);
      profit.innerHTML = parseInt(e.target.value - add_tax_price.innerHTML);
    });
  };
  window.addEventListener("load", itemprice);
}