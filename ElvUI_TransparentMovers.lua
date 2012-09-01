-- =======================================================================================
-- Add-On Name: ElvUI Transparent Movers
--     License: MIT
--      Author: Dandruff @ Whisperwind
-- Description: Allows the user to give all movers a transparency.
-- =======================================================================================

local ADDON_NAME, ETM = ...

if not ElvUI then return end
local E, L, V, P = unpack(ElvUI)

-- Install
P["movers"] = {
  ["alpha"] = 0.5 
}

hooksecurefunc(E, 'CreateMover', function(self,p)
  p.mover:SetAlpha(E.db.movers.alpha)
end)

E.Options.args.general.args["movers"] = {
  order = 10,
  type = "group",
  name = "Movers",
  guiInline = true,
  args = {
    moverAlpha = {
      order = 3,
      name = "Movers' Transparency",
      desc = "Changes the transparency of all the movers.",
      type = 'range',
      isPercent = true,
      min = 0, max = 1, step = 0.01,
      set = function(info, value)
          E.db.movers.alpha = value
          for _,f in pairs(E.CreatedMovers) do
            if f.Created then
              f.mover:SetAlpha(E.db.movers.alpha)
            end
          end
        end,
      get = function(info)
          return E.db.movers.alpha
        end,
    },
  },
}


--[==[
The MIT License (MIT)
Copyright (c) 2012 Reuben DeLeon

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]==]