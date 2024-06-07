import Cocoa

let monthsDays=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let monthsNames=["Январь","Февраль","Март","Апрель","Май","Июнь","Июль","Август","Сентябрь","Октябрь","Ноябрь", "Декабрь"]

for d in monthsDays{
    print(d)
}

for i in 0..<monthsDays.count {
    print("\(monthsNames[i]): \(monthsDays[i])")
}
var daysMonth = [
    ("Январь", 31),
    ("Февраль", 28),
    ("Март", 31),
    ("Апрель", 30),
    ("Май", 31),
    ("Июнь", 30),
    ("Июль", 31),
    ("Август", 31),
    ("Сентябрь", 30),
    ("Октябрь", 31),
    ("Ноябрь", 30),
    ("Декабрь", 31)
]
var name : String
var days : Int
for elem in daysMonth {
    (name,days)=elem
    print("\(name): \(days)")
}

// or

for elem in daysMonth {
    print("\(elem.0): \(elem.1)")
}

for i in stride(from: monthsDays.count-1, to: -1, by: -1) {
    print("\(monthsNames[i]): \(monthsDays[i])")
}

let currentName = "Апрель"
let date = 12

var daysAll = 0
for i in 0..<monthsDays.count {
    if monthsNames[i]==currentName{
        daysAll+=date
        break
    }
    else{
        daysAll+=monthsDays[i]
    }
}
print(daysAll)

