module Main exposing (..)

import Card exposing (cardView)
import Html exposing (..)
import Search exposing (searchView)


main : Html msg
main =
    div []
        [ cardView, searchView ]
