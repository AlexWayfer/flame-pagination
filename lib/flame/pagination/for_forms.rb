# frozen_string_literal: true

module Flame
	module Pagination
		## Mixin for forms
		module ForForms
			def paginate!(page, per_page: 10)
				@page = page
				@per_page = per_page

				pages_count = valid? ? (dataset.count / @per_page.to_f).ceil : 0
				@pages_count = pages_count.positive? ? pages_count : 1

				[@page.clamp(1, @pages_count), @pages_count]
			end

			private

			def limit_by_page
				return unless @page

				((@page - 1) * @per_page)...(@page * @per_page)
			end
		end
	end
end
