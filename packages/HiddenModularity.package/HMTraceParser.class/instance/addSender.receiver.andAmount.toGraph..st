as yet unclassified
addSender: sender receiver: receiver andAmount: amount toGraph: graph 
	
	graph at: sender ifAbsentPut: [Dictionary new].
	(graph at: sender) at: receiver ifAbsentPut: [0].
	(graph at: sender) at: receiver put: ((graph at: sender) at: receiver) + amount