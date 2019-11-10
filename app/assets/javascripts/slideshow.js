$(function(){
  $('body').vegas({ //背景画像でスライドショーしたい場所の設定
    slides: [
     { src: '/Hokkaido.jpg' }, //スライドする画像を配列で設定
     { src: '/Kyoto.jpg' },
     { src: '/Okinawa.jpg' }
   ],
     delay: 6000, //スライドまでの時間ををミリ秒単位で設定
     timer: true,
     transition: 'blur', //スライド間のエフェクトを設定
     transitionDuration: 3000 //エフェクト時間をミリ秒単位で設定
  });
});
