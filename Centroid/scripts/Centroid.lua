
--Start of Global Scope---------------------------------------------------------

print('AppEngine Version: ' .. Engine.getVersion())

local DELAY = 500 -- ms between visualization steps for demonstration purpose

-- Creating viewer
local viewer = View.create()

-- Setting up graphical overlay attributes
local deco = View.ShapeDecoration.create()
deco:setPointType('DOT')
deco:setPointSize(10)
deco:setLineColor(0, 255, 0) -- Green

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function main()
  viewer:clear()
  local img = Image.load('resources/Centroid.bmp')
  viewer:addImage(img)
  viewer:present()
  Script.sleep(DELAY) -- for demonstration purpose only

  -- Finding blobs
  local objectRegion = img:threshold(0, 150)
  local blobs = objectRegion:findConnected(500)

  -- Analyzing each blob and visualizing the result
  local centers = blobs:getCenterOfGravity(img)
  viewer:addShape(centers, deco)
  viewer:present()

  print(#blobs .. ' blobs found')
  print('App finished.')
end

--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

--End of Function and Event Scope--------------------------------------------------
