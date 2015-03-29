# Cartography :iphone::triangular_ruler:

<a href="https://github.com/Carthage/Carthage/issues/179">
    <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" align="right" vspace="2px">
</a>
<a href="https://travis-ci.org/robb/Cartography?branch=master">
    <img src="https://travis-ci.org/robb/Cartography.svg?branch=master" align="right" vspace="2px" hspace="5px">
</a>

Set up your Auto Layout constraints declaratively and without any stringly
typing!

If you end up using Cartography in production, I'd love to hear from you. You
can reach me through [Twitter] or [email].

## Usage

Call the `layout` function with your `UIView` or `NSView` instances as well as a
closure in which you declare the constraints between the different attributes of
your views:

```swift
layout(view1, view2) { view1, view2 in
    view1.width   == (view1.superview!.width - 50) * 0.5
    view2.width   == view1.width - 50
    view1.height  == 40
    view2.height  == view1.height
    view1.centerX == view1.superview!.centerX
    view2.centerX == view1.centerX

    view1.top >= view1.superview!.top + 20
    view2.top == view1.bottom + 20
}
```

For every view on the left hand side of an equality or inequality operator,
Cartography will automatically set its
`translatesAutoresizingMaskIntoConstraints` property to `false`. If the view is
not controlled by you–for example if it belongs to a Apple-provided
`UIViewController` class–you should take appropriate care when declaring its
constraints.

Note that `layout` will automatically relayout the views as necessary. If you
instead want to trigger the layouting step yourself, you can instead use the
`constrain` function:

```swift
constrain(view1) { view1 in
    view1.width  == 100
    view1.height == 100
    view1.center == view.superview!.center
}

UIView.animateWithDuration(0.5, animations: view1.layoutIfNeeded)
```

## Replacing constraints

You can capture multiple constraints in a group to then replace them with new
constraints at a later point.

```swift
constrain(view) { view in
    view.width  == 100
    view.height == 100
}

let group = ConstraintGroup()

// Attach `view` to the top left corner of its superview
constrain(view, replace: group) { view in
    view.top  == view.superview!.top
    view.left == view.superview!.left
}

/* Later */

// Move the view to the bottom right corner of its superview
constrain(view, replace: group) { view in
    view.bottom == view.superview!.bottom
    view.right  == view.superview!.right
}

UIView.animateWithDuration(0.5, animations: view.layoutIfNeeded)
```

For convenience, the `layout` and `constrain` functions also return
`ConstraintGroup` instances:

```swift
let group = layout(button) { button in
    button.width  == 100
    button.height == 400
}
```

## Supported attributes

Cartography supports all built-in attributes as of iOS 8 and OS X 10.9, those
are:

- `width`
- `height`
- `top`
- `right`
- `bottom`
- `left`
- `leading`
- `trailing`
- `centerX`
- `centerY`
- `baseline`

as well as the iOS specific

- `firstBaseline`
- `leftMargin`
- `rightMargin`
- `topMargin`
- `bottomMargin`
- `leadingMargin`
- `trailingMargin`
- `centerXWithinMargins`
- `centerYWithinMargins`

These can be further refined using the following operators: `*`, `/`, `+` and
`-`.

Additionally, it supports convenient compound attributes that allow you to
assign multiple attributes at once:

```swift
layout(view) { view in
    view.size   == view.superview!.size / 2
    view.center == view.superview!.center
}
```

```swift
layout(view) { view in
    view.edges == inset(view.superview!.edges, 20, 20, 40, 20); return
}
```

(We need to return explicitly here to work around [a bug in
Swift](https://github.com/robb/Cartography/issues/9), this only affects single
line blocks, however.)

### Aligning multiple view

If you need to align multiple views by a common edge, you can use the `align`
functions:

```swift
layout(view1, view2, view3) { view1, view2, view3 in
    align(top: view1, view2, view3); return
}
```

Which is equivalent to `view1.top == view2.top; view2.top == view3.top`. Similar
variants exist for `top`, `right` `bottom`, `left`, `leading`, `trailing`,
`centerX`, `centerY` and `baseline`.

### Distributing views evenly

For distributing multiple views, either horizontally or vertically, you can use
the `distribute` functions:

```swift
layout(view1, view2, view3) { view1, view2, view3 in
    distribute(by: 10, horizontally: view1, view2, view3); return
}
```

Which is equivalent to `view1.trailing == view2.leading - 10; view2.trailing == view3.leading - 10`.

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
    width = (view.width == 200 ~ 100); return
}
```

Note that declaring compound attributes returns multiple constraints at once:

```swift
var constraints: [NSLayoutConstraint]?

layout(view) { view in
    constraints = (view.size == view.superview!.size ~ 100); return
}
```

## Support

Please, don't hesitate to [file an
issue](https://github.com/robb/Cartography/issues/new) if you have questions.

## About Cartography

Cartography was built by [Robb Böhnke][me] and was inspired by the excellent
[FLKAutoLayout] by [Florian Kugler][florian].

[flkautolayout]: https://github.com/floriankugler/FLKAutoLayout
[florian]:       https://github.com/floriankugler
[me]:            http://robb.is
[twitter]:       https://twitter.com/ceterum_censeo
[email]:         mailto:robb@robb.is
