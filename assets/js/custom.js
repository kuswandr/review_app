$(function (argument) {
    $('.str-rating').click(function(){
        var val = $(this).attr('rate');
        $('input[name="rating"]').val(val);
        $('.str-rating').removeClass('checked');
        $('.str-rating').each(function(){
            var val2 = $(this).attr('rate');
            if (Number(val2) <= Number(val)) {
                $(this).addClass('checked');
            }
        });
    });
    $('.str-rating2').click(function(){
        var val = $(this).attr('rate');
        $('#formUpdate').find('input[name="rating"]').val(val);
        $('.str-rating2').removeClass('checked');
        $('.str-rating2').each(function(){
            var val2 = $(this).attr('rate');
            if (Number(val2) <= Number(val)) {
                $(this).addClass('checked');
            }
        });
    });

    $('.submittt').click(function(){
           var val = $('input[name="rating"]').val();
           if (val == "") {
                alert('rating harus diisi dulu bro..');
           }else{
                $('#formrate').submit();
           }
    });

    $('.delrow').click(function () {
        var result = confirm("Want to delete?");
        var id = $(this).attr('id');
        if (result) {
            window.location.href = baseurl+"review/delete/"+id
        }
    });

    $('.btnedit').click(function () { 
        var id = $(this).attr('id');
        var rate = $(this).parent().find('input[name="rate_u"]').val();
        var review = $(this).parent().find('input[name="review_u"]').val();
        $('#formUpdate').find('.str-rating2').removeClass('checked');
        $('#formUpdate').find('.str-rating2').each(function(){
            var val2 = $(this).attr('rate');
            if (Number(val2) <= Number(rate)) {
                $(this).addClass('checked');
            }
        });

        $('#formUpdate').find('input[name="id"]').val(id);
        $('#formUpdate').find('input[name="rating"]').val(rate);
        $('#formUpdate').find('textarea[name="review"]').val(review);
    })
});
