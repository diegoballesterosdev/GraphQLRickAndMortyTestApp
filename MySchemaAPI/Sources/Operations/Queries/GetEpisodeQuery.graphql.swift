// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetEpisodeQuery: GraphQLQuery {
  public static let operationName: String = "GetEpisode"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetEpisode($id: ID!) { episode(id: $id) { __typename ...EpisodeDetail } }"#,
      fragments: [EpisodeDetail.self]
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
      .field("episode", Episode?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Get a specific episode by ID
    public var episode: Episode? { __data["episode"] }

    /// Episode
    ///
    /// Parent Type: `Episode`
    public struct Episode: MySchemaAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Episode }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(EpisodeDetail.self),
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

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var episodeDetail: EpisodeDetail { _toFragment() }
      }

      public typealias Character = EpisodeDetail.Character
    }
  }
}
