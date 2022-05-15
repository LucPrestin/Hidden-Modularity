as yet unclassified
constructGraphFromContexts: contexts usingIdentifyer: aBlock
	
	| graph |
	
	graph := Dictionary new.
	
	 contexts do: [:context |
		| senderKey receiverKey |
		
		senderKey := aBlock value: context sender receiver.
		receiverKey := aBlock value: context receiver.
		
		graph at: senderKey ifAbsentPut: Dictionary new.
		(graph at: senderKey) at: receiverKey ifAbsentPut: 0.
		(graph at: senderKey) at: receiverKey put: ((graph at: senderKey) at: receiverKey) + 1.
	].

	^ graph

	