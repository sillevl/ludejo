class Monster < ApplicationRecord
    has_many :feeds

    def health_color
        return "" if health.to_i > 50
        return "orange" if (25..50).include?(health.to_i)
        return "red" if health.to_i < 25
    end
end
