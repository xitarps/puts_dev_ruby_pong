module Rival
  class Stick < Shared::BaseStick
    def initialize(...)
      super(...)

      @inital_position = [ (@canvas_width - @margin - @width),
                           (@canvas_heigth /2) - (@height /2) ]

      move_to_initial_position
      self.color = 'green'
    end

    def update_movement(event, speed = nil)
      if y >= 0 && event.key == 'i'
        @y_speed = -(speed || @raw_speed)
      elsif event.key == 'k' && y <= @canvas_heigth
        @y_speed = (speed || @raw_speed)
      end
    end
  end
end
