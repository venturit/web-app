# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	Morris.Line({
    	element: 'project_chart'
    	data: $('#project_chart').data('data')
    	xkey: 'id'
    	ykeys: ['phi2', 'temperature']
    	labels: ['Phi2', 'Temperature']
	})