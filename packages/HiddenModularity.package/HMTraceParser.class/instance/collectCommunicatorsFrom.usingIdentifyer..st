as yet unclassified
collectCommunicatorsFrom: contexts usingIdentifyer: aBlock 

	^ contexts
		collect: [:senderAndReceiver | {aBlock value: senderAndReceiver first receiver. aBlock value: senderAndReceiver second receiver}]