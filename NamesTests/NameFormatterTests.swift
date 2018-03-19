
@testable import Names
import XCTest

class NameFormatterTests: XCTestCase {
    
  func test_invertName_GivenAnEmptyString_ShouldReturnEmptyString() {
    let inputName = ""
    let expectedOutput = ""
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
  func test_invertName_GivenASingleName_ShouldReturnASingleName() {
    let inputName = "name"
    let expectedOutput = "name"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
  func test_invertName_GivenASingleNameWithExtraSpaces_ShouldReturnASingleName() {
    let inputName = " name "
    let expectedOutput = "name"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
  func test_invertName_GivenAFirstNameThenLastName_ShouldReturnLastNameThenFirstname() {
    let inputName = "first last"
    let expectedOutput = "last, first"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
  func test_invertName_GivenAFirstNameThenLastNameWithExtraSpaces_ShouldReturnLastNameThenFirstname() {
    let inputName = " first last "
    let expectedOutput = "last, first"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
  func test_invertName_GivenOnlyASingleHonorific_ShouldReturnEmptyString() {
    let inputName = " Dr. "
    let expectedOutput = ""
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
  func test_invertName_GivenHonorificAndFirstName_ShouldReturnHonorificAndFirstName() {
    let inputName = " Dr. First "
    let expectedOutput = "Dr. First"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
  func test_invertName_GivenHonorificAndFirstLastName_ShouldReturnHonorificThenLastThenFirstName() {
    let inputName = "Mr. first last"
    let expectedOutput = "Mr. last, first"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
  
  func test_invertName_GivenHonorificAndFirstLastNameWithExtraSpaces_ShouldReturnHonorificLastFirst() {
    let inputName = " Mr.   first last "
    let expectedOutput = "Mr. last, first"
    
    let nameFormatter = NameFormatter(name: inputName)
    
    XCTAssertEqual(nameFormatter.inverted(), expectedOutput)
  }
}



























