$(function(){
  var imgs = $("#slideshow > li");
  var imgLen = imgs.length;
  var count = 0;
  function changeImg(){
    //スライド切替のポイント（配列を順番に処理し終わったら配列の先頭に戻る計算式）
    count = (count + 1) % imgLen;
    imgs.removeClass("showSlide").eq(count).addClass("showSlide");
  }
  setInterval(changeImg, 5000); //切替の間隔（ミリ秒）
})
