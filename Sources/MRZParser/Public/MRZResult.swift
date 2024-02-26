//
//  MRZResult.swift
//  
//
//  Created by Roman Mazeev on 15.06.2021.
//

import Foundation

public enum MRZFormat: CaseIterable {
    case td1, td2, td3

    public var lineLength: Int {
        switch self {
        case .td1:
            return 30
        case .td2:
            return 36
        case .td3:
            return 44
        }
    }

    public var linesCount: Int {
        switch self {
        case .td1:
            return 3
        case .td2, .td3:
            return 2
        }
    }
}

public struct MRZResult: Hashable {
    public enum DocumentType: CaseIterable {
        case visa
        case passport
        case id
        case undefined

        var identifier: Character {
            switch self {
            case .visa:
                return "V"
            case .passport:
                return "P"
            case .id:
                return "I"
            case .undefined:
                return "_"
            }
        }
    }

    public enum Sex: CaseIterable {
        case male
        case female
        case unspecified

        var identifier: [String] {
            switch self {
            case .male:
                return ["M"]
            case .female:
                return ["F"]
            case .unspecified:
                return ["X", "<", " "]
            }
        }
    }

    public let format: MRZFormat
    public let documentType: DocumentType
    public let documentTypeAdditional: Character?
    public let countryCode: String
    public let surnames: String
    public let givenNames: String
    public let documentNumber: String?
    public let documentNumberCheckDigit: String?
    public let nationalityCountryCode: String
    public let birthdate: Date?
    public let birthdateCheckDigit: String?
    public let sex: Sex
    public let expiryDate: Date?
    public let expiryDateCheckDigit: String?
    public let optionalData: String?
    public let mrzString: String
    public let mrzStringWithFinalDigit: String
    /// `nil` if not provided
    public let optionalData2: String?
    public let finalCheckDigit: String?
    
    public init(
        format: MRZFormat,
        documentType: DocumentType,
        documentTypeAdditional: Character?,
        countryCode: String,
        surnames: String,
        givenNames: String,
        documentNumber: String?,
        documentNumberCheckDigit: String?,
        nationalityCountryCode: String,
        birthdate: Date?,
        birthdateCheckDigit: String?,
        sex: Sex,
        expiryDate: Date?,
        expiryDateCheckDigit: String?,
        optionalData: String?,
        mrzString: String,
        mrzStringWithFinalDigit: String,
        optionalData2: String?,
        finalCheckDigit: String?
    ) {
        self.format = format
        self.documentType = documentType
        self.documentTypeAdditional = documentTypeAdditional
        self.countryCode = countryCode
        self.surnames = surnames
        self.givenNames = givenNames
        self.documentNumber = documentNumber
        self.documentNumberCheckDigit = documentNumberCheckDigit
        self.nationalityCountryCode = nationalityCountryCode
        self.birthdate = birthdate
        self.birthdateCheckDigit = birthdateCheckDigit
        self.sex = sex
        self.expiryDate = expiryDate
        self.expiryDateCheckDigit = expiryDateCheckDigit
        self.optionalData = optionalData
        self.mrzString = mrzString
        self.mrzStringWithFinalDigit = mrzStringWithFinalDigit
        self.optionalData2 = optionalData2
        self.finalCheckDigit = finalCheckDigit
    }
}

