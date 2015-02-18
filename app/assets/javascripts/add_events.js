// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

//stuff to make the mini calendar work
//global variables for updateDataInfo
var daycode;
var monthStartDay = [0,0,0,0,0,0,0,0,0,0,0,0];

//general information related to dates
var daysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31];
var monthName = ["January","Febuary","Marth","April","May","June","July","August","September","October","November","December"]
var currentTime =  new Date();
/*
	Return today's date and time
	var currentTime = new Date()

	Returns the month (from 0 to 11)
	var month = currentTime.getMonth() + 1

	Returns the day of the month (from 1 to 31)
	var day = currentTime.getDate()

	Returns the year (four digits)
	var year = currentTime.getFullYear()

	Write output MM/dd/yyyy
	document.write(month + "/" + day + "/" + year)
*/
//mini calendar counter
var calendarID = [0];

function updateDateInfo(year) {
	//calculate daycode from year
	daycode = (year + Math.floor((year - 1) / 4) - Math.floor((year - 1) / 100) + Math.floor((year - 1) / 400) ) % 7;

	//leap year check
	if (year % 4 == 0 && year % 100 > 0 || year % 400 == 0) {
		daysInMonth[1] = 29;
	}else{
		daysInMonth[1] = 28;
	}

	//get the starting position for each month
	for (i = 0; i < 12; i++) {
		if (daycode == 0) {
			monthStartDay[i] = 7;
		}else{
			monthStartDay[i] = daycode;
		}
		daycode = (daycode + daysInMonth[i]) % 7;
	}
}

function updateMiniCalendar(calendarCurrentID, month, year) {
	updateDateInfo(year);

	//update the left and right buttons to update the mini calendar with correct month and year
	if (month == 0) {
		jQuery($('#leftBtn' + calendarCurrentID).attr('onclick','updateMiniCalendar(' + calendarCurrentID + ', ' + 11 + ', ' + (year - 1)  + ')'));
	}else{
		jQuery($('#leftBtn' + calendarCurrentID).attr('onclick','updateMiniCalendar(' + calendarCurrentID + ', ' + (month - 1) + ', ' + year + ')'));
	}
	jQuery($('#monthLabel' + calendarCurrentID).html(monthName[month] + ' ' + year));
	jQuery($("#monthLabel" + calendarCurrentID).attr('onclick','updateMiniCalendar(' + calendarCurrentID + ', ' + monthName[month] + ' ' + year + ')'));
	if (month == 11) {
		jQuery($('#rightBtn' + calendarCurrentID).attr('onclick','updateMiniCalendar(' + calendarCurrentID + ', ' + 0 + ', ' + (year + 1)  + ')'));
	}else{
		jQuery($('#rightBtn' + calendarCurrentID).attr('onclick','updateMiniCalendar(' + calendarCurrentID + ', ' + (month + 1) + ', ' + year + ')'));
	}

	//update each day to update the mini calendar with correct days
	var j = 0;
	//previous months
	if (month == 0) {
		for (i = monthStartDay[month]; i > 0; i--) {
			jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class', 'dateGray'));
			jQuery($('#cal' + calendarCurrentID + 'day'+ j).html(daysInMonth[11] - i + 1));
			jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('onclick', 'selectDate(' + calendarCurrentID + ', ' + (daysInMonth[11] - i + 1) + ', ' + 11  + ', ' + (year - 1) + ')'));
			//jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('id', daysInMonth[11] - i + 1));
			j++;
		}
	}else{
		for (i = monthStartDay[month]; i > 0; i--) {
			jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class', 'dateGray'));
			jQuery($('#cal' + calendarCurrentID + 'day'+ j).html(daysInMonth[month - 1] - i + 1));
			jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('onclick', 'selectDate(' + calendarCurrentID + ', ' + (daysInMonth[month - 1] - i + 1) + ', ' + (month - 1)  + ', ' + year + ')'));
			//jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('id', daysInMonth[11] - i + 1));
			j++;
		}
	}
	//current month
	for (i = 0; i < daysInMonth[month]; i++) {
		if (i == currentTime.getDate() - 1 && year == currentTime.getFullYear() && month == currentTime.getMonth()) {
			jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class', 'dateCurrent'));
		}else{
			jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class', ''));
		}
		jQuery($('#cal' + calendarCurrentID + 'day' + j).html(i + 1));
		jQuery($('#cal' + calendarCurrentID + 'day' + j).attr('onclick', 'selectDate(' + calendarCurrentID + ', ' + (i + 1) + ', ' + month  + ', ' + year + ')'));
		//jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('id', i + 1));
		j++;
	}
	//next month
	if (month == 11) {
		for (i = 0; i < 6 * 7 - daysInMonth[month] - monthStartDay[month]; i++) {
			jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class','dateGray'));
			jQuery($('#cal' + calendarCurrentID + 'day'+ j).html(i + 1));
			jQuery($('#cal' + calendarCurrentID + 'day' + j).attr('onclick', 'selectDate(' + calendarCurrentID + ', ' + (i + 1) + ', ' + 0 + ', ' + (year + 1) + ')'));
			j++;
		}
	}else{
		for (i = 0; i < 6 * 7 - daysInMonth[month] - monthStartDay[month]; i++) {
			jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class','dateGray'));
			jQuery($('#cal' + calendarCurrentID + 'day'+ j).html(i + 1));
			jQuery($('#cal' + calendarCurrentID + 'day' + j).attr('onclick', 'selectDate(' + calendarCurrentID + ', ' + (i + 1) + ', ' + (month + 1)  + ', ' + year + ')'));
			j++;
		}
	}
}

