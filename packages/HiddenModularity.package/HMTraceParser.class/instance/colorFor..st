initialization
colorFor: anId

	| color |

	(self class colors includesKey: anId) 
		ifFalse: [
			color := HMUtils uniqueColorWithCurrentColors: self class colors values.
			self class colors at: anId put: color]
		ifTrue: [color := self class colors at: anId].
		
	^ color
