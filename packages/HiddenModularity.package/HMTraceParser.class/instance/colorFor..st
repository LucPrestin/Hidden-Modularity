communicator graph
colorFor: anId

	| color |

	(self colors includesKey: anId) 
		ifFalse: [
			color := HMUtils uniqueColorWithCurrentColors: self colors values.
			self colors at: anId put: color]
		ifTrue: [color := self colors at: anId].
		
	^ color
