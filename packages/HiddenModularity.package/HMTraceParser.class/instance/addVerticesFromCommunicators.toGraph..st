as yet unclassified
addVerticesFromCommunicators: communicators toGraph: graph 

	communicators
		do: [:contextPair | contextPair
				do: [:communicator | 
					| id |
					id := self idExtractionBlock value: communicator.
					(self blacklist includes: id)
						ifFalse: [graph
								addVertexWithId: (self idExtractionBlock value: communicator)
								label: (self labelExtractionBlock value: communicator)
								andColor: (self
										colorFor: (self colorLabelExtractionBlock value: communicator))]]]
