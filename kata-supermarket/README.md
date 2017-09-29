# Kata - The supermarket

Welcome to Luke's Supermarket. Where we stock 5 goods, any of which can be offered on a 3for2 deal.

The goods prices have been isolated inside `./lib/prices.rb` - The prices are stored in cents which is essentially pence in England

The rules are maintained in `./lib/rules.rb` - Note as an MVP I've only created one - The 3for2 rule. More can be added

##Logic

Instantiate a Till object, which needs to be instantiated with an Array of strings.

No validation takes place, so you can only instantiate it with string versions of the products sold in the `Prices` Module.

Run `#sell_basket` on your instance, and see your lovely quoted till receipt appear (NB: `puts` this value for a prettier output).

## Examples
**Small Basket**
```ruby
2.4.2 :001 > t=Till.new(['peas'])
 => #<Till:0x00000000021c73a0 @items=["peas"], @receipt=""> 
2.4.2 :002 > puts t.sell_basket
Receipt:
1 * peas
Total: 140cents
```
**Medium Basket**
```ruby
2.4.2 :001 > t=Till.new(['peas','beans','peas', 'peas', 'peas','beans', 'beans'])
 => #<Till:0x00000000021c73a0 @items=["peas", "beans", "peas", "peas", "peas", "beans", "beans"], @receipt=""> 
2.4.2 :002 > puts t.sell_basket
Receipt:
4 * peas
3 * beans - (1 Free)
Total: 758cents
```
**Large Basket**
```ruby
2.4.2 :007 > t=Till.new(%w{peas peas peas peas peas beans beans beans beans orange\ juice orange\ juice wafers christmas\ card christmas\ card christmas\ card})
 => #<Till:0x0000000000eccea8 @items=["peas", "peas", "peas", "peas", "peas", "beans", "beans", "beans", "beans", "orange juice", "orange juice", "wafers", "christmas card", "christmas card", "christmas card"], @receipt=""> 
2.4.2 :008 > puts t.sell_basket
Receipt:
5 * peas
4 * beans - (1 Free)
2 * orange juice
1 * wafers
3 * christmas card - (1 Free)
Total: 1992cents

```

## Initial setup

The usual spiel!