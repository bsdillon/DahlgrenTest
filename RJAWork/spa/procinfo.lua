local frame_num_field = Field.new("frame.number")
local frame_comment_field = Field.new("frame.comment")

local procinfo_proto = Proto("procinfo", "Process info")

local process_name = ProtoField.string("procinfo.procname","Process Name")
local pid		   = ProtoField.string("procinfo.pid","PID(s)")

procinfo_proto.fields = {
	process_name,
	pid
}

function procinfo_proto.dissector(tvb, pinfo, tree)

	local subtree = tree:add(procinfo_proto)
	
	subtree:add(process_name, "Name here " .. frame_num_field.value)
	subtree:add(pid, "PID here")
	
end

register_postdissector(procinfo_proto)