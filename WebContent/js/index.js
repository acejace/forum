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