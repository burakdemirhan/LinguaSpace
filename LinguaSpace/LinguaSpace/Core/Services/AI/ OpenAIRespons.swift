//
//   OpenAIRespons.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 09/06/26.
//

import Foundation

struct OpenAIResponse: Codable {

    let output: [OpenAIOutput]

    

    var outputText: String {

        output

            .flatMap(\.content)

            .compactMap(\.text)

            .joined()

    }

}

struct OpenAIOutput: Codable {

    let content: [OpenAIContent]

}

struct OpenAIContent: Codable {

    let text: String?

}
