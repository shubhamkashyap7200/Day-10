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
