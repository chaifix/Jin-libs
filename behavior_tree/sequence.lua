Sequence = class("Sequence",Behavior)

--[[
	behaviors = {
		b1, 
		b2,
		...,
	}
]]
function Sequence:initialize(name, behaviors)
	 Behavior.initialize(self)
	 self.name        = name 
	 self.behaviors   = behaviors
	 -- start from first behavior
	 self.curBehavior = 1 
end 	

function Sequence:update(dt, context)
	return Behavior.update(self, dt, context)
end 

function Sequence:run(dt, context)
	-- 遍历所有子行为
	while true do
		local status = self.behaviors[self.curBehavior]:update(dt, context)
		if status ~= Behavior.status.success then 
			return status
		end
		self.curBehavior = self.curBehavior + 1
		if self.curBehavior == #self.behaviors + 1 then 
			return Behavior.status.success
		end
	end
end

function Sequence:start()
	self.curBehavior = 1
end