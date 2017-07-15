module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Navigation exposing (Location)


main : Program Never Model Msg
main =
    Navigation.program locationToMsg
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type Page
    = Home
    | About
    | NotFound


type Msg
    = PageNavigation Page
    | ChangePage Page



-- Model


type alias Model =
    { page : Page }


initModel : Page -> Model
initModel page =
    { page = page }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        page =
            hashToPage location.hash
    in
    initModel page ! []



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PageNavigation page ->
            ( model, Navigation.newUrl <| pageToHash page )

        ChangePage page ->
            { model | page = page } ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- Navigation


pageToHash : Page -> String
pageToHash page =
    case page of
        Home ->
            "#"

        About ->
            "#about"

        NotFound ->
            "#notfound"


hashToPage : String -> Page
hashToPage hash =
    case hash of
        "" ->
            Home

        "#" ->
            Home

        "#about" ->
            About

        _ ->
            NotFound


locationToMsg : Location -> Msg
locationToMsg location =
    location.hash
        |> hashToPage
        |> ChangePage



-- view


view : Model -> Html Msg
view model =
    div []
        [ header_
        , viewToRender model
        ]


homeView : Html Msg
homeView =
    h1 [] [ text "Home" ]


aboutView : Html Msg
aboutView =
    h1 [] [ text "About" ]


viewToRender : Model -> Html Msg
viewToRender model =
    case model.page of
        Home ->
            homeView

        About ->
            aboutView

        NotFound ->
            text "Not found"


header_ : Html Msg
header_ =
    header []
        [ a [ onClick (PageNavigation Home) ] [ text "Home" ]
        , text "|"
        , a [ onClick <| PageNavigation About ] [ text "About" ]
        ]
