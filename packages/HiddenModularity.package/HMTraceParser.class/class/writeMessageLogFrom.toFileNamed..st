as yet unclassified
writeMessageLogFrom: aTDBCursor toFileNamed: aString

	FileStream
		forceNewFileNamed: aString
		do: [:stream | 
			stream nextPutAll: '['.
			(self collectContextsFrom: aTDBCursor)
				withIndexDo: [:context :index | 
					{context sender receiver name. context receiver name} jsonWriteOn: stream.
					stream nextPutAll: ','].
			stream truncate: (stream size - 1).
			stream nextPutAll: ']'].
	
	Transcript show: 'log extraction done'