class Monster < ApplicationRecord
    has_many :feeds, dependent: :destroy

    def fed?
        return self.feeds.last.created_at > Time.now - 1.minutes if self.feeds.any?
        return false
    end

    def health 
        health = self[:health].to_i
        health += self.feeds.count
        health
    end

    def health_color
        value = ""
        case hunger_state
        when :no

        when :a_bit
            value = "orange"
        when :alot
            value = "red"
        end
        value   
    end

    def hunger_state
        return :no if health.to_i > 50
        return :a_bit if (25..50).include?(health.to_i)
        return :alot if health.to_i < 25
    end

    def hunger_state_text
        value = ""
        case hunger_state
        when :no
            value = "geen"
        when :a_bit
            value = "een beetje"
        when :alot
            value = "veel"
        end
        value
    end
end
