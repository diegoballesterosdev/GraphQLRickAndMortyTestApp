// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CharacterSmall: MySchemaAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment CharacterSmall on Character { __typename id name image episode { __typename id name } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Character }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", MySchemaAPI.ID?.self),
    .field("name", String?.self),
    .field("image", String?.self),
    .field("episode", [Episode?].self),
  ] }

  /// The id of the character.
  public var id: MySchemaAPI.ID? { __data["id"] }
  /// The name of the character.
  public var name: String? { __data["name"] }
  /// Link to the character's image.
  /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
  public var image: String? { __data["image"] }
  /// Episodes in which this character appeared.
  public var episode: [Episode?] { __data["episode"] }

  /// Episode
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
