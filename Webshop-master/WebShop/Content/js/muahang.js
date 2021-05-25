
$('ul li img').click(function(){
	let src = $(this).attr('src');
	$('.image img').attr('src',src);
});
$('.btn1').click(function(event) {
	let i = $('.num-qua').val();
	let j = i + 1;
	$('.num-qua').text(j);
});
// $('.d_btn').slick({
//     autoplay:true,
//     arrows: true,
//     prevArrow:"<button type='button' class='slick-prev pull-left'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
//     nextArrow:"<button type='button' class='slick-next pull-right'><i class='fa fa-angle-right' aria-hidden='true'></i></button>"
// });


