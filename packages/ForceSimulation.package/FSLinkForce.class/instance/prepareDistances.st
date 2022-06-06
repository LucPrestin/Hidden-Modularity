initialization
prepareDistances

	self links withIndexDo: [:link :index |
		self distances at: index put: (self distance value: link source value: link target)
	]