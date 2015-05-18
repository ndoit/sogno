# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$('div#instance_list').html("<img src='/assets/spinner.gif'/>")
	$('div#instance_list').load "instance_table/stopped", -> setup_table( $('table#instance_list') )

setup_table = (selector) ->
  selector.tablesorter({
    widgets: ["zebra", "columnSelector", "filter"],
    widgetOptions: {
      columnSelector_mediaquery: true,
      columnSelector_mediaqueryName: 'Auto: ',
      columnSelector_mediaqueryState: true,
      columnSelector_breakpoints : [ '20em', '30em', '40em', '50em', '60em', '70em' ],
      columnSelector_priority : 'data-priority'
    }
  })

	