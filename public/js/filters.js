$(document).ready(function() {



	var buttonArray = document.getElementsByClassName('filter-button')
	var photo = document.getElementById('photo')

	for(var i = 0; i<buttonArray.length; i++) {
		buttonArray[i].addEventListener("click", applyFilter)
	}
})


var applyFilter = function () {
	if (this.getAttribute('data') == "reset"){
		photo.style.removeProperty('-webkit-filter')
	} else {
		photo.style["-webkit-filter"] += this.getAttribute('data')
	}
}


