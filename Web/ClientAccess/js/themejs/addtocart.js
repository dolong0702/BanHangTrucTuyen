/* -------------------------------------------------------------------------------- /
	
	Magentech jQuery
	Created by Magentech
	v1.0 - 20.9.2016
	All rights reserved.
	
/ -------------------------------------------------------------------------------- */

var addto = {
	'add': function (product_id, url) {
		//addProductNotice('Product added to Wishlist', '<img src="image/demo/shop/product/e11.jpg" alt="">', '<h3>You must <a href="#">login</a>  to save <a href="#">Apple Cinema 30"</a> to your <a href="#">wish list</a>!</h3>', 'success');
			$.ajax({
				url: "/Cart/Add",
				type: "POST",
				data: {
					Masp: product_id,
					returnUrl: url,
					soluong : 1
				},
				dataType: "json",
				success: function () {
					alert("thêm sản phẩm thành công");
				}
			});
			// End
		
		
    }
}


// xóa sản phẩm khỏi giỏ hàng
var remove = {
	'removeProduct': function (product_id, url) {
		$.ajax({
			url: "/Cart/Remove",
			type: "POST",
			data: {	
				id: product_id,
				returnUrl: url,
			},
			dataType: "json",
			success: function () {
				alert("thêm sản phẩm thành công");
			}
		});
		alert("xóa sản phẩm thành công");
		window.location.reload();
    }
}
	// Cart add remove functions

	var wishlist = {
		'add': function(product_id) {
			addProductNotice('Product added to Wishlist', '<img src="image/demo/shop/product/e11.jpg" alt="">', '<h3>You must <a href="#">login</a>  to save <a href="#">Apple Cinema 30"</a> to your <a href="#">wish list</a>!</h3>', 'success');
		}
	}
	var compare = {
		'add': function(product_id) {
			addProductNotice('Product added to compare', '<img src="image/demo/shop/product/e11.jpg" alt="">', '<h3>Success: You have added <a href="#">Apple Cinema 30"</a> to your <a href="#">product comparison</a>!</h3>', 'success');
		}
	}

	/* ---------------------------------------------------
		jGrowl – jQuery alerts and message box
	-------------------------------------------------- */
	function addProductNotice(title, thumb, text, type) {
		$.jGrowl.defaults.closer = false;
		//Stop jGrowl
		//$.jGrowl.defaults.sticky = true;
		var tpl = thumb + '<h3>'+text+'</h3>';
		$.jGrowl(tpl, {		
			life: 4000,
			header: title,
			speed: 'slow',
			theme: type
		});
	}
