class Visit < ApplicationRecord
    belong_to :user
    belong_to :kid
    belong_to :doctor
end
