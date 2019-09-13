

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
        var title = $active.next().children('a');
        var isError = false;
        var emptyError = false;        

        if (title.attr('aria-controls') == "step2") {
            //alert("clicked for second one");
            emptyError = checkEmptyFields(1);
            isError = checkValidation(1);
            if (isError) {
                $('#error1').html("two rows cannot be same at a time..check the RED values");
                document.documentElement.scrollTop = 0;
                return;
            }
            else if (emptyError) {
                $('#error1').html("All fields are required");
                document.documentElement.scrollTop = 0;
                return;
            }
            else {
                $('#error1').html("");
            }
        }
        else if (title.attr('aria-controls') == "step3") {
            //alert("clicked for third one");
            emptyError = checkEmptyFields(2);
            isError = checkValidation(2);
            if (isError) {
                $('#error2').html("two rows cannot be same at a time..check the RED values");
                document.documentElement.scrollTop = 0;
                return;
            }
            else if (emptyError) {
                $('#error2').html("All fields are required");
                document.documentElement.scrollTop = 0;
                return;
            }
            else {
                $('#error2').html("");
            }
        }
        else if (title.attr('aria-controls') == "complete") {
            //alert("clicked for last one");
            emptyError = checkEmptyFields(3);
            isError = checkValidation(3);
            if (isError) {
                $('#error3').html("two rows cannot be same at a time..check the RED values");
                document.documentElement.scrollTop = 0;
                return;
            }
            else if (emptyError) {
                $('#error3').html("All fields are required");
                document.documentElement.scrollTop = 0;
                return;
            }
            else {
                $('#error3').html("");
            }
        }

        

        $active.next().removeClass('disabled');

        

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
            "<td><input type='number' min='1' name='shoesCost[" + i + "]' class='form-control shoeCostArr' placeholder='Enter Cost here' required /></td>" +
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
                    "<input type = 'text' name='shoes[" + k + "].shoeArticle' value='" + articleArr[i] + "' class='form-control lastShoes' readonly /></td>" +
                    "<td><input type='number'  name='sizes[" + k + "].sizeNo' value='" + sizeArr[i] + "' class='form-control lastSize' readonly /></td>" +
                    "<td> <input list='colors' type='text' name='colors[" + k + "].colorName' class='form-control lastColor' placeholder='Enter Color# " + (j + 1) +"' style='text-transform:uppercase;' onkeyup='this.value = this.value.toUpperCase();' required/></td>"+
                    "<td> <input type='number' name='qty["+k+"]' class='form-control lastQty' min='1' placeholder='Enter Quantity' required/></td>";
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
            "<td><input type='date' class='form-control' name='remainings[" + i + "].dueDate' /></td>" +
            "<td><input type='number' name='remainings[" + i + "].remainingAmount' class='form-control' placeholder='Enter Amount to pay' min='1' /></td>";
        document.getElementsByClassName("payment_form")[0].append(divElement);
    }
}


