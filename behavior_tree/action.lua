-- abstract
Action = class("Action",Behavior)

function Action:initialize(name)
	Behavior.initialize(self)
	self.name = name or 'action'
end 

function Action:update(dt, context)
	return Behavior.update(self, dt, context)
end 
--[[

newAction = Action:extend()

function newAction:new()
    newAction.super.new(self, 'newAction')
end

function newAction:update(dt, context)
    return newAction.super.update(self, dt, context)
end

function newAction:run(dt, context)
    -- newAction's behavior goes here
    -- should return 'success', 'running' or 'failure'
end

function newAction:start(context)
    -- any setup goes here
end

function newAction:finish(status, context)
    -- any cleanup goes here
end

]]