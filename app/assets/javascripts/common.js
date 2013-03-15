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
function image_loading_callback(){
  $(".feed-image img.f-img").load(function(){
      $(this).show();
      $(this).closest(".feed-image").find(".image-loading").hide();
  })
  $("img").load(function(){
      $('#feed-container').masonry('reload');
  })


}
function show_menu_item(item)
{
  item.animate({left: 0+"px"},300, function(){
    show_menu_item($(this).next())
  })
}
function hide_menu_item(item)
{
  item.animate({left: "-"+item.width()+"px"},100, function(){
    hide_menu_item($(this).prev())
  })
}


$(function(){
  image_loading_callback();

  $(".side-menu").hover(function(){
    $(this).stop().animate({right: "0px"},200,function(){
      show_menu_item($("ul.win8-menu li:first"))
    })
    },function(){
    $(this).stop().animate({right: "-290px"},150, function(){
      hide_menu_item($("ul.win8-menu li:last"))
    })
  })
  width = $("ul.win8-menu").width();
  $("ul.win8-menu li").css({left: "-"+width+"px"});
  
})