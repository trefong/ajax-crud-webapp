$(document).ready(function() {
  getForm();
  submitPost();

});


var getForm = function(){$('#sidebar').on('click','#new_post_link', function(event){
    event.preventDefault();
    $.ajax({
      url:"/posts/new",
      type:"get"
    }).done(function(response){
      $("#new_post_link").hide();
      $("#new_post_form").prepend(response);
    });
  })
};




var submitPost = function(){$("#new_post_form").on("submit", "#post_form", function(event){
  event.preventDefault();
  var data = $("#post_form").serialize();
  console.log(data);
  $.ajax({
    url: "/posts",
    type: "post",
    data: data
  }).done(function(response){
    $("#post_form").hide();
    $("#new_post_link").show();
    $("#posts").prepend(response);
  });

});
};