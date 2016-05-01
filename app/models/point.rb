class Point

  attr_accessor :longitude, :latitude

  def initialize lng, lat #(params)
    #if !params[:type]
      #@longitude = params[:lng]
      #@latitude = params[:lat]
    #elsif #hash input
      #@longitude = params[:coordinates][0]
      #@latitude = params[:coordinates][1]
    #end
    @longitude = lng
    @latitude = lat
  end

  def mongoize
    { type: "Point", coordinates: [@longitude, @latitude] }
  end

  def self.mongoize object
    case object
      when nil then nil
      when Hash then object
      when Point then object.mongoize
    end
  end

  def self.demongoize obj
    case obj
      when nil then nil
      when Hash then Point.new(obj[:coordinates][0], obj[:coordinates][1])
      when Point then obj
    end
  end

  def self.evolve object
    case object
      when nil then nil
      when Hash then Point.new(object[:coordinates][0], object[:coordinates][1]).mongoize
      when Point then object.mongoize
    end
  end

end
