import Cartography
import Quick
import Nimble

public func translateAutoresizingMasksToConstraints() -> NonNilMatcherFunc<View> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        let view = try! actualExpression.evaluate()

        failureMessage.expected = "expected \(view?.description)"
        failureMessage.actualValue = nil
        failureMessage.postfixMessage = "translate autoresizing masks to constraints"

        return view?.translatesAutoresizingMaskIntoConstraints ?? false
    }
}