function createMiniCalendar(label) {
	var calendarCurrentID, i = 0, j = 0, month, year, minicalendar, table, tr = [], td = [];

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

	//default the month and year to what is current
	month = currentTime.getMonth();
	year = currentTime.getFullYear();
	updateDateInfo(year);

	//the mini-calendar div is the main container for a mini calendar.  Each has its own id
	minicalendar = jQuery('<div class="mini-calendar" id="mini-calendar' + calendarCurrentID + '"></div>');
	table = jQuery('<table></table>');
	for (i = 0; i < 8; i++) {
		tr.push(jQuery('<tr></tr>'));
	}

	//month label and navigation
	if (month == 0) {
		jQuery($(tr[0]).append('<th><button type="button" id="leftBtn' + calendarCurrentID + '" onclick="updateMiniCalendar(' + calendarCurrentID + ', ' + 11 + ','+ (year - 1) + ')">le</button></th>'));
	}else{
		jQuery($(tr[0]).append('<th><button type="button" id="leftBtn' + calendarCurrentID + '" onclick="updateMiniCalendar(' + calendarCurrentID + ', ' + (month - 1) + ', ' + year + ')">le</button></th>'));
	}
	jQuery($(tr[0]).append('<th colspan="5" id = "monthLabel' + calendarCurrentID + '">' + monthName[month] + ' ' + year + '</th>'));

	if (month == 11) {
		jQuery($(tr[0]).append('<th><button type="button" id ="rightBtn' + calendarCurrentID + '" onclick="updateMiniCalendar(' + calendarCurrentID + ', ' + 0 + ', ' + (year + 1) + ')">ri</button></th>'));
	}else{
		jQuery($(tr[0]).append('<th><button type="button" id ="rightBtn' + calendarCurrentID + '" onclick="updateMiniCalendar(' + calendarCurrentID + ', ' + (month + 1) + ', ' + year + ')">ri</button></th>'));
	}
	
	//Day labels
	jQuery($(tr[1]).append('<td class="dayLabel">Sun</td>', '<td class="dayLabel">Mon</td>', '<td class="dayLabel">Tue</td>', '<td class="dayLabel">Wed</td>', '<td class="dayLabel">Thu</td>', '<td class="dayLabel">Fri</td>', '<td class="dayLabel">Sat</td>'));

	//these are the previous dates from the previous month (at most 7)
	j = 0;
	if (month == 0) {
		for (i = monthStartDay[month]; i > 0; i--) {
			td.push(jQuery('<td class="dateGray" id = "cal' + calendarCurrentID + 'day'+ j +'" onclick="selectDate(' + calendarCurrentID + ', ' + (daysInMonth[11] - i + 1) + ', ' + 11  + ', ' + (year - 1) + ')">' + (daysInMonth[11] - i + 1) + '</td>'));
			j++;
		}
	}else{
		for (i = monthStartDay[month]; i > 0; i--) {
			td.push(jQuery('<td class="dateGray" id = "cal' + calendarCurrentID + 'day'+ j +'" onclick="selectDate(' + calendarCurrentID + ', ' + (daysInMonth[11] - i + 1) + ', ' + (month - 1)  + ', ' + year + ')">' + (daysInMonth[month - 1] - i + 1) + '</td>'));
			j++;
		}
	}

	//dates of the current month
	for (i = 0; i < daysInMonth[month]; i++) {
		if (i == currentTime.getDate() - 1 && year == currentTime.getFullYear() && month == currentTime.getMonth()) {
			td.push(jQuery('<td class="dateCurrent" id = "cal' + calendarCurrentID + 'day'+ j +'" onclick="selectDate(' + calendarCurrentID + ', ' + (i + 1) + ', ' + month  + ', ' + year + ')">' + (i + 1) + '</td>'));
		}else{
			td.push(jQuery('<td id = "cal' + calendarCurrentID + 'day'+ j +'" onclick="selectDate(' + calendarCurrentID + ', ' + (i + 1) + ', ' + month  + ', ' + year + ')">' + (i + 1) + '</td>'));
		}
		j++;
	}

	//dates of the next month
	for (i = 0; i < 6 * 7 - daysInMonth[month] - monthStartDay[month]; i++) {
		if (month == 11) {
			td.push(jQuery('<td class="dateGray" id = "cal' + calendarCurrentID + 'day'+ j +'" onclick="selectDate(' + calendarCurrentID + ', ' + (i + 1) + ', ' + 0  + ', ' + (year + 1) + ')">' + (i + 1) + '</td>'));
			j++;
		}else{
			td.push(jQuery('<td class="dateGray" id = "cal' + calendarCurrentID + 'day'+ j +'" onclick="selectDate(' + calendarCurrentID + ', ' + (i + 1) + ', ' + (month + 1)  + ', ' + year + ')">' + (i + 1) + '</td>'));
			j++;
		}
		
	}

	//tr[2->8] collect 7 tr's (dates)
	for (i = 0; i < 6; i++) {
		for (j = 0; j < 7; j++) {
			jQuery($(tr[i + 2]).append(td[i * 7 + j]));
		}
	}

	//put it all together: label, minicalendar > table > tr's > th's and td's, input
	jQuery($(table).append(tr[0], tr[1], tr[2], tr[3], tr[4], tr[5], tr[6], tr[7]));
	jQuery($(minicalendar).append('<label for="calendarInputLabel'+ calendarCurrentID + '">' + label + '</label>', table, '<input type="text" class="calendar-form-control" name="calendarInput' + calendarCurrentID + '" id="calendarInput' + calendarCurrentID + '" onblur="calendarInputValidator(' + calendarCurrentID + ')">'));
	jQuery($(".test").append(minicalendar));
}

