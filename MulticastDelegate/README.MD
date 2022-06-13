//EXAMPLE OF USAGE:

protocol DelegatesProtocol {
    func delegateMethod()
}

 var delegate:MulticastDelegate<DelegatesProtocol> = .init()
 thisObject.delegate.add(SomeObject)
 self.delegate.invoke({$0.delegateMethod()})