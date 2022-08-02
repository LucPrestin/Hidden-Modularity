as yet unclassified
writeToFileNamed: fileName

	FileStream
		forceNewFileNamed: fileName
		do: [:stream | self jsonWriteOn: stream]
