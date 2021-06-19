# BertNlpDbpediaInterface

### work in progress - please visit later

The BERT NLP model and code is taken directly from Apple's example described at:

https://developer.apple.com/documentation/coreml/finding_answers_to_questions_in_a_text_document

Apple's BERT model and code are licensed under the Apache 2 license.

The Swift SPARQL query code is taken from the earlier material in my book [Artificial Intelligence Using Swift](https://leanpub.com/SwiftAI).

Note: I modified two of Apple's demo files: BERT.swift and BERTVocabulary.swift

I added a command line test in main.swift

## Setup

You must copy two data files from the Apple Dev example project:

- bert-base-uncased-vocab.txt
- BERTQAFP16.mlmodel

by downloading Apple's example project (which you will want to run anyway - it has a UI, the example here is a command line application):

[https://docs-assets.developer.apple.com/published/63ddeb54cb/FindingAnswersToQuestionsInATextDocument.zip](https://docs-assets.developer.apple.com/published/63ddeb54cb/FindingAnswersToQuestionsInATextDocument.zip)

Copy the two data files into the subdirectory Sources/BertNlpDbpediaInterface/Resources. After copying these files, this project should look like:


{linenos=off}
~~~~~~~~
├── Package.swift
├── README.md
├── Sources
│   └── BertNlpDbpediaInterface
│       ├── BERT.swift
│       ├── BERTInput.swift
│       ├── BERTOutput.swift
│       ├── BERTQAFP16Input.swift
│       ├── BERTVocabulary.swift
│       ├── Resources
│       │   ├── BERTQAFP16.mlmodel
│       │   └── bert-base-uncased-vocab.txt
│       ├── SparqlQuery.swift
│       ├── TokenizedString.swift
│       └── main.swift
└── Tests
    ├── BertNlpDbpediaInterfaceTests
    │   ├── BertNlpDbpediaInterfaceTests.swift
    │   └── XCTestManifests.swift
    └── LinuxMain.swift
~~~~~~~~
