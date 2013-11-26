# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
	$('FORM').nestedFields()
	$('#form_department_name').autocomplete
		source: $('#form_department_name').data('autocomplete-source')
	$('#form_school_name').autocomplete
		source: $('#form_school_name').data('autocomplete-source')
	$('.hcourse_name').autocomplete
		source: $('.hcourse_name').data('autocomplete-source')
	$('.hcourse_num').autocomplete
		source: $('.hcourse_num').data('autocomplete-source')

