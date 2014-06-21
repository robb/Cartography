# Cartography

Set up your Auto Layout constraints declaratively and without any stringly
typing!

## How to use

Call the `layout` function with your `UIView` instances as well as a closure in
which you declare the constraints between the different attributes of your
views:

```swift
layout(view1, view2) { view1, view2 in
    view1.width   == (view.superview!.width - 50) * 0.5
    view2.width   == view1.width - 50
    view1.height  == 40
    view2.height  == view1.height
    view1.centerX == view.superview!.centerX
    view2.centerX == view1.centerX
 
    view1.top >= view.superview!.top + 20
    view2.top == view1.bottom + 20
}
```

## Supported attributes

Cartography supports all built-in attributes as of iOS 7, those are: `width`,
`height`, `top`, `right` `bottom`, `left`, `leading`, `trailing`, `centerX`,
`centerY` and `baseline`. These can be further refined using the following
operators: `*`, `/`, `+` and `-`.

Additionally, it supports convenient compound attibutes allow you to assign multiple attibutes at once:

```swift
layout(view) { view in
    view.size   == view.superview!.size / 2
    view.center == view.superview!.center
}
```

```swift
layout(view) { view in
    view.edges == inset(view.superview!.edges, 20, 20, 40, 20)
}
```

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

Note that declaring compound attibutes returns multiple constraints at once:

```swift
var constraints: NSLayoutConstraint[]?

layout(view) { view in
    constraints = (view.size == view.superview!.size ~ 100)
}
```

## About Cartography

Cartography is written in Swift so it's pretty much beta by definition.
It was inspired by the excellent [FLKAutoLayout] by [Florian Kugler][florian].

[flkautolayout]: https://github.com/floriankugler/FLKAutoLayout
[florian]: https://github.com/floriankugler
