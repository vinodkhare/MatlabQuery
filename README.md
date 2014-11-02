MatlabQuery
===========

[Language Integrated Query (LINQ)](http://en.wikipedia.org/wiki/Language_Integrated_Query)
is a Microsoft .NET Framework component that adds SQL-like query expressions to .NET languages.
MatlabQuery is a class implementing similar methods for extracting and processing sequences
 in Matlab. A common interface is presented for numeric arrays, character arrays, cell arrays, 
structure and object arrays.

## Installation
Download [MatlabQuery](https://github.com/brian-lau/MatlabQuery/archive/develop.zip), 
add the `@linq` directory to your Matlab path, and you're ready to go.

Install Steve Eddins's [xUnit test framework](http://www.mathworks.com/matlabcentral/fileexchange/22846-matlab-xunit-test-framework) 
 to run the unit tests.

# Examples
```
query =  linq();

% Numeric array
numbers = randi(10,1,20);
% Sort and keep elements with values < 5
s = query(numbers).sort.takeWhile(@(x) x < 5).toArray;
% Transform and keep first value > 100, if it exists
s = query(numbers).select(@(x) x^2).firstOrDefault(@(x) x >= 100);

% Cell array
words = {'aPPLE', 'BlUeBeRrY', 'cHeRry'};
s = query(words).select(@(x) struct('Upper',upper(x),'Lower',lower(x))).toArray;

% Create a struct array with two fields with numeric values
structs = query(9:-1:0).select(@(x,i) struct('a',x,'b',i)).toArray;
% Return the struct where fields match
s = query(structs).where(@(x) x.a==x.b).toArray

```

# Implemented query operators
Work is in progress to implement all the standard LINQ operators.

## Aggregration
| LINQ       | Matlab    | |
|------------|-----------|-|
| Aggregrate |           | |
| Average    |           | |
| Count      | count     | Count # of elements in sequence |
| Max        |           | |
| Min        |           | |
| Sum        |           | |

## Concatenation
| LINQ   | Matlab |
|--------|--------|
| Concat | concat | Concatenate sequences

## Conversion
| LINQ         | Matlab       | |
|--------------|--------------|-|
| AsEnumerable |              | |
| Cast         |              | |
| OfType       | ofType       | Filters the elements of a sequence based on a type |
| ToArray      | toArray      | Creates an array from a sequence |
| ToDictionary | toDictionary | Creates a dictionary from a sequence |
| ToList       | toList       | Creates a cell array from a sequence |

## Element
| LINQ               | Matlab         | |
|--------------------|----------------|-|
| DefaultIfEmpty     |                | |
| ElementAt          | elementAt      | Returns element at a given index in a sequence |
| ElementAtOrDefault |                | |
| First              | first          | Returns first element of sequence |
| FirstOrDefault     | firstOrDefault | Returns first element of sequence, or default|
| Last               | last           | Returns last element of sequence|
| LastOrDefault      | lastOrDefault  | Returns last element of sequence, or default|
| Single             |                | |
| SingleOrDefault    |                | |

## Equality
| LINQ          | Matlab    |
|---------------|-----------|
| sequenceEqual |           |

## Generation
| LINQ   | Matlab | |
|--------|--------|-|
| Empty  | empty  | Empty sequence |
| Range  |        | |
| Repeat |        | |

## Join
| LINQ      | Matlab | |
|-----------|--------|-|
| GroupJoin |        | |
| Join      | join   | Inner join based on matching keys extracted from the elements |

## Ordering
| LINQ              | Matlab    | |
|-------------------|-----------|-|
| OrderBy           |           | |
| OrderByDescending |           | |
| ThenBy            |           | |
| ThenByDescending  |           | |
|                   | randomize | Randomize sequence order (w/ or w/out replacement) |
| Reverse           | reverse   | Reverse sequence order |
|                   | sort      | Sort sequence |
|                   | shuffle   | Randomly ermute sequence order |

## Partition
| LINQ      | Matlab    | |
|-----------|-----------|-|
| Skip      | skip      | Skips elements from a sequence yielding the remainder |
| SkipWhile | skipWhile | Skips elements satisfying condition, yielding the remainder |
| Take      | take      | Takes elements from a sequence skipping the remainder |
| TakeWhile | takeWhile | Takes elements satisfying condition, skipping the remainder |

## Projection
| LINQ       | Matlab     | |
|------------|------------|-|
| Select     | select     | Evaluate function for each sequence element |
| SelectMany | selectMany | One-to-many element projection over a sequence |

## Quantifiers
| LINQ     | Matlab   | |
|----------|----------|-|
| All      | all      | Checks if all elements of a sequence satisfy a condition |
| Any      | any      | Checks if any element of a sequence satisfies a condition |
| Contains | contains | Checks if a sequence contains a given element |

## Restriction
| LINQ  | Matlab | |
|-------|--------|-|
| Where | where  | Yields elements where the predicate function returns true |

## Set
| LINQ      | Matlab   |
|-----------|----------|
| Distinct  | distinct | Yields unique sequence |
| Except    |          |
| Intersect |          |
| Union     |          |

Contributions
--------------------------------
Copyright (c) 2014 Brian Lau [brian.lau@upmc.fr](mailto:brian.lau@upmc.fr), see [LICENSE](https://github.com/brian-lau/MatlabQuery/blob/develop/LICENSE.txt)

Please feel free to [fork](https://github.com/brian-lau/MatlabQuery/fork) and contribute!