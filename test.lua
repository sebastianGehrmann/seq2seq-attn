--
-- User: Sebastian
-- Date: 10/13/16
-- Time: 8:54 AM
--
require 'hdf5'

f = hdf5.open("test.hdf5", "w")
f:close()

local options = hdf5.DataSetOptions()
--Needs to be same dimension as data
options:setChunked(1)


f = hdf5.open("test.hdf5", "r+")
--needs a single write first
local data = torch.zeros(1)
f:write("data", data, options)

local appendData = torch.Tensor(1):fill(2)
--can append afterwards
f:append("data", appendData, options)
f:append("data", appendData, options)
f:close()