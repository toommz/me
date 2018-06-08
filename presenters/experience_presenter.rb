module Presenters
  class ExperiencePresenter
    def initialize(experience)
      @experience = experience
    end

    def company
      @experience.company.capitalize
    end

    def period
      @experience.to ? from_to : from
    end

    def role
      "En tant que #{@experience.role}"
    end

    def city
      "À #{@experience.city.capitalize}"
    end

    def method_missing(method, *args)
      if @experience.respond_to?(method)
        @experience.send(method, *args)
      else
        super
      end
    end

    private

    def from_to
      "De #{@experience.from} à #{@experience.to}"
    end

    def from
      "Depuis #{@experience.from}"
    end
  end
end
