port module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as D

-- MAIN
main : Program () Model Msg
main =
  Browser.element
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- PORTS
port sendMessage : String -> Cmd msg
port messageReceiver : (String -> msg) -> Sub msg

-- MODEL
type alias Model =
  { draft : String
  , messages : List String
  }

init : () -> ( Model, Cmd Msg )
init flags =
  ( { draft = "", messages = [] }
  , Cmd.none
  )

-- UPDATE
type Msg = MoveLeft | MoveRight | MoveUp | MoveDown | OpenJaw | CloseJaw | Recv String

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    MoveLeft ->
        ( { model | draft = "" }
        , sendMessage "left"
        )

    MoveRight ->
        ( { model | draft = "" }
        , sendMessage "right"
        )

    MoveUp ->
        ( { model | draft = "" }
        , sendMessage "up"
        )

    MoveDown ->
        ( { model | draft = "" }
        , sendMessage "down"
        )

    OpenJaw ->
        ( { model | draft = "" }
        , sendMessage "open"
        )

    CloseJaw ->
        ( { model | draft = "" }
        , sendMessage "close"
        )

    Recv message ->
        ( { model | messages = model.messages ++ [message] }
        , Cmd.none
        )

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions _ =
  messageReceiver Recv

-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ h1 [] [ text "Control-o-Rex" ]
    , button [ onClick MoveUp ] [ text "Up" ]
    , button [ onClick MoveDown ] [ text "Down" ]
    , div [] []
    , button [ onClick MoveLeft ] [ text "Move Left" ]
    , button [ onClick MoveRight ] [ text "Move Right" ]
    , div [] []
    , button [ onClick OpenJaw ] [ text "Open Jaw" ]
    , button [ onClick CloseJaw ] [ text "Close Jaw" ]
        
    ]


