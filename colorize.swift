public enum ConsoleColor: Int
{
    case Black = 30, Red, Green, Yellow, Blue, Magenta, Cyan, White
    case Default = 39
}

public extension String {
    
    private func escape(s: String) -> String {
        return "\u{001B}[0;\(s)m"
    }
    
    private func escape(x: Int) -> String {
        return escape(String(x))
    }

    private func escape(color: ConsoleColor) -> String {
        return escape(color.rawValue)
    }

    public func colorize(color: ConsoleColor) -> String {
        return escape(color) + self + escape(ConsoleColor.Default)
    }

    public func colorize(r : Int, g : Int, b: Int) -> String {
        return escape("38;2;\(r);\(g);\(b)") + self + escape(ConsoleColor.Default)
    }

    public func colorize(index: Int) -> String {
        return escape("38;5;\(index)") + self + escape(ConsoleColor.Default)
    }

    public func inRed() -> String { return colorize(ConsoleColor.Red) }
    public func inGreen() -> String { return colorize(ConsoleColor.Green) }
    public func inYellow() -> String { return colorize(ConsoleColor.Yellow) }
    public func inBlue() -> String { return colorize(ConsoleColor.Blue) }
    public func inMagenta() -> String { return colorize(ConsoleColor.Magenta) }
    public func inCyan() -> String { return colorize(ConsoleColor.Cyan) }
    public func White() -> String { return colorize(ConsoleColor.White) }
}
