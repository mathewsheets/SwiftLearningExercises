/*:
**Exercise:** Get Acquainted. Get a few properties of each person in your class... name and email are good. Use the `String` and `Character` as well as the data types and operators in [Basics | Data Types | Operators](Basics%20|%20Data%20Types%20|%20Operators) to complete this exercise.
>> **Example Output:**
* `My name is Mathew Sheets, my email is swift.dude@gmail.com`
* `Other students in my class are Annie, Sam, Jack, Hudson, Oliver`
* `Oliver dropped this class` (**use the string above to pull out the last persons name**)
* `CARSON was added to the class` (**use the string above and insert another person before the second person**)
* `Jack and Hudson are in the class` (**use the string above to pull out fourth and fifth person**)
*/

let me = (name: "Mathew Sheets", email: "swift.dude@gmail.com")
let annie = (name: "Annie Sheets", email: "annie.sheets@email.com")
let sam = (name: "Sam Sheets", email: "sam.sheets@email.com")
let jack = (name: "Jack Sheets", email: "jack.sheets@email.com")
let hudson = (name: "Hudson Sheets", email: "hudson.sheets@email.com")
let oliver = (name: "Oliver Sheets", email: "oliver.sheets@email.com")

print("My name is \(me.name), my email is \(me.email)")
