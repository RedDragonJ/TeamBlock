# Build tools & versions used
### MacOS 12.6
### Xcode 14.1 (14B47b)

# Steps to run the app
### 1. Opne the TeamBlock.xcworkspace
### 2. Choose your desired iphone version on top
### 3. Hit cmd+R/run button to run the project 

# What areas of the app did you focus on?
### - Build UI with SwiftUI
### - Utilize async await for API calls in SwiftUI
### - Mix regular swift code with new async wait for SwiftUI, in case if there's legacy code in actual production work
### - Dependecy injection for the network layer
### - Mocked network layer for unit tests
### - Third-party module integration 
### - Centralized alert
### - Centralized progress view

# What was the reason for your focus? What problems were you trying to solve?
### - Utilize the SwiftUI for simplier UI design 
### - SwiftUI enables the ability to expand project to different platform with single code base
### - Async awaits help provide better async tasks solution in SwiftUI. Simplify the nested network call that used to happen in a traditional way.
### - Dependency injection that will help with potential modulization as well as unit test
### - Use Swiftlint for the swift code syntax check
### - Add SwiftLint in cocoapods because swift pakcage lack of ability to process run time script at the moment. 
###   However, there is a potential workaround (https://blog.timac.org/2021/1003-swiftlint-for-swift-packages/)
### - Utilize the SwiftUI-Cached-Async-Image to handle image caching
### - Centralized alert and progress because they can easily get out of hand when the project grow larger in SwiftUI

# How long did you spend on this project?
### About 5 hours to finish, then 2-3 hours to refine the project, estimate about 8 hours

# Did you make any trade-offs for this project? What would you have done differently with more time?
### I'd like to try use the new SwiftUI API call style to see how different is compare to the current way (https://www.hackingwithswift.com/books/ios-swiftui/sending-and-receiving-codable-data-with-urlsession-and-swiftui)
### I'd also like to expand the project to iPad as well
### Add more network handling to the network layer to ensure it works up and close to 99% of time
### Maybe add progress view on the image downloading just in case they take to long to load
### Make a better version of sort for teams so the list shows different section of teams

# What do you think is the weakest part of your project?
### I think the UI part is one the weakest because SwiftUI still new and there's so much to learn. I know there are definitely many different ways to create certain views with SwiftUI since it's a declarative programming
### The network layer is another one. I think depend on the project and goals, the network layer should probably check for network connection, handle different http reponse code with data, and handle things like multi-form data, etc.

# Did you copy any code or dependencies? Please make sure to attribute them here!
### SwiftUI CachedAsyncImage (https://github.com/lorenzofiamingo/swiftui-cached-async-image)
### SwiftLint (https://github.com/realm/SwiftLint)

# Is there any other information you’d like us to know?
### - I also changed the xcode to backward compatible with Xcode 13 because 14 may have issues with some cocoapods integration
### - You can find Swiftlint ymal file hidden in the main directory, you can unhide with (shift+cmd+.)
### - Removed UITest target because it take too long to run on my machine and it's eating up the memories

