# Cartography

Set up your Auto Layout constraints declaratively and without any stringly
typing!

## How to use

Call the `layout` function with your `UIView` instances as well as a closure in
which you declare the constraints between the different attributes of your
views:

```swift
layout(view1, view2, superview) { view1, view2, superview in
    view1.width   == (superview.width - 50) * 0.5
    view2.width   == view1.width - 50
    view1.height  == 40
    view2.height  == view1.height
    view1.centerX == superview.centerX
    view2.centerX == view1.centerX
 
    view1.top >= superview.top + 20
    view2.top == view1.bottom + 20
}
```

Cartography currently supports the following operators `==`, `>=`, `<=`, `*`,
`/`, `+`, `-` as well as the following attributes: `width`, `height`, `top`,
`right` `bottom`, `left`, `leading`, `trailing`, `centerX`, `centerY` and
`baseline`.

## Setting priorities

You can set the priorities of your constraints using the `~` operator:

```swift
layout(view) { view in
    view.width  >= 200 ~ 100
    view.height >= 200 ~ 100
}
```

## Capturing constraints

Since the `==`, `>=`, `<=` and `~` emit `NSLayoutConstraint` instances, you can
capture their results if you need to refer to the layout constraints at a later
time:

```swift
var width: NSLayoutConstraint?

layout(view) { view in
    width = (view.width == 200 ~ 100)
}
```

## About Cartography

Cartography is written in Swift so it's pretty much beta by definition.
It was inspired by the excellent [FLKAutoLayout] by [Florian Kugler][florian].

[flkautolayout]: https://github.com/floriankugler/FLKAutoLayout
[florian]: https://github.com/floriankugler
