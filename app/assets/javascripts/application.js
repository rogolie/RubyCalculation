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



$(function() {
    $( ".card" ).draggable( { revert: "invalid" });
    $( ".foundation" ).droppable({
        hoverClass: "ui-state-hover",
        drop: function( event, ui ) {
            $( this )
                .addClass( "ui-state-highlight" )
                .find( "p" )
                .html( "Dropped!" );
            /*tell API I dropped on this pile*/
        }
    });

    $( "#draggable2" ).draggable({ revert: "invalid" });
    $( "#droppable2" ).droppable({
        accept: "#draggable2",
        activeClass: "ui-state-default",
        drop: function( event, ui ) {
            /*retrive and show next card from deck*/
            $( this )
                .addClass( "ui-state-highlight" )
                .find( "p" )
                .html( "Dropped!" );
        }
    });
    $(".card").click(function(){
        var cardVal = 2;

    });
});