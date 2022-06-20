message graph construction
addVerticesFromCommunicators: communicators toMessageGraph: graph

	communicators
		do: [:contextPair | contextPair
				do: [:communicator | graph
						addVertexWithId: (self idExtractionBlock value: communicator)
						label: (self labelExtractionBlock value: communicator)
						andColor: (self colorFor: (self colorLabelExtractionBlock value: communicator))]]
