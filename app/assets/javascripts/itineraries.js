//fancy way of doing doc.ready
//this is because the normal way doesn't load up if someone clicks a link to get to the page vs typing the url in
var ready = function() {
    //start the calendar inputs for the start and end dates
    //start
    $("#datetimepicker1").datetimepicker({
        sideBySide: true
    });
    //end
    $("#datetimepicker2").datetimepicker({
        sideBySide: true
    });
    //this is the deadline calendar input
    $("#datetimepicker3").datetimepicker({
        sideBySide: true
    });
    if ($('#strong_startdate').length > 0) {
        strong_startdate = $('#strong_startdate').attr("data");
        strong_enddate = $('#strong_enddate').attr("data");
        $('#datetimepicker1').data("DateTimePicker").minDate(strong_startdate);
        $('#datetimepicker1').data("DateTimePicker").maxDate(strong_enddate);
        $('#datetimepicker2').data("DateTimePicker").minDate(strong_startdate);
        $('#datetimepicker2').data("DateTimePicker").maxDate(strong_enddate);
    }
    if ($('#weak_startdate').length > 0) {
        weak_startdate = $('#weak_startdate').attr("data");
        $('#datetimepicker2').data("DateTimePicker").minDate(weak_startdate);
    }
    if ($('#weak_enddate').length > 0) {
        weak_enddate = $('#weak_enddate').attr("data");
        $('#datetimepicker1').data("DateTimePicker").maxDate(weak_enddate);
    }
    weak_startdate = $('#weak_startdate').attr("data");
    weak_enddate = $('#weak_startdate').attr("data");
    $("#datetimepicker1").on("dp.change", function (e) {
        $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
        console.log(e.date);
    });
    $("#datetimepicker2").on("dp.change", function (e) {
        $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
    });
};
$(document).ready(ready);
$(document).on('page:load', ready);

function toggle_label_button(label, toggle) {
    if (toggle == 0) {
        //$('label).attr('aria-expanded', 'false');
        $(label).attr('onclick', 'toggle_label_button(\'' + label + '\', 1)');
    }
    else {
        //$(label).attr('aria-expanded', 'true');
        $(label).attr('onclick', 'toggle_label_button(\'' + label + '\', 0)');
    }
}