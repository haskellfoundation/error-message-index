---
title: Illegal forall in type
summary: The 'forall' keyword was used in a type without the 'ExplicitForAll' extension enabled
severity: error
introduced: 9.6.1
---

## Error Message
```
Illegal symbol ‘forall’ in type
    Suggested fix:
      Use the ‘ExplicitForAll’ extension (implied by ‘RankNTypes’,
                                                     ‘QuantifiedConstraints’, ‘ScopedTypeVariables’,
                                                     ‘LiberalTypeSynonyms’ and ‘ExistentialQuantification’)
      to enable syntax: forall <tvs>. <type>
  |
3 | foo :: forall a. a
  |        ^^^^^^
```
