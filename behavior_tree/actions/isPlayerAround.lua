--[[
	context = {
		object, -- object binded with isPlayerAround
		player, -- player
	}
]]
isPlayerAround = class("isPlayerAround", Action)

function isPlayerAround:initialize(radius)
	Action.initialize(self, "isPlayerAround")
	self.radius = radius
end

function isPlayerAround:update(dt, context)
	return Action.update(self, dt, context)
end 

function isPlayerAround:run(dt, context)
	local ppos   = context.player.pos
	local obj    = context.object

	local v = ppos - obj.pos 
	local distance = v:len()
	if distance < self.radius then 
		return Behavior.status.success
	elseif distance >= self.radius then 
		return Behavior.status.failure
	end
end

function isPlayerAround:start(context)

end

function isPlayerAround:finish(status, context)
	
end 
