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
     nextArrow: '<img src="https://d1te0bovbq6epg.cloudfront.net/common/img/slider/img_yajirushi_right.svg" class="slide-arrow prev-arrow">',
     prevArrow: '<img src="https://d1te0bovbq6epg.cloudfront.net/common/img/slider/img_yajirushi_left.svg" class="slide-arrow next-arrow">'
  });
});
