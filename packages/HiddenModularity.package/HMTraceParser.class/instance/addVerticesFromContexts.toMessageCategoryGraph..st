message category graph construction
addVerticesFromContexts: contexts toMessageCategoryGraph: graph 

	contexts
		do: [:contextPair | contextPair
				do: [:communicator | 
					| methodReference id |
							methodReference := communicator method methodReference.
							id := methodReference classSymbol asString , '>>' , methodReference category asString.
							graph
								addVertexWithId: id
								label: id
								andColor: (self colorFor: methodReference classSymbol asString)]]