# frozen_string_literal: true

require_relative 'lib/flame/pagination/version'

Gem::Specification.new do |spec|
	spec.name        = 'flame-pagination'
	spec.version     = Flame::Pagination::VERSION
	spec.authors     = ['Alexander Popov']
	spec.email       = ['alex.wayfer@gmail.com']

	spec.summary     = 'Pagination for Flame application with Formalism forms'
	spec.description = <<~DESC
		Pagination for Flame application with Formalism forms.
	DESC
	spec.license = 'MIT'

	spec.required_ruby_version = '>= 2.5'

	source_code_uri = 'https://github.com/AlexWayfer/flame-pagination'

	spec.homepage = source_code_uri

	spec.metadata['source_code_uri'] = source_code_uri

	spec.metadata['homepage_uri'] = spec.homepage

	spec.metadata['changelog_uri'] =
		'https://github.com/AlexWayfer/flame-pagination/blob/master/CHANGELOG.md'

	spec.files = Dir['lib/**/*.rb', 'README.md', 'LICENSE.txt', 'CHANGELOG.md']

	spec.add_runtime_dependency 'alt_memery', '~> 2.0'
	spec.add_runtime_dependency 'flame', '>= 4', '< 6'
	spec.add_runtime_dependency 'module_methods', '~> 0.1.0'

	spec.add_development_dependency 'pry-byebug', '~> 3.9'

	spec.add_development_dependency 'bundler', '~> 2.0'
	spec.add_development_dependency 'gem_toys', '~> 0.7.1'
	spec.add_development_dependency 'toys', '~> 0.11.4'

	spec.add_development_dependency 'codecov', '~> 0.5.0'
	spec.add_development_dependency 'rspec', '~> 3.9'
	spec.add_development_dependency 'simplecov', '~> 0.21.2'

	spec.add_development_dependency 'rubocop', '~> 1.4'
	spec.add_development_dependency 'rubocop-performance', '~> 1.0'
	spec.add_development_dependency 'rubocop-rspec', '~> 2.0'
end
