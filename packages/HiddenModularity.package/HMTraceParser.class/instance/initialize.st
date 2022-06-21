initialization
initialize

	self 
		idExtractionBlock: self class classExtractionBlock;
		labelExtractionBlock: self class classExtractionBlock;
		colorLabelExtractionBlock: self class packageExtractionBlock;
		colors: Dictionary new;
		blacklist: self class blacklist
