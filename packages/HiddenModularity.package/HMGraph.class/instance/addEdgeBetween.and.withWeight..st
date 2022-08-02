as yet unclassified
addEdgeBetween: senderId and: receiverId withWeight: weight

	| currentWeight |

	(self edges includesKey: senderId) ifFalse: [self edges at: senderId put: Dictionary new].
	
	((self edges at: senderId) includesKey: receiverId) ifFalse: [
		(self edges at: senderId) at: receiverId put: 0].
	
	currentWeight := (self edges at: senderId) at: receiverId.
	
	(self edges at: senderId) at: receiverId put: currentWeight + weight