function calendarInputValidator(calendarCurrentID) {
	var input = $('#calendarInput0').val();
	var error = false;

	//if ((input.replace(/\D/g,'') ).length < 4) {
		//alert("too short of input");
	//}

	//seperate the date into date[0]=month, date[1]=day, date[2]=year
	var date = input.split('/');

	//check if there is a proper number of dashes (2) ('/')
	if (typeof date[0] === 'undefined' || typeof date[1] === 'undefined' || typeof date[2] === 'undefined') {
		alert("missing ( '/' ): mm/dd/yyyy");
		error = true;
	}
	if (typeof date[3] !== 'undefined') {
		alert("too many ( '/' ): mm/dd/yyyy");
		error = true;
	}
	if (error == false) {
		if (date[0].length != (date[0].replace(/\D/g,'')).length) {
			alert("invalid month: mm/dd/yyyy");
			error = true;
		}
		else if (date[0].length == 2) {
			alert("month: " + date[0]);
			//still needs to check if month is between 0 and maxmonth
		}
		else if (date[0].length == 1) {
			alert("month: 0" + date[0]);
			//still needs to check if month is between 0 and maxmonth
		}
		else if (date[0].length == 0) {
			alert("please enter the month: mm/dd/yyyy");
			error = true;
		}
		else {//(date[0].length > 2) {
			alert("too many digits for month: mm/dd/yyyy");
			error = true;
		}
	}
	if (error == false) {
		if (date[1].length != (date[1].replace(/\D/g,'')).length) {
			alert("invalid day: mm/dd/yyyy");
			error = true;
		}
		else if (date[1].length == 2) {
			alert("day: " + date[1]);
			//still needs to check if day is between 0 and maxday
		}
		else if (date[1].length == 1) {
			alert("day: 0" + date[1]);
			//still needs to check if day is between 0 and maxday
		}
		else if (date[1].length == 0) {
			alert("please enter the day: mm/dd/yyyy");
			error = true;
		}
		else {//(date[1].length > 2) {
			alert("too many digits for day: mm/dd/yyyy");
			error = true;
		}
	}
	if (error == false) {
		if (date[2].length != (date[2].replace(/\D/g,'')).length) {
			alert("invalid year: mm/dd/yyyy");
			error = true;
		}
		else if (date[2].length == 4) {
			alert("year: " + date[2]);
			//still needs to check if year is between 0 and maxyear
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
	alert(error);
}

function selectDate(calendarCurrentID, day, month, year) {
	jQuery($('#calendarInput' + calendarCurrentID).val((month + 1) + '/' + day + '/' + year));
}