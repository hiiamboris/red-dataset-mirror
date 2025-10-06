results: object [
    addition: 12
    substract: -4
    multiplication: 25
    division: 6
]


test_addition: function [] [
    assert "Testing basics" (4 + 8) == results/addition
    assert "Testing with float" (4 + 4.5) == 8.5
    assert "Testing two floats" (4.3 + 3.7) == 8.0
]

test_substraction: func [] [
    assert "Testing basics" (10 - 5) == 5
    assert "Testing negatives" (4 - 8) == results/substract
    assert "Testing floats" (4 -  3.5) == 0.5
]

test_division: does [
    assert "Testing basics" (12 / 2) == results/division
    assert "Testing negatives numbers" (-21 / 7) == -3
    assert "Testing floats" (3 / 2) == 1.5
]

test_multiplication: does [
    assert "Testing basics" (2 * 5) == 10
    assert "Testing square" (5 * 5) == results/multiplication
    assert "Testing with negatives numbers" (2 * -6) == -12
]
