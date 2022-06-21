exporting
writeTraceNamed: aSymbol asCommunicatorGraphToFileName: aString

	| cursor graph |

	cursor := self perform: aSymbol.	
	graph := HMTraceParser communicatorGraphFromCursor: cursor.
	graph writeToFileNamed: aString

