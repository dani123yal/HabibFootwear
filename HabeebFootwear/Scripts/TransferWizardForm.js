

$(document).ready(function () {

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
                checkQty();

                if (window.success == false) {
                    $(".result_form").css("color", "red");
                    $('#finishBtn').prop('disabled', true);
                } else {
                    $(".result_form").css("color", "green");
                    $('#finishBtn').prop('disabled', false);
                }
            }
        }
        nextTab($active);
        

    });
    $(".prev-step").click(function (e) {

        var $active = $('.wizard .nav-tabs li.active');
        prevTab($active);

    });

});

var shoesArr = []

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
        divElement.innerHTML = "<td style='padding-top:13px;'>" + (i + 1) + "</td><td >" +
            "<select class='form-control articles' style='text-transform:uppercase;' onkeyup='this.value = this.value.toUpperCase();' required >" + document.getElementById("shoes").innerHTML + "</select>" +
            "</td> " +
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
    window.i = 0;
    for (var i = 0; i < articleArr.length; i++) {
        window.cxz = sizeArr;
        window.k = k;
        window.articleArr = articleArr;
            
        $.ajax({
            url: "/Transfer/SizeData/" + articleArr[i],
            type: "get",
            async: false,
            success: function (data) {
                window.content = data;
                for (var j = 0; j < window.cxz[window.i]; j++) {
                    var divElement = document.createElement("tr");
                    divElement.innerHTML += "<td style='padding-top:13px;'>" + (window.k + 1) + "</td><td >" +
                        "<input type = 'text' value='" + window.articleArr[window.i] + "' class='form-control articleVal' readonly /></td>" +
                        "<td><select class='form-control SizeValArr' required>" + window.content + "  </select> </td>" +
                        "<td> <input type='number' min='1' class='form-control colorNo' placeholder='Enter Color No.' required/></td>";

                    document.getElementsByClassName("size_form")[0].append(divElement);
                    window.k++;

                }
                window.i++;
            }
            
        });

        
        
    }
}
function step_3() {
    var articleElem = document.getElementsByClassName("articleVal");
    var sizeElem = document.getElementsByClassName("SizeValArr");
    var colorElem = document.getElementsByClassName("colorNo");
    var articleArr = ConvertToArray(articleElem);
    var sizeArr = ConvertToArray(sizeElem);
    var colorArr = ConvertToArray(colorElem);

    window.articleArr = articleArr;
    window.sizeArr = sizeArr;
    window.colorArr = colorArr
    window.k = 0;
    window.i = 0;
    $('.color_form').empty();
    for (var i = 0; i < articleArr.length; i++) {

        $.ajax({
            url: '/Transfer/ColorData?article=' + articleArr[i] + '&size=' + sizeArr[i],
            type: "get",
            async: false,
            success: function (data) {
                window.content = data;
                // alert(window.content);
                for (var j = 0; j < window.colorArr[window.i]; j++) {
                    var divElement = document.createElement("tr");
                    divElement.innerHTML += "<td style='padding-top:13px;'>" + (window.k + 1) + "</td><td >" +
                        "<input type = 'text' name='shoes[" + window.k + "].shoeArticle' value='" + window.articleArr[window.i] + "' class='form-control shoesToCheck' readonly /></td>" +
                        "<td><input type='number'  name='sizes[" + window.k + "].sizeNo' value='" + window.sizeArr[window.i] + "' class='form-control sizesToCheck' readonly /></td>" +
                        "<td> <select name='colors[" + window.k + "].colorName' class='form-control colorsToCheck' required>" + window.content + "</select></td>" +
                        "<td> <input type='number' name='qty[" + window.k + "]' class='form-control qtyToCheck' min='1' placeholder='Enter Quantity' required/></td>";
                    document.getElementsByClassName("color_form")[0].append(divElement);
                    window.k++;
                }

                window.i++;
            }

        });

    }
}

function checkQty() {
    var articleElem = document.getElementsByClassName("shoesToCheck");
    var sizeElem = document.getElementsByClassName("sizesToCheck");
    var colorElem = document.getElementsByClassName("colorsToCheck");
    var qtyElem = document.getElementsByClassName("qtyToCheck");
    var articleArr = ConvertToArray(articleElem);
    var sizeArr = ConvertToArray(sizeElem);
    var colorArr = ConvertToArray(colorElem);
    var qtyArr = ConvertToArray(qtyElem);



    
    var divElement = document.createElement("label");   
    
    $('.result_form').empty();
    window.articleArr = articleArr;
    window.sizeArr = sizeArr;
    window.colorArr = colorArr
    window.qtyArr = qtyArr
    window.i = 0;
    window.result = "";
    window.success = true;
    //$('.color_form').empty();
    for (var i = 0; i < articleArr.length; i++) {

        $.ajax({
            url: '/Transfer/checkQty?shoeArticle=' + articleArr[i] + '&size=' + sizeArr[i] + '&color=' + colorArr[i]+'&qty='+qtyArr[i],
        type: "get",
        async: false,
        success: function (data) {
            window.result = data.resultString;
            window.error = data.error;

            if (data.error == true) {
                divElement.innerHTML += "<br/>" + window.result;
                window.success = false;
            }
            }
        });
        window.i;
    }

    if (window.success == true) {
        divElement.innerHTML += "Successfully checked the shoes details.. Finish the transfer below.."
    }

    document.getElementsByClassName("result_form")[0].innerHTML = divElement.innerHTML;
}

function ConvertToArray(elem) {
    var arr = [];
    for (var i = 0; i < elem.length; i++) {
        arr.push(elem[i].value);
    }

    return arr;
}

