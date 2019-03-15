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

    $('.submittt').click(function(e){
        var val = $('input[name="rating"]').val(val);
        if (val ="") {
            e.preventDefault();
            alert('heyy');
        }
    })
});

function readFile() {
  
  if (this.files && this.files[0]) {
    
    var FR= new FileReader();
    
    FR.addEventListener("load", function(e) {
      document.getElementById("image").value       = e.target.result;
    }); 
    
    FR.readAsDataURL( this.files[0] );
  }
  
}

document.getElementById("imagess").addEventListener("change", readFile);