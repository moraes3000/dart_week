import 'package:dart_week/app/models/order.dart';
import 'package:dart_week/app/models/order_pix.dart';

abstract class OrderRepository {
  Future<OrderPix> createOrder(Order order);
}
