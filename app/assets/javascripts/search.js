var ready = function() {
  
};
$(document).ready(ready);
$(document).on('page:load', ready);

function get_search_results() {
  $('#user_results').html('');
  $.get( $("#search_query").data("url"), function( data ) {
    var matches, substrRegex;
    
    // regex used to determine if a string contains the substring `q`
    var q = $('#search_query').val();
    substrRegex = new RegExp(q, 'i');
    //alert(getUrlParameter('user'));
    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(data, function(i, json_object) {
      if (substrRegex.test(json_object.name)) {
        $('#user_results').append('<p>' + json_object.name + ' | ' + json_object.email + '</p>');
      }
    });
    
  });
}

function getUrlParameter(sParam) {
  var sPageURL = window.location.search.substring(1);
  var sURLVariables = sPageURL.split('&');
  for (var i = 0; i < sURLVariables.length; i++) 
  {
    var sParameterName = sURLVariables[i].split('=');
    if (sParameterName[0] == sParam) 
    {
      return sParameterName[1];
    }
  }
}