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

	spec.required_ruby_version = '>= 3.0', '< 4'

	source_code_uri = 'https://github.com/AlexWayfer/flame-pagination'

	spec.homepage = source_code_uri

	spec.metadata['source_code_uri'] = source_code_uri

	spec.metadata['homepage_uri'] = spec.homepage

	spec.metadata['changelog_uri'] =
		'https://github.com/AlexWayfer/flame-pagination/blob/main/CHANGELOG.md'

	spec.metadata['rubygems_mfa_required'] = 'true'

	spec.files = Dir['lib/**/*.rb', 'README.md', 'LICENSE.txt', 'CHANGELOG.md']

	spec.add_dependency 'alt_memery', '~> 2.0'
	spec.add_dependency 'flame', '>= 4', '< 6'
	spec.add_dependency 'module_methods', '~> 0.1.0'
end
