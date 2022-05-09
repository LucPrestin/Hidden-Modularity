as yet unclassified
messageGraphFrom: aTDBCursor usingIdentifyer: aSymbol
	
	| contexts |

	contexts := self collectContextsFrom: aTDBCursor.
	
	^ self constructGraphFromContexts: contexts usingIdentifyer: aSymbol


	