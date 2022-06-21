exporting
writeTraceNamed: aSymbol asMessageCategoryGraphToFileName: aString

	| cursor graph |

	cursor := self perform: aSymbol.	
	graph := HMTraceParser methodCategoryGraphFromCursor: cursor.
	graph writeToFileNamed: aString

