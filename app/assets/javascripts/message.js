$(function() {

  $('.new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    $.ajax({
      type: 'POST',
      dataType: 'json',
      data: {
        message: {
          body: textField.val()
        }
      },
    })
    .done(function(data) {
      console.log("success");
      var html = buildHTML(data);
      $('.chat-messages').append(html);
      textField.val('');
    })
    .fail(function() {
      console.log("error");
    });
  });

  function buildHTML(data) {
    var message = $('<p class="chat-message_body">').append(data.body);
    var name = $('<p class="chat-message_name">').append(data.name);
    var timestamps = $('<p class="chat-message_time">').append(data.created_at);
    var header = $('<div class="chat-message__header clearfix">').append(name).append(timestamps);
    var html = $('<li class="chat-message">').append(header).append(message);
    return html;
  }
});
