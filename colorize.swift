public enum ConsoleColor: Int {
    case Black = 30, Red, Green, Yellow, Blue, Magenta, Cyan, White
    case BrightBlack = 90, BrightRed, BrightGreen, BrightYellow, 
            BrightBlue, BrightMagenta, BrightCyan, BrightWhite
    case Default = 39
}

public struct RGB
{
    init(r: Int, g: Int, b: Int) {
        self.r = r
        self.g = g
        self.b = b
    }
    var r: Int = 0
    var g: Int = 0
    var b: Int = 0
}

public extension String {
    
    private func escape(s: String) -> String {
        return "\u{001B}[0;\(s)m"
    }

    public func hasPrefix(prefix: String) -> Bool {
        var index = prefix.characters.startIndex
        guard self.characters.count > prefix.characters.count else {
            return false
        }
        for character in prefix.characters {
            if  self.characters[index] != character {
                return false
            }
            index = index.advancedBy(1)
        }
        return true
    }

    public func positionOf(c: Character) -> Index {
        var i = 0
        for character in self.characters {
           if character == c {
               break
           }
           i += 1
        }
        return self.startIndex.advancedBy(i)
    }

    private func hasEscapePrefix() -> Bool {
        return self.hasPrefix("\u{001B}[0;")
    }

    private mutating func addEscapeCode(code: String) -> String {
        if self.hasEscapePrefix() {
            return self.escape(code) + self.appendDefault()
        }
        insertContentsOf(code.characters, at: positionOf(Character("m")))
        return self
    }

    private func appendDefault() -> String {
        return self + escape(String(ConsoleColor.Default.rawValue))
    }

    public func colorize(color: ConsoleColor) -> String {
        return escape(String(color.rawValue)) + self.appendDefault()
    }

    public func colorize(r: Int, g: Int, b: Int) -> String {
        return escape("38;2;\(r);\(g);\(b)") + self.appendDefault()
    }

    public func colorize(rgb: RGB) -> String {
        return colorize(rgb.r, g: rgb.g, b: rgb.b)
    }
    
    public func colorize(index: Int) -> String {
        return escape("38;5;\(index)") + self.appendDefault()
    }

    public func highlight(color: ConsoleColor) -> String {
        return escape(String(color.rawValue + 10))
    }

    public func highlight(index: Int) -> String {
        return escape("38;5\(index)") + self.appendDefault()
    }

    public func highlight(r: Int, g: Int, b: Int) -> String {
        return escape("48;2;\(r);\(g);\(b)") + self.appendDefault()
    }

    public func highlight(rgb: RGB) -> String {
        return highlight(rgb.r, g: rgb.g, b: rgb.b)
    }

    public func colorize(text: RGB, highlight: RGB) -> String {
        return ""
    }

    public func inRed() -> String {
        return colorize(ConsoleColor.Red)
    }

    public func inGreen() -> String {
        return colorize(ConsoleColor.Green)
    }

    public func inYellow() -> String {
        return colorize(ConsoleColor.Yellow)
    }

    public func inBlue() -> String {
        return colorize(ConsoleColor.Blue)
    }

    public func inMagenta() -> String {
        return colorize(ConsoleColor.Magenta)
    }

    public func inCyan() -> String { 
        return colorize(ConsoleColor.Cyan)
    }

    public func White() -> String {
        return colorize(ConsoleColor.White)
    }
}
