# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
@InfiniteLoader = ->
	@page = 1
	self = @
	@loading = false
	@finish = false
	@init = ->
		apply_masonry()
		@scrollerSet()
		@
	@nearBottomOfPage= ->
		return ($(window).scrollTop() > $(document).height() - $(window).height() - 50)
	@finish_it = ->
	  @finish = true
	@scrollerSet = ->
		$(window).scroll ->
	    if self.loading
	    	console.log "in"
	    	return
	    if(self.nearBottomOfPage() && !self.finish)
	      self.loading=true
	      self.page = self.page + 1
	      console.log self.page
	      $.ajax
	      	url: "?page=" + self.page
	      	type: "get"
	      	dataType: "script"
	      	beforeSend: ->
	      		$(".bottom-loader").show()
	      	success: ->
	      		$(".bottom-loader").hide()
	      		$("#feed-container").masonry "reload"
	      		self.loading = false
	@init()
