class Card

    attr_accessor :face_value, :face_up

        def initialize
            @face_value = "temp_value"
            @face_up_or_down = false
        end

        def hide
            @face_up = false
        end

        def reveal
            @face_up = true
        end

        def to_s
            @face_value.to_s 
        end

        def ==(card_to_compare_with)
        end
end