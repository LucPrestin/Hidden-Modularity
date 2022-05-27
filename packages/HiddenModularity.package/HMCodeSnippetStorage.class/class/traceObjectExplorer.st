as yet unclassified
traceObjectExplorer

	| tmp |
	
	tmp := Dictionary new.
	
	tmp at: '1' put: 1.
	tmp at: '2' put: Dictionary new.	
	(tmp at: '2') at: '1' put: 1.
	(tmp at: '2') at: '2' put: 'Hello'.
	(tmp at: '2') at: '3' put: Morph new.
	
	^ TDBCursor traceForBlock: [tmp explore]