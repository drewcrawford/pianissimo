Registration
============

To register a value with pianissimo, call the register function.

.. autoextension:: pianissimo
    :raw-members: register(_ type: Any/ name: String)
    :only-with-raw-members: register(_ type: Any/ name: String)

.. code-block:: swift
    
    pianissimo.register(MyType(), "MyLibrary.MyType")

Once registered, the value can be retrieved by name:

.. autoextension:: pianissimo
    :members: registeredTypes
    :only-with-members: registeredTypes

.. code-block:: swift

    pianissimo.registeredTypes["MyLibrary.MyType"] // MyType instance

To list all values that respond to a selector, use

.. autoextension:: pianissimo
    :raw-members: types(respondingTo selector
    :only-with-raw-members: types(respondingTo selector


