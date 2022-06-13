import Foundation


final class MulticastDelegate<T> {
    private let delegates: NSHashTable<AnyObject> = NSHashTable.weakObjects()
}

extension MulticastDelegate {
    func add(_ delegate: T) {
        delegates.add(delegate as AnyObject)
    }

    func remove(_ delegateToRemove: T) {
        for delegate in delegates.allObjects.reversed() {
            if delegate === delegateToRemove as AnyObject {
                delegates.remove(delegate)
            }
        }
    }

    func invoke(_ invocation: (T) -> Void) {
        for delegate in delegates.allObjects.reversed() {
            invocation(delegate as! T)
        }
    }

    @MainActor func invokeOnMain(_ invocation: @escaping (T) -> Void) {
        for delegate in self.delegates.allObjects.reversed() {
            invocation(delegate as! T)
        }
    }

    func coun() -> Int {
        return delegates.count
    }
}
