as yet unclassified
constructGraphFromContexts: contexts usingIdentifyer: aSymbol
	
	| graph |
	
	graph := Dictionary new.
	
	 contexts do: [:context |
		| senderKey receiverKey |
		
		senderKey := context sender perform: aSymbol.
		receiverKey := context receiver perform: aSymbol.
		
		graph at: senderKey ifAbsentPut: Dictionary new.
		(graph at: senderKey) at: receiverKey ifAbsentPut: 0.
		(graph at: senderKey) at: receiverKey put: ((graph at: senderKey) at: receiverKey) + 1.
	].

	^ graph

	