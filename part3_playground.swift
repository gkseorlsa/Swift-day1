import Playgrounds

#Playground {
    /// 3자리 숫자 야구 게임
    
    // 게임 규칙
    //      1~9 사이 숫자 3개로 구성, 중복 없음
    //      자리와 숫자가 모두 맞으면 Strike
    //      숫자는 맞지만 자리가 틀리면 Ball
    //      아무것도 안 맞으면 Out
    //      3 Strike면 게임 종료
    
    // 출력 예시
    //      === 숫자 야구 게임 ===
    //      정답: [1, 2, 3] (테스트용 공개)
    //
    //      추측: [1, 3, 5] -> 1 Strike, 1 Ball
    //      추측: [4, 2, 6] -> 1 Strike, 0 Ball
    //      추측: [1, 2, 3] -> 3 Strike -> 정답입니다!
    
    let answer = [1, 2, 3]
    let guesses = [[1, 3, 5], [4, 2, 6], [1, 2, 3]]
    
    func countStrike(answer: [Int], guess: [Int]) -> Int {
        var strikes = 0
        for i in 0..<answer.count {
            if (answer[i] == guess[i]) {
                strikes += 1
            }
        }
        return strikes
    }
    
    func countBalls(answer: [Int], guess: [Int]) -> Int {
        var balls = 0
        for i in 0..<answer.count {
            if (answer.contains(guess[i]) && answer[i] != guess[i]) {
                balls += 1
            }
        }
        return balls
    }
    
    func judge(answer: [Int], guess: [Int]) {
        let strikes = countStrike(answer: answer, guess: guess)
        let balls = countBalls(answer: answer, guess: guess)
        
        let guessStr = guess.map { String($0) }.joined(separator: ", ")
        
        if (strikes == 3) {
            print("추측: [\(guessStr)] -> 3 Strike -> 정답입니다!")
        } else if strikes == 0 && balls == 0 {
            print("추측: [\(guessStr)] -> Out")
        } else {
            print("추측: [\(guessStr)] -> \(strikes) Strike, \(balls) Ball")
        }
    }
    
    print("=== 숫자 야구 게임 ===")
    let answerStr = answer.map { String($0) }.joined(separator: ", ")
    print("정답: [\(answerStr)] (테스트용 공개)")
    
    for guess in guesses {
        judge(answer: answer, guess: guess)
    }
}
