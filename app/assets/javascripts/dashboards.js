var ready = function() {
    $.get( $("#cal").data("url"), function( data ) {
        // page is now ready, initialize the calendar...
        $('#calendar').fullCalendar({
            defaultView: 'agendaWeek',
            duration: '00:15:00',
            slotDuration: '00:15:00',
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            events: data,
            eventResize: function(event, delta, revertFunc) {
                moved_day = {"id": event.id, "title": event.title , "start": event.start.format(), "end": event.end.format()};
                $.ajax({
                    url: "/event_data/" + event.id + "?start=" + event.start.format() + "&end=" + event.end.format(),
                    method: 'PUT',
                    //accepts: "application/json",
                    //contentType: "application/json",
                    data: moved_day,
                    success: function(result) {
                    },
                    error: function() {
                        console.log("Failed to update event");
                    }
                });
            },
            eventDrop: function(event, delta, revertFunc) {
                moved_day = {"id": event.id, "title": event.title , "start": event.start.format(), "end": event.end.format()};
                $.ajax({
                    url: "/event_data/" + event.id + "?start=" + event.start.format() + "&end=" + event.end.format(),
                    method: 'PUT',
                    //accepts: "application/json",
                    //contentType: "application/json",
                    data: moved_day,
                    success: function(result) {
                    },
                    error: function() {
                        console.log("Failed to update event");
                    }
                });
            },
        })
        //hide calendar after it is done loading its stuff
        jQuery($('#cal').attr('class', 'hide'));
    });
};
$(document).ready(ready);
$(document).on('page:load', ready);

function hide_itinerary(id) {
    $('#itinerary_hide_toggle' + id).unbind('click');
    $.get( "/calendar_data/" + id + ".json", function( data ) {
        for(i = 0; i < data.length; i++) {
            $('#calendar').fullCalendar('removeEvents', data[i].id);
        }
        $('#itinerary_hide_toggle' + id).attr("onclick", "show_itinerary(" + id + ")");
        $('.itinerary_hide_toggle' + id).prop("checked", false);
    });
}

function show_itinerary(id) {
    $('#itinerary_hide_toggle' + id).unbind('click');
    $.get( "/calendar_data/" + id + ".json", function( data ) {
        for(i = 0; i < data.length; i++) {
            //first object shoul be the one with id
            eventObject = $('#calendar').fullCalendar('clientEvents', id)[0];
            $('#calendar').fullCalendar('renderEvent', data[i], true);
        }
    });
    $('#itinerary_hide_toggle' + id).attr("onclick", "hide_itinerary(" + id + ")");
    $('.itinerary_hide_toggle' + id).prop("checked", true);
}

function hide_event(itinerary_id, event_id) {
    $.get( "/calendar_data/" + itinerary_id + "/" + event_id + ".json", function( data ) {
            $('#calendar').fullCalendar('removeEvents', data.id);
        $('#event_hide_toggle' + itinerary_id + "_" + event_id).attr("onclick", "show_event(" + itinerary_id + ", " + event_id + ")");
    });
}

function show_event(itinerary_id, event_id) {
    $.get( "/calendar_data/" + itinerary_id + "/" + event_id + ".json", function( data ) {
        //first object shoul be the one with id
        eventObject = $('#calendar').fullCalendar('clientEvents', event_id)[0];
        $('#calendar').fullCalendar('renderEvent', data, true);
    });
    $('#event_hide_toggle' + itinerary_id + "_" + event_id).attr("onclick", "hide_event(" + itinerary_id + ", " + event_id + ")");
}

//stop with the camel case show_cal..
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