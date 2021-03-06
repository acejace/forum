
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
	var form = document.getElementById("loginForm");
	var inputs = form.getElementsByTagName("input");
	for (var i=0;i< inputs.length;i++){
		console.log(inputs[i].value);
	}
	return validateInputs(inputs)
}
function editProfileUrl(){
	
}

// returns value of parammeter from current url if any.
function getURLParameter(parameter)
{
    var pageURL = window.location.search.substring(1);
    var urlParameters = pageURL.split('&');
    for (var i = 0; i < urlParameters.length; i++) 
    {
        var parameterName = urlParameters[i].split('=');
        if (parameterName[0] == parameter) 
        {
            return parameterName[1];
        }
    }
}

function hideAllComments(){
	var comments = document.getElementById("loadComments");
	if (comments.style.display == "none"){
		comments.style.display = "block";
	} else{

		comments.style.display = "none";
	}
}
function hideComment(comment){
		comment.style.display = "none";
}
// hides table to show by recent or upvotes
function hideTable(){
	var button =  document.getElementById("showPostOrder");
	var h1Text = document.getElementById("displayType");
	var elementTop = document.getElementById("top");
	var elementRecent = document.getElementById("recent");
	
	//display recent posts
	if (button.value =="top"){
		elementTop.classList.add("hidden");
		elementRecent.classList.remove("hidden");
		button.value ="recent";
		button.innerHTML = "Show Most Upvoted Posts";
		h1Text.innerHTML = "displaying the most recent posts first";
	} else{ //display top posts
		elementTop.classList.remove("hidden");
		elementRecent.classList.add("hidden");
		button.value ="top";
		button.innerHTML = "Show Most Recent Posts";
		h1Text.innerHTML = "displaying the most upvoted posts first";
	}
	
}
function showEditPost(editButton){
	console.log("this button value is " + editButton);
	if (editButton.value=="edit"){
		document.getElementById("editPost").classList.remove("hidden");
		document.getElementById("viewCurrentPost").classList.add("hidden");
		editButton.value=="";
	}else{
		console.log("hiding edit post");
		document.getElementById("editPost").classList.add("hidden");
		document.getElementById("viewCurrentPost").classList.remove("hidden");
		editButton.value=="edit";
	}
}


function logOut(){
	window.location.href = "logout.jsp";
}
function logIn(){
	window.location.href = "login.jsp";
}
function signUp(){
	window.location.href = "signup.jsp";
}
function goBack() {
	  window.history.back();
	}
function loadComments(){
	var post_id = getURLParameter("post_id");
	if (post_id!=null){

		$("#loadComments").load("loadComments.jsp", {post_id: post_id});
	}
}
//expand function for textbox
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

function searchPost() {
	  // Declare variables
	  var input, filter, loadPosts, posts, txtValue;
	  input = document.getElementById('postSearchBar');
	  filter = input.value.toUpperCase();
	  loadPosts = document.getElementById("loadPosts");

	  posts = loadPosts.getElementsByClassName('postName');
	  // Loop through all list items, and hide those who don't match the search query
	  for (var i = 0; i < posts.length; i++) {
		txtValue = posts[i].innerHTML;
	    if (txtValue.toUpperCase().indexOf(filter) > -1) {
	    	posts[i].parentElement.parentElement.parentElement.style.display = "";
	    } else {
	    	posts[i].parentElement.parentElement.parentElement.style.display = "none";
	    }
	  }
	}
function searchUsers() {
	  // Declare variables
	  var input, filter, loadPosts, users, txtValue;
	  input = document.getElementById('userSearchBar');
	  filter = input.value.toUpperCase();
	  loadUsers = document.getElementById("loadUsers");

	  users = loadUsers.getElementsByClassName('currTableUser');
	  console.log(users);
	  // Loop through all list items, and hide those who don't match the search query
	  for (var i = 0; i < users.length; i++) {
		txtValue = users[i].innerHTML;
	    console.log(users[i]);
	    if (txtValue.toUpperCase().indexOf(filter) > -1) {
	    	users[i].parentElement.style.display = "";
	    } else {
	    	users[i].parentElement.style.display = "none";
	    }
	  }
	}
	

var width = $(window).width(); 
var height = $(window).height(); 

function loadUsers(){
	$("#loadUsers").load("loadAllUsers.jsp");
}
function loadPosts(){
	$("#loadPosts").load("loadPosts.jsp");
}
function loadLimitPosts(){
	$("#loadLimitPosts").load("loadLimitPosts.jsp");
}
function loadHeader(){
	$("#loadHeader").load("loadHeader.jsp");
}
function loadCornerNav(){
	console.log("loading corner nav");
	$("#cornerNav").load("loadCornerNav.jsp");
}


//load stuff
loadUsers();
loadCornerNav();
loadHeader();
loadPosts();
loadLimitPosts();
loadComments();


$(".main").css("background-size","100% auto");      
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
	


//Checks if textarea can be resized on input.
document.addEventListener('input', function (event) {
	if (event.target.tagName.toLowerCase() !== 'textarea') return;
	autoExpand(event.target);
}, false);

//add event listeners on click (mainly used for buttons)
document.addEventListener('click', function(event){
	if (event.target.id == "backButton") {
		goBack();
	}
	if (event.target.id == "adminButton") {
		window.location.href = "admin.jsp";
	}
	if (event.target.id == "logOutButton") {
		logOut();
	}
	if (event.target.id =="showPostOrder"){
		hideTable();
	}
	if (event.target.id =="logInButton"){
		logIn();
	}
	if (event.target.id =="showEditPost"){
		showEditPost(event.target);
	}
	if (event.target.id =="signUpButton"){
		signUp();
	}
	if (event.target.id =="showHideAllCommentsButton"){
		hideAllComments();
	}
	if (event.target.classList.contains("deleteButton")){
		event.target.parentElement.submit();
	}
	if (event.target.classList.contains("updateUserAdminButton")){
		event.target.parentElement.submit();
	}
	if (event.target.classList.contains("showHideCommentButton")){
		hideComment(event.target.parentElement.parentElement.parentElement);
	}
	else{
		console.log(event.target.constructor.name);
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

//on document ready, reload comments every 10s
$(document).ready(function(){
	console.log("ready");
	setInterval(loadComments,10*1000);
	
});