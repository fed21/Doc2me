class Visit < ApplicationRecord
    belongs_to :user
    belongs_to :kid
    belongs_to :doctor
end
