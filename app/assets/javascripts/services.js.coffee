$("document").ready ->
  $(".circle0").popover
    placement: "right"
    content: "We turn good ideas into brilliant products."
  $(".circle1").popover
    placement: "right"
    content: "We study the problem before we write a single line of code."
  $(".circle2").popover
    placement: "right"
    content: "We apply sound design and user experience sense at all times."
  $(".circle3").popover
    placement: "right"
    content: "We are always measuring, from dev team velocity to visitor conversion rates."
  $(".circle4").popover
    placement: "left"
    content: "We use the right tools for the job, and make pull requests when we find room for improvement."
  $(".circle5").popover
    placement: "left"
    content: "We use experimental spikes to test our hypotheses, iterating to perfection."
  $(".middle").popover
    placement: "right"
    content: "We're utterly dedicated to curing your technical ailments with poignant code and pragmatic advice."


  
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
       c.each -> data1[$(this).attr('data-tag')] = $(this).text()
       $.post(
          "/content_update"
          {title: 'Save_data', data: data1}
          -> $(".save_button").fadeOut(1500)      
       )
       0
