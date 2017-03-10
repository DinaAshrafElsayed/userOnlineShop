<script src="themes/js/jquery.js" type="text/javascript"></script>
<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
<script src="themes/js/google-code-prettify/prettify.js"></script>

<script src="themes/js/bootshop.js"></script>
<script src="JS/login.js"></script>
<script src="JS/customeScript.js"></script>
<script src="themes/js/jquery.lightbox-0.5.js"></script>
<script>
    var request = null;

    function checkCardNumberExistance() {
        if (window.XMLHttpRequest)
            request = new XMLHttpRequest();
        else if (window.ActiveXObject)
            request = new ActiveXObject(Microsoft.XMLHTTP);
        request.onreadystatechange = handlecheckCardNumberExistanceReq;

        request.open("GET", "CheckCardNumberExistanceServlet?cardNumber=" + document.getElementById("cardNumber").value, true);
        request.send(null);

    }
    function handlecheckCardNumberExistanceReq() {
        if (request.readyState === 4 && request.status === 200) {
            document.getElementById("CardNumberResult").innerHTML = request.responseText;
        }
        if (request.responseText == "Valid Card Number") {
            document.getElementById("rechargeButton").disabled = false;
        } else
            document.getElementById("rechargeButton").disabled = true;
    }
    function updateTextInput(val)
    {
        document.getElementById('rangeVal').innerHTML = val;
    }
</script>
