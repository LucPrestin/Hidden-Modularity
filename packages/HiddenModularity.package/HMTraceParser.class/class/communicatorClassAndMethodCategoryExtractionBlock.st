information retrieving
communicatorClassAndMethodCategoryExtractionBlock

	^ [:anObject | | reference |
		reference := anObject method methodReference.
		reference classSymbol asString , ' ' , reference category asString]