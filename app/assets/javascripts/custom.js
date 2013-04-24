$(document).ready(function() {

	//this is a nasty hack. the autocomplete doesnt work on the new course form 
	//when you click "add new courses", so I'm attaching an event on the "add 
	//new course" link which reapplies the autocomplete widget to all course number and course
	//name fields....but the form needs to be in the page first before applying the autocomplete widget...thus the
	//2 second delay
  	var timer; 						
    $(".add").on("click", function() {      		
        timer = setTimeout(function() {
        	$('.hcourse_num').autocomplete({
				source: $('.hcourse_num').data('autocomplete-source')
			});
   			$('.hcourse_name').autocomplete({
   				source: $('.hcourse_name').data('autocomplete-source')
			});
        }, 2000);      
    });

    
});