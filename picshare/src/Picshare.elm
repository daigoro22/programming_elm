module Picshare exposing (main)

import Browser
import Html exposing (Html, button, div, form, h1, h2, i, img, input, li, strong, text, ul)
import Html.Attributes exposing (class, placeholder, src, type_)
import Html.Events exposing (onClick)


type alias Model =
    { url : String, caption : String, liked : Bool, comments : List String, newComment : String }


initialModel : Model
initialModel =
    { url = baseUrl ++ "1.jpg"
    , caption = "surfing"
    , liked = False
    , comments = [ "いい波乗ってんね！" ]
    , newComment = ""
    }


type Msg
    = ToggleLike


main : Program () Model Msg



-- 返り値は仮想 DOM を意味する型


main =
    Browser.sandbox { init = initialModel, view = view, update = update }


view : Model -> Html Msg
view model =
    div []
        [ div [ class "header" ] [ h1 [] [ text "Picshare" ] ]
        , div [ class "content-flow" ]
            [ viewDetailedPhoto model
            ]
        ]


viewLoveButton : Model -> Html Msg
viewLoveButton model =
    let
        buttonClass =
            if model.liked then
                "fa fa-heart"

            else
                "fa fa-heart-o"
    in
    div [ class "like-button" ] [ i [ class "fa fa-2x", class buttonClass, onClick ToggleLike ] [] ]


viewDetailedPhoto : Model -> Html Msg
viewDetailedPhoto model =
    div [ class "detailed-photo" ] [ img [ src model.url ] [], div [ class "photo-info" ] [ viewLoveButton model, h2 [ class "caption" ] [ text model.caption ], viewComments model ] ]


viewComment : String -> Html Msg
viewComment comment =
    li [] [ strong [] [ text "Comment:" ], text <| " " ++ comment ]


viewCommentList : List String -> Html Msg
viewCommentList comments =
    case comments of
        [] ->
            text ""

        _ ->
            div [ class "comments" ] [ ul [] (List.map viewComment comments) ]


viewComments : Model -> Html Msg
viewComments model =
    div [] [ viewCommentList model.comments, form [ class "new-comment" ] [ input [ type_ "text", placeholder "Add a comment..." ] [], button [] [ text "Save" ] ] ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleLike ->
            { model | liked = not model.liked }


baseUrl : String
baseUrl =
    "https://programming-elm.com/"
