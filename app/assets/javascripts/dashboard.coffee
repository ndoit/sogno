# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('#instance_list').html("<img src='/assets/spinner.gif'/>")
	$('#instance_list').load("instance_table/stopped")