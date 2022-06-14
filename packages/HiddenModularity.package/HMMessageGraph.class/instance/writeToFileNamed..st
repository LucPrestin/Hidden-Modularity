fileIn/Out
writeToFileNamed: fileName

	FileStream
		forceNewFileNamed: fileName
		do: [:stream | self jsonWriteOn: stream]
