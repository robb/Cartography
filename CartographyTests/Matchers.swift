import Cartography
import Nimble

public func translateAutoresizingMasksToConstraints() -> NonNilMatcherFunc<View> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        let view = actualExpression.evaluate()

        failureMessage.expected = "expected \(view?.description ?? view)"
        failureMessage.actualValue = nil
        failureMessage.postfixMessage = "translate autoresizing masks to constraints"

        return view?.car_translatesAutoresizingMaskIntoConstraints ?? false
    }
}
