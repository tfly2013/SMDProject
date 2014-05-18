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
//= require turbolinks
//= require_tree .
//= require jquery.ui.all
//= require jquery.turbolinks
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest("tr").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).closest("table").children("tbody").children().last().after(content.replace(regexp, new_id));
}

var ready = function() {
    $(".menu ul").superfish(); 
};

$(function() {
    $( "input[type=submit], #button" )
      .button();      
    $(".society_auto_complete").autocomplete({
    source: '/societies/autocomplete.json',
  	});
  });

$(document).ready(ready);
$(document).on('page:load', ready);