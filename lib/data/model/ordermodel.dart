class OrderModel {
  int? ordersId;
  int? ordersUserid;
  String? ordersPaymentmethod;
  String? ordersDeliverytype;
  int? ordersAddress;
  int? ordersCoupon;
  int? ordersCoupondiscount;
  int? ordersPrice;
  int? ordersPricedelivery;
  int? ordersTotalorderprice;
  int? ordersStatus;
  String? ordersDatetime;
  int? addressId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  int? addressUsersid;

  OrderModel(
      {this.ordersId,
        this.ordersUserid,
        this.ordersPaymentmethod,
        this.ordersDeliverytype,
        this.ordersAddress,
        this.ordersCoupon,
        this.ordersCoupondiscount,
        this.ordersPrice,
        this.ordersPricedelivery,
        this.ordersTotalorderprice,
        this.ordersStatus,
        this.ordersDatetime,
        this.addressId,
        this.addressName,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.addressLong,
        this.addressUsersid});

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersDeliverytype = json['orders_deliverytype'];
    ordersAddress = json['orders_address'];
    ordersCoupon = json['orders_coupon'];
    ordersCoupondiscount = json['orders_coupondiscount'];
    ordersPrice = json['orders_price'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersTotalorderprice = json['orders_totalorderprice'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressUsersid = json['address_usersid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_deliverytype'] = this.ordersDeliverytype;
    data['orders_address'] = this.ordersAddress;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_coupondiscount'] = this.ordersCoupondiscount;
    data['orders_price'] = this.ordersPrice;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_totalorderprice'] = this.ordersTotalorderprice;
    data['orders_status'] = this.ordersStatus;
    data['orders_datetime'] = this.ordersDatetime;
    data['address_id'] = this.addressId;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_usersid'] = this.addressUsersid;
    return data;
  }
}