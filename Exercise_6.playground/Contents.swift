/*:
**Exercise:** Leveraging the `each` and `iterator` functions above, and using the students constant below, create the following functions passing in a closure to satisfy the function requirement.
*/
let students = [
    ["first" : "Obi-Wan",   "last" : "Kenobi",      "age" : "55", "class" : "Math"],
    ["first" : "Darth",     "last" : "Vader",		"age" : "76", "class" : "Engligh"],
    ["first" : "Anakin",    "last" : "Skywalker",	"age" : "17", "class" : "History"],
    ["first" : "Darth",     "last" : "Sidious",		"age" : "88", "class" : "Science"],
    ["first" : "Padme",     "last" : "Amidala",		"age" : "25", "class" : "Math"],
    ["first" : "Mace",      "last" : "Windu",		"age" : "56", "class" : "Science"],
    ["first" : "Count",     "last" : "Dooku",		"age" : "67", "class" : "History"],
    ["first" : "Luke",      "last" : "Skywalker",	"age" : "21", "class" : "Math"],
    ["first" : "Han",       "last" : "Solo",		"age" : "35", "class" : "Science"],
    ["first" : "Leia",      "last" : "Organa",		"age" : "21", "class" : "Engligh"],
    ["first" : "Chew",      "last" : "Bacca",		"age" : "33", "class" : "Science"],
    ["first" : "Boba",      "last" : "Fett",		"age" : "32", "class" : "History"],
    ["first" : "Lando",     "last" : "Calrissian",	"age" : "55", "class" : "Engligh"],
    ["first" : "Kylo",      "last" : "Ren",			"age" : "21", "class" : "Math"],
    ["first" : "Poe",       "last" : "Dameron",		"age" : "25", "class" : "History"],
    ["first" : "Finn",      "last" : "FN-2187",		"age" : "23", "class" : "Science"],
    ["first" : "Rey",       "last" : "Rey",			"age" : "16", "class" : "Engligh"]
]
/*:
**Functions:**
* each = Iterate over each element in the array
* all = Returns true if all of the element is not false
* any = Returns true if at least one of the elements is not false
* indexOf = Returns the index at which element can be found
* contains = Returns true if the element is present in the list
* filter = Returns an array of all the elements that pass a truth test (predicate).
* reject = Returns the elements in the array without the elements that pass a truth test (predicate).
* pluck = Returns an array of a specific value from all the elements
*/
each(students) { print("\($0["first"]!) \($0["last"]!) is index \($1)") }


print(pluck(students) { $0["age"]! })
print(pluck(students) { $0["last"]! })

