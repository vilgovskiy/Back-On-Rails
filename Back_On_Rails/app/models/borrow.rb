class Borrow < ApplicationRecord

    belongs_to :user
    belongs_to :item

    validates :user, presence: true
    validates :item, presence: true

    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :isReturned, presence: true, numericality: {only_integer: true}, inclusion: {in: [0,1]}

end