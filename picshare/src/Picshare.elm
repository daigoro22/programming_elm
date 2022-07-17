module Picshare exposing (main)

import Html exposing (Html, div, h1, h2, img, text)
import Html.Attributes exposing (class, src)


initialModel : { url : String, caption : String }
initialModel =
    { url = baseUrl ++ "1.jpg"
    , caption = "surfing"
    }


main : Html msg



-- 返り値は仮想 DOM を意味する型


main =
    view initialModel


view : { url : String, caption : String } -> Html msg
view model =
    div []
        [ div [ class "header" ] [ h1 [] [ text "Picshare" ] ]
        , div [ class "content-flow" ]
            [ viewDetailedPhoto
                { url = model.url
                , caption = model.caption
                }
            ]
        ]


viewDetailedPhoto : { url : String, caption : String } -> Html msg
viewDetailedPhoto model =
    div [ class "detailed-photo" ] [ img [ src model.url ] [], div [ class "photo-info" ] [ h2 [ class "caption" ] [ text model.caption ] ] ]


baseUrl : String
baseUrl =
    "https://programming-elm.com/"
