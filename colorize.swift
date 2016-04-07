public extension String {

  private func escape(s: String) -> String {
    return "\u{001B}[0;\(s)m"
  }

  private func hasEscapePrefix() -> Bool {
    return self.hasPrefix("\u{001B}[0;")
  }

  private func appendDefault() -> String {
    return self + escape(String(Color.Default.rawValue))
  }

  private func addEscapeCode(code: String) -> String {
    if !self.hasEscapePrefix() {
      return escape(code) + self.appendDefault()
    }
    var newStr = self
    let characters = (";" + code).characters
    newStr.insertContentsOf(characters, at: positionOf(Character("m")))
    return newStr
  }

  public func colorize(color: Color) -> String {
    return addEscapeCode(String(color.rawValue))
  }

  public func colorize(r: Int, g: Int, b: Int) -> String {
    return addEscapeCode("38;2;\(r);\(g);\(b)")
  }

  public func colorize(rgb: RGB) -> String {
    return colorize(rgb.r, g: rgb.g, b: rgb.b)
  }

  public func colorize(index: Int) -> String {
    return addEscapeCode("38;5;\(index)")
  }

  public func highlight(color: Color) -> String {
    return addEscapeCode(String(color.rawValue + 10))
  }

  public func highlight(index: Int) -> String {
    return addEscapeCode("48;5\(index)")
  }

  public func highlight(r: Int, g: Int, b: Int) -> String {
    return addEscapeCode("48;2;\(r);\(g);\(b)")
  }

  public func highlight(rgb: RGB) -> String {
    return highlight(rgb.r, g: rgb.g, b: rgb.b)
  }

  public func embolden() -> String {
    return addEscapeCode("1")
  }

  public func underline() -> String {
    return addEscapeCode("4")
  }
}
