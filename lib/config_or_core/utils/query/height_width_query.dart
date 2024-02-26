
import 'package:flutter/cupertino.dart';

double heightQuery (BuildContext context, double size)
{
  return MediaQuery.of(context).size.height * size;
}
double widthQuery (BuildContext context, double size)
{
  return MediaQuery.of(context).size.width * size;
}