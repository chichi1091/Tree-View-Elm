module Main exposing (..)

import Html exposing (Html, text, div, ul, li)

---- MODEL ----
type alias Data =
    {
        name: String
        , childs: List String
    }
    
type alias Person =
    {
        name: String
        , lists : List Data
    }

child : Data
child = {
    name = "child folder"
    , childs = [
        "hello"
        , "wat"]
    }

person : Person
person =
    {
        name = "My Tree"
        , lists = [
            Data "hello" []
            , Data "wat" []
            , child
            , Data "hello2" []
            , Data "wat2" []
            , child
        ]
    }

type alias Model =
    {data: Person}

init : ( Model, Cmd Msg )
init =
    ( {data = person}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    let
        top = model.data.name


        data2li value =
            let
                child = 
                    List.map(\x -> li[] [text x]) value.childs
            in
                ul[]
                [
                    li [] [text value.name]
                    , ul[]
                        child
                ]

        data2child value =
                ul[]
                <| List.map(\x -> li[] [text x]) value.childs

        data2liList =
            List.map (\x -> data2li x) model.data.lists
                
    in
        div []
            [
                ul []
                    [
                        li [] [text top]
                         , div[]    -- dummy...
                            data2liList
                    ]
            ]


---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
