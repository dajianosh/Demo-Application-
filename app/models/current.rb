class Current < ActiveSupport::CurrentAttributes
  # makes Current.employee accessible in view files.
  attribute :employee
end
