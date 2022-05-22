as yet unclassified
messageGraphFromContexts: contexts
	
	| edges vertices graph |

	vertices := self collectVerticesFrom: contexts.
	edges := self collectEdgesFrom: contexts.

	graph := Dictionary new.
	graph at: 'vertices' put: vertices.
	graph at: 'edges' put: edges.
	
	^ graph


	