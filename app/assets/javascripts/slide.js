$(function() {
    $('.slider').slick({
          infinite: true,
          dots: true,
          slidesToShow: 1,
          centerMode: true, //要素を中央寄せ
          centerPadding:'12%', //両サイドの見えている部分のサイズ
          autoplay:true, //自動再生
          arrows: true,
          draggable: true,
     });
});
