// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function itinFirstClick() {
    createMiniCalendar('startDate', 'Start Date');
    createMiniCalendar('endDate', 'End Date');

    jQuery($('#timeFrameLabel').attr('onclick',''));
    jQuery($('#timeFrameLabel').attr('class','setting-label-expanded'));
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