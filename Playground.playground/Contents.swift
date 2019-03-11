/*:
 # Playground
 
 The intent of this document is to help iOS developers to use storyboards in playgrounds. More details on implementation and steps are described on the [related Medium article](https://medium.com/@romsi94/storyboards-in-xcode-playgrounds-are-a-pain-in-the-a-343c7b3bab0c).
 
 Main storyboard was created from a new project and then imported to `Resources` folder.
 
 Run the following command line to compile storyboards:
 
 ```
 make
 ```
 
 `make` command is compiling storyboards using `ibtool`.
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
