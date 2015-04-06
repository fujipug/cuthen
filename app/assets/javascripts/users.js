// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var ready = function() {
  var user_id, user_name, user_title, user_email;
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
      minLength: 1
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
          return '<div class="row"><div class="image-block"><img alt="User image" height="32" src="/assets/user_image.png" width="32"></div><div class="col-xs-3">' + d.name + '</div><div class="col-xs-3">' + d.title + '</div><div class="col-xs-3">' + d.email + '</div></div>';
        }
      }
    })
    .on('typeahead:selected', function($e, d){
      users = $(".hidden_user_input");
      doit = true;
      for (i = 0; i < users.length; i++) {
        if (Number(users[i].value) == d.id) {
          //alert("<p>test</p><b> dup: user_id: " + user_id + " | users[i].value: " + users[i].value + "</b>");
          doit = false;
          break;
        }
      }
      if (doit == true) add_user_field("add_user_button", "user", "itinerary", d.id, d.name, d.title, d.email, d.updated_at);
    });
  });
};
$(document).ready(ready);
$(document).on('page:load', ready);