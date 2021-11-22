# Flame Pagination

[![Cirrus CI - Base Branch Build Status](https://img.shields.io/cirrus/github/AlexWayfer/flame-pagination?style=flat-square)](https://cirrus-ci.com/github/AlexWayfer/flame-pagination)
[![Codecov branch](https://img.shields.io/codecov/c/github/AlexWayfer/flame-pagination/main.svg?style=flat-square)](https://codecov.io/gh/AlexWayfer/flame-pagination)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/AlexWayfer/flame-pagination.svg?style=flat-square)](https://codeclimate.com/github/AlexWayfer/flame-pagination)
[![Depfu](https://img.shields.io/depfu/AlexWayfer/benchmark_toys?style=flat-square)](https://depfu.com/repos/github/AlexWayfer/flame-pagination)
[![Inline docs](https://inch-ci.org/github/AlexWayfer/flame-pagination.svg?branch=main)](https://inch-ci.org/github/AlexWayfer/flame-pagination)
[![license](https://img.shields.io/github/license/AlexWayfer/flame-pagination.svg?style=flat-square)](https://github.com/AlexWayfer/flame-pagination/blob/main/LICENSE.txt)
[![Gem](https://img.shields.io/gem/v/flame-pagination.svg?style=flat-square)](https://rubygems.org/gems/flame-pagination)

Pagination for Flame application with Formalism forms.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flame-pagination'
```

And then execute:

```shell
bundle install
```

Or install it yourself as:

```shell
gem install flame-pagination
```

## Usage

Recommended to use only as dependency of
[`formalism-model_forms`](https://github.com/AlexWayfer/formalism-model_forms).

You'll still have to include `Flame::Pagination::ForController` into your model controller.

Details below:

```ruby
require 'flame-pagination'

module MyProject
  ## Already in `formalism-model_forms`
  module Forms
    module Model
      ## Base form for model listing
      class List < Base
        include Flame::Pagination::ForForms
      end
    end

    module User
      class List < Model::List
      end
    end
  end

  ## Have to be set manually, maybe in some common `ModelController`
  module Controlelrs
    module UsersController
      extend Flame::Controller::Actions
      include Flame::Pagination::ForController

      def index
        @form = Forms::User::List.new(params[:user])

        paginate! @form

        @users = if (form_outcome = @form.run).success?
          form_outcome.result
        end

        view :index
      end
    end
  end
end
```

## Development

After checking out the repo, run `bundle install` to install dependencies.

Then, run `toys rspec` to run the tests.

To install this gem onto your local machine, run `toys gem install`.

To release a new version, run `toys gem release %version%`.
See how it works [here](https://github.com/AlexWayfer/gem_toys#release).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/AlexWayfer/flame-pagination).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
