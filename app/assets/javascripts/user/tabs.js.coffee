@SearchEngine = (options={}) ->
	self = @
	defaults= {element: $("#search")}
	@options = $.extend({},defaults,options)
	@ele = @options.element
	@init = ->
		console.log @options
		@setSearch()
		@
	@setSearch =->
		@ele.keyup ->
			val = self.ele.val()
			if val.length==0
				$("li.tab_li").show()
			else
				$("li.tab_li").hide()
				$("li.tab_li").each (i,v)->
					if $("span",v).html().match(val)
						$(v).show()
						$('#feed-container').masonry('reload');
	@init()

$ ->
	se = new SearchEngine()