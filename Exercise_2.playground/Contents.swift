/*:
**Exercise:** Get Acquainted. Get a few properties of each person in your class... name and email are good. Use the `String` and `Character` as well as the data types and operators in [Basics | Data Types | Operators](Basics%20|%20Data%20Types%20|%20Operators) to complete this exercise.
>> **Example Output:**
* `My name is Mathew Sheets, my email is swift.dude@gmail.com.`
* `Other students in my class are Annie, Sam, Jack, Hudson and Oliver.`
* `Oliver dropped this class.` (**use the second bullet point string to pull out the last person's name.**)
* `Other students in my class are Annie, Sam, Jack, Hudson, CARSON was added.`  (**use the second bullet point string and append another person.**)
* `Jack and Hudson are in the class.` (**use the second bullet point string to pull out third and fourth person.**)
*/
let people = (
                (first: "Mathew", last: "Sheets", email: "swift.dude@gmail.com"),
                (first: "Annie", last: "Sheets", email: "annie.sheets@email.com"),
                (first: "Sam", last: "Sheets", email: "sam.sheets@email.com"),
                (first: "Jack", last: "Sheets", email: "jack.sheets@email.com"),
                (first: "Hudson", last: "Sheets", email: "hudson.sheets@email.com"),
                (first: "Oliver", last: "Sheets", email: "oliver.sheets@email.com")
            )

print("My name is \(people.0.first) \(people.0.last), my email is \(people.0.email)")

var otherStudents = "Other students in my class are \(people.1.first), \(people.2.first), \(people.3.first), \(people.4.first) and \(people.4.first)"
print(otherStudents)

//otherStudents.