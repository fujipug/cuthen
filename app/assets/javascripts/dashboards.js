var ready = function() {
    $.get( $("#cal").data("url"), function( data ) {
        // page is now ready, initialize the calendar...
        $('#calendar').fullCalendar({
        // put your options and callbacks here
            defaultView: 'agendaWeek',
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            events: data
        })
        //hide calendar after it is done loading its stuff
        jQuery($('#cal').attr('class', 'hide'));
    });
};
$(document).ready(ready);
$(document).on('page:load', ready);

function showCalendar() {
    jQuery($('#cal').attr('class', 'moo'));
    jQuery($('#list').attr('class', 'hide'));
}

function showList() {
    jQuery($('#cal').attr('class', 'hide'));
    jQuery($('#list').attr('class', 'moo'));
}