function checkValidation(form) {
    switch (form) {
        case 1:
            var articleArr = ConvertToArray(document.getElementsByClassName("articles"));

            if (articleArr) {
                for (var i = 0; i < articleArr.length; i++) {
                    for (var j = (i+1); j < articleArr.length; j++) {
                        if (articleArr[i] == articleArr[j]) {
                            document.getElementsByClassName("articles")[i].style.border = "1px solid red";
                            document.getElementsByClassName("articles")[i].style.boxShadow = "0 0 4px 0 red";
                            document.getElementsByClassName("articles")[j].style.border = "1px solid red";
                            document.getElementsByClassName("articles")[j].style.boxShadow = "0 0 4px 0 red";
                            return true;
                        }
                        else {
                            document.getElementsByClassName("articles")[i].style.border = "";
                            document.getElementsByClassName("articles")[i].style.boxShadow = "";
                            document.getElementsByClassName("articles")[j].style.border = "";
                            document.getElementsByClassName("articles")[j].style.boxShadow = "";
                        }
                    }
                }
                return false;
            }
            break;
        case 2:
            var articleArr = ConvertToArray(document.getElementsByClassName("articleVal"));
            var sizeArr = ConvertToArray(document.getElementsByClassName("SizeValArr"));

            if (articleArr && sizeArr) {
                for (var i = 0; i < articleArr.length; i++) {
                    for (var j = (i+1); j < articleArr.length; j++) {
                        if (articleArr[i] == articleArr[j] && sizeArr[i] == sizeArr[j]) {
                            document.getElementsByClassName("articleVal")[i].style.border = "1px solid red";
                            document.getElementsByClassName("articleVal")[i].style.boxShadow = "0 0 4px 0 red";
                            document.getElementsByClassName("articleVal")[j].style.border = "1px solid red";
                            document.getElementsByClassName("articleVal")[j].style.boxShadow = "0 0 4px 0 red";
                            document.getElementsByClassName("SizeValArr")[i].style.border = "1px solid red";
                            document.getElementsByClassName("SizeValArr")[i].style.boxShadow = "0 0 4px 0 red";
                            document.getElementsByClassName("SizeValArr")[j].style.border = "1px solid red";
                            document.getElementsByClassName("SizeValArr")[j].style.boxShadow = "0 0 4px 0 red";
                            return true;
                        }
                        else {
                            document.getElementsByClassName("articleVal")[i].style.border = "";
                            document.getElementsByClassName("articleVal")[i].style.boxShadow = "";
                            document.getElementsByClassName("articleVal")[j].style.border = "";
                            document.getElementsByClassName("articleVal")[j].style.boxShadow = "";
                            document.getElementsByClassName("SizeValArr")[i].style.border = "";
                            document.getElementsByClassName("SizeValArr")[i].style.boxShadow = "";
                            document.getElementsByClassName("SizeValArr")[j].style.border = "";
                            document.getElementsByClassName("SizeValArr")[j].style.boxShadow = "";
                        }
                    }
                }
                return false;
            }
            break;
        case 3:
            var articleArr = ConvertToArray(document.getElementsByClassName("lastShoes"));
            var sizeArr = ConvertToArray(document.getElementsByClassName("lastSize"));
            var colorArr = ConvertToArray(document.getElementsByClassName("lastColor"));

            if (articleArr && sizeArr && sizeArr) {
                for (var i = 0; i < articleArr.length; i++) {
                    for (var j = (i + 1); j < articleArr.length; j++) {
                        if (articleArr[i] == articleArr[j] && sizeArr[i] == sizeArr[j] && colorArr[i] == colorArr[j]) {
                            document.getElementsByClassName("lastShoes")[i].style.border = "1px solid red";
                            document.getElementsByClassName("lastShoes")[i].style.boxShadow = "0 0 4px 0 red";
                            document.getElementsByClassName("lastSize")[i].style.border = "1px solid red";
                            document.getElementsByClassName("lastSize")[i].style.boxShadow = "0 0 4px 0 red";
                            document.getElementsByClassName("lastColor")[i].style.border = "1px solid red";
                            document.getElementsByClassName("lastColor")[i].style.boxShadow = "0 0 4px 0 red";

                            document.getElementsByClassName("lastShoes")[j].style.border = "1px solid red";
                            document.getElementsByClassName("lastShoes")[j].style.boxShadow = "0 0 4px 0 red";
                            document.getElementsByClassName("lastSize")[j].style.border = "1px solid red";
                            document.getElementsByClassName("lastSize")[j].style.boxShadow = "0 0 4px 0 red";
                            document.getElementsByClassName("lastColor")[j].style.border = "1px solid red";
                            document.getElementsByClassName("lastColor")[j].style.boxShadow = "0 0 4px 0 red";
                            return true;
                        }
                        else {
                            document.getElementsByClassName("lastShoes")[i].style.border = "";
                            document.getElementsByClassName("lastShoes")[i].style.boxShadow = "";
                            document.getElementsByClassName("lastSize")[i].style.border = "";
                            document.getElementsByClassName("lastSize")[i].style.boxShadow = "";
                            document.getElementsByClassName("lastColor")[i].style.border = "";
                            document.getElementsByClassName("lastColor")[i].style.boxShadow = "";

                            document.getElementsByClassName("lastShoes")[j].style.border = "";
                            document.getElementsByClassName("lastShoes")[j].style.boxShadow = "";
                            document.getElementsByClassName("lastSize")[j].style.border = "";
                            document.getElementsByClassName("lastSize")[j].style.boxShadow = "";
                            document.getElementsByClassName("lastColor")[j].style.border = "";
                            document.getElementsByClassName("lastColor")[j].style.boxShadow = "";
                        }
                    }
                }
                return false;
            }
            
            break;
    }
    return true;
}


