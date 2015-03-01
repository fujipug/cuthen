//stuff to make the mini calendar work
//global variables for updateDataInfo
var daycode;
var monthStartDay = [0,0,0,0,0,0,0,0,0,0,0,0];

//general information related to dates
var daysInMonth = [0,31,28,31,30,31,30,31,31,30,31,30,31];
var monthName = ["Error", "January","Febuary","Marth","April","May","June","July","August","September","October","November","December"]
var currentTime =  new Date();

//mini calendar counter
var calendarID = [0];

function isLeapYear(year) {
    //leap year check
    if (year % 4 == 0 && year % 100 > 0 || year % 400 == 0) {
        return true; //
    }//else{
        return false; //
    //}
}

function updateFeb(year) {
    if (isLeapYear(year) == true) {
        daysInMonth[2] = 29;
    }else{
        daysInMonth[2] = 28;
    }
}

function updateFirstDayPosition(year) {
    //calculate daycode from year
    daycode = (year + Math.floor((year - 1) / 4) - Math.floor((year - 1) / 100) + Math.floor((year - 1) / 400) ) % 7;
    //get the starting position for each month
    for (i = 1; i < 13; i++) {
        if (daycode == 0) {
            monthStartDay[i] = 7;
        }else{
            monthStartDay[i] = daycode;
        }
        daycode = (daycode + daysInMonth[i]) % 7;
    }
}

function updateDateInfo(year) {
    //being replaced soon, note that this function is now split into two functions:
    
    updateFeb(year);
    updateFirstDayPosition(year);
}

function updateMiniCalendar(calendarCurrentID, day, month, year) {
    //update feb if leap year and calculate the starting positions of each month of the year
    updateDateInfo(year);

    //update the left and right buttons to update the mini calendar with correct month and year
    if (month == 1) {
        jQuery($('#leftBtn' + calendarCurrentID).attr('onclick','updateMiniCalendar(' + calendarCurrentID + ', ' + day + ', ' + 12 + ', ' + (year - 1)  + ')'));
    }else{
        jQuery($('#leftBtn' + calendarCurrentID).attr('onclick','updateMiniCalendar(' + calendarCurrentID + ', ' + day + ', ' + (month - 1) + ', ' + year + ')'));
    }
    jQuery($('#monthLabel' + calendarCurrentID).html(monthName[month] + ' ' + year));
    jQuery($("#monthLabel" + calendarCurrentID).attr('onclick','updateMiniCalendar(' + calendarCurrentID + ', ' + day + ', ' + monthName[month] + ' ' + year + ')'));
    if (month == 12) {
        jQuery($('#rightBtn' + calendarCurrentID).attr('onclick','updateMiniCalendar(' + calendarCurrentID + ', ' + day + ', ' + 1 + ', ' + (year + 1)  + ')'));
    }else{
        jQuery($('#rightBtn' + calendarCurrentID).attr('onclick','updateMiniCalendar(' + calendarCurrentID + ', ' + day + ', ' + (month + 1) + ', ' + year + ')'));
    }

    //update each day to update the mini calendar with correct days
    var j = 1;
    //previous months
    if (month == 1) {
        for (i = monthStartDay[1]; i > 0; i--) {
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class', 'dateGray'));
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).html(daysInMonth[12] - i + 1));
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('onclick', 'selectDate(' + calendarCurrentID + ', ' + (daysInMonth[12] - i + 1) + ', ' + 12  + ', ' + (year - 1) + ')'));
            //jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('id', daysInMonth[11] - i + 1));
            j++;
        }
    }else{
        for (i = monthStartDay[month]; i > 0; i--) {
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class', 'dateGray'));
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).html(daysInMonth[month - 1] - i + 1));
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('onclick', 'selectDate(' + calendarCurrentID + ', ' + (daysInMonth[month] - i + 1) + ', ' + (month - 1)  + ', ' + year + ')'));
            //jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('id', daysInMonth[11] - i + 1));
            j++;
        }
    }
    //current month
    for (i = 1; i < daysInMonth[month] + 1; i++) {
        if (i == day){
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class', 'dateCurrent'));
        }
        else if (i == currentTime.getDate() && year == currentTime.getFullYear() && month == (currentTime.getMonth() + 1)) {
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class', 'dateCurrent'));
        }else{
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class', ''));
        }
        jQuery($('#cal' + calendarCurrentID + 'day' + j).html(i));
        jQuery($('#cal' + calendarCurrentID + 'day' + j).attr('onclick', 'selectDate(' + calendarCurrentID + ', ' + i + ', ' + month  + ', ' + year + ')'));
        //jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('id', i + 1));
        j++;
    }
    //next month
    if (month == 12) {
        for (i = 1; i < 6 * 7 - daysInMonth[month] - monthStartDay[month] + 1; i++) {
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class','dateGray'));
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).html(i ));
            jQuery($('#cal' + calendarCurrentID + 'day' + j).attr('onclick', 'selectDate(' + calendarCurrentID + ', ' + i + ', ' + 0 + ', ' + (year + 1) + ')'));
            j++;
        }
    }else{
        for (i = 1; i < 6 * 7 - daysInMonth[month] - monthStartDay[month] + 1; i++) {
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class','dateGray'));
            jQuery($('#cal' + calendarCurrentID + 'day'+ j).html(i));
            jQuery($('#cal' + calendarCurrentID + 'day' + j).attr('onclick', 'selectDate(' + calendarCurrentID + ', ' + i + ', ' + (month + 1)  + ', ' + year + ')'));
            j++;
        }
    }
}

