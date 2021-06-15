local frame_num_field = Field.new("frame.number")
local frame_comment_field = Field.new("frame.comment")

local procinfo_proto = Proto("procinfo", "Process info")

local process_name = ProtoField.string("procinfo.procname","Process Name(s)")
local pid		   = ProtoField.string("procinfo.pid","PID(s)")

procinfo_proto.fields = {
	process_name,
	pid
}

function procinfo_proto.dissector(tvb, pinfo, tree)

	local subtree = tree:add(procinfo_proto)
	
	local pidstring = string.match(frame_comment_field().value, "spapids=%((.*)%)")
	local procstring = string.match(frame_comment_field().value, "spaprocnames=%(([^%)]*)%)")
	
	if pidstring == nil then
		pidstring = "No info"
	end
	if procstring == nil then
		procstring = "No info"
	end
	
	subtree:add(process_name, procstring)
	subtree:add(pid, pidstring)
	
end

register_postdissector(procinfo_proto)