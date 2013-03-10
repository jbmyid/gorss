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