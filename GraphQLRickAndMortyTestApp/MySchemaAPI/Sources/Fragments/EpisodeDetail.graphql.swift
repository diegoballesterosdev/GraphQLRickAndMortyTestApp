// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct EpisodeDetail: MySchemaAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment EpisodeDetail on Episode { __typename id name created air_date episode characters { __typename id name image } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Episode }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", MySchemaAPI.ID?.self),
    .field("name", String?.self),
    .field("created", String?.self),
    .field("air_date", String?.self),
    .field("episode", String?.self),
    .field("characters", [Character?].self),
  ] }

  /// The id of the episode.
  public var id: MySchemaAPI.ID? { __data["id"] }
  /// The name of the episode.
  public var name: String? { __data["name"] }
  /// Time at which the episode was created in the database.
  public var created: String? { __data["created"] }
  /// The air date of the episode.
  public var air_date: String? { __data["air_date"] }
  /// The code of the episode.
  public var episode: String? { __data["episode"] }
  /// List of characters who have been seen in the episode.
  public var characters: [Character?] { __data["characters"] }

  /// Character
  ///
  /// Parent Type: `Character`
  public struct Character: MySchemaAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Character }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", MySchemaAPI.ID?.self),
      .field("name", String?.self),
      .field("image", String?.self),
    ] }

    /// The id of the character.
    public var id: MySchemaAPI.ID? { __data["id"] }
    /// The name of the character.
    public var name: String? { __data["name"] }
    /// Link to the character's image.
    /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
    public var image: String? { __data["image"] }
  }
}
