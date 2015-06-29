$(document).ready(function(){
  $('.pending').on('click', function(data){
    console.log('pending');
    var id = ($(this).attr("data"));
    $.ajax({
      type: "GET",
      status: 200,
      url: "/pending/" + id,
      success: function(data){
        $('#status-' + id).empty();
        $('#status-' + id).append(data.status);
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
        $('#status-' + data.id).empty();
        $('#status-' + data.id).append(data.status);
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
        $('#status-' + data.id).empty();
        $('#status-' + data.id).append(data.status);
      },
      error: function(){
        console.log("An error occured retrieving completed");
      }//success
    });//ajax
  });//click

  //SHOWTASKS
  $('#task-show').click(function(){
    $('.othertasks').toggleClass('hide')
  })

  //--------SORTING-------
  $('#inc-title').click(function(){
    var id = ($(this).attr("data"));
    $.ajax({
      type: "GET",
      status: 200,
      url: "/title/" + id,
      success: function(data){
        var incompletes = [];
        var othertasks = [];
        for(i=0; i<data.length; i++){
          if(data[i].status === "incomplete"){
            incompletes.push(data[i]);
          }else{
            othertasks.push(data[i]);
          };//if
        };//for
        $('#incompletes').empty();
        console.log(incompletes);
        for(i=0; i<incompletes.length; i++){
          $('#incompletes').append("<div class='card cyan lighten-1 col s3' id='task-" + incompletes[i].id +"'</div>")
          $('#task-' + incompletes[i].id).append("<div class='card-content white-text' id='task-content-" + incompletes[i].id + "'</div>")
          $('#task-content-' + incompletes[i].id).append("<div data=" + incompletes[i].id + " class='waves-effect waves-light btn pending'>Pending</div>");
          $('#task-content-' + incompletes[i].id).append("<div data=" + incompletes[i].id + " class='waves-effect waves-light btn completed'>Complete</div>");
          $('#task-content-' + incompletes[i].id).append("<div data=" + incompletes[i].id + " class='waves-effect waves-light btn incomplete'>Incomplete</div>");
          $('#task-content-' + incompletes[i].id).append("<h4>" + incompletes[i].title + "</h4>");
          $('#task-content-' + incompletes[i].id).append("<p>" + incompletes[i].description + "</p>");
          $('#task-content-' + incompletes[i].id).append("<p>" + incompletes[i].status + "</p>");
          $('#task-content-' + incompletes[i].id).append("<p>" + incompletes[i].due_date + "</p>");
          $('#task-content-' + incompletes[i].id).append("<div class='waves-effect waves-light btn'><a href='/lists/tasks/" + incompletes[i].id + "/edit'>Edit</a>");
          $('#task-content-' + incompletes[i].id).append("<div class='waves-effect waves-light btn'><a rel='nofollow' data-method='delete' href='/lists/tasks/" + id + "?task_id=" + incompletes[i].id + "'>Delete</a>");
        }//for
      },//success
      error: function(){
        console.log("Something went wrong");
      }
    });
  });
  $('#inc-due_date').click(function(){
    var id = ($(this).attr("data"));
    $.ajax({
      type: "GET",
      status: 200,
      url: "/due-date/" + id,
      success: function(data){
        var incompletes = [];
        var othertasks = [];
        for(i=0; i<data.length; i++){
          if(data[i].status === "incomplete"){
            incompletes.push(data[i]);
          }else{
            othertasks.push(data[i]);
          };//if
        };//for
        $('#incompletes').empty();
        console.log(incompletes);
        for(i=0; i<incompletes.length; i++){
          $('#incompletes').append("<div class='card cyan lighten-1 col s3' id='task-" + incompletes[i].id +"'</div>")
          $('#task-' + incompletes[i].id).append("<div class='card-content white-text' id='task-content-" + incompletes[i].id + "'</div>")
          $('#task-content-' + incompletes[i].id).append("<div data=" + incompletes[i].id + " class='waves-effect waves-light btn pending'>Pending</div>");
          $('#task-content-' + incompletes[i].id).append("<div data=" + incompletes[i].id + " class='waves-effect waves-light btn completed'>Complete</div>");
          $('#task-content-' + incompletes[i].id).append("<div data=" + incompletes[i].id + " class='waves-effect waves-light btn incomplete'>Incomplete</div>");
          $('#task-content-' + incompletes[i].id).append("<h4>" + incompletes[i].title + "</h4>");
          $('#task-content-' + incompletes[i].id).append("<p>" + incompletes[i].description + "</p>");
          $('#task-content-' + incompletes[i].id).append("<p>" + incompletes[i].status + "</p>");
          $('#task-content-' + incompletes[i].id).append("<p>" + incompletes[i].due_date + "</p>");
          $('#task-content-' + incompletes[i].id).append("<div class='waves-effect waves-light btn'><a href='/lists/tasks/" + incompletes[i].id + "/edit'>Edit</a>");
          $('#task-content-' + incompletes[i].id).append("<div class='waves-effect waves-light btn'><a rel='nofollow' data-method='delete' href='/lists/tasks/" + id + "?task_id=" + incompletes[i].id + "'>Delete</a>");
        }//for
      },//success
      error: function(){
        console.log("Something went wrong");
      }
    });
  });

  $('#inc-status').click(function(data){
    var id = ($(this).attr("data"));
    $.ajax({
      type: "GET",
      status: 200,
      url: "/status/" + id,
      success: function(data){
        var incompletes = [];
        var othertasks = [];
        for(i=0; i<data.length; i++){
          if(data[i].status === "incomplete"){
            incompletes.push(data[i]);
          }else{
            othertasks.push(data[i]);
          };//if
        };//for
        $('#incompletes').empty();
        console.log(incompletes);
        console.log("list id: " + id);
        for(i=0; i<incompletes.length; i++){
          $('#incompletes').append("<div class='card cyan lighten-1 col s3' id='task-" + incompletes[i].id +"'</div>")
          $('#task-' + incompletes[i].id).append("<div class='card-content white-text' id='task-content-" + incompletes[i].id + "'</div>")
          $('#task-content-' + incompletes[i].id).append("<div data=" + incompletes[i].id + " class='waves-effect waves-light btn pending'>Pending</div>");
          $('#task-content-' + incompletes[i].id).append("<div data=" + incompletes[i].id + " class='waves-effect waves-light btn completed'>Complete</div>");
          $('#task-content-' + incompletes[i].id).append("<div data=" + incompletes[i].id + " class='waves-effect waves-light btn incomplete'>Incomplete</div>");
          $('#task-content-' + incompletes[i].id).append("<h4>" + incompletes[i].title + "</h4>");
          $('#task-content-' + incompletes[i].id).append("<p>" + incompletes[i].description + "</p>");
          $('#task-content-' + incompletes[i].id).append("<p>" + incompletes[i].status + "</p>");
          $('#task-content-' + incompletes[i].id).append("<p>" + incompletes[i].due_date + "</p>");
          $('#task-content-' + incompletes[i].id).append("<div class='waves-effect waves-light btn'><a href='/lists/tasks/" + incompletes[i].id + "/edit'>Edit</a>");
          $('#task-content-' + incompletes[i].id).append("<div class='waves-effect waves-light btn'><a rel='nofollow' data-method='delete' href='/lists/tasks/" + id + "?task_id=" + incompletes[i].id + "'>Delete</a>");
        }//for
      },//success
      error: function(){
        console.log("Something went wrong");
      }
    });
  });
});
