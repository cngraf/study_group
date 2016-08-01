require "study_group_faker/version"
require_relative "study_group_faker/config"

module StudyGroupFaker
  extend self

  def test_method
    puts "Success"
  end

  module Name
    def first_name
      ["Joe", "Sandy", "Alf"].sample
    end

    def last_name
      ["Hutchinson", "Robotnik", "Eggman"].sample
    end

    def middle_name

    end

    def full_name
      first_name + " " + last_name
    end
  end
end
