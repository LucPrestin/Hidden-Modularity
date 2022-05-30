information retrieving
collectObjectInformationOf: anObject

	| information |

	information := Dictionary new.
	information at: 'identityHash' put: anObject identityHash asString.
	information at: 'name' put: anObject name.
	information at: 'class' put: anObject className.
	information at: 'category' put: anObject class category asString.
	information
		at: 'package'
		put: (PackageOrganizer default packageOfSystemCategory: anObject class category) packageName.

	anObject isCompiledMethod
		ifTrue: [information at: 'methodReference' put: anObject methodReference asString.
			information at: 'methodCategory' put: anObject methodReference category asString]
		ifFalse: [information at: 'methodReference' put: 'nil'.
			information at: 'methodCategory' put: 'nil'].

	^ information