function createMiniCalendar(container) {
    var calendarCurrentID, i = 0, j = 0, day=0, month, year, minicalendar, table, tr = [], td = [];

    //generate unique ID
    //check for any available calendar IDs to pick from
    //if it's the last one, create a spare ID for the next mini calendar
    while(true) {
        if (calendarID[i] == 0){
            calendarCurrentID = i;
            calendarID[i] = 1;
            if (i >= calendarID.length - 1) {
                calendarID.push(0);
            }
            break;
        }
        i++;
    }

    //create mini calendar skeleton

    //the mini-calendar div is the main container for a mini calendar.  Each has its own id
    minicalendar = jQuery('<div class="mini-calendar" id="mini-calendar' + calendarCurrentID + '"></div>');
    table = jQuery('<table></table>');
    for (i = 0; i < 8; i++) {
        tr.push(jQuery('<tr></tr>'));
    }

    //month label and navigation
    jQuery($(tr[0]).append('<th><button type="button" id ="leftBtn' + calendarCurrentID + '"</button>le</th>'));
    jQuery($(tr[0]).append('<th colspan="5" id = "monthLabel' + calendarCurrentID + '"></th>'));
    jQuery($(tr[0]).append('<th><button type="button" id ="rightBtn' + calendarCurrentID + '">ri</button></th>'));
    
    //Day labels
    jQuery($(tr[1]).append('<td class="dayLabel">Sun</td>', '<td class="dayLabel">Mon</td>', '<td class="dayLabel">Tue</td>', '<td class="dayLabel">Wed</td>', '<td class="dayLabel">Thu</td>', '<td class="dayLabel">Fri</td>', '<td class="dayLabel">Sat</td>'));

    //6 * 7 td are each day slot
    //tr[2->8] collect 7 tr's (dates)
    for (i = 0; i < 6; i++) {
        for (j = 0; j < 7; j++) {
            td.push(jQuery('<td id = "cal' + calendarCurrentID + 'day'+ (i * 7 + j + 1) +'""></td>'));
            jQuery($(tr[i + 2]).append(td[i * 7 + j]));
        }
    }

    //put it all together: label, minicalendar > table > tr's > th's and td's, input
    jQuery($(table).append(tr[0], tr[1], tr[2], tr[3], tr[4], tr[5], tr[6], tr[7]));
    //jQuery($(minicalendar).append('<label for="calendarInputLabel'+ calendarCurrentID + '">' + label + '</label>', table, '<input type="text" class="calendar-form-control" name="calendarInput' + calendarCurrentID + '" id="calendarInput' + calendarCurrentID + '" placeholder="mm/dd/yyyy" onblur="calendarInputValidator(' + calendarCurrentID + ')">'));
    jQuery($(minicalendar).append(table));
    jQuery($("#" + container).append(minicalendar));

    //populate the mini calendar

    //default the month and year to what is current
    month = currentTime.getMonth() + 1;
    year = currentTime.getFullYear();

    updateMiniCalendar(calendarCurrentID, day, month, year);
}

