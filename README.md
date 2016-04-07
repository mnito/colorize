# Colorize String Extension

Colorize is a Swift String extension dedicated to adding wonderful colors to your words when displayed in a compatible terminal!

##Use

#### You can set the text color

```swift
"foo".colorize(Color.Green)
"foo".colorize(59, g: 193, b: 237)
"foo".colorize(RGB(r: 245, g: 5, b: 93))
"foo".colorize(23)
```

#### or highlight the text

```swift
"bar".highlight(Color.Green)
"bar".highlight(59, g: 22, b: 145)
"bar".highlight(RGB(r: 254, g: 254, b: 93))
"bar".highlight(31)
```

#### or even do both.

```swift
"foobar".highlight(Color.Magenta).colorize(RGB(r: 245, g: 101, b: 5))
```

#### Concatenation!

```swift
"foo".highlight(Color.Black).colorize(Color.BrightYellow) + "bar".colorize(255, g: 0, b: 0).highlight(Color.White)
```

As you can see, there are many ways to colorize and highlight a string including an RGB struct or raw rgb values, a color 
index from 0-255, or a color from the Color enumeration.

#### Also included are two bonus methods...

```swift
"baz".embolden()
"baz".underline()
```

You can mix and match these with each other along with highlight and colorize!

## License

Colorize is released  under the MIT license.

## Author

Michael P. Nitowski <[mpnitowski@gmail.com](mailto:mpnitowski@gmail.com)> 
    (Twitter: [@mikenitowski](https://twitter.com/mikenitowski))
