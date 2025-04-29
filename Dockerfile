# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.2.2
FROM ruby:3.2.2

# Instalar dependências do sistema
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm

# Instalar o Yarn
RUN npm install -g yarn

# Configurar diretório de trabalho
WORKDIR /app

# Copiar Gemfile e instalar gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copiar o resto do código
COPY . .

# Instalar dependências do Node.js
RUN yarn install

# Compilar assets
RUN bundle exec rake assets:precompile

# Adicionar script de entrada
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Expor a porta 3000
EXPOSE 3000

# Iniciar o servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
