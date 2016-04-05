public enum ConsoleColor: Int
{
    case Black = 30, Red, Green, Yellow, Blue, Magenta, Cyan, White
    case Default = 39
}

public extension String {
    
    private func escape(color: ConsoleColor) -> String {
        return "\u{001B}[0;\(color.rawValue)m"
    }

    public func colorize(color: ConsoleColor) -> String {
        return escape(color) + self + escape(ConsoleColor.Default)
    }

    public func inRed() -> String { return colorize(ConsoleColor.Red) }
    public func inGreen() -> String { return colorize(ConsoleColor.Green) }
    public func inYellow() -> String { return colorize(ConsoleColor.Yellow) }
    public func inBlue() -> String { return colorize(ConsoleColor.Blue) }
    public func inMagenta() -> String { return colorize(ConsoleColor.Magenta) }
    public func inCyan() -> String { return colorize(ConsoleColor.Cyan) }
    public func White() -> String { return colorize(ConsoleColor.White) }
}

