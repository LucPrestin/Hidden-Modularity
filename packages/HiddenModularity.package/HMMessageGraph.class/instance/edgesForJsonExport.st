accessing
edgesForJsonExport

	| result |
	
	result := OrderedCollection new.
	
	self edges keysAndValuesDo: [:senderId :receiverDict |
		receiverDict keysAndValuesDo: [:receiverId :weight |
			| edge |
			
			edge := Dictionary new.
			edge at: 'sender' put: senderId.
			edge at: 'receiver' put: receiverId.
			edge at: 'weight' put: weight.
			
			result add: edge]].
	
	^ result
