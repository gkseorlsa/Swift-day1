import Playgrounds

#Playground {
    /// Part 2. 종합 프로젝트
    
    // 2-1. 계산기
    
    func calculator(_ a: Int, _ b: Int, operator op: String) {
        switch op {
        case "+":
            print("\(a) + \(b) = \(a + b)")
        case "-":
            print("\(a) - \(b) = \(a - b)")
        case "*":
            print("\(a) * \(b) = \(a * b)")
        case "/":
            if b == 0 {
                print("0으로 나눌 수 없습니다.")
            } else {
                print("\(a) / \(b) = \(a / b)")
            }
        case "%":
            print("\(a) % \(b) = \(a % b)")
        default:
            print("알 수 없는 기호")
        }
    }
    
    calculator(10, 3, operator: "+")
    calculator(10, 3, operator: "-")
    calculator(10, 3, operator: "*")
    calculator(10, 3, operator: "/")
    calculator(10, 3, operator: "%")
    calculator(10, 0, operator: "/")
    
    
    
    // 2-2. 성적 분석기
    
    let students: [(name: String, scores: [Int])] = [
        (name: "홍길동", scores: [85, 90, 78, 92, 88]),
        (name: "김철수", scores: [70, 65, 80, 75, 72]),
        (name: "이영희", scores: [95, 98, 92, 96, 100]),
        (name: "박민준", scores: [60, 55, 70, 65, 58]),
        (name: "최수진", scores: [88, 82, 90, 85, 91])
    ]
    
    // 학점 반환 함수
    func grade(for average: Double) -> String {
        switch average {
        case 90...100: return "A"
        case 80...89:  return "B"
        case 70...79:  return "C"
        case 60...69:  return "D"
        default:       return "F"
        }
    }
    
    // 평균 계산
    func average(of scores: [Int]) -> Double {
        return Double(scores.reduce(0, +)) / Double(scores.count)
    }
    
    print("=== 학생별 평균 ===")
    for student in students {
        let avg = average(of: student.scores)
        print("\(student.name): 평균 \(String(format: "%.1f", avg))점")
    }
    
    
    
    
    
    print("=== 최고/최저 ===")
    let sorted = students.sorted { average(of: $0.scores) > average(of: $1.scores) }
    
    let best = sorted.first!
    let worst = sorted.last!
    
    print("최고 평균: \(best.name) (\(String(format: "%.1f", average(of: best.scores)))점)")
    
    print("최저 평균: \(worst.name) (\(String(format: "%.1f", average(of: worst.scores)))점)")
    
    
    
    print("=== 학점 ===")
    for student in students {
        let avg = average(of: student.scores)
        print("\(student.name): \(String(format: "%.1f", avg))점 -> 학점: \(grade(for: avg))")
    }
    
    
    
    print("=== 순위 ===")
    for (idx, student) in sorted.enumerated() {
        let avg = average(of: student.scores)
        print("\(idx + 1)위: \(student.name) (\(String(format: "%.1f", avg))점)")
    }
    
    
    
    
    
    // 2-3. 단어 통계 분석기
    
    let text = "swift is a powerful language swift is easy to learn and swift is fun"
    
    let textArr = text.components(separatedBy: .whitespaces)
    let sole: Set<String> = Set(textArr)

    var textDict: [String: Int] = [:]
    for text in textArr {
        textDict[text, default: 0] += 1
    }
    
    print("전체 단어 수: \(text.count)")
    print("고유 단어 수: \(sole.count)")
    
    print("=== 단어 등장 횟수 ===")
    for (word, count) in textDict {
        print("\(word): \(count)회")
    }
    
    if let maxCount = textDict.values.max(),
       let topWord = textDict.first(where: { $0.value == maxCount }) {
        print("최다 등장 단어: \(topWord.key) (\(topWord.value)회)")
    }
    
    print("=== 단어 순위 ===")
    let sortedWord = textDict.sorted { $0.value > $1.value }
    for (index, word) in sortedWord.enumerated() {
        print("\(index + 1). \(word.key) - \(word.value)회")
    }
}
