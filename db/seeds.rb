map = Challenge.create(name: "Map", problem_statement: "Return a new array
  in which each element in the new array is one greater than it was in the initial array.", expected_output: "[2, 3, 4, 5]", initial_data: "nums = [1,2,3,4]")

select = Challenge.create(name: "Select", problem_statement: "Give me all of 
  the elements from the given array that are bigger than 13", 
  expected_output: "[14, 235, 325, 325, 643, 53, 62, 634, 23, 32] ", initial_data: "[14,235,325,1,325,643,1,53,1,62,1,6,634,23,32]")

max = Challenge.create(name: "Max", problem_statement: "Give me the
  biggest element in the given array", 
  expected_output: "643 ", initial_data: "[14,235,325,1,325,643,1,53,1,62,1,6,634,23,32]")

map.hint = Hint.create(method: "map")
select.hint = Hint.create(method:"select")
max.hint = Hint.create(method:"max")

uku = User.create(name: "Uku Taht", email: "uku.taht@gmail.com",
               gravatar: "http://www.gravatar.com/avatar/051d7d3cccb9ec47de909157ce759f42.png")
