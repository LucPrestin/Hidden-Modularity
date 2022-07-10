information retrieving
aggregatedCategoryNameFor: categoryName

	| token |
	
	token := (categoryName findTokens: '-') first.

	self categoryNamesForAggregation do: [:name |
		(token beginsWith: name) 
			ifTrue: [^ name]].
	
	^ token

