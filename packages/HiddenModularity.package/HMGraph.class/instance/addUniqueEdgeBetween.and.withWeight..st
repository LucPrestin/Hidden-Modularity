graph construction
addUniqueEdgeBetween: senderId and: receiverId withWeight: weight

	(self edges includesKey: senderId) ifFalse: [self edges at: senderId put: Dictionary new].
	
	((self edges at: senderId) includesKey: receiverId) ifFalse: [
		(self edges at: senderId) at: receiverId put: 1]