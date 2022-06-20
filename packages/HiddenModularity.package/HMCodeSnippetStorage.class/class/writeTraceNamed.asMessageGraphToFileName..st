exporting
writeTraceNamed: aSymbol asMessageGraphToFileName: aString

	| cursor graph |

	cursor := self perform: aSymbol.	
	graph := HMTraceParser messageGraphFromCursor: cursor.
	graph writeToFileNamed: aString

