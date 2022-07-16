module Picshare exposing (main)

import Html exposing (Html, div, h1, h2, img, text)
import Html.Attributes exposing (class, src)


main : Html msg



-- 返り値は仮想 DOM を意味する型


main =
    div []
        [ div [ class "header" ] [ h1 [] [ text "Picshare" ] ]
        , div [ class "content-flow" ]
            [ viewDetailedPhoto (baseUrl ++ "1.jpg")
                "surfing"
            , viewDetailedPhoto
                (baseUrl ++ "2.jpg")
                "The fox"
            , viewDetailedPhoto
                (baseUrl ++ "3.jpg")
                "evening"
            ]
        ]


viewDetailedPhoto : String -> String -> Html msg
viewDetailedPhoto url caption =
    div [ class "detailed-photo" ] [ img [ src url ] [], div [ class "photo-info" ] [ h2 [ class "caption" ] [ text caption ] ] ]


baseUrl : String
baseUrl =
    "https://programming-elm.com/"
