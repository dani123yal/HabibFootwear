

$(document).ready(function () {

    $('.pay-now').hide(0);
    $('.pay-partial').hide(0);

    
    //Initialize tooltips
    $('.nav-tabs > li a[title]').tooltip();
    
    //Wizard
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

        var $target = $(e.target);
    
        if ($target.parent().hasClass('disabled')) {
            return false;
        }
    });

    $(".next-step").click(function (e) {
        var $active = $('.wizard .nav-tabs li.active');
        $active.next().removeClass('disabled');

        var title = $active.next().children('a');

        if (title.is('a')) {
            if (title.attr('aria-controls') == "step2") {
                step_2();
            }
            else if (title.attr('aria-controls') == "step3") {
                step_3();
            }
            else if (title.attr('aria-controls') == "complete") {
                $('#finishBtn').prop('disabled', false);
            }
        }
        nextTab($active);

    });
    $(".prev-step").click(function (e) {

        var $active = $('.wizard .nav-tabs li.active');
        prevTab($active);

    });
});

$(document).ready(function () {
    $('input[name="mode"]').on('ifChecked',function(event) {
        var check = $("input[name='mode']:checked").val();
        if (check=="1") {
            $('.pay-now').show(250);
            $('.pay-partial').hide(250);
        }
        else if(check=="2") {
            $('.pay-partial').show(250);
            $('.pay-now').hide(250);
        }
    });
});

function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}

function checkShoesNo() {
    var no = document.getElementById("shoesNo").value;
    $('.shoe_form').empty();
    for (var i = 0; i < no; i++) {
        var divElement = document.createElement("tr");
        divElement.innerHTML = "<td style='padding-top:13px;'>"+(i+1)+"</td><td >" +
            "<input list='shoes' name = 'shoesToAdd[" + i + "]'  class='form-control articles' style='text-transform:uppercase;' onkeyup='this.value = this.value.toUpperCase();' required />" +
            "</td > " +
            "<td><input type='number' min='1' name='shoesCost[" + i + "]' class='form-control' placeholder='Enter Cost here' required /></td>" +
            "<td><select class='form-control gen' name='varieties[" + i + "]' class='form-control col-md-10'><option value = 'Gents' >Gents</option><option value='Ladies'>Ladies</option><option value='Kids'>Kids</option></select></td>" +
            "<td><input type='number' min='1' class='form-control sizeNoArr' placeholder='Enter no. of sizes here' required /></td>";
        document.getElementsByClassName("shoe_form")[0].append(divElement);
    }

}

function step_2() {
    var articleElem = document.getElementsByClassName("articles");
    var sizeElem = document.getElementsByClassName("sizeNoArr");
    var articleArr = ConvertToArray(articleElem);
    var sizeArr = ConvertToArray(sizeElem);
    var k = 0;
    $('.size_form').empty();
    for (var i = 0; i < articleArr.length; i++) {
        for (var j = 0; j < sizeArr[i]; j++) {
            var divElement = document.createElement("tr");
            divElement.innerHTML += "<td style='padding-top:13px;'>" + (k+1) +"</td><td >" +
                "<input type = 'text' value='" + articleArr[i] + "' class='form-control articleVal' readonly /></td>" +
                "<td><input list='sizes' type='number' min='1' name='sizesToAdd[" + k + "]' class='form-control SizeValArr' placeholder='Enter size# "+(j+1)+"' required/></td>"+
                "<td> <input type='number' min='1' class='form-control colorNo' placeholder='Enter Color No.' required/></td>";
            document.getElementsByClassName("size_form")[0].append(divElement);
            k++;
        }
    }
}
function step_3() {
    var articleElem = document.getElementsByClassName("articleVal");
    var sizeElem = document.getElementsByClassName("SizeValArr");
    var colorElem = document.getElementsByClassName("colorNo");
    var articleArr = ConvertToArray(articleElem);
    var sizeArr = ConvertToArray(sizeElem);
    var colorArr = ConvertToArray(colorElem);
    var k = 0;
    $('.color_form').empty();
    for (var i = 0; i < articleArr.length; i++) {
            for (var j = 0; j < colorArr[i]; j++) {
                var divElement = document.createElement("tr");
                divElement.innerHTML += "<td style='padding-top:13px;'>" + (k+1) +"</td><td >" +
                    "<input type = 'text' name='shoes[" + k + "].shoeArticle' value='" + articleArr[i] + "' class='form-control' readonly /></td>" +
                    "<td><input type='number'  name='sizes[" + k + "].sizeNo' value='" + sizeArr[i] + "' class='form-control' readonly /></td>" +
                    "<td> <input list='colors' type='text' name='colors[" + k + "].colorName' class='form-control' placeholder='Enter Color# " + (j + 1) +"' style='text-transform:uppercase;' onkeyup='this.value = this.value.toUpperCase();' required/></td>"+
                    "<td> <input type='number' name='qty["+k+"]' class='form-control' min='1' placeholder='Enter Quantity' required/></td>";
                document.getElementsByClassName("color_form")[0].append(divElement);
                k++;
            }
    }
}

function ConvertToArray(elem) {
    var arr = [];
    for (var i = 0; i < elem.length; i++) {
        arr.push(elem[i].value);
    }

    return arr;
}

function checkPaymentNo() {
    var no = document.getElementById("paymentNo").value;
    $('.payment_form').empty();
    for (var i = 0; i < no; i++) {
        var divElement = document.createElement("tr");
        divElement.innerHTML += "<td style='padding-top:13px;'>" + (i + 1) + "</td><td >" +
            "<input type = 'text' name = 'shoes[" + i + "].shoeArticle' class='form-control articles' placeholder = 'Enter article no. here' /></td>" +
            "<td><input type='number' class='form-control' placeholder='Enter Cost here' /></td>" +
            "<td><input type='number' class='form-control sizeNoArr' placeholder='Enter no. of sizes here' /></td>";
        document.getElementsByClassName("shoe_form")[0].append(divElement);
    }
}