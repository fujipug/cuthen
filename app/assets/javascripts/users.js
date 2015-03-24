// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var ready = function() {
  //$.get( $("#target").data("url"), function( data ) {
    var bestPictures = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: '../users_typeahead.json',
    });
    bestPictures.initialize();
    $('#the-basics .typeahead').typeahead({
      hint: true,
      highlight: true,
      minLength: 0
    },
    {
      name: 'uusers_typeahead',
      displayKey: 'value',
      source: bestPictures.ttAdapter(),
      templates: {
        empty: [
          '<div class="empty-message">',
          'unable to find any users that match the current query',
          '</div>'
        ].join('\n'),
        suggestion: Handlebars.compile('<p><strong>{{value}}</strong> – moo</p>')
      }
    });
  //});
};
$(document).ready(ready);
$(document).on('page:load', ready);