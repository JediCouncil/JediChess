$(document).ready(function(){
  if ( $('#chess').length ) {

    var pusher = new Pusher('07600f80f17ff8fb46ba');
    var channel = pusher.subscribe('game-' + gon.game_id);
    debugger;

    channel.bind('refresh_page', function() {
      location.reload(); //reloads current document
    });

    // Some useful debug msgs
    pusher.connection.bind('connecting', function() {
      alert('Connecting to Pusher...');
    });
    pusher.connection.bind('connected', function() {
      alert('Connected to Pusher!');
    });
    pusher.connection.bind('failed', function() {
        alert('Connection to Pusher failed :(');
      });
    channel.bind('subscription_error', function(status) {
      alert('Pusher subscription_error');
    });

    for (key in gon.pieces_hash) {

      pos_id = '#' + key
      text = "<div class=\"" + gon.pieces_hash[key][0] + " center-block\" data-item-id = " + gon.pieces_hash[key][1] + "></div>"
      $(pos_id).html(text) //this jquery finds each id tag with the value pos_id and insert the above <div class = 'color_type'></div> inside it so it gets inserted inside the td tag
    };

    var lastClicked;

    $("#chess td div").on('click', function(){
      var $this = $(this);

      if ( lastClicked != undefined ) {
        if (this != lastClicked) {
          $(lastClicked).parent().removeClass("selected_piece");
        }
      }

      if ( $this.closest("td").hasClass("selected_piece" )) {
        // if piece is unselected then disable drag
        if ( $this.hasClass("ui-draggable" )){
          $this.draggable("disable");
        }
        $this.closest("td").removeClass("selected_piece");
      }
      else {
        $this.closest("td").addClass("selected_piece")
        lastClicked = this;

        if ( $this.hasClass("ui-draggable-disabled" )){
          $this.draggable("enable");
        }
        else {
          $this.draggable({
            containment: 'tbody',
            helper: 'clone'
          });
        }
      }
    });

    //Every chess tile accepts a draggable
    $("#chess tr > td").droppable({
      drop: updatePieceCoordinates
    });

    //Handles Drop Event and triggers ajax PUT request
    function updatePieceCoordinates(event, ui){
      draggable_piece = $(ui.draggable);

      draggable_piece.parent().removeClass("selected_piece");
      draggable_piece.draggable("disable");

      destination_id = $(this).attr("id"); //"e7"
      destination_x = destination_id[0];
      destination_y = destination_id[1];

      var $this = $(this);
        draggable_piece.position({
        my: "center",
        at: "center",
        of: $this
       });


      $.ajax({
        method: "PUT",
        url: "/pieces/" + draggable_piece.data('item-id'),
        data: { piece: {x: destination_x, y: destination_y} }
      })
        .done(function(response){
          if (response.status == "success"){
            if (response.pieces_destroyed != undefined) {
              if (response.pieces_destroyed.length > 0) {
                var destroyed_piece = response.pieces_destroyed[0];
                var pos = '#' + destroyed_piece.position.x + destroyed_piece.position.y;
                $(pos).find('div').detach();
              }
            }

            response.pieces_moved.forEach(function(piece){
              var original_pos = '#' + piece.original_position.x + piece.original_position.y
              var detached_piece = $(original_pos).find('div').detach();
              detached_piece.attr("style", "position: relative;");
              var new_pos = '#' + piece.new_position.x + piece.new_position.y
              $(new_pos).append(detached_piece);
            })
          }
        }) //end of done
        .fail(function(){
          alert("An error has occured");
        }) //end of fail
    }//end of drop function
  }//end of if
});


