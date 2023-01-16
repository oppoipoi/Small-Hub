 local list = {}

local scripts = {
  ["Pet Family 2"],
  ["Pet Race Clicker!"]
}
function list:add()
  for i,v in pairs(list) do
    local Tab = Window:CreateTab(i, 4483362458) 
  end 
end
return list
