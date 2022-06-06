initialization
prepareBias

	self links withIndexDo: [:link :index |
		self bias at: index put: ((self count at: link source index) / ((self count at: link source index) + (self count at: link target index)))	
	]	