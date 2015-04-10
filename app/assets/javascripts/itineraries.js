//fancy way of doing doc.ready
//this is because the normal way doesn't load up if someone clicks a link to get to the page vs typing the url in
var ready = function() {
    $('.datetime-form-control').each(function() {
        $(this).datetimepicker();
    });/*
    $("#datetimepicker1").on("dp.change", function (e) {
        $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
        alert(e.date);
    });
    $("#datetimepicker2").on("dp.change", function (e) {
        $('#datetimepicker1').data("DateTimePicker").maxDate(e.date);
    });*/
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