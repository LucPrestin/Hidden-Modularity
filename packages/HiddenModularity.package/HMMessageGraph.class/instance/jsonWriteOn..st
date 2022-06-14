fileIn/Out
jsonWriteOn: aStream

	aStream nextPutAll: '{ "vertices": '.
	self vertices jsonWriteOn: aStream.
	aStream nextPutAll: '}, "edges": '.
	self edgesAsCollection jsonWriteOn: aStream.
	aStream nextPutAll: '}'
