function slider() {
  // SLIDER
  $("#owl-slider").owlCarousel({
    slideSpeed : 300,
    paginationSpeed : 400,
    singleItem: true,
    items: 1
  });
  $("#owl-articles").owlCarousel();
  $("#owl-tutoriels").owlCarousel({
    items: 3
  });

  // Custom Navigation Events
  $("#owl-slider-next").click(function(){
    $("#owl-slider").trigger('owl.next');
  })
  $("#owl-slider-prev").click(function(){
    $("#owl-slider").trigger('owl.prev');
  })
}