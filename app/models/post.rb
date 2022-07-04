class Post < ApplicationRecord
    validates :title, presence: true
    validate :click_bait 
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in:%w(Fiction Non-Fiction)}

    def click_bait
        unless title.present? &&
            title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, 'not allowed')
        end
    end
end
