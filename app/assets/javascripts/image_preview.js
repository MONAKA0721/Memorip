let open = "追加目的地を開く"
let close = "この目的地を消去する"
let plan_ol = new Vue({
  el: "#plan-ol",
  data: {
    show_button:[false, false, false, true, true, true, true, true, true, true],
    show_li:[true, true, true, false, false, false, false, false, false, false],
    button_message: [open, open, open, open, open, open, open, open, open, open]
  },
  created: function(){
    if(gon.planData){
      let destinations = gon.planData;
      console.log(destinations.length);
      if(destinations.length !== 10){
        count = 10 - destinations.length
        for(let i = 0; i < count; i++){
          destinations.push("");
        }
      }
      this.show_li = destinations.map(function(destination){
        if(destination === ""){
          return false;
        }else{
          return true;
        }
      });
      this.show_button = this.show_li.map(function(is_show){
        return true;
      });
      this.button_message = this.show_li.map(function(is_show){
        if(is_show){
          return close;
        }else{
          return open;
        }
      });
    }
  },
  methods: {
    display:function(index){
      if(!plan_ol.show_li[index]){
        Vue.set(plan_ol.show_li, index, true);
        Vue.set(plan_ol.button_message, index, close);
      }else{
        Vue.set(plan_ol.show_li, index, false);
        Vue.set(plan_ol.button_message, index, open);
      }
    },
    preview:function(index){
      const id = '#file' + String(index);
      var fileprop = $(id).prop('files')[0],
          find_img = $(id).parent().find('img'),
          filereader = new FileReader(),
          view_box = $(id).parent('.view_box');

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
  }
});

$(function(){
  $('#thumbnail').change(function(e){
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();

    //画像でない場合は処理終了
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }

    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $('#img1').removeAttr("src","thumbimg.png");
        $("#img1").attr("src", e.target.result);
        $("#img1").attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);

  });
});
