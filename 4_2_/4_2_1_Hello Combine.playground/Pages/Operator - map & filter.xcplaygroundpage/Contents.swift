//: [Previous](@previous)

import Foundation
import Combine

// Transform - Map
let numPublisher = PassthroughSubject<Int, Never>()
let subscription1 = numPublisher
    .map { $0 * 2 }
    .sink { value in
        print("Transformed value: \(value)")
    }

numPublisher.send(3)
numPublisher.send(6)
numPublisher.send(9)
subscription1.cancel()

// Filter
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
    .filter { $0.contains("a") }
    .sink { value in
        print("Transformed string: \(value)")
    }

stringPublisher.send("abs")
stringPublisher.send("Jack")
stringPublisher.send("Teb")
stringPublisher.send("Foot")
subscription2.cancel()

//: [Next](@next)
