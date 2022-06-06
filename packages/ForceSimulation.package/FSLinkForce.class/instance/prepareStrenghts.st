initialization
prepareStrenghts

	self links withIndexDo: [:link :index |
		self strengths at: index put: (self strength value: link value: self count)
	]