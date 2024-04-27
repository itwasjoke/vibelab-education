
let arr = ["eturn", "frontend", "backend", "ios", "Android"]

var newArr = arr.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1<s2
})
var newArrReversed = arr.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1>s2
})

var newArrLettersSort = arr.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1.count<s2.count
})
let a = [
    2 : "aa",
    3 : "aaa",
    4 : "aaaa"
]
func getElement(key : Int){
    print(a[key]!)
}
getElement(key:3)

func printArray(arrInt: Array<Int>, arrString: Array<String>){
    var aInt = arrInt;
    var aStr = arrString;
    if (arrInt.isEmpty){
        aInt.append(0)
    }
    if (arrString.isEmpty){
        aStr.append(" ")
    }
    print(aInt)
    print(aStr)
}
var arr1 = [4,5]
var arr2 : Array<String> = []

printArray(arrInt: arr1, arrString: arr2)

arr1 = []
arr2 = []

printArray(arrInt: arr1, arrString: arr2)

arr1 = []
arr2 = ["f", "g"]

printArray(arrInt: arr1, arrString: arr2)

arr1 = [4, 5]
arr2 = ["f", "g"]

printArray(arrInt: arr1, arrString: arr2)
