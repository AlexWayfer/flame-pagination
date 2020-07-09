# frozen_string_literal: true

require 'memery'
require 'module_methods'

module Flame
	module Pagination
		## Mixin for controllers
		module ForController
			PER_PAGE_OPTIONS = [10, 20, 50].freeze
			DEFAULT_PER_PAGE = PER_PAGE_OPTIONS.first

			extend ::ModuleMethods

			## Module with class methods for controllers
			module ClassMethods
				include Memery

				memoize def records_key_for_session
					"#{instance_collection_name}_on_page"
				end
			end

			protected

			def execute(action)
				@action = action

				@previous_saved_per_page = saved_per_page

				per_page_change_if_different

				super
			end

			private

			attr_reader :pages_enum

			def paginate!(form, near_edge: 0, arround_current: 2)
				available_current_page, @pages_count =
					form.paginate! current_page, per_page: current_per_page

				halt_redirect_to_page available_current_page if available_current_page != current_page

				@pages_enum = Pages.new(current_page, @pages_count, near_edge, arround_current).to_enum
			end

			def current_page
				@current_page ||= (params[:page] || 1).to_i
			end

			def current_per_page
				return @current_per_page if defined? @current_per_page

				per_page_index = PER_PAGE_OPTIONS.index(
					params.fetch(:per_page, saved_per_page).to_i
				)

				@current_per_page =
					per_page_index ? PER_PAGE_OPTIONS[per_page_index] : DEFAULT_PER_PAGE
			end

			def params_with_page(page, per_page)
				params.merge(page: page, per_page: per_page)
			end

			def saved_per_page
				authenticated.session&.options&.[](self.class.records_key_for_session)
			end

			def halt_redirect_to_page(page, action = @action)
				halt redirect action, **params_with_page(page, current_per_page)
			end

			def page_after_per_page_change
				previous_per_page = @previous_saved_per_page || DEFAULT_PER_PAGE
				Rational((current_page - 1) * previous_per_page + 1, current_per_page).ceil
			end

			def per_page_change_if_different
				return if @previous_saved_per_page == current_per_page

				authenticated.session&.update(
					options: Sequel.pg_jsonb_op(:options).concat(
						self.class.records_key_for_session => current_per_page
					)
				)

				return unless authenticated.account
				return unless current_page > 1

				halt_redirect_to_page page_after_per_page_change, @action
			end
		end
	end
end
