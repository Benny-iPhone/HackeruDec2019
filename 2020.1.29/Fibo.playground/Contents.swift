import UIKit

func fibo(n : UInt) -> UInt {
    switch n {
    case 0, 1:
        return 1
    default:
        return fibo(n: n - 1) + fibo(n: n - 2)
    }
}
