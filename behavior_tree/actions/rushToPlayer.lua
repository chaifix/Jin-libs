--[[
	context = {
		object, -- object binded with rushToPlayer
		player, -- player
	}
]]
rushToPlayer = class("rushToPlayer", Action)

function rushToPlayer:initialize(speed)
	Action.initialize(self, "rushToPlayer")
	self.timer = Timer()
	self.speed = speed
end

function rushToPlayer:update(dt, context)
	self.timer:update(dt)
	return Action.update(self, dt, context)
end 

function rushToPlayer:run(dt, context)
	local ppos  = context.player.pos
	local tar = vec3(ppos.x, 0, ppos.z) -- a vec3
	local obj = context.object
	if tar ~= nil then
		local distance = obj.pos:dist(tar)
		if distance < 1 then 
			return Behavior.status.success
		elseif distance >= 1 then 
			return Behavior.status.running
		end 
	else 
		return Behavior.status.failure
	end
end

function rushToPlayer:start(context)
	local ppos  = context.player.pos
	local tar = vec3(ppos.x, 0, ppos.z) -- a vec3
	local obj = context.object
	local dv  = tar - obj.pos
	local dir = dv:normalize()
	obj:moveTo(tar, dir*self.speed)
end

function rushToPlayer:finish(status, context)
	local obj = context.object
	obj:stopMoving()

end 
