module Picshare exposing (main)

import Html exposing (Html, div, h1, h2, i, img, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)


initialModel : { url : String, caption : String, liked : Bool }
initialModel =
    { url = baseUrl ++ "1.jpg"
    , caption = "surfing"
    , liked = False
    }


type Msg
    = Like
    | Unlike


main : Html Msg



-- 返り値は仮想 DOM を意味する型


main =
    view initialModel


view : { url : String, caption : String, liked : Bool } -> Html Msg
view model =
    div []
        [ div [ class "header" ] [ h1 [] [ text "Picshare" ] ]
        , div [ class "content-flow" ]
            [ viewDetailedPhoto
                { url = model.url
                , caption = model.caption
                , liked = model.liked
                }
            ]
        ]


viewDetailedPhoto : { url : String, caption : String, liked : Bool } -> Html Msg
viewDetailedPhoto model =
    let
        buttonClass =
            if model.liked then
                "fa fa-heart"

            else
                "fa fa-heart-o"

        msg =
            if model.liked then
                Unlike

            else
                Like
    in
    div [ class "detailed-photo" ] [ img [ src model.url ] [], div [ class "photo-info" ] [ div [ class "like-button" ] [ i [ class "fa fa-2x", class buttonClass, onClick msg ] [] ], h2 [ class "caption" ] [ text model.caption ] ] ]


baseUrl : String
baseUrl =
    "https://programming-elm.com/"
