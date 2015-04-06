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
//=
//= require_tree .



$(function() {

    var check = function(ident, pile, pileVal, iter){
        if ((pileVal + iter) > 13)
            pileVal-=13;

        if(ident === (pileVal + iter)){
            pile.droppable("enable")

        } else {
            pile.droppable("disable")
        }
    }

    $(".DECK > img").ready(function(){
        var id  = $("#DECK > img").attr('alt');
        id = id.slice(1);

        var p1 = $("#point1 > img").attr('alt').slice(1);
        var p2 = $("#point2 > img").attr('alt').slice(1);
        var p3 = $("#point3 > img").attr('alt').slice(1);
        var p4 = $("#point4 > img").attr('alt').slice(1);

        check(parseInt(id), $("#point1"), parseInt(p1), 1);
        check(parseInt(id), $("#point2"), parseInt(p2), 2);
        check(parseInt(id), $("#point3"), parseInt(p3), 3);
        check(parseInt(id), $("#point4"), parseInt(p4), 4);

    });








    $( ".card" ).draggable( {
        revert: "invalid",
        snap: ".ui-widget-header",
        snapMode: "inner",
        snapTolerance: 30,
        stack: ".card",
        start: function( event, ui ) {
            $(this).data("sourceId", $(this).parent('div').attr('id') );



        }

    });
    $( ".foundation" ).droppable({
        hoverClass: "ui-state-hover",
        drop: function( event, ui ) {
            var id = $( this )
                .attr("id");
            var cid = ui.draggable.attr("alt");
            var sid = ui.draggable.data("sourceId");

            //$("#dropID").html(id + "  " + cid + " " + sid);

            $.ajax({
                type: "POST",
                url: "http://localhost:8888/logic/move",
                dataType:  "json",
                data: {pile1: sid, pile2: id}

            }).done(function(data){
                location.reload();
            }).fail(function(err){console.log(err)});



            /*tell API I dropped on this pile*/
        }


    });
    $( ".waste > ul > li:last-child").droppable({
        hoverClass: "ui-state-hover",
        drop: function( event, ui ) {
            var id = $( this )
                .attr("id");
            var cid = ui.draggable.attr("alt");
            var sid = ui.draggable.data("sourceId");

            //$("#dropID").html(id + "  " + cid + " " + sid);

            $.ajax({
                type: "POST",
                url: "http://localhost:8888/logic/move",
                dataType:  "json",
                data: {pile1: sid, pile2: id}

            }).done(function(data){
                location.reload();
            }).fail(function(err){console.log(err)});



            /*tell API I dropped on this pile*/
        }


    });


    //$( "#draggable2" ).draggable({ revert: "invalid" });
    //$( "#droppable2" ).droppable({
    //    accept: "#draggable2",
    //    activeClass: "ui-state-default",
    //    drop: function( event, ui ) {
    //        /*retrive and show next card from deck*/
    //        $( this )
    //            .addClass( "ui-state-highlight" )
    //            .find( "p" )
    //            .html( "Dropped!" );
    //    }
    //});

});