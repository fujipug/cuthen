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