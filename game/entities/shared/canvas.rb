module Shared
  class Canvas
    attr_reader :height, :width, :margin

    def initialize
      @height = 400
      @width = 400
      @margin = 10
    end
  end
end
