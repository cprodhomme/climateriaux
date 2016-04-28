function menu() {
  // MENU
  var menuWidth = $( ".menu-categories" ).width();
  var menuCanOpen = true;
  $("#menu").click(function(){
    if ($(".menu-categories").is( ".show" ) && menuCanOpen == true) {
      menuCanOpen = false; 
      $(".menu-icon").removeClass("is-opened");
      $( ".menu-categories" ).animate({
        left: "-"+menuWidth
      }, 400, function() {
        $(".menu-categories").removeClass("show");
        menuCanOpen = true;
      });
    } else if (menuCanOpen == true) { 
      menuCanOpen = false; 
      $(".menu-categories").addClass("show");
      $(".menu-icon").addClass("is-opened");
      $( ".menu-categories" ).animate({
        left: "+0"
      }, 400, function() {
        menuCanOpen = true;
      });
    }
  })

  // affiche les sous catégories
  $(".primary-category").click(function(){
    $(".primary-categories").addClass("hide");
    var myClass = $(this).attr('class').replace('primary-category ','.');
    $(".secondary-category"+myClass).addClass("show");
  })

  // cache les sous catégories
  $(".current-category").click(function(){
    $(".secondary-category.show").removeClass("show");
    $(".primary-categories").removeClass("hide");
  })
}