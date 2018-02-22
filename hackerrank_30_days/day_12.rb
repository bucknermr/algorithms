# https://www.hackerrank.com/challenges/30-inheritance/problem

class Student <Person
    #   Class Constructor
    #
    #   Parameters:
    #   firstName - A string denoting the Person's first name.
    #   lastName - A string denoting the Person's last name.
    #   id - An integer denoting the Person's ID number.
    #   scores - An array of integers denoting the Person's test scores.
    #
    # Write your constructor here

    def initialize(firstName, lastName, id, scores)
        @firstName = firstName
        @lastName = lastName
        @id = id
        @scores = scores
    end

    #   Function Name: calculate
    #   Return: A character denoting the grade.
    #
    # Write your function here

    def calculate
        average = @scores.inject(0, :+).fdiv(@scores.length)
        case average
        when (90..100)
            'O'
        when (80...90)
            'E'
        when (70...80)
            'A'
        when (55...70)
            'P'
        when (40...55)
            'D'
        else
            'T'
        end
    end
end
