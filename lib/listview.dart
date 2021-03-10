import 'package:flutter/material.dart';

class Product {
  final String name;
  const Product({this.name});
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  ShoppingListItem({this.product, this.inCart, this.onCartChanged}) : super(key : ObjectKey(product));

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context),),
    );
  }
}

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  const ShoppingList({Key key, this.products}) : super(key : key);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {_shoppingCart.add(product);}
      else { _shoppingCart.remove(product);}
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      itemCount: widget.products.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Text('hahahahaha');
        } else {
          Product product = widget.products[index - 1];
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }
      },
    );
  }
}

class ShoppingListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShoppingList(
      products: <Product>[
        Product(name: 'candy1'),
        Product(name: 'candy2'),
        Product(name: 'candy3'),
        Product(name: 'candy4'),
        Product(name: 'candy5'),
        Product(name: 'candy6'),
        Product(name: 'candy7'),
        Product(name: 'candy8'),
        Product(name: 'candy9'),
        Product(name: 'candy10'),
        Product(name: 'candy11'),
        Product(name: 'candy12'),
        Product(name: 'candy13'),
        Product(name: 'candy14'),
      ],
    );
  }
}