function calendarInputValidator(calendarCurrentID) {
    var input = $('#calendarInput0').val();
    var month = 0, day = 0, year = 2000;
    //format validation
    var error = false;

    //seperate the date into date[0]=month, date[1]=day, date[2]=year
    var date = input.split('/');

    //check if there is a proper number of dashes (2) ('/')
    //checks if mm dd and yyyy are seperated by /
    if (typeof date[0] === 'undefined' || typeof date[1] === 'undefined' || typeof date[2] === 'undefined') {
        alert("missing ( '/' ): mm/dd/yyyy");
        error = true;
    }
    //checks if there's extra /
    if (typeof date[3] !== 'undefined') {
        alert("too many ( '/' ): mm/dd/yyyy");
        error = true;
    }

    //checks format for mm
    //proper length is one or two characters
    //only includes numbers
    if (error == false) {
        if (date[0].length != (date[0].replace(/\D/g,'')).length) {
            alert("invalid month: mm/dd/yyyy");
            error = true;
        }
        else if (date[0].length == 0) {
            alert("please enter the month: mm/dd/yyyy");
            error = true;
        }
        else if (date[0].length <= 2) {
            if (parseInt(date[0], 10) <= 12 && parseInt(date[0], 10) > 0) {
                month = parseInt(date[0], 10);
                alert("month: " + month);
            }else{
                alert("month is outside of range: [1, 12]");
                error = true;
            }

        }
        else {//(date[0].length > 2) {
            alert("too many digits for month: mm/dd/yyyy");
            error = true;
        }
    }

    //checks format yyyy
    //proper length is four characters
    //only includes numbers
    if (error == false) {
        if (date[2].length != (date[2].replace(/\D/g,'')).length) {
            alert("invalid year: mm/dd/yyyy");
            error = true;
        }
        else if (date[2].length == 4) {
            if (parseInt(date[2], 10) >= 2000) {
                year = parseInt(date[2], 10);
                //alert("year: " + year);
                //update date info needed for checking if the dd is within the proper range of that month, year
                updateDateInfo(year);
            }else{
                alert("year is outside of range: 2000+");
                error = true;
            }
            //still needs to check if year is between ~2015 and maxyear
        }
        else if (date[2].length < 4) {
            alert("too few digits for year: mm/dd/yyyy");
            error = true;
        }
        else {//(date[2].length > 4) {
            alert("too many digits for year: mm/dd/yyyy");
            error = true;
        }
    }

    //checks format for dd
    //proper length is one or two characters
    //only includes numbers
    if (error == false) {
        if (date[1].length != (date[1].replace(/\D/g,'')).length) {
            alert("invalid day: mm/dd/yyyy");
            error = true;
        }
        else if (date[1].length == 0) {
            alert("please enter the day: mm/dd/yyyy");
            error = true;
        }
        else if (date[1].length <= 2) {
            if ((parseInt(date[1], 10) <= daysInMonth[month]) && (parseInt(date[1], 10) > 0)) {
                //alert("day: " + date[1]);
                day = parseInt(date[1], 10);
            }else{
                alert("day is outside of range: [1, " + daysInMonth[month] + "]");
                error = true;
            }
        }
        else {//(date[1].length > 2) {
            alert("too many digits for day: mm/dd/yyyy");
            error = true;
        }
    }
    if (error == false) {
        updateMiniCalendar(calendarCurrentID, day, month, year);
    }
}

function selectDate(calendarCurrentID, day, month, year) {
    jQuery($('#calendarInput' + calendarCurrentID).val(month + '/' + day + '/' + year));
    updateMiniCalendar(calendarCurrentID, day, month, year);
}