jQuery(function($){

  if(!gon.winner) {
    $("#winner").hide();
  }

  function popUp() {
      $(this).toggleClass('text-success');
      $(this).animate({'top': '-10px'}, "fast");
  }

  function popDown() {
      $(this).toggleClass('text-success');
      $(this).animate({'top': '0px'}, "fast");
  }

    var banner = $("div.page-header");

    banner.on("mouseenter", "h1", popUp);

    banner.on("mouseleave", "h1", popDown);
});
