Dispatch
=========

Server-side
-------------

To create a dyanmically-dispatched instance, conform it to the :protocol:`Callable` protocol

.. autoprotocol:: Callable
    :members:

.. autoprotocol:: Selector
    :members:


Example
+++++++

.. code-block:: swift

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

Client-side
------------

To call a method on a dynamically-dispatched instance, use the :method:`call` function

.. autoextension:: Callable
    :members:

Example
+++++++

.. code-block:: swift

    let a: Int? = try! MyInstance().call("foo" as StringSelector, input: nil)

    
