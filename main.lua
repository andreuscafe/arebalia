Entities = require 'entities'

-- Game logical shit
function love.load()
  love.window.setTitle("Relatos de Arebalia")
  WinW, WinH = love.graphics.getDimensions()

  CurrentCharacter = {
    character = 'Demon',
    action = 'moving',
    direction = 'down',
    speed = 100,
    x = 0,
    y = 0,
  }
  
  CCwidth, CCheight = Entities.Sprites.Characters[CurrentCharacter.character][CurrentCharacter.action][CurrentCharacter.direction]:getDimensions()

  CurrentCharacter.dimensions = {
    width = CCwidth,
    height = CCheight
  }
  CurrentCharacter.x = (WinW / 2) - (CurrentCharacter.dimensions.width / 4)
  CurrentCharacter.y = (WinH / 2) - (CurrentCharacter.dimensions.height / 4)

  print(CurrentCharacter.dimensions.width)
  print(CurrentCharacter.dimensions.height)

  function KeyPressed(key)
    return love.keyboard.isDown(key)
  end

  function MoveTo(dir, ammount)
    local finalSpeed = ammount * CurrentCharacter.speed
    if     dir == 'left'  then CurrentCharacter.x = CurrentCharacter.x - finalSpeed
    elseif dir == 'right' then CurrentCharacter.x = CurrentCharacter.x + finalSpeed
    elseif dir == 'up'    then CurrentCharacter.y = CurrentCharacter.y - finalSpeed
    elseif dir == 'down'  then CurrentCharacter.y = CurrentCharacter.y + finalSpeed
    end
  end

  function HandleMovement(dt)
    if (KeyPressed('left')) then
      MoveCharacter('Demon', 'moving', 'left', dt)
      MoveTo('left', dt)
      if (KeyPressed('up')) then MoveTo('up', dt)
      elseif (KeyPressed('down')) then MoveTo('down', dt) end

    elseif (KeyPressed('right')) then
      MoveCharacter('Demon', 'moving', 'right', dt)
      MoveTo('right', dt)
      if (KeyPressed('up')) then MoveTo('up', dt)
      elseif (KeyPressed('down')) then MoveTo('down', dt) end

    elseif (KeyPressed('up')) then
      MoveCharacter('Demon', 'moving', 'up', dt)
      MoveTo('up', dt)
      if (KeyPressed('left')) then MoveTo('left', dt)
      elseif (KeyPressed('right')) then MoveTo('right', dt) end

    elseif (KeyPressed('down')) then
      MoveCharacter('Demon', 'moving', 'down', dt)
      MoveTo('down', dt)
      if (KeyPressed('left')) then MoveTo('left', dt)
      elseif (KeyPressed('right')) then MoveTo('right', dt) end
    end

    if (KeyPressed("lshift") or KeyPressed("rshift")) then
      CurrentCharacter.speed = 200
    else
      CurrentCharacter.speed = 100
    end
  end

  function MoveCharacter(character, action, direction, dt)
    CurrentCharacter.character = character
    CurrentCharacter.action = action
    CurrentCharacter.direction = direction

    Entities.Animations.Characters[character][action][direction]:update(dt)
  end

  function PaintCharacter(CharacterData)
    local character, action, direction, posX, posY =
      CharacterData.character,
      CharacterData.action,
      CharacterData.direction,
      CharacterData.x,
      CharacterData.y

    -- print(character, action, direction)

    if (action == 'moving') then
      return Entities.Animations.Characters[character][action][direction]:draw(
        Entities.Sprites.Characters[character][action][direction], posX, posY
      )
    end
  end
end

-- Game real time shit
function love.update(dt)
  HandleMovement(dt)
end

-- Game rendering shit
function love.draw()
  -- The only shit rendering now is this mf red demon knight king
  PaintCharacter(CurrentCharacter)

  love.graphics.print(CurrentCharacter.x, 10, 10)
  love.graphics.print(CurrentCharacter.y, 10, 30)
end