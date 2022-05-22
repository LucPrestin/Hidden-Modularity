as yet unclassified
collectVerticesFrom: contexts

	| vertices |
	
	vertices := Dictionary new.
	
	contexts do: [:contextPair | 
		| senderInformation receiverInformation |
		
		senderInformation := self collectObjectInformationOf: contextPair first.
		receiverInformation := self collectObjectInformationOf: contextPair second.
		
		vertices at: (senderInformation at: 'identityHash') put: senderInformation.
		vertices at: (receiverInformation at: 'identityHast') put: receiverInformation.
	].

	^ vertices

	
	


	