# Introduction to Golang

## How Go Execute

![alt text](<Screenshot 2026-01-15 192459.png>)

## Memory Layout

![alt text](<Screenshot 2026-01-15 192630.png>)

## First Go Program

A simple Hello World example demonstrating basic Go syntax:

```go
package main

import "fmt"

func main() {
    fmt.Println("Hello World!")
}
```

**Key Points:**

- `package main` declares this as an executable program
- `import "fmt"` includes the formatting package
- `func main()` is the entry point
- `fmt.Println()` outputs text to the console

## Variable and Data Types

![alt text](<Screenshot 2026-01-15 194141.png>)

### Variable Declaration

Go supports multiple ways to declare variables:

```go
package main

import "fmt"

// Explicit type declaration
var name string = "Mirza Mohibul Hasan"

// Type inference
var username = "refat"

// Zero value initialization
var age int

func main() {
    // Short declaration (inside functions only)
    student_id := 190119

    fmt.Println("Username: ", username)
    fmt.Println("Name: ", name)
    fmt.Println("Age: ", age)
    fmt.Println("Student ID: ", student_id)
}
```

**Key Points:**

- `var` declares variables with explicit or inferred types
- Zero values: `0` for int, `""` for string, `false` for bool
- `:=` short declaration operator (functions only, no `var` keyword)
- Variable names should be descriptive (use camelCase, avoid underscores)

### Scope

![alt text](<Screenshot 2026-01-15 200032.png>)
![alt text](<Screenshot 2026-01-15 200403.png>)

## Functions

### Named Functions

```go
package main

import "fmt"

func calc(a int, b int) (int, int) {
    sum := a + b
    mul := a * b
    return sum, mul
}

func main() {
    n1, n2 := 10, 20
    sum, mul := calc(n1, n2)
    fmt.Println(sum, mul)
}
```

**Key Points:**

- Multiple return values supported
- Parameters with same type can be grouped: `(a, b int)`
- Return types listed in parentheses

### Init Function

```go
package main

import "fmt"

func init() {
    fmt.Println("Runs automatically before main()")
}

func main() {
    fmt.Println("Main execution")
}
```

**Key Points:**

- Executes automatically before `main()`
- Useful for initialization logic
- No parameters or return values

### Anonymous Functions

```go
package main

import "fmt"

func main() {
    add := func(a, b int) int {
        return a + b
    }
    fmt.Println(add(3, 2))
}
```

**Key Points:**

- Functions assigned to variables
- Can be called immediately or stored for later use

## Output Functions (fmt.Print vs fmt.Println vs fmt.Printf)

Go provides several functions for output, each with different purposes:

```go
package main

import "fmt"

func main() {
    // fmt.Print() - outputs without newline
    fmt.Print("Hello")
    fmt.Print(" World")  // prints on same line

    // fmt.Println() - outputs with newline
    fmt.Println("Hello World")  // newline at end
    fmt.Println("Next line")

    // fmt.Printf() - formatted output (no newline)
    name := "Mirza"
    age := 25
    fmt.Printf("Name: %s, Age: %d\n", name, age)
}
```

**Key Points:**

- `fmt.Print()` outputs text without trailing newline
- `fmt.Println()` outputs text with newline (preferred for most cases)
- `fmt.Printf()` allows formatted output using format specifiers:
  - `%s` for strings
  - `%d` for integers
  - `%f` for floats
  - `%v` for any value
  - `\n` for newline in Printf
