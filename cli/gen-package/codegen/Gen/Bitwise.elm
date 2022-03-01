module Gen.Bitwise exposing (and, call_, complement, moduleName_, or, shiftLeftBy, shiftRightBy, shiftRightZfBy, values_, xor)

{-| 
@docs moduleName_, and, or, xor, complement, shiftLeftBy, shiftRightBy, shiftRightZfBy, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Bitwise" ]


{-| Bitwise AND
-}
and : Int -> Int -> Elm.Expression
and arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "and"
            , annotation = Just (Type.function [ Type.int, Type.int ] Type.int)
            }
        )
        [ Elm.int arg1, Elm.int arg2 ]


{-| Bitwise OR
-}
or : Int -> Int -> Elm.Expression
or arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "or"
            , annotation = Just (Type.function [ Type.int, Type.int ] Type.int)
            }
        )
        [ Elm.int arg1, Elm.int arg2 ]


{-| Bitwise XOR
-}
xor : Int -> Int -> Elm.Expression
xor arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "xor"
            , annotation = Just (Type.function [ Type.int, Type.int ] Type.int)
            }
        )
        [ Elm.int arg1, Elm.int arg2 ]


{-| Flip each bit individually, often called bitwise NOT
-}
complement : Int -> Elm.Expression
complement arg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "complement"
            , annotation = Just (Type.function [ Type.int ] Type.int)
            }
        )
        [ Elm.int arg1 ]


{-| Shift bits to the left by a given offset, filling new bits with zeros.
This can be used to multiply numbers by powers of two.

    shiftLeftBy 1 5 == 10
    shiftLeftBy 5 1 == 32
-}
shiftLeftBy : Int -> Int -> Elm.Expression
shiftLeftBy arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "shiftLeftBy"
            , annotation = Just (Type.function [ Type.int, Type.int ] Type.int)
            }
        )
        [ Elm.int arg1, Elm.int arg2 ]


{-| Shift bits to the right by a given offset, filling new bits with
whatever is the topmost bit. This can be used to divide numbers by powers of two.

    shiftRightBy 1  32 == 16
    shiftRightBy 2  32 == 8
    shiftRightBy 1 -32 == -16

This is called an [arithmetic right shift][ars], often written `>>`, and
sometimes called a sign-propagating right shift because it fills empty spots
with copies of the highest bit.

[ars]: https://en.wikipedia.org/wiki/Bitwise_operation#Arithmetic_shift
-}
shiftRightBy : Int -> Int -> Elm.Expression
shiftRightBy arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "shiftRightBy"
            , annotation = Just (Type.function [ Type.int, Type.int ] Type.int)
            }
        )
        [ Elm.int arg1, Elm.int arg2 ]


{-| Shift bits to the right by a given offset, filling new bits with zeros.

    shiftRightZfBy 1  32 == 16
    shiftRightZfBy 2  32 == 8
    shiftRightZfBy 1 -32 == 2147483632

This is called an [logical right shift][lrs], often written `>>>`, and
sometimes called a zero-fill right shift because it fills empty spots with
zeros.

[lrs]: https://en.wikipedia.org/wiki/Bitwise_operation#Logical_shift
-}
shiftRightZfBy : Int -> Int -> Elm.Expression
shiftRightZfBy arg1 arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "shiftRightZfBy"
            , annotation = Just (Type.function [ Type.int, Type.int ] Type.int)
            }
        )
        [ Elm.int arg1, Elm.int arg2 ]


call_ :
    { and : Elm.Expression -> Elm.Expression -> Elm.Expression
    , or : Elm.Expression -> Elm.Expression -> Elm.Expression
    , xor : Elm.Expression -> Elm.Expression -> Elm.Expression
    , complement : Elm.Expression -> Elm.Expression
    , shiftLeftBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , shiftRightBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , shiftRightZfBy : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { and =
        \arg1 arg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Bitwise" ]
                    , name = "and"
                    , annotation =
                        Just (Type.function [ Type.int, Type.int ] Type.int)
                    }
                )
                [ arg1, arg2 ]
    , or =
        \arg1 arg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Bitwise" ]
                    , name = "or"
                    , annotation =
                        Just (Type.function [ Type.int, Type.int ] Type.int)
                    }
                )
                [ arg1, arg2 ]
    , xor =
        \arg1 arg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Bitwise" ]
                    , name = "xor"
                    , annotation =
                        Just (Type.function [ Type.int, Type.int ] Type.int)
                    }
                )
                [ arg1, arg2 ]
    , complement =
        \arg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Bitwise" ]
                    , name = "complement"
                    , annotation = Just (Type.function [ Type.int ] Type.int)
                    }
                )
                [ arg1 ]
    , shiftLeftBy =
        \arg1 arg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Bitwise" ]
                    , name = "shiftLeftBy"
                    , annotation =
                        Just (Type.function [ Type.int, Type.int ] Type.int)
                    }
                )
                [ arg1, arg2 ]
    , shiftRightBy =
        \arg1 arg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Bitwise" ]
                    , name = "shiftRightBy"
                    , annotation =
                        Just (Type.function [ Type.int, Type.int ] Type.int)
                    }
                )
                [ arg1, arg2 ]
    , shiftRightZfBy =
        \arg1 arg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Bitwise" ]
                    , name = "shiftRightZfBy"
                    , annotation =
                        Just (Type.function [ Type.int, Type.int ] Type.int)
                    }
                )
                [ arg1, arg2 ]
    }


values_ :
    { and : Elm.Expression
    , or : Elm.Expression
    , xor : Elm.Expression
    , complement : Elm.Expression
    , shiftLeftBy : Elm.Expression
    , shiftRightBy : Elm.Expression
    , shiftRightZfBy : Elm.Expression
    }
values_ =
    { and =
        Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "and"
            , annotation = Just (Type.function [ Type.int, Type.int ] Type.int)
            }
    , or =
        Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "or"
            , annotation = Just (Type.function [ Type.int, Type.int ] Type.int)
            }
    , xor =
        Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "xor"
            , annotation = Just (Type.function [ Type.int, Type.int ] Type.int)
            }
    , complement =
        Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "complement"
            , annotation = Just (Type.function [ Type.int ] Type.int)
            }
    , shiftLeftBy =
        Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "shiftLeftBy"
            , annotation = Just (Type.function [ Type.int, Type.int ] Type.int)
            }
    , shiftRightBy =
        Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "shiftRightBy"
            , annotation = Just (Type.function [ Type.int, Type.int ] Type.int)
            }
    , shiftRightZfBy =
        Elm.value
            { importFrom = [ "Bitwise" ]
            , name = "shiftRightZfBy"
            , annotation = Just (Type.function [ Type.int, Type.int ] Type.int)
            }
    }


