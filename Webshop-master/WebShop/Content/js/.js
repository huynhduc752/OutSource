function showHideMenuMobile(){
    $(document).on('click', '.btn-menu-moblie', function(){
        if( $(this).attr('data-display') == 0 ){
            $('nav').addClass('show');  
            $(this).addClass('active');
            $(this).attr('data-display', 1);   
        }else{
            $('nav').removeClass('show');  
            $(this).removeClass('active');
            $(this).attr('data-display', 0);               
        }
    })
}

showHideMenuMobile();  