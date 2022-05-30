fileIn/Out
writeMessageGraphFromCursor: aTDBCursor toFileNamed: fileName 

	FileStream
		forceNewFileNamed: fileName
		do: [:stream | (self messageGraphFromCursor: aTDBCursor)
				jsonWriteOn: stream]