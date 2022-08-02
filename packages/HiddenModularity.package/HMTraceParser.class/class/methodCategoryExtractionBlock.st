as yet unclassified
methodCategoryExtractionBlock

	^ [:anObject | 
		| result |
		anObject isCompiledMethod
			ifTrue: [result := anObject methodReference category asString]
			ifFalse: [result := anObject method methodReference category asString].
		self aggregatedCategoryNameFor: result]
