as yet unclassified
messageGraphFrom: aTDBCursor usingIdentifyer: aBlock
	
	| contexts communicators |

	contexts := self collectContextsFrom: aTDBCursor.
	communicators := self collectCommunicatorsFrom: contexts usingIdentifyer: aBlock.
	
	^ self constructGraphFromCommunicators: communicators


	