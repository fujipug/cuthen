//fancy way of doing doc.ready
//this is because the normal way doesn't load up if someone clicks a link to get to the page vs typing the url in
var ready = function() {
    //store all divs with class="mini-calendar-container" into an array, and add the mini-calendar div to each of them
    //each will load with the current date
    var mini_calendar_container = $('.mini-calendar-container');
    for (var i=0; i < mini_calendar_container.length; i++) {
        createMiniCalendar($(mini_calendar_container[i]).attr('id'));
        //.parent().children('.form-control input-lg').eq(0).attr('id')
    }
    calendarID = [0];
};
$(document).ready(ready);
$(document).on('page:load', ready);

function remove_field(btn, input, label) {
    $("input[name='"+ moo + "']").attr({"value" : "", "type" : "hidden"});
}
function add_field(moo) {
    $("input[name='"+ moo + "']").attr({"value" : "", "type" : "hidden"});
}

function toggleSettingLabel(label, moo) {
    if (moo == 1) {
        jQuery($('#' + label).attr('class','setting-label-expanded'));
        jQuery($('#' + label).attr('onclick',"toggleSettingLabel('" + label + "', 0)"));
    }else{
        jQuery($('#' + label).attr('class','setting-label'));
        jQuery($('#' + label).attr('onclick',"toggleSettingLabel('" + label + "', 1)"));
    }
}

//actually this is sorta useless now.  Just ignore this function for now.
function dateToTimestamp(day, month, year, hour, min) {
    //to convert the timestamp to the conventional timestamp, n*5*60
    //timestamp 0 == Jan 1st, 1970
    //1 ==> 5 minutes
    //12 ==> 1 hour = 60 minutes
    //etc..
     
    var timestamp=0;
    
    //handling years
    // days in year*hours*5minutes
    for (i=0; i < (year - 1970); i++) {
        if (isLeapYear(i) == true) {
            timestamp+=366*24*12;
        }else{
            timestamp+=365*24*12;
        }
    }

    //handling months
    // days in month*hours*5minutes
    for (i=1; i < (1 + month); i++) {
        timestamp += daysInMonth[i]*24*12;
    }

    //handling days
    // hours in day*5minutes
    timestamp += day*24*12;

    //handling hours
    // hours*5minutes
    timestamp += hour*12;

    //handling 5minutes
    timestamp += min;
}