Root = class("Root", Behavior)

-- object is the context in whole tree
function Root:initialize(context, behavior)
	Behavior.initialize(self)
	-- root 绑定的节点（树的第一个节点—)
	self.behavior = behavior
	self.object   = object
	-- Nodes down the tree will then be able to 
	-- access the object by saying context.object.
	self.context  = context
end 

function Root:update(dt)
	return Behavior.update(self,dt)
end 

function Root:run(dt)
	-- Passing context down to leaves
	return self.behavior:update(dt, self.context)
end

function Root:start()
	
end 

function Root:finish(status)

end