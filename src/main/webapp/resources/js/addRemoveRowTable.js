/**
 * Created by Asus on 3/21/2017.
 */

(function ($) {

    $.fn.addRow = function () {

        $('#addRow').click(function () {


            var newRow =  "<tr> <td  data-title='نام درس ' > <input type='text' name='courseName' maxlength='50' placeholder='نام درس را وارد کنید...' > </td>" +
                "<td  data-title='کد درس '> <input type='number' name='courseId' placeholder='کد درس را وارد کنید...' > </td>" +
                "<td   data-title='نوع درس  '> <select name='typeOfCourse' title='نوع درس'> " +
                "<option value='basic'> پایه </option>" +
                "<option value='Specialized'> تخصصی </option>" +
                "<option value='Public' > عمومی  </option>" +
                " </select> </td>" +
                "<td data-title='تعداد واحد درس' > <input type='number' name='unitOfCourse' max='4' min='0' placeholder='تعداد واحد درس را وارد کنید...'> </td> " +
                "<td>  <input  class='selectForEdit' type='checkbox' title='choos For edit'  > </td>"+
                "<td class='removRowTable' onclick='$(this).closest(\"tr \" ).remove();'> <span class='removeRow'><b>&#10006;</b></span>  </td>" +
                " </tr>";
            $("#listOfCourses").append(newRow);






        });


    };



    $.fn.removeRow = function () {



            $('.removRowTable').click(function () {

                $(this).closest('tr').remove();

            });






    };



})(jQuery);