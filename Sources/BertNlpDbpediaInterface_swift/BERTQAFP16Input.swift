//
// BERTQAFP16.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class BERTQAFP16Input : MLFeatureProvider {

    /// Sequence of input symbols. The sequence starts with a start token (101) followed by question tokens that are followed be a separator token (102) and the document tokens.The document tokens end with a separator token (102) and the sequenceis padded with 0 values to length 384. as 384 element vector of 32-bit integers
    var wordIDs: MLMultiArray

    /// Sequence of token-types. Values of 0 for the start token, question tokens and the question separator. Value 1 for the document tokens and the end separator. The sequence is padded with 0 values to length 384. as 384 element vector of 32-bit integers
    var wordTypes: MLMultiArray

    var featureNames: Set<String> {
        get {
            return ["wordIDs", "wordTypes"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "wordIDs") {
            return MLFeatureValue(multiArray: wordIDs)
        }
        if (featureName == "wordTypes") {
            return MLFeatureValue(multiArray: wordTypes)
        }
        return nil
    }
    
    init(wordIDs: MLMultiArray, wordTypes: MLMultiArray) {
        self.wordIDs = wordIDs
        self.wordTypes = wordTypes
    }
}


/// Model Prediction Output Type
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class BERTQAFP16Output : MLFeatureProvider {

    /// Source provided by CoreML

    private let provider : MLFeatureProvider


    /// Start token scores of size 384. The argmax is the start index of the predicted answer in the input sequence as 384 element vector of doubles
    lazy var startLogits: MLMultiArray = {
        [unowned self] in return self.provider.featureValue(for: "startLogits")!.multiArrayValue
    }()!

    /// End token scores of size 384. The argmax is the end index of the predicted answer in the input sequence as 384 element vector of doubles
    lazy var endLogits: MLMultiArray = {
        [unowned self] in return self.provider.featureValue(for: "endLogits")!.multiArrayValue
    }()!

    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    init(startLogits: MLMultiArray, endLogits: MLMultiArray) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["startLogits" : MLFeatureValue(multiArray: startLogits), "endLogits" : MLFeatureValue(multiArray: endLogits)])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
class BERTQAFP16 {
    let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        //let fileUrl = URL(string: "Sources/Resources/BERTQAFP16.mlmodel")
        let fileUrl = URL(fileURLWithPath: "Sources/Resources/BERTQAFP16.mlmodel")
        return fileUrl
        //let bundle = Bundle(for: self)
        //return bundle.url(forResource: "BERTQAFP16", withExtension:"mlmodelc")!
    }

    /**
        Construct BERTQAFP16 instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of BERTQAFP16.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `BERTQAFP16.urlOfModelInThisBundle` to create a MLModel object to pass-in.

        - parameters:
          - model: MLModel object
    */
    init(model: MLModel) {
        self.model = model
    }

    /**
        Construct BERTQAFP16 instance by automatically loading the model from the app's bundle.
    */
    @available(*, deprecated, message: "Use init(configuration:) instead and handle errors appropriately.")
    convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }

    /**
        Construct a model with configuration

        - parameters:
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct BERTQAFP16 instance with explicit path to mlmodelc file
        - parameters:
           - modelURL: the file url of the model

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }

    /**
        Construct a model with URL of the .mlmodelc directory and configuration

        - parameters:
           - modelURL: the file url of the model
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }

    /**
        Construct BERTQAFP16 instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<BERTQAFP16, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct BERTQAFP16 instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<BERTQAFP16, Error>) -> Void) {
        MLModel.__loadContents(of: modelURL, configuration: configuration) { (model, error) in
            if let error = error {
                handler(.failure(error))
            } else if let model = model {
                handler(.success(BERTQAFP16(model: model)))
            } else {
                fatalError("SPI failure: -[MLModel loadContentsOfURL:configuration::completionHandler:] vends nil for both model and error.")
            }
        }
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as BERTQAFP16Input

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as BERTQAFP16Output
    */
    func prediction(input: BERTQAFP16Input) throws -> BERTQAFP16Output {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as BERTQAFP16Input
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as BERTQAFP16Output
    */
    func prediction(input: BERTQAFP16Input, options: MLPredictionOptions) throws -> BERTQAFP16Output {
        let outFeatures = try model.prediction(from: input, options:options)
        return BERTQAFP16Output(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - wordIDs: Sequence of input symbols. The sequence starts with a start token (101) followed by question tokens that are followed be a separator token (102) and the document tokens.The document tokens end with a separator token (102) and the sequenceis padded with 0 values to length 384. as 384 element vector of 32-bit integers
            - wordTypes: Sequence of token-types. Values of 0 for the start token, question tokens and the question separator. Value 1 for the document tokens and the end separator. The sequence is padded with 0 values to length 384. as 384 element vector of 32-bit integers

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as BERTQAFP16Output
    */
    func prediction(wordIDs: MLMultiArray, wordTypes: MLMultiArray) throws -> BERTQAFP16Output {
        let input_ = BERTQAFP16Input(wordIDs: wordIDs, wordTypes: wordTypes)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        - parameters:
           - inputs: the inputs to the prediction as [BERTQAFP16Input]
           - options: prediction options

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [BERTQAFP16Output]
    */
    func predictions(inputs: [BERTQAFP16Input], options: MLPredictionOptions = MLPredictionOptions()) throws -> [BERTQAFP16Output] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [BERTQAFP16Output] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  BERTQAFP16Output(features: outProvider)
            results.append(result)
        }
        return results
    }
}
