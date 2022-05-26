java -Xss1g -Xms256m -Xmx4g -jar ./tribble.jar generate --suffix=.tpl --mode=50-50-probabilistic-20 --out-dir=tpls --grammar-file=smarty7.bnf
mv tpls/* smarty/vendor/smarty/smarty/templates/