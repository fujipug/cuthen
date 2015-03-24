// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var ready = function() {
  $.get( $("#target").data("url"), function( data ) {
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
          if (substrRegex.test(json_object.name)) {
            alert(json_object.name);
            // the typeahead jQuery plugin expects suggestions to a
            // JavaScript object, refer to typeahead docs for more info
            matches.push(json_object);
          }
        });
     
        cb(matches);
      };
    };
    $('#the-basics .typeahead').typeahead({
      hint: true,
      highlight: true,
      minLength: 0
    },
    {
      name: 'users_typeahead',
      displayKey: 'name',
      source: substringMatcher(data),
      templates: {
        empty: [
          '<div class="empty-message">',
          'unable to find any users that match the current query',
          '</div>'
        ].join('\n'),
        suggestion: function(d) {
              return '<p><strong>' + d.name + '</strong></p>';
        }
      }
    });
  });
};
$(document).ready(ready);
$(document).on('page:load', ready);