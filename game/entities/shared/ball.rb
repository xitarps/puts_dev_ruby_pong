module Shared
  class Ball < Square
    attr_accessor :x_speed, :y_speed

    def initialize(...)
      super(...)
      self.color = 'white'
      self.size = 15
      @x_speed = 0
      @y_speed = 0
      @raw_speed = [-2, -1.9, -1.5, -1.3, 1.3, 1.5, 1.9, 2]
      fetch_canvas_attributes
      @inital_position = [(@canvas_width / 2) - (self.size / 2),
                          (@canvas_heigth /2) - (self.size / 2)]
      move_to_initial_position
    end

    def update_position
      self.x += @x_speed
      self.y += @y_speed
    end

    def bounce!(axis)
      @x_speed *= -1 if axis.include? :x
      @y_speed *= -1 if axis.include? :y
    end

    def move_to_initial_position
      @x_speed = @raw_speed.sample
      @y_speed = @raw_speed.sample

      self.x, self.y = @inital_position
    end

    def fetch_canvas_attributes
      @canvas_width = App.class_variable_get(:@@canvas).width
      @canvas_heigth = App.class_variable_get(:@@canvas).height
      @margin = App.class_variable_get(:@@canvas).margin
    end

    def top
      self.y
    end

    def bottom
      self.y + self.size
    end

    def left
      self.x
    end

    def right
      self.x + self.size
    end
  end
end
