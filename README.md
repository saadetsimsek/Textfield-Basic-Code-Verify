# Code Verification Field

*A one time code input where focus moves correctly on typing, pasting and deleting.*

![Swift](https://img.shields.io/badge/Swift-5.0-F05138?style=flat-square&logo=swift&logoColor=white) ![UIKit](https://img.shields.io/badge/UIKit-2396F3?style=flat-square&logo=uikit&logoColor=white) ![iOS](https://img.shields.io/badge/iOS-17.5%2B-000000?style=flat-square&logo=apple&logoColor=white) ![Architecture](https://img.shields.io/badge/pattern-delegate%20protocols-6366F1?style=flat-square) ![Dependencies](https://img.shields.io/badge/dependencies-none-16A34A?style=flat-square)

## Overview

Six separate boxes that behave as a single field. This looks trivial until backspace is pressed on an
empty box, at which point the naive implementation does nothing because `UITextField` never reports a
deletion from an empty field.

## Focus movement

```mermaid
flowchart TD
    VIEW["VerifyView<br/>owns the field row"] --> F1["VerifyTextField 1"]
    VIEW --> F2["VerifyTextField 2"]
    VIEW --> F3["VerifyTextField n"]
    F1 --> P1["FieldsProtocol<br/>activeNextField(tag:)<br/>activePreviousFields(tag:)"]
    P1 --> VIEW
    F1 --> DEL["override deleteBackward()"]
    DEL --> P1
    VIEW --> CODE["getFieldsCode()"]
    CODE --> VP["VerifyProtocol.verify()"]
    VP --> VC["ViewController"]
    VC --> ALERT["ViewController+Extensions<br/>showAlert()"]
```

## Why deleteBackward matters

```mermaid
sequenceDiagram
    participant U as User
    participant F as VerifyTextField
    participant V as VerifyView

    U->>F: types a digit
    F->>F: shouldChangeCharactersIn replaces the content
    F->>V: activeNextField(tag)
    V->>V: make the next field first responder

    U->>F: presses backspace on an empty field
    Note over F: shouldChangeCharactersIn is not called
    F->>F: deleteBackward() override fires
    F->>V: activePreviousFields(tag)
    V->>V: move focus back and clear
```

Overriding `deleteBackward` is the only reliable hook for a backspace on an empty field, and it is the
difference between a code input that feels native and one that traps the user.

## Implementation notes

- **Two protocols, two directions.** `FieldsProtocol` carries field events upward to the view,
  `VerifyProtocol` carries the completed code up to the controller. Neither side holds a concrete type.
- **Tags for ordering.** Each field carries its index as a tag, so the view can compute the neighbour
  without keeping a separate array lookup.
- **Single character enforcement.** `shouldChangeCharactersIn` replaces rather than appends, so a fast
  typist cannot leave two digits in one box.
- **The code assembled on demand.** `getFieldsCode()` joins the field values only when verification is
  requested, so there is no duplicated state to keep in sync.

## Project structure

```
BasicCodeVerify/
├── Views/        VerifyTextField, VerifyView
├── Controllers/  ViewController, SecondViewController
└── Extensions/   ViewController+Extensions
```

## Requirements

Xcode 15 or later, iOS 17.5 or later. No external dependencies.
