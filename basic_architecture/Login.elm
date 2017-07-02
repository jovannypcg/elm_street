module Login exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { username : String
    , password : String
    }


initModel : Model
initModel =
    { username = ""
    , password = ""
    }


type Msg
    = UsernameInput String
    | PasswordInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UsernameInput username ->
            { model | username = username }

        PasswordInput password ->
            { model | password = password }


view : Model -> Html Msg
view model =
    div []
        [ h3 [] [ text "Login page... so far" ]
        , Html.form []
            [ input
                [ type_ "text"
                , onInput UsernameInput
                , placeholder "Username"
                ]
                []
            , input
                [ type_ "password"
                , onInput PasswordInput
                , placeholder "Password"
                ]
                []
            ]
        ]
