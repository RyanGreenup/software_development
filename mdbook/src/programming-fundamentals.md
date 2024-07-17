# Programming Fundamentals

- Introduction to Python
- Introduction to Rust


- Types
- IO
- Functions
- Classes
- Inheritance

## Tasks
### Readings

Students are required to read the following:

- https://docs.python.org/3/tutorial/index.html
- https://doc.rust-lang.org/book/

### Exercises

Some questions are included in this book, however, students are required to generate and answer 8 questions from each document (try using [this prompt from Fabric](https://github.com/danielmiessler/fabric/tree/main/patterns/create_quiz) combined with exemplar questions) Students will be ask to justify why they chose the questions they did and whether or not they believe they capture the important components of what they did

### Remarks

You will not be able to complete both books within the week, you are encouraged to skim over the documentation and refer back to it as you get stuck.

Each time you refer back to the documentation, you should write a note in your notes about what you were looking for and why you were looking for it and include a MWE and a set of answered quiz questions using the above approach. This will help you to remember where to find the information in the future.

## Topics

1. Language Introduction
   - Brief history and design philosophy
2. Basics
   - Variables, Expressions, and Statements
   - Data types: Numbers, Strings, Lists
   - Control Flow (if, for, while) and Iterators
3. Functions and Modules
   - Defining and Using Functions
   - Modules and Importing
   - File I/O (reading, writing)
4. Data Structures
   - Lists methods
   - Dictionaries and Tuples
   - Sets and Frozensets
   - Comprehensions
5. Basic Object-Oriented Programming
   - Defining Classes, Methods, and Objects
6. Exception Handling
   - try, except, else, finally
7. Standard Library
   - os, sys, and path modules
   - datetime and math modules
   - collections and itertools modules
8. Packages Overview
   - Numpy
   - Pandas
   - Matplotlib
9. Q & A and Wrap-up

## Programming Basics

### Language Introduction
Python is a high level interpreted scripting language that was firs released in 1991. Python's design is concerned with readability and ease of use. It has a dynamic type system, garbage collector and is interpreted with a large standard library, as a software developer this is your swiss army knife and duct tape, you'll typically reach for it first before you change gears into a into a language that is more suitable for the problem.

In terms of error handling, Python uses exceptions and takes the philosophy that a user should "ask for forgiveness, not permission". This means that it is better to try something and catch the error than to check if it is possible before trying. One reason for this philosophy is that the state of a system may change after checking and then leaping, a disadvantage is that developers may forget to handle errors.

In terms of OOP, Python does not have access modifiers like public, private and protected, instead the language takes the philosophy that "We are all adults here" and denotes class attributes that **should** be private with a leading `_` underscore. It has also become convention to denote attributes assigned after construction with a trailing `_`.

### Rust Introduction
Rust is a lower level statically-typed compiled language with lots of helpful zero-cost abstraction and a focus on memory safety and performance. Unlike Python Rust does not use a garbage collector, instead borrowing and moving is used to manage memory. This means that Rust is a lot faster than Python, but also more difficult to write.

Rust can be a good compliment to Python as it is more accessible than C or C++, has excellent documentation, a vibrant community and is often used when Python is too slow.

In terms of error handling, rust functions return a `Result` type which is either `Ok` or `Err`, a developer is required to check this and handle the error, every time. This is the exact opposite of Python's philosophy.

Rust implements OOP in a way very different from python, it refers to classes as structs and methods implementations ( `impl`), Unlike Python, all struct attributes are private by default and must be explicitly marked as public. Again, the opposite of python. The implementation of inheritance is the most different feature, we'll refer you to *Rust Book* for more information on that.

### Basics

The following example shows an example of variables and control flow in Rust, try this on your machine right now:


```rust
let x = 6;      // x cannot be changed
let mut y = 7;  // y can be changed
y = 4;          // this is fine
```

```rust
// This x_vec cannot be changed as we didn't use mut
let x_vec: Vec<i32> = vec![1, 2, 3, 4, 5];

// These braces create a new scope
{
    // This is another variable called x_vec that obscures the first
    let x_vec: Vec<i32> = vec![6, 7, 8, 9, 10];
    println!(x_vec); // This will print the second x_vec
}

println!(x_vec); // This will print the first as the second is out of scope
```

In python there are mutible and immutable types, this doesn't mean you can't change the value of a variable, rather, it means that a copy of that variable is made when it is passed to a function  or method. It's immutable in the sense that the underlying data cannot be changed but is instead overwritten. Simple types like `int` and `float` are copied into a function (immutable) but aggregate types like `list` and `dict` are passed by reference (mutable), meaning the function will change the outside data.

In Rust, mutability via the `mut` keyword changes a variable from read only to read/write, so in practice it has a different meaning for the developer. However, a similar concept is at play for aggregate types like `Vec<>` and `HashMap<>`,  these types are neither copied into a function or passed by reference, they are physically moved  into that function and access to the is lost. In addition Rust can also copy into a function by using the `.clone()` method and pass by reference by using `&` and `*` symbols


When a variable is sent to a function in Rust, it is moved into that function and we no longer have access to it. In Python a link to that variable goes to the function This doesn't happen for simple data types like `int` / `i32` and `float` / `f32` , those are simply copied, but it does happen for `Vec`tors. Similarly in Python, simple types like `int` and `float`

```rust
fn print_sum(som_val: Vec<i32>) {
    total: i32 = som_val.iter().sum()
    println!("{}", total);
}

fn main() {
    // This x_vec cannot be changed as we didn't use mut
    let x_vec: Vec<i32> = vec![1, 2, 3, 4, 5];

    // This x_vec is totally different and hides the first variable name
    let x_vec: Vec<i32> = vec![6, 7, 8, 9, 10];

    // If we print the sum, it will use the second x_vec
    print_sum(x_vec);

    // Now the second x_vec has been moved into print_sum,
    // which that function finished, it deleted all it's variables
    // This is now the first one
    print_sum(x_vec);

    // Now we have no variables in scope so this will fail
    print_sum(x_vec);

}
```

In Python,  a similar example:

```python

def replace_first_val(x_vec: List[int]) -> List[int]:
    x_vec[0] = 6
    return x_vec

def main():
    # Define x_vec
    x_vec: List[int] = [1, 2, 3, 4, 5]

    # x_vec is not copied or moved, it is passed by reference
    replace_first_val(x_vec)

    # This will print the first x_vec
    print(x_vec)

    # [6, 2, 3, 4, 5]
```

In Rust, the `&` symbol must be used to explicitly show the variable is going to change.

```rust
fn replace_first_val(x_vec: &mut Vec<u32>) {
    x_vec[0] = 6;
}

fn main() {
    // Define x_vec
    let mut x_vec: Vec<u32> = vec![1, 2, 3, 4, 5];

    // x_vec is not copied or moved, it is passed by reference
    replace_first_val(&mut x_vec);

    // This will print the first x_vec
    println!("{:?}", x_vec);
    // [6, 2, 3, 4, 5]

    println!("{:?}", &(x_vec.clone()));
}
```

In Rust the `.clone()` method would make a copy and in python `copy.deepcopy()` would be used to make a copy.


If Tests are handled with the `if` keyword in both rust and python:


```rust
let x = 6;
if x % 2 == 0 {
    println!("x is even.");
} else {
    println!("x is odd.");
}

let mut counter = 0;
while counter < 5 {
    println!("{}", counter);
    counter += 1;
}

for num in 1..=5 {
    println!("{}", num);
}
```


```rust
x = 6

if x % 2 == 0:
    print("x is even.")
else:
    print("x is odd.")

counter = 0
while counter < 5:
    print(counter)
    counter += 1

for num in range(1, 6):
    print(num)
```

Enum's are a type that can represent one of several values, this is useful for representing states, e.g. a traffic light. In Rust, enums are defined with the `enum` keyword and in Python they are defined with the `enum` module.

```rust
// Define an enum
enum TrafficLight {
    Red,
    Yellow,
    Green,
}

fn action(light: &TrafficLight) {
    match light {
        TrafficLight::Red => println!("Stop!"),
        TrafficLight::Yellow => println!("Ready!"),
        TrafficLight::Green => println!("Go!"),
    }
}

fn main() {
    // Use the enum in a match statement
    let stop_light = TrafficLight::Red;
    action(&stop_light);
    // Outputs: Stop!
}
```


```python
from enum import Enum

class TrafficLight(Enum):
    Red = "Stop!"
    Yellow = "Stop if Able"
    Green = "Go!"

def action(light: TrafficLight):
    match light:
        case TrafficLight.Red:
            print(light.value)
        case TrafficLight.Yellow:
            print(light.value)
        case TrafficLight.Green:
            print(light.value)

def main():
    # Use the enum in a match statement
    stop_light = TrafficLight.Red
    action(stop_light)
    # Outputs: Stop!
```





## Practical

### Practice Questions

Students are encouraged to use Local LLMs (and if necessary proprietary LLMs) to answer these questions. The fundamental goal here is to understand the underlying behaviour of the languages, understand how to use these languages productively and to internalise enough of the language to quickly retrieve that knowledge when needed.


- In Python
    - Create a global variable in python and demonstrate that it is global by changing it inside a function
        - Demonstrate how this can make code easier to read and write
        - Use a class to demonstrate how similar code can be written without a global variable
        - Demonstrate how a bug might arise when refactoring code based on this global variable
        - Recreate that class in Rust
    - Create a function decorator and demonstrate what it acheives.
- In both Python and then Rust:
    - Write a function to return a list of the first three numbers that are equal to their reverse.
    - Write a function to produce $y=x^2 + 3x - \ln x$ for a given for $x = \left\{x| 1 \leq x \leq 30\right\}$
        - First use a loop
        - Then use List comprehension (in Rust this is the `.map` method.
    - Write a function to find the first 1000 *Happy Numbers*
        - A happy number is a number which eventually reaches 1 when replaced by the sum of the square of each digit.
        $$
        \begin{aligned}
        x    &= 19 \\
        82   &= 1^2 + 9^2 \\
        68   &= 8^2 + 2^2 \\
        100  &= 6^2 + 8^2 \\
        1    &= 1^2 + 0^2 + 0^2 \\
        \implies x \text{ is a happy number}
        \end{aligned}
        $$
        - Compare the runtime in both Python and Rust by using `hyperfine`  [^1721195215].
    - Write a program that reads a list of numbers from a file and prints the sum of the numbers
        - Write a test that demonstrates that the program works as expected
    - Write a function, using a loop, to find the first 3 numbers that are palindromes
    - In python create a variable that behaves as pass by reference and another that is pass by value, demonstrate the difference between the two by passing them into a function and checking to see if the value has changed inside and outside the function
        - What is the difference between the two approaches to pointers?
        - Do you prefer the implicit approach taken by Python or the explicit approach taken by Rust?
        - Repeat this in C using a variable length array, what is the difference between Rust and C when it comes to memory management and pointers?
    - Write a function to find the nth Fibonacci Number
        - Rewrite this as a class
    - Create a class in Python that reprents a Note from your filesystem
        - Demonstrate how you would use this class to read and write notes to the filesystem
        - Write a test that demonstrates that the class works as expected
            - This should write some text to a temporary file, read it back in and check that the text is the same
        - Write a class to represent a collection of notes as a dictionary
        - Write a method to convert these notes to a dictionary and cache them back to the filesystem
        - Write a second program that reads the notes from stdin and identifies the most frequent word
            - Use a hasmap to counte the frequency of words
    - After acheiving this in both Python and Rust
        - Describe how Python classes differ from Rust structs
        - Show how a `@classmethod` can be used to create a `New()` and `Default()` method similar to the approach taken in rust.


## Generating Questions

I recommend the prompts by Fabric, they work well and are convenient, try something like this:

The prompts by Fabric can be quite good, however they may produce generic questions that are not great, e.g. consider this example:

```sh
nvim /tmp/file.md && \
cat /tmp/file.md |
    fabric \
        --remoteOllamaServer=http://vale:11434 \
        --model codestral:latest \
        --pattern create_quiz \
        --stream | wl-copy
```

Providing examples to LLMs is a well-known strategy to guide the output, try this prompt in order to generate better questions:


```markdown
\# System
Helpful AI and programming teacher
\# User

Write some questions on the basics of Python that require a practical implentation of code in python to answer.

Here are some example questions:


- Write a program that reads a list of numbers from a file and prints the sum of the numbers
    - Write a test that demonstrates that the program works as expected
- Write a function, using a loop, to find the first 3 numbers that are palindromes
- In python create a variable that behaves as pass by reference and another that is pass by value, demonstrate the difference between the two by passing them into a function and checking to see if the value has changed inside and outside the function
    - What is the difference between the two approaches to pointers?
    - Do you prefer the implicit approach taken by Python or the explicit approach taken by Rust?
    - Repeat this in C using a variable length array, what is the difference between Rust and C when it comes to memory management and pointers?
\# Assistant
- Write a method that reads a string and returns a dictionary that counts how many times each word appears in the string.
    - Write a function that handles special characters and capitalization.
- Write a Python function to calculate the factorial of a number using recursion, prove with a testcase.
- Write a program in Python that identifies prime numbers in the range 1 to 100.
    - Can you improve the efficiency of the program by using the Sieve of Eratosthenes?
- Write a Python method that takes a list of numbers and returns a new list with the numbers in increasing order, but without using the built-in sort function.
    - Write testcases for this method.
- In Python, define a class `Car` with attributes `color` and `speed`. Include methods to accelerate and decelerate the car.
    - Add a `max_speed` attribute and ensure that `speed` can't exceed `max_speed`.
    - Demonstrate with a testcase.
- Write a Python function that calculates the number of lines, words, and characters in a text file, and then demonstrates it with a test.
- Create a Python generator function to print odd numbers in a range.
    - What is the difference between generator functions and normal functions?
    - Can you rewrite this function as a generator comprehension?
- Write a program that uses list comprehension to find all the Pythagorean triplets in a given range.
    - Can you modify the program to print triplets in a specific range?
- Implement a Python program to generate a dictionary that contains the number between 1 and n in the form (x, x*x).
    - Create a testcase and validation for this program.
- Using a Python class, design a queue structure that supports standard operations (add, remove) along with function min which should return the minimum element in the queue.
    - Create testcases for this program.
\# User
```



## Solutions

- [➡️ /Solutions](programming-fundamentals_solutions.md)




        [^1721195215]: [sharkdp/hyperfine: A command-line benchmarking tool](https://github.com/sharkdp/hyperfine)
