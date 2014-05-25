// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bxslider
//= require turbolinks
//= require_tree .
//= require jquery.ui.all
//= require jquery.turbolinks
//= require gritter
//= require jquery-ui-timepicker-addon
//= require jquery.timepicker.js
//= require jquery.timepicker.js
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest("tr").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).closest("table").children("tbody").children().last().after(content.replace(regexp, new_id));
}

$(function() {
    $( "input[type=submit], #button").button();          
         
    $( ".accordion" ).accordion({
    	heightStyle: "content"
    });
    
    $("#event_time_begin, #event_time_end").timepicker();
    
	function split( val ) {
	  return val.split( /,\s*/ );
	}	
	function extractLast( term ) {
	  return split( term ).pop();
	}    
    $(".society_auto_complete").autocomplete({
    minLength: 0,
    source: '/societies/autocomplete.json',
        focus: function() {
          // prevent value inserted on focus
          return false;
        },
        select: function( event, ui ) {
          var terms = split( this.value );
          // remove the current input
          terms.pop();
          // add the selected item
          terms.push( ui.item.value );
          // add placeholder to get the comma-and-space at the end
          terms.push( "" );
          this.value = terms.join( ", " );
          return false;
        }
  	});
  	
  	$( ".pulsate" ).effect( "pulsate", null, 3000, null ); 	
    
    $( document ).tooltip();
    
    
	$("#search_input").autocomplete({
	    minLength: 0,
	    source: '/pages/search_autocomplete.json',
	});
  }); 

$(document).on('page:change', function () {
  $('.bxslider').bxSlider({
    auto: true,
  });
  $(".menu ul").superfish();
});
