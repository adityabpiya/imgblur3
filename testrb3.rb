#Imageblur2.rb
class Image

    attr_accessor :blur, :n
    
    def input
        puts "Please enter manhattan distance"
        @n = gets.chomp
        @n.to_i
    end

	def initialize(blur)
        @image = blur
        @n = n
    end
  
  

  def output_image
    self.blur2 
		@image.each do |call|
			puts call.join
		end
  end

  def find_1
    ones = []
    @image.each_with_index do |arr, row_index|
      arr.each_with_index do |element, column_index|
        if element == 1
          ones << [row_index, column_index]
        end
      end
    end
    #  puts ones.inspect
  
  
    ones.each do |br|  
      x = br[0]
      y = br[1]

      @image[x][y + 1] = 1 if y + 1 <= @image[x].count - 1 #right
      @image[x][y - 1] = 1 if y - 1 >= 0 #left
      @image[x + 1][y] = 1 if x + 1 <= @image.count - 1 #down
      @image[x - 1][y] = 1 if x - 1 >= 0 #up
    end
  end

  def blur2(distance=n)
    distance.to_i.times do
      find_1
    end
  end
  

end

image = Image.new([
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ])


# image.blur2
image.input
image.output_image
