function Search() {
  // Declare variables
  var input, filter, row, a, i, txtValue;
  input = document.getElementById("searchbar");
  filter = input.value.toUpperCase();
  row = document.getElementById("row");
  label = document.getElementsByClassName("col-12")

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < label.length; i++) {
    a = label[i]
    if (row) {
      txtValue = a.textContent || a.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        label[i].style.display = "";
      } else {
        label[i].style.display = "none";
      }
    }
  }
}
const searchbar = document.querySelector("#searchbar")
searchbar.addEventListener("keyup",(event)=>{
  Search()
})

const rawCards = document.querySelectorAll(".cards");
const imStupid = [];

const generateCards = () => {
  rawCards.forEach((card) => {
    random = new Object;
    random.html = card
    random.price_tag = card.querySelector(".price_tag").innerText
    imStupid.push(random);
  })
  console.log(imStupid)
}

const sel = document.getElementById("dropdown");

const activateSelect = () => {
  sel.onchange = function(){
    const text = sel.options[sel.selectedIndex].text;
    imStupid.forEach((obj) => {
      console.log(obj)
      if (text == "") {
        obj.html.style.display = "";
      } else if (text == obj.price_tag) {
        obj.html.style.display = "";
      } else {
        obj.html.style.display = "none";
      }
    })
  };
}

const activateTheWholeFuckingThing = () => {
  generateCards();
  activateSelect();
}

activateTheWholeFuckingThing();