function checkEmptyFields(form) {
    switch (form) {
        case 1:
            var articleArr = ConvertToArray(document.getElementsByClassName("articles"));
            var shoeCostArr = ConvertToArray(document.getElementsByClassName("shoeCostArr"));
            var sizeArr = ConvertToArray(document.getElementsByClassName("sizeNoArr"));

            if (articleArr && shoeCostArr && sizeArr) {
                for (var i = 0; i < articleArr.length; i++) {
                        if (articleArr[i] == "") {
                            document.getElementsByClassName("articles")[i].style.border = "1px solid red";
                            document.getElementsByClassName("articles")[i].style.boxShadow = "0 0 4px 0 red";
                            return true;
                        }
                        else {
                            document.getElementsByClassName("articles")[i].style.border = "";
                            document.getElementsByClassName("articles")[i].style.boxShadow = "";

                        }
                        if (shoeCostArr[i] == "") {
                            document.getElementsByClassName("shoeCostArr")[i].style.border = "1px solid red";
                            document.getElementsByClassName("shoeCostArr")[i].style.boxShadow = "0 0 4px 0 red";
                            return true;
                        }
                        else {

                            document.getElementsByClassName("shoeCostArr")[i].style.border = "";
                            document.getElementsByClassName("shoeCostArr")[i].style.boxShadow = "";

                    }

                        if (sizeArr[i] == "") {
                            document.getElementsByClassName("sizeNoArr")[i].style.border = "1px solid red";
                            document.getElementsByClassName("sizeNoArr")[i].style.boxShadow = "0 0 4px 0 red";
                            return true;
                        }
                        else {
                            document.getElementsByClassName("sizeNoArr")[i].style.border = "";
                            document.getElementsByClassName("sizeNoArr")[i].style.boxShadow = "";
                        }
                    }
                return false;
            }
            break;
        case 2:
            var sizeArr = ConvertToArray(document.getElementsByClassName("SizeValArr"));
            var colorArr = ConvertToArray(document.getElementsByClassName("colorNo"));

            if (sizeArr && colorArr) {
                for (var i = 0; i < sizeArr.length; i++) {
                    
                    if (sizeArr[i] == "") {
                        document.getElementsByClassName("SizeValArr")[i].style.border = "1px solid red";
                        document.getElementsByClassName("SizeValArr")[i].style.boxShadow = "0 0 4px 0 red";
                        return true;
                    }
                    else {
                        document.getElementsByClassName("SizeValArr")[i].style.border = "";
                        document.getElementsByClassName("SizeValArr")[i].style.boxShadow = "";
                    }

                    if (colorArr[i] == "") {
                        document.getElementsByClassName("colorNo")[i].style.border = "1px solid red";
                        document.getElementsByClassName("colorNo")[i].style.boxShadow = "0 0 4px 0 red";
                        return true;
                    }
                    else {
                        document.getElementsByClassName("colorNo")[i].style.border = "";
                        document.getElementsByClassName("colorNo")[i].style.boxShadow = "";
                    }
                    
                }
                return false;
            }
            break;
        case 3:
            var colorArr = ConvertToArray(document.getElementsByClassName("lastColor"));
            var qtyArr = ConvertToArray(document.getElementsByClassName("lastQty"));

            if (qtyArr && colorArr) {
                for (var i = 0; i < colorArr.length; i++) {

                    if (colorArr[i] == "") {
                        document.getElementsByClassName("lastColor")[i].style.border = "1px solid red";
                        document.getElementsByClassName("lastColor")[i].style.boxShadow = "0 0 4px 0 red";
                        return true;
                    }
                    else {
                        document.getElementsByClassName("lastColor")[i].style.border = "";
                        document.getElementsByClassName("lastColor")[i].style.boxShadow = "";
                    }

                    if (qtyArr[i] == "") {
                        document.getElementsByClassName("lastQty")[i].style.border = "1px solid red";
                        document.getElementsByClassName("lastQty")[i].style.boxShadow = "0 0 4px 0 red";
                        return true;
                    }
                    else {
                        document.getElementsByClassName("lastQty")[i].style.border = "";
                        document.getElementsByClassName("lastQty")[i].style.boxShadow = "";
                    }

                }
                return false;
            }
            break;
    }
    return true;
}