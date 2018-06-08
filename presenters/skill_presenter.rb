module Presenters
  class SkillPresenter
    def initialize(skill, adapter = BootstrapAdapter)
      @skill = skill
      @adapter = BootstrapAdapter.new(@skill)
    end

    def name
      @skill.name.capitalize
    end

    def get_class
      @adapter.get_class
    end

    class BootstrapAdapter
      def initialize(skill)
        @skill = skill
      end

      def get_class
        classes[@skill.level.to_sym]
      end

      private

      def classes
        @classes ||= {
          senior: 'list-group-item list-group-item-success',
          experienced: 'list-group-item list-group-item-primary',
          junior: 'list-group-item list-group-item-warning'
        }
      end
    end
  end
end
