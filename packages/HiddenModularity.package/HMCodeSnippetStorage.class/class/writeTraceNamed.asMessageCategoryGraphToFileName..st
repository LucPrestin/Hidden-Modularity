exporting
writeTraceNamed: aSymbol asMessageCategoryGraphToFileName: aString

	| cursor graph |

	cursor := self perform: aSymbol.	
	graph := HMTraceParser messageCategoryGraphFromCursor: cursor.
	graph writeToFileNamed: aString

