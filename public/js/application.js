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

  $(".nav-tabs #challenge").click(function(){
    $(".nav-tabs .active").removeClass("active");
    $(this).addClass("active");
    $("#current-challenge-attempts").hide();
    $("#current-challenge").show();
  })

  $(".nav-tabs #attempts").click(function(){
    $(".nav-tabs .active").removeClass("active");
    $(this).addClass("active");
    $("#current-challenge").hide();
    $("#current-challenge-attempts").show();
  })
});
