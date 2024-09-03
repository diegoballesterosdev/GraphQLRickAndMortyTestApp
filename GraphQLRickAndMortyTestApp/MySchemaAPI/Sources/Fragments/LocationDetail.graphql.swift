// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct LocationDetail: MySchemaAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment LocationDetail on Location { __typename id name type dimension residents { __typename id name image } }"#
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Location }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", MySchemaAPI.ID?.self),
    .field("name", String?.self),
    .field("type", String?.self),
    .field("dimension", String?.self),
    .field("residents", [Resident?].self),
  ] }

  /// The id of the location.
  public var id: MySchemaAPI.ID? { __data["id"] }
  /// The name of the location.
  public var name: String? { __data["name"] }
  /// The type of the location.
  public var type: String? { __data["type"] }
  /// The dimension in which the location is located.
  public var dimension: String? { __data["dimension"] }
  /// List of characters who have been last seen in the location.
  public var residents: [Resident?] { __data["residents"] }

  /// Resident
  ///
  /// Parent Type: `Character`
  public struct Resident: MySchemaAPI.SelectionSet {
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
