module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode


-- Model


type alias Model =
    { joke : String }



-- UPDATE


type Msg
    = Submit
    | NewJoke (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Submit ->
            -- TODO: Sent HTTP request
            ( model, getRandomJoke )

        NewJoke (Ok joke) ->
            ( Model joke, Cmd.none )

        NewJoke (Err _) ->
            ( Model "Something went wrong :(", Cmd.none )



-- INIT


init : ( Model, Cmd Msg )
init =
    ( Model "Finding joke...", Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.joke ]
        , br [] []
        , button [ onClick Submit ] [ text "Find" ]
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


getRandomJoke : Cmd Msg
getRandomJoke =
    let
        api_endpoint =
            "http://api.icndb.com/jokes/random"
    in
    Http.send NewJoke (Http.get api_endpoint decodeJokeResponse)


decodeJokeResponse : Decode.Decoder String
decodeJokeResponse =
    Decode.at [ "value", "joke" ] Decode.string
