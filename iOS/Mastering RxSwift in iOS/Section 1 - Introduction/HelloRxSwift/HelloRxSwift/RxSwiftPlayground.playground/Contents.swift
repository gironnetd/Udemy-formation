import UIKit
import RxSwift
import RxCocoa

var str = "Hello, playground"

let observable = Observable.of([1,2,3,4,5])

let observable2 = Observable.from([1,2,3,4,5])



observable2.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

observable.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

observable2.subscribe(onNext: { element in
    print(element)
})
