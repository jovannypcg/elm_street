module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- Model


type alias Model =
    { joke : String }



-- Update


type Msg
    = FindJoke
    | NewJoke (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FindJoke ->
            ( model, getRandomJoke )

        NewJoke (Err error) ->
            ( { model | joke = "something went wrong" }, Cmd.none )

        NewJoke (Ok joke) ->
            ( { model | joke = joke }, Cmd.none )



-- Init


init : ( Model, Cmd Msg )
init =
    ( { joke = "Finding Joke..." }, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    div []
        [ h4 [] [ text model.joke ]
        , br [] []
        , button [ onClick FindJoke ] [ text "Find" ]
        ]


getRandomJoke : Cmd Msg
getRandomJoke =
    let
        endpoint =
            "http://api.icndb.com/jokes/random"

        request =
            Http.get endpoint decodeResponse
    in
    Http.send NewJoke request


decodeResponse : Decode.Decoder String
decodeResponse =
    Decode.at [ "value", "joke" ] Decode.string
