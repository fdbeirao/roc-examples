#!/usr/bin/env bash

# https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euxo pipefail

roc='./roc_nightly/roc'

$roc build ./examples/HelloWorld/main.roc
expect ci_scripts/expect_scripts/HelloWorld.exp

$roc build ./examples/Arithmetic/main.roc
expect ci_scripts/expect_scripts/Arithmetic.exp

$roc build ./examples/FizzBuzz/main.roc
$roc test ./examples/FizzBuzz/main.roc
expect ci_scripts/expect_scripts/FizzBuzz.exp

$roc test ./examples/GraphTraversal/Graph.roc

$roc build ./examples/Json/main.roc
expect ci_scripts/expect_scripts/Json.exp

$roc build ./examples/LeastSquares/main.roc
expect ci_scripts/expect_scripts/LeastSquares.exp

$roc build ./examples/Parser/main.roc
$roc test ./examples/Parser/main.roc
expect ci_scripts/expect_scripts/Parser.exp

$roc test ./examples/PatternMatching/PatternMatching.roc

$roc build ./examples/RandomNumbers/main.roc
expect ci_scripts/expect_scripts/RandomNumbers.exp

$roc build ./examples/TowersOfHanoi/main.roc
$roc test ./examples/TowersOfHanoi/Hanoi.roc
expect ci_scripts/expect_scripts/TowersOfHanoi.exp

# test building website
$roc run main.roc -- examples build
