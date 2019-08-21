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
