as yet unclassified
communicatorClassAndMethodCategoryExtractionBlock

	^ [:anObject | | reference |
		reference := anObject method methodReference.
		reference classSymbol asString , ' ' , (self methodCategoryExtractionBlock value: anObject)]