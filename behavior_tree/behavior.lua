-- abstract
Behavior = class("Behavior")

Behavior.static.status = {
	invalid = 1,
	running = 2,
	success = 3,
	failure = 4,
}

function Behavior:initialize()
	self.status = Behavior.status.invalid 
end 
-- all nodes change their status in this function, more 
function Behavior:update(dt, context)
	if self.status ~= Behavior.status.running then
		self:start(context)
	end 
	-- all nodes can only change their status by calling run(dt, context)
	-- status modifyed here 
	self.status = self:run(dt, context)
	if self.status ~= Behavior.status.running then 
		self:finish(self.status, context)
	end 
	return self.status
end
--[[
	override functions:
		start(context)
		run(dt, context)
		finish(status, context)
]]
function Behavior:start(context)

end 

function Behavior:run(dt, context)

end 

function Behavior:finish(status, context)

end 
