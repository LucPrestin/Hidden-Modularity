graph construction
buildGraphFromCommunicators: communicators withScenarioName: aString
	
	| graph |

	"account for different graph types"
	self flag: #todo.

	graph := HMGraph new.
	graph graphType: self graphType.
	graph scenarioName: aString.
	
	self addVerticesFromCommunicators: communicators toGraph: graph.
	self addEdgesFromCommunicators: communicators toGraph: graph.
	
	^ graph
