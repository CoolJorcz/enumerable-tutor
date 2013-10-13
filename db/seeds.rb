map = Challenge.create(name: "Map", problem_statement: "Return a new array
  in which each element in the new array is one greater than it was in the initial array.",
 challenge_order: 1, expected_output: "[2, 3, 4, 5]", initial_data: "[1,2,3,4]")

map.hint = Hint.create(method: "map")

uku = User.create(name: "Uku Taht", email: "uku.taht@gmail.com",
               gravatar: "http://www.gravatar.com/avatar/051d7d3cccb9ec47de909157ce759f42.png")

nic_cage = User.create(name: "Nicolas Cage", email: "nic@cage.com",
                       gravatar: "http://upload.wikimedia.org/wikipedia/commons/3/33/Nicolas_Cage_2011_CC.jpg")

