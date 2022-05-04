*HiddenModularity
messageGraph

	| childrenGraphs graph |

	graph := Dictionary new.
	childrenGraphs := OrderedCollection new.

	self children
		valuesDo: [:childTrace | 
			| childGraph |
			
			childGraph := childTrace messageGraph.
			childGraph
				keysAndValuesDo: [:cSender :cReceiverDict | cReceiverDict
						keysAndValuesDo: [:cReceiver :cAmount | self
								addSender: cSender
								receiver: cReceiver
								andAmount: cAmount
								toGraph: graph]]].
	
	self
		addSender: ((self contextAtTime: (self maxTimeIndex)) sender asString)
		andReceiver: ((self contextAtTime: (self maxTimeIndex)) receiver asString)
		toGraph: graph.

	^ graph