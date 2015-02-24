// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
// page is now ready, initialize the calendar...
$('#calendar').fullCalendar({
// put your options and callbacks here
})
//hide calendar after it is done loading its stuff
jQuery($('#cal').attr('class', 'hide'));
});

function showCalendar() {
    jQuery($('#cal').attr('class', 'moo'));
    jQuery($('#list').attr('class', 'hide'));
}

function showList() {
    jQuery($('#cal').attr('class', 'hide'));
    jQuery($('#list').attr('class', 'moo'));
}