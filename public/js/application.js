$(document).ready( function() {
  $('#run-code').on("click",'#run', function(event){
    event.preventDefault();
    $('#user-code').val(editor.getValue());
    $("#run-code").submit();
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
