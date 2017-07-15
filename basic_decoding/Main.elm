module Main exposing (..)

import Html exposing (..)
import Json.Decode as Decode


json : String
json =
    """
    {
        "type": "success",
        "value": {
            "id": 423,
            "joke": "Chuck Norris had to stop washing his clothes in the ocean. The tsunamis were killing people.",
            "categories": []
        }
    }
    """


jokeDecoder : Decode.Decoder String
jokeDecoder =
    Decode.at [ "value", "joke" ] Decode.string


jokeResult : Result String String
jokeResult =
    Decode.decodeString jokeDecoder json


main : Html msg
main =
    let
        joke =
            case jokeResult of
                Ok result ->
                    result

                Err error ->
                    toString error
    in
    div []
        [ h1 [] [ text "Original JSON" ]
        , p [] [ text json ]
        , h1 [] [ text "Decoded string" ]
        , p [] [ text joke ]
        ]
