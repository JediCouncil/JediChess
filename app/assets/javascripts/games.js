$(document).ready(function(){
  if ( $('#chess').length ) {
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
      destination = $(this);
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
    //      {status: "success", pieces_moved: [
    //   {type: type, position: {x: x_coords[1], y: y },
    //    type: rook.type, position: {x: x_coords[0], y: rook.y}
    //   } ]
    // }
        // debugger;
          if (response.status == "success"){
            response.pieces_moved.forEach(function(piece){
              debugger;
              var original_pos = '#' + piece.original_position.x + piece.original_position.y
              var detached_piece = $(original_pos).find('div').detach();
              detached_piece.attr("style", "position: relative;");
              var new_pos = '#' + piece.new_position.x + piece.new_position.y
              $(new_pos).append(detached_piece);
            })

          }



          // if (response != false) {
          //   // debugger;
          //   if (response[0] == "King" && response[1] == "Rook") {
          //     var detached_king = draggable_piece.detach();
          //     var detached_rook = destination.find("div").detach();
          //     detached_king.attr("style", "position: relative;");
          //     detached_rook.attr("style", "position: relative;");

          //     //attach piece to new destination
          //     var destination_id_king = '#' + response[2]['king_x_coord'] + destination_y;
          //     var destination_id_rook = '#' + response[2]['rook_x_coord'] + destination_y;
          //     $(destination_id_king).append(detached_king);
          //     $(destination_id_rook).append(detached_rook);

          //   }
          //   else {
          //     var detached_draggable = draggable_piece.detach();
          //     draggable_piece.attr("style", "position: relative;");

          //     //attach piece to new destination
          //     var destination_id = '#'+ destination_x + destination_y;
          //     $(destination_id).append(detached_draggable);
          //   }
          // }// end of if response != false
        }); //end of done
    }//end of drop function
  }//end of if
});


