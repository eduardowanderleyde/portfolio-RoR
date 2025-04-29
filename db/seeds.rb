# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Criando usuário admin se não existir
user = User.find_or_create_by!(email: 'wanderley.eduardo@gmail.com') do |u|
  u.password = 'password123'
  u.password_confirmation = 'password123'
end

# Projetos
projects_data = [
  {
    title: "Instagram Clone",
    description: "Clone do Instagram desenvolvido com Ruby on Rails, implementando funcionalidades principais como upload de fotos, comentários, likes e sistema de seguir usuários.",
    technologies: "Ruby on Rails, PostgreSQL, AWS S3, Action Cable, TailwindCSS",
    github_link: "https://github.com/eduardowanderleyde/instagram",
    deploy_link: "https://instagram-clone-rails-ewsa.herokuapp.com"
  },
  {
    title: "AcendePavio",
    description: "Site da Acende Pavio, uma plataforma desenvolvida em Ruby on Rails para gerenciamento de conteúdo e interação com usuários.",
    technologies: "Ruby on Rails, PostgreSQL, TailwindCSS, Hotwire",
    github_link: "https://github.com/eduardowanderleyde/AcendePavio",
    deploy_link: "https://acendepavio.com"
  },
  {
    title: "Marketplace API",
    description: "API RESTful para um marketplace, desenvolvida com Ruby on Rails seguindo as melhores práticas de desenvolvimento e padrões de projeto.",
    technologies: "Ruby on Rails, PostgreSQL, RSpec, JWT Authentication",
    github_link: "https://github.com/eduardowanderleyde/marketplace_api",
    deploy_link: "https://marketplace-api-rails.herokuapp.com"
  },
  {
    title: "Culinary Quest",
    description: "Aplicação web para compartilhamento de receitas e experiências culinárias, com sistema de avaliação e comentários.",
    technologies: "Ruby on Rails, PostgreSQL, TailwindCSS, Action Cable",
    github_link: "https://github.com/eduardowanderleyde/culinaryquest",
    deploy_link: "https://culinaryquest.herokuapp.com"
  }
]

# Criando os projetos
projects_data.each do |project_data|
  project = user.projects.find_or_create_by!(title: project_data[:title]) do |p|
    p.description = project_data[:description]
    p.technologies = project_data[:technologies]
    p.github_link = project_data[:github_link]
    p.deploy_link = project_data[:deploy_link]
  end
  
  puts "Projeto '#{project.title}' criado com sucesso!"
end
