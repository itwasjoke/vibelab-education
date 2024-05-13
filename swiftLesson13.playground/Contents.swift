class Human {
    static let year = 2024
    var name : String
    var age : Int
    var dateBirth : Int {
        return Human.year - age;
    }
    var city : String
    func birthday(){
        age+=1
    }
    func doAction(){
        print("My name is \(name), I can do anything!")
    }
    init(name: String, age: Int, city: String) {
        self.name = name
        self.age = age
        self.city = city
    }
}
var human = Human(name: "Andrey", age: 20, city: "СПб")

human.birthday()
human.age
human.doAction()

class Student : Human {
    override func doAction(){
        print("It doesn't matter what is my name, I am just do TOE")
    }
    func math() -> Int{
        return 2*2;
    }
}
var student = Student(name: "Ivan", age: 21, city: "СПб")
student.doAction()
print(student.math())

class Employee : Human {
    var work : String
    init(name: String, age: Int, city: String, work: String) {
        self.work = work
        super.init(name: name, age: age, city: city)
    }
}

class House {
    var width : Int
    var height : Int
    func create(){
        print(width*height)
    }
    func destroy(){
        print("house destroyed")
    }
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
}

class Class {
    var students : Array<Student>
    func sortByName(){
        for i in 0...(students.count-2) {
            for j in i...(students.count-2) {
                if (students[j].name < students[j+1].name){
                    var student1 = students[j]
                    var student2 = students[j+1]
                    students[j+1] = student1
                    students[j] = student2
                }
            }
        }
    }
    
    func printArray(){
        for a in students{
            print(a.name)
        }
    }
    
    func sortByAge(){
        for i in 0...(students.count-2) {
            for j in i...(students.count-2) {
                if (students[j].age < students[j+1].age){
                    var student1 = students[j]
                    var student2 = students[j+1]
                    students[j+1] = student1
                    students[j] = student2
                }
            }
        }
    }
    
    init(students: Array<Student>) {
        self.students = students
    }
    
}

var array = [Student(name: "asad", age: 212, city: "СПб"), Student(name: "fg", age: 22, city: "СПб22")]

var classStudents = Class(students: array)
classStudents.sortByName()
classStudents.printArray()


enum CardSuits : String{
    case Hearts = "♥"
    case Diamonds = "♦"
    case Clubs = "♣"
    case Spades = "♠"
}


typealias CardArray = Array<(CardSuits, Int)>

class Game {
    private var cards : CardArray
    
    private var namesCards = [11: "Валет", 12: "Дама", 13: "Король", 14: "Туз"]
    
    func printAllCards(){
        for i in self.cards {
            print(i.0.rawValue + " " + (namesCards[i.1] ?? String(i.1)))
        }
    }
    private func printCards(cards: CardArray){
        for i in cards {
            print(i.0.rawValue + " " + (namesCards[i.1] ?? String(i.1)))
        }
    }
    private func printCombination(comb: CardArray){
        var combin = comb
        combin.sort {
            (lhs, rhs) -> Bool in
            if lhs.1 < rhs.1 {
                return true
            }
            else{return false}
        }
        
        printCards(cards: combin)
        
        var countDublicates = 0
        var thisDublicates = 1
        var flash = true
        var street = true
        var couple = false
        var fullHouse = false
        for i in 0...3 {
            if combin[i].1 != (combin[i+1].1 + 1) && street {
                street = false
            }
            if combin[i].0 != combin[i+1].0 && flash {
                flash = false
            }
            thisDublicates = 1
            for j in (i+1)...4 {
                if combin[i].1==combin[j].1{
                    thisDublicates+=1
                }
                else {break}
            }
            if thisDublicates == 2 && countDublicates == 2 {
                couple = true
            }
            if thisDublicates > countDublicates{
                countDublicates = thisDublicates
                if countDublicates == 3 {
                    switch i {
                    case 0: if combin[3].1==combin[4].1 { fullHouse = true }
                    case 3: if combin[0].1==combin[1].1 { fullHouse = true }
                    default: break
                    }
                }
            }
        }
        
        var set = countDublicates == 3
        var kare = countDublicates == 4
        var streetFlash = street && flash
        var flashRoyal = streetFlash && combin[4].1 == 14
        print()
        if flashRoyal {
            print ("FLASH ROYAL\n")
            return
        }
        if streetFlash {
            print ("STREET FLASH\n")
            return
        }
        if kare {
            print("KARE\n")
            return
        }
        if fullHouse {
            print("FULL HOUSE\n")
            return
        }
        if flash {
            print("FLASH\n")
            return
        }
        if street {
            print("STREET\n")
            return
        }
        if set {
            print("SET\n")
            return
        }
        if couple {
            print("2 COUPLES\n")
            return
        }
        if countDublicates == 2 {
            print("COUPLE\n")
            return
        }
        print(combin[4].0.rawValue + " " + (namesCards[combin[4].1] ?? String(combin[4].1)) + "\n")
    }
    func combination(){
        var comb : CardArray = []
        for i in 1...5{
            var cardID = Int.random(in: 0..<self.cards.count)
            comb.append(self.cards[cardID])
            self.cards.remove(at: cardID)
        }
        printCombination(comb: comb)
    }
    init(){
        var elements  : CardArray = []
        for numSuits in 1...4{
            var suits : CardSuits = .Clubs
            switch numSuits {
            case 1: suits = .Clubs
            case 2: suits = .Diamonds
            case 3: suits = .Hearts
            case 4: suits = .Spades
            default:
                break
            }
            for numbers in 6...14 {
                elements.append((suits, numbers))
            }
        }
        self.cards = elements
    }
}

var game = Game()
game.combination()
game.combination()
game.combination()
game.combination()

// классы могут наследоваться от другого класса в отличии от структур
// классы - ссылочные, а структуры - значимые
// классы могут содержать деинициализаторы
