$(document).ready(function() {
  $(document).on("click", "#run", function(event){
    event.preventDefault
    var data = {answer: editor.getValue()};
    var currentUrl = $(location).attr('href');
    $.post(currentUrl, data, function(response){
      console.log(response)
      $('#output').html(response);
    })
  })
});
