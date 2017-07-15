module Card exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


cardView : Html msg
cardView =
    div [ class "row" ]
        [ div [ class "col s12 m7" ]
            [ div [ class "card" ]
                [ div [ class "card-image" ]
                    [ img [ src "http://materializecss.com/images/sample-1.jpg" ] []
                    , span [ class "card-title" ] [ text "Card title" ]
                    ]
                , div [ class "card-content" ]
                    [ p
                        []
                        [ text "I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively." ]
                    ]
                , div [ class "card-action" ]
                    [ a [ href "#" ] [ text "This is a link" ] ]
                ]
            ]
        ]
