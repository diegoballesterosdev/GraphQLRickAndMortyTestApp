// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetCharacterQuery: GraphQLQuery {
  public static let operationName: String = "GetCharacter"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetCharacter($id: ID!) { character(id: $id) { __typename ...CharacterFull } }"#,
      fragments: [CharacterFull.self]
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: MySchemaAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("character", Character?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Get a specific character by ID
    public var character: Character? { __data["character"] }

    /// Character
    ///
    /// Parent Type: `Character`
    public struct Character: MySchemaAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Character }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(CharacterFull.self),
      ] }

      /// The id of the character.
      public var id: MySchemaAPI.ID? { __data["id"] }
      /// The name of the character.
      public var name: String? { __data["name"] }
      /// Link to the character's image.
      /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
      public var image: String? { __data["image"] }
      /// The status of the character ('Alive', 'Dead' or 'unknown').
      public var status: String? { __data["status"] }
      /// The species of the character.
      public var species: String? { __data["species"] }
      /// The type or subspecies of the character.
      public var type: String? { __data["type"] }
      /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
      public var gender: String? { __data["gender"] }
      /// Episodes in which this character appeared.
      public var episode: [Episode?] { __data["episode"] }
      /// The character's last known location
      public var location: Location? { __data["location"] }
      /// The character's origin location
      public var origin: Origin? { __data["origin"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var characterFull: CharacterFull { _toFragment() }
      }

      public typealias Episode = CharacterFull.Episode

      public typealias Location = CharacterFull.Location

      public typealias Origin = CharacterFull.Origin
    }
  }
}
