information retrieving
associatedVerticesByEdgeWeightForNode: nodeId

	| incoming outgoing associationSortingBlock result |
	
	incoming := OrderedCollection new.
	outgoing := OrderedCollection new.
	
	associationSortingBlock :=  [:association1 :association2 | association1 value >= association2 value].
	
	(self edges includesKey: nodeId) ifTrue: [
		| tmp |
		
		tmp := Dictionary new.
		
		self edges keysAndValuesDo: [:senderId :receiverDict |
			receiverDict keysAndValuesDo: [:receiverId :weight |
				receiverId = nodeId ifTrue: [
					senderId = nodeId ifFalse: [
						(tmp includesKey: senderId) 
							ifTrue: [tmp at: senderId put: ((tmp at: senderId) + weight)]
							ifFalse: [tmp at: senderId put: weight]
					]
				]
			]
		].
		
		incoming := tmp associations sorted: associationSortingBlock.
		outgoing := (self edges at: nodeId) associations sorted: associationSortingBlock.
	].

	result := Dictionary new.
	result at: 'incoming' put: incoming.
	result at: 'outgoing' put: outgoing.
	
	^ result