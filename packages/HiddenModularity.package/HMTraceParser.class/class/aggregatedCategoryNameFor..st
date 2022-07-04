information retrieving
aggregatedCategoryNameFor: categoryName

	self categoryNamesForAggregation do: [:name |
		(categoryName beginsWith: name) 
			ifTrue: [^ name]].
	
	^ categoryName

