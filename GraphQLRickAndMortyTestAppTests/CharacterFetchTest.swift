import XCTest
import Apollo
@testable import GraphQLRickAndMortyTestApp

class CharacterListViewModelTests: XCTestCase {
    
    var viewModel: CharacterListViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CharacterListViewModel()
    }
    
    
    func testFetchCharactersSuccess() {
           // Define an expectation
           let expectation = self.expectation(description: "Fetching characters should succeed")
           
           // Call the fetchCharacters function
           viewModel.fetchCharacters()
           
           // Delay to give the network request time to complete
           DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
               // Assert that characters are fetched
               XCTAssertNotNil(self.viewModel.characters)
               XCTAssertFalse(self.viewModel.characters!.isEmpty)
               XCTAssert(self.viewModel.characters?.count == 20)
               XCTAssert(self.viewModel.characters?.first?.name == "Rick Sanchez")
               
               expectation.fulfill()
           }
           
           // Wait for expectations
           waitForExpectations(timeout: 5, handler: nil)
       }
    
}
