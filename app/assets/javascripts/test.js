$(document).ready(function(){
  $('.pending').on('click', function(data){
    console.log('pending');
    var id = ($(this).attr("data"));
    $.ajax({
      type: "GET",
      status: 200,
      url: "/pending/" + id,
      success: function(data){
        console.log(data);
      },
      error: function(){
        console.log("An error occured retrieving pending");
      }//ajaxobject
    });//ajaxcall
  });//click
  $('.incomplete').on('click', function(data){
    console.log('incomplete');
    var id = ($(this).attr("data"));
    $.ajax({
      type: "GET",
      status: 200,
      url: "/incomplete/" + id,
      success: function(data){
        console.log(data);
      },
      error: function(){
        console.log("An error occured retrieving incomplete");
      }//success
    });//ajax
  });//click
  $('.completed').on('click', function(data){
    var id = ($(this).attr("data"));
    $.ajax({
      type: "GET",
      status: 200,
      url: "/completed/" + id,
      success: function(data){
        console.log(data);
      },
      error: function(){
        console.log("An error occured retrieving completed");
      }//success
    });//ajax
  });//click
  $('#task-show').click(function(){
    $('.othertasks').removeClass('hide')
  })
});
