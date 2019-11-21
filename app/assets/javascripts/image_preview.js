$(function(){
  for ( let i = 0; i<10; i++ ) {
    $(`#file${i}`).on('change', function(){
       var fileprop = $(this).prop('files')[0],
           find_img = $(this).parent().find('img'),
           filereader = new FileReader(),
           view_box = $(this).parent('.view_box');

       if(find_img.length > 1){
         alert('画像は1つの目的地に1枚までです');
         return;
       }

      var img = '<div class="img_view"><img alt="" class="img_file" style="max-width:50px; max-height:50px;"><p><a href="#" class="img_del" style="font-size:5px;">画像を削除</a></p></div>';

      view_box.append(img);


      filereader.onload = function() {
        view_box.find('img.img_file').attr('src', filereader.result);
        img_del(view_box);
      }
      filereader.readAsDataURL(fileprop);
    });

    function img_del(target){
      target.find("a.img_del").on('click',function(){
        var self = $(this),
            parentBox = self.parent().parent().parent();
        if(window.confirm('画像を削除します。\nよろしいですか？')){
          setTimeout(function(){
            parentBox.find('input[type=file]').val('');
            parentBox.find('.img_view').remove();
          } , 0);
        }
        return false;
      });
    }
  }
  });
