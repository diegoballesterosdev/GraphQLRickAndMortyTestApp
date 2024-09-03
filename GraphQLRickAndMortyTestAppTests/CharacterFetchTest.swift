import XCTest
import Apollo
@testable import GraphQLRickAndMortyTestApp

/// This test case class is responsible for testing the `CharacterListViewModel`.
class CharacterListViewModelTests: XCTestCase {
    
    // MARK: - Properties

    /// The ViewModel instance that will be tested.
    var viewModel: CharacterListViewModel!
    
    /// Called before each test method in the class is invoked.
    override func setUp() {
        super.setUp()
        // Initialize the ViewModel before each test
        viewModel = CharacterListViewModel()
    }
    
    // MARK: - Test Methods
    
    func testFetchCharactersSuccess() {
           /// Define an expectation
           let expectation = self.expectation(description: "Fetching characters should succeed")
           
            /// Call the `fetchCharacters` method to trigger the network request
           viewModel.fetchCharacters()
           
           /// Delay to give the network request time to complete
           DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
               // Assertions to verify the result

               /// Check if the `characters` array is not nil
               XCTAssertNotNil(self.viewModel.characters)
               
               /// Check if the `characters` array is not empty
               XCTAssertFalse(self.viewModel.characters!.isEmpty)
               
               /// Verify that 20 characters were fetched
               XCTAssert(self.viewModel.characters?.count == 20)
               
               /// Verify that the first character's name is "Rick Sanchez"
               XCTAssert(self.viewModel.characters?.first?.name == "Rick Sanchez")
               
               
               /// Fulfill the expectation to let the test runner know the async task is complete
               expectation.fulfill()
           }
           
            /// Wait for the expectations to be fulfilled or time out after 5 seconds
           waitForExpectations(timeout: 5, handler: nil)
       }
    
}
