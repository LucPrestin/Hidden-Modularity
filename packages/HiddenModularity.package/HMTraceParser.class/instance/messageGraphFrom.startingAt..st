as yet unclassified
messageGraphFrom: aTraceCursor startingAt: rootContext 

	| childrenGraphs graph |

	graph := Dictionary new.
	childrenGraphs := OrderedCollection new.

	(aTraceCursor childContextsFor: rootContext)
		do: [:context | 
			| childGraph |

			childGraph := self messageGraphFrom: aTraceCursor startingAt: context.
			childGraph
				keysAndValuesDo: [:cSender :cReceiverDict | cReceiverDict
						keysAndValuesDo: [:cReceiver :cAmount | self
								addSender: cSender
								receiver: cReceiver
								andAmount: cAmount
								toGraph: graph]]].

	self
		addSender: rootContext sender asString
		andReceiver: rootContext receiver asString
		toGraph: graph.

	^ graph