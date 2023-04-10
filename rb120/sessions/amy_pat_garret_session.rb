class Sports
  LOCATION = "Outdoors"

    def self.location
      self::LOCATION
    end
  end

    class Basketball < Sports
      LOCATION = "Indoors"
    end

    class Baseball < Sports
    end

    class Football < Sports
    end

    class Soccer < Sports
    end

  p Soccer.location
  p Baseball.location
  p Basketball.location
  p Football.location
  p Sports.location