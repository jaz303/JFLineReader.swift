# JFLineReader

Read a file line by line.

```swift
import JFLineReader

let reader = JFLineReader(path: "test.txt", maxLength: 1024, encoding: String.Encoding.utf8)
for line in reader {
	print(line)
}
```
