-- Get fields to 'dissect'
local frame_num_field = Field.new("frame.number")
local frame_comment_field = Field.new("frame.comment")

-- Create a 'protocol' to be able to register 
local procinfo_proto = Proto("procinfo", "Process info")

-- Create fields for the protocol 
local process_name = ProtoField.string("procinfo.procname","Process Name(s)")
local pid		   = ProtoField.string("procinfo.pid","PID(s)")

-- Set protocol fields
procinfo_proto.fields = {
	process_name,
	pid
}

-- Dissector function
function procinfo_proto.dissector(tvb, pinfo, tree)

	local subtree = tree:add(procinfo_proto)
	
	local pidstring = nil
	local procstring = nil
	
	if frame_comment_field() ~= nil then 
		pidstring = string.match(frame_comment_field().value, "spapids=%((.*)%)")
		procstring = string.match(frame_comment_field().value, "spaprocnames=%(([^%)]*)%)")
	end 
		
	if pidstring == nil then
		pidstring = "No info"
	end
	if procstring == nil then
		procstring = "No info"
	end
	
	subtree:add(process_name, procstring)
	subtree:add(pid, pidstring)
	
end

-- Register protocol as postdissector (so it's run after other dissectors)
register_postdissector(procinfo_proto)