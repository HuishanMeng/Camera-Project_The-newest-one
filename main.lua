display.setStatusBar(display.HiddenStatusBar)
display.setDefault( "background", 1, 1, 1 )
local myEffect
local _w = display.contentWidth
local _h = display.contentHeight
local centerX=display.contentCenterX
local centerY=display.contentCenterY
  local bkgd =display.newImage( "wall.jpg",_w*0.5,_h*0.5)
local image
local introScreenInfo = display.newGroup()
local key=0

local function showIntroScreen( )

local Mytext2 = display.newText( "Tap anywhere to", centerX,centerY+10,"chalkduster",30  )
local Mytext3 = display.newText( "launch Camera ", centerX,centerY+80,"chalkduster",30  )
local key=1
	
	introScreenInfo:insert(bkgd)
	introScreenInfo:insert(Mytext2)
	introScreenInfo:insert(Mytext3)
end


--function of the button
function  pressButton()

 local widget = require( "widget" )
  local function handleButtonEvent( event )
      if ( "ended" == event.phase ) then
    
image.fill.effect = "filter.blur"

end

end
local function handleButtonEvent2( event )
      if ( "ended" == event.phase ) then
     myEffect=display.newImage("mustache.png")
 function myEffect:touch( event )
 
    if event.phase == "began" then
  
        self.markX = self.x    -- store x location of object
        self.markY = self.y    -- store y location of object
    
  
    elseif event.phase == "moved" then
  
        local x = (event.x - event.xStart) + self.markX
        local y = (event.y - event.yStart) + self.markY
        
        self.x, self.y = x, y    -- move object based on calculations above
    end
    
    return true
end

myEffect:addEventListener( "touch", myEffect )
end
end


      
local function handleButtonEvent3( event )
      if ( "ended" == event.phase ) then
    image.fill.effect = "filter.vignette"
end

end

local function handleButtonEvent4( event )
      if ( "ended" == event.phase ) then
     myHat=display.newImage("hat.png")
 function myHat:touch( event )
 
    if event.phase == "began" then
  
        self.markX = self.x    -- store x location of object
        self.markY = self.y    -- store y location of object
    
  
    elseif event.phase == "moved" then
  
        local x = (event.x - event.xStart) + self.markX
        local y = (event.y - event.yStart) + self.markY
        
        self.x, self.y = x, y    -- move object based on calculations above
    end
    
    return true
end

myHat:addEventListener( "touch", myHat )
end
end


-- -- -- Create the widget
local button1 = widget.newButton
{
       left = 120,
       top = 0,  
       id = "button1",
       label = "Blur",
       fontSize=20,
       font="Avenir Black",
       labelColor = { default={ 257/255, 204/255, 92/255 }, over={ 1, 1, 1, 0.5 } },
       onEvent = handleButtonEvent
}
local button2 = widget.newButton
{
      left = 30,
      top = 0,
      id = "button2",
      label = "Beard",
      fontSize=20,
      font="Avenir Black",
      labelColor = { default={ 0, 176/255, 59/255 }, over={ 1, 1, 1, 0.5 } },
      onEvent = handleButtonEvent2
 }

local button3 = widget.newButton
{
      left = 30,
      top = 420,
      id = "button3",
      label = "Vintage",
      fontSize=20,
      font="Avenir Black",
      labelColor = { default={ 1, 111/255, 105/255 }, over={ 1, 1, 1, 0.5 } },
      onEvent = handleButtonEvent3
 }

local button4 = widget.newButton
{
      left = 120,
      top = 420,
      id = "button4",
      label = "Hat",
      fontSize=20,
      font="Avenir Black",
      labelColor = { default={ 1, 11/255, 200/255 }, over={ 1, 1, 1, 0.5 } },
      onEvent = handleButtonEvent4
 }
end


function spriteOne()
  local sheetData1=
{
  width=80,
  height=118,
  numFrames=9,
  sheetContentWidth=714,
  sheetContendtHeight=118
}
local mySheet1=graphics.newImageSheet("MIKU.png",sheetData1)


local sheetData2=
{
  width=77,
  height=158,
  numFrames=22,
  sheetContentWidth=1689,
  sheetContendtHeight=158
}
local mySheet2=graphics.newImageSheet("sprite.png",sheetData2)
local sequenceData =
{
    {name="MIKU",sheet=mySheet1, start=1,count=9, time=2500},
    {name="gangnan",sheet=mySheet2, start=1,count=22, time=2500},
    
}


local animation = display.newSprite(mySheet1,sequenceData)
animation.x = 100
animation.y = 90
-- animation.x = animation.x+motionx
animation:play()
local animation2 = display.newSprite( mySheet2, sequenceData )
animation2.x = 290
animation2.y = 400
animation2:play()
end


local function onPhotoComplete( event )
   
       local photo = event.target
       if photo then

       photo.x=_w*0.5
       photo.y=_h*0.5+25
      photo.width=200
      photo.height=200
      image=photo

end
return image
end


local listener =function (event)
   
	if media.hasSource( media.Camera ) then
		media.show( media.Camera, onPhotoComplete )



        local bkgd =display.newImage( "border04.png",_w*0.5,_h*0.5)
        pressButton()
        spriteOne()
      Wanted=display.newImage("wanted.png",centerX,centerY)

else
		native.showAlert("Corona", "Camera not found.")
	end
	return true
end
bkgd:addEventListener( "tap", listener )


local function doIt( event )
	if event.phase == "began" then
		introScreenInfo:removeEventListener("touch", doIt)


		transition.to( introScreenInfo, { time = 1501, alpha = 0, onComplete = mainLoop })
	end
end
showIntroScreen( )
introScreenInfo:addEventListener("touch", doIt)




