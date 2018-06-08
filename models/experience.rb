module Models
  class Experience
    attr_accessor :company, :from, :to,
                  :role, :city, :missions, :position

    def initialize(params)
      params.each { |k,v| send("#{k}=", v) }
    end
  end
end
