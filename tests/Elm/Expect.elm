module Elm.Expect exposing (declarationAs, equal, infersType, renderedAs)

import Elm
import Elm.ToString
import Expect exposing (Expectation)
import Internal.Compiler as Compiler


renderedAs : Elm.Expression -> String -> Expectation
renderedAs expression str =
    Expect.equal
        (Elm.ToString.expression expression
            |> .body
        )
        (String.trim str)


declarationAs : Elm.Declaration -> String -> Expectation
declarationAs decl str =
    Expect.equal
        (Elm.ToString.declaration decl
            |> .body
        )
        (String.trim str)


infersType : Elm.Expression -> Expectation
infersType expression =
    let
        ( _, details ) =
            Compiler.toExpressionDetails Compiler.startIndex expression
    in
    case details.annotation of
        Ok _ ->
            Expect.pass

        Err errs ->
            Expect.fail
                ("Failed to typecheck"
                    ++ String.join "\n"
                        (List.map Compiler.inferenceErrorToString errs)
                )


equal : Elm.Expression -> Elm.Expression -> Expectation
equal one two =
    Expect.equal
        (Elm.ToString.expression one
            |> .body
        )
        (Elm.ToString.expression two
            |> .body
        )