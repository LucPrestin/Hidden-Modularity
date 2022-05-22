as yet unclassified
messageGraphFromContexts: contexts
	
	| graph communicators |
	
	communicators := self collectCommunicatorsFrom: contexts.

	graph := Dictionary new.
	graph at: 'vertices' put: (self collectVerticesFrom: communicators).
	graph at: 'edges' put: (self collectEdgesFrom: communicators).
	
	^ graph
