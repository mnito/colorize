public extension String {

  public func hasPrefix(prefix: String) -> Bool {
    var index = prefix.characters.startIndex
    guard self.characters.count > prefix.characters.count else {
      return false
    }
    for character in prefix.characters {
      if self.characters[index] != character {
        return false
      }
      index = index.advancedBy(1)
    }
    return true
  }
}
