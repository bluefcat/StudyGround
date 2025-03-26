m = [("1", "1"), ("2", "2")]

findKey' :: (Eq k) => k -> [(k, v)] -> Maybe v

findKey' key [] = Nothing
findKey' key ((k,v):xs) = if key == k then Just v else findKey' key xs
