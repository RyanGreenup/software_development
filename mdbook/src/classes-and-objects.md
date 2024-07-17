# Object Oriented Concepts: Classes and Objects

## Constructors and Destructors

A class uses a constructor to build itself, for example in Python a Car class would have a constructor:

```python
class Car:
    def __init__(self, make, model, year):
        self.make = make
        self.model = model
        self.year = year
        self.odometer_reading = 0

    def get_descriptive_name(self):
        long_name = f"{self.year} {self.make} {self.model}"
        return long_name.title()

my_car = Car('audi', 'a4', 2021)
print(my_car.get_descriptive_name())
```

A destructor is used to clean up anything that was set up by the class. This isn't common in Python as the language is garbage collected, meaning the interpreter systematically stops to manage and clean up memory, this technique is common and implemented by languages including, e.g., Go, JavaScript and Java.

In Python, destructors are not used often as often as they are in other languages like C++ because Python is garbage collected. When there are no reference to an object, python frees the memory with the garbage collector [^1721043357] . A destructor in Python is a method that is called when a class is about to be destroyed or garbage collected. This is implemented by the `__del__()` method.

[^1721043357]: This needen't be complex either, reference counting involves counting the number of references and freeing the memory when it hits 0.



```python
del my_car
```

Python will call the `my_car.__del__()` method, this will also be called when the variable goes out of scope and is picked up by the garbage collector.


In this example, when `my_object` is created, Python calls the class constructor (`__init__`). When we delete `my_object` with `del` or when it goes out of scope (like at the end of our program), Python will call the destructor (`__del__`) before the object gets destroyed. However, the `__del__()` method will not be called immediately after an object is out of scope, Python's garbage collector will trigger the `__del__()` method when it sees fit.

```python
class ExampleClass:
    def __init__(self):
        print('Creating object with class ExampleClass')

    # Destructor method
    def __del__(self):
        print('Destructor called, object is about to be destroyed.')

# Creating an instance of the class
my_object = ExampleClass()

# This line will print "Destructor called, object is about to be destroyed"
# because my_object's reference count reaches zero
del my_object
```

Destructors are more common in languages like C++, e.g.:

```cpp
#include <iostream>

// Define a class that holds some data
class ExampleClass {
public:
    int data;

    // Constructor to initialize the object
    ExampleClass(int d) : data(d) {}

    // Destructor to clean up resources
    ~ExampleClass() {
        std::cout << "Destructing an ExampleClass. The data was: " << data << std::endl;
    }
};

int main() {
    // Create an instance of the class
    ExampleClass example(42);

    std::cout << "Before destruction" << std::endl;

    // 'example' goes out of scope here, so its destructor will be called automatically
    return 0;
}
```

```
Before destruction
Destructing an ExampleClass. The data was: 42
```


In this example the `ExampleClass` holds integer `data` and the constructor initializes the `data` member when a new object is created. The destructor,  `~ExampleClass()`, is called automatically when the object goes out of scope (in this case after `main()`). The method simply prints a message but could be used to free memory that was allocated by the developer, e.g. for an array.

Note the use of `std::cout << "some text"` (part of the `iostream.h` library, this is an alternative to `pritnf("Some text");` part of the `<stdio.h>` library.

Languages like C, C++ and Zig require the developer to manage memory, this is more performant but a source of mistakes which lead to unintended behaviour (i.e. bugs) and security vulnerabilities.

Rust, a language we will be using in this subject, takes a different approach. Instead of requiring the user to manage memory or using a garbage collector, a set of rules are used and checked for at compile time to ensure the program is memory safe. These rules, referred to as borrow checking, are similar to an approach called RAII in C++ and ensure that memory is handled correctly. This is not free though, this pattern of programming does restrict the developer from approaches that are memory safe but outside that pattern of development. We will be using Rust in this subject to teach compiled strongly typed development and to contrast the different implementation of OOP compared to Python. Rust has an easier development toolchain and, pedagogically speaking, is a better language to start out with. Students will need to learn C++ first, but for now use Python and Rust to develop solid foundation before dealing with the additional complexities of C++.

In Rust, destructors are implemented via the `Drop` trait. However, Rust's borrow checker minimizes the need for explicit destructors because objects are automatically deallocated when they fall out of scope. In idiomatic Rust, it is rare reach for a destructor.

```rust
// Define a struct that holds some data
struct ExampleStruct {
    data: Box<i32>,
}

// Implement the Drop trait for our struct to define custom cleanup behavior
impl Drop for ExampleStruct {
    fn drop(&mut self) {
        println!("Dropping an ExampleStruct. The data was: {}", *self.data);
    }
}

fn main() {
    // Create an instance of the struct
    let example = ExampleStruct { data: Box::new(42) };

    println!("Before dropping");

    // The example variable falls out of scope here, so its destructor will be called automatically
}
```

