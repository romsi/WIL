/*:
 # User Interface
 
 This document is a direct implementation of [my article about storyboards in xcode playgrounds](https://medium.com/@romsi94/storyboards-in-xcode-playgrounds-are-a-pain-in-the-a-343c7b3bab0c).
 
 The intent of this document is to help iOS developers to prototype user interfaces using Xcode Playgrounds in order to learn.
 
 ## Avoid quiproquo
 
 Start with a playground, use storyboards to build views, hard code scenarios and update views in real time without building the app on the device.
 
 It makes then easier to challenge the user stories made by the product owner and avoid quiproquo. By manually changing the scenarios, you get feedback from the product owner and be able to document the behavior of your app shared across your team.
 
 This proccess takes a couple of hours and helps you to be confident on what you are going to implement. Documenting it will help to share the knowledge across the team.
 
 ## Steps To Create Storyboards In Xcode Playgrounds
 
 Implementing storyboards in playgrounds is a bit more difficult than you think.
 
 1. Create a `Main` storyboard from a new iOS project
 2. Move it to your playground `Resources` directory
 3. Create a custom view controller class in your playground `Sources` directory
 4. Set the custom view controller class in your storyboard
 5. Set `PLAYGROUND_NAME_Sources` to your custom class's module in your storyboard
 6. Compile your storyboard using `ibtool` command line
 7. Run your playground
 
 *Note: Run `make` command line to compile storyboards.*
 */
import UIKit
let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
/*:
 `PlaygroundSupport` is used to display storyboard's views.
 */
import PlaygroundSupport

let viewController = storyboard.instantiateInitialViewController()
PlaygroundPage.current.liveView = viewController
/*:
 Compiling `CustomViewController` first is required in order to access it from storyboard.
 Extension is used to ensure module compilation first.
 */
extension CustomViewController {
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = .red
    }
}
