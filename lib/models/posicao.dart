class Posicao {
  Posicao(this._x, this._y);

  setPosition(double x, double y) {
    _x = x;
    _y = y - 80;
  }

  double get x {
    return _x;
  }

  double get y {
    return _y;
  }

  double _x;
  double _y;
}
