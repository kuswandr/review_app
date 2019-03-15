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
        $('.submittt').removeAttr('disabled');
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
            $.ajax({
                url: 'http://travling.id:8080/api/v1/reviews/'+id,
                type: 'DELETE',
                success: function(result) {
                window.location.href = baseurl;
                    // Do something with the result
                }
            })
        }
    });

    $('.btnedit').click(function () { 
        var rate = $(this).parent().find('input[name="rate_u"]').val();
        var review = $(this).parent().find('input[name="review_u"]').val();
        $('#formUpdate').find('.str-rating').removeClass('checked');
        $('#formUpdate').find('.str-rating').each(function(){
            var val2 = $(this).attr('rate');
            if (Number(val2) <= Number(rate)) {
                $(this).addClass('checked');
            }
        });

        $('#formUpdate').find('input[name="rating"]').val(rate);
        $('#formUpdate').find('textarea[name="review"]').val(review);
    })
});

function readFile() {
  
  if (this.files && this.files[0]) {
    
    var FR= new FileReader();
    
    FR.addEventListener("load", function(e) {
      document.getElementById("image").value= e.target.result;
    }); 
    
    FR.readAsDataURL( this.files[0] );
  }
  
}

document.getElementById("imagess").addEventListener("change", readFile);