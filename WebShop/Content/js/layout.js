$('.number-add').click(function () {
    debugger;
    let res = $(this).siblings('.value-pro').attr('data-value');
    res++;
    $(this).siblings('.value-pro').attr('data-value', res);
    $(this).siblings('.value-pro').text(res );

})
$('.number-sub').click(function () {
    let res = $(this).siblings('.value-pro').attr('data-value');
    if (res >0) {
        res--;
        $(this).siblings('.value-pro').attr('data-value', res);
        $(this).siblings('.value-pro').text(res);
    }


})
$('.title-in').click(function () {
    let show = $(this).siblings().attr('data-show');
    if (show == 0) {
        $(this).siblings().attr('data-show', '1');
        $(this).siblings().removeClass('d-none');
    } else {
        $(this).siblings().attr('data-show', '0');
        $(this).siblings().addClass('d-none');
    }
})
    $('.menu-mobile').click(function () {
        debugger;
        let dis = $(this).attr('data-display');
        if (dis == 0) {
            $('#menu-mb').addClass('menu-active')
            $(this).attr('data-display', '1')
            $(this).addClass('act');

        } else {
            $('#menu-mb').removeClass('menu-active')
            $(this).attr('data-display', '0')
            $(this).removeClass('act');

        }
    })