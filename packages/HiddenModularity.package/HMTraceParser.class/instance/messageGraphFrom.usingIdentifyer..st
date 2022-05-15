as yet unclassified
messageGraphFrom: aTDBCursor usingIdentifyer: aBlock
	
	| contexts |

	contexts := self collectContextsFrom: aTDBCursor.
	
	^ self constructGraphFromContexts: contexts usingIdentifyer: aBlock


	