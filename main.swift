var libName = ""
libName += "C".colorize(Color.Black).highlight(Color.White)
libName += "o".colorize(Color.Red).highlight(Color.BrightBlue)
libName += "l".colorize(59, g: 193, b: 237).highlight(RGB(r: 139, g: 22, b: 145))
libName += "o".highlight(30)
libName += "r".colorize(23)
libName += "i".highlight(Color.Black)
libName += "z".highlight(Color.Magenta).colorize(RGB(r: 245, g: 101, b: 5))
libName += "e".highlight(245, g: 5, b: 93)
print(libName + " Extension")

print("foo".colorize(Color.Green))
print("foo".colorize(59, g: 193, b: 237))
print("foo".colorize(RGB(r: 245, g: 5, b: 93)))
print("foo".colorize(23))

print("bar".highlight(Color.Green))
print("bar".highlight(59, g: 22, b: 145))
print("bar".highlight(RGB(r: 254, g: 254, b: 93)))
print("bar".highlight(31))

print("foobar".highlight(Color.Magenta).colorize(RGB(r: 245, g: 101, b: 5)))

print("foo".highlight(Color.Black).colorize(Color.BrightYellow) + "bar".colorize(255, g: 0, b: 0).highlight(Color.White))

print("baz".embolden())
print("baz".underline())
