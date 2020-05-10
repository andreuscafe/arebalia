anim8 = require "libs/anim8"

local Entities = {}

-- Sprites
local Sprites = {
  Characters = {
    Demon = {
      moving = {
        up = love.graphics.newImage("sprites/demon/sprite_up.png"),
        down = love.graphics.newImage("sprites/demon/sprite_down.png"),
        left = love.graphics.newImage("sprites/demon/sprite_left.png"),
        right = love.graphics.newImage("sprites/demon/sprite_right.png")
      }
    }
  }
}

-- Grids
local Grids = {
  Characters = {
    Demon = {
      moving = {
        up = anim8.newGrid(80, 80, Sprites.Characters.Demon.moving.up:getWidth(), Sprites.Characters.Demon.moving.up:getHeight()),
        down = anim8.newGrid(80, 80, Sprites.Characters.Demon.moving.down:getWidth(), Sprites.Characters.Demon.moving.down:getHeight()),
        left = anim8.newGrid(80, 80, Sprites.Characters.Demon.moving.left:getWidth(), Sprites.Characters.Demon.moving.left:getHeight()),
        right = anim8.newGrid(80, 80, Sprites.Characters.Demon.moving.right:getWidth(), Sprites.Characters.Demon.moving.right:getHeight()),
      }
    }
  }
}

-- Animations
local Animations = {
  Characters = {
    Demon = {
      moving = {
        up = anim8.newAnimation(Grids.Characters.Demon.moving.up('1-2',1, '1-2',2), 0.1),
        down = anim8.newAnimation(Grids.Characters.Demon.moving.down('1-2',1, '1-2',2), 0.1),
        left = anim8.newAnimation(Grids.Characters.Demon.moving.left('1-2',1, '1-2',2), 0.1),
        right = anim8.newAnimation(Grids.Characters.Demon.moving.right('1-2',1, '1-2',2), 0.1),
      }
    }
  }
}

-- Final

Entities.Sprites = Sprites
Entities.Grids = Grids
Entities.Animations = Animations

return Entities