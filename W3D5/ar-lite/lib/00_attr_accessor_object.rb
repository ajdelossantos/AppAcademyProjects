class AttrAccessorObject
  def self.my_attr_accessor(*names)
    #TODO *names returns an array of args passed in
    names.each do |name|

      #TODO argument sets the name of the method
      define_method(name) do

        #TODO prepends variable with @ character
        instance_variable_get("@#{name}")
      end

      #TODO interpolate argument to fix naming
      #TODO pass in value as a block argument
      define_method("#{name}=") do |value|
        instance_variable_set("@#{name}", value)
      end

    end
  end
end
