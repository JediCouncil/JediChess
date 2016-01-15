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

      if ( $this.parent().hasClass("selected_piece" )) {
        // if piece is unselected then disable drag
        if ( $this.hasClass("ui-draggable" )){
          $this.draggable("disable");
        }
        $this.parent().removeClass("selected_piece");
      }
      else {
        $this.parent().addClass("selected_piece")
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
      ui.draggable.parent().removeClass("selected_piece");
      ui.draggable.draggable("disable");

      var destination_id = $(this).attr("id"), //"e7"
          destination_x = destination_id[0],
          destination_y = destination_id[1];

      var $this = $(this);
       ui.draggable.position({
        my: "center",
        at: "center",
        of: $this
       });

      var draggable_piece = $(ui.draggable)
      var detached_draggable = draggable_piece.detach();
      draggable_piece.attr("style", "position: relative;");

      //attach piece to new destination
      var destination_id = '#'+ destination_id;
      $(destination_id).append(detached_draggable);

      $.ajax({
        method: "PUT",
        url: "/pieces/" + draggable_piece.data('item-id'),
        data: { piece: {x: destination_x, y: destination_y} }
      })
    }
  }//end of if
});
