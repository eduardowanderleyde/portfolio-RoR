class PagesController < ApplicationController
  def home
    @projects = Project.all
  end

  def about
    @educations = Education.all.order(start_date: :desc)
    @experiences = Experience.all.order(start_date: :desc)
    @skills = [
      'Ruby on Rails',
      'PostgreSQL',
      'HTML/CSS',
      'JavaScript',
      'Git',
      'Docker',
      'AWS',
      'TDD',
      'RSpec',
      'Capybara'
    ]
  end
end 