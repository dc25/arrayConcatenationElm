import Array as A exposing (append, fromList, toList)
import String as S exposing (toList, fromList)
import Html exposing (Html, Attribute, text, div, h1, h2, input)
import Html.Attributes exposing (value)
import Html.Events exposing (on, targetValue)
import Html.App exposing (beginnerProgram)
import Json.Decode exposing (map)


type alias Model = (String String)

update newModel oldModel = newModel

view : (String, String) -> Html (String, String)
view (string0, string1) =
  div []
    (  [ h1 [] [text "Array Concatenation"] ] 

    ++ [ h2 [] [text "Take two strings, convert them into arrays, concatenate the arrays, convert back to string, display result:" ] ] 

    ++ [ input
           [ value string0
           , on "input" (map (\st -> (st, string1)) targetValue )
           ]
           []
       ] 

    ++ [ text "+" ] 

    ++ [ input
           [ value string1
           , on "input" (map (\st -> (string0, st)) targetValue)
           ]
           []
       ] 

    ++ [ text "=" ] 

    ++ [ let array0 = A.fromList (S.toList string0)
             array1 = A.fromList (S.toList string1)
             joinedArray = A.append array0 array1
             joinedString = S.fromList (A.toList joinedArray)
         in text joinedString 
       ]
    )

main = beginnerProgram { model = ("","")
                       , update = update
                       , view = view 
                       }
