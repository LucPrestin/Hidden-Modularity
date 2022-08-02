as yet unclassified
packageExtractionBlock

	^ [:anObject | (PackageOrganizer default packageOfSystemCategory: anObject class category) packageName]
