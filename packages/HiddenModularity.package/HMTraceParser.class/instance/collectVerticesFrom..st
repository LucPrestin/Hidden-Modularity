as yet unclassified
collectVerticesFrom: communicators

	| vertices |
	
	vertices := Dictionary new.
	
	communicators do: [:contextPair | 
		| senderId senderInformation receiverId receiverInformation |
		
		senderId := contextPair first identityHash.
		receiverId := contextPair second identityHash.
		
		(vertices includesKey: senderId) ifFalse: [
			senderInformation := self collectObjectInformationOf: contextPair first.
			vertices at: senderId put: senderInformation.
		].
	
		(vertices includesKey: receiverId) ifFalse: [
			receiverInformation := self collectObjectInformationOf: contextPair second.
			vertices at: receiverId put: receiverInformation.
		]
	].

	^ vertices

	
	


	