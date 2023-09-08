module Shared
  class BaseStick < Rectangle
    attr_accessor :y_speed

    def initialize(...)
      super(...)
      @inital_position = [0, 0]
      @width = 10
      @height = 100

      fetch_canvas_attributes

      @y_speed = 0
      @raw_speed = 3
    end

    def update_position
      self.y += y_speed if is_going_up? || is_going_down?
    end

    def move_to_initial_position
      self.x, self.y = @inital_position
    end

    def top
      self.y
    end

    def bottom
      self.y + self.height
    end

    def left
      self.x
    end

    def right
      self.x + self.width
    end

    private

    def is_going_up?
      y_speed.negative? && y >= 0
    end

    def is_going_down?
      y_speed.positive? && y <= (@canvas_heigth - @height)
    end

    def fetch_canvas_attributes
      @canvas_width = App.class_variable_get(:@@canvas).width
      @canvas_heigth = App.class_variable_get(:@@canvas).height
      @margin = App.class_variable_get(:@@canvas).margin
    end
  end
end
