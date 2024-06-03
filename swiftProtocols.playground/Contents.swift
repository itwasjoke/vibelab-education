import Foundation

struct Indetifier {
    var id = 1
}

class Ref<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
}
class Container<T> {
    var ref: Ref<T>
    init(value: T){
        self.ref = Ref(value: value)
    }
    var value: T {
        get{
            ref.value
        }
        set{
            guard (isKnownUniquelyReferenced(&ref)) else{
                ref = Ref(value: newValue)
                return
            }
            ref.value = newValue
        }
    }
}
var id = Indetifier()
var container1 = Container(value: id)
var container2 = container1

container2.value.id = 12

// ...

protocol Hotel{
    init(roomCount: Int)
}
class HotelAlfa : Hotel {
    var roomCount : Int
    required init(roomCount: Int) {
        self.roomCount = roomCount
    }
}

let hotelAlfa = HotelAlfa(roomCount: 10)
print("rooms: \(hotelAlfa.roomCount)")

// ...

protocol GameDice {
    var numberDice : Int {get}
}

extension Int: GameDice {
    var numberDice: Int {
        print("Выпало \(self) на кубике")
        return self
    }
}
let diceCoub = 4
diceCoub.numberDice

// ...

protocol Example {
    var element1 : Int {get}
    var element2 : Int? {get}
    func action()
}

class ExampleClass : Example {
    var element1: Int = 1
    
    var element2: Int?
    
    func action() {
        print("Hello World!")
    }
}

let exampleClass = ExampleClass()
exampleClass.element1 = 1
exampleClass.action()

// ...

enum Platform : String {
    case Swift = "Swift"
    case Kotlin = "Kotlin"
    case Java = "Java"
}

protocol Pr1 {
    var time : String {get}
    var countCode : Int {get}
    func whiteCode(platform: Platform, numberOfSpecialist: Int)
}
protocol Pr2 {
    func stopCoding()
}

enum Spec {
    case iOS
    case Android
    case Web
}

class Company : Pr1, Pr2 {
    var time: String
    
    var countCode: Int
    
    func whiteCode(platform: Platform, numberOfSpecialist: Int) {
        if(self.countEmployee < numberOfSpecialist){
            print("Error. To many specialists for this company")
            return
        }
        print("\(numberOfSpecialist) специалистов сейчас пишут код на \(platform.rawValue)")
    }
    
    func stopCoding() {
        print("Все на боковую")
    }
    
    var countEmployee : Int
    var spec : Spec
    init(countEmployee: Int, spec: Spec, time: String, countCode: Int) {
        self.countEmployee = countEmployee
        self.spec = spec
        self.time = time
        self.countCode = countCode
    }
}
let company = Company(countEmployee: 5, spec: .iOS, time: "14:55", countCode: 53)
company.whiteCode(platform: .Swift, numberOfSpecialist: 55)
company.stopCoding()
