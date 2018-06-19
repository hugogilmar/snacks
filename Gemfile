source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

gem 'rails', '~> 5.2.0'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false

gem 'sorcery', '~> 0.12.0'

gem 'bcrypt', '~> 3.1.12'
gem 'jwt', '~> 1.5.6'
gem 'uuid', '~> 2.3.8'

gem 'active_model_serializers', '~> 0.10.7'

gem 'kaminari', '~> 1.1.1'
gem 'ransack', '~> 1.8.8'
gem 'audited', '~> 4.7.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
