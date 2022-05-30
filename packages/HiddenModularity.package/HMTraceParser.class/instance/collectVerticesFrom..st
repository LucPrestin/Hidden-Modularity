message graph construction
collectVerticesFrom: communicators

	| vertices |
	
	vertices := Dictionary new.
	
	communicators do: [:contextPair | 
		| senderId senderInformation receiverId receiverInformation |
		
		senderId := contextPair first identityHash asString.
		receiverId := contextPair second identityHash asString.
		
		(vertices includesKey: senderId) ifFalse: [
			senderInformation := self collectObjectInformationOf: contextPair first.
			vertices at: senderId put: senderInformation].
	
		(vertices includesKey: receiverId) ifFalse: [
			receiverInformation := self collectObjectInformationOf: contextPair second.
			vertices at: receiverId put: receiverInformation]].

	^ vertices
