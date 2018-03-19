// Copyright (c) 2017 Lighthouse Labs. All rights reserved.
// 
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

class NameFormatter {
  
  let name: String
  
  init(name: String) {
    self.name = name
  }
  
  func inverted() -> String {
    
    let userEnteredName = self.name
    
    if userEnteredName == "" {
      return ""
    }
    
    func separateComponentsBySpaces(in string: String) -> [String] {
        let words = string.components(separatedBy: NSCharacterSet.whitespaces)
        let filteredWordComponents = words.filter {$0 != ""}
        return filteredWordComponents
    }
    
    let nameComponents = separateComponentsBySpaces(in: userEnteredName)
    
    
    func identifyNameComponents(in possibleNameComponents: [String]) -> [String:String] {
        var verifiedNameComponents: [String:String] = [:]
        for component in possibleNameComponents {
            if component.hasSuffix(".") {
                verifiedNameComponents["honorific"] = component
            } else if component.hasSuffix(",") {
                verifiedNameComponents["lastName"] = component
            } else if verifiedNameComponents["firstName"] == nil {
                verifiedNameComponents["firstName"] = component
            } else if verifiedNameComponents["lastName"] == nil {
                verifiedNameComponents["lastName"] = component
            }
        }
        return verifiedNameComponents
    }
    
    let labeledNameComponents = identifyNameComponents(in: nameComponents)
    
    func formatNameString(using dictionary: [String:String]) -> String {
        guard let firstName = dictionary["firstName"] else {
            return ""
        }
        if let honorific = dictionary["honorific"] {
            guard let lastName = dictionary["lastName"] else {
                return "\(honorific) \(firstName)"
            }
            return "\(honorific) \(lastName), \(firstName)"
        } else {
            guard let lastName = dictionary["lastName"] else {
                return "\(firstName)"
            }
            return "\(lastName), \(firstName)"
        }
    }
    
    let formattedName = formatNameString(using: labeledNameComponents)
    
    return formattedName
    
  }
}
