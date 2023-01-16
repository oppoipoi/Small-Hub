 local list = {}

local scripts = {
  ["Pet Family 2"],
  ["Pet Race Clicker!"]
}
list.add = function()
  for i,v in pairs(list) do
    local Tab = Window:CreateTab(i, 4483362458) 
  end 
end
return list
