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

import pianissimo
print(pianissimo.legalTexts)
precondition(pianissimo.legalTexts == ["pianissimo\n© 2016 Drew Crawford.\nhttps://code.sealedabstract.com/drewcrawford/pianissimo"])
    
//this sample taken from dispatch.rst

private enum Selectors : String, Selector {
    case foo = "foo"
}
private struct MyInstance: Callable {
    var selectors: [Selector] { return [Selectors.foo] }
    func _call(_ selector: Selector, input: Any?) -> Any? {
        if selector == Selectors.foo {
            return 23
        }
        return nil
    }
}

let a: Int? = try! MyInstance().call("foo" as StringSelector, input: nil)