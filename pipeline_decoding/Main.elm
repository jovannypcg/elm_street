module Main exposing (..)

import Data exposing (singleUserJson, usersJson)
import Html exposing (..)
import Json.Decode exposing (Decoder, at, decodeString, int, list, string)
import Json.Decode.Pipeline exposing (decode, hardcoded, optional, required)


type alias User =
    { email : String
    , username : String
    , favorites : List Int
    }


userDecoder : Decoder User
userDecoder =
    decode User
        |> required "email" string
        |> required "username" string
        |> optional "favorites" (list int) []


usersDecoder : Decoder (List User)
usersDecoder =
    list userDecoder


decodedUser : Result String User
decodedUser =
    let
        decoder =
            at [ "data" ] userDecoder
    in
    singleUserJson
        |> decodeString decoder


decodedUsers : Result String (List User)
decodedUsers =
    let
        decoder =
            at [ "data" ] usersDecoder
    in
    usersJson
        |> decodeString decoder


main : Html msg
main =
    let
        usr =
            case decodedUser of
                Ok user ->
                    user

                Err error ->
                    User "" "" []

        users =
            case decodedUsers of
                Ok usrs ->
                    usrs

                Err error ->
                    [ User "unknown" (toString error) [] ]

        texts =
            [ "uno", "dos", "tres" ]
    in
    div []
        [ p [] [ text ("email ======> " ++ usr.email) ]
        , p [] [ text ("username ===> " ++ usr.username) ]
        , p [] [ text ("favorites ===> " ++ toString usr.favorites) ]
        , section []
            [ h1 [] [ text "list" ]
            , br [] []
            , ul [] (List.map parseUser users)
            ]
        ]


parseText : String -> Html msg
parseText txt =
    li [] [ text txt ]


parseUser : User -> Html msg
parseUser user =
    li []
        [ text (user.email ++ " ---> " ++ user.username ++ " ---> " ++ toString user.favorites) ]
