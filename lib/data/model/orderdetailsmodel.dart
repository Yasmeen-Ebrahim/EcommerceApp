class OrderDetailsModel {
  int? itemcount;
  int? itemprice;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? cartOrders;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsPrice;
  int? itemsCount;
  int? itemsActive;
  int? itemsDiscount;
  String? itemsDatatime;
  int? itemsCategory;
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

  OrderDetailsModel(
      {this.itemcount,
        this.itemprice,
        this.cartId,
        this.cartUsersid,
        this.cartItemsid,
        this.cartOrders,
        this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsPrice,
        this.itemsCount,
        this.itemsActive,
        this.itemsDiscount,
        this.itemsDatatime,
        this.itemsCategory,
        this.ordersId,
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

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    itemcount = json['itemcount'];
    itemprice = json['itemprice'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsPrice = json['items_price'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsDiscount = json['items_discount'];
    itemsDatatime = json['items_datatime'];
    itemsCategory = json['items_category'];
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
    data['itemcount'] = this.itemcount;
    data['itemprice'] = this.itemprice;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_orders'] = this.cartOrders;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_price'] = this.itemsPrice;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_discount'] = this.itemsDiscount;
    data['items_datatime'] = this.itemsDatatime;
    data['items_category'] = this.itemsCategory;
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