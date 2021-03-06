import Foundation

internal extension UnsignedInteger where Self: FixedWidthInteger {
    func get(nibble: Int) -> UInt8 {
        precondition(0 <= nibble && nibble <= 7)

        let offset = nibble * 4

        let mask = Self(0x0F &<< offset)

        return UInt8(truncatingIfNeeded: (self & mask) &>> offset)
    }

    mutating func set(nibble: Int, _ value: UInt8) {
        precondition(0 <= nibble && nibble <= 7)

        let offset = nibble * 4

        let mask = Self(0x0F &<< offset)

        self &= ~mask
        self |= Self(truncatingIfNeeded: value & 0x0F) &<< offset
    }

    subscript(nibble nibble: Int) -> UInt8 {
        get {
            return get(nibble: nibble)
        }
        set {
            set(nibble: nibble, newValue)
        }
    }
}
