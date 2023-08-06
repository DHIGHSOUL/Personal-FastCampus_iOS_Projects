//: [Previous](@previous)

import Foundation
import Combine

let arrayPublisher = [1, 2, 3].publisher

let queue = DispatchQueue(label: "custom")

let subscription = arrayPublisher
    .subscribe(on: queue)
    .map { value -> Int in
        print("Transform: \(value), thread: \(Thread.current)")
        return value
    }
    // 여기에서부터 main thread(threa number 1)을 사용하게 됨
    // main thread는 무거운 작업을 구동하고 있는 스레드이기 때문에, 백그라운드에서 돌아가도 되는 작업들은 다른 스레드에서 진행하도록 함
    .receive(on: DispatchQueue.main)
    .sink { value in
    print("Received value: \(value), thread: \(Thread.current)")
}

//: [Next](@next)
