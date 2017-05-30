/**
 * Created by Asus on 3/22/2017.
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


      $.fn.scrollTop =  function () {



          window.addEventListener('scroll',function () {

              if(window.scrollY <= 100){
                  $('#topArrow').fadeOut();
              }else{
                  $('#topArrow').fadeIn();
              }

          });

          $('#topArrow').click(function(){

              smoothScrollTo(0);

          });

    }


    })(jQuery);