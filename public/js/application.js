$(document).ready(function() {
  $(document).on("click", "#run", function(event){
    event.preventDefault
    var data = {answer: editor.getValue()};
    var currentUrl = $(location).attr('href');
    $.post(currentUrl, data, function(response){
      $('#output').html(response);
    })
  })

  $(document).on('click', '#doc-click', function(){
    $("#docs").slideToggle();
  })

  $(".nav-tabs li").click(function(){
    $(".nav-tabs .active").removeClass("active");
    $(this).addClass("active");
    
  })
});
