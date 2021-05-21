class Kid < ApplicationRecord
    belong_to :user
    has_many :visits
end
