import Array as A exposing (append, fromList, toList)
import String as S exposing (toList, fromList)
import Html exposing (Html, Attribute, text, div, h1, h2, input)
import Html.Attributes exposing (value)
import Html.Events exposing (onInput, targetValue)
import Html.App exposing (beginnerProgram)
import Json.Decode exposing (map)

type alias Model = (String String)

type Msg = Change0 String | Change1 String

update msg (old0, old1) = 
  case msg of
    Change0 new0 -> (new0, old1)
    Change1 new1 -> (old0, new1)

view : (String, String) -> Html Msg
view (string0, string1) =
  div []
    (  [ h1 [] [text "Array Concatenation"] ] 
    ++ [ h2 [] [text "Convert two strings into arrays, concatenate the arrays, convert back to string, display result:" ] ] 
    ++ [ input [ value string0 , onInput Change0 ] [] ]       -- Enter first string
    ++ [ text "+" ] 
    ++ [ input [ value string1 , onInput Change1 ] [] ]       -- Enter second string
    ++ [ text "=" ] 
    ++ [ let array0       = A.fromList (S.toList string0)     -- create first array
             array1       = A.fromList (S.toList string1)     -- create second array
             joinedArray  = A.append array0 array1            -- Array Concatenation
             joinedString = S.fromList (A.toList joinedArray) -- convert back to string
         in text joinedString                                 -- display result
       ]
    )

main = beginnerProgram { model = ("","")
                       , update = update
                       , view = view 
                       }
