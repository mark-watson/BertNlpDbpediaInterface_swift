import XCTest
import Foundation

@testable
import BertNlpDbpediaInterface_swift

@available(OSX 10.15, *)
final class BertNlpDbpediaInterfaceTests: XCTestCase {
    
    let bert = BERT()
    
    @available(OSX 10.15, *)
    func test1() {
        let answer1 = bert.findAnswer(for: "who drove a car", in: "Pete picked peppers. John went in his red car to the store. Jill went down a hill.")
        print("\nanswer1:\n", answer1)
    }

    @available(OSX 10.15, *)
    func test2() {
        let answer1 = bert.findAnswer(for: "where does Bill Gates work?", in: "William Henry Gates III (born October 28, 1955) is an American business magnate, software developer, investor, and philanthropist. He is best known as the co-founder of Microsoft Corporation. During his career at Microsoft, Gates held the positions of chairman, chief executive officer (CEO), president and chief software architect, while also being the largest individual shareholder until May 2014. He is one of the best-known entrepreneurs and pioneers of the microcomputer revolution of the 1970s and 1980s. . ")
        print("\nanswer1:\n", answer1)
    }

    @available(OSX 10.15, *)
    func test3() {
        let answer1 = bert.findAnswer(for: "where is IBM is headquartered?", in: "International Business Machines Corporation (IBM) is an American multinational technology company headquartered in Armonk, New York, with operations in over 170 countries. The company began in 1911, founded in Endicott, New York, as the Computing-Tabulating-Recording Company (CTR) and was renamed 'International Business Machines' in 1924. IBM is incorporated in New York. . ")
        print("\nanswer1:\n", answer1)
    }

    @available(OSX 10.15, *)
    func test4() {
        let answer1 = bert.findAnswer(for: "who is Bill Clinton married to?", in: "William Jefferson Clinton (né Blythe III; born August 19, 1946) is an American lawyer and politician who served as the 42nd president of the United States from 1993 to 2001. Prior to his presidency, he served as governor of Arkansas (1979–1981 and 1983–1992) and as attorney general of Arkansas (1977–1979). A member of the Democratic Party, Clinton was known as a New Democrat, and many of his policies reflected a centrist 'Third Way' political philosophy. He is the husband of former secretary of state, former U.S. senator, and two-time candidate for president Hillary Clinton. .  ")
        print("\nanswer1:\n", answer1)
    }
    
    @available(OSX 10.15, *)
    func testLinguistics() {
        let answer1 = bert.findAnswer(for: "who drove a car", in: "Pete picked peppers. John went in his red car to the store. Jill went down a hill.")
        print("\nanswer1:\n", answer1)
    }

    
    static var allTests = [("test1", test1),
                           ("test2", test2),
                           ("test3", test3),
                           ("test4", test4),
                           ("testLinguistics", testLinguistics)]
}
