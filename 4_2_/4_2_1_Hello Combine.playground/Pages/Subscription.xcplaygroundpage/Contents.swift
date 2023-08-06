//: [Previous](@previous)

import Foundation
import Combine

// PassthorughSubject<OutputType, FailureType>()
let subject = PassthroughSubject<String, Never>()

// The print() operator prints you all lifecycle events
let subscription = subject
    .print("[Debug]")
    .sink { value in
    print("Subscriber received value: \(value)")
}

subject.send("Hello")
subject.send("Hello again!")
subject.send("Hello for the last time!")

subject.send(completion: .finished)
// subscription을 통해서 publisher와 subsciber의 연결을 해지함
/*
1. publisher에 .finished 명령을 보내 해지하는 방법
subject.send(completion: .finished)
2. subscription의 직접 해지
subscription.cancel()
*/
subject.send("Hello?? :(")

//: [Next](@next)
