// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetLocationQuery: GraphQLQuery {
  public static let operationName: String = "GetLocation"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetLocation($id: ID!) { location(id: $id) { __typename ...LocationDetail } }"#,
      fragments: [LocationDetail.self]
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
      .field("location", Location?.self, arguments: ["id": .variable("id")]),
    ] }

    /// Get a specific locations by ID
    public var location: Location? { __data["location"] }

    /// Location
    ///
    /// Parent Type: `Location`
    public struct Location: MySchemaAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { MySchemaAPI.Objects.Location }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(LocationDetail.self),
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

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var locationDetail: LocationDetail { _toFragment() }
      }

      public typealias Resident = LocationDetail.Resident
    }
  }
}
