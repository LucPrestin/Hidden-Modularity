as yet unclassified
writeMessageGraphFromCursor: aTDBCursor toFileNamed: fileName 

	FileStream
		forceNewFileNamed: fileName
		do: [:stream | (self default messageGraphFromCursor: aTDBCursor)
				jsonWriteOn: stream]