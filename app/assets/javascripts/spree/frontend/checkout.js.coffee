Spree.disableSaveOnClick = ->
  ($ 'form.edit_order').on('submit', (e) ->
    if (($ this).data('submitted') == true)
      # Previously submitted, don't submit again
      e.preventDefault()
    else

      ### from cart.js.coffee ###
      if ($ 'form#update-cart').is('*')
        ($ 'form#update-cart a.delete').show().one 'click', ->
          ($ this).parents('.line-item').first().find('input.line_item_quantity').val 0
          ($ this).parents('form').first().submit()
          false

      ($ 'form#update-cart').submit ->
        ($ 'form#update-cart #update-button').attr('disabled', true)
      ###########################

      # Mark it so that the next submit gets ignored
      ($ this).data('submitted', true)
      ($ this).find(':submit, :image').removeClass('primary').addClass 'disabled'
  )

Spree.enableSave = ->
  ($ 'form.edit_order').data('submitted', false).find(':submit, :image').attr('disabled', false).addClass('primary').removeClass 'disabled'

Spree.ready ($) ->
  Spree.Checkout = {}
