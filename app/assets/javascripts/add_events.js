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

//mini calendar counter
var calendarID = [0];
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

	var j = 0;
	for (i = monthStartDay[month]; i > 0; i--) {
		jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class','"dateGray"'));
		jQuery($('#cal' + calendarCurrentID + 'day'+ j).html(daysInMonth[month - 1] - i + 1));
		j++;
	}
	for (i = 0; i < daysInMonth[month]; i++) {
		jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class','""'));
		jQuery($('#cal' + calendarCurrentID + 'day'+ j).html(i + 1));
		j++;
	}
	for (i = 0; i < 6 * 7 - daysInMonth[month] - monthStartDay[month]; i++) {
		jQuery($('#cal' + calendarCurrentID + 'day'+ j).attr('class','"dateGray"'));
		jQuery($('#cal' + calendarCurrentID + 'day'+ j).html(i + 1));
		j++;
	}
}

function createMiniCalendar(label) {

	var i = 0;
	var calendarCurrentID;

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
	var month = currentTime.getMonth();
	var year = currentTime.getFullYear();

	updateDateInfo(year);

	var minicalendar = jQuery('<div class="mini-calendar" id="mini-calendar'+calendarCurrentID+'"></div>');
	var table = jQuery('<table></table>');

	var tr = [];
	for (i = 0; i < 8; i++) {
		tr.push(jQuery('<tr></tr>'));
	}

	if (month == 0) {
		jQuery($(tr[0]).append('<th><button type="button" id="leftBtn' + calendarCurrentID + '" onclick="updateMiniCalendar(' + calendarCurrentID + ', '+ 11 + ','+ (year - 1)  +')">le</button></th>'));
	}else{
		jQuery($(tr[0]).append('<th><button type="button" id="leftBtn' + calendarCurrentID + '" onclick="updateMiniCalendar(' + calendarCurrentID + ', '+ (month - 1) + ','+ year +')">le</button></th>'));
	}
	jQuery($(tr[0]).append('<th colspan="5" id = "monthLabel' + calendarCurrentID + '">' + monthName[month] + ' ' + year + '</th>'));

	if (month == 11) {
		jQuery($(tr[0]).append('<th><button type="button" id ="rightBtn' + calendarCurrentID + '" onclick="updateMiniCalendar(' + calendarCurrentID + ', '+ 0 + ','+ (year + 1)  +')">ri</button></th>'));
	}else{
		jQuery($(tr[0]).append('<th><button type="button" id ="rightBtn' + calendarCurrentID + '" onclick="updateMiniCalendar(' + calendarCurrentID + ', '+ (month + 1) + ','+ year +')">ri</button></th>'));
	}
	
	jQuery($(tr[1]).append('<td class="dayLabel">Sun</td>', '<td class="dayLabel">Mon</td>', '<td class="dayLabel">Tue</td>', '<td class="dayLabel">Wed</td>', '<td class="dayLabel">Thu</td>', '<td class="dayLabel">Fri</td>', '<td class="dayLabel">Sat</td>'));


	var td = [];
	var j = 0;
	for (i = monthStartDay[month]; i > 0; i--) {
		td.push(jQuery('<td class="dateGray" id = "cal' + calendarCurrentID + 'day'+ j +'">' + (daysInMonth[month - 1] - i + 1) + '</td>'));
		j++;
	}
	for (i = 0; i < daysInMonth[month]; i++) {
		td.push(jQuery('<td id = "cal' + calendarCurrentID + 'day'+ j +'">' + (i + 1) + '</td>'));
		j++;
	}
	for (i = 0; i < 6 * 7 - daysInMonth[month] - monthStartDay[month]; i++) {
		td.push(jQuery('<td class="dateGray" id = "cal' + calendarCurrentID + 'day'+ j +'">' + (i + 1) + '</td>'));
		j++;
	}

	for (i = 0; i < 6; i++) {
		for (j = 0; j < 7; j++) {
			jQuery($(tr[i + 2]).append(td[i * 7 + j]));
		}
	}

	jQuery($(table).append(tr[0], tr[1], tr[2], tr[3], tr[4], tr[5], tr[6], tr[7]));
	jQuery($(minicalendar).append('<label for="'+ label.replace(/\s+/g, '') + calendarCurrentID + '">' + label + '</label>', table, '<input type="text" class="calendar-form-control" id="'+ label.replace(/\s+/g, '') + calendarCurrentID + '">'));
	jQuery($(".test").append(minicalendar));
}