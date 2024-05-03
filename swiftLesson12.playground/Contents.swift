enum TurnType : String {
    case Edu = "education"
    case Org = "organisation"
}
enum HttpStatus : Int {
    case NotFound = 404
    case Success = 200
    case ServerError = 500
}
enum Gender {
    case Male
    case Female
}
enum AgesCategory{
    case Child
    case Teenager
    case Adult
    case Old
}

enum Rainbow {
    case Red
    case Orange
    case Yellow
    case Green
    case LightBlue
    case Blue
    case Purple
}

var color = Rainbow.Purple

switch color {
case .Blue:
    print("blue sky")
case .Purple:
    print("Purple house")
case .Green:
    print("green garden")
case .LightBlue:
    print("light blue")
case .Orange:
    print("Orange fruit")
case .Red:
    print("redsound")
case .Yellow:
    print("yellow sun")
}

enum Score : String {
    case A = "Отлично"
    case B = "Хорошо"
    case C = "Удовлетворительно"
    case D = "Плохо"
    case E = "Неудовлетворительно"
}

func getScore(score : Score){
    switch score{
    case .A:
        print(5)
    case .B:
        print(4)
    case .C:
        print(3)
    case .D:
        print(2)
    case .E:
        print(1)
    }
}
getScore(score: .C)

enum CarType{
    case Lada(kg: Int)
    case Mazda(kg: Int)
    case Jeep(kg: Int)
}

func identifyCar(carType: CarType){
    switch carType{
    case .Jeep(let weight) where weight > 4000:
        print("Это очень тяжелый Джип весом в \(weight) кг.")
    case .Jeep(let weight):
        print("Джип в гараже весом в \(weight) кг.")
    case .Mazda(let weight) where weight < 500:
        print("Это Мазда велосипед весом в \(weight) кг.")
    case .Mazda(let weight) where weight > 2000:
        print("Стандартная Мазда в гараже весом в \(weight) кг.")
    case .Lada(let weight) where weight == 10000:
        print("Ошибка. По весу транспорта определено, что это Камаз. Вес \(weight) кг.")
    case .Lada(let weight):
        print("Это обычная лада весом \(weight) кг.")
    default:
        print("Неидентифицированно")
        break
    }
}
identifyCar(carType: .Lada(kg: 10000))

identifyCar(carType: .Lada(kg: 100))
