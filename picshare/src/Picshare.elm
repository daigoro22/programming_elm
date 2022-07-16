module Picshare exposing (main)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)


main : Html msg



-- 返り値は仮想 DOM を意味する型


main =
    div [ class "header" ] [ h1 [] [ text "Picshare" ] ]
