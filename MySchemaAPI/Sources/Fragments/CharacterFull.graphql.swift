// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct CharacterFull: MySchemaAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment CharacterFull on Character { __typename id name image status species type gender episode { __typename id name air_date } location { __typename id name } origin { __typename id name } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Character }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", MySchemaAPI.ID?.self),
    .field("name", String?.self),
    .field("image", String?.self),
    .field("status", String?.self),
    .field("species", String?.self),
    .field("type", String?.self),
    .field("gender", String?.self),
    .field("episode", [Episode?].self),
    .field("location", Location?.self),
    .field("origin", Origin?.self),
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
      .field("air_date", String?.self),
    ] }

    /// The id of the episode.
    public var id: MySchemaAPI.ID? { __data["id"] }
    /// The name of the episode.
    public var name: String? { __data["name"] }
    /// The air date of the episode.
    public var air_date: String? { __data["air_date"] }
  }

  /// Location
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

  /// Origin
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
}
