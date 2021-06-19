/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Wrapper class for the BERT model that handles its input and output.
*/

import CoreML

@available(OSX 10.15, *)
public class BERT {
    static let fileUrl = URL(fileURLWithPath: "Sources/BertNlpDbpediaInterface_swift/Resources/BERTQAFP16.mlmodel")

    static let url = try! MLModel.compileModel(at: URL(fileURLWithPath: "Sources/BertNlpDbpediaInterface_swift/Resources/BERTQAFP16.mlmodel"))
    static let aModel = try! MLModel(contentsOf: url)
    
    public init() {}
    
    var bertModel: BERTQAFP16 = BERTQAFP16(model: aModel)
    public func findAnswer(for question: String, in document: String) -> Substring {
        // Prepare the input for the BERT model.
        let bertInput = BERTInput(documentString: document, questionString: question)
        
        guard bertInput.totalTokenSize <= BERTInput.maxTokens else {
            var message = "Text and question are too long"
            message += " (\(bertInput.totalTokenSize) tokens)"
            message += " for the BERT model's \(BERTInput.maxTokens) token limit."
            return Substring(message)
        }
        
        // The MLFeatureProvider that supplies the BERT model with its input MLMultiArrays.
        let modelInput = bertInput.modelInput!
        
        // Make a prediction with the BERT model.
        guard let prediction = try? bertModel.prediction(input: modelInput) else {
            return "The BERT model is unable to make a prediction."
        }

        // Analyze the output form the BERT model.
        guard let bestLogitIndices = bestLogitsIndices(from: prediction,
                                                       in: bertInput.documentRange) else {
            return "Couldn't find a valid answer. Please try again."
        }

        // Find the indices of the original string.
        let documentTokens = bertInput.document.tokens
        let answerStart = documentTokens[bestLogitIndices.start].startIndex
        let answerEnd = documentTokens[bestLogitIndices.end].endIndex
        
        // Return the portion of the original string as the answer.
        let originalText = bertInput.document.original
        return originalText[answerStart..<answerEnd]
    }
}
