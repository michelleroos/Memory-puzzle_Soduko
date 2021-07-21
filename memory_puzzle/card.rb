class Card

    ALPHA = ("A".."Z").to_a

    attr_reader :card, :card_up

    def initialize(card = nil) # "G" ? 
        @card ||= ALPHA.sample
        @card_up = false # facing down // hidden
    end

    def hide
        @card_up = false
    end

    def reveal
        # if @card_up == false 
        #     @card_up = true
        #     puts @card
        # end
        @card_up = true
    end

    # def to_s
    #     @card.to_s
    # end

    def ==(card_instance)
        @card == card_instance.card
    end

end



