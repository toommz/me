require 'sinatra'
require 'yaml'

require './models/skill'
require './presenters/skill_presenter'
require './models/experience'
require './presenters/experience_presenter'

get '/' do
  erb :home, locals: { curriculum: prepare_curriculum }
end

private

def prepare_curriculum
  { experiences: experiences, skills: skills }
end

def data
  @data ||= YAML.load_file('./db/data.yml')
end

def experiences
  data['data']['experiences'].map do |experience|
    Presenters::ExperiencePresenter.new(Models::Experience.new(experience))
  end.sort { |a, b| a.position - b.position }
end

def skills
  data['data']['skills'].map do |skill|
    Presenters::SkillPresenter.new(Models::Skill.new(skill))
  end.shuffle
end
