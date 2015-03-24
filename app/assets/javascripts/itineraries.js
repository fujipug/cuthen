//fancy way of doing doc.ready
//this is because the normal way doesn't load up if someone clicks a link to get to the page vs typing the url in
var ready = function() {
    calendarID = [0];
    $('.datetime-form-control').each(function() {
        $(this).datetimepicker();
    });
};
$(document).ready(ready);
$(document).on('page:load', ready);