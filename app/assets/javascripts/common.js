function apply_masonry()
{
  $('#feed-container').masonry({
    // options
    itemSelector : '.rss-feed-block',
		isAnimated: true,
		isFitWidth: true,
	    animationOptions: {
	    duration: 400,
	  }
    // columnWidth: 100
  });
}
$(function(){
  $(".feed-image img.f-img").load(function(){
      $(this).show();
      $(this).closest(".feed-image").find(".image-loading").hide();
  })
  $("img").load(function(){
      $('#feed-container').masonry('reload');
  })
})