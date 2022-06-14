message graph construction
addVerticesToGraph: graph fromCommunicators: communicators

	communicators
		do: [:contextPair | contextPair
				do: [:communicator | graph
						addVertexWithId: (self idExtractionBlock value: communicator)
						label: (self labelExtractionBlock value: communicator)
						andColor: (self colorFor: (self colorLabelExtractionBlock value: communicator))]]
