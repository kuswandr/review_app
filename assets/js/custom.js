$(document).ready(function(){
    var processMachining = $('.processMachining[data-row="1"]').html();
    // MATERIAL PRICE
    $(document).on('change','.slcMaterial', function(){
        var idMaterial = $(this).val();
        // alert(idMaterial);

        $.ajax({
            type: "GET",
            url: baseurl +'Admin/data/C_hpp/getDetailMaterial/',
            dataType: "JSON",
            data: {
                idMat : idMaterial
            }
        }).done(function (data) {
            console.log(data);

            $('.matDensity').val(formatMoney(data[0]['Bj']));
            $('.matPrice').val(formatMoney(data[0]['hKg']));
        })
    })

    $(document).on('input','.matWeight', function(){
        var weight = $(this).val();
        var price = Number(purify($('.matPrice').val()));
        var qty = $('.quantity').val();

        var totalPrice = weight * price;

        totalPrices = totalPrice.toFixed(2)
        // alert(weight)
        $('.matTotalPrice').val(formatMoney(totalPrices));
    });

    $(document).on('input','.quantity', function(){
    
        var qty = $(this).val();
        var total = $('.matTotalPrice').val();
        var hasil = total * qty;
        var hasils = hasil.toFixed(2)

        $('.matTotalPrice').val(hasils)
    })

    // TREATMENT & FINISHING

    $(document).on('change','.slcTreatment', function(){
        var idTreat = $(this).val();

        $.ajax({
            type: "GET",
            url: baseurl +'Admin/data/C_hpp/getDetailTreatment/',
            dataType: "JSON",
            data: {
                idThd : idTreat
            }
        }).done(function (data) {
            console.log(data);

            $('.treatment').val(data[0]['thread']);
            $('.treatmentCost').val(data[0]['cost']);

            var costTreatment = Number(purify($('.treatmentCost').val()));
            var costFinishing = Number(purify($('.finishingCost').val()));

            // alert(costFinishing);

            var totalCostTF = costTreatment + costFinishing;

            // alert(totalCostTF);

            $('.totalCostTF').val(totalCostTF);
        })

    })

    $(document).on('change','.slcFinishing', function(){
        var idFinish = $(this).val();
       

        $.ajax({
            type: "GET",
            url: baseurl +'Admin/data/C_hpp/getDetailFinishing/',
            dataType: "JSON",
            data: {
                idFns : idFinish
            }
        }).done(function (data) {
            console.log(data);

            $('.finishing').val(data[0]['finish']);
            $('.finishingCost').val(data[0]['cost']);

            var costTreatment = Number(purify($('.treatmentCost').val()));
            var costFinishing = Number(purify($('.finishingCost').val()));

            // alert(costFinishing);

            var totalCostTF = costTreatment + costFinishing;

            // alert(totalCostTF);

            $('.totalCostTF').val(formatMoney(totalCostTF));
        })
    });

    $('.slcMaterial').select2({
        placeholder : 'Pilih Material'
    })

    $('.slcTreatment').select2({
        placeholder : 'Pilih Treatment'
    })

    $('.slcFinishing').select2({
        placeholder : 'Pilih finishing'
    })

    $('.dateInputHpp').datepicker({
        autoclose: true,
        todayHighlight: true,
        format: 'dd-M-yyyy'
    });

    function formatMoney(n, c, d, t) {
      var c = isNaN(c = Math.abs(c)) ? 2 : c,
        d = d == undefined ? "." : d,
        t = t == undefined ? "," : t,
        s = n < 0 ? "-" : "",
        i = String(parseInt(n = Math.abs(Number(n) || 0).toFixed(c))),
        j = (j = i.length) > 3 ? j % 3 : 0;

      return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
    };


   

    $(document).on('input', '.diaBesar, .diaKecil, .lengthKanan, .lengthKiri, .width, .thick', function(){
        var diaBesar = Number($('.diaBesar').val());
        var diaKecil = Number($('.diaKecil').val());
        var lengthKanan = Number($('.lengthKanan').val());
        var lengthKiri = Number($('.lengthKiri').val());
        var width = Number($('.width').val());
        var thick = Number($('.thick').val());
        var matDensity = Number($('.matDensity').val());
    
        var l = lengthKanan*width*thick*matDensity/1000000;

        var l13 = diaBesar/2;
        var m13 = diaKecil/2;

        var diaBesarTotal = l13*l13;
        var n13 = 3.14*diaBesarTotal*lengthKiri;

        var diaKecilTotal = m13*m13;
        var n14 = 3.14*diaKecilTotal*lengthKiri;
        var p = n13-n14;

        var o = p*matDensity/1000000;

        var matWeight = l+o;
        
        $('.matWeight').val(matWeight);

        var matPrice = Number(purify($('.matPrice').val()));

        var totalPrice = matPrice*matWeight;
        
        var totalPrices = totalPrice.toFixed(2)

        $('.matTotalPrice').val(formatMoney(totalPrices));
    })

    $(document).on('click', '#addRow', function(e) {
        e.preventDefault();
        var count = Number($('tbody#inputForm tr:last').attr('data-row'));

        $(this).attr('data-row', (count + 1));
         var html = '<tr data-row="' + (count + 1) + '">';
         html+='<td>' + (count + 1) + '</td>';
         html+='<td class="prcs" data-row="' + (count + 1) + '">' + '<select class="form-control select2 processMachining" data-row="' + (count + 1) + '" name="">' + processMachining + '</select>' + '</td>';
         html+='<td><input type="text" class="form-control time" data-row="' + (count + 1) + '"></td>';
         html+='<td><input type="number" min="1" class="form-control valMachiningProcess" data-row="' + (count + 1) + '" value="1"></td>';
         html+='<td><input type="text" class="form-control costPerMenit" data-row="' + (count + 1) + '" readonly></td>';
         html+='<td><input type="text" class="form-control priceMachiningProcess" data-row="' + (count + 1) + '" readonly></td>';

         html += '</tr>';

        $('tbody#inputForm').append(html);

        $('.processMachining').select2({
            placeholder: 'Pilih Proses'
        })
    
    });

    function purify(val){
        var newval = val.split(',').join('');
        return Number(newval);
    }

    $(document).on('input', '.time, .costPerMenit, .valMachiningProcess', function () {
        var row_id = $(this).attr('data-row');

        var time = Number($('.time[data-row="' + row_id + '"]').val());
        var costPerMenit = Number(purify($('.costPerMenit[data-row="' + row_id + '"]').val()));
        var valMachining = Number($('.valMachiningProcess[data-row="' + row_id + '"]').val());
        var priceMachiningProcess = (time * valMachining) * costPerMenit;

        $('.priceMachiningProcess[data-row="' + row_id + '"]').val(formatMoney(priceMachiningProcess));
        var total = 0;

        $('.priceMachiningProcess').each(function () {
            total+= Number(purify($(this).val()));
        })

        $('.priceTotalMachiningProcess').val(formatMoney(total));
    });

    $(document).on('input', '.desainTime, .programTime, .setting, .tools, .others, .costDesainTime, .costProgramTime, .costSetting, .costTools, .costOthers', function(){
        var desainTime = Number($('.desainTime').val());
        var programTime = Number($('.programTime').val());
        var setting = Number($('.setting').val());
        var tools = Number($('.tools').val());
        var others = Number($('.others').val());
        var costDesainTime = Number(purify($('.costDesainTime').val()));
        var costProgramTime = Number(purify($('.costProgramTime').val()));
        var costSetting= Number(purify($('.costSetting').val()));
        var costTools = Number(purify($('.costTools').val()));
        var costOthers = Number(purify($('.costOthers').val()));

        var totalCostDesain = desainTime * costDesainTime;
        var totalCostProgram = programTime * costProgramTime;
        var totalCostSetting = setting * costSetting;
        var totalCostTools = tools * costTools;
        var totalCostOthers = others * costOthers;

        $('.totalCostDesain').val(formatMoney(totalCostDesain));
        $('.totalCostProgram').val(formatMoney(totalCostProgram));
        $('.totalCostSetting').val(formatMoney(totalCostSetting));
        $('.totalCostTools').val(formatMoney(totalCostTools));
        // alert(totalCostOthers);
        $('.totalCostOthers').val(formatMoney(totalCostOthers));

        var totalCostPreparation = totalCostDesain + totalCostProgram + totalCostSetting + totalCostTools + totalCostOthers;
        var  totalCostPreparations = totalCostPreparation.toFixed(2)
        $('.totalCostPreparation').val(formatMoney(totalCostPreparations));
    })

    $(document).on('input', '.urgent, .ekspedition, .labour', function(){
        var urgent = Number(purify($('.urgent').val()));
        var ekspedition = Number(purify($('.ekspedition').val()));
        var labour = Number(purify($('.labour').val()));

        totalSpecialChargeCost = urgent + ekspedition + labour;

        var totalSpecialChargeCosts = totalSpecialChargeCost.toFixed(2)

        $('.SpecialChargeCost').val(formatMoney(totalSpecialChargeCosts));

    })

    $('.processMachining').select2({
        placeholder: 'Pilih Proses'
    })

    $(document).on('change', '.processMachining', function(){
        var kode = $(this).val();
        var row_id = $(this).attr('data-row');

        $.ajax({
            type: "GET",
            url: baseurl +'Admin/data/C_hpp/searchMachiningProcess/',
            dataType: "JSON",
            data: {
                idMps: kode
            },
        }).done(function (data) {
            console.log(data);
          $('.costPerMenit[data-row="'+row_id+'"]').val(formatMoney(data[0]['harga']));
        })
    })

    $(document).on('change', '.thick, .costOthers, .time, .labour', function(){
        var totalMatProcess = Number(purify($('.matTotalPrice').val()));
        var totalCostPreparation = Number(purify($('.totalCostPreparation').val()));
        var priceTotalMachiningProcess = Number(purify($('.priceTotalMachiningProcess').val()));
        var totalCostTF = Number(purify($('.totalCostTF').val()));
        var SpecialChargeCost = Number(purify($('.SpecialChargeCost').val()));

        var total = totalMatProcess + totalCostPreparation + priceTotalMachiningProcess + totalCostTF + SpecialChargeCost;

        var totals = total.toFixed(2)
        $('.total').val(formatMoney(totals));
    })

    $(document).on('input', '.discQuotation', function(){
        var percent = Number($(this).val());
        var total = Number(purify($('.total').val()));

        var quot = 1-(percent/100);
        var res = total/quot;

        $('.quotation').val(formatMoney(res));
    })

    $(document).on('input', '.disc', function () {
        var discount = Number($(this).val());
        var quot = Number(purify($('.quotation').val()));

        total = (quot*discount)/100;
        valpricedisc = quot-total;

        $('.discount').val(formatMoney(total));
        $('.priceAfterDiscount').val(formatMoney(valpricedisc));
    })

    $(document).on('input', '.coms', function () {
        var coms = Number($(this).val());
        var priceAfterDisc =  Number(purify($('.priceAfterDiscount').val()));
        var total = Number(purify($('.total').val()));

        var comsakhir = (priceAfterDisc*coms)/100;

        $('.comission').val(formatMoney(comsakhir));

        var akhir = priceAfterDisc - (comsakhir + total);

        var akhirs = akhir.toFixed(2)
        $('.profitPrediction').val(formatMoney(akhirs));
    })



$('.uang').on('change, focusout', function(){
    var val = $(this).val();
    var newval = formatMoney(val);
    if (val != '') {
        $(this).val(newval);
    }else{
        $(this).val('');
    }
});

$('.uang').focus(function(){
    var value = $(this).val();
    if (value != '') {
        valnew = Number(purify(value));
        $(this).val(valnew);
    }
});

// $('.uang').focusout(function(){
//     alert('sdsd');
// });

});
