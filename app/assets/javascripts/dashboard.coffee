# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  load_instance_state("stopped")
  $('.dropdown-toggle').dropdown()

  $('.state-menu li').click ->
    load_instance_state($(this).attr('state'))

  #$('div#instance_list').on "ajax:success", "input.wake_up", (data, status, xhr) ->
  #  $(this).closest('tr').fadeOut()
  #  console.log("Instance starting")    


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
  console.log "setting wakeup handler"
  $("form.wake-up").click ->
    console.log("form clicked")
  $("form.wake-up").on "ajax:send", ->
    console.log("ajax sent")
  $("form.wake-up").on "ajax:success", (data, status, xhr) ->
    row = $(this).closest('tr')
    row.find('td').css('background-color', 'lightGreen')
    row.fadeOut(1000)
    console.log("Instance starting")    

load_instance_state = (state) ->
  $('div#instance_list').html("<img src='/assets/spinner.gif'/>")
  $('div#instance_list').load "instance_table/" + state, -> setup_table( $('table#instance_list') )

	