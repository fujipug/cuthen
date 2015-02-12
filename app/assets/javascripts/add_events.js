# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
root = exports ? this

root.testFunction = -> 
	test = $("<p>")
	test.html "test"
	$("body").append $(test)