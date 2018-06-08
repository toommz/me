module Models
  class Skill
    attr_accessor :name, :level

    def initialize(params)
      params.each { |k,v| send("#{k}=", v) }
    end
  end
end
