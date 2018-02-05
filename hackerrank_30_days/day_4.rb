# https://www.hackerrank.com/challenges/30-class-vs-instance/problem

class Person
    attr_accessor :age
    def initialize(initialAge)
        # Add some more code to run some checks on initialAge
        if initialAge < 0
            puts "Age is not valid, setting age to 0."
            initialAge = 0
        end
        @age = initialAge
    end
    def amIOld()
      # Do some computations in here and print out the correct statement to the console
        if age < 13
            puts 'You are young.'
        elsif age < 18
            puts 'You are a teenager.'
        else
            puts 'You are old.'
        end
    end
    def yearPasses()
      # Increment the age of the person in here
        @age += 1
    end
end
