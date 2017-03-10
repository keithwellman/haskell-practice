{-# OPTIONS_GHC -Wall #-}

module LogAnalysis where
import Log

parseMessage :: String -> LogMessage
-- ex: parseMessage "E 2 562 help help" == LogMessage (Error 2) 562 "help help"

parseMessage logStr = let listOfWords = words logStr in
                        case listOfWords of
                          ("E":severity:ts:restOfMsg) -> LogMessage
                            (Error $ read severity) (read ts) (unwords restOfMsg)

                          ("W":ts:restOfMsg) -> LogMessage Warning
                            (read ts) (unwords restOfMsg)

                          ("I":ts:restOfMsg) -> LogMessage Info
                            (read ts) (unwords restOfMsg)

                          _ -> Unknown (unwords listOfWords)

parse :: String -> [LogMessage]
parse = map parseMessage . lines
-- get each line and call parseMessage on that line adding the result to a list
