#Material Color


Actually "MaterialColor" is a simple framework with defined in code "materialize colors" (for more info see: [material.io](https://material.io/guidelines/style/color.html#)).
Application is made just for demonstration purpose, where you can see all colors with descriptions.

###Quick Start
For using "MaterialColor" all you need is add MaterialColor.swift source file into your project.

###Usage
"MaterialColor" is enumeration with nested enumeration "Tone", for defining needed code just set

```swift
    let redColor = MaterialColor.red(tone: ._100)
```

which means we defined red color with tone 100
For accessing UIColor value there is computed variable color: UIColor, so use:

```swift
    label.backgroundColor = redColor.color
```

For accessing description of color with tone there is variable colorName: String

```swift
    label.text = redColor.colorName
```












