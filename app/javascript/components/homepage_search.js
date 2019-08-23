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
}

const sel = document.getElementById("dropdown");

const activateSelect = () => {
  sel.onchange = function(){
    const text = sel.options[sel.selectedIndex].text;
    imStupid.forEach((obj) => {
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



window.onscroll = function() {myFunction()};

// Get the navbar
let navbar = document.querySelector(".nav-container")

// Get the offset position of the navbar
var sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}

const cards = document.querySelectorAll(".cards");
const imGenius = [];

const pushCards = () => {
  cards.forEach((card) => {
    random = new Object;
    random.html = card
    random.rating = card.querySelector(".review-cards-f").innerText
    imGenius.push(random);
  })
}
const selection = document.getElementById("dropdown_reviews");
const activate = () => {
  selection.onchange = function(){
    const text_review = selection.options[selection.selectedIndex].text;
    console.log(text_review)
    imGenius.forEach((obj) => {
      console.log(obj.rating)
      if (text_review == "") {
        obj.html.style.display = "";
      } else if (text_review.length == obj.rating.length - 8) {
        obj.html.style.display = "";
      } else {
        obj.html.style.display = "none";
      }
    })
  };
}

const activate_everything= () => {
  pushCards();
  activate();
}

activate_everything();


