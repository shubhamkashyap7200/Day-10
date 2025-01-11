import Cocoa

var greeting = "Hello, playground"

// Structures
// Swift’s structs let us create our own custom, complex data types, complete with their own variables and their own functions

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) \(year) \(artist)")
    }
}

struct Student {
    let name: String
    let age: Int
    let height: Double
    
    func printStats() {
        print("\(name) \(age) \(height)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()


struct Employee {
    let name: String
    var vacationRemaining: Int
    
//    init(name: String, vacationRemaining: Int) {
//        self.name = name
//        self.vacationRemaining = vacationRemaining
//    }
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("Going on vacation")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining")
        }
    }
}

var john = Employee(name: "John", vacationRemaining: 15)
john.takeVacation(days: 5)
print(john.vacationRemaining)

// This is a little bit of what’s called syntactic sugar – Swift silently creates a special function inside the struct called init()

let a = 1
let b = 2.0
let c = Double(a) + b // Default Init in struct

// Tuple - Swift’s tuples let us store several different named values inside a single variable

struct User {
    var name: String
    var age: Int
    var city: String
}

//func authenticate(_ user: User) { ... }
//func showProfile(for user: User) { ... }
//func signOut(_ user: User) { ... }

//func authenticate(_ user: (name: String, age: Int, city: String)) { ... }
//func showProfile(for user: (name: String, age: Int, city: String)) { ... }
//func signOut(_ user: (name: String, age: Int, city: String)) { ... }


// Computed Properties
// Structs can have two kinds of property: a stored property is a variable or constant that holds a piece of data inside an instance of the struct, and a computed property calculates the value of the property dynamically every time it’s accessed. This means computed properties are a blend of both stored properties and functions: they are accessed like stored properties, but work like functions

struct Employees {
    let name: String
    var vacationAllocated: Int = 20
    var vacationTaken: Int = 0
    
    var vacationRemaining: Int {
        get {
            return vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            print("Going on vacation")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining")
        }
    }
}

var jerry = Employees(name: "Jerry")
jerry.vacationTaken = 15
jerry.vacationRemaining
jerry.vacationAllocated

struct Code {
    var language: String
    var containsErrors = false
    var report: String { // Always have to have a type
        if containsErrors {
            return "This \(language) code has bugs!"
        } else {
            return "This looks good to me."
        }
    }
}

struct Dog {
    var breed: String
    var cuteness: Int
    var rating: String {
        if cuteness < 3 {
            return ("That's a cute dog!")
        } else if cuteness < 7 {
            return ("That's a really cute dog!")
        } else {
            return ("That a super cute dog!")
        }
    }
}
let luna = Dog(breed: "Samoyed", cuteness: 11)
print(luna.rating)

// Property Observers
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// most of the time you will be using didSet, because we want to take action after the change has happened so we can update our user interface, save changes, or whatever

// willSet is used is when you need to know the state of your program before a change is made

struct Apps {
    var name: String
    var isOnSale: Bool {
        didSet {
            if isOnSale {
                print("Go and download my app!")
            } else {
                print("Maybe download it later.")
            }
        }
    }
}

struct Player {
    let name: String
    let number: Int
    
    // Custom
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...100)
        // some code execution
    }
}

let player = Player(name: "Megan R") // memberwise initializer
 
// Memberwise initialiser
struct NewEmployee {
    var name: String
    var yearsActive = 0
}

// Extension allows us to create both memberwise and custom initialiser
extension NewEmployee {
    init() {
        self.name = "Johny"
        print("Creating new anom account")
    }
}

let roslin = NewEmployee(name: "Laura Roslin")
let adama = NewEmployee(name: "William Adama", yearsActive: 45)
let logan = NewEmployee()
roslin.yearsActive
logan.name

struct Boy {
    var name: String
    var bestFriend: String

    init(name: String, bestFriend: String) {
        print("Enrolling \(name) in class…")
        self.name = name
        self.bestFriend = bestFriend
    }
}
