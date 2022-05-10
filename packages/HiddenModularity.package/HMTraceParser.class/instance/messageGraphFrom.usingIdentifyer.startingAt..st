as yet unclassified
messageGraphFrom: aTDBCursor usingIdentifyer: aSymbol startingAt: rootContext 

	| childrenGraphs graph |

	graph := Dictionary new.
	childrenGraphs := OrderedCollection new.

	(aTDBCursor childContextsFor: rootContext)
		do: [:context | 
			| childGraph |
			childGraph := self
						messageGraphFrom: aTDBCursor
						usingIdentifyer: aSymbol
						startingAt: context.
			childGraph
				keysAndValuesDo: [:cSender :cReceiverDict | cReceiverDict
						keysAndValuesDo: [:cReceiver :cAmount | self
								addSender: cSender
								receiver: cReceiver
								andAmount: cAmount
								toGraph: graph]]].
	self
		addSender: (rootContext sender receiver perform: aSymbol)
		andReceiver: (rootContext receiver perform: aSymbol)
		toGraph: graph.

	^ graph