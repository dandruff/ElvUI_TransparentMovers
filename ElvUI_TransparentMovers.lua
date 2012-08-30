
-- Alpha is set 0 - 1; 0.7 = 70%
local ADDON_NAME, ETM = ...

if not ElvUI then return end
local E, L, V, P = select(1, unpack(ElvUI))
local old = E.CreateMover

-- Install
if not E.db.movers then
  E.db.movers = { alpha = 1 }
end

E.CreateMover = function(e, p, ...)
    old(e, p, ...)
    p.mover:SetAlpha(E.db.movers.alpha)
  end

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
