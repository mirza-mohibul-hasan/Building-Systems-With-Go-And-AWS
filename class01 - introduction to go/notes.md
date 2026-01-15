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

## Control Flow

### Conditional Statements

#### If-Else

```go
package main

import "fmt"

func main() {
    age := 21

    if age > 20 && age < 30 {
        fmt.Println("Young")
    } else if age < 20 {
        fmt.Println("Kid")
    } else {
        fmt.Println("Old")
    }
}
```

**Key Points:**

- Conditions don't require parentheses
- Use `&&` (AND), `||` (OR), `!` (NOT) operators
- Braces are mandatory

#### Switch Statement

```go
package main

import "fmt"

func main() {
    day := 3

    switch day {
    case 1:
        fmt.Println("Monday")
    case 2:
        fmt.Println("Tuesday")
    case 3:
        fmt.Println("Wednesday")
    default:
        fmt.Println("Unknown day")
    }
}
```

**Key Points:**

- No `break` needed (implicit)
- `default` case executes if no match
- Can use multiple values: `case 1, 2, 3:`

### Loops

#### For Loop

```go
package main

import "fmt"

func main() {
    for i := 0; i < 10; i++ {
        fmt.Println(i)
    }
}
```

#### While Loop (For-based)

```go
package main

import "fmt"

func main() {
    i := 0
    for i < 10 {
        fmt.Println(i)
        i++
    }
}
```

#### Range Loop

```go
package main

import "fmt"

func main() {
    numbers := []int{1, 2, 3, 4, 5}
    for index, value := range numbers {
        fmt.Println(index, value)
    }
}
```

**Key Points:**

- Go has only `for` loops (no `while`)
- Use `range` for iterating collections
- Use `_` to ignore index or value: `for _, value := range numbers`
