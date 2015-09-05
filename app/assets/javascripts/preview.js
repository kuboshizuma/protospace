$(function(){
  $('.img_preview').each(function(){
    var selfInput = $(this).find('input[type=file]');
    selfInput.change(function(){
      var file = selfInput[0].files[0];
      $img = $(this).siblings('img')
      fileRdr = new FileReader();
      fileRdr.onload = function(event) {
        $img.attr('src', event.target.result);
      }
      fileRdr.readAsDataURL(file)
      $img.css('display', 'inline');
    });
  });
});

$(function(){
  var last_image_input = $('.list-group-item:nth-child(3)')
  last_image_input.css('display', 'none');
  $('.list-group-item-plus').on('click', function(){
    $(this).css('display', 'none');
    last_image_input.css('display', 'block');
  });
});
