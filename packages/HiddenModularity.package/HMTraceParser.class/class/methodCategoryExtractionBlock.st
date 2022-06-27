information retrieving
methodCategoryExtractionBlock

	^ [:anObject | 
		| result |
		anObject isCompiledMethod
			ifTrue: [result := anObject methodReference category asString]
			ifFalse: [result := anObject method methodReference category asString].
		result]
