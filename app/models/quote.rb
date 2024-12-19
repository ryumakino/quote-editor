class Quote < ApplicationRecord
    validates :name, presence: true

    # Broadcasting created quotes with Turbo Streams
    after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
end
