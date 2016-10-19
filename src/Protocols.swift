/*
Copyright 2016 Drew Crawford

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

///Typically, this is an enum with a string raw value
public protocol Selector {
    var rawValue: String { get }
}

func == (lhs: Selector, rhs: Selector) -> Bool { return lhs.rawValue == rhs.rawValue }

///conform to this protocol to allow callers to send you messages
public protocol StaticCallable {
    static var selectors: [Selector] { get }
    static func _call(_ selector: Selector, input: Any?) -> Any?
}

public struct PianissimoStringSelector: Selector, ExpressibleByStringLiteral {
    let string: String
    public init(stringLiteral value: StaticString) {
        self.string = String(describing: value)
    }
    public init(unicodeScalarLiteral value: StaticString) {
        self.init(stringLiteral: value)
    }
    public init(extendedGraphemeClusterLiteral value: StaticString) {
        self.init(stringLiteral: value)
    }
    public var rawValue : String { return string }
}

extension StaticCallable {

    public static func call<Output>(_ selector: Selector, input: Any?) -> Output? {
        return self._call(selector, input: input) as? Output
    }
}