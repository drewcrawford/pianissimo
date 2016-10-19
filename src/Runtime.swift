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

import Dispatch

private var _registeredTypes: [String: Any.Type] = [:]
private let queue = DispatchQueue(label: "DynamicRuntime.Lock")

extension DynamicRuntime {

    private static func typeName(of: Any.Type) -> String {
      return _typeName(of, qualified: true)
    }

    internal static func _register(_ type: Any.Type) {
      queue.sync {
        _registeredTypes[typeName(of: type)] = type
        print("registering type \(typeName(of: type))")
      }
    }

    public static func register(_ type: Any.Type) {
      let _ = setupOnce
      _register(type)
    }

    public static var registeredTypes: [String: Any.Type] {
      let _ = setupOnce
      var t: [String:Any.Type]! = [:]
      queue.sync {
        t = _registeredTypes
      }
      return t
    }

    public static func typesRespondingTo(staticSelector: Selector) -> [StaticCallable.Type] {
      return registeredTypes.values.flatMap{$0 as? StaticCallable.Type}.filter{$0.selectors.filter{$0 == staticSelector}.count > 0}
    }
}