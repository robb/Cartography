import Cartography
import Quick
import Nimble

public func translateAutoresizingMasksToConstraints() -> Predicate<View> {
    return Predicate<View> { expression -> PredicateResult in
        guard let view = try expression.evaluate() else {
            return PredicateResult(status: .fail, message: .fail("expected valid view, got <nil>"))
        }

        return PredicateResult(bool: view.translatesAutoresizingMaskIntoConstraints,
                               message: .expectedTo("translate autoresizing masks to constraints"))
    }
}
