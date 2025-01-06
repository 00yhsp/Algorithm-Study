import Foundation

let fIO = FileIO()
let n = fIO.readInt()
var s = 0
var output = ""

for _ in 0..<n { parseAndCalc() }

print(output, terminator: "")

func parseAndCalc() {
    switch fIO.readStirngSum() {
    case 297: // "add"
        let x = fIO.readInt() - 1
        s |= (1 << x)

    case 654: // "remove"
        let x = fIO.readInt() - 1
        s &= ~(1 << x)

    case 510: // "check"
        let x = fIO.readInt() - 1
        output += (s & (1 << x)) != 0 ? "1\n" : "0\n"

    case 642: // "toggle"
        let x = fIO.readInt() - 1
        s ^= (1 << x)

    case 313: // "all"
        s = (1 << 20) - 1

    case 559: // "empty"
        s = 0

    default:
        break
    }
}

class FileIO {
    @inline(__always)
    private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0]
    private var byteIdx = 0

    @inline(__always)
    private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }

    @inline(__always)
    func readInt() -> Int {
        var number = 0
        var byte = readByte()
        var isNegative = false

        while byte == 10 || byte == 32 {
            byte = readByte()
        }
        if byte == 45 {
            isNegative = true
            byte = readByte()
        }
        while 48...57 ~= byte {
            number = number * 10 + Int(byte - 48)
            byte = readByte()
        }

        return isNegative ? -number : number
    }

    @inline(__always)
    func readStirngSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 {
            byte = readByte()
        }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 {
            byte = readByte()
            sum += Int(byte)
        }
        return sum - Int(byte)
    }

    @inline(__always)
    private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}
