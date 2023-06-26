class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]

        for index in nums.indices {
            let offset = target - nums[index]
            let offsetIdx = dict[offset]

            if offsetIdx != nil {
                return [index, offsetIdx!]
            } else {
                dict[nums[index]] = index
            }
        }

        return []
    }
}