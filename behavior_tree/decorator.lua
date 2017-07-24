-- abstract 
Decorator = class("Decorator",Behavior)

function Decorator:initialize(name, behavior)
	Behavior.initialize(self)
	self.name     = name 
	self.behavior = behavior 
end 

function Decorator:update(dt, context)
	return Behavior.update(self, dt, context)
end 

--[[
override functions: 
	run(dt, context)
	start(context)
	finish(status, context)
]]

--[[ example 
Inverter = class("Inverter", Decorator)

function Inverter:initialize(behavior)
    Inverter.super.new(self, 'Inverter', behavior)
end

function Inverter:update(dt, context)
    return Inverter.super.update(self, dt, context)
end

function Inverter:run(dt, context)
    local status = self.behavior:update(dt, context)
    if status == 'running' then return 'running'
    elseif status == 'success' then return 'failure'
    elseif status == 'failure' then return 'success' end
end

function Inverter:start(context)

end

function Inverter:finish(status, context)

end

]]