public extension String {

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
}
