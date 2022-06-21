initialization
initialize

	self 
		idExtractionBlock: self class defaultIdExtractionBlock;
		labelExtractionBlock: self class defaultLabelExtractionBlock;
		colorLabelExtractionBlock: self class defaultColorLabelExtractionBlock;
		colors: Dictionary new
