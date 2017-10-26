UIImageView + Letters
=====================

Inspired by https://github.com/bachonk/UIImageView-Letters

An easy, helpful UIImageView extension that generates letter initials as a placeholder for user profile images, with a randomized background color if needed.

![Screenshot](Sample/screen1.png)
![Screenshot](Sample/screen2.png)

### Installation

##### CocoaPods

Add this spec to your podfile:

+ `use_frameworks!`
+ `pod 'Letters'`

Check out the [official guide](http://guides.cocoapods.org/using/index.html) for getting started with CocoaPods.

##### Manual

1. Drag the `UIImageView+Letters.swift` files into your project
2. Enjoy!

### Usage

##### Methods

Call the following method on any `UIImageView` instance to set the image:
+ `func setImage(string: String?, color: UIColor? = nil, circular: Bool = false, textAttributes: [NSAttributedStringKey: Any]? = nil)`

`string` is the string used to generate the initials. This should be a user's full name if available.

`color` is an optional parameter that sets the background color of the image. Pass in `nil` to have a color automatically generated for you.

`circular` is a boolean parameter that will automatically clip the image to a circle if enabled.

`textAttributes` is n dictionary that allows you to specify font, text color, shadow properties, etc., for the letters text, using the keys found in `NSAttributedStringKey`.

If you want to keep the same color for a given name, you can use the following method from `UIColor` extension:
`static func colorHash(name: String?) -> UIColor`

You can get random color using the method `static var random: UIColor`.

##### Example

```
userImageView?.setImage(string: "John DOE", color: .random, circular: true, attributes: [NSAttributedStringKey.font: font.withSize(font.pointSize * 2), NSAttributedStringKey.foregroundColor: UIColor.softBlue])
```

### License

Using the MIT license. See license file for details.

