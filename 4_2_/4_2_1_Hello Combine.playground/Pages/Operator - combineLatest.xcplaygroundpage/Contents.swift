//: [Previous](@previous)

import Foundation
import Combine

// CombineLatest와 Merge는 모두 두 개의 publisher를 합치는 것이지만, CombineLatest는 두 개의 output type이 달라도 상관없고, Merge는 반드시 같아야 한다.

// Basic CombineLatest
let stringPublisher = PassthroughSubject<String, Never>()
let numberPublisher = PassthroughSubject<Int, Never>()

/*
Publishers.CombineLatest(stringPublisher, numberPublisher).sink { (str, num) in
    print("Receive: \(str), \(num)")
}
*/
// 위 아래는 같은 방식
stringPublisher.combineLatest(numberPublisher).sink { (str, num) in
    print("Receive: \(str), \(num)")
}

stringPublisher.send("a")
numberPublisher.send(1)
numberPublisher.send(2)
stringPublisher.send("b")
numberPublisher.send(3)
stringPublisher.send("c")
numberPublisher.send(5)

// Advanced CombineLatest
let userNamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validatedCrendentialsSubscription = userNamePublisher.combineLatest(passwordPublisher)
    .map { (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { valid in
        print("Credential valid? : \(valid)")
    }

userNamePublisher.send("jasonLee")
//passwordPublisher.send("weaktwo") // Credential valid : false
passwordPublisher.send("aslkdjajffafasf")

// Merge
let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [6, 7, 8, 9, 10].publisher
// 만약 merge에서 두 개의 publisher output type이 다르면 실행을 할 수 없음

/*
Publishers.Merge(publisher1, publisher2).sink { value in
    print("Merge: subscription received value: \(value)")
}
*/

let mergedPublisher = publisher1.merge(with: publisher2)
    .sink { value in
        print("Merge: subscription received value: \(value)")
    }

//: [Next](@next)
