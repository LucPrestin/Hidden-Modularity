as yet unclassified
constructGraphFromCommunicators: communicators


	| graph |
	
	graph := Dictionary new.
	
	communicators do: [:communicator |
		| senderKey receiverKey |
		
		senderKey := communicator first.
		receiverKey := communicator second.
		
		graph at: communicators first ifAbsentPut: Dictionary new.
		(graph at: senderKey) at: receiverKey ifAbsentPut: 0.
		(graph at: senderKey) at: receiverKey put: ((graph at: senderKey) at: receiverKey) + 1.	
	].

	^ graph