force calculation
force: alpha

	self links withIndexDo: [:link :index |
		| force l b sourceVelocity targetVelocity |
		
		force := Point new.
		
		force x: link target x + link target vx - link source x - link source vx.
		force x ifNil: [force x: FSJiggler randomJiggle].
		
		force y: link target x + link target vx - link source x - link source vx.
		force y ifNil: [force y: FSJiggler randomJiggle].
		
		l := (force x squared + force y squared) sqrt.
		l := (l - self distances at: index) / l * alpha * self strengths at: index.
		force := force * l.
		
		b := self bias at: index.
		
		sourceVelocity := link source velocity.
		targetVelocity := link target velocity.
		
		link source velocity: (sourceVelocity x + (force x * (1 - b))) @ (sourceVelocity y + (force y * (1 - b))).
		link target velocity: (targetVelocity x - (force x * b)) @ (sourceVelocity y - (force y * b)).
	]