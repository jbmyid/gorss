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
  item.animate({left: 0+"px"},150, function(){
    show_menu_item($(this).next())
  })
}
function hide_menu_item(item)
{
  item.animate({left: "-"+item.width()+"px"},100, function(){
    hide_menu_item($(this).prev())
  })
}

function show_popup()
{
  $(".popup").show().animate({left:0}, function(){
    show_menu_item($(".popup ul.win8-menu li:first"));
  })
}

function hide_popup()
{
  $(".popup").animate({left:"-50%"}, function(){
    $(this).hide();
    $(".content",$(this)).html("");
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
      $("ul.win8-menu li").css({left: "-290px"})
      // hide_menu_item($("ul.win8-menu li:last"))
    })
  })
  width = $("ul.win8-menu").width();
  $("ul.win8-menu li").css({left: "-"+width+"px"});

  $(".popup .close-btn").live("click", function(){
    hide_popup();
  })
})