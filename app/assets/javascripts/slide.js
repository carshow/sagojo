$(function() {
     $('.slider').slick({
     infinite: true,
     dots: true,
     slidesToShow: 1,
     centerMode: true,
     centerPadding:'12%',
     autoplay:true,
     arrows: true,
     draggable: true,
      dotsClass: 'slide-dots',
     nextArrow: '<img src="https://d1te0bovbq6epg.cloudfront.net/common/img/slider/img_yajirushi_right.svg" class="slide-arrow prev-arrow">',
     prevArrow: '<img src="https://d1te0bovbq6epg.cloudfront.net/common/img/slider/img_yajirushi_left.svg" class="slide-arrow next-arrow">'
  });
});
