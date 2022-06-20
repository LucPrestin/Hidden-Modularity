graph-construction
addVertexWithId: id label: label andColor: color

	| vertex |
	
	vertex := Dictionary new.
	
	vertex at: 'id' put: id.
	vertex at: 'label' put: label.
	vertex at: 'color' put: color.
	
	self vertices at: id put: vertex