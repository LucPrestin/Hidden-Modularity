information retrieving
classExtractionBlock

	^ [:anObject | 
	| name |
	name := anObject className.
	(name endsWith: ' class')
		ifTrue: [name := name truncateTo: name size - 6].
	name]