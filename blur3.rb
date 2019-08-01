#Imageblur3.rb



class Image

	attr_accessor :blur

	def initialize(blur)
		@image = blur
	end

  def output_image
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

  

  def blur3(distance=3)
    distance.times do
      find_1
    end
  end


end



image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
  [0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0], 
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],


])


# image.find_1
image.blur3
image.output_image
