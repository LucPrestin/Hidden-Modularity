information retrieving
colorFor: anId

	| color |

	(self class colors includesKey: anId) 
		ifFalse: [
			color := self class uniqueColor: self class colors values.
			self class colors at: anId put: color]
		ifTrue: [color := self class colors at: anId].
		
	^ color
