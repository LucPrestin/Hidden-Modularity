as yet unclassified
collectEdgesFrom: communicators

	| edgeGraph edgeArray |
	
	edgeGraph := Dictionary new.
	edgeArray := OrderedCollection new.
	
	communicators do: [ :contextPair |
		| senderId receiverId |
		
		senderId := contextPair first identityHash asString.
		receiverId := contextPair second identityHash asString.
		
		edgeGraph at: senderId ifAbsentPut: Dictionary new.
		(edgeGraph at: senderId) at: receiverId ifAbsentPut: 0.
		(edgeGraph at: senderId) at: receiverId put: ((edgeGraph at: senderId) at: receiverId) + 1.
	].

	edgeGraph keysAndValuesDo: [:senderId :receiverDict |
		receiverDict keysAndValuesDo: [:receiverId :edgeWeight |
			| edge |
			
			edge := Dictionary new.
			edge at: 'source' put: senderId.
			edge at: 'target' put: receiverId.
			edge at: 'weight' put: edgeWeight.
			
			edgeArray add: edge.
		 ]
	].

	^ edgeArray


	