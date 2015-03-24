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

//this is for later
var substringMatcher = function(json_data) {
      return function findMatches(q, cb) {
        var matches, substrRegex;

        // an array that will be populated with substring matches
        matches = [];
     
        // regex used to determine if a string contains the substring `q`
        substrRegex = new RegExp(q, 'i');
     
        // iterate through the pool of strings and for any string that
        // contains the substring `q`, add it to the `matches` array
        $.each(json_data, function(i, json_object) {
          if (substrRegex.test(json_object.itinerary_id)) {
            // the typeahead jQuery plugin expects suggestions to a
            // JavaScript object, refer to typeahead docs for more info
            matches.push(json_object);
          }
        });
     
        return matches;
      };
    };