as yet unclassified
methodPackageExtractionBlock

	^ [:aMethodContext | 
		self packageExtractionBlock value: aMethodContext receiver]
