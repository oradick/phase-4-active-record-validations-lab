class Post < ApplicationRecord
    # All posts have a title
    validates :title, presence: true
    # Post content is at least 250 characters long
    validates :content, length: { minimum: 250}
    # Post summary is a maximum of 250 characters
    validates :summary, length: { maximum: 250}
    # Post category is either Fiction or Non-Fiction. This step requires an inclusion validator, which was not outlined in the lesson. You'll need to refer to the Rails guide Links to an external site.to look up how to use it.
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    # add a custom validator to the Post model that ensures the title is sufficiently clickbait-y. 
    # The validator should add a validation error if the title does NOT contain
    # "Won't Believe"
    # "Secret"
    # "Top [number]"
    # "Guess"

    validates :sufficiently_clickbaity

    def sufficiently_clickbaity
        unless 
            title.include? "Won't Believe" || title.include? "Secret" || title.include? "Top \d" || title.include? "Guess"
        
            errors.add(:title, "not clickbaity")
        end
    end


end
