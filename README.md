# pianissimo

pianissimo is a userspace dynamic runtime for Swift programs.  It allows runtime introspection, dispatch-by-string, weak dependencies, and other dynamic programming patterns in the Swift programming language.

[![Anarchy Tools compatible](https://img.shields.io/badge/Anarchy%20Tools-compatible-4BC51D.svg?style=flat)](http://anarchytools.org) ![License:apache](https://img.shields.io/hexpm/l/plug.svg) ![Swift:3](https://img.shields.io/badge/Swift-3-blue.svg) ![Platform:macOS](https://img.shields.io/badge/Platform-macOS-red.svg) ![Platform:Linux](https://img.shields.io/badge/Platform-Linux-red.svg)

This repository is a mirror of https://code.sealedabstract.com/drewcrawford/pianissimo which is the official home of this project.

# Features

pianissimo supports:

* Dynamic, namespaced lookup of all registered types.  (Swift `_typeByName` only supports reference types)
* Dispatch-by-string

#Limitations

A design limitation of pianissimo is that it only interacts with values that have registered with the runtime.


# Documentation

pianissimo has excellent documentation!  [Read it online](http://pianissimo-docs.sealedabstract.com).

# Mailing list

We use [discuss.sa](http://discuss.sealedabstract.com/c/code-sa/pianissimo)