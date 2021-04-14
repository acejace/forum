
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

function hideTable(){
	var button =  document.getElementById("showPostOrder");
	var elementTop = document.getElementById("top");
	var elementRecent = document.getElementById("recent");
	
	var val = button.getAttribute("value");
	console.log(val);
	if (button.value =="top"){
		elementTop.classList.remove("hidden");
		elementRecent.classList.add("hidden");
		button.value ="recent";
	} else{
		elementTop.classList.add("hidden");
		elementRecent.classList.remove("hidden");
		button.value ="top";
	}
	
}

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

var width = $(window).width(); 

window.onscroll = function(){
	if ((width >= 900)){
	    if(document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
	        $(".main").css("background-size","150% auto");
	    }else{
	        $(".main").css("background-size","100% auto");        
	    }
	}
	};

setTimeout(function(){
    $(".loading").addClass("animated fadeOut");
    setTimeout(function(){
      $(".loading").removeClass("animated fadeOut");
      $(".loading").css("display","none");
    },800);
},1450);