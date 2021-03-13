import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Product {
  final String name;

  const Product({this.name});
}

typedef void CartChangedCallback(Product product, bool inCart);
typedef void BackgroundChangeCallback(Product product, bool isLongPressed);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;
  final bool isLongPressed;
  final BackgroundChangeCallback onLongPressed;
  BuildContext ctx;

  ShoppingListItem({this.product, this.inCart, this.onCartChanged, this.isLongPressed, this.onLongPressed})
      : super(key: ObjectKey(product));

  Color _getCircleAvatarColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  Color _getBackgroundColor() {
    return isLongPressed ? Colors.lightGreenAccent : Colors.white;
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
    ctx = context;
    return Ink(
      // color: _getBackgroundColor(),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        onTap: () {
          onCartChanged(product, inCart);
        },
        onLongPress: () {
          print('hahaha ${product.name} / longPressed : $isLongPressed');
          onLongPressed(product, isLongPressed);
        },
        leading: CircleAvatar(
          backgroundColor: _getCircleAvatarColor(context),
          child: Text(product.name[0]),
        ),
        title: Container(
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  product.name,
                  style: _getTextStyle(context),
                ),
              ),
              Container(

                padding: EdgeInsets.only(left: 10, bottom: 0),
                child: SvgPicture.asset(
                  'images/recycle-bin.svg',
                  width: 40,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showMessage(String msg) {
    final snackbar = SnackBar(content: Text(msg));

    Scaffold.of(ctx)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  const ShoppingList({Key key, this.products}) : super(key: key);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();
  Set<Product> _longPressedList = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  void _backgroundColorChange(Product product, bool isLongPressed) {
    setState(() {
      print(' long pressed!!  : $isLongPressed');
      if (!isLongPressed) {
        _longPressedList.add(product);
      } else {
        _longPressedList.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // padding: EdgeInsets.symmetric(vertical: 8.0),
      itemCount: widget.products.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Center(
            child: Container(
              child: Text('1st line container'),
              height: 40,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: Colors.green,
            ),
          );
        } else {
          Product product = widget.products[index - 1];
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
            isLongPressed: _longPressedList.contains(product),
            onLongPressed: _backgroundColorChange,
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
