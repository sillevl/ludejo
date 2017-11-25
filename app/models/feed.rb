class Feed < ApplicationRecord
    belongs_to :monster

    def user_name
        return "Anonymous" if self.author_id.nil?
        User.find(self.author_id).name
    end
end
