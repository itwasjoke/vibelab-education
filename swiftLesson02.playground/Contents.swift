// 1

print("Целое максимальное ", Int.max)
print("Целое минимальное ", Int.min)

print("Целое 8 бит со знаком максимальное ", Int8.max)
print("Целое 8 бит со знаком минимальное ", Int8.min)

print("Целое 8 бит максимальное ", UInt8.max)
print("Целое минимальное ", UInt8.min)

print("Целое 16 бит со знаком максимальное ", Int16.max)
print("Целое 16 бит со знаком минимальное ", Int16.min)

print("Целое 16 бит максимальное ", UInt16.max)
print("Целое 16 бит минимальное ", UInt16.min)

print("Целое 32 бит со знаком максимальное ", Int32.max)
print("Целое 32 бит со знаком минимальное ", Int32.min)

print("Целое 32 бит максимальное ", UInt32.max)
print("Целое 32 бит минимальное ", UInt32.min)

print("Целое 64 бит со знаком максимальное ", Int64.max)
print("Целое 64 бит со знаком минимальное ", Int64.min)

print("Целое 64 бит максимальное ", UInt64.max)
print("Целое 64 бит минимальное ", UInt64.min)

// 2

let a1 = 3
let b1 = 3.4
let c1 : Float = 3.4

let a2 = a1 + Int(b1) + Int(c1)
let b2 = Double(a1) + b1 + Double(c1)
let c3 = Float(a1) + Float(b1) + c1


if Double(a2) < b2 {
    print("Int smaller")
}
else{
    print("Int bigger")
}
