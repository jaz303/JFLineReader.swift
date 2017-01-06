import Foundation

public class JFFileLineReader: Sequence, IteratorProtocol {
    init?(path: String, maxLength: Int = 8192, encoding: String.Encoding = String.Encoding.utf8) {
        self.file = fopen(path, "r")
        self.bufferSize = Int32(maxLength)
        self.buffer = UnsafeMutablePointer<Int8>.allocate(capacity: Int(bufferSize))
        self.encoding = encoding
        guard file != nil else { return nil }
    }

    deinit {
        fclose(file)
        buffer.deallocate(capacity: Int(bufferSize))
    }

    public func next() -> String? {
        if fgets(buffer, bufferSize, file) == nil {
            return nil
        } else {
            return String(cString: buffer)
        }
    }

    private let file: UnsafeMutablePointer<FILE>!
    private let bufferSize: Int32
    private let buffer: UnsafeMutablePointer<Int8>!
    private let encoding: String.Encoding
}