import Foundation
import Combine

// PassthroughSubject

let relay = PassthroughSubject<String, Never>()
let subscription1 = relay.sink { value in
    print("Subscription1 received value: \(value)")
}

relay.send("Hello, ")
relay.send("World!")

// CurrentValueSubject

let variable = CurrentValueSubject<String, Never>("")

variable.send("Initial text")

// 들고 있는 값을 먼저 실행하고 새로운 값을 받아들임

let subscription2 = variable.sink { value in
    print("Subscription2 received value: \(value)")
}

variable.send("More text")
print("Variable value: \(variable.value)")



let publisher = ["Here", "we", "go"].publisher

// send를 한 것과 동일한 결과를 얻을 수 있음
publisher.subscribe(relay)
