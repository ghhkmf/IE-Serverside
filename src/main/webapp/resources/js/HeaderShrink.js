/**
 * Created by Asus on 3/18/2017.
 */
(function ($) {


    function smoothScrollTo (yPos) {
        var step = 20;
        if (yPos < scrollY) {
            step *= -1;
        }
        if (Math.abs(yPos - scrollY) <= step) { // stop Condition
            return;
        }
        window.scrollBy(0, step);
        setTimeout(function () {
            smoothScrollTo(yPos)
        }, 1);
    }





    $.fn.shrinkNav = function () {

        $(document).on('scroll' ,function() {

            if( $(window).width() > 760 ){


                if ($(this).scrollTop() > 50) { //Adjust 150
                    $('header').addClass('shrinked');
                } else {
                    $('header').removeClass('shrinked');
                }

            }


            if(window.scrollY <= 100){
                $('#topArrow').fadeOut();
            }else{
                $('#topArrow').fadeIn();
            }


        });

        $('#topArrow').click(function(){

            smoothScrollTo(0);

        });


    };


    $.fn.slideMenuBar = function () {


        $('#itemOfMenuBar').click(function(event){


            event.preventDefault();
            $('.navigationBar ul').slideToggle("slow","linear");
        });

        var $window = $(window);
        $window.on('resize', function ()
        {
            if ($window.width() > 760)
            {
                $('.navigationBar ul').show();
            }
            if ($window.width() <= 760)
            {
                $('header').show();
            }
        });

    };




})(jQuery);