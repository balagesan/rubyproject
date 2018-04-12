// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery_nested_form


// function show_back(elements) {
// 	  console.log(elements);

//   alert("See Me")
//   var s =  document.getElementById('contacts_div');
  
//   if (s.style== 'none') {
//     s.style.display = 'block';
// } 
// else{
//      s.style.display = 'block';
// } 
// }


$(document).ready(function(){
	// additional contacts button click
    $('#contacts_expand').click(function(){
      $('#contacts_div').toggle();
    });

    //details button click 
    $('#details_expand').click(function(){
      $('#details_div').toggle();
    });
  });