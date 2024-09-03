// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CharacterQuery: GraphQLQuery {
  public static let operationName: String = "Character"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query Character($page: Int) { characters(page: $page) { __typename results { __typename id name status species image type gender origin { __typename id name } location { __typename id name } episode { __typename id name } created } } }"#
    ))

  public var page: GraphQLNullable<Int>

  public init(page: GraphQLNullable<Int>) {
    self.page = page
  }

  public var __variables: Variables? { ["page": page] }

  public struct Data: MySchemaAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("characters", Characters?.self, arguments: ["page": .variable("page")]),
    ] }

    /// Get the list of all characters
    public var characters: Characters? { __data["characters"] }

    /// Characters
    ///
    /// Parent Type: `Characters`
    public struct Characters: MySchemaAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Characters }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
      ] }

      public var results: [Result?]? { __data["results"] }

      /// Characters.Result
      ///
      /// Parent Type: `Character`
      public struct Result: MySchemaAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Character }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", MySchemaAPI.ID?.self),
          .field("name", String?.self),
          .field("status", String?.self),
          .field("species", String?.self),
          .field("image", String?.self),
          .field("type", String?.self),
          .field("gender", String?.self),
          .field("origin", Origin?.self),
          .field("location", Location?.self),
          .field("episode", [Episode?].self),
          .field("created", String?.self),
        ] }

        /// The id of the character.
        public var id: MySchemaAPI.ID? { __data["id"] }
        /// The name of the character.
        public var name: String? { __data["name"] }
        /// The status of the character ('Alive', 'Dead' or 'unknown').
        public var status: String? { __data["status"] }
        /// The species of the character.
        public var species: String? { __data["species"] }
        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? { __data["image"] }
        /// The type or subspecies of the character.
        public var type: String? { __data["type"] }
        /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
        public var gender: String? { __data["gender"] }
        /// The character's origin location
        public var origin: Origin? { __data["origin"] }
        /// The character's last known location
        public var location: Location? { __data["location"] }
        /// Episodes in which this character appeared.
        public var episode: [Episode?] { __data["episode"] }
        /// Time at which the character was created in the database.
        public var created: String? { __data["created"] }

        /// Characters.Result.Origin
        ///
        /// Parent Type: `Location`
        public struct Origin: MySchemaAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Location }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", MySchemaAPI.ID?.self),
            .field("name", String?.self),
          ] }

          /// The id of the location.
          public var id: MySchemaAPI.ID? { __data["id"] }
          /// The name of the location.
          public var name: String? { __data["name"] }
        }

        /// Characters.Result.Location
        ///
        /// Parent Type: `Location`
        public struct Location: MySchemaAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Location }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", MySchemaAPI.ID?.self),
            .field("name", String?.self),
          ] }

          /// The id of the location.
          public var id: MySchemaAPI.ID? { __data["id"] }
          /// The name of the location.
          public var name: String? { __data["name"] }
        }

        /// Characters.Result.Episode
        ///
        /// Parent Type: `Episode`
        public struct Episode: MySchemaAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Episode }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", MySchemaAPI.ID?.self),
            .field("name", String?.self),
          ] }

          /// The id of the episode.
          public var id: MySchemaAPI.ID? { __data["id"] }
          /// The name of the episode.
          public var name: String? { __data["name"] }
        }
      }
    }
  }
}
