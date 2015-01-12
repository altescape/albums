set_positions = ->
  # loop through and give each task a data-pos
  # attribute that holds its position in the DOM
  $('.album').each (i) ->
    $(this).attr("data-position",i+1)

set_positions()

el = document.getElementById('sortable');

if el
  sortable = Sortable.create(el, {
      ghostClass: "ghost",

      onEnd: (evt) ->

        updated_order = []
        set_positions()

        old_position = $('.album').eq(evt.oldIndex)
        new_position = $('.album').eq(evt.newIndex)
        # console.log(old_position)
        # console.log(evt.item)
        # console.log(evt.newIndex)
        # console.log(evt.oldIndex)

        $('.has_album').each (i) ->
          updated_order.push({ id: $(this).data('id'), position: i+1 })

        console.log(updated_order)

        $.ajax({
          type: "PUT",
          url: '/albums/sort',
          data: { order: updated_order }
        });
    })