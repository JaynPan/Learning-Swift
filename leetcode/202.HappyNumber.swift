class Solution {
    var seen = Set<Int>()

    func isHappy(_ n: Int) -> Bool {
        if seen.contains(n) {
            return false
        }

        seen.insert(n);

        let numberString = String(n)
        var digits = [Int]()

        for char in numberString {
            if let digit = Int(String(char)) {
                digits.append(digit)
            }
        }

        let sum = digits.reduce(0) { (result, num) in 
            let squared = num * num
            return squared + result
        }

        if sum == 1 {
            return true
        } else {
            return isHappy(sum)
        }
    }
}