module Search exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


searchView : Html msg
searchView =
    div [ class "fixed-action-btn horizontal" ]
        [ a [ class "btn-floating btn-large red" ]
            [ i [ class "large material-icons" ] [ text "search" ] ]
        , ul []
            [ li [ class "waves-effect waves-light" ] [ searchForm ] ]
        ]


searchForm : Html msg
searchForm =
    Html.form []
        [ div [ class "input-field" ]
            [ input [ id "search", type_ "search", placeholder "type me" ] [] ]
        ]



-- <div class="fixed-action-btn horizontal">
--     <a class="btn-floating btn-large red">
--       <i class="large material-icons">mode_edit</i>
--     </a>
--     <ul>
--       <li><a class="btn-floating red"><i class="material-icons">insert_chart</i></a></li>
--       <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
--       <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
--       <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
--     </ul>
--   </div>
