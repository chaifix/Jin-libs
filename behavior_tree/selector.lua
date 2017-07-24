Selector = class("Selector",Behavior)

--[[
	behaviors = {
		b1, 
		b2,
		...,
	}
]]
function Selector:initialize(name, behaviors)
	 Behavior.initialize(self)
	 self.name        = name 
	 self.behaviors   = behaviors
	 self.curBehavior = 1 
end 	

function Selector:update(dt, context)
	return Behavior.update(self, dt, context)
end 

function Selector:run(dt, context)
	while true do 
		local status = self.behaviors[self.curBehavior]:update(dt, context)
		if status ~= Behavior.status.failure then 
			return status
		end 
		self.curBehavior = self.curBehavior + 1
		if self.curBehavior == #self.behaviors + 1 then 
			return Behavior.status.failure
		end 
	end 
end 

function Selector:start(context)

end 

function Selector:finish(status, context)

end 