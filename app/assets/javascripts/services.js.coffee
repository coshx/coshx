$("document").ready ->
  $(".circle0").popover
    placement: "right"
    content: "We have the technical expertise to make your ideas become an amazing reality."
  $(".circle1").popover
    placement: "right"
    content: "We have the technical expertise to make your ideas become an amazing reality."
  $(".circle2").popover
    placement: "right"
    content: "We have the technical expertise to make your ideas become an amazing reality."
  $(".circle3").popover
    placement: "right"
    content: "We have the technical expertise to make your ideas become an amazing reality."
  $(".circle4").popover
    placement: "left"
    content: "We have the technical expertise to make your ideas become an amazing reality."
  $(".circle5").popover
    placement: "left"
    content: "We have the technical expertise to make your ideas become an amazing reality."
  $(".middle").popover
    placement: "right"
    content: "We have the technical expertise to make your ideas become an amazing reality."


  
  $('[contenteditable]')
      .live 'focus', ->
          $this = $(this)
          $this.data 'before', $this.html()
          return $this
      .live 'blur keyup paste', ->
          $this = $(this)
          if $this.data('before') isnt $this.html()
              $this.data 'before', $this.html()
              $this.trigger('change')
              $(".save_button").fadeIn(1000)     
          
  $('.save_button').click ->
       c = $("[contenteditable]")
       data1 = {}
       c.each ->
          data1[$(this).attr('data-tag')] = $(this).text()
        
       
       $.post(
          "/content_update"
          {title: 'Save_data', data: data1}
          'json'
          -> $(".save_button").fadeOut(1500)      
       )
       $(".save_button").fadeOut(1500)      
       0
