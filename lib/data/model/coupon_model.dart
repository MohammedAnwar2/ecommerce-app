class CouponModel {
	int? couponId;
	String? couponName;
	String? couponExpiredate;
	int? couponDiscount;
	int? couponCount;

	CouponModel({
		this.couponId, 
		this.couponName, 
		this.couponExpiredate, 
		this.couponDiscount, 
		this.couponCount, 
	});

	factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
				couponId: json['coupon_id'] as int?,
				couponName: json['coupon_name'] as String?,
				couponExpiredate: json['coupon_expiredate'] as String?,
				couponDiscount: json['coupon_discount'] as int?,
				couponCount: json['coupon_count'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'coupon_id': couponId,
				'coupon_name': couponName,
				'coupon_expiredate': couponExpiredate,
				'coupon_discount': couponDiscount,
				'coupon_count': couponCount,
			};
}
