initialization
prepareCount
	
	self links withIndexDo: [:link :index |
		link index: index.
		self count at: link source index put: (((count at: link source index) ifNil: [0]) + 1).
		self count at: link target index put: (((count at: link target index) ifNil: [0]) + 1)
	]