import Playgrounds

#Playground {
    /// Part 1
    
    // 1-1. 변수와 상수
    
    let name: String = "홍길동"
    var age: Int = 20
    age += 5
    
    print("이름: \(name), 나이: \(age)살")
    
    
    // 1-2. 타입 변환
    
    let strNumber = "42"
    let intNumber: Int = Int(strNumber)!            // String -> Int
    let doubleNumber: Double = Double(intNumber)    // Int -> Double
    
    print(intNumber + 8)
    print(doubleNumber * 1.5)
    
    
    // 1-3. 문자열 다루기
    
    let sentence = " Hello, Swift World! "
    let trimmed = sentence.trimmingCharacters(in: .whitespaces)
    
    print(trimmed)
    print(trimmed.count)
    print(trimmed.uppercased())
    
    let replaced = trimmed.replacingOccurrences(of: "Swift", with: "Kotlin")
    print(replaced)
    print(replaced.components(separatedBy: ","))
    
    
    
    // 1-4. 조건문
    
    let score = 78
    
    switch score {
    case 90...100:
        print("A")
    case 80...89:
        print("B")
    case 70...79:
        print("C")
    case 60...69:
        print("D")
    default:
        print("F")
    }
    
    
    // 1-5. 반복문
    
    var sum = 0
    for i in 1...100 {
        sum += i
    }
    
    print("1부터 100까지의 합: \(sum)")
    
    for i in 2...9 {
        print("=== \(i)단 ===")
        for j in 1...9 {
            print("\(i) x \(j) = \(i * j)")
        }
    }
    
    for i in 1...5 {
        print(String(repeating: "*", count: i))
    }
    
    
    // 1-6. 컬렉션
    let students: [String: Int] = ["홍길동": 85, "김철수": 92, "이영희": 78, "박민준": 95, "최수진": 88]
    
    print("=== 전체 학생 ===")
    for (name, score) in students {
        print("\(name): \(score)")
    }
    
    let average = Double(students.values.reduce(0, +)) / Double(students.count)
    print("평균 점수: \(String(format: "%.1f", average))점")
    print("=== 90점 이상 ===")
    for (name, score) in students where score >= 90{
        print(name)
    }
    
    print("점수를 기준으로 내림차순 정렬")
    let sorted = students.sorted { $0.value > $1.value }
    for (index, student) in sorted.enumerated() {
        print("\(index + 1)위 \(student.key): \(student.value)")
    }
    
    
    // 1-7. 옵셔널
    
    var userInput: String? = "123"
    if let value = userInput {
        print("입력값: \(value)")
    }
    
    func double(_ value: String?) -> Int {
        guard let str = value, let num = Int(str) else {
            return 0
        }
        return num * 2
    }
    
    print(double("10"))
    print(double(nil))
    print(double("abc"))
    
    
    
    var nickname: String? = nil
    print("닉네임: \(nickname ?? "익명")")
}
