
//check current page class
function getPageClass(){
	return document.body.getAttribute("class");
}

//if any input is empty, return false, else return true
function validateInputs(inputs){
	var missing = false;
	let missinginputs = "";
	for (var i =0; i<inputs.length; i++){
		if (inputs[i].value == "") {
			console.log(inputs[i].name +" is empty");
			missinginputs += "Please fill out " + inputs[i].name + "<br>"; 
			missing = true;
		}
	}
	if (missing) {
		console.log(missinginputs);
		document.getElementsByClassName("invalidInput")[0].innerHTML = missinginputs;
		return false;
	}
	return true;;
}

function submitted() {
	var form = document.getElementsByClassName("form")[0];
	var inputs = form.getElementsByTagName("input");
	
	return validateInputs(inputs)
}

function loginSubmit() {
	var form = document.getElementById("signup");
	var inputs = form.getElementsByTagName("input");
	
	return validateInputs(inputs)
}
function editProfileUrl(){
	
}

function hideTable(){
	var button =  document.getElementById("showPostOrder");
	var h1Text = document.getElementById("displayType");
	var elementTop = document.getElementById("top");
	var elementRecent = document.getElementById("recent");
	
	//display recent posts
	if (button.value =="top"){
		elementTop.classList.remove("hidden");
		elementRecent.classList.add("hidden");
		button.value ="recent";
		button.innerHTML = "Show Most Upvoted Posts";
		h1Text.innerHTML = "displaying the most recent posts first";
	} else{ //display top posts
		elementTop.classList.add("hidden");
		elementRecent.classList.remove("hidden");
		button.value ="top";
		button.innerHTML = "Show Most Recent Posts";
		h1Text.innerHTML = "displaying the most upvoted posts first";
	}
	
}

function hideLimitTable(){
	var button =  document.getElementById("showPostOrder");
	var h1Text = document.getElementById("displayType");
	var elementTop = document.getElementById("top");
	var elementRecent = document.getElementById("recent");
	
	//display recent posts
	if (button.value =="top"){
		elementTop.classList.remove("hidden");
		elementRecent.classList.add("hidden");
		button.value ="recent";
		button.innerHTML = "Show Most Upvoted Posts";
		h1Text.innerHTML = "displaying the 25 most recent posts";
	} else{ //display top posts
		elementTop.classList.add("hidden");
		elementRecent.classList.remove("hidden");
		button.value ="top";
		button.innerHTML = "Show Most Recent Posts";
		h1Text.innerHTML = "displaying the 25 most upvoted posts";
	}
	
}
function goBack() {
	  window.history.back();
	}



var autoExpand = function (field) {

	// Reset field height
	field.style.height = 'inherit';

	// Get the computed styles for the element
	var computed = window.getComputedStyle(field);

	// Calculate the height
	var height = parseInt(computed.getPropertyValue('border-top-width'), 10)
	             + parseInt(computed.getPropertyValue('padding-top'), 10)
	             + field.scrollHeight
	             + parseInt(computed.getPropertyValue('padding-bottom'), 10)
	             + parseInt(computed.getPropertyValue('border-bottom-width'), 10);

	field.style.height = height + 'px';

};

var width = $(window).width(); 

//onscroll animation
window.onscroll = function(){
	if ((width >= 900)){
	    if(document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
	        $(".main").css("background-size","150% auto");
	    }else{
	        $(".main").css("background-size","100% auto");        
	    }
	}
	};
//animate click on #link
$(document).ready(function(){
	$("a").on('click', function(event) {
        if (this.hash !== "") {
          event.preventDefault();
          var hash = this.hash;
          $('body,html').animate({
          scrollTop: $(hash).offset().top
          }, 1200, function(){
          window.location.hash = hash;
        });
        } 
    });
});
//Checks if textarea can be resized on input.
document.addEventListener('input', function (event) {
	if (event.target.tagName.toLowerCase() !== 'textarea') return;
	autoExpand(event.target);
}, false);

document.addEventListener('click', function(event){
	if (event.target.id == "backButton") {
		goBack();
	}
},false);
//loading icon
setTimeout(function(){
    $(".loading").addClass("animated fadeOut");
    setTimeout(function(){
      $(".loading").removeClass("animated fadeOut");
      $(".loading").css("display","none");
    },800);
},1450);