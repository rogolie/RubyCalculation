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

    var checkValidMoves = function(p1,p2,p3,p4){
        var validMove = false;
        validMove = checkPointPiles("DECK", p1,p2,p3,p4) || validMove;
        validMove = checkPointPiles("waste1", p1,p2,p3,p4) || validMove;
        validMove = checkPointPiles("waste2", p1,p2,p3,p4) || validMove;
        validMove = checkPointPiles("waste3", p1,p2,p3,p4) || validMove;
        validMove = checkPointPiles("waste4", p1,p2,p3,p4) || validMove;

        //if cards are in deck, there is still a valid move
        var deck = $("#DECK > img").attr('alt');
        if(deck != null){
            return true;
        }
        return validMove;
    };

    var checkPointPiles = function(pile1, p1,p2,p3,p4){
        //check if pile is waste
        var pile  = $("#"+pile1+" > ul > li:last-child > img").attr('alt');

        //check if pile is deck
        if(pile == null){
            pile = $("#"+pile1+" > img").attr('alt');
        }
        var validMove = false;
        if(pile != null){
            pile = parseInt(pile.slice(1));
            validMove = validMove || check(pile, $("#point1"), p1, 1);
            validMove = validMove || check(pile, $("#point2"), p2, 2);
            validMove = validMove || check(pile, $("#point3"), p3, 3);
            validMove = validMove || check(pile, $("#point4"), p4, 4);
        }
        return validMove;
    };


    $('.waste > ul > li:last-child img').addClass('card');


    var check = function(ident, pile, pileVal, iter){
        if ((pileVal + iter) > 13)
            pileVal-=13;

        if(ident === (pileVal + iter)){
            pile.droppable("enable")

        } else {
            pile.droppable("disable")
        }
    }

    //$(".card").click(function(){
    //    var id  = $(this).attr('alt');
    //    id = id.slice(1);
    //
    //    var p1 = $("#point1 > img").attr('alt').slice(1);
    //    var p2 = $("#point2 > img").attr('alt').slice(1);
    //    var p3 = $("#point3 > img").attr('alt').slice(1);
    //    var p4 = $("#point4 > img").attr('alt').slice(1);
    //
    //    check(parseInt(id), $("#point1"), parseInt(p1), 1);
    //    check(parseInt(id), $("#point2"), parseInt(p2), 2);
    //    check(parseInt(id), $("#point3"), parseInt(p3), 3);
    //    check(parseInt(id), $("#point4"), parseInt(p4), 4);
    //
    //
    //
    //
    //
    //});








    $( ".card" ).draggable( {
        revert: "invalid",
        snap: ".ui-widget-header",
        snapMode: "inner",
        snapTolerance: 30,
        stack: ".card",
        drag: function(){

            if($(this).closest('div').hasClass("waste")){
                $( ".waste > ul > li:last-child").droppable("disable");
                $(".waste").droppable("disable");
            }else{

                $( ".waste > ul > li:last-child").droppable("enable");
            }
            var id  = $(this).attr('alt');
            id = id.slice(1);

            var p1 = $("#point1 > img").attr('alt').slice(1);
            var p2 = $("#point2 > img").attr('alt').slice(1);
            var p3 = $("#point3 > img").attr('alt').slice(1);
            var p4 = $("#point4 > img").attr('alt').slice(1);

            check(parseInt(id), $("#point1"), parseInt(p1), 1);
            check(parseInt(id), $("#point2"), parseInt(p2), 2);
            check(parseInt(id), $("#point3"), parseInt(p3), 3);
            check(parseInt(id), $("#point4"), parseInt(p4), 4);
        },
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
    $( ".waste > ul > li:last-child img").draggable({
        revert: "invalid",
        snap: ".ui-widget-header",
        snapMode: "inner",
        snapTolerance: 30,
        stack: ".card",
        start: function (event, ui) {
            $(this).data("sourceId", $(this).closest('div').attr('id'));


        }
    });
    $("#waste1, #waste2, #waste3, #waste4").droppable({
        hoverClass: "ui-state-hover",
        drop: function( event, ui ) {

            var id = $( this)
                .attr("id");
            console.log(id+ "dropp");
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

            var id = $( this).closest(".waste")
                .attr("id");
            console.log(id+ "dropp");
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


    $(window).load(function(){

        $("#point1").droppable("disable");
        $("#point2").droppable("disable");
        $("#point3").droppable("disable");
        $("#point4").droppable("disable");

        if( $("#waste1 > ul").children("li").length >= 1) {
            $("#waste1").droppable("disable");

        }else{
            $("#waste1").droppable("enable");
        }
        if( $("#waste2 > ul").children("li").length >= 1){
            $("#waste2").droppable("disable");
        }else{
            $("#waste1").droppable("enable");
        }
        if( $("#waste3 > ul").children("li").length >= 1){
            $("#waste3").droppable("disable");
        }else{
            $("#waste1").droppable("enable");
        }
        if( $("#waste4 > ul").children("li").length >= 1){
            $("#waste4").droppable("disable");
        }else{
            $("#waste1").droppable("enable");
        }

        var p1 = parseInt($("#point1 > img").attr('alt').slice(1));
        var p2 = parseInt($("#point2 > img").attr('alt').slice(1));
        var p3 = parseInt($("#point3 > img").attr('alt').slice(1));
        var p4 = parseInt($("#point4 > img").attr('alt').slice(1));

       setTimeout(function(){

           if(!checkValidMoves(p1,p2,p3,p4)){
               //check if win
               if(p1 + p2 + p3 + p4 == 13*4){
                   alert("YOU WIN THE GAME! \n press New Game to play again!");
               }
               else{
                   //if the deck is empty, check if lose
                   alert("GAME OVER \nNO VALID MOVES LEFT\n press New Game to play again!");
               }
           }

       },0);




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