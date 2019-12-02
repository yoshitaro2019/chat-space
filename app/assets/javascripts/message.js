$(function(){

  function buildMessage(message){
    var image = message.image? `<img src= ${ message.image }>` : "";

    var html = `<div class="message">
                <div class="message__upper-info">
                <div class="massage__upper-talker">
                ${message.user_name}
                </div>
                <div class="massage__upper-date">
                ${message.created_at}
                </div>
                </div>
                <div class="message__text">
                <p class="message__text__content">
                ${message.content}
                </p>
                </div>
                ${image}
                </div>`
    return html
  }


  $('#new_message').on('submit',function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax ({
      url: url,
      type:'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(message){
      var html = buildMessage(message);
      $('.messages').append(html);
      $('.new_message')[0].reset();
      $('.messages').animate({ scrollTop: $('.messages')[0].scrollHeight});
    })
    .fail(function(){
      alert("メッセージ送信に失敗しました")
    })
    .always(function(){
      $('form').find(':submit').removeAttr("disabled");
    })
  })
});