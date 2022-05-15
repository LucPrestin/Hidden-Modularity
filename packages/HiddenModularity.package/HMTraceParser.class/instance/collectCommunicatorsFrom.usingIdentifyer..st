as yet unclassified
collectCommunicatorsFrom: contexts usingIdentifyer: aBlock 

	^ contexts
		collect: [:context | {aBlock value: context sender receiver. aBlock value: context receiver}]