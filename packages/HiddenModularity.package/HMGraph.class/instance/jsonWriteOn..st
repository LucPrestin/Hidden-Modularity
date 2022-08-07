fileIn/Out
jsonWriteOn: aStream

	aStream nextPutAll: '{ "type": '.
	self graphType jsonWriteOn: aStream.
	aStream nextPutAll: ', "scenarioName": '.
	self scenarioName jsonWriteOn: aStream.
	aStream nextPutAll: ', "vertices": '.
	self verticesForJsonExport jsonWriteOn: aStream.
	aStream nextPutAll: ', "edges": '.
	self edgesForJsonExport jsonWriteOn: aStream.
	aStream nextPutAll: '}'
